Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B843C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 13:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zz7wK3lXlBfdGPmLEplszd2Ds3cyplTLPP38sJuKpsQ=; b=QboUc9s9FkMiXy1VzQoATPULY1
	gHkm4j8YjU0OJy84T4VZDiJoT0ZU3a/1RBeSZwcnNpUcMdMPwfG6uN4zPyXQXQXNtRaoyasXOVgrK
	Uhk2Zg6gGIYJwf72MH2usRbwgYmX72UcVJ0JwoqL7AdSr57STnACiP6nfYhg6cB/R0gFMwW8yrqv6
	Ip38utdkz0vdY5AyPKQRitYybwv2nylPwuTWakwLlSSE//yZKD0sPj1yYH6dXuhx0VFdFr64nd7WT
	0vBIFPNSFYzYxnqeikdwmZMRQmReuIkk+z/UcU7pLeuTuTZBaEJeYY/WUsOgybrCoxjWuNZlr5ap6
	JQYXBeLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4SW-000000087nI-40EZ;
	Wed, 29 Jul 2026 13:36:32 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4SO-000000087h2-3O93
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 13:36:26 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-6ab0223a3d3so528147eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 06:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785332184; x=1785936984; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zz7wK3lXlBfdGPmLEplszd2Ds3cyplTLPP38sJuKpsQ=;
        b=Dqq9IOCNXsTzgvnu0GE/KEaCTiF1Wv/7ZkNf+VOXBkSg+KWiQ67Z1f68j6CeEBebjS
         MgJa4Gd4pmqdbxfgY4yJMGXuIMk/FpGYgXqNZuO5sN0ccsjNkQl+taWO4/BaQBMJfdCn
         mBdsjME/bJ7Bdtc6HsiSK9sVA4Gt49xZyHeB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785332184; x=1785936984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zz7wK3lXlBfdGPmLEplszd2Ds3cyplTLPP38sJuKpsQ=;
        b=IA8mL8tMteIdraCNRo8dVy2V4McAlBnfMhb/7G3vsKencIhpIyLFHXOgQZWJxeEdEt
         JDqQDjmaGdJWyywV/gbWxEW28ucoLG9hjeEsAnqjuEgA6mEJ1b67iY8T+BD6aoMl2+hH
         M3BcD84BeOeuSSiLNX3J+SgvL3XIz60K+KLfyiD9PC4aYRfskNxAiZO1alHT1jPknl/Y
         OPyePuQJckaVPDAN6Jdbp/cCf2WkL8JaW+h2aClu9JTTsCituN54VuWStrBc5vSz845N
         Isy1ZkH51OOZu2fCVAm9jLM7upRuWbjOj4E0v5pxblRBpgb7zzmiKq/5tKoQixipwqTo
         kzxg==
X-Forwarded-Encrypted: i=1; AHgh+RrV5PTN61Rf4r6t9S0lFqtWZnAzsf70XxIl+3IJkdXZGi4wCLvcPfBiqLiKZvRN6fNZm/6N+KzQnP18JGs4KA53@lists.infradead.org
X-Gm-Message-State: AOJu0YyBdzZfgp6YumWRUonm4TI09K2b28jYP+MqlgoWUCy+1q3lSDPk
	G7gUjKHMRm6ijRO3+Rj/b8cZ/gQJE7K8UnS0UO7wKWDD2iAPsIm7gceIa94FoqkhOA==
X-Gm-Gg: AR+sD10UOve+9REUil237zdlkSRjBIa8/HoCSvw1kjkFoYvBBPJrHJdIGQDuHly/4h5
	u3tdgoKaJIe1vHLtWrbTDVwAmhjw5DMTqj8e3/zIiTjheQJ1O1Vi/AynUEim+ESNWsxctiwZnxC
	z0RtZqbiTeIJY955ijW6FhtyhqHLdNpqX05IZ1SXxbTYjmnlBqHMLNWPuBBexztt9gp8lTdLIqR
	z7Co5w7Xg36XrNNsBpOUAPKiXGpiIyx8ljmh7fZWI4SHWxIJYyu+KawPVLTWXKfVyB/oYhlGmpZ
	3ysckBCMy4jBiQA7wSzIv2z6DgIXCO/fk/dOHXojb4REBkBQ3m6J3Mzy0RVXym9n6C17YJ0C6mg
	YfZEALNmIJtABXeOE6fL250526pdduL5XmQ3fDfmXoXKJJ97N4T1cPf5+p815tGLULCZOol83Ol
	RMekRbPnCAABfjgsisgqv6o7VVQ9pi6SfDFJv2AztGhhclvhCHLnLdvDY=
X-Received: by 2002:a05:6820:2912:b0:6ac:a9ec:2a54 with SMTP id 006d021491bc7-6aca9ec2c6emr983428eaf.70.1785332183759;
        Wed, 29 Jul 2026 06:36:23 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aca527fe83sm1956196eaf.6.2026.07.29.06.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 06:36:23 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Fabio Estevam <festevam@nabladev.com>,
	linux-rockchip@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	huang lin <hl@rock-chips.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/6] dt-bindings: clock: rockchip: Add RV1106 CRU support
Date: Wed, 29 Jul 2026 07:35:48 -0600
Message-ID: <20260729133609.3465563-2-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729133609.3465563-1-sjg@chromium.org>
References: <20260729133609.3465563-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_063624_858382_AC0924E2 
X-CRM114-Status: GOOD (  19.34  )
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
and reset unit. The clock IDs are numbered continuously from 0, in the
same way as the RV1103B. The header also covers the MMC drive and
sample phase clocks, which the CRU provides using control registers in
the GRF region.

The RV1103 is a package variant of the RV1106 and uses the same CRU.

Signed-off-by: Simon Glass <sjg@chromium.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---

Changes in v3:
- Add IDs for the internal clocks, so that anonymous branches cannot
  overwrite the APLL entry in the clock array

Changes in v2:
- Renumber the clock IDs to be continuous, starting from 0
- Provide the MMC phase clocks from the CRU rather than a grf-cru
- Mention the MMC phase clocks in the rockchip,grf description

 .../bindings/clock/rockchip,rv1106-cru.yaml   |  60 ++++
 .../dt-bindings/clock/rockchip,rv1106-cru.h   | 306 ++++++++++++++++++
 2 files changed, 366 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rv1106-cru.yaml
 create mode 100644 include/dt-bindings/clock/rockchip,rv1106-cru.h

diff --git a/Documentation/devicetree/bindings/clock/rockchip,rv1106-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rv1106-cru.yaml
new file mode 100644
index 000000000000..b99dce9ff935
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/rockchip,rv1106-cru.yaml
@@ -0,0 +1,60 @@
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
+      Phandle to the syscon managing the "general register files" (GRF).
+      If missing, pll rates are not changeable due to the missing pll
+      lock status, and the MMC drive and sample phase clocks, whose
+      control registers live in the GRF region, are not registered.
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
index 000000000000..80244988e139
--- /dev/null
+++ b/include/dt-bindings/clock/rockchip,rv1106-cru.h
@@ -0,0 +1,306 @@
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
+#define PLL_APLL		0
+#define PLL_DPLL		1
+#define PLL_CPLL		2
+#define PLL_GPLL		3
+#define ARMCLK			4
+
+/* clk (clocks) */
+#define PCLK_DDRPHY		5
+#define PCLK_DDR_ROOT		6
+#define PCLK_DDRMON		7
+#define CLK_TIMER_DDRMON	8
+#define PCLK_DDRC		9
+#define PCLK_DFICTRL		10
+#define ACLK_DDR_ROOT		11
+#define ACLK_SYS_SHRM		12
+#define HCLK_NPU_ROOT		13
+#define ACLK_NPU_ROOT		14
+#define PCLK_NPU_ROOT		15
+#define HCLK_RKNN		16
+#define ACLK_RKNN		17
+#define PCLK_ACODEC		18
+#define MCLK_ACODEC_TX		19
+#define CLK_CORE_CRYPTO		20
+#define CLK_PKA_CRYPTO		21
+#define ACLK_CRYPTO		22
+#define HCLK_CRYPTO		23
+#define ACLK_DECOM		24
+#define PCLK_DECOM		25
+#define DCLK_DECOM		26
+#define ACLK_DMAC		27
+#define PCLK_DSM		28
+#define MCLK_DSM		29
+#define CCLK_SRC_EMMC		30
+#define HCLK_EMMC		31
+#define PCLK_GPIO4		32
+#define DBCLK_GPIO4		33
+#define PCLK_I2C0		34
+#define CLK_I2C0		35
+#define PCLK_I2C2		36
+#define CLK_I2C2		37
+#define PCLK_I2C3		38
+#define CLK_I2C3		39
+#define PCLK_I2C4		40
+#define CLK_I2C4		41
+#define HCLK_I2S0		42
+#define PCLK_DFT2APB		43
+#define HCLK_IVE		44
+#define ACLK_IVE		45
+#define PCLK_PWM0_PERI		46
+#define CLK_PWM0_PERI		47
+#define CLK_CAPTURE_PWM0_PERI	48
+#define PCLK_PERI_ROOT		49
+#define ACLK_PERI_ROOT		50
+#define HCLK_PERI_ROOT		51
+#define CLK_TIMER_ROOT		52
+#define ACLK_BUS_ROOT		53
+#define HCLK_SFC		54
+#define SCLK_SFC		55
+#define PCLK_UART0		56
+#define CLK_PVTM_CORE		57
+#define PCLK_UART1		58
+#define CLK_CORE_MCU_RTC	59
+#define PCLK_PWM1_PERI		60
+#define CLK_PWM1_PERI		61
+#define CLK_CAPTURE_PWM1_PERI	62
+#define PCLK_PWM2_PERI		63
+#define CLK_PWM2_PERI		64
+#define CLK_CAPTURE_PWM2_PERI	65
+#define HCLK_BOOTROM		66
+#define HCLK_SAI		67
+#define MCLK_SAI		68
+#define PCLK_SARADC		69
+#define CLK_SARADC		70
+#define PCLK_SPI1		71
+#define CLK_SPI1		72
+#define PCLK_STIMER		73
+#define CLK_STIMER0		74
+#define CLK_STIMER1		75
+#define PCLK_TIMER		76
+#define CLK_TIMER0		77
+#define CLK_TIMER1		78
+#define CLK_TIMER2		79
+#define CLK_TIMER3		80
+#define CLK_TIMER4		81
+#define CLK_TIMER5		82
+#define HCLK_TRNG_NS		83
+#define HCLK_TRNG_S		84
+#define PCLK_UART2		85
+#define HCLK_CPU		86
+#define PCLK_UART3		87
+#define CLK_CORE_MCU		88
+#define PCLK_UART4		89
+#define PCLK_DDR_HWLP		90
+#define PCLK_UART5		91
+#define ACLK_USBOTG		92
+#define CLK_REF_USBOTG		93
+#define CLK_UTMI_USBOTG		94
+#define PCLK_USBPHY		95
+#define CLK_REF_USBPHY		96
+#define PCLK_WDT_NS		97
+#define TCLK_WDT_NS		98
+#define PCLK_WDT_S		99
+#define TCLK_WDT_S		100
+#define CLK_DDR_FAIL_SAFE	101
+#define XIN_OSC0_DIV		102
+#define CLK_DEEPSLOW		103
+#define PCLK_PMU_GPIO0		104
+#define DBCLK_PMU_GPIO0		105
+#define CLK_PMU			106
+#define PCLK_PMU		107
+#define PCLK_PMU_HP_TIMER	108
+#define CLK_PMU_HP_TIMER	109
+#define CLK_PMU_32K_HP_TIMER	110
+#define PCLK_I2C1		111
+#define CLK_I2C1		112
+#define PCLK_PMU_IOC		113
+#define PCLK_PMU_MAILBOX	114
+#define CLK_PMU_MCU		115
+#define CLK_PMU_MCU_RTC		116
+#define CLK_PMU_MCU_JTAG	117
+#define CLK_PVTM_PMU		118
+#define PCLK_PVTM_PMU		119
+#define CLK_REFOUT		120
+#define CLK_100M_PMU		121
+#define PCLK_PMU_ROOT		122
+#define HCLK_PMU_ROOT		123
+#define HCLK_PMU_SRAM		124
+#define PCLK_PMU_WDT		125
+#define TCLK_PMU_WDT		126
+#define CLK_DFICTRL		127
+#define CLK_DDRMON		128
+#define CLK_DDR_PHY		129
+#define ACLK_DDRC		130
+#define CLK_CORE_DDRC_SRC	131
+#define CLK_CORE_DDRC		132
+#define CLK_50M_SRC		133
+#define CLK_100M_SRC		134
+#define CLK_150M_SRC		135
+#define CLK_200M_SRC		136
+#define CLK_250M_SRC		137
+#define CLK_300M_SRC		138
+#define CLK_339M_SRC		139
+#define CLK_400M_SRC		140
+#define CLK_450M_SRC		141
+#define CLK_500M_SRC		142
+#define CLK_I2S0_8CH_TX_SRC	143
+#define CLK_I2S0_8CH_TX_FRAC	144
+#define CLK_I2S0_8CH_TX		145
+#define CLK_I2S0_8CH_RX_SRC	146
+#define CLK_I2S0_8CH_RX_FRAC	147
+#define CLK_I2S0_8CH_RX		148
+#define I2S0_8CH_MCLKOUT	149
+#define MCLK_I2S0_8CH_RX	150
+#define MCLK_I2S0_8CH_TX	151
+#define CLK_REF_MIPI0_SRC	152
+#define CLK_REF_MIPI0_FRAC	153
+#define CLK_REF_MIPI0_OUT	154
+#define CLK_REF_MIPI1_SRC	155
+#define CLK_REF_MIPI1_FRAC	156
+#define MCLK_REF_MIPI0		157
+#define MCLK_REF_MIPI1		158
+#define CLK_REF_MIPI0		159
+#define CLK_REF_MIPI1		160
+#define CLK_UART0_SRC		161
+#define CLK_UART0_FRAC		162
+#define CLK_UART0		163
+#define SCLK_UART0		164
+#define CLK_UART1_SRC		165
+#define CLK_UART1_FRAC		166
+#define CLK_UART1		167
+#define SCLK_UART1		168
+#define CLK_UART2_SRC		169
+#define CLK_UART2_FRAC		170
+#define CLK_UART2		171
+#define SCLK_UART2		172
+#define CLK_UART3_SRC		173
+#define CLK_UART3_FRAC		174
+#define CLK_UART3		175
+#define SCLK_UART3		176
+#define CLK_UART4_SRC		177
+#define CLK_UART4_FRAC		178
+#define CLK_UART4		179
+#define SCLK_UART4		180
+#define CLK_UART5_SRC		181
+#define CLK_UART5_FRAC		182
+#define CLK_UART5		183
+#define SCLK_UART5		184
+#define CLK_VICAP_M0_SRC	185
+#define CLK_VICAP_M0_FRAC	186
+#define CLK_VICAP_M0		187
+#define SCLK_VICAP_M0		188
+#define CLK_VICAP_M1_SRC	189
+#define CLK_VICAP_M1_FRAC	190
+#define CLK_VICAP_M1		191
+#define SCLK_VICAP_M1		192
+#define DCLK_VOP_SRC		193
+#define PCLK_CRU		194
+#define PCLK_TOP_ROOT		195
+#define PCLK_SPI0		196
+#define CLK_SPI0		197
+#define SCLK_IN_SPI0		198
+#define CLK_UART_DETN_FLT	199
+#define HCLK_VEPU		200
+#define ACLK_VEPU		201
+#define CLK_CORE_VEPU		202
+#define CLK_CORE_VEPU_DVBM	203
+#define PCLK_GPIO1		204
+#define DBCLK_GPIO1		205
+#define HCLK_VEPU_PP		206
+#define ACLK_VEPU_PP		207
+#define HCLK_VEPU_ROOT		208
+#define ACLK_VEPU_COM_ROOT	209
+#define ACLK_VEPU_ROOT		210
+#define PCLK_VEPU_ROOT		211
+#define PCLK_VICAP_VEPU		212
+#define PCLK_CSIHOST0		213
+#define CLK_RXBYTECLKHS_0	214
+#define PCLK_CSIHOST1		215
+#define CLK_RXBYTECLKHS_1	216
+#define PCLK_GPIO3		217
+#define DBCLK_GPIO3		218
+#define HCLK_ISP3P2		219
+#define ACLK_ISP3P2		220
+#define CLK_CORE_ISP3P2		221
+#define PCLK_MIPICSIPHY		222
+#define CCLK_SRC_SDMMC		223
+#define HCLK_SDMMC		224
+#define CLK_SDMMC_DETN_FLT	225
+#define HCLK_VI_ROOT		226
+#define ACLK_VI_ROOT		227
+#define PCLK_VI_ROOT		228
+#define PCLK_VI_RTC_ROOT	229
+#define PCLK_VI_RTC_TEST	230
+#define PCLK_VI_RTC_PHY		231
+#define DCLK_VICAP		232
+#define PCLK_VICAP		233
+#define ACLK_VICAP		234
+#define HCLK_VICAP		235
+#define I0CLK_VICAP		236
+#define I1CLK_VICAP		237
+#define RX0PCLK_VICAP		238
+#define RX1PCLK_VICAP		239
+#define ISP0CLK_VICAP		240
+#define PCLK_GPIO2		241
+#define DBCLK_GPIO2		242
+#define ACLK_MAC		243
+#define PCLK_MAC		244
+#define CLK_GMAC0_50M_O		245
+#define CLK_GMAC0_TX_50M_O	246
+#define CLK_GMAC0_REF_50M	247
+#define CLK_GMAC0_TX_50M	248
+#define CLK_GMAC0_RX_50M	249
+#define ACLK_MAC_ROOT		250
+#define CLK_MACPHY		251
+#define CLK_OTPC_ARB		252
+#define PCLK_OTPC_NS		253
+#define CLK_SBPI_OTPC_NS	254
+#define CLK_USER_OTPC_NS	255
+#define PCLK_OTPC_S		256
+#define CLK_SBPI_OTPC_S		257
+#define CLK_USER_OTPC_S		258
+#define PCLK_OTP_MASK		259
+#define CLK_PMC_OTP		260
+#define HCLK_RGA2E		261
+#define ACLK_RGA2E		262
+#define CLK_CORE_RGA2E		263
+#define CCLK_SRC_SDIO		264
+#define HCLK_SDIO		265
+#define PCLK_TSADC		266
+#define CLK_TSADC		267
+#define CLK_TSADC_TSEN		268
+#define ACLK_VO_ROOT		269
+#define HCLK_VO_ROOT		270
+#define PCLK_VO_ROOT		271
+#define ACLK_VOP_ROOT		272
+#define HCLK_VOP		273
+#define DCLK_VOP		274
+#define ACLK_VOP		275
+#define CLK_RTC_32K		276
+#define PCLK_MAILBOX		277
+
+/* mmc phase clocks */
+#define SCLK_EMMC_DRV		278
+#define SCLK_EMMC_SAMPLE	279
+#define SCLK_SDMMC_DRV		280
+#define SCLK_SDMMC_SAMPLE	281
+#define SCLK_SDIO_DRV		282
+#define SCLK_SDIO_SAMPLE	283
+
+/* internal clocks */
+#define XIN_OSC0_HALF		284
+#define PCLK_DBG		285
+#define PCLK_CPU_ROOT		286
+#define CLK_RTC32K_FRAC		287
+
+#endif
-- 
2.43.0


