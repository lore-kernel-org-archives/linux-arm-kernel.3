Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E0DC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 17:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9XPDgnRDoWQel8ibR+WlIsojFp8JuySYKgsG+4W+VtY=; b=Lwun1jDREeaWAlheGQLm7tJEj2
	6/Gw6RqCFpltXd67n1g+JDgwUwxm5AuY8W3DT1WEhK+nFlTMiHejXKdhYmXftlXt1ermTSDHKVHHk
	CHio1k+bBTTAp77FYSbvbW5SQyEA+Jw7M9RwUWB7nMc73Yj+WvyUrfx3fpousspQBqbZhDIZWZFvc
	Wy3hH0wWwXoLqgDCzygOkAgUW1ClWsA4atWLTckQXemI/7rlqbIe5i4xNGCKUXrdOUhrM07e93UTT
	BVqWsNUMk/145mh4b0IZfDQNnblVAF+dr/54g0iy1HGuY0G/NzIrsq1ZS65h8yOupaoXUWCyqv5JV
	SApXyO3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbpT-0000000F70A-1hiB;
	Fri, 07 Mar 2025 17:49:47 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbcT-0000000F3wP-3nUf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 17:36:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4E452204CC;
	Fri,  7 Mar 2025 17:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741368980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9XPDgnRDoWQel8ibR+WlIsojFp8JuySYKgsG+4W+VtY=;
	b=gYJp48E+J63SzgYxdF97+2OJMP7vVJ+WIp0VJL52PPXVaE39dhtxSexFo+nkFvoB1H9g++
	5sy/dxaWEEy+nMkyiBeskDfI6zJwkegiX61OENPm53HwVpdRLzzJKDo9pur/QLYKBQ8Ggz
	M9V190fb6GTeIcDrptlbtaNnwEM7+yV+OA/Lhl+ueTLh/b6LV0jMwnM3HOSZnShyeDSWFl
	MSg4bRnIc0QSvW/tNUO4oPZ6z8myGtKcZMqvsJj+Zsb8q0VKXg/1SHqrYR9mXWIqiIb0V4
	/6bJOMb3+BvXE1zqmiAWy1ef+DkoKfnnYwk+kSLbpi+IZMFQXsBU56AekJFF5A==
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
Subject: [PATCH net-next v5 04/13] net: phy: phy_caps: Move __set_linkmode_max_speed to phy_caps
Date: Fri,  7 Mar 2025 18:36:01 +0100
Message-ID: <20250307173611.129125-5-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307173611.129125-1-maxime.chevallier@bootlin.com>
References: <20250307173611.129125-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudduvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveegtdffleffleevueellefgjeefvedvjefhheegfefgffdvfeetgeevudetffdtnecukfhppedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgdphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvgguuhhmr
 giivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhm
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_093622_093909_0A823B24 
X-CRM114-Status: GOOD (  15.63  )
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

Convert the __set_linkmode_max_speed to use the link_capabilities array.
This makes it easy to clamp the linkmodes to a given max speed.
Introduce a new helper phy_caps_linkmode_max_speed to replace the
previous one that used phy_settings.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phy-caps.h |  2 ++
 drivers/net/phy/phy-core.c | 18 +++---------------
 drivers/net/phy/phy_caps.c | 19 +++++++++++++++++++
 3 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/net/phy/phy-caps.h b/drivers/net/phy/phy-caps.h
index 5a5f4ee3006b..1bef9cca62c5 100644
--- a/drivers/net/phy/phy-caps.h
+++ b/drivers/net/phy/phy-caps.h
@@ -42,5 +42,7 @@ int phy_caps_init(void);
 
 size_t phy_caps_speeds(unsigned int *speeds, size_t size,
 		       unsigned long *linkmodes);
+void phy_caps_linkmode_max_speed(u32 max_speed, unsigned long *linkmodes);
+
 
 #endif /* __PHY_CAPS_H */
diff --git a/drivers/net/phy/phy-core.c b/drivers/net/phy/phy-core.c
index 542e9284d207..af2463e67cea 100644
--- a/drivers/net/phy/phy-core.c
+++ b/drivers/net/phy/phy-core.c
@@ -8,6 +8,7 @@
 
 #include "phylib.h"
 #include "phylib-internal.h"
+#include "phy-caps.h"
 
 /**
  * phy_speed_to_str - Return a string representing the PHY link speed
@@ -340,22 +341,9 @@ phy_lookup_setting(int speed, int duplex, const unsigned long *mask, bool exact)
 }
 EXPORT_SYMBOL_GPL(phy_lookup_setting);
 
-static void __set_linkmode_max_speed(u32 max_speed, unsigned long *addr)
-{
-	const struct phy_setting *p;
-	int i;
-
-	for (i = 0, p = settings; i < ARRAY_SIZE(settings); i++, p++) {
-		if (p->speed > max_speed)
-			linkmode_clear_bit(p->bit, addr);
-		else
-			break;
-	}
-}
-
 static void __set_phy_supported(struct phy_device *phydev, u32 max_speed)
 {
-	__set_linkmode_max_speed(max_speed, phydev->supported);
+	phy_caps_linkmode_max_speed(max_speed, phydev->supported);
 }
 
 /**
@@ -558,7 +546,7 @@ int phy_speed_down_core(struct phy_device *phydev)
 	if (min_common_speed == SPEED_UNKNOWN)
 		return -EINVAL;
 
-	__set_linkmode_max_speed(min_common_speed, phydev->advertising);
+	phy_caps_linkmode_max_speed(min_common_speed, phydev->advertising);
 
 	return 0;
 }
diff --git a/drivers/net/phy/phy_caps.c b/drivers/net/phy/phy_caps.c
index 8ce91257160f..d43493884ff7 100644
--- a/drivers/net/phy/phy_caps.c
+++ b/drivers/net/phy/phy_caps.c
@@ -60,6 +60,9 @@ static int speed_duplex_to_capa(int speed, unsigned int duplex)
 #define for_each_link_caps_asc_speed(cap) \
 	for (cap = link_caps; cap < &link_caps[__LINK_CAPA_MAX]; cap++)
 
+#define for_each_link_caps_desc_speed(cap) \
+	for (cap = &link_caps[__LINK_CAPA_MAX - 1]; cap >= link_caps; cap--)
+
 /**
  * phy_caps_init() - Initializes the link_caps array from the link_mode_params.
  *
@@ -121,3 +124,19 @@ size_t phy_caps_speeds(unsigned int *speeds, size_t size,
 
 	return count;
 }
+
+/**
+ * phy_caps_linkmode_max_speed() - Clamp a linkmodes set to a max speed
+ * @max_speed: Speed limit for the linkmode set
+ * @linkmodes: Linkmodes to limit
+ */
+void phy_caps_linkmode_max_speed(u32 max_speed, unsigned long *linkmodes)
+{
+	struct link_capabilities *lcap;
+
+	for_each_link_caps_desc_speed(lcap)
+		if (lcap->speed > max_speed)
+			linkmode_andnot(linkmodes, linkmodes, lcap->linkmodes);
+		else
+			break;
+}
-- 
2.48.1


