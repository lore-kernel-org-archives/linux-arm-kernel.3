Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA6BC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 10:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=akpNRWWMvv7pF0+12PVa/Q8rH2F+xiYxVG9nFrfAwP4=; b=2n3BDkaW8rBbGyBex0yXdu4uWB
	oOCs7r+DRiiLC5D6drDx28GtrN/v+rGFF+93ezhhRA0EHxrM7CVdnG8fzYzVm5wXWgxeQLwks6mu7
	S9fWoywBkN4WR+PUbgjNWhaHFOcNsKdIUNENSIEK2VVToYeni6EIW5iGDBFPCoMmIgmoiHOaDgrV4
	E/4Z+prGmih5ylacAZ/xd3iu/0sw6ucpR6OErmhEE6muU4oNMM8ofjDKOpaCSxT48VAzSM4nWtV0p
	wgKbIzKNnphOjbbobldNhQAKTjtHqIGrevjZ4U1xN6pKMlzwDA/NZLfRK6q/Y7zg372Zmd5pfrabs
	svHqXHrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiWeL-0000000Ahc3-1nF4;
	Thu, 13 Feb 2025 10:40:53 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiWGs-0000000Ad24-0BjD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 10:16:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3C014326D;
	Thu, 13 Feb 2025 10:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739441796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=akpNRWWMvv7pF0+12PVa/Q8rH2F+xiYxVG9nFrfAwP4=;
	b=j3HGBuoQ2iIDjdhxdwKl9ydGd+dB4vQw8rwP7lNn3jZnsapH1jJ58iSGQcStPEigxtEMKN
	KI15GYMn5YGGPG5LurTK3lQHrhiYHyS1jVNKsxs5MPfEhAPBZoVb5tJyZVvniuYqyqeeGh
	KroHWqwjJ31BM8Cp7DVoBMW1XQFUAQytjE43WQqwOMEdX1j5iMTy9+bvL3BJxberMW64uH
	9oWSOmOSQ/bExLK+qTjOYwRv6frX6TtTsNCj/TslH4p8FnF7OCcij7TyIigVcW5Gd7LH6P
	Ft4bf49VtnSB+n4p3GJQkTdcfhXo0gLKwE0rnmfPpZmq75qFAJbpgo8k6b8hSw==
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
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	Sean Anderson <seanga2@gmail.com>
Subject: [PATCH net-next v4 15/15] dt-bindings: net: Introduce the phy-port description
Date: Thu, 13 Feb 2025 11:16:03 +0100
Message-ID: <20250213101606.1154014-16-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213101606.1154014-1-maxime.chevallier@bootlin.com>
References: <20250213101606.1154014-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegieehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeulefgvddthfekkedugeeikeeuudekhfekgfehgfelkeekkeekhfejkefgvefhieenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecukfhppedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgdphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedvpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgto
 hhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_021638_213368_FC9EA512 
X-CRM114-Status: GOOD (  18.94  )
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

The ability to describe the physical ports of Ethernet devices is useful
to describe multi-port devices, as well as to remove any ambiguity with
regard to the nature of the port.

Moreover, describing ports allows for a better description of features
that are tied to connectors, such as PoE through the PSE-PD devices.

Introduce a binding to allow describing the ports, for now with 2
attributes :

 - The number of lanes, which is a quite generic property that allows
   differentating between multiple similar technologies such as BaseT1
   and "regular" BaseT (which usually means BaseT4).

 - The media that can be used on that port, such as BaseT for Twisted
   Copper, BaseC for coax copper, BaseS/L for Fiber, BaseK for backplane
   ethernet, etc. This allows defining the nature of the port, and
   therefore avoids the need for vendor-specific properties such as
   "micrel,fiber-mode" or "ti,fiber-mode".

The port description lives in its own file, as it is intended in the
future to allow describing the ports for phy-less devices.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V4: no changes

 .../devicetree/bindings/net/ethernet-phy.yaml | 18 +++++++
 .../bindings/net/ethernet-port.yaml           | 47 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 3 files changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/ethernet-port.yaml

diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
index 2c71454ae8e3..950fdacfd27d 100644
--- a/Documentation/devicetree/bindings/net/ethernet-phy.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
@@ -261,6 +261,17 @@ properties:
 
     additionalProperties: false
 
+  mdi:
+    type: object
+
+    patternProperties:
+      '^port-[a-f0-9]+$':
+        $ref: /schemas/net/ethernet-port.yaml#
+
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
 required:
   - reg
 
@@ -297,5 +308,12 @@ examples:
                     default-state = "keep";
                 };
             };
+
+            mdi {
+              port-0 {
+                lanes = <2>;
+                media = "BaseT";
+              };
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/net/ethernet-port.yaml b/Documentation/devicetree/bindings/net/ethernet-port.yaml
new file mode 100644
index 000000000000..bf0f64f1b0aa
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/ethernet-port.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/ethernet-port.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic Ethernet Port
+
+maintainers:
+  - Maxime Chevallier <maxime.chevallier@bootlin.com>
+
+description:
+  An Ethernet port represents an output, such as a connector, of a network
+  component such as a PHY, an Ethernet controller with no PHY, or an SFP module.
+
+properties:
+
+  lanes:
+    description:
+      Defines the number of lanes on the port, that is the number of physical
+      channels used to convey the data with the link partner.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  media:
+    description:
+      The mediums, as defined in 802.3, that can be used on the port.
+    items:
+      enum:
+        - BaseT
+        - BaseK
+        - BaseS
+        - BaseC
+        - BaseL
+        - BaseD
+        - BaseE
+        - BaseF
+        - BaseV
+        - BaseMLD
+        - BaseX
+
+required:
+  - lanes
+  - media
+
+additionalProperties: true
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index ecbf70939927..7806b8e574e1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8602,6 +8602,7 @@ L:	netdev@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-class-net-phydev
 F:	Documentation/devicetree/bindings/net/ethernet-phy.yaml
+F:	Documentation/devicetree/bindings/net/ethernet-port.yaml
 F:	Documentation/devicetree/bindings/net/mdio*
 F:	Documentation/devicetree/bindings/net/qca,ar803x.yaml
 F:	Documentation/networking/phy-port.rst
-- 
2.48.1


