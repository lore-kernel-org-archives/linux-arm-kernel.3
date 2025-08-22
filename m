Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77234CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HBQf3BSWaYdmOMzVughu0pHqvB6sLYCexnZqM0Rj8Sk=; b=ElA5Yrc3i5pTGJXzRtJQhOe25/
	RVla0iundZvYE31eBBCj6f9gP8iwItY/2zLkQZCM18KCVTAxwD3B8xSYHXhIHbhZovJIvg4/j4Dfi
	KTqGmu3kCSB8qaGOfhsYLWv/SNj1BHA74Oww25w0wJOpreGRML6vMIj69ACU7dtWd1PIkPCth6/ia
	mit6L22HDsRb15fj9Z6nIW2zvn+QBicsGhzx/0ef29dUv7TpBVwUm/prfRNF1qmo/muX634PcRUsR
	ihh6AQkN+Nh+jKFU5oRKNPwBWbzaF5rZD+YIqL6XV1ApxTYYW6heePRx6epIcfJ5I1euUQpD2Lvjg
	qVfBat7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphwy-00000004E54-2SkX;
	Sat, 23 Aug 2025 06:42:04 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upVzx-00000003H2p-2MAN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 17:56:22 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-333f92cb94eso20768301fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 10:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755885380; x=1756490180; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HBQf3BSWaYdmOMzVughu0pHqvB6sLYCexnZqM0Rj8Sk=;
        b=yMKfTCmLJiEvyQ1lwmLfeUMeprdRYcCHB5sSToWQ4OG+r8Lw6IIoX6q7bvwcBdRPQK
         8FogTYiTz/osn8stzq8/l8aerk8CqiqWrOB2plgPBxp7R/61h+ztw4rIdJlQA/mAEjrF
         C4ow9O/RsnQdioGQoSvS1z/d+7bw8ARTKvnoDFzkNFVN7k51qpfwMhwXgQK7bpDfiwfK
         LpZvgdscdk0zlyd9nUKY//Y8ud1MSpUzBGUXtSVbzCxbnVvch6cJBvscCksA/yFLSP1F
         f0IqQpOkD8MgQiGWpetyICNuimRkSHrW/EqFnM9Mw7os29qfI0X2ntwd5jhngTYvwuDZ
         T/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755885380; x=1756490180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HBQf3BSWaYdmOMzVughu0pHqvB6sLYCexnZqM0Rj8Sk=;
        b=MWhHTjepWBVptGDaPay//HC0oRLPWd0Zs9TgLotdJ75vL5zV3hjSEo8MqlJEUlfPZL
         /hXDlWGXZe1KuWUk2TtAPEnPlnu0YGiZYzZPVGqzbTMUkb5LVauQKcbv6ceXD2Ayeufj
         M6/iMTBD6xJfxH+YkU9xPZ0IegO81DhNHMASFY6CLJ9td8XrIO3s8FQQZkhOqR+pcFuj
         7/1uvs4bOUe33blK5GWyzhqwwp6UZuaeopg0cmUJfpm1NOCwdbucCSPw/arDs8lgSs9W
         U4stjkGJX1glRsUpj+0EqEyORhgSAQA31DORYQ8PnsP8MraHqr+4zOUhcxyD+xqVZUAK
         a6iQ==
X-Forwarded-Encrypted: i=1; AJvYcCXILO78FBw+tnMPt0S/iKnx1LL30dREx4MGcoxlFwoJkQ4tUjavePfWv5Mpqm8xRnZKxNN2zA14991GjVWVr9if@lists.infradead.org
X-Gm-Message-State: AOJu0YznmSoleqQekp5nVQaFIYJVD2LdgfZtRSKjdm9vjNMgFxu3Ci2p
	Ve8UAiJztP1xEujNBMp/mWeoMSo3u7QbfpRaxj3z/5u+uKQQjzN3O3uCFYFLLXEcgAKYJFab5O6
	N7vIfPbM=
X-Gm-Gg: ASbGncuI/VfW1D1K6yEemoFdwiRYsH/abIwpmrDnJ7ZFa4ayQBX4+xKmPvPYgXRmHUy
	06mngpp7AeRJI0DtABFeZ16r0MUuhSSIgK6y1AyeukqVKARRU0Y00D2fIy76cIODDnK9TGqzLf2
	1mnGXGvS+KvQYzIH5hTcUXAqF7aW9Zb4C5OEc056GYTUj387jh9Fx4W8hD9R/mAQwUb333RdDKR
	8uBctveJO0gHXgU/2oCfdHrx91NVdIJ3N9IE8CKX7vcpYwU5/BZzFewm6xToswyNMUXBOiZpHGm
	k5FuKREtIrNcEJI+FBo//belJXnD6oPVH91/TeW7KqesYRmUzYAdzMyOJFIeVjeUI/shZkgdoL9
	A+G9IjWJ41oTKAb9fu8e+3FVA0iMsoGjHEGUY77Hyo0g=
X-Google-Smtp-Source: AGHT+IEnkDZI2+I3s6Jq42rU03lqIJS6l0gXs6ltDJpTCW6GO8sbaw1UPZiYKNGG114V7bPnboAdHQ==
X-Received: by 2002:a05:651c:1109:10b0:332:1de5:c513 with SMTP id 38308e7fff4ca-33650e380ddmr7713791fa.4.1755885379760;
        Fri, 22 Aug 2025 10:56:19 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3365e20d2e1sm605121fa.1.2025.08.22.10.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 10:56:18 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 22 Aug 2025 19:56:16 +0200
Subject: [PATCH v2 3/3] ARM: dts: Add ixp4xx Actiontec MI424WR device trees
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-ixp4xx-mi424wr-dts-v2-3-cc804884474d@linaro.org>
References: <20250822-ixp4xx-mi424wr-dts-v2-0-cc804884474d@linaro.org>
In-Reply-To: <20250822-ixp4xx-mi424wr-dts-v2-0-cc804884474d@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_105621_613376_75DC7819 
X-CRM114-Status: GOOD (  19.93  )
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

The Actiontex MI424WR is a pretty widespread home router, made
in many different revisions.

Revisions A, C and D are based on IXP42x. We add a device tree
for the A/C variant and one for the D variant as these differ in
the location of the WAN PHY on the MDIO bus, and the ethernet
interfaces for the WAN PHY and the DSA switch are switched around.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/intel/ixp/Makefile               |   2 +
 .../ixp/intel-ixp42x-actiontec-mi424wr-ac.dts      |  37 +++
 .../intel/ixp/intel-ixp42x-actiontec-mi424wr-d.dts |  38 +++
 .../intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi  | 272 +++++++++++++++++++++
 4 files changed, 349 insertions(+)

diff --git a/arch/arm/boot/dts/intel/ixp/Makefile b/arch/arm/boot/dts/intel/ixp/Makefile
index ab8525f1ea1d25abe72fca4dd323d97e2d3c5bb4..cb30d8d55016fbe00848242d9d1a017f7e48c6db 100644
--- a/arch/arm/boot/dts/intel/ixp/Makefile
+++ b/arch/arm/boot/dts/intel/ixp/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_IXP4XX) += \
+	intel-ixp42x-actiontec-mi424wr-ac.dtb \
+	intel-ixp42x-actiontec-mi424wr-d.dtb \
 	intel-ixp42x-linksys-nslu2.dtb \
 	intel-ixp42x-linksys-wrv54g.dtb \
 	intel-ixp42x-freecom-fsg-3.dtb \
diff --git a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-ac.dts b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-ac.dts
new file mode 100644
index 0000000000000000000000000000000000000000..413b9255f9e3cf24fd1dde6a300a8295e3fdee0f
--- /dev/null
+++ b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-ac.dts
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: ISC
+/*
+ * Device Tree file for the IXP425-based Actiontec MI424WR revision A and C
+ * Based on a board file from OpenWrt by Jose Vasconcellos.
+ */
+
+/dts-v1/;
+
+#include "intel-ixp42x-actiontec-mi424wr.dtsi"
+
+/ {
+	model = "Actiontec MI424WR rev A/C";
+	compatible = "actiontec,mi424wr-ac", "intel,ixp42x";
+
+	soc {
+		/* EthB used for WAN */
+		ethernet@c8009000 {
+			phy-handle = <&phy17>; // 17 on revision A-C
+
+			mdio {
+				phy17: ethernet-phy@17 {
+					/* WAN */
+					reg = <17>;
+				};
+			};
+		};
+
+		/* EthC used for LAN */
+		ethernet@c800a000 {
+			/* Fixed link to the CPU MII port on the KS8995 */
+			fixed-link {
+				speed = <100>;
+				full-duplex;
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-d.dts b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-d.dts
new file mode 100644
index 0000000000000000000000000000000000000000..3619c6411a5c04b78d32aac5f2fc0c42a99e7acd
--- /dev/null
+++ b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-d.dts
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: ISC
+/*
+ * Device Tree file for the IXP425-based Actiontec MI424WR revision D
+ * Based on a board file from OpenWrt by Jose Vasconcellos.
+ */
+
+/dts-v1/;
+
+#include "intel-ixp42x-actiontec-mi424wr.dtsi"
+
+/ {
+	model = "Actiontec MI424WR rev D";
+	compatible = "actiontec,mi424wr-d", "intel,ixp42x";
+
+	soc {
+		/* EthB used for LAN */
+		ethernet@c8009000 {
+			/* Fixed link to the CPU MII port on the KS8995 */
+			fixed-link {
+				speed = <100>;
+				full-duplex;
+			};
+
+			mdio {
+				/* PHY ID 0x00221450 */
+				phy5: ethernet-phy@5 {
+					/* WAN */
+					reg = <5>;
+				};
+			};
+		};
+
+		/* EthC used for WAN */
+		ethernet@c800a000 {
+			phy-handle = <&phy5>; // 5 on revision D
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..76fd97c5beb69d4cd682392a7e659590cb331be4
--- /dev/null
+++ b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi
@@ -0,0 +1,272 @@
+// SPDX-License-Identifier: ISC
+/*
+ * Device Tree file for the IXP425-based Actiontec MI424WR
+ * Based on a board file from OpenWrt by Jose Vasconcellos.
+ */
+
+#include "intel-ixp42x.dtsi"
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x02000000>;
+	};
+
+	chosen {
+		bootargs = "console=ttyS0,115200n8";
+		stdout-path = "uart1:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-wan-coax {
+			color = <LED_COLOR_ID_GREEN>;
+			function = "wan-coax";
+			gpios = <&gpio0 11 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led-power-alarm {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_ALARM;
+			gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led-power {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_POWER;
+			gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+			linux,default-trigger = "heartbeat";
+		};
+		led-wireless {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_WLAN;
+			gpios = <&gpio1 2 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+		led-internet-down {
+			color = <LED_COLOR_ID_RED>;
+			function = "internet-down";
+			gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led-internet-up {
+			color = <LED_COLOR_ID_GREEN>;
+			function = "internet-up";
+			gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led-lan-coax {
+			color = <LED_COLOR_ID_GREEN>;
+			function = "lan-coax";
+			gpios = <&gpio1 5 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led-wan-ethernet-alarm {
+			color = <LED_COLOR_ID_RED>;
+			function = "wan-ethernet-alarm";
+			gpios = <&gpio1 6 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		/* The last three LEDs are not mounted but traces exist on the PCB */
+		led-phone-1 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = "phone-1";
+			gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+		led-phone-2 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = "phone-2";
+			gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+		led-voip {
+			color = <LED_COLOR_ID_GREEN>;
+			function = "voip";
+			gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+	};
+
+	gpio_keys {
+		compatible = "gpio-keys";
+
+		button-reset {
+			wakeup-source;
+			linux,code = <KEY_RESTART>;
+			label = "reset";
+			gpios = <&gpio0 10 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	spi {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sck-gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&gpio0 4 GPIO_ACTIVE_HIGH>;
+		miso-gpios = <&gpio0 3 GPIO_ACTIVE_HIGH>;
+		cs-gpios = <&gpio0 9 GPIO_ACTIVE_LOW>;
+		num-chipselects = <1>;
+
+		ethernet-switch@0 {
+			compatible = "micrel,ks8995";
+			reg = <0>;
+			spi-max-frequency = <50000000>;
+
+			ethernet-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				ethernet-port@0 {
+					reg = <0>;
+					label = "lan1";
+					phy-mode = "mii";
+					phy-handle = <&phy1>;
+				};
+				ethernet-port@1 {
+					reg = <1>;
+					label = "lan2";
+					phy-mode = "mii";
+					phy-handle = <&phy2>;
+				};
+				ethernet-port@2 {
+					reg = <2>;
+					label = "lan3";
+					phy-mode = "mii";
+					phy-handle = <&phy3>;
+				};
+				ethernet-port@3 {
+					reg = <3>;
+					label = "lan4";
+					phy-mode = "mii";
+					phy-handle = <&phy4>;
+				};
+				ethernet-port@4 {
+					reg = <4>;
+					ethernet = <&ethc>;
+					phy-mode = "mii";
+					fixed-link {
+						speed = <100>;
+						full-duplex;
+					};
+				};
+
+			};
+		};
+	};
+
+	soc {
+		bus@c4000000 {
+			flash@0,0 {
+				compatible = "intel,ixp4xx-flash", "cfi-flash";
+				bank-width = <2>;
+				/*
+				 * 8 MB of Flash in 64 0x20000 sized blocks
+				 * mapped in at CS0.
+				 */
+				reg = <0 0x00000000 0x0800000>;
+
+				/* Configure expansion bus to allow writes */
+				intel,ixp4xx-eb-write-enable = <1>;
+
+				partitions {
+					compatible = "redboot-fis";
+					fis-index-block = <0x3f>;
+				};
+			};
+			gpio1: gpio@1,0 {
+				/* MMIO GPIO at CS1 */
+				compatible = "intel,ixp4xx-expansion-bus-mmio-gpio";
+				gpio-controller;
+				#gpio-cells = <2>;
+				big-endian;
+				reg = <1 0x00000000 0x2>;
+				reg-names = "dat";
+				/* Expansion bus settings */
+				intel,ixp4xx-eb-write-enable = <1>;
+
+				pci-reset-hog {
+					gpio-hog;
+					gpios = <7 GPIO_ACTIVE_HIGH>;
+					output-high;
+					line-name = "PCI reset";
+				};
+				pstn-relay-hog-1 {
+					gpio-hog;
+					gpios = <11 GPIO_ACTIVE_HIGH>;
+					output-low;
+					line-name = "PSTN relay control 1";
+				};
+				pstn-relay-hog-2 {
+					gpio-hog;
+					gpios = <12 GPIO_ACTIVE_HIGH>;
+					output-low;
+					line-name = "PSTN relay control 2";
+				};
+			};
+		};
+
+		pci@c0000000 {
+			status = "okay";
+
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0xf800 0 0 7>;
+			interrupt-map =
+			/* IDSEL 13 */
+			<0x6800 0 0 1 &gpio0 8 IRQ_TYPE_LEVEL_LOW>, /* INT A on slot 13 is irq 8 */
+			<0x6800 0 0 2 &gpio0 6 IRQ_TYPE_LEVEL_LOW>, /* INT B on slot 13 is irq 6 */
+			/* IDSEL 14 */
+			<0x7000 0 0 1 &gpio0 8 IRQ_TYPE_LEVEL_LOW>, /* INT A on slot 14 is irq 7 */
+			<0x7000 0 0 2 &gpio0 6 IRQ_TYPE_LEVEL_LOW>, /* INT B on slot 14 is irq 8 */
+			/* IDSEL 15 */
+			<0x7800 0 0 1 &gpio0 8 IRQ_TYPE_LEVEL_LOW>, /* INT A on slot 15 is irq 6 */
+			<0x7800 0 0 2 &gpio0 6 IRQ_TYPE_LEVEL_LOW>; /* INT B on slot 15 is irq 7 */
+		};
+
+		ethb: ethernet@c8009000 {
+			status = "okay";
+			queue-rx = <&qmgr 3>;
+			queue-txready = <&qmgr 20>;
+			phy-mode = "mii";
+
+			mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				/* 1, 2, 3 and 4 are ports on the KS8995 switch */
+				phy1: ethernet-phy@1 {
+					/* LAN1 */
+					reg = <1>;
+				};
+				phy2: ethernet-phy@2 {
+					/* LAN2 */
+					reg = <2>;
+				};
+				phy3: ethernet-phy@3 {
+					/* LAN3 */
+					reg = <3>;
+				};
+				phy4: ethernet-phy@4 {
+					/* LAN4 */
+					reg = <4>;
+				};
+			};
+		};
+
+		ethc: ethernet@c800a000 {
+			status = "okay";
+			queue-rx = <&qmgr 4>;
+			queue-txready = <&qmgr 21>;
+			phy-mode = "mii";
+		};
+	};
+};

-- 
2.50.1


