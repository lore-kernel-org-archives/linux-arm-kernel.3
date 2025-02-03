Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F8FC02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 06:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1X09fLOb1NR+H4JbGR9ulJtxXrhu63pqj7K2Ed7yf/w=; b=A4Qmr5/2w2p0NzkmMa/ghRpHTU
	VhIHwwriFuybcsXMJGIXxsrGE2Qni4dTuDycd4vo0KFJfcrB0fzVta0F5zhWDciBpdKutvKC5KeEK
	PXcbj8LlwxLJdqW8xqo5NYJEXnEla0d/XuvBb2Dk6zS0CFcy+lI5cDWrzhv6PXnn3TzRCbIN2bUXj
	Ba+BAkAEg3dZ8sPD8BX2Bv9yiufBS1Ep7Ztb03uBHUn0QVQv3qRV0oDwFDdIiffAve28hOIYGvZ+T
	gV5vgqjazsOS3OH5yrZ/OgkyyB8HXPV4hkiIvnIHxPRqXdsRc6aiVPrco66Xzq+AVnppUWaq93oeN
	0IVISwzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tepqw-0000000EdZE-0kZD;
	Mon, 03 Feb 2025 06:22:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tepoY-0000000EdIk-2tdN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 06:20:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1738563611; x=1770099611;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=huPreexBSUGD+4tZwz+FrnsTGlTYrbETUuXB8TElD30=;
  b=Mmrxhba+uq4yJI2aI9cD51dzsjQz1FPnon30n4NXjdDG+KTJv5eqv+SC
   jysEXZVOdHdZ3MTuhX1A2YEQsM6ynj2qbKJELCnbP5ZvDISzN9vhs5MyU
   xGpsxPWcRAM90WMP3gd5vgjKTPUqmgPGKmXiVUGU2oyoqFy8FUTdkXmRS
   gL+fz0hPv/Fz2AQ+0q2e4pbNezkhtcy5MB+xp/AjBgSUbmub/ecpScCpe
   aw3KaJtyDDJpXCeP4y1edEGpDDn5ilpSFZw0EBfW0Wiz1fb+pxq/d/X9B
   XTWa1am0kToIuMGfrYAgGlMVj8xT7ofPVpAzcoWVvKMVZ91qbP9oS8G/K
   Q==;
X-CSE-ConnectionGUID: KYWEIIOuTcullLvzTva6Jw==
X-CSE-MsgGUID: ygDK2KZnTECqJan3jb1yLw==
X-IronPort-AV: E=Sophos;i="6.13,255,1732604400"; 
   d="scan'208";a="37194062"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Feb 2025 23:20:09 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 2 Feb 2025 23:20:06 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sun, 2 Feb 2025 23:20:01 -0700
From: Charan Pedumuru <charan.pedumuru@microchip.com>
Date: Mon, 3 Feb 2025 11:48:09 +0530
Subject: [PATCH v4] dt-bindings: dma: convert atmel-dma.txt to YAML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250203-test-v4-1-a9ec3eded1c7@microchip.com>
X-B4-Tracking: v=1; b=H4sIAKBfoGcC/13OwQ7CIAyA4VcxnK2BAbJ48j3MDowV4cBYgBDNs
 neX7WR2/JP2a1eSMXnM5HFZScLqs49zC3G9EOP0/EbwU2vS0U5S1ikomAv0FKURvbFKKNJGl4T
 Wfw7mNbS2KQYoLqH+X+YwBQ2VAQMqhWVaKVScP4M3KRrnl5uJYeeczyWm7/FU5Tt6ul95M9gor
 Ry5vQtrTsawbdsPXjxSWNsAAAA=
To: Ludovic Desroches <ludovic.desroches@microchip.com>, Vinod Koul
	<vkoul@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>
CC: <linux-arm-kernel@lists.infradead.org>, <dmaengine@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Durai Manickam
 KR" <durai.manickamkr@microchip.com>, Charan Pedumuru
	<charan.pedumuru@microchip.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_222010_856479_7FDF4B89 
X-CRM114-Status: GOOD (  22.99  )
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

From: Durai Manickam KR <durai.manickamkr@microchip.com>

Add a description, required properties, appropriate compatibles and
missing properties like clocks and clock-names which are not defined in
the text binding for all the SoCs that are supported by microchip.
Update the text binding name `atmel-dma.txt` to
`atmel,at91sam9g45-dma.yaml` for the files which reference to
`atmel-dma.txt`. Drop Tudor name from maintainers.

Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
Signed-off-by: Charan Pedumuru <charan.pedumuru@microchip.com>
---
Changes in v4:
- Modified the description for #dma-cells property.
- Link to v3: https://lore.kernel.org/r/20250127-test-v3-1-1b5f5b3f64fc@microchip.com

Changes in v3:
- Renamed the text binding name `atmel-dma.txt` to
  `atmel,at91sam9g45-dma.yaml` for the files which reference to
  `atmel-dma.txt`.
- Removed `oneOf` and add a blank line in properties.
- Dropped Tudor name from maintainers.
- Link to v2: https://lore.kernel.org/r/20250123-dma-v1-1-054f1a77e733@microchip.com

Changes in v2:
- Renamed the yaml file to a compatible.
- Removed `|` and description for common properties.
- Modified the commit message.
- Dropped the label for the node in examples.
- Link to v1: https://lore.kernel.org/all/20240215-dmac-v1-1-8f1c6f031c98@microchip.com
---
 .../bindings/dma/atmel,at91sam9g45-dma.yaml        | 68 ++++++++++++++++++++++
 .../devicetree/bindings/dma/atmel-dma.txt          | 42 -------------
 .../devicetree/bindings/misc/atmel-ssc.txt         |  2 +-
 MAINTAINERS                                        |  2 +-
 4 files changed, 70 insertions(+), 44 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/atmel,at91sam9g45-dma.yaml b/Documentation/devicetree/bindings/dma/atmel,at91sam9g45-dma.yaml
new file mode 100644
index 000000000000..a58dc407311b
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/atmel,at91sam9g45-dma.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/atmel,at91sam9g45-dma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel Direct Memory Access Controller (DMA)
+
+maintainers:
+  - Ludovic Desroches <ludovic.desroches@microchip.com>
+
+description:
+  The Atmel Direct Memory Access Controller (DMAC) transfers data from a source
+  peripheral to a destination peripheral over one or more AMBA buses. One channel
+  is required for each source/destination pair. In the most basic configuration,
+  the DMAC has one master interface and one channel. The master interface reads
+  the data from a source and writes it to a destination. Two AMBA transfers are
+  required for each DMAC data transfer. This is also known as a dual-access transfer.
+  The DMAC is programmed via the APB interface.
+
+properties:
+  compatible:
+    enum:
+      - atmel,at91sam9g45-dma
+      - atmel,at91sam9rl-dma
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#dma-cells":
+    description:
+      Must be <2>, used to represent the number of integer cells in the dma
+      property of client devices. The two cells in order are
+      1. The first cell represents the channel number.
+      2. The second cell is 0 for RX and 1 for TX transfers.
+    const: 2
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
+  - "#dma-cells"
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    dma-controller@ffffec00 {
+        compatible = "atmel,at91sam9g45-dma";
+        reg = <0xffffec00 0x200>;
+        interrupts = <21>;
+        #dma-cells = <2>;
+        clocks = <&pmc 2 20>;
+        clock-names = "dma_clk";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/dma/atmel-dma.txt b/Documentation/devicetree/bindings/dma/atmel-dma.txt
deleted file mode 100644
index f69bcf5a6343..000000000000
--- a/Documentation/devicetree/bindings/dma/atmel-dma.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-* Atmel Direct Memory Access Controller (DMA)
-
-Required properties:
-- compatible: Should be "atmel,<chip>-dma".
-- reg: Should contain DMA registers location and length.
-- interrupts: Should contain DMA interrupt.
-- #dma-cells: Must be <2>, used to represent the number of integer cells in
-the dmas property of client devices.
-
-Example:
-
-dma0: dma@ffffec00 {
-	compatible = "atmel,at91sam9g45-dma";
-	reg = <0xffffec00 0x200>;
-	interrupts = <21>;
-	#dma-cells = <2>;
-};
-
-DMA clients connected to the Atmel DMA controller must use the format
-described in the dma.txt file, using a three-cell specifier for each channel:
-a phandle plus two integer cells.
-The three cells in order are:
-
-1. A phandle pointing to the DMA controller.
-2. The memory interface (16 most significant bits), the peripheral interface
-(16 less significant bits).
-3. Parameters for the at91 DMA configuration register which are device
-dependent:
-  - bit 7-0: peripheral identifier for the hardware handshaking interface. The
-  identifier can be different for tx and rx.
-  - bit 11-8: FIFO configuration. 0 for half FIFO, 1 for ALAP, 2 for ASAP.
-
-Example:
-
-i2c0@i2c@f8010000 {
-	compatible = "atmel,at91sam9x5-i2c";
-	reg = <0xf8010000 0x100>;
-	interrupts = <9 4 6>;
-	dmas = <&dma0 1 7>,
-	       <&dma0 1 8>;
-	dma-names = "tx", "rx";
-};
diff --git a/Documentation/devicetree/bindings/misc/atmel-ssc.txt b/Documentation/devicetree/bindings/misc/atmel-ssc.txt
index f9fb412642fe..b159dc2298b6 100644
--- a/Documentation/devicetree/bindings/misc/atmel-ssc.txt
+++ b/Documentation/devicetree/bindings/misc/atmel-ssc.txt
@@ -14,7 +14,7 @@ Required properties:
 Required properties for devices compatible with "atmel,at91sam9g45-ssc":
 - dmas: DMA specifier, consisting of a phandle to DMA controller node,
   the memory interface and SSC DMA channel ID (for tx and rx).
-  See Documentation/devicetree/bindings/dma/atmel-dma.txt for details.
+  See Documentation/devicetree/bindings/dma/atmel,at91sam9g45-dma.yaml for details.
 - dma-names: Must be "tx", "rx".
 
 Optional properties:
diff --git a/MAINTAINERS b/MAINTAINERS
index 962eab2ce359..f1f4e3956f45 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15348,7 +15348,7 @@ M:	Ludovic Desroches <ludovic.desroches@microchip.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	dmaengine@vger.kernel.org
 S:	Supported
-F:	Documentation/devicetree/bindings/dma/atmel-dma.txt
+F:	Documentation/devicetree/bindings/dma/atmel,at91sam9g45-dma.yaml
 F:	drivers/dma/at_hdmac.c
 F:	drivers/dma/at_xdmac.c
 F:	include/dt-bindings/dma/at91.h

---
base-commit: 232f121837ad8b1c21cc80f2c8842a4090c5a2a0
change-id: 20250127-test-80e5c48cf747

Best regards,
-- 
Charan Pedumuru <charan.pedumuru@microchip.com>


