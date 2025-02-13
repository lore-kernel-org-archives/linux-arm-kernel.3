Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B558C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 10:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j2Ojc9qcBvqj2LarFOOe3ioAtOzYlbt9nmEBUMJAtiI=; b=W88rtHmBy0ZFYf9t2WZAjsAmOV
	HMm8vTsuqEdInqGpMB338yu3W569M6V4yaR+kVeljVuE3y96LyY8ldVQJuZw0E/0cYrjYf8wS5jPa
	yHX9iXHbDgBr+8DdFAvx7CNrrBuwxyzTVPpHAmn6GRwNOrHPRrOCBA8jZpNFylVjy6hGSVuwk0sYj
	NUhXnIQLMgJgDwveBQw3uWckqyFZZEciCpjGu+zZaJ7k44ipEhajTDLy8WbjJqSOlNt90oeMQbVsh
	8fnHtPIO0ukzRrovxKcHtY5dd+ZcJ26Pg1J4G1pbwN+OAKD75YLoFfNW079IQoRUK0fq0YJAfZH8R
	HuQOX2PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiWKj-0000000Adr1-2uNL;
	Thu, 13 Feb 2025 10:20:37 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiWGX-0000000AcrO-08vT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 10:16:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A1CE432B7;
	Thu, 13 Feb 2025 10:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739441775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j2Ojc9qcBvqj2LarFOOe3ioAtOzYlbt9nmEBUMJAtiI=;
	b=Hg2LfUxS9mNsPghZQZxEfekjkNkCtoruY5J6qtUIMk7cfFPd05T3VZY/E0kL874FxrMlQw
	y5y8l40uI61E0Cb+wjQwnSzbTNxuHYfwB9Q9ihV5HoyU3wHVy7hcBxSYjnEjThwefHdpw2
	XTi08NXCmZw2OuI8ZlWZDUZv3arycaZGn4IG1D3W13YlHge0pAU17fFZ+WjCWJ3DidSmh9
	fQgF8zJ2Om38DF/nEK9Qk1BL9sUCmRCw4sSX2wHYqWYNIy2Y96ES/BdfDjyVmgACqVg17N
	5BEl8NER54dcCdL2LbsaunGl7IBiKRWCtZ4N97e/Qo9VVBOoLYAidrja7SWBWw==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?UTF-8?q?Nicol=C3=B2=20Veronese?= <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>,
	mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	Sean Anderson <seanga2@gmail.com>
Subject: [PATCH net-next v4 02/15] net: ethtool: Export the link_mode_params definitions
Date: Thu, 13 Feb 2025 11:15:50 +0100
Message-ID: <20250213101606.1154014-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213101606.1154014-1-maxime.chevallier@bootlin.com>
References: <20250213101606.1154014-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegieehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgedtffelffelveeuleelgfejfeevvdejhfehgeefgfffvdefteegvedutefftdenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefvddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_021617_230848_34898194 
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

link_mode_params contains a lookup table of all 802.3 link modes that
are currently supported with structured data about each mode's speed,
duplex, number of lanes and mediums.

As a preparation for a port representation, export that table for the
rest of the net stack to use.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V4: Updated the struct definition now that mediums is a bitfield

 include/linux/ethtool.h | 10 ++++++++++
 net/ethtool/common.c    |  1 +
 net/ethtool/common.h    |  9 ---------
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
index 206965690dc6..75bd8b6df232 100644
--- a/include/linux/ethtool.h
+++ b/include/linux/ethtool.h
@@ -258,6 +258,16 @@ static inline const char *phy_mediums(enum ethtool_link_medium medium)
 	}
 }
 
+struct link_mode_info {
+	int                             speed;
+	u8                              min_lanes;
+	u8                              lanes;
+	u8                              duplex;
+	u16				mediums;
+};
+
+extern const struct link_mode_info link_mode_params[];
+
 /* declare a link mode bitmap */
 #define __ETHTOOL_DECLARE_LINK_MODE_MASK(name)		\
 	DECLARE_BITMAP(name, __ETHTOOL_LINK_MODE_MASK_NBITS)
diff --git a/net/ethtool/common.c b/net/ethtool/common.c
index 4f06efa553dc..d54de8b3ffd4 100644
--- a/net/ethtool/common.c
+++ b/net/ethtool/common.c
@@ -453,6 +453,7 @@ const struct link_mode_info link_mode_params[] = {
 	__DEFINE_LINK_MODE_PARAMS(800000, VR4, Full, V),
 };
 static_assert(ARRAY_SIZE(link_mode_params) == __ETHTOOL_LINK_MODE_MASK_NBITS);
+EXPORT_SYMBOL_GPL(link_mode_params);
 
 const char netif_msg_class_names[][ETH_GSTRING_LEN] = {
 	[NETIF_MSG_DRV_BIT]		= "drv",
diff --git a/net/ethtool/common.h b/net/ethtool/common.h
index 9d00b0329754..ee250a5c5364 100644
--- a/net/ethtool/common.h
+++ b/net/ethtool/common.h
@@ -14,14 +14,6 @@
 
 #define __SOF_TIMESTAMPING_CNT (const_ilog2(SOF_TIMESTAMPING_LAST) + 1)
 
-struct link_mode_info {
-	int				speed;
-	u8				min_lanes;
-	u8				lanes;
-	u8				duplex;
-	u16				mediums;
-};
-
 struct genl_info;
 struct hwtstamp_provider_desc;
 
@@ -34,7 +26,6 @@ tunable_strings[__ETHTOOL_TUNABLE_COUNT][ETH_GSTRING_LEN];
 extern const char
 phy_tunable_strings[__ETHTOOL_PHY_TUNABLE_COUNT][ETH_GSTRING_LEN];
 extern const char link_mode_names[][ETH_GSTRING_LEN];
-extern const struct link_mode_info link_mode_params[];
 extern const char netif_msg_class_names[][ETH_GSTRING_LEN];
 extern const char wol_mode_names[][ETH_GSTRING_LEN];
 extern const char sof_timestamping_names[][ETH_GSTRING_LEN];
-- 
2.48.1


