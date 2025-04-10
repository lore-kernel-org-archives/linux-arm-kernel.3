Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42495C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 13:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J0xfKWJdyD9XFTZn8w86QT52Zuy8b8gkwIkU+lw2+nc=; b=vkV1f9fNwl7RnmfsR/A+AflkGQ
	YfnEzosIIhE6yHCzwoYyYvydkIrgnUFFXFj/APAh1+kPQzJGoJhfL/bOq3baCwSacwZjE5T3TQ5HF
	Z6ie28GkPZ7nGUiO/nPXz72fBXI0uiR7RwlSAZrG1xXEOCo6ylAzpqi/gAb/xbiwWI5m8gVvxidx/
	J6SKNvb3NN55Eqz02UxAtP/K8A+4KMcGXsiOKzGOUsdhUW+Ytqzia5KNxhX+YaO/pCGbLdU12efqe
	BMlf31mDDxjza+X71lezHAbm6ar4BqZPSD4mTZzvNwqOqAcyBnPowzj4RJ3Fa1O0nt/6n6WDrWJn8
	kQHdYfRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2sBN-0000000AiPt-3kTQ;
	Thu, 10 Apr 2025 13:43:06 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2r6T-0000000AVtD-0SC3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 12:33:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C7F744338;
	Thu, 10 Apr 2025 12:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744288434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=J0xfKWJdyD9XFTZn8w86QT52Zuy8b8gkwIkU+lw2+nc=;
	b=Ns/nFH0meYjUnfZ6aFnwUXXVjhbmQhnCcJzMpeYSb7SkfHQANZ7jPJ8qfS4EIcA+diHfk1
	mvBkfa9WZ9pxLNZnDNoT8bIcWJDJM0P4m+yL4ePHELl6SIHHiHQAwSoll1jMtViJhkfBXZ
	GT9C39c+yPje86a7+Wr1R1DrUwkQdRgpJqIBElVcxk6qghRXOPBPQgbGrSDbZp2XStYKM+
	May/3B2SpPslljc7nOZ3S6GqIK+jwxolIdKkVsypwZ61aqu1X5nzNAC68aDtjVz1HVmr44
	P6tCOWsp1wBo+gpTjD+yf3WUTBa8DjnJF5IeE9N5gMwSz6DFsz/Dutmum/l8Jw==
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
Subject: [PATCH net-next v5 0/4] net: ethtool: Introduce ethnl dump helpers
Date: Thu, 10 Apr 2025 14:33:45 +0200
Message-ID: <20250410123350.174105-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdekledvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjefhleeihefgffeiffdtffeivdehfeetheekudekgfetffetveffueeujeeitdevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvuddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvl
 hdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_053357_469099_16ADDB26 
X-CRM114-Status: GOOD (  12.19  )
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

Here's another approach to get a better handling for ethnl dump when we
have phy-targetting commands.

Previous versions of that series introduced new ethnl ops for DUMP, but
only useful for PHY dump.

This series takes a step back and implements new perphy ops at the genl
level :
 ->start()
 ->dumpit()
 ->done()

This avoids having to flag commands that use filtered DUMPs, as this is
handled directly in the custom ->start(), and we can use our own dump
context without using dynamic allocs.

The drawback though is that this duplicates some logic from the
ethnl_default_xxx dump ops.

Patch 2 reworks the whole net/ethtool/phy.c to fallback to ethnl ops,
while patches 3 and 4 convert pse-pd and plca to this new dump method.

Let me know what you think,

Maxime

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

Maxime Chevallier (4):
  net: ethtool: Introduce per-PHY DUMP operations
  net: ethtool: phy: Convert the PHY_GET command to generic phy dump
  net: ethtool: plca: Use per-PHY DUMP operations
  net: ethtool: pse-pd: Use per-PHY DUMP operations

 net/ethtool/netlink.c | 189 +++++++++++++++++++++--
 net/ethtool/netlink.h |   4 -
 net/ethtool/phy.c     | 342 ++++++++++++------------------------------
 3 files changed, 272 insertions(+), 263 deletions(-)

-- 
2.49.0


