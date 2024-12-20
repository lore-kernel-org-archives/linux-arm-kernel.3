Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5459CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 20:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCQOXUQrkl6IGWgunRyyLbwk1HB+GOwt1j3mvyiwwok=; b=hRQ55WUS/yr9TfGdCc8FvdXD/w
	R9unuEO7fRwZQeUoWaMHiYqEIVfnlCriYqi1KIkLXBUW9CeM98cYUO9XybLlboL8MlQgAGS62prlQ
	JY6MG2JSjgkocb0aqMzUdhczxvpEUzgx5rSrW6V/vy7XFv4KZwHNzRpa8ZPGrX680Sh9uqaEcjj6h
	qjlHCiZGlu52O3TE00nZLQ76XhvQ0rzP7xxtEXQSVOdvwvgM2m8HWjqSNDkM2fN9fvKcR6F4dRs1S
	QFTx+wbNrn2sdIICKrvNCdaTHa6X0tJEvncQA0EjEPtFLnRt9Ve4qPMSW7jIuN/mg00e09C4OLF8o
	Bb/TVPkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOjVs-000000061wN-3h4Q;
	Fri, 20 Dec 2024 20:22:20 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOjP5-000000060c3-1vg9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 20:15:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 78F96E0008;
	Fri, 20 Dec 2024 20:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734725716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MCQOXUQrkl6IGWgunRyyLbwk1HB+GOwt1j3mvyiwwok=;
	b=fhBGHpbFj1A390nEBl+AWAE4HTbVfQGFbaHtzxSjRU+GX9W1cmi6zxbxs49wjZfgA4aron
	sjFyjTffiSudTbhFrGyABg9HPDLAN2vmFde6Gi/zWuy0FJsfFWYB/eh95zS0mJv8oovBJd
	5mG/CahkTysr1K6ErX4ECE3fr0qinI4RgizkUGh2JT84o/9W6MbUjCkLO99ZfYW4ODXYDt
	0ILOTy3NhLLhlTgutTHIOjLGiiDeAJSrhnyV99IaxV39OGiFj1x9OzM/DnEjN9tVn0o1pb
	qv7V/kjYYCzY5n+qrz0AGl4VivRrTk7BlfzkLX10m0ochaP6lx+vyepo4ppuAw==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
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
	Antoine Tenart <atenart@kernel.org>
Subject: [PATCH net-next RFC 5/5] net: phy: dp83822: Add support for phy_port representation
Date: Fri, 20 Dec 2024 21:15:04 +0100
Message-ID: <20241220201506.2791940-6-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241220201506.2791940-1-maxime.chevallier@bootlin.com>
References: <20241220201506.2791940-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_121519_772486_5146CF50 
X-CRM114-Status: GOOD (  18.12  )
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

With the phy_port representation intrduced, we can use .attach_port to
populate the port information based on either the straps or the
ti,fiber-mode property. This allows simplifying the probe function and
allow users to override the strapping configuration.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/dp83822.c | 60 +++++++++++++++++++++++++--------------
 1 file changed, 39 insertions(+), 21 deletions(-)

diff --git a/drivers/net/phy/dp83822.c b/drivers/net/phy/dp83822.c
index 334c17a68edd..96a0ad1a0e83 100644
--- a/drivers/net/phy/dp83822.c
+++ b/drivers/net/phy/dp83822.c
@@ -637,17 +637,6 @@ static int dp83822_of_init(struct phy_device *phydev)
 	struct device *dev = &phydev->mdio.dev;
 	const char *of_val;
 
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
@@ -740,6 +729,44 @@ static int dp83822_read_straps(struct phy_device *phydev)
 	return 0;
 }
 
+static int dp83822_attach_port(struct phy_device *phydev, struct phy_port *port)
+{
+	struct dp83822_private *dp83822 = phydev->priv;
+	struct device *dev = &phydev->mdio.dev;
+	int ret;
+
+	if (port->mediums) {
+		if (phy_port_is_fiber(port) ||
+		    port->mediums & BIT(ETHTOOL_LINK_MEDIUM_BASEX))
+			dp83822->fx_enabled = true;
+	} else {
+		ret = dp83822_read_straps(phydev);
+		if (ret)
+			return ret;
+
+#ifdef CONFIG_OF_MDIO
+		if (dp83822->fx_enabled && dp83822->fx_sd_enable)
+			dp83822->fx_signal_det_low =
+				device_property_present(dev, "ti,link-loss-low");
+		if (!dp83822->fx_enabled)
+			dp83822->fx_enabled =
+				device_property_present(dev, "ti,fiber-mode");
+#endif
+
+		if (dp83822->fx_enabled) {
+			port->lanes = 1;
+			port->mediums = BIT(ETHTOOL_LINK_MEDIUM_BASEF) |
+					BIT(ETHTOOL_LINK_MEDIUM_BASEX);
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
@@ -756,24 +783,14 @@ static int dp8382x_probe(struct phy_device *phydev)
 
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
 	dp83822_of_init(phydev);
 
-	if (dp83822->fx_enabled)
-		phydev->port = PORT_FIBRE;
-
 	return 0;
 }
 
@@ -831,6 +848,7 @@ static int dp83822_resume(struct phy_device *phydev)
 		.handle_interrupt = dp83822_handle_interrupt,	\
 		.suspend = dp83822_suspend,			\
 		.resume = dp83822_resume,			\
+		.attach_port = dp83822_attach_port		\
 	}
 
 #define DP83825_PHY_DRIVER(_id, _name)				\
-- 
2.47.1


