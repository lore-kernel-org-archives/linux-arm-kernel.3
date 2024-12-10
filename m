Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690C2E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 16:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kZFRjL1raSStAY48Eod2WxBIOIxgjitaNswgq++gHSI=; b=0Lf8BMi0ERyxxGE5r1gliQMqGb
	lc8bV3kuNlamAhm6tJEu6oAwuHNfohIJlBM60N+tKDBHhqP0Q87JP1VIDn9+lLRHMSmuRChrkJJcf
	IIA1p1LEEqfIf4T+lsnzpDxDtwEsCDwOvUevqsSGh5c7ZhGUavZWMN8Uw28m2u0T70HnrItZroYaz
	L+XeviWcmY/NXF65B1PVG8zC95apitzXBw/aLBg64C0XjEaUDY+MPV8nVRIuLsIGMIGUWWCVdGaE/
	GHh5FUqfiqkbdHdrHasvHeGO+qqSUQgeLmF3ra1rA16sFZhz/+7+5gg4ghWNdY504pxnC9vdgPO8Z
	mPgmOJiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL35c-0000000C5xr-3GmQ;
	Tue, 10 Dec 2024 16:28:00 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL33Y-0000000C5Nc-0cnZ;
	Tue, 10 Dec 2024 16:25:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733847946;
	bh=DlNs/Z4Wd6wIp6vI6wjMskh6Esgevs4QkI/cSvEJJSs=;
	h=From:To:Cc:Subject:Date:From;
	b=bXXp6rm9AXEaFBxahXCF+gPwXndo825SOm1iDJYFmM1GEOtIUMq9qsCoxjRZd2ShM
	 4hHPOjn1L96XZ1+z/H1AQ24blDnKpxUX0IwopFEfMWVUIHCbPutRcXKQ7pMtqnb97c
	 jDDNWdWU1tn52D91OWfO6DkWTPNVyBIyPfbDyVAtX60z/ZKh7PjLu56BEKrm1LHJD3
	 uYhxzsh0KC4JmTkTcc76olQwyb0lt0Pi2r1hNq/fiXFUAxIHEGMRb+iv5ZXmxyIbQP
	 lp2qL28j6B8IfGXpEeHOlsoxIJ2OiHxbBujAmosxZdKUDWJRA77kkx5IQrhPjWKakv
	 D/BguEEC4iPMw==
Received: from jupiter.universe (dyndsl-091-248-190-127.ewe-ip-backbone.de [91.248.190.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 932C317E3781;
	Tue, 10 Dec 2024 17:25:46 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 2726248CC8A; Tue, 10 Dec 2024 17:25:46 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com
Subject: [PATCH v2 1/1] arm64: dts: rockchip: rk3588-evb1: add WLAN controller
Date: Tue, 10 Dec 2024 17:24:04 +0100
Message-ID: <20241210162452.116767-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_082552_371568_2D341262 
X-CRM114-Status: GOOD (  10.79  )
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

The RK3588 EVB1 has an onboard AP6275P WLAN/BT module. This adds
support for the WLAN side, which is connected to the second
PCIe bus. The Bluetooth side is connected to UART and handled
separately.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Changes since PATCHv1:
 * rebase to latest for-next branch from Heiko
 * add regulator- prefix to regulator nodes
 * sort properties alphabetically in regulator nodes
 * sort regulator nodes alphabetically
---
 .../boot/dts/rockchip/rk3588-evb1-v10.dts     | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
index d6e464cdc536..ba49f0bbaac6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
@@ -206,6 +206,28 @@ vcc3v3_pcie30: regulator-vcc3v3-pcie30 {
 		pinctrl-0 = <&vcc3v3_pcie30_en>;
 	};
 
+	vcc3v3_pciewl_vbat: regulator-vcc3v3-pciewl-vbat {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-name = "wlan-vbat";
+		vin-supply = <&vcc_3v3_s0>;
+	};
+
+	vcc3v3_wlan: regulator-vcc3v3-wlan {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio3 RK_PB1 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_pwren>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-name = "wlan-en";
+		vin-supply = <&vcc3v3_pciewl_vbat>;
+	};
+
 	vcc5v0_host: regulator-vcc5v0-host {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc5v0_host";
@@ -249,12 +271,26 @@ vcc5v0_usb: regulator-vcc5v0-usb {
 		regulator-max-microvolt = <5000000>;
 		vin-supply = <&vcc5v0_usbdcin>;
 	};
+
+	vccio_wl: regulator-vccio-wl {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-name = "wlan-vddio";
+		vin-supply = <&vcc_1v8_s0>;
+	};
 };
 
 &combphy0_ps {
 	status = "okay";
 };
 
+&combphy1_ps {
+	status = "okay";
+};
+
 &combphy2_psu {
 	status = "okay";
 };
@@ -440,6 +476,30 @@ rgmii_phy: ethernet-phy@1 {
 	};
 };
 
+&pcie2x1l0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_0_rst>, <&pcie2_0_wake>, <&pcie2_0_clkreq>, <&wifi_host_wake_irq>;
+	reset-gpios = <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc3v3_wlan>;
+	status = "okay";
+
+	pcie@0,0 {
+		reg = <0x200000 0 0 0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+		device_type = "pci";
+		bus-range = <0x20 0x2f>;
+
+		wifi: wifi@0,0 {
+			compatible = "pci14e4,449d";
+			reg = <0x210000 0 0 0 0>;
+			clocks = <&hym8563>;
+			clock-names = "lpo";
+		};
+	};
+};
+
 &pcie2x1l1 {
 	reset-gpios = <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default";
@@ -494,6 +554,18 @@ hym8563_int: hym8563-int {
 	};
 
 	pcie2 {
+		pcie2_0_rst: pcie2-0-rst {
+			rockchip,pins = <4 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		pcie2_0_wake: pcie2-0-wake {
+			rockchip,pins = <4 RK_PA4 4 &pcfg_pull_none>;
+		};
+
+		pcie2_0_clkreq: pcie2-0-clkreq {
+			rockchip,pins = <4 RK_PA3 4 &pcfg_pull_none>;
+		};
+
 		pcie2_1_rst: pcie2-1-rst {
 			rockchip,pins = <4 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
@@ -524,6 +596,16 @@ usbc0_int: usbc0-int {
 			rockchip,pins = <3 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
+
+	wlan {
+		wifi_host_wake_irq: wifi-host-wake-irq {
+			rockchip,pins = <3 RK_PA7 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+
+		wifi_pwren: wifi-pwren {
+			rockchip,pins = <3 RK_PB1 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
 };
 
 &pwm2 {
-- 
2.45.2


