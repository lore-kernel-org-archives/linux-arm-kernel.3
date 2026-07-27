Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AA8C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 18:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fi69UeDJQv2RitmlOYzaOUng+vmp2f9k6Jeo3FaU8d4=; b=McWGCnb0aRw95XDFCeglT76RAm
	JTerZkILYkt3vvXppmUVw2rJcsiN8zpNvQXcIpnB5cvybHnBLdi4SOm5OcQYSl79r5030BpjSBUSG
	1DmUtsvzNdIEI06krBhkwtYZWWQbd8d+hmqJMybkZlhX/q51Kf7qt9JM+Q/bUFN+jNKuShpV1fatK
	BbSgZHRTJK68Cco9cXPEy2nh2L7SZ5eDisXSPgTWdFleu2Z9zlVlNkNjkkCsPWX2McMiH5ZWifgK6
	SfpjQez/kjGKGdihZdmBgchlw2L/VptRaR+kFiQ0CIupgmXZWO1H3R8XPfFUlTVvCIcT6deIUWY+M
	DZQ/38AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQ12-00000003daE-15Ai;
	Mon, 27 Jul 2026 18:25:28 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQ0z-00000003dXX-0Yam
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 18:25:27 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so29889475e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 11:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785176723; x=1785781523; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fi69UeDJQv2RitmlOYzaOUng+vmp2f9k6Jeo3FaU8d4=;
        b=mujez2B4d+e0dhAzqluDea2oWDAUpynvG0NxzuyX2b2EReYlVA/p3t+0PQiHg4auY3
         gNitl4/+Vc6Tleiuo1339Yo+upHHNgcE1CmMhKadHqokKbH1xPqhTaszeTenby9retja
         yvzsmfWbHYCmueMVWxeo6kOI8YsqfcmiJB2k41EEH5i7keFRwwDRh6poB0E02H/XfgBr
         ZddUlZdQCjsEiXVTIKCjyaaKVjw5cSl1vu6n+39yu6EgmGvpwdxnNFwXD8bA0dWOe/MV
         gZpb6ICwLUzbUukTEF439gArVf1A1vgryBo5FXFp1zQrCn/7GFi6FDXwKjhPfMOyp2Vp
         M8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785176723; x=1785781523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fi69UeDJQv2RitmlOYzaOUng+vmp2f9k6Jeo3FaU8d4=;
        b=E6NO8wmiJwcAAPKMS3kJGX+h8xX+HcRaWSmlAUifE6HMOJGIOUVxdzKOR40x/5UEqT
         A1A/NqTBaBZUVKEUUM1AZqPxv2GuygicVyvu0c2jZ7uCjfo1BtN2OSkYlo9mOmGxQsAk
         A6oQ85A9z16jMgZ8wzfBLc4hGLd+f3yKbS5wXl/jtyTKwHssgC8nPgJn3VOcOE+cJ7v6
         5FYC1s/g7xKsiifIgEC0z2sXBsNLZcUcBFJjxHWvhALoSN5eIMVDmFXxyFN2aNp1smgz
         SjksVMYBFkLBM0bDTm/qyfD8Q7kPneks28iX+j3KmRIBtm9xEzb1NtfA+XPeQjFEgQAo
         sKyA==
X-Forwarded-Encrypted: i=1; AHgh+RoHs1/bldSHscZF4yFiz4G/LU1oGG6tOWic+le3Yf6jlpRM7gKfWJ8rm+i584QJY6nFzCZf+1u9vIWCm15Qyj+z@lists.infradead.org
X-Gm-Message-State: AOJu0YzucpzIVXWMcLqW++xlu2cIRXxJbHF/CaYcMMoGaqMwRaxzTa/u
	PFR+RuEaF58/pkhSkf/Zjqe8lXWjb4CFRL0mjhvgSlL6FKJuX018Xqvs
X-Gm-Gg: AR+sD11cpSmhnLUAULD1gEhGDd+HTwrcjaHzMbHmgA+4LiPM2GQYr/3q4TEFw/fZdyP
	FhrUB70u1MwmAK08/B7pMHnNzAYJaBSj1TbGzEFRVMle4vqQMMaF0qXsRcC7dRVGwFa/+Hw7ISl
	MGGx8iZJyOfVKPA729S25Xyi8Hq9pnFa7QlnbPAu/XOY1d0R/9yXWCfMvRMJhGAEMc0ujSFZvYW
	Ul5oWvRxu9OFNTWEefXOh2y6p0VhLcr63zglpIRfv+g2BphZaYEIddpSiLr59AmjSQtnuz09AJ8
	MnBq2ZlZ8d+GbS4pjJvYL9OaQxBbH2ojp8a1R+SZsWgK8v9bOVdzyPEY+h1JEAbXVoyHb61CMrA
	FVF39A/tfQzm8DRhnFxpMo+oFfh+QIxDfRh0UsX5uT60zwuzsG8AN56/m3RKTpVKrRwWZy+zfam
	ZeOlLECJ9Ai+zh
X-Received: by 2002:a05:600c:a4f:b0:493:d741:5d72 with SMTP id 5b1f17b1804b1-496b57116e2mr152292915e9.38.1785176722964;
        Mon, 27 Jul 2026 11:25:22 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c53052sm50689288f8f.18.2026.07.27.11.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:25:22 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Mon, 27 Jul 2026 21:24:18 +0300
Subject: [PATCH v8 03/12] dt-bindings: clk: zte: Add zx297520v3 LSP clock
 and reset controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260727-zx29clk-v8-3-7a107b00f1dd@gmail.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
In-Reply-To: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
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
 bh=D0jwRCT6NU4HIEAYKyrwIaJChrW6UBZjDhcNTvtwrZo=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqZ6J6hwQr2nMRpqBcfS3Otf/+QLaWQlxs4dZq1
 cxaOxbKeaeJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCameiehsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJ50w/+J+xRydSpL3dX9V6Qpn5wlLkUP/ZifaQ
 Zz3UFP+P6TvtetSFEywmpCDYpvZI97iGrAvKnkm0XIufHTsJ6yDsI5kDkUtXQmr28WIcg3wBg2J
 aBP1p2RX2TYyL6fodT+Ikz+Liu0J1o7/McP3+itKHmTfnMYaOpAf4ygGv06kVhvB2AXN4MyEQxR
 vrNPol04s51TV5gy72w7gZLWdI+eamPVYhDhHMGJBgFHMuKUz7SLF/Mzj6q0OTb1YsBLDjSKe4m
 oYP73iYRbeYAzQjl5AdwA4sP46kd+Beozzqr4vt0zGqK+pfGsQjZb9VjKhfqKnDEWaMs/04Kr1U
 FlRKoPhAllgKkrkTD0IY2S3/DI9uhrMON8rGHdIoKcoxKweV3wug3ezOVkouQnwXzSNalwN5fDn
 ZnkRBCTdz4T4WdAbYgKgjRGGBMXwqeTG5Sgrxc7FpRtXwvOlAnjHr67eHXy7DMMHUKaQsa8O1BC
 uI9O8PR/u/avuPxpuUVHGQ7hsJCtOJknxY6QK+nb3ioE9kZnJ8jEK1STodHU/I/kV3SwbkTAuyk
 gwur0jEZVo0o+34OMmc+VbR6wsV6i0D4/Wwct2U/XTIuMqwaudYnx+bqIsdYfL/UMyaIVbCrF5B
 EzeqzojzUwrAlm42oXIQAdrbGyG/NHzxd+/YS5HH3Umtx5M+aVoA=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_112525_279246_F98D5A6A 
X-CRM114-Status: GOOD (  19.18  )
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
index dc2972ade70f..05322672b9b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3878,6 +3878,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
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
index 4682d4a599c6..69eef84b2f29 100644
--- a/include/dt-bindings/reset/zte,zx297520v3-reset.h
+++ b/include/dt-bindings/reset/zte,zx297520v3-reset.h
@@ -41,4 +41,23 @@
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


