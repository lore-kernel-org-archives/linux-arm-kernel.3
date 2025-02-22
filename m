Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CF8C021B6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 14:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2UNvCkN0fpzej3UIf5ymdteSShbZX9J1yWWnwvU8K0=; b=dYot7v09nRCV89FK3yGY3N8VTR
	AmK6+hDv2dM/cbTj1YAbR3jvP2WcrhwMsbzGVIMFyaDI5cncCqZLxaNWrWlYofT/U1iESZH4bFj1s
	YdJ/ePk058uL77noyiQ+Bhk5/VSQBCr/3vThF2TWqZ8E2adOv5ymKrdbMibOBXhqxSHFLu1PBn++Y
	NFpfMQr+hRh3y2ONa9uNfdZCI85QjtmElsgcmJ2NPwYmKOl/yoaEd4tJJq6GCAYn0jjrbUkeATsoP
	iyhzv4OwiloPV9Qjvo8xkShy54KYiNL2m9vlhCtgQZwbzEt5r+FIQnTqhyNb7dbDsWF2538Kd8ZLw
	QS8g7Qyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlqfL-00000008BiY-3YPW;
	Sat, 22 Feb 2025 14:39:39 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlqTm-000000089zU-4A1H
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 14:27:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6DAA344283;
	Sat, 22 Feb 2025 14:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740234461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X2UNvCkN0fpzej3UIf5ymdteSShbZX9J1yWWnwvU8K0=;
	b=CvH19zSBYeFJTapfQEc9NnLd8JrQTqMhtcOH3XB9gIZUnjRH3LOwGNa+3axH+xOvqnULK4
	gxAhKEJ3PGRJtnwlf+8QgcurMoq4BBGU2X+gTE1Cbc7z6hGneQVMNcrf4HXIOCO0bGaSy3
	FcOGRWiBukPbUFMvCG05f8ygzegU3a8vHjsYlX6G+E3fO2bjuWom8oFE8tmPokLcf0Aqdd
	ZKWBpwa7Ygdi0XI3DuqsoQrrrRHkmUJ2QC7CFpPrJ+s+G971LiWWNtE8T/QY1jFOPR2Y5K
	+csuvGUZs7Ohwitl+aHHdEwDfMPLZtv2GeuBh3x6qGvWMnE9DsA1JAK2+BiqeQ==
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
Subject: [PATCH net-next 07/13] net: phy: phy_caps: Move __set_linkmode_max_speed to phy_caps
Date: Sat, 22 Feb 2025 15:27:19 +0100
Message-ID: <20250222142727.894124-8-maxime.chevallier@bootlin.com>
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
X-CRM114-CacheID: sfid-20250222_062743_188573_B3309A8C 
X-CRM114-Status: GOOD (  13.61  )
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
 drivers/net/phy/phy-core.c | 19 ++++---------------
 drivers/net/phy/phy_caps.c | 16 ++++++++++++++++
 3 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/net/phy/phy-caps.h b/drivers/net/phy/phy-caps.h
index d4cd91fd0911..55d83661fa18 100644
--- a/drivers/net/phy/phy-caps.h
+++ b/drivers/net/phy/phy-caps.h
@@ -23,5 +23,7 @@ int phy_interface_max_speed(phy_interface_t interface);
 
 size_t phy_caps_speeds(unsigned int *speeds, size_t size,
 		       unsigned long *linkmodes);
+void phy_caps_linkmode_max_speed(u32 max_speed, unsigned long *linkmodes);
+
 
 #endif /* __PHY_CAPS_H */
diff --git a/drivers/net/phy/phy-core.c b/drivers/net/phy/phy-core.c
index e2850d6fe158..300d47d4fd3c 100644
--- a/drivers/net/phy/phy-core.c
+++ b/drivers/net/phy/phy-core.c
@@ -6,6 +6,8 @@
 #include <linux/phy.h>
 #include <linux/of.h>
 
+#include "phy-caps.h"
+
 /**
  * phy_speed_to_str - Return a string representing the PHY link speed
  *
@@ -337,22 +339,9 @@ phy_lookup_setting(int speed, int duplex, const unsigned long *mask, bool exact)
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
@@ -556,7 +545,7 @@ int phy_speed_down_core(struct phy_device *phydev)
 	if (min_common_speed == SPEED_UNKNOWN)
 		return -EINVAL;
 
-	__set_linkmode_max_speed(min_common_speed, phydev->advertising);
+	phy_caps_linkmode_max_speed(min_common_speed, phydev->advertising);
 
 	return 0;
 }
diff --git a/drivers/net/phy/phy_caps.c b/drivers/net/phy/phy_caps.c
index ee8aa1217a6e..cb7a5fa177b1 100644
--- a/drivers/net/phy/phy_caps.c
+++ b/drivers/net/phy/phy_caps.c
@@ -129,6 +129,22 @@ size_t phy_caps_speeds(unsigned int *speeds, size_t size,
 	return count;
 }
 
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
+
 /**
  * linkmode_from_caps() - Convert capabilities to ethtool link modes
  * @linkmodes: ethtool linkmode mask (must be already initialised)
-- 
2.48.1


