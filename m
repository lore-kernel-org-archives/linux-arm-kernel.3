Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52337C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 15:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iTBTgsz+Ilutml5RH24YXByNyxuquONZJQpFMgadR/c=; b=go+qK+ituc6K5LUorcBC5N3B3+
	mdGs6coh5q9cnMKlNXmMAYxe7dDimw4WVJ20XQeeBXggcwetnwylQmk5UO30yMtIcX7APxIFOZcTy
	BZcjiBPvhF9KXBtokHoekBjtfIU6nQwl8wZCDg3G1uQlzOCUAV0wLZgB7CYPfFAkPRPnfBM1mRJi9
	2bmjnHK/VP91nhfu1lH21Y1uemTntDr8WBotRI6Q9gFFdouCR47KzL08JBEeK8c+bS3BVolsm/HtM
	nkYb5HV/xKvRI56Vg5T34GjTOZtxggMA2sQTaSClYE3Uptv63CQgdxYiB+SvkPDyGuQ+eMcG/Db8r
	vRZCcpRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBxIo-00000007jMp-3s98;
	Mon, 05 May 2025 15:00:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBx5F-00000007fr2-0zTl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 14:46:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B8E66135E;
	Mon,  5 May 2025 14:45:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35837C4CEEF;
	Mon,  5 May 2025 14:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456376;
	bh=4bDA+VU4HKiAdPSG7pDQ7lpUmXsZe5SALIM6IjFpDmY=;
	h=From:To:Cc:Subject:Date:From;
	b=BkWSzRYIoY22w53CdjXaPfov8jjMYYJQ3D3fok+SjanF80LxfaYknu7A5Rx9Q2/Nk
	 FK+gSdYkE+3vbSUZlVf3fL5dYlfwjy8/3yrNgSNiPQS17geHLJtuiiUTUXMnM8JAi1
	 3Ew71fC6N7Dt4K+6Y3aN/HuwKu81iwUfQjabkWU5/UwJOw3//EP24jA52XJOCNwztq
	 l57OQvVoXXHmu1qmnTwdZ9EUACab6g28wKUCCjjes6f85zhK428gS6vaKe5s0tTrDC
	 M71U+bbIWDyqBMZiOw666hfCM834ZaIhy2PZRy8HGbMQ6hmGFielO/zIMMOx9Ka4Na
	 rhOBXLbs8M2LQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Eddie James <eajames@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Lee Jones <lee@kernel.org>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert aspeed,ast2xxx-scu-ic to DT schema
Date: Mon,  5 May 2025 09:46:11 -0500
Message-ID: <20250505144613.1287360-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Convert the Aspeed SCU interrupt controller binding to schema format.
It's a straight-forward conversion of the typical interrupt controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../aspeed,ast2500-scu-ic.yaml                | 48 +++++++++++++++++++
 .../aspeed,ast2xxx-scu-ic.txt                 | 23 ---------
 .../bindings/mfd/aspeed,ast2x00-scu.yaml      |  9 +++-
 MAINTAINERS                                   |  2 +-
 4 files changed, 57 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2500-scu-ic.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2xxx-scu-ic.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2500-scu-ic.yaml b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2500-scu-ic.yaml
new file mode 100644
index 000000000000..d5287a2bf866
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2500-scu-ic.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2025 Eddie James
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2500-scu-ic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aspeed AST25XX and AST26XX SCU Interrupt Controller
+
+maintainers:
+  - Eddie James <eajames@linux.ibm.com>
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2500-scu-ic
+      - aspeed,ast2600-scu-ic0
+      - aspeed,ast2600-scu-ic1
+
+  reg:
+    maxItems: 1
+
+  '#interrupt-cells':
+    const: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+required:
+  - compatible
+  - reg
+  - '#interrupt-cells'
+  - interrupts
+  - interrupt-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@18 {
+        compatible = "aspeed,ast2500-scu-ic";
+        reg = <0x18 0x4>;
+        #interrupt-cells = <1>;
+        interrupts = <21>;
+        interrupt-controller;
+    };
diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2xxx-scu-ic.txt b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2xxx-scu-ic.txt
deleted file mode 100644
index 251ed44171db..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2xxx-scu-ic.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-Aspeed AST25XX and AST26XX SCU Interrupt Controller
-
-Required Properties:
- - #interrupt-cells		: must be 1
- - compatible			: must be "aspeed,ast2500-scu-ic",
-				  "aspeed,ast2600-scu-ic0" or
-				  "aspeed,ast2600-scu-ic1"
- - interrupts			: interrupt from the parent controller
- - interrupt-controller		: indicates that the controller receives and
-				  fires new interrupts for child busses
-
-Example:
-
-    syscon@1e6e2000 {
-        ranges = <0 0x1e6e2000 0x1a8>;
-
-        scu_ic: interrupt-controller@18 {
-            #interrupt-cells = <1>;
-            compatible = "aspeed,ast2500-scu-ic";
-            interrupts = <21>;
-            interrupt-controller;
-        };
-    };
diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
index c800d5e53b65..12986ebe7ec7 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
+++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
@@ -48,8 +48,15 @@ properties:
 
 patternProperties:
   '^p2a-control@[0-9a-f]+$':
-    description: See Documentation/devicetree/bindings/misc/aspeed-p2a-ctrl.txt
     type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          enum:
+            - aspeed,ast2500-scu-ic
+            - aspeed,ast2600-scu-ic0
+            - aspeed,ast2600-scu-ic1
 
   '^pinctrl(@[0-9a-f]+)?$':
     type: object
diff --git a/MAINTAINERS b/MAINTAINERS
index 9e37f0c14496..a792c5495d15 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3577,7 +3577,7 @@ ASPEED SCU INTERRUPT CONTROLLER DRIVER
 M:	Eddie James <eajames@linux.ibm.com>
 L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
 S:	Maintained
-F:	Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2xxx-scu-ic.txt
+F:	Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2500-scu-ic.yaml
 F:	drivers/irqchip/irq-aspeed-scu-ic.c
 F:	include/dt-bindings/interrupt-controller/aspeed-scu-ic.h
 
-- 
2.47.2


