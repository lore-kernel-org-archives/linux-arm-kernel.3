Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31195C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 20:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c8/d2fA+B3hujBNrRgW3Ki1+UBYpRhJxFw6zSzFTsN8=; b=v991N5rqryAi0RZ2y/t5qT3W4W
	rnStBhI4olqHzCHQVU2h3K8KH5HwXgvXAVV4Fl5vmfXj/8OPirQEOPsCfBVnzCox4i0z1W2PAK1gN
	ZbRx28Gy4QXPxomJgPeJYbtm4vpzHKaG/J2XIrV8LqFnPDbNLfMhObugyM9Kawmidm/Q8OwqrYrkM
	JUE9oE7GDUt8hk6OfWEoQVFtrR/C28uC3dzoH1G+YDrfTGD+9vVqZ7UH+xAZu1N+KX12mmLp9pp7q
	pYds+M9HPyup39IqdqDwLcAu4GDwTpr0BfI5bT1j2GsUtAwgvkYFVlkw93+ruXCCMRCYsKeR66F5S
	Qt/A5FDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfO1b-00000005RXh-3zTQ;
	Thu, 02 Jul 2026 20:28:43 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfO1a-00000005RW7-017v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 20:28:43 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-493bab44440so6397335e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 13:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783024120; x=1783628920; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8/d2fA+B3hujBNrRgW3Ki1+UBYpRhJxFw6zSzFTsN8=;
        b=Ddai36PyM1kCMzgypsv3Amnp0W+YdEiUCTDCX7gIZLC6NdgfA6ekzKeEvS991UUkzm
         6OmgJT6IBJWvrRd3/vLbWx+UMWAMu2+iIcFFfB7PK7Vh1h1+qE2hfsk6mJGf0bnhiB/v
         K/7zs2vTmV6gOVaB6cbNzA3LekXjgcFZS+reUR1yLNaSaR6+ou481xScb7FL5Ky6/kPw
         fyPZzlIAKRU1EeU9O6LKV9tmgZYSpmgECN4gF9kvNQWRhGbJ9cKLSeTUEAIkjl/XjUAL
         HOGK91HY0EGvcPYqZPNgvBSGfCgSZUeMkBZKz3b+/oLNkADNZL4agB/5JFeydUE+lz+7
         Lteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783024120; x=1783628920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c8/d2fA+B3hujBNrRgW3Ki1+UBYpRhJxFw6zSzFTsN8=;
        b=I+cteG24k4C+UIavdh2GTclCoMa+PPvXghJ5ELr1DSYpC8zvTyRhKhwRMaLBC+6gNg
         D9Jn4XUT/tbS9k2wJfM9YdK2i8q/+RYMFK0Mu8yX5GiTw/hLmT4gseGgANgP0kc9vVee
         HU4135yV8ItnMo5MRl2BH86khYypMTlRAQx/foQ2wsE7pMSXyicg8/qo0XfNKNfKaUkq
         jw/f8/q2G12CWnsuJuQIV8B/V73L/KgS8OUKBM9iQD+sIWtS4pM9SebU189hyrmfNJGr
         D43a6Vt8CnlBSd3F8KvOOLbqtX+BszeEny5iSaFBxDexgRCLeApCsLhDYhxqaKh6Nprt
         eBOQ==
X-Forwarded-Encrypted: i=1; AFNElJ8rQQ/2JYK3dHPn2JLClTNVelAGHu5OYzMvrFKh52OpoDBRs+5DmbqPgpk0FI7df8A6y7WTYZmO9fQ3DOch9MhM@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwg3ci/LoYKWP2f5hDBiOr+1GY6gUngjydcWJeeKnF/rQOVHNw
	A+53V/BasWRr9HDMqWfACKVJB4+g1AXM3bHwpGHFAjyz/+7WZrokIaxC
X-Gm-Gg: AfdE7ckWbfcPIQ4+bGDJPsPde75UJMmmGaUG9gIr1F92ymKp1OCmaUZoZY74Tv7Spci
	x7/WPzZfqOpp77G6euQQQB9AJWxaVX3TKc9OHj/qpgE2h7tNPDbFsmEprffoNBqq/Z5rZxBcXcB
	5a5zQKCXvJvWU6Gk0Cdjr8luXfyRCILahBrSLq9YqKydNO1AXP0llQOYi8C9RGG1t2A6pPa9YT6
	OXF6J7oXPrmAxyFKDOa54OBdbSb+hYs5t+7lX6lceDICYQ2FofAKUfpnseXF+0j6v2Ead2x7Db0
	MQLxg1f2Q0O392XEWKdHBa/S2bauVYwrFOR4A5R99PeZ/Hk9RoMaOPCW7uyV0w+JaV+MHmAO1Ya
	PvM2Jjv+djXJkQfla4upllswj0ajx7FgK+9mA4vGdlrg7t7ktjJ+kDTefork7JcGPIaDnlmc6++
	Rw3boPJ8Gol94bscGFzuyAIG0=
X-Received: by 2002:a05:600c:c4a6:b0:492:714d:8c4 with SMTP id 5b1f17b1804b1-493c9b580dbmr19969635e9.11.1783024119818;
        Thu, 02 Jul 2026 13:28:39 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6369488sm80321145e9.9.2026.07.02.13.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 13:28:39 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Thu, 02 Jul 2026 23:27:58 +0300
Subject: [PATCH v6 03/12] dt-bindings: clk: zte: Add zx297520v3 LSP clock
 and reset bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260702-zx29clk-v6-3-377b704f80c4@gmail.com>
References: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
In-Reply-To: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8046;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=YwAaviAiI99N0nPb5b1YtMmeFZuTEPdjFOmGt4hXrNA=;
 b=kA0DAAgBPRO8yFRPGiIByyZiAGpGyemjKJ0TdBb+3x2hIZju3zqwcSIT/9lq7TkMWvalhsnzm
 4kCTwQAAQgAORYhBEMW9LaqBVsnlTJdbD0TvMhUTxoiBQJqRsnpGxSAAAAAAAQADm1hbnUyLDIu
 NSsxLjEyLDIsMgAKCRA9E7zIVE8aIiSgEACkQUy7qbNtb/9S2T4zd17Qssa+tU0RAq9RaU/SCxj
 KAgYJKw043u433e7ml1pWakzdkZ31a9Hl2r/Cb9JyK3LlGwlNXhdSNo7NoeHxHRAKmWh807F3nL
 BFd1gLwQJV0ED2O3MoAsel77XFwjo5Od9S+MC18Ak2cPP5Yxl8rrWQQGVBqmFvkQvXjU8M2Ha6U
 45eR0JwIECd72oj0YTwX8E6Q2mowoh1xh4D4fD4qaNYtat5tbBedOLDeMFZOdusAhRBSRxCS0/f
 N47g+gZb54LXaCw1olpdvIEJrvkZxAzOt5k6rGTwUc9f1uDrLNrZAlazRxlJZzTpL+BHGPZQ3mB
 +SMLhgE9G9RgsUIk9dSc2sVguEBb6ROWG/BGJsau2KRdHGahHuHh2WojxtNnuJeRHyvJtuQMjZe
 zN7V1TkqvlOfU03NAvO47ddlpSObK0Z2OuDNnrF2VuZAm8spzYt2sGYVWbZG6IrnNXWcexSLfF2
 dd3cjIQLCuGbXWT3rxNnVIrtGECaxzI/CBf8D87UqKlt6bjiFcP5xHcR5HlQKxjdoUwwJY8ej8o
 qo0rPzNtoSAGn9GOHt5GHIUIuS4d42sUbebmgMkblTLeJawEGNN70UlmNp4Gul6L+7uou8G8D9d
 tLXs5AnSY1D7q4axXElJv3xNwPAmzwFydfE+3s+S+xg==
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_132842_095799_D744FF47 
X-CRM114-Status: GOOD (  18.68  )
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
device list is complete. There are however a few more registers that are
likely extra dividers for TDM and I2S devices

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Patch changelog:

v5:
Rename from lspclk to lspcrm
Remove matrixcrm from example

v4: Order properties compatible->reg->clocks->clock->names->#cells
---
 .../bindings/clock/zte,zx297520v3-lspcrm.yaml      | 96 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 include/dt-bindings/clock/zte,zx297520v3-clk.h     | 37 +++++++++
 include/dt-bindings/reset/zte,zx297520v3-reset.h   | 19 +++++
 4 files changed, 153 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
new file mode 100644
index 000000000000..c510129068de
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
@@ -0,0 +1,96 @@
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
+  The controller receives its clock signal from the matrix controller and need
+  to be declared as clock inputs.
+
+  All available clocks are defined as preprocessor macros in the
+  'dt-bindings/clock/zte,zx297520v3-clk.h' header. Resets are defined in the
+  'dt-bindings/reset/zte,zx297520v3-reset.h' header.
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
+      - description: Timer oscillator output from matrixcrm (32 KHz)
+      - description: LSP pclk output from matrixcrm (26 MHz)
+      - description: TDM wclk mux output from matrixcrm
+      - description: DPLL divided by 4 output from matrixcrm (122.88 MHz)
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
+        clock-names = "mpll_d5", "mpll_d4", "mpll_d6", "mpll_d8", "mpll_d12",
+                      "osc26m", "osc32k", "pclk", "tdm_wclk", "dpll_d4";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 2b1cf28dff5d..ceedfa359d47 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3878,6 +3878,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd fixes
 F:	Documentation/arch/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
 F:	Documentation/devicetree/bindings/soc/zte/
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
index 8a6aa456a708..3c390211f897 100644
--- a/include/dt-bindings/clock/zte,zx297520v3-clk.h
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -131,4 +131,41 @@
 #define ZX297520V3_SRAM0_PCLK			35
 #define ZX297520V3_GSM_CFG_PCLK			36
 
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
 #endif /* __DT_BINDINGS_CLOCK_ZX297520V3_H */
diff --git a/include/dt-bindings/reset/zte,zx297520v3-reset.h b/include/dt-bindings/reset/zte,zx297520v3-reset.h
index 81ffc8bc34c5..85a2f0707cdc 100644
--- a/include/dt-bindings/reset/zte,zx297520v3-reset.h
+++ b/include/dt-bindings/reset/zte,zx297520v3-reset.h
@@ -39,4 +39,23 @@
 #define ZX297520V3_GMAC_RESET			7
 #define ZX297520V3_VOU_RESET			8
 
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


