Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C0BC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 19:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0vhIYNyZRBoCc5KQWgAngNEBzrQFJt249JHU8Fs3XRY=; b=uhNT5zmYxPe2ArUKU5zdCI/6kU
	djUxoN/jQmquU66biXizelN5LAbPczDUtDCB68RqQfeXkPACcyM5RvxXKBw/Kw2wIJWxU3QsNAboZ
	6jgyWWFpA3eXOzwWi5lrR2yzm8/hzL8TSrh5QmBzJ4jwJ1lU6U0FMKzqDw3MVn0l3yVAABncC6b+4
	qbPSOk5pFL0Jm0wyKQ5AEnpgkFzwbNQ3YwbIs4lhbCx1SUTxFKvox5+BLJgUmggbjMITCgCq7BsG0
	bHeL2ahv2rj/CAjpUqDz8YdA98qjIlga7zD36YjnsI21XLW8Li8gRKJA6uMgtMO3F+TwX85H36S4Z
	VL/p5qKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxJp-0000000Crfs-26jM;
	Thu, 10 Jul 2025 19:52:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvgh-0000000CfAK-2QtS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 18:08:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8F53EA5398F;
	Thu, 10 Jul 2025 18:08:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F14C4CEE3;
	Thu, 10 Jul 2025 18:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752170882;
	bh=H/22VoxoJNMCj2KzG+gdrE6//AC+jUMyUk7xyA65920=;
	h=From:To:Cc:Subject:Date:From;
	b=KjEc60j7UV1LD0DOGVyrM5BGtvErn7j9p48hyR9AQkhQoDABqu8/qqOIdFM0V8Hjm
	 dxyOjVB7ZjfGRK2EyWTzkUE8HNOQd0ZmdUovgVyhtl/jrbswN5qNtXD+M1dtBUrDtn
	 0ttaTxxSkx+4DnxJ4kpqlI9UHN0RGfUMSeKTZXTIMspO7YcNZJp9jnW85fX3KwcM7d
	 drjKBPLsWzEPQ4uCx8Fm+GdVXXTVsVoFqA/idSiZSc7yGUf++gJ1D0couFJsb8NVjM
	 s5/q9wYO7qGdgZcVzsWjB5JfUG0Ry/DOcm75Qjl3Ad2eApv53n1kp1TuugqbCfKHDR
	 WJre1r2+kmM2g==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Toan Le <toan@os.amperecomputing.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert apm,xgene1-msi to DT schema
Date: Thu, 10 Jul 2025 13:07:55 -0500
Message-ID: <20250710180757.2970583-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_110803_750657_B92DC5FB 
X-CRM114-Status: GOOD (  17.05  )
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

Convert the Applied Micro X-Gene MSI controller binding to DT schema
format. MSI controllers go in interrupt-controller directory so move the
schema there.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../interrupt-controller/apm,xgene1-msi.yaml  | 54 +++++++++++++++
 .../devicetree/bindings/pci/xgene-pci-msi.txt | 68 -------------------
 MAINTAINERS                                   |  2 +-
 3 files changed, 55 insertions(+), 69 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/apm,xgene1-msi.yaml
 delete mode 100644 Documentation/devicetree/bindings/pci/xgene-pci-msi.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/apm,xgene1-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/apm,xgene1-msi.yaml
new file mode 100644
index 000000000000..49db952697f3
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/apm,xgene1-msi.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/apm,xgene1-msi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AppliedMicro X-Gene v1 PCIe MSI controller
+
+maintainers:
+  - Toan Le <toan@os.amperecomputing.com>
+
+properties:
+  compatible:
+    const: apm,xgene1-msi
+
+  msi-controller: true
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 16
+
+required:
+  - compatible
+  - msi-controller
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    msi@79000000 {
+        compatible = "apm,xgene1-msi";
+        msi-controller;
+        reg = <0x79000000 0x900000>;
+        interrupts = <0x0 0x10 0x4>,
+                     <0x0 0x11 0x4>,
+                     <0x0 0x12 0x4>,
+                     <0x0 0x13 0x4>,
+                     <0x0 0x14 0x4>,
+                     <0x0 0x15 0x4>,
+                     <0x0 0x16 0x4>,
+                     <0x0 0x17 0x4>,
+                     <0x0 0x18 0x4>,
+                     <0x0 0x19 0x4>,
+                     <0x0 0x1a 0x4>,
+                     <0x0 0x1b 0x4>,
+                     <0x0 0x1c 0x4>,
+                     <0x0 0x1d 0x4>,
+                     <0x0 0x1e 0x4>,
+                     <0x0 0x1f 0x4>;
+    };
diff --git a/Documentation/devicetree/bindings/pci/xgene-pci-msi.txt b/Documentation/devicetree/bindings/pci/xgene-pci-msi.txt
deleted file mode 100644
index 85d9b95234f7..000000000000
--- a/Documentation/devicetree/bindings/pci/xgene-pci-msi.txt
+++ /dev/null
@@ -1,68 +0,0 @@
-* AppliedMicro X-Gene v1 PCIe MSI controller
-
-Required properties:
-
-- compatible: should be "apm,xgene1-msi" to identify
-	      X-Gene v1 PCIe MSI controller block.
-- msi-controller: indicates that this is an X-Gene v1 PCIe MSI controller node
-- reg: physical base address (0x79000000) and length (0x900000) for controller
-       registers. These registers include the MSI termination address and data
-       registers as well as the MSI interrupt status registers.
-- reg-names: not required
-- interrupts: A list of 16 interrupt outputs of the controller, starting from
-	      interrupt number 0x10 to 0x1f.
-- interrupt-names: not required
-
-Each PCIe node needs to have property msi-parent that points to an MSI
-controller node
-
-Examples:
-
-SoC DTSI:
-
-	+ MSI node:
-	msi@79000000 {
-		compatible = "apm,xgene1-msi";
-		msi-controller;
-		reg = <0x00 0x79000000 0x0 0x900000>;
-		interrupts = 	<0x0 0x10 0x4>
-				<0x0 0x11 0x4>
-				<0x0 0x12 0x4>
-				<0x0 0x13 0x4>
-				<0x0 0x14 0x4>
-				<0x0 0x15 0x4>
-				<0x0 0x16 0x4>
-				<0x0 0x17 0x4>
-				<0x0 0x18 0x4>
-				<0x0 0x19 0x4>
-				<0x0 0x1a 0x4>
-				<0x0 0x1b 0x4>
-				<0x0 0x1c 0x4>
-				<0x0 0x1d 0x4>
-				<0x0 0x1e 0x4>
-				<0x0 0x1f 0x4>;
-	};
-
-	+ PCIe controller node with msi-parent property pointing to MSI node:
-	pcie0: pcie@1f2b0000 {
-		device_type = "pci";
-		compatible = "apm,xgene-storm-pcie", "apm,xgene-pcie";
-		#interrupt-cells = <1>;
-		#size-cells = <2>;
-		#address-cells = <3>;
-		reg = < 0x00 0x1f2b0000 0x0 0x00010000   /* Controller registers */
-			0xe0 0xd0000000 0x0 0x00040000>; /* PCI config space */
-		reg-names = "csr", "cfg";
-		ranges = <0x01000000 0x00 0x00000000 0xe0 0x10000000 0x00 0x00010000   /* io */
-			  0x02000000 0x00 0x80000000 0xe1 0x80000000 0x00 0x80000000>; /* mem */
-		dma-ranges = <0x42000000 0x80 0x00000000 0x80 0x00000000 0x00 0x80000000
-			      0x42000000 0x00 0x00000000 0x00 0x00000000 0x80 0x00000000>;
-		interrupt-map-mask = <0x0 0x0 0x0 0x7>;
-		interrupt-map = <0x0 0x0 0x0 0x1 &gic 0x0 0xc2 0x1
-				 0x0 0x0 0x0 0x2 &gic 0x0 0xc3 0x1
-				 0x0 0x0 0x0 0x3 &gic 0x0 0xc4 0x1
-				 0x0 0x0 0x0 0x4 &gic 0x0 0xc5 0x1>;
-		dma-coherent;
-		clocks = <&pcie0clk 0>;
-		msi-parent= <&msi>;
-	};
diff --git a/MAINTAINERS b/MAINTAINERS
index d0df1130d5ff..3699fe4be6b6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19146,7 +19146,7 @@ M:	Toan Le <toan@os.amperecomputing.com>
 L:	linux-pci@vger.kernel.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-F:	Documentation/devicetree/bindings/pci/xgene-pci-msi.txt
+F:	Documentation/devicetree/bindings/interrupt-controller/apm,xgene1-msi.yaml
 F:	drivers/pci/controller/pci-xgene-msi.c
 
 PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS
-- 
2.47.2


