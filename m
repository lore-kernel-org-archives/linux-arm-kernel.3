Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FE0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 20:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u2MMjEyytEL5CdgAhFxrsK7rIqJmCWS3UWTBJEjAmcE=; b=UJMSPgTOvmqyzoG+BpJYe8F+R2
	cyAXWV0I+SO68pc5VrwBem5qL9gMcDHWhL6gx61pvAfqykiwq3ly/Hjl/b7YmkSQiNivSRK7wzuGP
	O6kFNEHOzmnThDXXMNVG5XT41TM5v6IFcxiJAlb6Mqw/2edMViY4bBfcSWw3cwh55qPhKq50giI0+
	xvQ7+pMZzSo4MNdMLHKK44fzfGMhkNijCG0ORe9WYpveW63D6jgTEs/8fmzcJ1stkhtkEI/Bvbxfs
	ExsZL8bb+WN7VJA756hoUeRP5nVVb4iNWipVJV4oP+fQ07E0MW0cuWiIVswVvf2tVbwoh2gOHhPgO
	EsHb8LzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOjRM-0000000614P-33by;
	Fri, 20 Dec 2024 20:17:40 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOjP5-000000060bp-00nG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 20:15:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 34E2DE0003;
	Fri, 20 Dec 2024 20:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734725710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u2MMjEyytEL5CdgAhFxrsK7rIqJmCWS3UWTBJEjAmcE=;
	b=JO1igV59eWIttc2wpOMNbIkrZeHlqDuQnDC4iAi1L2ARrfj9JI4iDDNChKxPbPb/fxZimk
	/FO0aufF3bFJxV6t9dP2wHh4VFL3ipANsHlKNNlU8a//JTfJlvJbDXwTrlZmAZSlnNhy/l
	wUURv1VjxEWAzLHCjPYOGe1eQSKmizzJlOdAjptFq3FLULQghdtjaAudNGmgiatpcJimZh
	pkSiYXY9QI43VWGSM7Y0vuxTSwnt0C8sIy0WItFBNHaw5RRQaNKsa+bz2QKtLz1muOEhHp
	sO5HEfbfPFNQ1tOyHirXsBoJdzFM5Wo7CW+Y5wA8KrEDsuIZ/OXw93t1r7d/QQ==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
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
	Antoine Tenart <atenart@kernel.org>
Subject: [PATCH net-next RFC 0/5] net: phy: Introduce a port representation
Date: Fri, 20 Dec 2024 21:14:59 +0100
Message-ID: <20241220201506.2791940-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_121519_377343_49BCDF5C 
X-CRM114-Status: GOOD (  20.50  )
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

This is a long overdue series to kick-off the introduction of a better representation
of front-facing ports for ethernet interfaces.

First, a short disclaimer. This series is RFC, and there are quite a lot of
shortcomings :

 - There's no DT binding although this series adds a generic representation of
   ports
 - The port representation is in a minimal form
 - No SFP support is included, but it will be required for that series to come
   out of RFC as we can't gracefully handle multi-port interfaces without it.

These shortcomigs come from timing constraints, but also because I'd like to
start discussing that topic with some code as a basis.

For now, the only representation we have about the physical ports of an interface
come from the 'port' field (PORT_FIBRE, PORT_TP, PORT_MII, etc.), the presence or
not of an SFP module and the linkmodes reported by the ethtol ksettings ops. This
isn't enough to get a good idea of what the actual interface with the outside world
looks like.

The end-goal of the work this series is a part of is to get support for multi-port
interfaces. My end use-case has 2 ports, each driven by a dedicated PHY, but this
also applies to dual-port PHYs.

The current series introduces the object "struct phy_port". The naming may be
improved, as I think we could consider supporting port representation without
depending on phylib (not the case in this RFC). For now, not only do we integrate
that work in phylib, but only PHY-driven ports are supported.

In some situations, having a good representation of the physical port in devicetree
proves to be quite useful. We're seeing vendor properties to address the lack of
port representation such as micrel,fiber-mode or ti,fiber-mode, but there are needs
for more (glitchy straps that detect fiber mode on a PHY connected to copper,
RJ45 ports connected with 2 lanes only, ...).

As I said this RFC has no binding, sorry about that, but let's take a look at
the proposed DT syntax :

Example 1 : PHY with RJ45 connected with 2 lanes only

&mdio {

	ge_phy: ethernet-phy@0 {
		reg = <0>;

		mdi {
			port@0 {
				media = "BaseT",
				lanes = <2>;
			};
		};

	};
};

Example 2 : PHY with a 100BaseFX port, without SFP

&mdio {

	fiber-phy: ethernet-phy@0 {
		reg = <0>;

		mdi {
			port@0 {
				media = "BaseF",
				lanes = <1>;
			};
		};

	};
};

These ports may even be used to specify PSE-PD information for PoE ports that
are drivern by a dedicated PoE controller sitting in-between the PHY and the
connector :

&mdio {

	ge_phy: ethernet-phy@0 {
		reg = <0>;

		mdi {
			port@0 {
				media = "BaseT",
				lanes = <4>;
				pse = <&pse1>;
			};
		};

	};
};

The ports are initialized using the following sequence :

1: The PHY driver's probe() function indicated the max number of ports the device
can control

2: We parse the devicetree to find generic port representations

3: If we don't have at least one port from DT, we create one

4: We call the phy's .attach_port() for each port created so far. This allows
   the phy driver either to take action based on the generic port devicetree
   indications, or to populate the port information based on straps and
   vendor-specific DT properties (think micrel,fiber-mode and similar)

5: If the ports are still not initialized (no .attach_port, no generic DT), then
   we use snesible default value from what the PHY's supported modes.

6: We reconstruct the PHY's supported field in case there are limitations from the
   port (2 lanes on BaseT for example). This last step will need to be changed
   when SFP gets added.

So, the current work is only about init. The next steps for that work are :

 - Introduce phy_port_ops, including a .configure() and a .read_status() to get
 proper support for multi-port PHYs. This also means maintaining a list of
 advertising/lp_advertising modes for each port.

 - Add SFP support. It's a tricky part, the way I see that and have prototyped is
 by representing the SFP cage itself as a port, as well as the SFP module's port.
 ports therefore become chainable.

 - Add the ability to list the ports in userspace.

Prototype work for the above parts exist, but due to lack of time I couldn't get
them polished enough for inclusion in that RFC.

Let me know if you see this going in the right direction, I'm really all ears
for suggestions on this, it's quite difficult to make sure no current use-case
breaks and no heavy rework is needed in PHY drivers.

Patches 1, 2 and 3 are preparatory work for the mediums representation. Patch 4
introduces the phy_port and patch 5 shows an example of usage in the dp83822 phy.

Thanks,

Maxime

Maxime Chevallier (5):
  net: ethtool: common: Make BaseT a 4-lanes mode
  net: ethtool: Introduce ETHTOOL_LINK_MEDIUM_* values
  net: ethtool: Export the link_mode_params definitions
  net: phy: Introduce PHY ports representation
  net: phy: dp83822: Add support for phy_port representation

 drivers/net/phy/Makefile     |   2 +-
 drivers/net/phy/dp83822.c    |  60 +++++++----
 drivers/net/phy/phy_device.c | 167 +++++++++++++++++++++++++++++
 drivers/net/phy/phy_port.c   | 159 ++++++++++++++++++++++++++++
 include/linux/ethtool.h      |  62 +++++++++++
 include/linux/phy.h          |  31 ++++++
 include/linux/phy_port.h     |  69 ++++++++++++
 net/ethtool/common.c         | 197 +++++++++++++++++++----------------
 net/ethtool/common.h         |   7 --
 9 files changed, 633 insertions(+), 121 deletions(-)
 create mode 100644 drivers/net/phy/phy_port.c
 create mode 100644 include/linux/phy_port.h

-- 
2.47.1


