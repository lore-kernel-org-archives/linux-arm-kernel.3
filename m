Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDBCCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 08:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldNMq3alREQpVULZSO3jO6i1MPmL6yKVLiwqj/naWYk=; b=jdHymP2o72uSHaewP69nYW8Mlr
	bzyQS+yW5EQlCtFxIko9CHIp4EPNv29HpwpkblRH08mnE67VbCz8OlEBmxhSI1mX9cpNVVTgNbzlS
	zx9nwDUPg5R6AaWBPh4cwaGUOG5NdYitaraonnzoNerkgxTaKekSPBI9pTPypEelHnTeY++bv0Z0G
	lxqMWSCzyrPn/xh2FT5F0/Et4kMzSH3UE0x1bMLR571nSIryi1YE2GihXmIOwF12IRQSAyQTn6ufy
	k6R94YTKYy3pZoRd02/9jf3uV6KIBn5ZVIMIFc9rnynlIU6lGrrvFSTW9Bk4RFQtoOxyexLhYuVmz
	KR3Vbn8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJSTS-0000000A3jJ-0AKk;
	Thu, 13 Nov 2025 08:14:34 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJSTO-0000000A3hM-37LQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 08:14:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5C3831A1A70;
	Thu, 13 Nov 2025 08:14:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 25D3D6068C;
	Thu, 13 Nov 2025 08:14:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 343FA102F2256;
	Thu, 13 Nov 2025 09:14:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763021666; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ldNMq3alREQpVULZSO3jO6i1MPmL6yKVLiwqj/naWYk=;
	b=D1YEu/2M09FDAlw/qcMMPoP/QdxEODwCNMKo+CbRR7Asnz9wtz5R05snZZYUBdyO2VNwXu
	ja7ZSesKWu4kk0kD3Dn6qRZ7IUfuwWGvc5tAhv7XxIKd1DJl6fN/UvC11ChLOW7SnXe3BZ
	NMccBYOWLsv8KVl7PlLZRvPcHWpKRM5qwjN38+AMZiTpP4xO5qsp57Iq6fHdgQ1QCfEcWw
	AxvHO8a/6eYC0tX3end3S2jzvpbQz7kB6paX0zszufes5O0kbXCtDuLK1KTeaG6uqd78Y4
	LATcesDZD4kB2TxB5h/ToaQQNSj1I7onTHSJSmZFlVG4x8Ekqsm32a3ojciEjQ==
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
Subject: [PATCH net-next v16 01/15] dt-bindings: net: Introduce the ethernet-connector description
Date: Thu, 13 Nov 2025 09:14:03 +0100
Message-ID: <20251113081418.180557-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251113081418.180557-1-maxime.chevallier@bootlin.com>
References: <20251113081418.180557-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_001430_918175_AF699DAB 
X-CRM114-Status: GOOD (  18.71  )
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
index 0dc4aa37d903..92d6309a968d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9277,6 +9277,7 @@ R:	Russell King <linux@armlinux.org.uk>
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-class-net-phydev
+F:	Documentation/devicetree/bindings/net/ethernet-connector.yaml
 F:	Documentation/devicetree/bindings/net/ethernet-phy.yaml
 F:	Documentation/devicetree/bindings/net/mdio*
 F:	Documentation/devicetree/bindings/net/qca,ar803x.yaml
-- 
2.49.0


