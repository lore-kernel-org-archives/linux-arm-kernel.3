Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D296AC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 10:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tEc8s5XYvNyYiWPRv4Ddu9CTvlQupgpoRoXKkIoisBM=; b=DthLh4QWWBrpMeHwUw6xkz/cnT
	AwRqqW5QzNaHo7ecnU+wEESea8IPQL3wDG8jXv3Jbv59l1QOwFjd9EPJqpzvjee//Hxg9GV7FOBKU
	nt3tTe8l47VzZ0DY9yuG5NBM5t6vickLdEqm2TjOoIY7DoTYPeY9rdZ6eWlwslHr3upPYHkXJawJv
	TZbXnOnWH0UEBms8P3nsQ8I4Ycjg95QzgYaynyA6Ct5W5HtvdKNJvyb0Eew/WfmoBDyVMRcgOCDBF
	MjkeGebyDtDhakpMwBMp9zmTb4VcERRzv5vJSyKnfUD8qZSsok+acqvRw4wbjxIIUxUXbLQSPkojn
	IQkaooMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiWa9-0000000Ah0M-1NYp;
	Thu, 13 Feb 2025 10:36:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiWGp-0000000Ad1L-2OIM
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 13 Feb 2025 10:16:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tEc8s5XYvNyYiWPRv4Ddu9CTvlQupgpoRoXKkIoisBM=; b=jQe5ND/EwIcQ7BehnWqxkfHvGr
	jNsLUTNWLYTRMZnzCIGEq+5/WTpE77q1FG6n9fd3FExGhwgrKsstGx5/BwxovjlaBW+jiDYtkNHp5
	mqF/aIDKx5M6XYK+nquPt1/l8OCtthzF8hsQx1m1kLKs/uw54kHFgvpv0rl76UsnYvVps725+Ik2i
	ox6fQWyQaE05mDU53sdKa1n278FlImuiCDR5lBpZpUCLXQjsuLvxBXsyAzMKN2MeFYCPxiVC3b1oH
	FzhxD2lSL/s4Oo2qNNdrbaz2T4vChm1PaWV8kv0+0DTRDh7zrgErUUsefRsLkQ0+PNLRAaCAnFxqi
	xg/dd/dA==;
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiWGm-00000000xOD-1r89
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 10:16:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1BF354329B;
	Thu, 13 Feb 2025 10:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739441789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tEc8s5XYvNyYiWPRv4Ddu9CTvlQupgpoRoXKkIoisBM=;
	b=UzQDcIuzaTYy9TASoD/HwH9wAP7CVaDmafebpK4MqAwxRb2wzPhxGH9cnWEjClrIArXUmw
	Oq/CK96bJZa/mAVsl0Haq1AFabBxKNnXVAylgVWaTu2aPuts5qyv5dP7r97azNL8F7l8O8
	biLPkISahOYdBG+/3VRomDR1xcSV0itW1agklcrcq6p7PvgEX39fUhydKFmNLCVtJnQMA7
	uSr7NsyCDwx1fhDAU+fT7nKMsIRkfVbzrePfNonSGt1+LqSny22e/MtgClZHrfC8OKvaiw
	D+khEsykSmdhMRHx/9OS1noKmfVhSSARu+3+Mggy1UoP2y+tNkkM+CD8v80YJw==
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
	Sean Anderson <seanga2@gmail.com>
Subject: [PATCH net-next v4 11/15] net: phy: qca807x: Support SFP through phy_port interface
Date: Thu, 13 Feb 2025 11:15:59 +0100
Message-ID: <20250213101606.1154014-12-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213101606.1154014-1-maxime.chevallier@bootlin.com>
References: <20250213101606.1154014-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegieehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgedtffelffelveeuleelgfejfeevvdejhfehgeefgfffvdefteegvedutefftdenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpeelnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefvddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_101632_837038_ED915C04 
X-CRM114-Status: GOOD (  14.94  )
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

QCA8072/8075 may be used as combo-port PHYs, with Serdes (100/1000BaseX)
 and Copper interfaces. The PHY has the ability to read the configuration
it's in.  If the configuration indicates the PHY is in combo mode, allow
registering up to 2 ports.

Register a dedicated set of port ops to handle the serdes port, and rely
on generic phylib SFP support for the SFP handling.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V4: New patch

 drivers/net/phy/qcom/qca807x.c | 75 +++++++++++++++-------------------
 1 file changed, 32 insertions(+), 43 deletions(-)

diff --git a/drivers/net/phy/qcom/qca807x.c b/drivers/net/phy/qcom/qca807x.c
index 3279de857b47..d6e5004c2e14 100644
--- a/drivers/net/phy/qcom/qca807x.c
+++ b/drivers/net/phy/qcom/qca807x.c
@@ -13,7 +13,7 @@
 #include <linux/phy.h>
 #include <linux/bitfield.h>
 #include <linux/gpio/driver.h>
-#include <linux/sfp.h>
+#include <linux/phy_port.h>
 
 #include "qcom.h"
 
@@ -641,67 +641,55 @@ static int qca807x_phy_package_config_init_once(struct phy_device *phydev)
 	return ret;
 }
 
-static int qca807x_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
+static int qca807x_configure_serdes(struct phy_port *port, bool enable,
+				    phy_interface_t interface)
 {
-	struct phy_device *phydev = upstream;
-	__ETHTOOL_DECLARE_LINK_MODE_MASK(support) = { 0, };
-	phy_interface_t iface;
+	struct phy_device *phydev = port_phydev(port);
 	int ret;
-	DECLARE_PHY_INTERFACE_MASK(interfaces);
 
-	sfp_parse_support(phydev->sfp_bus, id, support, interfaces);
-	iface = sfp_select_interface(phydev->sfp_bus, support);
+	if (!phydev)
+		return -ENODEV;
 
-	dev_info(&phydev->mdio.dev, "%s SFP module inserted\n", phy_modes(iface));
-
-	switch (iface) {
-	case PHY_INTERFACE_MODE_1000BASEX:
-	case PHY_INTERFACE_MODE_100BASEX:
+	if (enable) {
 		/* Set PHY mode to PSGMII combo (1/4 copper + combo ports) mode */
 		ret = phy_modify(phydev,
 				 QCA807X_CHIP_CONFIGURATION,
 				 QCA807X_CHIP_CONFIGURATION_MODE_CFG_MASK,
 				 QCA807X_CHIP_CONFIGURATION_MODE_PSGMII_FIBER);
+		if (ret)
+			return ret;
 		/* Enable fiber mode autodection (1000Base-X or 100Base-FX) */
 		ret = phy_set_bits_mmd(phydev,
 				       MDIO_MMD_AN,
 				       QCA807X_MMD7_FIBER_MODE_AUTO_DETECTION,
 				       QCA807X_MMD7_FIBER_MODE_AUTO_DETECTION_EN);
-		/* Select fiber page */
-		ret = phy_clear_bits(phydev,
-				     QCA807X_CHIP_CONFIGURATION,
-				     QCA807X_BT_BX_REG_SEL);
-
-		phydev->port = PORT_FIBRE;
-		break;
-	default:
-		dev_err(&phydev->mdio.dev, "Incompatible SFP module inserted\n");
-		return -EINVAL;
+		if (ret)
+			return ret;
 	}
 
-	return ret;
+	phydev->port = enable ? PORT_FIBRE : PORT_TP;
+
+	return phy_modify(phydev, QCA807X_CHIP_CONFIGURATION,
+			  QCA807X_BT_BX_REG_SEL,
+			  enable ? 0 : QCA807X_BT_BX_REG_SEL);
 }
 
-static void qca807x_sfp_remove(void *upstream)
+static const struct phy_port_ops qca807x_serdes_port_ops = {
+	.configure_mii = qca807x_configure_serdes,
+};
+
+static int qca807x_attach_port(struct phy_device *phydev, struct phy_port *port)
 {
-	struct phy_device *phydev = upstream;
+	if (!port->is_serdes)
+		return 0;
 
-	/* Select copper page */
-	phy_set_bits(phydev,
-		     QCA807X_CHIP_CONFIGURATION,
-		     QCA807X_BT_BX_REG_SEL);
+	__set_bit(PHY_INTERFACE_MODE_1000BASEX, port->interfaces);
+	__set_bit(PHY_INTERFACE_MODE_100BASEX, port->interfaces);
 
-	phydev->port = PORT_TP;
-}
+	port->ops = &qca807x_serdes_port_ops;
 
-static const struct sfp_upstream_ops qca807x_sfp_ops = {
-	.attach = phy_sfp_attach,
-	.detach = phy_sfp_detach,
-	.module_insert = qca807x_sfp_insert,
-	.module_remove = qca807x_sfp_remove,
-	.connect_phy = phy_sfp_connect_phy,
-	.disconnect_phy = phy_sfp_disconnect_phy,
-};
+	return 0;
+}
 
 static int qca807x_probe(struct phy_device *phydev)
 {
@@ -745,9 +733,8 @@ static int qca807x_probe(struct phy_device *phydev)
 
 	/* Attach SFP bus on combo port*/
 	if (phy_read(phydev, QCA807X_CHIP_CONFIGURATION)) {
-		ret = phy_sfp_probe(phydev, &qca807x_sfp_ops);
-		if (ret)
-			return ret;
+		phydev->max_n_ports = 2;
+
 		linkmode_set_bit(ETHTOOL_LINK_MODE_FIBRE_BIT, phydev->supported);
 		linkmode_set_bit(ETHTOOL_LINK_MODE_FIBRE_BIT, phydev->advertising);
 	}
@@ -801,6 +788,7 @@ static struct phy_driver qca807x_drivers[] = {
 		.suspend	= genphy_suspend,
 		.cable_test_start	= qca807x_cable_test_start,
 		.cable_test_get_status	= qca808x_cable_test_get_status,
+		.attach_port	= qca807x_attach_port,
 	},
 	{
 		PHY_ID_MATCH_EXACT(PHY_ID_QCA8075),
@@ -824,6 +812,7 @@ static struct phy_driver qca807x_drivers[] = {
 		.led_hw_is_supported = qca807x_led_hw_is_supported,
 		.led_hw_control_set = qca807x_led_hw_control_set,
 		.led_hw_control_get = qca807x_led_hw_control_get,
+		.attach_port	= qca807x_attach_port,
 	},
 };
 module_phy_driver(qca807x_drivers);
-- 
2.48.1


