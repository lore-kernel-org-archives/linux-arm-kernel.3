Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A21C282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 15:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sMeWIy1pokFUafjD0nCX3zVlZ19P+ScVtBIyEejkHgY=; b=k+TwnI0AiXukvdtSsS7X9G+xNt
	skretVZRp6v5jq2CXksoBpYkdfcukdIq7yLbn3rP3dnx4a2Z2T0ebtYAsrfhSrS19AseLvw/9OAWY
	qC7c62tDZzBJng8VJH0Cr41sVYAqM69Iq/RJNwxc+lEQHNSrJJ1MEqkpwOoCYBIhenVUZbnLy6sBt
	yQHryQxY9mHps9bwy9AgArRFBoJ6Pp+9uUNqafLF8/mI0vtpnzWDsyZvw1Ss0DQoIP4xnuZ7XvogO
	xLNnlaV4f6L65KaVry8AjTOjXN0MNpM0sUwzqJdHs/B5akZL1FvWNaQ/xLhwDU9F2RAsB7i86gqhS
	VgyY3nhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to24C-0000000BPqB-1X18;
	Fri, 28 Feb 2025 15:14:20 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to1mJ-0000000BLh6-0p69
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 14:55:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4D13443F3;
	Fri, 28 Feb 2025 14:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740754549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sMeWIy1pokFUafjD0nCX3zVlZ19P+ScVtBIyEejkHgY=;
	b=kfJBpXL83BU7MMrUipafybxNCBGl0H6pj34lh+rbJPDRRDnAVyAaHnoDzdirt4iCyVnhy7
	R5HTrR/EG1x96uSKpjIreY/NbfNpe6YLvArVNglJ7+pDehXgvU7kmINcBj6An2cEKwMH/V
	rEMinzGtDZlnOVLGsy9pBHBJE447jXmSPXnaT1WaCCTzS1aXr3DvU3O+AhGs753Bp7bvA/
	nNeejD8nS3QKdkRxlX4q/zgDfP1CcT089v9dBxb3Zue9tru+4Qy18OxL28Yg/Q6wMHgN56
	u7aoBYoDKQDQ9Wv3WccDv00nN2aIDjOGqxxyKlre+yBh17GwQK8NdGJW77AQCA==
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
Subject: [PATCH net-next v3 06/13] net: phy: phy_caps: Implement link_capabilities lookup by linkmode
Date: Fri, 28 Feb 2025 15:55:31 +0100
Message-ID: <20250228145540.2209551-7-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228145540.2209551-1-maxime.chevallier@bootlin.com>
References: <20250228145540.2209551-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeltdeilecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgedtffelffelveeuleelgfejfeevvdejhfehgeefgfffvdefteegvedutefftdenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgri
 igvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_065551_409485_8DAA5D67 
X-CRM114-Status: GOOD (  14.79  )
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

In several occasions, phylib needs to lookup a set of matching speed and
duplex against a given linkmode set. Instead of relying on the
phy_settings array and thus iterate over the whole linkmodes list, use
the link_capabilities array to lookup these matches, as we aren't
interested in the actual link setting that matches but rather the speed
and duplex for that setting.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phy-caps.h |  5 +++++
 drivers/net/phy/phy-core.c | 36 +++++++++++++-----------------
 drivers/net/phy/phy_caps.c | 45 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 65 insertions(+), 21 deletions(-)

diff --git a/drivers/net/phy/phy-caps.h b/drivers/net/phy/phy-caps.h
index 7359983fce0f..7b95a9cb5ebb 100644
--- a/drivers/net/phy/phy-caps.h
+++ b/drivers/net/phy/phy-caps.h
@@ -46,5 +46,10 @@ size_t phy_caps_speeds(unsigned int *speeds, size_t size,
 void phy_caps_linkmode_max_speed(u32 max_speed, unsigned long *linkmodes);
 bool phy_caps_valid(int speed, int duplex, const unsigned long *linkmodes);
 
+const struct link_capabilities *
+phy_caps_lookup_by_linkmode(const unsigned long *linkmodes);
+
+const struct link_capabilities *
+phy_caps_lookup_by_linkmode_rev(const unsigned long *linkmodes, bool fdx_only);
 
 #endif /* __PHY_CAPS_H */
diff --git a/drivers/net/phy/phy-core.c b/drivers/net/phy/phy-core.c
index f62bc1be67b2..6cb8f857a7f1 100644
--- a/drivers/net/phy/phy-core.c
+++ b/drivers/net/phy/phy-core.c
@@ -468,16 +468,15 @@ EXPORT_SYMBOL_GPL(phy_resolve_aneg_pause);
 void phy_resolve_aneg_linkmode(struct phy_device *phydev)
 {
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(common);
-	int i;
+	const struct link_capabilities *c;
 
 	linkmode_and(common, phydev->lp_advertising, phydev->advertising);
 
-	for (i = 0; i < ARRAY_SIZE(settings); i++)
-		if (test_bit(settings[i].bit, common)) {
-			phydev->speed = settings[i].speed;
-			phydev->duplex = settings[i].duplex;
-			break;
-		}
+	c = phy_caps_lookup_by_linkmode(common);
+	if (c) {
+		phydev->speed = c->speed;
+		phydev->duplex = c->duplex;
+	}
 
 	phy_resolve_aneg_pause(phydev);
 }
@@ -495,7 +494,8 @@ EXPORT_SYMBOL_GPL(phy_resolve_aneg_linkmode);
 void phy_check_downshift(struct phy_device *phydev)
 {
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(common);
-	int i, speed = SPEED_UNKNOWN;
+	const struct link_capabilities *c;
+	int speed = SPEED_UNKNOWN;
 
 	phydev->downshifted_rate = 0;
 
@@ -505,11 +505,9 @@ void phy_check_downshift(struct phy_device *phydev)
 
 	linkmode_and(common, phydev->lp_advertising, phydev->advertising);
 
-	for (i = 0; i < ARRAY_SIZE(settings); i++)
-		if (test_bit(settings[i].bit, common)) {
-			speed = settings[i].speed;
-			break;
-		}
+	c = phy_caps_lookup_by_linkmode(common);
+	if (c)
+		speed = c->speed;
 
 	if (speed == SPEED_UNKNOWN || phydev->speed >= speed)
 		return;
@@ -523,17 +521,13 @@ void phy_check_downshift(struct phy_device *phydev)
 static int phy_resolve_min_speed(struct phy_device *phydev, bool fdx_only)
 {
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(common);
-	int i = ARRAY_SIZE(settings);
+	const struct link_capabilities *c;
 
 	linkmode_and(common, phydev->lp_advertising, phydev->advertising);
 
-	while (--i >= 0) {
-		if (test_bit(settings[i].bit, common)) {
-			if (fdx_only && settings[i].duplex != DUPLEX_FULL)
-				continue;
-			return settings[i].speed;
-		}
-	}
+	c = phy_caps_lookup_by_linkmode_rev(common, fdx_only);
+	if (c)
+		return c->speed;
 
 	return SPEED_UNKNOWN;
 }
diff --git a/drivers/net/phy/phy_caps.c b/drivers/net/phy/phy_caps.c
index b776375ea9e4..8cf7ff3f1368 100644
--- a/drivers/net/phy/phy_caps.c
+++ b/drivers/net/phy/phy_caps.c
@@ -104,6 +104,51 @@ size_t phy_caps_speeds(unsigned int *speeds, size_t size,
 	return count;
 }
 
+/**
+ * phy_caps_lookup_by_linkmode() - Lookup the fastest matching link_capabilities
+ * @linkmodes: Linkmodes to match against
+ *
+ * Returns: The highest-speed link_capabilities that intersects the given
+ *	    linkmodes. In case several DUPLEX_ options exist at that speed,
+ *	    DUPLEX_FULL is matched first. NULL is returned if no match.
+ */
+const struct link_capabilities *
+phy_caps_lookup_by_linkmode(const unsigned long *linkmodes)
+{
+	int capa;
+
+	for (capa = __LINK_CAPA_LAST; capa >= 0; capa--)
+		if (linkmode_intersects(link_caps[capa].linkmodes, linkmodes))
+			return &link_caps[capa];
+
+	return NULL;
+}
+
+/**
+ * phy_caps_lookup_by_linkmode_rev() - Lookup the slowest matching link_capabilities
+ * @linkmodes: Linkmodes to match against
+ * @fdx_only: Full duplex match only when set
+ *
+ * Returns: The lowest-speed link_capabilities that intersects the given
+ *	    linkmodes. When set, fdx_only will ignore half-duplex matches.
+ *	    NULL is returned if no match.
+ */
+const struct link_capabilities *
+phy_caps_lookup_by_linkmode_rev(const unsigned long *linkmodes, bool fdx_only)
+{
+	int capa;
+
+	for (capa = 0; capa < __LINK_CAPA_MAX; capa++) {
+		if (fdx_only && link_caps[capa].duplex != DUPLEX_FULL)
+			continue;
+
+		if (linkmode_intersects(link_caps[capa].linkmodes, linkmodes))
+			return &link_caps[capa];
+	}
+
+	return NULL;
+}
+
 /**
  * phy_caps_linkmode_max_speed() - Clamp a linkmodes set to a max speed
  * @max_speed: Speed limit for the linkmode set
-- 
2.48.1


