Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325AFC282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 15:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QvrhVbKI1SKMkdTAS8gvb11G1M+Jbls+rO/MMIxsRfk=; b=DRSnUV41iOXCSS2w1JqYfR4Eio
	UFTGFFOAEx77LXF+I7sL6Nu5rNTV5vC98a+Vd8J9X8p5NscsVXM663QlJIyewlNZqE5hGuvU9WY7O
	vAnUJNSh26T9yDQdskWdUoP2w9IEwL3fGumLlsIcEVcO7X9Lh5uE0Cru8qOKuIFsmYxxt8fFH+p/4
	OQu6MmPPtlCsRoz5K2n1DWrd50KGbM/HP3Z20/z+OwjhjvoH7/1fabGRQOqLv4YMyXRcntGcNxDlk
	P7krEE3UvuTdbatLgIw7/0kkL1tNh3jcO9rFGlpt5+xZRH8JHn+0iH05VXqAfq9BUCWborewffZS8
	7riYK9AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to27H-0000000BQi2-01Am;
	Fri, 28 Feb 2025 15:17:31 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to1mL-0000000BLip-0tAC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 14:55:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0630C443F7;
	Fri, 28 Feb 2025 14:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740754551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QvrhVbKI1SKMkdTAS8gvb11G1M+Jbls+rO/MMIxsRfk=;
	b=Rs+fMADMjR8/5JoeSMAyQC2iJ/rtY9rkekw8gZqiRRly4wJudgHG3KW7VGV2jv1UUdQ0tk
	8xhkWLlOQg0DlWdsxtSEI4NIZQwieuQhgqnXj3PBqv4Tk6pxcGvY41y8eb7IRJbRP5KyaS
	xX9DZRekYwjKx0upOQirci1EOFMzu3SZaia4SsYmC6h8Q/Zt2BfExsSd0XFjC3gGQ54SD1
	IB21KoRMsocfUF8ME5zJKJQATGdgk8i0LXo/llzCxqUI9ejbnjSefzbzjfp+0jU3fc3OUr
	YWIvRlAsV4fkMF+dUoJLvrTD6+/BcRlSBTLl3KwbfrkJmNeDl2lT/qI5WCiHwg==
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
Subject: [PATCH net-next v3 08/13] net: phy: phy_device: Use link_capabilities lookup for PHY aneg config
Date: Fri, 28 Feb 2025 15:55:33 +0100
Message-ID: <20250228145540.2209551-9-maxime.chevallier@bootlin.com>
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
X-CRM114-CacheID: sfid-20250228_065553_376017_14BE18B6 
X-CRM114-Status: GOOD (  10.19  )
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

When configuring PHY advertising with autoneg disabled, we lookd for an
exact linkmode to advertise and configure for the requested Speed and
Duplex, specially at or over 1G.

Using phy_caps_lookup allows us to build a list of the supported
linkmodes at that speed that we can advertise instead of the first mode
that matches.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phy_device.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 9c573555ac49..57b90ec6477e 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -2357,7 +2357,7 @@ EXPORT_SYMBOL(genphy_check_and_restart_aneg);
 int __genphy_config_aneg(struct phy_device *phydev, bool changed)
 {
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(fixed_advert);
-	const struct phy_setting *set;
+	const struct link_capabilities *c;
 	unsigned long *advert;
 	int err;
 
@@ -2383,10 +2383,11 @@ int __genphy_config_aneg(struct phy_device *phydev, bool changed)
 	} else {
 		linkmode_zero(fixed_advert);
 
-		set = phy_lookup_setting(phydev->speed, phydev->duplex,
-					 phydev->supported, true);
-		if (set)
-			linkmode_set_bit(set->bit, fixed_advert);
+		c = phy_caps_lookup(phydev->speed, phydev->duplex,
+				    phydev->supported, true);
+		if (c)
+			linkmode_and(fixed_advert, phydev->supported,
+				     c->linkmodes);
 
 		advert = fixed_advert;
 	}
-- 
2.48.1


