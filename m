Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF19C282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 15:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QUxKoCsWl+oN98PfcLCfdbH4MrmV3q82ld9K0B9EsgM=; b=yhKMgPn65y0DctPVysQD7Hl0kF
	l5Cxh+wi21a8sia/HTwstXaRzbxcCxGG7n/zz+hZ5/QJnLKUKRUFAzSjd0ZggtOF/wySAobSIXQI2
	7ZxJ70mPnFlXmHmEqtxsAdcMz7Gg8KFYKnXaxCdQe0qBQI+GIc+43e6GDlTo8NJ9JShzX+dubQ/TV
	mIlvd1FjULvuoXD15/ZDO5rw23gAAwGaPD8vHjTthuMvg3gvKvzkYFXaYLwpSZpdjHWKibLYdo4Xv
	FFRFLCR0VeoK9P/x+sb0b+Od6clrNckdiebC3zsuJ5Nk6hPU0kviHUjTwewWddG6I48L6ka+PQNBc
	vsKUyImg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to2DP-0000000BSGH-33S5;
	Fri, 28 Feb 2025 15:23:51 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to1mP-0000000BLlX-1msl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 14:55:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A1B3443FD;
	Fri, 28 Feb 2025 14:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740754556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QUxKoCsWl+oN98PfcLCfdbH4MrmV3q82ld9K0B9EsgM=;
	b=KukmpYuoPLTmU6NNDAJe17DfLg2jOTMVm6yRbu22KOpwEs69cvm3qwvvO1o++lK7xc60Hj
	nFQBiLsgyBanNYPH3gG6lXPUma668RHzcUh64WsgTulP0RcWIXxamD8vMNiysrBJbs9OLC
	GcFwYzY3Ae9PaxqY3cl40Qs/rzVAb2iDKcYeqidCnZ1d/6al8TCaRjf3EPgqU7KT/sg3Hf
	YMTZB5/kv866b3wzQ63Gr+qGrvb6KF7sYDCrKtMfYDRydJ3z/yo3giK9aUmok0R+VE/E+w
	pfHCLzYE4UTKP8EpmJ20zad8rwfG68eOVta6w/cv+KAitvNA3iPuhX5x8LbSqQ==
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
Subject: [PATCH net-next v3 12/13] net: phylink: Convert capabilities to linkmodes using phy_caps
Date: Fri, 28 Feb 2025 15:55:37 +0100
Message-ID: <20250228145540.2209551-13-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228145540.2209551-1-maxime.chevallier@bootlin.com>
References: <20250228145540.2209551-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeltdeilecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgedtffelffelveeuleelgfejfeevvdejhfehgeefgfffvdefteegvedutefftdenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgri
 igvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_065557_613341_E24C50EB 
X-CRM114-Status: GOOD (  15.80  )
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

phylink_caps_to_linkmodes() is used to derive a list of linkmodes that
can be conceivably exposed using a given set of speeds and duplex
through phylink's MAC capabilities.

This list can be derived from the link_caps array in phy_caps, provided
we convert the MAC capabilities into a LINK_CAPA bitmask first.

Introduce an internal phylink helper phylink_caps_to_link_caps() to
convert from MAC capabilities into phy_caps, then  phy_caps_linkmodes()
to do the link_caps -> linkmodes conversion.

This avoids having to update phylink for every new linkmode.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phy-caps.h |   1 +
 drivers/net/phy/phy_caps.c |  14 ++++
 drivers/net/phy/phylink.c  | 155 +++++--------------------------------
 3 files changed, 36 insertions(+), 134 deletions(-)

diff --git a/drivers/net/phy/phy-caps.h b/drivers/net/phy/phy-caps.h
index dd3ea9f77f1c..7b76b3204e24 100644
--- a/drivers/net/phy/phy-caps.h
+++ b/drivers/net/phy/phy-caps.h
@@ -45,6 +45,7 @@ size_t phy_caps_speeds(unsigned int *speeds, size_t size,
 		       unsigned long *linkmodes);
 void phy_caps_linkmode_max_speed(u32 max_speed, unsigned long *linkmodes);
 bool phy_caps_valid(int speed, int duplex, const unsigned long *linkmodes);
+void phy_caps_linkmodes(unsigned long caps, unsigned long *linkmodes);
 
 const struct link_capabilities *
 phy_caps_lookup_by_linkmode(const unsigned long *linkmodes);
diff --git a/drivers/net/phy/phy_caps.c b/drivers/net/phy/phy_caps.c
index 77bf85043e82..602e0ad44602 100644
--- a/drivers/net/phy/phy_caps.c
+++ b/drivers/net/phy/phy_caps.c
@@ -232,3 +232,17 @@ bool phy_caps_valid(int speed, int duplex, const unsigned long *linkmodes)
 
 	return linkmode_intersects(link_caps[capa].linkmodes, linkmodes);
 }
+
+/**
+ * phy_caps_linkmodes() - Convert a bitfield of capabilities into linkmodes
+ * @caps: The list of caps, each bit corresponding to a LINK_CAPA value
+ * @linkmodes: The set of linkmodes to fill. Must be previously initialized.
+ */
+void phy_caps_linkmodes(unsigned long caps, unsigned long *linkmodes)
+{
+	unsigned long capa;
+
+	for_each_set_bit(capa, &caps, __LINK_CAPA_MAX)
+		linkmode_or(linkmodes, linkmodes, link_caps[capa].linkmodes);
+}
+EXPORT_SYMBOL_GPL(phy_caps_linkmodes);
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index aaf07094b821..8548c265cecf 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -317,6 +317,24 @@ static struct {
 	{ MAC_10HD,     SPEED_10,     DUPLEX_HALF, BIT(LINK_CAPA_10HD) },
 };
 
+/**
+ * phylink_caps_to_link_caps() - Convert a set of MAC capabilities LINK caps
+ * @caps: A set of MAC capabilities
+ *
+ * Returns: The corresponding set of LINK_CAPA as defined in phy-caps.h
+ */
+static unsigned long phylink_caps_to_link_caps(unsigned long caps)
+{
+	unsigned long link_caps = 0;
+	int i;
+
+	for (i = 0; i <  ARRAY_SIZE(phylink_caps_params); i++)
+		if (caps & phylink_caps_params[i].mask)
+			link_caps |= phylink_caps_params[i].caps_bit;
+
+	return link_caps;
+}
+
 /**
  * phylink_caps_to_linkmodes() - Convert capabilities to ethtool link modes
  * @linkmodes: ethtool linkmode mask (must be already initialised)
@@ -328,146 +346,15 @@ static struct {
 static void phylink_caps_to_linkmodes(unsigned long *linkmodes,
 				      unsigned long caps)
 {
+	unsigned long link_caps = phylink_caps_to_link_caps(caps);
+
 	if (caps & MAC_SYM_PAUSE)
 		__set_bit(ETHTOOL_LINK_MODE_Pause_BIT, linkmodes);
 
 	if (caps & MAC_ASYM_PAUSE)
 		__set_bit(ETHTOOL_LINK_MODE_Asym_Pause_BIT, linkmodes);
 
-	if (caps & MAC_10HD) {
-		__set_bit(ETHTOOL_LINK_MODE_10baseT_Half_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_10baseT1S_Half_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_10baseT1S_P2MP_Half_BIT, linkmodes);
-	}
-
-	if (caps & MAC_10FD) {
-		__set_bit(ETHTOOL_LINK_MODE_10baseT_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_10baseT1L_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_10baseT1S_Full_BIT, linkmodes);
-	}
-
-	if (caps & MAC_100HD) {
-		__set_bit(ETHTOOL_LINK_MODE_100baseT_Half_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_100baseFX_Half_BIT, linkmodes);
-	}
-
-	if (caps & MAC_100FD) {
-		__set_bit(ETHTOOL_LINK_MODE_100baseT_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_100baseT1_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_100baseFX_Full_BIT, linkmodes);
-	}
-
-	if (caps & MAC_1000HD)
-		__set_bit(ETHTOOL_LINK_MODE_1000baseT_Half_BIT, linkmodes);
-
-	if (caps & MAC_1000FD) {
-		__set_bit(ETHTOOL_LINK_MODE_1000baseT_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_1000baseKX_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_1000baseX_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_1000baseT1_Full_BIT, linkmodes);
-	}
-
-	if (caps & MAC_2500FD) {
-		__set_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_2500baseX_Full_BIT, linkmodes);
-	}
-
-	if (caps & MAC_5000FD)
-		__set_bit(ETHTOOL_LINK_MODE_5000baseT_Full_BIT, linkmodes);
-
-	if (caps & MAC_10000FD) {
-		__set_bit(ETHTOOL_LINK_MODE_10000baseT_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_10000baseKX4_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_10000baseKR_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_10000baseR_FEC_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_10000baseCR_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_10000baseSR_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_10000baseLR_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_10000baseLRM_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_10000baseER_Full_BIT, linkmodes);
-	}
-
-	if (caps & MAC_25000FD) {
-		__set_bit(ETHTOOL_LINK_MODE_25000baseCR_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_25000baseKR_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_25000baseSR_Full_BIT, linkmodes);
-	}
-
-	if (caps & MAC_40000FD) {
-		__set_bit(ETHTOOL_LINK_MODE_40000baseKR4_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_40000baseCR4_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_40000baseSR4_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_40000baseLR4_Full_BIT, linkmodes);
-	}
-
-	if (caps & MAC_50000FD) {
-		__set_bit(ETHTOOL_LINK_MODE_50000baseCR2_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_50000baseKR2_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_50000baseSR2_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_50000baseKR_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_50000baseSR_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_50000baseCR_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_50000baseLR_ER_FR_Full_BIT,
-			  linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_50000baseDR_Full_BIT, linkmodes);
-	}
-
-	if (caps & MAC_56000FD) {
-		__set_bit(ETHTOOL_LINK_MODE_56000baseKR4_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_56000baseCR4_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_56000baseSR4_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_56000baseLR4_Full_BIT, linkmodes);
-	}
-
-	if (caps & MAC_100000FD) {
-		__set_bit(ETHTOOL_LINK_MODE_100000baseKR4_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_100000baseSR4_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_100000baseCR4_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_100000baseLR4_ER4_Full_BIT,
-			  linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_100000baseKR2_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_100000baseSR2_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_100000baseCR2_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_100000baseLR2_ER2_FR2_Full_BIT,
-			  linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_100000baseDR2_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_100000baseKR_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_100000baseSR_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_100000baseLR_ER_FR_Full_BIT,
-			  linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_100000baseCR_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_100000baseDR_Full_BIT, linkmodes);
-	}
-
-	if (caps & MAC_200000FD) {
-		__set_bit(ETHTOOL_LINK_MODE_200000baseKR4_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_200000baseSR4_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_200000baseLR4_ER4_FR4_Full_BIT,
-			  linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_200000baseDR4_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_200000baseCR4_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_200000baseKR2_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_200000baseSR2_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_200000baseLR2_ER2_FR2_Full_BIT,
-			  linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_200000baseDR2_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_200000baseCR2_Full_BIT, linkmodes);
-	}
-
-	if (caps & MAC_400000FD) {
-		__set_bit(ETHTOOL_LINK_MODE_400000baseKR8_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_400000baseSR8_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_400000baseLR8_ER8_FR8_Full_BIT,
-			  linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_400000baseDR8_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_400000baseCR8_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_400000baseKR4_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_400000baseSR4_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_400000baseLR4_ER4_FR4_Full_BIT,
-			  linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_400000baseDR4_Full_BIT, linkmodes);
-		__set_bit(ETHTOOL_LINK_MODE_400000baseCR4_Full_BIT, linkmodes);
-	}
+	phy_caps_linkmodes(link_caps, linkmodes);
 }
 
 /**
-- 
2.48.1


