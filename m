Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73091C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 09:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LcQLZtNCe6bxR5lqw0cBBlNcaVvSozc7W5YvsyGdKK0=; b=Vp9sMKQ+mUjAc4cOIIaoccFYQf
	DDre25Mp1fZZaJMYLBf/STterkkNrlHVe4IqL90l0EolAGFW1g+nwBF7n8DTRATidoWB9zCGbb6j/
	jDHg/b17bCnZn9R0e5ggGKsDngO8eW5zsmDQyx39LVLKLieVL6/Yd/WhV0FAJSUK08hvcxGkuQYbU
	ZihAtdSa2yz+1DBm1dqTJ110ko3Z+Cle/qM07xnhvYXKbnAIat8QKlyG4omdFs4+nhStDqKoKcCtY
	xKmGo04qtOzBB1NzsSITF4Nsm4Rr9GgFVN3VgaMIWkvxPYRPvS3ZBpxXpvFH7NAnaART0zdRY0KBp
	J8wtPjvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tesWK-0000000ExQ8-0FRq;
	Mon, 03 Feb 2025 09:13:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesUz-0000000ExHQ-1Qlk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 09:12:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1738573930; x=1770109930;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GoZ1I8nwjXJDyNzuyNG8kMf4j9q65G9XZXlJCuRM9Ss=;
  b=L6Zcis783O2Jb9+ghLQyhNM/9g7CYNsnX1RKPjwnmpa9bBMO3z1C77hd
   yh/TuFnJBfh61MqgklTzguPTDOuWCkbeYi1XacHyrwbKXCdLXP7CwziXR
   +rlpbscFv/2+V1/+z5iXWYJoh7Dj+6ggAEPdUYbDFsqrExz/TRjhJ1Ts7
   FFoEilnWYgnHrSlSRcI8CfCJXmdMrwB9yGkoFyGpdrb2LUKrWqOksDNR2
   9mj1QaFExr5L/+owbebwXJEvi5AFTHo6zPPt+fqTgrPmOuo6NoxfgvOXw
   8SmkJhAauAgimKL3IWkapOwNxQPI6MPn/KzHLX3qyqmluE1vjVJ3BeD+8
   g==;
X-CSE-ConnectionGUID: 7vGpeTJvQHexY+vrjMcrEA==
X-CSE-MsgGUID: pxeKEp38Sx+/HvgXMb1IHw==
X-IronPort-AV: E=Sophos;i="6.13,255,1732604400"; 
   d="scan'208";a="268528704"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Feb 2025 02:12:07 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 3 Feb 2025 02:11:47 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 3 Feb 2025 02:11:43 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <claudiu.beznea@tuxon.dev>,
	<alexandre.belloni@bootlin.com>, <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>, Andrei Simion
	<andrei.simion@microchip.com>
Subject: [PATCH v2] ASoC: dt-bindings: atmel,at91-ssc: Convert to YAML format
Date: Mon, 3 Feb 2025 11:11:12 +0200
Message-ID: <20250203091111.21667-1-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_011209_396215_CDE6AC55 
X-CRM114-Status: GOOD (  20.86  )
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

Convert devicetree binding atmel-ssc.txt to YAML format.
Update the documentation supported file for MICROCHIP SSC DRIVER.

Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
---
v1 -> v2:
- squash MAINTAINERS patch
- place this yaml in sound directory
- reword the commit title
- reword the commit message
- add #sound-dai-cells const 0
- add required
- include ref dai-common.yaml#
- fix the logic for the required properties for DMA transfer
- update examples by adding #sound-dai-cells = <0>
- drop unnecessary description
- drop compatible for sam9x7-ssc because is not the intent of the patch
---
 .../devicetree/bindings/misc/atmel-ssc.txt    |  50 ---------
 .../bindings/sound/atmel,at91-ssc.yaml        | 104 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 105 insertions(+), 51 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/misc/atmel-ssc.txt
 create mode 100644 Documentation/devicetree/bindings/sound/atmel,at91-ssc.yaml

diff --git a/Documentation/devicetree/bindings/misc/atmel-ssc.txt b/Documentation/devicetree/bindings/misc/atmel-ssc.txt
deleted file mode 100644
index f9fb412642fe0..0000000000000
--- a/Documentation/devicetree/bindings/misc/atmel-ssc.txt
+++ /dev/null
@@ -1,50 +0,0 @@
-* Atmel SSC driver.
-
-Required properties:
-- compatible: "atmel,at91rm9200-ssc" or "atmel,at91sam9g45-ssc"
-	- atmel,at91rm9200-ssc: support pdc transfer
-	- atmel,at91sam9g45-ssc: support dma transfer
-- reg: Should contain SSC registers location and length
-- interrupts: Should contain SSC interrupt
-- clock-names: tuple listing input clock names.
-	Required elements: "pclk"
-- clocks: phandles to input clocks.
-
-
-Required properties for devices compatible with "atmel,at91sam9g45-ssc":
-- dmas: DMA specifier, consisting of a phandle to DMA controller node,
-  the memory interface and SSC DMA channel ID (for tx and rx).
-  See Documentation/devicetree/bindings/dma/atmel-dma.txt for details.
-- dma-names: Must be "tx", "rx".
-
-Optional properties:
-  - atmel,clk-from-rk-pin: bool property.
-     - When SSC works in slave mode, according to the hardware design, the
-       clock can get from TK pin, and also can get from RK pin. So, add
-       this parameter to choose where the clock from.
-     - By default the clock is from TK pin, if the clock from RK pin, this
-       property is needed.
-  - #sound-dai-cells: Should contain <0>.
-     - This property makes the SSC into an automatically registered DAI.
-
-Examples:
-- PDC transfer:
-ssc0: ssc@fffbc000 {
-	compatible = "atmel,at91rm9200-ssc";
-	reg = <0xfffbc000 0x4000>;
-	interrupts = <14 4 5>;
-	clocks = <&ssc0_clk>;
-	clock-names = "pclk";
-};
-
-- DMA transfer:
-ssc0: ssc@f0010000 {
-      compatible = "atmel,at91sam9g45-ssc";
-      reg = <0xf0010000 0x4000>;
-      interrupts = <28 4 5>;
-      dmas = <&dma0 1 13>,
-	     <&dma0 1 14>;
-      dma-names = "tx", "rx";
-      pinctrl-names = "default";
-      pinctrl-0 = <&pinctrl_ssc0_tx &pinctrl_ssc0_rx>;
-};
diff --git a/Documentation/devicetree/bindings/sound/atmel,at91-ssc.yaml b/Documentation/devicetree/bindings/sound/atmel,at91-ssc.yaml
new file mode 100644
index 0000000000000..a05e614318242
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/atmel,at91-ssc.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/atmel,at91-ssc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel Serial Synchronous Serial (SSC)
+
+maintainers:
+  - Andrei Simion <andrei.simion@microchip.com>
+
+description:
+  The Atmel Synchronous Serial Controller (SSC) provides a versatile
+  synchronous communication link for audio and telecom applications,
+  supporting protocols like I2S, Short Frame Sync, and Long Frame Sync.
+
+properties:
+  compatible:
+    enum:
+      - atmel,at91rm9200-ssc
+      - atmel,at91sam9g45-ssc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: pclk
+
+  dmas:
+    items:
+      - description: TX DMA Channel
+      - description: RX DMA Channel
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+  atmel,clk-from-rk-pin:
+    description:
+      Specify the clock source for the SSC (Synchronous Serial Controller)
+      when operating in slave mode. By default, the clock is sourced from
+      the TK pin.
+    type: boolean
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+allOf:
+  - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - atmel,at91sam9g45-ssc
+    then:
+      required:
+        - dmas
+        - dma-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/dma/at91.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    ssc@100000 {
+       compatible = "atmel,at91sam9g45-ssc";
+       reg = <0x100000 0x4000>;
+       interrupts = <28 IRQ_TYPE_LEVEL_HIGH 5>;
+       dmas = <&dma0 (AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
+                     AT91_XDMAC_DT_PERID(38))>,
+              <&dma0 (AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
+                     AT91_XDMAC_DT_PERID(39))>;
+       dma-names = "tx", "rx";
+       clocks = <&pmc PMC_TYPE_PERIPHERAL 28>;
+       clock-names = "pclk";
+       #sound-dai-cells = <0>;
+    };
+
+    ssc@c00000 {
+      compatible = "atmel,at91rm9200-ssc";
+      reg = <0xc00000 0x4000>;
+      interrupts = <14 IRQ_TYPE_LEVEL_HIGH 5>;
+      clocks = <&pmc PMC_TYPE_PERIPHERAL 14>;
+      clock-names = "pclk";
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ce7bf07c8afa2..6d593729a6d00 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15633,7 +15633,7 @@ M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>
 M:	Andrei Simion <andrei.simion@microchip.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
-F:	Documentation/devicetree/bindings/misc/atmel-ssc.txt
+F:	Documentation/devicetree/bindings/sound/atmel,at91-ssc.yaml
 F:	drivers/misc/atmel-ssc.c
 F:	include/linux/atmel-ssc.h
 

base-commit: 00f3246adeeacbda0bd0b303604e46eb59c32e6e
-- 
2.34.1


