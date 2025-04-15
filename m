Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C43C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 08:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MGYvJw1tk9fm0IQ4Zu9nT7Kcgjv9uRN9qTZRQbhprcc=; b=cLJWKV5qP9HlAYdWBYbA0XQ9Hb
	Kiaz4RWpEmVUJVPiFMrZux+jJsHVZ0JCf7mC1xc1FqLukLxn6CuPUS1ujhoyqkD4q+U9+ecj9BcgV
	UM1ERNa0UbsEtLqiqR09LCBRqOVttQJL3i0rvocanT3oqiLE4Fsy/AtQys8C1OGLakAg0cNwXkKGA
	gslbLlV4J5OfkI+Ipjdq4fLgTy0u7+/xLp6mKF1CShuwrpXDF6CNkcMEbaKxuf8szuhAxNN5lMo30
	3g22gEEI/+LpWHpVRzWa8n2iI54AkBOa+hXqt0xnKMCcf6RtKUnmsCqZtIy69dXaTfjqg9V5k1GSc
	8VdCIFcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4c3J-000000054Pd-33zQ;
	Tue, 15 Apr 2025 08:53:57 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4c1S-000000053wo-1HLL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 08:52:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 12FC1432FA;
	Tue, 15 Apr 2025 08:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744707118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MGYvJw1tk9fm0IQ4Zu9nT7Kcgjv9uRN9qTZRQbhprcc=;
	b=HAE6lzNr8wGu9Az7+Dmz7BE8RL/GmcuRbaN3hvYjO73rZDVYsRH9Jwhtx12acFFmOItLZ4
	2h4iIUznMHOThBjgulzzZxsctlp3rT3tLbLruxGFecNCd4EnOTcX4OnUPBxGmjzQNG1awm
	UaNcF7eKrsBXghaw/VDcraIq5iG9Z3LA/jn0hXJ7FLC2uSXzRpky28Iu/r9i2xK1lHgkXd
	fc9ZA9X4s3TWtwN3grad43fAWHBPz6VwbAjh3jYvC1Fz0+dbUqTXsr8WElnoFzEzbgVyIP
	DRy0yvObgdeO1nsz24Y7YmVxruYrtx3YMAd36exKBio9K3US8cneMzBCag54tQ==
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
Subject: [PATCH net-next v6 0/2] net: ethtool: Introduce ethnl dump helpers
Date: Tue, 15 Apr 2025 10:51:52 +0200
Message-ID: <20250415085155.132963-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdeftdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjefhleeihefgffeiffdtffeivdehfeetheekudekgfetffetveffueeujeeitdevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvuddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvl
 hdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_015202_604239_E273827F 
X-CRM114-Status: GOOD (  11.11  )
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

This is V6 for per-phy DUMP helpers, that includes even more
simplification, as this now boils down to 2 patches :
 - The first one introduce per-phy ->start(), ->dumpit() and ->done()
   helpers and uses them for plca and pse-pd
 - The second patch converts the net/ethtool/phy.c code, to avoid
   open-coding the DUMP operation.

Thanks,

Maxime

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

Maxime Chevallier (2):
  net: ethtool: Introduce per-PHY DUMP operations
  net: ethtool: phy: Convert the PHY_GET command to generic phy dump

 net/ethtool/netlink.c | 189 +++++++++++++++++++++--
 net/ethtool/netlink.h |   4 -
 net/ethtool/phy.c     | 342 ++++++++++++------------------------------
 3 files changed, 272 insertions(+), 263 deletions(-)

-- 
2.49.0


