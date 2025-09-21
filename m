Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA10CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 16:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aCdaROwrKYW1ezIMIwki4DvnBp+nLnucaAuvytpMjJo=; b=j4Ltz+6zK2YS1AUvUZAhwsUGJ7
	fUfdatY3EkbgzkHvpMVr9D3jP763EDP71ok4IwU8kgzt4lW3v92+5K/YOxKGPGsZebA6rKCQPXq2Y
	OcRf4qZ8Rib6PvZcLNay38kgAcFjlkNvk58C0t8V3d64pC/iN2YaXE4BO3RFu6RWrD/JSfc0Mlnbq
	Ih2xIY2gSFLTtS96W7CjXdhLHpl1W2n5hhKxAx+sMWfdp9Kzj9p8dZAjlXdLzP/mSIV8vQYjPFKO1
	mUqWlU05xYM6Z0WGr3H2QnWbFQ5Mr2QIC9doZeG2fzk7VBGcLseJAj0WAxxdqds+fxiPH5bnXZFeY
	wlsaS0wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Mbb-00000007ifs-2xmg;
	Sun, 21 Sep 2025 16:08:03 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0MbQ-00000007iZV-3GNw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 16:07:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0E3841A0EF0;
	Sun, 21 Sep 2025 16:07:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D5E8F60634;
	Sun, 21 Sep 2025 16:07:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7718B102F17C4;
	Sun, 21 Sep 2025 18:07:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758470869; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=aCdaROwrKYW1ezIMIwki4DvnBp+nLnucaAuvytpMjJo=;
	b=KrWPYhIlXo92xySVTnFacEaKuMAa2W7qpkuNVOlo16oTr7E57DUqxeLtUKPAzrd9ULP4/B
	shGUGdhibdT+7imFuex/Mz1KBloXBNG+EdgbXPK93pZEsFXdK1yHXi6CwKgdyaa0fK/O8N
	jqAC7shm7vlxfCWDMJuSMeAl1hjCpMsqkLNexEb/Bmj5epB7IFtjWtkly7VZ/+NHZZDNlt
	XXCV5rUmeF8+GWut9lLin//UOtgdmX9yYF/oUu85zYzF/t6f8g98oSZGvJQfOVgKgjiiJU
	AlgeBCth+tRv0WzmjcUfAp6vApJSNGTzyDcDsM6V67pmiKiGv5Pg82C4+1he7Q==
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
Subject: [PATCH net-next v13 13/18] net: phy: marvell10g: Support SFP through phy_port
Date: Sun, 21 Sep 2025 21:34:11 +0530
Message-ID: <20250921160419.333427-14-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250921160419.333427-1-maxime.chevallier@bootlin.com>
References: <20250921160419.333427-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_090753_398799_45AABDB1 
X-CRM114-Status: GOOD (  19.26  )
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

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Tested-by: Oleksij Rempel <o.rempel@pengutronix.de>
Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/marvell10g.c | 54 ++++++++++++++++++++++--------------
 drivers/net/phy/phy_port.c   | 44 +++++++++++++++++++++++++++++
 include/linux/phy_port.h     |  1 +
 3 files changed, 78 insertions(+), 21 deletions(-)

diff --git a/drivers/net/phy/marvell10g.c b/drivers/net/phy/marvell10g.c
index 13e81dff42c1..833ea0c0dc22 100644
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
@@ -463,36 +463,36 @@ static int mv3310_set_edpd(struct phy_device *phydev, u16 edpd)
 	return err;
 }
 
-static int mv3310_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
+static int mv3310_attach_mii_port(struct phy_device *phydev,
+				  struct phy_port *port)
 {
-	struct phy_device *phydev = upstream;
-	__ETHTOOL_DECLARE_LINK_MODE_MASK(support) = { 0, };
-	DECLARE_PHY_INTERFACE_MASK(interfaces);
-	phy_interface_t iface;
-
-	sfp_parse_support(phydev->sfp_bus, id, support, interfaces);
-	iface = sfp_select_interface(phydev->sfp_bus, support);
+	__set_bit(PHY_INTERFACE_MODE_10GBASER, port->interfaces);
 
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
+
+	return 0;
+}
 
 static int mv3310_probe(struct phy_device *phydev)
 {
 	const struct mv3310_chip *chip = to_mv3310_chip(phydev);
 	struct mv3310_priv *priv;
 	u32 mmd_mask = MDIO_DEVS_PMAPMD | MDIO_DEVS_AN;
+	DECLARE_PHY_INTERFACE_MASK(interfaces);
 	int ret;
 
 	if (!phydev->is_c45 ||
@@ -543,9 +543,13 @@ static int mv3310_probe(struct phy_device *phydev)
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
@@ -1406,6 +1410,8 @@ static struct phy_driver mv3310_drivers[] = {
 		.set_loopback	= genphy_c45_loopback,
 		.get_wol	= mv3110_get_wol,
 		.set_wol	= mv3110_set_wol,
+		.attach_mii_port = mv3310_attach_mii_port,
+		.attach_mdi_port = mv3310_attach_mdi_port,
 	},
 	{
 		.phy_id		= MARVELL_PHY_ID_88X3310,
@@ -1425,6 +1431,8 @@ static struct phy_driver mv3310_drivers[] = {
 		.set_tunable	= mv3310_set_tunable,
 		.remove		= mv3310_remove,
 		.set_loopback	= genphy_c45_loopback,
+		.attach_mii_port = mv3310_attach_mii_port,
+		.attach_mdi_port = mv3310_attach_mdi_port,
 	},
 	{
 		.phy_id		= MARVELL_PHY_ID_88E2110,
@@ -1445,6 +1453,8 @@ static struct phy_driver mv3310_drivers[] = {
 		.set_loopback	= genphy_c45_loopback,
 		.get_wol	= mv3110_get_wol,
 		.set_wol	= mv3110_set_wol,
+		.attach_mii_port = mv3310_attach_mii_port,
+		.attach_mdi_port = mv3310_attach_mdi_port,
 	},
 	{
 		.phy_id		= MARVELL_PHY_ID_88E2110,
@@ -1463,6 +1473,8 @@ static struct phy_driver mv3310_drivers[] = {
 		.set_tunable	= mv3310_set_tunable,
 		.remove		= mv3310_remove,
 		.set_loopback	= genphy_c45_loopback,
+		.attach_mii_port = mv3310_attach_mii_port,
+		.attach_mdi_port = mv3310_attach_mdi_port,
 	},
 };
 
diff --git a/drivers/net/phy/phy_port.c b/drivers/net/phy/phy_port.c
index 6fecaa68350e..b1ba3e56c28d 100644
--- a/drivers/net/phy/phy_port.c
+++ b/drivers/net/phy/phy_port.c
@@ -131,6 +131,50 @@ void phy_port_update_supported(struct phy_port *port)
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
+		phy_caps_medium_get_supported(supported, i, port->lanes);
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
+ * Returns 0 if the change was donne correctly, a negative value otherwise.
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
index 053c35c70071..82f1992d2395 100644
--- a/include/linux/phy_port.h
+++ b/include/linux/phy_port.h
@@ -92,6 +92,7 @@ static inline bool phy_port_is_fiber(struct phy_port *port)
 }
 
 void phy_port_update_supported(struct phy_port *port);
+int phy_port_restrict_mediums(struct phy_port *port, unsigned long mediums);
 
 int phy_port_get_type(struct phy_port *port);
 
-- 
2.49.0


