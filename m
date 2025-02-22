Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531E3C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 14:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wmmg9navronSyQ4+/XYzTz61N+nbDrv+8Jc8cTam9yo=; b=qjbA9+45F3BrGd74XL+Kku6FGA
	3eo8Ehp+6HEj5I5IAN+y1dXpqnxdHXf+krrVnAqLXIOdaEFzF4Wqh7G26SK/5hsEJ3/o7de4AfmG6
	x+GKQDo3uDrT0lCaRDte2COfU+T8ZzLG6vneJBheN0dSews/Cxu3xJaL+IfAQ0r0WF4rozOhkHSU8
	y7hRG1o9GfDHasBM4sW2XgC1Uxm7h8nVloi/Y7yhSB0yyw8QJJW0uvxmOhmx+NIIOrty8nNLM207R
	13Mc1lV0uePXgMOTaQjCcnzwy+rVsZ2bm4XNvWc94Avg7LzHKKjjs6AjmGUyFxAEdwUTZ8c1D4pyL
	03RXvSIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlqgn-00000008BtH-2Nqu;
	Sat, 22 Feb 2025 14:41:09 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlqTo-000000089zt-0ZPc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 14:27:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 91BF944280;
	Sat, 22 Feb 2025 14:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740234462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wmmg9navronSyQ4+/XYzTz61N+nbDrv+8Jc8cTam9yo=;
	b=Jg1TU0e4so+pwVNRytnyljX3zaY5ECHg1frorqiYl8FRuJICIN3kLFoQQrMnAPc1aFNO1a
	rkp7xqyU5sgNKqM7uERlKx8WaCPHCSCXAQLLGVtZeHnosJX8HYqecQV1NBp66wQnU+Kmcb
	tmwLGZt/j4XB5PTzbCLm+1iBbMXDYa/74v0LH/Of/7HzohabScr8HgpjLgqrRe+w4vcF4o
	rr/iAA2zEzTXrDG1cPf+OYIAKEEDp7c45Juo4e+fOYB/jT30GgdNLDbdY28S5gfGOGK1Cy
	TFxpwOaTO896UIvu7MNuE7ejzVhhsNRWGjaHWPHXk4PEigON4S/RLbab+YffmA==
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
Subject: [PATCH net-next 08/13] net: phy: phy_caps: Introduce link_caps_valid
Date: Sat, 22 Feb 2025 15:27:20 +0100
Message-ID: <20250222142727.894124-9-maxime.chevallier@bootlin.com>
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
X-CRM114-CacheID: sfid-20250222_062744_335773_027CCFDF 
X-CRM114-Status: GOOD (  12.45  )
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

With the link_capabilities array, it's trivial to validate a given mask
againts a <speed, duplex> tuple. Create a helper for that purpose, and
use it to replace a phy_settings lookup in phy_check_valid();

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phy-caps.h |  1 +
 drivers/net/phy/phy.c      |  2 +-
 drivers/net/phy/phy_caps.c | 13 +++++++++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/phy-caps.h b/drivers/net/phy/phy-caps.h
index 55d83661fa18..8d84882343f8 100644
--- a/drivers/net/phy/phy-caps.h
+++ b/drivers/net/phy/phy-caps.h
@@ -24,6 +24,7 @@ int phy_interface_max_speed(phy_interface_t interface);
 size_t phy_caps_speeds(unsigned int *speeds, size_t size,
 		       unsigned long *linkmodes);
 void phy_caps_linkmode_max_speed(u32 max_speed, unsigned long *linkmodes);
+bool phy_caps_valid(int speed, int duplex, const unsigned long *linkmodes);
 
 
 #endif /* __PHY_CAPS_H */
diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index 2b9e326bad61..cb73293f7bce 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -259,7 +259,7 @@ unsigned int phy_supported_speeds(struct phy_device *phy,
  */
 bool phy_check_valid(int speed, int duplex, unsigned long *features)
 {
-	return !!phy_lookup_setting(speed, duplex, features, true);
+	return phy_caps_valid(speed, duplex, features);
 }
 EXPORT_SYMBOL(phy_check_valid);
 
diff --git a/drivers/net/phy/phy_caps.c b/drivers/net/phy/phy_caps.c
index cb7a5fa177b1..fb7996ee3bee 100644
--- a/drivers/net/phy/phy_caps.c
+++ b/drivers/net/phy/phy_caps.c
@@ -145,6 +145,19 @@ void phy_caps_linkmode_max_speed(u32 max_speed, unsigned long *linkmodes)
 			break;
 }
 
+/**
+ * phy_caps_valid() - Validate a linkmodes set agains given speed and duplex
+ */
+bool phy_caps_valid(int speed, int duplex, const unsigned long *linkmodes)
+{
+	int capa = speed_duplex_to_capa(speed, duplex);
+
+	if (capa < 0)
+		return false;
+
+	return linkmode_intersects(link_caps[capa].linkmodes, linkmodes);
+}
+
 /**
  * linkmode_from_caps() - Convert capabilities to ethtool link modes
  * @linkmodes: ethtool linkmode mask (must be already initialised)
-- 
2.48.1


