Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBEEE77173
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 09:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o1mDTalpLUj3bkk2XLCND1J/h+nXXrpkv1dc6Li300M=; b=dqhWE8iCPfH5uQT2qn08q+YTCE
	06TzyHOEP1RLzO4+uW4kzEmoRYmt6mmsxEXniZABaRJluNclatpZeSn0sGF7qkVl8C4OjSNauLudA
	JkzxItgqlYG8hPiqi+PO7OFKzdvsiZ1oZ3vHQ9bl94OcZFNSibYOw4JmDrUNYUFzt9UC9uFXJo+3n
	iJwljttE2vZL1cs5n+IOFqYzqMg8unAyhB6u/PxyiUdr/x7mwz7B561cjhW+iphcP09/WbRZshmah
	IxctBy99RJs3mA+zELlReZObh0gzcslrA/URrd84251V85Un9z71BPkuYkvbYWCQR1gHCnsDz8EYB
	BuFdlecg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ8dk-0000000FR6Q-35nO;
	Thu, 05 Dec 2024 09:59:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ8bm-0000000FQox-3Iss
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 09:57:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733392639; x=1764928639;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=SdM7VggmTcxbf8b2OTX6vQfzxYnAZ+EP51JNF4mJMF0=;
  b=XbgNF6+sqJYnmJdKLbYbHqVClHPkUwVq8nf52QWWjFEfEkvjHskQhDkH
   JkY9Io0GELgK7xvI6uZ59IXI4yO0mVLO1NErleGsh2oiKpSW2M80vsUKJ
   Jtq9FrUBD518i2U69iV/KOiTyyA3/Z3JtOF0d8ik9obhj51CBvLhDZzSu
   /hNIIYKzaP/JjxPTn+SDr5i49TepKB/GfToE2IU8dr6/dKlr0B/c6CvIX
   rYLMGFq9i/wKRiVTCh8JheffmXln4I3dAvCIZtowzKj+RM4Qvw0OSj0+E
   GbpTTDd80OO6D/IbbAvZDmZMDt+QMpupDgVST7hgPlKeq5VTVIcfEAzbj
   A==;
X-CSE-ConnectionGUID: TKbBYKFISlCTYliYBZMdug==
X-CSE-MsgGUID: 8R89V+2PRp+YRmOpe5uZbQ==
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="266366334"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Dec 2024 02:57:14 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 5 Dec 2024 02:57:13 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 5 Dec 2024 02:57:08 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Thu, 5 Dec 2024 15:27:02 +0530
Subject: [PATCH] dt-bindings: mmc: atmel,hsmci: Convert to json schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241205-hsmci-v1-1-5a25e622dfed@microchip.com>
X-B4-Tracking: v=1; b=H4sIAO14UWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIwNT3Yzi3ORMXfPEZOPUREtDU3NzcyWg2oKi1LTMCrA50bG1tQD8cYq
 DVwAAAA==
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Aubin Constans <aubin.constans@microchip.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Dharma Balasubiramani <dharma.b@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733392627; l=5386;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=SdM7VggmTcxbf8b2OTX6vQfzxYnAZ+EP51JNF4mJMF0=;
 b=0QN3MW/Jgdj9oByvvhUmcqV48fPYJRFbZgt9+zC65YPTHjeIKzDb4lKnwYLGe3k6k/uR09hw+
 o/btQrK51yxC3JpnRuqRaKYLJIoSg0vpCPPfZaS2xz5YOUuSqnVWGB6
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_015718_837606_7565273E 
X-CRM114-Status: GOOD (  15.73  )
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

Convert atmel,hsmci documentation to yaml format. The new file will inherit
from mmc-controller.yaml.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 .../devicetree/bindings/mmc/atmel,hsmci.yaml       | 124 +++++++++++++++++++++
 .../devicetree/bindings/mmc/atmel-hsmci.txt        |  73 ------------
 2 files changed, 124 insertions(+), 73 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/atmel,hsmci.yaml b/Documentation/devicetree/bindings/mmc/atmel,hsmci.yaml
new file mode 100644
index 000000000000..3870d464faa8
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/atmel,hsmci.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/atmel,hsmci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel High-Speed MultiMedia Card Interface (HSMCI)
+
+description:
+  The Atmel HSMCI controller provides an interface for MMC, SD, and SDIO memory
+  cards.
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Aubin Constans <aubin.constans@microchip.com>
+
+allOf:
+  - $ref: mmc-controller.yaml
+
+properties:
+  compatible:
+    const: atmel,hsmci
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    const: rxtx
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: mci_clk
+
+  "#address-cells":
+    const: 1
+    description: Used for slot IDs.
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^slot@[0-9]+$":
+    type: object
+    description: A slot node representing an MMC, SD, or SDIO slot.
+
+    allOf:
+      - $ref: mmc-controller.yaml
+
+    properties:
+      reg:
+        description: Slot ID.
+        minimum: 0
+
+      bus-width:
+        description: Number of data lines connected to the controller.
+        enum: [1, 4, 8]
+
+      cd-gpios:
+        description: GPIO used for card detection.
+
+      cd-inverted:
+        type: boolean
+        description: Inverts the value of the card detection GPIO.
+
+      wp-gpios:
+        description: GPIO used for write protection.
+
+    required:
+      - reg
+      - bus-width
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - "#address-cells"
+  - "#size-cells"
+
+anyOf:
+  - required:
+      - slot@0
+  - required:
+      - slot@1
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/at91.h>
+    mmc@f0008000 {
+      compatible = "atmel,hsmci";
+      reg = <0xf0008000 0x600>;
+      interrupts = <12 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&mci0_clk>;
+      clock-names = "mci_clk";
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      slot@0 {
+        reg = <0>;
+        bus-width = <4>;
+        cd-gpios = <&pioD 15 0>;
+        cd-inverted;
+      };
+
+      slot@1 {
+        reg = <1>;
+        bus-width = <4>;
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/mmc/atmel-hsmci.txt b/Documentation/devicetree/bindings/mmc/atmel-hsmci.txt
deleted file mode 100644
index 07ad02075a93..000000000000
--- a/Documentation/devicetree/bindings/mmc/atmel-hsmci.txt
+++ /dev/null
@@ -1,73 +0,0 @@
-* Atmel High Speed MultiMedia Card Interface
-
-This controller on atmel products provides an interface for MMC, SD and SDIO
-types of memory cards.
-
-This file documents differences between the core properties described
-by mmc.txt and the properties used by the atmel-mci driver.
-
-1) MCI node
-
-Required properties:
-- compatible: should be "atmel,hsmci"
-- #address-cells: should be one. The cell is the slot id.
-- #size-cells: should be zero.
-- at least one slot node
-- clock-names: tuple listing input clock names.
-	Required elements: "mci_clk"
-- clocks: phandles to input clocks.
-
-The node contains child nodes for each slot that the platform uses
-
-Example MCI node:
-
-mmc0: mmc@f0008000 {
-	compatible = "atmel,hsmci";
-	reg = <0xf0008000 0x600>;
-	interrupts = <12 4>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-	clock-names = "mci_clk";
-	clocks = <&mci0_clk>;
-
-	[ child node definitions...]
-};
-
-2) slot nodes
-
-Required properties:
-- reg: should contain the slot id.
-- bus-width: number of data lines connected to the controller
-
-Optional properties:
-- cd-gpios: specify GPIOs for card detection
-- cd-inverted: invert the value of external card detect gpio line
-- wp-gpios: specify GPIOs for write protection
-
-Example slot node:
-
-slot@0 {
-	reg = <0>;
-	bus-width = <4>;
-	cd-gpios = <&pioD 15 0>
-	cd-inverted;
-};
-
-Example full MCI node:
-mmc0: mmc@f0008000 {
-	compatible = "atmel,hsmci";
-	reg = <0xf0008000 0x600>;
-	interrupts = <12 4>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-	slot@0 {
-		reg = <0>;
-		bus-width = <4>;
-		cd-gpios = <&pioD 15 0>
-		cd-inverted;
-	};
-	slot@1 {
-		reg = <1>;
-		bus-width = <4>;
-	};
-};

---
base-commit: feffde684ac29a3b7aec82d2df850fbdbdee55e4
change-id: 20241205-hsmci-7ac3ea915777

Best regards,
-- 
Dharma Balasubiramani <dharma.b@microchip.com>


