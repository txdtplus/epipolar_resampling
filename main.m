clear; clc; close all;
addpath('read_and_write')
addpath('data')
addpath('Utils')

%% read rpc
[DRPC1,Normalize_par1] = readrpc('RPC_IKONOS_pan1.txt','txt');
[IRPC1,~] = readrpc('IRPC_IKONOS_pan1.txt','txt');
[DRPC2,Normalize_par2] = readrpc('RPC_IKONOS_pan2.txt','txt');
[IRPC2,~] = readrpc('IRPC_IKONOS_pan2.txt','txt');

drpc1 = RPC(DRPC1,Normalize_par1);
irpc1 = RPC(IRPC1,Normalize_par1);
drpc2 = RPC(DRPC2,Normalize_par2);
irpc2 = RPC(IRPC2,Normalize_par2);

%%
p1_geoloc = [103.800114,1.288181,32];
P1 = POINT(p1_geoloc,drpc1);
img1_loc = drpc1.obj2img(P1);
P1.update_rc(img1_loc,drpc1);

p1_loc = lla2ecef([p1_geoloc(:,2),p1_geoloc(:,1),p1_geoloc(:,3)]);

