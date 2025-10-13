Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43236CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 14:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Auh8OQpH3uL/VebcwT2I85eUP/eWXxfkMZg3O0BLOQ=; b=sX8Toh/5P1hDhHYo+1Ezs1k1ug
	sIXYt5xn9KmzxsLOnrwmhFTWcTk/uWjEKRC4DwDaAFZ/liZyFQkHQTUsZq18tSX8DfjHa4rgQLedz
	ceLYJnNgfVP6QTPr6Lx60wUg6jizYYpiBkx3NHPBhAtCFGkTIIBgSGvngvc7ENp5paeIyd97dqgAY
	moxQwW1cOfo3qnoLkMtYycjYODC+VdjFjOTynRLg3vp8e7tbg45n/PNO6dviO34FwlxveZt0BxQho
	vdAjQBs+bjYSNqJmCnzDb8xZNr5DycDhUJ5BolUMDljFcQFHe+dHPTuqTm6+rIA2C5QDWtzpy7ylq
	gAfF5haA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JbV-0000000DPmm-0opS;
	Mon, 13 Oct 2025 14:32:49 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JbS-0000000DPjs-2K4r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 14:32:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2E6F41A12FF;
	Mon, 13 Oct 2025 14:32:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 024F5606C6;
	Mon, 13 Oct 2025 14:32:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A0E2102F226E;
	Mon, 13 Oct 2025 16:32:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760365962; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=6Auh8OQpH3uL/VebcwT2I85eUP/eWXxfkMZg3O0BLOQ=;
	b=OR4fRUkdTWBZ7FfWkUwNApJb063GwBB4CtkOhtkviJ2ataAOEBrpGK1O4Xuj1y3w2SOzqs
	YenAhPoKZfLQTY03VN/C5euAP1rFuuxTpoQF9a4W5wzURZ+xba81jTFQu0p3ua4EVIxsEA
	oRoqIbVUalm9uEUkuW1/kxTY/tJkgqWFMWiazOjHnMfqPnADI9Vh1Szxm6Y0j62UwHvTl1
	7hTER9Z5FzAbpkHskwuu5S/+LZ8IyFHoaDVB3a45+bKNk52Tc6RTJ+PrgtKkYWYZoLMCRf
	ePDMbiHeBYpr+i+G2D7y0+9BDu6IMYAzg0oryUEEc9sVFL6tGjsXJEq+LXTi1A==
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
Subject: [PATCH net-next v14 05/16] net: phy: dp83822: Add support for phy_port representation
Date: Mon, 13 Oct 2025 16:31:31 +0200
Message-ID: <20251013143146.364919-6-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251013143146.364919-1-maxime.chevallier@bootlin.com>
References: <20251013143146.364919-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_073246_727100_D37DA774 
X-CRM114-Status: GOOD (  19.19  )
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

With the phy_port representation introduced, we can use .attach_port to
populate the port information based on either the straps or the
ti,fiber-mode property. This allows simplifying the probe function and
allow users to override the strapping configuration.

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Tested-by: Oleksij Rempel <o.rempel@pengutronix.de>
Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/dp83822.c | 72 +++++++++++++++++++++++++--------------
 1 file changed, 46 insertions(+), 26 deletions(-)

diff --git a/drivers/net/phy/dp83822.c b/drivers/net/phy/dp83822.c
index 33db21251f2e..c6e5b7244658 100644
--- a/drivers/net/phy/dp83822.c
+++ b/drivers/net/phy/dp83822.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/phy.h>
+#include <linux/phy_port.h>
 #include <linux/netdevice.h>
 #include <linux/bitfield.h>
 
@@ -811,17 +812,6 @@ static int dp83822_of_init(struct phy_device *phydev)
 	int i, ret;
 	u32 val;
 
-	/* Signal detection for the PHY is only enabled if the FX_EN and the
-	 * SD_EN pins are strapped. Signal detection can only enabled if FX_EN
-	 * is strapped otherwise signal detection is disabled for the PHY.
-	 */
-	if (dp83822->fx_enabled && dp83822->fx_sd_enable)
-		dp83822->fx_signal_det_low = device_property_present(dev,
-								     "ti,link-loss-low");
-	if (!dp83822->fx_enabled)
-		dp83822->fx_enabled = device_property_present(dev,
-							      "ti,fiber-mode");
-
 	if (!device_property_read_string(dev, "ti,gpio2-clk-out", &of_val)) {
 		if (strcmp(of_val, "mac-if") == 0) {
 			dp83822->gpio2_clk_out = DP83822_CLK_SRC_MAC_IF;
@@ -950,6 +940,49 @@ static int dp83822_read_straps(struct phy_device *phydev)
 	return 0;
 }
 
+static int dp83822_attach_mdi_port(struct phy_device *phydev,
+				   struct phy_port *port)
+{
+	struct dp83822_private *dp83822 = phydev->priv;
+	int ret;
+
+	if (port->mediums) {
+		if (phy_port_is_fiber(port))
+			dp83822->fx_enabled = true;
+	} else {
+		ret = dp83822_read_straps(phydev);
+		if (ret)
+			return ret;
+
+#if IS_ENABLED(CONFIG_OF_MDIO)
+		if (dp83822->fx_enabled && dp83822->fx_sd_enable)
+			dp83822->fx_signal_det_low =
+				device_property_present(&phydev->mdio.dev,
+							"ti,link-loss-low");
+
+		/* ti,fiber-mode is still used for backwards compatibility, but
+		 * has been replaced with the mdi node definition, see
+		 * ethernet-port.yaml
+		 */
+		if (!dp83822->fx_enabled)
+			dp83822->fx_enabled =
+				device_property_present(&phydev->mdio.dev,
+							"ti,fiber-mode");
+#endif /* CONFIG_OF_MDIO */
+
+		if (dp83822->fx_enabled) {
+			port->lanes = 1;
+			port->mediums = BIT(ETHTOOL_LINK_MEDIUM_BASEF);
+		} else {
+			/* This PHY can only to 100BaseTX max, so on 2 lanes */
+			port->lanes = 2;
+			port->mediums = BIT(ETHTOOL_LINK_MEDIUM_BASET);
+		}
+	}
+
+	return 0;
+}
+
 static int dp8382x_probe(struct phy_device *phydev)
 {
 	struct dp83822_private *dp83822;
@@ -968,27 +1001,13 @@ static int dp8382x_probe(struct phy_device *phydev)
 
 static int dp83822_probe(struct phy_device *phydev)
 {
-	struct dp83822_private *dp83822;
 	int ret;
 
 	ret = dp8382x_probe(phydev);
 	if (ret)
 		return ret;
 
-	dp83822 = phydev->priv;
-
-	ret = dp83822_read_straps(phydev);
-	if (ret)
-		return ret;
-
-	ret = dp83822_of_init(phydev);
-	if (ret)
-		return ret;
-
-	if (dp83822->fx_enabled)
-		phydev->port = PORT_FIBRE;
-
-	return 0;
+	return dp83822_of_init(phydev);
 }
 
 static int dp83826_probe(struct phy_device *phydev)
@@ -1172,6 +1191,7 @@ static int dp83822_led_hw_control_get(struct phy_device *phydev, u8 index,
 		.led_hw_is_supported = dp83822_led_hw_is_supported,	\
 		.led_hw_control_set = dp83822_led_hw_control_set,	\
 		.led_hw_control_get = dp83822_led_hw_control_get,	\
+		.attach_mdi_port = dp83822_attach_mdi_port		\
 	}
 
 #define DP83825_PHY_DRIVER(_id, _name)				\
-- 
2.49.0


