Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBFFCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 09:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d8wNTN4nJFwIryp7zoi+iAYOSFbjreO3Yv79wjw8xzE=; b=u/YQ7gJ+Mm3dCwTYi4gvzX1tY9
	wVecSClkjyrvomdVlCZV3YNpic86pyvpw6cc+N1eKxBs9V488poS+m/GEkBiE23LaFryk0cHC8IUs
	KDUltih1XIBiz0xPvYhwua1EyYNCqLMtx2pZM7GDpUg0cyPFWf2vWgxUbdczWL0CkKslajlAwS2Ny
	QxRYs36MdFWfrkdr0qTyR4Bvrr2WoICtxpiY75dKY5Mh2XSOEWV5foN7lVcErcv5CKaczOgAxYmjA
	cHybu1PTKwTv6d6nlhe2iDEeZe+6Wvp7Vf+MkEH08yuMo6JQs3NSHuV1zYJrcKWfHGEaCsdwbaJTP
	nw6q92bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwb7-0000000FBSn-0tr2;
	Thu, 06 Nov 2025 09:48:05 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwb3-0000000FBS3-1zR7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 09:48:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 95B161A18F0;
	Thu,  6 Nov 2025 09:47:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6369B6068C;
	Thu,  6 Nov 2025 09:47:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E070911850790;
	Thu,  6 Nov 2025 10:47:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762422473; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=d8wNTN4nJFwIryp7zoi+iAYOSFbjreO3Yv79wjw8xzE=;
	b=XYLinhattPmhFfPLCAEOoHW2uefulbcrgnPU10gouHohR9pm0/cpLAXMSdHgfNqzuMSBiV
	ZtPfNxd3828M8IKmiFTEl8Tg/RlRSNYN6SAJRlub0rzQSAou4dmWRtnweBcdwdYJb143au
	QRrRCrp1+lHHt2NhzDqtURU7Y4u6fO2rFnWW0/S6URte0uhE39AD/glCJfogl1MXoKV2VX
	dZMe+Vy93lvaSHmsHzgdIhsvftmNNSauYLUfLsGIjJkbXf9KfKwdAVXgzQker7fflrUzGr
	RvzLrwAMk78oDv+KMAW4f6JE7VjkETQC8nmTvsfKMt7t0ivuXrpHks2W0K8+5w==
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
Subject: [PATCH net-next v15 00/15] net: phy: Introduce PHY ports representation
Date: Thu,  6 Nov 2025 10:47:25 +0100
Message-ID: <20251106094742.2104099-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_014801_787305_F1419E61 
X-CRM114-Status: GOOD (  32.07  )
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

Here's v15 for the phy_port representation work. In this version I've
changed the way we deal with lanes vs pairs, to focus only on BaseT
pairs. There were quite some changes to the logic, therefore I have
dropped the tested tags :(

The binding has changed to use pairs instead of lanes, and to make that
only relevant for BaseT.

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

Changes in V15:
 - Update bindings, docs and code to use pairs instead of lanes
 - Make pairs only relevant for BaseT

Changes in V14:
 - Fixed kdoc
 - Use the sfp module_caps feature.

Changes in V13:
 - Added phy_caps support for interface selection
 - Aggregated tested-by tags

Changes in V12:
 - Moved some of phylink's internal helpers to phy_caps for reuse in
   phylib
 - Fixed SFP interface selection
 - Added Rob's review and changes in patch 6

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

V14: https://lore.kernel.org/netdev/20251013143146.364919-1-maxime.chevallier@bootlin.com/
V13: https://lore.kernel.org/netdev/20250921160419.333427-1-maxime.chevallier@bootlin.com/
V12: https://lore.kernel.org/netdev/20250909152617.119554-1-maxime.chevallier@bootlin.com/
V11: https://lore.kernel.org/netdev/20250814135832.174911-1-maxime.chevallier@bootlin.com/
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



Maxime Chevallier (15):
  dt-bindings: net: Introduce the ethernet-connector description
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

 .../bindings/net/ethernet-connector.yaml      |  53 +++
 .../devicetree/bindings/net/ethernet-phy.yaml |  18 +
 .../devicetree/bindings/net/ti,dp83822.yaml   |   9 +-
 Documentation/networking/index.rst            |   1 +
 Documentation/networking/phy-port.rst         | 111 ++++++
 MAINTAINERS                                   |   3 +
 drivers/net/phy/Makefile                      |   2 +-
 drivers/net/phy/dp83822.c                     |  78 ++--
 drivers/net/phy/marvell-88x2222.c             |  94 ++---
 drivers/net/phy/marvell.c                     |  92 ++---
 drivers/net/phy/marvell10g.c                  |  52 +--
 drivers/net/phy/phy-caps.h                    |   5 +
 drivers/net/phy/phy-core.c                    |   6 +
 drivers/net/phy/phy_caps.c                    |  65 ++++
 drivers/net/phy/phy_device.c                  | 337 +++++++++++++++++-
 drivers/net/phy/phy_port.c                    | 205 +++++++++++
 drivers/net/phy/qcom/at803x.c                 |  77 ++--
 drivers/net/phy/qcom/qca807x.c                |  72 ++--
 include/linux/ethtool.h                       |  39 +-
 include/linux/phy.h                           |  63 +++-
 include/linux/phy_port.h                      |  99 +++++
 include/uapi/linux/ethtool.h                  |  20 ++
 net/ethtool/common.c                          | 268 ++++++++------
 23 files changed, 1388 insertions(+), 381 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/ethernet-connector.yaml
 create mode 100644 Documentation/networking/phy-port.rst
 create mode 100644 drivers/net/phy/phy_port.c
 create mode 100644 include/linux/phy_port.h

-- 
2.49.0


