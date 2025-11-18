Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC1CCEE327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 15:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ej91NMv9w9oCSCPF932+VpXvkqbrElkojZRxU3T/abU=; b=QAm6kstQEQHc5BAFl4COcKle7H
	v+iYDzjHerKqbzhB+1t+zHWCBXYxH1gsalQIEhEIP5Ztb9VBMkje6NW7Sv3OD3VoDML51tfO0YPUV
	3p92Eg8imGdat9tzckCGc2hbadGaIOdREfbioarpRObD/oUnXWlNqzWDjd3ebWgxFZ5ua2bNIbZKN
	p4zv5YABSlZ6O+WvaBxbRVS/Uhq/nfWNrkfbcvc7631abEBVmW9Q++RzRe3V/fSXSzW67xyw+Atxx
	zapIkwzYOesp+qt3pvrwvI5m4AH08gjfOXTklNTU3Dw4ZLbzBW+wczdNiI07iucPKSAIye/eCSHPe
	PHAf84CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLO4j-00000000f2B-1l8a;
	Tue, 18 Nov 2025 15:57:01 +0000
Received: from cow.ash.relay.mailchannels.net ([23.83.222.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLO4Z-00000000eyi-1Qcf;
	Tue, 18 Nov 2025 15:56:55 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id DB40E8A2814;
	Tue, 18 Nov 2025 15:56:47 +0000 (UTC)
Received: from de-fra-smtpout8.hostinger.io (100-96-47-41.trex-nlb.outbound.svc.cluster.local [100.96.47.41])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 713328A13D5;
	Tue, 18 Nov 2025 15:56:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1763481407;
	b=VR1UZF9GQXoGzXg8kQYwLbf737LIsX0TD7UPM2nQmA/u7CuoQa/LS8M03BvP13fEX/TXu2
	wGg0/BbL4uyYcFADaPOnB+Ll+fPhsmW36jeuZOIOJi+0vfTz3Bay8K8FXMLp7iqQ90FDg5
	Li/zaCIYEJVTqqczeTEe9CeX2q9OmzbKR/NwqO1LupPjdO9OY8FwQQAT8ZBr/HvsUJtIOA
	VGH+YOTlfnvAiuv3c3OotQDBbSxRR2lTXX2NEBYbSftqjJHjNpWumA2cIwddhC4+v0rjst
	cfuGmTpIdPHSHDP1u5ReKZzR5BVLN1aMuj9a44mbUah7jt4u2DU+gs+f7eD1EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1763481407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=Ej91NMv9w9oCSCPF932+VpXvkqbrElkojZRxU3T/abU=;
	b=25Z1yG4iTeyL50vDDuTRtO1EUWJR5SFwpwSDLg1fW9rvhH9rFS9XLzmR8bCfqz2UFx46qF
	WWbpoaK3K6CSZ1Wj8WaTR9RbTu5+MXWFS8soaM1UhUxhILiqCGmPQzUQl+WlSqrM852TBV
	YBphwtG2q9Ld7m3FCQhreV2XMRJrvzzqGAkJOdycLJPguW/8qFQWDsZiIvEG39o0d5c/E0
	HNLdU1AwEhfvoIwbo9giG6gZfCHllN7WRmVBrf+j4omENkDoIIMRXt69IlNNlWMmkBHvgt
	0WYwkP/KCCfolrxCtWdqdFhXkdQgPkQRgiDlw+cLPJ/JrSJmh/rxp11jUmOWPQ==
ARC-Authentication-Results: i=1;
	rspamd-55b59744f-bdkvm;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Unite-Spicy: 1774ef6b09216cbf_1763481407684_386708523
X-MC-Loop-Signature: 1763481407684:3754530928
X-MC-Ingress-Time: 1763481407684
Received: from de-fra-smtpout8.hostinger.io (de-fra-smtpout8.hostinger.io
 [148.222.55.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.47.41 (trex/7.1.3);
	Tue, 18 Nov 2025 15:56:47 +0000
Received: from [127.0.1.1] (unknown [IPv6:2001:861:4450:d360:70a8:5f6b:5afe:c6b5])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4d9q3v2nKTz3wgl;
	Tue, 18 Nov 2025 15:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1763481403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ej91NMv9w9oCSCPF932+VpXvkqbrElkojZRxU3T/abU=;
	b=dv+EvDmqnld3cQ29otn2WWc37vXptOZj0v2w4UHqRXgaNS4Rj9VhweC6fdu8JYQjT+Cjk+
	5XzmLZU+vuRxwwYrRT2eu3U4+P2fXWaCo6ZoW/0ZGKcg0shPFRJdXxOpFza5uC9KU4PK9u
	ULekPBZT1E/v7ENF/tNu3ph8Yil692GEeNM35AMB7SxsXUpkIWh3ftHt7Ipw1W8hY9dO9n
	44Uj/4wdN1i5U6PFLx+5f/p5pW5p9ibUu5pEAesb9XvLUBW+ObC0xm2slnFi5rpkV+JA5Z
	7zX6I0GkXrKgCjvza0FEmzSbYh+6khFuuKD3Yk9P+rcLKZI7kDsqA7NofyV6hg==
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH v3 2/2] arm64: dts: rockchip: Add Asus Tinker Board 3 and
 3S device tree
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-tinker3-v3-2-2903693f2ebb@rootcommit.com>
References: <20251118-tinker3-v3-0-2903693f2ebb@rootcommit.com>
In-Reply-To: <20251118-tinker3-v3-0-2903693f2ebb@rootcommit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>
X-Mailer: b4 0.13.0
Date: Tue, 18 Nov 2025 15:56:43 +0000 (UTC)
X-CM-Envelope: MS4xfNIKUq79oaWSRWIdFfE3iky/oJgrE3JhNxdE1cbDkUhXZ060Woh+W5WM0HQ5KzP8Zbzy116PtY+cGdI0naz6Omh+kLa0FYen5HBKPN1+K9/+rGfe1GZ9 CCgvlSAEubYFzF8ZVqZ+D/bTrYoIe25T060f5L9LoLOhan1+MI+azu2CM/pToTrze02eQZ7N8fmM8e7ldWF7ZyWxVEpKyXUCMKWnT/Q62GkJg+dRIrjgfn6l G9jlTVtcAhbcYK3ntO456H/La3M7zCR6K5XVVJ4jSUwJejnC8sQmDtKx8gINyQJXyBiCoxEkyhL9nzBaC66iAQG8EHuDcXrXDY3+enTuTbkOzS1WloYBIFZP 1XzSce/eJUrvCZeM1I9eULL7et2S3tYCG4oDC209f8F80BVlnF01hL78V8LGImFTVmSnu3mbpYgmdx9ZX8pn95NZFQvITQ6HzDlyq8lYmfAuapimVv29qaWA vTlLZeyYX8z2zUlVxk/d/FdACn7ldOLrtf9ZIZbVXpZxmk5zpt8ZzoJQD2F24d226r4kIUc5C0vMs58v/Eqb1II5uYfcporyeLgMArc1Tu0G7SEUETKuaiHE YP/k+RLt53rDkOSBcsUDxLu8sMy2LgCIrp38G4P1N5hz4g==
X-CM-Analysis: v=2.4 cv=etGNzZpX c=1 sm=1 tr=0 ts=691c973b a=Ph0lQeLb5o4XXq6kAtNexw==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=-Yt9tNsTAAAA:8 a=d70CFdQeAAAA:8 a=7lbA09X1q5Trck-OewAA:9 a=QEXdDO2ut3YA:10 a=qPQde0g9OtMA:10 a=HTceBwxjnJgA:10 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_075651_628673_04DEF2A7 
X-CRM114-Status: GOOD (  13.20  )
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

Add initial device tree support for Asus Tinker Board 3 [1] and 3S [2],
which are SBCs based on the Rockchip 3566 SoC.

The "3S" version ("S" for "storage") just adds a 16 GB eMMC
and a "mask ROM" DIP switch (to mask the eMMC and enter "Mask ROM"
mode for recovery) to the "3" version.

This adds support for:
- Debug UART (/dev/ttyS2)
- SD card (/dev/mmcblk1)
- eMMC (/dev/mmcblk0, only on Tinker Board 3S)
- I2C:
  - i2c0 (internal bus with a PMIC and regulators)
  - i2c2 (internal bus with an at24 eeprom and an RTC device)
- USB 2.0 ports
- 2 GPIO LEDS

[1] https://tinker-board.asus.com/series/tinker-board-3.html
[2] https://tinker-board.asus.com/series/tinker-board-3s.html

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 arch/arm64/boot/dts/rockchip/Makefile              |   2 +
 .../boot/dts/rockchip/rk3566-tinker-board-3.dts    |  14 ++
 .../boot/dts/rockchip/rk3566-tinker-board-3.dtsi   | 280 +++++++++++++++++++++
 .../boot/dts/rockchip/rk3566-tinker-board-3s.dts   |  30 +++
 4 files changed, 326 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index ad684e3831bc..e0d8b9ed176d 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -130,6 +130,8 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-lubancat-1.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-nanopi-r3s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-bigtreetech-cb2-manta.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-bigtreetech-pi2.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-tinker-board-3.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-tinker-board-3s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-bpi-r2-pro.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-evb1-v10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-fastrhino-r66s.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3.dts b/arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3.dts
new file mode 100644
index 000000000000..af11faff5564
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Michael Opdenacker <michael.opdenacker@rootcommit.com>
+ */
+
+/dts-v1/;
+
+#include "rk3566-tinker-board-3.dtsi"
+
+/ {
+	model = "Asus Tinker Board 3";
+	compatible = "asus,rk3566-tinker-board-3", "rockchip,rk3566";
+};
+
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3.dtsi
new file mode 100644
index 000000000000..8544d56031f2
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3.dtsi
@@ -0,0 +1,280 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Michael Opdenacker <michael.opdenacker@rootcommit.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
+#include "rk3566.dtsi"
+
+/ {
+	aliases {
+		i2c0 = &i2c0;
+		i2c2 = &i2c2;
+		mmc1 = &sdmmc0;
+		serial2 = &uart2;
+	};
+
+	chosen {
+		stdout-path = "serial2:1500000n8";
+	};
+
+	gpio_leds: gpio-leds {
+		compatible = "gpio-leds";
+
+		act-led {
+			gpios = <&gpio0 RK_PD4 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger="mmc1";
+		};
+
+		rsv-led {
+			gpios = <&gpio0 RK_PD6 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger="none";
+		};
+	};
+
+	vcc3v3_sys: regulator-3v3-vcc-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc5v0_sys: regulator-5v0-vcc-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	vcc5v0_usb_host: regulator-5v0-vcc-usb-host {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio0 RK_PA6 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_host_pwren_h>;
+		regulator-name = "vcc5v0_usb_host";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&cpu1 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&cpu2 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&cpu3 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&i2c0 {
+	status = "okay";
+
+	rk809: pmic@20 {
+		compatible = "rockchip,rk809";
+		reg = <0x20>;
+		assigned-clocks = <&cru I2S1_MCLKOUT_TX>;
+		assigned-clock-parents = <&cru CLK_I2S1_8CH_TX>;
+		#clock-cells = <1>;
+		clocks = <&cru I2S1_MCLKOUT_TX>;
+		clock-names = "mclk";
+		clock-output-names = "rk809-clkout1", "rk809-clkout2";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA3 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_int_l>, <&i2s1m0_mclk>;
+		#sound-dai-cells = <0>;
+		system-power-controller;
+		wakeup-source;
+
+		vcc1-supply = <&vcc3v3_sys>;
+		vcc2-supply = <&vcc3v3_sys>;
+		vcc3-supply = <&vcc3v3_sys>;
+		vcc4-supply = <&vcc3v3_sys>;
+		vcc5-supply = <&vcc3v3_sys>;
+		vcc6-supply = <&vcc3v3_sys>;
+		vcc7-supply = <&vcc3v3_sys>;
+		vcc8-supply = <&vcc3v3_sys>;
+		vcc9-supply = <&vcc3v3_sys>;
+
+		regulators {
+			vcc_1v8: DCDC_REG5 {
+				regulator-name = "vcc_1v8";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_3v3: SWITCH_REG1 {
+				regulator-name = "vcc_3v3";
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc3v3_sd: SWITCH_REG2 {
+				regulator-name = "vcc3v3_sd";
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vccio_sd: LDO_REG5 {
+				regulator-name = "vccio_sd";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+		};
+	};
+
+	vdd_cpu: regulator@40 {
+		compatible = "silergy,syr827";
+		reg = <0x40>;
+		fcs,suspend-voltage-selector = <1>;
+		regulator-name = "vdd_cpu";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <830000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc3v3_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c08";
+		reg = <0x50>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&tb3_eeprom>;
+		status = "okay";
+	};
+
+	rtc_isl1208: rtc@6f {
+		compatible = "isil,isl1208";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_externalrtc_reg>;
+		interrupt-names = "irq";
+		interrupts-extended = <&gpio0 RK_PD3 IRQ_TYPE_EDGE_FALLING>;
+		reg = <0x6f>;
+		status = "okay";
+	};
+};
+
+&pinctrl {
+	pmic {
+		pmic_int_l: pmic-int-l {
+			rockchip,pins = <0 RK_PA3 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	usb {
+		usb_host_pwren_h: usb-host-pwren-h {
+			rockchip,pins = <0 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		usb_otg_pwren_h: usb-otg-pwren-h {
+			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	rtc {
+		pinctrl_externalrtc_reg: externalrtcreggrp {
+			rockchip,pins = <0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	eeprom {
+		tb3_eeprom: tb3-eeprom {
+			rockchip,pins = <3 RK_PC1 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+};
+
+&sdmmc0 {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	disable-wp;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc0_bus4 &sdmmc0_clk &sdmmc0_cmd &sdmmc0_det>;
+	vmmc-supply = <&vcc3v3_sd>;
+	vqmmc-supply = <&vccio_sd>;
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&usb_host0_ehci {
+	status = "okay";
+};
+
+&usb_host0_ohci {
+	status = "okay";
+};
+
+&usb_host1_ehci {
+	status = "okay";
+};
+
+&usb_host1_ohci {
+	status = "okay";
+};
+
+&usb2phy0 {
+	status = "okay";
+};
+
+&usb2phy0_host {
+	phy-supply = <&vcc5v0_usb_host>;
+	status = "okay";
+};
+
+&usb2phy1 {
+	status = "okay";
+};
+
+&usb2phy1_host {
+	phy-supply = <&vcc5v0_usb_host>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3s.dts b/arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3s.dts
new file mode 100644
index 000000000000..3624ebc8a26f
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3s.dts
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Michael Opdenacker <michael.opdenacker@rootcommit.com>
+ */
+
+/dts-v1/;
+
+#include "rk3566-tinker-board-3.dtsi"
+
+/ {
+	model = "Asus Tinker Board 3S";
+	compatible = "asus,rk3566-tinker-board-3s", "rockchip,rk3566";
+
+	aliases {
+		mmc0 = &sdhci;
+	};
+};
+
+&sdhci {
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	max-frequency = <200000000>;
+	mmc-hs200-1_8v;
+	non-removable;
+	pinctrl-names = "default";
+	pinctrl-0 = <&emmc_bus8 &emmc_clk &emmc_cmd &emmc_datastrobe>;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vcc_1v8>;
+	status = "okay";
+};

-- 
2.43.0


