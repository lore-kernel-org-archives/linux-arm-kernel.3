Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034D1C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 16:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wCpv+py7rKuyeKoZl334k1Y8KvzYXaPU2BD2UI5awSE=; b=eS2KjuSSpeyIVtna8uAP1UegWo
	pAXiH2U2j2gcimPLH/VxJ+L6erwWyTz4WvgkY0jtYFCbU8am8IP/xb8hwNj9JJCDA8dlcIDpF9H+m
	8Wm8RC+1LrdWSRE5GBI7lTVdrkQpOlKlpiMxsjk7xIjJkyQhqjSDmv2D1FbnIKnWBZTSdgmOinw97
	teKm+kOooc/GtPg1B9YgDERcNYDI4FyL4gxJfCcw+JEcr3Lq0A4Gy1AlAhjM6WaDqBLzd8/De0pHp
	RTDcMX49KtDAWISEcDnoY3EjX/5FlGcS9bk9FKc5l6Ems9N9xm+aTBmJsH/Ac2Df5F31Sb06nxbCU
	788tdO7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYSJ8-0000000FR7i-0I1Y;
	Thu, 16 Jan 2025 16:01:22 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYSD4-0000000FOyW-0HDY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 15:55:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737042906; x=1768578906;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=obYy7duPHYvIurVcQ1b2tc4S9JxTXListwajIQv1jJc=;
  b=JOXzhROtAFEM4Ypn7z3HOQ8+DomltiOvuMi66PUAkGy99UMz6k4vLnW8
   nKd6Nd6INOK6vc9NKz/ddghW3QkcdOYO6sluHDBBbMNhmC5VWxuukZjAE
   whe2FSRM7KQMLLUJq2gYLxAvP2ZTxJ4PjSQi1BiBMrjcSIZYnj1cRD/3k
   7RuKjKW3haq+KwSV0tGwAukyBCznHEJwIIVbEU02cabJgfD1drtf0aeYz
   359NeSP0C0iVMiuNUTNlzL+BHImY0mWZ2viR7O62NWYqITC4P0v4A1Dfv
   RrZUcsDDgSZphpwZigWLbcMKeqf+aJFAzT89hLVc0a+CpLmrWLm370Qkp
   w==;
X-CSE-ConnectionGUID: f8kKEQubRYuREcFwY0YebA==
X-CSE-MsgGUID: bgEO460fTGyo9fcn8cehpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="36715729"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="36715729"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 07:54:54 -0800
X-CSE-ConnectionGUID: 2SOb9qA2RguSbXEBKF8uLA==
X-CSE-MsgGUID: 3lQTy/WQTh+nLA/aU0nmuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="106113883"
Received: from p12ill20yoongsia.png.intel.com ([10.88.227.38])
  by fmviesa009.fm.intel.com with ESMTP; 16 Jan 2025 07:54:44 -0800
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
Subject: [PATCH bpf-next v6 4/4] igc: Add launch time support to XDP ZC
Date: Thu, 16 Jan 2025 23:53:50 +0800
Message-Id: <20250116155350.555374-5-yoong.siang.song@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250116155350.555374-1-yoong.siang.song@intel.com>
References: <20250116155350.555374-1-yoong.siang.song@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_075506_128063_884501C4 
X-CRM114-Status: GOOD (  16.64  )
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

Enable Launch Time Control (LTC) support to XDP zero copy via XDP Tx
metadata framework.

This patch is tested with tools/testing/selftests/bpf/xdp_hw_metadata on
Intel I225-LM Ethernet controller. Below are the test steps and result.

Test Steps:
1. At DUT, start xdp_hw_metadata selftest application:
   $ sudo ./xdp_hw_metadata enp2s0 -l 1000000000 -L 1

2. At Link Partner, send an UDP packet with VLAN priority 1 to port 9091 of
   DUT.

When launch time is set to 1s in the future, the delta between launch time
and transmit hardware timestamp is equal to 0.016us, as shown in result
below:
  0x562ff5dc8880: rx_desc[4]->addr=84110 addr=84110 comp_addr=84110 EoP
  rx_hash: 0xE343384 with RSS type:0x1
  HW RX-time:   1734578015467548904 (sec:1734578015.4675) delta to User RX-time sec:0.0002 (183.103 usec)
  XDP RX-time:   1734578015467651698 (sec:1734578015.4677) delta to User RX-time sec:0.0001 (80.309 usec)
  No rx_vlan_tci or rx_vlan_proto, err=-95
  0x562ff5dc8880: ping-pong with csum=561c (want c7dd) csum_start=34 csum_offset=6
  HW RX-time:   1734578015467548904 (sec:1734578015.4675) delta to HW Launch-time sec:1.0000 (1000000.000 usec)
  0x562ff5dc8880: complete tx idx=4 addr=4018
  HW Launch-time:   1734578016467548904 (sec:1734578016.4675) delta to HW TX-complete-time sec:0.0000 (0.016 usec)
  HW TX-complete-time:   1734578016467548920 (sec:1734578016.4675) delta to User TX-complete-time sec:0.0000 (32.546 usec)
  XDP RX-time:   1734578015467651698 (sec:1734578015.4677) delta to User TX-complete-time sec:0.9999 (999929.768 usec)
  HW RX-time:   1734578015467548904 (sec:1734578015.4675) delta to HW TX-complete-time sec:1.0000 (1000000.016 usec)
  0x562ff5dc8880: complete rx idx=132 addr=84110

Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
---
 drivers/net/ethernet/intel/igc/igc_main.c | 78 ++++++++++++++++-------
 1 file changed, 56 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/intel/igc/igc_main.c b/drivers/net/ethernet/intel/igc/igc_main.c
index 27872bdea9bd..6857f5f5b4b2 100644
--- a/drivers/net/ethernet/intel/igc/igc_main.c
+++ b/drivers/net/ethernet/intel/igc/igc_main.c
@@ -1566,6 +1566,26 @@ static bool igc_request_tx_tstamp(struct igc_adapter *adapter, struct sk_buff *s
 	return false;
 }
 
+static void igc_insert_empty_packet(struct igc_ring *tx_ring)
+{
+	struct igc_tx_buffer *empty_info;
+	struct sk_buff *empty;
+	void *data;
+
+	empty_info = &tx_ring->tx_buffer_info[tx_ring->next_to_use];
+	empty = alloc_skb(IGC_EMPTY_FRAME_SIZE, GFP_ATOMIC);
+	if (!empty)
+		return;
+
+	data = skb_put(empty, IGC_EMPTY_FRAME_SIZE);
+	memset(data, 0, IGC_EMPTY_FRAME_SIZE);
+
+	igc_tx_ctxtdesc(tx_ring, 0, false, 0, 0, 0);
+
+	if (igc_init_tx_empty_descriptor(tx_ring, empty, empty_info) < 0)
+		dev_kfree_skb_any(empty);
+}
+
 static netdev_tx_t igc_xmit_frame_ring(struct sk_buff *skb,
 				       struct igc_ring *tx_ring)
 {
@@ -1603,26 +1623,8 @@ static netdev_tx_t igc_xmit_frame_ring(struct sk_buff *skb,
 	skb->tstamp = ktime_set(0, 0);
 	launch_time = igc_tx_launchtime(tx_ring, txtime, &first_flag, &insert_empty);
 
-	if (insert_empty) {
-		struct igc_tx_buffer *empty_info;
-		struct sk_buff *empty;
-		void *data;
-
-		empty_info = &tx_ring->tx_buffer_info[tx_ring->next_to_use];
-		empty = alloc_skb(IGC_EMPTY_FRAME_SIZE, GFP_ATOMIC);
-		if (!empty)
-			goto done;
-
-		data = skb_put(empty, IGC_EMPTY_FRAME_SIZE);
-		memset(data, 0, IGC_EMPTY_FRAME_SIZE);
-
-		igc_tx_ctxtdesc(tx_ring, 0, false, 0, 0, 0);
-
-		if (igc_init_tx_empty_descriptor(tx_ring,
-						 empty,
-						 empty_info) < 0)
-			dev_kfree_skb_any(empty);
-	}
+	if (insert_empty)
+		igc_insert_empty_packet(tx_ring);
 
 done:
 	/* record the location of the first descriptor for this packet */
@@ -2955,9 +2957,33 @@ static u64 igc_xsk_fill_timestamp(void *_priv)
 	return *(u64 *)_priv;
 }
 
+static void igc_xsk_request_launch_time(u64 launch_time, void *_priv)
+{
+	struct igc_metadata_request *meta_req = _priv;
+	struct igc_ring *tx_ring = meta_req->tx_ring;
+	__le32 launch_time_offset;
+	bool insert_empty = false;
+	bool first_flag = false;
+
+	if (!tx_ring->launchtime_enable)
+		return;
+
+	launch_time_offset = igc_tx_launchtime(tx_ring,
+					       ns_to_ktime(launch_time),
+					       &first_flag, &insert_empty);
+	if (insert_empty) {
+		igc_insert_empty_packet(tx_ring);
+		meta_req->tx_buffer =
+			&tx_ring->tx_buffer_info[tx_ring->next_to_use];
+	}
+
+	igc_tx_ctxtdesc(tx_ring, launch_time_offset, first_flag, 0, 0, 0);
+}
+
 const struct xsk_tx_metadata_ops igc_xsk_tx_metadata_ops = {
 	.tmo_request_timestamp		= igc_xsk_request_timestamp,
 	.tmo_fill_timestamp		= igc_xsk_fill_timestamp,
+	.tmo_request_launch_time	= igc_xsk_request_launch_time,
 };
 
 static void igc_xdp_xmit_zc(struct igc_ring *ring)
@@ -2980,7 +3006,7 @@ static void igc_xdp_xmit_zc(struct igc_ring *ring)
 	ntu = ring->next_to_use;
 	budget = igc_desc_unused(ring);
 
-	while (xsk_tx_peek_desc(pool, &xdp_desc) && budget--) {
+	while (xsk_tx_peek_desc(pool, &xdp_desc) && budget >= 4) {
 		struct igc_metadata_request meta_req;
 		struct xsk_tx_metadata *meta = NULL;
 		struct igc_tx_buffer *bi;
@@ -3004,6 +3030,12 @@ static void igc_xdp_xmit_zc(struct igc_ring *ring)
 		xsk_tx_metadata_request(meta, &igc_xsk_tx_metadata_ops,
 					&meta_req);
 
+		/* xsk_tx_metadata_request() may have updated next_to_use */
+		ntu = ring->next_to_use;
+
+		/* xsk_tx_metadata_request() may have updated Tx buffer info */
+		bi = meta_req.tx_buffer;
+
 		tx_desc = IGC_TX_DESC(ring, ntu);
 		tx_desc->read.cmd_type_len = cpu_to_le32(meta_req.cmd_type);
 		tx_desc->read.olinfo_status = cpu_to_le32(olinfo_status);
@@ -3021,9 +3053,11 @@ static void igc_xdp_xmit_zc(struct igc_ring *ring)
 		ntu++;
 		if (ntu == ring->count)
 			ntu = 0;
+
+		ring->next_to_use = ntu;
+		budget = igc_desc_unused(ring);
 	}
 
-	ring->next_to_use = ntu;
 	if (tx_desc) {
 		igc_flush_tx_descriptors(ring);
 		xsk_tx_release(pool);
-- 
2.34.1


