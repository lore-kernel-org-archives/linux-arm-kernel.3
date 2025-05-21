Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13BCC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 00:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hhJhv2rlPE+1QF/TK9MvtRTCu2MOKqhhKSW/joQ2zE8=; b=gVHRxodNy1dt0fQGI3pRKaNsRh
	HEXE9qjh44IzmSWQuCCqxPK0/PwGNQlYdfEXwQ1NcuY4BIWAps9NqW0vwUxNazlzVsCJ9kSIwNWo1
	4OqP7cvBSMKONxNDL0xMfSvdEeyd3X3d5yS6IwxkyU7Kb0k8kVVmNpTEsOvwyY/YIqSL8XW1Q56+E
	BA7uOT+yYwvjQqdzX82Vxnwb66ftAMGtfON7jnRcPSFqs+UexDYNbbilVxQ0gQ5abksOGGl8T+THS
	KWA8AWfu4HoLj/RV8ejNXSI9LvN2K8lrFBUfN6HX7RnWo4/YDsam6JM+jCRvq4L7T5EtsobfHj4ws
	n0DUWX0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHXfh-0000000ESIf-34kd;
	Wed, 21 May 2025 00:51:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHXbX-0000000ERtU-2jHl;
	Wed, 21 May 2025 00:46:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 175EA4ADD8;
	Wed, 21 May 2025 00:46:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1175C4CEE9;
	Wed, 21 May 2025 00:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747788403;
	bh=vnlgX4Fwf1dP5efupjAMD1twhvn6zgt6TRt7GMaEvWc=;
	h=From:To:Cc:Subject:Date:From;
	b=IJC2jm9Wiy11/yKzj6dECpwxEMCMxuv0gZMVjJK4ooKxKs8m9DVgoNRnXYLcfxMtm
	 CA1IVDkVUqfhS46b8YYOuWsZyqgY4CAQGX6c7nfxuN+eNo7Ri50xwbn3gd0L5QBN/q
	 /YEXkIKeAH/Id9PL0DS3g91aO3SERGb44qoKCYw9ndo2hLMCtXl/y2QtwN1PFdNNNM
	 mLu7Njm5aHbstGpLWa5fk3PDHb+0XmVK0xQCQRJoHoFGPihNgPY95Y9hQfArL/A0Ga
	 ZudxbJpFmnWQetoO2lYo0Lh3sQBkpIc2yHsnb2q2bvvoGzV29FVax6J2e4xIAukOkP
	 7xeiyiNrXlztw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: Convert brcm,bcm2835-aux to DT schema
Date: Tue, 20 May 2025 19:46:33 -0500
Message-ID: <20250521004634.1792167-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_174643_729880_8783BEBE 
X-CRM114-Status: GOOD (  14.11  )
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

Convert the Broadcom BCM2835 auxiliary peripheral clock binding to DT
schema format. It's a straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/brcm,bcm2835-aux-clock.txt | 31 ------------
 .../bindings/clock/brcm,bcm2835-aux.yaml      | 47 +++++++++++++++++++
 2 files changed, 47 insertions(+), 31 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm2835-aux-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm2835-aux.yaml

diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm2835-aux-clock.txt b/Documentation/devicetree/bindings/clock/brcm,bcm2835-aux-clock.txt
deleted file mode 100644
index 4acfc8f641b6..000000000000
--- a/Documentation/devicetree/bindings/clock/brcm,bcm2835-aux-clock.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-Broadcom BCM2835 auxiliary peripheral support
-
-This binding uses the common clock binding:
-    Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-The auxiliary peripherals (UART, SPI1, and SPI2) have a small register
-area controlling clock gating to the peripherals, and providing an IRQ
-status register.
-
-Required properties:
-- compatible:	Should be "brcm,bcm2835-aux"
-- #clock-cells:	Should be <1>. The permitted clock-specifier values can be
-		  found in include/dt-bindings/clock/bcm2835-aux.h
-- reg:		Specifies base physical address and size of the registers
-- clocks:	The parent clock phandle
-
-Example:
-
-	clocks: cprman@7e101000 {
-		compatible = "brcm,bcm2835-cprman";
-		#clock-cells = <1>;
-		reg = <0x7e101000 0x2000>;
-		clocks = <&clk_osc>;
-	};
-
-	aux: aux@7e215004 {
-		compatible = "brcm,bcm2835-aux";
-		#clock-cells = <1>;
-		reg = <0x7e215000 0x8>;
-		clocks = <&clocks BCM2835_CLOCK_VPU>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm2835-aux.yaml b/Documentation/devicetree/bindings/clock/brcm,bcm2835-aux.yaml
new file mode 100644
index 000000000000..cfe4e791bbed
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/brcm,bcm2835-aux.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/brcm,bcm2835-aux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM2835 auxiliary peripheral support
+
+maintainers:
+  - Florian Fainelli <florian.fainelli@broadcom.com>
+
+description:
+  The auxiliary peripherals (UART, SPI1, and SPI2) have a small register area
+  controlling clock gating to the peripherals, and providing an IRQ status
+  register.
+
+properties:
+  compatible:
+    const: brcm,bcm2835-aux
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/bcm2835.h>
+
+    clock-controller@7e215004 {
+        compatible = "brcm,bcm2835-aux";
+        reg = <0x7e215000 0x8>;
+        #clock-cells = <1>;
+        clocks = <&clocks BCM2835_CLOCK_VPU>;
+    };
-- 
2.47.2


