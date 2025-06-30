Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D482CC83029
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 14:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUofeR4OOHoNy6ZZ69n1I0zT2Q87341Ryp2BpJCjvLc=; b=BGyVovvAGgJXv7DXWnrz/yZYd7
	4aHuQH1pF0NtDhcTQeAxZyUREdyf37tzcMM7A/9PrZMKW6CcG7nKjNeplT2DC3B4QOu2L+lo1vT0Y
	Ij76IZG++m46d5jaYqMlgdnuA6X8qt86SdA9hwozCNM++IBOoa9x5IdxL17QzbAkEDmHNoYohzhXI
	nTks6t+BDistGtvzLXblKvqNUudGuOM5AcB3jKfgBOD4lSgSNFtAvbJbo168zXSOhgtKbrtKCCVQJ
	zw/74kihcaE5VT0pwZxkD9NbA+WgwHp1gyClz72N62l/uSSefRAl05jAqtxWr/X8RDubzTDXXznZI
	MBYf4F+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWFpd-00000002dyD-2cjY;
	Mon, 30 Jun 2025 14:50:05 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWFZd-00000002aEi-0ZnY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 14:33:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A48844330;
	Mon, 30 Jun 2025 14:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751294011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EUofeR4OOHoNy6ZZ69n1I0zT2Q87341Ryp2BpJCjvLc=;
	b=bCdtEVeq1H2+O+ZEnIFqCmWOgmrSsF7rTljgU36Cp0/rKWNa2jNmSoiXpN0tP1Dst/XJTt
	lb6Raj0e4w8UKXBFDHzrNt30NqBeOFR91xEx+O5bSvKGMP5fmBxxvi7xXJGmmNoohRRooi
	v+IH7JgzF4bCOg2VPOh8jIfZTBxkSf1lk5E91H34KQYXjBH4B3QApR5gh0nyeSEUAuiJIK
	LX718qlfudprl5yo3AoQchYm2X1ZIylEkYEsHM6GZ9lSC8l4oPbxVdiFJJFkHFcpGjlUrv
	EzePbfN9tsVnemKdmbvFzWLMkfSZ8NTjxv5HNafTSFGkqOOq8q/L0sQkJN5cxA==
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
Subject: [PATCH net-next v7 06/15] net: phy: Create a phy_port for PHY-driven SFPs
Date: Mon, 30 Jun 2025 16:33:05 +0200
Message-ID: <20250630143315.250879-7-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630143315.250879-1-maxime.chevallier@bootlin.com>
References: <20250630143315.250879-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgedtffelffelveeuleelgfejfeevvdejhfehgeefgfffvdefteegvedutefftdenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefuddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_073333_306243_01B356FF 
X-CRM114-Status: GOOD (  17.27  )
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

Some PHY devices may be used as media-converters to drive SFP ports (for
example, to allow using SFP when the SoC can only output RGMII). This is
already supported to some extend by allowing PHY drivers to registers
themselves as being SFP upstream.

However, the logic to drive the SFP can actually be split to a per-port
control logic, allowing support for multi-port PHYs, or PHYs that can
either drive SFPs or Copper.

To that extent, create a phy_port when registering an SFP bus onto a
PHY. This port is considered a "serdes" port, in that it can feed data
to anther entity on the link. The PHY driver needs to specify the
various PHY_INTERFACE_MODE_XXX that this port supports.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phy_device.c | 24 ++++++++++++++++++++++++
 drivers/net/phy/phy_port.c   | 15 +++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 4ec21c31e6c6..e491d3de0189 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1627,6 +1627,26 @@ static void phy_del_port(struct phy_device *phydev, struct phy_port *port)
 	phydev->n_ports--;
 }
 
+static int phy_setup_sfp_port(struct phy_device *phydev)
+{
+	struct phy_port *port = phy_port_alloc();
+
+	if (!port)
+		return -ENOMEM;
+
+	port->parent_type = PHY_PORT_PHY;
+	port->phy = phydev;
+
+	/* The PHY is a media converter, the port connected to the SFP cage
+	 * is a MII port.
+	 */
+	port->is_mii = true;
+
+	phy_add_port(phydev, port);
+
+	return 0;
+}
+
 /**
  * phy_sfp_probe - probe for a SFP cage attached to this PHY device
  * @phydev: Pointer to phy_device
@@ -1648,6 +1668,10 @@ int phy_sfp_probe(struct phy_device *phydev,
 		ret = sfp_bus_add_upstream(bus, phydev, ops);
 		sfp_bus_put(bus);
 	}
+
+	if (phydev->sfp_bus)
+		ret = phy_setup_sfp_port(phydev);
+
 	return ret;
 }
 EXPORT_SYMBOL(phy_sfp_probe);
diff --git a/drivers/net/phy/phy_port.c b/drivers/net/phy/phy_port.c
index f9a1c3d21f78..2c5ae947d759 100644
--- a/drivers/net/phy/phy_port.c
+++ b/drivers/net/phy/phy_port.c
@@ -116,6 +116,21 @@ void phy_port_update_supported(struct phy_port *port)
 		phy_caps_medium_get_supported(supported, i, port->lanes);
 		linkmode_or(port->supported, port->supported, supported);
 	}
+
+	/* Serdes ports supported may through SFP may not have any medium set,
+	 * as they will output PHY_INTERFACE_MODE_XXX modes. In that case, derive
+	 * the supported list based on these interfaces
+	 */
+	if (port->is_mii && linkmode_empty(supported)) {
+		unsigned long interface, link_caps = 0;
+
+		/* Get each interface's caps */
+		for_each_set_bit(interface, port->interfaces,
+				 PHY_INTERFACE_MODE_MAX)
+			link_caps |= phy_caps_from_interface(interface);
+
+		phy_caps_linkmodes(link_caps, port->supported);
+	}
 }
 EXPORT_SYMBOL_GPL(phy_port_update_supported);
 
-- 
2.49.0


