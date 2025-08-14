Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6093BCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 14:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZKU77w45gMUGjcP3JknQMixut/H3bPF5pfsy977H45w=; b=ZfxCc/M0m/9GE57kQnFbmnOH7F
	TNwDLRKxEKFaKMeIq1Im+dySFbLSsG91C5e5Xx/8rf+gAqIWWeMtkdFH3SknSj/zVHTqI7bga8eyO
	Ngt1J9Gp5a0ZHnAjSYs/1kewfgmSGxXAo1zLB/w1PzVjxjoEHBryav02+gYsrcSoscHBScZzABlNb
	ND/Dn0BCmZWPU64AbOiVYqls4r5e67gawaVMrtoxw4yGQAuQxhsBc2UBEpVQZ7o8Bm1Kr+Ld0ntQ2
	5jZU6cTHlh/I0F2IJVaUgcHeD/qP85aDhUA5iivnbzsuQZC/remlW/ZaNNXTcaFJyAXUPVa12UDC3
	FkyAu36g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZ19-0000000HHLW-3iWo;
	Thu, 14 Aug 2025 14:33:23 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYTc-0000000H8Tw-0hxt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 13:58:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 64C6144422;
	Thu, 14 Aug 2025 13:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1755179919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZKU77w45gMUGjcP3JknQMixut/H3bPF5pfsy977H45w=;
	b=nObh73z/S3QKuvTIhMzs8LnILZFMAb686NQTw/baW/TyyQiWSVVTwpBw6roixaR5nSfnY/
	bB6Fj4TluAzXmH8TbEl9HyUeqJMCtqY3gVP0SBk1/Adm3rz+Qjg7DFTXJtO42vYNyJvli1
	eOUmAvN/HLyW4rbVK7olhhrvDZYTCSxiTf8vHl/AjqiNgH/yb9/4/fSTuiFoQfUR5fiUSv
	ToEi3USwfTV4WzGR8VfHjgZMVCwoqjyMT8iFFVA2TXoDSy+xDzBCEjO2ujm3g7sECILw1C
	8b5yi5qZR0DUlfCM2TlfXkCcdzTLB23MmbliYCNmGSwGI2e99W4Iy7JJDvMDOw==
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
Subject: [PATCH net-next v11 00/16] net: phy: Introduce PHY ports representation
Date: Thu, 14 Aug 2025 15:58:15 +0200
Message-ID: <20250814135832.174911-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeduvdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelfeetheetkedvtdegleffjefgffdvvdffudfgieeijeefgefhgfekjefgueeuieenucffohhmrghinhepnhgvthguvghvtghonhhfrdhinhhfohdplhhptgdrvghvvghnthhspdhkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefuddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhgrgihim
 hgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_065844_810636_9C7C5FD7 
X-CRM114-Status: GOOD (  31.32  )
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

Here is a V11 for the phy_port work, aiming at representing the
connectors and outputs of PHY devices.

First of all, I apologize for the 16-patch series, I had to include
another binding patch to deprecate the ti,fiber property and I'm now
exceeding the usual 15-patch limit. I can further split that work if
needed.

Thanks Andrew and Russell for the round of reviews on V10,
that's not an easy series to review :(

Due to the amount of rework on that V11, I had to drop some of the
Reviewed-by tags especially from Christophe, sorry about that.

V11 addresses what was discussed following Andrew and Russell's reviews :
 - The ti,fiber-mode property was deprecated in favor of the
   ethernet-connector binding
 - The .attach_port was split into an MDI and an MII version
 - I added the warning back in the AR8031 PHY driver
 - There is now an init-time check on the number of lanes associated to
   every linkmode, making sure the number of lanes is above or equal to
   the minimum required
 - Various typos were fixed all around
 - We no longer use sfp_select_interface() for SFP interface validation

As a remainder, a few important notes :

 - This is only a first phase. It instantiates the port, and leverage
   that to make the MAC <-> PHY <-> SFP usecase simpler.

 - Next phase will deal with controlling the port state, as well as the
   netlink uAPI for that.

 - The end-goal is to enable support for complex port MUX. This
   preliminary work focuses on PHY-driven ports, but this will be
   extended to support muxing at the MII level (Multi-phy, or compo PHY
   + SFP as found on Turris Omnia for example).

 - The naming is definitely not set in stone. I named that "phy_port",
   but this may convey the false sense that this is phylib-specific.
   Even the word "port" is not that great, as it already has several
   different meanings in the net world (switch port, devlink port,
   etc.). I used the term "connector" in the binding.

A bit of history on that work :

The end goal that I personnaly want to achieve is :

            + PHY - RJ45
            | 
 MAC - MUX -+ PHY - RJ45

After many discussions here on netdev@, but also at netdevconf[1] and
LPC[2], there appears to be several analoguous designs that exist out
there.

[1] : https://netdevconf.info/0x17/sessions/talk/improving-multi-phy-and-multi-port-interfaces.html
[2] : https://lpc.events/event/18/contributions/1964/ (video isn't the
right one)

Take the MAchiatobin, it has 2 interfaces that looks like this :

 MAC - PHY -+ RJ45
            |
	    + SFP - Whatever the module does

Now, looking at the Turris Omnia, we have :


 MAC - MUX -+ PHY - RJ45
            |
	    + SFP - Whatever the module does

We can find more example of this kind of designs, the common part is
that we expose multiple front-facing media ports. This is what this
current work aims at supporting. As of right now, it does'nt add any
support for muxing, but this will come later on.

This first phase focuses on phy-driven ports only, but there are already
quite some challenges already. For one, we can't really autodetect how
many ports are sitting behind a PHY. That's why this series introduces a
new binding. Describing ports in DT should however be a last-resort
thing when we need to clear some ambiguity about the PHY media-side.

The only use-cases that we have today for multi-port PHYs are combo PHYs
that drive both a Copper port and an SFP (the Macchiatobin case). This
in itself is challenging and this series only addresses part of this
support, by registering a phy_port for the PHY <-> SFP connection. The
SFP module should in the end be considered as a port as well, but that's
not yet the case.

However, because now PHYs can register phy_ports for every media-side
interface they have, they can register the capabilities of their ports,
which allows making the PHY-driver SFP case much more generic.

Let me know what you think, I'm all in for discussions :)

Regards,

Changes in V11:
 - The ti,fiber-mode property was deprecated in favor of the
   ethernet-connector binding
 - The .attach_port was split into an MDI and an MII version
 - I added the warning back in the AR8031 PHY driver
 - There is now an init-time check on the number of lanes associated to
   every linkmode, making sure the number of lanes is above or equal to
   the minimum required
 - Various typos were fixed all around
 - We no longer use sfp_select_interface() for SFP interface validation

Changes in V10:
 - Rebase on net-next
 - Fix a typo reported by Köry
 - Aggregate all reviews
 - Fix the conflict on the qcom driver

Changes in V9:
 - Removed maxItems and items from the connector binding
 - Fixed a typo in the binding

Changes in V8:
 - Added maxItems on the connector media binding
 - Made sure we parse a single medium
 - Added a missing bitwise macro

Changes in V7:
 - Move ethtool_medium_get_supported to phy_caps
 - support combo-ports, each with a given set of supported modes
 - Introduce the notion of 'not-described' ports

Changes in V6:

 - Fixed kdoc on patch 3
 - Addressed a missing port-ops registration for the Marvell 88x2222
   driver
 - Addressed a warning reported by Simon on the DP83822 when building
   without CONFIG_OF_MDIO

Changes in V5 :

 - renamed the bindings to use the term "connector" instead of "port"
 - Rebased, and fixed some issues reported on the 83822 driver
 - Use phy_caps

Changes in V4 :

 - Introduced a kernel doc
 - Reworked the mediums definitions in patch 2
 - QCA807x now uses the generic SFP support
 - Fixed some implementation bugs to build the support list based on the
   interfaces supported on a port

V10: https://lore.kernel.org/netdev/20250722121623.609732-1-maxime.chevallier@bootlin.com/
V9: https://lore.kernel.org/netdev/20250717073020.154010-1-maxime.chevallier@bootlin.com/
V8: https://lore.kernel.org/netdev/20250710134533.596123-1-maxime.chevallier@bootlin.com/
v7: https://lore.kernel.org/netdev/20250630143315.250879-1-maxime.chevallier@bootlin.com/
V6: https://lore.kernel.org/netdev/20250507135331.76021-1-maxime.chevallier@bootlin.com/
V5: https://lore.kernel.org/netdev/20250425141511.182537-1-maxime.chevallier@bootlin.com/
V4: https://lore.kernel.org/netdev/20250213101606.1154014-1-maxime.chevallier@bootlin.com/
V3: https://lore.kernel.org/netdev/20250207223634.600218-1-maxime.chevallier@bootlin.com/
RFC V2: https://lore.kernel.org/netdev/20250122174252.82730-1-maxime.chevallier@bootlin.com/
RFC V1: https://lore.kernel.org/netdev/20241220201506.2791940-1-maxime.chevallier@bootlin.com/

Maxime

Maxime Chevallier (16):
  dt-bindings: net: Introduce the ethernet-connector description
  net: ethtool: common: Indicate that BaseT works on up to 4 lanes
  net: ethtool: Introduce ETHTOOL_LINK_MEDIUM_* values
  net: phy: Introduce PHY ports representation
  net: phy: dp83822: Add support for phy_port representation
  dt-bindings: net: dp83822: Deprecate ti,fiber-mode
  net: phy: Create a phy_port for PHY-driven SFPs
  net: phy: Introduce generic SFP handling for PHY drivers
  net: phy: marvell-88x2222: Support SFP through phy_port interface
  net: phy: marvell: Support SFP through phy_port interface
  net: phy: marvell10g: Support SFP through phy_port
  net: phy: at803x: Support SFP through phy_port interface
  net: phy: qca807x: Support SFP through phy_port interface
  net: phy: Only rely on phy_port for PHY-driven SFP
  net: phy: dp83822: Add SFP support through the phy_port interface
  Documentation: networking: Document the phy_port infrastructure

 .../bindings/net/ethernet-connector.yaml      |  45 +++
 .../devicetree/bindings/net/ethernet-phy.yaml |  18 +
 .../devicetree/bindings/net/ti,dp83822.yaml   |  18 +
 Documentation/networking/index.rst            |   1 +
 Documentation/networking/phy-port.rst         | 111 ++++++
 MAINTAINERS                                   |   3 +
 drivers/net/phy/Makefile                      |   2 +-
 drivers/net/phy/dp83822.c                     |  79 +++--
 drivers/net/phy/marvell-88x2222.c             |  95 ++---
 drivers/net/phy/marvell.c                     |  94 ++---
 drivers/net/phy/marvell10g.c                  |  54 +--
 drivers/net/phy/phy-caps.h                    |   5 +
 drivers/net/phy/phy-core.c                    |   6 +
 drivers/net/phy/phy_caps.c                    |  64 ++++
 drivers/net/phy/phy_device.c                  | 333 +++++++++++++++++-
 drivers/net/phy/phy_port.c                    | 194 ++++++++++
 drivers/net/phy/qcom/at803x.c                 |  78 ++--
 drivers/net/phy/qcom/qca807x.c                |  73 ++--
 include/linux/ethtool.h                       |  44 ++-
 include/linux/phy.h                           |  63 +++-
 include/linux/phy_port.h                      |  98 ++++++
 include/uapi/linux/ethtool.h                  |  20 ++
 net/ethtool/common.c                          | 267 ++++++++------
 23 files changed, 1378 insertions(+), 387 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/ethernet-connector.yaml
 create mode 100644 Documentation/networking/phy-port.rst
 create mode 100644 drivers/net/phy/phy_port.c
 create mode 100644 include/linux/phy_port.h

-- 
2.49.0


