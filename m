Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56777E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 13:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G3SlO4HnSa1d2nIOviPDkVVh3M8sGqwGmKll7Eiqgd0=; b=jph+rAkSd1Be5W3i3HzJM2ezrg
	NLofG9VpJnjvNMN+Ux7jMHUIKEqYbKaHlsGo4+0nDCCMwYt6mR3v5nRY9pPfxQbKJa7M4CXy+8CdH
	jtSw4/sYa6AGTeDIroEG+/b+d5BcZghDTu9VmLDeQPLz31Bj5YtDCuH7dy8n4nerhUt7qikyXfC78
	ty0tyE4/TFoukzTCVcS5/LJ368ReXBvRNoDxTayMQXbW2DXQChHPoxRI/0ouQ9gF+hHg+Tlt1KOqB
	tf78k8rGchfzpSyT3tUqge3vCzxBSjGlkstKpQGJfb7eqg5n3aBSC2ZliSZhX0aM6JRdPpQFVyaui
	7+gRlyng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9F6-00000004tcp-0kK3;
	Tue, 07 Jan 2025 13:03:32 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9AO-00000004sEA-0gTN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 12:58:44 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3862c78536bso784413f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 04:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736254719; x=1736859519; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G3SlO4HnSa1d2nIOviPDkVVh3M8sGqwGmKll7Eiqgd0=;
        b=xi4qDYSnx7o8AmhRmBAy+bvk152+wKdksJfcouk3wFu8yAazCWY9Zg+xCAuJWHInz0
         3MqZ1m3jixtl2v89umz0KaLcLKMH3d4NgpypLv+tvnzkh1pDZbRJ27dSIYqXCmYdIhy9
         RMkKI2gAqmg3N8aYzhqcqnzVgMFVQojn9IENhQj0lCeEigQBLmws3tBw+pMIE1NGnSYl
         yu350RO9m+xZDjWy1R4galA+M55DKPK2YeddUCPTHa/urzgKuBxipGAvDQOg422YZ/Ah
         fvI06lfyR0oCT554Yjz0Qv7fLzwFDQEhxQYv0hwwPd9NBZUXtL33c2D+p5lrQgZYblqs
         p+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736254719; x=1736859519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G3SlO4HnSa1d2nIOviPDkVVh3M8sGqwGmKll7Eiqgd0=;
        b=GOLRzB9OtqNMVifWO9uL0e8ckMlB2FUwxE9OTlWm6+tw3sHrbO9zC6e/kdv4+ZEHhH
         PqkN9ZpJFvFkl1M6AWlBHu7eEW7Em+QvFBHvUwWA/x/MITScu2hQTvQZu3xIH0GA9U6c
         UXW17zQ+M+DzKT8UidPZ0EQ105xIWWdvJdqMwqQB/IM6GSzFPw2OVIE0JSAB2x9BCY8c
         ugUOuJqBGhTjneCOD8SYcI6Lme7rrn1RDk8yIDZUfLL4Cske8Q6+fSfERddwzWc49gjb
         tLgGr+SZ4OF84vIX7aQUpG+iw3q7QYmWGR1D6xs1y43eiRzLJ+U1zP8SGoEBY0CDly7a
         VTQg==
X-Forwarded-Encrypted: i=1; AJvYcCURblVPUeyj9MBh+OGCGqev3L8KhWYaIYJfVCt+t6agHf2d9uFs6+ZIhrLrddBMi8rMkTJBrpdqwGJtbJmqhWG8@lists.infradead.org
X-Gm-Message-State: AOJu0YzUYnv4hLmNvAj8rhHcTgpVUjakZWn2fE8OrtLqso6M4EQJxbQV
	o3UOFcCc1jZ4d5FyieNetCJHyO4zlKfDwljQp8lQBk6pVbybP5yimiwGWNGG/b4=
X-Gm-Gg: ASbGnctvvCVinLojXrHvQ+bGbfg6MWbJ/mKhMMz14JycUOPeorjMGX4tn8bF1urUFNj
	REchQgJPq2ue0b6u3zGJ7+A/aZkF3+Td3gGVWQw15JVvuG2FRkwcpHxO6JkRVr/AoA2iuvIT3S3
	T+cQyyuBfwOC2qQGHtQLNUSLGapc/fJFZ/6IkO+uYGVqPnlPlFr1TqUwx9yeQYa6Sz4WUbs21u/
	dtxVmMjiXfvekFs5nPJIspKbTDuEs1RsW1c7ppNHh3WwAVbeSdDH808jMp2xq7jCZP03hU=
X-Google-Smtp-Source: AGHT+IFBgFMLu8HlVu9HOURYvLjoD0imDZ6+YJAzt2WRpsX31FXXQcdZsYTJ8VsoNLNcJAAIeJY15g==
X-Received: by 2002:a5d:588a:0:b0:385:f79d:21a2 with SMTP id ffacd0b85a97d-38a222070a3mr17537706f8f.11.1736254718636;
        Tue, 07 Jan 2025 04:58:38 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e2f9sm51598511f8f.81.2025.01.07.04.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 04:58:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Michal Simek <michal.simek@amd.com>,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	TY Chang <tychang@realtek.com>,
	Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: pinctrl: Correct indentation and style in DTS example
Date: Tue,  7 Jan 2025 13:58:34 +0100
Message-ID: <20250107125836.225447-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_045840_216701_A0E2CF5B 
X-CRM114-Status: GOOD (  11.56  )
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
mixtures 2- and 4-spaces in one binding.

No functional changes here, but saves some comments during reviews of
new patches built on existing code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../pinctrl/atmel,at91rm9200-pinctrl.yaml     | 64 +++++++++----------
 .../pinctrl/realtek,rtd1315e-pinctrl.yaml     | 50 +++++++--------
 .../pinctrl/realtek,rtd1319d-pinctrl.yaml     | 50 +++++++--------
 .../pinctrl/realtek,rtd1619b-pinctrl.yaml     | 50 +++++++--------
 .../bindings/pinctrl/xlnx,pinctrl-zynq.yaml   | 53 +++++++--------
 5 files changed, 130 insertions(+), 137 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91rm9200-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/atmel,at91rm9200-pinctrl.yaml
index 1bb386b42039..a7ede29c1444 100644
--- a/Documentation/devicetree/bindings/pinctrl/atmel,at91rm9200-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/atmel,at91rm9200-pinctrl.yaml
@@ -145,40 +145,40 @@ additionalProperties:
 
 examples:
   - |
-     #include <dt-bindings/clock/at91.h>
-     #include <dt-bindings/interrupt-controller/irq.h>
-     #include <dt-bindings/pinctrl/at91.h>
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/pinctrl/at91.h>
 
-     pinctrl@fffff400 {
-       #address-cells = <1>;
-       #size-cells = <1>;
-       compatible = "atmel,at91rm9200-pinctrl", "simple-mfd";
-       ranges = <0xfffff400 0xfffff400 0x600>;
+    pinctrl@fffff400 {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        compatible = "atmel,at91rm9200-pinctrl", "simple-mfd";
+        ranges = <0xfffff400 0xfffff400 0x600>;
 
-       atmel,mux-mask = <
-         /*    A         B     */
-         0xffffffff 0xffc00c3b  /* pioA */
-         0xffffffff 0x7fff3ccf  /* pioB */
-         0xffffffff 0x007fffff  /* pioC */
-         >;
+        atmel,mux-mask = <
+          /*    A         B     */
+          0xffffffff 0xffc00c3b  /* pioA */
+          0xffffffff 0x7fff3ccf  /* pioB */
+          0xffffffff 0x007fffff  /* pioC */
+          >;
 
-       dbgu {
-         pinctrl_dbgu: dbgu-0 {
-           atmel,pins =
-             <AT91_PIOB 14 AT91_PERIPH_A AT91_PINCTRL_PULL_UP
-              AT91_PIOB 15 AT91_PERIPH_A AT91_PINCTRL_NONE>;
-         };
-       };
+        dbgu {
+            dbgu-0 {
+                atmel,pins =
+                  <AT91_PIOB 14 AT91_PERIPH_A AT91_PINCTRL_PULL_UP
+                   AT91_PIOB 15 AT91_PERIPH_A AT91_PINCTRL_NONE>;
+            };
+        };
 
-       pioA: gpio@fffff400 {
-         compatible = "atmel,at91rm9200-gpio";
-         reg = <0xfffff400 0x200>;
-         interrupts = <2 IRQ_TYPE_LEVEL_HIGH 1>;
-         #gpio-cells = <2>;
-         gpio-controller;
-         interrupt-controller;
-         #interrupt-cells = <2>;
-         clocks = <&pmc PMC_TYPE_PERIPHERAL 2>;
-       };
-     };
+        gpio@fffff400 {
+            compatible = "atmel,at91rm9200-gpio";
+            reg = <0xfffff400 0x200>;
+            interrupts = <2 IRQ_TYPE_LEVEL_HIGH 1>;
+            #gpio-cells = <2>;
+            gpio-controller;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            clocks = <&pmc PMC_TYPE_PERIPHERAL 2>;
+        };
+    };
 ...
diff --git a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml
index fc6c65fea73b..90bd49d87d2e 100644
--- a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml
@@ -159,30 +159,30 @@ additionalProperties: false
 
 examples:
   - |
-     pinctrl@4e000 {
-         compatible = "realtek,rtd1315e-pinctrl";
-         reg = <0x4e000 0x130>;
+    pinctrl@4e000 {
+        compatible = "realtek,rtd1315e-pinctrl";
+        reg = <0x4e000 0x130>;
 
-         emmc-hs200-pins {
-             pins = "emmc_clk",
-                    "emmc_cmd",
-                    "emmc_data_0",
-                    "emmc_data_1",
-                    "emmc_data_2",
-                    "emmc_data_3",
-                    "emmc_data_4",
-                    "emmc_data_5",
-                    "emmc_data_6",
-                    "emmc_data_7";
-             function = "emmc";
-             realtek,drive-strength-p = <0x2>;
-             realtek,drive-strength-n = <0x2>;
-         };
+        emmc-hs200-pins {
+            pins = "emmc_clk",
+                   "emmc_cmd",
+                   "emmc_data_0",
+                   "emmc_data_1",
+                   "emmc_data_2",
+                   "emmc_data_3",
+                   "emmc_data_4",
+                   "emmc_data_5",
+                   "emmc_data_6",
+                   "emmc_data_7";
+            function = "emmc";
+            realtek,drive-strength-p = <0x2>;
+            realtek,drive-strength-n = <0x2>;
+        };
 
-         i2c-0-pins {
-             pins = "gpio_12",
-                    "gpio_13";
-             function = "i2c0";
-             drive-strength = <4>;
-         };
-     };
+        i2c-0-pins {
+            pins = "gpio_12",
+                   "gpio_13";
+            function = "i2c0";
+            drive-strength = <4>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml
index f07361d60acd..b6211c8544ca 100644
--- a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml
@@ -158,30 +158,30 @@ additionalProperties: false
 
 examples:
   - |
-     pinctrl@4e000 {
-         compatible = "realtek,rtd1319d-pinctrl";
-         reg = <0x4e000 0x130>;
+    pinctrl@4e000 {
+        compatible = "realtek,rtd1319d-pinctrl";
+        reg = <0x4e000 0x130>;
 
-         emmc-hs200-pins {
-             pins = "emmc_clk",
-                    "emmc_cmd",
-                    "emmc_data_0",
-                    "emmc_data_1",
-                    "emmc_data_2",
-                    "emmc_data_3",
-                    "emmc_data_4",
-                    "emmc_data_5",
-                    "emmc_data_6",
-                    "emmc_data_7";
-             function = "emmc";
-             realtek,drive-strength-p = <0x2>;
-             realtek,drive-strength-n = <0x2>;
-         };
+        emmc-hs200-pins {
+            pins = "emmc_clk",
+                   "emmc_cmd",
+                   "emmc_data_0",
+                   "emmc_data_1",
+                   "emmc_data_2",
+                   "emmc_data_3",
+                   "emmc_data_4",
+                   "emmc_data_5",
+                   "emmc_data_6",
+                   "emmc_data_7";
+            function = "emmc";
+            realtek,drive-strength-p = <0x2>;
+            realtek,drive-strength-n = <0x2>;
+        };
 
-         i2c-0-pins {
-             pins = "gpio_12",
-                    "gpio_13";
-             function = "i2c0";
-             drive-strength = <4>;
-         };
-     };
+        i2c-0-pins {
+            pins = "gpio_12",
+                   "gpio_13";
+            function = "i2c0";
+            drive-strength = <4>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml
index 671e4ec84624..e88bc649cc73 100644
--- a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml
@@ -157,30 +157,30 @@ additionalProperties: false
 
 examples:
   - |
-     pinctrl@4e000 {
-         compatible = "realtek,rtd1619b-pinctrl";
-         reg = <0x4e000 0x130>;
+    pinctrl@4e000 {
+        compatible = "realtek,rtd1619b-pinctrl";
+        reg = <0x4e000 0x130>;
 
-         emmc-hs200-pins {
-             pins = "emmc_clk",
-                    "emmc_cmd",
-                    "emmc_data_0",
-                    "emmc_data_1",
-                    "emmc_data_2",
-                    "emmc_data_3",
-                    "emmc_data_4",
-                    "emmc_data_5",
-                    "emmc_data_6",
-                    "emmc_data_7";
-             function = "emmc";
-             realtek,drive-strength-p = <0x2>;
-             realtek,drive-strength-n = <0x2>;
-         };
+        emmc-hs200-pins {
+            pins = "emmc_clk",
+                   "emmc_cmd",
+                   "emmc_data_0",
+                   "emmc_data_1",
+                   "emmc_data_2",
+                   "emmc_data_3",
+                   "emmc_data_4",
+                   "emmc_data_5",
+                   "emmc_data_6",
+                   "emmc_data_7";
+            function = "emmc";
+            realtek,drive-strength-p = <0x2>;
+            realtek,drive-strength-n = <0x2>;
+        };
 
-         i2c-0-pins {
-             pins = "gpio_12",
-                    "gpio_13";
-             function = "i2c0";
-             drive-strength = <4>;
-         };
-     };
+        i2c-0-pins {
+            pins = "gpio_12",
+                   "gpio_13";
+            function = "i2c0";
+            drive-strength = <4>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/xlnx,pinctrl-zynq.yaml b/Documentation/devicetree/bindings/pinctrl/xlnx,pinctrl-zynq.yaml
index de6c10ba36c4..70548cb37ada 100644
--- a/Documentation/devicetree/bindings/pinctrl/xlnx,pinctrl-zynq.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/xlnx,pinctrl-zynq.yaml
@@ -180,38 +180,31 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/pinctrl/pinctrl-zynq.h>
-    pinctrl0: pinctrl@700 {
-       compatible = "xlnx,pinctrl-zynq";
-       reg = <0x700 0x200>;
-       syscon = <&slcr>;
+    pinctrl@700 {
+        compatible = "xlnx,pinctrl-zynq";
+        reg = <0x700 0x200>;
+        syscon = <&slcr>;
 
-       pinctrl_uart1_default: uart1-default {
-           mux {
-               groups = "uart1_10_grp";
-               function = "uart1";
-           };
+        uart1-default {
+            mux {
+                groups = "uart1_10_grp";
+                function = "uart1";
+            };
 
-           conf {
-               groups = "uart1_10_grp";
-               slew-rate = <0>;
-               power-source = <IO_STANDARD_LVCMOS18>;
-           };
+            conf {
+                groups = "uart1_10_grp";
+                slew-rate = <0>;
+                power-source = <IO_STANDARD_LVCMOS18>;
+            };
 
-           conf-rx {
-               pins = "MIO49";
-               bias-high-impedance;
-           };
+            conf-rx {
+                pins = "MIO49";
+                bias-high-impedance;
+            };
 
-           conf-tx {
-               pins = "MIO48";
-               bias-disable;
-           };
-       };
+            conf-tx {
+                pins = "MIO48";
+                bias-disable;
+            };
+        };
     };
-
-    uart1 {
-         pinctrl-names = "default";
-         pinctrl-0 = <&pinctrl_uart1_default>;
-    };
-
-...
-- 
2.43.0


