Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA23C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 09:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VJ6s6tfNaYWPwppog4/wxkqhHZfGi0e9BsGRU7e1/pM=; b=MsUfe0Txh+7WQ4760oTNjHekZK
	PLnbHzOdwXBvoXZQOeAhZEsmNz0Uti+b2OviNZ++z5mtv1ogtU75QyoSXHfHpjlS/Wi3cblve7Bm0
	wZuhgOJJbARJM/SjW+9lzxmKAplH8pcHjNo1XpS85BMTtU6AXaYKdpuCA5A1YHscIgBPvV0Y+TBmh
	vZrXCMT5MeL6+DiYYGtdz8uP8g17XG2R9qeqmaaYPEjlG4KTz1lVFVzrKvrVgmWcey4NH4UAZIaJC
	jHo+puIFtefYTVO8Ej9DCeDihJKudz/autkNNoGchaHhMbxWhiRZdBYoJP9oI6jz7nNlFsopEPtBO
	4cxfjYJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAmFQ-00000001GQh-0OVe;
	Fri, 02 May 2025 08:59:56 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAm8a-00000001F0q-0uUl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 08:52:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9108243217;
	Fri,  2 May 2025 08:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746175966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VJ6s6tfNaYWPwppog4/wxkqhHZfGi0e9BsGRU7e1/pM=;
	b=XhGrtpnK5cI75qeqWiGb6lKr3qobv0vvvmLSHwFSGVH7CmS8CaDAtsAQUmy/b2RMJ1gcx2
	HEmuyLA5mHNX7P84jPT4ob8yAwlJsq00dgnZ0MchbwxL9Jabv8lRf+xDq4H6zCzStZ38Jn
	XQkj3vIQfw4xeOkIL5c+tk9MeeY6pg95LLgMlFmERd1ogt5wL+GKwSvzlanbumPhLU/4DH
	Hlq2u30yg5htGNMugLeKuSj5sep3wDLtOvrQhg2roZTkqR6mQ3MUQTdsVQaJ7vzflYRGGl
	M6ZtlKAzNyq/feWCTZdRVlnCdJ+Um5/D7JyaTYT1YdDv3hjO+pqSX/RavasM6w==
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
Subject: [PATCH net-next v8 0/3] net: ethtool: Introduce ethnl dump helpers
Date: Fri,  2 May 2025 10:52:38 +0200
Message-ID: <20250502085242.248645-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedvtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjefhleeihefgffeiffdtffeivdehfeetheekudekgfetffetveffueeujeeitdevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvuddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvl
 hdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_015252_735093_CD0D3CDC 
X-CRM114-Status: GOOD (  11.43  )
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

This is V8 for per-phy DUMP helpers, improving support for ->dumpit()
operations for PHY targetting commands.

This V8 fixes some issues spotted by Jakub (thanks !) on the multi-part
DUMP sequence. The netdev reftracking was reworked to make sure that
during a filtered DUMP, we only keep a ref on the netdev during
individual .dumpit() calls.

Thanks,

Maxime

Changes in V8:
 - Fixed the dump process WRT refcounting
 - Reset the pos_phyindex for non-filtered DUMP
 - Reworked kdoc and comments

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
V7: https://lore.kernel.org/netdev/20250422161717.164440-1-maxime.chevallier@bootlin.com/

Maxime Chevallier (3):
  net: ethtool: Introduce per-PHY DUMP operations
  net: ethtool: phy: Convert the PHY_GET command to generic phy dump
  net: ethtool: netlink: Use netdev_hold for dumpit() operations

 net/ethtool/netlink.c | 217 +++++++++++++++++++++++++--
 net/ethtool/netlink.h |   4 -
 net/ethtool/phy.c     | 342 ++++++++++++------------------------------
 3 files changed, 298 insertions(+), 265 deletions(-)

-- 
2.49.0


