Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6906C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 05:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIda7uj2B93RTZqxSmU5zPZuWVrR/AcetLX/UZooMaU=; b=xG0AoqJb8hUOpoo0gavfBQ1fIh
	Wcct6TWr5qMZ6sozOtzWsqp4fYJVhrZ/CnhTTULkTpTe1wa+//gfrceCHJ7U2VkboH5v+DK+z06Gn
	QL3pkOQzdjCgRud6DkWAndHdVsneTD3PZdQ9RJuvp64oxgcOYeWbPHJAN6czztk7qSvry3ch9rZWp
	iTEqOKf0MQtt1Plu5bLfInJLJg/7AvJg065/aLwO4sb6clem6ba4gMfA9M2w0TIXVlhEhSHluijFd
	5DDYzAkNQSBctM2znVCxMu/xN88h8v01qsdFMx5W5Wg7U86lV7Ib7hJf5CaScWhKGZu1kY+DulA8R
	CQoh6+ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVn6-0000000Ax9f-0Uld;
	Tue, 14 Jul 2026 05:34:48 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVmy-0000000Ax4g-3GpJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 05:34:44 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-848882fdb18so345581b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 22:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784007280; x=1784612080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FIda7uj2B93RTZqxSmU5zPZuWVrR/AcetLX/UZooMaU=;
        b=bO7V1/QGekmdu1E7bCw2KrrB5KPT+cIef+FT08mZU08MRrETm5HQZz8OVNTb0U/IcK
         D0OlObc/qUhq0gFWvkUiAjzOvIfXMz/3MP8n/jjyJ6TQG7x13hE+0cLyKVwV5J1ZbCw6
         uUWAdGNyUuj2kNLd33jzjoKiyTQryTKEr6pnO3ow7AT2mlkjDUvd8Z+TJwriSN8lU2fx
         6PwYBbHSbW036OHzzTBztQMvsXUmqDWd9Rjb5bXSo++vz/SJKTZRRzAETpNG1tTMApid
         pppmpqewZ7Vf1jEaoy9kyoJn1Q7S7ZOzTxiil1Lw4o9ireWwDSQuhz7KIxW36pBZNnxF
         3qWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784007280; x=1784612080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FIda7uj2B93RTZqxSmU5zPZuWVrR/AcetLX/UZooMaU=;
        b=THhdbkPQVmkOyDtT22VkQl3r1zlwEl36eC6XVP2p4DBfMcL5UzKiE7fcXaVlgHtz8c
         FzqHTktCuHuYnhwQhTuNeRo6O+pt4udszz9YNUnn+2YMXZ15HyaAq3/7iTd+5L1k1lPy
         WM+ExE0lmozsJAPkQxBHgV7Tkw7WLc7fa0nEPCK0iL8OVQ+zYSgAwZb9Z8VOxwvdHCEO
         FuH+PYi7ZTnK7Cay2KpNr5Vz1bUEJz41X6otcTjguXyuSAvbBi2Y0FDIRGPAOy967OS/
         vmX2wUAK4zFjF3BbwTSoerdz8RTCkiNoLhJpihLJozomJEgVQvm1QLCe7SFpIjtZ6cO/
         mwHw==
X-Forwarded-Encrypted: i=1; AHgh+RqYMR2tTgqzqKkNYAdUcK1LRef2ARvlpIex2ug/9ypgSLBHGB6VWOJNTfrLl1M1NMpDXLu9CKvdSttr5GXTzmgY@lists.infradead.org
X-Gm-Message-State: AOJu0YzKLYPKEdaRtZ6uAAFjytLw6Ds0GxJWflTkl0MhhClOyQJn6siZ
	rrLNyvRDS9u6FywDnZprc7QFhCvnT0YpIyRIVbgyE1Y5lpkNOKrz8FmJ
X-Gm-Gg: AfdE7cmlwYR5ilueDBu+ZfvX5eFkltbYl1a/T+Kuhjw3sGvm0x5lSPxuhBfrUUZH7g4
	4CgdC1Uezj/H6Q/C1he4QmkahdILTD1BKbuKr/dO9HV62w/p6TSsMQA0NvaB1nFQVz8As0pRJnC
	repvnVP1wSluqXTxbEeGQTxSNUEl3RYd0YwLaTHljV5DCJmCnUEGsZrzBpFILEQoQuqNf5BZyHe
	ksSU63RMI1TeC1mcc6J8H4tfQkBUL/R6vspfAIOn5cQkU7CrTr0k7B9TIxDmKTOLRibV0FjNKiF
	DBeIjivaYNJ0wTjh96dl3Gi2lKh1BiqxdNDoiMj/WPzAfVL2K9Fz7zh/7I4M4UiOBqWcr+TJl/v
	B7dnmk0ddXbBnQO5LXM9Gktmey/fjUDPrTkXpnFrhEzSUoNgPNmQNio7+9F6CDb1Qc73hV7iVKr
	OMenYDdgLcrJ3OHAwN+wlefM3KPU7p4ns=
X-Received: by 2002:a05:6a21:7107:b0:3bf:5ff5:2b15 with SMTP id adf61e73a8af0-3c110170db9mr13957789637.16.1784007279756;
        Mon, 13 Jul 2026 22:34:39 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b87b92b27sm33047165c88.6.2026.07.13.22.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:34:38 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v8 2/2] arm64: dts: rockchip: add Vicharak Axon board
Date: Tue, 14 Jul 2026 11:04:19 +0530
Message-ID: <20260714053419.265523-3-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714053419.265523-1-hrushirajg23@gmail.com>
References: <20260714053419.265523-1-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_223442_613305_F52A47A2 
X-CRM114-Status: GOOD (  14.83  )
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

Add initial support for the Vicharak Axon single-board computer based on
the Rockchip RK3588 SoC.

The board supports:

- eMMC storage
- microSD card
- Gigabit Ethernet
- HDMI output (dual HDMI)
- HDMI input
- USB 2.0 host ports
- PCIe 2.0 slots
- PCIe 3.0 x4 slot
- SATA
- RTC
- Status LEDs

The board uses an RK806 PMIC and provides the regulators required by
the RK3588 SoC.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588-vicharak-axon.dts     | 860 ++++++++++++++++++
 2 files changed, 861 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 761d82b4f4f2..92114cb757cc 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -213,6 +213,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou-video-demo.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-toybrick-x0.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-turing-rk1.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-vicharak-axon.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-coolpi-4b.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-evb1-v10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-gameforce-ace.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts b/arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts
new file mode 100644
index 000000000000..709b03375f01
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts
@@ -0,0 +1,860 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
+#include "rk3588.dtsi"
+
+/ {
+	model = "Vicharak Axon";
+	compatible = "vicharak,axon", "rockchip,rk3588";
+
+	aliases {
+		mmc0 = &sdmmc;
+		mmc1 = &sdhci;
+		serial2 = &uart2;
+	};
+
+	chosen {
+		stdout-path = "serial2:1500000n8";
+	};
+
+	hdmi0-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi0_con_in: endpoint {
+				remote-endpoint = <&hdmi0_out_con>;
+			};
+		};
+	};
+
+	hdmi1-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi1_con_in: endpoint {
+				remote-endpoint = <&hdmi1_out_con>;
+			};
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		power_led: power-led {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&pca9554 0 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		status_led: status-led {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&pca9554 1 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "none";
+		};
+	};
+
+	vcc12v_dcin: regulator-vcc12v-dcin {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc12v_dcin";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+	};
+
+	vcc3v3_io_expander: regulator-vcc3v3-io-expander {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_io_expander";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	vcc3v3_pcie20_sata30: regulator-vcc3v3-pcie20-sata30 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_pcie20_sata30";
+		regulator-boot-on;
+		regulator-always-on;
+		enable-active-high;
+		gpios = <&gpio0 RK_PA0 GPIO_ACTIVE_HIGH>;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		vin-supply = <&vcc12v_dcin>;
+	};
+
+	vcc3v3_pcie30: regulator-vcc3v3-pcie30 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_pcie30";
+		regulator-boot-on;
+		regulator-always-on;
+		enable-active-high;
+		gpios = <&gpio0 RK_PB2 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc12v_dcin>;
+	};
+
+	vcc5v0_sys: regulator-vcc5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc12v_dcin>;
+	};
+
+	vcc5v0_usb20_host: regulator-vcc5v0-usb20-host {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_usb20_host";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_1v1_nldo_s3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+};
+
+
+&combphy0_ps {
+	status = "okay";
+};
+
+&combphy1_ps {
+	status = "okay";
+};
+
+&combphy2_psu {
+	status = "okay";
+};
+
+&cpu_b0 {
+	cpu-supply = <&vdd_cpu_big0_s0>;
+};
+
+&cpu_b1 {
+	cpu-supply = <&vdd_cpu_big0_s0>;
+};
+
+&cpu_b2 {
+	cpu-supply = <&vdd_cpu_big1_s0>;
+};
+
+&cpu_b3 {
+	cpu-supply = <&vdd_cpu_big1_s0>;
+};
+
+&cpu_l0 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l1 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l2 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l3 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&gmac1 {
+	clock_in_out = "output";
+	phy-handle = <&rgmii_phy>;
+	phy-mode = "rgmii-rxid";
+	phy-supply = <&vcc_3v3_s3>;
+	pinctrl-0 = <&gmac1_rgmii_bus
+				&gmac1_rgmii_clk
+				&gmac1_rx_bus2
+				&gmac1_tx_bus2
+				&gmac1_miim>;
+	pinctrl-names = "default";
+	snps,reset-active-low;
+	snps,reset-delays-us = <0 20000 100000>;
+	snps,reset-gpio = <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
+	rx_delay = <0x00>;
+	tx_delay = <0x43>;
+	status = "okay";
+};
+
+&gpu {
+	mali-supply = <&vdd_gpu_s0>;
+	status = "okay";
+};
+
+&hdmi0 {
+	status = "okay";
+};
+
+&hdmi0_in {
+	hdmi0_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi0>;
+	};
+};
+
+&hdmi0_out {
+	hdmi0_out_con: endpoint {
+		remote-endpoint = <&hdmi0_con_in>;
+	};
+};
+
+&hdmi0_sound {
+	status = "okay";
+};
+
+&hdmi1 {
+	status = "okay";
+};
+
+&hdmi1_in {
+	hdmi1_in_vp1: endpoint {
+		remote-endpoint = <&vp1_out_hdmi1>;
+	};
+};
+
+&hdmi1_out {
+	hdmi1_out_con: endpoint {
+		remote-endpoint = <&hdmi1_con_in>;
+	};
+};
+
+&hdmi1_sound {
+	status = "okay";
+};
+
+&hdmi_receiver {
+	pinctrl-0 = <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_rx_sda &hdmirx_hpd>;
+	pinctrl-names = "default";
+	hpd-gpios = <&gpio4 RK_PB0 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&hdmi_receiver_cma {
+	status = "okay";
+};
+
+&hdptxphy0 {
+	status = "okay";
+};
+
+&hdptxphy1 {
+	status = "okay";
+};
+
+&i2c0 {
+	pinctrl-0 = <&i2c0m2_xfer>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	vdd_cpu_big0_s0: regulator@42 {
+		compatible = "rockchip,rk8602";
+		fcs,suspend-voltage-selector = <1>;
+		reg = <0x42>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <1050000>;
+		regulator-min-microvolt = <550000>;
+		regulator-name = "vdd_cpu_big0_s0";
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	vdd_cpu_big1_s0: regulator@43 {
+		compatible = "rockchip,rk8603", "rockchip,rk8602";
+		fcs,suspend-voltage-selector = <1>;
+		reg = <0x43>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <1050000>;
+		regulator-min-microvolt = <550000>;
+		regulator-name = "vdd_cpu_big1_s0";
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	hym8563: rtc@51 {
+		compatible = "haoyu,hym8563";
+		reg = <0x51>;
+		#clock-cells = <0>;
+		clock-output-names = "hym8563";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&rtc_int>;
+		wakeup-source;
+	};
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1m2_xfer>;
+	status = "okay";
+
+	vdd_npu_s0: regulator@42 {
+		compatible = "rockchip,rk8602";
+		reg = <0x42>;
+		fcs,suspend-voltage-selector = <1>;
+		regulator-name = "vdd_npu_s0";
+		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
+		regulator-min-microvolt = <550000>;
+		regulator-max-microvolt = <950000>;
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+};
+
+&i2c6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c6m0_xfer>;
+	status = "okay";
+
+	pca9554: gpio@24 {
+		compatible = "nxp,pca9554";
+		#gpio-cells = <2>;
+		gpio-controller;
+		reg = <0x24>;
+		vcc-supply = <&vcc3v3_io_expander>;
+	};
+};
+
+&i2s5_8ch {
+	status = "okay";
+};
+
+&i2s6_8ch {
+	status = "okay";
+};
+
+&sdhci {
+	bus-width = <8>;
+	full-pwr-cycle-in-suspend;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	no-sd;
+	no-sdio;
+	non-removable;
+	vmmc-supply = <&vcc_3v3_s3>;
+	vqmmc-supply = <&vcc_1v8_s3>;
+	status = "okay";
+};
+
+&sdmmc {
+	bus-width = <4>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
+	disable-wp;
+	max-frequency = <200000000>;
+	no-mmc;
+	no-sdio;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc_3v3_s3>;
+	vqmmc-supply = <&vccio_sd_s0>;
+	status = "okay";
+};
+
+&spi2 {
+	assigned-clock-rates = <200000000>;
+	assigned-clocks = <&cru CLK_SPI2>;
+	num-cs = <1>;
+	pinctrl-0 = <&spi2m2_cs0 &spi2m2_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	pmic@0 {
+		compatible = "rockchip,rk806";
+		reg = <0>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		interrupt-parent = <&gpio0>;
+		interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_pins>, <&rk806_dvs1_null>,
+				<&rk806_dvs2_null>, <&rk806_dvs3_null>;
+		spi-max-frequency = <1000000>;
+
+		vcc1-supply = <&vcc5v0_sys>;
+		vcc2-supply = <&vcc5v0_sys>;
+		vcc3-supply = <&vcc5v0_sys>;
+		vcc4-supply = <&vcc5v0_sys>;
+		vcc5-supply = <&vcc5v0_sys>;
+		vcc6-supply = <&vcc5v0_sys>;
+		vcc7-supply = <&vcc5v0_sys>;
+		vcc8-supply = <&vcc5v0_sys>;
+		vcc9-supply = <&vcc5v0_sys>;
+		vcc10-supply = <&vcc5v0_sys>;
+		vcc11-supply = <&vcc_2v0_pldo_s3>;
+		vcc12-supply = <&vcc5v0_sys>;
+		vcc13-supply = <&vcc_1v1_nldo_s3>;
+		vcc14-supply = <&vcc_1v1_nldo_s3>;
+		vcca-supply = <&vcc5v0_sys>;
+
+		rk806_dvs1_null: dvs1-null-pins {
+			pins = "gpio_pwrctrl1";
+			function = "pin_fun0";
+		};
+
+		rk806_dvs2_null: dvs2-null-pins {
+			pins = "gpio_pwrctrl2";
+			function = "pin_fun0";
+		};
+
+		rk806_dvs3_null: dvs3-null-pins {
+			pins = "gpio_pwrctrl3";
+			function = "pin_fun0";
+		};
+
+		regulators {
+			vdd_gpu_s0: dcdc-reg1 {
+				regulator-boot-on;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <950000>;
+				regulator-ramp-delay = <12500>;
+				regulator-name = "vdd_gpu_s0";
+				regulator-enable-ramp-delay = <400>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_cpu_lit_s0: dcdc-reg2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <950000>;
+				regulator-ramp-delay = <12500>;
+				regulator-name = "vdd_cpu_lit_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_log_s0: dcdc-reg3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <675000>;
+				regulator-max-microvolt = <750000>;
+				regulator-ramp-delay = <12500>;
+				regulator-name = "vdd_log_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <750000>;
+				};
+			};
+
+			vdd_vdenc_s0: dcdc-reg4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <950000>;
+				regulator-ramp-delay = <12500>;
+				regulator-name = "vdd_vdenc_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_ddr_s0: dcdc-reg5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <675000>;
+				regulator-max-microvolt = <900000>;
+				regulator-ramp-delay = <12500>;
+				regulator-name = "vdd_ddr_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <850000>;
+				};
+			};
+
+			vdd2_ddr_s3: dcdc-reg6 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-name = "vdd2_ddr_s3";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			vcc_2v0_pldo_s3: dcdc-reg7 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <2000000>;
+				regulator-max-microvolt = <2000000>;
+				regulator-name = "vdd_2v0_pldo_s3";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <2000000>;
+				};
+			};
+
+			vcc_3v3_s3: dcdc-reg8 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc_3v3_s3";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+				};
+			};
+
+			vddq_ddr_s0: dcdc-reg9 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-name = "vddq_ddr_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_1v8_s3: dcdc-reg10 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc_1v8_s3";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			avcc_1v8_s0: pldo-reg1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "avcc_1v8_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_1v8_s0: pldo-reg2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc_1v8_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			avdd_1v2_s0: pldo-reg3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-name = "avdd_1v2_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_3v3_s0: pldo-reg4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc_3v3_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vccio_sd_s0: pldo-reg5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vccio_sd_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			pldo6_s3: pldo-reg6 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "pldo6_s3";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vdd_0v75_s3: nldo-reg1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <750000>;
+				regulator-max-microvolt = <750000>;
+				regulator-name = "vdd_0v75_s3";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <750000>;
+				};
+			};
+
+			vdd_ddr_pll_s0: nldo-reg2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <850000>;
+				regulator-name = "vdd_ddr_pll_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <850000>;
+				};
+			};
+
+			avdd_0v75_s0: nldo-reg3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <837500>;
+				regulator-max-microvolt = <837500>;
+				regulator-name = "avdd_0v75_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_0v85_s0: nldo-reg4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <850000>;
+				regulator-name = "vdd_0v85_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_0v75_s0: nldo-reg5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <750000>;
+				regulator-max-microvolt = <750000>;
+				regulator-name = "vdd_0v75_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+		};
+	};
+};
+
+&mdio1 {
+	rgmii_phy: phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x1>;
+	};
+};
+
+&pcie2x1l0 {
+	reset-gpios = <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_0_rst>;
+	vpcie3v3-supply = <&vcc3v3_pcie20_sata30>;
+	status = "okay";
+};
+
+&pcie2x1l1 {
+	reset-gpios = <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_1_rst>;
+	vpcie3v3-supply = <&vcc3v3_pcie20_sata30>;
+	status = "okay";
+};
+
+&pcie2x1l2 {
+	status = "disabled";
+};
+
+&pcie30phy {
+	status = "okay";
+};
+
+&pcie3x4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie3_reset>;
+	reset-gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc3v3_pcie30>;
+	status = "okay";
+};
+
+&pinctrl {
+
+	hdmirx {
+		hdmirx_hpd: hdmirx-5v-detection {
+			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+
+	hym8563 {
+		rtc_int: rtc-int {
+			rockchip,pins =
+				<0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	pcie2 {
+		pcie2_0_rst: pcie2-0-rst {
+			rockchip,pins =
+				<4 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		pcie2_1_rst: pcie2-1-rst {
+			rockchip,pins =
+				<4 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	pcie3 {
+		pcie3_reset: pcie3-reset {
+			rockchip,pins =
+				<4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+};
+
+&saradc {
+	vref-supply = <&avcc_1v8_s0>;
+	status = "okay";
+};
+
+&sata0 {
+	status = "okay";
+};
+
+&tsadc {
+	status = "okay";
+};
+&u2phy2 {
+	status = "okay";
+};
+
+&u2phy2_host {
+	phy-supply = <&vcc5v0_usb20_host>;
+	status = "okay";
+};
+
+&u2phy3 {
+	status = "okay";
+};
+
+&u2phy3_host {
+	phy-supply = <&vcc5v0_usb20_host>;
+	status = "okay";
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2m0_xfer>;
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
+&vop {
+	status = "okay";
+};
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vp0 {
+	vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
+		remote-endpoint = <&hdmi0_in_vp0>;
+	};
+};
+
+&vp1 {
+	vp1_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI1>;
+		remote-endpoint = <&hdmi1_in_vp1>;
+	};
+};
-- 
2.47.3


