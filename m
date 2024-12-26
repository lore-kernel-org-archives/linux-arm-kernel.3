Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF77E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 08:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9sM8TNdlMT6Lg8uce0MyGNCoKfN8+QMsCyG0KUBFUJ8=; b=NQkTp7CQo1NLgCp4rFOzlLMdAX
	tMPeSRY1+t4JwL6G4UPbo1I8+MzrG0Ch3gu5IINgvNxKsIZFmoODfbbKXcFaxvk5R67FC7sqD1GxB
	spneYuzd424LwjIblOibvbgmTLIAiV+KA3Tnsggf0V6rY5NLRIO+XSkM371hpJQWou0UXSpJut2pU
	IIZzxTlnR/A//sHELgdUdCCr/Evz7nFZVchXxizjsf8PeSJjzyMuYcunNgZGhat1TVzjV6XWrvcJ4
	9Ehd4azssDIQqvwS8eF1pwdAWyIx4PEaTuwk/+u7aici1xfWGBhqjP1QhnoB59NXN6tsmipVfRUiE
	pA2C8WOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQin1-0000000FRC6-1sAF;
	Thu, 26 Dec 2024 08:00:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQikd-0000000FQk3-2EhZ;
	Thu, 26 Dec 2024 07:57:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 518DAA40D34;
	Thu, 26 Dec 2024 07:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D66CAC4CED4;
	Thu, 26 Dec 2024 07:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735199865;
	bh=gTOTWCKaoxxo8Ex7qfjYkUHMB9N9xobWkSvkle5f6Qg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rVcsCp58otPwZmVXBO/wuFwZvl2BqGyGih+VDfA2y3X0BiGh2NtqBNaw69MlZrURk
	 wfgyyKVGxNTNqXGFPzb4IsFDegEHx0aTuVKA74c0K2SFJP3KouHct72qrIQgzK9ZeH
	 GWoeFuqHbNGwSE7EHGbtM/xXRhP056uSYxZWHr+fOmiB4exdw+tFL7ZUzABl6kypXP
	 nRAcR+yDZ+9JfTYUAgAAiiSxg2JOylrwpxpY3qTTS7JLiH5eEBczO91mDBe2T+r0FX
	 UoLYwcMLbPNB3+ROBOMk27wvRBfbhFpUmVRLNvbWG4K00gxr4UOZeGm6+89l+8L+A7
	 jHCHlN1ZkMvuw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5CF6E7718D;
	Thu, 26 Dec 2024 07:57:45 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 26 Dec 2024 15:57:41 +0800
Subject: [PATCH v2 1/5] dt-bindings: pinctrl: Add support for Amlogic SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241226-amlogic-pinctrl-v2-1-cdae42a67b76@amlogic.com>
References: <20241226-amlogic-pinctrl-v2-0-cdae42a67b76@amlogic.com>
In-Reply-To: <20241226-amlogic-pinctrl-v2-0-cdae42a67b76@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735199863; l=6815;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=GJhCWt6Ek9YGee2cyPccZRinuTJdUUzwSYc2PN5oozg=;
 b=xkbnFoJvUDDa2jg2I25X+yvZSoBSM6iXsAJ96C1ix4ByiUTKxNmpoqTeih7zhKusp5jw7jX9Q
 ysKm7M5O0ugDFAwaZvhNr0YvB023NJECeOnzyGtaUGb+sI9/A9oxxDG
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_235747_718312_562183D6 
X-CRM114-Status: GOOD (  16.08  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add the dt-bindings for Amlogic pin controller, and add a new
dt-binding header file which document the GPIO bank names and
alternative func value of all Amlogic subsequent SoCs.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       | 155 +++++++++++++++++++++
 include/dt-bindings/pinctrl/amlogic,pinctrl.h      |  68 +++++++++
 2 files changed, 223 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
new file mode 100644
index 000000000000..75863d179933
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
@@ -0,0 +1,155 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-a4.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic pinmux controller
+
+maintainers:
+  - Xianwei Zhao <xianwei.zhao@amlogic.com>
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+properties:
+  compatible:
+    const: amlogic,pinctrl-a4
+
+  reg:
+    minItems: 2
+
+  reg-names:
+    items:
+      - const: mux
+      - const: gpio
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#address-cells"
+  - "#size-cells"
+
+patternProperties:
+  "^gpio@[0-9a-f]+$":
+    type: object
+
+    properties:
+      reg:
+        minItems: 2
+
+      mask:
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      gpio-controller: true
+
+      "#gpio-cells":
+        const: 2
+
+      ngpios:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 1
+        maximum: 32
+
+      identity:
+        description: |
+          identifier are provided by the pin controller header file at:
+          <include/dt-bindings/pinctrl/amlogic,pinctrl.h>
+
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+    required:
+      - reg
+      - gpio-controller
+      - "#gpio-cells"
+      - ngpios
+      - identity
+
+    additionalProperties: false
+
+  "^func-[0-9a-z-]+$":
+    type: object
+    additionalProperties:
+      type: object
+      allOf:
+        - $ref: pincfg-node.yaml#
+        - $ref: pinmux-node.yaml#
+
+      description:
+        A pin multiplexing sub-node describes how to configure a set of (or a
+        single) pin in some desired alternate function mode.
+        A single sub-node may define several pin configurations.
+
+      properties:
+        pinmux:
+          description: |
+            Integer array representing pin number and pin multiplexing
+            configuration.
+            When a pin has to be configured in alternate function mode, use
+            this property to identify the pin by its global index, and provide
+            its alternate function configuration number along with it.
+            bank identifier are provided by the pin controller header file at:
+            <include/dt-bindings/pinctrl/amlogic,pinctrl.h>
+            Integers values in "pinmux" argument list are assembled as:
+            (((BANK << 8) + PIN) << 8)  | MUX_FUNC))
+
+      required:
+        - pinmux
+
+      additionalProperties: true
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
+    apb {
+      #address-cells = <2>;
+      #size-cells = <2>;
+      periphs_pinctrl: pinctrl@8e700 {
+        compatible = "amlogic,pinctrl-a4";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0x0 0x8e700 0x0 0x04>,
+              <0x0 0x8e704 0x0 0x60>;
+        reg-names = "mux", "gpio";
+
+        gpio@14 {
+          reg = <0x14>,<0x30>;
+          gpio-controller;
+          #gpio-cells = <2>;
+          ngpios = <10>;
+          identity = <AMLOGIC_GPIO_B>;
+        };
+
+        func-uart-b {
+          uart-b-default {
+            pinmux = <AML_PINMUX(AMLOGIC_GPIO_B, 1, AF4)>;
+            bias-pull-up;
+            drive-strength-microamp = <4000>;
+          };
+
+          uart-b-pins1 {
+            pinmux = <AML_PINMUX(AMLOGIC_GPIO_B, 5, AF2)>;
+            bias-pull-up;
+            drive-strength-microamp = <4000>;
+          };
+        };
+
+        func-uart-c {
+          uart-c-default {
+            pinmux = <AML_PINMUX(AMLOGIC_GPIO_B, 3, AF1)>,
+                     <AML_PINMUX(AMLOGIC_GPIO_B, 2, AF1)>;
+            bias-pull-up;
+            drive-strength-microamp = <4000>;
+          };
+        };
+      };
+    };
diff --git a/include/dt-bindings/pinctrl/amlogic,pinctrl.h b/include/dt-bindings/pinctrl/amlogic,pinctrl.h
new file mode 100644
index 000000000000..03db0a730e8b
--- /dev/null
+++ b/include/dt-bindings/pinctrl/amlogic,pinctrl.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
+ * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
+ */
+
+#ifndef _DT_BINDINGS_AMLOGIC_PINCTRL_H
+#define _DT_BINDINGS_AMLOGIC_PINCTRL_H
+
+/* define PIN modes */
+#define AF0	0x0
+#define AF1	0x1
+#define AF2	0x2
+#define AF3	0x3
+#define AF4	0x4
+#define AF5	0x5
+#define AF6	0x6
+#define AF7	0x7
+#define AF8	0x8
+#define AF9	0x9
+#define AF10	0xa
+#define AF11	0xb
+#define AF12	0xc
+#define AF13	0xd
+#define AF14	0xe
+#define AF15	0xf
+
+#define AML_PIN_ALT_FUNC_MASK	0xf
+
+/* Normal PIN bank */
+#define AMLOGIC_GPIO_A		0
+#define AMLOGIC_GPIO_B		1
+#define AMLOGIC_GPIO_C		2
+#define AMLOGIC_GPIO_D		3
+#define AMLOGIC_GPIO_E		4
+#define AMLOGIC_GPIO_F		5
+#define AMLOGIC_GPIO_G		6
+#define AMLOGIC_GPIO_H		7
+#define AMLOGIC_GPIO_I		8
+#define AMLOGIC_GPIO_J		9
+#define AMLOGIC_GPIO_K		10
+#define AMLOGIC_GPIO_L		11
+#define AMLOGIC_GPIO_M		12
+#define AMLOGIC_GPIO_N		13
+#define AMLOGIC_GPIO_O		14
+#define AMLOGIC_GPIO_P		15
+#define AMLOGIC_GPIO_Q		16
+#define AMLOGIC_GPIO_R		17
+#define AMLOGIC_GPIO_S		18
+#define AMLOGIC_GPIO_T		19
+#define AMLOGIC_GPIO_U		20
+#define AMLOGIC_GPIO_V		21
+#define AMLOGIC_GPIO_W		22
+#define AMLOGIC_GPIO_X		23
+#define AMLOGIC_GPIO_Y		24
+#define AMLOGIC_GPIO_Z		25
+
+/* Special PIN bank */
+#define AMLOGIC_GPIO_DV		26
+#define AMLOGIC_GPIO_AO		27
+#define AMLOGIC_GPIO_CC		28
+#define AMLOGIC_GPIO_TEST_N	29
+
+#define AML_PINMUX(bank, offset, mode)	(((((bank) << 8) + (offset)) << 8) | (mode))
+#define AML_PINMUX_TO_BANK(pinmux)	(((pinmux) >> 16) & 0xff)
+#define AML_PINMUX_TO_OFFSET(pinmux)	(((pinmux) >> 8) & 0xff)
+
+#endif /* _DT_BINDINGS_AMLOGIC_PINCTRL_H */

-- 
2.37.1



