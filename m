Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6CBE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 14:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8DG1m2MO4VbtmjqRQgAFewTSJOIUlZggw031ix+qRLg=; b=qIdfFvVKTuQvsWBixXTAWu0NeH
	47t49dUlKfoCEU9WMk7pdnEfU/pTMtgi7sqIZ8u8LnfCWAlEH+IFHXK9Zn3juiFBNb8A5VqOtmzKx
	bwJ0au3RQB3HfBAYhjeBglPfkE7Ke661n1ynRO4nU6Is82K6IWC63hD3zW8rprqYF/yfjI5T5lLlb
	jMHOYmmFtw0ZqLexYN2az5WGbR9AdjRAMcz0FUbUxUcKB5Snkr5Yt7rfnwUI/BgJTEMpv8b1/WY10
	G4WiqXf8jFlLwWCuJ5eojtmdAdnQP1Hbk+ACCOB/9cEEoJKBgrcfHvmMkG0IE92fmcEhgMX5/ZSEi
	/haeQqGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUneP-00000001U63-2TOn;
	Mon, 06 Jan 2025 14:00:13 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnbB-00000001TTn-2yge
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 13:56:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736171814; x=1767707814;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=j5yMpN4jtRU0ARlnwODyqOYe3Fo7KApfyuihjMBXRfI=;
  b=k7t/m7RMySmSU4JvPK/IuVz3FwBKj0G+iRMRfi4qmfhuRsUYJD0DB1z0
   pPS9iL1xmum59wDNV/vjnRk1T0gtMYyvHCGwYYwcxYLe5YBEb/Hv/ytZY
   6qEUCVddbvZy9NF0K48wOeaioQ0F63mn+dSQSA5iJwMy0fafBALqVdQSY
   cOMV/zkHMHfJFD1ow1m59nnb00YBQPrfiEv5tJH5EJH5Zn4625gJSq/eY
   hjypGAQPl65JOTtmwMuKQzNyzwEU2tsZqdFFPdmE0F99Zr+GTuJApZlUY
   XGCW5NDRgrCtS2SwseLRBBnBfqqjZTuskZRcup1WQlqwC4QceuaIJTMKC
   g==;
X-CSE-ConnectionGUID: yUg6JYGbQT2RSmcOssEc8g==
X-CSE-MsgGUID: +SOvOsOiQzCkP0CNf/qzhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36214356"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="36214356"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 05:56:53 -0800
X-CSE-ConnectionGUID: Pwm2JC3KQPCA4v3oc7WvIQ==
X-CSE-MsgGUID: Hg6VOARaR0Sq8Cl4XWiMEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="125728687"
Received: from unknown (HELO P12ILL20yoongsia.png.intel.com) ([10.88.227.38])
  by fmviesa002.fm.intel.com with ESMTP; 06 Jan 2025 05:56:42 -0800
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
	Amritha Nambiar <amritha.nambiar@intel.com>,
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
Subject: [PATCH bpf-next v4 2/4] selftests/bpf: Add Launch Time request to xdp_hw_metadata
Date: Mon,  6 Jan 2025 21:56:38 +0800
Message-Id: <20250106135638.9719-1-yoong.siang.song@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_055653_764085_CDC7E0B9 
X-CRM114-Status: GOOD (  15.31  )
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

Add Launch Time hw offload request to xdp_hw_metadata. User can configure
the delta of launch time to HW RX-time by using "-l" argument. The default
delta is 100,000,000 nanosecond.

Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
---
 tools/testing/selftests/bpf/xdp_hw_metadata.c | 30 +++++++++++++++++--
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/xdp_hw_metadata.c b/tools/testing/selftests/bpf/xdp_hw_metadata.c
index 6f7b15d6c6ed..795c1d14e02d 100644
--- a/tools/testing/selftests/bpf/xdp_hw_metadata.c
+++ b/tools/testing/selftests/bpf/xdp_hw_metadata.c
@@ -13,6 +13,7 @@
  * - UDP 9091 packets trigger TX reply
  * - TX HW timestamp is requested and reported back upon completion
  * - TX checksum is requested
+ * - TX launch time HW offload is requested for transmission
  */
 
 #include <test_progs.h>
@@ -64,6 +65,8 @@ int rxq;
 bool skip_tx;
 __u64 last_hw_rx_timestamp;
 __u64 last_xdp_rx_timestamp;
+__u64 last_launch_time;
+__u64 launch_time_delta_to_hw_rx_timestamp = 100000000; /* 0.1 second */
 
 void test__fail(void) { /* for network_helpers.c */ }
 
@@ -298,6 +301,8 @@ static bool complete_tx(struct xsk *xsk, clockid_t clock_id)
 	if (meta->completion.tx_timestamp) {
 		__u64 ref_tstamp = gettime(clock_id);
 
+		print_tstamp_delta("HW Launch-time", "HW TX-complete-time",
+				   last_launch_time, meta->completion.tx_timestamp);
 		print_tstamp_delta("HW TX-complete-time", "User TX-complete-time",
 				   meta->completion.tx_timestamp, ref_tstamp);
 		print_tstamp_delta("XDP RX-time", "User TX-complete-time",
@@ -395,6 +400,14 @@ static void ping_pong(struct xsk *xsk, void *rx_packet, clockid_t clock_id)
 	       xsk, ntohs(udph->check), ntohs(want_csum),
 	       meta->request.csum_start, meta->request.csum_offset);
 
+	/* Set the value of launch time */
+	meta->flags |= XDP_TXMD_FLAGS_LAUNCH_TIME;
+	meta->request.launch_time = last_hw_rx_timestamp +
+				    launch_time_delta_to_hw_rx_timestamp;
+	last_launch_time = meta->request.launch_time;
+	print_tstamp_delta("HW RX-time", "HW Launch-time", last_hw_rx_timestamp,
+			   meta->request.launch_time);
+
 	memcpy(data, rx_packet, len); /* don't share umem chunk for simplicity */
 	tx_desc->options |= XDP_TX_METADATA;
 	tx_desc->len = len;
@@ -402,10 +415,14 @@ static void ping_pong(struct xsk *xsk, void *rx_packet, clockid_t clock_id)
 	xsk_ring_prod__submit(&xsk->tx, 1);
 }
 
+#define SLEEP_PER_ITERATION_IN_US 10
+#define SLEEP_PER_ITERATION_IN_NS (SLEEP_PER_ITERATION_IN_US * 1000)
+#define MAX_ITERATION(x) (((x) / SLEEP_PER_ITERATION_IN_NS) + 500)
 static int verify_metadata(struct xsk *rx_xsk, int rxq, int server_fd, clockid_t clock_id)
 {
 	const struct xdp_desc *rx_desc;
 	struct pollfd fds[rxq + 1];
+	int max_iterations;
 	__u64 comp_addr;
 	__u64 addr;
 	__u32 idx = 0;
@@ -418,6 +435,9 @@ static int verify_metadata(struct xsk *rx_xsk, int rxq, int server_fd, clockid_t
 		fds[i].revents = 0;
 	}
 
+	/* Calculate max iterations to wait for transmit completion */
+	max_iterations = MAX_ITERATION(launch_time_delta_to_hw_rx_timestamp);
+
 	fds[rxq].fd = server_fd;
 	fds[rxq].events = POLLIN;
 	fds[rxq].revents = 0;
@@ -477,10 +497,10 @@ static int verify_metadata(struct xsk *rx_xsk, int rxq, int server_fd, clockid_t
 					if (ret)
 						printf("kick_tx ret=%d\n", ret);
 
-					for (int j = 0; j < 500; j++) {
+					for (int j = 0; j < max_iterations; j++) {
 						if (complete_tx(xsk, clock_id))
 							break;
-						usleep(10);
+						usleep(SLEEP_PER_ITERATION_IN_US);
 					}
 				}
 			}
@@ -608,6 +628,7 @@ static void print_usage(void)
 		"  -h    Display this help and exit\n\n"
 		"  -m    Enable multi-buffer XDP for larger MTU\n"
 		"  -r    Don't generate AF_XDP reply (rx metadata only)\n"
+		"  -l    Delta of launch time to HW RX-time in ns (default: 100,000,000ns)\n"
 		"Generate test packets on the other machine with:\n"
 		"  echo -n xdp | nc -u -q1 <dst_ip> 9091\n";
 
@@ -618,7 +639,7 @@ static void read_args(int argc, char *argv[])
 {
 	int opt;
 
-	while ((opt = getopt(argc, argv, "chmr")) != -1) {
+	while ((opt = getopt(argc, argv, "chmrl:")) != -1) {
 		switch (opt) {
 		case 'c':
 			bind_flags &= ~XDP_USE_NEED_WAKEUP;
@@ -634,6 +655,9 @@ static void read_args(int argc, char *argv[])
 		case 'r':
 			skip_tx = true;
 			break;
+		case 'l':
+			launch_time_delta_to_hw_rx_timestamp = atoll(optarg);
+			break;
 		case '?':
 			if (isprint(optopt))
 				fprintf(stderr, "Unknown option: -%c\n", optopt);
-- 
2.34.1


