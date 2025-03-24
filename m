Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CD4C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 13:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kN/OpfBAAZEiIoWKLqJAcN4TLH3/hS8jGoptF5162sA=; b=34AnLP6IH0qyLp78jOUuR7s2bZ
	ho7nEdi69Ftrl9HfhYyWAzTHL/VY3hzgl/+ZGBmszj/z0EgaKhtnYwwrcEmk8Ovec9dDB4ZvoDV03
	9Zb88FrlzfP/vJNRLuLRRSnZxAMXVv7ClnLZTCdoMDNLMA0WdYkkYoFM75Ks6muwpc56tC0caaIOc
	Ck8vXNrdqFGTQOqh1CyrTu9SCxLfRwog7BCb9uG2o32CCBU3Mn2sDw9/UTsUnenaVN8+dpNxeikJ1
	LBKakwbUq1BjCLkVkTxcW9zTbJw7M2t4+ymORWXf0s68o696l+mnxEkTW5WOjNXmi9lKg1oOZBTeC
	XCTJXeQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twhZW-00000003Ckf-1Z6Z;
	Mon, 24 Mar 2025 13:10:30 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twhJ6-000000036Yv-2DYq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 12:53:34 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cf89f81c5so4549845e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 05:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742820811; x=1743425611; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kN/OpfBAAZEiIoWKLqJAcN4TLH3/hS8jGoptF5162sA=;
        b=LEq6bkiUF5kQatRaNdnU6DCpxxZJ0LJTA7mG15i7ItFJWtCnWOpPFbYI+JGt6MTyje
         YEj05UPW8O0z2bfiyUJ+Ex3+NK6RyD+Yza0qrNT7GW7L7JyGxYIWJ2nJYnSQnL2HvTPe
         q917D7NYCAVaIR2jEUyuc604JnCNCx3BFYjEnDS1tOe0GipEVabTHFkiKuZ1hm2/cvWg
         s4QjWJoooHwSjrV2o57DWsfWshwdpufi9IqhOwhWyBplHfr+Gqq1LU4t2Dr6k2S/GQn4
         6cC9EUZpGhjg5hFDBRqnM/gd7456ONID/4CIcnTTzgBqYaL372TsYDnEyUKzfFQ04CMl
         PiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742820811; x=1743425611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kN/OpfBAAZEiIoWKLqJAcN4TLH3/hS8jGoptF5162sA=;
        b=gxYf74qTtLCrpsamAApadWn81OTS4bYkB62O0MhnwoMlnXStPH8sBmNr3HIOIby6wg
         gIgF9oheaHQ+4dMA3sXhRV6NYLNM2W9DRh7irz2dBp7aMQnpeCLnPqJRTIsFq28X4YdX
         3YeruT0fDyJwmqw0FOjaKgLSEwP8T+mhS8Y4lKvOLViOeqr1e0eJl6SEmCBZqh8+qt6e
         nX+G8srytwcxrMMIDLXdf4gXX/+9uIZPmO6f4tqTZC4pNXziSRoD+orQCDuvdpA394j1
         U1NNTdaPxokHRGj8LZGPuOjGWStHFBf7XHE2blrqnDzV1cMiuhGU2hv+j41r5oqrawu+
         h4/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWwTHR/Dhpf3LkmTLe68aMdhYMifns3pnXBadh0+IzMQBKkOIP9NeMhteXJwowN2R871fcn/4daxurj/cczVNFO@lists.infradead.org
X-Gm-Message-State: AOJu0YzGtMBJO2KbiYZ7qYZMdHXsKKdnasUToV905Ebv4siZXxwDSgXM
	tVQpMOmB9TM6/kayedfmB+K+vCO1eEILziGyUKlp5NpRHQdw52hN/aPEhMSlbFc=
X-Gm-Gg: ASbGnctcaDWgJurN6PXD6yOxEP8uiY4m24VOt8ydT30LjlUjtUvFiPDkTVw4a7K9WGB
	pEO+XqJZfiBLDjh/ky7u1S0zOA6J4K7/qnycZt3RngPQUO/EQT0H1FyLxm1t1Efzf+NchuRUI71
	7Zg97BxCqmdewzPONHx40AW7onMtIDa/R5oDcKMSEEUsV2plyQXV2jqFMVKupepk+kT3X6UqgzT
	H9h2I9bUgCDeNMHrk0BP5fRgvTj3lI+y8Hf0+vNL6w7zl6d6gs38o9VybNR5kn2/mrSaMIXWC9V
	ZghXWx6RsajkS1sLMJHFvxB7YyXhQO0FTv+gIBOOEXw2ajAd0JfqZyMwUDWm0IR1YJAi
X-Google-Smtp-Source: AGHT+IFGl5UH7JEkweKaiQScp+fP058Ehf+t6oBnFmBfdv/F300EXT1IjZTgd+srP2QLSOk9FBTuGg==
X-Received: by 2002:a05:600c:35ca:b0:439:90f5:3919 with SMTP id 5b1f17b1804b1-43d50a3b4c2mr48017095e9.4.1742820810970;
        Mon, 24 Mar 2025 05:53:30 -0700 (PDT)
Received: from krzk-bin.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43fdeb79sm171039565e9.25.2025.03.24.05.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 05:53:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	Maxime Ripard <mripard@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sander Vanheule <sander@svanheule.net>,
	Bert Vermeulen <bert@biot.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: gpio: Correct indentation and style in DTS example
Date: Mon, 24 Mar 2025 13:53:26 +0100
Message-ID: <20250324125326.82270-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_055332_707308_D569B37D 
X-CRM114-Status: GOOD (  13.17  )
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

DTS example in the bindings should be indented with 2- or 4-spaces and
aligned with opening '- |', so correct any differences like 3-spaces or
mixtures 2- and 4-spaces in one binding.  While re-indenting, drop
unused labels.

No functional changes here, but saves some comments during reviews of
new patches built on existing code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/gpio/atmel,at91rm9200-gpio.yaml  | 16 ++---
 .../bindings/gpio/fairchild,74hc595.yaml      | 20 +++---
 .../devicetree/bindings/gpio/gpio-mxs.yaml    | 70 +++++++++----------
 .../devicetree/bindings/gpio/nxp,pcf8575.yaml | 24 +++----
 .../bindings/gpio/realtek,otto-gpio.yaml      |  8 +--
 .../bindings/gpio/renesas,em-gio.yaml         | 20 +++---
 .../bindings/gpio/renesas,rcar-gpio.yaml      | 24 +++----
 .../devicetree/bindings/gpio/sifive,gpio.yaml |  6 +-
 .../bindings/gpio/toshiba,gpio-visconti.yaml  | 24 +++----
 .../bindings/gpio/xlnx,gpio-xilinx.yaml       | 48 ++++++-------
 10 files changed, 130 insertions(+), 130 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.yaml b/Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.yaml
index 3dd70933ed8e..d810043b56b6 100644
--- a/Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.yaml
@@ -69,13 +69,13 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
 
     gpio@fffff400 {
-            compatible = "atmel,at91rm9200-gpio";
-            reg = <0xfffff400 0x200>;
-            interrupts = <2 IRQ_TYPE_LEVEL_HIGH 1>;
-            #gpio-cells = <2>;
-            gpio-controller;
-            interrupt-controller;
-            #interrupt-cells = <2>;
-            clocks = <&pmc PMC_TYPE_PERIPHERAL 2>;
+        compatible = "atmel,at91rm9200-gpio";
+        reg = <0xfffff400 0x200>;
+        interrupts = <2 IRQ_TYPE_LEVEL_HIGH 1>;
+        #gpio-cells = <2>;
+        gpio-controller;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        clocks = <&pmc PMC_TYPE_PERIPHERAL 2>;
     };
 ...
diff --git a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
index 0e5c22929bde..ab35bcf98101 100644
--- a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
+++ b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
@@ -71,15 +71,15 @@ unevaluatedProperties: false
 examples:
   - |
     spi {
-            #address-cells = <1>;
-            #size-cells = <0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-            gpio5: gpio5@0 {
-                    compatible = "fairchild,74hc595";
-                    reg = <0>;
-                    gpio-controller;
-                    #gpio-cells = <2>;
-                    registers-number = <4>;
-                    spi-max-frequency = <100000>;
-            };
+        gpio5@0 {
+            compatible = "fairchild,74hc595";
+            reg = <0>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            registers-number = <4>;
+            spi-max-frequency = <100000>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml b/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
index 8ff54369d16c..b58e08c8ecd8 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
@@ -84,52 +84,52 @@ examples:
         reg = <0x80018000 0x2000>;
 
         gpio@0 {
-                compatible = "fsl,imx28-gpio";
-                reg = <0>;
-                interrupts = <127>;
-                gpio-controller;
-                #gpio-cells = <2>;
-                interrupt-controller;
-                #interrupt-cells = <2>;
+            compatible = "fsl,imx28-gpio";
+            reg = <0>;
+            interrupts = <127>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
         };
 
         gpio@1 {
-                compatible = "fsl,imx28-gpio";
-                reg = <1>;
-                interrupts = <126>;
-                gpio-controller;
-                #gpio-cells = <2>;
-                interrupt-controller;
-                #interrupt-cells = <2>;
+            compatible = "fsl,imx28-gpio";
+            reg = <1>;
+            interrupts = <126>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
         };
 
         gpio@2 {
-                compatible = "fsl,imx28-gpio";
-                reg = <2>;
-                interrupts = <125>;
-                gpio-controller;
-                #gpio-cells = <2>;
-                interrupt-controller;
-                #interrupt-cells = <2>;
+            compatible = "fsl,imx28-gpio";
+            reg = <2>;
+            interrupts = <125>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
         };
 
         gpio@3 {
-                compatible = "fsl,imx28-gpio";
-                reg = <3>;
-                interrupts = <124>;
-                gpio-controller;
-                #gpio-cells = <2>;
-                interrupt-controller;
-                #interrupt-cells = <2>;
+            compatible = "fsl,imx28-gpio";
+            reg = <3>;
+            interrupts = <124>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
         };
 
         gpio@4 {
-                compatible = "fsl,imx28-gpio";
-                reg = <4>;
-                interrupts = <123>;
-                gpio-controller;
-                #gpio-cells = <2>;
-                interrupt-controller;
-                #interrupt-cells = <2>;
+            compatible = "fsl,imx28-gpio";
+            reg = <4>;
+            interrupts = <123>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
         };
     };
diff --git a/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml b/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
index 8bca574bb66d..5a6ecaa7b44b 100644
--- a/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
+++ b/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
@@ -128,17 +128,17 @@ additionalProperties: false
 examples:
   - |
     i2c {
-            #address-cells = <1>;
-            #size-cells = <0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-            pcf8575: gpio@20 {
-                    compatible = "nxp,pcf8575";
-                    reg = <0x20>;
-                    interrupt-parent = <&irqpin2>;
-                    interrupts = <3 0>;
-                    gpio-controller;
-                    #gpio-cells = <2>;
-                    interrupt-controller;
-                    #interrupt-cells = <2>;
-            };
+        gpio@20 {
+            compatible = "nxp,pcf8575";
+            reg = <0x20>;
+            interrupt-parent = <&irqpin2>;
+            interrupts = <3 0>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml b/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
index 39fd959c45d2..728099c65824 100644
--- a/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
@@ -81,7 +81,7 @@ dependencies:
 
 examples:
   - |
-      gpio@3500 {
+    gpio@3500 {
         compatible = "realtek,rtl8380-gpio", "realtek,otto-gpio";
         reg = <0x3500 0x1c>;
         gpio-controller;
@@ -91,9 +91,9 @@ examples:
         #interrupt-cells = <2>;
         interrupt-parent = <&rtlintc>;
         interrupts = <23>;
-      };
+    };
   - |
-      gpio@3300 {
+    gpio@3300 {
         compatible = "realtek,rtl9300-gpio", "realtek,otto-gpio";
         reg = <0x3300 0x1c>, <0x3338 0x8>;
         gpio-controller;
@@ -103,6 +103,6 @@ examples:
         #interrupt-cells = <2>;
         interrupt-parent = <&rtlintc>;
         interrupts = <13>;
-      };
+    };
 
 ...
diff --git a/Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml b/Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml
index 8bdef812c87c..49fb8f613ead 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml
+++ b/Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml
@@ -57,14 +57,14 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     gpio0: gpio@e0050000 {
-            compatible = "renesas,em-gio";
-            reg = <0xe0050000 0x2c>, <0xe0050040 0x20>;
-            interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
-            gpio-controller;
-            #gpio-cells = <2>;
-            gpio-ranges = <&pfc 0 0 32>;
-            ngpios = <32>;
-            interrupt-controller;
-            #interrupt-cells = <2>;
+        compatible = "renesas,em-gio";
+        reg = <0xe0050000 0x2c>, <0xe0050040 0x20>;
+        interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pfc 0 0 32>;
+        ngpios = <32>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
     };
diff --git a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
index cc7a950a6030..d32e103a64aa 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
@@ -138,16 +138,16 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/power/r8a77470-sysc.h>
     gpio3: gpio@e6053000 {
-            compatible = "renesas,gpio-r8a77470", "renesas,rcar-gen2-gpio";
-            reg = <0xe6053000 0x50>;
-            interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
-            clocks = <&cpg CPG_MOD 909>;
-            power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
-            resets = <&cpg 909>;
-            gpio-controller;
-            #gpio-cells = <2>;
-            gpio-ranges = <&pfc 0 96 30>;
-            gpio-reserved-ranges = <17 10>;
-            interrupt-controller;
-            #interrupt-cells = <2>;
+        compatible = "renesas,gpio-r8a77470", "renesas,rcar-gen2-gpio";
+        reg = <0xe6053000 0x50>;
+        interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 909>;
+        power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+        resets = <&cpg 909>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pfc 0 96 30>;
+        gpio-reserved-ranges = <17 10>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
      };
diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
index fc095646adea..4bdc201b719e 100644
--- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
@@ -76,8 +76,8 @@ additionalProperties: false
 
 examples:
   - |
-      #include <dt-bindings/clock/sifive-fu540-prci.h>
-      gpio@10060000 {
+    #include <dt-bindings/clock/sifive-fu540-prci.h>
+    gpio@10060000 {
         compatible = "sifive,fu540-c000-gpio", "sifive,gpio0";
         interrupt-parent = <&plic>;
         interrupts = <7>, <8>, <9>, <10>, <11>, <12>, <13>, <14>, <15>, <16>,
@@ -88,6 +88,6 @@ examples:
         #gpio-cells = <2>;
         interrupt-controller;
         #interrupt-cells = <2>;
-      };
+    };
 
 ...
diff --git a/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
index b085450b527f..712063417bc8 100644
--- a/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
+++ b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
@@ -48,22 +48,22 @@ additionalProperties: false
 
 examples:
   - |
-      #include <dt-bindings/interrupt-controller/irq.h>
-      #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
 
-      soc {
+    soc {
         #address-cells = <2>;
         #size-cells = <2>;
 
         gpio: gpio@28020000 {
-          compatible = "toshiba,gpio-tmpv7708";
-          reg = <0 0x28020000 0 0x1000>;
-          #gpio-cells = <0x2>;
-          gpio-ranges = <&pmux 0 0 32>;
-          gpio-controller;
-          interrupt-controller;
-          #interrupt-cells = <2>;
-          interrupt-parent = <&gic>;
+            compatible = "toshiba,gpio-tmpv7708";
+            reg = <0 0x28020000 0 0x1000>;
+            #gpio-cells = <0x2>;
+            gpio-ranges = <&pmux 0 0 32>;
+            gpio-controller;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            interrupt-parent = <&gic>;
         };
-      };
+    };
 ...
diff --git a/Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml b/Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml
index d3d8a2e143ed..8fbf12ca067e 100644
--- a/Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml
+++ b/Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml
@@ -126,29 +126,29 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
-        gpio@a0020000 {
-            compatible = "xlnx,xps-gpio-1.00.a";
-            reg = <0xa0020000 0x10000>;
-            #gpio-cells = <2>;
-            #interrupt-cells = <0x2>;
-            clocks = <&zynqmp_clk 71>;
-            gpio-controller;
-            interrupt-controller;
-            interrupt-names = "ip2intc_irpt";
-            interrupt-parent = <&gic>;
-            interrupts = <0 89 4>;
-            xlnx,all-inputs = <0x0>;
-            xlnx,all-inputs-2 = <0x0>;
-            xlnx,all-outputs = <0x0>;
-            xlnx,all-outputs-2 = <0x0>;
-            xlnx,dout-default = <0x0>;
-            xlnx,dout-default-2 = <0x0>;
-            xlnx,gpio-width = <0x20>;
-            xlnx,gpio2-width = <0x20>;
-            xlnx,interrupt-present = <0x1>;
-            xlnx,is-dual = <0x1>;
-            xlnx,tri-default = <0xFFFFFFFF>;
-            xlnx,tri-default-2 = <0xFFFFFFFF>;
-        };
+    gpio@a0020000 {
+        compatible = "xlnx,xps-gpio-1.00.a";
+        reg = <0xa0020000 0x10000>;
+        #gpio-cells = <2>;
+        #interrupt-cells = <0x2>;
+        clocks = <&zynqmp_clk 71>;
+        gpio-controller;
+        interrupt-controller;
+        interrupt-names = "ip2intc_irpt";
+        interrupt-parent = <&gic>;
+        interrupts = <0 89 4>;
+        xlnx,all-inputs = <0x0>;
+        xlnx,all-inputs-2 = <0x0>;
+        xlnx,all-outputs = <0x0>;
+        xlnx,all-outputs-2 = <0x0>;
+        xlnx,dout-default = <0x0>;
+        xlnx,dout-default-2 = <0x0>;
+        xlnx,gpio-width = <0x20>;
+        xlnx,gpio2-width = <0x20>;
+        xlnx,interrupt-present = <0x1>;
+        xlnx,is-dual = <0x1>;
+        xlnx,tri-default = <0xFFFFFFFF>;
+        xlnx,tri-default-2 = <0xFFFFFFFF>;
+    };
 
 ...
-- 
2.43.0


