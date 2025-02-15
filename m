Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE530C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 13:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+ZWEwseGHWff/rdHEerKDPxaC6ZLWGEKuNbMgNyfns=; b=47nbeRDZwgE9pdl0QS2YYSRb5H
	eVGp7teDhWHH2utylMXWm73EOLoyk5jZMbBZZvKO69IAni6hRk6snt4ZBzIfAU9qpCZe8KE6kXo7k
	1PDLW3y3KS+pFj6m6MneN043/fMVRi5LPVTYTMVR23rpEdS2DXvOqUIHlC1RLX3BXjXd+65kcl8vC
	NNQK9/B9rzmwnm/KQDsoySP6VxbnJcYFenpl1kump4lHO4yMqheDBMQ+LkPoYa2BgtP/i2iYcOMDv
	aGxxWvxQBszhdo4BZbTbINpgtvbrEAYcD3UBxUlophGkhbvRq6VX7Wq219LI+qn20uFIPQPmQH3j1
	T0EK58Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjHvJ-000000007Yf-3E5i;
	Sat, 15 Feb 2025 13:09:33 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjHr6-000000006wU-30e8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 13:05:13 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-38f2b7ce2f3so1450772f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 05:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739624711; x=1740229511; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+ZWEwseGHWff/rdHEerKDPxaC6ZLWGEKuNbMgNyfns=;
        b=VtxvX04bJN+I4snrTRptJRlg/9rGKrr/z6a9W86CDqMEe0iWms9cVkuPZivGEt/I++
         g55miM1RCLjwKHU4yLEUKIC2R76nWLhEIoINjV4dmKbn6OQlpg7lr5N6i5Ab2Yy+rPGg
         LAKzv4LCAl7SETj3DVVNiDVFT7D9WcWwswIkIi1ouwGhF09qy23M8093muVCHz1/59Ge
         4aeY3R4hIiNFgrI5ZpBNwxi5YBiFntEBC8wdCm96CVriYO6EQSoB9xcDod3auZq/D5p+
         SRKLqMcYkGHAFXLNdYt0IRVRN4kTqIRcqQxQaGKRUrZpbU/JYnjA137ls7vvJ+sWDqUH
         3kXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739624711; x=1740229511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+ZWEwseGHWff/rdHEerKDPxaC6ZLWGEKuNbMgNyfns=;
        b=KP1cbuLhskGlLglwKLm8r+JIKsshbi6a0crQCMYMGWk7AAwk1GBad39eufM1rRfDkW
         f9QX7V0FKpsr3UXgVBBEbEXguYaTsy5OrLa5gnuMdBKZ2UCHytIh/T9d6BTMqO6gQefK
         urm4mCDze68/5E0BsSApvlZFOS33g28rtWK4qruoFokloh2eJ71V+BnlRM2tfgwSyp4H
         W9gwY8Nu/8TnPaxjj3ONcecfpnf2aShYOHZLHWwNc3hf9ASui7hffYK0yjGkEg2gDGu1
         cRhiQketAL48S0mbGffTldMHmzIWVpR6UFCkjqXP8lzutyBRDWpL1xnfnZXJ/RrsQ1eI
         iUdw==
X-Forwarded-Encrypted: i=1; AJvYcCX8yiEogn2J2DnE20iQrcZyTyaXTIdbN63ZsfKQYiTeLgo/3i2IJojmUJdWXyk2k474Baz9+nx6aYfliVjVU0TB@lists.infradead.org
X-Gm-Message-State: AOJu0YzZyZmxPJdLm0MbxlciEe0sCbdPA8bIIWejILXhvLZELF6swhTS
	5YSnNPmGgH+DdlRNCtdVTb+n3OT/UdDYan6WdUlV4KKv/hhDhiQu
X-Gm-Gg: ASbGncuh4fjokeVh/+hNfDUlvWfEA63LdTKClNKtdek/+2A5aT5tY4DtHTZpC7ZtULy
	StIc02Gboneb4ENYz96sPDSuhKwhPvHfCgxsUUrq/RN8o+fivI1VA6N4xLd4qs4DYqijPeFbU4I
	w6HwIW9+0crQqevkqjGJ5RmgFcZfWza/mQYYPyiEVc9g1E4b1qffoPBD65QhnHOjO8oizCb91qi
	mrY5R+70wn2gnhgPYKPg6Af7yptUmiEnrLk7C49io1Bv8tPPqXDcLQrIdRrcrzkw932ejGsPyYC
	mWQnmrq0A0ffOuoA8gkYD3Pkre3FHnPYqUaphkt8ap1IQ1nFy+X6eeVhPg6FM6PXmN8=
X-Google-Smtp-Source: AGHT+IGbnUcOwybP3VJYcAbYRQ1V03EpL/4uIL2y4X7XRbXmjiYxSkt/oPRGBZ7+y8O4Sa4/uhHofg==
X-Received: by 2002:a5d:6d8c:0:b0:38f:394f:d81 with SMTP id ffacd0b85a97d-38f394f9c67mr879423f8f.2.1739624711183;
        Sat, 15 Feb 2025 05:05:11 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b412esm7091418f8f.1.2025.02.15.05.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 05:05:10 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] arm64: dts: exynos: add initial support for Samsung Galaxy S22+
Date: Sat, 15 Feb 2025 15:05:00 +0200
Message-ID: <20250215130500.170738-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250215130500.170738-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215130500.170738-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_050512_757553_4700AAA2 
X-CRM114-Status: GOOD (  18.52  )
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
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts | 178 ++++++++++++++++++
 2 files changed, 179 insertions(+)
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
index 000000000..c0e48f672
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
@@ -0,0 +1,178 @@
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
+			reg = <0 0xf6200000 0 (1080 * 2340 * 4)>;
+			no-map;
+		};
+
+		debug_kinfo_reserved: debug-kinfo-reserved@fcfff000 {
+			reg = <0 0xfcfff000 0 0x1000>;
+			no-map;
+		};
+
+		log_itmon: log-itmon@fffe0000 {
+			reg = <0 0xfffe0000 0 0x20000>;
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
+&usb_dwc3 {
+	dr_mode = "otg";
+	usb-role-switch;
+	role-switch-default-mode = "peripheral";
+	maximum-speed = "high-speed";
+};
+
+&usb_con_phy {
+	/* TODO: Replace these once PMIC is implemented  */
+	vdd1p9-supply = <&reg_dummy>;
+	vdd3-supply = <&reg_dummy>;
+	status = "okay";
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


