Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE81CFC28C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 16:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3wYeT/h/1x9MvlSpVGuLkmVdHMW20C6ijQ2jijWX0wk=; b=WkRa43WbPSqEb8Qe9Z7jBu9tMW
	cH3FsE4C04Spmky65ArS+d/zBdfthdAbkfx7TYSfGg+AAuGo6pdQ9hBPscsu6oKarU3q95oV+0oDr
	fYk+fDkxHHtwUwyQdpC7BY82dsGDDLDSnm5mkVnwox6WkIQOIbRM2u1/NLsMMcAwthCg8y1+TvP5O
	xtb/haKHthRgfWl70MFsWU3xKnT4DIuY9sbUhs6IjzeXv8bQrjN2ctnliOivwOwenTVlVTueYFY0K
	p/Nq8QDELfBsUUsl3mAzHAOahAA5lbdBNobVTq+39zgZuRibIqa+9wKlRaI9IxYjGegKtluEzd4ol
	6mLo6JXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUKB-00000008kWo-1abk;
	Fri, 21 Nov 2025 16:49:31 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUK5-00000008kUD-0Uv9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 16:49:26 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so8531535e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 08:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763743763; x=1764348563; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wYeT/h/1x9MvlSpVGuLkmVdHMW20C6ijQ2jijWX0wk=;
        b=AZZkQlMyE6lYrAq3oAm8UGYst/c1uMk7v/v37WPfO7baJeg/fQwT2vopBAG8L6Xt42
         cTFaEPl/jsT4UBwc0EirFY2/UhPWv89BJzGbKWWNg2sGV4kfSVEEq3M+SE0q3pgBdLST
         8hsXcx3O99s0+aFIDRn+x05WtuvAT4T989Jt6uIGy+rOgPDhDEEgsielGFt/zhVzhXda
         K7dfk5K2vfk0Y6fSYvxCd1KX2hjyEd5CYgHx9egW7KWlBC2TMEO01gwlUAVulZcDZPyM
         VQEgXpkDjHhtG0Y1u97pIbIVkkjZRkUPyAaEy6ykTleTmTglcmvbbx7XoW29sc/c6ICW
         DRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763743763; x=1764348563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3wYeT/h/1x9MvlSpVGuLkmVdHMW20C6ijQ2jijWX0wk=;
        b=LeY/+S5iROH19kBDhF/yr59+P721jVlzca8JNn0vS+aIc2ZxLhQPqG+nps5qYjlweJ
         QMdKNcArUbUYGXJr46e09YCb+LZiVIccZdlyOlIYQmVhxQH8cctxE2e6ApRGlhWA2bx3
         K1y48cM4Piqg+gacuLsIHrR0N2hghqq9iMdwfp38u3GQTHTpHFR6wOvxOpjUfe6GHqxI
         8j5103Z0PwQfJ0IsnL+OyYY6bI+awgEsIVhQ9MhoE6MWV9NqlWyPgIToHEPWROvEd/Pb
         lpL0AuJ5ZxGByg9UMK5Gm8FJEisFkK2hTnZm1aQ38WJapzAHVGlnQMw55BVAaEI03DHK
         4Rfg==
X-Forwarded-Encrypted: i=1; AJvYcCWR6pW7+0Sirei0ij5cFt0GwrwUTXpV9bNVrQm2DtwaFR1oMoKVW7yopOzeMb73/u5LKCVWejpjCfgwocGYDXO1@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu7QuHm2yQBKcX5zx8CdCQe7dpv7xCgoGceQdCm6BDLy1oh9BH
	ABnA2nsxJXVmLsTVgTYMsvCmGCISH+fRMupMExPyb0Cjs/haNU+w+PJyUsn97ORcvqE=
X-Gm-Gg: ASbGncsqHtvlexy7EmCmX1/BnkSMHTQi6SRL2g9ZABqNzPY9t8uLBDGS8yeLab2Q282
	b3fe/uJNBlou8gFmz9vkDs/AY596R7WFQsYEj5pzlngflO10FAVsRGKW7jplO83AgkP4Jlg4Bs0
	+O1i8TZ/iorKaQaycqS2qvPXDJTl25Chz2+vsYxH4JSnnsbNWzhTJKSXdus12JE+DzU//km0mEc
	288M1bL4IF/JuaV94bWNIzNLCKZIKBn2Xj7W3uplicyzYxrDOetBlt38nCqWSs1JdaUbZEs8W4N
	q9WjAxbaXVlNFcpwc2glQKtW4nfHzY4OrU+TD2zHHsQ2liuJT05Zfkzduo7QI1dxJtpHFYxgCwl
	3ovNukm4gZOXf3XnBVYeWd8U7T6dHdZk15Otc753LtDauee77UDHHS7VZKDrChdnI2kr8EPuU5I
	9ju9kQiyyXOy+/d9l+ac4=
X-Google-Smtp-Source: AGHT+IFTupEu7tQpaQcTp870nPjmfycov+d3eXmWpJglnNMzrHGGv2NoyhiwOnsqNMvhjJuRWF90yg==
X-Received: by 2002:a05:6000:290a:b0:429:d3e9:667 with SMTP id ffacd0b85a97d-42cc1ce47b9mr2775128f8f.18.1763743763176;
        Fri, 21 Nov 2025 08:49:23 -0800 (PST)
Received: from vingu-cube.. ([2a01:e0a:f:6020:803a:ae25:6381:a6fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb8ff3sm12938478f8f.29.2025.11.21.08.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:49:22 -0800 (PST)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: chester62515@gmail.com,
	mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com,
	s32@nxp.com,
	bhelgaas@google.com,
	jingoohan1@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Ionut.Vicovan@nxp.com,
	larisa.grigore@nxp.com,
	Ghennadi.Procopciuc@nxp.com,
	ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com,
	Frank.li@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Cc: cassel@kernel.org
Subject: [PATCH 1/4 v6] dt-bindings: PCI: s32g: Add NXP PCIe controller
Date: Fri, 21 Nov 2025 17:49:17 +0100
Message-ID: <20251121164920.2008569-2-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121164920.2008569-1-vincent.guittot@linaro.org>
References: <20251121164920.2008569-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_084925_184756_5CC0D668 
X-CRM114-Status: GOOD (  13.84  )
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

Describe the PCIe host controller available on the S32G platforms.

Co-developed-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Co-developed-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/pci/nxp,s32g-pcie.yaml           | 130 ++++++++++++++++++
 1 file changed, 130 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml b/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
new file mode 100644
index 000000000000..66a050028278
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/nxp,s32g-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP S32G2xxx/S32G3xxx PCIe Root Complex controller
+
+maintainers:
+  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
+  - Ionut Vicovan <ionut.vicovan@nxp.com>
+
+description:
+  This PCIe controller is based on the Synopsys DesignWare PCIe IP.
+  The S32G SoC family has two PCIe controllers, which can be configured as
+  either Root Complex or Endpoint.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - nxp,s32g2-pcie
+      - items:
+          - const: nxp,s32g3-pcie
+          - const: nxp,s32g2-pcie
+
+  reg:
+    maxItems: 6
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: dbi2
+      - const: atu
+      - const: dma
+      - const: ctrl
+      - const: config
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: msi
+      - const: dma
+    minItems: 1
+
+  pcie@0:
+    description:
+      Describe the S32G Root Port.
+    type: object
+    $ref: /schemas/pci/pci-pci-bridge.yaml#
+
+    properties:
+      reg:
+        maxItems: 1
+
+      phys:
+        maxItems: 1
+
+    required:
+      - reg
+      - phys
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - ranges
+  - pcie@0
+
+allOf:
+  - $ref: /schemas/pci/snps,dw-pcie.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/phy/phy.h>
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie@40400000 {
+            compatible = "nxp,s32g3-pcie", "nxp,s32g2-pcie";
+            reg = <0x00 0x40400000 0x0 0x00001000>,   /* dbi registers */
+                  <0x00 0x40420000 0x0 0x00001000>,   /* dbi2 registers */
+                  <0x00 0x40460000 0x0 0x00001000>,   /* atu registers */
+                  <0x00 0x40470000 0x0 0x00001000>,   /* dma registers */
+                  <0x00 0x40481000 0x0 0x000000f8>,   /* ctrl registers */
+                  <0x5f 0xffffe000 0x0 0x00002000>;   /* config space */
+            reg-names = "dbi", "dbi2", "atu", "dma", "ctrl", "config";
+            dma-coherent;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            device_type = "pci";
+            ranges =
+                     <0x01000000 0x0 0x00000000 0x5f 0xfffe0000 0x0 0x00010000>,
+                     <0x02000000 0x0 0x00000000 0x58 0x00000000 0x0 0x80000000>,
+                     <0x02000000 0x1 0x00000000 0x59 0x00000000 0x6 0xfffe0000>;
+
+            bus-range = <0x0 0xff>;
+            interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "msi", "dma";
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 0x7>;
+            interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+                            <0 0 0 2 &gic 0 0 GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+                            <0 0 0 3 &gic 0 0 GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+                            <0 0 0 4 &gic 0 0 GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
+
+            pcie@0 {
+                reg = <0x0 0x0 0x0 0x0 0x0>;
+                #address-cells = <3>;
+                #size-cells = <2>;
+                ranges;
+
+                device_type = "pci";
+                phys = <&serdes0 PHY_TYPE_PCIE 0 0>;
+            };
+        };
+    };
-- 
2.43.0


