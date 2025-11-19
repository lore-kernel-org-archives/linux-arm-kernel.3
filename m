Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CD1CF58DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 19:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ufp3kAXMSgKW2930xyBy2R83bPWmF3ZuHUfc35hNYPk=; b=Od0QWTV4io79ASgTLx5NLXn8Tc
	5eqTfVrhNi4M54fK8dPf7sUxkaBWvysMw7Pg+xEjVri1bN38kLMG/PQbovMBspBERelkR7TuegKAo
	b8RmqDmhyT2PuN4zWL/+j01yDYr4/QRaVuwz4SO+0fPfjIP5cJq+/rbm7LLGKD9g9BDYPugA/uPSb
	/nCoCYMcbNTUQqZNDNwVCs0+PsoqkvUVExwLwBktV8xynZKaw2S/PZA23LJb1oXQyYWQCVyazHr45
	BSK8RDzZpW4oagBc78E3vWmX1URXeE9Iq9YU1han8U2Wz4uUNzl7xcW5f5JI/FogmswZds2/plMlL
	ZjZudplg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLoL9-00000005GQ3-0vrO;
	Wed, 19 Nov 2025 19:59:43 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLoL5-00000005GMR-01Cm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 19:59:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8454C4E417AE;
	Wed, 19 Nov 2025 19:59:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A01660699;
	Wed, 19 Nov 2025 19:59:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 60FE510371A45;
	Wed, 19 Nov 2025 20:59:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763582375; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ufp3kAXMSgKW2930xyBy2R83bPWmF3ZuHUfc35hNYPk=;
	b=ojx27T5R2r9ZP0+wn75GGZLA401L0Rzyx3+I25lAQyv5zoDh1fz1dkbhGCEiu4P5Eu2IEx
	WXP780TjDNc8vXh/l9ev8KJ3NHs0pyUqFONU8NWU3f9+w8NIDJ6JcvQZWqrG4WX0r/8bWS
	UM0i1l3dIMeqxGOtQs9ZoriwvCt/RsjP4lwNFFnkogaky+XvWfEaNGxBkXuNbrDbncN3ED
	Xu5WwsCXpjQVNNBCAv6qGYG9UBxaPJV0Ca/AabKR8qhKfBJlu+EkoPnOtqvv++8CLJ/F4d
	T/jDtWGYudwTbolwCMJHwUpbXX6LIvkFB4x14/ly+14tRP3MFsPYUJq2zCEZMQ==
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
Subject: [PATCH net-next v17 01/15] dt-bindings: net: Introduce the ethernet-connector description
Date: Wed, 19 Nov 2025 20:59:02 +0100
Message-ID: <20251119195920.442860-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251119195920.442860-1-maxime.chevallier@bootlin.com>
References: <20251119195920.442860-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_115939_331784_73841F9D 
X-CRM114-Status: GOOD (  19.60  )
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

 - The number of pairs, which is a quite generic property that allows
   differentating between multiple similar technologies such as BaseT1
   and "regular" BaseT (which usually means BaseT4).

 - The media that can be used on that port, such as BaseT for Twisted
   Copper, BaseC for coax copper, BaseS/L for Fiber, BaseK for backplane
   ethernet, etc. This allows defining the nature of the port, and
   therefore avoids the need for vendor-specific properties such as
   "micrel,fiber-mode" or "ti,fiber-mode".

The port description lives in its own file, as it is intended in the
future to allow describing the ports for phy-less devices.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 .../bindings/net/ethernet-connector.yaml      | 57 +++++++++++++++++++
 .../devicetree/bindings/net/ethernet-phy.yaml | 18 ++++++
 MAINTAINERS                                   |  1 +
 3 files changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/ethernet-connector.yaml

diff --git a/Documentation/devicetree/bindings/net/ethernet-connector.yaml b/Documentation/devicetree/bindings/net/ethernet-connector.yaml
new file mode 100644
index 000000000000..2ccac24bd8d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/ethernet-connector.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/ethernet-connector.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic Ethernet Connector
+
+maintainers:
+  - Maxime Chevallier <maxime.chevallier@bootlin.com>
+
+description:
+  An Ethernet Connector represents the output of a network component such as
+  a PHY, an Ethernet controller with no PHY, or an SFP module.
+
+properties:
+
+  pairs:
+    description:
+      Defines the number of BaseT pairs that are used on the connector.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 4]
+
+  media:
+    description:
+      The mediums, as defined in 802.3, that can be used on the port.
+    enum:
+      - BaseT
+      - BaseK
+      - BaseS
+      - BaseC
+      - BaseL
+      - BaseD
+      - BaseE
+      - BaseF
+      - BaseV
+      - BaseMLD
+
+required:
+  - media
+
+allOf:
+  - if:
+      properties:
+        media:
+          contains:
+            const: BaseT
+    then:
+      required:
+        - pairs
+    else:
+      properties:
+        pairs: false
+
+additionalProperties: true
+
+...
diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
index bb4c49fc5fd8..58634fee9fc4 100644
--- a/Documentation/devicetree/bindings/net/ethernet-phy.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
@@ -281,6 +281,17 @@ properties:
 
     additionalProperties: false
 
+  mdi:
+    type: object
+
+    patternProperties:
+      '^connector-[0-9]+$':
+        $ref: /schemas/net/ethernet-connector.yaml#
+
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
 required:
   - reg
 
@@ -317,5 +328,12 @@ examples:
                     default-state = "keep";
                 };
             };
+            /* Fast Ethernet port, with only 2 pairs wired */
+            mdi {
+                connector-0 {
+                    pairs = <2>;
+                    media = "BaseT";
+                };
+            };
         };
     };
diff --git a/MAINTAINERS b/MAINTAINERS
index b0223cfb2583..0f4fb37e77b1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9279,6 +9279,7 @@ R:	Russell King <linux@armlinux.org.uk>
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-class-net-phydev
+F:	Documentation/devicetree/bindings/net/ethernet-connector.yaml
 F:	Documentation/devicetree/bindings/net/ethernet-phy.yaml
 F:	Documentation/devicetree/bindings/net/mdio*
 F:	Documentation/devicetree/bindings/net/qca,ar803x.yaml
-- 
2.49.0


