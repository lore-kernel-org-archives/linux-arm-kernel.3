Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C770C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 00:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n4H0VKzwu3OiqJvQ5E2XnZcFIs+ZqlxTTQ2byh7skwc=; b=OQOw8dOVh15TrGrgmfXrm5s+ll
	Hs0bCyfBaX+SjnoL0wCuIv1O6vtlouu9VuqXhuwSJt4vKsvX3CB7qu7T+8K5sLCzcqKnBDqkLmbIn
	pLu63dm6B6aDK4PKt8Qkiq+hrEZXjpBGw6dMRC37Q6glSPdBh4LbCP8A4YhCszv0BLrSqT6g6vDOJ
	ABfmVxl+w1wANOxMvHgRr1D1R+7nQzdv2aq1Xy1uDGQUGoca2KKNuXJ3YtZrW3f3w52IF6IKvdxzc
	J5nKWHK6c9uXt5EFWvS/st+93nilbjT2QEG56TvS5uOH/tlLdKFihr33wQUjFCQBpl7dFM+qT+eNx
	iAq0NOww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHXdV-0000000ES6y-2RyB;
	Wed, 21 May 2025 00:48:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHXbL-0000000ERqz-3rO2;
	Wed, 21 May 2025 00:46:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C047B5C5687;
	Wed, 21 May 2025 00:44:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7795CC4CEE9;
	Wed, 21 May 2025 00:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747788390;
	bh=6eRPXWYKV5B62KMfC9wBJCSY8UIUCsWL77sMjILQEIY=;
	h=From:To:Cc:Subject:Date:From;
	b=NFUMjet/QWZMEWXWiCRQdYRgMXmihjsvbK2+0tbgtpRxnY6BARb3Xy7W04aBF1a60
	 OX6mjmlmErYlVQP+07yCnKUIhE9+QyIeD2lacyGr65Nj1sawKAQyWI+MO6ILvvkMEf
	 CZDgGBWbSF+Oa0PYfy6H2zmkwfNarXiQwY/4xsgoLGsWOTdj/ReJGGCNetjtI7HL3N
	 p/W9LIGn6AG08wwVEu3ZN5OAiXnpfDJRH/aVvA0C/flmmeA5nqjSNC2GMlq660Gy0u
	 M6zdBgY19dOfb7OxWxFZAhtrgl13TYw2QMn4uvD8K0b9fp8S6iN472UjQ7IKFsmgKb
	 eXxqGWuiVrsqw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: Convert brcm,bcm2835-cprman to DT schema
Date: Tue, 20 May 2025 19:46:24 -0500
Message-ID: <20250521004625.1791913-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_174632_043748_8B286360 
X-CRM114-Status: GOOD (  16.42  )
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

Convert the Broadcom BCM2835 CPRMAN clock binding to DT schema format.
It's a straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/brcm,bcm2835-cprman.txt    | 60 -------------------
 .../bindings/clock/brcm,bcm2835-cprman.yaml   | 58 ++++++++++++++++++
 2 files changed, 58 insertions(+), 60 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt
 create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.yaml

diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt b/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt
deleted file mode 100644
index 9e0b03a6519b..000000000000
--- a/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt
+++ /dev/null
@@ -1,60 +0,0 @@
-Broadcom BCM2835 CPRMAN clocks
-
-This binding uses the common clock binding:
-    Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-The CPRMAN clock controller generates clocks in the audio power domain
-of the BCM2835.  There is a level of PLLs deriving from an external
-oscillator, a level of PLL dividers that produce channels off of the
-few PLLs, and a level of mostly-generic clock generators sourcing from
-the PLL channels.  Most other hardware components source from the
-clock generators, but a few (like the ARM or HDMI) will source from
-the PLL dividers directly.
-
-Required properties:
-- compatible:	should be one of the following,
-	"brcm,bcm2711-cprman"
-	"brcm,bcm2835-cprman"
-- #clock-cells:	Should be <1>. The permitted clock-specifier values can be
-		  found in include/dt-bindings/clock/bcm2835.h
-- reg:		Specifies base physical address and size of the registers
-- clocks:	phandles to the parent clocks used as input to the module, in
-		  the following order:
-
-		  - External oscillator
-		  - DSI0 byte clock
-		  - DSI0 DDR2 clock
-		  - DSI0 DDR clock
-		  - DSI1 byte clock
-		  - DSI1 DDR2 clock
-		  - DSI1 DDR clock
-
-		  Only external oscillator is required.  The DSI clocks may
-		  not be present, in which case their children will be
-		  unusable.
-
-Example:
-
-	clk_osc: clock@3 {
-		compatible = "fixed-clock";
-		reg = <3>;
-		#clock-cells = <0>;
-		clock-output-names = "osc";
-		clock-frequency = <19200000>;
-	};
-
-	clocks: cprman@7e101000 {
-		compatible = "brcm,bcm2835-cprman";
-		#clock-cells = <1>;
-		reg = <0x7e101000 0x2000>;
-		clocks = <&clk_osc>;
-	};
-
-	i2c0: i2c@7e205000 {
-		compatible = "brcm,bcm2835-i2c";
-		reg = <0x7e205000 0x1000>;
-		interrupts = <2 21>;
-		clocks = <&clocks BCM2835_CLOCK_VPU>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.yaml b/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.yaml
new file mode 100644
index 000000000000..8586033794ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/brcm,bcm2835-cprman.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM2835 CPRMAN clocks
+
+maintainers:
+  - Stefan Wahren <wahrenst@gmx.net>
+
+description:
+  The CPRMAN clock controller generates clocks in the audio power domain of the
+  BCM2835.  There is a level of PLLs deriving from an external oscillator, a
+  level of PLL dividers that produce channels off of the few PLLs, and a level
+  of mostly-generic clock generators sourcing from the PLL channels.  Most other
+  hardware components source from the clock generators, but a few (like the ARM
+  or HDMI) will source from the PLL dividers directly.
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm2711-cprman
+      - brcm,bcm2835-cprman
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    minItems: 1
+    items:
+      - description: External oscillator clock.
+      - description: DSI0 byte clock.
+      - description: DSI0 DDR2 clock.
+      - description: DSI0 DDR clock.
+      - description: DSI1 byte clock.
+      - description: DSI1 DDR2 clock.
+      - description: DSI1 DDR clock.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - '#clock-cells'
+  - reg
+  - clocks
+
+examples:
+  - |
+    clock-controller@7e101000 {
+        compatible = "brcm,bcm2835-cprman";
+        reg = <0x7e101000 0x2000>;
+        #clock-cells = <1>;
+        clocks = <&clk_osc>;
+    };
-- 
2.47.2


