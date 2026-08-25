Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965D4C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 21:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wz9K9LS2Ea9+A1Snt9mSbTqxp0uUm7G3461p9py5FAs=; b=nRw0syeLDJF5l9K3aa9x/pcJ0W
	r/MaNB/0bg1puyoZP81mSbO7NbXOD2INHbUH+e8hQAh+VhcNRk7Gh0sy35d7lBp6vDKGy4xNgQ33t
	JOC0DAW2ATanbTojZE/NqbZMAfaSQDlXXz89nlWYjhEBQaz39bSgoelP2aimuve9a9JVCzGumxLwt
	Sg8Cuhgw/v5qXoHddvWjs9rNhRFnzsYfbAfa6HzpT0DQnFjqWzZnV6E+zM+jHlcoKCKS3N6UKUj2C
	GRj9vDb27A6fFmA6e95CiVSfSBaJy4h2O94UCZQ3MHcIah7K32HctQETsA9KiTlzEZafNX+JIn+BF
	29p0skkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyydV-00000001VgO-3sdD;
	Tue, 25 Aug 2026 21:24:49 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyydQ-00000001VcF-1b7A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 21:24:46 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6a144c8eea2so480842a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 14:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787693083; x=1788297883; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wz9K9LS2Ea9+A1Snt9mSbTqxp0uUm7G3461p9py5FAs=;
        b=WIHxGgL8RtfnoOQR0ene8uB7R5Fdu2pkjJkSSkXIQmpa3gvL0bXxWqy1phWJQaO+r5
         pm6Ou9MXLIaAbu9qY8bWdzEq03qON3z8Da9vyB2uEGbzfC7RLAfMXhYntMPfWo3zUvIj
         GhLExp89VP8TrePJjuN/86k/FL45/VDJX04rumn44FDwhTRmMvmof/5AykwgldisABmb
         el3QQQGY+6SJErLaEQkvFtruIugqL8Vq+MCFIb9HYwEqjqh6T+rO5LNLLbLKIVQEk+Ud
         TY7SNT1HluvNsVOUVVST/sj2Jtq14uDqTnYcfQKuKLLvetWRfe2Wnuy6CkEOmYVltsVU
         9wpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787693083; x=1788297883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wz9K9LS2Ea9+A1Snt9mSbTqxp0uUm7G3461p9py5FAs=;
        b=Cy9hINO8UZ+zAQeMpR16NnoPXEaaxOi+Th4+qkD2+AlKPRgR50WWHiUFaRGJelpWdt
         K+baHcnxkTu2DQIGtFbsYe32fwpL4sjky0bPvWSyqv2Fu+MhYqyHeceoQ1OV8Orbb61V
         P6Pw096hhvPW8RBsPpBh2y4dKPEqhOqjXQnqswF4PXHVSRW8xO0fp61ofDbWemyI0jXS
         iPe4lSsCpvqaVK/KgZyG8WJFLtHsUcDwGNYRnNkimRDgAXXjzvKt/nnI3Q5a6NCdBy8x
         tM3iFfzIQ+VSBb/9S5+FRv5QwghegjWEA+Q1IBLECFntVwpkGP5hocrNzyeeiyKcDKh8
         m0wQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqs25alol1OO9A6Q+Ro4JdlPzSo45gPl29awlNUsFZdG74JN6Mwv5JH6ZQJHaSnTKix8WBkj4DsqHmsZn+4gDRK@lists.infradead.org
X-Gm-Message-State: AFuF++mDmU8vpWUhqFtTiK2aXphXLiBif9g+JRM7bTRYJCkLzx1EnA3Q
	BgvABE1vCfwsiJ9Ds4Cry7pavzv+BXG7AaMa1/1UFCx2W5SUAGq6LtxN6gpxwiN0vHM=
X-Gm-Gg: AR+sD10wo8BC11FF3mZQH67rykGJsxG6ObHZC/Lz/Cc5gfBgFLPiM8nau71WzWiH4Xy
	8xeDk3PlGkicLjSOn9F5kSDlQIVOf5RxuHODg46fnM+8t4TN6wS2VxNMqSOsMk3npwmwn4XAbFx
	vehoX9qJjBY9XgbfZW4X3LDObck90qcJ7uzjmckhIfTwAYpeVeH+ftZJ/gSLk9HeYIPjx+N5S0o
	KOjyNT/M2pJSw3MTfAa0/mHcOsRulgUwiAz9aDrWLOU9XNYTwRwSrEEcVTD4NvmtZ1TFEVHyLAh
	hN97DBzlUMixlNztOFaHmGXzx0E+WZcVfmVtktgPp/B5ODVdVbWZfR8HQ9+S+6cAI0cCnCK6JSX
	7fMX2JBaRFQ/9LKnCtgm03I48TelWNtg2IMi7VAQ236VWX7Gc81qmbzkXPY9P1S+q5vO1gHquK2
	IdwsCqnnYDoPwjfPZdo2lu2zrGBd8IkV9rTd0j1fndmprS5GrKitrY9G+c35l1cYNVEfbJe632m
	mkwm7cW
X-Received: by 2002:a17:906:7947:b0:c15:f598:60c0 with SMTP id a640c23a62f3a-c250bb7e838mr213578266b.4.1787693082521;
        Tue, 25 Aug 2026 14:24:42 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9ec343sm98297866b.57.2026.08.25.14.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 14:24:41 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 26 Aug 2026 00:24:02 +0300
Subject: [PATCH v11 03/12] dt-bindings: clk: zte: Add zx297520v3 LSP clock
 and reset controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260826-zx29clk-v11-3-f8ad59c6426c@gmail.com>
References: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
In-Reply-To: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8538;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=7Q7rDju/Sb9uNF2sg7XuNuMaorQf+MPeVghQidtskfM=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqjggC7pGfN97wSeW2ZcWggIulezNcy5jT8gDoj
 aGq7YhPcYKJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCao4IAhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiK1uA/+MgBtkirc4h4/r3o67Dv09Yl75JkJO6A
 cgLcJIgMEOYljBY35K8I+0pZZoN8EVQ1DRi2v2/yy3DqiaN02QJL4+y2d7vgi1qPhEn5MV0QPOb
 PANoEMPnJWqCCELEq+Rog4nS0HGmUJRWyH3vFlG+l5Li4r0p/D13c2Cc3q3joBZ/G15EWfodjOI
 zpyV7JcikGbT8Dy2It0DVfMwlt9b15Ss63Sm/gf4l7HGYIdnr42X9OrYFf13dbZM9W4/E98GZX7
 dyqN3KXZA6fdN/ZDYUYx+XB+WkHYa9fu284gk4h8H0mgTMx4dsPCpne5KVywFbIDgAikyxIyQ35
 UkzDa8nSCd8ORQU+IrGxD1SKz7/ILHT/R8MvvQ+k7ZK0XjM0F9LQJzTPFKVoV9JbKopTorLtgLE
 LAUlGhsZZmQwFcINDU7+PvDErorOA7TjlpHe185Vf/OquDVgW+xlhNzubOtTIjWDR7I0SRgkoM9
 s/aQ/KNS5/KDkdsM1xnLD9lg+RvGvpoj1n9ejlsYwJ1znVaRngEkyKksY3mMFVqrjdjMOMX2ovb
 uOYcpxH8GhAeEq0e9FiP9k36Xz8mJYh+gOaTx5hj6ELTHo5Om22OzU/P88UYO9AYqJUPJSAr01a
 NMgXJOH9YaOjUvOvI/cH1NE00I8uao5BrEhVNEkNUDk8IWif9f40=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_142444_567424_5D13F601 
X-CRM114-Status: GOOD (  19.16  )
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

v10:
Fix order of clock-cells and reset-cells in the example to satisfy
dt-check-style --strict.

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
index 000000000000..b0a176ffda12
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
+        #clock-cells = <1>;
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
+        #reset-cells = <1>;
+        resets = <&matrixcrm ZX297520V3_LSP_RESET>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index bb1f349e40eb..acec8c1e0fc9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3901,6 +3901,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd fixes
 F:	Documentation/arch/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	arch/arm/boot/dts/zte/
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
index a5e5d5f17c87..0e8c73671139 100644
--- a/include/dt-bindings/clock/zte,zx297520v3-clk.h
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -105,4 +105,41 @@
 #define ZX297520V3_SRAM0_PCLK			39
 #define ZX297520V3_GSM_CFG_PCLK			40
 
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
index 54e5b24f859a..b21d5901a7b9 100644
--- a/include/dt-bindings/reset/zte,zx297520v3-reset.h
+++ b/include/dt-bindings/reset/zte,zx297520v3-reset.h
@@ -40,4 +40,23 @@
 #define ZX297520V3_VOU_RESET			10
 #define ZX297520V3_LSP_RESET			11
 
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


