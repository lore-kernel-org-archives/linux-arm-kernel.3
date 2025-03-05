Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16E7C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 13:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLi+WNAD7fqvchynqFKwYbSpOuf/kFQGxxaTuHtQl6g=; b=BlXGtb+st9vd8xLjr6Rv75Ja8a
	bqpYaWmVtOy99xRbMnHn+XzTg9WY7weKw+vvr/r5BWYZEEV2XuSKxD0Nz+ykAVGMh8jZgfpRJdG7h
	E9+tGCVPnRGuz71k8V0axjZzMZu/JgImQnzWEg/o05aTk8SAi4EKyYmUUL2KcV71cbtwRl30VNo4A
	P2350RyGBlFxrGqoYPizJsTdB5Z7PW3TAxrvomiNjOq0H6+zTiDYcmUvk1fmZgEJ+lgdecJ/T19L/
	Qa99+9OVVdTF6p8pR1upDp/DgEvl3dYyjb3ry1H6OKBvvfPb6pm6rxdT//xjXDUxjB+R+HZErLih1
	3Pk5zm6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpojo-00000008BL5-1Iyl;
	Wed, 05 Mar 2025 13:24:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoOI-000000086bZ-1H1u
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 13:02:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=QLi+WNAD7fqvchynqFKwYbSpOuf/kFQGxxaTuHtQl6g=; b=K2KIBZ+h2u0yKRRvEQ85rXS9ck
	K5FCxUE4r5mCAGxL8BCydOhzXNdWY/76qNYytEYF11vrcyzKG4v4kxxjdSOQoTZ7d3cKJFpuh4yQS
	awC1uwcDBFi5wuxGVAZSCH62maC1cjVu+sihqWdgLm90BUx12GI6xLaXj9XMNh1vvcvsm4je44hNP
	wBLHFY0rIlQdcXIP2FCYEF4n2Iku3vtVRAtRHUT9zlbRCp3CVLlLtJX9FSb/lR4814Jawjm1q3VCO
	MqZeTXWTH7k+99FGC/7dyiVkPake9eb/Gdxjc5iRy2Eub723dRsoGqNwp7RW3wszelETE+U5Bpxfq
	wYO3lAjg==;
Received: from mgamail.intel.com ([198.175.65.15])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoOF-00000000XEF-1VAm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 13:02:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741179744; x=1772715744;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=BrHOVPMRx5IUbt2TfaXsmHGE8YIjSq6KxkHt4pHZzf0=;
  b=fNvOgfiFPQgZaruMNOEcoBew5bZhoKZhWnV3+dYjGuw891PMH/mnSapQ
   Ix0HKwkCCPupAZldLVWv3B4GaBGsLKPvejTvCNHM2T5rx3MTUon4bbfP+
   WCDOILiRdEOZBnQFBcNg6MUILsajqgTpXREbhV6OjwUGG2YZiTF/0AX3E
   I7/XChl48aXofQm+eGKJ7oVKVAebuT82SHz/W5OQhTVF29tz9qbtJAGaN
   1gn88hFMLF9Rf4CkyBtqet2ijQEouBo9iamt3KkhZGsIoR7MXykIaN3Wa
   6izDhnB21gqYCH/LfqrtMsTflLWlg+xQoHWm/7iJ0BHqiIVLsGfi+8ZkJ
   Q==;
X-CSE-ConnectionGUID: 0yvzWvgEQzWAe3Bt0R03hQ==
X-CSE-MsgGUID: DFSm/PUPRQamjdDH7gkP9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="45795244"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="45795244"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 05:02:23 -0800
X-CSE-ConnectionGUID: i6Ozl++kSluBMOfRFUTQ5g==
X-CSE-MsgGUID: arsaetUXQceVXXNA1GH2IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="123277236"
Received: from mohdfai2-ilbpg12-1.png.intel.com ([10.88.227.73])
  by fmviesa005.fm.intel.com with ESMTP; 05 Mar 2025 05:02:15 -0800
From: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Simon Horman <horms@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Furong Xu <0x1207@gmail.com>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Suraj Jaiswal <quic_jsuraj@quicinc.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Gal Pressman <gal@nvidia.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Chwee-Lin Choong <chwee.lin.choong@intel.com>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	bpf@vger.kernel.org
Subject: [PATCH iwl-next v8 11/11] igc: add support to get frame preemption statistics via ethtool
Date: Wed,  5 Mar 2025 08:00:26 -0500
Message-Id: <20250305130026.642219-12-faizal.abdul.rahim@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305130026.642219-1-faizal.abdul.rahim@linux.intel.com>
References: <20250305130026.642219-1-faizal.abdul.rahim@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_130223_809526_5359B7CE 
X-CRM114-Status: GOOD (  12.65  )
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

Implemented "ethtool --include-statistics --show-mm" callback for IGC.

Tested preemption scenario to check preemption statistics:
1) Trigger verification handshake on both boards:
    $ sudo ethtool --set-mm enp1s0 pmac-enabled on
    $ sudo ethtool --set-mm enp1s0 tx-enabled on
    $ sudo ethtool --set-mm enp1s0 verify-enabled on
2) Set preemptible or express queue in taprio for tx board:
    $ sudo tc qdisc replace dev enp1s0 parent root handle 100 taprio \
      num_tc 4 map 3 2 1 0 3 3 3 3 3 3 3 3 3 3 3 3 \
      queues 1@0 1@1 1@2 1@3 base-time 0 sched-entry S F 100000 \
      fp E E P P
3) Send large size packets on preemptible queue
4) Send small size packets on express queue to preempt packets in
   preemptible queue
5) Show preemption statistics on the receiving board:
   $ ethtool --include-statistics --show-mm enp1s0
     MAC Merge layer state for enp1s0:
     pMAC enabled: on
     TX enabled: on
     TX active: on
     TX minimum fragment size: 64
     RX minimum fragment size: 60
     Verify enabled: on
     Verify time: 128
     Max verify time: 128
     Verification status: SUCCEEDED
     Statistics:
      MACMergeFrameAssErrorCount: 0
      MACMergeFrameSmdErrorCount: 0
      MACMergeFrameAssOkCount: 511
      MACMergeFragCountRx: 764
      MACMergeFragCountTx: 0
      MACMergeHoldCount: 0

Co-developed-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Co-developed-by: Chwee-Lin Choong <chwee.lin.choong@intel.com>
Signed-off-by: Chwee-Lin Choong <chwee.lin.choong@intel.com>
Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
---
 drivers/net/ethernet/intel/igc/igc_ethtool.c | 39 ++++++++++++++++++++
 drivers/net/ethernet/intel/igc/igc_regs.h    | 16 ++++++++
 2 files changed, 55 insertions(+)

diff --git a/drivers/net/ethernet/intel/igc/igc_ethtool.c b/drivers/net/ethernet/intel/igc/igc_ethtool.c
index fd4b4b332309..1ed08a3fa78b 100644
--- a/drivers/net/ethernet/intel/igc/igc_ethtool.c
+++ b/drivers/net/ethernet/intel/igc/igc_ethtool.c
@@ -1819,6 +1819,44 @@ static int igc_ethtool_set_mm(struct net_device *netdev,
 	return igc_tsn_offload_apply(adapter);
 }
 
+/**
+ * igc_ethtool_get_frame_ass_error - Get the frame assembly error count.
+ * @reg_value: Register value for IGC_PRMEXCPRCNT
+ * Return: The count of frame assembly errors.
+ */
+static u64 igc_ethtool_get_frame_ass_error(u32 reg_value)
+{
+	u32 ooo_frame_cnt, ooo_frag_cnt; /* Out of order statistics */
+	u32 miss_frame_frag_cnt;
+
+	ooo_frame_cnt = FIELD_GET(IGC_PRMEXCPRCNT_OOO_FRAME_CNT, reg_value);
+	ooo_frag_cnt = FIELD_GET(IGC_PRMEXCPRCNT_OOO_FRAG_CNT, reg_value);
+	miss_frame_frag_cnt = FIELD_GET(IGC_PRMEXCPRCNT_MISS_FRAME_FRAG_CNT, reg_value);
+
+	return ooo_frame_cnt + ooo_frag_cnt + miss_frame_frag_cnt;
+}
+
+static u64 igc_ethtool_get_frame_smd_error(u32 reg_value)
+{
+	return FIELD_GET(IGC_PRMEXCPRCNT_OOO_SMDC, reg_value);
+}
+
+static void igc_ethtool_get_mm_stats(struct net_device *dev,
+				     struct ethtool_mm_stats *stats)
+{
+	struct igc_adapter *adapter = netdev_priv(dev);
+	struct igc_hw *hw = &adapter->hw;
+	u32 reg_value;
+
+	reg_value = rd32(IGC_PRMEXCPRCNT);
+
+	stats->MACMergeFrameAssErrorCount = igc_ethtool_get_frame_ass_error(reg_value);
+	stats->MACMergeFrameSmdErrorCount = igc_ethtool_get_frame_smd_error(reg_value);
+	stats->MACMergeFrameAssOkCount = rd32(IGC_PRMPTDRCNT);
+	stats->MACMergeFragCountRx = rd32(IGC_PRMEVNTRCNT);
+	stats->MACMergeFragCountTx = rd32(IGC_PRMEVNTTCNT);
+}
+
 static int igc_ethtool_get_link_ksettings(struct net_device *netdev,
 					  struct ethtool_link_ksettings *cmd)
 {
@@ -2116,6 +2154,7 @@ static const struct ethtool_ops igc_ethtool_ops = {
 	.self_test		= igc_ethtool_diag_test,
 	.get_mm			= igc_ethtool_get_mm,
 	.set_mm			= igc_ethtool_set_mm,
+	.get_mm_stats		= igc_ethtool_get_mm_stats,
 };
 
 void igc_ethtool_set_ops(struct net_device *netdev)
diff --git a/drivers/net/ethernet/intel/igc/igc_regs.h b/drivers/net/ethernet/intel/igc/igc_regs.h
index 12ddc5793651..f343c6bfc6be 100644
--- a/drivers/net/ethernet/intel/igc/igc_regs.h
+++ b/drivers/net/ethernet/intel/igc/igc_regs.h
@@ -222,6 +222,22 @@
 
 #define IGC_FTQF(_n)	(0x059E0 + (4 * (_n)))  /* 5-tuple Queue Fltr */
 
+/* Time sync registers - preemption statistics */
+#define IGC_PRMPTDRCNT		0x04284	/* Good RX Preempted Packets */
+#define IGC_PRMEVNTTCNT		0x04298	/* TX Preemption event counter */
+#define IGC_PRMEVNTRCNT		0x0429C	/* RX Preemption event counter */
+
+ /* Preemption Exception Counter */
+ #define IGC_PRMEXCPRCNT				0x42A0
+/* Received out of order packets with SMD-C */
+#define IGC_PRMEXCPRCNT_OOO_SMDC			0x000000FF
+/* Received out of order packets with SMD-C and wrong Frame CNT */
+#define IGC_PRMEXCPRCNT_OOO_FRAME_CNT			0x0000FF00
+/* Received out of order packets with SMD-C and wrong Frag CNT */
+#define IGC_PRMEXCPRCNT_OOO_FRAG_CNT			0x00FF0000
+/* Received packets with SMD-S and wrong Frag CNT and Frame CNT */
+#define IGC_PRMEXCPRCNT_MISS_FRAME_FRAG_CNT		0xFF000000
+
 /* Transmit Scheduling Registers */
 #define IGC_TQAVCTRL		0x3570
 #define IGC_TXQCTL(_n)		(0x3344 + 0x4 * (_n))
-- 
2.34.1


