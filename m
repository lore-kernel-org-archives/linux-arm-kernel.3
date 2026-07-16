Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F2DC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5DP6p2yHa/CcMRK7GLBZhA5Xgmib1P3Zs9Lq82vtGTA=; b=Dp+ZNZGwQhhkh5ZYlnkhgjmzpi
	s7QMlj6tD1wu8Boq/Xxo6dgrRM0vDJhqJ2a6bTZhKDIvflJM8LHzz8/LCqV28kGx7gDin+bdHHxxS
	cEuzkBpyiLt3Jau0YZ90iyc0cCM/am779douGUJPA9CjQjvbklIXMM5IBjfRVZSZ/MxWPosCHxgru
	+OHkqkwfjJZ2YHoVHYmesjnikRyuFx2aiiYoKF3CitpDjGB+YxgoEaliCib5fA54M2ecywuJrwTZA
	/AJr/Fd0aN8q6OtwiCSCmzntVYwYTwCmhRVd4owGouPxdTZwqkBqncXpMhQ4HMJUV4UW25neQtvNo
	oHeL91og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTke-00000000eGj-1HmN;
	Thu, 16 Jul 2026 21:36:16 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTkW-00000000e9Z-46RV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 21:36:10 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47d70879764so5042847f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 14:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784237767; x=1784842567; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5DP6p2yHa/CcMRK7GLBZhA5Xgmib1P3Zs9Lq82vtGTA=;
        b=Mz8SJOr+RPR1aSLtlgl94TbEta0huTwoAfjYrcsLA88iOBzsrXFIyBk0+L/KLvPACi
         ASix2nu+XiSjRtsO75jpgym0Z2HfCLfwH5fGIodqEf/bPYen3q7I/gxYqBhKkLI0Xncy
         NdmK6ciNXODU44YsvGpI14WjXPRyUySacMzcCTu/sqCUIc5V7w67GZQgtC4BtO09BzB9
         Rqf7D+Zy9gqB5jQ8yD1fKG30z12Twb7onPmi2v4uXanMUXyjST3SNSZHD7ubP1JZdrvI
         CogtpRddZrxtqb71hqYnP9yxusNX1sSzuZF5PfgBUvmd4OOmxcavZ/dzLaGK9x/qeHNA
         PiWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784237767; x=1784842567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5DP6p2yHa/CcMRK7GLBZhA5Xgmib1P3Zs9Lq82vtGTA=;
        b=XSmehoSJ3X8N0chRFnSWHLS7KnclL6pO03YMxZZoa6rW9ZaePHMuGd+/MPTxJ8bfJG
         bLR4aLBP/BDVCVvFXwd6CepzQvn5reRkqyN9RwWSVSzc+9gRkJ/es8yUJqlNxASs7Qz6
         aClKjMtjj4WgT6ioJtVNyCfH0GC8IsSrA9uuI3RyiIbUEn32j80tnsokxhq/XzviilzF
         T32oUXywMcBRQBdcU+4faKpnbdyZWSlwKQfxpvsMAgTPWvpPu/NsakoXHfwLwtPrNsEx
         DVZ8Ynmj284HwWY1w8alIV85nfNq4WAcL9hhUrH/uO30RyaHWeOuC1kgQw6sIKLbi9/y
         lvAQ==
X-Forwarded-Encrypted: i=1; AHgh+RqHtuQVz6T6IXQYL+UpKRIfHGzitVX6xEZfm4BooBhizeP1rHuV4RvNeHSXcBAtDQCRrVNx2MoRcunbuTQvo9At@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu2XhkM1p2L62kvp5nNSl3KjIFqkIlN/Y7WFLrPThfa6QDkeA/
	iUd1q5XL4WHdpSsUOkFPRKopt9Ek+4CjrwX/Kj9belqBkpPGzpI6fx4L
X-Gm-Gg: AfdE7clfoZr+jxOuneWG4J3Eg9gKjUcsnq/BvLC6n4IikDKyo9SJexhllv27jjJd4M1
	UJVNSlxQTYgOEjegYszzR7mNXKrjoCZHyqd0bEzVhtgt7CF8Xqccr9oNPcQAvDswmWDjohEhZ3n
	2YVCmNUabcJpuiwoCIBkaB7fHa9ffXZKYcxTiTLCQt++MnCUdTMPkp4MK57IV9CYsiQzpS2TRoN
	V6riBjp4xMk3IvdAl36BYcO+DrOHUlB8OzvcFFt9dU15OfclsM0ffzYgo4Xew0bDLqQUug4Anl5
	20/SzoFsE8Qnnn8otJzd+eEPNCaIKLYbjY8CAVyvkCAQWkxioi30NHNMGAEInhFyoHk7Ge5rzVV
	Is28ix/Qs30uV+iU3pfMVyEdrvyQdbW1BRvSqOvZFg0Yl0+tr6poEVMhqgGfJjQRRRfuvWhz076
	mJh5VkWmLOGNSo
X-Received: by 2002:a05:6000:186c:b0:473:1089:154f with SMTP id ffacd0b85a97d-47f4fc51420mr10659026f8f.0.1784237766986;
        Thu, 16 Jul 2026 14:36:06 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464b7f09sm27517548f8f.26.2026.07.16.14.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 14:36:06 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Fri, 17 Jul 2026 00:35:40 +0300
Subject: [PATCH v7 04/13] dt-bindings: clk: zte: Add zx297520v3 LSP clock
 and reset controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260717-zx29clk-v7-4-408411cfcf36@gmail.com>
References: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
In-Reply-To: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8283;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=gYcmT5SJ16KzbPHs7e4lJ3zArzZ0tzAmOzulOMxIRpc=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqWU6xOb3DS42wYGwsdjarwcr/mneZNil63T/4W
 6o9UDh/HuyJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCallOsRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLlUw/7B8NHuS3CQ4Jg8Utn8bD8c8ESTEyjkhw
 BJQL3pXovBw22uKXEVinoBrVTuV7hmoWmszohC8SmhHu7q6dPnrNXPZ5zLeYtQFiZCGrNLbv1Ky
 TG+CjFIIhfPqZWTWP4FhBHjerLMTYFEkq6vkLG04Xz/fW0I6X5sD+KwVJin0sH+qTC+zfH/UN5w
 5rbankHqxVw8BYyRKitRduCoAXoSbuX5W6eyvE2ltCeiSW5W7aZTixIG0TxmirB9J7BoJMaG/Ly
 JNqk/zfaMwIy34srMdPa/OxV0prFYw4PgYXyz2ke8LFTHmlsTENYPsv20Y6NjWF7tqUhnjepKTo
 wSNLO5JjCRqXPyG9URkDS8K2FOnKDkUf+NgsnbYFs32sCq27ArageaFMNvGCgIesaPxAsvsg8Gd
 rzT4bkKrVeeGu1ZHmGPhNPGjHNokBbO8e8iAFFIX7NW8Bo4kQMoCFPF1TdBlOLLw0BTS9c4bDXU
 eiawR7GNl2enC+ktT652nSzAut3oMdjInYXIW7JqK9WaVHjDkihcDU9QEP+jjwPKwiZL4A+SwAs
 4jGP4w1Nf9kTRpz+0W5CxYXoZ3ICY8w7t7ZZtjgtNtREWYuokPEHewO2DEo3w2c11ocuYrr4jWQ
 YxBHOjX8T4LrMRvfdzs9Sq/GyBtRVyUxItK9hwGdH6rlxzLSublQ=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_143609_071821_C1518E23 
X-CRM114-Status: GOOD (  18.14  )
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
 .../bindings/clock/zte,zx297520v3-lspcrm.yaml      | 101 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 include/dt-bindings/clock/zte,zx297520v3-clk.h     |  37 ++++++++
 include/dt-bindings/reset/zte,zx297520v3-reset.h   |  19 ++++
 4 files changed, 158 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
new file mode 100644
index 000000000000..3ef8fad3c93a
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
+  The controller receives its clock signals from the matrix controller and need
+  to be declared as clock inputs.
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
+      - description: Timer oscillator output from matrixcrm (32 KHz)
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
index 6d153d2cba79..a135ec070314 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3878,6 +3878,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd fixes
 F:	Documentation/arch/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	Documentation/devicetree/bindings/phy/zte,zx297520v3-usb-phy.yaml
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
index 09ee3de679d9..2c947f467373 100644
--- a/include/dt-bindings/clock/zte,zx297520v3-clk.h
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -104,4 +104,41 @@
 #define ZX297520V3_SRAM0_PCLK			39
 #define ZX297520V3_GSM_CFG_PCLK			40
 
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


