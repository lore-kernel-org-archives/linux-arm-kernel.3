Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C33C55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 20:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bwH7KHPpvKiIQMk1SGFUiLTv7fu0OKWz3bX9AA+//8g=; b=WTXdyYHnuepw7cYK1PZlJCiq/Y
	0bZEcUenSLKS3v4J1q1CMvgyx8oHOJKJbQAj0MmGL0EbNudVGiGu8lbYGI05ddNuu3pqpxoZvJu1B
	LxNLZWMTfaXetaC4WQ/TJmdE9AFv/Ld3eVQFVAQ8qAWo4xQZR/om5+GuFi2niAUCoTo0qzzMzWbhj
	N7zLvRLi27lpsBYXzPl0y+XUGT2HvJg7SWYYlVSDpUJT9RlHMOS5dZXA+J3RjbbI+MLwVm11bM+xr
	xBOL6ThJqLbgzO69x2sueHZswbQBun4nQjaW1E22TkFiD6Fyu7JUwMU6osLydTVdX/aGvFlwqotZd
	bypAxa5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqct5-0000000G1UG-1pqe;
	Sun, 02 Aug 2026 20:34:23 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqct3-0000000G1Sk-2V3f
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 20:34:22 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4956869750eso8458685e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 13:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785702860; x=1786307660; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bwH7KHPpvKiIQMk1SGFUiLTv7fu0OKWz3bX9AA+//8g=;
        b=gnJoIHpI5Ieq2pN8HjOf/2gsceKsol7vpdazrxhQI1cBb+oskR/q400nAViewP4/aS
         r13l1xI8KRaVn1w6EaVZi/yCTbVhNEOLIPgiivXrRfaOTUtZRacrw7rHHcbVhu9BwWl6
         wiN5B4zACktEsgs0ck5fzbnFulF8MllOVB7wkdK18oSD4fT/heEx+RLJ7ADqnQTGv71O
         APYnN0MUrpWFtU0A5DIvQLq4pjGOnWDmgOVmDpWvxeV/UuoROMdPqCbH1vixooXV7cSK
         mkVXr7s398LjsT67B65CUkplg1RmfZF6hNvuo5NXkXyjd6YPC43/hfxd3wPq/6pY8h4x
         i7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785702860; x=1786307660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bwH7KHPpvKiIQMk1SGFUiLTv7fu0OKWz3bX9AA+//8g=;
        b=r9SMjW516rca2hcSpeK1AqNCraP+hkbXrHSbqKb9jL6/tkzB6xmAzIFJM99zjpcjAW
         X7jUToVvtmvIE8gMcTeOhBoiZjsxVca1YP4Wo9c4IrqbSKMAxve3iIcV2AsJ7OXLjocO
         +2lJf2OuwMKwUKJxg98vKg2AMa6c+4n+cibaCELZthDokiOOJKkYYQrmZaqEGMBpoeS4
         L6gtYYcygxuCyjsxWu/7rU/Rqcu6u+vXfIU8/zEXRNe9hZt6TGjc5OmZf3hLLlTBG7mW
         4r1h5NHZDbF4QStluCivDjqL2HTehWbafiIWvPkGSc4Nqonf9dkRoDSGQyPUeP08hyFO
         rG8g==
X-Forwarded-Encrypted: i=1; AHgh+RoZOHA5U4/63N9fkp8za6iwszQ2UvIUrLgXYG1BinctxLrtkJnbwqtFOaVP4xbcF7VoaAvRKlYzyt75EFMwPGW2@lists.infradead.org
X-Gm-Message-State: AOJu0YzCZo67PAwUdumLMFnlVeoDsnOfWs++fQDh6Dq7qBUacMhCrtV+
	sH3xrooMafBehNtKWuxU3OzYNamy+ngAQQnTW1+fcQNC5zicjbnPVONb
X-Gm-Gg: AR+sD101jnfmKoogREaGe6eYydh5GV86N/wWzTVzK2b8pt6/ApYUaOkJL9QmNlpAujE
	1EHvpcqITyTT8F8L2dA9pNOowLtZitsfp5Wo1b1UQPfob8gNXBj6Dtp3Zw6jmE+04kyTm+lVhnR
	Ynt0f79Fv/3Y7ljv5DKa3shHUP6dmAbF5Et/4F7kmZaNY5cwgQBP9xijOUeLnM0e3PciOQaqA9r
	jLjnMMQpWugK/rZAL426FIZ+h/nQFlSAXKcokLHMt8rp5iVPXIrUWThTCdPX9MY12BQHqqdtaYE
	/pZdIdQ/nQ6Vhen9BKfK1a6/qd3/JkDZYHDtItRJadMpmPxr6k3CnMzriS1O6l++FUxs3gatt5E
	9CsOVmMo8LciYhis3rtprcOjF3meRAv5LzLMTSMHMPz2yfh/68LtQaPsyxr0vCkoJ8YMzow7NDi
	fqymPNk5Nvk+V5R7TtGEabG21ecDQxXxQ/0goLSEn0djPVU2PXuaNC7T6Ryl/G+GpXgIn9YQuRY
	A==
X-Received: by 2002:a05:600c:4f84:b0:496:bbcb:b0bb with SMTP id 5b1f17b1804b1-4980c674e31mr159929705e9.18.1785702859402;
        Sun, 02 Aug 2026 13:34:19 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.226.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807bb45ebsm118499905e9.4.2026.08.02.13.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 13:34:17 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 02 Aug 2026 23:33:35 +0300
Subject: [PATCH v9 03/12] dt-bindings: clk: zte: Add zx297520v3 LSP clock
 and reset controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260802-zx29clk-v9-3-d05530d85d28@gmail.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
In-Reply-To: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8435;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=6HbUp1XgLP1S/xWdAagL3LDdqylYbn+bB8kLn4o2B5U=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqb6myPOKV9BdAp2AJFp8+U6w4U7O88rt/6eLFC
 2H9CsbTcRiJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCam+pshsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJluhAAooDSN8cfmZ6bpdIA7Eqa9WvqbqcOJoO
 xx5T08W5nwqhDCr9od4f4uvJODVFxNnXvfopExi19dP+Do8X0Nn7YGH+tg77QJDapdjUB5InQaZ
 ywnlChXN2I7TIYKpvrsEcwoKD19UXXXJhDiKHJ7Eemvft4AzAJw1I5e6cQOtzdHL1Jbj+Q3Iwr1
 RH23G7wj1et03101pnXVljuIgw9Zve0Q5feqtkuu/8o8jfeELfy3tC7PwMixReF4I/8x5mDWgdW
 e3V8eeyjCblTDYM3H/zcTHu3UwsSAT19Y2c99X2PgFanF1tFPr57lGl5Ynj38BDzZ9nbqeEspus
 rPqdSP+FLh04JcDiaOvB6ywR7UVSi10W5n1SOUlt1DV4rTyPjZnXOnHe1n3jQ0QUyj2CywW1b95
 wf2SiId1Eqraw529WcrbYUUWcO4+Dl3TPzQvNYH1j08yB+9eZhzTlFI2aI0bCrBynNWlU4aXa2x
 UALarQ75iXwXu1aph4p7WftLbdwBcws0ztfs5jKj1DfMEqqco19FHqKMhUvKuN/we8ju1Mlj5Gd
 BTD/b0rEIfh1dTWpzYk9py2FM233/CKVKwio+ow8GJPOAzUau0PD4exCvV3yJZmzmlRsliRPGYt
 3/r+mzoyLNYogzrjU5gxSWVDG0p0F9sUQ5YPWYioDuCwRRQdP41g=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_133421_684074_5891A1AE 
X-CRM114-Status: GOOD (  18.72  )
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

The clock controller of the zx297520v3 Low Speed Peripherals is
relatively clean. One register per device with gates, muxes and resets
and for some devices a divider. There are even bits in the matrix
controller to control propagation of clock lines down to LSP.

The clocks are sorted by register address and I am convinced that the
device list is complete. There are, however, a few more registers that
are likely extra dividers for TDM and I2S devices.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

Patch changelog:

v8:

*) Start clock indices at 0
*) A minor grammar fix in the second paragraph of the binding prose

v5:
Rename from lspclk to lspcrm
Remove matrixcrm from example

v4: Order properties compatible->reg->clocks->clock->names->#cells
---
 .../bindings/clock/zte,zx297520v3-lspcrm.yaml      | 101 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 include/dt-bindings/clock/zte,zx297520v3-clk.h     |  37 ++++++++
 include/dt-bindings/reset/zte,zx297520v3-reset.h   |  19 ++++
 4 files changed, 158 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
new file mode 100644
index 000000000000..cfad0e0372f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/zte,zx297520v3-lspcrm.yaml#
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
+  devices. The controller is responsible for bringing the devices out of reset
+  and enabling their clocks as needed.
+
+  The controller receives its clock signals from the matrix controller, and
+  these signals need to be declared as clock inputs.
+
+  All available clocks are defined as preprocessor macros in the
+  "include/dt-bindings/clock/zte,zx297520v3-clk.h" header. Resets are defined in
+  the "include/dt-bindings/reset/zte,zx297520v3-reset.h" header.
+
+properties:
+  compatible:
+    const: zte,zx297520v3-lspcrm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Main PLL divided by 5 output from matrixcrm (124.8 MHz)
+      - description: Main PLL divided by 4 output from matrixcrm (156 MHz)
+      - description: Main PLL divided by 6 output from matrixcrm (104 MHz)
+      - description: Main PLL divided by 8 output from matrixcrm (78 MHz)
+      - description: Main PLL divided by 12 output from matrixcrm (52 MHz)
+      - description: Main oscillator output from matrixcrm (26 MHz)
+      - description: Timer oscillator output from matrixcrm (32 kHz)
+      - description: LSP pclk output from matrixcrm (26 MHz)
+      - description: TDM wclk mux output from matrixcrm
+      - description: DPLL divided by 4 output from matrixcrm (122.88 MHz)
+
+  clock-names:
+    items:
+      - const: mpll-d5
+      - const: mpll-d4
+      - const: mpll-d6
+      - const: mpll-d8
+      - const: mpll-d12
+      - const: osc26m
+      - const: osc32k
+      - const: pclk
+      - const: tdm-wclk
+      - const: dpll-d4
+
+  resets:
+    maxItems: 1
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
+  - resets
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx297520v3-clk.h>
+    #include <dt-bindings/reset/zte,zx297520v3-reset.h>
+
+    clock-controller@1400000 {
+        compatible = "zte,zx297520v3-lspcrm";
+        reg = <0x01400000 0x100>;
+        clocks = <&matrixcrm ZX297520V3_LSP_MPLL_D5_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_MPLL_D4_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_MPLL_D6_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_MPLL_D8_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_MPLL_D12_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_OSC26M_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_OSC32K_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_PCLK>,
+                 <&matrixcrm ZX297520V3_LSP_TDM_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_DPLL_D4_WCLK>;
+        clock-names = "mpll-d5", "mpll-d4", "mpll-d6", "mpll-d8", "mpll-d12",
+                      "osc26m", "osc32k", "pclk", "tdm-wclk", "dpll-d4";
+        resets = <&matrixcrm ZX297520V3_LSP_RESET>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 9a919e60254a..e01ef014c110 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3910,6 +3910,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd fixes
 F:	Documentation/arch/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	arch/arm/boot/dts/zte/
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
index a8477e9b2a14..8824740468a3 100644
--- a/include/dt-bindings/clock/zte,zx297520v3-clk.h
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -104,4 +104,41 @@
 #define ZX297520V3_SRAM0_PCLK			38
 #define ZX297520V3_GSM_CFG_PCLK			39
 
+#define ZX297520V3_TIMER_L1_WCLK		0
+#define ZX297520V3_TIMER_L1_PCLK		1
+#define ZX297520V3_WDT_L2_WCLK			2
+#define ZX297520V3_WDT_L2_PCLK			3
+#define ZX297520V3_WDT_L3_WCLK			4
+#define ZX297520V3_WDT_L3_PCLK			5
+#define ZX297520V3_PWM_WCLK			6
+#define ZX297520V3_PWM_PCLK			7
+#define ZX297520V3_I2S0_WCLK			8
+#define ZX297520V3_I2S0_PCLK			9
+#define ZX297520V3_I2S1_WCLK			10
+#define ZX297520V3_I2S1_PCLK			11
+#define ZX297520V3_QSPI_WCLK			12
+#define ZX297520V3_QSPI_PCLK			13
+#define ZX297520V3_UART1_WCLK			14
+#define ZX297520V3_UART1_PCLK			15
+#define ZX297520V3_I2C1_WCLK			16
+#define ZX297520V3_I2C1_PCLK			17
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
+
 #endif /* __DT_BINDINGS_CLOCK_ZX297520V3_H */
diff --git a/include/dt-bindings/reset/zte,zx297520v3-reset.h b/include/dt-bindings/reset/zte,zx297520v3-reset.h
index d79fa601afa6..303fbef12a42 100644
--- a/include/dt-bindings/reset/zte,zx297520v3-reset.h
+++ b/include/dt-bindings/reset/zte,zx297520v3-reset.h
@@ -39,4 +39,23 @@
 #define ZX297520V3_VOU_RESET			9
 #define ZX297520V3_LSP_RESET			10
 
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
 #endif /* __DT_BINDINGS_RESET_ZX297520V3_H */

-- 
2.54.0


