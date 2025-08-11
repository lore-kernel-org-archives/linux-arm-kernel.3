Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17B5CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 05:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S54LpcLjSITXFL38Nc1C+zVT40bjsTQzlIyqclkPzVo=; b=TJF3z0yVs+helQph7lTc/Q2lSt
	bxKfB0uegkkNf8xD4v9lodkARQzKcs0RhzJWwCh2Sbg+pyyvd0mvHe11mlFtPBmRbFkJWQIAvSgOY
	smwtql/4bOOR/uSWr2Bwzn8K4b/3pVJXS2VfpABG9K/9K79nqr8e2it9ZO11zPZW31Zk6LWQZ8XdD
	vjJA2W/h0K30uNv7rnNpIdNBppFhKe7NzE4tOX84HHi05NXaOf0Idgv+U3n5LEPzA8o37xU+XP4nC
	zl1sTg+29q4C1cKv5Vobmk6gnEstWQPvLTzsgUxWdsNSmJXW4wMn1sU6LiBchuQfYYUCWi+PvmPIz
	yrur3DYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhUC-00000009sDc-1mAB;
	Tue, 12 Aug 2025 05:23:49 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulh9W-00000009pZA-2zS5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 05:02:28 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250812050225epoutp036ed91d71463c6902bd446f0ea80f10b5~a7GoOCa180122601226epoutp03F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 05:02:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250812050225epoutp036ed91d71463c6902bd446f0ea80f10b5~a7GoOCa180122601226epoutp03F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754974945;
	bh=S54LpcLjSITXFL38Nc1C+zVT40bjsTQzlIyqclkPzVo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JeTPDnYuQFKjUOTf8Qf/JgacAWkUrVaPAAmH0gatq5vLSDCszPks4Do5/rniN7fB9
	 yZBekS8tCKsz8fV8oRIwvUOdA1wrRX3vrHkKhZyZ64XDj35FqGHw15Zu453CsrZriX
	 0LPAoRJHEgU+4LKVWr0O92l/CL0yN3YU1dgHYoB4=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250812050224epcas5p4e05b55a5f45f116cf966dc700093eba8~a7GnpBriA0263302633epcas5p4v;
	Tue, 12 Aug 2025 05:02:24 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.95]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c1KB72z6Rz2SSKp; Tue, 12 Aug
	2025 05:02:23 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250811154725epcas5p428fa3370a32bc2b664a4fd8260078097~awQg8dEdu2612226122epcas5p4y;
	Mon, 11 Aug 2025 15:47:25 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250811154723epsmtip1209187009cea317303c81d1a099486b6~awQeURXHq2560925609epsmtip1Q;
	Mon, 11 Aug 2025 15:47:22 +0000 (GMT)
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
Subject: [PATCH v3 07/12] dt-bindings: PCI: Add support for Tesla FSD SoC
Date: Mon, 11 Aug 2025 21:16:33 +0530
Message-ID: <20250811154638.95732-8-shradha.t@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250811154638.95732-1-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250811154725epcas5p428fa3370a32bc2b664a4fd8260078097
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250811154725epcas5p428fa3370a32bc2b664a4fd8260078097
References: <20250811154638.95732-1-shradha.t@samsung.com>
	<CGME20250811154725epcas5p428fa3370a32bc2b664a4fd8260078097@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_220227_110764_63EF8C08 
X-CRM114-Status: GOOD (  16.38  )
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

Add Tesla FSD SoC support for both RC and EP.

Signed-off-by: Shradha Todi <shradha.t@samsung.com>
---
 .../bindings/pci/tesla,fsd-pcie-ep.yaml       | 91 +++++++++++++++++++
 .../bindings/pci/tesla,fsd-pcie.yaml          | 77 ++++++++++++++++
 2 files changed, 168 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/tesla,fsd-pcie-ep.yaml
 create mode 100644 Documentation/devicetree/bindings/pci/tesla,fsd-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/tesla,fsd-pcie-ep.yaml b/Documentation/devicetree/bindings/pci/tesla,fsd-pcie-ep.yaml
new file mode 100644
index 000000000000..8dfe0720e6ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/tesla,fsd-pcie-ep.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/tesla,fsd-pcie-ep.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tesla FSD SoC series PCIe Endpoint Controller
+
+maintainers:
+  - Shradha Todi <shradha.t@samsung.com>
+
+description:
+  Tesla FSD SoCs PCIe endpoint controller is based on the Synopsys DesignWare
+  PCIe IP and thus inherits all the common properties defined in
+  snps,dw-pcie-ep.yaml
+
+allOf:
+  - $ref: /schemas/pci/snps,dw-pcie-ep.yaml#
+
+properties:
+  compatible:
+    const: tesla,fsd-pcie-ep
+
+  reg:
+    maxItems: 4
+
+  reg-names:
+    items:
+      - const: elbi
+      - const: dbi
+      - const: dbi2
+      - const: addr_space
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: aux
+      - const: dbi
+      - const: mstr
+      - const: slv
+
+  num-lanes:
+    maximum: 4
+
+  phys:
+    maxItems: 1
+
+  samsung,syscon-pcie:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: phandle for system control registers, used to
+                 control signals at system level
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - num-lanes
+  - phys
+  - samsung,syscon-pcie
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/fsd-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        pcieep0: pcie-ep@16a00000 {
+            compatible = "tesla,fsd-pcie-ep";
+            reg = <0x0 0x168b0000 0x0 0x1000>,
+                  <0x0 0x16a00000 0x0 0x2000>,
+                  <0x0 0x16a01000 0x0 0x80>,
+                  <0x0 0x17000000 0x0 0xff0000>;
+            reg-names = "elbi", "dbi", "dbi2", "addr_space";
+            clocks = <&clock_fsys1 PCIE_LINK0_IPCLKPORT_AUX_ACLK>,
+                     <&clock_fsys1 PCIE_LINK0_IPCLKPORT_DBI_ACLK>,
+                     <&clock_fsys1 PCIE_LINK0_IPCLKPORT_MSTR_ACLK>,
+                     <&clock_fsys1 PCIE_LINK0_IPCLKPORT_SLV_ACLK>;
+            clock-names = "aux", "dbi", "mstr", "slv";
+            num-lanes = <4>;
+            phys = <&pciephy1>;
+            samsung,syscon-pcie = <&sysreg_fsys1 0x50c>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/pci/tesla,fsd-pcie.yaml b/Documentation/devicetree/bindings/pci/tesla,fsd-pcie.yaml
new file mode 100644
index 000000000000..533870ab1d73
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/tesla,fsd-pcie.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/tesla,fsd-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tesla FSD SoC series PCIe Host Controller
+
+maintainers:
+  - Shradha Todi <shradha.t@samsung.com>
+
+description:
+  Tesla FSD SoCs PCIe host controller inherits all the common
+  properties defined in samsung,exynos-pcie.yaml
+
+allOf:
+  - $ref: /schemas/pci/samsung,exynos-pcie.yaml#
+
+properties:
+  compatible:
+    const: tesla,fsd-pcie
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: aux
+      - const: dbi
+      - const: mstr
+      - const: slv
+
+  num-lanes:
+    maximum: 4
+
+  samsung,syscon-pcie:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: phandle for system control registers, used to
+                 control signals at system level
+
+required:
+  - samsung,syscon-pcie
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/fsd-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcierc1: pcie@16b00000 {
+            compatible = "tesla,fsd-pcie";
+            reg = <0x0 0x16b00000 0x0 0x2000>,
+                  <0x0 0x168c0000 0x0 0x1000>,
+                  <0x0 0x18000000 0x0 0x1000>;
+            reg-names = "dbi", "elbi", "config";
+            ranges =  <0x82000000 0x0 0x18001000 0x0 0x18001000 0x0 0xffefff>;
+            clocks = <&clock_fsys1 PCIE_LINK1_IPCLKPORT_AUX_ACLK>,
+                     <&clock_fsys1 PCIE_LINK1_IPCLKPORT_DBI_ACLK>,
+                     <&clock_fsys1 PCIE_LINK1_IPCLKPORT_MSTR_ACLK>,
+                     <&clock_fsys1 PCIE_LINK1_IPCLKPORT_SLV_ACLK>;
+            clock-names = "aux", "dbi", "mstr", "slv";
+            #address-cells = <3>;
+            #size-cells = <2>;
+            dma-coherent;
+            device_type = "pci";
+            interrupts = <GIC_SPI 117 IRQ_TYPE_EDGE_RISING>;
+            num-lanes = <4>;
+            phys = <&pciephy1>;
+            samsung,syscon-pcie = <&sysreg_fsys1 0x510>;
+        };
+    };
+...
-- 
2.49.0


