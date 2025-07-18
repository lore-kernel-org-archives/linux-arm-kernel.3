Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3098C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 06:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8L/77Mn5XZ7DUkt0B8rv59NyXI2YcZ6+wGLcoXpyR/Q=; b=nP3ptVBVcvfLtltNcsgozjPCcy
	Et/3FiKgFepXCe+MmPjZkYTCyEsAIGsTu0Qf0YLhl8ImzmDifDskeCtWaGvsBF3FrAOUuBX8Jlkyc
	C/srx2huyepWr6MOFeoiklxk8bT+yC3lqql48+7LKCrGsmf1GhVjry/RWs06G/47RhtN7v1qL5NdE
	y0lqpDM3vCl8aYNI5lTryI1pfCVaIHIEA9L8z9kUfXK3OdyfJGa3SSEiJfybHeNUWx53Ek3Yy7dwm
	LrQ0AmDeMcUYAiRV3w7lgTlC9TpSr3jYW8Br+Zg3UvaKBgfiEBeZ3PIPZasycOly6s14wHMUAooUK
	Gv5LsSqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucenu-0000000BnYr-2Dnh;
	Fri, 18 Jul 2025 06:42:46 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uceZN-0000000Bllk-2pKp;
	Fri, 18 Jul 2025 06:27:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1752820012;
	bh=8L/77Mn5XZ7DUkt0B8rv59NyXI2YcZ6+wGLcoXpyR/Q=;
	h=From:To:Subject:Date:Message-Id;
	b=fpCqNDj/KaJqkRz4XyXTLCZNocdvUbvDyxlRVzEVzr9TyCME6SAylbYdmgY7zJ86d
	 acmTTlaNoOEaOCBu0r1SxDl41/zDxrykwtjo65tDo1VC4TTwkzgc/nKB8C3I5Rg6AF
	 2hLXAoo6p/pxm5tUz9YLeYenytxgOHx7KUoY1rSo=
X-QQ-mid: zesmtpgz7t1752820003ta854dc60
X-QQ-Originating-IP: KmGNRB8zsZXB6SadBHY3Wx3w3DveaOIbchoBOWYeHkY=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 18 Jul 2025 14:26:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18356592917221095869
From: Chaoyi Chen <kernel@airkyi.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/5] arm64: dts: rockchip: rk3399-evb-ind: Add support for DisplayPort
Date: Fri, 18 Jul 2025 14:26:19 +0800
Message-Id: <20250718062619.99-6-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250718062619.99-1-kernel@airkyi.com>
References: <20250718062619.99-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NEyQURHJEjycWMluSWzY4HQTrvIQK7NDuI2rDK8Ebubw9WpAxDPunBdW
	y3AJGKaOUab7a/qbb9Fy5HI9tviGcI7j071at7ZRAOaTLuP+amjB9Hb0SJm+GXOa3WUmSnR
	vQtu60C+jm66kUQ0v/PWrPSnwOAuzlseBwiWPnt4V0EvKxXOQZ+qnDLHSaYQZzqHr85ErPM
	3M9UsmYZVPnigCSDoNh783cRwOE9LRbeQ06pCQQuDJ6RL955J+gSlrdpIYDqxy+4D4HhWqc
	7yQ3bJPi22KZrey22RlRVodTT8nkkAVvtY9y3kiujHUxYeeVdA83hn7nO3bZTEzbyjKgtEF
	pJr/kDNV5E9VS/uYT+Y/2C8QgxUtzlsN2O3bbuQk0yyTDGsIfllEqlqHFr8hGqCvOrb2XNd
	bo6fJnyYAck8sFzl3sEhep30jOd+4QVNCp53yAJePDjUULqgRzjMBWT3sjkFCmcAc2PY41Z
	sJM5NOIXvD6URaU8HbFZo7bQlmuTggCbxXb4PD08hHjDg4B+2f8mKp06D96MJme4WHnTLhZ
	9AzXmiN6OpeuHjSrrwgxP3+eg2qTI3U8tRcHMcrcOMeeBaHuGSDpD1J/rjI7sQi5lYIm2Pa
	0C+C/lqv4UD/wMMNF0KcjrIdzjUEAjMMuWdF32mUg1a9IB3oGmLna0yWW6P3+4ycBSlp1CY
	h4ub5FPX1g/i8klmL4ho07sMzdlawjzxbRi7U94TRGZmkMl3uFxZHkXJjBrr1ogDyy/8K9z
	l4mtFKYXF5/C823yn5HHqWa3q3Z88Ogtda7Eh1Qa/DqzXkuh1mYIM/+DDpUfp/mD/HxaMMX
	IwLrjmT5jq+zcreHl/XyzcO9gH9aB6QpDmF+21wPazSuBvnt2vwha4GRXRwHZjC2mArxpAH
	q35da5Ih+41V5JZNRihLme/URjYPDs7YXq3lzXuFXlS3j/NUth1lI2aC6JKbS2ObOYs7qkd
	UsE9W5U9hne+JG2c0wlznIN1jqnj/Y28DoWqGviB9oJ9ZT9CPFnS5pPhTKuLvBEdqLkXSZn
	x7IjVQw6V/NiWKsyWN
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_232746_269243_DBFE09F3 
X-CRM114-Status: GOOD (  10.94  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The RK3399 EVB IND board has a Type-C interface DisplayPort.
It use fusb302 chip as Type-C controller.

fusb302 chip ---> USB/DP PHY0 <----> CDN-DP controller

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

Changes in v2:
- Add endpoint to link DP PHY and DP controller.
- Fix devicetree coding style.

 .../boot/dts/rockchip/rk3399-evb-ind.dts      | 133 ++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts b/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
index 70aee1ab904c..997b822a57ff 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
@@ -4,6 +4,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/usb/pd.h>
 #include "rk3399.dtsi"
 
 / {
@@ -19,6 +20,21 @@ chosen {
 		stdout-path = "serial2:1500000n8";
 	};
 
+	sound: sound {
+		compatible = "rockchip,rk3399-gru-sound";
+		rockchip,cpu = <&i2s0 &spdif>;
+	};
+
+	vbus_typec: regulator-vbus-typec {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio1 RK_PC2 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vcc5v0_typec0_en>;
+		regulator-name = "vbus_typec";
+		vin-supply = <&vcc5v0_sys>;
+	};
+
 	vcc5v0_sys: regulator-vcc5v0-sys {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -31,6 +47,11 @@ vcc5v0_sys: regulator-vcc5v0-sys {
 	};
 };
 
+&cdn_dp {
+	phys = <&tcphy0_dp>;
+	status = "okay";
+};
+
 &cpu_b0 {
 	cpu-supply = <&vdd_cpu_b>;
 };
@@ -55,6 +76,12 @@ &cpu_l3 {
 	cpu-supply = <&vdd_cpu_l>;
 };
 
+&dp_out {
+	dp_controller_output: endpoint {
+		remote-endpoint = <&dp_phy_in>;
+	};
+};
+
 &emmc_phy {
 	status = "okay";
 };
@@ -341,6 +368,63 @@ regulator-state-mem {
 	};
 };
 
+&i2c4 {
+	i2c-scl-rising-time-ns = <475>;
+	i2c-scl-falling-time-ns = <26>;
+	status = "okay";
+
+	usbc0: typec-portc@22 {
+		compatible = "fcs,fusb302";
+		reg = <0x22>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <RK_PA2 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usbc0_int>;
+		vbus-supply = <&vbus_typec>;
+
+		usb_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+			try-power-role = "sink";
+			op-sink-microwatt = <1000000>;
+			sink-pdos =
+				<PDO_FIXED(5000, 2500, PDO_FIXED_USB_COMM)>;
+			source-pdos =
+				<PDO_FIXED(5000, 1500, PDO_FIXED_USB_COMM)>;
+
+			altmodes {
+				displayport {
+					svid = /bits/ 16 <0xff01>;
+					vdo = <0xffffffff>;
+				};
+			};
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usbc0_orien_sw: endpoint {
+						remote-endpoint = <&tcphy0_orientation_switch>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					dp_mode_sw: endpoint {
+						remote-endpoint = <&tcphy_dp_altmode_switch>;
+					};
+				};
+			};
+		};
+	};
+};
+
 &i2s2 {
 	status = "okay";
 };
@@ -354,6 +438,16 @@ &io_domains {
 };
 
 &pinctrl {
+	usb-typec {
+		usbc0_int: usbc0-int {
+			rockchip,pins = <1 RK_PA2 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		vcc5v0_typec0_en: vcc5v0-typec0-en {
+			rockchip,pins = <1 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	pmic {
 		pmic_int_l: pmic-int-l {
 			rockchip,pins = <1 RK_PC5 RK_FUNC_GPIO &pcfg_pull_up>;
@@ -400,10 +494,48 @@ &sdmmc {
 	status = "okay";
 };
 
+&sound {
+	rockchip,codec = <&cdn_dp>;
+	status = "okay";
+};
+
+&spdif {
+	status = "okay";
+};
+
 &tcphy0 {
 	status = "okay";
 };
 
+&tcphy0_dp {
+	mode-switch;
+
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		tcphy_dp_altmode_switch: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&dp_mode_sw>;
+		};
+
+		dp_phy_in: endpoint@1 {
+			reg = <1>;
+			remote-endpoint = <&dp_controller_output>;
+		};
+	};
+};
+
+&tcphy0_usb3 {
+	orientation-switch;
+
+	port {
+		tcphy0_orientation_switch: endpoint {
+			remote-endpoint = <&usbc0_orien_sw>;
+		};
+	};
+};
+
 &tcphy1 {
 	status = "okay";
 };
@@ -461,6 +593,7 @@ &usb_host1_ohci {
 };
 
 &usbdrd_dwc3_0 {
+	usb-role-switch;
 	status = "okay";
 };
 
-- 
2.49.0



