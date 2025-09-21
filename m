Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6CCCAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 16:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iq3yS9s/ubuwFzpPEGjqx1aQ+WIrFYSSZ7S4yEwUjw4=; b=YrcwDUvWiTCrtAmisUPpSq8y1W
	oGSUGfzIXQuMmWWaPjzpj1AayKatpLN8A8oyB6zXmjKV/cge9BcufQgmnhJzHONCupnDqqVhOGpvH
	W1tfZXACEAwu5THDhX/S5utG/8R/gp/J8S9X5bQvwgsyLi7QhQL0W1/gQxnnuYg3zmIasDyLGzm9H
	pAU3NnkIuJslrqmIGk7aMDKz4GxrvOWNhPsPGtlmC5p1RMSssxUlBwivi3VNLCi2AvIj73fWEOgaB
	Gy2w7GGLP9dU+6ZIT8TYTq6oaxhtwA7RGXFqdkfCD0bafySzeBp8V+Rk1/6/h2CCVTGCEqAytpPw7
	JFPBbzpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0MbE-00000007iRl-3l8G;
	Sun, 21 Sep 2025 16:07:40 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0MbB-00000007iOq-2D3q
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 16:07:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 09F494E40DA7;
	Sun, 21 Sep 2025 16:07:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D31F360634;
	Sun, 21 Sep 2025 16:07:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 24F7E102F17CD;
	Sun, 21 Sep 2025 18:07:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758470854; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=iq3yS9s/ubuwFzpPEGjqx1aQ+WIrFYSSZ7S4yEwUjw4=;
	b=hKusGfhjEGs+PMN5i2Mov9e3YQx81PkSlm2L0HNsNBOpRJx0YH9ltXmuvzwELby6GGwqXc
	84C7lvEvYCsW130Soje+i8bMQCjAoovTxu6QteMqWOlpu7MpcsrbxwAStSzVLCTt9aHvGr
	NpnBo8kkj8NVgSVFSKm8b4v3Uj+kLkyhKfF9C2F/soYvGI9Lh5rfeRgnZvn2+dudvZqOA2
	46D4qdVVevhHZn/sPW724lOfydNOjabcvLYpGKH/vJUcCOtjxV/ztgXGQm1lvKdseGhtJW
	RLSYwNpdloFyBbDVQgO2BPnwpQvHBmHpz26mZF8PAay0cyuxSnG8ODI3ktKbhw==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?UTF-8?q?Nicol=C3=B2=20Veronese?= <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>,
	mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: [PATCH net-next v13 12/18] net: phy: marvell: Support SFP through phy_port interface
Date: Sun, 21 Sep 2025 21:34:10 +0530
Message-ID: <20250921160419.333427-13-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250921160419.333427-1-maxime.chevallier@bootlin.com>
References: <20250921160419.333427-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_090737_733245_A6DF6ED6 
X-CRM114-Status: GOOD (  15.45  )
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

Convert the Marvell driver (especially the 88e1512 driver) to use the
phy_port interface to handle SFPs. This means registering a
.attach_port() handler to detect when a serdes line interface is used
(most likely, and SFP module).

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Tested-by: Oleksij Rempel <o.rempel@pengutronix.de>
Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/marvell.c | 94 ++++++++++++++-------------------------
 1 file changed, 33 insertions(+), 61 deletions(-)

diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index 0ea366c1217e..542166cfcb23 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -29,10 +29,10 @@
 #include <linux/ethtool.h>
 #include <linux/ethtool_netlink.h>
 #include <linux/phy.h>
+#include <linux/phy_port.h>
 #include <linux/marvell_phy.h>
 #include <linux/bitfield.h>
 #include <linux/of.h>
-#include <linux/sfp.h>
 
 #include <linux/io.h>
 #include <asm/irq.h>
@@ -3598,42 +3598,38 @@ static int marvell_probe(struct phy_device *phydev)
 	return marvell_hwmon_probe(phydev);
 }
 
-static int m88e1510_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
+static int m88e1510_port_configure_serdes(struct phy_port *port, bool enable,
+					  phy_interface_t interface)
 {
-	DECLARE_PHY_INTERFACE_MASK(interfaces);
-	struct phy_device *phydev = upstream;
-	phy_interface_t interface;
+	struct phy_device *phydev = port_phydev(port);
 	struct device *dev;
 	int oldpage;
 	int ret = 0;
 	u16 mode;
 
-	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported) = { 0, };
-
 	dev = &phydev->mdio.dev;
 
-	sfp_parse_support(phydev->sfp_bus, id, supported, interfaces);
-	interface = sfp_select_interface(phydev->sfp_bus, supported);
+	if (enable) {
+		switch (interface) {
+		case PHY_INTERFACE_MODE_1000BASEX:
+			mode = MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_1000X;
 
-	dev_info(dev, "%s SFP module inserted\n", phy_modes(interface));
+			break;
+		case PHY_INTERFACE_MODE_100BASEX:
+			mode = MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_100FX;
 
-	switch (interface) {
-	case PHY_INTERFACE_MODE_1000BASEX:
-		mode = MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_1000X;
+			break;
+		case PHY_INTERFACE_MODE_SGMII:
+			mode = MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_SGMII;
 
-		break;
-	case PHY_INTERFACE_MODE_100BASEX:
-		mode = MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_100FX;
+			break;
+		default:
+			dev_err(dev, "Incompatible SFP module inserted\n");
 
-		break;
-	case PHY_INTERFACE_MODE_SGMII:
-		mode = MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_SGMII;
-
-		break;
-	default:
-		dev_err(dev, "Incompatible SFP module inserted\n");
-
-		return -EINVAL;
+			return -EINVAL;
+		}
+	} else {
+		mode = MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII;
 	}
 
 	oldpage = phy_select_page(phydev, MII_MARVELL_MODE_PAGE);
@@ -3650,49 +3646,24 @@ static int m88e1510_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
 
 error:
 	return phy_restore_page(phydev, oldpage, ret);
-}
-
-static void m88e1510_sfp_remove(void *upstream)
-{
-	struct phy_device *phydev = upstream;
-	int oldpage;
-	int ret = 0;
-
-	oldpage = phy_select_page(phydev, MII_MARVELL_MODE_PAGE);
-	if (oldpage < 0)
-		goto error;
-
-	ret = __phy_modify(phydev, MII_88E1510_GEN_CTRL_REG_1,
-			   MII_88E1510_GEN_CTRL_REG_1_MODE_MASK,
-			   MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII);
-	if (ret < 0)
-		goto error;
-
-	ret = __phy_set_bits(phydev, MII_88E1510_GEN_CTRL_REG_1,
-			     MII_88E1510_GEN_CTRL_REG_1_RESET);
 
-error:
-	phy_restore_page(phydev, oldpage, ret);
+	return 0;
 }
 
-static const struct sfp_upstream_ops m88e1510_sfp_ops = {
-	.module_insert = m88e1510_sfp_insert,
-	.module_remove = m88e1510_sfp_remove,
-	.attach = phy_sfp_attach,
-	.detach = phy_sfp_detach,
-	.connect_phy = phy_sfp_connect_phy,
-	.disconnect_phy = phy_sfp_disconnect_phy,
+static const struct phy_port_ops m88e1510_serdes_port_ops = {
+	.configure_mii = m88e1510_port_configure_serdes,
 };
 
-static int m88e1510_probe(struct phy_device *phydev)
+static int m88e1510_attach_mii_port(struct phy_device *phy_device,
+				    struct phy_port *port)
 {
-	int err;
+	port->ops = &m88e1510_serdes_port_ops;
 
-	err = marvell_probe(phydev);
-	if (err)
-		return err;
+	__set_bit(PHY_INTERFACE_MODE_SGMII, port->interfaces);
+	__set_bit(PHY_INTERFACE_MODE_1000BASEX, port->interfaces);
+	__set_bit(PHY_INTERFACE_MODE_100BASEX, port->interfaces);
 
-	return phy_sfp_probe(phydev, &m88e1510_sfp_ops);
+	return 0;
 }
 
 static struct phy_driver marvell_drivers[] = {
@@ -3952,7 +3923,7 @@ static struct phy_driver marvell_drivers[] = {
 		.driver_data = DEF_MARVELL_HWMON_OPS(m88e1510_hwmon_ops),
 		.features = PHY_GBIT_FIBRE_FEATURES,
 		.flags = PHY_POLL_CABLE_TEST,
-		.probe = m88e1510_probe,
+		.probe = marvell_probe,
 		.config_init = m88e1510_config_init,
 		.config_aneg = m88e1510_config_aneg,
 		.read_status = marvell_read_status,
@@ -3978,6 +3949,7 @@ static struct phy_driver marvell_drivers[] = {
 		.led_hw_is_supported = m88e1318_led_hw_is_supported,
 		.led_hw_control_set = m88e1318_led_hw_control_set,
 		.led_hw_control_get = m88e1318_led_hw_control_get,
+		.attach_mii_port = m88e1510_attach_mii_port,
 	},
 	{
 		.phy_id = MARVELL_PHY_ID_88E1540,
-- 
2.49.0


