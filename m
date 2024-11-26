Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C07D3B98B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 13:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p5iam8LcLfiWFg9yqlxfwUNcEh+T0vPbo6e8JFWKInY=; b=OUyaN55C5L5gzkW3BX3g9dMZEn
	JzT3yp+Yb29ky0mnFkmYLFySTlButO0mdy59nvLXOpaIdIhhdBDP5YzkmBrvaorXqgvgU1SgR7dCT
	WKQrt4T4N428jzRqLQ0dp1/y1QA+Q/L8t1wP72fW0c4B2UsgRKNQbO8k+wmoX2GeMwmUw7U9WDlmE
	uOnKG9a5mgpM1auTv+E8wj3npws4vH2qxrfmRG7joqRyd3BXNAe+a+hpYnol/+5Nmk6dBXEr7/QS0
	2i3PiHXvBLROggOBUgSa4RjDZ4FBpwVejuKtM5TDy6uKE3Y1ESJaJyrJ9+SES6o3CVnYYPXVSgigE
	NnqEgeJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFvRD-0000000AgHG-12kf;
	Tue, 26 Nov 2024 13:17:07 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFv57-0000000AcV2-1ett
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 12:54:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=p5iam8LcLfiWFg9yqlxfwUNcEh+T0vPbo6e8JFWKInY=; b=YwtySm9ulAC86bOSqPk+qRTfeF
	zs4q/6kYpd4y/tKnAJNZDJgaKNkRPnEi/Rdfd8DTPAR2uPGblFfwOHEzI2bdzyqhCUa30K0L9qAJN
	5X4kJ5KXOJehIxLrLfhR/mZ0A9dbAizF9NFItuC6FLlxl34Xg5x+0L0Ai7wsvBRMokAeG0pJWpt3C
	DCMfsMykovDdEDXmtz4QDZGiHZ+tFEy0gSihPa+nsYToh1hjEd+ZNnjvqpGWGD3fjxv4sn1yoFM3G
	Axhx/tQ3qnIgbIYJCOkuMn61MnZGBKtyVYoVKGj33n6IWzwfM9yGs8GeUK/GQVi8abEx5U2H2sxto
	ujXbBYvA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56802 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tFv4z-0006yx-2y;
	Tue, 26 Nov 2024 12:54:10 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tFv4y-005yjc-MG; Tue, 26 Nov 2024 12:54:08 +0000
In-Reply-To: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bryan Whitehead <bryan.whitehead@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	UNGLinuxDriver@microchip.com
Subject: [PATCH RFC net-next 23/23] net: stmmac: convert to phylink managed
 EEE support
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tFv4y-005yjc-MG@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 12:54:08 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_045417_430387_1F144D1F 
X-CRM114-Status: GOOD (  12.91  )
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

Convert stmmac to use phylink managed EEE support rather than delving
into phylib.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 50 +++++++++++++++----
 1 file changed, 39 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 66a43a9aa469..39a4f0da82e5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -973,9 +973,6 @@ static void stmmac_mac_link_down(struct phylink_config *config,
 	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
 
 	stmmac_mac_set(priv, priv->ioaddr, false);
-	priv->eee_active = false;
-	priv->eee_enabled = stmmac_eee_init(priv);
-	stmmac_set_eee_pls(priv, priv->hw, false);
 
 	if (stmmac_fpe_supported(priv))
 		stmmac_fpe_link_state_handle(priv, false);
@@ -1082,14 +1079,6 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 		writel(ctrl, priv->ioaddr + MAC_CTRL_REG);
 
 	stmmac_mac_set(priv, priv->ioaddr, true);
-	if (phy && priv->dma_cap.eee) {
-		phy_eee_rx_clock_stop(phy, !(priv->plat->flags &
-					     STMMAC_FLAG_RX_CLK_RUNS_IN_LPI));
-		priv->eee_active = phy->enable_tx_lpi;
-		priv->eee_enabled = stmmac_eee_init(priv);
-		priv->tx_lpi_timer = phy->eee_cfg.tx_lpi_timer;
-		stmmac_set_eee_pls(priv, priv->hw, true);
-	}
 
 	if (stmmac_fpe_supported(priv))
 		stmmac_fpe_link_state_handle(priv, true);
@@ -1098,12 +1087,34 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 		stmmac_hwtstamp_correct_latency(priv, priv);
 }
 
+static void stmmac_mac_disable_tx_lpi(struct phylink_config *config)
+{
+	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
+
+	priv->eee_active = false;
+	priv->eee_enabled = stmmac_eee_init(priv);
+	stmmac_set_eee_pls(priv, priv->hw, false);
+}
+
+static void stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
+				     bool tx_clk_stop)
+{
+	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
+
+	priv->eee_active = true;
+	priv->eee_enabled = stmmac_eee_init(priv);
+	priv->tx_lpi_timer = timer;
+	stmmac_set_eee_pls(priv, priv->hw, true);
+}
+
 static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
 	.mac_get_caps = stmmac_mac_get_caps,
 	.mac_select_pcs = stmmac_mac_select_pcs,
 	.mac_config = stmmac_mac_config,
 	.mac_link_down = stmmac_mac_link_down,
 	.mac_link_up = stmmac_mac_link_up,
+	.mac_disable_tx_lpi = stmmac_mac_disable_tx_lpi,
+	.mac_mac_enable_tx_lpi = stmmac_mac_enable_tx_lpi,
 };
 
 /**
@@ -1216,6 +1227,18 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 	/* Stmmac always requires an RX clock for hardware initialization */
 	priv->phylink_config.mac_requires_rxc = true;
 
+	if (!(priv->plat->flags & STMMAC_FLAG_RX_CLK_RUNS_IN_LPI))
+		priv->phylink_config.eee_rx_clk_stop_enable = true;
+
+	if (priv->dma_cap.eee) {
+		/* All full duplex speeds above 100Mbps are supported */
+		priv->phylink_config.lpi_capabilities = ~(MAC_1000FD - 1) |
+							MAC_100FD;
+		priv->phylink_config.lpi_timer_limit_us = U32_MAX;
+		priv->phylink_config.lpi_timer_default = eee_timer * 1000;
+		priv->phylink_config.eee_enabled_default = false;
+	}
+
 	mdio_bus_data = priv->plat->mdio_bus_data;
 	if (mdio_bus_data)
 		priv->phylink_config.default_an_inband =
@@ -1231,6 +1254,11 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 		xpcs_get_interfaces(priv->hw->xpcs,
 				    priv->phylink_config.supported_interfaces);
 
+	/* Assume all supported interfaces also support LPI */
+	memcpy(priv->phylink_config.lpi_interfaces,
+	       priv->phylink_config.supported_interfaces,
+	       sizeof(priv->phylink_config.lpi_interfaces));
+
 	fwnode = priv->plat->port_node;
 	if (!fwnode)
 		fwnode = dev_fwnode(priv->device);
-- 
2.30.2


