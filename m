Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BD6C83F37
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 08:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7gNgiyMv2bSdDu5VMOx6z036osR1pFqt9yiUokhcsoo=; b=sVgMLbbizZPpCGo3Ae1Vk4CM+S
	QARr9Vd2oRnohooCu95Fu+49ROJoaAa59IRFjgwRA2muh773Dp+UU6L1tC4qmou1KaBRFHU3C49DX
	DNuI64+0mP33gHyV/sFAzsqsxc0gHqmWMaF/axiAn+NccfcXMVyzF37CU3I+/DlwzARaWLFR12FYs
	YPHrGObP5uCznd/JWfeYIC2TnOo4/UfKSuQEOgDzWFmowSBPq/ItPwTYrd+6gffns6GDmeGdrBhFP
	59aPr7DkzIQH55850EmTnvqAnxB10NgaU0DOaDrdeOXCT53PqywaC9i5spNy4Q/dma5lIWH6iT5HR
	0z1kWX7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucK3N-00000009Zzg-0yFU;
	Thu, 17 Jul 2025 08:33:21 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucJ4l-00000009S5t-2w7l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 07:30:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D348E443F0;
	Thu, 17 Jul 2025 07:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752737442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7gNgiyMv2bSdDu5VMOx6z036osR1pFqt9yiUokhcsoo=;
	b=hRYKzqxVbhocKsFTqNofFZ0QOBEkSXzQkR+0A/alMft7yH7hrwXQxXtkD+GTSd2rgxOfGd
	BaAdHOryHiKxsDaEFZlSn8tURKcIlBXBSwE7qsDaw+05iP1qehnUKoJ+nBfZreVhM8X7fN
	B+v7/amCaSJbOJJb4A/RpKHA1Cg+Hw+k8Bts42eoDUWV/fNUcbwceesg8/jSY2MO5HDjEd
	g41ag+kowaqJtpelJPMP+wwZQeQ5URrA3dicbQTw4PuTm2o4m6nxv+N+qUBHG3Xo6qR6+Q
	LdNNnYtJIHa8iO09HvDpJgHB7vqjbksaEDlI65q37J8XVsH1g1nq3fb7fELeIQ==
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
Subject: [PATCH net-next v9 11/15] net: phy: at803x: Support SFP through phy_port interface
Date: Thu, 17 Jul 2025 09:30:15 +0200
Message-ID: <20250717073020.154010-12-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250717073020.154010-1-maxime.chevallier@bootlin.com>
References: <20250717073020.154010-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehleellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgedtffelffelveeuleelgfejfeevvdejhfehgeefgfffvdefteegvedutefftdenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpeelnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefuddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_003045_396608_668687B9 
X-CRM114-Status: GOOD (  18.07  )
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

Convert the at803x driver to use the generic phylib SFP handling, via a
dedicated .attach_port() callback, populating the supported interfaces.

As these devices are limited to 1000BaseX, a workaround is used to also
support, in a very limited way, copper modules. This is done by
supporting SGMII but limiting it to 1G full duplex (in which case it's
somwhat compatible with 1000BaseX).

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/qcom/at803x.c | 64 ++++++++++-------------------------
 1 file changed, 17 insertions(+), 47 deletions(-)

diff --git a/drivers/net/phy/qcom/at803x.c b/drivers/net/phy/qcom/at803x.c
index 51a132242462..526c88051487 100644
--- a/drivers/net/phy/qcom/at803x.c
+++ b/drivers/net/phy/qcom/at803x.c
@@ -20,7 +20,7 @@
 #include <linux/of.h>
 #include <linux/phylink.h>
 #include <linux/reset.h>
-#include <linux/sfp.h>
+#include <linux/phy_port.h>
 #include <dt-bindings/net/qca-ar803x.h>
 
 #include "qcom.h"
@@ -769,58 +769,28 @@ static int at8031_register_regulators(struct phy_device *phydev)
 	return 0;
 }
 
-static int at8031_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
+static int at8031_attach_port(struct phy_device *phydev, struct phy_port *port)
 {
-	struct phy_device *phydev = upstream;
-	__ETHTOOL_DECLARE_LINK_MODE_MASK(phy_support);
-	__ETHTOOL_DECLARE_LINK_MODE_MASK(sfp_support);
-	DECLARE_PHY_INTERFACE_MASK(interfaces);
-	phy_interface_t iface;
-
-	linkmode_zero(phy_support);
-	phylink_set(phy_support, 1000baseX_Full);
-	phylink_set(phy_support, 1000baseT_Full);
-	phylink_set(phy_support, Autoneg);
-	phylink_set(phy_support, Pause);
-	phylink_set(phy_support, Asym_Pause);
-
-	linkmode_zero(sfp_support);
-	sfp_parse_support(phydev->sfp_bus, id, sfp_support, interfaces);
-	/* Some modules support 10G modes as well as others we support.
-	 * Mask out non-supported modes so the correct interface is picked.
-	 */
-	linkmode_and(sfp_support, phy_support, sfp_support);
-
-	if (linkmode_empty(sfp_support)) {
-		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted\n");
-		return -EINVAL;
-	}
+	if (!port->is_mii)
+		return 0;
 
-	iface = sfp_select_interface(phydev->sfp_bus, sfp_support);
+	linkmode_zero(port->supported);
+	phylink_set(port->supported, 1000baseX_Full);
+	phylink_set(port->supported, 1000baseT_Full);
+	phylink_set(port->supported, Autoneg);
+	phylink_set(port->supported, Pause);
+	phylink_set(port->supported, Asym_Pause);
 
-	/* Only 1000Base-X is supported by AR8031/8033 as the downstream SerDes
-	 * interface for use with SFP modules.
-	 * However, some copper modules detected as having a preferred SGMII
-	 * interface do default to and function in 1000Base-X mode, so just
-	 * print a warning and allow such modules, as they may have some chance
-	 * of working.
+	/* This device doesn't really support SGMII. However, do our best
+	 * to be compatible with copper modules (that usually require SGMII),
+	 * in a degraded mode as we only allow 1000BaseT Full
 	 */
-	if (iface == PHY_INTERFACE_MODE_SGMII)
-		dev_warn(&phydev->mdio.dev, "module may not function if 1000Base-X not supported\n");
-	else if (iface != PHY_INTERFACE_MODE_1000BASEX)
-		return -EINVAL;
+	__set_bit(PHY_INTERFACE_MODE_SGMII, port->interfaces);
+	__set_bit(PHY_INTERFACE_MODE_1000BASEX, port->interfaces);
 
 	return 0;
 }
 
-static const struct sfp_upstream_ops at8031_sfp_ops = {
-	.attach = phy_sfp_attach,
-	.detach = phy_sfp_detach,
-	.module_insert = at8031_sfp_insert,
-	.connect_phy = phy_sfp_connect_phy,
-	.disconnect_phy = phy_sfp_disconnect_phy,
-};
-
 static int at8031_parse_dt(struct phy_device *phydev)
 {
 	struct device_node *node = phydev->mdio.dev.of_node;
@@ -841,8 +811,7 @@ static int at8031_parse_dt(struct phy_device *phydev)
 		return ret;
 	}
 
-	/* Only AR8031/8033 support 1000Base-X for SFP modules */
-	return phy_sfp_probe(phydev, &at8031_sfp_ops);
+	return 0;
 }
 
 static int at8031_probe(struct phy_device *phydev)
@@ -1173,6 +1142,7 @@ static struct phy_driver at803x_driver[] = {
 	.set_tunable		= at803x_set_tunable,
 	.cable_test_start	= at8031_cable_test_start,
 	.cable_test_get_status	= at8031_cable_test_get_status,
+	.attach_port		= at8031_attach_port,
 }, {
 	/* Qualcomm Atheros AR8032 */
 	PHY_ID_MATCH_EXACT(ATH8032_PHY_ID),
-- 
2.49.0


