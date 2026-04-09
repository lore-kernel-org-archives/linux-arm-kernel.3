Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37241EA3C5C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 11:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MwBgGUl6hXFp+qT2rxYZsLBLN0Yq8YzJCwfSg0HxPfg=; b=EEFJ0T3HZsFjODqf3Cj8hWpytO
	N0wia6Sk45dqOmZhCvVaemmuZdPxAsDavfj0/AcAwnU/74eMM5CT4FLOmg4pi/GrLJNIXPeCPM+oa
	OqtEKaEMU3IizkSjEN6jQWTlJgbUAyTAzFYSU9ua3rUDPo9eaVHYP6TeiW0YVedB0mrUQWwp093G4
	cmMBDUdcxQjx3RELgDB9dCc/SGPe2vxc72YEeQrdGdPLX8yM5i1vnoFmMH1VvK6ThySgAYfKHOUwm
	p47CcWfCwrNwq+reLegMBoSPz2HhkWWEdHqmPIoXaMa8Yu81N2PCV1al+oiEBnAiPKvgteci59jW4
	DAWEHSTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAnkr-0000000AIdN-2oKj;
	Thu, 09 Apr 2026 11:41:01 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAnkZ-0000000AIV5-2Z3q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 11:40:59 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c742723c863so523908a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 04:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775734843; x=1776339643; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MwBgGUl6hXFp+qT2rxYZsLBLN0Yq8YzJCwfSg0HxPfg=;
        b=QAQzNJER+R/dRAD4+uCkfjI6vwvwBps8sQLU9ZEXxUzGJfSzowOyCtJR5OwbfxJDSz
         eiPJM/4ieh+/r+Ded3J5TTm3nXs3vo0bHfrQ3x0pPUwXnnaPnGi5syqfB5fUj/2etHTB
         Ua+DRpJf2kwgRIYCR8p5mHitfBhWB9sTZJlzjRC0GqMxL6CawY3sYbPOcBo0wsp0CzUA
         pZiHqNwghO3LvAbFgy3rC2wz5B8ehSk66cTXWCFz/GhJwsRaJhu6ME6mrz0gbzQiQLLk
         OI1rpZOr2djgx/4hee5d7ThCYla6XpT9VbC5/M3HHiIJynbJYMWyFCsATtnKpDhT95pv
         2i8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775734843; x=1776339643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MwBgGUl6hXFp+qT2rxYZsLBLN0Yq8YzJCwfSg0HxPfg=;
        b=mG5KEnXGn3Ab1hUdZSJ5xDT9J0KXiELGoLckPlqmvLwCssk5t5ZM2SY5dEhyq3VEzb
         JgO+L6/KWXfXaiiPRC77IVX5ZGHq9By/0yRvlrSIHgBaZUTmZqLOhCQhJPNGYQiaBqUn
         X5xfhrBex50fLMnziM3VgGjv/G+eIIW0Ha3U4Tf++y4Tq5M+fT+2WE2h6vNbc4/mxyzh
         LuCygIl8adA/78940z4wlQIyshHYVoF4wlcWcB5xkGTR6yyJmC1Pw/5fiEGT54dMSYyu
         /JNcEQXBYNzGneQwbdbDy7SV4Rx1aFRyXOAOwtTK1R/ZLv5ar9ifexyIqASsIs2f3fcX
         /cjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfSUxMZbRUOHBB0qEXqVRFqDC22khOBjyzHbW0NT0Xlq/V8puFmpFwRS4bvL3zTLNPgooOkrR92QOh/GJC+JBj@lists.infradead.org
X-Gm-Message-State: AOJu0YxKNm6KI7UKescABxSqBfivFGohFZ56WeGd4AwW7Ut4Ndd+UsO2
	oPNJuSa4Lhc6VR4AU8i3/YC18vB/tbJ4DI0ldhKfcVDkILhMavWewuU4
X-Gm-Gg: AeBDieuhqYpGj1gfMaMTua2JdmcF961g6dgjbM5DY4Innh+a2xGpAW0ao2ef9Teg/kq
	AjzQTgSeCl7kghfvWSjYon2THbFaZsu/wgYnS7lChiq+M7p8A6aW0QtGea01HUUzVc3peBPaLu4
	7t4mz/VFN5qJTnsJnKsS9lt05xG2OurvbT02taqfQOJxGznDa3mexpS4mGvF6aD5lgTko9cat4a
	u5AbXYkc0ptN9GtjS/muC6UXdBjIvWPZpt9KVu02e+yzjUdup06WpgnRcOr6vHBMpTbdvKCK05i
	HKmo3lDPn2x8DA+v/yMflcKbGhzSnCX2xM2BlcIUcsMiIp3/OdA30qW8QUNBKMnxeCZVikKFCG7
	Lzfmp6IdtWLnFhtsrIZb3jlbP+JsPbL1Cf/HrkEknWBw/cMOijnHS7KZxYaD6qbeLNTw66nqhGt
	u5egxMQw6ZJimaIHZaS/8=
X-Received: by 2002:a05:6a20:9187:b0:39f:b852:e36f with SMTP id adf61e73a8af0-39fb852ee59mr6596043637.12.1775734842447;
        Thu, 09 Apr 2026 04:40:42 -0700 (PDT)
Received: from [127.0.1.1] ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c659a218sm22438545a12.29.2026.04.09.04.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 04:40:42 -0700 (PDT)
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 09 Apr 2026 19:40:28 +0800
Subject: [PATCH v2 3/3] ARM: dts: aspeed: anacapa: add EVT2 devicetree and
 update wrapper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-anacapa-devlop-phase-devicetree-v2-3-68f328671653@gmail.com>
References: <20260409-anacapa-devlop-phase-devicetree-v2-0-68f328671653@gmail.com>
In-Reply-To: <20260409-anacapa-devlop-phase-devicetree-v2-0-68f328671653@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775734833; l=24896;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=8PkJVpWcVjki4xlArMu859y2B3aia58MuER+QBP3OLU=;
 b=uCeKxD7eWjsyicYEXY7mu5hmHCNBlWkQY0Feu50NoXx1xnYPMU/iUAI1dPDrI7oA/wBB/9cDZ
 t8ouGTz0s/2Bcm9Zp879e/0dW3BTjSbqwG8wVdzxfekPgED/H2fsSfH
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_044043_699903_B910F94D 
X-CRM114-Status: GOOD (  13.74  )
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

Add a development-phase devicetree for the Facebook Anacapa BMC EVT2
hardware revision and update the Anacapa wrapper DTS to reference
it.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 .../aspeed/aspeed-bmc-facebook-anacapa-evt2.dts    | 1123 ++++++++++++++++++++
 .../dts/aspeed/aspeed-bmc-facebook-anacapa.dts     |    2 +-
 2 files changed, 1124 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
new file mode 100644
index 000000000000..6e1e51e6c3f2
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
@@ -0,0 +1,1123 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+/dts-v1/;
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/i2c/i2c.h>
+
+/ {
+	model = "Facebook Anacapa BMC";
+	compatible = "facebook,anacapa-bmc-evt2", "aspeed,ast2600";
+
+	aliases {
+		serial0 = &uart1;
+		serial1 = &uart2;
+		serial2 = &uart3;
+		serial3 = &uart4;
+		serial4 = &uart5;
+		i2c16 = &i2c0mux0ch0;
+		i2c17 = &i2c0mux0ch1;
+		i2c18 = &i2c0mux0ch2;
+		i2c19 = &i2c0mux0ch3;
+		i2c20 = &i2c1mux0ch0;
+		i2c21 = &i2c1mux0ch1;
+		i2c22 = &i2c1mux0ch2;
+		i2c23 = &i2c1mux0ch3;
+		i2c24 = &i2c4mux0ch0;
+		i2c25 = &i2c4mux0ch1;
+		i2c26 = &i2c4mux0ch2;
+		i2c27 = &i2c4mux0ch3;
+		i2c28 = &i2c4mux0ch4;
+		i2c29 = &i2c4mux0ch5;
+		i2c30 = &i2c4mux0ch6;
+		i2c31 = &i2c4mux0ch7;
+		i2c32 = &i2c8mux0ch0;
+		i2c33 = &i2c8mux0ch1;
+		i2c34 = &i2c8mux0ch2;
+		i2c35 = &i2c8mux0ch3;
+		i2c36 = &i2c10mux0ch0;
+		i2c37 = &i2c10mux0ch1;
+		i2c38 = &i2c10mux0ch2;
+		i2c39 = &i2c10mux0ch3;
+		i2c40 = &i2c10mux0ch4;
+		i2c41 = &i2c10mux0ch5;
+		i2c42 = &i2c10mux0ch6;
+		i2c43 = &i2c10mux0ch7;
+		i2c44 = &i2c11mux0ch0;
+		i2c45 = &i2c11mux0ch1;
+		i2c46 = &i2c11mux0ch2;
+		i2c47 = &i2c11mux0ch3;
+		i2c48 = &i2c11mux0ch4;
+		i2c49 = &i2c11mux0ch5;
+		i2c50 = &i2c11mux0ch6;
+		i2c51 = &i2c11mux0ch7;
+		i2c52 = &i2c13mux0ch0;
+		i2c53 = &i2c13mux0ch1;
+		i2c54 = &i2c13mux0ch2;
+		i2c55 = &i2c13mux0ch3;
+		i2c56 = &i2c13mux0ch4;
+		i2c57 = &i2c13mux0ch5;
+		i2c58 = &i2c13mux0ch6;
+		i2c59 = &i2c13mux0ch7;
+	};
+
+	chosen {
+		stdout-path = "serial4:57600n8";
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
+				  <&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
+				  <&adc1 2>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			label = "bmc_heartbeat_amber";
+			gpios = <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		led-1 {
+			label = "fp_id_amber";
+			default-state = "off";
+			gpios = <&gpio0 ASPEED_GPIO(B, 5) GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x80000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		video_engine_memory: video {
+			size = <0x02c00000>;
+			alignment = <0x00100000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+
+		gfx_memory: framebuffer {
+			size = <0x01000000>;
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+	};
+
+	p3v3_bmc_aux: regulator-p3v3-bmc-aux {
+		compatible = "regulator-fixed";
+		regulator-name = "p3v3_bmc_aux";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	spi_gpio: spi {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sck-gpios = <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
+		miso-gpios = <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH>;
+		num-chipselects = <1>;
+		cs-gpios = <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
+		status = "okay";
+
+		tpm@0 {
+			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+			spi-max-frequency = <33000000>;
+			reg = <0>;
+		};
+	};
+};
+
+&adc0 {
+	aspeed,int-vref-microvolt = <2500000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
+		&pinctrl_adc2_default &pinctrl_adc3_default
+		&pinctrl_adc4_default &pinctrl_adc5_default
+		&pinctrl_adc6_default &pinctrl_adc7_default>;
+	status = "okay";
+};
+
+&adc1 {
+	aspeed,int-vref-microvolt = <2500000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc10_default>;
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&fmc {
+	status = "okay";
+
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+		spi-max-frequency = <50000000>;
+#include "openbmc-flash-layout-128.dtsi"
+	};
+
+	flash@1 {
+		status = "okay";
+		m25p,fast-read;
+		label = "alt-bmc";
+		spi-max-frequency = <50000000>;
+	};
+};
+
+&gfx {
+	status = "okay";
+	memory-region = <&gfx_memory>;
+};
+
+&gpio0 {
+	gpio-line-names =
+
+	/*A0-A7*/
+	"","","","","","","","",
+
+	/*B0-B7*/
+	"BATTERY_DETECT", "",
+	"BMC_I2C1_FPGA_ALERT", "BMC_READY",
+	"IOEXP_INT_3V3", "FM_ID_LED",
+	"", "",
+
+	/*C0-C7*/
+	"","","","",
+	"PMBUS_REQ_N", "PSU_FW_UPDATE_REQ_N",
+	"", "",
+
+	/*D0-D7*/
+	"","","","","","","","",
+
+	/*E0-E7*/
+	"","","","","","","","",
+
+	/*F0-F7*/
+	"","","","","","","","",
+
+	/*G0-G7*/
+	"FM_MUX1_SEL", "",
+	"", "",	"", "",
+	"FM_DEBUG_PORT_PRSNT_N", "FM_BMC_DBP_PRESENT_N",
+
+	/*H0-H7*/
+	"","","","","","","","",
+
+	/*I0-I7*/
+	"","","","",
+	"", "FLASH_WP_STATUS",
+	"BMC_JTAG_MUX_SEL", "",
+
+	/*J0-J7*/
+	"","","","","","","","",
+
+	/*K0-K7*/
+	"","","","","","","","",
+
+	/*L0-L7*/
+	"","","","","","","","",
+
+	/*M0-M7*/
+	"PCIE_EP_RST_EN", "BMC_FRU_WP",
+	"SCM_HPM_STBY_RST_N", "SCM_HPM_STBY_EN",
+	"STBY_POWER_PG_3V3", "TH500_SHDN_OK",
+	"", "",
+
+	/*N0-N7*/
+	"LED_POSTCODE_0", "LED_POSTCODE_1",
+	"LED_POSTCODE_2", "LED_POSTCODE_3",
+	"LED_POSTCODE_4", "LED_POSTCODE_5",
+	"LED_POSTCODE_6", "LED_POSTCODE_7",
+
+	/*O0-O7*/
+	"RUN_POWER_PG", "PWR_BRAKE",
+	"CHASSIS_AC_LOSS", "BSM_PRSNT_N",
+	"PSU_SMB_ALERT", "FM_TPM_PRSNT_0_N",
+	"PSU_FW_UPDATING_N", "",
+
+	/*P0-P7*/
+	"PWR_BTN_BMC_BUF_N", "IPEX_CABLE_PRSNT",
+	"ID_RST_BTN_BMC_N", "RST_BMC_RSTBTN_OUT_N",
+	"PWR_LED", "RUN_POWER_EN",
+	"SHDN_FORCE", "BMC_HEARTBEAT_N",
+
+	/*Q0-Q7*/
+	"IRQ_PCH_TPM_SPI_LV3_N", "USB_OC0_REAR_N",
+	"UART_MUX_SEL", "I2C_MUX_RESET",
+	"RSVD_NV_PLT_DETECT", "SPI_TPM_INT",
+	"CPU_JTAG_MUX_SELECT", "THERM_BB_OVERT",
+
+	/*R0-R7*/
+	"THERM_BB_WARN", "SPI_BMC_FPGA_INT",
+	"CPU_BOOT_DONE", "PMBUS_GNT",
+	"CHASSIS_PWR_BRK", "PCIE_WAKE",
+	"PDB_THERM_OVERT", "SHDN_REQ",
+
+	/*S0-S7*/
+	"", "",
+	"SYS_BMC_PWRBTN_N", "FM_TPM_PRSNT_1_N",
+	"FM_BMC_DEBUG_SW_N", "UID_LED_N",
+	"SYS_FAULT_LED_N", "RUN_POWER_FAULT",
+
+	/*T0-T7*/
+	"","","","","","","","",
+
+	/*U0-U7*/
+	"","","","","","","","",
+
+	/*V0-V7*/
+	"L2_RST_REQ_OUT", "L0L1_RST_REQ_OUT",
+	"BMC_ID_BEEP_SEL", "BMC_I2C0_FPGA_ALERT",
+	"SMB_BMC_TMP_ALERT", "PWR_LED_N",
+	"SYS_RST_OUT", "IRQ_TPM_SPI_N",
+
+	/*W0-W7*/
+	"","","","","","","","",
+
+	/*X0-X7*/
+	"","","","","","","","",
+
+	/*Y0-Y7*/
+	"RST_WDTRST_PLD_N", "RST_BMC_SELF_HW",
+	"FM_FLASH_LATCH_N", "BMC_EMMC_RST_N",
+	"","","","",
+
+	/*Z0-Z7*/
+	"","","","","","","","";
+};
+
+&gpio1 {
+	gpio-line-names =
+	/*18A0-18A7*/
+	"","","","","","","","",
+
+	/*18B0-18B7*/
+	"","","","",
+	"FM_BOARD_BMC_REV_ID0", "FM_BOARD_BMC_REV_ID1",
+	"FM_BOARD_BMC_REV_ID2", "",
+
+	/*18C0-18C7*/
+	"", "", "SPI_BMC_BIOS_ROM_IRQ0_N", "",
+	"", "", "", "",
+
+	/*18D0-18D7*/
+	"","","","","","","","",
+
+	/*18E0-18E3*/
+	"FM_BMC_PROT_LS_EN", "AC_PWR_BMC_BTN_N", "", "";
+};
+
+// L Bridge Board
+&i2c0 {
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c2048";
+		reg = <0x50>;
+		pagesize = <128>;
+	};
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c0mux0ch0: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+		i2c0mux0ch1: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+		i2c0mux0ch2: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+		i2c0mux0ch3: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+// R Bridge Board
+&i2c1 {
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c2048";
+		reg = <0x50>;
+		pagesize = <128>;
+	};
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c1mux0ch0: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+		i2c1mux0ch1: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+		i2c1mux0ch2: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+		i2c1mux0ch3: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+// MB - E1.S
+&i2c4 {
+	status = "okay";
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9548";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c4mux0ch0: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+		i2c4mux0ch1: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+		i2c4mux0ch2: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+		i2c4mux0ch3: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+		i2c4mux0ch4: i2c@4 {
+			reg = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+		i2c4mux0ch5: i2c@5 {
+			reg = <5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+		i2c4mux0ch6: i2c@6 {
+			reg = <6>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+		i2c4mux0ch7: i2c@7 {
+			reg = <7>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+// AMC
+&i2c5 {
+	status = "okay";
+};
+
+// MB
+&i2c6 {
+	status = "okay";
+
+	// HPM FRU
+	eeprom@50 {
+		compatible = "atmel,24c256";
+		reg = <0x50>;
+	};
+};
+
+// SCM
+&i2c7 {
+	status = "okay";
+
+
+};
+
+// MB - PDB
+&i2c8 {
+	status = "okay";
+
+	i2c-mux@72 {
+		compatible = "nxp,pca9546";
+		reg = <0x72>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c8mux0ch0: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			adc@1f {
+				compatible = "ti,adc128d818";
+				reg = <0x1f>;
+				ti,mode = /bits/ 8 <1>;
+			};
+
+			gpio@22 {
+				compatible = "nxp,pca9555";
+				reg = <0x22>;
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				gpio-line-names =
+					"RPDB_FAN_FULL_SPEED_R_N", "RPDB_I2C_TEMP75_U8_ALERT_R_N",
+					"RPDB_I2C_TMP432_U29_ALERT_R_N", "RPDB_GLOBAL_WP",
+					"RPDB_FAN_CT_FAN_FAIL_R_N", "",
+					"", "",
+					"RPDB_ALERT_P50V_HSC2_R_N", "RPDB_ALERT_P50V_HSC3_R_N",
+					"RPDB_ALERT_P50V_HSC4_R_N", "RPDB_ALERT_P50V_STBY_R_N",
+					"RPDB_I2C_P12V_MB_VRM_ALERT_R_N",
+					"RPDB_I2C_P12V_STBY_VRM_ALERT_R_N",
+					"RPDB_PGD_P3V3_STBY_PWRGD_R",
+					"RPDB_P12V_STBY_VRM_PWRGD_BUF_R";
+			};
+
+			gpio@24 {
+				compatible = "nxp,pca9555";
+				reg = <0x24>;
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				gpio-line-names =
+					"RPDB_EAM2_PRSNT_MOS_N_R", "RPDB_EAM3_PRSNT_MOS_N_R",
+					"RPDB_PWRGD_P50V_HSC4_SYS_R",
+					"RPDB_PWRGD_P50V_STBY_SYS_BUF_R",
+					"RPDB_P50V_FAN1_R2_PG", "RPDB_P50V_FAN2_R2_PG",
+					"RPDB_P50V_FAN3_R2_PG", "RPDB_P50V_FAN4_R2_PG",
+					"", "RPDB_FAN1_PRSNT_N_R",
+					"", "RPDB_FAN2_PRSNT_N_R",
+					"RPDB_FAN3_PRSNT_N_R", "RPDB_FAN4_PRSNT_N_R",
+					"", "";
+			};
+
+			// R-PDB FRU
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+		};
+		i2c8mux0ch1: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			gpio@22 {
+				compatible = "nxp,pca9555";
+				reg = <0x22>;
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				gpio-line-names =
+					"LPDB_FAN_FULL_SPEED_R_N","LPDB_I2C_TEMP75_U8_ALERT_R_N",
+					"LPDB_I2C_TMP432_U29_ALERT_R_N","LPDB_GLOBAL_WP",
+					"LPDB_FAN_CT_FAN_FAIL_R_N","",
+					"","",
+					"LPDB_ALERT_P50V_HSC0_R_N","LPDB_ALERT_P50V_HSC1_R_N",
+					"LPDB_ALERT_P50V_HSC5_R_N","LPDB_I2C_P12V_SW_VRM_ALERT_R_N",
+					"LPDB_EAM0_PRSNT_MOS_N_R","LPDB_EAM1_PRSNT_MOS_N_R",
+					"LPDB_PWRGD_P50V_HSC5_SYS_R","";
+			};
+
+			gpio@24 {
+				compatible = "nxp,pca9555";
+				reg = <0x24>;
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				gpio-line-names =
+					"LPDB_P50V_FAN1_R2_PG","LPDB_P50V_FAN2_R2_PG",
+					"LPDB_P50V_FAN3_R2_PG","LPDB_P50V_FAN4_R2_PG",
+					"LPDB_P50V_FAN5_R2_PG","LPDB_FAN1_PRSNT_N_R",
+					"LPDB_FAN2_PRSNT_N_R","LPDB_FAN3_PRSNT_N_R",
+					"LPDB_FAN4_PRSNT_N_R","LPDB_FAN5_PRSNT_N_R",
+					"","",
+					"","",
+					"","";
+			};
+
+			// L-PDB FRU
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+		};
+		i2c8mux0ch2: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+		i2c8mux0ch3: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+// SCM
+&i2c9 {
+	status = "okay";
+
+	// SCM FRU
+	eeprom@50 {
+		compatible = "atmel,24c128";
+		reg = <0x50>;
+	};
+
+	eeprom@51 {
+		compatible = "atmel,24c128";
+		reg = <0x51>;
+	};
+
+	// BSM FRU
+	eeprom@56 {
+		compatible = "atmel,24c64";
+		reg = <0x56>;
+	};
+};
+
+// R Bridge Board
+&i2c10 {
+	status = "okay";
+
+	i2c-mux@71 {
+		compatible = "nxp,pca9548";
+		reg = <0x71>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c10mux0ch0: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+		i2c10mux0ch1: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+		i2c10mux0ch2: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+		i2c10mux0ch3: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+		i2c10mux0ch4: i2c@4 {
+			reg = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+		i2c10mux0ch5: i2c@5 {
+			reg = <5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			gpio@22 {
+				compatible = "nxp,pca9555";
+				reg = <0x22>;
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				gpio-line-names =
+					"","",
+					"","RBB_CPLD_REFRESH_IN_PRGRS_R_L",
+					"RBB_EAM0_NIC_CBL_PRSNT_R_L","RBB_EAM1_NIC_CBL_PRSNT_R_L",
+					"RBB_AINIC_JTAG_MUX_R2_SEL","RBB_SPI_MUX0_R2_SEL",
+					"RBB_AINIC_PRSNT_R_L","RBB_AINIC_OE_R_N",
+					"RBB_AINIC_BOARD_R2_ID","RBB_RST_USB2_HUB_R_N",
+					"RBB_RST_FT4222_R_N","RBB_RST_MCP2210_R_N",
+					"","";
+			};
+
+			// R Bridge Board FRU
+			eeprom@52 {
+				compatible = "atmel,24c256";
+				reg = <0x52>;
+			};
+		};
+		i2c10mux0ch6: i2c@6 {
+			reg = <6>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+		i2c10mux0ch7: i2c@7 {
+			reg = <7>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+// L Bridge Board
+&i2c11 {
+	status = "okay";
+
+	i2c-mux@71 {
+		compatible = "nxp,pca9548";
+		reg = <0x71>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c11mux0ch0: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+		i2c11mux0ch1: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+		i2c11mux0ch2: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+		i2c11mux0ch3: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+		i2c11mux0ch4: i2c@4 {
+			reg = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+		i2c11mux0ch5: i2c@5 {
+			reg = <5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			gpio@22 {
+				compatible = "nxp,pca9555";
+				reg = <0x22>;
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				gpio-line-names =
+					"","",
+					"","LBB_CPLD_REFRESH_IN_PRGRS_R_L",
+					"LBB_EAM0_NIC_CBL_PRSNT_R_L","LBB_EAM1_NIC_CBL_PRSNT_R_L",
+					"LBB_AINIC_JTAG_MUX_R2_SEL","LBB_SPI_MUX0_R2_SEL",
+					"LBB_AINIC_PRSNT_R_L","LBB_AINIC_OE_R_N",
+					"LBB_AINIC_BOARD_R2_ID","LBB_RST_USB2_HUB_R_N",
+					"LBB_RST_FT4222_R_N","LBB_RST_MCP2210_R_N",
+					"","";
+			};
+
+			// L Bridge Board FRU
+			eeprom@52 {
+				compatible = "atmel,24c256";
+				reg = <0x52>;
+			};
+		};
+		i2c11mux0ch6: i2c@6 {
+			reg = <6>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+		i2c11mux0ch7: i2c@7 {
+			reg = <7>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+// Debug Card
+&i2c12 {
+	status = "okay";
+};
+
+// MB
+&i2c13 {
+	status = "okay";
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9548";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c13mux0ch0: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+		i2c13mux0ch1: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+		i2c13mux0ch2: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+		i2c13mux0ch3: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			adc@1f {
+				compatible = "ti,adc128d818";
+				reg = <0x1f>;
+				ti,mode = /bits/ 8 <1>;
+			};
+		};
+		i2c13mux0ch4: i2c@4 {
+			reg = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			// HPM BRD ID FRU
+			eeprom@51 {
+				compatible = "atmel,24c256";
+				reg = <0x51>;
+			};
+		};
+		i2c13mux0ch5: i2c@5 {
+			reg = <5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+		i2c13mux0ch6: i2c@6 {
+			reg = <6>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+		i2c13mux0ch7: i2c@7 {
+			reg = <7>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			nfc@28 {
+				compatible = "nxp,nxp-nci-i2c";
+				reg = <0x28>;
+
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <156 IRQ_TYPE_LEVEL_HIGH>;
+
+				enable-gpios = <&sgpiom0 241 GPIO_ACTIVE_HIGH>;
+			};
+		};
+	};
+};
+
+// SCM
+&i2c14 {
+	status = "okay";
+};
+
+&i2c15 {
+	status = "okay";
+};
+
+&kcs2 {
+	aspeed,lpc-io-reg = <0xca8>;
+	status = "okay";
+};
+
+&kcs3 {
+	aspeed,lpc-io-reg = <0xca2>;
+	status = "okay";
+};
+
+&lpc_ctrl {
+	status = "okay";
+};
+
+&mac2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ncsi3_default>;
+	use-ncsi;
+};
+
+&sgpiom0 {
+	ngpios = <128>;
+	bus-frequency = <2000000>;
+	gpio-line-names =
+	/*in - out */
+	/* A0-A7 line 0-15 */
+	"L_FNIC_FLT", "FM_CPU0_SYS_RESET_N",
+	"L_BNIC0_FLT", "CPU0_KBRST_N",
+	"L_BNIC1_FLT", "FM_CPU0_PROCHOT_trigger_N",
+	"L_BNIC2_FLT", "FM_CLR_CMOS_R_P0",
+	"L_BNIC3_FLT", "Force_I3C_SEL",
+	"L_RTM_SW_FLT", "SYSTEM_Force_Run_AC_Cycle",
+	"", "",
+	"", "",
+
+	/* B0-B7 line 16-31 */
+	"Channel0_leakage_EAM3", "FM_CPU_FPGA_JTAG_MUX_SEL",
+	"Channel1_leakage_EAM0", "FM_SCM_JTAG_MUX_SEL",
+	"Channel2_leakage_Manifold1", "FM_BRIDGE_JTAG_MUX_SEL",
+	"Channel3_leakage", "FM_CPU0_NMI_SYNC_FLOOD_N",
+	"Channel4_leakage_Manifold2", "BMC_AINIC0_WP_R2_L",
+	"Channel5_leakage_EAM1", "BMC_AINIC1_WP_R2_L",
+	"Channel6_leakage_CPU_DIMM", "CPLD_BUF_R_AGPIO330",
+	"Channel7_leakage_EAM2", "CPLD_BUF_R_AGPIO331",
+
+	/* C0-C7 line 32-47 */
+	"RSVD_RMC_GPIO3", "RTM_MUX_L",
+	"LEAK_DETECT_RMC_N", "RTM_MUX_R",
+	"HDR_P0_NMI_BTN_BUF_R_N", "FPGA_JTAG_SCM_DBREQ_N",
+	"No_Leak_Sensor_flag", "whdt_sel",
+	"", "",
+	"", "",
+	"", "",
+	"", "",
+
+	/* D0-D7 line 48-63 */
+	"PWRGD_CHAD_CPU0_FPGA", "",
+	"PWRGD_CHEH_CPU0_FPGA", "",
+	"PWRGD_CHIL_CPU0_FPGA", "",
+	"PWRGD_CHMP_CPU0_FPGA", "",
+	"AMC_BRD_PRSNT_CPLD_L", "",
+	"", "",
+	"", "",
+	"", "",
+
+	/* E0-E7 line 64-79 */
+	"L_PRSNT_B_FENIC_R2_N", "",
+	"L_PRSNT_B_BENIC0_R2_N", "",
+	"L_PRSNT_B_BENIC1_R2_N", "",
+	"L_PRSNT_B_BENIC2_R2_N", "",
+	"L_PRSNT_B_BENIC3_R2_N", "",
+	"", "",
+	"", "",
+	"", "",
+
+	/* F0-F7 line 80-95 */
+	"R_PRSNT_B_FENIC_R2_N", "SGPIO_READY",
+	"R_PRSNT_B_BENIC0_R2_N", "",
+	"R_PRSNT_B_BENIC1_R2_N", "",
+	"R_PRSNT_B_BENIC2_R2_N", "",
+	"R_PRSNT_B_BENIC3_R2_N", "",
+	"", "",
+	"", "",
+	"", "",
+
+	/* G0-G7 line 96-111 */
+	"L_PRSNT_EDSFF2_N", "",
+	"L_PRSNT_EDSFF3_N", "",
+	"R_PRSNT_EDSFF2_N", "",
+	"R_PRSNT_EDSFF3_N", "",
+	"", "",
+	"", "",
+	"", "",
+	"PRSNT_NFC_BOARD_R", "",
+
+	/* H0-H7 line 112-127 */
+	"R_FNIC_FLT", "",
+	"R_BNIC0_FLT", "",
+	"R_BNIC1_FLT", "",
+	"R_BNIC2_FLT", "",
+	"R_BNIC3_FLT", "",
+	"R_RTM_SW_FLT", "",
+	"", "",
+	"", "",
+
+	/* I0-I7 line 128-143 */
+	"EAM0_BRD_PRSNT_R_L", "",
+	"EAM1_BRD_PRSNT_R_L", "",
+	"EAM2_BRD_PRSNT_R_L", "",
+	"EAM3_BRD_PRSNT_R_L", "",
+	"FM_TPM_PRSNT_R_N", "",
+	"PDB_PRSNT_R_N", "",
+	"PRSNT_EDSFF0_N", "",
+	"PRSNT_CPU0_N", "",
+
+	/* J0-J7 line 144-159 */
+	"PRSNT_L_BRIDGE_R", "",
+	"PRSNT_R_BRIDGE_R", "",
+	"BRIDGE_L_MAIN_PG_R", "",
+	"BRIDGE_R_MAIN_PG_R", "",
+	"BRIDGE_L_STBY_PG_R", "",
+	"BRIDGE_R_STBY_PG_R", "",
+	"IRQ_NFC_BOARD_R", "",
+	"RSMRST_N", "",
+
+	/* K0-K7 line 160-175 */
+	"ADC_I2C_ALERT_N", "",
+	"TEMP_I2C_ALERT_R_L", "",
+	"CPU0_VR_SMB_ALERT_CPLD_N", "",
+	"COVER_INTRUDER_R_N", "",
+	"HANDLE_INTRUDER_CPLD_N", "",
+	"IRQ_MCIO_CPLD_WAKE_R_N", "",
+	"APML_CPU0_ALERT_R_N", "",
+	"PDB_ALERT_R_N", "",
+
+	/* L0-L7 line 176-191 */
+	"CPU0_SP7R1", "",
+	"CPU0_SP7R2", "",
+	"CPU0_SP7R3", "",
+	"CPU0_SP7R4", "",
+	"CPU0_CORETYPE0", "",
+	"CPU0_CORETYPE1", "",
+	"CPU0_CORETYPE2", "",
+	"FM_BIOS_POST_CMPLT_R_N", "",
+
+	/* M0-M7 line 192-207 */
+	"EAM0_SMERR_CPLD_R_L", "",
+	"EAM1_SMERR_CPLD_R_L", "",
+	"EAM2_SMERR_CPLD_R_L", "",
+	"EAM3_SMERR_CPLD_R_L", "",
+	"CPU0_SMERR_N_R", "",
+	"CPU0_NV_SAVE_N_R", "",
+	"PDB_PWR_LOSS_CPLD_N", "",
+	"IRQ_BMC_SMI_ACTIVE_R_N", "",
+
+	/* N0-N7 line 208-223 */
+	"AMCROT_BMC_S5_RDY_R", "",
+	"AMC_RDY_R", "",
+	"AMC_STBY_PGOOD_R", "",
+	"CPU_AMC_SLP_S5_R_L", "",
+	"AMC_CPU_EAMPG_R", "",
+	"DIMM_PMIC_PG_TIMEOUT", "",
+	"EAM_MOD_PWR_GD_TIMEOUT", "",
+	"CPLD_AMC_STBY_PWR_EN", "",
+
+	/* O0-O7 line 224-239 */
+	"HPM_PWR_FAIL", "Port80_b0",
+	"FM_DIMM_IP_FAIL", "Port80_b1",
+	"FM_DIMM_AH_FAIL", "Port80_b2",
+	"HPM_AMC_THERMTRIP_R_L", "Port80_b3",
+	"cpu_thermtrip_detect", "Port80_b4",
+	"PVDDCR_SOC_P0_OCP_L", "Port80_b5",
+	"CPLD_SGPIO_RDY", "Port80_b6",
+	"FM_MAIN_PWREN_RMC_EN_ISO", "Port80_b7",
+
+	/* P0-P7 line 240-255 */
+	"CPU0_SLP_S5_N_R", "NFC_VEN",
+	"CPU0_SLP_S3_N_R", "",
+	"FM_CPU0_PWRGD", "",
+	"PWRGD_RMC", "",
+	"FM_RST_CPU0_RESET_N", "RBB_CPLD_RISCV_RST",
+	"FM_PWRGD_CPU0_PWROK", "LBB_CPLD_RISCV_RST",
+	"AMC_FAIL", "HPM_CPLD_RISCV_RST",
+	"wS0_ON_N", "";
+	status = "okay";
+};
+
+// BIOS Flash
+&spi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi2_default>;
+	status = "okay";
+	reg = <0x1e631000 0xc4>, <0x50000000 0x8000000>;
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		label = "pnor";
+		spi-max-frequency = <12000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+		status = "okay";
+	};
+};
+
+// HOST BIOS Debug
+&uart1 {
+	status = "okay";
+};
+
+&uart3 {
+	status = "okay";
+};
+
+&uart4 {
+	status = "okay";
+};
+
+// BMC Debug Console
+&uart5 {
+	status = "okay";
+};
+
+&uart_routing {
+	status = "okay";
+};
+
+&uhci {
+	status = "okay";
+};
+
+&vhub {
+	status = "okay";
+	pinctrl-names = "default";
+};
+
+&video {
+	status = "okay";
+	memory-region = <&video_engine_memory>;
+};
+
+&wdt1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdtrst1_default>;
+	aspeed,reset-type = "soc";
+	aspeed,external-signal;
+	aspeed,ext-push-pull;
+	aspeed,ext-active-high;
+	aspeed,ext-pulse-duration = <256>;
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 980628af80b0..18b6a7525178 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
 /dts-v1/;
-#include "aspeed-bmc-facebook-anacapa-evt1.dts"
+#include "aspeed-bmc-facebook-anacapa-evt2.dts"
 

-- 
2.34.1


