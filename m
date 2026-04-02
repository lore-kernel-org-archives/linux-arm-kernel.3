Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DF3D39403
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 09:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxEOfEJmu7MQ0GpoL37Z+tjpmvyLoWFu6FhEGGtd7t0=; b=TM4aq+lNwxJkhB6tiqrDEy5g9p
	VQ1tUnf1FbpWbP9zYJQ90KX6taDaa5msVaxnFOXPiB986lMFmnJtcs+KkucxnHibJ6JikFBe6UWaK
	dz7EHgqBdTHIXPRlRF6z2fVKDL/8Zyj/itn4Pr+0hqVwShhBc4V5eLAl0Gz8KXblTCs3bvqKlFpPI
	jsjGTKNkjRURJTN7bRUcNAQYjliwct1qfCf0rfU1IeEGIuWJSR1a+2295Nd9VgBfcP+xOnZH9DgVU
	yP5QzuS2kwST1KLzTrwTUWU6jqE0XmAfuROg0mku6d3+PLmEhl1corZY0m00+8yNmP8ukkKieDns/
	JqNebYew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Ehl-0000000HJLC-0Ybr;
	Thu, 02 Apr 2026 09:51:13 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Ehf-0000000HJBf-3t2c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 09:51:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZJBiDJ94+RyP57rtgDQeOQdhYaJ8+3XE+k2U9LgUhDkIzbil03+h5QfsuHEelDElB38I5X+0mHUXTia+UWDaNNONQFDoBRjQkENai7OiwNS47k1H/eawmiHZxyu009zCYrN+Dvy5wyOlH+4sYc7zkDtGGZVKrRDj/jODgc89adD/Kq877bw94frrD81JArGOcMSFt3viDVrvQlGjT69IaOEUhqynAXVpSc/qF/Myq+JnEsS25f6RWUcU5UFlpcG6OYaH/tdEKfpXP4X+Nv8VBSkulJV1KtS/HD3qRWMTqJkVb7oLu7aTxv1wEqSQD4GfrFfoJJXwhmhybOJRd6I8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxEOfEJmu7MQ0GpoL37Z+tjpmvyLoWFu6FhEGGtd7t0=;
 b=mNtpQ7276360ftui1uMIWEL9PqcL05BpMnkcNzI3TQLazCHbXTJjVt8d3hkNfUkxzeyWOGqknnUUPG2Ox6IACK2P6rKzShBttSR35ockZpi4yG4ZhowRRK17lv2/jO5wmV8RBhhvaACCG8tDYZC3nkJsgb3/fZIgih5XfaI51BNg89PSnwXb+RLZVhK8w0yGGtKuaDyNQGIxVyCuJ098tYQXZfd7tASlTLepQmGUHKSmv9EA5eYVN4OahaAtSVf04pE7+eTuFX+mF/8/3Zc8xBqiqjHPEzJJirgs29U7exFhLIgigesyDLSuPehKDSxW0oG8x1E6xMsySuJQmZgp1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxEOfEJmu7MQ0GpoL37Z+tjpmvyLoWFu6FhEGGtd7t0=;
 b=ki1CFp6XPeNYLN7MC1thsnHG1Ioj4S3itjWsZk/AV9ApURF6SLqBtYWEE2OlC5VqBprIT58j2G7xDhLrfH34AOKrjt1VE55xoDJGc3b0sp+dSTAAjQKw+BbwDbK4EOVGjhk6rJLGTXvnnIz7Qzji+hRVS0l3ed8nqzCjp0AVhPGUF569vKLDNYYBJy3ziRsJ4zMVVbKUvdSdpSrMux4g+yDm2zP7kigaf9kHGOnmGP9FYYkcR3E9GCI8NQLWEmtu2epBSjGruOGk0Gpfmtpz1axDkVpLg8LbxTIz9oSXlbrD0qzkjSpo1LGwL/Pc3spQJ/KeBOVy3ZDmGYRAsLMwZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by DB9PR04MB9865.eurprd04.prod.outlook.com
 (2603:10a6:10:4f0::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 09:51:04 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.20.9769.018; Thu, 2 Apr 2026
 09:51:04 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	hongxing.zhu@nxp.com,
	l.stach@pengutronix.de
Cc: imx@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V10 10/13] arm64: dts: imx8mp: Add Root Port node and PERST property
Date: Thu,  2 Apr 2026 17:51:04 +0800
Message-Id: <20260402095107.205439-11-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260402095107.205439-1-sherry.sun@nxp.com>
References: <20260402095107.205439-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0163.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::11) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|DB9PR04MB9865:EE_
X-MS-Office365-Filtering-Correlation-Id: 51ce65c6-6a01-4efe-0534-08de909d5ab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|376014|52116014|366016|1800799024|921020|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: RlmBua4C8sDNhZjQb+4SRNqmiWwcYDQQwS/Z2p3C3DSWFobrGY5oYDfxdx2LAyzIOJhxB35e1cj8vFvizqzzeZaFsK5y/iLwl5VFv20isXGABWMnGzW3Cg098a80AQ9iX8Uk2m2gRoQCUY6UojBtSbF1pMs62Wee/L6oyx4eWMs/5AulRyzcbz7+68mWeGOAnwGsbLK8S3hc4nMk1XQfbhKlimGiTfT5JLw+Ab22mNLaI4lMFQqTuU7ajZoC6P9e8TGRyJozdYvxH3pNJoFksqteealClYm1pd3fxQM4KR4XbQUiooStnfafQa2CjaUinkEuyRUg63XDrsVZO2bHqPGO6nkyg/Qy24TfqJcKZhnkU6i9Oy8rrD/2s4b42KGRX4lCYI+g0LxVxZcMw3BxGuL2EmhPPpB/tE3rjkIhhpLyC3hXW3TzOVq6sKkFlTldW86zujWT80FZnQWCJ7otwOt8CIuP21QjzvU1jXJuLyfPJfUtC4PIc9egAiV8Z51QtU8ATKwF4PF3aQLCi2eDVTIFVClKQgQTIfngxNwgg83fAz7L4eXjpBeOuX/5DD5dz9DP6wEn9yvh9iTytxhYpP9OVQGGd6W9Gfg/yIljhx3nt0c/Z6um9/x5QobwqKJn8+F1BaTUI505ojX3qUGm+o4HLnbQDUGJYfdn8KKSjqe0uZ34EvfPj9eFZUlUnDIlKCYhcBaTq683pW5bJa60LTZhj1kQFAePWzDLmLeoRZM6dNMD2rrDe4YoLWMRLwnVjYlJKSDcjmK9/K2wgkBnNK4x5ZGzWfUUJU3pHK8fAI9mjSGInhc5G1nAvTBgHqm3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(52116014)(366016)(1800799024)(921020)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OwkRKiwn6NzpV2alMWPrBQcH7cgC8Tex9GySmLuhxukwD2bz3d99/L82U7lH?=
 =?us-ascii?Q?lklrMs7hbwBxF+q5ilIeMESNr5V0dKxGlQfTb0jh5FSf+BlRTb0qEFYvsdmp?=
 =?us-ascii?Q?cdNInZtvJ8SurfSarmHHrT3JLH1yh4SKguql2Gc/l5PNJ5ebEZZU0LCi0Ke1?=
 =?us-ascii?Q?1JhqsxVXPXaRrhyyxoXe+7BQS+xEbaoXqGEwxFlEMR/pGgnZXxeqi241BqbV?=
 =?us-ascii?Q?QYpjKiyPC52ZHJ9BOd0g2c8MRWTpvVuX5eDdwNsc79SFz7voWRIfUNsCJWh0?=
 =?us-ascii?Q?PVoveBFN7P6pInR2iUD6wFXHLHKjcssgIxvbUiio6IxHqjBvzwQYbQw7l+1T?=
 =?us-ascii?Q?MRL45AJ+SDEci+73xNRdDZmxJEkaK6PyoaKJZ1bfF7Gr/NVa+qwFvh+3Ensm?=
 =?us-ascii?Q?Sf0NRlZCYGXYgAuVIB30FtpkDeQshQhoWSU/dAVC7LJt0VCHTaJKBswq097Z?=
 =?us-ascii?Q?o/QdgCCSSJORjlc4OcafH6SI7p8txK93A+IDP41giKvMLlNQHsmsifNkV7jL?=
 =?us-ascii?Q?SUj54ccKQaFM0jBs0VLQGKP1K452f8V6vLUhFbqzd0po/Thjde2mdTR9Qk19?=
 =?us-ascii?Q?QvCsYzJMTn7iQhAyW2n5uv9+NVT1ZQw5ewqrIbrDXJqe3qsGjOh3JLOpRQoU?=
 =?us-ascii?Q?uuj4M9URDU/b0oiysWE3wiObwgNNo+QwROiuLvBIcAxJ6u5NxJo2ACkjFsDe?=
 =?us-ascii?Q?lsE4EPsF0ficor2JUSmPry22Z8GuX6JfLVzv6svKxFHMDbO8q3F2sBOuLmTe?=
 =?us-ascii?Q?lLUqW+uxJcEE0KaXLlTYe5W8IXL1FMNtWKh1V8tx88wa7Tkp8AuqHMH0eoMZ?=
 =?us-ascii?Q?G2wHkop1Fd/6KLrtTOPstNBSYkEGjRY7Pg+xGulNC3IwP3mOQ/hJNZnKv6Vn?=
 =?us-ascii?Q?MSncVLX15Ek0IQ43q0xuIZ2cGW3PRH2zbpglk6ztZqNJvnoLyY+rYyRXJFVB?=
 =?us-ascii?Q?nkdfouH1hCQ0iajPxhQwPL7jsyJ3lOyYyq1sMra3Z0Zf9oVIupsqeLqC7OQ2?=
 =?us-ascii?Q?dL07Whx043i4M0q9RQpaRAZbufhetMIhEeNQeQC7C1fn/Ugg+Zwgq7aOTNUU?=
 =?us-ascii?Q?g70SZIanjFOCoa+SuyQ6LzU7AbOBtt7HRQB4HqD4kz6PlOf41/ZZGoOLK7Uc?=
 =?us-ascii?Q?6Ii6IZReSX8+eypC17sIBB7atv6JczicAwsVU3j7lVoJ5e6Oe9GitVRWCXC9?=
 =?us-ascii?Q?7dADHOLRyvEWA8Y0Faikn0q9R8ct3yHaMKk+BaaRaOmHdTFwxdGUht9bs4d1?=
 =?us-ascii?Q?LB9TsA72dq+vq3K1ulZFw9cJv8OTwLKYRXRToSvafW1Xv698S4NUfvwye3t2?=
 =?us-ascii?Q?gdeT9R1P22Wd1UWIRgB7f3sefRRQAV6qRd4jAjCDsBYDpPSNCl4ZPWzUVN2d?=
 =?us-ascii?Q?G7m8M8SmlyH1ye/a9GLfGRWYfARn6mmufRPh/3LpbSvXFg2nHfvSSzgq+DDI?=
 =?us-ascii?Q?xcZotlrbVqhvOA/uqSxuPexRUBWLnbeBuY9c/RNJju4QIi8mXuULitqw4WDO?=
 =?us-ascii?Q?vUNB3hRRDCoxtQgyxOl1DGK465e42kBNNJHAM0L/uVML0OE3BBGDHti9Y/UH?=
 =?us-ascii?Q?kUXEWJx/pnBbFApZTqJoHlWMUbydyrelxENbLbvs/2NFAO9C7522C/vov0bo?=
 =?us-ascii?Q?OvLSVrwPX9BEgFGMLQQwjK46Y3DNSg/+K4QUsmRqkvI9SJ2SRmtX9CBizX8U?=
 =?us-ascii?Q?ljJu2QGwcVKHlGv+AB5lEfAxRdY4lJMb31YDDBNL+IdpmTgQGzXJX0gwasDU?=
 =?us-ascii?Q?uWrQkpPS/A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51ce65c6-6a01-4efe-0534-08de909d5ab7
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 09:51:04.2781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nuEw4QsMKPgjeumTMRodfeWqw7YQNzQFQTF3vFEcrI6YCJ6NxLiydHPjDV0Zvb/C53ryQn4BSzYqtrQLXCidMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9865
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_025107_986623_5A3DE70F 
X-CRM114-Status: GOOD (  10.78  )
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

Since describing the PCIe PERST# property under Host Bridge node is now
deprecated, it is recommended to add it to the Root Port node, so
creating the Root Port node and add the reset-gpios property in Root
Port.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts |  5 +++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi    | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index 2feb5b18645c..a7f3acdc36d1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -770,6 +770,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&gpio2 7 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie0>;
 	vpcie3v3aux-supply = <&reg_pcie0>;
@@ -783,6 +784,10 @@ &pcie0_ep {
 	status = "disabled";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&gpio2 7 GPIO_ACTIVE_LOW>;
+};
+
 &pwm1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm1>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 90d7bb8f5619..5ce2825182fd 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2265,6 +2265,17 @@ pcie0: pcie: pcie@33800000 {
 			phys = <&pcie_phy>;
 			phy-names = "pcie-phy";
 			status = "disabled";
+
+			pcie0_port0: pcie@0 {
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie0_ep: pcie_ep: pcie-ep@33800000 {
-- 
2.37.1


