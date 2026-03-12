Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2FFFED2F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 09:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=026O+Z6ChtonOf53bFF420g9yfhgQKiBcP0o2NC/PHM=; b=Mo0Rc3/Woyn3mUNFXzvhN89sXi
	DwmO7C6zskf196W+E+Kt6MHwffsq4xBoCGhDiyb/tZc31Z+7sIy+gf0bf+drFrRrxEcPjHMG3WglI
	rcgs4nB3nWf1DSF3OWa0L8xKHcjT6rDa8OCRlWyWbUsuUr6afJr0w1x/WA84u7/LoW8ujL+uNxYjZ
	jvrYwF2k2BGQ7mT9KPbfzzPZXAKl63h/bxOA7kyPmYVR2PCUe9p3z+PKr5daUASQI1+keWSlkthwu
	UY1j25qfVzfhVnyhALkO9zW9fJ7OcbFB7tIfSdAED5lfe3RjUCZRGCdzdN5eFQr4g7cQCge+Ty/Px
	IMd5/yHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cfm-0000000DnwM-28jr;
	Thu, 12 Mar 2026 09:49:42 +0000
Received: from mail-japaneastazon11022123.outbound.protection.outlook.com ([52.101.126.123] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cfj-0000000DnvX-1Q8A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 09:49:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p2JM27egz/2IygjMAcPx4v4D4lmVkMIlJqzvjIb9IPMFy2C8aVR3c6pE64TxnCJUL1wy27ywYszJXoUsLmfnWKAAWUScgPH+LnBcXLMA0pQwKIlabw3VNWOFS+o0wtRQIFZDkOzaeCu9BIqlP3d7iEwYog16JdHN9TaNuwXIDG2cSeI0m8q5kTqNeGPHd5ypuLdFpe2NzCyk13N5L/fGuyp3obFKHt3N0p4DjhajIzIDDxqCP2rgtqoU6v5T5Iz9YB4GY3jpifCautQfHOmI60ADYqTudZjFhln3p7sn3YkDBT7iCcji8ZEzhS4tNdGZ/W/RsmItSAWoCfMO5caEIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=026O+Z6ChtonOf53bFF420g9yfhgQKiBcP0o2NC/PHM=;
 b=SxDIXLHqidAMexCH6rQXnNcQuGFMHNUV4QzJ30Hk0kU/ycB1gPdcoHjhvgFfHNT2ry4ni8hO1LGi8LiH/gKakUWzn8RFu1yKQZaO0fVtDRJR+pxUSpcSIKbE9xm69rUgORMxRH+AzO0rHb818m9ZvHg7QpRMy8/oAVEEtBGwFjtRzP4emd572lvN7nKlcDqsxRcDCHYx1byk7HEORJmLPu/WkhGuET+28rXjDRF3Qjqw1tCsS5yu1sSto7D9Mau0iGv9lYZiD55TAIjSo8EG2hVOkvWnTDrg2jxQyuLSuc1PKVQO8YmFpCYtG3usqDdp+CqJ5gWcMor7mh9lHGBWDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR01CA0160.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::16) by SEYPR06MB6154.apcprd06.prod.outlook.com
 (2603:1096:101:dc::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 09:49:25 +0000
Received: from OSA0EPF000000C8.apcprd02.prod.outlook.com
 (2603:1096:4:28:cafe::96) by SG2PR01CA0160.outlook.office365.com
 (2603:1096:4:28::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Thu,
 12 Mar 2026 09:49:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C8.mail.protection.outlook.com (10.167.240.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 09:49:24 +0000
Received: from ZicharPC.. (unknown [172.16.64.205])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id BC40B41604E2;
	Thu, 12 Mar 2026 17:49:23 +0800 (CST)
From: Zichar Zhang <zichar.zhang@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.chen@cixtech.com,
	fugang.duan@cixtech.com
Cc: linusw@kernel.org,
	cix-kernel-upstream@cixtech.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Zichar Zhang <zichar.zhang@cixtech.com>
Subject: [PATCH v2 1/1] arm64: dts: cix: add FCH(S0)/S5 GPIO controllers for sky1
Date: Thu, 12 Mar 2026 17:49:23 +0800
Message-Id: <20260312094923.3473444-2-zichar.zhang@cixtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260312094923.3473444-1-zichar.zhang@cixtech.com>
References: <20260312094923.3473444-1-zichar.zhang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C8:EE_|SEYPR06MB6154:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 26155abe-698f-465b-98fb-08de801ca505
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: JXCNLPSfeY/TaezGU2ROpKl0OTHY13Z5YCe+x6HPSOIdUtWTBPug8SzWkrLEAcBPPOsbS44+955yx3Ok4PZMwqrvwuaVdPBulmColeYesTZRm3nnHgde+mF4q7ozSkuLeNu5kH7Qixy7gIdXjhxcCPyyUrsh4cyCIYeC5UACsJPCLuAbR8aXUEsAiv8YG4E7ZmPP5q+CJgS+FLdGB/mv6Sj/roVRvNKxDbYxyJGiTVxIkYJfNvfcNweB/p9FiSqBXz0Gyz9/xyzPZl7fFxaUeFvFUCzjo/xs3ZUXe8ApNy+YscbDwsD6WeruX0ssUM/pwwJcCJkG+dk+kj5EaETiyUBzp+htOnyObPUGLC5p5KncisgYklVMIiFDnHkmVHpbUGcohU8z8jD7PkntWH3sw+lA7F4lBch2jG8jdPlNqn0bq6iTiLDm7dFINpdga1am9E/vhkD0+GWuGspG3Ut0GDzM3hKL7L26MtFGBQXPtZFOCPV6K/sz061ZDJUrtzJcsE9aoZg/y5Zisyw0LZj6RyF56C3BmmaRkuJMWh998V6OGI6SztonLkFNRKeg+q7+H/pNKOer1XmLuMPTwl+drJ650aGhgno8y8yTHMcIOZXlS4SfqLC0e/fEQSax4v5NuHGEEacmL9VffYTIvc8HCW2czcFYrVy/Erst43nbipYVCIbB0ZlZzw3X6OIchoH44IHQAD92ocJLBmrPI3+bcyXfseK1fpzUYt9qaWsp/+x+UaS38RYEZ9HYYqNRJjIC4hd8Ch+DouVKuUD/MclFlA==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ww5NcDPvfIQtRA5r/vBtmFA97Qm7xSQx1q5s9AnNiQeS5D7Lei5WeCg6tlt5z6y8dptua7fisW3kucHXcx35TCbPPEjJ4GgIS/WgHOaGq/tlNfsfj4sDnOLQ5oA5wF8HjwJ9S7r526Ss4GAUpoDenl33QjXuE67xS/LI+9UjnFZ73NRljrTER7AYukBHr+eMDvqaE53+HP3+vMieKbxtmTDdAV0BZLxoAoh5qL39U47raNDdF1R6/SqNpBmcVkbXdoOPk3GvwVsaXX1tHSYdgt3kVU7/jiPQ9fsLroX99rZyKqZATpaaK4JOeJUrSwzzwspVquBQuTt7VJegzRb+G5rzeasozeMZBmRrDq2PlTkUeityNFKJFS+4RGF+5DfzE2Q8YjW5H6FVw91F0vxRvdXXZSZlrUssDWwYZCxB4KPeekKTnIqLZ+mjbYBW9sTO
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 09:49:24.6687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26155abe-698f-465b-98fb-08de801ca505
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_024939_924610_838FA9C9 
X-CRM114-Status: UNSURE (   9.83  )
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

Add Cadence GPIO controller nodes for Sky1 FCH(S0) and S5 domains in
sky1.dtsi, and enable those controllers on sky1-orion-o6.

Signed-off-by: Zichar Zhang <zichar.zhang@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts |  28 +++++
 arch/arm64/boot/dts/cix/sky1.dtsi         | 119 ++++++++++++++++++++++
 2 files changed, 147 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
index 4dee8cd0b86d..e39c87774c12 100644
--- a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
+++ b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
@@ -36,6 +36,22 @@ linux,cma {
 
 };
 
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
+
 &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog>;
@@ -86,6 +102,18 @@ &pcie_x1_1_rc {
 	status = "okay";
 };
 
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
 &uart2 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 72f3b195a927..3772548e8c0b 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -185,6 +185,13 @@ psci {
 		method = "smc";
 	};
 
+	s5_gpio_apb_clk: clock-100000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+		clock-output-names = "s5_gpio_apb_clk";
+	};
+
 	soc@0 {
 		compatible = "simple-bus";
 		ranges = <0 0 0 0 0x20 0>;
@@ -348,6 +355,70 @@ i3c1: i3c@4100000 {
 			status = "disabled";
 		};
 
+		fch_gpio0: gpio-controller@4120000 {
+			compatible = "cdns,gpio-r1p02";
+			reg = <0x0 0x4120000 0x0 0x1000>;
+			clocks = <&scmi_clk CLK_TREE_FCH_GPIO_APB>;
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
 		syscon: syscon@4160000 {
 			compatible = "cix,sky1-system-control", "syscon";
 			reg = <0x0 0x4160000 0x0 0x100>;
@@ -587,6 +658,54 @@ s5_syscon: syscon@16000000 {
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


