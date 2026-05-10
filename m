Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D37BCD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 19:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Y4bpMXA9dLIyws/xAA80YyQ4eVqEzh8/1BvF+CshSE=; b=1uHXhYrAUAyMjzB4KqPBV4eTMA
	ob75tHyLJAmtg87oxBycwM1XHKR6SD2lgKIJZNI42q3Yrc4njBWaaQNvNtgOJDGubZxZhKCS7Vcz8
	xdjeT1epdsSnXEnvcSMrr8AzZa/bcqrKvw7JFlG8jqc+Mnfm+1z3an7Hxwk3pxB0ij81I7Y6OL38s
	bM3YEtSJ02fROXud8LE230bNNIIBVdJt7q6clE+ctLbPeh7oKkxgjnruffLr2t3jm8Wisi+sZzxqV
	fM7M4XMF3muuHJ/iLyl3nfiZe+SiAB3rcfLUTQmunbwAL47cAukYazJ8fAE3DkBgE54yi71EUDQGu
	SaNj8PrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM9P3-0000000BRHA-3wvj;
	Sun, 10 May 2026 19:01:25 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM9P1-0000000BRFi-3rwo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 19:01:25 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so60811255e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 12:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778439682; x=1779044482; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Y4bpMXA9dLIyws/xAA80YyQ4eVqEzh8/1BvF+CshSE=;
        b=HEVMN8ykGOcRNjSk5pCr6sDzI7w22nv05GQH1bAvSYryWlTEiaq93X/lpAsdjWoaXG
         cfpcqcf6igS+Hquh/6kOY9RAXQWWiznJkpYcy0NiCEM8OC2rAjS/pzilmQaw8bPtrQlQ
         l07MaBMtCFqUbZpR8raEzugj/YLcHM+/zi/z9M1tuSNbh9pcNPL9N5tnqowim4ySN6WK
         6CwrZLgPMK0H2ojInLd0M3BUVfxWNKmTnm5OtZJTRf/7oGZGjvvFoaWz1EAxHrHmtPaF
         RJcekK9tCdLccWQ8LCJdZ63yG/ACQIMFL17tzERU+OFdZkjzHAjOiTSlJXtMgtC9IQEf
         ZEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778439682; x=1779044482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1Y4bpMXA9dLIyws/xAA80YyQ4eVqEzh8/1BvF+CshSE=;
        b=Zl70F1uvvzemzm4UhVkXiYiCGvGefYAyRZIqDUbCu4fuGMdw/537HljAb9rdGkviRX
         KKwuINj2PWHUslwltraE2QtcVCyV/1iC5H2TFrMhajOwmH28ITsSReFWJz0pfNY9ANyj
         a9A69qgGcCUc3SaQh8EncTnpjngVJ3gNjS2EhD+NRdj67Qc+I67OYCQVZfwXhfusMLTW
         fp/LpFp8eMcgmA3frtEpreWofofvFlLwchRNXgRG1+z2s64WFOlx+Wy5GovhOPdH8JUY
         cE+bX4LbOyhh8qWKep8gd3bAkKSeif9XZ+4E0eIHnTvl0A36iOdDtYOw35tT0cDJT+NN
         0akw==
X-Forwarded-Encrypted: i=1; AFNElJ8da9eciVoGZXfvyXxUxq++SoqblkiWHPqLP/wYRIWtgLcJYGgLFvt4VCL986Gk6pywzEv7mcK0U0ITO74Mu4Wk@lists.infradead.org
X-Gm-Message-State: AOJu0YzD5dXYSlk7Q4YFCevkkLvcBIW9s3vSnoG+2OwQmasGZmUsOU6I
	/AXSUnFTPhocsiw/h93TMOAN1/xLEAbTU+mCF0f7VYaxx3eYBSyKkAcA
X-Gm-Gg: Acq92OF7VuMq88xEvQqi1ovy9oqpGnIkt14kXUrVwhwEpZjOkgLomsYEB24AVRLH/9M
	axoHUXTzm9GiL6ImapYsXRCPnHi/0EdQEAvDsOuozIrqmiFeBoA7/ggZTadVCPkTf5Uh0pCrHh7
	EydfjynX/5p44PiJu5HnQoXdS9uCm6i7MrJA+OReQdefPMpa1IJ1g534deG1snGqc6JH+AgFGL3
	IBTOmW39VUkj53UZXaRZCs3/0bXerWlCs0WnYFTFJgzqqxkJlfMsBknDPijCzZ8HARuc30dkFM0
	I7LQAMNLFAiSoRRA/MoFQaegcZIBnI1qQWbt36i69Uaogzwm3DHOd+dEQjCgNsXVEOew8pk+7iq
	Cjg20bVgl4pxiv3kVSCodf1yENQ7nccG+xGZ7C1inlFplRiWRtLcSXZJEBEIS5TcpkSclShBxuO
	q40TEQgs1jKVeGSerQ13U4VtwgKrlA87+h/w==
X-Received: by 2002:a05:600c:8b06:b0:485:4388:3492 with SMTP id 5b1f17b1804b1-48e51e223ccmr357669875e9.11.1778439681476;
        Sun, 10 May 2026 12:01:21 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e701e9585sm132877475e9.5.2026.05.10.12.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 12:01:20 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 10 May 2026 22:01:00 +0300
Subject: [PATCH RFC 1/4] dt-bindings: clk: zte: Add zx297520v3 clock and
 reset bindings.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260510-zx29clk-v1-1-e1bacfffe967@gmail.com>
References: <20260510-zx29clk-v1-0-e1bacfffe967@gmail.com>
In-Reply-To: <20260510-zx29clk-v1-0-e1bacfffe967@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=15475;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=9PBytlOdxzrPJbIqiajYqPTsWWSCL3zrgDIhFWyyBXI=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqANX5V03cs0gJ0Oc/d8zFavnicMOpSIpXjDQnx
 LMcB4+MLv2JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCagDV+RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJSqRAAs+RumGyi9fbbK4DOPc2GaHd1aytK+Jh
 mFxTUvmuynn91svibBpLBKA2fAXsE8BkMkXSkySHiIz/VdgOUZp0bnBYq0BqhXpHLJhv5tMw4GN
 Z6w9+vGDW3fO4UogQx7mRzaBe9rLwcEEKgfJf+/WBs/mi6vZ5F7wd8qrbreU0UXkvCZHlWlna5x
 NUrDskLqaXIVgaULns/EsSLm9h8Dw8idBv0Q8OWqd/ACK+KErb9whwZ/uNLjz0a+KNs6ZVw1lsK
 qVbtNq8KIis/wuAmTBL/pSnEFP42BzAnsKndFjN3k7aOWBvVsQUWqwlH6WwbRJXtllc+mbOlQ2s
 wJgGUGkeqmRnPjhWpjqksnrUXS86yKcJ13KzYTtd25Rlf0MxNdw1o6ZuXSTwijZtMuI70wjmS1A
 2sylctqm2bU2pjBOLq83RiWsgfpZHBLeWsOzSLpl8dZiPSxhtHwQsSVjWfkzvQBsqtfoa3DkY4x
 ZvF/xubsa0uGE9QJyEagw15jO3/NoQdEg0g5ABAh2zJ2bi5oTpmAJ0IhYsHK32aI7o1Io4A37vN
 5cIMd3tUoyOyLnBtskpjovd7mOXOGBg5u5xwrhclnlM9p4dxI+M7xlXoBn6AvrwXZeydvu52zBJ
 XrnTljyKnyaHj9bM+yhMtEOKL3MEPxKVIHA9RqHzv/DR33/GfA48=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_120124_122091_6B586BEC 
X-CRM114-Status: GOOD (  31.07  )
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

These SoCs have 3 clock and reset controllers. The "top" controller -
all names follow ZTE's naming - controls core devices like the AHB bus,
most timers and the Cortex M0 that brings up the board. The register
layout is fairly chaotic. Some patterns can be found, but nothing that
holds true for all devices it controls.

Generally every device has two clocks (one work clock, and one that
connects it to the bus, I call it PCLK), two reset bits (I don't know
what the difference is - sometimes asserting one is enough to reset the
device, sometimes both need to be asserted) and one mux. Some devices,
like the GPIO controller, only have reset bits and no clocks.

The top clock controller is fed by a 26mhz external oscillator and has 4
PLLs to generate other clock rates. ZTE's kernel does not manipulate the
PLLs at all and relies on BROM and the boot loader to set them up. The
bitfields in the control registers are somewhat documented in a
Lauterback TRACE32 debug file in the kernel sources though. At the
moment, my driver extracts clock rates from the PLLs, but cannot change
them. A proper PLL clk is on my TODO list before I remove the [RFC] tag
from the submission. It will be necessary for the LTE hardware with
replacement boot loaders because BROM does not set up the LTE-related
PLL.

The "matrix" controller controls the main Cortex A53 CPU, the LTE ZSP,
SDIO and a few others. It is even more chaotic than the "top"
controller.

The "LSP" controller - I suspect it stands for "low speed peripherals" -
is very regular. One 32 bit register for 2 clock gates, two resets, one
mux (1-3 bit) and in some cases a 4 bit divider.

Not all clocks will have an explicit user in the end. I am defining a
lot of them simply to shut them off. The boot loader sets up a few of
the proprietary timers, which will send regular IRQs (although the
kernel of course doesn't need to listen to them). I don't plan to add a
driver for the proprietary timer as I see no use for them - the ARM arch
timer works just fine. I will add a driver for the very similar
proprietary watchdog though.

The top and matrix list is not exhaustive. There are other bits
that are enabled, but I couldn't deduce what they are controlling by
trial and error. Some of them seem to do nothing. Others cause an
instant hang of the board when disabled. I isolated a few (SRAM PCLK,
arm arch timer clock) where I don't see a reason to manipulate them. It
is quite likely that a handful more clocks will be added in the future,
but not a large number.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 .../bindings/clock/zte,zx297520v3-clk.yaml         | 173 ++++++++++++++++++++
 include/dt-bindings/clock/zte,zx297520v3-clk.h     | 179 +++++++++++++++++++++
 2 files changed, 352 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-clk.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-clk.yaml
new file mode 100644
index 000000000000..3b7084a18a97
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-clk.yaml
@@ -0,0 +1,173 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/zte,zx297520v3-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx297520v3 SoC clock and reset controller
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+description: |
+  The zx297520v3's clock controller consists of 3 controllers, which generate
+  clocks for internal SoC devices. In addition to clocks it also has reset
+  controls for most, but not all, devices.
+
+  While there is a certain hierarchy among the controllers ("top" controlls core
+  parts like the boot-up Cortex M0, "matrix" controls the main CPU and LTE DSP,
+  "lsp" controls peripherals"), in practise all 3 are required to reasonably
+  operate the SoC.
+
+  The top controller has two inputs: a 26 MHz and a 32 KHz external oscillator.
+  They need to be provided as input clocks. The matrix controller controlls 10
+  clock lines that get fed into the LSP controller. The LSP device node needs
+  to list these input clocks.
+
+  The matrix controller consumes clocks generated by PLLs in the top
+  controller, but there are no controls in the top controller to sever this
+  link. The interface between these controllers is not expressed in the device
+  tree, but the matrix controller cannot work without the clock handles
+  registered by the top controller.
+
+  All available clocks are defined as preprocessor macros in
+  'dt-bindings/clock/zte,zx297520v3-clk.h' header.
+
+properties:
+  compatible:
+    enum:
+      - zte,zx297520v3-topclk
+      - zte,zx297520v3-matrixclk
+      - zte,zx297520v3-lspclk
+
+  clocks:
+    minItems: 2
+    maxItems: 10
+
+  clock-names:
+    minItems: 2
+    maxItems: 10
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: zte,zx297520v3-topclk
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: External reference clock (32 KHz)
+        clock-names:
+          items:
+            - const: osc26m
+            - const: osc32k
+      required:
+        - clocks
+        - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: zte,zx297520v3-lspclk
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Main PLL divided by 5 output from matrixclk (124.8 MHz)
+            - description: Main PLL divided by 4 output from matrixclk (156 MHz)
+            - description: Main PLL divided by 6 output from matrixclk (104 MHz)
+            - description: Main PLL divided by 8 output from matrixclk (78 MHz)
+            - description: Main PLL divided by 12 output from matrixclk (52 MHz)
+            - description: Main oscillator output from matrixclk (26 MHz)
+            - description: Timer oscillator output from matrixclk (32 KHz)
+            - description: LSP pclk output from matrixclk (26 MHz)
+            - description: TDM wclk mux output from matrixclk
+            - description: DPLL divided by 4 output from matrixclk (122.88 MHz)
+        clock-names:
+          items:
+            - const: mpll_d5
+            - const: mpll_d4
+            - const: mpll_d6
+            - const: mpll_d8
+            - const: mpll_d12
+            - const: osc26m
+            - const: osc32k
+            - const: pclk
+            - const: tdm_wclk
+            - const: dpll_d4
+      required:
+        - clocks
+        - clock-names
+
+additionalProperties: false
+
+required:
+  - compatible
+  - '#clock-cells'
+  - reg
+  - '#reset-cells'
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx297520v3-clk.h>
+
+    osc26m: osc26m {
+      compatible = "fixed-clock";
+      clock-output-names = "osc26m";
+      #clock-cells = <0>;
+    };
+
+    osc32k: osc32k {
+      compatible = "fixed-clock";
+      clock-output-names = "osc32k";
+      #clock-cells = <0>;
+    };
+
+    topclk: topclk@13b000 {
+        compatible = "zte,zx297520v3-topclk";
+        reg = <0x0013b000 0x400>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        clocks = <&osc26m>, <&osc32k>;
+        clock-names = "osc26m", "osc32k";
+    };
+
+    matrixclk: matrixclk@1306000 {
+        compatible = "zte,zx297520v3-matrixclk";
+        reg = <0x01306000 0x400>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
+
+    lspclk: lspclk@1400000 {
+        compatible = "zte,zx297520v3-lspclk";
+        reg = <0x01400000 0x100>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+
+        clocks = <&matrixclk ZX297520V3_LSP_MPLL_D5_WCLK>,
+                 <&matrixclk ZX297520V3_LSP_MPLL_D4_WCLK>,
+                 <&matrixclk ZX297520V3_LSP_MPLL_D6_WCLK>,
+                 <&matrixclk ZX297520V3_LSP_MPLL_D8_WCLK>,
+                 <&matrixclk ZX297520V3_LSP_MPLL_D12_WCLK>,
+                 <&matrixclk ZX297520V3_LSP_OSC26M_WCLK>,
+                 <&matrixclk ZX297520V3_LSP_OSC32K_WCLK>,
+                 <&matrixclk ZX297520V3_LSP_PCLK>,
+                 <&matrixclk ZX297520V3_LSP_TDM_WCLK>,
+                 <&matrixclk ZX297520V3_LSP_DPLL_D4_WCLK>;
+        clock-names = "mpll_d5", "mpll_d4", "mpll_d6", "mpll_d8", "mpll_d12",
+                      "osc26m", "osc32k", "pclk", "tdm_wclk", "dpll_d4";
+    };
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
new file mode 100644
index 000000000000..322b53be8b12
--- /dev/null
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -0,0 +1,179 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) Stefan Dösinger.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_ZX297520V3_H
+#define __DT_BINDINGS_CLOCK_ZX297520V3_H
+
+#define ZX297520V3_AHB_WCLK			0
+#define ZX297520V3_AHB_PCLK			1
+#define ZX297520V3_PMM_WCLK			2
+#define ZX297520V3_PMM_PCLK			3
+#define ZX297520V3_USB_24M			4
+#define ZX297520V3_USB_AHB			5
+#define ZX297520V3_TIMER_T08_WCLK		6
+#define ZX297520V3_TIMER_T08_PCLK		7
+#define ZX297520V3_TIMER_T09_WCLK		8
+#define ZX297520V3_TIMER_T09_PCLK		9
+#define ZX297520V3_TIMER_T12_WCLK		10
+#define ZX297520V3_TIMER_T12_PCLK		11
+#define ZX297520V3_TIMER_T13_WCLK		12
+#define ZX297520V3_TIMER_T13_PCLK		13
+#define ZX297520V3_TIMER_T14_WCLK		14
+#define ZX297520V3_TIMER_T14_PCLK		15
+#define ZX297520V3_TIMER_T15_WCLK		16
+#define ZX297520V3_TIMER_T15_PCLK		17
+#define ZX297520V3_TIMER_T16_WCLK		18
+#define ZX297520V3_TIMER_T16_PCLK		19
+#define ZX297520V3_TIMER_T17_WCLK		20
+#define ZX297520V3_TIMER_T17_PCLK		21
+#define ZX297520V3_WDT_T18_WCLK			22
+#define ZX297520V3_WDT_T18_PCLK			23
+#define ZX297520V3_UART0_WCLK			24
+#define ZX297520V3_UART0_PCLK			25
+#define ZX297520V3_I2C0_WCLK			26
+#define ZX297520V3_I2C0_PCLK			27
+#define ZX297520V3_RTC_WCLK			28
+#define ZX297520V3_RTC_PCLK			29
+#define ZX297520V3_LPM_GSM_WCLK			30
+#define ZX297520V3_LPM_GSM_PCLK			31
+#define ZX297520V3_LPM_LTE_WCLK			32
+#define ZX297520V3_LPM_LTE_PCLK			33
+#define ZX297520V3_LPM_TD_WCLK			34
+#define ZX297520V3_LPM_TD_PCLK			35
+#define ZX297520V3_LPM_W_WCLK			36
+#define ZX297520V3_LPM_W_PCLK			37
+#define ZX297520V3_USIM1_WCLK			38
+#define ZX297520V3_USIM1_PCLK			39
+#define ZX297520V3_M0_WCLK			40
+#define ZX297520V3_TOPCLK_END			41
+
+#define ZX297520V3_AHB_RESET			0
+#define ZX297520V3_TIMER_T08_RESET		1
+#define ZX297520V3_TIMER_T09_RESET		2
+#define ZX297520V3_TIMER_T12_RESET		3
+#define ZX297520V3_TIMER_T13_RESET		4
+#define ZX297520V3_TIMER_T14_RESET		5
+#define ZX297520V3_TIMER_T15_RESET		6
+#define ZX297520V3_TIMER_T16_RESET		7
+#define ZX297520V3_TIMER_T17_RESET		8
+#define ZX297520V3_WDT_T18_RESET		9
+#define ZX297520V3_UART0_RESET			10
+#define ZX297520V3_I2C0_RESET			11
+#define ZX297520V3_RTC_RESET			12
+#define ZX297520V3_USIM1_RESET			13
+#define ZX297520V3_PMM_RESET			14
+#define ZX297520V3_GPIO8_RESET			15
+#define ZX297520V3_GPIO_RESET			16
+#define ZX297520V3_ZSP_RESET			17
+#define ZX297520V3_USB_RESET			18
+#define ZX297520V3_TOPRST_END			19
+
+#define ZX297520V3_CPU_WCLK			0
+#define ZX297520V3_CPU_PCLK			1
+#define ZX297520V3_SD0_WCLK			2
+#define ZX297520V3_SD0_PCLK			3
+#define ZX297520V3_SD1_WCLK			4
+#define ZX297520V3_SD1_PCLK			5
+#define ZX297520V3_SD1_CDET			6
+#define ZX297520V3_NAND_WCLK			7
+#define ZX297520V3_NAND_PCLK			8
+#define ZX297520V3_SSC_WCLK			9
+#define ZX297520V3_SSC_PCLK			10
+#define ZX297520V3_EDCP_WCLK			11
+#define ZX297520V3_EDCP_PCLK			12
+#define ZX297520V3_EDCP_SYNCAXI			13
+#define ZX297520V3_VOU_WCLK			14
+#define ZX297520V3_VOU_PCLK			15
+#define ZX297520V3_PDCFG_WCLK			16
+#define ZX297520V3_PDCFG_PCLK			17
+#define ZX297520V3_GMAC_WCLK			18
+#define ZX297520V3_GMAC_RMII			19
+#define ZX297520V3_GMAC_PCLK			20
+#define ZX297520V3_ZSP_WCLK			21
+#define ZX297520V3_MBOX_PCLK			22
+#define ZX297520V3_DMA_PCLK			23
+#define ZX297520V3_LSP_MPLL_D5_WCLK		24
+#define ZX297520V3_LSP_MPLL_D4_WCLK		25
+#define ZX297520V3_LSP_MPLL_D6_WCLK		26
+#define ZX297520V3_LSP_MPLL_D8_WCLK		27
+#define ZX297520V3_LSP_MPLL_D12_WCLK		28
+#define ZX297520V3_LSP_OSC26M_WCLK		29
+#define ZX297520V3_LSP_OSC32K_WCLK		30
+#define ZX297520V3_LSP_PCLK			31
+#define ZX297520V3_LSP_TDM_WCLK			32
+#define ZX297520V3_LSP_DPLL_D4_WCLK		33
+#define ZX297520V3_MATRIXCLK_END		34
+
+#define ZX297520V3_CPU_RESET			0
+#define ZX297520V3_SD0_RESET			1
+#define ZX297520V3_SD1_RESET			2
+#define ZX297520V3_NAND_RESET			3
+#define ZX297520V3_SSC_RESET			4
+#define ZX297520V3_EDCP_RESET			5
+#define ZX297520V3_VOU_RESET			6
+#define ZX297520V3_PDCFG_RESET			7
+#define ZX297520V3_GMAC_RESET			8
+#define ZX297520V3_DMA_RESET			9
+#define ZX297520V3_MATRIXRST_END		10
+
+#define ZX297520V3_TIMER_L1_WCLK		0
+#define ZX297520V3_TIMER_L1_PCLK		1
+#define ZX297520V3_WDT_L2_WCLK			2
+#define ZX297520V3_WDT_L2_PCLK			3
+#define ZX297520V3_WDT_L3_WCLK			4
+#define ZX297520V3_WDT_L3_PCLK			5
+#define ZX297520V3_I2C1_WCLK			6
+#define ZX297520V3_I2C1_PCLK			7
+#define ZX297520V3_I2S0_WCLK			8
+#define ZX297520V3_I2S0_PCLK			9
+#define ZX297520V3_I2S1_WCLK			10
+#define ZX297520V3_I2S1_PCLK			11
+#define ZX297520V3_QSPI_WCLK			12
+#define ZX297520V3_QSPI_PCLK			13
+#define ZX297520V3_UART1_WCLK			14
+#define ZX297520V3_UART1_PCLK			15
+#define ZX297520V3_I2C2_WCLK			16
+#define ZX297520V3_I2C2_PCLK			17
+#define ZX297520V3_SPI0_WCLK			18
+#define ZX297520V3_SPI0_PCLK			19
+#define ZX297520V3_TIMER_LB_WCLK		20
+#define ZX297520V3_TIMER_LB_PCLK		21
+#define ZX297520V3_TIMER_LC_WCLK		22
+#define ZX297520V3_TIMER_LC_PCLK		23
+#define ZX297520V3_UART2_WCLK			24
+#define ZX297520V3_UART2_PCLK			25
+#define ZX297520V3_WDT_LE_WCLK			26
+#define ZX297520V3_WDT_LE_PCLK			27
+#define ZX297520V3_TIMER_LF_WCLK		28
+#define ZX297520V3_TIMER_LF_PCLK		29
+#define ZX297520V3_SPI1_WCLK			30
+#define ZX297520V3_SPI1_PCLK			31
+#define ZX297520V3_TIMER_L11_WCLK		32
+#define ZX297520V3_TIMER_L11_PCLK		33
+#define ZX297520V3_TDM_WCLK			34
+#define ZX297520V3_TDM_PCLK			35
+#define ZX297520V3_LSPCLK_END			36
+
+#define ZX297520V3_TIMER_L1_RESET		0
+#define ZX297520V3_WDT_L2_RESET			1
+#define ZX297520V3_WDT_L3_RESET			2
+#define ZX297520V3_I2C1_RESET			3
+#define ZX297520V3_I2S0_RESET			4
+#define ZX297520V3_I2S1_RESET			5
+#define ZX297520V3_QSPI_RESET			6
+#define ZX297520V3_UART1_RESET			7
+#define ZX297520V3_I2C2_RESET			8
+#define ZX297520V3_SPI0_RESET			9
+#define ZX297520V3_TIMER_LB_RESET		10
+#define ZX297520V3_TIMER_LC_RESET		11
+#define ZX297520V3_UART2_RESET			12
+#define ZX297520V3_WDT_LE_RESET			13
+#define ZX297520V3_TIMER_LF_RESET		14
+#define ZX297520V3_SPI1_RESET			15
+#define ZX297520V3_TIMER_L11_RESET		16
+#define ZX297520V3_TDM_RESET			17
+#define ZX297520V3_LSPRST_END			18
+
+#endif /* __DT_BINDINGS_CLOCK_ZX297520V3_H */

-- 
2.53.0


