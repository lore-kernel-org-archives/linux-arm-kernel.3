Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0FDC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 14:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tukj75GqJ+Hoa9XISdOd83+XDXwoMvCAbi8R9ZuI4IA=; b=1nX2wQAmbFD0Hn1pqmTPgKLGdI
	5k9tc9kTvQpw4pfcVkh21FpedA+ETiuWv9ws3qTMDKExdspjBswgrgyaTWew80iKgnykOL0nEJ/oi
	TzaCFJWE1O9JnrQAU8FbxA3q+pt5C9ahwVcKici+iPECsQ7Qgcz9KS60igqMC4rxD77R40rN+7BUJ
	j+UQJUJn8BPzYdChEQ9xDevDI7WQQfnpjQl+12rZQb6dn0AaDxR9QUWkTiAjxrrzSmCOnuqzfpBvk
	s2uyG+fob6hlARsHnMliXDutLNyR1v0OTLqBkD1e/elV5OBDtYWcqpgD/JjFe4AWE7XIxLPuQkfM+
	O8jGZ7RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlqdu-00000008BcJ-0eG8;
	Sat, 22 Feb 2025 14:38:10 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlqTm-000000089zN-1YhO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 14:27:43 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41BE644282;
	Sat, 22 Feb 2025 14:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740234460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tukj75GqJ+Hoa9XISdOd83+XDXwoMvCAbi8R9ZuI4IA=;
	b=LaFmkbT+hu1cn71bFT27D7Nyp3OPZPN6r6eW7AsoaxaHflZwooyhoFFc7e1+YcrDv4I1Bw
	bZGRgtreyMgvgrRbxZh2oHz8YkVKfaBfYPE5jCDOtI1m7Axf2QdJ2a/DwYkoR6oFDwHWj4
	EzjcJcqKDNV30ydAZE5O895fqezv3UYnpqsv+Ll/maEYku08nrLJzWmJRRj3WzgGwKLiV8
	b61DBzmNQmI7v9mTcReKKWujP9FSTSZgHGTgzn9ypgwAeZ94mwEipGZOttWNmRSBhG5x22
	YCrbhJ4BhExmOe0BpwIPs7G5vhdQgLYhNq4rMvBqKe4EC6xmxVS2aoqp3/+Fdw==
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
Subject: [PATCH net-next 06/13] net: phy: phy_caps: Move phy_speeds to phy_caps
Date: Sat, 22 Feb 2025 15:27:18 +0100
Message-ID: <20250222142727.894124-7-maxime.chevallier@bootlin.com>
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
X-CRM114-CacheID: sfid-20250222_062742_557576_3E875BC6 
X-CRM114-Status: GOOD (  17.44  )
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

Use the newly introduced link_capabilities array to derive the list of
possible speeds when given a combination of linkmodes. As
link_capabilities is indexed by speed, we don't have to iterate the
whole phy_settings array.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phy-caps.h |  3 +++
 drivers/net/phy/phy-core.c | 15 ---------------
 drivers/net/phy/phy.c      |  4 +++-
 drivers/net/phy/phy_caps.c | 27 +++++++++++++++++++++++++++
 include/linux/phy.h        |  2 --
 5 files changed, 33 insertions(+), 18 deletions(-)

diff --git a/drivers/net/phy/phy-caps.h b/drivers/net/phy/phy-caps.h
index 0c7543280fa3..d4cd91fd0911 100644
--- a/drivers/net/phy/phy-caps.h
+++ b/drivers/net/phy/phy-caps.h
@@ -21,4 +21,7 @@ void linkmode_from_caps(unsigned long *linkmode, unsigned long caps);
 unsigned long phy_interface_caps(phy_interface_t interface);
 int phy_interface_max_speed(phy_interface_t interface);
 
+size_t phy_caps_speeds(unsigned int *speeds, size_t size,
+		       unsigned long *linkmodes);
+
 #endif /* __PHY_CAPS_H */
diff --git a/drivers/net/phy/phy-core.c b/drivers/net/phy/phy-core.c
index 2fd1d153abc9..e2850d6fe158 100644
--- a/drivers/net/phy/phy-core.c
+++ b/drivers/net/phy/phy-core.c
@@ -337,21 +337,6 @@ phy_lookup_setting(int speed, int duplex, const unsigned long *mask, bool exact)
 }
 EXPORT_SYMBOL_GPL(phy_lookup_setting);
 
-size_t phy_speeds(unsigned int *speeds, size_t size,
-		  unsigned long *mask)
-{
-	size_t count;
-	int i;
-
-	for (i = 0, count = 0; i < ARRAY_SIZE(settings) && count < size; i++)
-		if (settings[i].bit < __ETHTOOL_LINK_MODE_MASK_NBITS &&
-		    test_bit(settings[i].bit, mask) &&
-		    (count == 0 || speeds[count - 1] != settings[i].speed))
-			speeds[count++] = settings[i].speed;
-
-	return count;
-}
-
 static void __set_linkmode_max_speed(u32 max_speed, unsigned long *addr)
 {
 	const struct phy_setting *p;
diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index 831b36839627..2b9e326bad61 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -36,6 +36,8 @@
 #include <net/genetlink.h>
 #include <net/sock.h>
 
+#include "phy-caps.h"
+
 #define PHY_STATE_TIME	HZ
 
 #define PHY_STATE_STR(_state)			\
@@ -243,7 +245,7 @@ unsigned int phy_supported_speeds(struct phy_device *phy,
 				  unsigned int *speeds,
 				  unsigned int size)
 {
-	return phy_speeds(speeds, size, phy->supported);
+	return phy_caps_speeds(speeds, size, phy->supported);
 }
 
 /**
diff --git a/drivers/net/phy/phy_caps.c b/drivers/net/phy/phy_caps.c
index 55ac08edf151..ee8aa1217a6e 100644
--- a/drivers/net/phy/phy_caps.c
+++ b/drivers/net/phy/phy_caps.c
@@ -102,6 +102,33 @@ void phy_caps_init(void)
 	}
 }
 
+/**
+ * phy_caps_speeds() - Fill an array of supported SPEED_* values for given modes
+ * @speeds: Output array to store the speeds list into
+ * @size: Size of the output array
+ * @linkmodes: Linkmodes to get the speeds from
+ *
+ * Fills the speeds array with all possible speeds that can be achieved with
+ * the specified linkmodes.
+ *
+ * Returns: The number of speeds filled into the array. If the input array isn't
+ *	    big enough to store all speeds, fill it as much as possible.
+ */
+size_t phy_caps_speeds(unsigned int *speeds, size_t size,
+		       unsigned long *linkmodes)
+{
+	size_t count;
+	int capa;
+
+	for (capa = 0, count = 0; capa < __LINK_CAPA_MAX && count < size; capa++) {
+		if (linkmode_intersects(link_caps[capa].linkmodes, linkmodes) &&
+		    (count == 0 || speeds[count - 1] != link_caps[capa].speed))
+			speeds[count++] = link_caps[capa].speed;
+	}
+
+	return count;
+}
+
 /**
  * linkmode_from_caps() - Convert capabilities to ethtool link modes
  * @linkmodes: ethtool linkmode mask (must be already initialised)
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 13be48d3b8b3..b582590427bc 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1329,8 +1329,6 @@ struct phy_setting {
 const struct phy_setting *
 phy_lookup_setting(int speed, int duplex, const unsigned long *mask,
 		   bool exact);
-size_t phy_speeds(unsigned int *speeds, size_t size,
-		  unsigned long *mask);
 void of_set_phy_supported(struct phy_device *phydev);
 void of_set_phy_eee_broken(struct phy_device *phydev);
 void of_set_phy_timing_role(struct phy_device *phydev);
-- 
2.48.1


