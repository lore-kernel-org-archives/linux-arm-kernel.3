Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7805FCF65EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 12:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wg/dOnG781SWjs7CoGEbkT1P6etmPjivu2HuJgD0COY=; b=hqEOUZXmbIqe3AQvpzURhXX/q1
	Q4vTi07VPRuaqGNUYREU1tgS4j9RuzPaxXjYmrTWoKDlzd6rQGDRylcM55GdMJ1LgmsBNiwhi/KKb
	MfnYUXem8FcJUOzkuDzNFzWsYLDLlVzjxSFzfuodfMzEH3hn6nx9XlnBl1+2szB2U349jaXOCSIft
	ty0KAgHhXL1vsUCEzcKdmC79TijKMPaj7HlnQDfJ8AOqDFZy8Wk+ChGFl7rivBlLtl1QVPpE3+lv6
	LxjWZGxV6I6NkBlp0xyg/OZg/kcOVj18mRWV+0It1B5FyG72+Xpo82cEP7wAy75EUOB+Xcg1Co3sh
	zRYsY++Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLmV-0000000CXtq-3yW4;
	Mon, 26 Jan 2026 12:33:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLmT-0000000CXt6-11ky
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 12:33:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Wg/dOnG781SWjs7CoGEbkT1P6etmPjivu2HuJgD0COY=; b=hWxLtS7BpmMeAI9fBkfEvqzDge
	DXnVM4bgozkpzZaoqlIZweq2goDdXp9qbnd8XA5qnSFEmxOAI25winOvkWxW+z3qNwmVxIK7cPMpC
	2AUw8cF5Rqtgbw1QlCr6XA1nxQA2SjBOzdvVo+chp/GU79rCeFuXDcncy1FTwmD95EM5NPXNfafaZ
	SiShaRwGILyh2SKZBEGPUisDLB3MAXNchj/12Rh4e24PS3O7X/9SipnuATgsWmsVXD6IymczsfOwZ
	2jyAod1I/FEWcdM2E9zoRpl0PK6Hhn6XO+/auKezJ5rwlMR7Gfgdy3rmgvDRDHoL1zkU3PpuCTMA6
	eMFx1IsA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50600 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vkLmM-000000004oZ-40gK;
	Mon, 26 Jan 2026 12:33:14 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vkLmM-00000005vE1-0nop;
	Mon, 26 Jan 2026 12:33:14 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH net-next] net: stmmac: don't pass ioaddr to fix_soc_reset()
 method
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vkLmM-00000005vE1-0nop@rmk-PC.armlinux.org.uk>
Date: Mon, 26 Jan 2026 12:33:14 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_043321_287358_81D5D73B 
X-CRM114-Status: GOOD (  13.75  )
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

As the stmmac_priv struct is passed to the fix_soc_reset() method which
has the ioaddr, there is no need to pass ioaddr separately. Pass just
the stmmac_priv struct. Fix up the glues that use it.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c      | 8 +++++---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 6 ++++--
 drivers/net/ethernet/stmicro/stmmac/hwif.c           | 2 +-
 include/linux/stmmac.h                               | 2 +-
 4 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index c722ff2dc1fc..97de4726208e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -46,7 +46,7 @@ struct imx_dwmac_ops {
 	u32 flags;
 	bool mac_rgmii_txclk_auto_adj;
 
-	int (*fix_soc_reset)(struct stmmac_priv *priv, void __iomem *ioaddr);
+	int (*fix_soc_reset)(struct stmmac_priv *priv);
 	int (*set_intf_mode)(struct imx_priv_data *dwmac, u8 phy_intf_sel);
 	void (*fix_mac_speed)(void *priv, int speed, unsigned int mode);
 };
@@ -220,12 +220,14 @@ static void imx93_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
 	writel(old_ctrl, dwmac->base_addr + MAC_CTRL_REG);
 }
 
-static int imx_dwmac_mx93_reset(struct stmmac_priv *priv, void __iomem *ioaddr)
+static int imx_dwmac_mx93_reset(struct stmmac_priv *priv)
 {
 	struct plat_stmmacenet_data *plat_dat = priv->plat;
-	u32 value = readl(ioaddr + DMA_BUS_MODE);
+	void __iomem *ioaddr = priv->ioaddr;
+	u32 value;
 
 	/* DMA SW reset */
+	value = readl(ioaddr + DMA_BUS_MODE);
 	value |= DMA_BUS_MODE_SFT_RESET;
 	writel(value, ioaddr + DMA_BUS_MODE);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 4f2b5bd6cb31..ed0b534d8d7b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -485,10 +485,12 @@ static int loongson_dwmac_acpi_config(struct pci_dev *pdev,
 }
 
 /* Loongson's DWMAC device may take nearly two seconds to complete DMA reset */
-static int loongson_dwmac_fix_reset(struct stmmac_priv *priv, void __iomem *ioaddr)
+static int loongson_dwmac_fix_reset(struct stmmac_priv *priv)
 {
-	u32 value = readl(ioaddr + DMA_BUS_MODE);
+	void __iomem *ioaddr = priv->ioaddr;
+	u32 value;
 
+	value = readl(ioaddr + DMA_BUS_MODE);
 	if (value & DMA_BUS_MODE_SFT_RESET) {
 		netdev_err(priv->dev, "the PHY clock is missing\n");
 		return -EINVAL;
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 014f7cd79a3c..7e69ff4b9a98 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -109,7 +109,7 @@ int stmmac_reset(struct stmmac_priv *priv)
 	void __iomem *ioaddr = priv->ioaddr;
 
 	if (plat && plat->fix_soc_reset)
-		return plat->fix_soc_reset(priv, ioaddr);
+		return plat->fix_soc_reset(priv);
 
 	return stmmac_do_callback(priv, dma, reset, ioaddr);
 }
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index e308c98c7bd3..5199451dd0bc 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -257,7 +257,7 @@ struct plat_stmmacenet_data {
 	int (*set_clk_tx_rate)(void *priv, struct clk *clk_tx_i,
 			       phy_interface_t interface, int speed);
 	void (*fix_mac_speed)(void *priv, int speed, unsigned int mode);
-	int (*fix_soc_reset)(struct stmmac_priv *priv, void __iomem *ioaddr);
+	int (*fix_soc_reset)(struct stmmac_priv *priv);
 	int (*serdes_powerup)(struct net_device *ndev, void *priv);
 	void (*serdes_powerdown)(struct net_device *ndev, void *priv);
 	int (*mac_finish)(struct net_device *ndev,
-- 
2.47.3


