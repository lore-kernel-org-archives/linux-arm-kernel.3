Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009E4C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 17:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/b63KH5NJPUOPZ1g1cKRKHd1zEwEqpry3HADn6QvTM=; b=egOud3EXtrpEpiadsJOLzWxWJg
	pgF2p7Zhdxf/uzpTHB4OY5uavynmjHUf/W08mRkkVfUiUvt5aisR+PT8uMghMynwDE1t0enyioDuN
	+lsTOt44Srg8CcXO+a94PFOSYDr26yP2WNx/JSRtuPiLJcH6P4DUqjuEOn+Nes5ubXoIlb8Z+K/XN
	UeAq/7Q6fXsAV7taHjlUP+RDqR8o31KKoQzQYlpS9msGiDbYNy8AW8KsfJ80RnJhWPCmBe1H9wp9E
	Vd9Vl31hNu4FDe35SSgupnwUzyIuj8ayz7ChoD92lOmjqAWfJ3eBBDG00RerOPkp/Bzs61PdFPXg7
	4+9ZJsgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBzsr-00000008CmX-3zcr;
	Mon, 05 May 2025 17:45:41 +0000
Received: from sender3-pp-f112.zoho.com ([136.143.184.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBzbE-000000088yP-0rdx;
	Mon, 05 May 2025 17:27:29 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1746466034; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YmTPam7tpVAKD45xt31fgShDnXINa0O32EkPC7H5Tn8fmRFmHpT5V5LrGtg/D2MDY442xfCEwSFEEfGNh58gq1ug9nnbtJY2g7Y2HT4tIrzsAqUZKznlryskiYnWQvZxpn2mhQ56O5WqzeHNnAiToqJnLnTwiriyrQp+JtUvgyU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746466034; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=n/b63KH5NJPUOPZ1g1cKRKHd1zEwEqpry3HADn6QvTM=; 
	b=Suzrubk5m7ptBGoGc9gHO/sKbRiNHs+frM4DTP/6PulMwEXgT3wu8TVyfg8xxGqquSev+sKtp+0uxU1jwk0ombh4zuWFU33jsxjA3PH/qdMWZO5ajRNubb4kFFGRApv9vLXuphQEc5GlSi6NCQLIKTqNVkCwCyRNKnv890njbtw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746466034;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=n/b63KH5NJPUOPZ1g1cKRKHd1zEwEqpry3HADn6QvTM=;
	b=W9Dgp/QSk+ExhivScubIaGPdIny68qD37wa+6VXC4qUhxOqiOHVK5wCGgkLABUjU
	L879vi3M/bCDK0L5X80TbfkUx/yeT0AXxGczAU1OjzJqo7NOVhJMCpCGgVZ/beu+aas
	5HqpiPIBx9HlddF94r4Cc8PZauhQm9mw8SVhDDrI=
Received: by mx.zohomail.com with SMTPS id 1746466032351288.12522507198184;
	Mon, 5 May 2025 10:27:12 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 05 May 2025 19:26:40 +0200
Subject: [PATCH v2 5/5] arm64: dts: rockchip: enable USB on Sige5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-rk3576-sige5-usb-v2-5-d5ba4305f3be@collabora.com>
References: <20250505-rk3576-sige5-usb-v2-0-d5ba4305f3be@collabora.com>
In-Reply-To: <20250505-rk3576-sige5-usb-v2-0-d5ba4305f3be@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 kernel@collabora.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_102728_290209_DE3C97D4 
X-CRM114-Status: GOOD (  10.54  )
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

The ArmSoM Sige5 has several USB ports: a Type-A USB 3 port (USB2 lines
going through a hub), a Type-A USB 2.0 port (also going through a hub),
a Type-C DC input port that has absolutely no USB data connection and a
Type-C port with USB3.2 Gen1x1 that's also the maskrom programming port.

Enable these ports, and set the device role to be host for the host
ports.

The data capable Type-C USB port uses a fusb302 for data role switching.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 160 +++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index 570252c4c0bfe56a3c269e47d81fca7676e61787..74de0fc77fefeffb8a90dd6dd9327ddb0083a146 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -177,6 +177,33 @@ vcc_3v3_ufs_s0: regulator-vcc-ufs-s0 {
 		regulator-max-microvolt = <3300000>;
 		vin-supply = <&vcc_5v0_sys>;
 	};
+
+	vcc_5v0_typec0: regulator-vcc-5v0-typec0 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio4 RK_PA6 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_otg0_pwren>;
+		regulator-name = "vcc_5v0_typec0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc_5v0_device>;
+	};
+	vcc_5v0_usbhost: regulator-vcc-5v0-usbhost {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio4 RK_PA4 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_host_pwren>;
+		regulator-name = "vcc_5v0_usbhost";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc_5v0_device>;
+	};
+};
+
+&combphy1_psu {
+	status = "okay";
 };
 
 &combphy0_ps {
@@ -611,6 +638,58 @@ regulator-state-mem {
 &i2c2 {
 	status = "okay";
 
+	usbc0: typec-portc@22 {
+		compatible = "fcs,fusb302";
+		reg = <0x22>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA5 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usbc0_interrupt>;
+		vbus-supply = <&vcc_5v0_typec0>;
+
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			data-role = "dual";
+			/* fusb302 supports PD Rev 2.0 Ver 1.2 */
+			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x2>;
+			power-role = "source";
+			source-pdos = <PDO_FIXED(5000, 2000,
+						 PDO_FIXED_USB_COMM | PDO_FIXED_DATA_SWAP)>;
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
+					usbc0_hs_ep: endpoint {
+						remote-endpoint = <&usb_drd0_hs_ep>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+					usbc0_ss_ep: endpoint {
+						remote-endpoint = <&usb_drd0_ss_ep>;
+					};
+				};
+				port@2 {
+					reg = <2>;
+					usbc0_dp_ep: endpoint {
+						remote-endpoint = <&usbdp_phy_ep>;
+					};
+				};
+			};
+		};
+	};
+
 	hym8563: rtc@51 {
 		compatible = "haoyu,hym8563";
 		reg = <0x51>;
@@ -678,6 +757,24 @@ pcie_reset: pcie-reset {
 			rockchip,pins = <2 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
+
+	usb {
+		usb_host_pwren: usb-host-pwren {
+			rockchip,pins = <4 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+		usb_otg0_pwren: usb-otg0-pwren {
+			rockchip,pins = <4 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+		usbc0_interrupt: usbc0-interrupt {
+			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+		usbc0_sbu1: usbc0-sbu1 {
+			rockchip,pins = <2 RK_PA6 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+		usbc0_sbu2: usbc0-sbu2 {
+			rockchip,pins = <2 RK_PA7 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
 };
 
 &sdhci {
@@ -706,11 +803,74 @@ &sdmmc {
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
+	phy-supply = <&vcc_5v0_usbhost>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0m0_xfer>;
 	status = "okay";
 };
 
+&usb_drd0_dwc3 {
+	usb-role-switch;
+	dr_mode = "otg";
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			usb_drd0_hs_ep: endpoint {
+				remote-endpoint = <&usbc0_hs_ep>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			usb_drd0_ss_ep: endpoint {
+				remote-endpoint = <&usbc0_ss_ep>;
+			};
+		};
+	};
+};
+
+&usb_drd1_dwc3 {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usbdp_phy {
+	mode-switch;
+	orientation-switch;
+	pinctrl-names = "default";
+	pinctrl-0 = <&usbc0_sbu1 &usbc0_sbu2>;
+	sbu1-dc-gpios = <&gpio2 RK_PA6 GPIO_ACTIVE_HIGH>;
+	sbu2-dc-gpios = <&gpio2 RK_PA7 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+
+	port {
+		usbdp_phy_ep: endpoint {
+			remote-endpoint = <&usbc0_dp_ep>;
+		};
+	};
+};
+
 &vop {
 	status = "okay";
 };

-- 
2.49.0


