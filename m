Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA80CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 14:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFZAUjYaK9FWKgvs/ixolGySq1VzA8CfDWl5e2+n+8I=; b=Wkxci016LaGf9ojMquvvrkMUwa
	zbuqEHd7QOEJtpTsFJ+tvdwDpUcUEq9JswMnM8CxdxaHvsTJunweFVRs/8LS5tTc+4ENXAcaeRwee
	aSh3TJVD/3oPurvRbgIcdQmfJT5SV7PsciwtFRmB5csYe3SdZ84Z5MSJTUZmHDTkUAnk7vQyP8vkx
	b1OPUMovKFqEoo3Jdrt62EeLXBclpxZthu5R00oB+nk1OKFEW6eKHbEzMI13GefhIwRkhPiKBsbel
	0eChHtOECtFxR+ZOnidQNFtWppsj9blYk3nuwndsqyGt7iqVsKBlh9A6bt6xUUDd10jiyX8JqzyxU
	YNIf3t0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTL8v-00000008r9Q-14IH;
	Sat, 30 May 2026 14:58:29 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTL8h-00000008qwe-3X6o
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 14:58:17 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-45ee1a56328so3067338f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 07:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780153094; x=1780757894; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFZAUjYaK9FWKgvs/ixolGySq1VzA8CfDWl5e2+n+8I=;
        b=hzDUmiiQxX2L78/76jHGujKJvZGXBhiuTnQXa1IO+vgYq4Vlqn/djm31iuPiL4kQ0i
         +shDORngxympGcsRwDLAUcH1KVA6cNuHZ2O/izRX9guyze7Xzxq8HVHaB9zkBBdkRY0k
         P2+1jkOYhpg1jgdwMPQVk2XWq23HHcVQJ7N1gAK3cywjP2yX0B8BlBVROwYNk/h6h4UP
         pdHOoRHm1/AbGT/SNGAZd0LeQljKB0gBqAjgMWOpwP6kpVDWlbscPbdho2XnW/NpOglD
         gI4diJRfbTQQ3rSqCG1r7Mo/+XsEV365d4Q4EbFJMtR+4nNKw+gg7kkdlLSsZ7fMbPNO
         X0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780153094; x=1780757894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zFZAUjYaK9FWKgvs/ixolGySq1VzA8CfDWl5e2+n+8I=;
        b=eQR1hja3/n56H0uFTYw2jELdprGioqp6sqMWZnIAzxMm69g9uHS/EkyUY3OLnf52Te
         ua1cn5Slkf3PZ9IF79aq6vvvQzdQPomO8tqFaMS5/33Ne3Aj5tmK1apVI2ZU1nQoADAa
         1C21HoqvLy6EolwnRdV5brkzlRZXwjTz9LeryF6QTg13eKZvYB4Bh82TxzESdACR4Nks
         VhRyuFYzFNugjT41kTUC/Xqz5XbJqF/f4w+WSl5cfdeLx+xnJBMKp4LQbJpQm0Ni/fz5
         DCc433P2YbrLezYXlyVq9XdF5CYqpSQV2x8iXG1vHXojCnJQUdJLXR2XC1PpF1otIK0N
         QRqg==
X-Forwarded-Encrypted: i=1; AFNElJ8JLmibhOCaDoKu+Q5uK3MBa0VP0kyEqo6pBd/8bgSms2VDDGq9WcDy9xrL3WuJxWAMkQMjJtzEbd+ZuKv1x4TK@lists.infradead.org
X-Gm-Message-State: AOJu0YzrPGtfdusEggUh5uT9Wfd/je/nxP//5P3AQEYCoW0mrph04+yi
	AQdfO5Tz6LoWRLY1XLwmqazBgLpDgPnzbJnj43OzIUjazu97XfONbMpL
X-Gm-Gg: Acq92OFsEnxxHJBYeweiYF9rB/lK//d4Wqfm4TqT4lfbcIEqTGXix2vkNUcKrLkPL93
	3V2hhrml2Jkikwz1OZj4Q3wbQrm5tueT+SwRZqkwS2ieQAFplNXKndmj92ymOTJv+0lckojEV38
	G4vTiyEfvVc+1oaWd0ItoqGLtCCi7e855h0jNFeqYzqw5Tu0M8oEACR42rWCH4Go0ZPSTdj89Qs
	ejux6JsbK3hqHNn65jGZYy3vpfkRtNTxAnlgzKa2MojGpFU9QONfPtWmO/PjOBwT4/z7fTc41vE
	6SdHr1zGvo5AsKp0xvs3VafvmXwkOiCMx8vZqtf6zBxdTbdggw/e98d7duhuJKTDdpUaoS+wdzx
	TEQAoB72ZBx5kMjrxAEuhzP6NSlUgHoEkxrFHb5nbeM9osRO8GBUUln7aon4ovdIiUaEycezsx3
	c8hjl+yIvKIYuBH+r5DS9SR+BMkaSQXM0=
X-Received: by 2002:a05:6000:b12:b0:45e:6518:21ad with SMTP id ffacd0b85a97d-45ef6aec9c7mr6669746f8f.3.1780153094030;
        Sat, 30 May 2026 07:58:14 -0700 (PDT)
Received: from zenbook ([31.4.224.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354b5bdsm10916493f8f.21.2026.05.30.07.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 07:58:13 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Teng <andy.teng@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 3/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add MT6795
Date: Sat, 30 May 2026 16:57:55 +0200
Message-ID: <20260530145800.1029920-4-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530145800.1029920-1-y.oudjana@protonmail.com>
References: <20260530145800.1029920-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_075815_956734_B381DE30 
X-CRM114-Status: GOOD (  19.76  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Combine MT6795 pin controller document into MT6779 one. In the
process, amend the example with comments and additional pinctrl
nodes from the MT6795 example, replace the current interrupts
property description with the one from the MT6795 document since
it makes more sense and define its items using conditionals
as they now vary between variants. Also use conditionals to define
valid values for the drive-strength property as well as items of
the interrupts property for each variant since they are different
on MT6795.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../pinctrl/mediatek,mt6779-pinctrl.yaml      |  67 ++++-
 .../pinctrl/mediatek,mt6795-pinctrl.yaml      | 228 ------------------
 2 files changed, 65 insertions(+), 230 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index 4dc9504e24ad..2124804c8863 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -8,6 +8,7 @@ title: MediaTek MT6779 Pin Controller
 
 maintainers:
   - Andy Teng <andy.teng@mediatek.com>
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
   - Sean Wang <sean.wang@kernel.org>
 
 description:
@@ -18,6 +19,7 @@ properties:
   compatible:
     enum:
       - mediatek,mt6779-pinctrl
+      - mediatek,mt6795-pinctrl
       - mediatek,mt6797-pinctrl
 
   reg:
@@ -81,6 +83,45 @@ allOf:
             - const: iocfg_lt
             - const: iocfg_tl
             - const: eint
+
+      patternProperties:
+        '-pins$':
+          patternProperties:
+            '^pins':
+              properties:
+                drive-strength:
+                  enum: [2, 4, 8, 12, 16]
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt6795-pinctrl
+    then:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 2
+
+        reg-names:
+          items:
+            - const: base
+            - const: eint
+
+        interrupts:
+          minItems: 1
+          items:
+            - description: EINT interrupt
+            - description: EINT event_b interrupt
+
+      patternProperties:
+        '-pins$':
+          patternProperties:
+            '^pins':
+              properties:
+                drive-strength:
+                  enum: [2, 4, 6, 8, 10, 12, 14, 16]
+
   - if:
       properties:
         compatible:
@@ -99,6 +140,15 @@ allOf:
             - const: iocfgb
             - const: iocfgr
             - const: iocfgt
+
+      patternProperties:
+        '-pins$':
+          patternProperties:
+            '^pins':
+              properties:
+                drive-strength:
+                  enum: [2, 4, 8, 12, 16]
+
   - if:
       properties:
         reg-names:
@@ -170,8 +220,7 @@ patternProperties:
 
           input-schmitt-disable: true
 
-          drive-strength:
-            enum: [2, 4, 8, 12, 16]
+          drive-strength: true
 
           slew-rate:
             enum: [0, 1]
@@ -263,5 +312,19 @@ examples:
                     mediatek,pull-up-adv = <0>;
                 };
             };
+
+            /* GPIO0 set as multifunction GPIO0 */
+            gpio-pins {
+                pins {
+                    pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
+                };
+            };
+
+            /* GPIO52 set as multifunction SDA0 */
+            i2c0-pins {
+                pins {
+                  pinmux = <PINMUX_GPIO52__FUNC_SDA0>;
+                };
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
deleted file mode 100644
index 68e91c05f122..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
+++ /dev/null
@@ -1,228 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/pinctrl/mediatek,mt6795-pinctrl.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: MediaTek MT6795 Pin Controller
-
-maintainers:
-  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
-  - Sean Wang <sean.wang@kernel.org>
-
-description:
-  The MediaTek's MT6795 Pin controller is used to control SoC pins.
-
-properties:
-  compatible:
-    const: mediatek,mt6795-pinctrl
-
-  gpio-controller: true
-
-  '#gpio-cells':
-    description:
-      Number of cells in GPIO specifier. Since the generic GPIO binding is used,
-      the amount of cells must be specified as 2. See the below mentioned gpio
-      binding representation for description of particular cells.
-    const: 2
-
-  gpio-ranges:
-    description: GPIO valid number range.
-    maxItems: 1
-
-  reg:
-    description:
-      Physical address base for GPIO base and eint registers.
-    minItems: 2
-
-  reg-names:
-    items:
-      - const: base
-      - const: eint
-
-  interrupt-controller: true
-
-  '#interrupt-cells':
-    const: 2
-
-  interrupts:
-    description: Interrupt outputs to the system interrupt controller (sysirq).
-    minItems: 1
-    items:
-      - description: EINT interrupt
-      - description: EINT event_b interrupt
-
-# PIN CONFIGURATION NODES
-patternProperties:
-  '-pins$':
-    type: object
-    additionalProperties: false
-    patternProperties:
-      '^pins':
-        type: object
-        additionalProperties: false
-        description: |
-          A pinctrl node should contain at least one subnodes representing the
-          pinctrl groups available on the machine. Each subnode will list the
-          pins it needs, and how they should be configured, with regard to muxer
-          configuration, pullups, drive strength, input enable/disable and input
-          schmitt.
-          An example of using macro:
-          pincontroller {
-            /* GPIO0 set as multifunction GPIO0 */
-            gpio-pins {
-              pins {
-                pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
-              }
-            };
-            /* GPIO45 set as multifunction SDA0 */
-            i2c0-pins {
-              pins {
-                pinmux = <PINMUX_GPIO45__FUNC_SDA0>;
-              }
-            };
-          };
-        $ref: pinmux-node.yaml
-
-        properties:
-          pinmux:
-            description:
-              Integer array, represents gpio pin number and mux setting.
-              Supported pin number and mux varies for different SoCs, and are
-              defined as macros in dt-bindings/pinctrl/<soc>-pinfunc.h directly.
-
-          drive-strength:
-            enum: [2, 4, 6, 8, 10, 12, 14, 16]
-
-          bias-pull-down:
-            oneOf:
-              - type: boolean
-              - enum: [100, 101, 102, 103]
-                description: mt6795 pull down PUPD/R0/R1 type define value.
-            description:
-              For normal pull down type, it is not necessary to specify R1R0
-              values; When pull down type is PUPD/R0/R1, adding R1R0 defines
-              will set different resistance values.
-
-          bias-pull-up:
-            oneOf:
-              - type: boolean
-              - enum: [100, 101, 102, 103]
-                description: mt6795 pull up PUPD/R0/R1 type define value.
-            description:
-              For normal pull up type, it is not necessary to specify R1R0
-              values; When pull up type is PUPD/R0/R1, adding R1R0 defines will
-              set different resistance values.
-
-          bias-disable: true
-
-          output-high: true
-
-          output-low: true
-
-          input-enable: true
-
-          input-disable: true
-
-          input-schmitt-enable: true
-
-          input-schmitt-disable: true
-
-          mediatek,pull-up-adv:
-            description: |
-              Pull up settings for 2 pull resistors, R0 and R1. User can
-              configure those special pins. Valid arguments are described as
-              below:
-              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
-              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
-              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
-              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
-            $ref: /schemas/types.yaml#/definitions/uint32
-            enum: [0, 1, 2, 3]
-
-          mediatek,pull-down-adv:
-            description: |
-              Pull down settings for 2 pull resistors, R0 and R1. User can
-              configure those special pins. Valid arguments are described as
-              below:
-              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
-              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
-              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
-              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
-            $ref: /schemas/types.yaml#/definitions/uint32
-            enum: [0, 1, 2, 3]
-
-        required:
-          - pinmux
-
-allOf:
-  - $ref: pinctrl.yaml#
-
-required:
-  - compatible
-  - reg
-  - reg-names
-  - interrupts
-  - interrupt-controller
-  - '#interrupt-cells'
-  - gpio-controller
-  - '#gpio-cells'
-  - gpio-ranges
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/interrupt-controller/irq.h>
-    #include <dt-bindings/pinctrl/mt6795-pinfunc.h>
-
-    soc {
-        #address-cells = <2>;
-        #size-cells = <2>;
-
-        pio: pinctrl@10005000 {
-            compatible = "mediatek,mt6795-pinctrl";
-            reg = <0 0x10005000 0 0x1000>, <0 0x1000b000 0 0x1000>;
-            reg-names = "base", "eint";
-            gpio-controller;
-            #gpio-cells = <2>;
-            gpio-ranges = <&pio 0 0 196>;
-            interrupt-controller;
-            interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
-            #interrupt-cells = <2>;
-
-            i2c0-pins {
-                pins-sda-scl {
-                    pinmux = <PINMUX_GPIO45__FUNC_SDA0>,
-                             <PINMUX_GPIO46__FUNC_SCL0>;
-                };
-            };
-
-            mmc0-pins {
-                pins-cmd-dat {
-                    pinmux = <PINMUX_GPIO154__FUNC_MSDC0_DAT0>,
-                             <PINMUX_GPIO155__FUNC_MSDC0_DAT1>,
-                             <PINMUX_GPIO156__FUNC_MSDC0_DAT2>,
-                             <PINMUX_GPIO157__FUNC_MSDC0_DAT3>,
-                             <PINMUX_GPIO158__FUNC_MSDC0_DAT4>,
-                             <PINMUX_GPIO159__FUNC_MSDC0_DAT5>,
-                             <PINMUX_GPIO160__FUNC_MSDC0_DAT6>,
-                             <PINMUX_GPIO161__FUNC_MSDC0_DAT7>,
-                             <PINMUX_GPIO162__FUNC_MSDC0_CMD>;
-                    input-enable;
-                    bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
-                };
-
-                pins-clk {
-                    pinmux = <PINMUX_GPIO163__FUNC_MSDC0_CLK>;
-                    bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
-                };
-
-                pins-rst {
-                    pinmux = <PINMUX_GPIO165__FUNC_MSDC0_RSTB>;
-                    bias-pull-up = <MTK_PUPD_SET_R1R0_10>;
-                };
-            };
-        };
-    };
-- 
2.54.0


