Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369F7C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 20:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7jcj0txGAoHtohXQbAt4zFKAwHo8/26e2bsJp7vmIqw=; b=N7uynBtbq5nZhl55XMR7RWL2Z3
	DgWUqgfKTyk0/Sz2sLfOhii7LvC9JkSj+lNsGlTHIfjndFq3oumfVp6pZ5bNNadobRHQ6JgtQoYER
	WN0aoq9EnW6H1O/IkFRnGgoJAbhKK1xznGqbEEuGGQ4zI+A7tbBtKRFBRojYSdA1kIDmuEPXyARJ7
	ExM5/3M4pXuQ+B9vMLDSgzHdqo/gt1l6zaSUzSYcUQ+aZLK4zeWYwOmfrCnFYbyvpRY7SO8VzUXI5
	wJ7fGgaTtUx9JuDH3PAlNeTw7bqf0tG9W8O8f4YqZEobqOqKawazs0mfiC4a6/FvkzRj7/jAKFY12
	tN2aIQ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYATm-0000000D4Nu-0GFn;
	Wed, 15 Jan 2025 20:59:10 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYAEf-0000000D1uK-1UcA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 20:43:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7jcj0txGAoHtohXQbAt4zFKAwHo8/26e2bsJp7vmIqw=; b=LDbFJ4Qkq3ba/gJmHwfnyWAbPV
	oRg5PUD4IVGx3uIrQK8hvE+rOve95NR0QOMBHeBuFk2V6kijNo6O9N2iwZ0wRU1hw2dYTyrgL4r+r
	BYnnwN3rAZrtpuE/Zr13aBFEdzPOsBNwIHekMC8QqqkxasZf8G9n7a+y6nSfz3feJXnvDhg4BL/uV
	iPJQAOBCizeNKfN//KnYIf8kuEISEm7ADuTeNGAz/ewckTlvVDCUS3xzSoAS/8ezjtPsxQ+1vlLZd
	7GNdNNt07Za0g+8ZnoGv8a9RAczu37HOqF00XaSNY7+W9sIawoinBlUjuj1lQgZtKVYd23t55YIRV
	2YhFZ8LA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56070 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tYAEZ-0001kX-24;
	Wed, 15 Jan 2025 20:43:27 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tYAEG-0014QH-9O; Wed, 15 Jan 2025 20:43:08 +0000
In-Reply-To: <Z4gdtOaGsBhQCZXn@shell.armlinux.org.uk>
References: <Z4gdtOaGsBhQCZXn@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bryan Whitehead <bryan.whitehead@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	UNGLinuxDriver@microchip.com
Subject: [PATCH net-next 9/9] net: stmmac: convert to phylink managed EEE
 support
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tYAEG-0014QH-9O@rmk-PC.armlinux.org.uk>
Date: Wed, 15 Jan 2025 20:43:08 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_124333_529268_63BDB6D5 
X-CRM114-Status: GOOD (  21.47  )
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
into phylib:

1. Move the stmmac_eee_init() calls out of mac_link_down() and
   mac_link_up() methods into the new mac_{enable,disable}_lpi()
   methods. We leave the calls to stmmac_set_eee_pls() in place as
   these change bits which tell the EEE hardware when the link came
   up or down, and is used for a separate hardware timer. However,
   symmetrically conditionalise this with priv->dma_cap.eee.

2. Update the current LPI timer each time LPI is enabled - which we
   need for software-timed LPI.

3. With phylink managed EEE, phylink manages the receive clock stop
   configuration via phylink_config.eee_rx_clk_stop_enable. Set this
   appropriately which makes the call to phy_eee_rx_clock_stop()
   redundant.

4. From what I can work out, all supported interfaces support LPI
   signalling on stmmac (there's no restriction implemented.) It
   also appears to support LPI at all full duplex speeds at or over
   100M. Set these capabilities.

5. The default timer appears to be derived from a module parameter.
   Set this the same, although we keep code that reconfigures the
   timer in stmmac_init_phy().

6. Remove the direct call to phy_support_eee(), which phylink will do
   on the drivers behalf if phylink_config.eee_enabled_default is set.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 57 +++++++++++++++----
 1 file changed, 45 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index acd6994c1764..c5d293be8ab9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -988,8 +988,8 @@ static void stmmac_mac_link_down(struct phylink_config *config,
 	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
 
 	stmmac_mac_set(priv, priv->ioaddr, false);
-	stmmac_eee_init(priv, false);
-	stmmac_set_eee_pls(priv, priv->hw, false);
+	if (priv->dma_cap.eee)
+		stmmac_set_eee_pls(priv, priv->hw, false);
 
 	if (stmmac_fpe_supported(priv))
 		stmmac_fpe_link_state_handle(priv, false);
@@ -1096,13 +1096,8 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 		writel(ctrl, priv->ioaddr + MAC_CTRL_REG);
 
 	stmmac_mac_set(priv, priv->ioaddr, true);
-	if (phy && priv->dma_cap.eee) {
-		phy_eee_rx_clock_stop(phy, !(priv->plat->flags &
-					     STMMAC_FLAG_RX_CLK_RUNS_IN_LPI));
-		priv->tx_lpi_timer = phy->eee_cfg.tx_lpi_timer;
-		stmmac_eee_init(priv, phy->enable_tx_lpi);
+	if (priv->dma_cap.eee)
 		stmmac_set_eee_pls(priv, priv->hw, true);
-	}
 
 	if (stmmac_fpe_supported(priv))
 		stmmac_fpe_link_state_handle(priv, true);
@@ -1111,12 +1106,32 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 		stmmac_hwtstamp_correct_latency(priv, priv);
 }
 
+static void stmmac_mac_disable_tx_lpi(struct phylink_config *config)
+{
+	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
+
+	stmmac_eee_init(priv, false);
+}
+
+static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
+				    bool tx_clk_stop)
+{
+	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
+
+	priv->tx_lpi_timer = timer;
+	stmmac_eee_init(priv, true);
+
+	return 0;
+}
+
 static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
 	.mac_get_caps = stmmac_mac_get_caps,
 	.mac_select_pcs = stmmac_mac_select_pcs,
 	.mac_config = stmmac_mac_config,
 	.mac_link_down = stmmac_mac_link_down,
 	.mac_link_up = stmmac_mac_link_up,
+	.mac_disable_tx_lpi = stmmac_mac_disable_tx_lpi,
+	.mac_enable_tx_lpi = stmmac_mac_enable_tx_lpi,
 };
 
 /**
@@ -1189,9 +1204,6 @@ static int stmmac_init_phy(struct net_device *dev)
 			return -ENODEV;
 		}
 
-		if (priv->dma_cap.eee)
-			phy_support_eee(phydev);
-
 		ret = phylink_connect_phy(priv->phylink, phydev);
 	} else {
 		fwnode_handle_put(phy_fwnode);
@@ -1201,7 +1213,12 @@ static int stmmac_init_phy(struct net_device *dev)
 	if (ret == 0) {
 		struct ethtool_keee eee;
 
-		/* Configure phylib's copy of the LPI timer */
+		/* Configure phylib's copy of the LPI timer. Normally,
+		 * phylink_config.lpi_timer_default would do this, but there is
+		 * a chance that userspace could change the eee_timer setting
+		 * via sysfs before the first open. Thus, preserve existing
+		 * behaviour.
+		 */
 		if (!phylink_ethtool_get_eee(priv->phylink, &eee)) {
 			eee.tx_lpi_timer = priv->tx_lpi_timer;
 			phylink_ethtool_set_eee(priv->phylink, &eee);
@@ -1234,6 +1251,9 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 	/* Stmmac always requires an RX clock for hardware initialization */
 	priv->phylink_config.mac_requires_rxc = true;
 
+	if (!(priv->plat->flags & STMMAC_FLAG_RX_CLK_RUNS_IN_LPI))
+		priv->phylink_config.eee_rx_clk_stop_enable = true;
+
 	mdio_bus_data = priv->plat->mdio_bus_data;
 	if (mdio_bus_data)
 		priv->phylink_config.default_an_inband =
@@ -1255,6 +1275,19 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 				 priv->phylink_config.supported_interfaces,
 				 pcs->supported_interfaces);
 
+	if (priv->dma_cap.eee) {
+		/* Assume all supported interfaces also support LPI */
+		memcpy(priv->phylink_config.lpi_interfaces,
+		       priv->phylink_config.supported_interfaces,
+		       sizeof(priv->phylink_config.lpi_interfaces));
+
+		/* All full duplex speeds above 100Mbps are supported */
+		priv->phylink_config.lpi_capabilities = ~(MAC_1000FD - 1) |
+							MAC_100FD;
+		priv->phylink_config.lpi_timer_default = eee_timer * 1000;
+		priv->phylink_config.eee_enabled_default = true;
+	}
+
 	fwnode = priv->plat->port_node;
 	if (!fwnode)
 		fwnode = dev_fwnode(priv->device);
-- 
2.30.2


