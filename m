Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11887C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 14:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UALEAqQcYSGLfVY8waM7J7iPJDCetXriMkin+nkj2AE=; b=QgaRCTt6HDroaiSCyURYlyaJpY
	Y20eMhyovCuhhFSKdUefZTpW33NObciujSyAAwkYk5CUkl2CJBPmOrET2YacMe7jQLuWjFb3G38Tx
	FER8juKhY7hsAlEYcIzkzeTXm1WxXFqNF6D7LUyNNecSP8Dt+y7UQjkvbmqp+aAK7rzsspk36zJYd
	vlJMsJYV4jGkG5Pzdg1njd97t9A9IMgei1wGdwcjia3v0no8H8sdbWwfmaLLM4Wiv3txKZ5QumMBo
	UMYmX6PjzMsJYOKwkeDcCleEf/rE1VLZ6wKTzRbLAYfp1vfEIfEMbUji/KiWbfHkn6u7xnqx2iNC1
	cd9q0OvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlqjg-00000008CAI-438L;
	Sat, 22 Feb 2025 14:44:08 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlqTq-00000008A0b-1rxq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 14:27:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED69343284;
	Sat, 22 Feb 2025 14:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740234465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UALEAqQcYSGLfVY8waM7J7iPJDCetXriMkin+nkj2AE=;
	b=JwgMOElFOmzCAtdEr5kZ3/VMtMc41fG4LQ4+SGw/kL7bbVyXBUicINCyOHP1RKfW4dHUFg
	0w52n2a5I7ud7j7iew2YiTlrLPLplxOeZtFiImyiJYG563YX4f/1l6MToMOLg0HitQY2kZ
	ntaGYX7cS3ij3AjtltE7pXdUzwzBYSNcop3E1FzodDZ0pfKvQ/Dgr2DS1B7HMf8XmxlIkq
	skTC5Ke5fpvSu7zCwbkLMep1DB3Iltp6GgmPB0sMB17vCMt8ccjaDT5ZszpacHphUaTdIT
	+rYZe59Nw3dD/z4MCAxlx1ZrgGA7NDtrtPkxE++6TMspB7CeKMJR8d8seZa+AA==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Simon Horman <horms@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>
Subject: [PATCH net-next 10/13] net: phy: phy_caps: Allow looking-up link caps based on speed and duplex
Date: Sat, 22 Feb 2025 15:27:22 +0100
Message-ID: <20250222142727.894124-11-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250222142727.894124-1-maxime.chevallier@bootlin.com>
References: <20250222142727.894124-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejfeduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgedtffelffelveeuleelgfejfeevvdejhfehgeefgfffvdefteegvedutefftdenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgri
 igvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_062746_618851_6C3F7394 
X-CRM114-Status: GOOD (  22.19  )
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

As the link_caps array is efficient for <speed,duplex> lookups,
implement a function for speed/duplex lookups that matches a given
mask. This replicates to some extent the phy_lookup_settings()
behaviour, matching full link_capabilities instead of a single linkmode.

phy.c's phy_santize_settings() and phylink's
phylink_ethtool_ksettings_set() performs such lookup using the
phy_settings table, but are only interested in the actual speed/duplex
that were matched, rathet than the individual linkmode.

Similar to phy_lookup_settings(), the newly introduced phy_caps_lookup()
will run through the link_caps[] array by descending speed/duplex order.

If the link_capabilities for a given <speed/duplex> tuple intersects the
passed linkmodes, we consider that a match.

Similar to phy_lookup_settings(), we also allow passing an 'exact'
boolean, allowing non-exact match. Here, we MUST always match the
linkmodes mask, but we allow matching on lower speed settings.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phy-caps.h |  4 ++++
 drivers/net/phy/phy.c      | 32 ++++++--------------------
 drivers/net/phy/phy_caps.c | 46 ++++++++++++++++++++++++++++++++++++++
 drivers/net/phy/phylink.c  | 16 ++++++-------
 4 files changed, 65 insertions(+), 33 deletions(-)

diff --git a/drivers/net/phy/phy-caps.h b/drivers/net/phy/phy-caps.h
index b4b476495f6c..337e682aa754 100644
--- a/drivers/net/phy/phy-caps.h
+++ b/drivers/net/phy/phy-caps.h
@@ -32,4 +32,8 @@ phy_caps_lookup_by_linkmode(const unsigned long *linkmodes);
 const struct link_capabilities *
 phy_caps_lookup_by_linkmode_rev(const unsigned long *linkmodes, bool fdx_only);
 
+const struct link_capabilities *
+phy_caps_lookup(int speed, unsigned int duplex, const unsigned long *supported,
+		bool exact);
+
 #endif /* __PHY_CAPS_H */
diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index cb73293f7bce..63ddd27ec91b 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -212,25 +212,6 @@ int phy_aneg_done(struct phy_device *phydev)
 }
 EXPORT_SYMBOL(phy_aneg_done);
 
-/**
- * phy_find_valid - find a PHY setting that matches the requested parameters
- * @speed: desired speed
- * @duplex: desired duplex
- * @supported: mask of supported link modes
- *
- * Locate a supported phy setting that is, in priority order:
- * - an exact match for the specified speed and duplex mode
- * - a match for the specified speed, or slower speed
- * - the slowest supported speed
- * Returns the matched phy_setting entry, or %NULL if no supported phy
- * settings were found.
- */
-static const struct phy_setting *
-phy_find_valid(int speed, int duplex, unsigned long *supported)
-{
-	return phy_lookup_setting(speed, duplex, supported, false);
-}
-
 /**
  * phy_supported_speeds - return all speeds currently supported by a phy device
  * @phy: The phy device to return supported speeds of.
@@ -273,13 +254,14 @@ EXPORT_SYMBOL(phy_check_valid);
  */
 static void phy_sanitize_settings(struct phy_device *phydev)
 {
-	const struct phy_setting *setting;
+	const struct link_capabilities *c;
+
+	c = phy_caps_lookup(phydev->speed, phydev->duplex, phydev->supported,
+			    false);
 
-	setting = phy_find_valid(phydev->speed, phydev->duplex,
-				 phydev->supported);
-	if (setting) {
-		phydev->speed = setting->speed;
-		phydev->duplex = setting->duplex;
+	if (c) {
+		phydev->speed = c->speed;
+		phydev->duplex = c->duplex;
 	} else {
 		/* We failed to find anything (no supported speeds?) */
 		phydev->speed = SPEED_UNKNOWN;
diff --git a/drivers/net/phy/phy_caps.c b/drivers/net/phy/phy_caps.c
index 9faa7113a22f..ee03ecedd522 100644
--- a/drivers/net/phy/phy_caps.c
+++ b/drivers/net/phy/phy_caps.c
@@ -174,6 +174,52 @@ phy_caps_lookup_by_linkmode_rev(const unsigned long *linkmodes, bool fdx_only)
 	return NULL;
 }
 
+/**
+ * phy_caps_lookup() - Lookup capabilities by speed/duplex that matches a mask
+ * @speed: Speed to match
+ * @duplex: Duplex to match
+ * @supported: Mask of linkmodes to match
+ * @exact: Perform an exact match or not.
+ *
+ * Lookup a link_capabilities entry that intersect the supported linkmodes mask,
+ * and that matches the passed speed and duplex.
+ *
+ * When @exact is set, an exact match is performed on speed and duplex, meaning
+ * that if the linkmodes for the given speed and duplex intersect the supported
+ * mask, this capability is returned, otherwise we don't have a match and return
+ * NULL.
+ *
+ * When @exact is not set, we return either an exact match, or matching capabilities
+ * at lower speed, or the lowest matching speed, or NULL.
+ */
+const struct link_capabilities *
+phy_caps_lookup(int speed, unsigned int duplex, const unsigned long *supported,
+		bool exact)
+{
+	const struct link_capabilities *c, *last = NULL;
+	int capa;
+
+	for (capa = __LINK_CAPA_LAST; capa >= 0; capa--) {
+		c = &link_caps[capa];
+		if (linkmode_intersects(c->linkmodes, supported)) {
+			last = c;
+			/* exact match on speed and duplex*/
+			if (c->speed == speed && c->duplex == duplex) {
+				return c;
+			} else if (!exact) {
+				if (c->speed <= speed)
+					return c;
+			}
+		}
+	}
+
+	if (!exact)
+		return last;
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(phy_caps_lookup);
+
 /**
  * phy_caps_linkmode_max_speed() - Clamp a linkmodes set to a max speed
  * @max_speed: Speed limit for the linkmode set
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index af04be1d23c5..da7b159702c5 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2552,8 +2552,8 @@ int phylink_ethtool_ksettings_set(struct phylink *pl,
 				  const struct ethtool_link_ksettings *kset)
 {
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(support);
+	const struct link_capabilities *c;
 	struct phylink_link_state config;
-	const struct phy_setting *s;
 
 	ASSERT_RTNL();
 
@@ -2596,23 +2596,23 @@ int phylink_ethtool_ksettings_set(struct phylink *pl,
 		/* Autonegotiation disabled, select a suitable speed and
 		 * duplex.
 		 */
-		s = phy_lookup_setting(kset->base.speed, kset->base.duplex,
-				       pl->supported, false);
-		if (!s)
+		c = phy_caps_lookup(kset->base.speed, kset->base.duplex,
+				    pl->supported, false);
+		if (!c)
 			return -EINVAL;
 
 		/* If we have a fixed link, refuse to change link parameters.
 		 * If the link parameters match, accept them but do nothing.
 		 */
 		if (pl->req_link_an_mode == MLO_AN_FIXED) {
-			if (s->speed != pl->link_config.speed ||
-			    s->duplex != pl->link_config.duplex)
+			if (c->speed != pl->link_config.speed ||
+			    c->duplex != pl->link_config.duplex)
 				return -EINVAL;
 			return 0;
 		}
 
-		config.speed = s->speed;
-		config.duplex = s->duplex;
+		config.speed = c->speed;
+		config.duplex = c->duplex;
 		break;
 
 	case AUTONEG_ENABLE:
-- 
2.48.1


