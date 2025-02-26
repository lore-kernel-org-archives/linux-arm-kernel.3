Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F2AC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 10:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/w7BQyIiPpV4zPRkyKLRGrqXvrGqvxHrkRYXlg5xSSk=; b=wFNecOx+jFTLpqpdwQtcyrBnDZ
	I9kaRWQLussAS1OS8faxJx0W0nRxZi2EExfZ2khypJQ+UfXqrUqAPyDtIxTbAEg9+ZSRFDPbHGfs1
	QHBWG5F0Z9cYs9wg/iZEYRS9ID0zPdxyjh3USc8XNBlvuooPGbKsfqxW9lY83F1snAaHvOf4KDY9z
	BggvczLUXhS7ZKnWgYOlHLRvmds9jwPjM1LM16UAFKcXjn73bK65oBqTw6F9dNHE/dZrmrqoFhF0s
	C04IjhiaUxuDTjmk331wXfHZUGbKTVYb8DHOoK7TWluRs/+jO1r5mP9OauzFMxKCOQjMbavlN1GKw
	Fu2waWxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnEV1-00000003GXl-2eoL;
	Wed, 26 Feb 2025 10:18:43 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnEMG-00000003EFo-0ON8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 10:09:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AE6B243205;
	Wed, 26 Feb 2025 10:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740564578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/w7BQyIiPpV4zPRkyKLRGrqXvrGqvxHrkRYXlg5xSSk=;
	b=c8eEFAdS+zaX3hYwdfaFYOqYUIalOGfx/pa5HSdQhuIzQdWLWsZz+drc+5olEsAr10YRCP
	+EdOjp4QqDEGtproEhC8cyS6nLzJHsTrNX2tBxmx7mUIk1QiPik44ANSxQcn18EBFitv4v
	WPAa49t+aENONpfKoG92A1eYA1sa+zc3PtyQA/38IY+CGaeftMvuiRVLV7L7zwpLPUr3vq
	FgrMpNwKQs61xkyOHcbnAOJgHQpGBBw1N71IG+0VBV0Me3/pGx/QR97OsVha8AFPOFxl/+
	mW36vT1qbuCyjZbcvq4vBHGXDoFxo7N/iTUsg6VXIFSvxtTYpW40dDy3ycsUcQ==
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
Subject: [PATCH net-next v2 04/13] net: phy: phy_caps: Move __set_linkmode_max_speed to phy_caps
Date: Wed, 26 Feb 2025 11:09:19 +0100
Message-ID: <20250226100929.1646454-5-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226100929.1646454-1-maxime.chevallier@bootlin.com>
References: <20250226100929.1646454-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekgeeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgedtffelffelveeuleelgfejfeevvdejhfehgeefgfffvdefteegvedutefftdenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgri
 igvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_020940_261626_49671417 
X-CRM114-Status: GOOD (  14.25  )
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
V1 -> V2: - No changes

 drivers/net/phy/phy-caps.h |  2 ++
 drivers/net/phy/phy-core.c | 18 +++---------------
 drivers/net/phy/phy_caps.c | 16 ++++++++++++++++
 3 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/net/phy/phy-caps.h b/drivers/net/phy/phy-caps.h
index f8cdfdb09242..3f011b63a417 100644
--- a/drivers/net/phy/phy-caps.h
+++ b/drivers/net/phy/phy-caps.h
@@ -43,5 +43,7 @@ void phy_caps_init(void);
 
 size_t phy_caps_speeds(unsigned int *speeds, size_t size,
 		       unsigned long *linkmodes);
+void phy_caps_linkmode_max_speed(u32 max_speed, unsigned long *linkmodes);
+
 
 #endif /* __PHY_CAPS_H */
diff --git a/drivers/net/phy/phy-core.c b/drivers/net/phy/phy-core.c
index 8533e57c3500..f62bc1be67b2 100644
--- a/drivers/net/phy/phy-core.c
+++ b/drivers/net/phy/phy-core.c
@@ -7,6 +7,7 @@
 #include <linux/of.h>
 
 #include "phylib-internal.h"
+#include "phy-caps.h"
 
 /**
  * phy_speed_to_str - Return a string representing the PHY link speed
@@ -339,22 +340,9 @@ phy_lookup_setting(int speed, int duplex, const unsigned long *mask, bool exact)
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
@@ -557,7 +545,7 @@ int phy_speed_down_core(struct phy_device *phydev)
 	if (min_common_speed == SPEED_UNKNOWN)
 		return -EINVAL;
 
-	__set_linkmode_max_speed(min_common_speed, phydev->advertising);
+	phy_caps_linkmode_max_speed(min_common_speed, phydev->advertising);
 
 	return 0;
 }
diff --git a/drivers/net/phy/phy_caps.c b/drivers/net/phy/phy_caps.c
index e5c716365b36..9075f9840ebd 100644
--- a/drivers/net/phy/phy_caps.c
+++ b/drivers/net/phy/phy_caps.c
@@ -103,3 +103,19 @@ size_t phy_caps_speeds(unsigned int *speeds, size_t size,
 
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
+	int capa;
+
+	for (capa = __LINK_CAPA_LAST; capa >= 0; capa--)
+		if (link_caps[capa].speed > max_speed)
+			linkmode_andnot(linkmodes, linkmodes, link_caps[capa].linkmodes);
+		else
+			break;
+}
-- 
2.48.1


