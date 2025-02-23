Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58992C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 12:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JU9uqaoEFw0FWEDNXOGeXJkEIYyjDYrz5952fWijY14=; b=ROkqzoG0vWWhJXaCF634bzwjwb
	ZYnjnJ9DlZZUjCyny+CUhYKkTCtazH2Xr5eluUX5oStYqHpYueAt2GNKPq3uv9Ofs6FIdo6lJPrsR
	cPLy/DtFSnx0N99vWiXChMjn3uwhRSEKg7/XXBUz3+YmwhezTUo3tij1m1JsX8SPpn6cZDgkmiqoj
	JpkXgJizhXk+MdvXhfEcHPmGpM81GFh4M1n2JD4YSi7fnrHD9Joxq98zGjl41Y6Si2xxgnjKFPteR
	+ZhPDVWzI7IlagblN+s1ZQ/UnzqV40mfpGhp/oCC14L2PhhwL+P+AHQyybkjLzaqIEECO2jYfmneC
	EOEFVL0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmBJ2-0000000B7Th-0iTX;
	Sun, 23 Feb 2025 12:42:00 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmB8G-0000000B69M-0rYF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 12:30:53 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-439a1e8ba83so33831315e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Feb 2025 04:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740313850; x=1740918650; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JU9uqaoEFw0FWEDNXOGeXJkEIYyjDYrz5952fWijY14=;
        b=Dmn6YBTKvv1W5gizu2EDjkGO0aK8OW2ohK0BMplTK16NjpFvCSA0E6Gyv+J1OkTVcu
         TMPxd9YDvH81CwNuJZGiXgpUXZGAk4rsQOsGKFTgns+oB1BX783wPvyqgtU6Q0zWpOzC
         88SWWmGH4JIOI/TltTtNUXDYy9IfoRz+sxx1hSB9WckooonREAgwos2/xOjegtrCAIv7
         S6dPih6JJnojbJwGv9P1u07mMvuAAtO9ICwfgC6PBpFYOdxaTngaAe0cHJxBXlAZyOMM
         DHCfH/vPZwL3OTK93UQSishYQHG0D6QzsJGPo+xX2x0kBjFTsZaDUqwJM2tn++bKLg9h
         6jgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740313850; x=1740918650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JU9uqaoEFw0FWEDNXOGeXJkEIYyjDYrz5952fWijY14=;
        b=gsoK863VjNQJbGwrljLqnk7wANVhcga/ic2FiH9Ctf6rMQtdChY8NXgloMWgndsoD1
         AxAvRHAbNT6DGETFg10YhgIE92kQDmrD+PrEhsyHkljOEzgrzsyBx6Bd/6l+8+PnSi2b
         4S2iTGRDqK1uWcg5c4uq6vS3QiqIiHDtgnDMq9OCnaGGxIsBEq/9UOyRPxGEyMpmVeJR
         Rfn23cmlAwW+t7nd1DOu4H0nJd68+K+3CXWaZAlj2gmvKRYUte/R3e/zz/m9LHItDiiW
         BUz6pgkePJsymNjsPLyDbApTlITLS7/VTmc3NYTr7pAcTJkdatHw+pUzKupGQ0fR5shb
         e7vw==
X-Forwarded-Encrypted: i=1; AJvYcCVNlUw6e1Uuy+44JGNyv1cQQylELs+mxvkXIg1sF4rhiR97b0w0K17KMMMIY2IOYUK1XkQ3fFnRYnecXXI9cxrY@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4ETYQqIujq2Jd3SL2FWv1zORLLu9LseGvAGpcZTlpoCApWI9l
	FcXYWIPjCu9IP9xW8/HWZKEQGx7rQ2k5nAiE8bcY1XcrVYm9FUay
X-Gm-Gg: ASbGncvqG9myGlAs0njI3WWBKUzvUPVmwrRjjv0IL+USkRuh8/LSqTDxlD63Cfb6op/
	U4F1wSxu7X5S00JlpGNW5nDcj49PqYFLcoKPKQo054C/bA5dMx39CAUMV91ZJSnp2DXQ1qqCE9+
	UkSEuWzm38xg/kMwwUYGzkOu+kYxlxnzLaWurT902ap4tbbm6o2+MdaPkwS0eHfpjhq30jffELs
	1uZia9kktrmlHqTKQ0CPww7FKiXZwiNhshj3BFMsaM+JNtiYrSwv+7FJOHEL27KrdBFwGw5VC4p
	AiHGxxl611TA5d8rz4r2MbcWXwQfqMr6VAclLET7auYemSbQCNJlEYFtmIewyk6k5k9Vz29dbDh
	ZRw==
X-Google-Smtp-Source: AGHT+IF5Ji5wEELPk8SVxp5aJnK9skC1tAl7cqnVlRnzYt1UM8YbLpaWh+L+VDDh6XzKGzSiA9maDQ==
X-Received: by 2002:a05:600c:1910:b0:439:98f6:8bc8 with SMTP id 5b1f17b1804b1-439aebcf61dmr70897935e9.26.1740313850484;
        Sun, 23 Feb 2025 04:30:50 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b030b2c8sm77061935e9.25.2025.02.23.04.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 04:30:50 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] arm64: dts: exynos: add initial support for Samsung Galaxy S22+
Date: Sun, 23 Feb 2025 14:30:43 +0200
Message-ID: <20250223123044.725493-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250223123044.725493-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250223123044.725493-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_043052_245050_1CFD6802 
X-CRM114-Status: GOOD (  17.97  )
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
index 000000000..06e5a34be
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
+&usb_con_phy {
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


