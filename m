Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F850C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 21:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wIfUnzGMGVGq2OxybQ2u1EyFAhDicZ6TudUKzWins8I=; b=LrF5jG7W0AJufh6I9PF+FCRiO5
	lZgLr7h5fqUHXuA/JRhVlNHaQ3rPOYzOhicVmHIdcSX99q0DhKohdBr6Ay3U3VaO5oznA3h/DlbMW
	iy74trdknVK/rmEpZMasudKjKAHhFqnv/6uBcw/X3UgteY9nPQfW5J4VOPvEJraCDVmPHdKbCC7Yt
	PNofsp2iPtlRxIR7jdZcRxkcj2s01F4YT/yxOWkOcIDekl+7edlHT0ij+3aciRrwTL1zg3ksA/zhC
	teFpBsFmHxl9sBd/1Zr0VYxi6gVA9TZlnxN9MTC4LAZ0xk/tvxUrNCt3hckJqlZRAGXZ6Js9eN3J8
	8Rti9H5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRHCe-00000005XwO-3hR1;
	Mon, 16 Jun 2025 21:17:16 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRH30-00000005X3q-0Fnt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 21:07:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wIfUnzGMGVGq2OxybQ2u1EyFAhDicZ6TudUKzWins8I=; b=hGhzisxYWTAl91Jqr9NH5Ll0e9
	rEdqL5qB40/F91i37xa6mnpYxu+yHvAg6mdvYIX+VJ7GrH26A878/GNhRAbDCZubx/K2P/7L3l5sT
	mc2s6QxT0TjgM4kkXx2L1urXBWQOICtMgMFicDYqDCT/N37uX7AJ1MnwmlRGYaH2MlxULZ+kbMb8T
	6a1DMrntDv8oat6aBNS4ESZC2gBmCcvaD1mvNbUS09qsV5veAV2xV9MpedvOqc0THbXZApVmnTnWu
	9BgdU/3b8Q5wOqiKDJoPsM0bIOp55yAXNPySP92D9DbD6qTkCckqSD5RShpOuaKsj10pGdEb09Lej
	SMF1V24A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36656 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uRH2u-0004HM-3B;
	Mon, 16 Jun 2025 22:07:13 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uRH2G-004UyY-GD; Mon, 16 Jun 2025 22:06:32 +0100
In-Reply-To: <aFCHJWXSLbUoogi6@shell.armlinux.org.uk>
References: <aFCHJWXSLbUoogi6@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 4/4] net: stmmac: visconti: make phy_intf_sel local
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uRH2G-004UyY-GD@rmk-PC.armlinux.org.uk>
Date: Mon, 16 Jun 2025 22:06:32 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_140718_098751_0FF9546D 
X-CRM114-Status: GOOD (  15.15  )
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

There is little need to have phy_intf_sel as a member of struct
visconti_eth when we have the PHY interface mode available from
phylink in visconti_eth_set_clk_tx_rate(). Without multiple
interface support, phylink is fixed to supporting only
plat->phy_interface, so we can be sure that "interface" passed
into this function is the same as plat->phy_interface.

Make phy_intf_sel local to visconti_eth_init_hw() and clean up.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-visconti.c  | 23 +++++++++----------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
index db82b522c248..bd65d4239054 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
@@ -48,7 +48,6 @@
 
 struct visconti_eth {
 	void __iomem *reg;
-	u32 phy_intf_sel;
 	struct clk *phy_ref_clk;
 	struct device *dev;
 };
@@ -57,9 +56,9 @@ static int visconti_eth_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 					phy_interface_t interface, int speed)
 {
 	struct visconti_eth *dwmac = bsp_priv;
-	unsigned int val, clk_sel = 0;
+	unsigned long clk_sel, val;
 
-	if (dwmac->phy_intf_sel == ETHER_CONFIG_INTF_RGMII) {
+	if (phy_interface_mode_is_rgmii(interface)) {
 		switch (speed) {
 		case SPEED_1000:
 			clk_sel = ETHER_CLK_SEL_FREQ_SEL_125M;
@@ -93,7 +92,7 @@ static int visconti_eth_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 
 		val &= ~ETHER_CLK_SEL_TX_O_E_N_IN;
 		writel(val, dwmac->reg + REG_ETHER_CLOCK_SEL);
-	} else if (dwmac->phy_intf_sel == ETHER_CONFIG_INTF_RMII) {
+	} else if (interface == PHY_INTERFACE_MODE_RMII) {
 		switch (speed) {
 		case SPEED_100:
 			clk_sel = ETHER_CLK_SEL_DIV_SEL_2;
@@ -150,28 +149,28 @@ static int visconti_eth_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 static int visconti_eth_init_hw(struct platform_device *pdev, struct plat_stmmacenet_data *plat_dat)
 {
 	struct visconti_eth *dwmac = plat_dat->bsp_priv;
-	unsigned int reg_val, clk_sel_val;
+	unsigned int clk_sel_val;
+	u32 phy_intf_sel;
 
 	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
-		dwmac->phy_intf_sel = ETHER_CONFIG_INTF_RGMII;
+		phy_intf_sel = ETHER_CONFIG_INTF_RGMII;
 		break;
 	case PHY_INTERFACE_MODE_MII:
-		dwmac->phy_intf_sel = ETHER_CONFIG_INTF_MII;
+		phy_intf_sel = ETHER_CONFIG_INTF_MII;
 		break;
 	case PHY_INTERFACE_MODE_RMII:
-		dwmac->phy_intf_sel = ETHER_CONFIG_INTF_RMII;
+		phy_intf_sel = ETHER_CONFIG_INTF_RMII;
 		break;
 	default:
 		dev_err(&pdev->dev, "Unsupported phy-mode (%d)\n", plat_dat->phy_interface);
 		return -EOPNOTSUPP;
 	}
 
-	reg_val = dwmac->phy_intf_sel;
-	writel(reg_val, dwmac->reg + REG_ETHER_CONTROL);
+	writel(phy_intf_sel, dwmac->reg + REG_ETHER_CONTROL);
 
 	/* Enable TX/RX clock */
 	clk_sel_val = ETHER_CLK_SEL_FREQ_SEL_125M;
@@ -181,8 +180,8 @@ static int visconti_eth_init_hw(struct platform_device *pdev, struct plat_stmmac
 	       dwmac->reg + REG_ETHER_CLOCK_SEL);
 
 	/* release internal-reset */
-	reg_val |= ETHER_ETH_CONTROL_RESET;
-	writel(reg_val, dwmac->reg + REG_ETHER_CONTROL);
+	phy_intf_sel |= ETHER_ETH_CONTROL_RESET;
+	writel(phy_intf_sel, dwmac->reg + REG_ETHER_CONTROL);
 
 	return 0;
 }
-- 
2.30.2


