Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E84C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 06:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G6zqXe5pVBIsCrti9HFsAGQfL6mflrZuLCKhZI3cLY0=; b=4iNo1/icrcLUBY4qH2YFYuyrHG
	uj1ms4YwZOZhCXuhN0sl6KVr/wheeXG7+tyYH1YcNAMF/9lf24WFGWN0EZGbC+Lw5bpPcRFm6+zvr
	fAuPAQNkMQNy4GUVRCzScLa/2A0vBjj9dQU1K9MHkCSjTGFscpKIvYAm3/N77a6WIPTtPw9/LvfRR
	+5ck/AUF6xaeCTomajhDL/MnRlTE87Qa4jMzkUeQtIB6qN3vxYHPhydiZL75PhTRFhrzBktx23lmJ
	2Ecf7qqCH3eqjD6IcRlTd6rGEH972kateTG5OlXOm1QgezugxkrhQj+ATM9KvphjBChUOwKRE+/pL
	roMCUXWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubvV7-00000006s0k-0LBf;
	Wed, 16 Jul 2025 06:20:21 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubvCr-00000006plC-3Ss6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 06:01:30 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56G61RDD2432916;
	Wed, 16 Jul 2025 01:01:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752645687;
	bh=G6zqXe5pVBIsCrti9HFsAGQfL6mflrZuLCKhZI3cLY0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=r983+AW8PgM3JpIbP6zY9/5LhwiqHqdznApqaEBP9rilqnUtXREURJz95fWQeYQrQ
	 nXJTYP8p9s2dQV6ylj7L89K6OLOZIJaEMUNhDFsrqb1oC0cZRaDPYUK2SK5KMkjPHl
	 hvj0IWG+tmA+mFT2d5m+NvNACLLOFZeRkAhSD7Ak=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56G61Ret3321712
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 16 Jul 2025 01:01:27 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 16
 Jul 2025 01:01:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 16 Jul 2025 01:01:27 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.166])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56G61P823833093;
	Wed, 16 Jul 2025 01:01:26 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>, <devarsht@ti.com>, <j-choudhary@ti.com>
Subject: [PATCH v3 6/7] arm64: dts: ti: k3-j721s2-common-proc-board: Enable DisplayPort-1
Date: Wed, 16 Jul 2025 11:31:13 +0530
Message-ID: <20250716060114.52122-7-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716060114.52122-1-j-choudhary@ti.com>
References: <20250716060114.52122-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_230129_950770_A8D56E52 
X-CRM114-Status: GOOD (  11.15  )
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
 .../dts/ti/k3-j721s2-common-proc-board.dts    | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
index 793d50344fad..9e43dcff8ef2 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
@@ -93,6 +93,28 @@ vdd_sd_dv: gpio-regulator-TLV71033 {
 			 <3300000 0x1>;
 	};
 
+	dp1_pwr_3v3: regulator-dp1-prw {
+		compatible = "regulator-fixed";
+		regulator-name = "dp1-pwr";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&exp4 1 GPIO_ACTIVE_HIGH>; /* P1 - DP1_PWR_SW_EN */
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
+
 	transceiver1: can-phy1 {
 		compatible = "ti,tcan1043";
 		#phy-cells = <0>;
@@ -563,3 +585,74 @@ &main_mcan5 {
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
+
+		dpi2_out: endpoint {
+			remote-endpoint = <&dsi0_in>;
+		};
+	};
+};
+
+&dsi0_ports {
+	port@0 {
+		reg = <0>;
+
+		dsi0_out: endpoint {
+			remote-endpoint = <&dp1_in>;
+		};
+	};
+
+	port@1 {
+		reg = <1>;
+
+		dsi0_in: endpoint {
+			remote-endpoint = <&dpi2_out>;
+		};
+	};
+};
+
+&dsi_edp_bridge_ports {
+	port@0 {
+		reg = <0>;
+
+		dp1_in: endpoint {
+			remote-endpoint = <&dsi0_out>;
+		};
+	};
+
+	port@1 {
+		reg = <1>;
+
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


