Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E8CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 16:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AbDqHIPXfrCW7CMVqiAcvylC4uHIOElu8pVYGTvZe30=; b=ScqUXROjGF/gvakOn6q9z6+OTj
	zNLV4dYXnT0NTtDidmCtWNGNRnMx/yCxEtcfoGo9s1Ahadng7JlSDzJ6vbB8Ue51lguggLkrUEsZ6
	39jSHCMUVpJ5tP7NGSoF3GOgGwb727aNxBBG9q7hisYKeGesOWGR8iGLr8QwfKse9woiFXox83zix
	DTS13ZMRytjfDkCMSO7YNJoLQpfz21ACitqaNhGIlZgTqS6J8myFNbHNkTHM1h7x3SpruOgrezWwy
	EzKMRdFXSg+lhimMwc0fi92mwcWPk3YuOx5H7elv50FOeONTEwHx11qxfCeei4UOzpJWU7BYLV+gC
	dtwyS8ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfdd-00000005R2Y-0cdH;
	Fri, 20 Dec 2024 16:14:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfcU-00000005QuB-21Xb;
	Fri, 20 Dec 2024 16:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=AbDqHIPXfrCW7CMVqiAcvylC4uHIOElu8pVYGTvZe30=; b=F/xNgjcG0UaXCjrlCRJzZpBC2w
	mMiyM4qZaoFo9+3O0OXQOQn5JHkMBYYE7UDSXePRhh/rKCTHOwswCk9kMK7/9dQAxTefIS75WBBgP
	qIWigCvKtUT3JMoyFwZq/BOKl8/K/ozKLlLUjL/G3nUtHgUNcADEz5LQZTlWlwUvtduREzjnL1bZx
	U82kAZ6nT1HTxFPAGknkHUiLH0C6cfAH1WRtfgvHwvH0j2BC9Qopb8/GqVIvpXV8NYef+tE1ESHdR
	Z354Q2FKzNY5QzjNIPg9BvXQb3uTXTrG4t29+vj9/c8gXQp6ROw6wHJpJ6jbSwI2XY11yR/eVvfEJ
	WixGrGKw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfcR-00000005i1N-2RKl;
	Fri, 20 Dec 2024 16:12:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5155F5C5CDD;
	Fri, 20 Dec 2024 16:12:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D146FC4CECD;
	Fri, 20 Dec 2024 16:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734711168;
	bh=lT+NvKXEt+wDw547wMVflj0Ny9W3OCFAz0S4kRCQXyc=;
	h=From:To:Cc:Subject:Date:From;
	b=Ob0iH/5cVvLnjtYxJS4SzD2U2vUzqvczNK6PKb13onAJa1JdH2JcBa/LUx469WpFV
	 51MkXpZbQLTKD2tXqJUL6GpN9flX2/kHmqo84lzpxZ1HR3rTAvWCy9jLDfSlg0F1CC
	 F+m1C+/9J6W5eoqZ/ILzoUxCsXolwifQfCcRcG/WJFyxQzBE4a/R/imyrQb6TSOIby
	 mLerfWhHLLnG9lL5nd9G884coJy3ORjfeVZYgjR2mEb91uFjTXZDoasXy/B9vCsZEb
	 vxVdLGM3UTr08eUKoNW7QrXuIwg/Ib/i563jV3g2G10T9QTm7I60ihfU7zHumgN6z4
	 Ds0nAp7zXUkjA==
Received: by wens.tw (Postfix, from userid 1000)
	id DBAD15FB8F; Sat, 21 Dec 2024 00:12:44 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Chen-Yu Tsai <wens@csie.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>
Subject: [PATCH v2] arm64: dts: rockchip: orangepi-5-plus: Enable USB 3.0 ports
Date: Sat, 21 Dec 2024 00:12:40 +0800
Message-Id: <20241220161240.109253-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_161251_967229_9991D934 
X-CRM114-Status: GOOD (  11.88  )
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

From: Chen-Yu Tsai <wens@csie.org>

The Orange Pi 5 Plus has its first USB 3.0 interface on the SoC wired
directly to the USB type C port next to the MASKROM button, and the
second interface wired to a USB 3.0 hub which in turn is connected to
the USB 3.0 host ports on the board, as well as the USB 2.0 connection
on the M.2 E-key slot.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>

---
Changes since v1:
- Dropped source current to 1.4A
- Dropped sink current to 10mA, since it doesn't actually sink current
- Added try-power-role
- Added newline before endpoint device nodes in USB connector node
---
 .../dts/rockchip/rk3588-orangepi-5-plus.dts   | 133 ++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
index 9f5a38b290bf..000d353645a9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
@@ -218,6 +218,18 @@ vcc5v0_sys: regulator-vcc5v0-sys {
 		regulator-max-microvolt = <5000000>;
 	};
 
+	vbus5v0_typec: vbus-typec-regulator {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&typec5v_pwren>;
+		regulator-name = "vbus5v0_typec";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
 	vcc5v0_usb20: regulator-vcc5v0-usb20 {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -344,6 +356,57 @@ &i2c6 {
 	clock-frequency = <400000>;
 	status = "okay";
 
+	usbc0: usb-typec@22 {
+		compatible = "fcs,fusb302";
+		reg = <0x22>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PD3 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usbc0_int>;
+		vbus-supply = <&vbus5v0_typec>;
+		status = "okay";
+
+		usb_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+			source-pdos = <PDO_FIXED(5000, 1400, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 10, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <10>;
+			try-power-role = "source";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usbc0_hs: endpoint {
+						remote-endpoint = <&usb_host0_xhci_drd_sw>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usbc0_ss: endpoint {
+						remote-endpoint = <&usbdp_phy0_typec_ss>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usbc0_sbu: endpoint {
+						remote-endpoint = <&usbdp_phy0_typec_sbu>;
+					};
+				};
+			};
+		};
+	};
+
 	hym8563: rtc@51 {
 		compatible = "haoyu,hym8563";
 		reg = <0x51>;
@@ -485,6 +548,16 @@ vcc5v0_usb20_en: vcc5v0-usb20-en {
 			rockchip,pins = <3 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
+
+	usb-typec {
+		usbc0_int: usbc0-int {
+			rockchip,pins = <0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		typec5v_pwren: typec5v-pwren {
+			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
 };
 
 &pwm2 {
@@ -876,6 +949,23 @@ &tsadc {
 	status = "okay";
 };
 
+&u2phy0 {
+	status = "okay";
+};
+
+&u2phy0_otg {
+	status = "okay";
+};
+
+&u2phy1 {
+	status = "okay";
+};
+
+&u2phy1_otg {
+	phy-supply = <&vcc5v0_sys>;
+	status = "okay";
+};
+
 &u2phy2 {
 	status = "okay";
 };
@@ -904,6 +994,33 @@ &uart9 {
 	status = "okay";
 };
 
+&usbdp_phy0 {
+	mode-switch;
+	orientation-switch;
+	sbu1-dc-gpios = <&gpio4 RK_PA6 GPIO_ACTIVE_HIGH>;
+	sbu2-dc-gpios = <&gpio4 RK_PA7 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		usbdp_phy0_typec_ss: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&usbc0_ss>;
+		};
+
+		usbdp_phy0_typec_sbu: endpoint@1 {
+			reg = <1>;
+			remote-endpoint = <&usbc0_sbu>;
+		};
+	};
+};
+
+&usbdp_phy1 {
+	status = "okay";
+};
+
 &usb_host0_ehci {
 	status = "okay";
 };
@@ -912,6 +1029,17 @@ &usb_host0_ohci {
 	status = "okay";
 };
 
+&usb_host0_xhci {
+	usb-role-switch;
+	status = "okay";
+
+	port {
+		usb_host0_xhci_drd_sw: endpoint {
+			remote-endpoint = <&usbc0_hs>;
+		};
+	};
+};
+
 &usb_host1_ehci {
 	status = "okay";
 };
@@ -920,6 +1048,11 @@ &usb_host1_ohci {
 	status = "okay";
 };
 
+&usb_host1_xhci {
+	dr_mode = "host";
+	status = "okay";
+};
+
 &vop_mmu {
 	status = "okay";
 };
-- 
2.39.5


