Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1459CC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 15:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9XfsEifKar5stXfmQoJSzAmpLJL98s8nZ3fbq9kr7c=; b=E56FCDwVotI6ZKhGm9CY+ooT8Q
	ToIP2jYyR1h8GfEJe2qhBI3ux1B6wCDI/v8QaFmcZ94JMsEBgNRMiEjx4sWYHCrzPhzMgMig5sEkP
	lPs+8Cpwnnq3ynxxUlGuMrS/tnw6AG2IDDyoAay1rwhpleZmAfQDiw+c4p+qD/5/y7KaHKO4cDIT9
	h5ZHjoPSrr8cP0KdSyjjbcR4kbIXBXHtlV05Mf1BDLrfCPI4uPo7dQ5u5gs2euNFgPXAeaceqs1jY
	4dnVWMBgbVDb0uY4FQVTEuKuMS8sxgOWhbfGv5ZBttcRTGu3/SU9fLV5gdWQmlQ2FUFn5FOn7Gje0
	CL/+2KqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdrf-0000000FEK6-27Zz;
	Fri, 21 Mar 2025 15:00:51 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdn6-0000000FDWl-1VMd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 14:56:09 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3996af42857so2103714f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 07:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742568967; x=1743173767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9XfsEifKar5stXfmQoJSzAmpLJL98s8nZ3fbq9kr7c=;
        b=gcZvE6mtbxeHv/rv9L4ktFim+xZrlO5Ac+fLlhrH5rOId3BGnX6hUrHgunh9w5oCvo
         7i6rWriutyK35HzluXypiRcpaU69Z3OfpNpn6kxrMMpZPQ03ruXfjfgT73xk/oN99MD3
         BPZx8XKR2v3X1FhKyVpy4YyL2LnWrJUWKib0GDtr5Rn0w8WpChBk3idjn17q+bEcrUvG
         d1Ss0NmUE3qc2yx/AnoJVz/ZP8Y5OlG1Q1jCOb3Ic3KbjiNyvIStF/3YF3IvSmf5MwOe
         qmPPKHAhc+tLAFClD0kV6bVpKFEbTLHJfENqHgdfVYQJLcRK09MIEqaFxgw7dtYRtCCo
         bgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742568967; x=1743173767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9XfsEifKar5stXfmQoJSzAmpLJL98s8nZ3fbq9kr7c=;
        b=tJO6EJ/uHR7w9WXidzhJayGifMYmC+exc/bb8h7TICxr49B6H9eaSEUXUAqsTuVNI1
         rWGRJrvPA7jS6WGlqJzItvaXCWZPwTyO0v1+ztxaSu1L7j6/fW0iWvQOp43siThWFJoU
         3krYwpupxhBbpBtMEnVyp8PckVp/praGwO0apDj6QeMxGIwwFx4XYAdL8hWhM9MnlT4d
         c5yS5umZMGF/o9T5zaRYerRLP/qkt9yiG26tgVnC1xpU7z5ZqT3KJZo8cd+LvmREAN/m
         HUMXzJr57dlsWV0Osof/BFCh09nFGqjitGFgHbJ4crgsFmeeF8FigZ8R7yZAImNywqsa
         tTeg==
X-Forwarded-Encrypted: i=1; AJvYcCWzKIn5aUhKpU0zSsp31ZDVoMjf9v+Hfuf3D2t3lfP6O+Pw5IO3SGvKQMqNoOS7jL084++r8WVfg5/BuUEsrRqg@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6oMFiT4vkK/jFbp90BPWHDKMUu6Bg9jPZgBiqr4o3r2ivW6U9
	OkNT4uqytwoxd9b0DllqQlYF9LP8oI8g0YTmsGN3BDeI3b6fIuS0
X-Gm-Gg: ASbGncu98NJoWEEiJPn5NaK2igZUtzVkvuEq+5PHam3RdDD8/0qCx94ziVpQ0DFPFmn
	elotJjpNkioVBZWWvrFW3kGU0q92ktFoBYDVeE1qDz13saze90MKylIx5Fv2rJKIxN5t7BSIu86
	fMTRttRIKjagV5qnNt8SQrxW7DkWBZO6SKRGkU3PmxYHmwoPi7brPP7ib7oOdX4yGNjWt7+qtWn
	m8Zjsa6AqVQlphOzZuL9eUlX/uAuKNSaN9TONwMOA/zi0olWW74VS1AivK81ki2o4s8WxaqkxeY
	Wx3DyKhvYfwI3jkRzmiBrqVVc5xQVk2GMG4l83/U0WbBKZ0HZuXMeTTiJ2+cQZYP3mffyLvJAgM
	TOzo8mJUXHNp9zTq6fhHt
X-Google-Smtp-Source: AGHT+IHuET5V68o+QXYjwl8wKg5TISG52U4TYyqRFDEKMfKNf80Uy59vHorwMKHda7N+AxAUg/J3qQ==
X-Received: by 2002:a05:6000:18a6:b0:391:386d:5971 with SMTP id ffacd0b85a97d-399795756c9mr7097733f8f.14.1742568966563;
        Fri, 21 Mar 2025 07:56:06 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd28a46sm29217095e9.24.2025.03.21.07.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:56:06 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] arm64: dts: exynos: add initial support for Samsung Galaxy S22+
Date: Fri, 21 Mar 2025 16:55:55 +0200
Message-ID: <20250321145556.1436201-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321145556.1436201-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250321145556.1436201-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_075608_408705_AE207FAD 
X-CRM114-Status: GOOD (  18.16  )
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

Samsung Galaxy S22+ (SM-S906B), codenamed g0s, is a mobile phone from
2022. It features 8GB RAM, 128/256GB UFS 3.1, Exynos 2200 SoC and a
1080x2340 Dynamic AMOLED display.

This device has an issue where cpu2 and cpu3 fail to come up
consistently, which leads to a hang later in the boot process. Disable
them until the problem is figured out.

This initial device tree configures simple-framebuffer, volume-up key and
usb.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts | 175 ++++++++++++++++++
 2 files changed, 176 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index f6f4bc650..235b9def4 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -2,6 +2,7 @@
 subdir-y += google
 
 dtb-$(CONFIG_ARCH_EXYNOS) += \
+	exynos2200-g0s.dtb		\
 	exynos5433-tm2.dtb		\
 	exynos5433-tm2e.dtb		\
 	exynos7-espresso.dtb		\
diff --git a/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts b/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
new file mode 100644
index 000000000..6d346fab6
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
@@ -0,0 +1,175 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung Galaxy S22+ (g0s/SM-S906B) device tree source
+ *
+ * Copyright (c) 2025, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+ */
+
+/dts-v1/;
+#include "exynos2200.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	model = "Samsung Galaxy S22+ (SM-S906B)";
+	compatible = "samsung,g0s", "samsung,exynos2200";
+	chassis-type = "handset";
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer: framebuffer {
+			compatible = "simple-framebuffer";
+			memory-region = <&cont_splash_mem>;
+			width = <1080>;
+			height = <2340>;
+			stride = <(1080 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	/*
+	 * RTC clock (XrtcXTI); external, must be 32.768 kHz.
+	 *
+	 * TODO: Remove this once RTC clock is implemented properly as part of
+	 *       PMIC driver.
+	 */
+	rtcclk: clock-rtcclk {
+		compatible = "fixed-clock";
+		clock-output-names = "rtcclk";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+
+	/*
+	 * cpu2 and cpu3 fail to come up consistently, which leads
+	 * to a hang later in the boot process.
+	 *
+	 * Disable them until the issue is figured out.
+	 */
+	cpus {
+		/delete-node/ cpu@200;
+		/delete-node/ cpu@300;
+
+		cpu-map {
+			cluster0 {
+				/delete-node/ core2;
+				/delete-node/ core3;
+			};
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&key_volup>;
+		pinctrl-names = "default";
+
+		volup-key {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&gpa3 0 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x80000000>,
+		      <0x8 0x80000000 0x1 0x7e000000>;
+	};
+
+	/* TODO: Remove this once PMIC is implemented  */
+	reg_dummy: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "dummy_reg";
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		cont_splash_mem: framebuffer@f6200000 {
+			reg = <0x0 0xf6200000 0x0 (1080 * 2340 * 4)>;
+			no-map;
+		};
+
+		debug_kinfo_reserved: debug-kinfo-reserved@fcfff000 {
+			reg = <0x0 0xfcfff000 0x0 0x1000>;
+			no-map;
+		};
+
+		log_itmon: log-itmon@fffe0000 {
+			reg = <0x0 0xfffe0000 0x0 0x20000>;
+			no-map;
+		};
+	};
+};
+
+&cmu_hsi0 {
+	clocks = <&xtcxo>,
+		 <&rtcclk>,
+		 <&cmu_top CLK_DOUT_CMU_HSI0_NOC>,
+		 <&cmu_top CLK_DOUT_CMU_HSI0_DPGTC>,
+		 <&cmu_top CLK_DOUT_CMU_HSI0_DPOSC>,
+		 <&cmu_top CLK_DOUT_CMU_HSI0_USB32DRD>;
+	clock-names = "oscclk", "rtcclk", "noc", "dpgtc", "dposc", "usb";
+};
+
+&ext_26m {
+	clock-frequency = <26000000>;
+};
+
+&ext_200m {
+	clock-frequency = <200000000>;
+};
+
+&mct_peris {
+	status = "okay";
+};
+
+&pinctrl_alive {
+	key_volup: key-volup-pins {
+		samsung,pins = "gpa3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV4>;
+	};
+};
+
+&ppi_cluster0 {
+	affinity = <&cpu0 &cpu1>;
+};
+
+&usb {
+	/* TODO: Replace these once PMIC is implemented  */
+	vdd10-supply = <&reg_dummy>;
+	vdd33-supply = <&reg_dummy>;
+	status = "okay";
+};
+
+&usb32drd {
+	status = "okay";
+};
+
+&usb_dwc3 {
+	dr_mode = "otg";
+	usb-role-switch;
+	role-switch-default-mode = "peripheral";
+	maximum-speed = "high-speed";
+};
+
+&usb_hsphy {
+	/* TODO: Replace these once PMIC is implemented  */
+	vdda12-supply = <&reg_dummy>;
+	vdd-supply = <&reg_dummy>;
+	status = "okay";
+};
+
+&xtcxo {
+	clock-frequency = <76800000>;
+};
-- 
2.43.0


