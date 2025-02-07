Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680E2C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 22:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcP/2WaBJHP5tA+OzJz+JTFjkcnugVAsr2S/nT1cu0c=; b=19WnsAZTNBGSszbmJMRsGA4Wbt
	Da25HdlQxu8Fq19yz5M0AsRGvFgZ7qkHo7YuzUKBDo/+TlX1aDyK6MHa8gb8Y/Od1k6eWkib0xl8q
	i8cEFI8t0ToO5mjuV1nHUVlRb0keY1YvmY+KFfAwQqtFSaPhTYcCQxggKOVodz3u9AlfpoDB2XYuM
	N66RRZgDl2O3YsskFGyOlPSy+RyIjAk2PyK/cSlwzsmS8RBiy/KU4TZNzAl+AX3Oq3Y0WFkfgy0HQ
	IKUbux643XPnEscWtF62UaLSkQMSE8Yf7zHcOn/0tnUPg9Ij8ktS8FA91KxK0vARKAcMLPBRknEZ8
	t9BWALJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgX61-0000000BRA4-2Si6;
	Fri, 07 Feb 2025 22:45:13 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgWxs-0000000BPCS-45se
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 22:36:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D901E204A9;
	Fri,  7 Feb 2025 22:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738967807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qcP/2WaBJHP5tA+OzJz+JTFjkcnugVAsr2S/nT1cu0c=;
	b=BVZ5wq7tZVrVH95F53vD7rnZP1+s5APncTnqwU4Qh1iM8kNXLLtzVeTDgdhrO7JMQj+KlX
	EvJwHSB/6CcD9DEq5xfmcbI4YMl5iny3oeUnkA6XO1/iImuPxHHt6HEijUV74r2ZlhDGFF
	EHg8l62/wYKx+tnsAYwre6KUDilCphj4XMe1fKWEYp/ZT0kn86ZIhkx3n0aRrqTcY+wtme
	85Hk9t/nOAMFVHBZf5pTdBTddpMJD54FACbxN1fCkBXHFElmENSqZPBo+rHLkaQ68OXutt
	5Jly1W3WvZinqEqowM/fvhOcealNFN2gEt99I5pwZYJok40Afqo45Q3VOYlINg==
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
	Romain Gantois <romain.gantois@bootlin.com>
Subject: [PATCH net-next 05/13] net: phy: Create a phy_port for PHY-driven SFPs
Date: Fri,  7 Feb 2025 23:36:24 +0100
Message-ID: <20250207223634.600218-6-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207223634.600218-1-maxime.chevallier@bootlin.com>
References: <20250207223634.600218-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdehtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgedtffelffelveeuleelgfejfeevvdejhfehgeefgfffvdefteegvedutefftdenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemtggtfegtmeeglehfgeemfeeiheehmegsheejgeenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegttgeftgemgeelfhegmeefieehheemsgehjeegpdhhvghlohepfhgvughorhgrqddurdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvledprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrr
 dhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_143649_160765_72ABA1D9 
X-CRM114-Status: GOOD (  19.51  )
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
 drivers/net/phy/phy_device.c | 21 +++++++++++++++++++++
 drivers/net/phy/phy_port.c   | 10 ++++++++++
 drivers/net/phy/phylink.c    | 32 ++++++++++++++++++++++++++++++++
 include/linux/phylink.h      |  2 ++
 4 files changed, 65 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index df016d344c55..56928c4459c6 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1460,6 +1460,23 @@ static void phy_del_port(struct phy_device *phydev, struct phy_port *port)
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
+	port->is_serdes = true;
+
+	phy_add_port(phydev, port);
+
+	return 0;
+}
+
 /**
  * phy_sfp_probe - probe for a SFP cage attached to this PHY device
  * @phydev: Pointer to phy_device
@@ -1481,6 +1498,10 @@ int phy_sfp_probe(struct phy_device *phydev,
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
index 3a7bdc44b556..7fba101369cf 100644
--- a/drivers/net/phy/phy_port.c
+++ b/drivers/net/phy/phy_port.c
@@ -7,6 +7,7 @@
 #include <linux/linkmode.h>
 #include <linux/of.h>
 #include <linux/phy_port.h>
+#include <linux/phylink.h>
 
 /**
  * phy_port_alloc: Allocate a new phy_port
@@ -146,6 +147,15 @@ void phy_port_update_supported(struct phy_port *port)
 		ethtool_medium_get_supported(supported, i, port->lanes);
 		linkmode_or(port->supported, port->supported, supported);
 	}
+
+	/* Serdes ports supported may through SFP may not have any medium set,
+	 * as they will output PHY_INTERFACE_MODE_XXX modes. In that case, derive
+	 * the supported list based on these interfaces
+	 */
+	if (port->is_serdes && linkmode_empty(supported))
+		phylink_interfaces_to_linkmodes(port->supported,
+						port->interfaces);
+
 }
 EXPORT_SYMBOL_GPL(phy_port_update_supported);
 
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 214b62fba991..a49edc012636 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -673,6 +673,38 @@ static void phylink_validate_mask_caps(unsigned long *supported,
 	linkmode_and(state->advertising, state->advertising, mask);
 }
 
+/**
+ * phylink_interfaces_to_linkmodes() - List all possible linkmodes based on a
+ *				       set of supported interfaces, assuming no
+ *				       rate matching.
+ * @linkmodes: the supported linkmodes
+ * @interfaces: Set of interfaces (PHY_INTERFACE_MODE_XXX)
+ *
+ * Compute the exhaustive list of modes that can conceivably be achieved from a
+ * set of MII interfaces. This is derived from the possible speeds and duplex
+ * achievable from these interfaces. This list is likely too exhaustive (there
+ * may not exist any device out there that can convert from an interface to a
+ * linkmode) and it needs further filtering based on real HW capabilities.
+ */
+void phylink_interfaces_to_linkmodes(unsigned long *linkmodes,
+				     const unsigned long *interfaces)
+{
+	phy_interface_t interface;
+	unsigned long caps = 0;
+
+	linkmode_zero(linkmodes);
+
+	for_each_set_bit(interface, interfaces, PHY_INTERFACE_MODE_MAX)
+		caps = phylink_get_capabilities(interface,
+						GENMASK(__fls(MAC_400000FD),
+							__fls(MAC_10HD)),
+						RATE_MATCH_NONE);
+
+	phylink_set(linkmodes, Autoneg);
+	phylink_caps_to_linkmodes(linkmodes, caps);
+}
+EXPORT_SYMBOL_GPL(phylink_interfaces_to_linkmodes);
+
 static int phylink_validate_mac_and_pcs(struct phylink *pl,
 					unsigned long *supported,
 					struct phylink_link_state *state)
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 898b00451bbf..ffd8dd32ff3d 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -176,6 +176,8 @@ struct phylink_config {
 };
 
 void phylink_limit_mac_speed(struct phylink_config *config, u32 max_speed);
+void phylink_interfaces_to_linkmodes(unsigned long *linkmodes,
+				     const unsigned long *interfaces);
 
 /**
  * struct phylink_mac_ops - MAC operations structure.
-- 
2.48.1


