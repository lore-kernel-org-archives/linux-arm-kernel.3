Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBBFC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 08:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0qhBswGbMNvWeYkOf/T6ZsXPUsq70ZJr1FxaO+nhZus=; b=EHCPeSg6zOnUrRqhs2WJn3iCBO
	lQTKWMeVo4gUnzSgeVU0+F5UYe48CPyZZuT6UoAS1h2G2ZDhYemQyuN3iKHxybhrQL5Vwbi/re51v
	ZxdgjWrpgi8VDdepFJsyNGfLKR7LAG8JKhHrlb3RmuJIGYL59D3B8aLMWaB+7lDx+w/DnijXM6Xmz
	Uo2Eu04zcwzTqK+XhJQPmiLxsklPjSuCRyzmvb34M7Z8eXa7u1iShJ/RWE9Sp+sJ43CYCUJ6kE8Mw
	7qftgtjkOB/eR0Ql0cNXzgt/UZe9ZnpUeM4aQTeM02l81bEiI+ZrbhCxl5mPN7iNfBFxLLu4zaMIo
	cwiQQTMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTzLf-00000005562-089q;
	Tue, 24 Jun 2025 08:49:47 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTyzC-000000050nw-2Z1K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 08:26:35 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55O8QWcs1109074;
	Tue, 24 Jun 2025 03:26:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750753592;
	bh=0qhBswGbMNvWeYkOf/T6ZsXPUsq70ZJr1FxaO+nhZus=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=En39445KDBwj46er6sRdmKv8GSsXSiTcVdQRj5bfsCvSnH5N4lmUYvUw10+JCNl54
	 jhzkVOF5eC+B2hNFzFK7I3vv7hoSw/HZr9ZB/NwNIXJXCmiAfcXtfASp/2ynqEZ2Bj
	 8nb8a7tx3276jus5cdJimfpZD/Stw4BO1qSXoLQo=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55O8QW1R1551313
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 03:26:32 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 03:26:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 03:26:31 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.214])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55O8QUJG1448073;
	Tue, 24 Jun 2025 03:26:30 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <u-kumar1@ti.com>,
        <j-choudhary@ti.com>
Subject: [PATCH v2 6/7] arm64: dts: ti: k3-j721s2-common-proc-board: Enable DisplayPort-1
Date: Tue, 24 Jun 2025 13:56:18 +0530
Message-ID: <20250624082619.324851-7-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624082619.324851-1-j-choudhary@ti.com>
References: <20250624082619.324851-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_012634_741531_E5CDDDC0 
X-CRM114-Status: GOOD (  10.41  )
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

Enable DSI display for J721S2 EVM.

Add the endpoint nodes to describe connection from:
DSS => DSI Bridge => DSI to eDP bridge => DisplayPort-1

Set status for all required nodes for DisplayPort-1 as 'okay'.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 .../dts/ti/k3-j721s2-common-proc-board.dts    | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
index 793d50344fad..efe857a50bb1 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
@@ -93,6 +93,29 @@ vdd_sd_dv: gpio-regulator-TLV71033 {
 			 <3300000 0x1>;
 	};
 
+	dp1_pwr_3v3: regulator-dp1-prw {
+		compatible = "regulator-fixed";
+		regulator-name = "dp1-pwr";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&exp4 1 GPIO_ACTIVE_HIGH>; /* P1 - DP1_PWR_SW_EN */
+		enable-active-high;
+		regulator-always-on;
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
+
 	transceiver1: can-phy1 {
 		compatible = "ti,tcan1043";
 		#phy-cells = <0>;
@@ -563,3 +586,69 @@ &main_mcan5 {
 	pinctrl-0 = <&main_mcan5_pins_default>;
 	phys = <&transceiver4>;
 };
+
+&dss {
+	/*
+	 * DSS on J721S2-EVM supports DP on VP0 and DSI on VP2.
+	 * These clock assignments are chosen to enable the following outputs:
+	 * VP0 - DisplayPort SST
+	 * VP2 - DSI
+	 */
+	status = "okay";
+	assigned-clocks = <&k3_clks 158 2>,
+			  <&k3_clks 158 14>;
+	assigned-clock-parents = <&k3_clks 158 3>,
+				 <&k3_clks 158 16>;
+};
+
+&dss_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	port@2 {
+		reg = <2>;
+		dpi2_out: endpoint {
+			remote-endpoint = <&dsi0_in>;
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
+&dsi_edp_bridge_ports {
+	port@0 {
+		reg = <0>;
+		dp1_in: endpoint {
+			remote-endpoint = <&dsi0_out>;
+		};
+	};
+
+	port@1 {
+		reg = <1>;
+		dp1_out: endpoint {
+			remote-endpoint = <&dp1_connector_in>;
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
+};
-- 
2.34.1


