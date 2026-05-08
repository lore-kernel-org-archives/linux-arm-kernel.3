Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37434CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 17:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uFMAJRct5+Ew9bo4NrSDVyJ5C+wmVXcn6c9x8tk7NTk=; b=JA6JBvHr+CD70gGH/88tyJ0AEw
	0k25AMPGqXXOS4ISC3Lkgo5wYSOBZmMlgzQ0yJDOxp0DaQ+6/68Bls0+zEhM3I8T7SturMW4PP3tS
	64Gw/abUz1NtZUN/4xo9HS+tzW36VwzPorwuCSFU0cgnPhhMzcfGtbNUVsq93TvOXwk5CDABPl5YH
	/pQPUKsKy8ZQsecjM5OFBMab6g590MKeqh7ZXh3oBk1RCIo2FF2+WnMGOkiyGkKiB8MRgZtoV8VAB
	4yfjG+OS3fugmS8P8BuO88YnQ8YS0UnpICJZBWaJaWRcCLw6CgjH8oIDc5/1K4pp+lDyhioPawMma
	fUPYjEZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLOvA-000000077nO-14HA;
	Fri, 08 May 2026 17:23:28 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLOv7-000000077lC-3LGY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 17:23:27 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2b9705613ddso15139435ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 10:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778261005; x=1778865805; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uFMAJRct5+Ew9bo4NrSDVyJ5C+wmVXcn6c9x8tk7NTk=;
        b=hgc3sKrDc96nf+OLe8sy8u1/ufEupAd5jHzZYxzKkQRVrGcCp0UeRwoLjJuIAcEcet
         pKCwE9G1MJAICrVcK/QGR/5R0pPyyRoTKgVsVZTFO52cKcUS0cKqr5RWcuEMvI1g3pK3
         E41JLwkZwZLXiggXI1FBxcTFu8JqvCKAYyr5T+iIXJqdZMNN3MOzgEt+AaIZiXqwLC/t
         +AV8GvB1c2Oh9x+mVYJhL0zKau5q1mKMUvpSNc/I5z/SHWbn3wbDxBmUgnBuJ4ACgXXv
         URFKwoka5dY4FqtKrhzERAK83yag4kvkSz8mdIDrh6MdbdOV7CT/ItQqbVkE8QgqyhlZ
         8OOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778261005; x=1778865805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uFMAJRct5+Ew9bo4NrSDVyJ5C+wmVXcn6c9x8tk7NTk=;
        b=Dw/MrgOBwh28D3TrpaMr4DQlbhh1LEGBv0QlV+jE0Nds+2PvlrirSahGrOPXXKLrhO
         h860Po20KKVnt8xdVyIt1/PuKnBEXz985NotCok+zn+QWtTu5sD/SdbOdsLJAHGFUdxj
         pcoZ0kSLxaDIHCpLZBFmz3dbCz9EWGl5Hqz/8qP4O9p8BkjS4OVJ1iVKo8G7Hl1qO+S0
         XPyPnp4Yh8u6lFSV/C/mvYFjL69kQ1ZqHayy7mIZzm6RE84IVBjiamhENJB23RfuaYg8
         nr3YGp/DZ8kjAq8BvDQDZX97yBTEOxd5nOEQer0v13jGYxPBLTBka1NXCGI6d9VlJxaA
         An5w==
X-Forwarded-Encrypted: i=1; AFNElJ+dnCnrjQVxVj9Fun1CTCKKScN+MLclbsieJ3jDdhwJ9JiJ5YoqKWXqZ6c9XQDCwaGQG3P3CNNX00X2rj3M1cPI@lists.infradead.org
X-Gm-Message-State: AOJu0YxdbIs37TFBSK8oJ7PiKogExEqrRfCl/VFNXqoqs8EsuPJshpYm
	TuCl6JSXFShGoFDCr7rAwMZ2LcRXZHfI7/HAyQat2aIRV/j8NKvPbN35
X-Gm-Gg: Acq92OHgMqEYFq98ZABrsKcTxuH6i/V0i2YvL74HjSlJHB2a9E/V2IQVmPwlxft5Flr
	Z/M3+8h8ATo/3df46xh8UlLeFyS5gHNdbxmrS2rwdvawkpPsSIv2UIIrZbYH+frGe7GRqng8oqD
	LEy7YLv55KggXq+KSYt6oFMmVxs38FZl59XDTxg7nxk9W840TF2qAwqmAugvEnQWoYwgly1t7+3
	voq6HvF967+PFlHarGerJ9OWV2HLDwJFFO8Y2ne5UlHC26cPGjSYJiJoz4jiNBPyZXJWb3cMaNM
	crPCUQ+gCGskHU4ObTnUtfiau2JVoxnGIRaLPsh9pVIo4rOS7w6vJNBUPzIexYL6WV3mmn84wB3
	uksfesV2LzJQJ+FybZP9UGFkEv775fIXPb5wTiu80qy7Yn2I3lcaXEhRjuGZ+JlOJvQ+XH4/w/i
	a9nTAARlZ9crs1IL1Sxp58q6Imcs0YHZDjRQdjxTYCGnVl
X-Received: by 2002:a17:903:1ab0:b0:2b2:4ffc:a7c4 with SMTP id d9443c01a7336-2ba798c0a22mr119825725ad.24.1778261004803;
        Fri, 08 May 2026 10:23:24 -0700 (PDT)
Received: from Black-Pearl.localdomain ([60.243.224.75])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2baf1e35487sm24907985ad.46.2026.05.08.10.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 10:23:24 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Fri, 08 May 2026 17:23:07 +0000
Subject: [PATCH v3 2/2] dt-bindings: mmc: st,sdhci: convert to DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-st-mmc-v3-2-81c329ed28e8@gmail.com>
References: <20260508-st-mmc-v3-0-81c329ed28e8@gmail.com>
In-Reply-To: <20260508-st-mmc-v3-0-81c329ed28e8@gmail.com>
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
X-CRM114-CacheID: sfid-20260508_102325_858401_5D3E66FD 
X-CRM114-Status: GOOD (  21.60  )
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
Changes during conversion:
- In the legacy text binding, 'icn' was optional. Keep the clock list
  flexible to preserve compatibility, although all existing in-tree DTS
  files already provide both clocks.
- Document the optional "top-mmc-delay" register region and corresponding
  reg-name in the YAML binding, as existing in-tree DTS files already use
  both "mmc" and "top-mmc-delay" entries.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-st.txt | 110 ---------------------
 .../devicetree/bindings/mmc/st,sdhci.yaml          |  91 +++++++++++++++++
 2 files changed, 91 insertions(+), 110 deletions(-)

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
index 000000000000..10e0e1ee6d5c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/st,sdhci.yaml
@@ -0,0 +1,91 @@
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
+      - description: MMC controller registers
+      - description: MMC delay/auxiliary registers
+
+  reg-names:
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


