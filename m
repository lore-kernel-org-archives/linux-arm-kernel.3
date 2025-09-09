Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DA4CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rRRw+QZoWFzbCFwAfXxX8Upx0XxhhxL6zjKX6dIb29k=; b=yo1tBrRMtTIstt6Kj3KLPz4WXD
	6qSpUWz4Aat9OEhY5o1QZLx50vwP9uQJlxjPdnUm7O5ukhzSbTW087kkRlOIsQWdzawux9fgHeuSb
	UQuxSWF3mI/OzwXG8uVQ5OG4ztLNXCnjnaYRvEHxh7NQRl5m7BiyRQE9UFiTxZiX1+ggO1XBut1Ih
	aC3Dg5ewFXIq/9YpI1EUN85vRTeJEt4dtv5X1Mq47ShJSXHzVHDV9JN7jlTR355EluLKveM0xNWfo
	L8U/6Fiaj59hbyVCpXmRtMiLzxPsyBL/A6gZ12tRXpYdai1DClI9dhQfaQ/zobLE1RDR1CrZ5pxGZ
	V7iToZIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw23q-000000090UF-3ROc;
	Tue, 09 Sep 2025 17:23:18 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0GM-000000083rv-1Dv5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 15:28:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 01487C6B394;
	Tue,  9 Sep 2025 15:27:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB06C60630;
	Tue,  9 Sep 2025 15:28:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D496102F29C5;
	Tue,  9 Sep 2025 17:28:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757431683; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=rRRw+QZoWFzbCFwAfXxX8Upx0XxhhxL6zjKX6dIb29k=;
	b=CNY9j+kZotl/aYwFELJ2FPCNGm+huzD7Sn4qfu2PH9HbR7vWu61dTX2uwy7+mCtrIukap+
	+Wb8e8HDD+2/Hdi4nQbx1XWNzp2A2PJJdedNDdLuElYBgDlsox7xhTzuDTMHs56nbbZGYJ
	twfVB8RNuVaLFIxhrv1/I9pgDZdCVReFyckyxxc3vi5PHCG3j5x7GneADXe4Xbj/ePU3pO
	yCRMJu12+0h0IhTlUxWFB+iirSSuzX68pRaSkvtsYM2M1iSIYLpWnnJCzERKQScATNrPso
	9jzM1MrAzkNw3TdBKsdV9MvW/iPux6Mu8P7gQE10ixlmA4JSimBMj+8TAxqkKA==
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
Subject: [PATCH net-next v12 14/18] net: phy: at803x: Support SFP through phy_port interface
Date: Tue,  9 Sep 2025 17:26:10 +0200
Message-ID: <20250909152617.119554-15-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250909152617.119554-1-maxime.chevallier@bootlin.com>
References: <20250909152617.119554-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_082806_721970_57D158FD 
X-CRM114-Status: GOOD (  18.94  )
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
somewhat compatible with 1000BaseX).

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/qcom/at803x.c | 78 ++++++++++++++---------------------
 1 file changed, 32 insertions(+), 46 deletions(-)

diff --git a/drivers/net/phy/qcom/at803x.c b/drivers/net/phy/qcom/at803x.c
index 51a132242462..2995b08bac96 100644
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
@@ -769,58 +769,44 @@ static int at8031_register_regulators(struct phy_device *phydev)
 	return 0;
 }
 
-static int at8031_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
+static int at803x_configure_mii(struct phy_port *port, bool enable,
+				phy_interface_t interface)
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
+	struct phy_device *phydev = port_phydev(port);
 
-	if (linkmode_empty(sfp_support)) {
-		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted\n");
-		return -EINVAL;
-	}
+	if (interface == PHY_INTERFACE_MODE_SGMII)
+		dev_warn(&phydev->mdio.dev,
+			 "module may not function if 1000Base-X not supported\n");
+
+	return 0;
+}
 
-	iface = sfp_select_interface(phydev->sfp_bus, sfp_support);
+static const struct phy_port_ops at803x_port_ops = {
+	.configure_mii = at803x_configure_mii,
+};
 
-	/* Only 1000Base-X is supported by AR8031/8033 as the downstream SerDes
-	 * interface for use with SFP modules.
-	 * However, some copper modules detected as having a preferred SGMII
-	 * interface do default to and function in 1000Base-X mode, so just
-	 * print a warning and allow such modules, as they may have some chance
-	 * of working.
+static int at8031_attach_mii_port(struct phy_device *phydev,
+				  struct phy_port *port)
+{
+	linkmode_zero(port->supported);
+	phylink_set(port->supported, 1000baseX_Full);
+	phylink_set(port->supported, 1000baseT_Full);
+	phylink_set(port->supported, Autoneg);
+	phylink_set(port->supported, Pause);
+	phylink_set(port->supported, Asym_Pause);
+
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
+
+	port->ops = &at803x_port_ops;
 
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
@@ -841,8 +827,7 @@ static int at8031_parse_dt(struct phy_device *phydev)
 		return ret;
 	}
 
-	/* Only AR8031/8033 support 1000Base-X for SFP modules */
-	return phy_sfp_probe(phydev, &at8031_sfp_ops);
+	return 0;
 }
 
 static int at8031_probe(struct phy_device *phydev)
@@ -1173,6 +1158,7 @@ static struct phy_driver at803x_driver[] = {
 	.set_tunable		= at803x_set_tunable,
 	.cable_test_start	= at8031_cable_test_start,
 	.cable_test_get_status	= at8031_cable_test_get_status,
+	.attach_mii_port	= at8031_attach_mii_port,
 }, {
 	/* Qualcomm Atheros AR8032 */
 	PHY_ID_MATCH_EXACT(ATH8032_PHY_ID),
-- 
2.49.0


