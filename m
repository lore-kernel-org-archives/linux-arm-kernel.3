Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C8FC021B5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 14:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fp7KP6Y53xqk/fsyDiO4ohhExI4+jwvcPEze3DUsVbw=; b=GjP9s17qiklhrdbgvQ1C7XrstN
	ZX8PIIQp5w4lk9KwS+i3JrEW5PtzNxiwx+a/mrJWKMufqg2NCfi/CxXAsqP6qdAyTfz5AuPh/xuXP
	wI7AeykEieB6jkBSe9OpNt3KBFAqYg9NE++s5K537zuuvn11RoZg//M7nNQ1A41cuBgNOv3RvmEP3
	5TCK+ba9WG0wRe7oJt+o/94qWD2iAwV5H2VkSEv5JtwlHdHbNXD72tgDFZucjb+DQ62x/e6GU8q3B
	nx/GIDCW+r1ivKknsTb0v4w0qJIblOaoIXi2OVHxjb4xw3piz1evwf0DUl2Ifnx3P0b/kXSsAjCQs
	YQ/9zrzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlqo0-00000008Cd3-4Bej;
	Sat, 22 Feb 2025 14:48:37 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlqTu-00000008A1i-00Cq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 14:27:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8F76744281;
	Sat, 22 Feb 2025 14:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740234468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fp7KP6Y53xqk/fsyDiO4ohhExI4+jwvcPEze3DUsVbw=;
	b=IpO0OoM6lub3w/uUvmVIVIvUi+BG0A1zlvjelEEtwI3J3n/w1L60GKWmB8liY6JhU2kX5B
	6GXxc4vvqQUmvSkctKITqh2OxLFrX0JdRaEDq1CgiAIihSG30Lcc3Qlrf8/QlsdjnR4aPZ
	WtDu3ty7jh9EUseS6K2JDmnlMr8kdGFtQ9GOMczhIYFbtqJCUgFCUInqc8/lfJeS1a7OH0
	3RX/Xz5Rsd5bZFeIpTThSEeTfh6Noz+mf97G+gEzBK91qD8zvlsLCY7oU8qiH7CEmohIvh
	81QSkk5WsXj1lNQJDTY+Rfv+9H5JtCK9K51Wc2Hfdq0pi4t1TA/LFjEyUcP5ww==
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
Subject: [PATCH net-next 13/13] net: phy: drop phy_settings and the associated lookup helpers
Date: Sat, 22 Feb 2025 15:27:25 +0100
Message-ID: <20250222142727.894124-14-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250222142727.894124-1-maxime.chevallier@bootlin.com>
References: <20250222142727.894124-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejfeduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgedtffelffelveeuleelgfejfeevvdejhfehgeefgfffvdefteegvedutefftdenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedutdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgdphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvgguuhhmr
 giivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhm
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_062750_172348_5AB571AF 
X-CRM114-Status: GOOD (  13.89  )
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

The phy_settings array is no longer relevant as it has now been replaced
by the link_caps array and associated phy_caps helpers.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phy-core.c | 184 -------------------------------------
 include/linux/phy.h        |  12 ---
 2 files changed, 196 deletions(-)

diff --git a/drivers/net/phy/phy-core.c b/drivers/net/phy/phy-core.c
index 98c58689fbf0..9b810c8a039a 100644
--- a/drivers/net/phy/phy-core.c
+++ b/drivers/net/phy/phy-core.c
@@ -155,190 +155,6 @@ int phy_interface_num_ports(phy_interface_t interface)
 }
 EXPORT_SYMBOL_GPL(phy_interface_num_ports);
 
-/* A mapping of all SUPPORTED settings to speed/duplex.  This table
- * must be grouped by speed and sorted in descending match priority
- * - iow, descending speed.
- */
-
-#define PHY_SETTING(s, d, b) { .speed = SPEED_ ## s, .duplex = DUPLEX_ ## d, \
-			       .bit = ETHTOOL_LINK_MODE_ ## b ## _BIT}
-
-static const struct phy_setting settings[] = {
-	/* 800G */
-	PHY_SETTING( 800000, FULL, 800000baseCR8_Full		),
-	PHY_SETTING( 800000, FULL, 800000baseKR8_Full		),
-	PHY_SETTING( 800000, FULL, 800000baseDR8_Full		),
-	PHY_SETTING( 800000, FULL, 800000baseDR8_2_Full		),
-	PHY_SETTING( 800000, FULL, 800000baseSR8_Full		),
-	PHY_SETTING( 800000, FULL, 800000baseVR8_Full		),
-	PHY_SETTING( 800000, FULL, 800000baseCR4_Full		),
-	PHY_SETTING( 800000, FULL, 800000baseKR4_Full		),
-	PHY_SETTING( 800000, FULL, 800000baseDR4_Full		),
-	PHY_SETTING( 800000, FULL, 800000baseDR4_2_Full		),
-	PHY_SETTING( 800000, FULL, 800000baseSR4_Full		),
-	PHY_SETTING( 800000, FULL, 800000baseVR4_Full		),
-	/* 400G */
-	PHY_SETTING( 400000, FULL, 400000baseCR8_Full		),
-	PHY_SETTING( 400000, FULL, 400000baseKR8_Full		),
-	PHY_SETTING( 400000, FULL, 400000baseLR8_ER8_FR8_Full	),
-	PHY_SETTING( 400000, FULL, 400000baseDR8_Full		),
-	PHY_SETTING( 400000, FULL, 400000baseSR8_Full		),
-	PHY_SETTING( 400000, FULL, 400000baseCR4_Full		),
-	PHY_SETTING( 400000, FULL, 400000baseKR4_Full		),
-	PHY_SETTING( 400000, FULL, 400000baseLR4_ER4_FR4_Full	),
-	PHY_SETTING( 400000, FULL, 400000baseDR4_Full		),
-	PHY_SETTING( 400000, FULL, 400000baseSR4_Full		),
-	PHY_SETTING( 400000, FULL, 400000baseCR2_Full		),
-	PHY_SETTING( 400000, FULL, 400000baseKR2_Full		),
-	PHY_SETTING( 400000, FULL, 400000baseDR2_Full		),
-	PHY_SETTING( 400000, FULL, 400000baseDR2_2_Full		),
-	PHY_SETTING( 400000, FULL, 400000baseSR2_Full		),
-	PHY_SETTING( 400000, FULL, 400000baseVR2_Full		),
-	/* 200G */
-	PHY_SETTING( 200000, FULL, 200000baseCR4_Full		),
-	PHY_SETTING( 200000, FULL, 200000baseKR4_Full		),
-	PHY_SETTING( 200000, FULL, 200000baseLR4_ER4_FR4_Full	),
-	PHY_SETTING( 200000, FULL, 200000baseDR4_Full		),
-	PHY_SETTING( 200000, FULL, 200000baseSR4_Full		),
-	PHY_SETTING( 200000, FULL, 200000baseCR2_Full		),
-	PHY_SETTING( 200000, FULL, 200000baseKR2_Full		),
-	PHY_SETTING( 200000, FULL, 200000baseLR2_ER2_FR2_Full	),
-	PHY_SETTING( 200000, FULL, 200000baseDR2_Full		),
-	PHY_SETTING( 200000, FULL, 200000baseSR2_Full		),
-	PHY_SETTING( 200000, FULL, 200000baseCR_Full		),
-	PHY_SETTING( 200000, FULL, 200000baseKR_Full		),
-	PHY_SETTING( 200000, FULL, 200000baseDR_Full		),
-	PHY_SETTING( 200000, FULL, 200000baseDR_2_Full		),
-	PHY_SETTING( 200000, FULL, 200000baseSR_Full		),
-	PHY_SETTING( 200000, FULL, 200000baseVR_Full		),
-	/* 100G */
-	PHY_SETTING( 100000, FULL, 100000baseCR4_Full		),
-	PHY_SETTING( 100000, FULL, 100000baseKR4_Full		),
-	PHY_SETTING( 100000, FULL, 100000baseLR4_ER4_Full	),
-	PHY_SETTING( 100000, FULL, 100000baseSR4_Full		),
-	PHY_SETTING( 100000, FULL, 100000baseCR2_Full		),
-	PHY_SETTING( 100000, FULL, 100000baseKR2_Full		),
-	PHY_SETTING( 100000, FULL, 100000baseLR2_ER2_FR2_Full	),
-	PHY_SETTING( 100000, FULL, 100000baseDR2_Full		),
-	PHY_SETTING( 100000, FULL, 100000baseSR2_Full		),
-	PHY_SETTING( 100000, FULL, 100000baseCR_Full		),
-	PHY_SETTING( 100000, FULL, 100000baseKR_Full		),
-	PHY_SETTING( 100000, FULL, 100000baseLR_ER_FR_Full	),
-	PHY_SETTING( 100000, FULL, 100000baseDR_Full		),
-	PHY_SETTING( 100000, FULL, 100000baseSR_Full		),
-	/* 56G */
-	PHY_SETTING(  56000, FULL,  56000baseCR4_Full	  	),
-	PHY_SETTING(  56000, FULL,  56000baseKR4_Full	  	),
-	PHY_SETTING(  56000, FULL,  56000baseLR4_Full	  	),
-	PHY_SETTING(  56000, FULL,  56000baseSR4_Full	  	),
-	/* 50G */
-	PHY_SETTING(  50000, FULL,  50000baseCR2_Full		),
-	PHY_SETTING(  50000, FULL,  50000baseKR2_Full		),
-	PHY_SETTING(  50000, FULL,  50000baseSR2_Full		),
-	PHY_SETTING(  50000, FULL,  50000baseCR_Full		),
-	PHY_SETTING(  50000, FULL,  50000baseKR_Full		),
-	PHY_SETTING(  50000, FULL,  50000baseLR_ER_FR_Full	),
-	PHY_SETTING(  50000, FULL,  50000baseDR_Full		),
-	PHY_SETTING(  50000, FULL,  50000baseSR_Full		),
-	/* 40G */
-	PHY_SETTING(  40000, FULL,  40000baseCR4_Full		),
-	PHY_SETTING(  40000, FULL,  40000baseKR4_Full		),
-	PHY_SETTING(  40000, FULL,  40000baseLR4_Full		),
-	PHY_SETTING(  40000, FULL,  40000baseSR4_Full		),
-	/* 25G */
-	PHY_SETTING(  25000, FULL,  25000baseCR_Full		),
-	PHY_SETTING(  25000, FULL,  25000baseKR_Full		),
-	PHY_SETTING(  25000, FULL,  25000baseSR_Full		),
-	/* 20G */
-	PHY_SETTING(  20000, FULL,  20000baseKR2_Full		),
-	PHY_SETTING(  20000, FULL,  20000baseMLD2_Full		),
-	/* 10G */
-	PHY_SETTING(  10000, FULL,  10000baseCR_Full		),
-	PHY_SETTING(  10000, FULL,  10000baseER_Full		),
-	PHY_SETTING(  10000, FULL,  10000baseKR_Full		),
-	PHY_SETTING(  10000, FULL,  10000baseKX4_Full		),
-	PHY_SETTING(  10000, FULL,  10000baseLR_Full		),
-	PHY_SETTING(  10000, FULL,  10000baseLRM_Full		),
-	PHY_SETTING(  10000, FULL,  10000baseR_FEC		),
-	PHY_SETTING(  10000, FULL,  10000baseSR_Full		),
-	PHY_SETTING(  10000, FULL,  10000baseT_Full		),
-	/* 5G */
-	PHY_SETTING(   5000, FULL,   5000baseT_Full		),
-	/* 2.5G */
-	PHY_SETTING(   2500, FULL,   2500baseT_Full		),
-	PHY_SETTING(   2500, FULL,   2500baseX_Full		),
-	/* 1G */
-	PHY_SETTING(   1000, FULL,   1000baseT_Full		),
-	PHY_SETTING(   1000, HALF,   1000baseT_Half		),
-	PHY_SETTING(   1000, FULL,   1000baseT1_Full		),
-	PHY_SETTING(   1000, FULL,   1000baseX_Full		),
-	PHY_SETTING(   1000, FULL,   1000baseKX_Full		),
-	/* 100M */
-	PHY_SETTING(    100, FULL,    100baseT_Full		),
-	PHY_SETTING(    100, FULL,    100baseT1_Full		),
-	PHY_SETTING(    100, HALF,    100baseT_Half		),
-	PHY_SETTING(    100, HALF,    100baseFX_Half		),
-	PHY_SETTING(    100, FULL,    100baseFX_Full		),
-	/* 10M */
-	PHY_SETTING(     10, FULL,     10baseT_Full		),
-	PHY_SETTING(     10, HALF,     10baseT_Half		),
-	PHY_SETTING(     10, FULL,     10baseT1L_Full		),
-	PHY_SETTING(     10, FULL,     10baseT1S_Full		),
-	PHY_SETTING(     10, HALF,     10baseT1S_Half		),
-	PHY_SETTING(     10, HALF,     10baseT1S_P2MP_Half	),
-	PHY_SETTING(     10, FULL,     10baseT1BRR_Full		),
-};
-#undef PHY_SETTING
-
-/**
- * phy_lookup_setting - lookup a PHY setting
- * @speed: speed to match
- * @duplex: duplex to match
- * @mask: allowed link modes
- * @exact: an exact match is required
- *
- * Search the settings array for a setting that matches the speed and
- * duplex, and which is supported.
- *
- * If @exact is unset, either an exact match or %NULL for no match will
- * be returned.
- *
- * If @exact is set, an exact match, the fastest supported setting at
- * or below the specified speed, the slowest supported setting, or if
- * they all fail, %NULL will be returned.
- */
-const struct phy_setting *
-phy_lookup_setting(int speed, int duplex, const unsigned long *mask, bool exact)
-{
-	const struct phy_setting *p, *match = NULL, *last = NULL;
-	int i;
-
-	for (i = 0, p = settings; i < ARRAY_SIZE(settings); i++, p++) {
-		if (p->bit < __ETHTOOL_LINK_MODE_MASK_NBITS &&
-		    test_bit(p->bit, mask)) {
-			last = p;
-			if (p->speed == speed && p->duplex == duplex) {
-				/* Exact match for speed and duplex */
-				match = p;
-				break;
-			} else if (!exact) {
-				if (!match && p->speed <= speed)
-					/* Candidate */
-					match = p;
-
-				if (p->speed < speed)
-					break;
-			}
-		}
-	}
-
-	if (!match && !exact)
-		match = last;
-
-	return match;
-}
-EXPORT_SYMBOL_GPL(phy_lookup_setting);
-
 static void __set_phy_supported(struct phy_device *phydev, u32 max_speed)
 {
 	phy_caps_linkmode_max_speed(max_speed, phydev->supported);
diff --git a/include/linux/phy.h b/include/linux/phy.h
index b582590427bc..f66340c26982 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1317,18 +1317,6 @@ const char *phy_rate_matching_to_str(int rate_matching);
 
 int phy_interface_num_ports(phy_interface_t interface);
 
-/* A structure for mapping a particular speed and duplex
- * combination to a particular SUPPORTED and ADVERTISED value
- */
-struct phy_setting {
-	u32 speed;
-	u8 duplex;
-	u8 bit;
-};
-
-const struct phy_setting *
-phy_lookup_setting(int speed, int duplex, const unsigned long *mask,
-		   bool exact);
 void of_set_phy_supported(struct phy_device *phydev);
 void of_set_phy_eee_broken(struct phy_device *phydev);
 void of_set_phy_timing_role(struct phy_device *phydev);
-- 
2.48.1


