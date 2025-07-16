Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BEAC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 06:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EfhC+fRBJi2ioYPPzzT0wvQ4hQqFwGQeBV9kL8bT9Wo=; b=vuog8OoygbFD6azx3ziT6GGIwF
	b77c4xi1za0wDUWz+b4l7YonXMv6JxJsqwji3Hkf9/fU6/BVDB6cJTLu7Sqx7qSUsulWgq/bKRinh
	TihG5wLLnNrMwkaZrbD6/i6YdsH1alPMIHJ4o9vrbGgtqU5AtPlm3OQhPwVJJY/ne/UANJH5wmW4Y
	yPxY8XsNLM/lLE29nSpwD6OSjGIt/k0Er/giedK2bS3O6Z6Jw3Wb3CzNRLqhQiSpQO5A6CN7kDFm3
	BuqUQkWeLPWT2EkDdtmnRmVNo+Qvqg4uxA7JZh1kOUkUF2c/mKzmHnXQDFvuf6QYdFJ5lyX6F9ORS
	UBa0241g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubvXX-00000006sKe-3Nfk;
	Wed, 16 Jul 2025 06:22:51 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubvCt-00000006plb-3xfv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 06:01:33 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56G61Tkk2780004;
	Wed, 16 Jul 2025 01:01:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752645689;
	bh=EfhC+fRBJi2ioYPPzzT0wvQ4hQqFwGQeBV9kL8bT9Wo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=TpnwFaIAeVZDZWZeMdiR5udHdhP3/5QlDajy21MmJGWNrIr+ySQFbthptPTNHaBZ8
	 UtnyMJEW5iaD2Q2KjkLgS/cWcGsq87E2o9TqyESqdivxYlHGoRcjIQio2VVpW+Za7l
	 2TGQ/mZCljgBzK6LBPFbkjnUj8eODIbT0f7LeoT4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56G61T5w1794725
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 16 Jul 2025 01:01:29 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 16
 Jul 2025 01:01:29 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 16 Jul 2025 01:01:28 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.166])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56G61RAb3833131;
	Wed, 16 Jul 2025 01:01:28 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>, <devarsht@ti.com>, <j-choudhary@ti.com>
Subject: [PATCH v3 7/7] arm64: dts: ti: k3-am68-sk: Enable DSI on DisplayPort-0
Date: Wed, 16 Jul 2025 11:31:14 +0530
Message-ID: <20250716060114.52122-8-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716060114.52122-1-j-choudhary@ti.com>
References: <20250716060114.52122-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_230132_071534_A82D234E 
X-CRM114-Status: GOOD (  11.45  )
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
 .../boot/dts/ti/k3-am68-sk-base-board.dts     | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
index e84c504c87d2..cf42a001b2ef 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
@@ -135,6 +135,34 @@ transceiver4: can-phy3 {
 		max-bitrate = <5000000>;
 	};
 
+	edp0_refclk: clock-edp0-refclk {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <19200000>;
+	};
+
+	dp0_pwr_3v3: regulator-dp0-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "dp0-pwr";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&exp2 2 GPIO_ACTIVE_HIGH>;     /*P0 - DP0_3V3 _EN */
+		enable-active-high;
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
@@ -615,6 +643,39 @@ exp2: gpio@20 {
 		gpio-line-names = "HDMI_PDn","HDMI_LS_OE",
 				  "DP0_3V3_EN","eDP_ENABLE";
 	};
+
+	bridge_dsi_edp: bridge-dsi-edp@2c {
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
@@ -711,6 +772,15 @@ dpi_out0: endpoint {
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
@@ -768,3 +838,30 @@ &usb0 {
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
+
+		dsi0_out: endpoint {
+			remote-endpoint = <&dp0_in>;
+		};
+	};
+
+	port@1 {
+		reg = <1>;
+
+		dsi0_in: endpoint {
+			remote-endpoint = <&dpi0_out>;
+		};
+	};
+};
-- 
2.34.1


