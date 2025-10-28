Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2D4CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 21:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RDLc0zxUq6Lzd3IE27Ezfr/loqGRFV7S8iikk8RHAcw=; b=LJTngq+gVfx3S6CBp5nRGb0xCb
	u6E6wwI4vCQEZT74usKKH/wIt5Z5DeYAe1xOns5Pq0kq4IBNvS8VFmMAaOBKSd4u1aDacHLY1jJxV
	MqCvAEV6ugcbw8XC83kh7bRPdp75Ma08aGQgXXIQHvIVf+GgSvnG+WjnvlLh2Rhh2GME1jN8P4AOl
	5h8w57HV+zNTPKl45TU0mXMcqCwRiWE+7eGwlk6jIjlg7vNq3GNnBNtKekq5cgt/3Comr5om4bRew
	tiDMC4mxTYBMMEC/nGBnYuNQGVza+4D7eU6vA28lZCBq+b0flaGSjXCpsGotJBmy5JoQ/QgDtqhw/
	G3LfWxNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDrO3-0000000Ghm9-0Hqn;
	Tue, 28 Oct 2025 21:37:51 +0000
Received: from mail-northcentralusazon11010064.outbound.protection.outlook.com ([52.101.193.64] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDrO0-0000000GhkT-1JYb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 21:37:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jn6t0AfCYYGswtskLe/pNJBrB+rXkDAhY7xyUDrdDkupGLJsh05z8a4gPOvU3I/eA5TxKh0KDPJzJd9KMiHonGX2zWgAt25u2k8fMr/rVoBU8JWL1/tr4aViLTbdN7/6s95ZKnXD3qvYtzUFdMcozTaJav2Qcj7CGu/4y5C5OpizgPWTmhZ1npeyBcmazKyXliCPiinTKSuLFPcTSotlal1LfT0U36A+e6oMVAeyCLVsfG9zdx0B2F2PY3JOBee52qHWSSkui8ZS/RSqiBUmz32ymX/mJwz23tkqJRxjPRQw/y3K0L0c/3Yc5JFCcUDR3EKhIwddAbbuqQIuN2PDIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDLc0zxUq6Lzd3IE27Ezfr/loqGRFV7S8iikk8RHAcw=;
 b=Cz7cr/cPBPWnQJYdOemPilaOmViShBh6/jACW0JhNDOI563j8/XNSUvOIGS+Ezu6sI+6joDdaxZZEWsHSmwQWllFwbNGfeFnTmSK8rqL1LtsrWqtG42qoolmZ4L8d/ZdYRZhv3K7QxNIyE23v1RBk+fH24ilrm1NIaNQGFv17uX1d58YhVFOy8w0FlMNq3qai6pGeS0x2AXv1M5NUV76h9d4DUHcO7qDyh5riWcnsU/tJxoGFY5j+RoI2emBVbaLtUULpq733bVHvvhDpwDR1D1r/VGpPJE8lBqpjtC7Ze+EE3ZAC90JpQttM6vsuIJAJmBh1rr3PDFdR0gjpnSZQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDLc0zxUq6Lzd3IE27Ezfr/loqGRFV7S8iikk8RHAcw=;
 b=SoYAQ+8lFYeU7wHwAAqUdVmKM2ElIFJxyMM7v0l5dZJMmuttTfCYlz+L/cOUmBQjYzvYWbpJEV5H67psnRAgRFxkaUfqkdfvLYyXrzI7i4bxa1l7N6X2N7X+njEwV44QgXthPFhEjCIcG5QgKoYAH3aJfFAihbFrTaXXRgacLiE=
Received: from PH7P220CA0056.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::14)
 by PH0PR10MB5579.namprd10.prod.outlook.com (2603:10b6:510:f2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 21:37:38 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2603:10b6:510:32b:cafe::36) by PH7P220CA0056.outlook.office365.com
 (2603:10b6:510:32b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.20 via Frontend Transport; Tue,
 28 Oct 2025 21:37:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Tue, 28 Oct 2025 21:37:38 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 16:37:28 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 16:37:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Oct 2025 16:37:27 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59SLbQrc2969806;
	Tue, 28 Oct 2025 16:37:27 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
	<s-ramamoorthy@ti.com>
Subject: [PATCH v2 2/2] arm64: dts: ti: k3-am62d2-evm: Enable PMIC
Date: Wed, 29 Oct 2025 03:06:45 +0530
Message-ID: <20251028213645.437957-3-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251028213645.437957-1-p-bhagat@ti.com>
References: <20251028213645.437957-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|PH0PR10MB5579:EE_
X-MS-Office365-Filtering-Correlation-Id: b541fcb5-8e1f-46cd-9de5-08de166a3751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|34020700016|34070700014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sdPGFmt6e93ACKEE7G0MRnUVtzovIFuAa9wlRtYQEJe9/AtDKHdzPsIJvaQy?=
 =?us-ascii?Q?sWs7B8u5ogQC70jk/GMbiAG87gNMzb/1POMDsX/MrQr+eM2rwhA+A/GHe108?=
 =?us-ascii?Q?i7Q4D3eoquBcbZKNNl16JlZ4OYU6oNedpBSi/D+AA7VeQCYLfrG/Bs5r6I5u?=
 =?us-ascii?Q?9OnSQOQ5Z0qCuz/NCmlC9+6R8h/LPKFVnu4wVnPl5LI/gGjXjLz3sTttSFCX?=
 =?us-ascii?Q?SMFq8WGfd0kbIIyveTXJs79FtuVBjySXflk38vcaO89zJejOev6iMBi1u/OR?=
 =?us-ascii?Q?iXmaiO1I57S4xuz9lgHWvMzd8QJ/vDzclj245DgCyoB/tuFtmLqC1wlAh/QW?=
 =?us-ascii?Q?EsHLAFgIVGLMiv48fXeRG8NnKYi24diMcV7+CdbF1Dwm175FjBKa9WHnWNhg?=
 =?us-ascii?Q?bjpLvgndAueSSgAfeiAqu1pdHcuUU1ylp7cHmnHwbaqD8OefRp8pLqZ0ShYx?=
 =?us-ascii?Q?/J4jd1+nRHBKjK5GUfh/YGRoUsz5U2+ck4aANUVgzrhlOa/0EW0+74ejdL3e?=
 =?us-ascii?Q?8Wow6CzTBgLb8R6ZyjR0K7lMF/75r0LEx7yBwG3aYdhMBFyQn1pMC59Tfyua?=
 =?us-ascii?Q?NsUMbDOcWQ8sVYiRxwYOugCuUmZFlQpavRgRb96HJwD33rvhJObbZ5CZznRR?=
 =?us-ascii?Q?k5Fr1zVUAi4UH5796jaNNIdtB4NV6hPVGXbUYELbjPjLuOTo0OlHdJ6YSD0W?=
 =?us-ascii?Q?MSz5mZNYJPwViv8qV7ISuMjk0A7FPivWpxuud6SXSr7MDxO1QRf3WhwF9tDJ?=
 =?us-ascii?Q?PqaMeZBasuWM3GgN+2n+D1JHD8umHrIKHVjzPa1hGDhLliiqmOpFqXLmIK64?=
 =?us-ascii?Q?dxe8rfup63tJ15m2O0g0r+m0PZC8WNPRyCk1CdRqdCpgJADUFUjvH7zWZ7tf?=
 =?us-ascii?Q?xAcP+A8lPr39wyCsYD6MjeAZm6djEvBpuOdG7XUHYH1IEk1Naw1xm6ezaamb?=
 =?us-ascii?Q?5H8FB+AoVtznHbtbZXix5KBxQJsecW+iasg5msGEPyHBtt+uaq319CTTgXfb?=
 =?us-ascii?Q?FP9v/0hUkxcYje4J2WKSydYdVuHkVkbE1E8DOtaazZ6fP/4YRosHMgFwYabG?=
 =?us-ascii?Q?O7F/X9YGmJFCYr5DOfby1QR1ordCZQj1l8BHBQFqEWXuktotaAoPwQD/mZY7?=
 =?us-ascii?Q?w5A5rrtQHlvd3M7IFHrvSV7+5s+sn1YmwAMvxJ2uDsCnBIHvTlUmmD0UHf0m?=
 =?us-ascii?Q?jZ2kvvJ8eBPcSQx9Rc3Spaiw24l6CpsG7fJPqR8XWxZfy809E/N37xvw1Bub?=
 =?us-ascii?Q?OH2J7UyM8r1ganVwlUluoiVpVWgzoANIhEXQ9OpeG7LVBl1LmVzNhlOrV8KT?=
 =?us-ascii?Q?JlBRXHqGL4XBEtFrRRjtlG7iLkGZ4kd+u1EOnbLYf0w736LoLMmR9dKG8bKm?=
 =?us-ascii?Q?FU719c09awuR1N0O5GnMxshWFggg6uuVPK2iR2gmpsEzj9/9xWS3HNFKfdfa?=
 =?us-ascii?Q?Trgw4YhY7bOlyJi04+RcMhhdKJIPRLDx9Do9DO+zq3elVfelCLFNFhQAaJsZ?=
 =?us-ascii?Q?seem+7I8BI4YE373dy581TZ0+J+lByj+YyeDybwFUt97aFjmCSykFWA6hYNP?=
 =?us-ascii?Q?qnMIHPp/i/qKa8S6JRY=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(34020700016)(34070700014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 21:37:38.2717
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b541fcb5-8e1f-46cd-9de5-08de166a3751
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5579
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_143748_359862_91C41BA3 
X-CRM114-Status: UNSURE (   9.94  )
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

Add support for TPS65224 PMIC family on wakeup I2C0 bus. This
device provides regulators (bucks and LDOs), along with GPIOs,
and monitors SOC's MCU error signal.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
Reviewed-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 91 ++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index 9a74df221f2a..155abd97b799 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -214,6 +214,14 @@ AM62DX_MCU_IOPAD(0x0030, PIN_OUTPUT, 0) /* (C8) WKUP_UART0_RTSn */
 		>;
 		bootph-all;
 	};
+
+	wkup_i2c0_pins_default: wkup-i2c0-default-pins {
+		pinctrl-single,pins = <
+			AM62DX_MCU_IOPAD(0x004c, PIN_INPUT, 0) /* (D13) WKUP_I2C0_SCL */
+			AM62DX_MCU_IOPAD(0x0050, PIN_INPUT, 0) /* (E13) WKUP_I2C0_SDA */
+		>;
+		bootph-all;
+	};
 };
 
 /* WKUP UART0 is used for DM firmware logs */
@@ -464,6 +472,89 @@ &main_i2c2 {
 	status = "okay";
 };
 
+&wkup_i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&wkup_i2c0_pins_default>;
+	clock-frequency = <400000>;
+	status = "okay";
+
+	tps65224: pmic@48 {
+		compatible = "ti,tps65224-q1";
+		reg = <0x48>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_irq_pins_default>;
+		interrupt-parent = <&main_gpio1>;
+		interrupts = <31 IRQ_TYPE_EDGE_FALLING>;
+		ti,primary-pmic;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		buck12-supply = <&vcc_3v3_sys>;
+		buck3-supply = <&vcc_3v3_sys>;
+		buck4-supply = <&vcc_3v3_sys>;
+		ldo1-supply = <&vcc_3v3_sys>;
+		ldo2-supply = <&vcc_3v3_sys>;
+		ldo3-supply = <&vcc_3v3_sys>;
+
+		regulators {
+			buck12: buck12 {
+				regulator-name = "vdd_core";
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <850000>;
+				regulator-boot-on;
+				regulator-always-on;
+				bootph-all;
+			};
+
+			buck3: buck3 {
+				regulator-name = "dvdd1v8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+				bootph-all;
+			};
+
+			buck4: buck4 {
+				regulator-name = "vdds_ddr";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-boot-on;
+				regulator-always-on;
+				bootph-all;
+			};
+
+			ldo1: ldo1 {
+				regulator-name = "vdda_1v8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+				bootph-all;
+			};
+
+			ldo2: ldo2 {
+				regulator-name = "dvdd3v3";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+				bootph-all;
+			};
+
+			ldo3: ldo3 {
+				regulator-name = "vddr_core";
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <850000>;
+				regulator-boot-on;
+				regulator-always-on;
+				bootph-all;
+			};
+		};
+	};
+};
+
 &sdhci0 {
 	/* eMMC */
 	non-removable;
-- 
2.34.1


