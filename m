Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B934DC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 16:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1gkCNSIJipCtJ8F7BWcSLctUsRTjVD/kU0v4Esvy09U=; b=hFW0UuCxxR0RlZ2+cK5Lmm/sxN
	izMZWtje8SUGUyiVZBzeuNQzyiZgAho3L/yyyfzU/WrZVsf5P9lW0Fa3mhj6ydAfPIM+8/pOjlv2q
	sAY3Kzq0c8uxmLei0Hw5tUS2P9xjHwk6NIOMpoJXw8hFzoFakgUiD59mgMGenwlRM+GP09rHfLRhR
	NvMbsv93stj8PCxX0FaE4FnFkha6gGwxlY7Guk449U3NqBgl4rabBBoCzP7h0mmhRk+88Y+S/RolD
	tMX/IyA7SA06zrYb/p2xOcJwke4UA23OjQa/hI+qvj0D9xEFdtz7Js4l46Sx91AykoESeKKhPhoNA
	HeeP7fvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZu6I-0000000COIf-1jlK;
	Thu, 10 Jul 2025 16:26:22 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZrar-0000000Bzb8-34sf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 13:45:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7007344451;
	Thu, 10 Jul 2025 13:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752155142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1gkCNSIJipCtJ8F7BWcSLctUsRTjVD/kU0v4Esvy09U=;
	b=WOhs+UknWDnRTs/K6H+DNs0ElTRI5p15wW1eoN94RTLcSU0l6hiEtOA0G6efJz+0W+JPRx
	MAXJYvKzY3zrMBV6aT8gGGiU0YMOHKfm33TJWYlXeFbXa2tFqZFeQDSXuYWeRdQ92qVUCG
	84AobJKjrjY1NwTlU+QQdCwIgj45vlmkj3yyB1iTvUMZdwYb34T+TJ6RgswWPzr7eLEYqG
	TKXb6Sv3VkSj753quEdNVpD8tQTsgOqPSrwj8qBV54tlnKLFrOpHMNS0MkfA68G7p4qHVP
	RRAHm0447lYNeMmRPhkWsQtp5+mYVF7z2cUWtAgCZ0oDbbCAdDFAogXMiUpDQA==
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
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: [PATCH net-next v8 02/15] net: ethtool: common: Indicate that BaseT works on up to 4 lanes
Date: Thu, 10 Jul 2025 15:45:19 +0200
Message-ID: <20250710134533.596123-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710134533.596123-1-maxime.chevallier@bootlin.com>
References: <20250710134533.596123-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegtdehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgedtffelffelveeuleelgfejfeevvdejhfehgeefgfffvdefteegvedutefftdenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefuddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_064545_901589_FAD0AA5C 
X-CRM114-Status: GOOD (  13.54  )
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

The way BaseT modes (Ethernet over twisted copper pairs) are represented
in the kernel are through the following modes :

  ETHTOOL_LINK_MODE_10baseT_Half
  ETHTOOL_LINK_MODE_10baseT_Full
  ETHTOOL_LINK_MODE_100baseT_Half
  ETHTOOL_LINK_MODE_100baseT_Full
  ETHTOOL_LINK_MODE_1000baseT_Half
  ETHTOOL_LINK_MODE_1000baseT_Full
  ETHTOOL_LINK_MODE_2500baseT_Full
  ETHTOOL_LINK_MODE_5000baseT_Full
  ETHTOOL_LINK_MODE_10000baseT_Full
  ETHTOOL_LINK_MODE_100baseT1_Full
  ETHTOOL_LINK_MODE_1000baseT1_Full
  ETHTOOL_LINK_MODE_10baseT1L_Full
  ETHTOOL_LINK_MODE_10baseT1S_Full
  ETHTOOL_LINK_MODE_10baseT1S_Half
  ETHTOOL_LINK_MODE_10baseT1S_P2MP_Half
  ETHTOOL_LINK_MODE_10baseT1BRR_Full

The baseT1* modes explicitly specify that they work on a single,
unshielded twister copper pair.

However, the other modes do not state the number of pairs that are used
to carry the link. 10 and 100BaseT use 2 twisted copper pairs, while
1GBaseT and higher use 4 pairs.

although 10 and 100BaseT use 2 pairs, they can work on a Cat3/4/5+
cables that contain 4 pairs.

Change the number of pairs associated to BaseT modes to indicate the
allowable number of pairs for BaseT. Further commits will then refine
the minimum number of pairs required for the linkmode to work.

BaseT1 modes aren't affected by this commit.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 net/ethtool/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ethtool/common.c b/net/ethtool/common.c
index d62dc56f2f5b..17ee0efc7bc3 100644
--- a/net/ethtool/common.c
+++ b/net/ethtool/common.c
@@ -267,7 +267,7 @@ static_assert(ARRAY_SIZE(link_mode_names) == __ETHTOOL_LINK_MODE_MASK_NBITS);
 #define __LINK_MODE_LANES_LR8_ER8_FR8	8
 #define __LINK_MODE_LANES_LRM		1
 #define __LINK_MODE_LANES_MLD2		2
-#define __LINK_MODE_LANES_T		1
+#define __LINK_MODE_LANES_T		4
 #define __LINK_MODE_LANES_T1		1
 #define __LINK_MODE_LANES_X		1
 #define __LINK_MODE_LANES_FX		1
-- 
2.49.0


