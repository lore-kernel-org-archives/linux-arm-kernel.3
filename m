Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65B5C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 09:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9XeWDy8vax8yWCugVj/Iq+5JGVLUCXx8rSTITmCxgQ4=; b=QJ+OThMFLSmVL7BaIrdUGRU4si
	ZUZdbYqPBbgrfbAnV1Tfkl9jhsnQcc5kiQzEd1XjQBwhjX72Z16e07R6+ipuDqskcA6jg7/faxzxu
	ieR6PjAdzYlZj6WqzvxHPLJYP2IHet6/UkuK0GCI+Q3jwAbsYr2B2jhRVfhfOGXepmRy4zAnmuz2d
	zrVeGaRXF6P249iV+3r+yHZkksf4nPmo1cYQSMwfJPMpesCIvRu//4RB6QBA6M6VuSpEKfMOVJC1y
	u1e8bERIj6xBxpG1quQWT+OZJ2Pm0m0Bxb/DLbJBg5B83kONa0TN/SljhC8JyCR1GXDdK1gnN8Z3u
	d+ZLdFIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tatXB-0000000C6Eb-0UcM;
	Thu, 23 Jan 2025 09:29:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tatVs-0000000C60D-2r5M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 09:28:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1737624516; x=1769160516;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=TYa7l27dIFY5vdokhKSivIRGltNHtWDjnscfZtfaVSk=;
  b=L6U3SipcKqmWyya/dEwSjJw0qOM10b3PmkrF28rFsGDSnIoJv35CuqxR
   wzKX2E6ArmSJYyumr8cuGAeNcDrmGhQ1txw18gz/ybKSqgIFNTlGiVjX7
   WbYRqlMepauqj7rHWxQFAKGLIhK6fh2WVyHuHuue11mELTf2p/9nCJNag
   usg8anemRtEuRSFuaAXcdgHs1ma8gIfSDunXRvDVIo6zVoWqdLZPtbXkj
   PQT2C1mvxGGrfiBryYyx4oewNIWqMIAzgFRRuI7hNue6K2KFZyq2SS5d2
   ImblpzAg2UYcQuKd0MQTd/OdU2f728zwNMSrwawg7dGVttuEKr518FSgr
   A==;
X-CSE-ConnectionGUID: Ia08KEWmSUiv0dAQl/Kc4w==
X-CSE-MsgGUID: TKpjDec6StS1rxk9+d61Ug==
X-IronPort-AV: E=Sophos;i="6.13,228,1732604400"; 
   d="scan'208";a="204352971"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Jan 2025 02:28:31 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 23 Jan 2025 02:28:10 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 23 Jan 2025 02:28:04 -0700
From: Charan Pedumuru <charan.pedumuru@microchip.com>
Date: Thu, 23 Jan 2025 14:58:01 +0530
Subject: [PATCH v2] dt-bindings: dma: convert atmel-dma.txt to YAML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250123-dma-v1-1-054f1a77e733@microchip.com>
X-B4-Tracking: v=1; b=H4sIAKALkmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQyMj3ZTcRN1kI3Nzi5S0RBMjEzMloMqCotS0zAqwKdFKZUZKsbW1AFi
 hxxZZAAAA
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Nicolas
 Ferre" <nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ludovic Desroches <ludovic.desroches@microchip.com>, Tudor Ambarus
	<tudor.ambarus@linaro.org>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Durai Manickam KR" <durai.manickamkr@microchip.com>, Charan Pedumuru
	<charan.pedumuru@microchip.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_012836_968855_B32ABCAE 
X-CRM114-Status: GOOD (  17.77  )
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

Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
Signed-off-by: Charan Pedumuru <charan.pedumuru@microchip.com>
---
Changes in v2:
- Renamed the yaml file to a compatible.
- Removed `|` and description for common properties.
- Modified the commit message.
- Dropped the label for the node in examples.
- Link to v1: https://lore.kernel.org/all/20240215-dmac-v1-1-8f1c6f031c98@microchip.com
---
 .../bindings/dma/atmel,at91sam9g45-dma.yaml        | 67 ++++++++++++++++++++++
 .../devicetree/bindings/dma/atmel-dma.txt          | 42 --------------
 2 files changed, 67 insertions(+), 42 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/atmel,at91sam9g45-dma.yaml b/Documentation/devicetree/bindings/dma/atmel,at91sam9g45-dma.yaml
new file mode 100644
index 000000000000..8d0d68786cbc
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/atmel,at91sam9g45-dma.yaml
@@ -0,0 +1,67 @@
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
+  - Tudor Ambarus <tudor.ambarus@linaro.org>
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
+    oneOf:
+      - enum:
+          - atmel,at91sam9g45-dma
+          - atmel,at91sam9rl-dma
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#dma-cells":
+    description:
+      Must be <2>, used to represent the number of integer cells in the dmas
+      property of client devices.
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

---
base-commit: 232f121837ad8b1c21cc80f2c8842a4090c5a2a0
change-id: 20250122-dma-c2778dfa4246

Best regards,
-- 
Charan Pedumuru <charan.pedumuru@microchip.com>


