Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10A7C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 15:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bQ0COox7BnAFBRwedHFdLTwOiDM08dKu4aZNx8jIatU=; b=LWGd+qXYaCYcQXKWHaLtcwrpGD
	5XOFwieKMKHSVmDGRyJ1C4ukHIVn7HqnyDBh7BMGnc2r8VLJ0dtVUqSIMfPiKo2WdUWen1VZadZTN
	oaKTycrjOg5zhAFi3AsFwH9/IJmuLg8wlUMptyjOZdC4mEwajBozizcDcj15Bmp7cnkxBy/Jnu4K/
	qdu0iUvvwkkh3xvKF0G530dagwd8hySk1T/xIs1oj6tLCJztCFDP6BB1RPKuWpPiQma1Wf/7tR83o
	FQQt5HMX8AZzvMJPcQhST4n72BOaYkXBs5ih8LuYUhHTJIG8iReKjr/ZSlR2bZdPGscsy8SanOUii
	gLShv65A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBbEj-00000005VUn-1QY1;
	Sun, 04 May 2025 15:26:37 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBaoV-00000005RXh-42Go
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 May 2025 14:59:33 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-acb5ec407b1so613203966b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 May 2025 07:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746370770; x=1746975570; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQ0COox7BnAFBRwedHFdLTwOiDM08dKu4aZNx8jIatU=;
        b=Zs5XNEfFoVrS8Jp7M9broOW2nfoBSS9CR1ZR87X53h7IK60HNnOI1VyKk7+ASfeJlt
         ykNilFLYMxufct+sIzS8d28TeVA90wdV7thnNSDRX25LHRzq5fb6RvBmd9bnfmw3OZDP
         itK5ORzFdMT+5m004gIvhYVJHnqYAMdc2qjM2Sg4kzub6/9gHY/5vutsZJvw6bfh00YN
         as02o5luWsZqx909lpgporc+XH4X9eFUp92cDPD8ZoFGvprSgVi/bpnRpyLxxwBCDaC4
         U/GpBaHndalEaYQzf005CWkJ+k0X3+NuPSldWOfGccEqj0ZRY5wnRsgBH1AWcqCg7q1s
         kxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746370770; x=1746975570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQ0COox7BnAFBRwedHFdLTwOiDM08dKu4aZNx8jIatU=;
        b=JUlosWEgHjTCr5pMaicBDu3Dw6xcS2cGnK2JUVJIuAvb37eqiRSiAr8kXXB+1tiHWh
         4kqQfj+6We1D+gK9bW5cjgzbf0WE7N11Wirog0ys4HFlU5qbDLGckll6RnYo1NRDSrE1
         nrebq/JXdRjy/EN4x/1ijE85R1i/s+g5AJDmu3X8Y211W0qtSbHOpmE0dyE3djDPpcWv
         c3oM27V02VxBp4kyFeL8smXqWJQnofgWzhurbBuNzkwW4zMBgexhuyo3IfCpPM4asowO
         CpnilXfyWZCVo+aPfad7n4403Zfta4F2kWuyS4gt9W/lZfk3Ar6QW/YWGEm8/9GnkXXV
         KoKg==
X-Forwarded-Encrypted: i=1; AJvYcCXqkNPE4wxLy9MrC5339p760EP9bWkCN/fK7IEmOZyYuShRA+Q6U48e+BL0rbHk6YcK0Z2liypnOWBT4iE/R5Jo@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg1r9LEABI5xRTVjk9LEkR//M4kZUJyj8NheVz6vYRueMDfq87
	da/qm2v27NTO2uib9INQL33ok+JFDpvMy155p6v6Eh4yJJRssCWtTnjFoA==
X-Gm-Gg: ASbGncuSe5cs0tqPLBWBSEwMRYX49KSdEdt2ANL06vxq397b+Pv68jtC7+sT548i0fk
	Vam9X6FSiz1gu219rzQ0BKtbMGE1hqp8P+oAl2xPFzPii9EwXXtGRSoPPCt1IvElVkXIkj4cIL0
	8o0+mmzr1MFm3dg8XIdDjheq3R7xAsSXz+D2HhEskAWqs60JCLu9wqwd/g9XdG9r/Xgzk4YhNpH
	x8C3MhtPzLoOXQMwrPfScXyV19APcz7uDIIVxRp7gajF/WdGjfzSXZGshnMaRKt9qEgxD+TEiwH
	H9lA6L72d7OMMUUA3XJWe0PIZDNdTUGY5Qi6FxBwYoBLlZeGLSOjW1XxwEqTdy3EXyqvIO8dCoP
	bysSzFhjSaTzL3LIr
X-Google-Smtp-Source: AGHT+IFWBUo43QQz0YCvDTeSSoY+npdJ6E8Fufvyzx8tt4gl4NKeZxY8ZiHxTcVzaE4FiZxzfTF6oA==
X-Received: by 2002:a17:907:3f91:b0:acb:b5a4:ba35 with SMTP id a640c23a62f3a-ad1a48bc3c9mr415960666b.2.1746370770089;
        Sun, 04 May 2025 07:59:30 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189508cf4sm336614666b.138.2025.05.04.07.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:59:29 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/4] arm64: dts: exynos: add initial support for Samsung Galaxy S22+
Date: Sun,  4 May 2025 17:59:06 +0300
Message-ID: <20250504145907.1728721-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250504145907.1728721-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250504145907.1728721-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_075931_998758_E5205BAA 
X-CRM114-Status: GOOD (  18.34  )
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
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts | 169 ++++++++++++++++++
 2 files changed, 170 insertions(+)
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
index 000000000..0e348c5cf
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
@@ -0,0 +1,169 @@
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
+/*
+ * cpu2 and cpu3 fail to come up consistently, which leads to a hang later
+ * in the boot process. Disable them until the issue is figured out.
+ */
+&cpu2 {
+	status = "fail";
+};
+
+&cpu3 {
+	status = "fail";
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


