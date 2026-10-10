Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F9ECA6017
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 13:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zNXkjtT0L04RQGi6cXZiM9YcMBazDC5BVW3nyU4mKv4=; b=uuUQKnaSX46oGDkSJdJRDnwToM
	kOoPwKyCGtYdgochBoTdMZP//SWi3jjuaIoEvP9fxn9HCvUhl1MIRgM6fguf7zxaorf93JnWVw7VS
	QWiSSrtmWHZd+dAud+m8iequLQPE1zPdDBfMAznHYghrBAs2AGcCBHtqSuhbGKxHxaTlTivQwXYfW
	ZqUQx+Z+6jANGDYojATSC/Gkk3DyG2L/pUtHgvFVs50WEjDtinV/595d79b5aGnjg6/4OGVEdmBCd
	SikuzUmEgrVXPE+RXtfg8ThT8zwOOoZExDPvT/Lb4LPqYWSgheZF7LsFMb6CGgfm/w0d2DIgpHHX3
	WbExDSnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWhg-0000000849g-0hSH;
	Sat, 10 Oct 2026 13:01:32 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWh4-000000083St-30nr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 13:00:57 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49d05d51553so3263965e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 06:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637253; x=1792242053; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zNXkjtT0L04RQGi6cXZiM9YcMBazDC5BVW3nyU4mKv4=;
        b=abZafAmPVCcbq6JGlMejLm1GWgbyXnAz5YEFhsan40T/SNzAUzYLcDZrOjeMI2R/Hm
         KK6Xfblv3/hNO4ZpGJfM7wjPWsXWiopjF6LkOW1S2xGslhBlEXYLFDe28ex0/92JVKl1
         fQQBTHumKEQAryckg4/B+OpEgQCQZEIPfCn6Xmciv/DskhrCB5E9fNwFxjQkYuh00X6y
         yU9cSuO83IXI60QG6HMog5oL9rfmdOJSXurd0dzbRkqYyPCLIjE1ZClvGUPUZwnF/+FY
         4CED762sl6wWVKf0+Y3QCu+4z7bZvy9+2IKZBkACa4uWee2Je/5DmaaFQiFWUJhBzLXW
         G2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637253; x=1792242053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zNXkjtT0L04RQGi6cXZiM9YcMBazDC5BVW3nyU4mKv4=;
        b=gz3BKhFP22jcUCrAS9ddBFhKnzZaQN6fwOrLhcAIcbdYgyAo5O+AMkT6FR3rkAui6U
         5nb4b2uTBOwsahq/w2XYcYWL7VDMF/jBuzNj0f0JhCC2UpFHqFymQ0uvviI6XSUmzkwg
         jL8/LhUOrpPR7/3JF2chqnA2T28GXx5figFfVmEdJ+BggKNFlMBz3ksmgUmWC29nLjJJ
         gzL81eYcikSuKFrzDR9iUiDavZnBvEeASTH4469lszfnw4YURXgD/rPrGEBTqR/oKlIS
         bbSNr+isKynMY8dQzZeLMPYfN4D4IzI8CtxeLuaygUuRvt7TfMZFkQwd3ORqJYPrjUB0
         sD1A==
X-Gm-Message-State: AFq9FYLARmnD0pyKNp7rHYHA3fU1lftKoOKnfLzukzfL3m+MmQAI7vDD
	J+Or66CKbYpmv4nxJMpkF2hETrgr8aZufADwyM2Hcan5Q0JTU++fCZ9jJjO7trfl/sr6eg==
X-Gm-Gg: AYBFou1lZNk+mww181H/Q9YC7RL3YXDqq5BH0fJuHoLjw6yY3uFt7n+eY4lt/F2Pyn1
	BvTOD8vQ4KIObm5TxI+/ycUvPiyXdItir0piGI2VJ7whdAmqiNAsAMydhxM54/K5AP+g9t3/BGA
	LdqWw1hkI6luReqH8wYRF3NndIPmSW0vkaWQyBsAbedLqpfzVL1s2uwoIp/GK5h6vP1UPseNN1x
	lZIYTjIlcXJPx1ylwhN/0UfAsICufYou8qBBCdjiqTyueFn0HUge8xQJ9QPmcrm9fSm0mLu/LZ/
	VhCWqv4d95gIeoc1RDacaEw5asffc9RDoUWDp0F2LT2wKcH+4+ORvSrods+M7Z3CfOwHabPf/Sr
	kekOz6wK3X/wvFRNjhGFN0ZQJ1mhz7mLvsNvxnpNrp0SIFNmBupAjmRSB3HpGCiHiPCyqC7TaXe
	MAmAiHj7mdr4A2+jdpjYA1WCXZYYxkNPyEYoptCuh7fWrH8grFHXzwlflmBPCEmg67LaoOjYi/O
	leSbBXS3zc1w1KOcbuKilCKP1hb3m38TKuApPX+IWGq8+PsAo8bifidqjZ+TPgvwhJWbe51b/Dk
	ZmHuggtVkiiZbNT18Zf77qONcIYdaCt450l9wJRtMxoACnrpLKOq4I80/lwH/A==
X-Received: by 2002:a05:600c:818d:b0:4a1:6c79:fd31 with SMTP id 5b1f17b1804b1-4a18e483231mr84377575e9.12.1791637252496;
        Sat, 10 Oct 2026 06:00:52 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:51 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 24/24] ARM: dts: zte: Add ZTE ZXHN H3600 board
Date: Sat, 10 Oct 2026 14:00:02 +0100
Message-ID: <20261010130024.177503-25-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_060054_935434_EE6EB4A4 
X-CRM114-Status: GOOD (  20.74  )
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

Enable the board ports, Wi-Fi links, USB, LEDs, buttons and generic SPI
NAND. Keep the stock firmware slot intact and UBI above both bootloader-
visible headers.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 arch/arm/boot/dts/zte/Makefile                |   2 +
 .../boot/dts/zte/zx279128s-zte-zxhn-h3600.dts | 361 ++++++++++++++++++
 2 files changed, 363 insertions(+)
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
index 0000000000..96d09f0296
--- /dev/null
+++ b/arch/arm/boot/dts/zte/zx279128s-zte-zxhn-h3600.dts
@@ -0,0 +1,361 @@
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
+			function = LED_FUNCTION_WLAN_2GHZ;
+			gpios = <&gpio0 1 GPIO_ACTIVE_LOW>;
+		};
+
+		led_broadband: led-broadband {
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
+	phy10: ethernet-phy@10 {
+		reg = <10>;
+	};
+
+	phy11: ethernet-phy@11 {
+		reg = <11>;
+	};
+
+	phy12: ethernet-phy@12 {
+		reg = <12>;
+	};
+
+	phy13: ethernet-phy@13 {
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


