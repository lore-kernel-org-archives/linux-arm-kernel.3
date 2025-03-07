Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9B2C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 17:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HVd3r6xyUhzL3YyY3xmXBLCsInUdeXPR3YjTneAcH4c=; b=vKvWZA0ypsEU1VZ1flXjf6uFrP
	VEf3oh9xOD7SQtpNl9rpFAzXId5VxtLJmVEX51TF6qGpS8WwBRsFcmw2nZ/x6O5IxKCHNTKAm+yFB
	w1wvmQUI0GogDKQW6XQsm9S4DkVYZ5TrVi2tQMDBZdJrq0WqJ5hj5QhoJKSL9p5FLv6Pjfd8NM6zH
	SOcNoB3k/ljik36EhqNAUtMbYHNSteE6cMvte4rE1bZ0TU1CREvQPbAM7ihSkqdv/EtSF4/aSS8hH
	6KuMrR0wToerjFA6JwapmYqVRV8/E7k1Uj9ed30L16d8+Cninpxt6C2O41XCP8ZsGywQBIRKMHPPO
	MGctZUUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbvr-0000000F8BX-1Aaa;
	Fri, 07 Mar 2025 17:56:23 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbcY-0000000F3zG-1wmV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 17:36:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A1B520479;
	Fri,  7 Mar 2025 17:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741368985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HVd3r6xyUhzL3YyY3xmXBLCsInUdeXPR3YjTneAcH4c=;
	b=UqSaJ9Odb+/iV2DBDMwtNuqm+7hlDAHnUg7Q4RSEjoOSVdzZZ0PXkofi6IODm4uU/llrfh
	OFf2hY/lDMBnk/PFoPyaZGPr9LUtah1+OGeRhTMkpb33Fgj0XF7kdMAWQj7EcL3Hc2p/fK
	WwEYeLLXWZ7LOW0aHsl5VOV7XsTZl1XN50rkL5N9Izwlot/FdIt6WJBjSiORpA8hLZVw/x
	JonZIeJrQzQZ6zym2CuSwnHmTmmJ7pZ6bIxlXcNJDAR3xSA/HE8nzDGPiPp1V/21fzsJCz
	bLeoC4QIWXXLHJzp/cDg2mE2+0Pjl2m8qJmLye1lUvB30VuycITrpBX8DtCkTA==
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
Subject: [PATCH net-next v5 08/13] net: phy: phy_device: Use link_capabilities lookup for PHY aneg config
Date: Fri,  7 Mar 2025 18:36:05 +0100
Message-ID: <20250307173611.129125-9-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307173611.129125-1-maxime.chevallier@bootlin.com>
References: <20250307173611.129125-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudduvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveegtdffleffleevueellefgjeefvedvjefhheegfefgffdvfeetgeevudetffdtnecukfhppedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvnecuvehluhhsthgvrhfuihiivgepjeenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgdphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvgguuhhmr
 giivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhm
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_093626_629381_9B73BF56 
X-CRM114-Status: GOOD (  10.37  )
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
index 4980862398d0..3f734e847e8e 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -2120,7 +2120,7 @@ EXPORT_SYMBOL(genphy_check_and_restart_aneg);
 int __genphy_config_aneg(struct phy_device *phydev, bool changed)
 {
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(fixed_advert);
-	const struct phy_setting *set;
+	const struct link_capabilities *c;
 	unsigned long *advert;
 	int err;
 
@@ -2146,10 +2146,11 @@ int __genphy_config_aneg(struct phy_device *phydev, bool changed)
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


