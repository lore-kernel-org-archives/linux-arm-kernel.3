Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D24EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 16:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nzD5qwer7lN3cs3aCecnlGIOZWp59qV1QyyQWTexqnY=; b=f2vSCqkPAE1nSp1B90tl9niguD
	Lln1tME583/uvqW8KTOYcsNTjMUZ+GuDR+4fFAvi17eU0up+37mbunkgq1mPuzj+Lz6EL+TYtsMk9
	JyeeGGGiw5rb4NhKtinnFYZLglxAWszP8UNBm66JGPF1xz8zY//vsBcOVtaLV5bx4NQ27yARzOfYL
	aRAu0CG6XOvXwJXDZUDmsQ7Cc02fPUPr73FWTDS4zbTSCi0rOoF6uqcDtQei6lAdYDezK6Rwv064r
	fDT74YIU9QS23RFlW+WY6WzSk/Aup+027jMOnPW1rmlbDqtURYeKszSn9HoJQbTSLMgYNeCtwZeJS
	kpGrXvyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEp3-0000000FD2u-0RcL;
	Mon, 29 Jun 2026 16:27:01 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEoz-0000000FD1O-26kO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 16:26:58 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-139b914bab6so4790409c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 09:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782750417; x=1783355217; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nzD5qwer7lN3cs3aCecnlGIOZWp59qV1QyyQWTexqnY=;
        b=fZFxvjOd2bKdsDA/eHK/9bQRbj/71FiaXxTX8zSMb4CbGO8kZ03hMAAO9RS6C3efY9
         UW2lxKStO3DsJ9Jir6DmmrMBWMHqFNL0tQu2iTl9J2qNLC9bN0aO0ZjYzi61hyvLqzW6
         /gNxoimJiLcTdxgaa3Sz1F/GRTfLDw5LhyIJlV98DngdtISczJlYE7D/0alOCnCZrJNI
         Myu+cBpx61mKxmh0hvut1JQ0XyVIHkBg+bK1/JVK73T91N3gMmWr+fqEAxhytt+XTj0C
         9+zu5breIa9gCsF+RfMokXIUcWtNEP59UPK5m37v3V8Sg/GvUVRxpbeu+9vHFdD8eIwh
         FOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782750417; x=1783355217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nzD5qwer7lN3cs3aCecnlGIOZWp59qV1QyyQWTexqnY=;
        b=GuqickQoIHnWDlTJGZHimFjomLbvHdpVKrwKvuWqNrmEDZueyuYocXOZTPFNzsQbm9
         mWWIrJqxtni15c39KX7t8UFxFXwnGvSeS3pd/gyjhyFDVAI6GXCLPhBb+3q4PAHocKgF
         ygd4jehnPMiw9LzYUZ7G7LkarOC8hoferXjQpyjzVCKwT+rI4T+3irdmznUDDXZLhfHy
         AbM8GYPCl3A+yFunLdOlr5SlMetFCukgbTxCS4nQo7L3DA2cJ1QOedbGD7TA+br4+UPu
         lyAWnfXQg7dvG6vvAiWfHf05CQaN1jMS3pyZBQuYDkQmaQQ54Q/JBSvQ1IFe+8ggoSi9
         PjjQ==
X-Forwarded-Encrypted: i=1; AFNElJ+vKNKCBXJHJp44Hwwax6ADmj63SQyhxcdvmGA6OaH1hbRD4I1iQD8E4qNT78cm7dt1e5Weg5C6F5MfoJ8YSbXM@lists.infradead.org
X-Gm-Message-State: AOJu0YwRgRR9xMP5sv90gRnmVzr3O12/E29esirG7tlF8HOe3tqWnzPs
	izzf/3VHNyxZXUMPYXp+ttg9APcuGh8AGCgV5tu09AwgcPelJ+KfMwKC
X-Gm-Gg: AfdE7cl+e3sa03e6D1/UQimn86qWD8rCHmcTYX3mvJ/HW9Bn6iwqUKjDSP++3gZQQs2
	Ab0LJmwVO24fB7dTcro6zuagCY82KryTZOjuBFRoXnvY8PMfse93OlcS0+pXRaMLNGI3YLHmrcA
	zjpEAv35ypvYmpwxPilhs3uxJJE91OYBwJY4w57gQ0dyc6JwDl3B1QbjDU0f+hTBbDZU47NXlHq
	Q0KjigHN0l3lpVSYONbqjuf3IQPC0PhGGypqFWkfelUTZfX111EUzBV/9+JN/k7p0tyAMEel5uo
	Q7rfgK267QV8vl51mT+EbPyDhpVnQsRCn9XzL7V+eermLQM2DMbxj0z1F3bizrEMv9+U/9E8+OZ
	dvNIwz+pB+DoKoHN2ABKYUz16bYVTJw/rJ48YudEFmRoLZvzRMOJYps7yaQvy4dsK4qZZR9totL
	HT28Bki16ApFqsplJ7fyyV5TQrt7Hs5/0sDDc=
X-Received: by 2002:a05:7022:79f:b0:137:e6a1:c4b3 with SMTP id a92af1059eb24-13b2a0a0e57mr117216c88.0.1782750416413;
        Mon, 29 Jun 2026 09:26:56 -0700 (PDT)
Received: from Black-Pearl.localdomain ([49.207.62.174])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-139d912197bsm80851896c88.15.2026.06.29.09.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 09:26:55 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Mon, 29 Jun 2026 16:26:40 +0000
Subject: [PATCH v5 2/2] dt-bindings: mmc: st,sdhci: Convert to DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-st-mmc-v5-2-3cf0e639bff8@gmail.com>
References: <20260629-st-mmc-v5-0-3cf0e639bff8@gmail.com>
In-Reply-To: <20260629-st-mmc-v5-0-3cf0e639bff8@gmail.com>
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
X-CRM114-CacheID: sfid-20260629_092657_562519_2A4B6142 
X-CRM114-Status: GOOD (  20.11  )
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

Convert STMicroelectronics sdhci-st MMC/SD controller binding from
text format to YAML DT schema.
Changes during conversion:
- Preserve optional 'icn' clock and 'top-mmc-delay' register region
  via minItems: 1 on their respective properties.
- Conditionally require reg-names when two reg entries are present
  via an allOf if/then block, preventing silent runtime failure in
  devm_platform_ioremap_resource_byname().
- Constrain max-frequency to enum [200000000, 100000000, 50000000]
  with a default of 50000000, matching the driver's behaviour in
  sdhci-st.c.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-st.txt | 110 ---------------------
 .../devicetree/bindings/mmc/st,sdhci.yaml          | 105 ++++++++++++++++++++
 2 files changed, 105 insertions(+), 110 deletions(-)

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
index 000000000000..798af599d374
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/st,sdhci.yaml
@@ -0,0 +1,105 @@
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
+  - if:
+      properties:
+        reg:
+          minItems: 2
+      required:
+        - reg
+    then:
+      required:
+        - reg-names
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
+  max-frequency:
+    enum: [200000000, 100000000, 50000000]
+    default: 50000000
+
+required:
+  - reg
+  - compatible
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


