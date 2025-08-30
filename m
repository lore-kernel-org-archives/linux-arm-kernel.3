Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F6ECA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 17:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=86JnbPZHN24W53Nvfx/LI3LWEGRRd2dsK7mmPDNbAFM=; b=4X28eyJaFrSBM7Baxluko2QEvi
	cibjakaT7lz0q34K1o2INB0xu/MMv0DWIxPCfLLiTK1fDrcFyJWLA+zKr3G/fvE0vTU2Hg3gff03O
	IDWogpsDW5ejYXEOS7giRYcJpZb3O1HbU9sbjMdgAqX5wkIJubA07Bb5uaFeCEK+dB+4AFSiQ2+OL
	6nnMJ1I/mZ+wMnGv1ZHgRfRukbUdlmz8gbTr9sDrp2O8fYHz1+K0adOaBZTH/+lkVTb2p6Tt+XC+J
	VROr1d0snRiQ6GRVE8o2gfR7MrD4hno1QUxL62vIGSAVDmoAaNUUTzlKK6AlPYMCZhICWgC8Upg7v
	n28UCyJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usPXw-00000008FVo-1feW;
	Sat, 30 Aug 2025 17:39:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usP4s-00000008CVZ-17gm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 17:09:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 07F2E448C7;
	Sat, 30 Aug 2025 17:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0542C4CEFB;
	Sat, 30 Aug 2025 17:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756573761;
	bh=3EElTfctldD5Dqcdckanf0DB/BbI9/XMswzxMb6oj8Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J5HIgdZo7fUrIavRXEx4kKLTdmW8vPp6jyDArGG2ys1mr6zR78jA9pttUs+fqdaSD
	 T8EgKByOc1RUn7/IfHXBh7IR9rkIBeYVgNNQbJowLQFksA5CJ1VM1X4bO1bGvFvLeY
	 8HEMDLX3TxdrTK/jnBhf5UgSTdrVP1yyFIZvHFY4ak99ScG9sHbTs81PjFfRbGTRQg
	 BsjjVMwBC8Cw2vQBGC1Bna0kXP/qQv3GlW00U/PIb5g6JoVcr6IgwFu5/xz/zfonGx
	 WV/iFawQZNHaBEHI6k6PvKmS+fzgBihWb+i5uXOOqjEDtbXXKHNDFPl3xKBexwJpwF
	 eixc+hikrSxyw==
Received: by wens.tw (Postfix, from userid 1000)
	id 72A7E5FEDF; Sun, 31 Aug 2025 01:09:17 +0800 (CST)
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
Subject: [PATCH 7/8] arm64: dts: allwinner: a523: Add MCU PRCM CCU node
Date: Sun, 31 Aug 2025 01:09:00 +0800
Message-Id: <20250830170901.1996227-8-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250830170901.1996227-1-wens@kernel.org>
References: <20250830170901.1996227-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_100922_347263_509D700E 
X-CRM114-Status: GOOD (  11.48  )
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

Add a device node for the third supported clock controller found in the
A523 / T527 SoCs. This controller has clocks and resets for the RISC-V
MCU, and others peripherals possibly meant to operate in low power mode
driven by the MCU, such as audio interfaces, an audio DSP, and the NPU.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 79bd9ce08c7c..b6e82d53af54 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -4,8 +4,10 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/sun6i-rtc.h>
 #include <dt-bindings/clock/sun55i-a523-ccu.h>
+#include <dt-bindings/clock/sun55i-a523-mcu-ccu.h>
 #include <dt-bindings/clock/sun55i-a523-r-ccu.h>
 #include <dt-bindings/reset/sun55i-a523-ccu.h>
+#include <dt-bindings/reset/sun55i-a523-mcu-ccu.h>
 #include <dt-bindings/reset/sun55i-a523-r-ccu.h>
 #include <dt-bindings/power/allwinner,sun55i-a523-ppu.h>
 #include <dt-bindings/power/allwinner,sun55i-a523-pck-600.h>
@@ -825,6 +827,29 @@ rtc: rtc@7090000 {
 			clock-names = "bus", "hosc", "ahb";
 			#clock-cells = <1>;
 		};
+
+		mcu_ccu: clock-controller@7102000 {
+			compatible = "allwinner,sun55i-a523-mcu-ccu";
+			reg = <0x7102000 0x164>;
+			clocks = <&osc24M>,
+				 <&rtc CLK_OSC32K>,
+				 <&rtc CLK_IOSC>,
+				 <&ccu CLK_PLL_AUDIO0_4X>,
+				 <&ccu CLK_PLL_PERIPH0_300M>,
+				 <&ccu CLK_DSP>,
+				 <&r_ccu CLK_R_AHB>,
+				 <&ccu CLK_MBUS>;
+			clock-names = "hosc",
+				      "losc",
+				      "iosc",
+				      "pll-audio0-4x",
+				      "pll-periph0-300m",
+				      "dsp",
+				      "r-ahb",
+				      "mbus";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
 	};
 
 	thermal-zones {
-- 
2.39.5


