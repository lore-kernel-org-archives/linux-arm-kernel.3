Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6ADC021B5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 14:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxL9zzJXUsoKZ7vy0OplSy4qAiZXxUmo1qr3dAOK7j4=; b=pHsUVPa8e2rcDxJlJYuirLUT2H
	nZQR1hy6wGKUIJge8LLl4psUx898BPFusIc20tmE63mWh2EQ87z6l15SSBXghQ0gymngcaFe7UZZl
	R6/QTtSDq3yXs8c7DwfwIII/UJOCQy987Vh8q7oYegCEUoSoZzi23qKwu4ymmvjRQU3Rgwjmtky0t
	4eh3xRuwvhpF7Zbm0Ua6NktJ/qzp1A8pwTjqjd+D69aP4OjZTYNKor71E/X7XY+zC+T/9T156X+yj
	AqUtbTus6s4eKE37SgdgEUOMFTMYF/wR57xLCOWsFBNDGnGP736hEmQnSHQVEU+P9qBvAYWV1w3t/
	ZUcbnZdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlqma-00000008CVk-1AMx;
	Sat, 22 Feb 2025 14:47:08 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlqTs-00000008A1Q-3y7t
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 14:27:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 585D144260;
	Sat, 22 Feb 2025 14:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740234467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qxL9zzJXUsoKZ7vy0OplSy4qAiZXxUmo1qr3dAOK7j4=;
	b=KrDdPsRUDVWnCcO4xMKbHUL0KejjW55O0lilBWzcYmF5IxBuikkcFi15RFFiC+M6QZk9S5
	hDo4xMcNzL21HJaUkcA+nlmun23D8d64ne3NIRgEKmeIqBwgUpT/d3/YFThBSrko+Ft6Dn
	nYjxJZk9VQG/Ce9Hj79p6qScLnWERXTXgr6kYpbbj9YLGe2nYl1EJaiVGxGeQtQCdV6JuP
	QAF2Xj7NkTVYSKbQN4kWeBQozzC9AWnVlm4vT64cl+t/zLUnDrQPiqPPuJdR2aPFdnmLX0
	MHZIodQD/KyYdOOMvJpCmHx9PWT9Cy4ELjk4TIXOHnAB8tI9vErebt7HpJO3iQ==
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
Subject: [PATCH net-next 12/13] net: phy: phylink: Use phy_caps_lookup for fixed-link configuration
Date: Sat, 22 Feb 2025 15:27:24 +0100
Message-ID: <20250222142727.894124-13-maxime.chevallier@bootlin.com>
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
X-CRM114-CacheID: sfid-20250222_062749_125824_241665F7 
X-CRM114-Status: GOOD (  13.11  )
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

When phylink creates a fixed-link configuration, it finds a matching
linkmode to set as the advertised, lp_advertising and supported modes
based on the speed and duplex of the fixed link.

Use the newly introduced phy_caps_lookup to get these modes instead of
phy_lookup_settings(). This has the side effect that the matched
settings and configured linkmodes may now contain several linkmodes (the
intersection of supported linkmodes from the phylink settings and the
linkmodes that match speed/duplex) instead of the one from
phy_lookup_settings().

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phylink.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index da7b159702c5..a0b225cd62f5 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -504,9 +504,10 @@ static int phylink_validate(struct phylink *pl, unsigned long *supported,
 static int phylink_parse_fixedlink(struct phylink *pl,
 				   const struct fwnode_handle *fwnode)
 {
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(match) = { 0, };
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(mask) = { 0, };
+	const struct link_capabilities *c;
 	struct fwnode_handle *fixed_node;
-	const struct phy_setting *s;
 	struct gpio_desc *desc;
 	u32 speed;
 	int ret;
@@ -578,8 +579,10 @@ static int phylink_parse_fixedlink(struct phylink *pl,
 	linkmode_copy(pl->link_config.advertising, pl->supported);
 	phylink_validate(pl, pl->supported, &pl->link_config);
 
-	s = phy_lookup_setting(pl->link_config.speed, pl->link_config.duplex,
-			       pl->supported, true);
+	c = phy_caps_lookup(pl->link_config.speed, pl->link_config.duplex,
+			    pl->supported, true);
+	if (c)
+		linkmode_and(match, pl->supported, c->linkmodes);
 
 	linkmode_set_bit(ETHTOOL_LINK_MODE_Pause_BIT, mask);
 	linkmode_set_bit(ETHTOOL_LINK_MODE_Asym_Pause_BIT, mask);
@@ -588,9 +591,9 @@ static int phylink_parse_fixedlink(struct phylink *pl,
 
 	phylink_set(pl->supported, MII);
 
-	if (s) {
-		__set_bit(s->bit, pl->supported);
-		__set_bit(s->bit, pl->link_config.lp_advertising);
+	if (c) {
+		linkmode_or(pl->supported, pl->supported, match);
+		linkmode_or(pl->link_config.lp_advertising, pl->supported, match);
 	} else {
 		phylink_warn(pl, "fixed link %s duplex %dMbps not recognised\n",
 			     pl->link_config.duplex == DUPLEX_FULL ? "full" : "half",
@@ -1578,21 +1581,21 @@ static int phylink_register_sfp(struct phylink *pl,
 int phylink_set_fixed_link(struct phylink *pl,
 			   const struct phylink_link_state *state)
 {
-	const struct phy_setting *s;
+	const struct link_capabilities *c;
 	unsigned long *adv;
 
 	if (pl->cfg_link_an_mode != MLO_AN_PHY || !state ||
 	    !test_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state))
 		return -EINVAL;
 
-	s = phy_lookup_setting(state->speed, state->duplex,
-			       pl->supported, true);
-	if (!s)
+	c = phy_caps_lookup(state->speed, state->duplex,
+			    pl->supported, true);
+	if (!c)
 		return -EINVAL;
 
 	adv = pl->link_config.advertising;
 	linkmode_zero(adv);
-	linkmode_set_bit(s->bit, adv);
+	linkmode_and(adv, pl->supported, c->linkmodes);
 	linkmode_set_bit(ETHTOOL_LINK_MODE_Autoneg_BIT, adv);
 
 	pl->link_config.speed = state->speed;
-- 
2.48.1


