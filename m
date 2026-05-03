Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5082FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 08:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cQUqKpseiXlQd/VoS7FXU0gNWFtXot4K0uLQjpjqL98=; b=xALwNTC4YEZzfn/WxT9EE67NrR
	SRRUZuI8I1ydsYBXFdj7FOmtC1Snl1MfAwBIV2se6mK+uGHgr52nARV3R9UBU64HA+2RL2JCD+zro
	VcE49U2GqPsWc8+3yXUeQwPu0RnnCVEZdk58Zsa447n0Jx7U7MtMJvzhtIY1B5TtiDF5c0lXHFHmO
	cvm9nCcllr59ez8NNE4iLXq4xq1C86R50IBNloNti4GpKuFpDXb4VKJmm8kizA048aS58c6ATfhJ+
	ejYvmzdC6xx806+Ql1CwmHlFPb7BIJKyQz/omey+cdysbtl61/AmChF00A1GaBXR/1v36EoTAiDs/
	sljRllLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJSIl-0000000AdrX-0kzL;
	Sun, 03 May 2026 08:35:47 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJSIj-0000000Adqi-0wO7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 May 2026 08:35:46 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-836ebdeb969so21956b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 May 2026 01:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777797344; x=1778402144; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cQUqKpseiXlQd/VoS7FXU0gNWFtXot4K0uLQjpjqL98=;
        b=Nanp2td/WPBsSseHeBcp8RnoG4XwsxMVq6kVPlfALG71vmO0lOya6idpZBOkizw9Fn
         SzAfONy7ubJjMJtobhv39Q1W9LSo6cmpGOS9eTypzwdLrzR8+VLX0v5Nap7hkDu5NONe
         7encKGa4ih72CrjuiYf/xyXGMF7aUSfgqaTRLQHhS71sIlEHXFr1nBEoh65gzVbljaEK
         0Ej2sEQR40oH5XtRqQNVwsjX7I2huz4sOzjaIcwDpMHjiHKeNMiJAeBEgr60EcI06yqg
         tP29bNaD3COm4FBsfQBxVie5D/TVFIwpuv+Z8IxQH+tGynIkKdjFDzHEV9o430rm9/58
         DSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777797344; x=1778402144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cQUqKpseiXlQd/VoS7FXU0gNWFtXot4K0uLQjpjqL98=;
        b=bJlh4VfSiPrZKpW80s9q6Ef1vIew9/uwrq+fGj/NhHIRXQKGk6wVJkUeURSyzHNbFY
         vZuGNCZTdnH3QTC+rHriSlW2HwQrcCK7uRsVLdd4fsWAlbkWnRiz3LHSph4MzY9miPMo
         wXjFcEVkIZw6c5119fpFux7IebMOuUQzMdAuSuXpCWtEHJnS3rVZ1E4mulebWBCmW4U9
         hD1+2lanox+7Ah7m025h8ke0d2ru2ojoEtz5+C5O9feUBzyoh9uR/xgk2LMqlgJ/mSYq
         CL3/WxYZfi4jI+Za8yopuHesAHTesX0BhJFT9EGsLptf+8rFdiBeAU9ZkOjP+4t2P0qk
         tcVg==
X-Forwarded-Encrypted: i=1; AFNElJ+lsLj5/0FLP66NWe3ah9jSgaIC3ML8kiX+znLhk68eyeKXOt8RzWCf3VxhnpJCBj7zKAuCQC93E/p39iTfkyou@lists.infradead.org
X-Gm-Message-State: AOJu0YxGFicrh6lITvcE8EwdXzFSG2K+N+9R93Q65wOFHfZVbFKCpepU
	fH5UCvf1++yf98E0rmbaGE0+0g6bNpmMI5+1lTcOVNo7JZPwA0lQxUKr1D791w==
X-Gm-Gg: AeBDiestwA73XrVIny9l6mJ0VyCitRa+TOdtDdB9Zkj8+qt6AyF8Z2giLBOcjFjhs76
	sUP5NXRUlkD0TeFBdJCbDDWXSgourQCNusumBnqc3W39f49uDi45BnFyEYZnhRX2vW2uBtqbibW
	XjGvKob/qH/ZJRQlXin9Axz08RP1f80m4Fr0H7ZTSZ3Hro+2T0XEnt77KKrds34OXqYlNZCIoOH
	dUnfKuQFDBRmM0q6eZx2yRwggFhd/ZOly+2K7SrN9VJw+tGscR4ji3zzeWo5+FVLoKVfUStMrR1
	L2yMPv1RfRR3GPSvJY6Eu0iO+k7GE8zP1zS/1dByLTcqZ0gTzTiQ/Fxu01ycFWMvHWrZIn5SDps
	EVd+cAotSIyNbSabiWxsclQpH8ny5FeeWZZ8X/3Vhf3F7ML0ygAO2xOmjVGUQl5InvzDVLX67VB
	zDhiRD8YktTDxZaKHt54lWcGkFLeqv3TWPNusTrzvkkI0KiGLOYYdQMJQ=
X-Received: by 2002:a05:6a00:4145:b0:824:3bd9:aac6 with SMTP id d2e1a72fcca58-8352d15f72cmr4706161b3a.16.1777797344272;
        Sun, 03 May 2026 01:35:44 -0700 (PDT)
Received: from Black-Pearl.localdomain ([60.243.224.75])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-835446b1b0asm1578142b3a.8.2026.05.03.01.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 01:35:43 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Sun, 03 May 2026 08:35:30 +0000
Subject: [PATCH v2 2/2] dt-bindings: mmc: st,sdhci: convert to DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260503-st-mmc-v2-2-11ae3216d2ce@gmail.com>
References: <20260503-st-mmc-v2-0-11ae3216d2ce@gmail.com>
In-Reply-To: <20260503-st-mmc-v2-0-11ae3216d2ce@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_013545_282222_B0DDF18D 
X-CRM114-Status: GOOD (  20.78  )
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

Convert STMicroelectronics sdhci-st MMC/SD controller binding to DT schema.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-st.txt | 110 ---------------------
 .../devicetree/bindings/mmc/st,sdhci.yaml          |  93 +++++++++++++++++
 2 files changed, 93 insertions(+), 110 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-st.txt b/Documentation/devicetree/bindings/mmc/sdhci-st.txt
deleted file mode 100644
index ccf82b4ee838..000000000000
--- a/Documentation/devicetree/bindings/mmc/sdhci-st.txt
+++ /dev/null
@@ -1,110 +0,0 @@
-* STMicroelectronics sdhci-st MMC/SD controller
-
-This file documents the differences between the core properties in
-Documentation/devicetree/bindings/mmc/mmc.txt and the properties
-used by the sdhci-st driver.
-
-Required properties:
-- compatible:		Must be "st,sdhci" and it can be compatible to "st,sdhci-stih407"
-			to set the internal glue logic used for configuring the MMC
-			subsystem (mmcss) inside the FlashSS (available in STiH407 SoC
-			family).
-
-- clock-names:		Should be "mmc" and "icn".  (NB: The latter is not compulsory)
-			See: Documentation/devicetree/bindings/resource-names.txt
-- clocks:		Phandle to the clock.
-			See: Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-- interrupts:		One mmc interrupt should be described here.
-- interrupt-names:	Should be "mmcirq".
-
-- pinctrl-names:	A pinctrl state names "default" must be defined.
-- pinctrl-0:		Phandle referencing pin configuration of the sd/emmc controller.
-			See: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
-
-- reg:			This must provide the host controller base address and it can also
-			contain the FlashSS Top register for TX/RX delay used by the driver
-			to configure DLL inside the flashSS, if so reg-names must also be
-			specified.
-
-Optional properties:
-- reg-names:		Should be "mmc" and "top-mmc-delay". "top-mmc-delay" is optional
-			for eMMC on stih407 family silicon to configure DLL inside FlashSS.
-
-- non-removable:	Non-removable slot. Also used for configuring mmcss in STiH407 SoC
-			family.
-			See:  Documentation/devicetree/bindings/mmc/mmc.txt.
-
-- bus-width:		Number of data lines.
-			See:  Documentation/devicetree/bindings/mmc/mmc.txt.
-
-- max-frequency:	Can be 200MHz, 100MHz or 50MHz (default) and used for
-			configuring the CCONFIG3 in the mmcss.
-			See:  Documentation/devicetree/bindings/mmc/mmc.txt.
-
-- resets:		Phandle and reset specifier pair to softreset line of HC IP.
-			See: Documentation/devicetree/bindings/reset/reset.txt
-
-- vqmmc-supply:		Phandle to the regulator dt node, mentioned as the vcc/vdd
-			supply in eMMC/SD specs.
-
-- sd-uhs-sdr50:	To enable the SDR50 in the mmcss.
-			See:  Documentation/devicetree/bindings/mmc/mmc.txt.
-
-- sd-uhs-sdr104:	To enable the SDR104 in the mmcss.
-			See:  Documentation/devicetree/bindings/mmc/mmc.txt.
-
-- sd-uhs-ddr50:		To enable the DDR50 in the mmcss.
-			See:  Documentation/devicetree/bindings/mmc/mmc.txt.
-
-Example:
-
-/* Example stih416e eMMC configuration */
-
-mmc0: sdhci@fe81e000 {
-	compatible	= "st,sdhci";
-	reg		= <0xfe81e000 0x1000>;
-	interrupts	= <GIC_SPI 127 IRQ_TYPE_NONE>;
-	interrupt-names	= "mmcirq";
-	pinctrl-names	= "default";
-	pinctrl-0	= <&pinctrl_mmc0>;
-	clock-names	= "mmc";
-	clocks		= <&clk_s_a1_ls 1>;
-	bus-width	= <8>
-
-/* Example SD stih407 family configuration */
-
-mmc1: sdhci@9080000 {
-	compatible	= "st,sdhci-stih407", "st,sdhci";
-	reg		= <0x09080000 0x7ff>;
-	reg-names	= "mmc";
-	interrupts	= <GIC_SPI 90 IRQ_TYPE_NONE>;
-	interrupt-names	= "mmcirq";
-	pinctrl-names	= "default";
-	pinctrl-0	= <&pinctrl_sd1>;
-	clock-names	= "mmc";
-	clocks		= <&clk_s_c0_flexgen CLK_MMC_1>;
-	resets		= <&softreset STIH407_MMC1_SOFTRESET>;
-	bus-width	= <4>;
-};
-
-/* Example eMMC stih407 family configuration */
-
-mmc0: sdhci@9060000 {
-	compatible	= "st,sdhci-stih407", "st,sdhci";
-	reg		= <0x09060000 0x7ff>, <0x9061008 0x20>;
-	reg-names	= "mmc", "top-mmc-delay";
-	interrupts	= <GIC_SPI 92 IRQ_TYPE_NONE>;
-	interrupt-names	= "mmcirq";
-	pinctrl-names	= "default";
-	pinctrl-0	= <&pinctrl_mmc0>;
-	clock-names	= "mmc";
-	clocks		= <&clk_s_c0_flexgen CLK_MMC_0>;
-	vqmmc-supply	= <&vmmc_reg>;
-	max-frequency	= <200000000>;
-	bus-width	= <8>;
-	non-removable;
-	sd-uhs-sdr50;
-	sd-uhs-sdr104;
-	sd-uhs-ddr50;
-};
diff --git a/Documentation/devicetree/bindings/mmc/st,sdhci.yaml b/Documentation/devicetree/bindings/mmc/st,sdhci.yaml
new file mode 100644
index 000000000000..96edf6d51e6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/st,sdhci.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/st,sdhci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics SDHCI-ST MMC/SD Controller
+
+description:
+  The STMicroelectronics SDHCI-ST MMC/SD host controller, which is
+  compliant with the SD Host Controller Interface (SDHCI) specification and
+  is used to interface with MMC, SD and SDIO cards. The ST SDHCI controller
+  extends the standard SDHCI capabilities with platform-specific
+  configurations such as additional register regions,clock inputs, and delay
+  control mechanisms required for signal timing adjustments which are
+  necessary to support high-speed modes and ensure reliable data transfer
+  across different ST SoCs.
+
+allOf:
+  - $ref: mmc-controller.yaml#
+
+maintainers:
+  - Peter Griffin <peter.griffin@linaro.org>
+
+properties:
+  compatible:
+    oneOf:
+      - const: st,sdhci
+      - items:
+          - const: st,sdhci-stih407
+          - const: st,sdhci
+
+  reg:
+    minItems: 1
+    items:
+      - description: Base address and size of the MMC controller registers
+      - description: Base address and size of the MMC delay/auxiliary registers
+
+  reg-names:
+    oneOf:
+      - items:
+          - const: mmc
+      - items:
+          - const: mmc
+          - const: top-mmc-delay
+
+  clocks:
+    items:
+      - description: Clock for the MMC controller
+      - description: Interconnect (ICN) clock
+
+  clock-names:
+    items:
+      - const: mmc
+      - const: icn
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: mmcirq
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stih407-clks.h>
+    mmc@9060000 {
+        compatible = "st,sdhci-stih407", "st,sdhci";
+        reg = <0x09060000 0x7ff>, <0x9061008 0x20>;
+        reg-names = "mmc", "top-mmc-delay";
+        interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "mmcirq";
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_mmc0>;
+        clock-names = "mmc", "icn";
+        clocks = <&clk_s_c0_flexgen CLK_MMC_0>,
+                 <&clk_s_c0_flexgen CLK_RX_ICN_HVA>;
+        bus-width = <8>;
+    };
+...

-- 
2.54.0


