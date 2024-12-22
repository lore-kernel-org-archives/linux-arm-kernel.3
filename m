Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AF2E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 17:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yu601tyY4epLjb/tQTUlTVuTNbfmOtzSi3U6eJFzPzo=; b=dOxgb9FlLb7w8Ubm0JV5iruFRL
	fXeXFoY3Bdx+9MXk7BKsSshfJ7Y5368FobbkZzLOcF/wHHm/nMeWYwTZixO+OJp+StlsQ2nfzd78j
	Rm5ITRz/mwQ4BhJr7p81uGCoxYZK4hKsnGg77T+43uG0K6lcREbN7cgznfZGtSyJgYT5yaL0Zhz95
	OIepX0BKsjRl+mOIGy7X98jG8F0beiPZ4SNU4Qn05sE2bQPhC7CyTTAahle5aOYyT92QA0Ic4nBeW
	1UhJlRLNZMWEpj4SsvaduZTfLgE9HGZejE4RpnrB8/KxIfb5CeBgDcE9DOtaQMBM2JH2khSgAggn2
	bNo4ROHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPq8-00000008bWj-1eXs;
	Sun, 22 Dec 2024 17:34:04 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPkW-00000008auJ-3Uqz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 17:28:18 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-725ee6f56b4so2980369b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734888496; x=1735493296; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yu601tyY4epLjb/tQTUlTVuTNbfmOtzSi3U6eJFzPzo=;
        b=Jvjy6gjAyt8m1y4rIL+lr0EyUFE8ZBusEh5bS6noqfjNm65mjwUDppkhJmyAN5OM7R
         I9GdAYQT9B7HKnc2jbvVnFC7IjAzisJa0OFhr8vo7i6iJHsOpUIo1fWr3IBf9kZFOLos
         /uqjIUauuasNTGKBoCqq8p5hIDFTCUbc0LQwJNz2NNkwur2awsBhVA78LXAo1aKXz0JO
         VRhhIQorCGWamc7eCpiIHeDQCj3QmIXMZUmJ7eAKqfd35iWF/gkz8QfrvC704qs/2gYq
         M1aL35xMD2GtbczZtM11b/9Yjv7rdkJOCFOIAuuLnL7SWo7omAnIf3z7bhh8SEpxKtl2
         yPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734888496; x=1735493296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yu601tyY4epLjb/tQTUlTVuTNbfmOtzSi3U6eJFzPzo=;
        b=kj9OIrqTMl8OQ7/OzEZSJ3mgCC8VA+ktAKAHvIfqNWhEAbviWOjav3rdrUH1wgBzi/
         4/4cnI75UkvC0skXtYC9iKbwkO12fBMZZnsDWVyEgwrdSyNUbczkRpX3QRW77fCAbuLX
         YpQzTL8BcefnEvQcBqlBf76e4R+ug+pvCtkeUBwJVDWL7LRjPWV8W/n7QfYx6KaR4NuH
         759jyyKcs/wWimiLrueGjBKBcsaGoqGuXbOzSwIC3nGtGMIEObtUzPUDuarnxJ7CrIFB
         /3kepflFF7KN4fN8jfuooZ8B8jrgfJ4WUrzddUs9MFNAX6lmu38kmFfMo+4CLmTXsla3
         uU3g==
X-Forwarded-Encrypted: i=1; AJvYcCW8DSEq7Ofek4enFWWQjFmTubny3ySoRX/Wd8Lm7+D5gQtVlp27rwOCpLHlsq4FSsQw1WrmHxbHWMt6+xF67txP@lists.infradead.org
X-Gm-Message-State: AOJu0YxWenzTCKLG48gJM/Caa5eI0vVPxw2DFyU5LA71h7InjYqSWQaP
	1eWn8bX8MjnlggleWdOcx9ivB2dsnYqtRwHBb33jaJ5QQjhtWHJtR+b+3gun
X-Gm-Gg: ASbGncsRdqxGVNK9XsImrlwYmR4Y/OofRWZByIeKWd4O+QCiOvStlXwg1fZBPKFI6QF
	rx1Br0/imqSI0xNMxj17tWxqI9vA63x//DSoKsGlS8f++1mwtrFHADF+JVOhdFZckRcBT8vMJnv
	QQo2leswPMlNCh57He6fp6aHOFp6Wr56gXS1fTpEYVpLtml/T4wHZZpuvGKHnoCd8TH6Jv7N0o1
	WN1CQq3EFJMe/VsBbcg5h0ndst5thrpr14cnlpjjDft2Yg8jvfCnBkcFQ==
X-Google-Smtp-Source: AGHT+IH1Z39YXP8Pu3o3xRuuV9/Pd7ax39fhbC54Q7wq7X45elUygQIrzJo2YY5Botik9QCb/Tsx5A==
X-Received: by 2002:a05:6a20:8428:b0:1d9:3957:8a14 with SMTP id adf61e73a8af0-1e5e04584ccmr16452790637.1.1734888495765;
        Sun, 22 Dec 2024 09:28:15 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72aad836192sm6585404b3a.68.2024.12.22.09.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:28:15 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v2] arm64: dts: apple: Split s8000/s8003 SoC DTS files
Date: Mon, 23 Dec 2024 01:26:08 +0800
Message-ID: <20241222172735.145764-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_092816_886511_EB15779C 
X-CRM114-Status: GOOD (  20.56  )
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

Despite what the code comments said, the DTS files were not split properly.
Since these two SoCs are now known to have minor differences like in
latencies for cpufreq state transistions, split the DTS files now.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Changes since v1:
- Drop PMGR nodes file rename. This is now the first patch and other series
that modifies Apple A9 DTS files now depend on this series.

Link to v1: https://lore.kernel.org/asahi/20241206135051.56049-1-towinchenmi@gmail.com/T

Nick Chan

 arch/arm64/boot/dts/apple/s800-0-3.dtsi | 140 ++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/s8000.dtsi    | 133 +---------------------
 arch/arm64/boot/dts/apple/s8003.dtsi    |  10 +-
 3 files changed, 146 insertions(+), 137 deletions(-)
 create mode 100644 arch/arm64/boot/dts/apple/s800-0-3.dtsi

diff --git a/arch/arm64/boot/dts/apple/s800-0-3.dtsi b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
new file mode 100644
index 000000000000..082e5b1733d0
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple S8000/S8003 "A9" SoC
+ *
+ * This file contains parts common to both variants of A9
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/apple-aic.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/apple.h>
+
+/ {
+	interrupt-parent = <&aic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	clkref: clock-ref {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "clkref";
+	};
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "apple,twister";
+			reg = <0x0 0x0>;
+			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			enable-method = "spin-table";
+			device_type = "cpu";
+		};
+
+		cpu1: cpu@1 {
+			compatible = "apple,twister";
+			reg = <0x0 0x1>;
+			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			enable-method = "spin-table";
+			device_type = "cpu";
+		};
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		nonposted-mmio;
+		ranges;
+
+		serial0: serial@20a0c0000 {
+			compatible = "apple,s5l-uart";
+			reg = <0x2 0x0a0c0000 0x0 0x4000>;
+			reg-io-width = <4>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 192 IRQ_TYPE_LEVEL_HIGH>;
+			/* Use the bootloader-enabled clocks for now. */
+			clocks = <&clkref>, <&clkref>;
+			clock-names = "uart", "clk_uart_baud0";
+			status = "disabled";
+		};
+
+		aic: interrupt-controller@20e100000 {
+			compatible = "apple,s8000-aic", "apple,aic";
+			reg = <0x2 0x0e100000 0x0 0x100000>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+		};
+
+		pinctrl_ap: pinctrl@20f100000 {
+			compatible = "apple,s8000-pinctrl", "apple,pinctrl";
+			reg = <0x2 0x0f100000 0x0 0x100000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_ap 0 0 208>;
+			apple,npins = <208>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 42 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 43 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 44 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 45 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 46 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 47 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 48 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_aop: pinctrl@2100f0000 {
+			compatible = "apple,s8000-pinctrl", "apple,pinctrl";
+			reg = <0x2 0x100f0000 0x0 0x100000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_aop 0 0 42>;
+			apple,npins = <42>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 113 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 114 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 115 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 116 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 117 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 119 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		wdt: watchdog@2102b0000 {
+			compatible = "apple,s8000-wdt", "apple,wdt";
+			reg = <0x2 0x102b0000 0x0 0x4000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 4 IRQ_TYPE_LEVEL_HIGH>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&aic>;
+		interrupt-names = "phys", "virt";
+		/* Note that A9 doesn't actually have a hypervisor (EL2 is not implemented). */
+		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
+
+/*
+ * The A9 was made by two separate fabs on two different process
+ * nodes: Samsung made the S8000 (APL0898) on 14nm and TSMC made
+ * the S8003 (APL1022) on 16nm. There are some minor differences
+ * such as timing in cpufreq state transistions.
+ */
diff --git a/arch/arm64/boot/dts/apple/s8000.dtsi b/arch/arm64/boot/dts/apple/s8000.dtsi
index 6e9046ea106c..c7e39abda7e1 100644
--- a/arch/arm64/boot/dts/apple/s8000.dtsi
+++ b/arch/arm64/boot/dts/apple/s8000.dtsi
@@ -7,138 +7,11 @@
  * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
  */
 
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/interrupt-controller/apple-aic.h>
-#include <dt-bindings/interrupt-controller/irq.h>
-#include <dt-bindings/pinctrl/apple.h>
-
-/ {
-	interrupt-parent = <&aic>;
-	#address-cells = <2>;
-	#size-cells = <2>;
-
-	clkref: clock-ref {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <24000000>;
-		clock-output-names = "clkref";
-	};
-
-	cpus {
-		#address-cells = <2>;
-		#size-cells = <0>;
-
-		cpu0: cpu@0 {
-			compatible = "apple,twister";
-			reg = <0x0 0x0>;
-			cpu-release-addr = <0 0>; /* To be filled in by loader */
-			enable-method = "spin-table";
-			device_type = "cpu";
-		};
-
-		cpu1: cpu@1 {
-			compatible = "apple,twister";
-			reg = <0x0 0x1>;
-			cpu-release-addr = <0 0>; /* To be filled in by loader */
-			enable-method = "spin-table";
-			device_type = "cpu";
-		};
-	};
-
-	soc {
-		compatible = "simple-bus";
-		#address-cells = <2>;
-		#size-cells = <2>;
-		nonposted-mmio;
-		ranges;
-
-		serial0: serial@20a0c0000 {
-			compatible = "apple,s5l-uart";
-			reg = <0x2 0x0a0c0000 0x0 0x4000>;
-			reg-io-width = <4>;
-			interrupt-parent = <&aic>;
-			interrupts = <AIC_IRQ 192 IRQ_TYPE_LEVEL_HIGH>;
-			/* Use the bootloader-enabled clocks for now. */
-			clocks = <&clkref>, <&clkref>;
-			clock-names = "uart", "clk_uart_baud0";
-			status = "disabled";
-		};
-
-		aic: interrupt-controller@20e100000 {
-			compatible = "apple,s8000-aic", "apple,aic";
-			reg = <0x2 0x0e100000 0x0 0x100000>;
-			#interrupt-cells = <3>;
-			interrupt-controller;
-		};
-
-		pinctrl_ap: pinctrl@20f100000 {
-			compatible = "apple,s8000-pinctrl", "apple,pinctrl";
-			reg = <0x2 0x0f100000 0x0 0x100000>;
-
-			gpio-controller;
-			#gpio-cells = <2>;
-			gpio-ranges = <&pinctrl_ap 0 0 208>;
-			apple,npins = <208>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-			interrupt-parent = <&aic>;
-			interrupts = <AIC_IRQ 42 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 43 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 44 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 45 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 46 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 47 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 48 IRQ_TYPE_LEVEL_HIGH>;
-		};
-
-		pinctrl_aop: pinctrl@2100f0000 {
-			compatible = "apple,s8000-pinctrl", "apple,pinctrl";
-			reg = <0x2 0x100f0000 0x0 0x100000>;
-
-			gpio-controller;
-			#gpio-cells = <2>;
-			gpio-ranges = <&pinctrl_aop 0 0 42>;
-			apple,npins = <42>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-			interrupt-parent = <&aic>;
-			interrupts = <AIC_IRQ 113 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 114 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 115 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 116 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 117 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 118 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 119 IRQ_TYPE_LEVEL_HIGH>;
-		};
-
-		wdt: watchdog@2102b0000 {
-			compatible = "apple,s8000-wdt", "apple,wdt";
-			reg = <0x2 0x102b0000 0x0 0x4000>;
-			clocks = <&clkref>;
-			interrupt-parent = <&aic>;
-			interrupts = <AIC_IRQ 4 IRQ_TYPE_LEVEL_HIGH>;
-		};
-	};
-
-	timer {
-		compatible = "arm,armv8-timer";
-		interrupt-parent = <&aic>;
-		interrupt-names = "phys", "virt";
-		/* Note that A9 doesn't actually have a hypervisor (EL2 is not implemented). */
-		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
-			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
-	};
-};
+#include "s800-0-3.dtsi"
 
 /*
  * The A9 was made by two separate fabs on two different process
  * nodes: Samsung made the S8000 (APL0898) on 14nm and TSMC made
- * the S8003 (APL1022) on 16nm. While they are seemingly the same,
- * they do have distinct part numbers and devices using them have
- * distinct model names. There are currently no known differences
- * between these as far as Linux is concerned, but let's keep things
- * structured properly to make it easier to alter the behaviour of
- * one of the chips if need be.
+ * the S8003 (APL1022) on 16nm. There are some minor differences
+ * such as timing in cpufreq state transistions.
  */
diff --git a/arch/arm64/boot/dts/apple/s8003.dtsi b/arch/arm64/boot/dts/apple/s8003.dtsi
index 7e4ad4f7e499..807e3452f8a7 100644
--- a/arch/arm64/boot/dts/apple/s8003.dtsi
+++ b/arch/arm64/boot/dts/apple/s8003.dtsi
@@ -7,15 +7,11 @@
  * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
  */
 
-#include "s8000.dtsi"
+#include "s800-0-3.dtsi"
 
 /*
  * The A9 was made by two separate fabs on two different process
  * nodes: Samsung made the S8000 (APL0898) on 14nm and TSMC made
- * the S8003 (APL1022) on 16nm. While they are seemingly the same,
- * they do have distinct part numbers and devices using them have
- * distinct model names. There are currently no known differences
- * between these as far as Linux is concerned, but let's keep things
- * structured properly to make it easier to alter the behaviour of
- * one of the chips if need be.
+ * the S8003 (APL1022) on 16nm. There are some minor differences
+ * such as timing in cpufreq state transistions.
  */

base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
-- 
2.47.1


