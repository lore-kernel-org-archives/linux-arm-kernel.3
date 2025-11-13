Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345DCCD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 08:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZAdUsMMAbDkmdGZpb63n72H7VtVngyyel/vsdyhMRmw=; b=OZgpN+zb7rUPT50YiHGt+E8GLL
	WZEHp56J1aD/KEuWx7eZSFnwiwRlRpBwJ19BjOxYqupPVWARIOvWTa3hD8lbRVVMcBoZcRKzXcD5X
	yg4n994UGtcDq/QA1Uy3nhUDlFZglaRXCAt4zzxG6C4l68l/0IzMQNGyXaMsHVBCPXsC/JUo1hUrg
	fnsqnZQufnwAlHvt6uC4Hkj837peFQb57bLM4LVQW4R3qSOIf1E9a+3eT5cI6MXUHzC3kUhMlIk6J
	+K1VH7xx7ddBCsvycW0DW+SbXdPggrXVSYHk5a27y7chI+3emXAr1gdIS1XnibMQbYNh/cDI6iuUH
	zH+gUz0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJSTu-0000000A47D-3QSv;
	Thu, 13 Nov 2025 08:15:02 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJSTp-0000000A3zL-0kUB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 08:15:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7C9AF4E41682;
	Thu, 13 Nov 2025 08:14:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 504436068C;
	Thu, 13 Nov 2025 08:14:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 478A9102F1BFF;
	Thu, 13 Nov 2025 09:14:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763021693; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZAdUsMMAbDkmdGZpb63n72H7VtVngyyel/vsdyhMRmw=;
	b=V0Gy+JL0FVVdGH72FZ6aS/uV6AOcoeTBHYrgLZLYitMRKb5yo2VfE/48J0LFtk7urpfize
	kLQwOX4GIL/ukb69ldUCkSbhrPhVhzaOWG+DJkCI+y3pg6EmbEgcrfb7af8pG3qUFwA8ZN
	ZhuLZTB0+sV7VjpNi3DRMIj0isxCLx4aSr5iwnTHhxVj4Vgcbk1t2X2vRPDyTC5Z31DwnZ
	nwRj5HecpdI4smV20zDkhpMP5bJGVOS4WGCfP8HWuJxNaXsexNB90mq8smVzPlXZeD8Qt4
	yfiRO1rYNNpZ7w6aGiyVUjDabpgLFe5N6Gqu3UCygEiQYN9g4kbhSdXbXSTdIw==
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
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: [PATCH net-next v16 10/15] net: phy: marvell10g: Support SFP through phy_port
Date: Thu, 13 Nov 2025 09:14:12 +0100
Message-ID: <20251113081418.180557-11-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251113081418.180557-1-maxime.chevallier@bootlin.com>
References: <20251113081418.180557-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_001457_541162_3654EB8C 
X-CRM114-Status: GOOD (  20.30  )
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

Convert the Marvell10G driver to use the generic SFP handling, through a
dedicated .attach_port() handler to populate the port's supported
interfaces.

As the 88x3310 supports multiple MDI, the .attach_port() logic handles
both SFP attach with 10GBaseR support, and support for the "regular"
port that usually is a BaseT port.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/marvell10g.c | 52 ++++++++++++++++++++++--------------
 drivers/net/phy/phy_port.c   | 44 ++++++++++++++++++++++++++++++
 include/linux/phy_port.h     |  1 +
 3 files changed, 77 insertions(+), 20 deletions(-)

diff --git a/drivers/net/phy/marvell10g.c b/drivers/net/phy/marvell10g.c
index 8fd42131cdbf..d4cace758fe8 100644
--- a/drivers/net/phy/marvell10g.c
+++ b/drivers/net/phy/marvell10g.c
@@ -28,7 +28,7 @@
 #include <linux/hwmon.h>
 #include <linux/marvell_phy.h>
 #include <linux/phy.h>
-#include <linux/sfp.h>
+#include <linux/phy_port.h>
 #include <linux/netdevice.h>
 
 #define MV_PHY_ALASKA_NBT_QUIRK_MASK	0xfffffffe
@@ -463,35 +463,35 @@ static int mv3310_set_edpd(struct phy_device *phydev, u16 edpd)
 	return err;
 }
 
-static int mv3310_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
+static int mv3310_attach_mii_port(struct phy_device *phydev,
+				  struct phy_port *port)
 {
-	struct phy_device *phydev = upstream;
-	const struct sfp_module_caps *caps;
-	phy_interface_t iface;
+	__set_bit(PHY_INTERFACE_MODE_10GBASER, port->interfaces);
+	return 0;
+}
 
-	caps = sfp_get_module_caps(phydev->sfp_bus);
-	iface = sfp_select_interface(phydev->sfp_bus, caps->link_modes);
+static int mv3310_attach_mdi_port(struct phy_device *phydev,
+				  struct phy_port *port)
+{
+	/* This PHY can do combo-ports, i.e. 2 MDI outputs, usually one
+	 * of them going to an SFP and the other one to a RJ45
+	 * connector. If we don't have any representation for the port
+	 * in DT, and we are dealing with a non-SFP port, then we
+	 * mask the port's capabilities to report BaseT-only modes
+	 */
+	if (port->not_described)
+		return phy_port_restrict_mediums(port,
+						 BIT(ETHTOOL_LINK_MEDIUM_BASET));
 
-	if (iface != PHY_INTERFACE_MODE_10GBASER) {
-		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted\n");
-		return -EINVAL;
-	}
 	return 0;
 }
 
-static const struct sfp_upstream_ops mv3310_sfp_ops = {
-	.attach = phy_sfp_attach,
-	.detach = phy_sfp_detach,
-	.connect_phy = phy_sfp_connect_phy,
-	.disconnect_phy = phy_sfp_disconnect_phy,
-	.module_insert = mv3310_sfp_insert,
-};
-
 static int mv3310_probe(struct phy_device *phydev)
 {
 	const struct mv3310_chip *chip = to_mv3310_chip(phydev);
 	struct mv3310_priv *priv;
 	u32 mmd_mask = MDIO_DEVS_PMAPMD | MDIO_DEVS_AN;
+	DECLARE_PHY_INTERFACE_MASK(interfaces);
 	int ret;
 
 	if (!phydev->is_c45 ||
@@ -542,9 +542,13 @@ static int mv3310_probe(struct phy_device *phydev)
 	if (ret)
 		return ret;
 
+	__set_bit(PHY_INTERFACE_MODE_10GBASER, interfaces);
+
 	chip->init_supported_interfaces(priv->supported_interfaces);
 
-	return phy_sfp_probe(phydev, &mv3310_sfp_ops);
+	phydev->max_n_ports = 2;
+
+	return 0;
 }
 
 static void mv3310_remove(struct phy_device *phydev)
@@ -1405,6 +1409,8 @@ static struct phy_driver mv3310_drivers[] = {
 		.set_loopback	= genphy_c45_loopback,
 		.get_wol	= mv3110_get_wol,
 		.set_wol	= mv3110_set_wol,
+		.attach_mii_port = mv3310_attach_mii_port,
+		.attach_mdi_port = mv3310_attach_mdi_port,
 	},
 	{
 		.phy_id		= MARVELL_PHY_ID_88X3310,
@@ -1424,6 +1430,8 @@ static struct phy_driver mv3310_drivers[] = {
 		.set_tunable	= mv3310_set_tunable,
 		.remove		= mv3310_remove,
 		.set_loopback	= genphy_c45_loopback,
+		.attach_mii_port = mv3310_attach_mii_port,
+		.attach_mdi_port = mv3310_attach_mdi_port,
 	},
 	{
 		.phy_id		= MARVELL_PHY_ID_88E2110,
@@ -1444,6 +1452,8 @@ static struct phy_driver mv3310_drivers[] = {
 		.set_loopback	= genphy_c45_loopback,
 		.get_wol	= mv3110_get_wol,
 		.set_wol	= mv3110_set_wol,
+		.attach_mii_port = mv3310_attach_mii_port,
+		.attach_mdi_port = mv3310_attach_mdi_port,
 	},
 	{
 		.phy_id		= MARVELL_PHY_ID_88E2110,
@@ -1462,6 +1472,8 @@ static struct phy_driver mv3310_drivers[] = {
 		.set_tunable	= mv3310_set_tunable,
 		.remove		= mv3310_remove,
 		.set_loopback	= genphy_c45_loopback,
+		.attach_mii_port = mv3310_attach_mii_port,
+		.attach_mdi_port = mv3310_attach_mdi_port,
 	},
 };
 
diff --git a/drivers/net/phy/phy_port.c b/drivers/net/phy/phy_port.c
index f89f70f83593..d9099196f870 100644
--- a/drivers/net/phy/phy_port.c
+++ b/drivers/net/phy/phy_port.c
@@ -149,6 +149,50 @@ void phy_port_update_supported(struct phy_port *port)
 }
 EXPORT_SYMBOL_GPL(phy_port_update_supported);
 
+/**
+ * phy_port_filter_supported() - Make sure that port->supported match port->mediums
+ * @port: The port to filter
+ *
+ * After updating a port's mediums to a more restricted subset, this helper will
+ * make sure that port->supported only contains linkmodes that are compatible
+ * with port->mediums.
+ */
+static void phy_port_filter_supported(struct phy_port *port)
+{
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported) = { 0 };
+	int i;
+
+	for_each_set_bit(i, &port->mediums, __ETHTOOL_LINK_MEDIUM_LAST)
+		phy_caps_medium_get_supported(supported, i, port->pairs);
+
+	linkmode_and(port->supported, port->supported, supported);
+}
+
+/**
+ * phy_port_restrict_mediums - Mask away some of the port's supported mediums
+ * @port: The port to act upon
+ * @mediums: A mask of mediums to support on the port
+ *
+ * This helper allows removing some mediums from a port's list of supported
+ * mediums, which occurs once we have enough information about the port to
+ * know its nature.
+ *
+ * Returns: 0 if the change was donne correctly, a negative value otherwise.
+ */
+int phy_port_restrict_mediums(struct phy_port *port, unsigned long mediums)
+{
+	/* We forbid ending-up with a port with empty mediums */
+	if (!(port->mediums & mediums))
+		return -EINVAL;
+
+	port->mediums &= mediums;
+
+	phy_port_filter_supported(port);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(phy_port_restrict_mediums);
+
 /**
  * phy_port_get_type() - get the PORT_* attribute for that port.
  * @port: The port we want the information from
diff --git a/include/linux/phy_port.h b/include/linux/phy_port.h
index 550c3f4ab19f..0ef0f5ce4709 100644
--- a/include/linux/phy_port.h
+++ b/include/linux/phy_port.h
@@ -92,6 +92,7 @@ static inline bool phy_port_is_fiber(struct phy_port *port)
 }
 
 void phy_port_update_supported(struct phy_port *port);
+int phy_port_restrict_mediums(struct phy_port *port, unsigned long mediums);
 
 int phy_port_get_type(struct phy_port *port);
 
-- 
2.49.0


