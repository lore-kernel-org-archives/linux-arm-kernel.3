Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DC2C8302B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 14:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A4OPGBP0ioQgK91ZTo6UXh9dEEPgBw7dj+Zlt2Z1cwo=; b=IhRuo6rzPTcN3/3uXA8V12hLOq
	8qfM9lQ8mjvLUnLsv5XchVKzCf+iYNWNHv3uOuGGNvR2dpdCbG6WHoENnFz81Y0e3SzrjroeJwWYO
	Ke75oX0ro3IT7GNv0n1FF2T2n9Yoeu+E5xYjG39TjsCkE8UQvPxUCAtxrQQOZvtQZJlQ7tuTWjvjY
	zd2a95FvICX4As6DXJDM3A3sRx6rVq9y1kLjgyUxm88uEDOcei5fFjn/djDhcM7wKafVBWruU9fOS
	eDejWHgvp+13ZqYKNgyHQ1H8V2lPJ9KzZGQflJxoihL8kaDCeBgwc5rPgN5uQdOewYJL75eewMQsB
	vYiUP0wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWFyn-00000002fZY-3Mon;
	Mon, 30 Jun 2025 14:59:33 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWFZj-00000002aGA-3EKJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 14:33:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A29F74430D;
	Mon, 30 Jun 2025 14:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751294018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A4OPGBP0ioQgK91ZTo6UXh9dEEPgBw7dj+Zlt2Z1cwo=;
	b=GjXIFDh5Y9hpTMFy1q2YguW3o/4iIA9Vh6KvX/i83Qi+lZwssEcAZ4rz0Iy75AvAFgUg5a
	97fvXXb6KR+R1ueONhkub5QopZYO9P3wS8fM2CDFDOSfaQgyYbdk7l1nK3qardIIsRQKir
	qojix4d2OHVtrBP5PvC1BduhIZgtivu2uO9qj02+b2mDeAqD8DrNuPCyLcpRPWSIOX8lOW
	olXDht1lxZ/G8kJ3w/9AYfsh3UXmmUe4heaxiG53pEuIxM2hsLG9PQzB+KkRc6w1x2bZPM
	OClG5UwGJX4NTsdtrzst2Jc5HMh4a5jEQbt4V/JiZ/BMAtz+3QrAHfLgxES0rA==
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
Subject: [PATCH net-next v7 10/15] net: phy: marvell10g: Support SFP through phy_port
Date: Mon, 30 Jun 2025 16:33:09 +0200
Message-ID: <20250630143315.250879-11-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630143315.250879-1-maxime.chevallier@bootlin.com>
References: <20250630143315.250879-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgedtffelffelveeuleelgfejfeevvdejhfehgeefgfffvdefteegvedutefftdenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefuddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_073339_965985_585D52E6 
X-CRM114-Status: GOOD (  18.56  )
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

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/marvell10g.c | 47 +++++++++++++++++++-----------------
 drivers/net/phy/phy_port.c   | 20 +++++++++++++++
 include/linux/phy_port.h     |  1 +
 3 files changed, 46 insertions(+), 22 deletions(-)

diff --git a/drivers/net/phy/marvell10g.c b/drivers/net/phy/marvell10g.c
index 13e81dff42c1..7cb638804a3f 100644
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
@@ -463,36 +463,31 @@ static int mv3310_set_edpd(struct phy_device *phydev, u16 edpd)
 	return err;
 }
 
-static int mv3310_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
+static int mv3310_attach_port(struct phy_device *phydev, struct phy_port *port)
 {
-	struct phy_device *phydev = upstream;
-	__ETHTOOL_DECLARE_LINK_MODE_MASK(support) = { 0, };
-	DECLARE_PHY_INTERFACE_MASK(interfaces);
-	phy_interface_t iface;
-
-	sfp_parse_support(phydev->sfp_bus, id, support, interfaces);
-	iface = sfp_select_interface(phydev->sfp_bus, support);
-
-	if (iface != PHY_INTERFACE_MODE_10GBASER) {
-		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted\n");
-		return -EINVAL;
+	if (port->is_mii) {
+		__set_bit(PHY_INTERFACE_MODE_10GBASER, port->interfaces);
+	} else if (port->not_described) {
+		/* This PHY can do combo-ports, i.e. 2 MDI outputs, usually one
+		 * of them going to an SFP and the other one to a RJ45
+		 * connector. If we don't have any representation for the port
+		 * in DT, and we are dealing with a non-SFP port, then we
+		 * mask the port's capabilities to report BaseT-only modes
+		 */
+		port->mediums = BIT(ETHTOOL_LINK_MEDIUM_BASET);
+
+		phy_port_filter_supported(port);
 	}
+
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
@@ -543,9 +538,13 @@ static int mv3310_probe(struct phy_device *phydev)
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
@@ -1406,6 +1405,7 @@ static struct phy_driver mv3310_drivers[] = {
 		.set_loopback	= genphy_c45_loopback,
 		.get_wol	= mv3110_get_wol,
 		.set_wol	= mv3110_set_wol,
+		.attach_port	= mv3310_attach_port,
 	},
 	{
 		.phy_id		= MARVELL_PHY_ID_88X3310,
@@ -1425,6 +1425,7 @@ static struct phy_driver mv3310_drivers[] = {
 		.set_tunable	= mv3310_set_tunable,
 		.remove		= mv3310_remove,
 		.set_loopback	= genphy_c45_loopback,
+		.attach_port	= mv3310_attach_port,
 	},
 	{
 		.phy_id		= MARVELL_PHY_ID_88E2110,
@@ -1445,6 +1446,7 @@ static struct phy_driver mv3310_drivers[] = {
 		.set_loopback	= genphy_c45_loopback,
 		.get_wol	= mv3110_get_wol,
 		.set_wol	= mv3110_set_wol,
+		.attach_port	= mv3310_attach_port,
 	},
 	{
 		.phy_id		= MARVELL_PHY_ID_88E2110,
@@ -1463,6 +1465,7 @@ static struct phy_driver mv3310_drivers[] = {
 		.set_tunable	= mv3310_set_tunable,
 		.remove		= mv3310_remove,
 		.set_loopback	= genphy_c45_loopback,
+		.attach_port	= mv3310_attach_port,
 	},
 };
 
diff --git a/drivers/net/phy/phy_port.c b/drivers/net/phy/phy_port.c
index 2c5ae947d759..c27dacda259a 100644
--- a/drivers/net/phy/phy_port.c
+++ b/drivers/net/phy/phy_port.c
@@ -134,6 +134,26 @@ void phy_port_update_supported(struct phy_port *port)
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
+void phy_port_filter_supported(struct phy_port *port)
+{
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported) = { 0 };
+	int i;
+
+	for_each_set_bit(i, &port->mediums, __ETHTOOL_LINK_MEDIUM_LAST)
+		phy_caps_medium_get_supported(supported, i, port->lanes);
+
+	linkmode_and(port->supported, port->supported, supported);
+}
+EXPORT_SYMBOL_GPL(phy_port_filter_supported);
+
 /**
  * phy_port_get_type() - get the PORT_* attribut for that port.
  * @port: The port we want the information from
diff --git a/include/linux/phy_port.h b/include/linux/phy_port.h
index f47ac5f5ef9e..ce735d81bcd0 100644
--- a/include/linux/phy_port.h
+++ b/include/linux/phy_port.h
@@ -90,6 +90,7 @@ static inline bool phy_port_is_fiber(struct phy_port *port)
 }
 
 void phy_port_update_supported(struct phy_port *port);
+void phy_port_filter_supported(struct phy_port *port);
 
 int phy_port_get_type(struct phy_port *port);
 
-- 
2.49.0


