Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB62C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 15:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8BXXyCpLWQKQZUulgdadmp4AJPph07YjhBF0pamvEL4=; b=BISxbxT1n+L7KDyy22GetCb/NT
	x9ih5aAQePQN3UoVOVmJc2zv8RMIgDDyFtgUcK7xb+2rC94Pv4hEExQvlJqKdtTzhH69G1MXIif/2
	JV18QW8/7i7ENr2XvI+Dm7bWng0JKlOMk4E9s9mdpD1KG4ya/eEZ/CY4ed7TpB/hjvwbcG4HWrl4W
	MewKgorbHQp7jhsahU+JY8vbJw8bAtB8YK/FbmRx9Kh/z3OI5EP5oSe9mUhv18KI8AhoJGetHFGj9
	x7GYXuR/aTku3WMHNYIx3FI14AFZQhfkPEOlQ/7JZX4okcWFvg2iVZsCNju57gSc4spPNYrYZijmR
	An3Yyy7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1zb-0000000BOi0-1SO1;
	Fri, 28 Feb 2025 15:09:35 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to1mG-0000000BLfH-0BP2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 14:55:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 981AA433FE;
	Fri, 28 Feb 2025 14:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740754546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8BXXyCpLWQKQZUulgdadmp4AJPph07YjhBF0pamvEL4=;
	b=M3IIsWjLF33yiO5I7ZPBF9y3jEoFFzKzuqqcZecm9T56n6qblRVusjKIvQFjqDgBzvXoBL
	Iz32qiS7w1BUQdeMdRRvrrwtbgH5qjMDxfVMaXJkBJL2C8ASXf+HlNb4UD0qUB4qGvB+6L
	Z5MnjKnywqi0ShhPwIJzRP4wXaLRlwZOIWAqeT8nEhnxGaXhkvCdbINdTwImy4MRI2OTA/
	bt1ysXKkENp04DAzhDMfwbZuoKhgCW1TuCYEahQwOlUkD/46owZ9fw9itn2sj0TpR1bW3E
	y6dPC51zCuqNLvBAxhpCu85xwEj0yPAzzTxTTyVmT1Cb7I8rhx9fNbQA1lWuwA==
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
Subject: [PATCH net-next v3 03/13] net: phy: phy_caps: Move phy_speeds to phy_caps
Date: Fri, 28 Feb 2025 15:55:28 +0100
Message-ID: <20250228145540.2209551-4-maxime.chevallier@bootlin.com>
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
X-CRM114-CacheID: sfid-20250228_065548_254345_ABD047A8 
X-CRM114-Status: GOOD (  17.36  )
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
 drivers/net/phy/phy.c      |  3 ++-
 drivers/net/phy/phy_caps.c | 27 +++++++++++++++++++++++++++
 include/linux/phy.h        |  2 --
 5 files changed, 32 insertions(+), 18 deletions(-)

diff --git a/drivers/net/phy/phy-caps.h b/drivers/net/phy/phy-caps.h
index 846d483269f6..f8cdfdb09242 100644
--- a/drivers/net/phy/phy-caps.h
+++ b/drivers/net/phy/phy-caps.h
@@ -41,4 +41,7 @@ struct link_capabilities {
 
 void phy_caps_init(void);
 
+size_t phy_caps_speeds(unsigned int *speeds, size_t size,
+		       unsigned long *linkmodes);
+
 #endif /* __PHY_CAPS_H */
diff --git a/drivers/net/phy/phy-core.c b/drivers/net/phy/phy-core.c
index b1c1670de23b..8533e57c3500 100644
--- a/drivers/net/phy/phy-core.c
+++ b/drivers/net/phy/phy-core.c
@@ -339,21 +339,6 @@ phy_lookup_setting(int speed, int duplex, const unsigned long *mask, bool exact)
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
index 16ffc00b419c..3128df03feda 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -37,6 +37,7 @@
 #include <net/sock.h>
 
 #include "phylib-internal.h"
+#include "phy-caps.h"
 
 #define PHY_STATE_TIME	HZ
 
@@ -245,7 +246,7 @@ unsigned int phy_supported_speeds(struct phy_device *phy,
 				  unsigned int *speeds,
 				  unsigned int size)
 {
-	return phy_speeds(speeds, size, phy->supported);
+	return phy_caps_speeds(speeds, size, phy->supported);
 }
 
 /**
diff --git a/drivers/net/phy/phy_caps.c b/drivers/net/phy/phy_caps.c
index 367ca7110ddc..e5c716365b36 100644
--- a/drivers/net/phy/phy_caps.c
+++ b/drivers/net/phy/phy_caps.c
@@ -76,3 +76,30 @@ void phy_caps_init(void)
 		__set_bit(i, link_caps[capa].linkmodes);
 	}
 }
+
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
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 7bfbae51070a..5749aad96862 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1322,8 +1322,6 @@ struct phy_setting {
 const struct phy_setting *
 phy_lookup_setting(int speed, int duplex, const unsigned long *mask,
 		   bool exact);
-size_t phy_speeds(unsigned int *speeds, size_t size,
-		  unsigned long *mask);
 
 /**
  * phy_is_started - Convenience function to check whether PHY is started
-- 
2.48.1


