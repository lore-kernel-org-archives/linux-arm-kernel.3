Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28668C43327
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 19:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZqIYbDSpn4lGb/07yoDdg2DMBPPvCNmBE5i5NwPXm4U=; b=G/LIGM8lMmy3WIurZNuMsT8Was
	zRHO6YcgT8XY0/evo6tyDWlR4/bO1aNsSEQFRRayxzZZRjOfqijSBGo4DFszL1g0U0bClQEzekPAk
	AOu9FWhVDBZgRTmE8TRtdSrLqG2Zjk3gMW/srl2PZZ64uyjm8qMguLrco22cYoi9ITsQJiZ+skJAv
	hr448ZU2gCMP+pSYNWTPutSnv3j+avpOKBIrCnhRSZzXJ63y2qjUjwPFe3qSV9vnBLlyRa1Btf3EC
	RlSKQ6R33oWnB74//5r3YZuXOtukbj/5i43BOWnLli4kOYMLAqfRCEzmEz+rVhZ+I1Mq7yahWN+11
	Ddevl2+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdvfI-0000000DKwD-0MAK;
	Sun, 28 Jun 2026 19:59:40 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdvfA-0000000DKsK-0bNh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 19:59:33 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-493a440bc10so5454105e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 12:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782676770; x=1783281570; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZqIYbDSpn4lGb/07yoDdg2DMBPPvCNmBE5i5NwPXm4U=;
        b=d9FNiN0gxvhKvWcbX7nkRzqUcGD5VeYIeGXSP/z/njExWZTDL/JRw2vC+X3bBCfunk
         Uyt3/OaMHpi/IU6g8ZiOpDBaRqJAx1EovjMymFMmvQFKlGxZhOU+hKdUBCP+lU2zbU4/
         cRya4GZolcNyrKHR+SuNkP9Z6WmrKq3eHuD2rwVSVj6nkKDZPDpsEIX0d0qJ0XMYJS4u
         Bg50x4ACEIEIC30IdqGNaQ0fuIXN22hOd9MZfx4PJclK/OZ3WLh7Km+uFLaSAhEF5Rig
         3CSb8SN0Zu22JOUZroEG7sKPNV6UtRhxv5bNLWnPL5KLYTz2exWaPyabewWUWvVkNDvl
         W+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782676770; x=1783281570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZqIYbDSpn4lGb/07yoDdg2DMBPPvCNmBE5i5NwPXm4U=;
        b=WeISCgaRXvBIfv0jPrq4x/y+Jzts76wEK1Au8a468ZTgZB4zMHoa9XcO9hC2lQl3K5
         RCeJJsCMRBG1S8NSpz1GK9ku4juQ0S2BiRmyjXmO/NIR3pLo5j7k1tj8kxL69deQXN5h
         F3FVqXlxjSQz3ISeQkj+JcbchcUxOPneEap8RCK/Ag4D+Ie1PtkkjS0AdJ1JeO8Ll7kz
         hI+US8TID9dycjKDCUfGARJGUh1b/DEo10bnI7aJDJDapfTSa2Ax3ssQZSZB2MmJci87
         STq6+wGyguFi30h90SzmPllsjPzmNo65OYZP2/NOf8rMm1aqCerLpJgnF4zHhHmh0JDg
         ytFw==
X-Forwarded-Encrypted: i=1; AFNElJ//qIB5VPDIX5LWXV/++Dye5A1tmZHgC40Ra/6v/shwADH0h+gJCk4OonQZDN/b22E1tdMabhBR1cfkDq3Bvf2c@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2dBTGc4QKEYh+FODFvIz+uw5hs3VhvQ6KDYsXixiIjUH9AfJt
	j+VwJduQrWpvdHBvGAy0Xj4/aj1lzzDQKHqMCmnnyx/79SPijELZhd11
X-Gm-Gg: AfdE7ckn6qvxMlks8YDMhlYOvORbgH8vBfVCoFL+3+jWDoBsuSYsJm229G/FrqJ7RiA
	AK2uqZ5qEBQLXlpXazkBaumsg82iQOirTHKlxsvJXVPjCL5wSTtmdoPT/Nnsq7h0Vfil3iCjFbp
	BU/bx0DH94cftEFvNT6jl1eIPJQ7NBHmK+TlpYJVswupzL1xhGTmCr0L3tc7SwuwE2PnL810tba
	AXeus6xS/LoEctXLu7kAZSebG2lAW44Ygqf9mmnYFHkVKZGqvxqhlNBUjiP832sSInH5J4VYGKG
	AAPHDR1Pot+KMGjg1olrYKuF/5vtS6rtYxl1oeTmOx/VvB1FSW2D1ggtmLJkj8+xClP84Prs3jo
	4/ZcWWXsUdMSdpHZXfIHpamU4XpolwQ9scX4vR0vWwBArjP86jkJx7/BMEG5optovLPiIPInU0e
	sLSFNP7U8pnzw4SeuTPBz/RRQ=
X-Received: by 2002:a05:600c:3e0f:b0:493:8f89:cb86 with SMTP id 5b1f17b1804b1-4938f89cd5emr77371605e9.3.1782676770286;
        Sun, 28 Jun 2026 12:59:30 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ae96c85fsm15133505e9.5.2026.06.28.12.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 12:59:29 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 28 Jun 2026 22:58:58 +0300
Subject: [PATCH RFC v5 03/12] dt-bindings: clk: zte: Add zx297520v3 LSP
 clock and reset bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260628-zx29clk-v5-3-79ff044e4192@gmail.com>
References: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
In-Reply-To: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
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
 bh=a7c78y4awvOptqBnvo4wwQFCy4PQARBq/5n/LCe0P2g=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqQX0UpTxm6MDy46Z8ykCtPHL4tqhGPJlg8xDZm
 67ONeEJo5CJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCakF9FBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLnUw/9GKAHn7+pX7hDbh7m01Gd9o4PuTvVOuh
 da0QY9NbeHmZQNeNijvFnvIVfuwMi1WmsLf4wRfYdEKmWf1wQ7mrjOxkjkDw30SeSjufP33uU5x
 iH4DXLeS4x/Z2lylgmQULaVHzwoq/w/GBVRGhtMq/TAdmxNNhAWZA0AgXTPVTAalMOcCdpKGJtA
 3NMrC2giYOibqiltI78lnE3nsLL6aeEAa1SGluJ7RVCptKEg2q5xtEnfUS5HJoEhD1+xr/og8m+
 gmKC6aMkyl6517EbQsCFNXRJlAb4HxNmslN/KdVgB+4cmwfNb8l3HzoTWJWEYFCHxZiiRSM5Wus
 PMK5CvEW/zDTHKR5GPF6dKeTfF+25Fvemj3PkJOrjZjermA7f6/bbgND8RtjWcENwfSoGNaLqdf
 6sgoWKvX5V2n7Ss9+Vrg8zTN/tpXLVMEWTTe+jw2iXZZIkyXiWWmT5yGjE8gfI3FQ/NAGn1TELk
 wv5Cc0zUeDUbBFAgooCBjOdp/9zQ28H1SmtjlbQ8elFdtpAGr21C8mrNlleeS3x8Bguoy0CXWSJ
 ZuRDtdKvYSqIYfgLR6eMMl8YD7cHxwXc+vj/GA/J5nBId5wZ7oo36Z8vvZecRTVN5SmXlK//6Ew
 o2/8WZc0cVXXfYZSf7+KxM6BlRy0Cd1o3OHbcb64cW+rKJEZ6Gqg=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_125932_232272_0CADC878 
X-CRM114-Status: GOOD (  18.39  )
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
index 0f9e588e4839..ee585982b859 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3867,6 +3867,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
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
2.53.0


