Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C472D41C27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 09:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMXnuAdCa4biqfeSFsEHS1SxOkiFLXs1qrfKwGoxWUU=; b=rVfmzBuFphvpxk7AOzUE/ZV3gJ
	n3DKltwTTSKipc8DARR45xFwPex3k6ijfvERI+6qcAIffDySGU/g3zQ9XkGIFBZwHN16zeyQa9XPi
	sKNVe3e0MZQIsY4haWfLhg26fj0+O69AMan4Bb+WEqabLdvQ4D65VkwM83kv1uG54GmKzGs79QVA5
	Wl8ZA2vITGM6xjq23HYic0nlBrpZWBNAUXps8Sq3sPfrIdRS15Rg74KrBUxA3aZa4FsnWsEcKgyBc
	01sC4t6RPEGdPG6j2LJj5rNSRYsNTYypqygLtwTtcIiModF3XWS5vIwJS6zznAv97gkO6WUIO8Ci5
	Pl5fBeLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9wx-00000006HKZ-3WDj;
	Wed, 13 Nov 2024 09:46:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9om-00000006G95-3lDT;
	Wed, 13 Nov 2024 09:37:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=IMXnuAdCa4biqfeSFsEHS1SxOkiFLXs1qrfKwGoxWUU=; b=nfyc8pycfcDLYjJlufO/M/XwSy
	/3Mt9HMZ6Zy84nO6fH2bUKq5saOY40dmttjUEkiyftc6hc4ym5xT86ey9yYYmlTDUWlSUlCxzaorQ
	wgx9AmLF301Dtnv7xzfj+k9JE0X7qrhDeDvWcjEgSR/yUh9J/dGf/mE0BVmaFSPR7vsIGheK4AHhv
	i1bJ6LTNXojTBzU9JoBaLMlV3qcGsn4K0NpsgoGRAjQEZL7wCCkDCKsT06+Q+zzioTXREZVuxUYMg
	Rr/F+uTNcg+Mzhe36nYWOd5RbwdauYiNveiEE/wqdmPlqYmbViP38x+vqLmU6hLEQmcTuSAxe1nKq
	s193yAqQ==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9oi-0000000DDvG-2MIv;
	Wed, 13 Nov 2024 09:37:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 48793A40512;
	Wed, 13 Nov 2024 09:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C89E8C4CED7;
	Wed, 13 Nov 2024 09:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731490655;
	bh=jF8bZTWN3AB9XKsseQGVgxQ6RryMR2osjnjfCUqnOnU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TypZg6pLeCaSBoINbmBXk6UDfJHSDQ1MZdeHPE6ZxZYBdmGzk8phSSCuS817Zi3iv
	 yme7W9KturW9EgdfJdbd+hwqI3Lq+3GcHyp/9Ns6XwhBBVlVSs1iCsI2X5Ou3ArTQs
	 RM5JXDXIM7ecSswuxkdf7Tr/exVtrQoRQeBY2OVIjbVXmSOXWGBBZKziQMthmja6y4
	 8UQY0Rqn/Pi4eWnyPc9T/qzIA3eZoWtJiNwNe8gaetfgneqeLdYj2xEOCHFwntKV7+
	 JJOBptxJksr9ZhF4zLWuvCZVHiitsfFbEJ67yC4X2zA6IZT7Y4JoMqX9ZualujhNvc
	 0quTWQFWNp/8g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC03D41C00;
	Wed, 13 Nov 2024 09:37:35 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 13 Nov 2024 17:37:29 +0800
Subject: [PATCH v7 2/5] dt-bindings: pinctrl: Add support for Amlogic A4
 SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-a4_pinctrl-v7-2-0546a20c1c22@amlogic.com>
References: <20241113-a4_pinctrl-v7-0-0546a20c1c22@amlogic.com>
In-Reply-To: <20241113-a4_pinctrl-v7-0-0546a20c1c22@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731490653; l=4207;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=E8gcBsM6qojqj57hTy/vqLumXN1IUp3FUay7hZlvU14=;
 b=6g8W/fNaZ8PbmBSC3DbFf1TECvck9xVkg2eXOLWcM81cH+8yNpEH4njg3QQWAv+2GitlgLlVu
 tkOjeb49ionCc/xBLYfShpBF6tq1Q+0z0MEIEsVm54NUiSIYQmz5w5o
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_093741_677107_D8829590 
X-CRM114-Status: GOOD (  11.86  )
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

Add the dt-bindings for Amlogic A4 pin controller, and add a new
dt-binding header file which document the GPIO bank names of all
Amlogic subsequent SoCs.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../bindings/pinctrl/amlogic,meson-pinctrl-a4.yaml | 82 ++++++++++++++++++++++
 include/dt-bindings/gpio/amlogic-gpio.h            | 45 ++++++++++++
 2 files changed, 127 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a4.yaml
new file mode 100644
index 000000000000..357e9bb079eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a4.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pinctrl-a4.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic A4 pinmux controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+  - Xianwei Zhao <xianwei.zhao@amlogic.com>
+
+allOf:
+  - $ref: amlogic,meson-pinctrl-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - amlogic,a4-aobus-pinctrl
+      - amlogic,a4-periphs-pinctrl
+
+required:
+  - compatible
+
+patternProperties:
+  "^bank@[0-9a-f]+$":
+    $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
+
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        maxItems: 2
+
+      reg-names:
+        items:
+          - const: mux
+          - const: gpio
+
+      gpio-controller: true
+
+      "#gpio-cells":
+        const: 3
+
+      gpio-line-names:
+        minItems: 8
+        maxItems: 73
+
+unevaluatedProperties:
+  type: object
+  $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-pins
+
+examples:
+  - |
+    bus {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      periphs_pinctrl: pinctrl@4000 {
+        compatible = "amlogic,a4-periphs-pinctrl";
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges = <0x0 0x0 0x0 0x4000 0x0 0x02e0>;
+
+        bank@0 {
+          reg = <0x0 0x0 0x0 0x0050>,
+                <0x0 0xc0 0x0 0x0220>;
+          reg-names = "mux", "gpio";
+          gpio-controller;
+          #gpio-cells = <3>;
+          gpio-ranges = <&periphs_pinctrl 0 0 73>;
+        };
+
+        cec_ao_a_h_pins: cec_ao_a_h {
+          mux {
+            groups = "cec_ao_a_h";
+            function = "cec_ao_a_h";
+            bias-disable;
+          };
+        };
+      };
+    };
diff --git a/include/dt-bindings/gpio/amlogic-gpio.h b/include/dt-bindings/gpio/amlogic-gpio.h
new file mode 100644
index 000000000000..5bfdb39eeda8
--- /dev/null
+++ b/include/dt-bindings/gpio/amlogic-gpio.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
+ * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
+ */
+
+#ifndef _DT_BINDINGS_AMLOGIC_GPIO_H
+#define _DT_BINDINGS_AMLOGIC_GPIO_H
+
+#include <dt-bindings/gpio/gpio.h>
+
+/* Normal GPIO bank */
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
+/* Special GPIO bank */
+#define AMLOGIC_GPIO_DV		26
+#define AMLOGIC_GPIO_AO		27
+#define AMLOGIC_GPIO_CC		28
+#define AMLOGIC_GPIO_TEST_N	29
+
+#endif /* _DT_BINDINGS_AMLOGIC_GPIO_H */

-- 
2.37.1



