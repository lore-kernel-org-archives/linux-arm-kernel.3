Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225C5F01816
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 09:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDsOvGswv5MMXjq36By3O+u8td88SJvXaTYMt3I0Qs0=; b=HW8ohiJI8ZqT6TjGGdQri08nwG
	p6Q3q48xJU7fs72Et+tdEv0HnAficyeaQEJa7/IevPUxWDfIV53h0E81t7M7yrLaupxmoTsbNiLRp
	qfypunbOuUxG4l8Es6rXzD9bLrOlcDiBY5dWAt6qG3pMPIRgHueV+CTYM5OxCP82iqBBzgtH+DVOE
	zZJw9k3TsOn0rZZatYejQ08/vRCMDiZdALb9e6QasxK0RRi28bDfgvqpXK6cv2BLFgsErXwLhp0XY
	6Tv/3guBMua7g0HqLdgpv3u33mJvm0k9UYCj1LzbnuEU7sZ6a/nGuMkoPFAshEKrdY1hYjeMRTyYG
	Fu18WmKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyRYI-00000003M9q-1iLw;
	Fri, 06 Mar 2026 09:33:00 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyRYG-00000003M95-0uAD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 09:32:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UBZP0rBaoU3NG8/6S0+CIG9baUuCwVSyIBVCuuCm/2aze0S1x1Sxbo4CsJZQLJ8OmRuClScA5EXpSqcofGgbos8j9LjXP6ljkb3GRlTS07GC9XthBWemw1HlIgjuuehULLRsXlo2ac1Go1DWdGAh+e/E8NNLjrjHXIxeshMliWZvmAMOvBqiVxrZ/5lsZ2pjcM4XFmThXRh0h4dDl4q2CiYt/Uj/pcrNV600yLuI+TZsDq21QZRubzhuZIkijwG0RnFNkxbrgkg54Ii08JN/OljfLnbA78j+hgJX/P+U9QbpAo/4dBViilFxpRLN36EhwQfsIlnrwIZ9e63wnWHB2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDsOvGswv5MMXjq36By3O+u8td88SJvXaTYMt3I0Qs0=;
 b=j31ohKT02+MH2RX8qj0euJi1Mo+VvMvqFJhFZFXQF8AfxvQTTa+TLxe4dAF2V/A8J0bgY08/XQkHB3TQ7UohKOmyWLKVklupiWWDh7Q+5U1GpWEJ/Ag3SF5QVKvXQ/LLvM+h9agmb6m4ojZ5U11MsfMXCwdk4ucWQGcUWBsOa0deEmgD+dxR4nKFfrEh7KE69+KaU9YoGRLDbekGxcRYi5QOMZE+u2pGbOL//wNJROAakwSYWLkVfacuuQSFMFVs0XuNw9kJakDPUpbqCwndvJKD2ML9vF7sOhpz8ZGEC4RgJmbYPPvtXP6zL/tZMTAybBIlXouc95hTeMsJ8iCROA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0034.apcprd02.prod.outlook.com (2603:1096:4:1f6::10)
 by TYQPR06MB8086.apcprd06.prod.outlook.com (2603:1096:405:2fa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 09:32:42 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:1f6:cafe::bc) by SI1PR02CA0034.outlook.office365.com
 (2603:1096:4:1f6::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.19 via Frontend Transport; Fri,
 6 Mar 2026 09:32:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 09:32:40 +0000
Received: from ZicharPC.. (unknown [172.16.64.205])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 13DCF41604E2;
	Fri,  6 Mar 2026 17:32:39 +0800 (CST)
From: Zichar Zhang <zichar.zhang@cixtech.com>
To: linusw@kernel.org,
	brgl@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.chen@cixtech.com,
	fugang.duan@cixtech.com,
	jank@cadence.com
Cc: cix-kernel-upstream@cixtech.com,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Zichar.Zhang" <zichar.zhang@cixtech.com>
Subject: [PATCH 2/2] arm64: dts: cix: add FCH(S0)/S5 GPIO controllers for sky1
Date: Fri,  6 Mar 2026 17:32:38 +0800
Message-Id: <20260306093238.2715269-2-zichar.zhang@cixtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306093238.2715269-1-zichar.zhang@cixtech.com>
References: <20260306093238.2715269-1-zichar.zhang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|TYQPR06MB8086:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3056bb17-be06-4867-24b2-08de7b634fdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 7rrqwBC0hvTQ8DvLS52x/d+LaG2kEv+0sL4OO6fgIRCVXPjGV1hQQQ9EPgHx/VImethJHgYh3gwiBPj1tWwHoVa7OYGye5mmVCivDQIal7JdzD4x5En2Ll/A/AohlWdkSad+unRc1465nslazbhFByhFYJJpy/0xYMI6cd8wsSTmVHcivWG31vpZhCiJ4f/ioHJi20QjM3Gjpd4fp86y7TGKtriIWqxth8boZ8Nj7xIQbEayZ0Fo3Oy3NBqeijiwHIPh/wFFm81wSZjyo4+YcHev20AmhktkfnH/41teOVl/Xy9ytKA6UTIvAyp4jGhBVdk0b+Oz28zVUbi1zFvGcv14eTPWCwhI+ImllCIWELT9KHrXpWhg2WuQUHM4izoTNMsdjP+yqGYo7qGKpd08czLTlvRBRvwpf/1aMNy1t0p5ruzMBYR+kwmR3A/dZ2IWcTjvaFyLR2xAZBAiPL+DJ2UH5MisZMSkLM24ZuwqqZzsLFff5iulMr9KOVm7Dja0ibLbLXXjg5g0g1m9H6KWsjm4kmqgkmZFoO1Oq5GQRt5dvTQA0Q81NjdDGk1DETXJD6J6F4PgCMHodPewkB2j6SmEKh4tAapkuq0NJpMhi9ghXR0oGuoL1iX11Z9UsP/6AxSHJCx9ByM9ruP7ktgfLtEUakkg9HM3OXJc66ikPPgnPLlO8cnxWqQ1RPJI+BeKKP1JwiHF46s2ujKDJC0EdrnSNB5xzbVbImDjLxTm7MZ4gc8HRrH5M2/KD2LdeWgBP2N/oSCerEkkT1lbzRz7jA==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(7416014)(376014)(82310400026);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: izl1Ss5JSNLo8+R4QKLfyZFTMHkRvgz5UYHK/BN/T+V/+6sWHZezOcjNW5PASYPpk5BUY/iRCqxiFxsCss724HR9EpqvZM5RtOEIYortvpjnqp+MeHM/QsYni3g8p9h7IbROhxYW1eHfuPz3MVfq9VvmqS2LCd3vfWs2GX1GahMxPJR4GPqe91UtAXnnk5nMaMblm4iEP6fimi3X4brhQWt4iNdBHE/BuCKdflM1aHpry8YsH+gpk060+b7uWEh+E/G4P/uX78B4zebOVLGsYa+yY7RIBR2eK9UipSJCso+wLYRgdHMHWWpmZN8pw/pXWsFr6F4sw51CqiUFAXJn6xVeHqyCIrwkouCodWuY8gDZTCiuxsoMfZKO9eKZG8M4ywYOguE/3vkNFLhhSqtKl9optzpanVEaDYjT63aBB/q57h6SEQyG6YblpWmYk4Co
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 09:32:40.0078
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3056bb17-be06-4867-24b2-08de7b634fdd
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYQPR06MB8086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_013256_269256_9DEE862D 
X-CRM114-Status: UNSURE (   8.74  )
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

From: "Zichar.Zhang" <zichar.zhang@cixtech.com>

Add Cadence GPIO controller nodes for Sky1 FCH(S0) and S5 domains in
sky1.dtsi, and enable those controllers on sky1-orion-o6.

Signed-off-by: Zichar Zhang <zichar.zhang@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts |  28 +++++
 arch/arm64/boot/dts/cix/sky1.dtsi         | 123 ++++++++++++++++++++++
 2 files changed, 151 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
index 4dee8cd0b86d..4dc76e0135ee 100644
--- a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
+++ b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
@@ -89,3 +89,31 @@ &pcie_x1_1_rc {
 &uart2 {
 	status = "okay";
 };
+
+&s5_gpio0 {
+	status = "okay";
+};
+
+&s5_gpio1 {
+	status = "okay";
+};
+
+&s5_gpio2 {
+	status = "okay";
+};
+
+&fch_gpio0 {
+	status = "okay";
+};
+
+&fch_gpio1 {
+	status = "okay";
+};
+
+&fch_gpio2 {
+	status = "okay";
+};
+
+&fch_gpio3 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 72f3b195a927..9ceaf8f68e83 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -185,6 +185,13 @@ psci {
 		method = "smc";
 	};
 
+	s5_gpio_apb_clk: s5-gpio-apb-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+		clock-output-names = "s5_gpio_apb_clk";
+	};
+
 	soc@0 {
 		compatible = "simple-bus";
 		ranges = <0 0 0 0 0x20 0>;
@@ -354,6 +361,74 @@ syscon: syscon@4160000 {
 			#reset-cells = <1>;
 		};
 
+		fch_gpio0: gpio-controller@4120000 {
+			compatible = "cdns,gpio-r1p02";
+			reg = <0x0 0x4120000 0x0 0x1000>;
+			clocks = <&scmi_clk CLK_TREE_FCH_GPIO_APB>;
+			clock-names = "fch_gpio_apb_clk";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			ngpios = <32>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		fch_gpio1: gpio-controller@4130000 {
+			compatible = "cdns,gpio-r1p02";
+			reg = <0x0 0x4130000 0x0 0x1000>;
+			clocks = <&scmi_clk CLK_TREE_FCH_GPIO_APB>;
+			clock-names = "fch_gpio_apb_clk";
+
+			interrupts = <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			ngpios = <32>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		fch_gpio2: gpio-controller@4140000 {
+			compatible = "cdns,gpio-r1p02";
+			reg = <0x0 0x4140000 0x0 0x1000>;
+			clocks = <&scmi_clk CLK_TREE_FCH_GPIO_APB>;
+			clock-names = "fch_gpio_apb_clk";
+
+			interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			ngpios = <32>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		fch_gpio3: gpio-controller@4150000 {
+			compatible = "cdns,gpio-r1p02";
+			reg = <0x0 0x4150000 0x0 0x1000>;
+			clocks = <&scmi_clk CLK_TREE_FCH_GPIO_APB>;
+			clock-names = "fch_gpio_apb_clk";
+
+			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			ngpios = <17>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
 		iomuxc: pinctrl@4170000 {
 			compatible = "cix,sky1-pinctrl";
 			reg = <0x0 0x04170000 0x0 0x1000>;
@@ -587,6 +662,54 @@ s5_syscon: syscon@16000000 {
 			#reset-cells = <1>;
 		};
 
+		s5_gpio0: gpio-controller@16004000 {
+			compatible = "cdns,gpio-r1p02";
+			reg = <0x0 0x16004000 0x0 0x1000>;
+			clocks = <&s5_gpio_apb_clk>;
+
+			interrupts = <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			ngpios = <32>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		s5_gpio1: gpio-controller@16005000 {
+			compatible = "cdns,gpio-r1p02";
+			reg = <0x0 0x16005000 0x0 0x1000>;
+			clocks = <&s5_gpio_apb_clk>;
+
+			interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			ngpios = <10>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		s5_gpio2: gpio-controller@16006000 {
+			compatible = "cdns,gpio-r1p02";
+			reg = <0x0 0x16006000 0x0 0x1000>;
+			clocks = <&s5_gpio_apb_clk>;
+
+			interrupts = <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			ngpios = <10>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
 		iomuxc_s5: pinctrl@16007000 {
 			compatible = "cix,sky1-pinctrl-s5";
 			reg = <0x0 0x16007000 0x0 0x1000>;
-- 
2.34.1


