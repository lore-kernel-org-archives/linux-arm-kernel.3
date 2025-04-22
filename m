Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD0BC369DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 19:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=77TeXhBQpxJeDAesO4yr6iWR5ROTE8gul1nxKYyvCeM=; b=xPifEd0iLPnqL6haOuj10LhIeX
	G/L0B/Ene2Qvh9TNTEaspLfNnH/rjM2n68U85essEDUhSkPO35DBd7RqQLnodiogz3eA6xNB+2gno
	L1tbWBQeHDgKcMUBBkMxWeEc8Kb2db53lVJXPxpNYG+YKtquY6utHf89dDf+swf8wvHiMej8EAdwA
	ZHG9m2uxMv8UO0uAgCJfhS3PqQyUW+mz18X/OBc9zcrxi9GuKD7hD7x/o7YVq/AgmlwiDLry5+xXS
	/jLIzrzi2N4XCM6dlDBo9+EZqL97lbuvxJ8gmwO9pl50VjbOIC9gPncCxpDXO3DY14JSxmp7okx+p
	KzRnMdmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7JaQ-00000008LWg-24rG;
	Tue, 22 Apr 2025 19:47:18 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GJI-00000007rz7-03rT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 16:17:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74A5F1FCE9;
	Tue, 22 Apr 2025 16:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745338639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=77TeXhBQpxJeDAesO4yr6iWR5ROTE8gul1nxKYyvCeM=;
	b=JWq5ga6AinY43OskxguYbX3wa15rNLKzPdstmmYlQW8tnf3L7PYK5wRkfrGLbss1a0+KG0
	KnKZvbNai5LluhKeqc+m1ZUwNwndCLKPRHmfmtp6Qj1OJ3lDpkscEa79CzTGaoBRR46bHr
	A8+XPUQYs9Ed4tuV/Ga8RNUKFdAW2f4E0QNQRGU8SxaKeeZGSCbDyCLGDOI7JjMizwlPzV
	Q6jczEnUyA9cKsg9wW597KhhYqSaQAPaAM20LsSnPMVPzmZbQAgsEU7Nc5N+sz/tNe9vO/
	uk1+UoSL73WqyvaV2x5M/zZI135KBFtrsAvvmK3YRV0DdEq+F8Odsqs+KMjYzg==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Simon Horman <horms@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Piergiorgio Beruto <piergiorgio.beruto@gmail.com>
Subject: [PATCH net-next v7 0/3] net: ethtool: Introduce ethnl dump helpers
Date: Tue, 22 Apr 2025 18:17:13 +0200
Message-ID: <20250422161717.164440-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjefhleeihefgffeiffdtffeivdehfeetheekudekgfetffetveffueeujeeitdevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvuddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvl
 hdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_091724_211186_1A6B7F1B 
X-CRM114-Status: GOOD (  11.47  )
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

Hi everyone,

This is V7 for per-phy DUMP helpers, improving support for ->dumpit()
operations for PHY targetting commands.

This V7 simply contains a conversion from dev_hold() to netdev_hold(),
I also included a patch converting the original ->dumpit(). As this
refcounting is still a bit obscure to me, let me know if I'm getting
this wrong...

Thanks,

Maxime

Changes in V7:
 - Move from dev_hold to netdev_hold()
 - Add an extra patch fr dev_hold() conversion.

Changes in V6:
 - Squash pse and plca patches into the first one, to avoid unused
   functions (Jakub)

Changes in V5:
 - Move to a less generic approach, focusing only on the PHY case.

Changes in V4:
 - Don't grab rcu_read_lock when we already have a refcounter netdev on
   the filtered dump path (Paolo)
 - Move the dump_all stuff in a dedicated helper (Paolo)
 - Added patch 1 to set the dev in ctx->req_info

Changes in V3:
 - Fixed some typos and xmas tree issues
 - Added a missing check for EOPNOTSUPP in patch 1
 - Added missing kdoc
 - Added missing comments in phy_reply_size

Changes in V2:
 - Rebased on the netdev_lock work by Stanislav and the fixes from Eric
 - Fixed a bissectability issue
 - Fixed kdoc for the new ethnl ops and fields

V1: https://lore.kernel.org/netdev/20250305141938.319282-1-maxime.chevallier@bootlin.com/
V2: https://lore.kernel.org/netdev/20250308155440.267782-1-maxime.chevallier@bootlin.com/
V3: https://lore.kernel.org/netdev/20250313182647.250007-1-maxime.chevallier@bootlin.com/
V4: https://lore.kernel.org/netdev/20250324104012.367366-1-maxime.chevallier@bootlin.com/
V5: https://lore.kernel.org/netdev/20250410123350.174105-1-maxime.chevallier@bootlin.com/
V6: https://lore.kernel.org/netdev/20250415085155.132963-1-maxime.chevallier@bootlin.com/

Maxime Chevallier (3):
  net: ethtool: Introduce per-PHY DUMP operations
  net: ethtool: phy: Convert the PHY_GET command to generic phy dump
  net: ethtool: netlink: Use netdev_hold for dumpit() operations

 net/ethtool/netlink.c | 195 ++++++++++++++++++++++--
 net/ethtool/netlink.h |   4 -
 net/ethtool/phy.c     | 342 ++++++++++++------------------------------
 3 files changed, 276 insertions(+), 265 deletions(-)

-- 
2.49.0


