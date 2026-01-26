Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA89CF65DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 12:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7j0Vk4RZICiGr3kMEvEbjecwBLCRWMDYUxPd+pEqMpc=; b=Vl5DdGffysaJeCH1o5dl1q1Wxt
	SYBTMDDy9ZykIwOfzujJjck47a791uxKKBOn1aXHS6qs1+r2F66wzt6JNTPaTqUcbkSL1MJGHdCoO
	pTReJB/CA/SFAJjGO7IYUCgckrJwAfij9hdkMkWlQGooNrMDrfTg7NIC+rIINSyHCs4hS1hlUEpKw
	mJAAcUVxpF9jSqJpjD0z1xYTy+l/E+TIQPgIfQ4FYZCs2C9m7BnW5cFqC/nmhTIaOqCOJWd1iyPvt
	gKGo+6bSv2yYQ8+rDTpEfS4dKVUyBq4ltOHALL2chRBa1Tn2ptVRcmkxipZN3ogoxNACToB1rR3Kq
	2BYP/xbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLZ0-0000000CWXc-3XuQ;
	Mon, 26 Jan 2026 12:19:26 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLXY-0000000CV82-3wWZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 12:17:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7j0Vk4RZICiGr3kMEvEbjecwBLCRWMDYUxPd+pEqMpc=; b=FzzvkoOKwdf67baLwyTkXQCvt9
	3s0SANG2yvzz/sb2hrTuOd55a4J6bELFRvVi/oQWlJuhtweonEhn4OkaBrs4oD599WPvU59xZm4xH
	MfkoNtDzPAChX07vwmSvDOrcrz66sPKi6c6ZnZiO9AtBMadu3MYpqFSVMnvptwjXgB2/OYiZ+FDRn
	8QVmriGNd1fzca2z5dKW8jdgZP2SmTCSh9FI9jgvQlX/WgwFRSWTXG63+De88mrCp7newRL+iqQ+f
	VRi6Wseu30B+EI4iGFyAg74xMWsV4KGVCI8/qqRi4UpWNF1xCmr79/rEyw6mTMffarKw9shGAdmP/
	buqN7+BQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39956 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vkLXP-000000004m8-23Z0;
	Mon, 26 Jan 2026 12:17:47 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vkLXO-00000005uxQ-31ZV;
	Mon, 26 Jan 2026 12:17:46 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next] net: stmmac: report active PHY interface
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vkLXO-00000005uxQ-31ZV@rmk-PC.armlinux.org.uk>
Date: Mon, 26 Jan 2026 12:17:46 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_041757_239266_ED51644C 
X-CRM114-Status: GOOD (  18.69  )
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

Report the active PHY interface from the point of view of the dwmac
hardware to the kernel log, where the core supports reading this.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
I recently sent this to aid some debug for socfpga folks, but I think
printing the active PHY interface as read from the HW feature registers
is useful information about the state of the driver, particularly for
debugging reported issues.

 drivers/net/ethernet/stmicro/stmmac/common.h  |  6 +++
 .../ethernet/stmicro/stmmac/dwmac1000_dma.c   |  2 +
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  |  2 +
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  1 +
 .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 52 +++++++++++++++++++
 6 files changed, 64 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 49df46be3669..1c5a4af85b58 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -323,6 +323,10 @@ struct stmmac_safety_stats {
 #define PHY_INTF_SEL_SMII	6
 #define PHY_INTF_SEL_REVMII	7
 
+/* XGMAC uses a different encoding - from the AgileX5 documentation */
+#define PHY_INTF_GMII		0
+#define PHY_INTF_RGMII		1
+
 /* MSI defines */
 #define STMMAC_MSI_VEC_MAX	32
 
@@ -512,6 +516,8 @@ struct dma_features {
 	unsigned int dbgmem;
 	/* Number of Policing Counters */
 	unsigned int pcsel;
+	/* Active PHY interface, PHY_INTF_SEL_xxx */
+	u8 actphyif;
 };
 
 /* RX Buffer size must be multiple of 4/8/16 bytes */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
index a62f1271b6ea..3ac7a7949529 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
@@ -239,6 +239,8 @@ static int dwmac1000_get_hw_feature(void __iomem *ioaddr,
 	/* Alternate (enhanced) DESC mode */
 	dma_cap->enh_desc = (hw_cap & DMA_HW_FEAT_ENHDESSEL) >> 24;
 
+	dma_cap->actphyif = FIELD_GET(DMA_HW_FEAT_ACTPHYIF, hw_cap);
+
 	return 0;
 }
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
index aaa83e9ff4f0..60b880cdd9da 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
@@ -382,6 +382,8 @@ static int dwmac4_get_hw_feature(void __iomem *ioaddr,
 	dma_cap->vlins = (hw_cap & GMAC_HW_FEAT_SAVLANINS) >> 27;
 	dma_cap->arpoffsel = (hw_cap & GMAC_HW_FEAT_ARPOFFSEL) >> 9;
 
+	dma_cap->actphyif = FIELD_GET(DMA_HW_FEAT_ACTPHYIF, hw_cap);
+
 	/* MAC HW feature1 */
 	hw_cap = readl(ioaddr + GMAC_HW_FEATURE1);
 	dma_cap->l3l4fnum = (hw_cap & GMAC_HW_FEAT_L3L4FNUM) >> 27;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index b5c91c109c43..51943705a2b0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -107,6 +107,7 @@
 #define XGMAC_HWFEAT_VXN		BIT(29)
 #define XGMAC_HWFEAT_SAVLANINS		BIT(27)
 #define XGMAC_HWFEAT_TSSTSSEL		GENMASK(26, 25)
+#define XGMAC_HWFEAT_PHYSEL		GENMASK(24, 23)
 #define XGMAC_HWFEAT_ADDMACADRSEL	GENMASK(22, 18)
 #define XGMAC_HWFEAT_RXCOESEL		BIT(16)
 #define XGMAC_HWFEAT_TXCOESEL		BIT(14)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index 9bb547f3c3c9..03437f1cf3df 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -364,6 +364,7 @@ static int dwxgmac2_get_hw_feature(void __iomem *ioaddr,
 	dma_cap->vxn = (hw_cap & XGMAC_HWFEAT_VXN) >> 29;
 	dma_cap->vlins = (hw_cap & XGMAC_HWFEAT_SAVLANINS) >> 27;
 	dma_cap->tssrc = (hw_cap & XGMAC_HWFEAT_TSSTSSEL) >> 25;
+	dma_cap->actphyif = FIELD_GET(XGMAC_HWFEAT_PHYSEL, hw_cap);
 	dma_cap->multi_addr = (hw_cap & XGMAC_HWFEAT_ADDMACADRSEL) >> 18;
 	dma_cap->rx_coe = (hw_cap & XGMAC_HWFEAT_RXCOESEL) >> 16;
 	dma_cap->tx_coe = (hw_cap & XGMAC_HWFEAT_TXCOESEL) >> 14;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 347a0078f622..db0ea48a5637 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -127,6 +127,22 @@ static unsigned int chain_mode;
 module_param(chain_mode, int, 0444);
 MODULE_PARM_DESC(chain_mode, "To use chain instead of ring mode");
 
+static const char *stmmac_dwmac_actphyif[8] = {
+	[PHY_INTF_SEL_GMII_MII]	= "GMII/MII",
+	[PHY_INTF_SEL_RGMII]	= "RGMII",
+	[PHY_INTF_SEL_SGMII]	= "SGMII",
+	[PHY_INTF_SEL_TBI]	= "TBI",
+	[PHY_INTF_SEL_RMII]	= "RMII",
+	[PHY_INTF_SEL_RTBI]	= "RTBI",
+	[PHY_INTF_SEL_SMII]	= "SMII",
+	[PHY_INTF_SEL_REVMII]	= "REVMII",
+};
+
+static const char *stmmac_dwxgmac_phyif[4] = {
+	[PHY_INTF_GMII]		= "GMII",
+	[PHY_INTF_RGMII]	= "RGMII",
+};
+
 static irqreturn_t stmmac_interrupt(int irq, void *dev_id);
 /* For MSI interrupts handling */
 static irqreturn_t stmmac_mac_interrupt(int irq, void *dev_id);
@@ -7270,6 +7286,41 @@ static void stmmac_service_task(struct work_struct *work)
 	clear_bit(STMMAC_SERVICE_SCHED, &priv->state);
 }
 
+static void stmmac_print_actphyif(struct stmmac_priv *priv)
+{
+	const char **phyif_table;
+	const char *actphyif_str;
+	size_t phyif_table_size;
+
+	switch (priv->plat->core_type) {
+	case DWMAC_CORE_MAC100:
+		return;
+
+	case DWMAC_CORE_GMAC:
+	case DWMAC_CORE_GMAC4:
+		phyif_table = stmmac_dwmac_actphyif;
+		phyif_table_size = ARRAY_SIZE(stmmac_dwmac_actphyif);
+		break;
+
+	case DWMAC_CORE_XGMAC:
+		phyif_table = stmmac_dwxgmac_phyif;
+		phyif_table_size = ARRAY_SIZE(stmmac_dwxgmac_phyif);
+		break;
+	}
+
+
+	if (priv->dma_cap.actphyif < phyif_table_size)
+		actphyif_str = phyif_table[priv->dma_cap.actphyif];
+	else
+		actphyif_str = NULL;
+
+	if (!actphyif_str)
+		actphyif_str = "unknown";
+
+	dev_info(priv->device, "Active PHY interface: %s (%u)\n",
+		 actphyif_str, priv->dma_cap.actphyif);
+}
+
 /**
  *  stmmac_hw_init - Init the MAC device
  *  @priv: driver private structure
@@ -7326,6 +7377,7 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 		else if (priv->dma_cap.rx_coe_type1)
 			priv->plat->rx_coe = STMMAC_RX_COE_TYPE1;
 
+		stmmac_print_actphyif(priv);
 	} else {
 		dev_info(priv->device, "No HW DMA feature register supported\n");
 	}
-- 
2.47.3


