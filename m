Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F545105F7A7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 13:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=96wIKyTh0AzqeditJlQ3kQuExY/YGJnegboCLTZQauE=; b=OvP7OvQ3GsfopVG/JPLMs9gHD7
	VDm87q8qt5sxi+5Er3JexUFn1kuHjCy35g5mT5uE/GPliZnvJeRm9prBfEghSaFyx+mYmx+K+p7Lu
	nVJzOJogjr7zG+Q+ziM/goRHWvozQpenzv+yIrVxRtSS1BGCHAzAzfAkjkWYWDipq6cqMt7M6a5eD
	K0y6+rT8LqXthPla3pxh7T2ItPRWzUJRypbO1fD3Oeol073qs13Bx432AsEycw+Udgzm+Timt/GUN
	Y2PbXeKOLJiB03SyO1LRST8jbbpnDRhY8fJNgQTve8qegCcdE/AaZNB9yy3Hcd8dfL98E3DlfAefQ
	wdq0EqmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12Ii-00000000BXB-0LL2;
	Fri, 13 Mar 2026 13:11:36 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12Ic-00000000BSf-2J4S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 13:11:35 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-2bea8220c38so1500271eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 06:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773407490; x=1774012290; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96wIKyTh0AzqeditJlQ3kQuExY/YGJnegboCLTZQauE=;
        b=EevOmYYf7saDs9awZiBPKEUK1pINuxMWZ+moh2fi5uEKDYLJxkAkic9IP7H3HsCJB3
         6PlJXq7Kv2e1/GzfNRQuVPmxVuiiNg1i+RoXZF86NzBT5lMUVv4tjpLB0kOKscd2u/F3
         YCHzePgYmh4h0OlqWWZebXnhaIdp1cdVZDSqfB7CwhgK7/I+p/hwSfOtO8TBZXt92ykR
         Obmf1GSFqCJOtMw2rwkHTenvZchVGhnbUqqKQVCqQrzyWg3NoyO0lIDV7cCWqyeGbAYx
         glGGc+YaeQTShD/NNKU+PirCxscZE5Q3WmSUXmYIfEaaE47i5GQGIH/eYxoiJeyZbpTd
         FNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773407490; x=1774012290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=96wIKyTh0AzqeditJlQ3kQuExY/YGJnegboCLTZQauE=;
        b=R89UsV7mrJ2DKDqw7sNYCRnn30m3b8uzfiC094ITxYDMSsUez64iVtEaTBvikunDvA
         Puhf0PHIG7GwFsR6eTa9DZ3iQmAGVJjjmhvyCMiJYb0Pdyu6mud+hygqus2TeQy23L+H
         NZPsgr8d2m1TkvK2dQyF31/qAF86yZI+fauImfTppnQa2arup3ImqJgVxgF6Kh1tVvW/
         w9NbvsoyTk32ErrIM72SHbeDt62M7UORUlEuckztVpurKFfdF6I/NmSUS2vYsl+gYvVs
         kPyAMyrIiAakhSC+fkAw4sWMP8kT0IlRpXhDoJpugCj2r3pnA9vTcZ1vczsLHH5JxE7c
         EdLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEBtLw3h4zkxSku/DKq8GNzIpPVd+w/hSH4iI1Wl52ajXlyu036P8TfBok+OGHqNHUfcPcECUPK/NOttFcJ836@lists.infradead.org
X-Gm-Message-State: AOJu0YwuTMY5fAStHoLUcQEXt+5eaCVdhrVlcmNJXSQuIQycmDBWe/WI
	+O4swJ8JBQBpn5zFCnazhbNoCzynEce42Pmhow8mN73MbjGTwbRXrQFi
X-Gm-Gg: ATEYQzwp5p9QXeD4DqcXXuTk76rhrkb1ysyrv7QS8b42swijAudIZlIG1dNwy5TE7iM
	d2aBySAgJJLUvf33nHgeWus3kwCw2o0tqggvEME/l3y4LWP6h9pOlCTgYkj4xLge4ghJPE/mD7R
	ylYMU/RHu0hYjqniL+DFbs4JIP9Goymipqy2vY9jHVQ4SjrhBWVO3sQBTBhSjVQuT/BW0HhAjtK
	ambYEwGJgs+oXpY2fIuo/78DBtO3kl3U6ZOsHXwZILHMT/C6bAJNZadm+CEtJIWUgne3tPQQQYk
	doH4EqAYTTlnkzLPlkZOHH+Gr0GqpBxtNH5cZJ63B+uDEaMd/suW65utlWAOWgpgHDT1wO97HLX
	OE0I2EOQRampj+08CPeYT6MhaPtCbg/VhKJ/KXNi+Xcu9qddjh3vghWCibq+bwewUEJVvPecwLP
	aqnzJuYRz34OlIYuXvRns8eP5sTjPlixxcMT/TDRe4zyXarvBipuC0zgwOI1gfKcskusS8DtaYI
	igQ
X-Received: by 2002:a05:7301:1688:b0:2be:ca4:e13d with SMTP id 5a478bee46e88-2bea55f5207mr1416328eec.30.1773407489117;
        Fri, 13 Mar 2026 06:11:29 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:1b3:a803:148f:b6b5:4:db6e:9a2c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab5702e5sm2602315eec.29.2026.03.13.06.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:11:27 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shawn.lin@rock-chips.com,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH v7 4/4] ARM: dts: rockchip: Add Onion Omega4 Evaluation Board
Date: Fri, 13 Mar 2026 10:10:58 -0300
Message-ID: <20260313131058.708361-4-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313131058.708361-1-festevam@gmail.com>
References: <20260313131058.708361-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_061131_420690_89C47530 
X-CRM114-Status: GOOD (  18.97  )
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

From: Fabio Estevam <festevam@nabladev.com>

The Onion Omega4 Evaluation Board is based on the RV1103B SoC and has:

 - 256 MB of RAM
 - 256 MB of SPI-NAND
 - Ethernet
 - USB OTG
 - Wifi
 - SD card
 - Camera connector

The details can be found at:
https://documentation.onioniot.com/omega4/getting-started/

Add the initial support for this board so that it can fully boot into
Linux with the root file system stored in the SPI NAND.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
Changes since v6:
- Added SD card and SDIO support.

 arch/arm/boot/dts/rockchip/Makefile           |   1 +
 .../boot/dts/rockchip/rv1103b-omega4-evb.dts  |  63 ++++++++
 .../arm/boot/dts/rockchip/rv1103b-omega4.dtsi | 151 ++++++++++++++++++
 3 files changed, 215 insertions(+)
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103b-omega4-evb.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103b-omega4.dtsi

diff --git a/arch/arm/boot/dts/rockchip/Makefile b/arch/arm/boot/dts/rockchip/Makefile
index 716f5540e438..d0154fd7ff24 100644
--- a/arch/arm/boot/dts/rockchip/Makefile
+++ b/arch/arm/boot/dts/rockchip/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_ROCKCHIP) += \
+	rv1103b-omega4-evb.dtb \
 	rv1108-elgin-r1.dtb \
 	rv1108-evb.dtb \
 	rv1109-relfor-saib.dtb \
diff --git a/arch/arm/boot/dts/rockchip/rv1103b-omega4-evb.dts b/arch/arm/boot/dts/rockchip/rv1103b-omega4-evb.dts
new file mode 100644
index 000000000000..d63aa3515403
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rv1103b-omega4-evb.dts
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2022 Rockchip Electronics Co., Ltd.
+ * Copyright (c) 2025 plan44.ch/luz
+ * Copyright (c) 2026 Onion Corporation
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include "rv1103b-omega4.dtsi"
+
+/ {
+	model = "Onion Omega4 Evaluation Board";
+	compatible = "onion,omega4-evb", "onion,omega4", "rockchip,rv1103b";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0	{
+			pinctrl-names = "default";
+			pinctrl-0 = <&led>;
+			gpios = <&gpio0 RK_PA2 GPIO_ACTIVE_HIGH>;
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_BLUE>;
+			label = "sys";
+			default-state = "on";
+		};
+	};
+};
+
+&fspi0 {
+	status = "okay";
+};
+
+&sdmmc0 {
+	status = "okay";
+};
+
+&sdmmc1 {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&pinctrl {
+	leds {
+		led: led {
+			rockchip,pins = <0 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/rockchip/rv1103b-omega4.dtsi b/arch/arm/boot/dts/rockchip/rv1103b-omega4.dtsi
new file mode 100644
index 000000000000..eda0189af7a8
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rv1103b-omega4.dtsi
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2022 Rockchip Electronics Co., Ltd.
+ * Copyright (c) 2025 plan44.ch/luz
+ * Copyright (c) 2026 Onion Corporation
+ */
+
+/dts-v1/;
+
+#include "rv1103b.dtsi"
+
+/ {
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_enable_h>;
+		post-power-on-delay-ms = <300>;
+		reset-gpios = <&gpio2 RK_PB2 GPIO_ACTIVE_LOW>;
+	};
+
+	vcc3v3_sd: vcc3v3-sd {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&sdmmc_pwren>;
+		gpio = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
+		regulator-name = "vcc3v3_sd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	vccio_sd: vccio-sd {
+		compatible = "regulator-gpio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&sdmmc_volt>;
+		regulator-name = "vccio_sd";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&gpio0 RK_PA3 GPIO_ACTIVE_HIGH>;
+		states = <3300000 1 1800000 0>;
+	};
+};
+
+&uart0 {
+	bootph-all;
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0m0_xfer>;
+};
+
+&fspi0 {
+	spi_nand: flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		bootph-pre-ram;
+		bootph-some-ram;
+		spi-max-frequency = <75000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <1>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "env";
+				reg = <0x00000000 0x00040000>;
+			};
+
+			partition@40000 {
+				label = "idblock";
+				reg = <0x00040000 0x00100000>;
+				read-only;
+			};
+
+			partition@140000 {
+				label = "uboot";
+				reg = <0x00140000 0x00100000>;
+				read-only;
+			};
+
+			partition@240000 {
+				label = "boot";
+				reg = <0x00240000 0x00800000>;
+			};
+
+			partition@a40000 {
+				label = "ubi";
+				reg = <0x00a40000 0x0f5c0000>;
+			};
+		};
+	};
+};
+
+&sdmmc0 {
+	bus-width = <4>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	disable-wp;
+	no-sdio;
+	no-mmc;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc3v3_sd>;
+	vqmmc-supply = <&vccio_sd>;
+	status = "disabled";
+};
+
+&sdmmc1 {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	no-sd;
+	no-mmc;
+	non-removable;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc1_cmd &sdmmc1_clk &sdmmc1_bus4>;
+	status = "disabled";
+};
+
+&wdt {
+	status = "okay";
+};
+
+&pinctrl {
+	sdio-pwrseq {
+		/omit-if-no-ref/
+		wifi_enable_h: wifi-enable-h {
+			rockchip,pins = <2 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	sdmmc {
+		/omit-if-no-ref/
+		sdmmc_pwren: sdmmc-pwren {
+			rockchip,pins = <0 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		sdmmc_volt: sdmmc-volt {
+			rockchip,pins = <0 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	wireless-wlan {
+		/omit-if-no-ref/
+		wifi_host_wake_irq: wifi-host-wake-irq {
+			rockchip,pins = <2 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
-- 
2.43.0


