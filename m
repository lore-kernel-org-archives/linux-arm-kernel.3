Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA5CCCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 06:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vc2ENupPSvUHAQCJO8a03DHUyd9OoZeBWm+ElENjpmY=; b=wOTbaG9oT+vqJR8jJE4/OTwK8T
	w0Ss9d0GKFe1IfeAlgd5NbKLyeNgOnlbS9TnAw0irrmRkoJYSgHl7GWu1rXvo01lT6EDHoW5InHHC
	Vqn5OiIkQ4rFKnPGic3oPzA/ND1nxValjoDJHhYK4/Z9d3/qK1AOvsfy1Rp5RIU6uE2+emb0F8XzF
	NH967dg4IdemxqmMCZMjl7PfiQ1UMGGVGzzq3t/rACmE9JA++nqP23crElFd8Y9AlG9shac20Kswy
	R4YK86+ICO6RF0Uzh1fuQPnaW2dJAj5uTVKgATjJlHWCXcgK9d1lYXjW5SJ36Blt/rGcJim0IPVm9
	shm9L6oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSkn-00000001jua-3Ti6;
	Wed, 22 Oct 2025 06:55:26 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSki-00000001jrA-3MPs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 06:55:22 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 22 Oct
 2025 14:55:07 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 22 Oct 2025 14:55:07 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: ryan_chen <ryan_chen@aspeedtech.com>, Thomas Gleixner
	<tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	<jk@codeconstruct.com.au>, Kevin Chen <kevin_chen@aspeedtech.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>
Subject: [PATCH v5 1/3] dt-bindings: interrupt-controller: aspeed,ast2700: Add support for INTC hierarchy
Date: Wed, 22 Oct 2025 14:55:05 +0800
Message-ID: <20251022065507.1152071-2-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251022065507.1152071-1-ryan_chen@aspeedtech.com>
References: <20251022065507.1152071-1-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_235520_915032_CDF65EDC 
X-CRM114-Status: GOOD (  13.30  )
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

AST2700 contains two-level interrupt controllers (INTC0 and INTC1),
each with its own register space and handling different sets of
peripherals.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 .../aspeed,ast2700-intc0.yaml                 | 97 +++++++++++++++++++
 .../aspeed,ast2700-intc1.yaml                 | 94 ++++++++++++++++++
 2 files changed, 191 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc0.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc1.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc0.yaml b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc0.yaml
new file mode 100644
index 000000000000..93a5b142b0a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc0.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+maintainers:
+  - Ryan Chen <ryan_chen@aspeedtech.com>
+
+title: ASPEED AST2700 Interrupt Controller 0
+
+description:
+  This interrupt controller hardware is first level interrupt controller that
+  is hooked to the GIC interrupt controller. It's useful to combine multiple
+  interrupt sources into 1 interrupt to GIC interrupt controller.
+
+properties:
+  compatible:
+    const: aspeed,ast2700-intc0
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^interrupt-controller@":
+    type: object
+    description: A child interrupt controller node
+    additionalProperties: false
+
+    properties:
+      compatible:
+        enum:
+          - aspeed,ast2700-intc0-ic
+
+      reg:
+        maxItems: 1
+
+      '#interrupt-cells':
+        const: 1
+
+      interrupt-controller: true
+
+      interrupts:
+        minItems: 1
+        maxItems: 10
+
+    required:
+      - compatible
+      - reg
+      - interrupt-controller
+      - '#interrupt-cells'
+      - interrupts
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+  - '#size-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    intc0: interrupt-controller@12100000 {
+        compatible = "aspeed,ast2700-intc0";
+        reg = <0x12100000 0x4000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0x12100000 0x4000>;
+
+        intc0_11: interrupt-controller@1b00 {
+            #interrupt-cells = <1>;
+            interrupt-controller;
+            compatible = "aspeed,ast2700-intc0-ic";
+            reg = <0x1b00 0x10>;
+            interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
+        };
+    };
\ No newline at end of file
diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc1.yaml b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc1.yaml
new file mode 100644
index 000000000000..2f807d074211
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc1.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+maintainers:
+  - Ryan Chen <ryan_chen@aspeedtech.com>
+
+title: ASPEED AST2700 Interrupt Controller 1
+
+description:
+  This interrupt controller hardware is second level interrupt controller that
+  is hooked to a parent interrupt controller. It's useful to combine multiple
+  interrupt sources into 1 interrupt to parent interrupt controller.
+
+properties:
+  compatible:
+    const: aspeed,ast2700-intc1
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^interrupt-controller@":
+    type: object
+    description: A child interrupt controller node
+    additionalProperties: false
+
+    properties:
+      compatible:
+        enum:
+          - aspeed,ast2700-intc1-ic
+
+      reg:
+        maxItems: 1
+
+      '#interrupt-cells':
+        const: 1
+
+      interrupt-controller: true
+
+      interrupts-extended:
+        minItems: 1
+        maxItems: 1
+
+    required:
+      - compatible
+      - reg
+      - interrupt-controller
+      - '#interrupt-cells'
+      - interrupts-extended
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+  - '#size-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    intc1: interrupt-controller@14c18000 {
+        compatible = "aspeed,ast2700-intc1";
+        reg = <0x14c18000 0x400>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0x14c18000 0x400>;
+
+        intc1_0: interrupt-controller@100 {
+            compatible = "aspeed,ast2700-intc1-ic";
+            reg = <0x100 0x10>;
+            #interrupt-cells = <1>;
+            interrupt-controller;
+            interrupts-extended = <&intc0_11 0>;
+        };
+
+        intc1_1: interrupt-controller@110 {
+            compatible = "aspeed,ast2700-intc1-ic";
+            reg = <0x110 0x10>;
+            #interrupt-cells = <1>;
+            interrupt-controller;
+            interrupts-extended = <&intc0_11 1>;
+        };
+    };
\ No newline at end of file
-- 
2.34.1


