Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DF6C28B24
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 17:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2oZe26dvDe/cy6uqiDDi7SugxDmjZD7H4aAqZ/7Y2Hc=; b=mS0bVx8IbjB5WC6anEndtoxqq7
	OKhQTN1PphFTareoileqde/XR0HNJdy4mhFQtS07WBYg8Wb2LKBgQQkZ2lVUFRMq+euNuq0FtY6PW
	79+y+1xjGJC/98IuZt46PSLDO+Qi/R9hxnD0OjilW8UbZLi6HjRI1A8G9WVqK+EbwBGwON0D3ju6d
	glxuVVJTMJbqeMbiaiSoep8jDUX9bUvO1Q0BQYE/uxOHfQU4AG2xgmZTP3ism75cQKuyAEOXshDl7
	pRVbQHxs/2rpqdooXS8S+eGCtZnQl2som6pbj0lKMEG6MWyng5oQDYWBcVwFTFN8ykGPjDxPUkQ00
	5CFYk1HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbj4-0000000F5hn-1vlC;
	Fri, 07 Mar 2025 17:43:10 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbcQ-0000000F3vF-0sj2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 17:36:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF96A20454;
	Fri,  7 Mar 2025 17:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741368975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2oZe26dvDe/cy6uqiDDi7SugxDmjZD7H4aAqZ/7Y2Hc=;
	b=Ssn6KFrFfRMZzePX67dy3aXffwYP4D3uAJ1HeBMO+J7EStK4SBShX6Mbj7s9WY3J2do2Ln
	VPI7oVU7i0m6uPeDrQVDbpXC7/NF7jGIlABQdygPSgauWNEPq9UOVg9rZY/rvmc0+5mzvz
	jNJYTdjZj2KWpHbwNWntvDvcM1alY2o5DJ6HIa+QthbsCci/3iBO6leNlzJLFfxlCazeAl
	oME0VAWpxxfKCKVGIbPINSMT2bxDJlxQANyGFZmaH9zzNLE+RA/hIpY9VkA/13axLCPxM0
	V3euu8zdUNf2Tv3jSfxkmW84regVY/35TAN32wlUZJW+xRAvvmKsuPbQmL8RQw==
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
Subject: [PATCH net-next v5 00/13] net: phy: Rework linkmodes handling in a dedicated file
Date: Fri,  7 Mar 2025 18:35:57 +0100
Message-ID: <20250307173611.129125-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudduvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjefhleeihefgffeiffdtffeivdehfeetheekudekgfetffetveffueeujeeitdevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvl
 hdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_093618_703132_A1B2685A 
X-CRM114-Status: GOOD (  12.54  )
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

Hello everyone,

This is V5 of the phy_caps series. In a nutshell, this series reworks the way
we maintain the list of speed/duplex capablities for each linkmode so that we
no longer have multiple definition of these associations.

That will help making sure that when people add new linkmodes in
include/uapi/linux/ethtool.h, they don't have to update phylib and phylink as
well, making the process more straightforward and less error-prone.

It also generalises the phy_caps interface to be able to lookup linkmodes
from phy_interface_t, which is needed for the multi-port work I've been working
on for a while.

This V5 addresse Russell's and Paolo's reviews, namely :

 - Error out when encountering an unknown SPEED_XXX setting

   It prints an error and fails to initialize phylib. I've tested by
   introducing a dummy 1.6T speed, I guess it's only a matter of time
   before that actually happens :)

 - Deal more gracefully with the fixed-link settings, keeping some level of
   compatibility with what we had before by making sure we report a
   single BaseT mode like before.

V1 : https://lore.kernel.org/netdev/20250222142727.894124-1-maxime.chevallier@bootlin.com/
V2 : https://lore.kernel.org/netdev/20250226100929.1646454-1-maxime.chevallier@bootlin.com/
V3 : https://lore.kernel.org/netdev/20250228145540.2209551-1-maxime.chevallier@bootlin.com/
V4 : https://lore.kernel.org/netdev/20250303090321.805785-1-maxime.chevallier@bootlin.com/

Maxime Chevallier (13):
  net: ethtool: Export the link_mode_params definitions
  net: phy: Use an internal, searchable storage for the linkmodes
  net: phy: phy_caps: Move phy_speeds to phy_caps
  net: phy: phy_caps: Move __set_linkmode_max_speed to phy_caps
  net: phy: phy_caps: Introduce phy_caps_valid
  net: phy: phy_caps: Implement link_capabilities lookup by linkmode
  net: phy: phy_caps: Allow looking-up link caps based on speed and
    duplex
  net: phy: phy_device: Use link_capabilities lookup for PHY aneg config
  net: phylink: Use phy_caps_lookup for fixed-link configuration
  net: phy: drop phy_settings and the associated lookup helpers
  net: phylink: Add a mapping between MAC_CAPS and LINK_CAPS
  net: phylink: Convert capabilities to linkmodes using phy_caps
  net: phylink: Use phy_caps to get an interface's capabilities and
    modes

 drivers/net/phy/Makefile     |   2 +-
 drivers/net/phy/phy-caps.h   |  63 ++++++
 drivers/net/phy/phy-core.c   | 253 ++----------------------
 drivers/net/phy/phy.c        |  37 +---
 drivers/net/phy/phy_caps.c   | 359 +++++++++++++++++++++++++++++++++++
 drivers/net/phy/phy_device.c |  16 +-
 drivers/net/phy/phylink.c    | 355 ++++++++++------------------------
 include/linux/ethtool.h      |   8 +
 include/linux/phy.h          |  15 --
 net/ethtool/common.c         |   1 +
 net/ethtool/common.h         |   7 -
 11 files changed, 571 insertions(+), 545 deletions(-)
 create mode 100644 drivers/net/phy/phy-caps.h
 create mode 100644 drivers/net/phy/phy_caps.c

-- 
2.48.1


