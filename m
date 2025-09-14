Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91752CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 15:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5KDhUOmRpPma708zXeoi8+mVcbu/SNTTJAjK5XHafPk=; b=XKyYdiyQKCAsw4v/uW034TlF9C
	RGTFkgZrLvVzEECcoLCPK6QcEbpwgBMyrHzpwZIvP0FZy7+uy2Nlns2bUox+mkTDh6Ae8p9HywpZX
	SsYgGwOW9QF7KPaXqiY3kochLzoaPczHfd3xeX4Uht5UBKK9bI5GEYDIDMVjQzEi7uJkmqvu5cgMK
	5jle7Rsi9U7RrebjvVREoFOsZKAJZiD359FytrdRJe36QZWip+aMf798Zdk2vP1I2LrXT9jGlHWS5
	Pa+VoROZbMv/p1d7meRqPvI+3anw7vseAI9msB4+gZlPA4d+iF/i6YiUb2KNgJSbLNjg7z4QAyqrj
	haqeF3Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxoGX-00000001d1a-3EES;
	Sun, 14 Sep 2025 15:03:45 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxoGT-00000001cz4-2XwN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 15:03:43 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3df3be0e098so2027958f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 08:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757862220; x=1758467020; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KDhUOmRpPma708zXeoi8+mVcbu/SNTTJAjK5XHafPk=;
        b=NV//cEczWG+w3BHAlH+bBNA8i6lT9uWUveHyL3LP7cGfgm647J8aGNtZVrcCYpOezg
         SELZ3HZIx7EL7Pdg+q/c1dK2nCt6ll5vGWFliJAJ4mz2Bu3/Kwi/r+ef1iCEAhoUVcwm
         VzDQsNG1Crf4RIFH2WR8I8RWtYxvsQVP7ayVZ34GGuIrH434V/3DZAa68YMJvKmcGkOf
         79sv4VQiCog5ZqqomG2w7d/M/ukk44+LfJzPLVJbwRD3W7Avl1gyOOeaUp7VO2FVrtRO
         HStArkjU3wwBchdH5LEvH+1RMYnHJRkl1l8ecDEN0wi0bhdJf+LRqt08DXX6VwbVobF4
         Ilaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757862220; x=1758467020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5KDhUOmRpPma708zXeoi8+mVcbu/SNTTJAjK5XHafPk=;
        b=XETeViGPQ2Syu2B5U08uiPtkTXtgSovnUGfOH6GnwovscmTQFVlcx/WQFAuT6di9gl
         mC3y9kzPZeHAVnJwu36f5fVT58t3t6NrQlbVx8uMdgXdF9qaj45c8LLqc9orOVEkckMC
         L4M4m/1VQ6AyueckSWgBERP+Bc59W/HYOLJInribTLoiUBF+hPlzRHLzXJmvF/tX4WOI
         qGDgPyqQrvVll1Nhu/YtpymEytUxVM0NemDbmOSczMa5xys0/PLP9AOJ5wTxeVTKFOXq
         jjXXlPLmLVJ5hS3u7swgR6WIxjHQMOHSeycKaMmUtHkrnXhlsSbFHQtC0yHfylmjVJbX
         GrFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAwruSBtaaf1/y5ZYjaFoZzdxjKdcxb5SayNVgUoF0g88XKojnCRIRu3UbZjr608c84sIsz3AgZQB1BiRWN6zW@lists.infradead.org
X-Gm-Message-State: AOJu0YwAe5jg2QDy61r1KYLeVn7cpKutnvnkrQFuLNeVSztsDItx7GsP
	z4GuaWNj0FxRVxmpk0sVm4FD3+x/ZC/lhgUKV6wIgtTbKRS9AJQEbhsA
X-Gm-Gg: ASbGncs30AfV5eaB89wU5MyS23poky6a5aIbJgTsyI8SOXwRfNapvWF/Jv8mXSAemYE
	gJiYmR9KZObmAmZJsEiSoZV+PgCwyP23hotDMS0VzgvLiVdP0hsb1pC+PDo4vcgIzE5o0YIDm2u
	GjurWsoSG7lJPPlEMgetaFG9lEXj9WUzB0oa7drJ/FD6N/FMSCyC8qk16fo7q0OH6zcA6kET3gZ
	FeBUcStmhQOY0WkHkK5WtnuPsZTNvuusM4PUkILD4N3LwcIgaWhMLECxTFPSU/YBN8vaO5YS/RM
	ClfWTzD6I+TSx5ESDE0EwtcfhT4hKEYULJhsXtQrlt4nhPuHfKywxbXb4G1aRb+piYipPnkuxCo
	oPD6uKTHTwx2yY7VI3rYR0uUl+wimWs6TT3pDziSgQ+NwzdxK96YJj8PgPBvisApEVFo/tkIYDQ
	==
X-Google-Smtp-Source: AGHT+IHRJ/8AOJVZsii76GUZ0HhcxqLkQ5DDL2gMAC1KKsMtOo84S/mslUv0y+ZEmI3HI/gKPPIbFA==
X-Received: by 2002:a5d:5885:0:b0:3ea:dd2b:5d3 with SMTP id ffacd0b85a97d-3eadd2b07cemr66292f8f.17.1757862219613;
        Sun, 14 Sep 2025 08:03:39 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f2acbeee0sm32780385e9.0.2025.09.14.08.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 08:03:39 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] arm64: dts: exynos: add initial support for Samsung Galaxy S7
Date: Sun, 14 Sep 2025 18:03:21 +0300
Message-ID: <20250914150321.2632019-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914150321.2632019-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914150321.2632019-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_080341_794498_A095717F 
X-CRM114-Status: GOOD (  17.87  )
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

Samsung Galaxy S7 (SM-G930F), codenamed herolte, is a mobile phone from
2016. It features 4GB RAM, 32/64GB UFS 2.0, Exynos 8890 SoC and a
1440x2960 Super AMOLED display.

Implement initial support for this device, including:
- simple-framebuffer
- gpio-keys
- s2mps16 and max77838
- mmc
- usb, configured to be in peripheral mode

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 .../boot/dts/exynos/exynos8890-herolte.dts    | 573 ++++++++++++++++++
 2 files changed, 574 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8890-herolte.dts

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index bdb9e9813..80e9901af 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -11,6 +11,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos7870-on7xelte.dtb		\
 	exynos7885-jackpotlte.dtb	\
 	exynos850-e850-96.dtb		\
+	exynos8890-herolte.dtb		\
 	exynos8895-dreamlte.dtb		\
 	exynos9810-starlte.dtb		\
 	exynos990-c1s.dtb		\
diff --git a/arch/arm64/boot/dts/exynos/exynos8890-herolte.dts b/arch/arm64/boot/dts/exynos/exynos8890-herolte.dts
new file mode 100644
index 000000000..461fa256d
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos8890-herolte.dts
@@ -0,0 +1,573 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung Galaxy S7 (herolte/SM-G930F) device tree source
+ *
+ * Copyright (c) 2025 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+ */
+
+/dts-v1/;
+#include "exynos8890.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	model = "Samsung Galaxy S7 (SM-G930F)";
+	compatible = "samsung,herolte", "samsung,exynos8890";
+	chassis-type = "handset";
+
+	aliases {
+		mmc0 = &mmc;
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges;
+
+		framebuffer@e2a00000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0xe2a00000 (1440 * 2560 * 4)>;
+
+			width = <1440>;
+			height = <2560>;
+			stride = <(1440 * 4)>;
+			format = "a8r8g8b8";
+
+			/* these are required until there's a display driver */
+			vci-supply = <&max77838_ldo1>;
+			vdd3-supply = <&max77838_ldo3>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&key_power &key_voldown &key_volup>;
+		pinctrl-names = "default";
+
+		power-key {
+			label = "Power";
+			gpios = <&gpa2 4 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+			linux,code = <KEY_POWER>;
+		};
+
+		voldown-key {
+			label = "Volume Down";
+			gpios = <&gpa0 4 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		volup-key {
+			label = "Volume Up";
+			gpios = <&gpa0 3 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x7e400000>,
+		      <0x8 0x80000000 0x80000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges;
+
+		ramoops@92000000 {
+			compatible = "ramoops";
+			reg = <0x0 0x92000000 0x8000>;
+			console-size = <0x4000>;
+			record-size = <0x4000>;
+		};
+
+		cont_splash_mem: framebuffer@e2a00000 {
+			reg = <0x0 0xe2a00000 (1440 * 2560 * 4)>;
+			no-map;
+		};
+	};
+
+	vdd_fixed_mmc: regulator-fixed-mmc {
+		compatible = "regulator-fixed";
+
+		enable-active-high;
+		gpio = <&gpa3 7 GPIO_ACTIVE_HIGH>;
+
+		regulator-max-microvolt = <2800000>;
+		regulator-min-microvolt = <2800000>;
+		regulator-name = "vdd_fixed_mmc";
+	};
+};
+
+&gpu {
+	/* we can only afford a slightly higher rate till there's dvfs */
+	assigned-clocks = <&cmu_top CLK_FOUT_G3D_PLL>;
+	assigned-clock-rates = <455000000>;
+
+	mali-supply = <&s2mps16_buck6>;
+
+	status = "okay";
+};
+
+&hsi2c_7 {
+	status = "okay";
+
+	touchscreen@48 {
+		compatible = "samsung,s6sa552";
+		reg = <0x48>;
+
+		avdd-supply = <&s2mps16_ldo33>;
+		vdd-supply = <&s2mps16_ldo32>;
+
+		interrupt-parent = <&gpa1>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&ts_int>;
+		pinctrl-names = "default";
+	};
+};
+
+&hsi2c_10 {
+	status = "okay";
+
+	pmic@60 {
+		compatible = "maxim,max77838";
+		reg = <0x60>;
+
+		regulators {
+			max77838_ldo1: ldo1 {
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "max77838_ldo1";
+			};
+
+			max77838_ldo2: ldo2 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "max77838_ldo2";
+			};
+
+			max77838_ldo3: ldo3 {
+				regulator-boot-on;
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-name = "max77838_ldo3";
+			};
+
+			max77838_ldo4: ldo4 {
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "max77838_ldo4";
+			};
+
+			max77838_buck: buck {
+				regulator-boot-on;
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1600000>;
+				regulator-name = "max77838_buck";
+			};
+		};
+	};
+};
+
+&hsi2c_15 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	pmic@66 {
+		compatible = "samsung,s2mps16-pmic";
+		reg = <0x66>;
+		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpa0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_irq>;
+		wakeup-source;
+
+		s2mps16_osc: clocks {
+			compatible = "samsung,s2mps16-clk";
+			#clock-cells = <1>;
+			clock-output-names = "s2mps16_ap", "s2mps16_cp",
+					     "s2mps16_bt";
+		};
+
+		regulators {
+			s2mps16_buck1: buck1 {
+				regulator-always-on;
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1000000>;
+				regulator-name = "vdd_buck1";
+				regulator-ramp-delay = <12000>;
+			};
+
+			s2mps16_buck2: buck2 {
+				regulator-always-on;
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1575000>;
+				regulator-name = "vdd_buck2";
+				regulator-ramp-delay = <12000>;
+			};
+
+			s2mps16_buck3: buck3 {
+				regulator-always-on;
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1475000>;
+				regulator-name = "vdd_buck3";
+				regulator-ramp-delay = <12000>;
+			};
+
+			s2mps16_buck4: buck4 {
+				regulator-always-on;
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1000000>;
+				regulator-name = "vdd_buck4";
+				regulator-ramp-delay = <12000>;
+			};
+
+			s2mps16_buck5: buck5 {
+				regulator-always-on;
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1000000>;
+				regulator-name = "vdd_buck5";
+				regulator-ramp-delay = <12000>;
+			};
+
+			s2mps16_buck6: buck6 {
+				regulator-always-on;
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1000000>;
+				regulator-name = "vdd_buck6";
+				regulator-ramp-delay = <12000>;
+			};
+
+			s2mps16_buck7: buck7 {
+				regulator-always-on;
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-name = "vdd_buck7";
+				regulator-ramp-delay = <12000>;
+			};
+
+			s2mps16_buck8: buck8 {
+				regulator-always-on;
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1500000>;
+				regulator-name = "vdd_buck8";
+				regulator-ramp-delay = <2000>;
+			};
+
+			s2mps16_buck9: buck9 {
+				regulator-always-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <2100000>;
+				regulator-name = "vdd_buck9";
+				regulator-ramp-delay = <2700>;
+			};
+
+			/* buck10 is used for CP but lacks documentation */
+
+			s2mps16_buck11: buck11 {
+				regulator-always-on;
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-name = "vdd_buck11";
+				regulator-ramp-delay = <12000>;
+			};
+
+			s2mps16_ldo1: ldo1 {
+				regulator-always-on;
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <900000>;
+				regulator-name = "vdd_ldo1";
+				regulator-ramp-delay = <12000>;
+			};
+
+			s2mps16_ldo2: ldo2 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-name = "vdd_ldo2";
+				regulator-ramp-delay = <12000>;
+			};
+
+			s2mps16_ldo3: ldo3 {
+				regulator-always-on;
+				regulator-min-microvolt = <1620000>;
+				regulator-max-microvolt = <1980000>;
+				regulator-name = "vdd_ldo3";
+				regulator-ramp-delay = <12000>;
+			};
+
+			s2mps16_ldo4: ldo4 {
+				regulator-always-on;
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1110000>;
+				regulator-name = "vdd_ldo4";
+				regulator-ramp-delay = <12000>;
+			};
+
+			s2mps16_ldo5: ldo5 {
+				regulator-always-on;
+				regulator-min-microvolt = <1625000>;
+				regulator-max-microvolt = <1975000>;
+				regulator-ramp-delay = <12000>;
+				regulator-name = "vdd_ldo5";
+			};
+
+			s2mps16_ldo6: ldo6 {
+				regulator-always-on;
+				regulator-min-microvolt = <2250000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <12000>;
+				regulator-name = "vdd_ldo6";
+			};
+
+			s2mps16_ldo7: ldo7 {
+				regulator-always-on;
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1250000>;
+				regulator-ramp-delay = <12000>;
+				regulator-name = "vdd_ldo7";
+			};
+
+			s2mps16_ldo8: ldo8 {
+				regulator-always-on;
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1000000>;
+				regulator-name = "vdd_ldo8";
+				regulator-ramp-delay = <12000>;
+			};
+
+			s2mps16_ldo9: ldo9 {
+				regulator-always-on;
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1000000>;
+				regulator-name = "vdd_ldo9";
+				regulator-ramp-delay = <12000>;
+			};
+
+			s2mps16_ldo10: ldo10 {
+				regulator-always-on;
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-name = "vdd_ldo10";
+				regulator-ramp-delay = <12000>;
+			};
+
+			s2mps16_ldo11: ldo11 {
+				regulator-always-on;
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1000000>;
+				regulator-name = "vdd_ldo11";
+				regulator-ramp-delay = <12000>;
+			};
+
+			s2mps16_ldo12: ldo12 {
+				regulator-always-on;
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-name = "vdd_ldo12";
+				regulator-ramp-delay = <12000>;
+			};
+
+			s2mps16_ldo13: ldo13 {
+				regulator-always-on;
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-name = "vdd_ldo13";
+				regulator-ramp-delay = <12000>;
+			};
+
+			/* ldo14-24 are used for CP but lack documentation */
+
+			s2mps16_ldo25: ldo25 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1000000>;
+				regulator-name = "vdd_ldo25";
+				regulator-ramp-delay = <12000>;
+			};
+
+			s2mps16_ldo26: ldo26 {
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-name = "vdd_ldo26";
+				regulator-ramp-delay = <12000>;
+			};
+
+			s2mps16_ldo27: ldo27 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-name = "vdd_ldo27";
+				regulator-ramp-delay = <12000>;
+			};
+
+			s2mps16_ldo28: ldo28 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-name = "vdd_ldo28";
+			};
+
+			s2mps16_ldo29: ldo29 {
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vdd_ldo29";
+			};
+
+			s2mps16_ldo30: ldo30 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vdd_ldo30";
+			};
+
+			s2mps16_ldo31: ldo31 {
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-name = "vdd_ldo31";
+			};
+
+			s2mps16_ldo32: ldo32 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vdd_ldo32";
+			};
+
+			s2mps16_ldo33: ldo33 {
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vdd_ldo33";
+			};
+
+			s2mps16_ldo34: ldo34 {
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vdd_ldo34";
+			};
+
+			s2mps16_ldo35: ldo35 {
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-name = "vdd_ldo35";
+			};
+
+			s2mps16_ldo36: ldo36 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vdd_ldo36";
+			};
+
+			s2mps16_ldo37: ldo37 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vdd_ldo37";
+			};
+		};
+	};
+};
+
+&mmc {
+	bus-width = <4>;
+
+	card-detect-delay = <200>;
+	cd-gpios = <&gpa1 5 GPIO_ACTIVE_LOW>;
+
+	clock-frequency = <800000000>;
+
+	disable-wp;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus1 &sd2_bus4 &sd2_cd>;
+
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+
+	vmmc-supply = <&vdd_fixed_mmc>;
+	vqmmc-supply = <&s2mps16_ldo2>;
+
+	samsung,dw-mshc-ciu-div = <3>;
+	samsung,dw-mshc-sdr-timing = <0 2>;
+	samsung,dw-mshc-ddr-timing = <1 2>;
+
+	status = "okay";
+};
+
+&oscclk {
+	clock-frequency = <26000000>;
+};
+
+&pinctrl_alive {
+	key_power: key-power-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpa2-4";
+	};
+
+	key_voldown: key-voldown-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpa0-4";
+	};
+
+	key_volup: key-volup-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpa0-3";
+	};
+
+	pmic_irq: pmic-irq-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV4>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pins = "gpa0-3";
+	};
+
+	sd2_cd: sd2-cd-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpa1-5";
+	};
+
+	ts_int: ts-int-pins {
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pins = "gpa1-0";
+	};
+};
+
+&usbdrd30 {
+	vdd10-supply = <&s2mps16_ldo4>;
+	vdd33-supply = <&s2mps16_ldo6>;
+	status = "okay";
+};
+
+&usbdrd30_dwc3 {
+	dr_mode = "otg";
+	maximum-speed = "high-speed";
+	role-switch-default-mode = "peripheral";
+	usb-role-switch;
+	status = "okay";
+};
+
+&usbdrd30_phy {
+	/* TODO: connect with muic, add regulators */
+	status = "okay";
+};
+
+&serial_4 {
+	/* multiplexed over muic */
+	status = "okay";
+};
-- 
2.43.0


