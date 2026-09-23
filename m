Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29889C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 18:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cTauSR6H/8NKinLJSb31gMD112liycecOTxKay+MW1Y=; b=o7X29BMzevenesDSE4AhyO+HgG
	WCkDvGJ7r7ELvfKf489hBxQOT6NE2LwDDULdPGQ9gASxieIlVY5D2ioyZX1wAqhDQe2uoabvxWS24
	FpeYcdBgkVDtVjX2XbpE3ZEUOGs/T/JDAPY9dW/fluWVjFisILplW10vTs1ofxzq3XN6os7VOOobN
	T8N7d5qeA/GZQrwUdhU7Tc2tYYPYR87zH+j4QYL1mM/ROfvvfrdkYXWgopdIp7K1cebKzhS4q+Cxw
	5sLWEoc9l59GQaDtWV6ukSNdB6XfDeGJ/TcAyGZhaXxMOUdVeyV6IqSVymw+R0nybCSMwWj2aV7VH
	tW7Xd0Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Rjw-00000009Cik-43HT;
	Wed, 23 Sep 2026 18:30:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Rjn-00000009Cdp-29Ji
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 18:30:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=cTauSR6H/8NKinLJSb31gMD112liycecOTxKay+MW1Y=; b=XvjEvmTGhRGTv/Qag8AmSf7AOA
	cqkqV1MguexqAfEkLFoczwgOLIAJ+ij7oqVemLclV7nGOLPLCcE+4TPwQnre58woh5QE6yMWXQ9RW
	ZkSCPEEokF5Sa7qCTYZgMbd7cD3AUdKvQSj1LdO7k/ychI9X8XSgBqPLmErKYASpfoqJe4nYjSsot
	Dqd4u0TpcYoebX0nBFaD+J3buB6LyMp7jC/Un6Kofv11DqwpGr13p1hS0MdQBd2mqPEFAzS4btgx9
	kY0rO4CdveNfTDeOkqJNhm/2OKzIOYj3hosSt811+kfls9flYFS/Lod79ei4v7T3re+a0u83Ohq5z
	CLcVa1Vg==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Rjk-0000000F9r2-0cJX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 18:30:34 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485ac898fa4so1224520f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 11:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790188231; x=1790793031; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cTauSR6H/8NKinLJSb31gMD112liycecOTxKay+MW1Y=;
        b=ARiPHiOPLxCHq+MOf6ddw8HUMBfzgVhHutxZji33tbqpAo2GySjC67I4lxHvpSjSFa
         c2P6IhwlqMWtvzBS/0m6w5Iyk7lTgjkU9sE3i0vhZHlBh1hnWRVOv7jE6e4hvxGjATT5
         eoQdrbyB3/zx9xbf6ttRsS6+scYr8QhLHLLQ7y9vizKe423sp9uIWeBdcGpN9YkeZf/A
         xy5w67qAs12MbM1HqQnFeOBhaT65rMYSBcsC5Xw/rCrh6COy7hH22Ccvb1+wHxTWi4yr
         OV6T16qjBrMA2m6n4NnV+Mn89fcPpjFiUMmgcPPJ/yrzeiAQDcsLTLeNfq1wfr3Z/oZu
         kDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790188231; x=1790793031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cTauSR6H/8NKinLJSb31gMD112liycecOTxKay+MW1Y=;
        b=KDdsuRfAMRvbYS6RxjDzNsSu0poelW/WB8sZ4FYlGpeeii96gtQbgAn8//9FFVS0yJ
         SRkKfmgoPX4F9/hmfmzRZ9hYQRKmHtEXAYacLeftePVwnsDF+oM168B94kmzpEYFVLi8
         9cKalUjvwMd1EXqa/s/alWO+j9B7C8X4aS6WFprlXXrl8Dr2fr9hzGn7EB+Ksl58tSgf
         QaDXkNcCxO3gnMKRttM0ahtYxvBrHSH8YDqRGiI1BAbXh26kbukdTMLKnhECRFBGLlDb
         B1TSLfcaczGN+99cueB991tAPU8w4M3LQ6RCUWKNL3/UV+KvLADNG29RbJpg/IS5bTZe
         XIzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzN2NbCm1tWhLpBBAYADa54HourCsQ3YWi97HiIcBRHFisTwv/qRaqwDeErIRvBeZcF2giH553A+z5aIBQ7R+ix@lists.infradead.org
X-Gm-Message-State: AFuF++nltYtY2+WSqM60nfvz3SGrM9nk4AQyFSXOkWd9HhoZSdaXSzoH
	49+KA+f1POZtaT8N4QPSKK+s+NXFkz37Fa6xxc+WLztT9GzrMdgSAGxW
X-Gm-Gg: AYBFou3MJiSGkvXz5svEqXlDo1F43LoOV1mRcY/0Sk+clZvhb/OUjwbHG6z3iAFcYbC
	imRh4cnh1d01glPk22KgwCAZiTzM8rdUSl6Nl4BvKjaH26LAByYexWqRW4AGeqRSH004iDffqlG
	KUvaTLcxWeaobfa8d1eGTq27dyIU8vok1LH6SqE2nS8dAk17d8a3JmosMG+BXyjrOGu8qP7KMY+
	pkn+KMKTS7o/Od0bSATUZxVMb5fBSHArFd9KP9QvtVAFcYyLaDgsOW4m5BkllvwexTrGrq7HEqw
	8TfitvSpqQazjdnvCgpAqpxa2PvjDqgMIuDZfzo936XGzktYuNHRbpWm65pHwXzd5YmJBr5Rlkm
	uGuAcAk6xWwY+AkXGomrAMk6gzRAgbYhtQ/ZobI7FyBOLsO/GVO0dRY2aMxPpAaQeCFw+gxecnT
	C71Fb6HVOxAhWHg4AO3LdDfvgrWd70qaR01JlFH7U+95AJI42pbM6C+eh8vogieaNrpJXTAd+kK
	QFm8dw5XnliYKaV
X-Received: by 2002:a05:600c:3511:b0:49d:17d4:d6ad with SMTP id 5b1f17b1804b1-49fe66fca74mr955715e9.23.1790188230531;
        Wed, 23 Sep 2026 11:30:30 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd3d5csm4711835e9.14.2026.09.23.11.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 11:30:30 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 23 Sep 2026 21:28:58 +0300
Subject: [PATCH v12 12/12] ARM: dts: zte: Declare zx297520v3 CRM device
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260923-zx29clk-v12-12-9c243796b6d2@gmail.com>
References: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
In-Reply-To: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5992;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=nf0EyPFH35tSBIK5oZ5/jJ+smy+BLU/nT0Pmxgc+7L8=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqtBpu3JRLG91BIUi3oCJuTumCMec0ZWhqcpJPh
 P78Khtbk0mJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCarQabhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKuPxAAoXY2IxIgFRL+DH+XhDc+HjVDfbf9qAE
 ecqWNdsYcAc5XYgZNBixnxFcVWWKFxIoCw8kOta8KLN8eoFlbkKJwFbxwzhUmfV1YgeSQ9d6cN7
 7pEOgO78Z1KDl8scfTC76/87e5PpbbI/QiEGisnb6Y28VU1hvWZlnspKnBN69PpPwFz6YbxKAeW
 4a8m3houAA7uA6GXXBeUiUnuTKqAHlmKs3KX1yfyK9kPYzlon39u09euzsimwhtQ/yE5CdI9QwL
 jDbJwexmlZmWGV1LYZTV6+/zVVp82yQ9m1NwFNxC43i1Kd3s0wnhJgLvCTRj+3XWZ5eLw6u8tCH
 fm0LD8B3V+d1pZ+bLYe1luaiEtH1kqJ4P3nQRgggU3OQ6yq9wgYocGeGPqyFLhPOO31zCqvVGBc
 +Aakk7EfTsK4fV4lH3Xous0pQuK/YLprIV4CWWeyM48kgfh19GVEUmmc/iaLjsESwWsJtWrWkV8
 JBPjJq/ZLM7vJ2kLvSFiGFcblEwVfEOP2ghm+OKnf+QrejirhEUTZg4NpBakM9bVMLG+KXa4C20
 Ae86y81FycBnrcIXXsIT3N9F20Z8SRTsa3TKzT4JASsmGKadfu01FuPgqO0qDLQKjIIz7TrzS7v
 Fil1kcBuX0Hq5VrX9yejrcu/V/biOEYgHqxM/XqSN2ZISKOhArQU=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_193032_312620_A22ED6C9 
X-CRM114-Status: GOOD (  16.96  )
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

This patch adds DT nodes for the main clock and reset controllers on the
zx297520v3 board. It replaces the temporary placeholder UART clocks with
the proper clocks exported by topcrm and lspcrm.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

Version 11: Improved the above the line commit description, removing
references to "previous patches" that won't make sense when reading it
in the kernel commit log.

Version 10: Fix issues with dt-check-style --mode=strict in newly added
code, but left issues in existing nodes alone.

Version 9:
Sort new nodes by mmio address
rename syscon-reboot to "reboot"
adjust to changes in bindings

Version 7:
Add phy nodes to topcrm
Remove syscon from matrixclk again
Adapt remove now-removed extra clk inputs from matrix
Add reset to LSP
osc26m -> clock-26m for the fixed rate clocks, likewise for 32k

Version 6:
Add syscon to matrixclk

Version 5:
Re-name from *clk to *crm
Add the syscon-reboot node here because the binding requires it
Re-add accidentally dropped uart2 IRQ
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 101 ++++++++++++++++++++++++++++++----
 1 file changed, 89 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index a16c30a164bb..ebac3cd137df 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -3,12 +3,26 @@
  * Copyright (c) 2026 Stefan Dösinger <stefandoesinger@gmail.com>
  */
 
+#include <dt-bindings/clock/zte,zx297520v3-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/zte,zx297520v3-reset.h>
 
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
+	osc26m: clock-26m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <26000000>;
+	};
+
+	osc32k: clock-32k {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -20,15 +34,6 @@ cpu@0 {
 		};
 	};
 
-	/* Base bus clock and default for the UART. It will be replaced once a clock driver has
-	 * been added.
-	 */
-	uartclk: uartclk-26000000 {
-		#clock-cells = <0>;
-		compatible = "fixed-clock";
-		clock-frequency = <26000000>;
-	};
-
 	timer {
 		compatible = "arm,armv7-timer";
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
@@ -75,18 +80,87 @@ uart0: serial@131000 {
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x00131000 0x1000>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&topcrm ZX297520V3_UART0_WCLK>,
+				 <&topcrm ZX297520V3_UART0_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&topcrm ZX297520V3_UART0_RESET>;
+
 			status = "disabled";
 		};
 
+		topcrm: clock-controller@13b000 {
+			compatible = "zte,zx297520v3-topcrm", "syscon";
+			reg = <0x0013b000 0x400>;
+			#clock-cells = <1>;
+			clocks = <&osc26m>, <&osc32k>;
+			clock-names = "osc26m", "osc32k";
+			interrupts = <GIC_SPI 42 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 43 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 45 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 46 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "usb-up", "usb-down",
+					  "hsic-up", "hsic-down";
+			#phy-cells = <1>;
+			#reset-cells = <1>;
+
+			reboot {
+				compatible = "syscon-reboot";
+				mask = <0x1>;
+				offset = <0x0>;
+				value = <0x1>;
+			};
+		};
+
+		matrixcrm: clock-controller@1306000 {
+			compatible = "zte,zx297520v3-matrixcrm";
+			reg = <0x01306000 0x400>;
+			#clock-cells = <1>;
+			clocks = <&osc26m>, <&osc32k>,
+				 <&topcrm ZX297520V3_AHB_PCLK>,
+				 <&topcrm ZX297520V3_MPLL>,
+				 <&topcrm ZX297520V3_MPLL_D5>,
+				 <&topcrm ZX297520V3_DPLL>,
+				 <&topcrm ZX297520V3_GPLL>,
+				 <&topcrm ZX297520V3_GPLL_D2>,
+				 <&topcrm ZX297520V3_GATED_OSC26M>;
+			clock-names = "osc26m", "osc32k", "ahb", "mpll",
+				      "mpll-d5", "dpll", "gpll", "gpll-d2",
+				      "wclk-osc26m";
+			#hwlock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		lspcrm: clock-controller@1400000 {
+			compatible = "zte,zx297520v3-lspcrm";
+			reg = <0x01400000 0x100>;
+			#clock-cells = <1>;
+			clocks = <&matrixcrm ZX297520V3_LSP_MPLL_D5_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_MPLL_D4_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_MPLL_D6_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_MPLL_D8_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_MPLL_D12_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_OSC26M_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_OSC32K_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_PCLK>,
+				 <&matrixcrm ZX297520V3_LSP_TDM_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_DPLL_D4_WCLK>;
+			clock-names = "mpll-d5", "mpll-d4", "mpll-d6",
+				      "mpll-d8", "mpll-d12", "osc26m", "osc32k",
+				      "pclk", "tdm-wclk", "dpll-d4";
+			#reset-cells = <1>;
+			resets = <&matrixcrm ZX297520V3_LSP_RESET>;
+		};
+
 		uart1: serial@1408000 {
 			compatible = "arm,pl011", "arm,primecell";
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x01408000 0x1000>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&lspcrm ZX297520V3_UART1_WCLK>,
+				 <&lspcrm ZX297520V3_UART1_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&lspcrm ZX297520V3_UART1_RESET>;
+
 			status = "disabled";
 		};
 
@@ -95,8 +169,11 @@ uart2: serial@140d000 {
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x0140d000 0x1000>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&lspcrm ZX297520V3_UART2_WCLK>,
+				 <&lspcrm ZX297520V3_UART2_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&lspcrm ZX297520V3_UART2_RESET>;
+
 			status = "disabled";
 		};
 	};

-- 
2.55.0


