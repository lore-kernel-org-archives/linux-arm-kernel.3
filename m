Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1E2C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 19:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uHx+F8zf+cgkMgypO6Fu8gq3evpVaqLl+Bc9jptt340=; b=KV7JJ02n0WHNk0yyckXlZlGA+w
	alaxmNzgSgpMrYrhviFrKUylIrMhe+Mznv/Y2mlA+0XMTZJMV8ZkMzNHMxGZwNaUtQksyqR/39L+p
	hPv1Yr+i+oAwAE/dNYcD2dJ5yBAJVX0NH2sqjN/hZYzS3UNKLIQYa2Vf5uyFqguRHVjQsCR1qLdaz
	CRWBZyCo6uO6MPfIxfBFT8NfsQUp7n042Ja2HXfA2S0by3lDHzomRUIJy0pddejNtJFOSDMx+oDxj
	YZHqIROj39U++4/ePXuEWvS0amRK9MdI7d+kZ2SqLXc1Z2qi8MhJQbT+KjuArOvGWyB2vxTZ+FtDy
	5U7SrPzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxM8-0000000CrxY-0vqW;
	Thu, 10 Jul 2025 19:54:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvgy-0000000CfEK-3F5j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 18:08:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 465705C6F35;
	Thu, 10 Jul 2025 18:08:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C110CC4CEE3;
	Thu, 10 Jul 2025 18:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752170900;
	bh=cKM3Kh+GvHkT7+ZlTY8HbJCtloLxrCnmh7IUUyiFmp8=;
	h=From:To:Cc:Subject:Date:From;
	b=P5pbQ6/J95RQ8zl0OMq8O/niDp1gE6S5edj+fGCpl2hAnxQiGZmJhSaumqaMvI9Mg
	 W4pu062XTdUmzy/QGxMZpni8uxvYYNvgy6UWIfaXSwi6+c2hkaBofstLyr702LHajQ
	 W0z5TVDsJbWkd3TVRjBxTT0oNzEbQ81gsgkoycKoYLH78hlxT43/kc81KkEJoh9WGx
	 0gSDLYlcTYBpRvUlVii5E2tMwIb27EfIhx/D9ZfpW0D3UCZ+OJ3pyEoIlqW8vNnndB
	 EI0vk9ZqhdKuwQslpqkxt+DgjJLuVPQ1iubiVU+tq0PXLtEE6Lqpl4gzcV53F2StwH
	 35CTOOP3kwEoA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: PCI: Convert marvell,armada-3700-pcie to DT schema
Date: Thu, 10 Jul 2025 13:08:05 -0500
Message-ID: <20250710180811.2970846-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_110820_904527_CAD3EE95 
X-CRM114-Status: GOOD (  20.55  )
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

Convert the Marvell Armada 3700 PCIe binding to DT schema format.

The 'clocks' property was missing and has been added.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/pci/aardvark-pci.txt  | 59 -----------
 .../pci/marvell,armada-3700-pcie.yaml         | 99 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 100 insertions(+), 60 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pci/aardvark-pci.txt
 create mode 100644 Documentation/devicetree/bindings/pci/marvell,armada-3700-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/aardvark-pci.txt b/Documentation/devicetree/bindings/pci/aardvark-pci.txt
deleted file mode 100644
index 2b8ca920a7fa..000000000000
--- a/Documentation/devicetree/bindings/pci/aardvark-pci.txt
+++ /dev/null
@@ -1,59 +0,0 @@
-Aardvark PCIe controller
-
-This PCIe controller is used on the Marvell Armada 3700 ARM64 SoC.
-
-The Device Tree node describing an Aardvark PCIe controller must
-contain the following properties:
-
- - compatible: Should be "marvell,armada-3700-pcie"
- - reg: range of registers for the PCIe controller
- - interrupts: the interrupt line of the PCIe controller
- - #address-cells: set to <3>
- - #size-cells: set to <2>
- - device_type: set to "pci"
- - ranges: ranges for the PCI memory and I/O regions
- - #interrupt-cells: set to <1>
- - msi-controller: indicates that the PCIe controller can itself
-   handle MSI interrupts
- - msi-parent: pointer to the MSI controller to be used
- - interrupt-map-mask and interrupt-map: standard PCI properties to
-   define the mapping of the PCIe interface to interrupt numbers.
- - bus-range: PCI bus numbers covered
- - phys: the PCIe PHY handle
- - max-link-speed: see pci.txt
- - reset-gpios: see pci.txt
-
-In addition, the Device Tree describing an Aardvark PCIe controller
-must include a sub-node that describes the legacy interrupt controller
-built into the PCIe controller. This sub-node must have the following
-properties:
-
- - interrupt-controller
- - #interrupt-cells: set to <1>
-
-Example:
-
-	pcie0: pcie@d0070000 {
-		compatible = "marvell,armada-3700-pcie";
-		device_type = "pci";
-		reg = <0 0xd0070000 0 0x20000>;
-		#address-cells = <3>;
-		#size-cells = <2>;
-		bus-range = <0x00 0xff>;
-		interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
-		#interrupt-cells = <1>;
-		msi-controller;
-		msi-parent = <&pcie0>;
-		ranges = <0x82000000 0 0xe8000000   0 0xe8000000 0 0x1000000 /* Port 0 MEM */
-			  0x81000000 0 0xe9000000   0 0xe9000000 0 0x10000>; /* Port 0 IO*/
-		interrupt-map-mask = <0 0 0 7>;
-		interrupt-map = <0 0 0 1 &pcie_intc 0>,
-				<0 0 0 2 &pcie_intc 1>,
-				<0 0 0 3 &pcie_intc 2>,
-				<0 0 0 4 &pcie_intc 3>;
-		phys = <&comphy1 0>;
-		pcie_intc: interrupt-controller {
-			interrupt-controller;
-			#interrupt-cells = <1>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/pci/marvell,armada-3700-pcie.yaml b/Documentation/devicetree/bindings/pci/marvell,armada-3700-pcie.yaml
new file mode 100644
index 000000000000..68090b3ca419
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/marvell,armada-3700-pcie.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/marvell,armada-3700-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Armada 3700 (Aardvark) PCIe Controller
+
+maintainers:
+  - Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+  - Pali Rohár <pali@kernel.org>
+
+allOf:
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
+
+properties:
+  compatible:
+    const: marvell,armada-3700-pcie
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  msi-controller: true
+
+  msi-parent:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+
+  reset-gpios:
+    description: PCIe reset GPIO signals.
+
+  interrupt-controller:
+    type: object
+    additionalProperties: false
+
+    properties:
+      interrupt-controller: true
+
+      '#interrupt-cells':
+        const: 1
+
+    required:
+      - interrupt-controller
+      - '#interrupt-cells'
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - '#interrupt-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie@d0070000 {
+            compatible = "marvell,armada-3700-pcie";
+            device_type = "pci";
+            reg = <0 0xd0070000 0 0x20000>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            bus-range = <0x00 0xff>;
+            interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+            msi-controller;
+            msi-parent = <&pcie0>;
+            ranges = <0x82000000 0 0xe8000000 0 0xe8000000 0 0x1000000>,
+                    <0x81000000 0 0xe9000000 0 0xe9000000 0 0x10000>;
+
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 7>;
+            interrupt-map = <0 0 0 1 &pcie_intc 0>,
+                            <0 0 0 2 &pcie_intc 1>,
+                            <0 0 0 3 &pcie_intc 2>,
+                            <0 0 0 4 &pcie_intc 3>;
+            phys = <&comphy1 0>;
+            max-link-speed = <2>;
+            reset-gpios = <&gpio1 15 GPIO_ACTIVE_LOW>;
+
+            pcie_intc: interrupt-controller {
+                interrupt-controller;
+                #interrupt-cells = <1>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 17085b8a393f..d0df1130d5ff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18898,7 +18898,7 @@ M:	Pali Rohár <pali@kernel.org>
 L:	linux-pci@vger.kernel.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-F:	Documentation/devicetree/bindings/pci/aardvark-pci.txt
+F:	Documentation/devicetree/bindings/pci/marvell,armada-3700-pcie.yaml
 F:	drivers/pci/controller/pci-aardvark.c
 
 PCI DRIVER FOR ALTERA PCIE IP
-- 
2.47.2


