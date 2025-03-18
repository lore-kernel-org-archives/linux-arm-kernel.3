Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1917CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 03:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hUlF9MznGdU5ftIIyvL4PiWMGJ7TCgNuKUUgP104euI=; b=SBg6a3uHPRtvVqo5OHJgclqfTh
	wKoKTsUuKUq5WruN1ieTG2XWJWs9lcEjaW7El7umcYVBGvaLRlEEh0KJF0yuSbfL51yoeP+LDzM0t
	DrFIz5vu9wJ8uIEbLfKeg7gI+tG4SauO/dqK1vHypyWEOC7+svOAaiQv8AUn8X1DjeJJ4XvzKxPT2
	i7xuz2yzABzZkyyyf9ZGRha+JmidfwJoxPFjIMPcKGIiiOye5/HAWsV/ASD5jqEKbZHSKYBrk90E8
	3cIinNc2Klzy7cLf+89MNB0FO5TDi8VkDF6cHENdvryfqePVsRbpP/dRP3jhWaarxP9qQ7HjyNgYC
	xT27Vcww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuNbM-00000004Vcq-0kgQ;
	Tue, 18 Mar 2025 03:26:48 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuNKh-00000004TOv-14B9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 03:09:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742267375; x=1773803375;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=SSg48PFLu9MLb8qoAQr7IacJyhQASfev4zsoNzSKWZg=;
  b=IwktPfB/LdO8qBZTLbZko8vYfx1t1Cp/UHGLj7imOM2RPsqw5E80b1H7
   cT0zmfYQYVpJg8eH+sNasUHkDG6t5Ts+G6Ff7MJveL1tT6PKP8We5Ttuk
   kLAZjBsP4jW9QXjupnE8Kdr7mJ8Y1a+qo/5qVhKKjo90gpVchiAdGWgzT
   zKp1zNNGpeTZqtlkXx89p9t8C0k8cL5fc2v5uavNmz1/NAbhOQuIYTif4
   DiSmlcZecRMie0kaVSIKtGV5+ZxxbGyfIzNp2rJsdCT/QVRw0D33r2zFh
   b9p4zSTFuDzv5r/xv4ZRgFsI/YaYLV7xH5po//ohZ3kOH0OEoMGBCryrh
   g==;
X-CSE-ConnectionGUID: cHQRTluDTvuTkJWWPd7fLw==
X-CSE-MsgGUID: XCc3A1HmRM2F+GRv+YbuFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="54383106"
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="54383106"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 20:09:34 -0700
X-CSE-ConnectionGUID: CxSQe1B7Q9Ky6dW9tehdPg==
X-CSE-MsgGUID: zoVWuLTkSmu5deG1I6mCvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="126313900"
Received: from mohdfai2-ilbpg12-1.png.intel.com ([10.88.227.73])
  by fmviesa003.fm.intel.com with ESMTP; 17 Mar 2025 20:09:27 -0700
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
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Furong Xu <0x1207@gmail.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Hariprasad Kelam <hkelam@marvell.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Suraj Jaiswal <quic_jsuraj@quicinc.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Gal Pressman <gal@nvidia.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Chwee-Lin Choong <chwee.lin.choong@intel.com>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH iwl-next v10 09/14] igc: set the RX packet buffer size for TSN mode
Date: Mon, 17 Mar 2025 23:07:37 -0400
Message-Id: <20250318030742.2567080-10-faizal.abdul.rahim@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318030742.2567080-1-faizal.abdul.rahim@linux.intel.com>
References: <20250318030742.2567080-1-faizal.abdul.rahim@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_200935_337556_EB0EA99B 
X-CRM114-Status: GOOD (  13.55  )
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

In preparation for supporting frame preemption, when entering TSN mode,
set the receive packet buffer to 15KB for the Express MAC, 15KB for
the Preemptible MAC and 2KB for the BMC.

References:
I225/I226 SW User Manual, Section 4.7.9, Section 7.1.3.2, Section 8.3.1

The newly introduced macros follow the naming from the i226 SW User Manual
for easy reference.

Co-developed-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
---
 drivers/net/ethernet/intel/igc/igc_defines.h |  5 ++++
 drivers/net/ethernet/intel/igc/igc_tsn.c     | 25 ++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/net/ethernet/intel/igc/igc_defines.h b/drivers/net/ethernet/intel/igc/igc_defines.h
index 3564d15df57b..d753a8ec36ae 100644
--- a/drivers/net/ethernet/intel/igc/igc_defines.h
+++ b/drivers/net/ethernet/intel/igc/igc_defines.h
@@ -399,17 +399,22 @@
 /* Mask for RX packet buffer size */
 #define IGC_RXPBSIZE_EXP_MASK		GENMASK(5, 0)
 #define IGC_BMC2OSPBSIZE_MASK		GENMASK(11, 6)
+#define IGC_RXPBSIZE_BE_MASK		GENMASK(17, 12)
 /* Mask for timestamp in RX buffer */
 #define IGC_RXPBS_CFG_TS_EN_MASK	GENMASK(31, 31)
 /* High-priority RX packet buffer size (KB). Used for Express traffic when preemption is enabled */
 #define IGC_RXPBSIZE_EXP(x)		FIELD_PREP(IGC_RXPBSIZE_EXP_MASK, (x))
 /* BMC to OS packet buffer size in KB */
 #define IGC_BMC2OSPBSIZE(x)		FIELD_PREP(IGC_BMC2OSPBSIZE_MASK, (x))
+/* Low-priority RX packet buffer size (KB). Used for BE traffic when preemption is enabled */
+#define IGC_RXPBSIZE_BE(x)		FIELD_PREP(IGC_RXPBSIZE_BE_MASK, (x))
 /* Enable RX packet buffer for timestamp descriptor, saving 16 bytes per packet if set */
 #define IGC_RXPBS_CFG_TS_EN		FIELD_PREP(IGC_RXPBS_CFG_TS_EN_MASK, 1)
 /* Default value following I225/I226 SW User Manual Section 8.3.1 */
 #define IGC_RXPBSIZE_EXP_BMC_DEFAULT ( \
 	IGC_RXPBSIZE_EXP(34) | IGC_BMC2OSPBSIZE(2))
+#define IGC_RXPBSIZE_EXP_BMC_BE_TSN ( \
+	IGC_RXPBSIZE_EXP(15) | IGC_BMC2OSPBSIZE(2) | IGC_RXPBSIZE_BE(15))
 
 /* Mask for TX packet buffer size */
 #define IGC_TXPB0SIZE_MASK		GENMASK(5, 0)
diff --git a/drivers/net/ethernet/intel/igc/igc_tsn.c b/drivers/net/ethernet/intel/igc/igc_tsn.c
index 498741d83ca6..5b3b1bc0b64a 100644
--- a/drivers/net/ethernet/intel/igc/igc_tsn.c
+++ b/drivers/net/ethernet/intel/igc/igc_tsn.c
@@ -125,6 +125,27 @@ static void igc_tsn_tx_arb(struct igc_adapter *adapter, u16 *queue_per_tc)
 	wr32(IGC_TXARB, txarb);
 }
 
+/**
+ * igc_tsn_set_rxpbsize - Set the receive packet buffer size
+ * @adapter: Pointer to the igc_adapter structure
+ * @rxpbs_exp_bmc_be: Value to set the receive packet buffer size, including
+ *                    express buffer, BMC buffer, and Best Effort buffer
+ *
+ * The IGC_RXPBS register value may include allocations for the Express buffer,
+ * BMC buffer, Best Effort buffer, and the timestamp descriptor buffer (IGC_RXPBS_CFG_TS_EN).
+ */
+static void igc_tsn_set_rxpbsize(struct igc_adapter *adapter, u32 rxpbs_exp_bmc_be)
+{
+	struct igc_hw *hw = &adapter->hw;
+	u32 rxpbs = rd32(IGC_RXPBS);
+
+	rxpbs &= ~(IGC_RXPBSIZE_EXP_MASK | IGC_BMC2OSPBSIZE_MASK |
+		   IGC_RXPBSIZE_BE_MASK);
+	rxpbs |= rxpbs_exp_bmc_be;
+
+	wr32(IGC_RXPBS, rxpbs);
+}
+
 /* Returns the TSN specific registers to their default values after
  * the adapter is reset.
  */
@@ -139,6 +160,8 @@ static int igc_tsn_disable_offload(struct igc_adapter *adapter)
 	wr32(IGC_TXPBS, IGC_TXPBSIZE_DEFAULT);
 	wr32(IGC_DTXMXPKTSZ, IGC_DTXMXPKTSZ_DEFAULT);
 
+	igc_tsn_set_rxpbsize(adapter, IGC_RXPBSIZE_EXP_BMC_DEFAULT);
+
 	if (igc_is_device_id_i226(hw))
 		igc_tsn_restore_retx_default(adapter);
 
@@ -202,6 +225,8 @@ static int igc_tsn_enable_offload(struct igc_adapter *adapter)
 	wr32(IGC_DTXMXPKTSZ, IGC_DTXMXPKTSZ_TSN);
 	wr32(IGC_TXPBS, IGC_TXPBSIZE_TSN);
 
+	igc_tsn_set_rxpbsize(adapter, IGC_RXPBSIZE_EXP_BMC_BE_TSN);
+
 	if (igc_is_device_id_i226(hw))
 		igc_tsn_set_retx_qbvfullthreshold(adapter);
 
-- 
2.34.1


