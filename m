Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65819C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 12:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3SV+6dOBl3mOc+Gr+vcEg+deU8J/KduIg0gct+unWk=; b=nAT28aszeFcmgLaaPPC7Y+yxKz
	oc9UHC+ErRyU3tZqbHskal+V2EJTncFSzWnu5ArH5NXunbjLwUHWekENK8UcpEyq8LonSoMS3KVme
	tJw8PpotBbsaa1W+Q+RUJu/xCgrUb3QkB7zSePVZs1Qx0LltzfF2WkNdSVMb3UwHzQOQKPTgJ8D7Y
	Uqz5PUmgk9st7R68kWL0p2qXrfD+JFo4fHZ2JVwGUopktHuoGwbr76W2MnGqDM2YntV09tVasW2C3
	5CeFK49eyIpfTSSE9Bke0pZ7eAp3hT2xK71qqdEo1KppikkEsIFOKPQIphoi8v6yzV8O4gHT08oXE
	ap/2WJmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASbK-0000000FLNC-3H2a;
	Thu, 01 May 2025 12:01:14 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASML-0000000FJMp-3Rne
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 11:45:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=V3SV+6dOBl3mOc+Gr+vcEg+deU8J/KduIg0gct+unWk=; b=iN6J+i2uf0SdQwJFibXv3x5OJf
	IhZBR/BdsP13XGY7s3MEb4bOENyUvEg6uKPcvsmICiuSNB+BwWehkvNngbtlaN6zvuLrFcGgQAgt/
	TMLdv8BDkOHYg9CMok1GoyuXtgDVxn4nCzD55eHLQ13TNyyF3EgHP5EFiXLaiGPR8EqELU0lUjjiS
	PnZLG8ususEK6qzNOmHkttilyLP+UGVMLNC3MS1SjQA7fhE7uZM/zX44SDwpbUfC7Qs65TMbLnUt1
	OPkzHTN6BWWRMU24BnypS19XrdgpWeu6AcR8YgvbJ5lIotTUz2FqyHKNzAXOzPsq2U6QkMK8vAHe+
	CJmfj6kg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59434 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uASMF-0008WP-1M;
	Thu, 01 May 2025 12:45:39 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uASLd-0021QR-Cu; Thu, 01 May 2025 12:45:01 +0100
In-Reply-To: <aBNe0Vt81vmqVCma@shell.armlinux.org.uk>
References: <aBNe0Vt81vmqVCma@shell.armlinux.org.uk>
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
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 1/6] net: stmmac: use a local variable for
 priv->phylink_config
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uASLd-0021QR-Cu@rmk-PC.armlinux.org.uk>
Date: Thu, 01 May 2025 12:45:01 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_044545_861290_A7FAD459 
X-CRM114-Status: GOOD (  13.37  )
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

Use a local variable for priv->phylink_config in stmmac_phy_setup()
which makes the code a bit easier to read, allowing some lines to be
merged.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 37 +++++++++----------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f59a2363f150..fe7f9e3a92a5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1259,19 +1259,22 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 {
 	struct stmmac_mdio_bus_data *mdio_bus_data;
 	int mode = priv->plat->phy_interface;
+	struct phylink_config *config;
 	struct fwnode_handle *fwnode;
 	struct phylink_pcs *pcs;
 	struct phylink *phylink;
 
-	priv->phylink_config.dev = &priv->dev->dev;
-	priv->phylink_config.type = PHYLINK_NETDEV;
-	priv->phylink_config.mac_managed_pm = true;
+	config = &priv->phylink_config;
+
+	config->dev = &priv->dev->dev;
+	config->type = PHYLINK_NETDEV;
+	config->mac_managed_pm = true;
 
 	/* Stmmac always requires an RX clock for hardware initialization */
-	priv->phylink_config.mac_requires_rxc = true;
+	config->mac_requires_rxc = true;
 
 	if (!(priv->plat->flags & STMMAC_FLAG_RX_CLK_RUNS_IN_LPI))
-		priv->phylink_config.eee_rx_clk_stop_enable = true;
+		config->eee_rx_clk_stop_enable = true;
 
 	/* Set the default transmit clock stop bit based on the platform glue */
 	priv->tx_lpi_clk_stop = priv->plat->flags &
@@ -1279,13 +1282,12 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 
 	mdio_bus_data = priv->plat->mdio_bus_data;
 	if (mdio_bus_data)
-		priv->phylink_config.default_an_inband =
-			mdio_bus_data->default_an_inband;
+		config->default_an_inband = mdio_bus_data->default_an_inband;
 
 	/* Set the platform/firmware specified interface mode. Note, phylink
 	 * deals with the PHY interface mode, not the MAC interface mode.
 	 */
-	__set_bit(mode, priv->phylink_config.supported_interfaces);
+	__set_bit(mode, config->supported_interfaces);
 
 	/* If we have an xpcs, it defines which PHY interfaces are supported. */
 	if (priv->hw->xpcs)
@@ -1294,29 +1296,26 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 		pcs = priv->hw->phylink_pcs;
 
 	if (pcs)
-		phy_interface_or(priv->phylink_config.supported_interfaces,
-				 priv->phylink_config.supported_interfaces,
+		phy_interface_or(config->supported_interfaces,
+				 config->supported_interfaces,
 				 pcs->supported_interfaces);
 
 	if (priv->dma_cap.eee) {
 		/* Assume all supported interfaces also support LPI */
-		memcpy(priv->phylink_config.lpi_interfaces,
-		       priv->phylink_config.supported_interfaces,
-		       sizeof(priv->phylink_config.lpi_interfaces));
+		memcpy(config->lpi_interfaces, config->supported_interfaces,
+		       sizeof(config->lpi_interfaces));
 
 		/* All full duplex speeds above 100Mbps are supported */
-		priv->phylink_config.lpi_capabilities = ~(MAC_1000FD - 1) |
-							MAC_100FD;
-		priv->phylink_config.lpi_timer_default = eee_timer * 1000;
-		priv->phylink_config.eee_enabled_default = true;
+		config->lpi_capabilities = ~(MAC_1000FD - 1) | MAC_100FD;
+		config->lpi_timer_default = eee_timer * 1000;
+		config->eee_enabled_default = true;
 	}
 
 	fwnode = priv->plat->port_node;
 	if (!fwnode)
 		fwnode = dev_fwnode(priv->device);
 
-	phylink = phylink_create(&priv->phylink_config, fwnode,
-				 mode, &stmmac_phylink_mac_ops);
+	phylink = phylink_create(config, fwnode, mode, &stmmac_phylink_mac_ops);
 	if (IS_ERR(phylink))
 		return PTR_ERR(phylink);
 
-- 
2.30.2


