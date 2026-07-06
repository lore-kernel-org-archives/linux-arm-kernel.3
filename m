Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D637C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 19:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cYqR0IYNMM5ZNvkHaEwIoa1oGbsM875tUUG9/pRkoj8=; b=kdOKRMymlMEBWLOGO9wyZmUYy2
	u2cy8vKrv0vPahc2Kg/e+GiniBAcL8z8nr9oolxWCw0T42umEmm/WE6YkAdCnWrOCtd0e47vTQIVg
	IHLLYjZyHkDjxeluc+AY3nrnQ1U39AFv291s9MUZywz8bRU4vdWT/ZbOLvlgH7D6BmXlt+Pj0JAYd
	ieOfocmCLgM9c70I9aOsvMD82+uoBtCJHGfQ67cxRPsFRfJRcBSTVp9ApKjwyliMqsvoUQjNP0Ktr
	iYm8zKHtIYAPVL/vpXNmpum+mS0gqnFTOmYUp8L0zN5gUX1kDPnVqyRG9RDtehP4EjRx33ZgWVRnj
	sOBX0NXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpTH-0000000DV8Z-27fj;
	Mon, 06 Jul 2026 19:59:15 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpTD-0000000DV6T-41Jk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 19:59:14 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7e9dc546f40so101897a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 12:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783367951; x=1783972751; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYqR0IYNMM5ZNvkHaEwIoa1oGbsM875tUUG9/pRkoj8=;
        b=HBiDqTyaw92+g3lbK2S86U9ejiBOdx/6hvO/k+pOpChlwJC/ViRAohtc5YcTZo/r4/
         Rmi0aaNf4fxIC8uW6AcnKoMUqm1uIGwZsVGPjSsNhmYujAmqPK6GZORECgYUPtQTczLV
         x42l70603mmWpFF33+dgvGwr0tV8+q9PMlxHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783367951; x=1783972751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cYqR0IYNMM5ZNvkHaEwIoa1oGbsM875tUUG9/pRkoj8=;
        b=SHvD6tA4uDOXy1h/k1qfHqKRph4XUswdilpNmSOKkxjk8wJSbn5jCL96BBASSAWVVI
         1tJYktYa2kM12z3JHtfCyg2jO7lahUV5K6Zl8ZRjO+TL8ZMAby92I8hMDMqmJpJ3NKat
         W6tSrkQJsb8+GXBtLSHIGmz96zezGe212cmEYfoOOdQNokchQQzqFRuE5RbZocjAYQR0
         RqMtL+/aeEfeJGssE6pTTeaPx2t3dDtzGp0LCMbQzp2K30vVUQTOoBKK+/mq4xEIvU6N
         VVYc8t6IHx+v+8v3eos5503vRsfPXdy3sL/sO7lyHgTVhQF8Bx2M2i5zp9CcdBbSE0ka
         29Nw==
X-Forwarded-Encrypted: i=1; AFNElJ+l/Ai1RzE+ou9esYcXLkVg+RovGyByC9j3f0t8x85EExksjo3Uc3t8IxFb6riosmPg1Z8aQ3YkmCclYfm0Ha6L@lists.infradead.org
X-Gm-Message-State: AOJu0YxaKR+wD43c0NorfKMXnF7/XYMpDv+KZq+gX0MHNJcIQ6EuP79h
	utIcwI4rlqGxDMNp0NJuJUeP8k7Oh1Wo1r/5Iek+MgrqU3AzDKKBzAf4Bnz1nB+irRPga/w7e89
	CPB+V/A==
X-Gm-Gg: AfdE7ckM8EjOzm+/yLsQWNhJmX558i2IWWzZeZSmR2ZkGJHB3fKIAoFpWN1GMm0rlEa
	BEFRbdnsSVyFUmHTSDgEqfFl7Txau+pxdYwoDgLcfmxXwH/Rn8+0/K/f/nRNzQJWzC6YSQmtHSe
	/C9hBzFUPlKTu/QNyPeWz0sOthqhX24iXX71rB9roOnEhC3penSzcVL1JAU6Mg3qbPM7sXUpdzD
	2JaKmyfd8PnNqvlTCXeG3u0FSickVowMJ0R5gZ50U28pgGO0V/p6ynWIWBxV5o0idKa9WvPbn5P
	/HhbEEy6/4o1zxu078gnGHA1RSdGLTgJhANQj1Cs6+lm6f8/y8CsPunuMCay+uHiN82+dN9WInc
	UfB4q11kQi43aXKrVcTgtwIqZ6RbPFqE3yV/Ta0Qp27Z6u+2XvtBAYFh98FNkproVGzKzN+aYed
	5fa3uCUeFxNaE13RyfwA==
X-Received: by 2002:a9d:6d0e:0:b0:7e9:dfc7:5523 with SMTP id 46e09a7af769-7eb688889cbmr5945969a34.10.1783367950744;
        Mon, 06 Jul 2026 12:59:10 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb542d017csm12161834a34.8.2026.07.06.12.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:59:10 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	huang lin <hl@rock-chips.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/12] dt-bindings: clock: rockchip: Add RV1106 CRU support
Date: Mon,  6 Jul 2026 13:57:57 -0600
Message-ID: <20260706195818.3906949-2-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706195818.3906949-1-sjg@chromium.org>
References: <20260706195818.3906949-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_125912_148034_F84C29E8 
X-CRM114-Status: GOOD (  17.12  )
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

Add the clock binding header and schema for the Rockchip RV1106 clock
and reset unit. The clock IDs match the numbering used by the vendor
kernel so that existing devicetrees keep working. The header also
covers the GRF clock controller, which provides the MMC drive and
sample phase clocks.

The RV1103 is a package variant of the RV1106 and uses the same CRU.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 .../bindings/clock/rockchip,rv1106-cru.yaml   |  59 ++++
 .../dt-bindings/clock/rockchip,rv1106-cru.h   | 301 ++++++++++++++++++
 2 files changed, 360 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rv1106-cru.yaml
 create mode 100644 include/dt-bindings/clock/rockchip,rv1106-cru.h

diff --git a/Documentation/devicetree/bindings/clock/rockchip,rv1106-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rv1106-cru.yaml
new file mode 100644
index 000000000000..884a4a8bb0fb
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/rockchip,rv1106-cru.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/rockchip,rv1106-cru.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RV1106 Clock and Reset Unit
+
+maintainers:
+  - Simon Glass <sjg@chromium.org>
+  - Heiko Stuebner <heiko@sntech.de>
+
+description:
+  The RV1106 clock controller generates the clock and also implements a
+  reset controller for SoC peripherals.
+
+properties:
+  compatible:
+    const: rockchip,rv1106-cru
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: xin24m
+
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the syscon managing the "general register files" (GRF),
+      if missing pll rates are not changeable, due to the missing pll
+      lock status.
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@ff3b0000 {
+      compatible = "rockchip,rv1106-cru";
+      reg = <0xff3b0000 0x20000>;
+      rockchip,grf = <&grf>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/rockchip,rv1106-cru.h b/include/dt-bindings/clock/rockchip,rv1106-cru.h
new file mode 100644
index 000000000000..acbf9c1ee6af
--- /dev/null
+++ b/include/dt-bindings/clock/rockchip,rv1106-cru.h
@@ -0,0 +1,301 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2022 Rockchip Electronics Co. Ltd.
+ * Author: Elaine Zhang <zhangqing@rock-chips.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_ROCKCHIP_RV1106_H
+#define _DT_BINDINGS_CLK_ROCKCHIP_RV1106_H
+
+/* pll clocks */
+#define PLL_APLL		1
+#define PLL_DPLL		2
+#define PLL_CPLL		3
+#define PLL_GPLL		4
+#define ARMCLK			5
+
+/* clk (clocks) */
+#define PCLK_DDRPHY		11
+#define PCLK_DDR_ROOT		12
+#define PCLK_DDRMON		13
+#define CLK_TIMER_DDRMON	14
+#define PCLK_DDRC		15
+#define PCLK_DFICTRL		16
+#define ACLK_DDR_ROOT		17
+#define ACLK_SYS_SHRM		18
+#define HCLK_NPU_ROOT		19
+#define ACLK_NPU_ROOT		20
+#define PCLK_NPU_ROOT		21
+#define HCLK_RKNN		22
+#define ACLK_RKNN		23
+#define PCLK_ACODEC		24
+#define MCLK_ACODEC_TX		25
+#define CLK_CORE_CRYPTO		27
+#define CLK_PKA_CRYPTO		28
+#define ACLK_CRYPTO		29
+#define HCLK_CRYPTO		30
+#define ACLK_DECOM		31
+#define PCLK_DECOM		32
+#define DCLK_DECOM		33
+#define ACLK_DMAC		34
+#define PCLK_DSM		35
+#define MCLK_DSM		36
+#define CCLK_SRC_EMMC		37
+#define HCLK_EMMC		38
+#define PCLK_GPIO4		39
+#define DBCLK_GPIO4		40
+#define PCLK_I2C0		41
+#define CLK_I2C0		42
+#define PCLK_I2C2		43
+#define CLK_I2C2		44
+#define PCLK_I2C3		45
+#define CLK_I2C3		46
+#define PCLK_I2C4		47
+#define CLK_I2C4		48
+#define HCLK_I2S0		49
+#define PCLK_DFT2APB		50
+#define HCLK_IVE		51
+#define ACLK_IVE		52
+#define PCLK_PWM0_PERI		53
+#define CLK_PWM0_PERI		54
+#define CLK_CAPTURE_PWM0_PERI	55
+#define PCLK_PERI_ROOT		56
+#define ACLK_PERI_ROOT		57
+#define HCLK_PERI_ROOT		58
+#define CLK_TIMER_ROOT		59
+#define ACLK_BUS_ROOT		60
+#define HCLK_SFC		61
+#define SCLK_SFC		62
+#define PCLK_UART0		63
+#define CLK_PVTM_CORE		64
+#define PCLK_UART1		65
+#define CLK_CORE_MCU_RTC	66
+#define PCLK_PWM1_PERI		67
+#define CLK_PWM1_PERI		68
+#define CLK_CAPTURE_PWM1_PERI	69
+#define PCLK_PWM2_PERI		70
+#define CLK_PWM2_PERI		71
+#define CLK_CAPTURE_PWM2_PERI	72
+#define HCLK_BOOTROM		73
+#define HCLK_SAI		74
+#define MCLK_SAI		75
+#define PCLK_SARADC		76
+#define CLK_SARADC		77
+#define PCLK_SPI1		78
+#define CLK_SPI1		79
+#define PCLK_STIMER		80
+#define CLK_STIMER0		81
+#define CLK_STIMER1		82
+#define PCLK_TIMER		83
+#define CLK_TIMER0		84
+#define CLK_TIMER1		85
+#define CLK_TIMER2		86
+#define CLK_TIMER3		87
+#define CLK_TIMER4		88
+#define CLK_TIMER5		89
+#define HCLK_TRNG_NS		90
+#define HCLK_TRNG_S		91
+#define PCLK_UART2		92
+#define HCLK_CPU		93
+#define PCLK_UART3		94
+#define CLK_CORE_MCU		95
+#define PCLK_UART4		96
+#define PCLK_DDR_HWLP		97
+#define PCLK_UART5		98
+#define ACLK_USBOTG		100
+#define CLK_REF_USBOTG		101
+#define CLK_UTMI_USBOTG		102
+#define PCLK_USBPHY		103
+#define CLK_REF_USBPHY		104
+#define PCLK_WDT_NS		105
+#define TCLK_WDT_NS		106
+#define PCLK_WDT_S		107
+#define TCLK_WDT_S		108
+#define CLK_DDR_FAIL_SAFE	109
+#define XIN_OSC0_DIV		110
+#define CLK_DEEPSLOW		111
+#define PCLK_PMU_GPIO0		112
+#define DBCLK_PMU_GPIO0		113
+#define CLK_PMU			114
+#define PCLK_PMU		115
+#define PCLK_PMU_HP_TIMER	116
+#define CLK_PMU_HP_TIMER	117
+#define CLK_PMU_32K_HP_TIMER	118
+#define PCLK_I2C1		119
+#define CLK_I2C1		120
+#define PCLK_PMU_IOC		121
+#define PCLK_PMU_MAILBOX	122
+#define CLK_PMU_MCU		123
+#define CLK_PMU_MCU_RTC		124
+#define CLK_PMU_MCU_JTAG	125
+#define CLK_PVTM_PMU		126
+#define PCLK_PVTM_PMU		127
+#define CLK_REFOUT		128
+#define CLK_100M_PMU		129
+#define PCLK_PMU_ROOT		130
+#define HCLK_PMU_ROOT		131
+#define HCLK_PMU_SRAM		132
+#define PCLK_PMU_WDT		133
+#define TCLK_PMU_WDT		134
+#define CLK_DFICTRL		135
+#define CLK_DDRMON		136
+#define CLK_DDR_PHY		137
+#define ACLK_DDRC		138
+#define CLK_CORE_DDRC_SRC	139
+#define CLK_CORE_DDRC		140
+#define CLK_50M_SRC		141
+#define CLK_100M_SRC		142
+#define CLK_150M_SRC		143
+#define CLK_200M_SRC		144
+#define CLK_250M_SRC		145
+#define CLK_300M_SRC		146
+#define CLK_339M_SRC		147
+#define CLK_400M_SRC		148
+#define CLK_450M_SRC		149
+#define CLK_500M_SRC		150
+#define CLK_I2S0_8CH_TX_SRC	151
+#define CLK_I2S0_8CH_TX_FRAC	152
+#define CLK_I2S0_8CH_TX		153
+#define CLK_I2S0_8CH_RX_SRC	154
+#define CLK_I2S0_8CH_RX_FRAC	155
+#define CLK_I2S0_8CH_RX		156
+#define I2S0_8CH_MCLKOUT	157
+#define MCLK_I2S0_8CH_RX	158
+#define MCLK_I2S0_8CH_TX	159
+#define CLK_REF_MIPI0_SRC	160
+#define CLK_REF_MIPI0_FRAC	161
+#define CLK_REF_MIPI0_OUT	162
+#define CLK_REF_MIPI1_SRC	163
+#define CLK_REF_MIPI1_FRAC	164
+#define MCLK_REF_MIPI0		165
+#define MCLK_REF_MIPI1		166
+#define CLK_REF_MIPI0		167
+#define CLK_REF_MIPI1		168
+#define CLK_UART0_SRC		169
+#define CLK_UART0_FRAC		170
+#define CLK_UART0		171
+#define SCLK_UART0		172
+#define CLK_UART1_SRC		173
+#define CLK_UART1_FRAC		174
+#define CLK_UART1		175
+#define SCLK_UART1		176
+#define CLK_UART2_SRC		177
+#define CLK_UART2_FRAC		178
+#define CLK_UART2		179
+#define SCLK_UART2		180
+#define CLK_UART3_SRC		181
+#define CLK_UART3_FRAC		182
+#define CLK_UART3		183
+#define SCLK_UART3		184
+#define CLK_UART4_SRC		185
+#define CLK_UART4_FRAC		186
+#define CLK_UART4		187
+#define SCLK_UART4		188
+#define CLK_UART5_SRC		189
+#define CLK_UART5_FRAC		190
+#define CLK_UART5		191
+#define SCLK_UART5		192
+#define CLK_VICAP_M0_SRC	193
+#define CLK_VICAP_M0_FRAC	194
+#define CLK_VICAP_M0		195
+#define SCLK_VICAP_M0		196
+#define CLK_VICAP_M1_SRC	197
+#define CLK_VICAP_M1_FRAC	198
+#define CLK_VICAP_M1		199
+#define SCLK_VICAP_M1		200
+#define DCLK_VOP_SRC		201
+#define PCLK_CRU		202
+#define PCLK_TOP_ROOT		203
+#define PCLK_SPI0		204
+#define CLK_SPI0		205
+#define SCLK_IN_SPI0		206
+#define CLK_UART_DETN_FLT	207
+#define HCLK_VEPU		208
+#define ACLK_VEPU		209
+#define CLK_CORE_VEPU		210
+#define CLK_CORE_VEPU_DVBM	211
+#define PCLK_GPIO1		212
+#define DBCLK_GPIO1		213
+#define HCLK_VEPU_PP		214
+#define ACLK_VEPU_PP		215
+#define HCLK_VEPU_ROOT		216
+#define ACLK_VEPU_COM_ROOT	217
+#define ACLK_VEPU_ROOT		218
+#define PCLK_VEPU_ROOT		219
+#define PCLK_VICAP_VEPU		220
+#define PCLK_CSIHOST0		221
+#define CLK_RXBYTECLKHS_0	222
+#define PCLK_CSIHOST1		223
+#define CLK_RXBYTECLKHS_1	224
+#define PCLK_GPIO3		225
+#define DBCLK_GPIO3		226
+#define HCLK_ISP3P2		227
+#define ACLK_ISP3P2		228
+#define CLK_CORE_ISP3P2		229
+#define PCLK_MIPICSIPHY		230
+#define CCLK_SRC_SDMMC		231
+#define HCLK_SDMMC		232
+#define CLK_SDMMC_DETN_FLT	233
+#define HCLK_VI_ROOT		234
+#define ACLK_VI_ROOT		235
+#define PCLK_VI_ROOT		236
+#define PCLK_VI_RTC_ROOT	237
+#define PCLK_VI_RTC_TEST	238
+#define PCLK_VI_RTC_PHY		239
+#define DCLK_VICAP		240
+#define PCLK_VICAP		241
+#define ACLK_VICAP		242
+#define HCLK_VICAP		243
+#define I0CLK_VICAP		244
+#define I1CLK_VICAP		245
+#define RX0PCLK_VICAP		246
+#define RX1PCLK_VICAP		247
+#define ISP0CLK_VICAP		248
+#define PCLK_GPIO2		249
+#define DBCLK_GPIO2		250
+#define ACLK_MAC		251
+#define PCLK_MAC		252
+#define CLK_GMAC0_50M_O		253
+#define CLK_GMAC0_TX_50M_O	254
+#define CLK_GMAC0_REF_50M	255
+#define CLK_GMAC0_TX_50M	256
+#define CLK_GMAC0_RX_50M	257
+#define ACLK_MAC_ROOT		258
+#define CLK_MACPHY		259
+#define CLK_OTPC_ARB		260
+#define PCLK_OTPC_NS		261
+#define CLK_SBPI_OTPC_NS	262
+#define CLK_USER_OTPC_NS	263
+#define PCLK_OTPC_S		264
+#define CLK_SBPI_OTPC_S		265
+#define CLK_USER_OTPC_S		266
+#define PCLK_OTP_MASK		267
+#define CLK_PMC_OTP		268
+#define HCLK_RGA2E		269
+#define ACLK_RGA2E		270
+#define CLK_CORE_RGA2E		271
+#define CCLK_SRC_SDIO		272
+#define HCLK_SDIO		273
+#define PCLK_TSADC		274
+#define CLK_TSADC		275
+#define CLK_TSADC_TSEN		276
+#define ACLK_VO_ROOT		277
+#define HCLK_VO_ROOT		278
+#define PCLK_VO_ROOT		279
+#define ACLK_VOP_ROOT		280
+#define HCLK_VOP		281
+#define DCLK_VOP		282
+#define ACLK_VOP		283
+#define CLK_RTC_32K		284
+#define PCLK_MAILBOX		291
+
+
+/* mmc phase clocks provided by the grf-cru */
+#define SCLK_EMMC_DRV		1
+#define SCLK_EMMC_SAMPLE	2
+#define SCLK_SDMMC_DRV		3
+#define SCLK_SDMMC_SAMPLE	4
+#define SCLK_SDIO_DRV		5
+#define SCLK_SDIO_SAMPLE	6
+
+#endif
-- 
2.43.0


