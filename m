Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9725DC83F2D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 11:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7XLP8/2EgWjHsxetg5+9fnw9v4HpdEFPJtMEGTR/Kxc=; b=D9zSpnGykr3J9HgUmxqaLovwJr
	6EBw6+P+89I2IhR3XJEfixs0EQiohVgGTwU0szdQOT827WRo+KlEDBSML2+C9yn2//mdGpgqfqvbW
	Zypy5EQxdMLBdVBk6mAiTc+T5Bs923OBu8Mmg1f0BmeLPi64nuOprWhF/WSMcMlpEJhGZ4Ek///7X
	OcnUj85R/pIAp2pxmrWpX5BAiJjfpNj877QPZadI1G5wOcRpQaCLGU40OHdZxTp+QbHOqwOU3tABO
	0LfHsYJxWISDntu4odk+hiIIanFvnlmifE39gfXtJPegv/NPn9f57gnc7k4rAnM8DMrMTAv72h0gz
	Xd4y9wWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ube67-00000004yTu-3uK0;
	Tue, 15 Jul 2025 11:45:23 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubdnm-00000004w9W-2Szc;
	Tue, 15 Jul 2025 11:26:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1752578723;
	bh=7XLP8/2EgWjHsxetg5+9fnw9v4HpdEFPJtMEGTR/Kxc=;
	h=From:To:Subject:Date:Message-Id;
	b=Rk1gVE6xaBa1+c/hZOV7vsHaLINnbzxFxVCtL3Tcrcc26yLosyQl7Pm/539YHNuA3
	 eF0PqBnF3tZLSC7wfUdeDFQwedNKMiWfYWpazJGyJLTTS41SO8XTP8uIuRazpgMWIg
	 QNLX62Y91jUd2Qg/gqWkrtGmh+QAfsf8ZSqOin/k=
X-QQ-mid: zesmtpsz3t1752578721ta9aaee12
X-QQ-Originating-IP: ziPpytnZRUvE2L1gAOs1LkViZuJVWgTk5QV/nyGdLmA=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 15 Jul 2025 19:25:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3805871955137023780
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
	Diederik de Haas <didi.debian@cknow.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] arm64: dts: rockchip: rk3399-evb-ind: Add support for DisplayPort
Date: Tue, 15 Jul 2025 19:24:56 +0800
Message-Id: <20250715112456.101-6-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250715112456.101-1-kernel@airkyi.com>
References: <20250715112456.101-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: OLsBWtCIHsg6Sh7Rawl7UJJQtqpRJucVGfeBldJ4rHC7YTqTimDgN5nq
	VWhBMEvGPr6/OfbW7Y6DTPcf1BQHHYpuF6L6eRtAP7RjKHAdAavePbRCLtozh688xcEhogU
	lOS8OnCAuQ28ErqTKGPHLb7jko/vyXZqHR6OdHEHpvq318zJJ5pa47T7IpPrNAabG9mT6Zz
	de3aEVD+zFEpYtE+2GxwqNZMEb49O6mhsQj0ZIXhJb8ii8v0PcKYtFQKkaTVvccMI3u1iBu
	8kwMz26OLJRgIBs0vueo7orNDU4qXzLXSEF1hZrZvNRmvkq7Iiw0af68TLtft3tweautauO
	8CZnMMfIRcX4AaWbH11ZwHnR7ix0ikqttXa+71V9EAJkX6MgE+k9bOn452cUb63P9lTz9MA
	vOBqvMVs+gmItyJYk7V6Uf+2dqsqH84/BDAPA84hbB9ZSjYizTo/mp2ltg7OwL+B9wW1FQc
	LP33e/hA/0Aniv6qkP4/2CEn3ZGhVV1RfWPx/aj2pNEepK9Ue5X6f44AQf9y9R4MPMkDDEN
	xjucM/q1VtChuCvGgDZ6y6MQzdNENoENW83pNq8qLoxA/Wa6Ee7Jjcqxlm+OpAnjxaXZxcJ
	43iQKEP69agD5A4C1r00SdqaYH0kj7JvJdG7ZfRYB3zIQsuud2zZo+5qMwi28CXZ0Gth/D+
	WPRGkx1PRKOedailQN7AqkjAMWxJLVB03lMFsHG4+74KDrixER1/db2giO2Y8jKkPYyMb0f
	GYJR0l+F1TIaw4L0cFIxSggaN/opunbB+ffYnxbtIaBtjXZhD06IosSZGHj+hnASai0eEZO
	tHESzIgpk4t2UFclo5d9X1Lvc+kocsEUkWvwRxPWrYPOlVxR+GJxLbVnz+XSu+++wtRgA/4
	Rz4fAM/BRA3nm7BUnhv+svOIr4PxonwednuRIBemcBAlg0UqmK4zbmIcDbz8YJ8epeYxls9
	rGaHsk5pheXFGgriFCHMyuNTI7d4OFOWEp/K6cLSrdRcZ9Y3risg213bh
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_042627_442418_800F6951 
X-CRM114-Status: GOOD (  10.63  )
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

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 .../boot/dts/rockchip/rk3399-evb-ind.dts      | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts b/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
index 70aee1ab904c..9ceda32456a0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
@@ -4,6 +4,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/usb/pd.h>
 #include "rk3399.dtsi"
 
 / {
@@ -19,6 +20,16 @@ chosen {
 		stdout-path = "serial2:1500000n8";
 	};
 
+	vbus_typec: vbus-typec-regulator {
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
@@ -29,6 +40,16 @@ vcc5v0_sys: regulator-vcc5v0-sys {
 		regulator-max-microvolt = <5000000>;
 		regulator-min-microvolt = <5000000>;
 	};
+
+	sound: sound {
+		compatible = "rockchip,rk3399-gru-sound";
+		rockchip,cpu = <&i2s0 &spdif>;
+	};
+};
+
+&cdn_dp {
+	status = "okay";
+	phys = <&tcphy0_dp>;
 };
 
 &cpu_b0 {
@@ -341,6 +362,66 @@ regulator-state-mem {
 	};
 };
 
+&i2c4 {
+	i2c-scl-rising-time-ns = <475>;
+	i2c-scl-falling-time-ns = <26>;
+	status = "okay";
+
+	usbc0: fusb302@22 {
+		compatible = "fcs,fusb302";
+		reg = <0x22>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <RK_PA2 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usbc0_int>;
+		vbus-supply = <&vbus_typec>;
+		status = "okay";
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
+			displayport = <&cdn_dp>;
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
@@ -354,6 +435,16 @@ &io_domains {
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
@@ -400,8 +491,35 @@ &sdmmc {
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
+	mode-switch;
+	orientation-switch;
 	status = "okay";
+
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		tcphy0_orientation_switch: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&usbc0_orien_sw>;
+		};
+
+		tcphy_dp_altmode_switch: endpoint@1 {
+			reg = <1>;
+			remote-endpoint = <&dp_mode_sw>;
+		};
+	};
+
 };
 
 &tcphy1 {
@@ -461,6 +579,7 @@ &usb_host1_ohci {
 };
 
 &usbdrd_dwc3_0 {
+	usb-role-switch;
 	status = "okay";
 };
 
-- 
2.49.0


