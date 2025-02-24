Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C773C021B6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 02:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cyXx7gKGzTdRRxiqWEqSY+M8Km19inEg/yhhprDLQx0=; b=e/u1RV6aTzpEbBCD0dgxgWPnNa
	BEzxfxDieOPHt+lC/Zu05NLQQKq0V2z8zqMrs7DDTdBWY02r493ulo7uFH3M6xHsBmx55O6xzA9WC
	o7GiHZJQB1xj+L0HF8zPXwVzYvyKBzu04oxcSlOoju8l3XIMCav2S9m+hhdUUVjC1dXux3NWp6g6u
	oi5ZszONmO3FkrS/tBi8vb9dVWU6OsIp3B2bPbck4YndQFhsPu7cfRlSLbNfnW5xc3Leee2YqfGxR
	wrJUj4TQuZzO5zKG7n7ueQF9UM0S1WsY+NCf0bURqwz5NFBVWtUNqRB8qyKONSaYsfccWN86mJURh
	wD0BBt+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmOdf-0000000CCBE-3Wfm;
	Mon, 24 Feb 2025 02:56:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmOab-0000000CBkB-0fK5;
	Mon, 24 Feb 2025 02:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740365580; x=1771901580;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=3eVMKywF0GaSEC41UUuoCtEBQjw9Zj8/cE5TkbR4uxs=;
  b=MNs+Wu3LcsWcuwyxTUqL965Tc3+U+55TvgwIOt4o7ucIe+ZQz3lUuuqJ
   +FGcSw0al41fTJUl4dsyq3lWORXHThPcarktYs5Zpg83YXt2HJkRxQShM
   YTpP7H7DOlr7Mmj+Fr6f/q82zkpHUUSFzrS+IJKf2/3cYxZeL1tLM/fCJ
   LBh5HBscKGprS8bvl5rwIiAJvMdHTOvpqKWlv/laGT7ir9fdWKN53qhpx
   OftQFNCEWjPnuRBC7mHUlSljcwqmsJ0N2OD0cJjh0CiJSwXa4Hsy3Guwd
   yyqoC5XQldlnZmtUetX9IWB0H6L1bS1Z6iKHUR+1GfJ49IbQlGjv06bKm
   g==;
X-CSE-ConnectionGUID: 6rVg96LVQkmrqYQWG6Firw==
X-CSE-MsgGUID: Zw74jTgxQ/y0pQphYJJidw==
X-IronPort-AV: E=Sophos;i="6.13,309,1732604400"; 
   d="scan'208";a="42149828"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Feb 2025 19:52:58 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 23 Feb 2025 19:52:44 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sun, 23 Feb 2025 19:52:40 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Mon, 24 Feb 2025 08:22:28 +0530
Subject: [PATCH v4 2/2] dt-bindings: mmc: atmel,hsmci: Convert to json
 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250224-mmc-slot-v4-2-231620a31e88@microchip.com>
References: <20250224-mmc-slot-v4-0-231620a31e88@microchip.com>
In-Reply-To: <20250224-mmc-slot-v4-0-231620a31e88@microchip.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Dharma Balasubiramani
	<dharma.b@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740365548; l=4816;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=3eVMKywF0GaSEC41UUuoCtEBQjw9Zj8/cE5TkbR4uxs=;
 b=SrErEyLdwcdKKkfZs5W5zETReahLtwrZI3FgSRMZnEK2OWsy7Jdn9NMpYCITs8wJKEtVderMQ
 bvgZlFpSqVKA4nEmIBY5v0T26CXoqDTwft7jmuDrn8VO7m792NdCHjv
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_185301_212694_D05E0AEF 
X-CRM114-Status: GOOD (  14.69  )
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/mmc/atmel,hsmci.yaml       | 106 +++++++++++++++++++++
 .../devicetree/bindings/mmc/atmel-hsmci.txt        |  73 --------------
 2 files changed, 106 insertions(+), 73 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/atmel,hsmci.yaml b/Documentation/devicetree/bindings/mmc/atmel,hsmci.yaml
new file mode 100644
index 000000000000..151b414b9d27
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/atmel,hsmci.yaml
@@ -0,0 +1,106 @@
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
+  "slot@[0-2]$":
+    $ref: mmc-slot.yaml
+    description: A slot node representing an MMC, SD, or SDIO slot.
+
+    properties:
+      reg:
+        enum: [0, 1]
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

-- 
2.43.0


