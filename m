Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13928E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 09:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JnvVwtr9/F4jJKXEEsYzqt/ANxNWxE6TN8UKflWr8wo=; b=25tpiRXA3NZGhvIkpcZtolZGoN
	AqLZJ5liN/yb9P9+OWU2c/qYXVPNGWU0zICwZxGyn68B1jlGrcGzje9Dq2B4LEsh4V0ApQLmkf6Eb
	LoCowONQKgg8JDfzpvkU4lNoO3ZIKfsTtetvCMuuVgsLu21x2VkftW0xOaGFIqOhTBuwPkEY5sCWU
	MwNtdE0FsqGVOe44M8RNP9e3iI6bmfOAnkaoMgsRhhqeUzZxM1xiWuAL9tWACq3b+rYNEsEhS0Xls
	MjSjR1TEVZeLMHKTaR9Hu4NOFALF8UMIx5NAiVzMYGhC1zeonHF9nZ9EZnXp22JL9VLHk3llpa8+/
	Rs/5RHqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ8cl-0000000FQuN-3ti0;
	Thu, 05 Dec 2024 09:58:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ8bk-0000000FQox-2Cic
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 09:57:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733392637; x=1764928637;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=miV+lFMFVzAaAvt8JNrBIkbBUgixoMAJpy4otndSQqI=;
  b=LRW4JC/ETIvGIvlGEKlosDDNip4qnQ88M14FMeTWxsF0bo+Qh4lYGExd
   HnK+Zp9t9hFyjf6u4839Jp/ePZjjnRDhRXw2h+6DP7mKyKEKaECaAhOMm
   zsf9j4ALzWiHa1dsGRHd5rd3hlhOf4lJkJcjEUGtwViNA5qC6h/NWS0zA
   gSQ/ZjvM5mgEm3IYFhH5E/ouwKw6ipipy7A02W2RLbpiduHpf2Mgv97rs
   orYinfid6ynx3R+oQIZ1eWNiVNhxbWHDjNHll0W1PpUFMMkid2cv29j1E
   FlZHYEwDuQbyghMKreVdR5T/qLTIGUr7sh8dCVMT1NL7bNqLaf7ActE/D
   Q==;
X-CSE-ConnectionGUID: TKbBYKFISlCTYliYBZMdug==
X-CSE-MsgGUID: B/i8g4eKSlyJ517PbZMMSg==
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="266366333"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Dec 2024 02:57:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 5 Dec 2024 02:56:23 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 5 Dec 2024 02:56:19 -0700
From: Charan Pedumuru <charan.pedumuru@microchip.com>
Date: Thu, 5 Dec 2024 15:26:18 +0530
Subject: [PATCH] dt-bindings: dma: atmel: Convert to json schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241205-xdma-v1-1-76a4a44670b5@microchip.com>
X-B4-Tracking: v=1; b=H4sIAMF4UWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQyNT3YqU3ERdSwvTZLNkE4vUpBRTJaDSgqLUtMwKsDHRsbW1ACEYSFR
 WAAAA
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Nicolas
 Ferre" <nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Charan Pedumuru <charan.pedumuru@microchip.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_015716_690309_93BF1B6A 
X-CRM114-Status: GOOD (  14.27  )
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

Convert old text based binding to json schema.
Changes during conversion:
- Add the required properties `clock` and `clock-names`, which were
  missing in the original binding.
- Add a fallback for `microchip,sam9x7-dma` and `microchip,sam9x60-dma`
  as they are compatible with the dma IP core on `atmel,sama5d4-dma`.
- Update examples and include appropriate file directives to resolve
  errors identified by `dt_binding_check` and `dtbs_check`.

Signed-off-by: Charan Pedumuru <charan.pedumuru@microchip.com>
---
 .../devicetree/bindings/dma/atmel,sama5d4-dma.yaml | 79 ++++++++++++++++++++++
 .../devicetree/bindings/dma/atmel-xdma.txt         | 54 ---------------
 2 files changed, 79 insertions(+), 54 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml b/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
new file mode 100644
index 000000000000..9ca1c5d1f00f
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/atmel,sama5d4-dma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip AT91 Extensible Direct Memory Access Controller
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Charan Pedumuru <charan.pedumuru@microchip.com>
+
+description:
+  The DMA Controller (XDMAC) is a AHB-protocol central direct memory access
+  controller. It performs peripheral data transfer and memory move operations
+  over one or two bus ports through the unidirectional communication
+  channel. Each channel is fully programmable and provides both peripheral
+  or memory-to-memory transfers. The channel features are configurable at
+  implementation.
+
+allOf:
+  - $ref: dma-controller.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - atmel,sama5d4-dma
+          - microchip,sama7g5-dma
+      - items:
+          - enum:
+              - microchip,sam9x60-dma
+              - microchip,sam9x7-dma
+          - const: atmel,sama5d4-dma
+
+  "#dma-cells":
+    description: |
+      Represents the number of integer cells in the `dmas` property of client
+      devices. The single cell specifies the channel configuration register:
+        - bit 13: SIF (Source Interface Identifier) for memory interface.
+        - bit 14: DIF (Destination Interface Identifier) for peripheral interface.
+        - bit 30-24: PERID (Peripheral Identifier).
+    const: 1
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
+    const: dma_clk
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - "#dma-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/dma/at91.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    dma-controller@f0008000 {
+        compatible = "atmel,sama5d4-dma";
+        reg = <0xf0008000 0x1000>;
+        interrupts = <20 IRQ_TYPE_LEVEL_HIGH 0>;
+        #dma-cells = <1>;
+        clocks = <&pmc PMC_TYPE_PERIPHERAL 20>;
+        clock-names = "dma_clk";
+    };
diff --git a/Documentation/devicetree/bindings/dma/atmel-xdma.txt b/Documentation/devicetree/bindings/dma/atmel-xdma.txt
deleted file mode 100644
index 76d649b3a25d..000000000000
--- a/Documentation/devicetree/bindings/dma/atmel-xdma.txt
+++ /dev/null
@@ -1,54 +0,0 @@
-* Atmel Extensible Direct Memory Access Controller (XDMAC)
-
-* XDMA Controller
-Required properties:
-- compatible: Should be "atmel,sama5d4-dma", "microchip,sam9x60-dma" or
-  "microchip,sama7g5-dma" or
-  "microchip,sam9x7-dma", "atmel,sama5d4-dma".
-- reg: Should contain DMA registers location and length.
-- interrupts: Should contain DMA interrupt.
-- #dma-cells: Must be <1>, used to represent the number of integer cells in
-the dmas property of client devices.
-  - The 1st cell specifies the channel configuration register:
-    - bit 13: SIF, source interface identifier, used to get the memory
-    interface identifier,
-    - bit 14: DIF, destination interface identifier, used to get the peripheral
-    interface identifier,
-    - bit 30-24: PERID, peripheral identifier.
-
-Example:
-
-dma1: dma-controller@f0004000 {
-	compatible = "atmel,sama5d4-dma";
-	reg = <0xf0004000 0x200>;
-	interrupts = <50 4 0>;
-	#dma-cells = <1>;
-};
-
-
-* DMA clients
-DMA clients connected to the Atmel XDMA controller must use the format
-described in the dma.txt file, using a one-cell specifier for each channel.
-The two cells in order are:
-1. A phandle pointing to the DMA controller.
-2. Channel configuration register. Configurable fields are:
-    - bit 13: SIF, source interface identifier, used to get the memory
-    interface identifier,
-    - bit 14: DIF, destination interface identifier, used to get the peripheral
-    interface identifier,
-  - bit 30-24: PERID, peripheral identifier.
-
-Example:
-
-i2c2: i2c@f8024000 {
-	compatible = "atmel,at91sam9x5-i2c";
-	reg = <0xf8024000 0x4000>;
-	interrupts = <34 4 6>;
-	dmas = <&dma1
-		(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
-		 | AT91_XDMAC_DT_PERID(6))>,
-	       <&dma1
-		(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
-		| AT91_XDMAC_DT_PERID(7))>;
-	dma-names = "tx", "rx";
-};

---
base-commit: 85a2dd7d7c8152cb125712a1ecae1d0a6ccac250
change-id: 20241125-xdma-985c6c48ebd5

Best regards,
-- 
Charan Pedumuru <charan.pedumuru@microchip.com>


