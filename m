Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F362FC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 10:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxAQzBIuDEjNPPt2+GBcviP+gEPMyBF+eVwOOWNWw4c=; b=St9a9+SlupsVnvG3lflc0r6TsW
	sAFWkI4N/d2S5dGDobphZBh4zZq3FOGoYb4D7ghlk8Lj1rgFyhzCBNTs/3i/0JjsI/Ww/84C1NBvs
	F/DUb51WgJz9nYGksPBI7JHpofLTJOD0Mb8SqKDxXWOeJTtH4IR+zLNoAz+VLckBTQqhnXDqyRYJG
	LZsALGiVSNTIljFHLrBVSq8d5RC6TDiiweLnfSjxqEeaH7kVKsgeVXhmfMJirm0DzODEfo5NU4PCg
	abk6ClM8zyqwEvEtvDWtkcdrhYBfC4I8ZGwEV3yy5KmQdaMujfH+qTqFrW7P1HGXKPtOREKlAqsOY
	ToCsRKaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwH7P-00000007jMs-2qJk;
	Tue, 18 Aug 2026 10:32:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwH79-00000007j4f-1N0n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 10:32:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 93F744402E;
	Tue, 18 Aug 2026 10:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 716A7C2BCFA;
	Tue, 18 Aug 2026 10:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787049134;
	bh=tICu1kyhW6ciLBQrYgOgEDijSYbYwL7txSJb0cxx7wI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XCggO56rLefYkLZxt338eDp+nxd6r27UQn+zgjAojugWeUxI6ASTSBtMR2sGs1BBm
	 441RWJMBMxKCkjM2loHm7n3mYTRdpVV/2FHOlB9YMkuGDR4++iY6lhtl9FNJ2+Fi/0
	 Iq5Gh0pyYj1x1PgMs0ZdC1YjoAd/4o3147B+hmhJVqkiooQ4q8lUsAbKmkIjxzLgP6
	 H3BgyY7WhQRn1d8aSzg/LQIrz749aHD4nFXctbh66aWdPPQs4R+LEO41+oY/JGm5cX
	 olfIEugGWijnwXLDwVHhD04FOJp3mOCiHaAIcxnvpPv8Qkbef0MIL+T6goIPesqTaL
	 ejePVEU9ntY4g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D750C5DF81;
	Tue, 18 Aug 2026 10:32:14 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Tue, 18 Aug 2026 18:31:25 +0800
Subject: [PATCH v5 11/12] arm64: ambarella: add ARCH_AMBARELLA and CV75 EVK
 DT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-cv75-v5-v5-11-7bbb12f0360f@ambarella.com>
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
In-Reply-To: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>, 
 Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, 
 Long Zhao <zl020895@163.com>, Long Zhao <longzhao@ambarella.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787049131; l=8330;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=IpNrjrrLhNL6j9beNqn3g0g/0+e1YQ5b0+ZAZpgVVg4=;
 b=E6xncZh3d3ihAc1k6GLnYxEVrI56nkcf430XoEdkWisRIUbRsKMs8ow4ecJllXPgfHTdTQUak
 15feqe7gCC2C9uQ0cdOHuNkQkh0xCGeD03SM1HN5M0m+qAMS9IdA9ux
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
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
Reply-To: longzhao@ambarella.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Long Zhao <longzhao@ambarella.com>

Enable ARCH_AMBARELLA and add a minimal CV75 SoC / EVK device tree for
console bring-up with the RCT clocks, UART, pinctrl and GPIO banks.

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 arch/arm64/Kconfig.platforms               |   8 ++
 arch/arm64/boot/dts/Makefile               |   1 +
 arch/arm64/boot/dts/ambarella/Makefile     |   3 +
 arch/arm64/boot/dts/ambarella/cv75-evk.dts |  30 +++++
 arch/arm64/boot/dts/ambarella/cv75.dtsi    | 176 +++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig               |   2 +
 6 files changed, 220 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index d2acfac73003..cb05eff267a8 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -26,6 +26,14 @@ config ARCH_SUNXI
 	help
 	  This enables support for Allwinner sunxi based SoCs like the A64.
 
+config ARCH_AMBARELLA
+	bool "Ambarella SoC family"
+	select ARM_PSCI
+	select HAVE_ARM_ARCH_TIMER
+	select PINCTRL
+	help
+	  This enables support for the ARM64 based Ambarella SoCs like CV75.
+
 config ARCH_ALPINE
 	bool "Annapurna Labs Alpine platform"
 	select ALPINE_MSI if PCI
diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index fc726b215f12..f1709eb5d915 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -4,6 +4,7 @@ subdir-y += airoha
 subdir-y += allwinner
 subdir-y += altera
 subdir-y += amazon
+subdir-y += ambarella
 subdir-y += amd
 subdir-y += amlogic
 subdir-y += apm
diff --git a/arch/arm64/boot/dts/ambarella/Makefile b/arch/arm64/boot/dts/ambarella/Makefile
new file mode 100644
index 000000000000..ddca3d7b18cc
--- /dev/null
+++ b/arch/arm64/boot/dts/ambarella/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+dtb-$(CONFIG_ARCH_AMBARELLA) += cv75-evk.dtb
diff --git a/arch/arm64/boot/dts/ambarella/cv75-evk.dts b/arch/arm64/boot/dts/ambarella/cv75-evk.dts
new file mode 100644
index 000000000000..42a0fe24b83b
--- /dev/null
+++ b/arch/arm64/boot/dts/ambarella/cv75-evk.dts
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Ambarella CV75 EVK board
+ */
+
+/dts-v1/;
+
+#include "cv75.dtsi"
+
+/ {
+	model = "Ambarella CV75 EVK Board";
+	compatible = "ambarella,cv75-evk", "ambarella,cv75";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = &uart0;
+	};
+
+	memory@200000 {
+		device_type = "memory";
+		reg = <0x0 0x00200000 0x0 0x07e00000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/ambarella/cv75.dtsi b/arch/arm64/boot/dts/ambarella/cv75.dtsi
new file mode 100644
index 000000000000..3b7948954968
--- /dev/null
+++ b/arch/arm64/boot/dts/ambarella/cv75.dtsi
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Ambarella CV75 SoC
+ *
+ * Boot peripheral: UART0 console.
+ * Clocks: a single ambarella,cv75-rct provider.
+ */
+
+#include <dt-bindings/clock/ambarella,cv75-rct.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "ambarella,cv75";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "arm,cortex-a76";
+			device_type = "cpu";
+			reg = <0x000>;
+			enable-method = "psci";
+		};
+
+		cpu@1 {
+			compatible = "arm,cortex-a76";
+			device_type = "cpu";
+			reg = <0x100>;
+			enable-method = "psci";
+		};
+	};
+
+	osc: oscillator {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "osc";
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ahb@ffe0000000 {
+			compatible = "simple-bus";
+			reg = <0xff 0xe0000000 0x0 0x01000000>;
+			ranges = <0xe0000000 0xff 0xe0000000 0x01000000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			s_scratchpad_syscon: scratchpad@e002e000 {
+				compatible = "ambarella,cv75-sec-scratchpad", "syscon";
+				reg = <0xe002e000 0x1000>;
+			};
+		};
+
+		apb@ffe4000000 {
+			compatible = "simple-bus";
+			reg = <0xff 0xe4000000 0x0 0x01000000>;
+			ranges = <0xe4000000 0xff 0xe4000000 0x01000000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			uart0: serial@e4000000 {
+				compatible = "ambarella,cv75-uart";
+				reg = <0xe4000000 0x1000>;
+				clocks = <&rct CV75_GCLK_UART0>;
+				interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart0_pins>;
+				reg-io-width = <4>;
+				reg-shift = <2>;
+
+				status = "disabled";
+			};
+
+			pinctrl: pinctrl@e4010000 {
+				compatible = "ambarella,cv75-pinctrl";
+				reg = <0xe4010000 0x1000>;
+				ambarella,drive-strength-syscon = <&rct>;
+				ambarella,pull-syscon = <&s_scratchpad_syscon>;
+
+				uart0_pins: uart0-pins {
+					function = "uart0";
+					groups = "uart0";
+				};
+			};
+
+			gpio0: gpio@e4013000 {
+				compatible = "ambarella,cv75-gpio", "arm,primecell";
+				reg = <0xe4013000 0x1000>;
+				clocks = <&rct CV75_GCLK_APB>;
+				clock-names = "apb_pclk";
+				interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-ranges = <&pinctrl 0 0 32>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				arm,primecell-periphid = <0x00000061>;
+			};
+
+			gpio1: gpio@e4014000 {
+				compatible = "ambarella,cv75-gpio", "arm,primecell";
+				reg = <0xe4014000 0x1000>;
+				clocks = <&rct CV75_GCLK_APB>;
+				clock-names = "apb_pclk";
+				interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-ranges = <&pinctrl 0 32 32>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				arm,primecell-periphid = <0x00000061>;
+			};
+
+			gpio2: gpio@e4015000 {
+				compatible = "ambarella,cv75-gpio", "arm,primecell";
+				reg = <0xe4015000 0x1000>;
+				clocks = <&rct CV75_GCLK_APB>;
+				clock-names = "apb_pclk";
+				interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-ranges = <&pinctrl 0 64 32>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				arm,primecell-periphid = <0x00000061>;
+			};
+		};
+
+		rct: clock-controller@ffed080000 {
+			compatible = "ambarella,cv75-rct", "syscon";
+			reg = <0xff 0xed080000 0x0 0x1000>;
+			clocks = <&osc>;
+			clock-names = "osc";
+			#clock-cells = <1>;
+			assigned-clocks = <&rct CV75_GCLK_UART0>;
+			assigned-clock-parents = <&osc>;
+			assigned-clock-rates = <24000000>;
+		};
+
+		gic: interrupt-controller@fff0101000 {
+			compatible = "arm,gic-400";
+			reg = <0xff 0xf0101000 0x0 0x1000>,
+			      <0xff 0xf0102000 0x0 0x2000>,
+			      <0xff 0xf0104000 0x0 0x2000>,
+			      <0xff 0xf0106000 0x0 0x2000>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupts = <GIC_PPI 9
+				      (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+};
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index ad3bd3d9507b..ae5bcc6c9fc7 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -36,6 +36,7 @@ CONFIG_CRASH_DUMP=y
 CONFIG_ARCH_ACTIONS=y
 CONFIG_ARCH_AIROHA=y
 CONFIG_ARCH_SUNXI=y
+CONFIG_ARCH_AMBARELLA=y
 CONFIG_ARCH_ALPINE=y
 CONFIG_ARCH_APPLE=y
 CONFIG_ARCH_ARTPEC=y
@@ -560,6 +561,7 @@ CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_NR_UARTS=8
 CONFIG_SERIAL_8250_EXTENDED=y
 CONFIG_SERIAL_8250_SHARE_IRQ=y
+CONFIG_SERIAL_8250_AMBARELLA=y
 CONFIG_SERIAL_8250_BCM2835AUX=y
 CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_8250_EM=y

-- 
2.34.1



