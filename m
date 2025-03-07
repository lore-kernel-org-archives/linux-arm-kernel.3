Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E4BC28B23
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 17:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IXWh6+CcSwa+U0HiDCFi6L9hXXLtCi64vWuyjdAWeM8=; b=uobkr0+jFe0y8l5OKulnJBvlbU
	3UtDTFcdmkdzRhed0q42tqVEIqCMVBaQS7DgRcviiUrgpRc3fqfW0PUw0Ch8D7rmW1it6OjLzKg/s
	X/iSMCevwF6gzY/gqXY/ALElAeIlSdjhsCUUZBtRtJMPuVloi0leLaRKxwa2a8Kdcpk+l86SJmHfd
	FysT1FC+wY1fDk/usZv5tpkaT0eddGBgOU9tVuLy/iSMTC9OYmvhKZeu5g8/6ucb3AC+GaaSPt3af
	t0VrlgC7XQWe18dWTftBsShFjQbuyZEusN9pDNKEB2XxrmZve741KWImchH1tnlns7APP/lF9yHyE
	YsBQtpkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbr5-0000000F7Iw-0Jge;
	Fri, 07 Mar 2025 17:51:27 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbcU-0000000F3wy-43Cz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 17:36:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7534F204D1;
	Fri,  7 Mar 2025 17:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741368981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IXWh6+CcSwa+U0HiDCFi6L9hXXLtCi64vWuyjdAWeM8=;
	b=OMnhGE17/TK7PWwjKBerzzsal3wkgj7g//pNNh5mAinjUxQ/m4e066LNAxyPrDw4JN4x7i
	TE+QzgLT16aCLoebt3O6S+JU5nBTN5XbXjZlZlBwGKUvhI+RMj+hgHC0qF10zakoK1umOO
	1ESHFR44P+00kx2k6gGTvkI/d95pSFeh7oQoGigcK+NAHQ387PJuB5r1JFDHDcarU+FdRg
	Cotj7koQ9515TqogwXFNcS5DJs1VlXxK0fgk8Ck9fnZXImSobtYBVVoVzTXgLDdvYoZcTo
	9m/YtCa4vqdf5v34c8wW0DSWqByPPGkhfmeeCefCCcJy5V7QjTqbS0e8xKpMfA==
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
Subject: [PATCH net-next v5 05/13] net: phy: phy_caps: Introduce phy_caps_valid
Date: Fri,  7 Mar 2025 18:36:02 +0100
Message-ID: <20250307173611.129125-6-maxime.chevallier@bootlin.com>
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
X-CRM114-CacheID: sfid-20250307_093623_135328_C00D7EE0 
X-CRM114-Status: GOOD (  13.80  )
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
 drivers/net/phy/phy_caps.c | 19 +++++++++++++++++++
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/phy-caps.h b/drivers/net/phy/phy-caps.h
index 1bef9cca62c5..1217686f1f91 100644
--- a/drivers/net/phy/phy-caps.h
+++ b/drivers/net/phy/phy-caps.h
@@ -43,6 +43,7 @@ int phy_caps_init(void);
 size_t phy_caps_speeds(unsigned int *speeds, size_t size,
 		       unsigned long *linkmodes);
 void phy_caps_linkmode_max_speed(u32 max_speed, unsigned long *linkmodes);
+bool phy_caps_valid(int speed, int duplex, const unsigned long *linkmodes);
 
 
 #endif /* __PHY_CAPS_H */
diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index 3128df03feda..8df37d221fba 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -260,7 +260,7 @@ unsigned int phy_supported_speeds(struct phy_device *phy,
  */
 bool phy_check_valid(int speed, int duplex, unsigned long *features)
 {
-	return !!phy_lookup_setting(speed, duplex, features, true);
+	return phy_caps_valid(speed, duplex, features);
 }
 EXPORT_SYMBOL(phy_check_valid);
 
diff --git a/drivers/net/phy/phy_caps.c b/drivers/net/phy/phy_caps.c
index d43493884ff7..4ee8c25c8521 100644
--- a/drivers/net/phy/phy_caps.c
+++ b/drivers/net/phy/phy_caps.c
@@ -140,3 +140,22 @@ void phy_caps_linkmode_max_speed(u32 max_speed, unsigned long *linkmodes)
 		else
 			break;
 }
+
+/**
+ * phy_caps_valid() - Validate a linkmodes set agains given speed and duplex
+ * @speed: input speed to validate
+ * @duplex: input duplex to validate. Passing DUPLEX_UNKNOWN is always not valid
+ * @linkmodes: The linkmodes to validate
+ *
+ * Returns: True if at least one of the linkmodes in @linkmodes can function at
+ *          the given speed and duplex, false otherwise.
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
-- 
2.48.1


