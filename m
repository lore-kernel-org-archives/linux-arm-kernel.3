Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08196C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 22:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wwIuZGsf+9GgXH3SQHylIgyzv/EwGPzzpkxTm4iROQ=; b=m3oH3hUWnlKEM0Ft9HBjHyVJfC
	P8vIQSGXPs+cWEkLhGPVIvDR/0FClfJn7ya8QarQ7b5/l4CDXWXVPRQOuzGP4D1Cckl/9lH4Tncy1
	4fLs0lheuym4sU3gGzjfukCekUzDEGbqb5wxNchOE6MZa/rQGZoU5QDSyYlAk2ZunUbQeXw9OyORH
	pL0RuowuDxs1SNMX9gINPByBW1YK5Hd729eJI7c64sW6EA6PXjhsHHNCckv42JQxEoo8vo63QDgXQ
	HNXe3dc/xhF4vYqwVp5HxZDJ1zLK5SSFq0jW2KNG1hFSCc2ervp/KC85rIVbDYIZd3Ebnu3/0D7dG
	CdTB40mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgX3J-0000000BQbU-1020;
	Fri, 07 Feb 2025 22:42:25 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgWxq-0000000BP9X-2Xj4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 22:36:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D0F7D20479;
	Fri,  7 Feb 2025 22:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738967802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2wwIuZGsf+9GgXH3SQHylIgyzv/EwGPzzpkxTm4iROQ=;
	b=ZlXmzbf+0UEhos5XNFabRBj8MrQ7dij8HsDGoI7ch9pAljQj7uJ0/O66Ai0Zd0buHBrXYl
	SyeN7YnR2gStsSFJBYiEkFbF3SMhT11jsj3PWY/Xksqwp5DQ9LZdNsHkGdgZNxugJI1eX7
	6WsihLZF9X258nmWmPd5t0plNDbtpmK4LCw8zdQkgTNz7FO6oVPDfKobnO6gwlUp4YoLpW
	yiP60KMUORX2dDR1YgiwG+JYTc4dwN4gWWuvGHnYweCKNlgRW/LeXL/sv8B9BWI6kCLLPM
	5nWGpGpAAT/UKQ3226tkodFZuJd/0lSShC8KwfdhaJ2TQyrQV7c+EQb8UkUGMA==
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
	Romain Gantois <romain.gantois@bootlin.com>
Subject: [PATCH net-next 02/13] net: ethtool: Export the link_mode_params definitions
Date: Fri,  7 Feb 2025 23:36:21 +0100
Message-ID: <20250207223634.600218-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207223634.600218-1-maxime.chevallier@bootlin.com>
References: <20250207223634.600218-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdehtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgedtffelffelveeuleelgfejfeevvdejhfehgeefgfffvdefteegvedutefftdenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemtggtfegtmeeglehfgeemfeeiheehmegsheejgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegttgeftgemgeelfhegmeefieehheemsgehjeegpdhhvghlohepfhgvughorhgrqddurdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvledprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrr
 dhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_143646_809933_F349CE1B 
X-CRM114-Status: GOOD (  11.28  )
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
 include/linux/ethtool.h | 10 ++++++++++
 net/ethtool/common.c    |  1 +
 net/ethtool/common.h    |  9 ---------
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
index 62b5a9d7efd5..519a90ce24d3 100644
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
+	enum ethtool_link_medium        medium;
+};
+
+extern const struct link_mode_info link_mode_params[];
+
 /* declare a link mode bitmap */
 #define __ETHTOOL_DECLARE_LINK_MODE_MASK(name)		\
 	DECLARE_BITMAP(name, __ETHTOOL_LINK_MODE_MASK_NBITS)
diff --git a/net/ethtool/common.c b/net/ethtool/common.c
index 8798ff1abed3..7b43ae04d731 100644
--- a/net/ethtool/common.c
+++ b/net/ethtool/common.c
@@ -434,6 +434,7 @@ const struct link_mode_info link_mode_params[] = {
 	__DEFINE_LINK_MODE_PARAMS(800000, VR4, Full, V),
 };
 static_assert(ARRAY_SIZE(link_mode_params) == __ETHTOOL_LINK_MODE_MASK_NBITS);
+EXPORT_SYMBOL_GPL(link_mode_params);
 
 const char netif_msg_class_names[][ETH_GSTRING_LEN] = {
 	[NETIF_MSG_DRV_BIT]		= "drv",
diff --git a/net/ethtool/common.h b/net/ethtool/common.h
index b25011a05fea..ee250a5c5364 100644
--- a/net/ethtool/common.h
+++ b/net/ethtool/common.h
@@ -14,14 +14,6 @@
 
 #define __SOF_TIMESTAMPING_CNT (const_ilog2(SOF_TIMESTAMPING_LAST) + 1)
 
-struct link_mode_info {
-	int				speed;
-	u8				min_lanes;
-	u8				lanes;
-	u8				duplex;
-	enum ethtool_link_medium	medium;
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


