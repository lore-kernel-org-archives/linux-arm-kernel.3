Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483E8C282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 15:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MyQ7M51WXcJl0powGY6xoKP5Abak0f6Ih7qqeXgXjj4=; b=g30r6q5LDvlRvfHqOjTncx5Ok0
	6/0vJ7DHBvsWDL/27SJrqVaYpz6vcoubzCo2n3BS5lp4II3/Hs+Fml0BlZQHa9DfTrbrcCTmbm6nI
	SMK85vJ6nEcpEcm4j83D++Z1SaGOrsJ9WogEU83fF9Gr4l7hCY0nrnSTDWSixjY7KvOjcL2qLnl1A
	utIAZo/7wKpox4/W8R0onVc2Qs6lgnESaWFtWhfEAuVD+uMDb4eCTyrSlWP25zWQhTeQnkExomMH9
	Iz2xzN870KTUcoofveKKqTubE6f09XnpJ69IBjM61HXmu1SiQw91MoBpyOT+fYVQB55zMKb6qu9Fs
	Vni52QXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to2Bs-0000000BRuy-0NpN;
	Fri, 28 Feb 2025 15:22:16 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to1mO-0000000BLl8-21wN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 14:55:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 172AF443F9;
	Fri, 28 Feb 2025 14:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740754555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MyQ7M51WXcJl0powGY6xoKP5Abak0f6Ih7qqeXgXjj4=;
	b=BU9AeyyTwP88HwyTn/n7Vv+aD6Y53CYI2f0o6WXA3ps/VXqUf7Iyu/rjyXEfCrLVmduwj9
	CFtGKyAOWrzsF4wA11ZMFWZ9HueEzJJQpisdUYHGAYYA6SaXk020CdIlKBxauAW010ckCm
	+aSRCPid16mmJcXfoAkMV18xRj46U9edGtledxl5dtqAG/T5WG6Dn21+LY/vzeQfpexZN6
	kv23u/kFPXHcw1Ycll+3rHLLT0aWG6U11nFonyo0ofDmLRWmKwe7+c/72xh/WnYuDTPbeA
	uLnxxq0kVP/P6Cb6MYMLesJG8DfDzaRrr3TZoEOzWoWDqZNV2Yrrmd4Jc5O1/g==
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
Subject: [PATCH net-next v3 11/13] net: phylink: Add a mapping between MAC_CAPS and LINK_CAPS
Date: Fri, 28 Feb 2025 15:55:36 +0100
Message-ID: <20250228145540.2209551-12-maxime.chevallier@bootlin.com>
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
X-CRM114-CacheID: sfid-20250228_065556_686834_42813E4C 
X-CRM114-Status: GOOD (  11.51  )
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

phylink allows MAC drivers to report the capabilities in terms of speed,
duplex and pause support. This is done through a dedicated set of enum
values in the form of the MAC_ capabilities. They are very close to what
the LINK_CAPA_xxx can express, with the difference that LINK_CAPA don't
have any information about Pause/Asym Pause support.

To prepare converting phylink to using the phy_caps, add the mapping
between MAC capabilities and phy_caps. While doing so, we move the
phylink_caps_params array up a bit to simplify future commits.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phylink.c | 49 ++++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 24 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 63fbf3d8708a..aaf07094b821 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -292,6 +292,31 @@ static int phylink_interface_max_speed(phy_interface_t interface)
 	return SPEED_UNKNOWN;
 }
 
+static struct {
+	unsigned long mask;
+	int speed;
+	unsigned int duplex;
+	unsigned int caps_bit;
+} phylink_caps_params[] = {
+	{ MAC_400000FD, SPEED_400000, DUPLEX_FULL, BIT(LINK_CAPA_400000FD) },
+	{ MAC_200000FD, SPEED_200000, DUPLEX_FULL, BIT(LINK_CAPA_200000FD) },
+	{ MAC_100000FD, SPEED_100000, DUPLEX_FULL, BIT(LINK_CAPA_100000FD) },
+	{ MAC_56000FD,  SPEED_56000,  DUPLEX_FULL, BIT(LINK_CAPA_56000FD) },
+	{ MAC_50000FD,  SPEED_50000,  DUPLEX_FULL, BIT(LINK_CAPA_50000FD) },
+	{ MAC_40000FD,  SPEED_40000,  DUPLEX_FULL, BIT(LINK_CAPA_40000FD) },
+	{ MAC_25000FD,  SPEED_25000,  DUPLEX_FULL, BIT(LINK_CAPA_25000FD) },
+	{ MAC_20000FD,  SPEED_20000,  DUPLEX_FULL, BIT(LINK_CAPA_20000FD) },
+	{ MAC_10000FD,  SPEED_10000,  DUPLEX_FULL, BIT(LINK_CAPA_10000FD) },
+	{ MAC_5000FD,   SPEED_5000,   DUPLEX_FULL, BIT(LINK_CAPA_5000FD) },
+	{ MAC_2500FD,   SPEED_2500,   DUPLEX_FULL, BIT(LINK_CAPA_2500FD) },
+	{ MAC_1000FD,   SPEED_1000,   DUPLEX_FULL, BIT(LINK_CAPA_1000FD) },
+	{ MAC_1000HD,   SPEED_1000,   DUPLEX_HALF, BIT(LINK_CAPA_1000HD) },
+	{ MAC_100FD,    SPEED_100,    DUPLEX_FULL, BIT(LINK_CAPA_100FD) },
+	{ MAC_100HD,    SPEED_100,    DUPLEX_HALF, BIT(LINK_CAPA_100HD) },
+	{ MAC_10FD,     SPEED_10,     DUPLEX_FULL, BIT(LINK_CAPA_10FD) },
+	{ MAC_10HD,     SPEED_10,     DUPLEX_HALF, BIT(LINK_CAPA_10HD) },
+};
+
 /**
  * phylink_caps_to_linkmodes() - Convert capabilities to ethtool link modes
  * @linkmodes: ethtool linkmode mask (must be already initialised)
@@ -445,30 +470,6 @@ static void phylink_caps_to_linkmodes(unsigned long *linkmodes,
 	}
 }
 
-static struct {
-	unsigned long mask;
-	int speed;
-	unsigned int duplex;
-} phylink_caps_params[] = {
-	{ MAC_400000FD, SPEED_400000, DUPLEX_FULL },
-	{ MAC_200000FD, SPEED_200000, DUPLEX_FULL },
-	{ MAC_100000FD, SPEED_100000, DUPLEX_FULL },
-	{ MAC_56000FD,  SPEED_56000,  DUPLEX_FULL },
-	{ MAC_50000FD,  SPEED_50000,  DUPLEX_FULL },
-	{ MAC_40000FD,  SPEED_40000,  DUPLEX_FULL },
-	{ MAC_25000FD,  SPEED_25000,  DUPLEX_FULL },
-	{ MAC_20000FD,  SPEED_20000,  DUPLEX_FULL },
-	{ MAC_10000FD,  SPEED_10000,  DUPLEX_FULL },
-	{ MAC_5000FD,   SPEED_5000,   DUPLEX_FULL },
-	{ MAC_2500FD,   SPEED_2500,   DUPLEX_FULL },
-	{ MAC_1000FD,   SPEED_1000,   DUPLEX_FULL },
-	{ MAC_1000HD,   SPEED_1000,   DUPLEX_HALF },
-	{ MAC_100FD,    SPEED_100,    DUPLEX_FULL },
-	{ MAC_100HD,    SPEED_100,    DUPLEX_HALF },
-	{ MAC_10FD,     SPEED_10,     DUPLEX_FULL },
-	{ MAC_10HD,     SPEED_10,     DUPLEX_HALF },
-};
-
 /**
  * phylink_limit_mac_speed - limit the phylink_config to a maximum speed
  * @config: pointer to a &struct phylink_config
-- 
2.48.1


