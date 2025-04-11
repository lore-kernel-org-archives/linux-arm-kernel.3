Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6BDC369A9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 11:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fd38hYvBauVu1hxTTwteHnkvbHJiB96Nlgi4QYQK5Pk=; b=QQ79v9+ax5WTbUuIDYVyUR+GqO
	I57nN2h9O3MFbMSlJAT9c1fS+Zd6wclu5ff9Ou+BmtNwQsOzF3pN8J4fUPQP0PanQeSUZZOxzngMf
	inx/6vC5c1LqAOKkfwk+VW0h0rBcXrj4fNcJU+L8d3m5hppaFHFgdph8vCXY2p17viU34BN2+ss1J
	544bGjM93+McfKCOokNiFUNsqLIJkYFDUvwYTeF4/kU8hNm8Sl1J8o9JbAWKFNN2+qqFdtiRdBGa4
	Pyzp0ZE+FwMBvplsLaUcIBd107q5a/2n2cpV8amhtngG3747tIJyDNntQUN31HAqjf6xHqAGXR1/g
	ShsGrNOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3CPo-0000000DVCP-2fBn;
	Fri, 11 Apr 2025 11:19:20 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3BzQ-0000000DQwF-1tur
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 10:52:06 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BAq1SS1549496
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 05:52:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744368721;
	bh=Fd38hYvBauVu1hxTTwteHnkvbHJiB96Nlgi4QYQK5Pk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sa+F+OE+7DFNR7us58+chcd2ds+sCPzHp+y6j7ie+wWjosUTEGZcHv77MkjafkH3W
	 RJ1UQ0WRg7He9oZ51Asjy+aQ2+CZC8FhJ6efvL69nwS2xE4LXf9l6pBkP2XZBzcg2m
	 uRT0G1qgsLfJ+qpb63Xd2dzJGVU1f3Rge65mqTMY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BAq1N6110853
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 05:52:01 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 05:52:00 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 05:52:00 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BApxOl029890;
	Fri, 11 Apr 2025 05:52:00 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <u-kumar1@ti.com>, <devarsht@ti.com>,
        <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <j-choudhary@ti.com>
Subject: [PATCH 2/7] arm64: dts: ti: k3-j784s4-j742s2-evm-common: Enable DisplayPort-1
Date: Fri, 11 Apr 2025 16:21:50 +0530
Message-ID: <20250411105155.303657-3-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411105155.303657-1-j-choudhary@ti.com>
References: <20250411105155.303657-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_035204_581653_372D12EC 
X-CRM114-Status: GOOD (  12.00  )
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

Enable DSI display for J784S4 EVM.

Add DT node for DSI-to-eDP bridge. The DSI to eDP bridge is
SN65DSI86 on the board.

Add the endpoint nodes to describe connection from:
DSS => DSI => SN65DSI86 bridge => DisplayPort-1

Set status for all required nodes for display as 'okay'.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 .../dts/ti/k3-j784s4-j742s2-evm-common.dtsi   | 117 +++++++++++++++++-
 1 file changed, 116 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
index 303f8ba9025a..0d19ca6523d6 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
@@ -306,6 +306,52 @@ codec_audio: sound {
 		clock-names = "cpb-mcasp-auxclk", "cpb-mcasp-auxclk-48000",
 			      "cpb-codec-scki", "cpb-codec-scki-48000";
 	};
+
+	vsys_io_1v8: regulator-vsys-io-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vsys_io_1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vsys_io_1v2: regulator-vsys-io-1v2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vsys_io_1v2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	edp1_refclk: clock-edp1-refclk {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <19200000>;
+	};
+
+	dp1_pwr_3v3: regulator-dp1-prw {
+		compatible = "regulator-fixed";
+		regulator-name = "dp1-pwr";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&exp4 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	dp1: connector-dp1 {
+		compatible = "dp-connector";
+		label = "DP1";
+		type = "full-size";
+		dp-pwr-supply = <&dp1_pwr_3v3>;
+
+		port {
+			dp1_connector_in: endpoint {
+				remote-endpoint = <&dp1_out>;
+			};
+		};
+	};
 };
 
 &wkup_gpio0 {
@@ -1345,12 +1391,24 @@ &mhdp {
 };
 
 &dss_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
 	/* DP */
-	port {
+	port@0 {
+		reg = <0>;
 		dpi0_out: endpoint {
 			remote-endpoint = <&dp0_in>;
 		};
 	};
+
+	/* DSI */
+	port@2 {
+		reg = <2>;
+		dpi2_out: endpoint {
+			remote-endpoint = <&dsi0_in>;
+		};
+	};
 };
 
 &main_i2c4 {
@@ -1365,6 +1423,63 @@ exp4: gpio@20 {
 		gpio-controller;
 		#gpio-cells = <2>;
 	};
+
+	dsi_edp_bridge: dsi-edp-bridge@2c {
+		compatible = "ti,sn65dsi86";
+		reg = <0x2c>;
+
+		clock-names = "refclk";
+		clocks = <&edp1_refclk>;
+
+		enable-gpios = <&exp4 2 GPIO_ACTIVE_HIGH>;
+
+		vpll-supply = <&vsys_io_1v8>;
+		vccio-supply = <&vsys_io_1v8>;
+		vcca-supply = <&vsys_io_1v2>;
+		vcc-supply = <&vsys_io_1v2>;
+
+		dsi_edp_bridge_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			port@0 {
+				reg = <0>;
+				dp1_in: endpoint {
+					remote-endpoint = <&dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dp1_out: endpoint {
+					remote-endpoint = <&dp1_connector_in>;
+				};
+			};
+		};
+	};
+};
+
+&dsi0_ports {
+	port@0 {
+		reg = <0>;
+		dsi0_out: endpoint {
+			remote-endpoint = <&dp1_in>;
+		};
+	};
+
+	port@1 {
+		reg = <1>;
+		dsi0_in: endpoint {
+			remote-endpoint = <&dpi2_out>;
+		};
+	};
+};
+
+&dphy_tx0 {
+	status = "okay";
+};
+
+&dsi0 {
+	status = "okay";
 };
 
 &dp0_ports {
-- 
2.34.1


