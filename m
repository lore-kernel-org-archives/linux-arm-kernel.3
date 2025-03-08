Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB62C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 16:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kexZQrMIpEE9IN4eQEzAttyVP9Nr79fTq/+KRV6gDuQ=; b=VndOhcuqeiJDfvrWoG2Mzdm8cB
	rOxQJdPl9eIU9KnkHqB6D/swMBEL9emLBczDJAZ8dvOI+uIoufS8KCrUYts5I49e4gv9hE9UUqsoD
	mcexWVTJzaJKoiTCw85lU41B9RjaIuncYbsMJ5quGLo68TveP1im9bn+zlCANkLg/y2nttN81/j4j
	asmpDyJjSnxK9JcdbBUkPqhyvnY6Eq8/0ljstuTMtb6o+JOASRrvzgiHwEYCKQ06u/4Y38i4FTXBA
	fAKsdlfgpfz+MHJF6pTMkMQXjbD8cNALfNdLgb71BGdVq/t2d4hg8vU9G0HrVDCB5fkSQs1K5EGXi
	I5+x965g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqwd7-0000000Gpik-11br;
	Sat, 08 Mar 2025 16:02:25 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqwVl-0000000Gogp-3LLF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 15:54:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C75B120457;
	Sat,  8 Mar 2025 15:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741449284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kexZQrMIpEE9IN4eQEzAttyVP9Nr79fTq/+KRV6gDuQ=;
	b=ZWqrBJ5wl8fIPZJ8s24rmk+Lc8BcNkhWk/zxay2V/CyQD8Fh8KHKQAm9jg8X0bDfbrjMMW
	jbQ8IXcEqxKv3/O1Qxpvh4LdHDv3Sg/IwbFKafmIsl8BN0LOrlEeKg2OLcDTtoQ/INpfUv
	ucDmxBf5+pT8r1OTc5JQl2QHIGRuyAUEeqRlc+8GTBRv7/TgY89bNzaKduT5WPwdQSnEsF
	baIcyMEyFTPdhwvjyT7oR5VMAAcGPaswoQaQFFLSo8ywp8fKG5t4MsCPx68EB/gtl3MwJI
	2G/7Jn4ojtY88A9wDOK7wkZ7fY6uF8VGNo7zd7lD66udwb1io3JkGvYi1vTQ3A==
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
	Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Subject: [PATCH net-next v2 0/7] net: ethtool: Introduce ethnl dump helpers
Date: Sat,  8 Mar 2025 16:54:32 +0100
Message-ID: <20250308155440.267782-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudefleeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjefhleeihefgffeiffdtffeivdehfeetheekudekgfetffetveffueeujeeitdevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvvddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvl
 hdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_075450_570578_EF093CC8 
X-CRM114-Status: GOOD (  13.93  )
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

This is V2 for the ethnl dump support, allowing better handling of
per-phy dump but also any other dump operation that needs to dump more
than one message per netdev.

Changes in V2:
 - Rebased on the netdev_lock work by Stanislav and the fixes from Eric
 - Fixed a bissectability issue
 - Fixed kdoc for the new ethnl ops and fields

V1: https://lore.kernel.org/netdev/20250305141938.319282-1-maxime.chevallier@bootlin.com/

As of today when using ethnl's default ops, the DUMP requests will
simply perform a GET for each netdev.

That hits limitations for commands that may return multiple messages for
a single netdev, such as :

 - RSS (listing contexts)
 - All PHY-specific commands (PLCA, PSE-PD, phy)
 - tsinfo (one item for the netdev +  one per phy)

 Commands that need a non-default DUMP support have to re-implement
 ->dumpit() themselves, which prevents using most of ethnl's internal
 circuitry.

This series therefore introduces a better support for dump operations in
ethnl.

The patches 1 and 2 introduce the support for filtered DUMPs, where an
ifindex/ifname can be passed in the request header for the DUMP
operation. This is for when we want to dump everything a netdev
supports, but without doing so for every single netdev. ethtool's
"--show-phys ethX" option for example performs a filtered dump.

Patch 3 introduces 3 new ethnl ops : 
 ->dump_start() to initialize a dump context
 ->dump_one_dev(), that can be implemented per-command to dump
 everything on a given netdev
 ->dump_done() to release the context

The default behaviour for dumps remains the same, calling the whole
->doit() path for each netdev.

Patch 4 introduces a set of ->dump_start(), ->dump_one_dev() and
->dump_done() callback implementations that can simply be plugged into
the existing commands that list objects per-phy, making the 
phy-targeting command behaviour more coherent.

Patch 5 uses that new set of helpers to rewrite the phy.c support, which
now uses the regulat ethnl_ops instead of fully custom genl ops. This
one is the hardest to review, sorry about that, I couldn't really manage
to incrementally rework that file :(

Patches 6 and 7 are where the new dump infra shines, adding per-netdev
per-phy dump support for PLCA and PSE-PD.

We could also consider converting tsinfo/tsconfig, rss and tunnels to
these new ->dump_***() operations as well, but that's out of this
series' scope.

Maxime Chevallier (7):
  net: ethtool: netlink: Allow per-netdevice DUMP operations
  net: ethtool: netlink: Rename ethnl_default_dump_one
  net: ethtool: netlink: Introduce command-specific dump_one_dev
  net: ethtool: netlink: Introduce per-phy DUMP helpers
  net: ethtool: phy: Convert the PHY_GET command to generic phy dump
  net: ethtool: plca: Use per-PHY DUMP operations
  net: ethtool: pse-pd: Use per-PHY DUMP operations

 net/ethtool/netlink.c | 165 ++++++++++++++------
 net/ethtool/netlink.h |  47 +++++-
 net/ethtool/phy.c     | 343 ++++++++++++------------------------------
 net/ethtool/plca.c    |  12 ++
 net/ethtool/pse-pd.c  |   6 +
 5 files changed, 280 insertions(+), 293 deletions(-)

-- 
2.48.1


