Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87066C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 10:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	Content-Type:Content-Transfer-Encoding:MIME-Version:Subject:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cduO5R39pOTRIfYm2N4ZkWSQKQCnLkVWOo57ZNX/C8k=; b=ivK3FxeiD4RyMun9on1wDUq1sT
	Dmt86R891wh0oohSGtGS+xlWGnJ1Ll8IvR2qFITzxwy97psiNnGwuaal8mJPTWm/1i9rE5BX/X39N
	UKO8KuxzCaijfZrUQTABRnm6hwdTdrDzFVA1uLgwuk23F4ZdrFqzYO1HnTy4nJCnwipZ0ozwZBmIp
	qHcf89TCe5D2mYB61xzS1MEyuH6PB1ecjq/UZUqUqL6dJbYagb2OSjMstT0pYCHaZF/QO8+3t15Xk
	oomYQHKASMkBnXWNy/YK+jeWBDI50ddklxU3T9GLIOfKTMGyVVjvTH871s+HmDM0yXiNv8vp3itGL
	Mj34CLZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiANk-0000000740R-01Tl;
	Wed, 12 Feb 2025 10:54:16 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiADY-000000071jd-2Nrx;
	Wed, 12 Feb 2025 10:43:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cduO5R39pOTRIfYm2N4ZkWSQKQCnLkVWOo57ZNX/C8k=; b=RpSjZ9pWnIGxnj4+VyWkzAoJFi
	Y2pbaeKhFMylO9AcWFErS19y2CQA0BMs28DJJgUcMvHHPxv/sGoUHSPCwERQ+Ler3DiWtytecX92A
	p0KSwvSGkSjTDAUNoylCwtNqMAjZ9XBazo0o9IpYm+UmcBAtnwMpAPt+KcDgwVcIe2evipjeC8dm5
	gVwquZ9zoaSKh/OuCZaqy9H2pi57+gVKZIUBSuqCTaEKZ+N0tA8MsCzbpknnRrZHBQRlnsab0dY+X
	STxxfuoJPIQJm+SOGb2H0ygmNwPKXgJw1/1loQD5U0AYMLUk7uwIjJLCHx4+qfQvQA2GG0XqhlOqk
	LUNqeumA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36322 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tiACy-0005YL-0w;
	Wed, 12 Feb 2025 10:43:08 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tiACe-003yZe-IZ; Wed, 12 Feb 2025 10:42:48 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next] net: remove phylink_pcs .neg_mode boolean
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tiACe-003yZe-IZ@rmk-PC.armlinux.org.uk>
Date: Wed, 12 Feb 2025 10:42:48 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_024344_888336_48913D71 
X-CRM114-Status: GOOD (  16.86  )
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
Cc: Taras Chornyi <taras.chornyi@plvision.eu>, Marcin Wojtas <marcin.s.wojtas@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Alexander Duyck <alexanderduyck@fb.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, Eric Dumazet <edumazet@google.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Horatiu Vultur <horatiu.vultur@microchip.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Sean Anderson <sean.anderson@seco.com>, Steen Hegelund <Steen.Hegelund@microchip.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, Sean Wang <sean.wang@mediatek.com>, Daniel Machon <daniel.machon@microchip.com>, kernel-team@meta.com, DENG Qingfang <dqfext@gmail.com>, Alexander Couzens <lynxis@fe80.eu>, Matthias Brugger <matthias.bgg@gmail.com>, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Chester A. Unal" <chester.a.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, UNGLinuxDriver@microchip.com, linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

As all PCS are using the neg_mode parameter rather than the legacy
an_mode, remove the ability to use the legacy an_mode. We remove the
tests in the phylink code, unconditionally passing the PCS neg_mode
parameter to PCS methods, and remove setting the flag from drivers.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/dsa/b53/b53_serdes.c              |  1 -
 drivers/net/dsa/mt7530.c                      |  1 -
 drivers/net/dsa/mv88e6xxx/pcs-6185.c          |  1 -
 drivers/net/dsa/mv88e6xxx/pcs-6352.c          |  1 -
 drivers/net/dsa/mv88e6xxx/pcs-639x.c          |  4 ---
 drivers/net/dsa/qca/qca8k-8xxx.c              |  1 -
 drivers/net/ethernet/cadence/macb_main.c      |  2 --
 .../net/ethernet/freescale/fman/fman_dtsec.c  |  1 -
 drivers/net/ethernet/marvell/mvneta.c         |  1 -
 .../net/ethernet/marvell/mvpp2/mvpp2_main.c   |  2 --
 .../ethernet/marvell/prestera/prestera_main.c |  1 -
 .../net/ethernet/meta/fbnic/fbnic_phylink.c   |  1 -
 .../ethernet/microchip/lan966x/lan966x_main.c |  1 -
 .../ethernet/microchip/sparx5/sparx5_main.c   |  1 -
 .../net/ethernet/xilinx/xilinx_axienet_main.c |  1 -
 drivers/net/pcs/pcs-lynx.c                    |  1 -
 drivers/net/pcs/pcs-mtk-lynxi.c               |  1 -
 drivers/net/pcs/pcs-rzn1-miic.c               |  1 -
 drivers/net/pcs/pcs-xpcs.c                    |  1 -
 drivers/net/phy/phylink.c                     | 30 ++++---------------
 include/linux/phylink.h                       |  1 -
 21 files changed, 5 insertions(+), 50 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_serdes.c b/drivers/net/dsa/b53/b53_serdes.c
index 4730982b6840..7460122f6abc 100644
--- a/drivers/net/dsa/b53/b53_serdes.c
+++ b/drivers/net/dsa/b53/b53_serdes.c
@@ -239,7 +239,6 @@ int b53_serdes_init(struct b53_device *dev, int port)
 	pcs->dev = dev;
 	pcs->lane = lane;
 	pcs->pcs.ops = &b53_pcs_ops;
-	pcs->pcs.neg_mode = true;
 
 	return 0;
 }
diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 1c83af805209..b767be593dbe 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3071,7 +3071,6 @@ mt753x_setup(struct dsa_switch *ds)
 	/* Initialise the PCS devices */
 	for (i = 0; i < priv->ds->num_ports; i++) {
 		priv->pcs[i].pcs.ops = priv->info->pcs_ops;
-		priv->pcs[i].pcs.neg_mode = true;
 		priv->pcs[i].priv = priv;
 		priv->pcs[i].port = i;
 	}
diff --git a/drivers/net/dsa/mv88e6xxx/pcs-6185.c b/drivers/net/dsa/mv88e6xxx/pcs-6185.c
index 75ed1fa500a5..af7e06d265f7 100644
--- a/drivers/net/dsa/mv88e6xxx/pcs-6185.c
+++ b/drivers/net/dsa/mv88e6xxx/pcs-6185.c
@@ -138,7 +138,6 @@ static int mv88e6185_pcs_init(struct mv88e6xxx_chip *chip, int port)
 	mpcs->chip = chip;
 	mpcs->port = port;
 	mpcs->phylink_pcs.ops = &mv88e6185_phylink_pcs_ops;
-	mpcs->phylink_pcs.neg_mode = true;
 
 	irq = mv88e6xxx_serdes_irq_mapping(chip, port);
 	if (irq) {
diff --git a/drivers/net/dsa/mv88e6xxx/pcs-6352.c b/drivers/net/dsa/mv88e6xxx/pcs-6352.c
index 143fe21d1834..36993400837e 100644
--- a/drivers/net/dsa/mv88e6xxx/pcs-6352.c
+++ b/drivers/net/dsa/mv88e6xxx/pcs-6352.c
@@ -275,7 +275,6 @@ static struct marvell_c22_pcs *marvell_c22_pcs_alloc(struct device *dev,
 	mpcs->mdio.bus = bus;
 	mpcs->mdio.addr = addr;
 	mpcs->phylink_pcs.ops = &marvell_c22_pcs_ops;
-	mpcs->phylink_pcs.neg_mode = true;
 
 	return mpcs;
 }
diff --git a/drivers/net/dsa/mv88e6xxx/pcs-639x.c b/drivers/net/dsa/mv88e6xxx/pcs-639x.c
index 59f63d6beec8..5db17c0b77f5 100644
--- a/drivers/net/dsa/mv88e6xxx/pcs-639x.c
+++ b/drivers/net/dsa/mv88e6xxx/pcs-639x.c
@@ -565,9 +565,7 @@ static int mv88e6390_pcs_init(struct mv88e6xxx_chip *chip, int port)
 		return -ENOMEM;
 
 	mpcs->sgmii_pcs.ops = &mv88e639x_sgmii_pcs_ops;
-	mpcs->sgmii_pcs.neg_mode = true;
 	mpcs->xg_pcs.ops = &mv88e6390_xg_pcs_ops;
-	mpcs->xg_pcs.neg_mode = true;
 
 	if (chip->info->prod_num == MV88E6XXX_PORT_SWITCH_ID_PROD_6190X ||
 	    chip->info->prod_num == MV88E6XXX_PORT_SWITCH_ID_PROD_6390X)
@@ -945,9 +943,7 @@ static int mv88e6393x_pcs_init(struct mv88e6xxx_chip *chip, int port)
 		return -ENOMEM;
 
 	mpcs->sgmii_pcs.ops = &mv88e6393x_sgmii_pcs_ops;
-	mpcs->sgmii_pcs.neg_mode = true;
 	mpcs->xg_pcs.ops = &mv88e6393x_xg_pcs_ops;
-	mpcs->xg_pcs.neg_mode = true;
 	mpcs->supports_5g = true;
 
 	err = mv88e6393x_erratum_4_6(mpcs);
diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index e8cb4da15dbe..a36b8b07030e 100644
--- a/drivers/net/dsa/qca/qca8k-8xxx.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -1634,7 +1634,6 @@ static void qca8k_setup_pcs(struct qca8k_priv *priv, struct qca8k_pcs *qpcs,
 			    int port)
 {
 	qpcs->pcs.ops = &qca8k_pcs_ops;
-	qpcs->pcs.neg_mode = true;
 
 	/* We don't have interrupts for link changes, so we need to poll */
 	qpcs->pcs.poll = true;
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 48496209fb16..4db61372a78e 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -853,9 +853,7 @@ static int macb_mii_probe(struct net_device *dev)
 	struct macb *bp = netdev_priv(dev);
 
 	bp->phylink_sgmii_pcs.ops = &macb_phylink_pcs_ops;
-	bp->phylink_sgmii_pcs.neg_mode = true;
 	bp->phylink_usx_pcs.ops = &macb_phylink_usx_pcs_ops;
-	bp->phylink_usx_pcs.neg_mode = true;
 
 	bp->phylink_config.dev = &dev->dev;
 	bp->phylink_config.type = PHYLINK_NETDEV;
diff --git a/drivers/net/ethernet/freescale/fman/fman_dtsec.c b/drivers/net/ethernet/freescale/fman/fman_dtsec.c
index b3e2a596ad2c..51402dff72c5 100644
--- a/drivers/net/ethernet/freescale/fman/fman_dtsec.c
+++ b/drivers/net/ethernet/freescale/fman/fman_dtsec.c
@@ -1446,7 +1446,6 @@ int dtsec_initialization(struct mac_device *mac_dev,
 		goto _return_fm_mac_free;
 	}
 	dtsec->pcs.ops = &dtsec_pcs_ops;
-	dtsec->pcs.neg_mode = true;
 	dtsec->pcs.poll = true;
 
 	supported = mac_dev->phylink_config.supported_interfaces;
diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index 4fe121b9f94b..44b18c573909 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -5557,7 +5557,6 @@ static int mvneta_probe(struct platform_device *pdev)
 		clk_prepare_enable(pp->clk_bus);
 
 	pp->phylink_pcs.ops = &mvneta_phylink_pcs_ops;
-	pp->phylink_pcs.neg_mode = true;
 
 	pp->phylink_config.dev = &dev->dev;
 	pp->phylink_config.type = PHYLINK_NETDEV;
diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
index dd76c1b7ed3a..f166dc4e6503 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
@@ -7024,9 +7024,7 @@ static int mvpp2_port_probe(struct platform_device *pdev,
 	dev->dev_port = port->id;
 
 	port->pcs_gmac.ops = &mvpp2_phylink_gmac_pcs_ops;
-	port->pcs_gmac.neg_mode = true;
 	port->pcs_xlg.ops = &mvpp2_phylink_xlg_pcs_ops;
-	port->pcs_xlg.neg_mode = true;
 
 	if (!mvpp2_use_acpi_compat_mode(port_fwnode)) {
 		port->phylink_config.dev = &dev->dev;
diff --git a/drivers/net/ethernet/marvell/prestera/prestera_main.c b/drivers/net/ethernet/marvell/prestera/prestera_main.c
index 440a4c42b405..8cdecf61253c 100644
--- a/drivers/net/ethernet/marvell/prestera/prestera_main.c
+++ b/drivers/net/ethernet/marvell/prestera/prestera_main.c
@@ -396,7 +396,6 @@ static int prestera_port_sfp_bind(struct prestera_port *port)
 			continue;
 
 		port->phylink_pcs.ops = &prestera_pcs_ops;
-		port->phylink_pcs.neg_mode = true;
 
 		port->phy_config.dev = &port->dev->dev;
 		port->phy_config.type = PHYLINK_NETDEV;
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_phylink.c b/drivers/net/ethernet/meta/fbnic/fbnic_phylink.c
index bb11fc83367d..860b02b22c15 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_phylink.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_phylink.c
@@ -133,7 +133,6 @@ int fbnic_phylink_init(struct net_device *netdev)
 	struct fbnic_net *fbn = netdev_priv(netdev);
 	struct phylink *phylink;
 
-	fbn->phylink_pcs.neg_mode = true;
 	fbn->phylink_pcs.ops = &fbnic_phylink_pcs_ops;
 
 	fbn->phylink_config.dev = &netdev->dev;
diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
index 3234a960fcc3..0af143ec0f86 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
@@ -828,7 +828,6 @@ static int lan966x_probe_port(struct lan966x *lan966x, u32 p,
 	port->phylink_config.type = PHYLINK_NETDEV;
 	port->phylink_pcs.poll = true;
 	port->phylink_pcs.ops = &lan966x_phylink_pcs_ops;
-	port->phylink_pcs.neg_mode = true;
 
 	port->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
 		MAC_10 | MAC_100 | MAC_1000FD | MAC_2500FD;
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index 6a0e5b83ecd0..74ad1d73b465 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -338,7 +338,6 @@ static int sparx5_create_port(struct sparx5 *sparx5,
 	spx5_port->custom_etype = 0x8880; /* Vitesse */
 	spx5_port->phylink_pcs.poll = true;
 	spx5_port->phylink_pcs.ops = &sparx5_phylink_pcs_ops;
-	spx5_port->phylink_pcs.neg_mode = true;
 	spx5_port->is_mrouter = false;
 	INIT_LIST_HEAD(&spx5_port->tc_templates);
 	sparx5->ports[config->portno] = spx5_port;
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 0673b2694e4c..2ffaad0b0477 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -3073,7 +3073,6 @@ static int axienet_probe(struct platform_device *pdev)
 		}
 		of_node_put(np);
 		lp->pcs.ops = &axienet_pcs_ops;
-		lp->pcs.neg_mode = true;
 		lp->pcs.poll = true;
 	}
 
diff --git a/drivers/net/pcs/pcs-lynx.c b/drivers/net/pcs/pcs-lynx.c
index e46f588cae7d..23b40e9eacbb 100644
--- a/drivers/net/pcs/pcs-lynx.c
+++ b/drivers/net/pcs/pcs-lynx.c
@@ -355,7 +355,6 @@ static struct phylink_pcs *lynx_pcs_create(struct mdio_device *mdio)
 	mdio_device_get(mdio);
 	lynx->mdio = mdio;
 	lynx->pcs.ops = &lynx_pcs_phylink_ops;
-	lynx->pcs.neg_mode = true;
 	lynx->pcs.poll = true;
 
 	for (i = 0; i < ARRAY_SIZE(lynx_interfaces); i++)
diff --git a/drivers/net/pcs/pcs-mtk-lynxi.c b/drivers/net/pcs/pcs-mtk-lynxi.c
index 7d6261dee534..149ddf51d785 100644
--- a/drivers/net/pcs/pcs-mtk-lynxi.c
+++ b/drivers/net/pcs/pcs-mtk-lynxi.c
@@ -305,7 +305,6 @@ struct phylink_pcs *mtk_pcs_lynxi_create(struct device *dev,
 	mpcs->regmap = regmap;
 	mpcs->flags = flags;
 	mpcs->pcs.ops = &mtk_pcs_lynxi_ops;
-	mpcs->pcs.neg_mode = true;
 	mpcs->pcs.poll = true;
 	mpcs->interface = PHY_INTERFACE_MODE_NA;
 
diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index a808ac7375f5..d79bb9b06cd2 100644
--- a/drivers/net/pcs/pcs-rzn1-miic.c
+++ b/drivers/net/pcs/pcs-rzn1-miic.c
@@ -349,7 +349,6 @@ struct phylink_pcs *miic_create(struct device *dev, struct device_node *np)
 	miic_port->miic = miic;
 	miic_port->port = port - 1;
 	miic_port->pcs.ops = &miic_phylink_ops;
-	miic_port->pcs.neg_mode = true;
 
 	phy_interface_set_rgmii(miic_port->pcs.supported_interfaces);
 	__set_bit(PHY_INTERFACE_MODE_RMII, miic_port->pcs.supported_interfaces);
diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index ee0c1a27f06c..e32dec4b812e 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -1403,7 +1403,6 @@ static struct dw_xpcs *xpcs_create_data(struct mdio_device *mdiodev)
 	mdio_device_get(mdiodev);
 	xpcs->mdiodev = mdiodev;
 	xpcs->pcs.ops = &xpcs_phylink_ops;
-	xpcs->pcs.neg_mode = true;
 	xpcs->pcs.poll = true;
 
 	return xpcs;
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 840af19488d8..b76ac1322b68 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1365,7 +1365,6 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 	struct phylink_pcs *pcs = NULL;
 	bool pcs_changed = false;
 	unsigned int rate_kbd;
-	unsigned int neg_mode;
 	int err;
 
 	phylink_dbg(pl, "major config, requested %s/%s\n",
@@ -1428,11 +1427,7 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 	if (pl->pcs_state == PCS_STATE_STARTING || pcs_changed)
 		phylink_pcs_enable(pl->pcs);
 
-	neg_mode = pl->act_link_an_mode;
-	if (pl->pcs && pl->pcs->neg_mode)
-		neg_mode = pl->pcs_neg_mode;
-
-	err = phylink_pcs_config(pl->pcs, neg_mode, state,
+	err = phylink_pcs_config(pl->pcs, pl->pcs_neg_mode, state,
 				 !!(pl->link_config.pause & MLO_PAUSE_AN));
 	if (err < 0)
 		phylink_err(pl, "pcs_config failed: %pe\n",
@@ -1475,7 +1470,6 @@ static void phylink_major_config(struct phylink *pl, bool restart,
  */
 static int phylink_change_inband_advert(struct phylink *pl)
 {
-	unsigned int neg_mode;
 	int ret;
 
 	if (test_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state))
@@ -1491,15 +1485,11 @@ static int phylink_change_inband_advert(struct phylink *pl)
 	phylink_pcs_neg_mode(pl, pl->pcs, pl->link_config.interface,
 			     pl->link_config.advertising);
 
-	neg_mode = pl->act_link_an_mode;
-	if (pl->pcs->neg_mode)
-		neg_mode = pl->pcs_neg_mode;
-
 	/* Modern PCS-based method; update the advert at the PCS, and
 	 * restart negotiation if the pcs_config() helper indicates that
 	 * the programmed advertisement has changed.
 	 */
-	ret = phylink_pcs_config(pl->pcs, neg_mode, &pl->link_config,
+	ret = phylink_pcs_config(pl->pcs, pl->pcs_neg_mode, &pl->link_config,
 				 !!(pl->link_config.pause & MLO_PAUSE_AN));
 	if (ret < 0)
 		return ret;
@@ -1523,13 +1513,7 @@ static void phylink_mac_pcs_get_state(struct phylink *pl,
 	state->an_complete = 0;
 	state->link = 1;
 
-	pcs = pl->pcs;
-	if (!pcs || pcs->neg_mode)
-		autoneg = pl->pcs_neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED;
-	else
-		autoneg = linkmode_test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
-					    state->advertising);
-
+	autoneg = pl->pcs_neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED;
 	if (autoneg) {
 		state->speed = SPEED_UNKNOWN;
 		state->duplex = DUPLEX_UNKNOWN;
@@ -1540,6 +1524,7 @@ static void phylink_mac_pcs_get_state(struct phylink *pl,
 		state->pause = pl->link_config.pause;
 	}
 
+	pcs = pl->pcs;
 	if (pcs)
 		pcs->ops->pcs_get_state(pcs, pl->pcs_neg_mode, state);
 	else
@@ -1649,7 +1634,6 @@ static void phylink_link_up(struct phylink *pl,
 			    struct phylink_link_state link_state)
 {
 	struct net_device *ndev = pl->netdev;
-	unsigned int neg_mode;
 	int speed, duplex;
 	bool rx_pause;
 
@@ -1680,11 +1664,7 @@ static void phylink_link_up(struct phylink *pl,
 
 	pl->cur_interface = link_state.interface;
 
-	neg_mode = pl->act_link_an_mode;
-	if (pl->pcs && pl->pcs->neg_mode)
-		neg_mode = pl->pcs_neg_mode;
-
-	phylink_pcs_link_up(pl->pcs, neg_mode, pl->cur_interface, speed,
+	phylink_pcs_link_up(pl->pcs, pl->pcs_neg_mode, pl->cur_interface, speed,
 			    duplex);
 
 	pl->mac_ops->mac_link_up(pl->config, pl->phydev, pl->act_link_an_mode,
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index a692d638568f..a0c6249b9b8e 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -459,7 +459,6 @@ struct phylink_pcs {
 	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
 	const struct phylink_pcs_ops *ops;
 	struct phylink *phylink;
-	bool neg_mode;
 	bool poll;
 	bool rxc_always_on;
 };
-- 
2.30.2


