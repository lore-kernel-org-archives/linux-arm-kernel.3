Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463A2C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 15:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/kgJ1dQjzPqKW6QdDPyeJF1GdcxyLfT/1grqvjzNjRo=; b=Rt4QxQgSoMUcDXMXXm8py814lM
	8fmHTPPbNiFvSGI304Nloi7yTqDtEFn94hS2oUbqYENDOCIoxBViIZ+ostps1Jy9NIQFYrzIqe97U
	mOsD5sVxpfU0or9a0UK0c7GF0s8pdV6VjAWeJUOEWtxwz94JditpH4GQBNoOrzlCB6s7TBwUTw3Ni
	De6L+6PzaFf+FN6gkdWHC1oAYmidfkLZ9cbtMkuL148Q3GyEg1iCNacF/GuArLjwPC/RZlcd4D1O1
	GGdsNbMq/vGPRWrOKGbYQHiMSAsS7Z3nw3w3WSWgkq/C9RGLpucboFFUCqkBfl5yUTPmiTffexzRa
	v+s8lVSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXitJ-00000008raF-0zj6;
	Tue, 14 Jan 2025 15:31:41 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXiqA-00000008qxe-0Kvp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 15:28:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736868506; x=1768404506;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4qjiIVCuQNphIxZyqbvX8o2uFjrHiOaj4tUNwhqzcfc=;
  b=WFErRaJlReIbefQegadhvhR8pEasIil02wiPRRwtZOOi/1rIZUi52kIm
   CkYqGqINTPwYjGD88co90sHI2H7qwgZX0S5fwRHEKYP6vyfmYxDH08Mt+
   oStnttlkN0TWUeXJRs1MevduRwTivxRmZsJ8e0VeGcOB2XF5vbIlipBZt
   pm3oKGbzB+lv7AllTpfOfOcORoAE+3c0PBNUxDBDhgc91LglmdI0wecsG
   7KO1jxrc6y+LQvqdPisaSZqBJkAuuYgtJeuy53qfGm52RmyL9IRtjnGom
   QKZJkXPndLTmOvF3MlTIRn2Uru5NMTHxZLq8PLTfQ45j+l2a2LgerqrbG
   A==;
X-CSE-ConnectionGUID: /rtMMylaR2ip/7ceLbOTww==
X-CSE-MsgGUID: ip5Hu8DlT/2CYd2r4ZEL/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="37325370"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="37325370"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 07:28:25 -0800
X-CSE-ConnectionGUID: 0ogk/HLSTx6vz/9UXysxQg==
X-CSE-MsgGUID: lZFYo8xYQFehUdEjmr3+dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="142117606"
Received: from p12ill20yoongsia.png.intel.com ([10.88.227.38])
  by orviesa001.jf.intel.com with ESMTP; 14 Jan 2025 07:28:14 -0800
From: Song Yoong Siang <yoong.siang.song@intel.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Bjorn Topel <bjorn@kernel.org>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Jonathan Lemon <jonathan.lemon@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Joe Damato <jdamato@fastly.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Mina Almasry <almasrymina@google.com>,
	Daniel Jurgens <danielj@nvidia.com>,
	Song Yoong Siang <yoong.siang.song@intel.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Mykola Lysenko <mykolal@fb.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	KP Singh <kpsingh@kernel.org>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	intel-wired-lan@lists.osuosl.org,
	xdp-hints@xdp-project.net
Subject: [PATCH bpf-next v5 2/4] selftests/bpf: Add launch time request to xdp_hw_metadata
Date: Tue, 14 Jan 2025 23:27:16 +0800
Message-Id: <20250114152718.120588-3-yoong.siang.song@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250114152718.120588-1-yoong.siang.song@intel.com>
References: <20250114152718.120588-1-yoong.siang.song@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_072826_131927_A9F5011E 
X-CRM114-Status: GOOD (  22.14  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add launch time hardware offload request to xdp_hw_metadata. Users can
configure the delta of launch time relative to HW RX-time using the "-l"
argument. By default, the delta is set to 0 ns, which means the launch time
is disabled. By setting the delta to a non-zero value, the launch time
hardware offload feature will be enabled and requested. Additionally, users
can configure the Tx Queue to be enabled with the launch time hardware
offload using the "-L" argument. By default, Tx Queue 0 will be used.

Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
---
 tools/testing/selftests/bpf/xdp_hw_metadata.c | 121 +++++++++++++++++-
 1 file changed, 119 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/xdp_hw_metadata.c b/tools/testing/selftests/bpf/xdp_hw_metadata.c
index 6f7b15d6c6ed..1b2e5c241bd8 100644
--- a/tools/testing/selftests/bpf/xdp_hw_metadata.c
+++ b/tools/testing/selftests/bpf/xdp_hw_metadata.c
@@ -13,6 +13,7 @@
  * - UDP 9091 packets trigger TX reply
  * - TX HW timestamp is requested and reported back upon completion
  * - TX checksum is requested
+ * - TX launch time HW offload is requested for transmission
  */
 
 #include <test_progs.h>
@@ -37,6 +38,15 @@
 #include <time.h>
 #include <unistd.h>
 #include <libgen.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <linux/pkt_sched.h>
+#include <linux/pkt_cls.h>
+#include <linux/ethtool.h>
+#include <sys/socket.h>
+#include <arpa/inet.h>
 
 #include "xdp_metadata.h"
 
@@ -64,6 +74,18 @@ int rxq;
 bool skip_tx;
 __u64 last_hw_rx_timestamp;
 __u64 last_xdp_rx_timestamp;
+__u64 last_launch_time;
+__u64 launch_time_delta_to_hw_rx_timestamp;
+int launch_time_queue;
+
+#define run_command(cmd, ...)					\
+({								\
+	char command[1024];					\
+	memset(command, 0, sizeof(command));			\
+	snprintf(command, sizeof(command), cmd, ##__VA_ARGS__);	\
+	fprintf(stderr, "Running: %s\n", command);		\
+	system(command);					\
+})
 
 void test__fail(void) { /* for network_helpers.c */ }
 
@@ -298,6 +320,12 @@ static bool complete_tx(struct xsk *xsk, clockid_t clock_id)
 	if (meta->completion.tx_timestamp) {
 		__u64 ref_tstamp = gettime(clock_id);
 
+		if (launch_time_delta_to_hw_rx_timestamp) {
+			print_tstamp_delta("HW Launch-time",
+					   "HW TX-complete-time",
+					   last_launch_time,
+					   meta->completion.tx_timestamp);
+		}
 		print_tstamp_delta("HW TX-complete-time", "User TX-complete-time",
 				   meta->completion.tx_timestamp, ref_tstamp);
 		print_tstamp_delta("XDP RX-time", "User TX-complete-time",
@@ -395,6 +423,17 @@ static void ping_pong(struct xsk *xsk, void *rx_packet, clockid_t clock_id)
 	       xsk, ntohs(udph->check), ntohs(want_csum),
 	       meta->request.csum_start, meta->request.csum_offset);
 
+	/* Set the value of launch time */
+	if (launch_time_delta_to_hw_rx_timestamp) {
+		meta->flags |= XDP_TXMD_FLAGS_LAUNCH_TIME;
+		meta->request.launch_time = last_hw_rx_timestamp +
+					    launch_time_delta_to_hw_rx_timestamp;
+		last_launch_time = meta->request.launch_time;
+		print_tstamp_delta("HW RX-time", "HW Launch-time",
+				   last_hw_rx_timestamp,
+				   meta->request.launch_time);
+	}
+
 	memcpy(data, rx_packet, len); /* don't share umem chunk for simplicity */
 	tx_desc->options |= XDP_TX_METADATA;
 	tx_desc->len = len;
@@ -407,6 +446,7 @@ static int verify_metadata(struct xsk *rx_xsk, int rxq, int server_fd, clockid_t
 	const struct xdp_desc *rx_desc;
 	struct pollfd fds[rxq + 1];
 	__u64 comp_addr;
+	__u64 deadline;
 	__u64 addr;
 	__u32 idx = 0;
 	int ret;
@@ -477,9 +517,15 @@ static int verify_metadata(struct xsk *rx_xsk, int rxq, int server_fd, clockid_t
 					if (ret)
 						printf("kick_tx ret=%d\n", ret);
 
-					for (int j = 0; j < 500; j++) {
+					/* wait 1 second + cover launch time */
+					deadline = gettime(clock_id) +
+						   NANOSEC_PER_SEC +
+						   launch_time_delta_to_hw_rx_timestamp;
+					while (true) {
 						if (complete_tx(xsk, clock_id))
 							break;
+						if (gettime(clock_id) >= deadline)
+							break;
 						usleep(10);
 					}
 				}
@@ -608,6 +654,10 @@ static void print_usage(void)
 		"  -h    Display this help and exit\n\n"
 		"  -m    Enable multi-buffer XDP for larger MTU\n"
 		"  -r    Don't generate AF_XDP reply (rx metadata only)\n"
+		"  -l    Delta of launch time relative to HW RX-time in ns\n"
+		"        default: 0 ns (launch time request is disabled)\n"
+		"  -L    Tx Queue to be enabled with launch time offload\n"
+		"        default: 0 (Tx Queue 0)\n"
 		"Generate test packets on the other machine with:\n"
 		"  echo -n xdp | nc -u -q1 <dst_ip> 9091\n";
 
@@ -618,7 +668,7 @@ static void read_args(int argc, char *argv[])
 {
 	int opt;
 
-	while ((opt = getopt(argc, argv, "chmr")) != -1) {
+	while ((opt = getopt(argc, argv, "chmrl:L:")) != -1) {
 		switch (opt) {
 		case 'c':
 			bind_flags &= ~XDP_USE_NEED_WAKEUP;
@@ -634,6 +684,12 @@ static void read_args(int argc, char *argv[])
 		case 'r':
 			skip_tx = true;
 			break;
+		case 'l':
+			launch_time_delta_to_hw_rx_timestamp = atoll(optarg);
+			break;
+		case 'L':
+			launch_time_queue = atoll(optarg);
+			break;
 		case '?':
 			if (isprint(optopt))
 				fprintf(stderr, "Unknown option: -%c\n", optopt);
@@ -657,6 +713,23 @@ static void read_args(int argc, char *argv[])
 		error(-1, errno, "Invalid interface name");
 }
 
+void clean_existing_configurations(void)
+{
+	/* Check and delete root qdisc if exists */
+	if (run_command("sudo tc qdisc show dev %s | grep -q 'qdisc mqprio 8001:'", ifname) == 0)
+		run_command("sudo tc qdisc del dev %s root", ifname);
+
+	/* Check and delete ingress qdisc if exists */
+	if (run_command("sudo tc qdisc show dev %s | grep -q 'qdisc ingress ffff:'", ifname) == 0)
+		run_command("sudo tc qdisc del dev %s ingress", ifname);
+
+	/* Check and delete ethtool filters if any exist */
+	if (run_command("sudo ethtool -n %s | grep -q 'Filter:'", ifname) == 0) {
+		run_command("sudo ethtool -n %s | grep 'Filter:' | awk '{print $2}' | xargs -n1 sudo ethtool -N %s delete >&2",
+			    ifname, ifname);
+	}
+}
+
 int main(int argc, char *argv[])
 {
 	clockid_t clock_id = CLOCK_TAI;
@@ -672,8 +745,50 @@ int main(int argc, char *argv[])
 
 	printf("rxq: %d\n", rxq);
 
+	if (launch_time_queue >= rxq || launch_time_queue < 0)
+		error(1, 0, "Invalid launch_time_queue.\n");
+
+	clean_existing_configurations();
+	sleep(1);
+
+	/* Enable tx and rx hardware timestamping */
 	hwtstamp_enable(ifname);
 
+	/* Add mqprio qdisc with TC and hardware queue one-to-one mapping */
+	char map[256] = {0};
+	char queues[256] = {0};
+
+	for (i = 0; i < rxq; i++) {
+		char buf[8];
+
+		snprintf(buf, sizeof(buf), "%d ", i);
+		strcat(map, buf);
+
+		snprintf(buf, sizeof(buf), "1@%d ", i);
+		strcat(queues, buf);
+	}
+	run_command("sudo tc qdisc add dev %s handle 8001: parent root mqprio num_tc %d map %s queues %s hw 0",
+		    ifname, rxq, map, queues);
+
+	/* To test launch time, send UDP packet with VLAN priority 1 to port 9091 */
+	if (launch_time_delta_to_hw_rx_timestamp) {
+		/* Enable launch time hardware offload on launch_time_queue */
+		run_command("sudo tc qdisc replace dev %s parent 8001:%d etf offload clockid CLOCK_TAI delta 500000",
+			    ifname, launch_time_queue + 1);
+		sleep(1);
+
+		/* Route incoming packet with VLAN priority 1 into launch_time_queue */
+		if (run_command("sudo ethtool -N %s flow-type ether vlan 0x2000 vlan-mask 0x1FFF action %d",
+				ifname, launch_time_queue)) {
+			run_command("sudo tc qdisc add dev %s ingress", ifname);
+			run_command("sudo tc filter add dev %s parent ffff: protocol 802.1Q flower vlan_prio 1 hw_tc %d",
+				    ifname, launch_time_queue);
+		}
+
+		/* Enable VLAN tag stripping offload */
+		run_command("sudo ethtool -K %s rxvlan on", ifname);
+	}
+
 	rx_xsk = malloc(sizeof(struct xsk) * rxq);
 	if (!rx_xsk)
 		error(1, ENOMEM, "malloc");
@@ -733,4 +848,6 @@ int main(int argc, char *argv[])
 	cleanup();
 	if (ret)
 		error(1, -ret, "verify_metadata");
+
+	clean_existing_configurations();
 }
-- 
2.34.1


