Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DF3CD4F50
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 08:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQehew2BSxY6nK/V9SGY1xcgjaCfK4c9A4R+49pHKNg=; b=Ru+Yl38biN7qxjBwWtRnE5jOrY
	LnJ2/fu607c3LZIySJu1Fr40FK+yTxYcrn3YfVY3twfYZZFRg8wau5bX77gdKC2Qc4Bb0wKwE4INU
	9//bdeoMxM3y0Xqj7sDDmsTHmC+4lF1Z5LR+bdV5jGsq0GwvMO2TxFr7W0SIXCbjDuBETqkww+fq+
	8eGaWxrQm7rOYSAFEauytU9M3O9qf4+O5bSOnRsOIkzN5Wuzk4BRp4YaSLy8wReuwNkDlc7/syRzq
	ZNUDnpxNBJw+AXOTMDJTgwPX6uMfBOEo5tRavrNnSGu1hTkgyIGga/zOoPXfSQeKUtcPg4zdQSXhA
	ZfHmKkgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJSUG-0000000A4Vf-1qr8;
	Thu, 13 Nov 2025 08:15:24 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJSU3-0000000A4Fw-2rkF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 08:15:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4EEACC0F56D;
	Thu, 13 Nov 2025 08:14:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 030356068C;
	Thu, 13 Nov 2025 08:15:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 31EDE102F2351;
	Thu, 13 Nov 2025 09:15:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763021708; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=JQehew2BSxY6nK/V9SGY1xcgjaCfK4c9A4R+49pHKNg=;
	b=PdvcnuOJO4TYDuQvUSl/LezKEFfdCevRG2zIQrGl0Uno13BdIszetyl35IxUlgIJbG2WHg
	jn6O/hOLS4iVjw9qlYmmc6xjYkkHJuG/F4ZqXWMFIrezHigFna9lidwS4kobXUyXpkS3lN
	aMaMC5qEmzb/QJ+hBsMXhSlUs5/XeVI8qyOnjRorTDmWkmKkc/D5BwNUONFVwhzi0tkOaB
	XbUKX6LoEg2UWUxbav+CXpDhz/Colu/7OmGj0OS70QmIi5Csy/ZspEP3Nyhb7NGK7yoKCo
	RPuWgEruTCdT3VQWgA92ZcImKoJk0dJhnuVlemD6aKQxzmjEFlYfCuy+qEzYLg==
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
Subject: [PATCH net-next v16 15/15] Documentation: networking: Document the phy_port infrastructure
Date: Thu, 13 Nov 2025 09:14:17 +0100
Message-ID: <20251113081418.180557-16-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251113081418.180557-1-maxime.chevallier@bootlin.com>
References: <20251113081418.180557-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_001511_915884_94599DAF 
X-CRM114-Status: GOOD (  20.88  )
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

This documentation aims at describing the main goal of the phy_port
infrastructure.

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 Documentation/networking/index.rst    |   1 +
 Documentation/networking/phy-port.rst | 111 ++++++++++++++++++++++++++
 MAINTAINERS                           |   1 +
 3 files changed, 113 insertions(+)
 create mode 100644 Documentation/networking/phy-port.rst

diff --git a/Documentation/networking/index.rst b/Documentation/networking/index.rst
index c775cababc8c..915c27977756 100644
--- a/Documentation/networking/index.rst
+++ b/Documentation/networking/index.rst
@@ -96,6 +96,7 @@ Contents:
    packet_mmap
    phonet
    phy-link-topology
+   phy-port
    pktgen
    plip
    ppp_generic
diff --git a/Documentation/networking/phy-port.rst b/Documentation/networking/phy-port.rst
new file mode 100644
index 000000000000..6e28d9094bce
--- /dev/null
+++ b/Documentation/networking/phy-port.rst
@@ -0,0 +1,111 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. _phy_port:
+
+=================
+Ethernet ports
+=================
+
+This document is a basic description of the phy_port infrastructure,
+introduced to represent physical interfaces of Ethernet devices.
+
+Without phy_port, we already have quite a lot of information about what the
+media-facing interface of a NIC can do and looks like, through the
+:c:type:`struct ethtool_link_ksettings <ethtool_link_ksettings>` attributes,
+which includes :
+
+ - What the NIC can do through the :c:member:`supported` field
+ - What the Link Partner advertises through :c:member:`lp_advertising`
+ - Which features we're advertising through :c:member:`advertising`
+
+We also have info about the number of pairs and the PORT type. These settings
+are built by aggregating together information reported by various devices that
+are sitting on the link :
+
+  - The NIC itself, through the :c:member:`get_link_ksettings` callback
+  - Precise information from the MAC and PCS by using phylink in the MAC driver
+  - Information reported by the PHY device
+  - Information reported by an SFP module (which can itself include a PHY)
+
+This model however starts showing its limitations when we consider devices that
+have more than one media interface. In such a case, only information about the
+actively used interface is reported, and it's not possible to know what the
+other interfaces can do. In fact, we have very little information about whether
+or not there are any other media interfaces.
+
+The goal of the phy_port representation is to provide a way of representing a
+physical interface of a NIC, regardless of what is driving the port (NIC through
+a firmware, SFP module, Ethernet PHY).
+
+Multi-port interfaces examples
+==============================
+
+Several cases of multi-interface NICs have been observed so far :
+
+Internal MII Mux::
+
+  +------------------+
+  | SoC              |
+  |          +-----+ |           +-----+
+  | +-----+  |     |-------------| PHY |
+  | | MAC |--| Mux | |   +-----+ +-----+
+  | +-----+  |     |-----| SFP |
+  |          +-----+ |   +-----+
+  +------------------+
+
+Internal Mux with internal PHY::
+
+  +------------------------+
+  | SoC                    |
+  |          +-----+ +-----+
+  | +-----+  |     |-| PHY |
+  | | MAC |--| Mux | +-----+   +-----+
+  | +-----+  |     |-----------| SFP |
+  |          +-----+       |   +-----+
+  +------------------------+
+
+External Mux::
+
+  +---------+
+  | SoC     |  +-----+  +-----+
+  |         |  |     |--| PHY |
+  | +-----+ |  |     |  +-----+
+  | | MAC |----| Mux |  +-----+
+  | +-----+ |  |     |--| PHY |
+  |         |  +-----+  +-----+
+  |         |     |
+  |    GPIO-------+
+  +---------+
+
+Double-port PHY::
+
+  +---------+
+  | SoC     | +-----+
+  |         | |     |--- RJ45
+  | +-----+ | |     |
+  | | MAC |---| PHY |   +-----+
+  | +-----+ | |     |---| SFP |
+  +---------+ +-----+   +-----+
+
+phy_port aims at providing a path to support all the above topologies, by
+representing the media interfaces in a way that's agnostic to what's driving
+the interface. the struct phy_port object has its own set of callback ops, and
+will eventually be able to report its own ksettings::
+
+             _____      +------+
+            (     )-----| Port |
+ +-----+   (       )    +------+
+ | MAC |--(   ???   )
+ +-----+   (       )    +------+
+            (_____)-----| Port |
+                        +------+
+
+Next steps
+==========
+
+As of writing this documentation, only ports controlled by PHY devices are
+supported. The next steps will be to add the Netlink API to expose these
+to userspace and add support for raw ports (controlled by some firmware, and directly
+managed by the NIC driver).
+
+Another parallel task is the introduction of a MII muxing framework to allow the
+control of non-PHY driver multi-port setups.
diff --git a/MAINTAINERS b/MAINTAINERS
index 49cd44137dea..bf0b5eb578dd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9281,6 +9281,7 @@ F:	Documentation/devicetree/bindings/net/ethernet-connector.yaml
 F:	Documentation/devicetree/bindings/net/ethernet-phy.yaml
 F:	Documentation/devicetree/bindings/net/mdio*
 F:	Documentation/devicetree/bindings/net/qca,ar803x.yaml
+F:	Documentation/networking/phy-port.rst
 F:	Documentation/networking/phy.rst
 F:	drivers/net/mdio/
 F:	drivers/net/mdio/acpi_mdio.c
-- 
2.49.0


