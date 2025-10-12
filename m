Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E63ECCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 20:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hYSFvNXJ1OxOrTIGf+Idmx9ir1vilL2ggeDDXDhQi4w=; b=i15/mBOYEO6GyHe8gHha6pIRO4
	IPCTIjJj1dEdD/dk2OlkUqyZIbSVzi1VDktx7KKJqDroLpfh7jHpCbOx3Lbhm1ZgGx7JSR+Z3ypO3
	eda07ZLsPudGXUUXDAYDkufVaTAlGz5Q3Y/REKTMoYOAO31t3XOpZIdonJ70fM20iXR2DwNDtjjb1
	HDeBLXb7Wx5fGrt4v48qaqdLGDAnwmmrNKqmHDz3+BPqSumc2KXlf9JcohYq869Ei5TYGbKeIPHHH
	WISwBeeL4eOuz6KHUjRvh8Udqsad87qtpVNB6fA2/yxvfiA9Kk7NAXmT59rn8pCx68g391uzxSE2i
	B1cNsjcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v839v-0000000BlUA-0KBH;
	Sun, 12 Oct 2025 20:59:15 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v839s-0000000BlRO-1J6W
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 20:59:13 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-4060b4b1200so2363986f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 13:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760302751; x=1760907551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hYSFvNXJ1OxOrTIGf+Idmx9ir1vilL2ggeDDXDhQi4w=;
        b=AwdJcV2Yi0AojBdY7bXxsfwVkohtlVvctSCOljfT0+trUCJdZqHe12miCvM6Vngsip
         H5aBqIjNEZxaqbICBcnnUBsvvq/kObTDibpWSIlAUazkAInpB1SiB/e7P+qUBvDKzGNg
         3l7ITahrFAegKMO7pmodjKmnKLMWKobSg4LNyqszuvJh+QJpYY+QaOdqyQIWp5j1N8Y/
         DLMeLtujuU1UZPPCegkaMMB5PfyT2CQnH4/yishSZdjuTG1ToEQv6+/c9hlBChJaKGq+
         lZgte9r5dN4t60+2+N5eEIkqUGzIfe38zXZw89TNGROApx6T+16utehixRg/Gj98aV9K
         RAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760302751; x=1760907551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYSFvNXJ1OxOrTIGf+Idmx9ir1vilL2ggeDDXDhQi4w=;
        b=i9teLNo5cn6DrrNCaMPBpGxHx0jZCTpr1YtAI9lYCYIn4z/pC2IgMicwp5QLl59OU0
         ic6rWBDq765fvc6XHnmISLBjmTrn9+dZbojmtuUE+BkuELI4rlf+U4FDDayYJ8HfFDeF
         m3pUTKzzqoLWpSZEWV2esYSjqjNlzehr25zAmrHfrHs8IEnAEpLJvQIlRaJ2a7M2i0NZ
         LWfJy0hX2bNtqQqJPpKTYklzZDyjqLb1MLHyNmjaY4Zw01U1Sg5NKiq1fyEnH6cv3WGz
         X3Ki+NszAJKdSK9W2VdBhAMKKca0xR0RLzKHbiLIDh8ZNK2vdpc3q5pZSb3aoxINpg69
         vMGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqNPcrxwDaEQLefDkVWi0h4sF6MYNzB3NsPTBRFlJWeQVdWRn9FB3rewtZEbffctwLhzrBXh9mzJNgFA7e5PDn@lists.infradead.org
X-Gm-Message-State: AOJu0YxubRaUt1vkppjrjR9JDuUj9AYRtUE7fHWLECleJOtbqxai5n0D
	H3KHTumjsdh3qYSueCbfTMLVRGTWLmIekyJ0hvr9DsnYyRxdGpX9HLPO
X-Gm-Gg: ASbGncv33XMCdmmJgyyIvUWmAG10TGBp50wyNmCSzwJ8pQRHZlcUUwB8/Tp6W8EwYq/
	Vi5ENo5SL3ANoYc3spvT0aV7ZJ/3FOmI/b25aQlihBt3E25uUcvkHlqhB1MTnTsUfwdt5Fe6E/R
	G/LkzgEqh/k7vkp2x8Lc9uDLrU/rXUJ+2CCQmh5gBFH3EBW4nC2qSp7jwA1UXl2d2N+8l8rVtJ8
	+K9mGGo7JEbH9FFYvrBuhrVCUb+SswPBlwx/qfcDgrJl9cWdMyW0ua94pfp1U5/TGkpxG9+FZ3d
	yH+CffdGXxmPPC80UNkXZfxqGcuz9KmGaGSczaoY+J4iPkWrHUQZiMpzfBJ9BA7aYswi1XcTGbJ
	beWdO3PfsyJ3WU7E0YiFeLsMYCMSA9n7VUBg9KJZJPbbrsj0knpi/z7oOyogf3xoLNSv3B1qH5g
	==
X-Google-Smtp-Source: AGHT+IE/qZWuIeVOHVAdAPSs/X8s3cxy5ODj4035FEzP+gG24WTSi9JYBid4P2voLoXMQ7ZLoZm0MA==
X-Received: by 2002:a05:600c:1990:b0:46e:1b89:77f1 with SMTP id 5b1f17b1804b1-46fa9aa1c74mr120521345e9.9.1760302750399;
        Sun, 12 Oct 2025 13:59:10 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-92-177.ip49.fastwebnet.it. [93.34.92.177])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46fb489197dsm156506505e9.10.2025.10.12.13.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 13:59:10 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com
Subject: [PATCH v5 2/5] dt-bindings: PCI: mediatek: Convert to YAML schema
Date: Sun, 12 Oct 2025 22:56:56 +0200
Message-ID: <20251012205900.5948-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012205900.5948-1-ansuelsmth@gmail.com>
References: <20251012205900.5948-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_135912_542374_91D654E0 
X-CRM114-Status: GOOD (  23.38  )
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

Convert the PCI mediatek Documentation to YAML schema to enable
validation of the supported GEN1/2 Mediatek PCIe controller.

While converting, lots of cleanup were done from the .txt with better
specifying what is supported by the various PCIe controller variant and
drop of redundant info that are part of the standard PCIe Host Bridge
schema.

To reduce schema complexity the .txt is split in 2 YAML, one for
mt7623/mt2701 and the other for every other compatible.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/pci/mediatek-pcie-mt7623.yaml    | 164 +++++++++
 .../devicetree/bindings/pci/mediatek-pcie.txt | 289 ----------------
 .../bindings/pci/mediatek-pcie.yaml           | 318 ++++++++++++++++++
 3 files changed, 482 insertions(+), 289 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-mt7623.yaml
 delete mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie.txt
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-mt7623.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-mt7623.yaml
new file mode 100644
index 000000000000..e33bcc216e30
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-mt7623.yaml
@@ -0,0 +1,164 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/mediatek-pcie-mt7623.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PCIe controller on MediaTek SoCs
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt2701-pcie
+      - mediatek,mt7623-pcie
+
+  reg:
+    minItems: 4
+    maxItems: 4
+
+  reg-names:
+    items:
+      - const: subsys
+      - const: port0
+      - const: port1
+      - const: port2
+
+  clocks:
+    minItems: 4
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: free_ck
+      - const: sys_ck0
+      - const: sys_ck1
+      - const: sys_ck2
+
+  resets:
+    minItems: 3
+    maxItems: 3
+
+  reset-names:
+    items:
+      - const: pcie-rst0
+      - const: pcie-rst1
+      - const: pcie-rst2
+
+  phys:
+    minItems: 3
+    maxItems: 3
+
+  phy-names:
+    items:
+      - const: pcie-phy0
+      - const: pcie-phy1
+      - const: pcie-phy2
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - ranges
+  - clocks
+  - clock-names
+  - '#interrupt-cells'
+  - resets
+  - reset-names
+  - phys
+  - phy-names
+  - power-domains
+  - pcie@0,0
+  - pcie@1,0
+  - pcie@2,0
+
+allOf:
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  # MT7623
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/mt2701-clk.h>
+    #include <dt-bindings/reset/mt2701-resets.h>
+    #include <dt-bindings/phy/phy.h>
+    #include <dt-bindings/power/mt2701-power.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie@1a140000 {
+            compatible = "mediatek,mt7623-pcie";
+            device_type = "pci";
+            reg = <0 0x1a140000 0 0x1000>, /* PCIe shared registers */
+                  <0 0x1a142000 0 0x1000>, /* Port0 registers */
+                  <0 0x1a143000 0 0x1000>, /* Port1 registers */
+                  <0 0x1a144000 0 0x1000>; /* Port2 registers */
+            reg-names = "subsys", "port0", "port1", "port2";
+            #address-cells = <3>;
+            #size-cells = <2>;
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0xf800 0 0 0>;
+            interrupt-map = <0x0000 0 0 0 &sysirq GIC_SPI 193 IRQ_TYPE_LEVEL_LOW>,
+                            <0x0800 0 0 0 &sysirq GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>,
+                            <0x1000 0 0 0 &sysirq GIC_SPI 195 IRQ_TYPE_LEVEL_LOW>;
+            clocks = <&topckgen CLK_TOP_ETHIF_SEL>,
+                    <&hifsys CLK_HIFSYS_PCIE0>,
+                    <&hifsys CLK_HIFSYS_PCIE1>,
+                    <&hifsys CLK_HIFSYS_PCIE2>;
+            clock-names = "free_ck", "sys_ck0", "sys_ck1", "sys_ck2";
+            resets = <&hifsys MT2701_HIFSYS_PCIE0_RST>,
+                     <&hifsys MT2701_HIFSYS_PCIE1_RST>,
+                     <&hifsys MT2701_HIFSYS_PCIE2_RST>;
+            reset-names = "pcie-rst0", "pcie-rst1", "pcie-rst2";
+            phys = <&pcie0_phy PHY_TYPE_PCIE>, <&pcie1_phy PHY_TYPE_PCIE>,
+                   <&pcie2_phy PHY_TYPE_PCIE>;
+            phy-names = "pcie-phy0", "pcie-phy1", "pcie-phy2";
+            power-domains = <&scpsys MT2701_POWER_DOMAIN_HIF>;
+            bus-range = <0x00 0xff>;
+            ranges = <0x81000000 0 0x1a160000 0 0x1a160000 0 0x00010000>,	/* I/O space */
+                     <0x83000000 0 0x60000000 0 0x60000000 0 0x10000000>;	/* memory space */
+
+            pcie@0,0 {
+                device_type = "pci";
+                reg = <0x0000 0 0 0 0>;
+                #address-cells = <3>;
+                #size-cells = <2>;
+                #interrupt-cells = <1>;
+                interrupt-map-mask = <0 0 0 0>;
+                interrupt-map = <0 0 0 0 &sysirq GIC_SPI 193 IRQ_TYPE_LEVEL_LOW>;
+                ranges;
+            };
+
+            pcie@1,0 {
+                device_type = "pci";
+                reg = <0x0800 0 0 0 0>;
+                #address-cells = <3>;
+                #size-cells = <2>;
+                #interrupt-cells = <1>;
+                interrupt-map-mask = <0 0 0 0>;
+                interrupt-map = <0 0 0 0 &sysirq GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
+                ranges;
+            };
+
+            pcie@2,0 {
+                device_type = "pci";
+                reg = <0x1000 0 0 0 0>;
+                #address-cells = <3>;
+                #size-cells = <2>;
+                #interrupt-cells = <1>;
+                interrupt-map-mask = <0 0 0 0>;
+                interrupt-map = <0 0 0 0 &sysirq GIC_SPI 195 IRQ_TYPE_LEVEL_LOW>;
+                ranges;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie.txt b/Documentation/devicetree/bindings/pci/mediatek-pcie.txt
deleted file mode 100644
index 684227522267..000000000000
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie.txt
+++ /dev/null
@@ -1,289 +0,0 @@
-MediaTek Gen2 PCIe controller
-
-Required properties:
-- compatible: Should contain one of the following strings:
-	"mediatek,mt2701-pcie"
-	"mediatek,mt2712-pcie"
-	"mediatek,mt7622-pcie"
-	"mediatek,mt7623-pcie"
-	"mediatek,mt7629-pcie"
-	"airoha,en7523-pcie"
-- device_type: Must be "pci"
-- reg: Base addresses and lengths of the root ports.
-- reg-names: Names of the above areas to use during resource lookup.
-- #address-cells: Address representation for root ports (must be 3)
-- #size-cells: Size representation for root ports (must be 2)
-- clocks: Must contain an entry for each entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names:
-  Mandatory entries:
-   - sys_ckN :transaction layer and data link layer clock
-  Required entries for MT2701/MT7623:
-   - free_ck :for reference clock of PCIe subsys
-  Required entries for MT2712/MT7622:
-   - ahb_ckN :AHB slave interface operating clock for CSR access and RC
-	      initiated MMIO access
-  Required entries for MT7622:
-   - axi_ckN :application layer MMIO channel operating clock
-   - aux_ckN :pe2_mac_bridge and pe2_mac_core operating clock when
-	      pcie_mac_ck/pcie_pipe_ck is turned off
-   - obff_ckN :OBFF functional block operating clock
-   - pipe_ckN :LTSSM and PHY/MAC layer operating clock
-  where N starting from 0 to one less than the number of root ports.
-- phys: List of PHY specifiers (used by generic PHY framework).
-- phy-names : Must be "pcie-phy0", "pcie-phy1", "pcie-phyN".. based on the
-  number of PHYs as specified in *phys* property.
-- power-domains: A phandle and power domain specifier pair to the power domain
-  which is responsible for collapsing and restoring power to the peripheral.
-- bus-range: Range of bus numbers associated with this controller.
-- ranges: Ranges for the PCI memory and I/O regions.
-
-Required properties for MT7623/MT2701:
-- #interrupt-cells: Size representation for interrupts (must be 1)
-- interrupt-map-mask and interrupt-map: Standard PCI IRQ mapping properties
-  Please refer to the standard PCI bus binding document for a more detailed
-  explanation.
-- resets: Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names: Must be "pcie-rst0", "pcie-rst1", "pcie-rstN".. based on the
-  number of root ports.
-
-Required properties for MT2712/MT7622/MT7629:
--interrupts: A list of interrupt outputs of the controller, must have one
-	     entry for each PCIe port
-- interrupt-names: Must include the following entries:
-	- "pcie_irq": The interrupt that is asserted when an MSI/INTX is received
-- linux,pci-domain: PCI domain ID. Should be unique for each host controller
-
-In addition, the device tree node must have sub-nodes describing each
-PCIe port interface, having the following mandatory properties:
-
-Required properties:
-- device_type: Must be "pci"
-- reg: Only the first four bytes are used to refer to the correct bus number
-  and device number.
-- #address-cells: Must be 3
-- #size-cells: Must be 2
-- #interrupt-cells: Must be 1
-- interrupt-map-mask and interrupt-map: Standard PCI IRQ mapping properties
-  Please refer to the standard PCI bus binding document for a more detailed
-  explanation.
-- ranges: Sub-ranges distributed from the PCIe controller node. An empty
-  property is sufficient.
-
-Examples for MT7623:
-
-	hifsys: syscon@1a000000 {
-		compatible = "mediatek,mt7623-hifsys",
-			     "mediatek,mt2701-hifsys",
-			     "syscon";
-		reg = <0 0x1a000000 0 0x1000>;
-		#clock-cells = <1>;
-		#reset-cells = <1>;
-	};
-
-	pcie: pcie@1a140000 {
-		compatible = "mediatek,mt7623-pcie";
-		device_type = "pci";
-		reg = <0 0x1a140000 0 0x1000>, /* PCIe shared registers */
-		      <0 0x1a142000 0 0x1000>, /* Port0 registers */
-		      <0 0x1a143000 0 0x1000>, /* Port1 registers */
-		      <0 0x1a144000 0 0x1000>; /* Port2 registers */
-		reg-names = "subsys", "port0", "port1", "port2";
-		#address-cells = <3>;
-		#size-cells = <2>;
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0xf800 0 0 0>;
-		interrupt-map = <0x0000 0 0 0 &sysirq GIC_SPI 193 IRQ_TYPE_LEVEL_LOW>,
-				<0x0800 0 0 0 &sysirq GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>,
-				<0x1000 0 0 0 &sysirq GIC_SPI 195 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&topckgen CLK_TOP_ETHIF_SEL>,
-			 <&hifsys CLK_HIFSYS_PCIE0>,
-			 <&hifsys CLK_HIFSYS_PCIE1>,
-			 <&hifsys CLK_HIFSYS_PCIE2>;
-		clock-names = "free_ck", "sys_ck0", "sys_ck1", "sys_ck2";
-		resets = <&hifsys MT2701_HIFSYS_PCIE0_RST>,
-			 <&hifsys MT2701_HIFSYS_PCIE1_RST>,
-			 <&hifsys MT2701_HIFSYS_PCIE2_RST>;
-		reset-names = "pcie-rst0", "pcie-rst1", "pcie-rst2";
-		phys = <&pcie0_phy PHY_TYPE_PCIE>, <&pcie1_phy PHY_TYPE_PCIE>,
-		       <&pcie2_phy PHY_TYPE_PCIE>;
-		phy-names = "pcie-phy0", "pcie-phy1", "pcie-phy2";
-		power-domains = <&scpsys MT2701_POWER_DOMAIN_HIF>;
-		bus-range = <0x00 0xff>;
-		ranges = <0x81000000 0 0x1a160000 0 0x1a160000 0 0x00010000	/* I/O space */
-			  0x83000000 0 0x60000000 0 0x60000000 0 0x10000000>;	/* memory space */
-
-		pcie@0,0 {
-			reg = <0x0000 0 0 0 0>;
-			#address-cells = <3>;
-			#size-cells = <2>;
-			#interrupt-cells = <1>;
-			interrupt-map-mask = <0 0 0 0>;
-			interrupt-map = <0 0 0 0 &sysirq GIC_SPI 193 IRQ_TYPE_LEVEL_LOW>;
-			ranges;
-		};
-
-		pcie@1,0 {
-			reg = <0x0800 0 0 0 0>;
-			#address-cells = <3>;
-			#size-cells = <2>;
-			#interrupt-cells = <1>;
-			interrupt-map-mask = <0 0 0 0>;
-			interrupt-map = <0 0 0 0 &sysirq GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
-			ranges;
-		};
-
-		pcie@2,0 {
-			reg = <0x1000 0 0 0 0>;
-			#address-cells = <3>;
-			#size-cells = <2>;
-			#interrupt-cells = <1>;
-			interrupt-map-mask = <0 0 0 0>;
-			interrupt-map = <0 0 0 0 &sysirq GIC_SPI 195 IRQ_TYPE_LEVEL_LOW>;
-			ranges;
-		};
-	};
-
-Examples for MT2712:
-
-	pcie1: pcie@112ff000 {
-		compatible = "mediatek,mt2712-pcie";
-		device_type = "pci";
-		reg = <0 0x112ff000 0 0x1000>;
-		reg-names = "port1";
-		linux,pci-domain = <1>;
-		#address-cells = <3>;
-		#size-cells = <2>;
-		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "pcie_irq";
-		clocks = <&topckgen CLK_TOP_PE2_MAC_P1_SEL>,
-			 <&pericfg CLK_PERI_PCIE1>;
-		clock-names = "sys_ck1", "ahb_ck1";
-		phys = <&u3port1 PHY_TYPE_PCIE>;
-		phy-names = "pcie-phy1";
-		bus-range = <0x00 0xff>;
-		ranges = <0x82000000 0 0x11400000  0x0 0x11400000  0 0x300000>;
-		status = "disabled";
-
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0 0 0 7>;
-		interrupt-map = <0 0 0 1 &pcie_intc1 0>,
-				<0 0 0 2 &pcie_intc1 1>,
-				<0 0 0 3 &pcie_intc1 2>,
-				<0 0 0 4 &pcie_intc1 3>;
-		pcie_intc1: interrupt-controller {
-			interrupt-controller;
-			#address-cells = <0>;
-			#interrupt-cells = <1>;
-		};
-	};
-
-	pcie0: pcie@11700000 {
-		compatible = "mediatek,mt2712-pcie";
-		device_type = "pci";
-		reg = <0 0x11700000 0 0x1000>;
-		reg-names = "port0";
-		linux,pci-domain = <0>;
-		#address-cells = <3>;
-		#size-cells = <2>;
-		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "pcie_irq";
-		clocks = <&topckgen CLK_TOP_PE2_MAC_P0_SEL>,
-			 <&pericfg CLK_PERI_PCIE0>;
-		clock-names = "sys_ck0", "ahb_ck0";
-		phys = <&u3port0 PHY_TYPE_PCIE>;
-		phy-names = "pcie-phy0";
-		bus-range = <0x00 0xff>;
-		ranges = <0x82000000 0 0x20000000 0x0 0x20000000 0 0x10000000>;
-		status = "disabled";
-
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0 0 0 7>;
-		interrupt-map = <0 0 0 1 &pcie_intc0 0>,
-				<0 0 0 2 &pcie_intc0 1>,
-				<0 0 0 3 &pcie_intc0 2>,
-				<0 0 0 4 &pcie_intc0 3>;
-		pcie_intc0: interrupt-controller {
-			interrupt-controller;
-			#address-cells = <0>;
-			#interrupt-cells = <1>;
-		};
-	};
-
-Examples for MT7622:
-
-	pcie0: pcie@1a143000 {
-		compatible = "mediatek,mt7622-pcie";
-		device_type = "pci";
-		reg = <0 0x1a143000 0 0x1000>;
-		reg-names = "port0";
-		linux,pci-domain = <0>;
-		#address-cells = <3>;
-		#size-cells = <2>;
-		interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_LOW>;
-		interrupt-names = "pcie_irq";
-		clocks = <&pciesys CLK_PCIE_P0_MAC_EN>,
-			 <&pciesys CLK_PCIE_P0_AHB_EN>,
-			 <&pciesys CLK_PCIE_P0_AUX_EN>,
-			 <&pciesys CLK_PCIE_P0_AXI_EN>,
-			 <&pciesys CLK_PCIE_P0_OBFF_EN>,
-			 <&pciesys CLK_PCIE_P0_PIPE_EN>;
-		clock-names = "sys_ck0", "ahb_ck0", "aux_ck0",
-			      "axi_ck0", "obff_ck0", "pipe_ck0";
-
-		power-domains = <&scpsys MT7622_POWER_DOMAIN_HIF0>;
-		bus-range = <0x00 0xff>;
-		ranges = <0x82000000 0 0x20000000  0x0 0x20000000  0 0x8000000>;
-		status = "disabled";
-
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0 0 0 7>;
-		interrupt-map = <0 0 0 1 &pcie_intc0 0>,
-				<0 0 0 2 &pcie_intc0 1>,
-				<0 0 0 3 &pcie_intc0 2>,
-				<0 0 0 4 &pcie_intc0 3>;
-		pcie_intc0: interrupt-controller {
-			interrupt-controller;
-			#address-cells = <0>;
-			#interrupt-cells = <1>;
-		};
-	};
-
-	pcie1: pcie@1a145000 {
-		compatible = "mediatek,mt7622-pcie";
-		device_type = "pci";
-		reg = <0 0x1a145000 0 0x1000>;
-		reg-names = "port1";
-		linux,pci-domain = <1>;
-		#address-cells = <3>;
-		#size-cells = <2>;
-		interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_LOW>;
-		interrupt-names = "pcie_irq";
-		clocks = <&pciesys CLK_PCIE_P1_MAC_EN>,
-			 /* designer has connect RC1 with p0_ahb clock */
-			 <&pciesys CLK_PCIE_P0_AHB_EN>,
-			 <&pciesys CLK_PCIE_P1_AUX_EN>,
-			 <&pciesys CLK_PCIE_P1_AXI_EN>,
-			 <&pciesys CLK_PCIE_P1_OBFF_EN>,
-			 <&pciesys CLK_PCIE_P1_PIPE_EN>;
-		clock-names = "sys_ck1", "ahb_ck1", "aux_ck1",
-			      "axi_ck1", "obff_ck1", "pipe_ck1";
-
-		power-domains = <&scpsys MT7622_POWER_DOMAIN_HIF0>;
-		bus-range = <0x00 0xff>;
-		ranges = <0x82000000 0 0x28000000  0x0 0x28000000  0 0x8000000>;
-		status = "disabled";
-
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0 0 0 7>;
-		interrupt-map = <0 0 0 1 &pcie_intc1 0>,
-				<0 0 0 2 &pcie_intc1 1>,
-				<0 0 0 3 &pcie_intc1 2>,
-				<0 0 0 4 &pcie_intc1 3>;
-		pcie_intc1: interrupt-controller {
-			interrupt-controller;
-			#address-cells = <0>;
-			#interrupt-cells = <1>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
new file mode 100644
index 000000000000..fca6cb20d18b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
@@ -0,0 +1,318 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/mediatek-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PCIe controller on MediaTek SoCs
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt2712-pcie
+          - mediatek,mt7622-pcie
+          - mediatek,mt7629-pcie
+      - items:
+          - const: airoha,en7523-pcie
+          - const: mediatek,mt7622-pcie
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    enum: [ port0, port1 ]
+
+  clocks:
+    minItems: 1
+    maxItems: 6
+
+  clock-names:
+    minItems: 1
+    items:
+      - enum: [ sys_ck0, sys_ck1 ]
+      - enum: [ ahb_ck0, ahb_ck1 ]
+      - enum: [ aux_ck0, aux_ck1 ]
+      - enum: [ axi_ck0, axi_ck1 ]
+      - enum: [ obff_ck0, obff_ck1 ]
+      - enum: [ pipe_ck0, pipe_ck1 ]
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: pcie_irq
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    enum: [ pcie-phy0, pcie-phy1 ]
+
+  power-domains:
+    maxItems: 1
+
+  '#interrupt-cells':
+    const: 1
+
+  interrupt-controller:
+    description: Interrupt controller node for handling legacy PCI interrupts.
+    type: object
+    properties:
+      '#address-cells':
+        const: 0
+      '#interrupt-cells':
+        const: 1
+      interrupt-controller: true
+
+    required:
+      - '#address-cells'
+      - '#interrupt-cells'
+      - interrupt-controller
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - ranges
+  - clocks
+  - clock-names
+  - '#interrupt-cells'
+  - interrupts
+  - interrupt-names
+  - interrupt-controller
+
+allOf:
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
+
+  - if:
+      properties:
+        compatible:
+          const: mediatek,mt2712-pcie
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+
+        clock-names:
+          minItems: 2
+          maxItems: 2
+
+        power-domains: false
+
+      required:
+        - phys
+        - phy-names
+
+  - if:
+      properties:
+        compatible:
+          const: mediatek,mt7622-pcie
+    then:
+      properties:
+        clocks:
+          minItems: 6
+
+        phys: false
+
+        phy-names: false
+
+      required:
+        - power-domains
+
+  - if:
+      properties:
+        compatible:
+          const: mediatek,mt7629-pcie
+    then:
+      properties:
+        clocks:
+          minItems: 6
+
+      required:
+        - power-domains
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: airoha,en7523-pcie
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+
+        clock-names:
+          maxItems: 1
+
+        phys: false
+
+        phy-names: false
+
+        power-domain: false
+
+unevaluatedProperties: false
+
+examples:
+  # MT2712
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/phy/phy.h>
+
+    soc_1 {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie@112ff000 {
+            compatible = "mediatek,mt2712-pcie";
+            device_type = "pci";
+            reg = <0 0x112ff000 0 0x1000>;
+            reg-names = "port1";
+            linux,pci-domain = <1>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "pcie_irq";
+            clocks = <&topckgen>, /* CLK_TOP_PE2_MAC_P1_SEL */
+                     <&pericfg>; /* CLK_PERI_PCIE1 */
+            clock-names = "sys_ck1", "ahb_ck1";
+            phys = <&u3port1 PHY_TYPE_PCIE>;
+            phy-names = "pcie-phy1";
+            bus-range = <0x00 0xff>;
+            ranges = <0x82000000 0 0x11400000  0x0 0x11400000  0 0x300000>;
+
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 7>;
+            interrupt-map = <0 0 0 1 &pcie_intc1 0>,
+                            <0 0 0 2 &pcie_intc1 1>,
+                            <0 0 0 3 &pcie_intc1 2>,
+                            <0 0 0 4 &pcie_intc1 3>;
+            pcie_intc1: interrupt-controller {
+                interrupt-controller;
+                #address-cells = <0>;
+                #interrupt-cells = <1>;
+            };
+        };
+
+        pcie@11700000 {
+            compatible = "mediatek,mt2712-pcie";
+            device_type = "pci";
+            reg = <0 0x11700000 0 0x1000>;
+            reg-names = "port0";
+            linux,pci-domain = <0>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "pcie_irq";
+            clocks = <&topckgen>, /* CLK_TOP_PE2_MAC_P0_SEL */
+                     <&pericfg>; /* CLK_PERI_PCIE0 */
+            clock-names = "sys_ck0", "ahb_ck0";
+            phys = <&u3port0 PHY_TYPE_PCIE>;
+            phy-names = "pcie-phy0";
+            bus-range = <0x00 0xff>;
+            ranges = <0x82000000 0 0x20000000 0x0 0x20000000 0 0x10000000>;
+
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 7>;
+            interrupt-map = <0 0 0 1 &pcie_intc0 0>,
+                            <0 0 0 2 &pcie_intc0 1>,
+                            <0 0 0 3 &pcie_intc0 2>,
+                            <0 0 0 4 &pcie_intc0 3>;
+            pcie_intc0: interrupt-controller {
+                interrupt-controller;
+                #address-cells = <0>;
+                #interrupt-cells = <1>;
+            };
+        };
+    };
+
+  # MT7622
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mt7622-power.h>
+
+    soc_2 {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie@1a143000 {
+            compatible = "mediatek,mt7622-pcie";
+            device_type = "pci";
+            reg = <0 0x1a143000 0 0x1000>;
+            reg-names = "port0";
+            linux,pci-domain = <0>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-names = "pcie_irq";
+            clocks = <&pciesys>, /* CLK_PCIE_P0_MAC_EN */
+                     <&pciesys>, /* CLK_PCIE_P0_AHB_EN */
+                     <&pciesys>, /* CLK_PCIE_P0_AUX_EN */
+                     <&pciesys>, /* CLK_PCIE_P0_AXI_EN */
+                     <&pciesys>, /* CLK_PCIE_P0_OBFF_EN */
+                     <&pciesys>; /* CLK_PCIE_P0_PIPE_EN */
+            clock-names = "sys_ck0", "ahb_ck0", "aux_ck0",
+                          "axi_ck0", "obff_ck0", "pipe_ck0";
+
+            power-domains = <&scpsys MT7622_POWER_DOMAIN_HIF0>;
+            bus-range = <0x00 0xff>;
+            ranges = <0x82000000 0 0x20000000  0x0 0x20000000  0 0x8000000>;
+
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 7>;
+            interrupt-map = <0 0 0 1 &pcie_intc0_1 0>,
+                            <0 0 0 2 &pcie_intc0_1 1>,
+                            <0 0 0 3 &pcie_intc0_1 2>,
+                            <0 0 0 4 &pcie_intc0_1 3>;
+            pcie_intc0_1: interrupt-controller {
+                interrupt-controller;
+                #address-cells = <0>;
+                #interrupt-cells = <1>;
+            };
+        };
+
+        pcie@1a145000 {
+            compatible = "mediatek,mt7622-pcie";
+            device_type = "pci";
+            reg = <0 0x1a145000 0 0x1000>;
+            reg-names = "port1";
+            linux,pci-domain = <1>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-names = "pcie_irq";
+            clocks = <&pciesys>, /* CLK_PCIE_P1_MAC_EN */
+                     /* designer has connect RC1 with p0_ahb clock */
+                     <&pciesys>, /* CLK_PCIE_P0_AHB_EN */
+                     <&pciesys>, /* CLK_PCIE_P1_AUX_EN */
+                     <&pciesys>, /* CLK_PCIE_P1_AXI_EN */
+                     <&pciesys>, /* CLK_PCIE_P1_OBFF_EN */
+                     <&pciesys>; /* CLK_PCIE_P1_PIPE_EN */
+            clock-names = "sys_ck1", "ahb_ck1", "aux_ck1",
+                          "axi_ck1", "obff_ck1", "pipe_ck1";
+
+            power-domains = <&scpsys MT7622_POWER_DOMAIN_HIF0>;
+            bus-range = <0x00 0xff>;
+            ranges = <0x82000000 0 0x28000000  0x0 0x28000000  0 0x8000000>;
+
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 7>;
+            interrupt-map = <0 0 0 1 &pcie_intc1_1 0>,
+                            <0 0 0 2 &pcie_intc1_1 1>,
+                            <0 0 0 3 &pcie_intc1_1 2>,
+                            <0 0 0 4 &pcie_intc1_1 3>;
+            pcie_intc1_1: interrupt-controller {
+                interrupt-controller;
+                #address-cells = <0>;
+                #interrupt-cells = <1>;
+            };
+        };
+    };
-- 
2.51.0


