Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53840CA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 17:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k22+B8ffEli9+24baonSp7Mbgcq1/aXtsuYwQP4MYQ8=; b=Ze+Od5iCbDlgyQ6darc2kwQSIb
	4EvCJ6BG2QqeYPyIsk3Uv680QNOsD9GHiVCGcBaPfaxnj5HA1PHF1g19WMeFwJSuvpDkeUcVVWPOy
	h1UuM+mFvppEZt01MD4DW7m7LJG1lgShMdLGk14snUwzuEcQB2Wysn2lLWH/aKuNK1zcHFBKxgN6o
	CcxhfohNZYyhrSlZLhpFVdR9TWbSoq2JyAFFpX0/INCfiIQ1zzvEaJgK3zo3S818PFDRziy9x9eFd
	DyTq6rF6thu16/OAGH7Yv0InVoP/vwUu2IXMzQ2zriRmeSS189zCpmZzNLs8Qz/2mgbcjKJmG4z1G
	BIDgGLdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usPHi-00000008E80-2Ppi;
	Sat, 30 Aug 2025 17:22:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usP4r-00000008CUL-02xQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 17:09:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1BDCE60195;
	Sat, 30 Aug 2025 17:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A21DFC4CEF1;
	Sat, 30 Aug 2025 17:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756573759;
	bh=2D4JpcfBxGUxLuSlwCEqmVQw8YDexdFZl9b/63oO114=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TFywBZj6Tmfjggcn4jcDCinw54P3REEoPmefMj2Vq9QQT+Yjyd5XZHo3GWBzl7SnE
	 qq5YRSDIhC2iX3xXlIufp/do1mDtA9BQH43mFH9X9LAPrSRFDjMDBpPLQ0A+dUZbjX
	 LRCt42TMJXRp325d0CWUAWR4yjLn7lW8vWxm7ADj4YhEc/abCaaII5qE2h3dR2/lAF
	 SvWQsF6eldWAyQRFh5n8nzt7yy0kejonLJxS/8f9Pe80U34kUTBxN/kjpvnz+ELzDM
	 oP6dUNwo7NgvXeLbg6X29/TP5Zv91+Fr6Hr8pUcTZkPSGnh1RKBrnk875F0Pwncwme
	 g2n0WxZoCB1/A==
Received: by wens.tw (Postfix, from userid 1000)
	id 356675FD50; Sun, 31 Aug 2025 01:09:17 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] dt-bindings: clock: sun55i-a523-ccu: Add A523 MCU CCU clock controller
Date: Sun, 31 Aug 2025 01:08:55 +0800
Message-Id: <20250830170901.1996227-3-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250830170901.1996227-1-wens@kernel.org>
References: <20250830170901.1996227-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Chen-Yu Tsai <wens@csie.org>

There are four clock controllers in the A523 SoC. The existing binding
already covers two of them that are critical for basic operation. The
remaining ones are the MCU clock controller and CPU PLL clock
controller.

Add a description for the MCU CCU. This unit controls and provides
clocks to the MCU (RISC-V) subsystem and peripherals meant to operate
under low power conditions.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 .../clock/allwinner,sun55i-a523-ccu.yaml      | 35 +++++++++++-
 .../dt-bindings/clock/sun55i-a523-mcu-ccu.h   | 54 +++++++++++++++++++
 .../dt-bindings/reset/sun55i-a523-mcu-ccu.h   | 30 +++++++++++
 3 files changed, 117 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/clock/sun55i-a523-mcu-ccu.h
 create mode 100644 include/dt-bindings/reset/sun55i-a523-mcu-ccu.h

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
index f5f62e9a10a1..1dbd92febc47 100644
--- a/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
@@ -19,6 +19,7 @@ properties:
   compatible:
     enum:
       - allwinner,sun55i-a523-ccu
+      - allwinner,sun55i-a523-mcu-ccu
       - allwinner,sun55i-a523-r-ccu
 
   reg:
@@ -26,11 +27,11 @@ properties:
 
   clocks:
     minItems: 4
-    maxItems: 5
+    maxItems: 8
 
   clock-names:
     minItems: 4
-    maxItems: 5
+    maxItems: 8
 
 required:
   - "#clock-cells"
@@ -63,6 +64,36 @@ allOf:
             - const: iosc
             - const: losc-fanout
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun55i-a523-mcu-ccu
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: High Frequency Oscillator (usually at 24MHz)
+            - description: Low Frequency Oscillator (usually at 32kHz)
+            - description: Internal Oscillator
+            - description: Audio PLL (4x)
+            - description: Peripherals PLL 0 (300 MHz output)
+            - description: DSP module clock
+            - description: PRCM AHB clock
+            - description: MBUS clock
+
+        clock-names:
+          items:
+            - const: hosc
+            - const: losc
+            - const: iosc
+            - const: pll-audio0-4x
+            - const: pll-periph0-300m
+            - const: dsp
+            - const: r-ahb
+            - const: mbus
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/sun55i-a523-mcu-ccu.h b/include/dt-bindings/clock/sun55i-a523-mcu-ccu.h
new file mode 100644
index 000000000000..6efc6bc7e11a
--- /dev/null
+++ b/include/dt-bindings/clock/sun55i-a523-mcu-ccu.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (C) 2025 Chen-Yu Tsai <wens@csie.org>
+ */
+
+#ifndef _DT_BINDINGS_CLK_SUN55I_A523_MCU_CCU_H_
+#define _DT_BINDINGS_CLK_SUN55I_A523_MCU_CCU_H_
+
+#define CLK_MCU_PLL_AUDIO1	0
+#define CLK_MCU_PLL_AUDIO1_DIV2	1
+#define CLK_MCU_PLL_AUDIO1_DIV5	2
+#define CLK_MCU_AUDIO_OUT	3
+#define CLK_MCU_DSP		4
+#define CLK_MCU_I2S0		5
+#define CLK_MCU_I2S1		6
+#define CLK_MCU_I2S2		7
+#define CLK_MCU_I2S3		8
+#define CLK_MCU_I2S3_ASRC	9
+#define CLK_BUS_MCU_I2S0	10
+#define CLK_BUS_MCU_I2S1	11
+#define CLK_BUS_MCU_I2S2	12
+#define CLK_BUS_MCU_I2S3	13
+#define CLK_MCU_SPDIF_TX	14
+#define CLK_MCU_SPDIF_RX	15
+#define CLK_BUS_MCU_SPDIF	16
+#define CLK_MCU_DMIC		17
+#define CLK_BUS_MCU_DMIC	18
+#define CLK_MCU_AUDIO_CODEC_DAC	19
+#define CLK_MCU_AUDIO_CODEC_ADC	20
+#define CLK_BUS_MCU_AUDIO_CODEC	21
+#define CLK_BUS_MCU_DSP_MSGBOX	22
+#define CLK_BUS_MCU_DSP_CFG	23
+#define CLK_BUS_MCU_NPU_HCLK	24
+#define CLK_BUS_MCU_NPU_ACLK	25
+#define CLK_MCU_TIMER0		26
+#define CLK_MCU_TIMER1		27
+#define CLK_MCU_TIMER2		28
+#define CLK_MCU_TIMER3		29
+#define CLK_MCU_TIMER4		30
+#define CLK_MCU_TIMER5		31
+#define CLK_BUS_MCU_TIMER	32
+#define CLK_BUS_MCU_DMA		33
+#define CLK_MCU_TZMA0		34
+#define CLK_MCU_TZMA1		35
+#define CLK_BUS_MCU_PUBSRAM	36
+#define CLK_MCU_MBUS_DMA	37
+#define CLK_MCU_MBUS		38
+#define CLK_MCU_RISCV		39
+#define CLK_BUS_MCU_RISCV_CFG	40
+#define CLK_BUS_MCU_RISCV_MSGBOX	41
+#define CLK_MCU_PWM0		42
+#define CLK_BUS_MCU_PWM0	43
+
+#endif /* _DT_BINDINGS_CLK_SUN55I_A523_MCU_CCU_H_ */
diff --git a/include/dt-bindings/reset/sun55i-a523-mcu-ccu.h b/include/dt-bindings/reset/sun55i-a523-mcu-ccu.h
new file mode 100644
index 000000000000..a89a0b44f08b
--- /dev/null
+++ b/include/dt-bindings/reset/sun55i-a523-mcu-ccu.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (C) 2025 Chen-Yu Tsai <wens@csie.org>
+ */
+
+#ifndef _DT_BINDINGS_RST_SUN55I_A523_MCU_CCU_H_
+#define _DT_BINDINGS_RST_SUN55I_A523_MCU_CCU_H_
+
+#define RST_BUS_MCU_I2S0		0
+#define RST_BUS_MCU_I2S1		1
+#define RST_BUS_MCU_I2S2		2
+#define RST_BUS_MCU_I2S3		3
+#define RST_BUS_MCU_SPDIF		4
+#define RST_BUS_MCU_DMIC		5
+#define RST_BUS_MCU_AUDIO_CODEC		6
+#define RST_BUS_MCU_DSP_MSGBOX		7
+#define RST_BUS_MCU_DSP_CFG		8
+#define RST_BUS_MCU_NPU			9
+#define RST_BUS_MCU_TIMER		10
+#define RST_BUS_MCU_DSP_DEBUG		11
+#define RST_BUS_MCU_DSP			12
+#define RST_BUS_MCU_DMA			13
+#define RST_BUS_MCU_PUBSRAM		14
+#define RST_BUS_MCU_RISCV_CFG		15
+#define RST_BUS_MCU_RISCV_DEBUG		16
+#define RST_BUS_MCU_RISCV_CORE		17
+#define RST_BUS_MCU_RISCV_MSGBOX	18
+#define RST_BUS_MCU_PWM0		19
+
+#endif /* _DT_BINDINGS_RST_SUN55I_A523_MCU_CCU_H_ */
-- 
2.39.5


