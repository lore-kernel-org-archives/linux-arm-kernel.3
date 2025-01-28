Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16070C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 16:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/Z7bu2IktXgu44JuyLJ9yBJpB986XcDSk4KJy/xHo8=; b=Q2G8SmLLEl9B/U1O9CXJPbR996
	l1RyujTqaCBwPJXc0W6P0PkWCis4qaeG6qX1oP5t380tsIighUzxLg0civ5/gA280p1zSbKhzA3/y
	YZSMgUDtvU4j2bHOxuyU/CH1hAEy9A7NmtNJq1DlbIiLU/20nQp4KyOob7JLVqiMBd+cZwfduf/qV
	foSapF7dHwqKf2AQZZGmLSiLgJUZAVyDGJbkKn1Jmo43w/0+kjxqBcr+P8yxdF+DM2W3K00/7obE5
	JgT0i5ueru4zbUl8WtsbEHGyoD1nvcPgRP+d8K1LfWEeAAW7a5+IspSRpSg5VYsNz5CHo1KpFdkG4
	u5Ia5XoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcoau-00000005LrC-27HM;
	Tue, 28 Jan 2025 16:37:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcoJA-00000005Igr-3zvm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 16:19:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1738081165; x=1769617165;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yhcPz2+03mIWBQr/O6LXwvLAbIxqgVlOfoEdgCRaVdM=;
  b=h78pykcs+3kzyZ+CSiquoiy10uFA+wo8WEgMVC5fI9MEjp4Tna6blK30
   KagftfF4YpdJS4kZFhVRfj8sRnSUOEbQjBMT1WXKWAtuffsN/hVrYSPSV
   +j7h8Eak5lBjSjzqOoPSR/hWrfdIRFFknnJbqBwgHIu0yZ7HNsSFhZw6o
   be+o7KLqO/gaVLg7fdxYvnWIeMb1vKzBh/A6H9oqxbV1+jv7b1sbTM+NA
   JoIlz+vl0UWadbEP6oBnUWGRe9j78NQHo7UvGKZfPBvMsNHoFvcABGEld
   0D7LZ4dmu+Fgz+w+hErYCR5iwUSNE5utErWDgFK8U/SePR1iXlCzQHQmZ
   Q==;
X-CSE-ConnectionGUID: gZUkyJ0GT6+5er0WEIFfZw==
X-CSE-MsgGUID: 7RK9+KxdQ32dL7to83cUFQ==
X-IronPort-AV: E=Sophos;i="6.13,241,1732604400"; 
   d="scan'208";a="37017197"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Jan 2025 09:19:22 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 28 Jan 2025 09:19:10 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 28 Jan 2025 09:19:07 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <broonie@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrei Simion <andrei.simion@microchip.com>
Subject: [PATCH 1/2] dt-bindings: misc: atmel,at91-ssc: Convert to YAML format
Date: Tue, 28 Jan 2025 18:18:43 +0200
Message-ID: <20250128161842.44541-2-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128161842.44541-1-andrei.simion@microchip.com>
References: <20250128161842.44541-1-andrei.simion@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_081924_999579_F82A1B0B 
X-CRM114-Status: GOOD (  18.24  )
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

Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
---
 .../bindings/misc/atmel,at91-ssc.yaml         | 111 ++++++++++++++++++
 .../devicetree/bindings/misc/atmel-ssc.txt    |  50 --------
 2 files changed, 111 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/misc/atmel,at91-ssc.yaml
 delete mode 100644 Documentation/devicetree/bindings/misc/atmel-ssc.txt

diff --git a/Documentation/devicetree/bindings/misc/atmel,at91-ssc.yaml b/Documentation/devicetree/bindings/misc/atmel,at91-ssc.yaml
new file mode 100644
index 0000000000000..a37ee5e58fa58
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/atmel,at91-ssc.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/atmel,at91-ssc.yaml#
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
+    oneOf:
+      - enum:
+          - atmel,at91rm9200-ssc
+          - atmel,at91sam9g45-ssc
+      - items:
+          - const: microchip,sam9x7-ssc
+          - const: atmel,at91sam9g45-ssc
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
+    description: Names of the DMA channels.
+    items:
+      - const: tx
+      - const: rx
+
+  atmel,clk-from-rk-pin:
+    description:
+      Specify the clock source for the SSC (Synchronous Serial Controller)
+      when operating in slave mode. By default, the clock is sourced from
+      the TK pin. Set this property to true to source the clock from
+      the RK pin instead, based on your hardware design requirements.
+    type: boolean
+
+allOf:
+  - $ref: ../sound/dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - atmel,at91sam9g45-ssc
+    then:
+      required:
+        - compatible
+        - reg
+        - interrupts
+        - dmas
+        - dma-names
+        - clocks
+        - clock-names
+    else:
+      required:
+        - compatible
+        - reg
+        - interrupts
+        - clocks
+        - clock-names
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
+    };
+
+    ssc@c00000 {
+      compatible = "atmel,at91rm9200-ssc";
+      reg = <0xc00000 0x4000>;
+      interrupts = <14 IRQ_TYPE_LEVEL_HIGH 5>;
+      clocks = <&pmc PMC_TYPE_PERIPHERAL 14>;
+      clock-names = "pclk";
+    };
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
-- 
2.34.1


