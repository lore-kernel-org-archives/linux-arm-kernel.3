Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B90C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 08:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6X8quacUBF/myiWfdN5Sfb5gBn4ACp83+Pp02fzr3rI=; b=yXd6ErYOpl8Yk+G2IF+L9sE3a3
	/wji7UVVwvF484f4VbX7pZd7xtHSKAcnFX+EkDKpOYDH6NPkl+6MtOPmsYdt/2U6Pm3hkByUrrpS7
	Nnnq4Gy14obuIwH4YH1KDS5sAUAhsM5N9MdE1baLbm8LkswHCM5ETaByKhJvaLs3jmwngi8jK3BtM
	QPPFn0oqZYaPznqJo8+xPvCaG6sdlXzwLuEbmsB/j8IDC2dHbddMSVbdAiCeZxf4Jt6i3fWG9ZkhE
	PgiF5kdWbz0WBBTkJGOsKmdI4+SeU2cfhjBWbtVRjb1k77EEKcpweJ1lWZppwuLUtgZqyXNFMDu/B
	QMOUukNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTzO7-000000055ZD-3ljn;
	Tue, 24 Jun 2025 08:52:19 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTyzD-000000050oL-3K6e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 08:26:37 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55O8QXEG1731148;
	Tue, 24 Jun 2025 03:26:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750753593;
	bh=6X8quacUBF/myiWfdN5Sfb5gBn4ACp83+Pp02fzr3rI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=t7EmD3h5wz1SSRE+wFgiYF5tcmV5OzzdjmBIjgfylKZMJiEEM6ZZb2gT7bYPns3D0
	 EvIsE4UHpuLjkCwFv5ls8Q3gbTLZfIej+PiOl62/kuBuCHOSyeLMvSvogxeONT+ht6
	 1BKSkoidY7O/Tpv04B8bycRGHIGJV5Z8LBuWhd7Q=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55O8QXeI4039856
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 03:26:33 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 03:26:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 03:26:32 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.214])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55O8QWZx1183729;
	Tue, 24 Jun 2025 03:26:32 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <u-kumar1@ti.com>,
        <j-choudhary@ti.com>
Subject: [PATCH v2 7/7] arm64: dts: ti: k3-am68-sk: Enable DSI on DisplayPort-0
Date: Tue, 24 Jun 2025 13:56:19 +0530
Message-ID: <20250624082619.324851-8-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624082619.324851-1-j-choudhary@ti.com>
References: <20250624082619.324851-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_012635_919086_F761BED8 
X-CRM114-Status: GOOD (  11.01  )
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

Enable DSI support for AM68-SK platform.

Add DT node for DSI2eDP bridge. The DSI to eDP bridge is sn65dsi86
on the board.

Add the endpoint nodes to describe connection from:
DSS => DSI => SN65DSI86 bridge => DisplayPort-0

Set status for all required nodes for DisplayPort-0 as 'okay'.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 .../boot/dts/ti/k3-am68-sk-base-board.dts     | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
index 5fa70a874d7b..aef63ae2994c 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
@@ -135,6 +135,35 @@ transceiver4: can-phy3 {
 		max-bitrate = <5000000>;
 	};
 
+	edp0_refclk: clock-edp0-refclk {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <19200000>;
+	};
+
+	dp0_pwr_3v3: fixedregulator-dp0-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "dp0-pwr";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&exp2 2 GPIO_ACTIVE_HIGH>;     /*P0 - DP0_3V3 _EN */
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	dp0: dp0-connector {
+		compatible = "dp-connector";
+		label = "DP0";
+		type = "full-size";
+		dp-pwr-supply = <&dp0_pwr_3v3>;
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&dp0_out>;
+			};
+		};
+	};
+
 	connector-hdmi {
 		compatible = "hdmi-connector";
 		label = "hdmi";
@@ -605,6 +634,39 @@ exp2: gpio@20 {
 		gpio-line-names = "HDMI_PDn","HDMI_LS_OE",
 				  "DP0_3V3_EN","eDP_ENABLE";
 	};
+
+	dsi_edp_bridge: dsi-edp-bridge@2c {
+		compatible = "ti,sn65dsi86";
+		reg = <0x2c>;
+		clock-names = "refclk";
+		clocks = <&edp0_refclk>;
+		enable-gpios = <&exp2 3 GPIO_ACTIVE_HIGH>;
+		vpll-supply = <&vsys_io_1v8>;
+		vccio-supply = <&vsys_io_1v8>;
+		vcca-supply = <&vsys_io_1v2>;
+		vcc-supply = <&vsys_io_1v2>;
+
+		dsi_edp_bridge_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dp0_in: endpoint {
+					remote-endpoint = <&dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				dp0_out: endpoint {
+					remote-endpoint = <&dp0_connector_in>;
+				};
+			};
+		};
+	};
 };
 
 &main_sdhci1 {
@@ -699,6 +761,15 @@ dpi_out0: endpoint {
 			remote-endpoint = <&tfp410_in>;
 		};
 	};
+
+	/* DSI */
+	port@2 {
+		reg = <2>;
+
+		dpi0_out: endpoint {
+			remote-endpoint = <&dsi0_in>;
+		};
+	};
 };
 
 &serdes_ln_ctrl {
@@ -756,3 +827,28 @@ &usb0 {
 	phys = <&serdes0_usb_link>;
 	phy-names = "cdns3,usb3-phy";
 };
+
+&dphy_tx0 {
+	status = "okay";
+};
+
+&dsi0 {
+	status = "okay";
+};
+
+&dsi0_ports {
+
+	port@0 {
+		reg = <0>;
+		dsi0_out: endpoint {
+			remote-endpoint = <&dp0_in>;
+		};
+	};
+
+	port@1 {
+		reg = <1>;
+		dsi0_in: endpoint {
+			remote-endpoint = <&dpi0_out>;
+		};
+	};
+};
-- 
2.34.1


