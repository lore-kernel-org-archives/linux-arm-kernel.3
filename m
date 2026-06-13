Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7561CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 09:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IOrSjvFk/ov14IcMt5MBgZ1bR+CpKC1/mEab6ONapJE=; b=jgrjq9xlMCDPQU4QqtVAe7ImHs
	VeN7mxWivGcCaUYM7bw8j+idTMRodxyLChNMImxqQZfD/aWTUazwpoE3fQgUCFJcc1zc32A0Zl+3J
	U/v8hTtgRlR6aNucNK0rcRSCLjEWL6LQo5bXFFjSMv/9lPgV/q0zJg2Xgr7j+XOgBaP6jNZcXHjXx
	aBXHwMojNvjEeipuy3EMU0dwibhh4yoQoDiBcLpbSZE1C8pKQmLO8LDgYxUQiYM8qCY8k84Fr41mz
	LOjwrw+9fUbXUhFtvx8wc2ICngo6l0Jhz+2ybJeVMqp+0cwm87DYxK6m0JssDNed2ErF2MC2rgmHu
	TRlk9bKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYKqP-0000000C86s-1eEQ;
	Sat, 13 Jun 2026 09:40:01 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYKqK-0000000C83W-0zxC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 09:39:58 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso16242295ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 02:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781343595; x=1781948395; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IOrSjvFk/ov14IcMt5MBgZ1bR+CpKC1/mEab6ONapJE=;
        b=NJXa9oN0DMoKdexIdMzVTmQ8Mjd5HhDY1eRRvoK57V5KEe4EJZ+u/4wYJyyyCCZ57T
         yP6WWvSs4H/7aUsTPsGpRYyJrddBJt5HePxFOFIWSryTBbfTm4BX/aJqA0lJMtpr2RFl
         hzO3vonmBQv6uDfYDgTQPrawOPL6UKPJS2dHc0Z/ZX1OkB1lSN0Q/L9slGThlmK604Ri
         HwaLi4SYlU/Goi4dfcsv8UQMnCP+je5EXG9V/nlnP/s7d9RcBWrqSADBPMAFM8m4/Asp
         cgo86/wn+R/FywVWSaxgzhjUmTWveW9+/vIA+4RqNkN1x/HVGgEv6Oe9+ubfgUJ3d5Pb
         g4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781343595; x=1781948395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IOrSjvFk/ov14IcMt5MBgZ1bR+CpKC1/mEab6ONapJE=;
        b=V/VGAE26wEERaIrCnuFVmkWmcN9t7xhgE1wCX01Wn813kFgbRpOJY894TX6/zXJqiU
         nA5sPupmgKsaZ/gEKmqfiOZq3AzC77q5HQBl4jmWrTdxV62EgNqXEqyZAq/MfXsu/wON
         eF76BNImhYluJoGf9Erj4M4QOiUStDKbNDILqSSFo2y/zboEzfkYF+sMhkPaUMQ8qMPx
         SrTaEua6jCS+Cc9R7SaxZum35Zh2jZiIJQkuOEOA0zk+mQa2O2Z6Q4Mgks5aJtGArmTJ
         rNfMZ2RRf7dq0BkIdqOZ2ka2O4/7rTz7QCiiJ6Bcle1FoH3mj4/5W61R6mcc9+js8Hz1
         xOGw==
X-Forwarded-Encrypted: i=1; AFNElJ/MCA/YHogDr7vM/ChBiO9c7KyGV0r0aTf5/P0UX9mrgKi+HAhkU0sP9R45SigGZPKKx3MCj5GRhddVjsyXgcb1@lists.infradead.org
X-Gm-Message-State: AOJu0YynQs5/LqvTtO3fVMvD73Gw0hfvCokkMZPWPEU91B7h4NfvEPie
	QKdC7dWXbswBP3Hct0nOF0TA05UZDt53OoadmuiuC/kDFK4tnL77zKo2SkCERg==
X-Gm-Gg: Acq92OGFVKi4iHMZP69rsDLxrc1eWR1grHLln/gb+IyEh+EdKlec93ePPahQ2+Gl3P9
	m/9U3cfzX0iQlWYvH+dhxzs5vfUtJMPhhTK+GITwrklvBo8y5wKS+24p0HHtxmhSpsvhwBe6NWU
	4GSNXer8iiUww/VjUWRuualYasi0wE+9oPcfRb0OIUm4N0VxNKm9jAa5B7Wn42YWhmhYKF2pn6q
	v6tAC7WYPNs3LcuAwVTKmYKn2t+zkFAffSJ/LC65ekICnQfnKw0RBWzvZHz0zdbZKkSA/wzmo2e
	mkIyZV0bSMS5ZDDjxryoq0ZUZCi+rhiRYVURlCJcqD2gKKs597OAfVWU8RI9DXt8T1hhcDBanLY
	TYouxb4GQtYFjEVpK1ZaQU/51mDVK6vp69xUtY4cEU3APzm6wxChlVnUKzGmKYL/WU7TMmFgCbK
	tmznDQHaoRCYR4JEeGrNSs/mVmxpJYba6JwjH6qE4Q4u4X
X-Received: by 2002:a05:6a21:350d:b0:3b4:8f18:326 with SMTP id adf61e73a8af0-3b783dbce10mr7874789637.10.1781343595291;
        Sat, 13 Jun 2026 02:39:55 -0700 (PDT)
Received: from Black-Pearl.localdomain ([49.207.61.84])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c8661a67603sm4155826a12.0.2026.06.13.02.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 02:39:54 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Sat, 13 Jun 2026 09:39:40 +0000
Subject: [PATCH v4 2/2] dt-bindings: mmc: st,sdhci: Convert to DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-st-mmc-v4-2-b3c385617c16@gmail.com>
References: <20260613-st-mmc-v4-0-b3c385617c16@gmail.com>
In-Reply-To: <20260613-st-mmc-v4-0-b3c385617c16@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_023956_425895_4E06C9F3 
X-CRM114-Status: GOOD (  20.54  )
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

Convert STMicroelectronics sdhci-st MMC/SD controller binding to
DT schema.

The 'icn' clock and 'top-mmc-delay' register region are optional in
the text binding and remain so in the YAML schema. minItems: 1 is
set on clock-names and reg-names to match the flexibility of their
paired clocks and reg properties, preserving compatibility with
existing in-tree DTS nodes that provide only a single clock or
register entry.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-st.txt | 110 ---------------------
 .../devicetree/bindings/mmc/st,sdhci.yaml          |  92 +++++++++++++++++
 2 files changed, 92 insertions(+), 110 deletions(-)

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
index 000000000000..0bf4fc3ca699
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/st,sdhci.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/st,sdhci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics SDHCI-ST MMC/SD Controller
+
+maintainers:
+  - Peter Griffin <peter.griffin@linaro.org>
+
+description:
+  The STMicroelectronics SDHCI-ST MMC/SD host controller is compliant with
+  the SD Host Controller Interface (SDHCI) specification and is used to
+  interface with MMC, SD and SDIO cards. The ST SDHCI controller extends the
+  standard SDHCI capabilities with platform-specific configurations such as
+  additional register regions, clock inputs, and delay control mechanisms
+  required for signal timing adjustments to support high-speed modes across
+  different ST SoCs.
+
+allOf:
+  - $ref: mmc-controller.yaml#
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
+      - description: MMC controller base registers
+      - description: FlashSS Top registers for TX/RX DLL delay configuration
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: mmc
+      - const: top-mmc-delay
+
+  clocks:
+    minItems: 1
+    items:
+      - description: Clock for the MMC controller
+      - description: Interconnect (ICN) clock
+
+  clock-names:
+    minItems: 1
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


