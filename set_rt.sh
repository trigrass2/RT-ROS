#!/bin/sh
script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

mkdir $script_dir/clients/roscpp/build
cd $script_dir/clients/roscpp/build/
cmake ..
make
if [ ! -e /opt/ros/indigo/lib/libroscpp.so.backup ]; then
    echo "-------- Create backup file --------"
    echo "sudo cp /opt/ros/indigo/lib/libroscpp.so /opt/ros/indigo/lib/libroscpp.so.backup"
    sudo cp /opt/ros/indigo/lib/libroscpp.so /opt/ros/indigo/lib/libroscpp.so.backup
    echo "------------------------------------"
fi
sudo cp ./devel/lib/libroscpp.so /opt/ros/indigo/lib/libroscpp.so
echo "-------- Set real-time ROS file --------"
echo "sudo cp ./devel/lib/libroscpp.so /opt/ros/indigo/lib/libroscpp.so"
