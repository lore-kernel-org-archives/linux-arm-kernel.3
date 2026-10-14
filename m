Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8B3CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SOB0hFLW8NAJjDWYePu7p10HP778mqXX1LJvbg4+2So=; b=D5yRPbnzjk3p0F+g2syGCz8BBJ
	D+azM29aicFfkEXDKheNrz2cvOhsRAQhe5oMqaT6Jvkp1ks2ayK+2X2cXDxi9LMrVo4R6TqftZu6a
	Ddm5HvcO6ZM4g/eDymGYBU3RiCYu6hLSRuJCfMGMMi7w4MFCj+gI0bnmdt4DPqry9LlZMdqyIHZwp
	uFVFeDQsI6pAGTOJJS1UQ7KOOsKV73dnPVcUFHLkJ9Qyb2jcRJAR/RmVcJOwhSgZtdCDTZzN5cNh2
	QVRo/OMSIFgbO3yx4Uys5Ns/o9y4h71VK3MbqGtwvDKaY0BnzKat1mPsGX1w450sCFxoK+1Yd3YT8
	eoTZ4fLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtLR-0000000Ek4Y-20Jz;
	Wed, 14 Oct 2026 07:24:13 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtKb-0000000EjRs-2j8I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:23:28 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso5221375e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 00:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962600; x=1792567400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SOB0hFLW8NAJjDWYePu7p10HP778mqXX1LJvbg4+2So=;
        b=qJZmgTFjawR3UELMHMocrVHb/vJGzCF+g7JlHafQV+4m5T0rzRTi7BlxPemCx1ON4y
         s9eSOM/ci581ruvxjcfOysQudPOU9uHmUwUcw3q0qt2F6x90horpM6fEN6/bFiuDQVQn
         +yeV7RT4Gow4wVGR+ZseVGKX0oSfbar4B5ENhGAqBXIfbtw6Okl0OxpkM11EzplelGXa
         E+SlDVsnoHhhBriSwmbM6TaXb6Sgw+oNnft8c5j/1zjGahXV00c8iLH/9JrdKfOO7iwy
         VFDAQA1O7nEDdDNk5ivg0HZpu8blsqOoLv5i3oSH2dx/REJiuJ1mUe3KrfY87fiMyi0L
         rlJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962600; x=1792567400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SOB0hFLW8NAJjDWYePu7p10HP778mqXX1LJvbg4+2So=;
        b=ZNoZht1KCO4MAlrUnCOlRBqC7n4kcchyzvQZr/kZZzoTHJ/P9F8u4kjqdaO9yMJH2n
         R6ydbQW7uy1xVI17YG2ZvXxGhXUkwUCELCNHWwTKS93wPtUrW0vDQKc8msTrjo4Moc2W
         IXrzVwgcaYhNd1JJ406bvWfOiSzoKFPObdpFRf9Xb9IlMZCsaBmbgZPiiLKACtdT8Dmu
         ORx3Q8RKL0lBqVhaTB2xPwR4im73jJyp3ly+QdY77qn1qex/OrcTUYQgyyEg7y3G+B9t
         ohXlL+zZEteDtR4IJK87zq+vpRLTk4SrQH1VfqyvCefuJIpOtnQxwKkrU0A97ejfzvOV
         pfDw==
X-Gm-Message-State: AFq9FYIfsKb4gKdG/mrCevv7Rqnt05vZ6vMa4qK9Yuz41VW8td9CNiqC
	6ucyecQ/RXyhCwYqW8Bkmw/HLlCwxQ6gGPJAVa0dUYOXwC1guB6wO/8fWa6cM7ebqfU1dA==
X-Gm-Gg: AYBFou2/c43bUVs35NZAF86rRaecpCqjC5HTMoD3weEeXhECbPPB22jgn2CFLTeXr+E
	3ZkcKc1b9bYGdMNTm5FUb0uzQsqXvGb1E27ggrNcw34pCK4pZ1IZxRWW8VxlJYkD4IUEXSxXy/S
	Snz6/kDoO0q44un/hZBXBzwkssQIHj1F2jhDhL8z/ojZRr4xcjvOwdLZMfjiN0j/P7O2kb97cWv
	fffBy94YF7h76XI3Rt/r+F1V5WUL6ZVGhNc1DC0YKL9qKfgydnu8/FGG4CXRMgJrBhQuJNmUiE/
	wD2vQnxUmlzKtY7QEyc5oh36xK+RCUzU1b9BnZ4XecOPbTfL+P3m0o8wGVSNh85S3k5UJs5ntk/
	O9C51xXUBNZDZPE49NRy7pIjFfdBpM1l9X6jq8lgUENaFkxRveDVmW0SYROL5/npoS4dEG7MLth
	BamXH2Ubq5+1yeVfjG48T9icnnK9U0jQsdkin01qWDJYEZFtLJnnPizMypBc9bL3isJbZtqsjXQ
	LJY3O86sLWhsWQGheRCUGKPRohIpVJR44+vyYA09JeXpVng6UvA4KQ7JLtQmKYPA9ZePpi6OaV1
	Q/pYmU5S6owc+vNTG9JolQ0dP76apO+RLPPLOiAXz/i8dsHPAIK5ugOk65H1mjS174vn3Ucl
X-Received: by 2002:a05:600c:4f46:b0:49f:cbf1:e77b with SMTP id 5b1f17b1804b1-4a18e4a5355mr364127835e9.10.1791962599738;
        Wed, 14 Oct 2026 00:23:19 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:23:19 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 24/24] ARM: dts: zte: Add ZTE ZXHN H3600 board
Date: Wed, 14 Oct 2026 08:21:04 +0100
Message-ID: <20261014072109.1759502-25-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_002322_688395_950CB422 
X-CRM114-Status: GOOD (  21.37  )
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

Add the device tree for the ZTE ZXHN H3600 Wi-Fi 6 home gateway router.
Configure the internal Gigabit switch ports, external Sanechips ZX5201
WAN PHY, SPI NAND flash on the SPI controller, LEDs, buttons, and
MediaTek MT7915 Wi-Fi cards on PCIe ports 0 and 1.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 arch/arm/boot/dts/zte/Makefile                |   2 +
 .../boot/dts/zte/zx279128s-zte-zxhn-h3600.dts | 364 ++++++++++++++++++
 2 files changed, 366 insertions(+)
 create mode 100644 arch/arm/boot/dts/zte/zx279128s-zte-zxhn-h3600.dts

diff --git a/arch/arm/boot/dts/zte/Makefile b/arch/arm/boot/dts/zte/Makefile
index f052cfbd63..29cc864459 100644
--- a/arch/arm/boot/dts/zte/Makefile
+++ b/arch/arm/boot/dts/zte/Makefile
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 dtb-$(CONFIG_SOC_ZX297520V3) += \
 	zx297520v3-dlink-dwr932m.dtb
+
+dtb-$(CONFIG_SOC_ZX279128S) += zx279128s-zte-zxhn-h3600.dtb
diff --git a/arch/arm/boot/dts/zte/zx279128s-zte-zxhn-h3600.dts b/arch/arm/boot/dts/zte/zx279128s-zte-zxhn-h3600.dts
new file mode 100644
index 0000000000..d46390f075
--- /dev/null
+++ b/arch/arm/boot/dts/zte/zx279128s-zte-zxhn-h3600.dts
@@ -0,0 +1,364 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/*
+ * ZTE ZXHN H3600 (also sold as ZXHN H1600): home gateway with four LAN ports,
+ * a WAN port and an MT7915 Wi-Fi 6 chip on both PCIe controllers.
+ *
+ * Copyright (C) 2026 Navid Ghahremani <ghahramani.navid@gmail.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+
+#include "zx279128s.dtsi"
+
+/ {
+	model = "ZTE ZXHN H3600";
+	compatible = "zte,zxhn-h3600", "zte,zx279128s";
+
+	aliases {
+		serial0 = &serial0;
+		serial1 = &serial1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x40000000 0x20000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		/*
+		 * The stock kernel reserves the top 38 MiB for the packet
+		 * processor. Keep Linux, and in particular DMA buffers, out.
+		 */
+		pp@5da00000 {
+			reg = <0x5da00000 0x2600000>;
+			no-map;
+		};
+	};
+
+	/* All LEDs are active low. Colours only where seen on the panel. */
+	leds {
+		compatible = "gpio-leds";
+
+		/* One power LED with two elements: both on shows orange */
+		led_power_red: led-power-red {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_POWER;
+			gpios = <&gpio2 6 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		led_power_green: led-power-green {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_POWER;
+			gpios = <&gpio2 7 GPIO_ACTIVE_LOW>;
+		};
+
+		led_wlan_2g: led-wlan-2g {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_WLAN_2GHZ;
+			gpios = <&gpio0 1 GPIO_ACTIVE_LOW>;
+		};
+
+		led_broadband: led-broadband {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_WAN;
+			gpios = <&gpio0 8 GPIO_ACTIVE_LOW>;
+		};
+
+		led_phone1: led-phone1 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = "phone";
+			function-enumerator = <1>;
+			gpios = <&gpio1 12 GPIO_ACTIVE_LOW>;
+		};
+
+		led_phone2: led-phone2 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = "phone";
+			function-enumerator = <2>;
+			gpios = <&gpio1 13 GPIO_ACTIVE_LOW>;
+		};
+
+		led_wlan_5g: led-wlan-5g {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_WLAN_5GHZ;
+			gpios = <&gpio2 8 GPIO_ACTIVE_LOW>;
+		};
+
+		led_usb: led-usb {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_USB;
+			gpios = <&gpio2 9 GPIO_ACTIVE_LOW>;
+		};
+
+		led_internet_red: led-internet-red {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_WAN_ONLINE;
+			gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+		};
+
+		led_internet_green: led-internet-green {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_WAN_ONLINE;
+			gpios = <&gpio3 1 GPIO_ACTIVE_LOW>;
+		};
+
+		led_wps: led-wps {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_WPS;
+			gpios = <&gpio3 2 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	/* Polled: the GPIO driver does not support interrupts */
+	keys {
+		compatible = "gpio-keys-polled";
+		poll-interval = <50>;
+
+		key-reset {
+			label = "reset";
+			gpios = <&gpio0 2 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_RESTART>;
+			debounce-interval = <60>;
+		};
+
+		key-wps {
+			label = "wps";
+			gpios = <&gpio0 12 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_WPS_BUTTON>;
+			debounce-interval = <60>;
+		};
+
+		key-wifi {
+			label = "rfkill";
+			gpios = <&gpio3 12 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_RFKILL>;
+			debounce-interval = <60>;
+		};
+
+		key-led {
+			label = "led";
+			gpios = <&gpio0 3 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_LIGHTS_TOGGLE>;
+			debounce-interval = <60>;
+		};
+	};
+};
+
+&gmac {
+	status = "okay";
+};
+
+&gmac_port0 {
+	label = "lan1";
+	phy-handle = <&phy10>;
+	phy-mode = "internal";
+	nvmem-cells = <&macaddr_tag_1e 0>;
+	nvmem-cell-names = "mac-address";
+	status = "okay";
+};
+
+&gmac_port1 {
+	label = "lan2";
+	phy-handle = <&phy11>;
+	phy-mode = "internal";
+	nvmem-cells = <&macaddr_tag_1e 0>;
+	nvmem-cell-names = "mac-address";
+	status = "okay";
+};
+
+&gmac_port2 {
+	label = "lan3";
+	phy-handle = <&phy12>;
+	phy-mode = "internal";
+	nvmem-cells = <&macaddr_tag_1e 0>;
+	nvmem-cell-names = "mac-address";
+	status = "okay";
+};
+
+&gmac_port3 {
+	label = "lan4";
+	phy-handle = <&phy13>;
+	phy-mode = "internal";
+	nvmem-cells = <&macaddr_tag_1e 0>;
+	nvmem-cell-names = "mac-address";
+	status = "okay";
+};
+
+&gmac_port4 {
+	label = "wan";
+	phy-handle = <&phy8>;
+	phy-mode = "gmii";
+	nvmem-cells = <&macaddr_tag_1e 1>;
+	nvmem-cell-names = "mac-address";
+	status = "okay";
+};
+
+&mdio {
+	/* the ZX5201 WAN PHY */
+	pinctrl-names = "default";
+	pinctrl-0 = <&ext_phy_pins>;
+	status = "okay";
+
+	/* external Sanechips ZX5201; its SerDes answers on address 9 */
+	phy8: ethernet-phy@8 {
+		reg = <8>;
+	};
+
+	phy10: ethernet-phy@a {
+		reg = <10>;
+	};
+
+	phy11: ethernet-phy@b {
+		reg = <11>;
+	};
+
+	phy12: ethernet-phy@c {
+		reg = <12>;
+	};
+
+	phy13: ethernet-phy@d {
+		reg = <13>;
+	};
+};
+
+/* MT7915: main interface on pcie0, second interface (HIF2) on pcie1 */
+/*
+ * The two lines reset the whole MT7915, which is behind both controllers.
+ * Whichever controller starts first releases it.
+ */
+&pcie0 {
+	reset-gpios = <&gpio3 5 GPIO_ACTIVE_LOW>;
+	enable-gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+
+&pcie1 {
+	reset-gpios = <&gpio3 5 GPIO_ACTIVE_LOW>;
+	enable-gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+
+&serial0 {
+	status = "okay";
+};
+
+&usb {
+	status = "okay";
+};
+
+&serial1 {
+	status = "okay";
+};
+
+&spifc {
+	status = "okay";
+
+	flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
+		spi-tx-bus-width = <1>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "bootloader";
+				reg = <0x0000000 0x0100000>;
+				read-only;
+			};
+
+			partition@100000 {
+				label = "tag";
+				reg = <0x0100000 0x0100000>;
+				read-only;
+
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					/* the LAN ports' MAC; the WAN port uses the next one */
+					macaddr_tag_1e: macaddr@1e {
+						compatible = "mac-base";
+						reg = <0x1e 0x6>;
+						#nvmem-cell-cells = <1>;
+					};
+				};
+			};
+
+			partition@200000 {
+				label = "wifi";
+				reg = <0x0200000 0x0100000>;
+				read-only;
+			};
+
+			partition@300000 {
+				label = "usercfg";
+				reg = <0x0300000 0x0200000>;
+				read-only;
+			};
+
+			partition@500000 {
+				label = "defcfg";
+				reg = <0x0500000 0x0200000>;
+				read-only;
+			};
+
+			/*
+			 * Slot 0 of the boot loader, up to its slot 1 at
+			 * 0x2700000: it reads the kernel from the start, stepping
+			 * over bad blocks, and finds the slot header, which
+			 * holds the kernel's length and CRC. A rootfs length of 0
+			 * makes it check nothing else.
+			 */
+			partition@700000 {
+				label = "kernel";
+				reg = <0x0700000 0x0400000>;
+			};
+
+			partition@b00000 {
+				/* Erase old rootfs/UBI headers during migration. */
+				label = "slot0_gap";
+				reg = <0x0b00000 0x1b00000>;
+			};
+
+			partition@2600000 {
+				label = "trailer";
+				reg = <0x2600000 0x0100000>;
+			};
+
+			partition@2700000 {
+				label = "stock";
+				reg = <0x2700000 0x2000000>;
+				read-only;
+			};
+
+			/*
+			 * Keep slot 1 (0x2700000..0x4700000) intact. cspboot
+			 * mistakes UBI erase-counter headers for boot headers;
+			 * its scan must find both firmware headers before UBI.
+			 */
+			partition@4700000 {
+				label = "ubi";
+				reg = <0x4700000 0x3900000>;
+			};
+		};
+	};
+};
-- 
2.55.0


