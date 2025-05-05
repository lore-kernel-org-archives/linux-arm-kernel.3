Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B9EC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 15:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BDayxc9U2D6s4uGDAa7rnP5WzSkG5GYyjpxRYZVhRUc=; b=PCI+3tvzbOecUuO2BSIAxM5dQu
	CTDdiSRZn0uTbD6yH9SbNReXWVYsEvsiku6gX3C0UJWYHYKEFx6S2eykqyfGa9jKABj7v2M19U2o8
	qvAJdopFY5aCeatvCDeFfFgyL7yIwLUQW/f0fERzLQlQJW5R0pCcIOWhrVdPOMiMFL6qM8q06S1Cl
	B/mXkgDnNjVoH8v8fBBvJzPn240wvzJSh7nb4CwiI+hY+lfyzjqgkOZbfkm5NVIJwE5VO9+YdDche
	PyllfiNOVd1Ri6HMDLMSG+rU0UrXg/AsZfw7qL/OdWjaBPaedhTSLVpx92GcgRyefUWZwfiTVqbTp
	Mv3GcElA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBxKl-00000007jsU-3Zhg;
	Mon, 05 May 2025 15:02:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBx5J-00000007fsK-07LW;
	Mon, 05 May 2025 14:46:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 189714A78B;
	Mon,  5 May 2025 14:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7274CC4CEF1;
	Mon,  5 May 2025 14:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456380;
	bh=Ldw7UKcT0C7blDCLSjkpdIbw5wZg9xKCoqc9D/XMdsY=;
	h=From:To:Cc:Subject:Date:From;
	b=tgj2G7kQCY8pFY+s70jFMmxdfdZ8SDq5H/XoIyWLIHFkj4/jITqN2VI8MQ7TsjfU0
	 MCfzWuneeZ04YRp3IO02L+GMupQgNLJ7WgDwR//DZT98wzlbj+6F7gtZ3/wW594KS1
	 tspkyokeuMaRcjfwlWMFR0RCU7xrFwh3pObvNYzFdENgJM0GfNqa2nDHWWtAtRjWEk
	 aBYdegIrGlasRc2uU8omPXdHXdL8AKRBCWZ5TpYHEKT23NbFJmfIkQETIvVzi1qw6Y
	 5AMAR2BFXWsfOnQBKQgEDYwJgWwHjBJyWwci0ISgt2gY9Zk4XYKnU5pkaxg0+abgr8
	 zwCmSwTFmD4UA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert brcm,bcm2835-armctrl-ic to DT schema
Date: Mon,  5 May 2025 09:46:16 -0500
Message-ID: <20250505144618.1287539-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_074621_111293_9CC4F075 
X-CRM114-Status: GOOD (  17.84  )
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

Convert the Broadcom BCM2835 ARMCTRL interrupt controller binding to
schema format. It's a straight-forward conversion of the typical
interrupt controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../brcm,bcm2835-armctrl-ic.txt               | 131 --------------
 .../brcm,bcm2835-armctrl-ic.yaml              | 161 ++++++++++++++++++
 2 files changed, 161 insertions(+), 131 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
deleted file mode 100644
index bdd173056f72..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
+++ /dev/null
@@ -1,131 +0,0 @@
-BCM2835 Top-Level ("ARMCTRL") Interrupt Controller
-
-The BCM2835 contains a custom top-level interrupt controller, which supports
-72 interrupt sources using a 2-level register scheme. The interrupt
-controller, or the HW block containing it, is referred to occasionally
-as "armctrl" in the SoC documentation, hence naming of this binding.
-
-The BCM2836 contains the same interrupt controller with the same
-interrupts, but the per-CPU interrupt controller is the root, and an
-interrupt there indicates that the ARMCTRL has an interrupt to handle.
-
-Required properties:
-
-- compatible : should be "brcm,bcm2835-armctrl-ic" or
-                 "brcm,bcm2836-armctrl-ic"
-- reg : Specifies base physical address and size of the registers.
-- interrupt-controller : Identifies the node as an interrupt controller
-- #interrupt-cells : Specifies the number of cells needed to encode an
-  interrupt source. The value shall be 2.
-
-  The 1st cell is the interrupt bank; 0 for interrupts in the "IRQ basic
-  pending" register, or 1/2 respectively for interrupts in the "IRQ pending
-  1/2" register.
-
-  The 2nd cell contains the interrupt number within the bank. Valid values
-  are 0..7 for bank 0, and 0..31 for bank 1.
-
-Additional required properties for brcm,bcm2836-armctrl-ic:
-- interrupts : Specifies the interrupt on the parent for this interrupt
-  controller to handle.
-
-The interrupt sources are as follows:
-
-Bank 0:
-0: ARM_TIMER
-1: ARM_MAILBOX
-2: ARM_DOORBELL_0
-3: ARM_DOORBELL_1
-4: VPU0_HALTED
-5: VPU1_HALTED
-6: ILLEGAL_TYPE0
-7: ILLEGAL_TYPE1
-
-Bank 1:
-0: TIMER0
-1: TIMER1
-2: TIMER2
-3: TIMER3
-4: CODEC0
-5: CODEC1
-6: CODEC2
-7: VC_JPEG
-8: ISP
-9: VC_USB
-10: VC_3D
-11: TRANSPOSER
-12: MULTICORESYNC0
-13: MULTICORESYNC1
-14: MULTICORESYNC2
-15: MULTICORESYNC3
-16: DMA0
-17: DMA1
-18: VC_DMA2
-19: VC_DMA3
-20: DMA4
-21: DMA5
-22: DMA6
-23: DMA7
-24: DMA8
-25: DMA9
-26: DMA10
-27: DMA11-14 - shared interrupt for DMA 11 to 14
-28: DMAALL - triggers on all dma interrupts (including channel 15)
-29: AUX
-30: ARM
-31: VPUDMA
-
-Bank 2:
-0: HOSTPORT
-1: VIDEOSCALER
-2: CCP2TX
-3: SDC
-4: DSI0
-5: AVE
-6: CAM0
-7: CAM1
-8: HDMI0
-9: HDMI1
-10: PIXELVALVE1
-11: I2CSPISLV
-12: DSI1
-13: PWA0
-14: PWA1
-15: CPR
-16: SMI
-17: GPIO0
-18: GPIO1
-19: GPIO2
-20: GPIO3
-21: VC_I2C
-22: VC_SPI
-23: VC_I2SPCM
-24: VC_SDIO
-25: VC_UART
-26: SLIMBUS
-27: VEC
-28: CPG
-29: RNG
-30: VC_ARASANSDIO
-31: AVSPMON
-
-Example:
-
-/* BCM2835, first level */
-intc: interrupt-controller {
-	compatible = "brcm,bcm2835-armctrl-ic";
-	reg = <0x7e00b200 0x200>;
-	interrupt-controller;
-	#interrupt-cells = <2>;
-};
-
-/* BCM2836, second level */
-intc: interrupt-controller {
-	compatible = "brcm,bcm2836-armctrl-ic";
-	reg = <0x7e00b200 0x200>;
-	interrupt-controller;
-	#interrupt-cells = <2>;
-
-	interrupt-parent = <&local_intc>;
-	interrupts = <8>;
-};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.yaml b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.yaml
new file mode 100644
index 000000000000..4edc4c3ff6bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.yaml
@@ -0,0 +1,161 @@
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/brcm,bcm2835-armctrl-ic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: BCM2835 ARMCTRL Interrupt Controller
+
+maintainers:
+  - Florian Fainelli <florian.fainelli@broadcom.com>
+
+description: >
+  The BCM2835 contains a custom top-level interrupt controller, which supports
+  72 interrupt sources using a 2-level register scheme. The interrupt
+  controller, or the HW block containing it, is referred to occasionally as
+  "armctrl" in the SoC documentation, hence naming of this binding.
+
+  The BCM2836 contains the same interrupt controller with the same interrupts,
+  but the per-CPU interrupt controller is the root, and an interrupt there
+  indicates that the ARMCTRL has an interrupt to handle.
+
+  The interrupt sources are as follows:
+
+  Bank 0:
+    0: ARM_TIMER
+    1: ARM_MAILBOX
+    2: ARM_DOORBELL_0
+    3: ARM_DOORBELL_1
+    4: VPU0_HALTED
+    5: VPU1_HALTED
+    6: ILLEGAL_TYPE0
+    7: ILLEGAL_TYPE1
+
+  Bank 1:
+    0: TIMER0
+    1: TIMER1
+    2: TIMER2
+    3: TIMER3
+    4: CODEC0
+    5: CODEC1
+    6: CODEC2
+    7: VC_JPEG
+    8: ISP
+    9: VC_USB
+    10: VC_3D
+    11: TRANSPOSER
+    12: MULTICORESYNC0
+    13: MULTICORESYNC1
+    14: MULTICORESYNC2
+    15: MULTICORESYNC3
+    16: DMA0
+    17: DMA1
+    18: VC_DMA2
+    19: VC_DMA3
+    20: DMA4
+    21: DMA5
+    22: DMA6
+    23: DMA7
+    24: DMA8
+    25: DMA9
+    26: DMA10
+    27: DMA11-14 - shared interrupt for DMA 11 to 14
+    28: DMAALL - triggers on all dma interrupts (including channel 15)
+    29: AUX
+    30: ARM
+    31: VPUDMA
+
+  Bank 2:
+    0: HOSTPORT
+    1: VIDEOSCALER
+    2: CCP2TX
+    3: SDC
+    4: DSI0
+    5: AVE
+    6: CAM0
+    7: CAM1
+    8: HDMI0
+    9: HDMI1
+    10: PIXELVALVE1
+    11: I2CSPISLV
+    12: DSI1
+    13: PWA0
+    14: PWA1
+    15: CPR
+    16: SMI
+    17: GPIO0
+    18: GPIO1
+    19: GPIO2
+    20: GPIO3
+    21: VC_I2C
+    22: VC_SPI
+    23: VC_I2SPCM
+    24: VC_SDIO
+    25: VC_UART
+    26: SLIMBUS
+    27: VEC
+    28: CPG
+    29: RNG
+    30: VC_ARASANSDIO
+    31: AVSPMON
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm2835-armctrl-ic
+      - brcm,bcm2836-armctrl-ic
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+    description: >
+      The 1st cell is the interrupt bank; 0 for interrupts in the "IRQ basic
+      pending" register, or 1/2 respectively for interrupts in the "IRQ pending
+      1/2" register.
+
+      The 2nd cell contains the interrupt number within the bank. Valid values
+      are 0..7 for bank 0, and 0..31 for bank 1.
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm2836-armctrl-ic
+    then:
+      required:
+        - interrupts
+    else:
+      properties:
+        interrupts: false
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@7e00b200 {
+        compatible = "brcm,bcm2835-armctrl-ic";
+        reg = <0x7e00b200 0x200>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };
+  - |
+    interrupt-controller@7e00b200 {
+        compatible = "brcm,bcm2836-armctrl-ic";
+        reg = <0x7e00b200 0x200>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <8>;
+    };
-- 
2.47.2


