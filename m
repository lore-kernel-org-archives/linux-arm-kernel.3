Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED3ECD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 21:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fz7FP/fHEhjZu36JAQxnsNcotFoCNQ3h15Ut5zIc5W8=; b=2jKFiJyMJUkIBvkLEoMcJfjuEE
	dGBmqZrdackVQqo5chZESkIzKhktqmnoKwUa0HwUBziTgjHcq5KefqIpLbEXw+bd9WM2h1UFKoqPe
	phbVuF7lEDw8IQ/1CUv4BHba31eEz6ONKVssvLfInW4zkDcHLnZ3HP3WC0+xi2+KOsGAlypmRmlB2
	/xKrwgM2MaOdh98RtPp9NHjhfEZ/Qzw315Ul+kU0kjOVJLDR1OK9P00GG3Fa9jyVJzBO/+tPOOOTB
	K7/x1dv4B8HA7i4MbQuGQfHqcbCBPnFMcGj1/vODvAIBEqGMpJjE/YXzN4TTv4xTJSNV+8HxDV8Kx
	jVmZC/fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNGq6-00000003nC5-1YL0;
	Wed, 13 May 2026 21:09:58 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNGq3-00000003nBC-3vh5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 21:09:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/rRTu3CWLeMvQkpz1eWcg+Vso2BTcRqH/JkHUNxA0w8Sh2XZcbvWDX65FSOIWHQVD/aKtXPoS6JYmN1XmwfUYI60GaxnuRyMa+AGfHVb+Kib0QD0W0BL/cTHlcZPxVnFEgRX1xP+ZdvwkyyrHnz36L5kWl3ik/HLbmvFesQvOg/dsJiYiFIvX9Q2Gf34AFlXp5xU63UTiaJ0+DCRtEgmijqHvieZGTlzHevYN91G9YHWK6u5Azev20F3pMRpnYj6dzy7FprIXvXDSMPJ8mWDBwqhINAsiNryc9NbJO/mDgs87JuxeNHfglQ83Nav8zV3+T3BKLK9jJcdBDpuUH+PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fz7FP/fHEhjZu36JAQxnsNcotFoCNQ3h15Ut5zIc5W8=;
 b=Vz9DMmZlvPI0i1aQXytVrGlGQ6fImiHbeTHePG9ZzjI0kv8pEJHZosMI+9s3VA1wi54b1JF/b5MvXKv2QzdxEDqyia0fMEs7AyqmxiYmfxZPtwAGvCU/2HgS6TTSEswa+QkbRY5YPv4IrYqo5jqyJDgbNL31ylg6vO0ArlbrMYGRRnFpM7uHlm7pPAj1ZZZ9UQ3OO+aydHY2H/kLJ8rwPpuzYLgNRtaCrAksPg/WGzmptEL+dqek6lJvv5r4VDAdnvvZjvjYIxMtmI7b90VqeQnxzkHu0OPIhKbcFf02E6eHvbRInrZuNncIJriHZw6p2y/QnyHcZN9w9OGjrop50Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fz7FP/fHEhjZu36JAQxnsNcotFoCNQ3h15Ut5zIc5W8=;
 b=visjTPHyefjjtLdosU7IFmUVmUiMSY7GMYGZjgAYB4apb6p5QJi09w88EWJZ8QTjkgpL6xZ++fdu56FaJ+w0V2u6SuV66QJ/iE605FdDij+hG4M7JukGrfPfJkdR17ZrIMJ3VO8NVcxc+m4deKqXQDM8Pnc2GZLcazeIZ/FCPz4=
Received: from IA4P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::15)
 by MW5PR10MB5852.namprd10.prod.outlook.com (2603:10b6:303:19c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Wed, 13 May
 2026 21:09:50 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:208:558:cafe::27) by IA4P220CA0010.outlook.office365.com
 (2603:10b6:208:558::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Wed,
 13 May 2026 21:09:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 21:09:49 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 13 May
 2026 16:09:48 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 13 May
 2026 16:09:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 13 May 2026 16:09:48 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64DL9hTA639443;
	Wed, 13 May 2026 16:09:44 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<tomi.valkeinen@ideasonboard.com>
CC: <r-sharma3@ti.com>, <devarsht@ti.com>, <praneeth@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <s-jain1@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-am62l: Enable HDMI & DSI display
Date: Thu, 14 May 2026 02:39:42 +0530
Message-ID: <20260513210942.692269-1-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|MW5PR10MB5852:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fd6a305-aa31-44b2-66a9-08deb133f7d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info: GAxC5tQqd6jj1u9J+RC7keZZs/weTzvFvpF064RGTsdTmA3rL71yMvRPbnk6uW6V+eMP5eiQ9MCgg5msEAIcsjeitukoNpQ2DIEhCo6RVhDydhaa4cw4Btf+Q6IgEUtgmKmuKC4m9m0M+wIaT+MiD1joA5LrCSsE7FSGsOA2bCrPuJHO3+OyJsKp6fZ24Umh8O6+XvbL7hdH18fyjwPbCtmnh2bWOCZpiQpzUv3RtTI+SDqqOMYw4wd2RtSMuFfmtlL/UFLolh6sy+wGP1gfqyceQ1JDS8ApeMbyFGc+QooqXGpP463fU/sl8lUSSyv4O+SaAHRQYNZihfa9Cntzu/TYjFBOrmZwGJVYpqeRrAynF2qjgSLU/LUhJ/t+E/9UBiHqyd59LiyM47wkmP7Xzce6+CvgpmAbPge5k7LMzNGiFtDKuk558xMBc+awTwIBd4a15BSSCHCqRsrQTrOR/kUXLQ/SfyVf2bA7tm2ABayrqF1pLfrQcmRdh6BpjuYfMBoyWu3oU6IuXoxTCNeIrcIZG5CX/zn4NxAX87r+OTIqfo0oPfbjdH6mUhYkkzLJa+Zt78N6pSQ6fPK8WBr+cLqUn1eV0aFLEFyvLbqyvaEIihkeY/aloI+ueQi120IZm2bqQq29OLrUejzqnfuFOMvOKu2/XcX/Zv/0vUXViIkzKMHrh9KnNdNQ+rlMVQBR3HQGbQpRuipYyDus92E6Qz1JmaFs4cIGcd5UCh7wBts=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(18002099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EXp8WumT/5q1RsPSce+VM635xErNs9iigJRohazjhTTzmAGVTjyvRSjVUa8z/zpx44dFnkubk1z4m6ZLxtOYBEtvoGvQmKQ+OCpG0fUBX1qPhXhxniEQagXICVNXoEYT/Nn5bWE1/HdYU33LlV5rru1gP+rm7t8BSgLoz0d+zM+IbuXOIon3OhzRVfK2w3wiJA16m7FC6vO60f4v894ZWHbVcFCD82/gKCHYOzCs43pPQnlhvFXXaLUcQb0LgrDmEIHueREvc/juQDgSPDti+vb9wQqW1KY7pmF700x9lsEnNfdIzpbTLX0hL3jyaQOAp8OwHxJRCp1jKKG8IR2iPIdMo060OoV4/yAFiS0DfvanN5JKdW/vNlry/Ela3l7P3hsblQveRV1MtW++KR3h5d/eKGBboPdEn1BGRuLpFrAVs7sVmRlRUGypkJ1cMIDm
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 21:09:49.1680
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fd6a305-aa31-44b2-66a9-08deb133f7d9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5852
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_140956_096409_FE1FC490 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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

From: Devarsh Thakkar <devarsht@ti.com>

Enable DSS, DSI and HDMI related nodes and pinmuxes.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62l-main.dtsi | 47 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts  | 58 +++++++++++++++++++++++
 2 files changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
index 80615ca1e01a..1d255c9138db 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
@@ -584,4 +584,51 @@ scmi_shmem: sram@0 {
 			bootph-all;
 		};
 	};
+
+	dss: dss@30200000 {
+		compatible = "ti,am62l-dss";
+		reg = <0x00 0x30200000 0x00 0x1000>, /* common */
+		      <0x00 0x30202000 0x00 0x1000>, /* vidl1 */
+		      <0x00 0x30207000 0x00 0x1000>, /* ovr1 */
+		      <0x00 0x3020a000 0x00 0x1000>, /* vp1 */
+		      <0x00 0x30201000 0x00 0x1000>; /* common1 */
+		reg-names = "common", "vidl1", "ovr1", "vp1", "common1";
+		power-domains = <&scmi_pds 39>;
+		clocks = <&scmi_clk 162>,
+			 <&scmi_clk 161>;
+		clock-names = "fck", "vp1";
+		interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+		status = "disabled";
+
+		dss_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	dphy_tx0: phy@301c0000 {
+		compatible = "ti,j721e-dphy";
+		reg = <0x0 0x301c0000 0x0 0x1000>;
+		clocks = <&scmi_clk 348>, <&scmi_clk 343>;
+		clock-names = "psm", "pll_ref";
+		#phy-cells = <0>;
+		power-domains = <&scmi_pds 86>;
+		assigned-clocks = <&scmi_clk 343>;
+		assigned-clock-parents = <&scmi_clk 341>;
+		assigned-clock-rates = <25000000>;
+		status = "disabled";
+	};
+
+	dsi0: dsi@30500000 {
+		compatible = "ti,j721e-dsi";
+		reg = <0x0 0x30500000 0x0 0x100000>, <0x0 0x30270000 0x0 0x100>;
+		clocks = <&scmi_clk 155>, <&scmi_clk 158>;
+		clock-names = "dsi_p_clk", "dsi_sys_clk";
+		power-domains = <&scmi_pds 38>;
+		interrupt-parent = <&gic500>;
+		interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+		phys = <&dphy_tx0>;
+		phy-names = "dphy";
+		status = "disabled";
+	};
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
index a1af4571a815..7462921e2180 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
@@ -119,6 +119,18 @@ vcc_1v8: regulator-3 {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	hdmi0: connector-hdmi {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&sii9022_out>;
+			};
+		};
+	};
 };
 
 &gpio0 {
@@ -192,6 +204,36 @@ exp2: gpio@23 {
 		bootph-all;
 	};
 
+	sii9022: bridge-hdmi@3b {
+		compatible = "sil,sii9022";
+		reg = <0x3b>;
+		interrupt-parent = <&exp1>;
+		interrupts = <16 IRQ_TYPE_EDGE_FALLING>;
+		#sound-dai-cells = <0>;
+		sil,i2s-data-lanes = < 0 >;
+		bootph-all;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				sii9022_in: endpoint {
+					remote-endpoint = <&dpi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				sii9022_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
 };
 
 &i2c2 {
@@ -375,6 +417,22 @@ &usb1 {
 	pinctrl-0 = <&usb1_default_pins>;
 };
 
+&dss {
+	status = "okay";
+	bootph-all;
+};
+
+&dss_ports {
+	/* VP1: DPI Output */
+	port@0 {
+		reg = <0>;
+
+		dpi_out: endpoint {
+			remote-endpoint = <&sii9022_in>;
+		};
+	};
+};
+
 &wkup_uart0 {
 	pinctrl-0 = <&wkup_uart0_pins_default>;
 	pinctrl-names = "default";

