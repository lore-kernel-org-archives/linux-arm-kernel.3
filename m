Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA49BCD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 20:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1Y7VWEFPR+VTtT3NJmqQWRzBo4PZWm5r9ohgpgGtBQ=; b=lhuNazXimXUrKn9dQSgxHNQ79p
	G90z/DqJSIoaJ181DTSQZwqWrSI1+kmB68S0vpKD/HEL3z3ThITcNgRKOG1APuW3LmZmfbI3Ou1/J
	UUUx3I81cuxdqAbCbxMxeKsME7+e7sRcq/FREY9N+7N5XZrRPJm8P3rzQt7iZt26w0bgvRjyHgNxu
	JWLXQDKkQzw9MhrE+2C+JuHhl9M+FaAvzlhjedPeuJKhxvdea5vgT3HwBx2nwozaPS4OlwhyBiCUT
	259iRoJRVZqSGNs5YxIPrOFc7M270rtYrDeksJmjgWRIU8TxQlssxp2wmiJu/dMgmstIr8c2yeZAb
	+RSUVLgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZaNI-0000000GHuL-2hJL;
	Tue, 16 Jun 2026 20:27:08 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZaNE-0000000GHrf-3rIS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 20:27:06 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso2595595e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 13:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781641623; x=1782246423; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N1Y7VWEFPR+VTtT3NJmqQWRzBo4PZWm5r9ohgpgGtBQ=;
        b=Q5X7rmjCfIeLo0SoMIdUEORriXJQApa6oSqCG+MxNcDHybV2qB/zsKQ9kugrpSwf/Y
         rVLujDaeqt7lJVJznQLfoQqqkqI3nIbITcAy48pYolTyh+ceXP6LtFH/3+CmU8n917wF
         jt16cd9ZoJGnLf42izTs0g0Gt6wKFuzef0ld90ythkvLSmdyLsQCrz07hZUpWgnutkOv
         ziNOa+sQ1eAIgdbcp6kFpwqudH73Pa5S55Uc8TvKQLTjGt3Z6Oo3U7UKEruH7BsT+XiT
         7U5FlECgDUGm18vjq8L0n/cXO9+jEGzIx6pSvEI8+CYv51x/HhAKlL+p1DkqX61ui+Fe
         2G4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781641623; x=1782246423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N1Y7VWEFPR+VTtT3NJmqQWRzBo4PZWm5r9ohgpgGtBQ=;
        b=ZP8LcxnvmP2abGUKi3t5rwHiNg4laVK01PVY69YfzbXF7qMwbbmiY+O0ugcvMoe2WA
         5OIcMMvrw4CLI2B9VXVqVMO94jTQA9f4plvEogHFwrHfyX87tpEeb/c22gutnKSx7zLl
         CQgRHz9ZoDHtzBidyWUr4ZnsNz2mZaBUd9BFZYg9mKfmBL11+7om4QDQWNHSn/85F7dl
         MK/97pyFpPldtYvGB40W6Z/tnqeZCggCqqmiKaoe+lnuniAbP9JBPbASMYOJsJJLL9pV
         KSnarvVn/2frL08y4SHf4pRqVrkHguMJUfpbghsBcdzcP54EReFlx4NNzxBUmjGjY6/q
         nfDg==
X-Forwarded-Encrypted: i=1; AFNElJ9FUeOBI4d0OluBw60tylnOBfUnV0MMGg0zTONmudrwpgzAg2Upm7iLbA9nYVglL6GQ0We4pEzb2n87sCKpI9hB@lists.infradead.org
X-Gm-Message-State: AOJu0YwTLAFwKVfPnA5wu5hNTqxMzSsoIwkNTePKdMS+BNBAPSiE/jac
	oqwwuGoNiwTbYpaFL8pOumPB/OmFcNBMWx5dG11ECrHFguynjkuRGXxV
X-Gm-Gg: Acq92OHl+6c7ZCVl0Mqi4gLRxH3GMUaKzCBHW9X4bTp9hKGn9Wbio/1kFmedGDloGUx
	DIQvWvw0YUeLKviNUWypm2qvql4QMca4zLGDoTMZNUSol4P2QuZRpUFc1Q27tQXfkJJhWXYQfmv
	eHcvuWjW7sUQRYbTtGfCHYPs31aYZXt6m7X2bHLZcbcu9Y6thLoOgaaycKlmqy8+Sxk8UCfZX7w
	77/BOUBi3X84UmsOITnSlC95lg9VZitD4tbu8+rnv78Wp4LsGI1v1j+FTZOg7Z0AXQQcL2vwpmX
	fw0exHWxlJ66S7B/mt5zOxSA9BXDGyfixAgTJrEFRQPpRu04v4Pu22iKFt5UKBILyFzdCb5WDG5
	sKnct9Not4To/yNQlSg4mi//1LBk88v0HwOWQ+Y3pLp/Fu72QNqbHGQqi8R/z0i2VA586t3+36W
	3DYZLnzptVw04rykCFVOqbe5Ae8qLaLTLngu04DHV/1JZq
X-Received: by 2002:a05:600c:c178:b0:490:c1cb:48f4 with SMTP id 5b1f17b1804b1-492340e76camr3368855e9.12.1781641622717;
        Tue, 16 Jun 2026 13:27:02 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm89987005e9.3.2026.06.16.13.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:27:02 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Tue, 16 Jun 2026 23:26:23 +0300
Subject: [PATCH RFC v4 03/12] dt-bindings: clk: zte: Add zx297520v3 LSP
 clock and reset bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260616-zx29clk-v4-3-ca994bd22e9d@gmail.com>
References: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
In-Reply-To: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9172;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=uRtL3tXTNxFSsXIeunxk1WnL31X8l1JDXBwiyONwhLk=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqMbGGnvcq6tfQFw4fbpiGVAhHG8grApZMUdDUI
 rdKTTUDY4SJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCajGxhhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLy7w//Vn8KOlR9kFU4wiu7vQgPoLA+Jj3qoY4
 reoGxqevBcOKtJql+ac2AaQNrfLncREb7f7rnAVegOpGWpPMxvcQaY5mVjSqAUlCW8wuuSa9ev3
 3qMRCu2eD2UX1zY46nbjLz04qC3mzSmF16yS9NNDBavCZLNUdjDlwpo8bByLihq/C4h9Kjz2eYc
 MG0wNJs+P2pyevflaKATcGtqOA8omDd3K6UkDvTerSisOSPLoNwogBT5qYn7nOIE2ErOuHxCY+6
 OMDyIn8yEVY2jjI0bq3RwhjoLKWlH/tWczF4RueWV4YQFl6TXptPKaDDA+nqEtIXuiB+VJI1ChT
 T4+AurmnAe7WiaWUpDUCGIsFdDDrZjU35G6NZazAPnZkHxNY7YYQHCAOJe525sGQ54ecbZTjsom
 K0Jxr3QneEnDe+U7000SR7YOVazl6LM3NAxBj072N7+JT1XzXR/rkeqV06yNcAyZQBD+mCk0JHm
 ompM/+C6mHQ6ao6Mv4KAhtgByy7WaFA2fEYvpdsQ+37mPttUMxjmA6qka8FwmApZyKvZwHgg9kQ
 GIkI6LZZGoO/Vg6HMxOZMeinL3B9Hi1H/1uFeFUzNGmiCyS8xPeNly3LqEc53an+FCm2IdRm7X4
 9RQirwQhe6s/zq3y/lLE4rC1PGoRLhW1mr8OosRjDbJnMcCXBVdI=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_132705_014451_C757303D 
X-CRM114-Status: GOOD (  16.54  )
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

The clock controller of the Low Speed Peripherals is relatively clean.
One register per device with gates, muxes and resets and for some
devices a divider. There are even bits in the top controller to control
propagation of clock lines down to LSP.

The clocks are sorted by register address and I am convinced that the
device list is complete. There are however a few more registers that are
likely helper controls for the I2S and TDM devices.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Patch changelog:

v5: Order properties compatible->reg->clocks->clock->names->#cells
---
 .../bindings/clock/zte,zx297520v3-lspclk.yaml      | 130 +++++++++++++++++++++
 include/dt-bindings/clock/zte,zx297520v3-clk.h     |  56 +++++++++
 2 files changed, 186 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspclk.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspclk.yaml
new file mode 100644
index 000000000000..096295edb6e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspclk.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/zte,zx297520v3-lspclk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx297520v3 SoC LSP clock and reset controller
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+description: |
+  This clock and reset controller controls low speed peripherals on the board.
+  This is a relatively isolated subsystem containing UART, I2C, I2S and SPI
+  devices. The clock controller is responsible for bringing the devices out of
+  reset and enabling their clocks as needed.
+
+  The controller receives its clock signal from the matrix controller and need
+  to be declared as clock inputs.
+
+  All available clocks are defined as preprocessor macros in the
+  'dt-bindings/clock/zte,zx297520v3-clk.h' header.
+
+properties:
+  compatible:
+    const: zte,zx297520v3-lspclk
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Main PLL divided by 5 output from matrixclk (124.8 MHz)
+      - description: Main PLL divided by 4 output from matrixclk (156 MHz)
+      - description: Main PLL divided by 6 output from matrixclk (104 MHz)
+      - description: Main PLL divided by 8 output from matrixclk (78 MHz)
+      - description: Main PLL divided by 12 output from matrixclk (52 MHz)
+      - description: Main oscillator output from matrixclk (26 MHz)
+      - description: Timer oscillator output from matrixclk (32 KHz)
+      - description: LSP pclk output from matrixclk (26 MHz)
+      - description: TDM wclk mux output from matrixclk
+      - description: DPLL divided by 4 output from matrixclk (122.88 MHz)
+
+  clock-names:
+    items:
+      - const: mpll_d5
+      - const: mpll_d4
+      - const: mpll_d6
+      - const: mpll_d8
+      - const: mpll_d12
+      - const: osc26m
+      - const: osc32k
+      - const: pclk
+      - const: tdm_wclk
+      - const: dpll_d4
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx297520v3-clk.h>
+
+    matrixclk: clock-controller@1306000 {
+        compatible = "zte,zx297520v3-matrixclk", "syscon";
+        reg = <0x01306000 0x400>;
+        clocks = <&osc26m>, <&osc32k>,
+                 <&topclk ZX297520V3_MPLL>, <&topclk ZX297520V3_MPLL_D2>,
+                 <&topclk ZX297520V3_MPLL_D3>, <&topclk ZX297520V3_MPLL_D4>,
+                 <&topclk ZX297520V3_MPLL_D5>, <&topclk ZX297520V3_MPLL_D6>,
+                 <&topclk ZX297520V3_MPLL_D8>, <&topclk ZX297520V3_MPLL_D12>,
+                 <&topclk ZX297520V3_MPLL_D16>, <&topclk ZX297520V3_MPLL_D26>,
+                 <&topclk ZX297520V3_UPLL>, <&topclk ZX297520V3_UPLL_D2>,
+                 <&topclk ZX297520V3_UPLL_D3>, <&topclk ZX297520V3_UPLL_D4>,
+                 <&topclk ZX297520V3_UPLL_D5>, <&topclk ZX297520V3_UPLL_D6>,
+                 <&topclk ZX297520V3_UPLL_D8>, <&topclk ZX297520V3_UPLL_D12>,
+                 <&topclk ZX297520V3_UPLL_D16>,
+                 <&topclk ZX297520V3_DPLL>, <&topclk ZX297520V3_DPLL_D2>,
+                 <&topclk ZX297520V3_DPLL_D3>, <&topclk ZX297520V3_DPLL_D4>,
+                 <&topclk ZX297520V3_DPLL_D5>, <&topclk ZX297520V3_DPLL_D6>,
+                 <&topclk ZX297520V3_DPLL_D8>, <&topclk ZX297520V3_DPLL_D12>,
+                 <&topclk ZX297520V3_DPLL_D16>,
+                 <&topclk ZX297520V3_GPLL>, <&topclk ZX297520V3_GPLL_D2>,
+                 <&topclk ZX297520V3_GPLL_D3>, <&topclk ZX297520V3_GPLL_D4>,
+                 <&topclk ZX297520V3_GPLL_D5>, <&topclk ZX297520V3_GPLL_D6>,
+                 <&topclk ZX297520V3_GPLL_D8>, <&topclk ZX297520V3_GPLL_D12>,
+                 <&topclk ZX297520V3_GPLL_D16>;
+        clock-names = "osc26m", "osc32k", "mpll", "mpll_d2", "mpll_d3",
+                      "mpll_d4", "mpll_d5", "mpll_d6", "mpll_d8", "mpll_d12",
+                      "mpll_d16", "mpll_d26", "upll", "upll_d2", "upll_d3",
+                      "upll_d4", "upll_d5", "upll_d6", "upll_d8", "upll_d12",
+                      "upll_d16", "dpll", "dpll_d2", "dpll_d3", "dpll_d4",
+                      "dpll_d5", "dpll_d6", "dpll_d8", "dpll_d12", "dpll_d16",
+                      "gpll", "gpll_d2", "gpll_d3", "gpll_d4", "gpll_d5",
+                      "gpll_d6", "gpll_d8", "gpll_d12", "gpll_d16";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
+
+    clock-controller@1400000 {
+        compatible = "zte,zx297520v3-lspclk";
+        reg = <0x01400000 0x100>;
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
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
index 815e8ceeb64e..57387529a708 100644
--- a/include/dt-bindings/clock/zte,zx297520v3-clk.h
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -160,4 +160,60 @@
 #define ZX297520V3_GMAC_RESET			7
 #define ZX297520V3_VOU_RESET			8
 
+#define ZX297520V3_TIMER_L1_WCLK		1
+#define ZX297520V3_TIMER_L1_PCLK		2
+#define ZX297520V3_WDT_L2_WCLK			3
+#define ZX297520V3_WDT_L2_PCLK			4
+#define ZX297520V3_WDT_L3_WCLK			5
+#define ZX297520V3_WDT_L3_PCLK			6
+#define ZX297520V3_PWM_WCLK			7
+#define ZX297520V3_PWM_PCLK			8
+#define ZX297520V3_I2S0_WCLK			9
+#define ZX297520V3_I2S0_PCLK			10
+#define ZX297520V3_I2S1_WCLK			11
+#define ZX297520V3_I2S1_PCLK			12
+#define ZX297520V3_QSPI_WCLK			13
+#define ZX297520V3_QSPI_PCLK			14
+#define ZX297520V3_UART1_WCLK			15
+#define ZX297520V3_UART1_PCLK			16
+#define ZX297520V3_I2C1_WCLK			17
+#define ZX297520V3_I2C1_PCLK			18
+#define ZX297520V3_SPI0_WCLK			19
+#define ZX297520V3_SPI0_PCLK			20
+#define ZX297520V3_TIMER_LB_WCLK		21
+#define ZX297520V3_TIMER_LB_PCLK		22
+#define ZX297520V3_TIMER_LC_WCLK		23
+#define ZX297520V3_TIMER_LC_PCLK		24
+#define ZX297520V3_UART2_WCLK			25
+#define ZX297520V3_UART2_PCLK			26
+#define ZX297520V3_WDT_LE_WCLK			27
+#define ZX297520V3_WDT_LE_PCLK			28
+#define ZX297520V3_TIMER_LF_WCLK		29
+#define ZX297520V3_TIMER_LF_PCLK		30
+#define ZX297520V3_SPI1_WCLK			31
+#define ZX297520V3_SPI1_PCLK			32
+#define ZX297520V3_TIMER_L11_WCLK		33
+#define ZX297520V3_TIMER_L11_PCLK		34
+#define ZX297520V3_TDM_WCLK			35
+#define ZX297520V3_TDM_PCLK			36
+
+#define ZX297520V3_TIMER_L1_RESET		0
+#define ZX297520V3_WDT_L2_RESET			1
+#define ZX297520V3_WDT_L3_RESET			2
+#define ZX297520V3_PWM_RESET			3
+#define ZX297520V3_I2S0_RESET			4
+#define ZX297520V3_I2S1_RESET			5
+#define ZX297520V3_QSPI_RESET			6
+#define ZX297520V3_UART1_RESET			7
+#define ZX297520V3_I2C1_RESET			8
+#define ZX297520V3_SPI0_RESET			9
+#define ZX297520V3_TIMER_LB_RESET		10
+#define ZX297520V3_TIMER_LC_RESET		11
+#define ZX297520V3_UART2_RESET			12
+#define ZX297520V3_WDT_LE_RESET			13
+#define ZX297520V3_TIMER_LF_RESET		14
+#define ZX297520V3_SPI1_RESET			15
+#define ZX297520V3_TIMER_L11_RESET		16
+#define ZX297520V3_TDM_RESET			17
+
 #endif /* __DT_BINDINGS_CLOCK_ZX297520V3_H */

-- 
2.53.0


