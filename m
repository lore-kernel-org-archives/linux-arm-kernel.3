Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2F9F532C7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 02:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VjdqDUU1m30gd6wnDeUARrvAcEinqiy9Q2ARzUda2G0=; b=ozHqBW+WKAFMsPhfc8pX3NCTz+
	ztU19DHWDAD/U/DbqXPP5ZVxwC+3YjneEDHg4hGNMQ6FuySaaSPGSnNgCJVo5iHlZTb9s+2DzRs0V
	5jAOJoMXroqy8aJriz91SsrKD1eTywJtT0QkMZyeaSu4VR+NcDh52rb5HjsLJ1sS2XVHGdQIml1KO
	h5E0gMSiQCSJtBCiLPjQf3ywCCB0V3alFvreAwnuzDCXBbvJWOsOKzGLv/fKJGS2qZl/ocyU0ZtvM
	l7HPzXtwacN7KeK9xGjF1hiWbKbQ9bHeyoliY6kRT1RcVRbbw1HJYQ7g2HRRvPwxTf8QEXdnwrrO/
	ejYXzLlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4rWg-00000000OpO-3lNs;
	Tue, 24 Mar 2026 02:29:50 +0000
Received: from mail-northeuropeazon11010037.outbound.protection.outlook.com ([52.101.84.37] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4rWa-00000000Ol3-0JPG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 02:29:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P/hREc7XmNtDLosSiL9PPZmBs8B+MMZgsyEoxBRukUnrvJqr54mMFUWmowJWF+PXWDn9/PUcG7njQPEIA4zjOD4Upwb1zj55UCGx/lu+oprPj+JbYCz/8IJ4Pwd0qIeEmxJTOH0fNJulqbEF4xPxCu2h+Xy+xe8tcrUTe1aRiDFIOikqP+L9SPNIM0o2iluN8azYrhNeY8gbqlz+UwPKjQueNELDtPIVfdmX95zgVA0SicF8sAayVmyeGHscMFLBhxY6WGv5rBuBUcvpNXW97tNh5D/zrC+QTRfctlukF7SzMAG4RCIKJOCJqXu1HHlDj0jqK9aQ+fjdoVn8KgTf7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjdqDUU1m30gd6wnDeUARrvAcEinqiy9Q2ARzUda2G0=;
 b=uvoldkGtwWYnIIT32jnS7OzdYG0TFv4MvdSAGhMIa3ypiQaWdDduXb8YRQzL48SGpOiSmHC/M7XhFyfq3l6uyu703T6vXHJqoOVXDNrhMO43csoHkzjDsNqdpnX8W0CZmkut+HVYk0/Ko70i5YFyr2aSW429O2IFx2/ITmV3ykxtnwa+8USbYnH5ba0LylDRcaf/u8MwXm+8HAU3QyBh13fGpvNu8nbYgA41YKTeH65PZ9g/oHm++SMv7ZXd788LcGIvEvPWV10HoK6h2fks7hJi2OfoPSwDyK6U5A0djbMk+R4I7RFu9+1KxuIDkdTl3jrNtLdNWB6yDbRhqk75CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VjdqDUU1m30gd6wnDeUARrvAcEinqiy9Q2ARzUda2G0=;
 b=G45g49HG27zSDv8eolGurnOQdolbrAiGbGDke3ciOxh4GAPcVOOozxzpR6FM1uZNX3vxf6tLRDbFsRpg0nFdaE/ZXBkuOYBHir6Ph9tRl7SqPvB9HOBLuWP9xCdQs8CCqgCKI2TUHmADn8xaBtjTh+ahTS0DUlu6EgxQ9e2jGMmB5UFWyuygZ9tax5TDpYPlHgCs7GrubXVP1f5rqUtSSbw9gnkIecF4ARPQ6hX2rrdfhZq7X7bn5zD/QcMtj+27kFQDOqChxhJqvj73cPKGk719kKx8LiLlQXpwGGwZYlV4AAXqDgtR8JWEUPn1o0VDFoMoeiW7qUp+2/S2V/kIdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by AM7PR04MB6886.eurprd04.prod.outlook.com (2603:10a6:20b:106::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 02:29:11 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%4]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 02:29:14 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bhelgaas@google.com,
	frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v8 5/5] arm64: dts: imx943-evk: Add pcie[0,1] and pcie-ep[0,1] support
Date: Tue, 24 Mar 2026 10:30:36 +0800
Message-Id: <20260324023036.784466-6-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260324023036.784466-1-hongxing.zhu@nxp.com>
References: <20260324023036.784466-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::22) To AS8PR04MB8833.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8833:EE_|AM7PR04MB6886:EE_
X-MS-Office365-Filtering-Correlation-Id: a355d351-5484-4046-02db-08de894d23cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|19092799006|366016|921020|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: DgeY4iwZ0Nda6bbJ4Ao1b3D1YkbEotsn50BgDBedOB2U1s0Ug8hZbQsNAG/CXnH87+9gVc0ZBC9h/sv531vMtXgo6Nx3vw5bZKKWJy7kBLWeqxauYZ2jRWBz/WJUtZWxLK3E7Qn6gCyC+yV8lqiFH31IltCNmd8VCP7wFGspS485msjdSZ+WUDdvo74Itom+sDStHQ2Hj7on4/K+aJ4SzhJlKOl/GcH0tnOP6E1tLvwwMa8yXJvbi2u1b5Tkbg6P/U/axqsNXH/VSS8dVr4awrGAgkL2BKiwOxo6l5hnvIw3E/pK0UeaJm2OUQYrHJ911LfYiVYN7O6fc/xIshQn0q0PWQ3dcEeisK56vb7JzOoC44y6m4+7TiYmCQ60VOc6G3emjY1yg2HsXdtGBJQl6ggJRmp1WIoNkrPtAALGQmK6uDFrTYbCnwwTpJsLCu8DtfFxjwaZqS3NfBOZFlKRqFBegAZfyQb9BbIYsiVrg/9htWagk+SA+At4f1IKCSzJl2jWdbOgF0JPOpQqSOD7uy1A/AFLuMqbktlPK9UTxy80UbLjdqq+iYCKKidK6xFXqKtr2X8W28sLC4tmWtNc6k/5fcfurcun6+FUbHuEVg20S5DConinpTJh0swnGT2YdjnE865VePF5yEdIlXqv1IL1MBSndDVKMd/NA2/VCo43MmG0f/+YzRShuM9YWB6LAqnGG5WbpDzh0Vx/wfqzoiVuZXRzvsHCBKWSa3aS+1+eujmYvF6M8Q2lJuFhz07OaCLlyF0pYRwe09NTMkNEdz71nfgd/FPmjx6zt3O7weP1j6LDS0eVP0bn2PYZjUEj
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(19092799006)(366016)(921020)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3lNEQFCnOPwkUGDpvLAEa57pFONJjRxATUUNV7rXoofXMDUEJV7ur94qpDdC?=
 =?us-ascii?Q?QOQIYmrj1XQEl/DJeyhHnnc0VLPn+Svb3TpeBiTfWV+xYKG5VlZBbdh0S9SO?=
 =?us-ascii?Q?5FMN7yCY3uJLlO260UarLGjQ4GU6u9veo/mMqahhzel+J6dV6eSWGf6s7+WO?=
 =?us-ascii?Q?7kcisJ9tQ1G7HjjBm1AO3MigaNZq74G9Ww/EgAfhpD0FFlwAe2c9t4497Yai?=
 =?us-ascii?Q?tBKIRn98lvNxHiq1sm/vB7Vo5xTWFepKOjh21+j2Khj11bLTt8lKPDiNf/Le?=
 =?us-ascii?Q?X/enPxUdqJf+NQYDsSTd1OHk7hiHEjUJ3g3HFF5EXMj5FzyNIBio3a47GQrl?=
 =?us-ascii?Q?7frJ8Tmum09lfro5VU3eIQ0Hsdk5C8JDVWYGUfObuXA7xh/vxLaRiUx2NPDR?=
 =?us-ascii?Q?YPqucumNybU5erqdckAiXbm1Z4RqB7PhjKaK0kJFiKG/Z3M2wRRdH3G7dxeH?=
 =?us-ascii?Q?fQlq/UZS2PxZAav3j4NF4ApD/YtQaiLwx0bw9R29hE8lJwPzB3HZRi4YFIT+?=
 =?us-ascii?Q?Ld7DGZgxyaYSEYYKT5rUrtCtDtqT3h7nhLlNmp2M01vWBCjbvrZVY8qnHZ31?=
 =?us-ascii?Q?OEZbwrTEtSGO6rQlsY/rKgBfjRCwgDAhDax4WmUNi+fb5h6Kl3TPxTuAbP/G?=
 =?us-ascii?Q?o27C7r8psTA5x85ghL4gjd6cxTrprtwMdCIJe64MkPoPrABhrWfjbpgYPUUe?=
 =?us-ascii?Q?J5FVc4U8IugCAHzxgx3Y7s1mEgxQBDVwH7bsfns8TQk7lhKROnGudpz/3HjD?=
 =?us-ascii?Q?OocK4e1uB0oS7HTqll1G3UTomDoKSHLUFmm3ylHflHGm9ffOljyODoTixy/L?=
 =?us-ascii?Q?wXbC3qtc7N+XUD4HJnp47/dkNqaG7xPPWZr3p73kRVcMf4HYsJqoDmoaXh+S?=
 =?us-ascii?Q?bO9YXeVxQlBgo47b4LeNhkGirPYatwNulUOupd4rlsvUK0YQUnXgXrJYiqIC?=
 =?us-ascii?Q?aVw7v/wLWkS1KTu4eGs/S4bpK4zlxUmz6Po8gu/xVzLBdPBSAhH1yd5i/w2j?=
 =?us-ascii?Q?Sinci3O5dQ8l8c9uMkqLETNuz/uQj/ubchFDKMYZe4HCCQ1SdqnElyHEZTd5?=
 =?us-ascii?Q?siYfD+YlUnCdZkpmcW/GQ9kVWBqggoiXbTt+cWi70DLUl7KILBFn+Vx3+zt9?=
 =?us-ascii?Q?6O7ka6vkyEN5WjLcQRi/XysBxqOoWXwg9FyQPCN+vaV0PNCa9q5uORjrHcgM?=
 =?us-ascii?Q?izb03xjcGr/t2iqdAULJixsr7PPyWDyw71gWByQjGTOAL9IXAWvB0AsJncVj?=
 =?us-ascii?Q?WmNCeAu+QeQ9bbW1LfH97W5VQIckSEqQYrkZxkR8+viTfY/ONnB3h/nWbbRC?=
 =?us-ascii?Q?z0KsbYFrt/DagORMqk8QYL0sap2tvEncVABzHFUOperpJ0+L0S4oOXJPVKeu?=
 =?us-ascii?Q?a/VulrGkCq4o5VGAe7WyUk3UiyNzRjqWCR206Gpx+NnzBe5FiKkwvIlUDMxC?=
 =?us-ascii?Q?3TKoNU1fGqd22yyYhkudSYx7EaJTav6vcn3bpZuXK2kTM7Lp5Encq2PS7aE6?=
 =?us-ascii?Q?Egkn99FtuuWxZq3puxtRFL4t+mzuVqZ4GwzDHX0DMcBAfcAsJyCdu1cM4+N5?=
 =?us-ascii?Q?qGwL3qTe0+Bgrtzj0CnTqjnG8e9rHTFsroLXi18uzKvlnA019jFcqJDMBiPO?=
 =?us-ascii?Q?jr05SWfnKWS/lIIAmNn4d1k+XmBFDeWyUx3Jzqkw6gUrGJUCsgGVmlse9X20?=
 =?us-ascii?Q?Ggwb3DRSkaQ8BvgCHcO9BEvFGyMwLNQCrBWqGQN6kKwtOiao7ln31nozqpFa?=
 =?us-ascii?Q?jS/wBsCuHA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a355d351-5484-4046-02db-08de894d23cd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 02:29:14.0991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OW21WwSBpCXVNwFRqB02nwHOWGvEcRHKpfJc/W1u8M24pV5o3dA56X25PZzWmxGtYnzdRcKwPBlu2jE0hzG92w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6886
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_192944_114615_FCC35694 
X-CRM114-Status: GOOD (  11.10  )
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

Add pcie[0,1] and pcie-ep[0,1] support.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile       |  4 +
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 83 ++++++++++++++++++++
 2 files changed, 87 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index bae24b53bce6..1366e25a9efd 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -465,6 +465,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
 
+imx943-evk-pcie0-ep-dtbs += imx943-evk.dtb imx-pcie0-ep.dtbo
+imx943-evk-pcie1-ep-dtbs += imx943-evk.dtb imx-pcie1-ep.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx943-evk-pcie0-ep.dtb imx943-evk-pcie1-ep.dtb
+
 imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie0-ep.dtb
 imx95-19x19-evk-pcie0-ep-dtbs += imx95-19x19-evk.dtb imx-pcie0-ep.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index 1d834379f602..ea0100b37d5c 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -51,6 +51,20 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	pcie_ref_clk: clock-pcie-ref {
+		compatible = "gpio-gate-clock";
+		clocks = <&xtal25m>;
+		#clock-cells = <0>;
+		enable-gpios = <&pca9670_i2c3 7 GPIO_ACTIVE_LOW>;
+	};
+
+	xtal25m: clock-xtal25m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+		clock-output-names = "xtal_25MHz";
+	};
+
 	dmic: dmic {
 		compatible = "dmic-codec";
 		#sound-dai-cells = <0>;
@@ -72,6 +86,15 @@ reg_m2_pwr: regulator-m2-pwr {
 		startup-delay-us = <5000>;
 	};
 
+	reg_slot_pwr: regulator-slot-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "PCIe slot-power";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pcal6416_i2c3_u46 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	reg_m2_wlan: regulator-wlan {
 		compatible = "regulator-fixed";
 		regulator-name = "WLAN_EN";
@@ -704,6 +727,18 @@ IMX94_PAD_GPIO_IO28__LPI2C6_SCL		0x40000b9e
 		>;
 	};
 
+	pinctrl_pcie0: pcie0grp {
+		fsl,pins = <
+			IMX94_PAD_GPIO_IO20__PCIE1_CLKREQ_B	0x4000031e
+		>;
+	};
+
+	pinctrl_pcie1: pcie1grp {
+		fsl,pins = <
+			IMX94_PAD_GPIO_IO23__PCIE2_CLKREQ_B	0x4000031e
+		>;
+	};
+
 	pinctrl_pdm: pdmgrp {
 		fsl,pins = <
 			IMX94_PAD_PDM_CLK__PDM_CLK			0x31e
@@ -878,6 +913,54 @@ IMX94_PAD_XSPI1_DQS__XSPI1_A_DQS	0x3fe
 	};
 };
 
+&pcie0 {
+	pinctrl-0 = <&pinctrl_pcie0>;
+	pinctrl-names = "default";
+	clocks = <&scmi_clk IMX94_CLK_HSIO>,
+		 <&scmi_clk IMX94_CLK_HSIOPLL>,
+		 <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+		 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>,
+		 <&hsio_blk_ctl 0>,
+		 <&pcie_ref_clk>;
+	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux",
+		      "ref", "extref";
+	reset-gpio = <&pcal6416_i2c3_u46 3 GPIO_ACTIVE_LOW>;
+	vpcie3v3aux-supply = <&reg_m2_wlan>;
+	supports-clkreq;
+	status = "okay";
+};
+
+&pcie0_ep {
+	pinctrl-0 = <&pinctrl_pcie0>;
+	pinctrl-names = "default";
+	vpcie-supply = <&reg_m2_wlan>;
+	status = "disabled";
+};
+
+&pcie1 {
+	pinctrl-0 = <&pinctrl_pcie1>;
+	pinctrl-names = "default";
+	clocks = <&scmi_clk IMX94_CLK_HSIO>,
+		 <&scmi_clk IMX94_CLK_HSIOPLL>,
+		 <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+		 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>,
+		 <&hsio_blk_ctl 0>,
+		 <&pcie_ref_clk>;
+	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux",
+		      "ref", "extref";
+	reset-gpio = <&pcal6416_i2c3_u46 1 GPIO_ACTIVE_LOW>;
+	vpcie3v3aux-supply = <&reg_slot_pwr>;
+	supports-clkreq;
+	status = "okay";
+};
+
+&pcie1_ep {
+	pinctrl-0 = <&pinctrl_pcie1>;
+	pinctrl-names = "default";
+	vpcie-supply = <&reg_slot_pwr>;
+	status = "disabled";
+};
+
 &usb2 {
 	dr_mode = "otg";
 	disable-over-current;
-- 
2.37.1


