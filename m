Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81963C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 05:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gjM55WHZMgTI76f6CK0ZgtDz9gOt06Lz/sDfWFO6L10=; b=jwX3ubOyEiidnFj1tKrnZbu24f
	QvMfI1IAGBBaPHdGp3ikdMCizOu4nXd4ct2D7Hb1q1WOgLx65rUtngaktIs40K2lacW8BY+0PYheV
	rErzNidT+BIm8asOsL0GEG+N8mFMtC8lXbr1wwVaEW2TImXtxsAawtErLW9CWS5pwNvkqDnrpCNuk
	HhQg0+7CkktfAfVa1VX7pgPjAzvsmcVzR6uTnf6Z2T10R9m3oKv+7orPBISOjhFOJoNpsqm7qCXo3
	+i8KQpVjqumN2SHTf6p0f83r7eRrBqLMpvWjCJg2fM/IClOv5TBuqJufu/WgOUzdWeUNjmsGgF+Uy
	tyyP4RCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhRZ-00000009rxx-2Pqj;
	Tue, 12 Aug 2025 05:21:05 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulh9T-00000009pYR-3v6i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 05:02:25 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250812050221epoutp015adf637379609290c4f597e826ce6901~a7Gkif-7D0697106971epoutp01P
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 05:02:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250812050221epoutp015adf637379609290c4f597e826ce6901~a7Gkif-7D0697106971epoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754974941;
	bh=gjM55WHZMgTI76f6CK0ZgtDz9gOt06Lz/sDfWFO6L10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X77x9vgVxwSW1fFwYlS5m494GMzgfEzl8wfQ+sjMS43ATdn69hsOmJCbVuS72tu++
	 1ekameiqf1nAY5QGNmU3PlNSszgc/SZp82VV0jdK5GQG4rtbQmobyn5Xsp9qvjJYDk
	 sdNEHxXAvVvELhB12L67WVcPe/sEAkeBaNPQN3p0=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250812050220epcas5p36110fb54d3cb75f6dc99b8e3e02f2b2f~a7Gj5Oi6X1323713237epcas5p3y;
	Tue, 12 Aug 2025 05:02:20 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.92]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4c1KB32bsCz6B9mB; Tue, 12 Aug
	2025 05:02:19 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250811154721epcas5p26c9e2880ca55a470f595d914b4030745~awQca5BY13269132691epcas5p2H;
	Mon, 11 Aug 2025 15:47:21 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250811154718epsmtip1dc1faa6a78e80137e6ed5ed1b4e63636~awQZyl8dc2596225962epsmtip1B;
	Mon, 11 Aug 2025 15:47:18 +0000 (GMT)
From: Shradha Todi <shradha.t@samsung.com>
To: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: mani@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	vkoul@kernel.org, kishon@kernel.org, arnd@arndb.de,
	m.szyprowski@samsung.com, jh80.chung@samsung.com, pankaj.dubey@samsung.com,
	Shradha Todi <shradha.t@samsung.com>
Subject: [PATCH v3 06/12] dt-bindings: PCI: Split exynos host into two files
Date: Mon, 11 Aug 2025 21:16:32 +0530
Message-ID: <20250811154638.95732-7-shradha.t@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250811154638.95732-1-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250811154721epcas5p26c9e2880ca55a470f595d914b4030745
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250811154721epcas5p26c9e2880ca55a470f595d914b4030745
References: <20250811154638.95732-1-shradha.t@samsung.com>
	<CGME20250811154721epcas5p26c9e2880ca55a470f595d914b4030745@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_220224_329652_3B903554 
X-CRM114-Status: GOOD (  20.99  )
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

The current Exynos PCIe yaml binding file is hard to reuse by
other Samsung SoCs. Refactoring it by:
 - Moving common Samsung PCIe properties into samsung,exynos-pcie.yaml
 - Creating a dedicated samsung,exynos5433-pcie.yaml file for properties
   and constraints specific to the Exynos5433 SoC

Signed-off-by: Shradha Todi <shradha.t@samsung.com>
---
 .../bindings/pci/samsung,exynos-pcie.yaml     | 70 +--------------
 .../bindings/pci/samsung,exynos5433-pcie.yaml | 89 +++++++++++++++++++
 2 files changed, 91 insertions(+), 68 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/samsung,exynos5433-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml b/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml
index f20ed7e709f7..fd0b97b30821 100644
--- a/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml
@@ -11,7 +11,7 @@ maintainers:
   - Jaehoon Chung <jh80.chung@samsung.com>
 
 description: |+
-  Exynos5433 SoC PCIe host controller is based on the Synopsys DesignWare
+  Samsung SoCs PCIe host controller is based on the Synopsys DesignWare
   PCIe IP and thus inherits all the common properties defined in
   snps,dw-pcie.yaml.
 
@@ -19,9 +19,6 @@ allOf:
   - $ref: /schemas/pci/snps,dw-pcie.yaml#
 
 properties:
-  compatible:
-    const: samsung,exynos5433-pcie
-
   reg:
     items:
       - description: Data Bus Interface (DBI) registers.
@@ -37,83 +34,20 @@ properties:
   interrupts:
     maxItems: 1
 
-  clocks:
-    items:
-      - description: PCIe bridge clock
-      - description: PCIe bus clock
-
-  clock-names:
-    items:
-      - const: pcie
-      - const: pcie_bus
-
   phys:
     maxItems: 1
 
-  vdd10-supply:
-    description:
-      Phandle to a regulator that provides 1.0V power to the PCIe block.
-
-  vdd18-supply:
-    description:
-      Phandle to a regulator that provides 1.8V power to the PCIe block.
-
-  num-lanes:
-    const: 1
-
-  num-viewport:
-    const: 3
-
 required:
   - reg
   - reg-names
   - interrupts
   - "#address-cells"
   - "#size-cells"
-  - "#interrupt-cells"
-  - interrupt-map
-  - interrupt-map-mask
   - ranges
-  - bus-range
   - device_type
   - num-lanes
-  - num-viewport
   - clocks
   - clock-names
   - phys
-  - vdd10-supply
-  - vdd18-supply
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/interrupt-controller/irq.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/clock/exynos5433.h>
 
-    pcie: pcie@15700000 {
-        compatible = "samsung,exynos5433-pcie";
-        reg = <0x15700000 0x1000>, <0x156b0000 0x1000>, <0x0c000000 0x1000>;
-        reg-names = "dbi", "elbi", "config";
-        #address-cells = <3>;
-        #size-cells = <2>;
-        #interrupt-cells = <1>;
-        device_type = "pci";
-        interrupts = <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>;
-        clocks = <&cmu_fsys CLK_PCIE>, <&cmu_fsys CLK_PCLK_PCIE_PHY>;
-        clock-names = "pcie", "pcie_bus";
-        phys = <&pcie_phy>;
-        pinctrl-0 = <&pcie_bus &pcie_wlanen>;
-        pinctrl-names = "default";
-        num-lanes = <1>;
-        num-viewport = <3>;
-        bus-range = <0x00 0xff>;
-        ranges = <0x81000000 0 0	  0x0c001000 0 0x00010000>,
-                 <0x82000000 0 0x0c011000 0x0c011000 0 0x03feefff>;
-        vdd10-supply = <&ldo6_reg>;
-        vdd18-supply = <&ldo7_reg>;
-        interrupt-map-mask = <0 0 0 0>;
-        interrupt-map = <0 0 0 0 &gic GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>;
-    };
-...
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/pci/samsung,exynos5433-pcie.yaml b/Documentation/devicetree/bindings/pci/samsung,exynos5433-pcie.yaml
new file mode 100644
index 000000000000..1fb2c32899c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/samsung,exynos5433-pcie.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/samsung,exynos5433-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos5433 SoC PCIe Host Controller
+
+maintainers:
+  - Marek Szyprowski <m.szyprowski@samsung.com>
+  - Jaehoon Chung <jh80.chung@samsung.com>
+
+description:
+  Exynos5433 SoCs PCIe host controller inherits all the
+  common properties defined in samsung,exynos-pcie.yaml
+
+allOf:
+  - $ref: /schemas/pci/samsung,exynos-pcie.yaml#
+
+properties:
+  compatible:
+    const: samsung,exynos5433-pcie
+
+  clocks:
+    items:
+      - description: PCIe bridge clock
+      - description: PCIe bus clock
+
+  clock-names:
+    items:
+      - const: pcie
+      - const: pcie_bus
+
+  num-lanes:
+    const: 1
+
+  num-viewport:
+    const: 3
+
+  vdd10-supply:
+    description:
+      phandle to a regulator that provides 1.0v power to the pcie block
+
+  vdd18-supply:
+    description:
+      phandle to a regulator that provides 1.8v power to the pcie block
+
+required:
+  - "#interrupt-cells"
+  - interrupt-map
+  - interrupt-map-mask
+  - bus-range
+  - num-viewport
+  - vdd10-supply
+  - vdd18-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/exynos5433.h>
+
+    pcie: pcie@15700000 {
+        compatible = "samsung,exynos5433-pcie";
+        reg = <0x15700000 0x1000>, <0x156b0000 0x1000>, <0x0c000000 0x1000>;
+        reg-names = "dbi", "elbi", "config";
+        #address-cells = <3>;
+        #size-cells = <2>;
+        #interrupt-cells = <1>;
+        device_type = "pci";
+        interrupts = <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cmu_fsys CLK_PCIE>, <&cmu_fsys CLK_PCLK_PCIE_PHY>;
+        clock-names = "pcie", "pcie_bus";
+        phys = <&pcie_phy>;
+        pinctrl-0 = <&pcie_bus &pcie_wlanen>;
+        pinctrl-names = "default";
+        num-lanes = <1>;
+        num-viewport = <3>;
+        bus-range = <0x00 0xff>;
+        ranges = <0x81000000 0 0	  0x0c001000 0 0x00010000>,
+                 <0x82000000 0 0x0c011000 0x0c011000 0 0x03feefff>;
+        vdd10-supply = <&ldo6_reg>;
+        vdd18-supply = <&ldo7_reg>;
+        interrupt-map-mask = <0 0 0 0>;
+        interrupt-map = <0 0 0 0 &gic GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>;
+    };
+...
-- 
2.49.0


