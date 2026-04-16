Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28E3F8A161
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 11:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FC9T6ZvCfI8ZSncwq/GUv5gX+E0Jdx5LCUfzOwlLyBY=; b=xXJLmNFbD150FObK0uITmazkPO
	8mLN1Ke2Ip2/AYxcPXCJfMrdt+vuHA6s8wp+5H6BU5JsdgiKb1rj5QzdYPYX9qUpiqzkfLG8wQmia
	zF9dAct+BMc7oqr5ifjxbeprn9AbnQOGT8qOFN/80vdL06t9j5JqTSyYH7OMY89q4/9jKakwS5msG
	IAMz1/zHCLUpuVRg1Jiz9h2EJckoKacMAHy7+8PJ10nQfHuJCHIhJOn7Lb2j7mIaWJVxX8A7QHF5k
	hJIzCKGgK9ENuKyuyZ1Y8UaRFYuqTazmFpd0LH2DbUJlqxzLFVFL5IakhRvk5mnkFIfBYstrCjJY3
	CIPuNSmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDKf2-00000002LzZ-26Qo;
	Thu, 16 Apr 2026 11:13:28 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDKf1-00000002Lxx-0VTr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 11:13:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jo82+H92/KDQ2FDqwBaS1MYQPXqMbQEMarUHHSvbyAmQgu5tdvL1afXOnCAz5o/RGd/8RAXfME66+eGVyGZC8FOM3LmPrXnEte9eFrQ3gUespxSBmQ6fX/qFMF/9aqYATTxEo+BY883SMmGeH2Vqiei29xlcz0xtNz0kX8DijtIe/r7B0zCedKHgNTZlokUpZRy7Pf9ISaJJRTK7ADuYiNSqruhm5nY9eS6CalaT/x1azOGTKu0GxOFr8OB1Gmb8KHLwWJBAkIQ+4ARjdqWUNv3FuZcrS0K1nKBSlo7OFkZ9+VdOjFj/9RlbcatWc+3Nh8h+wbp7+AtZ8rFtHd8gRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FC9T6ZvCfI8ZSncwq/GUv5gX+E0Jdx5LCUfzOwlLyBY=;
 b=TCoJeDs7qaWwwXbtbcp42IubLi8K2hSXjgGN3Aqt/L41cra9Wk1yMGlwePvwF1alx6Iwrofv6+29QBCtred3fgPuJSpN1HFPLJ1YafKjp694EU2s5kE77mvEqDihaEFq/JDcvZ7dALaTwz9U7HQI/kHUF2JiZGnoCSurhBoCTrprez/7QGXQ7wM4eyEe9tkZHHYVp3VBikrgUK2wD4PAN8Y4XVgaikV4J1W8Rnu+VwDXX8cdZFrCbxpv83ZD8tUXfZC1NgaWaO+fXnDmDXrCfdrCvqDahx3lB5JvSHHURv5MCEH2ejgrxN8zmrjytYOJg3G20Tnw6NLiYymxYRq3DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FC9T6ZvCfI8ZSncwq/GUv5gX+E0Jdx5LCUfzOwlLyBY=;
 b=nLzsXyI8beqfvnV03xGMOU+xi4GNox1jvCM29bNKTC6xP31AQmwU67E6MhE5RbrwJkff1kJedBv3/MsterjVRy8S7n35H3kQjt1o8csSHXKZnx6ADWxttPPr6qPgh1v0YL5dVLidTI+3wucyM1RYt/jNL9v8PuNSChk+wSlAClJhApNNOqCJpsXXaSh7YDB+slh1ALDBE6DKTWfTWPi5JPJfOAav/ChISetwztWLAKqSBgnl1qEqm66o8T03UI1vygUT02yhUhnNK6oZ+zU/i/7eAT1nrbFNXWNQEcqDWGxNIaexDmWEpMbb8C04agEETCF85HSZk/6iYo9iWLCdPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by DB9PR04MB11533.eurprd04.prod.outlook.com
 (2603:10a6:10:5e2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Thu, 16 Apr
 2026 11:13:23 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.20.9818.023; Thu, 16 Apr 2026
 11:13:23 +0000
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
Subject: [PATCH V13 05/12] arm: dts: imx6qdl: Add Root Port node and PERST property
Date: Thu, 16 Apr 2026 19:14:15 +0800
Message-Id: <20260416111422.183860-6-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260416111422.183860-1-sherry.sun@nxp.com>
References: <20260416111422.183860-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0076.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::17) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|DB9PR04MB11533:EE_
X-MS-Office365-Filtering-Correlation-Id: 5168a33d-6dad-40b4-005d-08de9ba92cac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|52116014|376014|18002099003|921020|38350700014|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: /9bGCxP/76p3Tgwi9jfqJR8urDSFJEFBn16dgBp3gQ695D0TejZkhCJcg3ZVWUSXqBsEyIP0L0LmiVr6y9hMMYl2eTwC+IgGKexUp7PS/MGtBfdFiJ0WwAodQZTLeRYeI12o9ildLj6M0JLMN3xUVHAetlu+5ocyXzNdzgP1+ohXWyFZ84tK1gbev+XI4WuJtvg/FlvxM57pLolxFIiGw815ljLMwDxUIh/xT90ChXiR4eJdZzv9DciPOfqNH3k/9RL9OCThX5j6rSqyqNuA4D08/uTnudAg/636+4xhi7w26KhO5YX2THd12PFPpMEhQcsiK6IQPPZkzxES3FLqD9DgnYXVQC3LHFQglqkPyWGkU6tWpcFARxFjdM5WgWzirVw4Xb5t3of4zWheyY9XrF/8ITs5qXiQxeenkyncU7Sjz0Iu6eByPQeSSBWLi/NskpdnIRtU8yZwDRUqRfsICEWx+xblnMsDEqWBJ5gK0nq1kVJro/qpd/a182G7mQtyofzaq1PIr7dEfjPXWTmdmV0b0rn2LuGLC2gzbK4qiC4CW/IA28GH0YFJQL+u755XxwDChXiPf9bj3R5KLWLosaaSUkotpTl+LyYBEB9Nw5oll0QTH/xxaDb/p7Gnc0tQKk3HUOFcZ+xr4pzxYPXeoa7Sbu4GqUm2SYyVABfijBWdWsTdZ9TePmA979i0qNXdsDpz/wWvChIwm1pt1IhjeTedu7IthismSLwidzWpSeuMdcApPpZS3iG2VYH7ZdjS60oGRNFwMQbydipa8NOd18e0dey8I+IBDW6R0bhin0LDkNQPm56B5E2ttrgxS2eW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(52116014)(376014)(18002099003)(921020)(38350700014)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Zj3SbkLrhvu5ADqq4m7um/OpNvsqoKUXcqhajSe47ZJAi4B+YfRrbx9jNXPK?=
 =?us-ascii?Q?z7cWVReo/UT7vnn7VUMfBOJ2uZlygaeak/SS9dT1cDewHovCT3CsruoBxP36?=
 =?us-ascii?Q?2MornEAR/ROPgJ1yfCPCuxFmQfIrowgfjq3UirM8J3atu8M3TeFHm00B+Dhi?=
 =?us-ascii?Q?dnBsCrgwdAkSFt9y+fQqdYcjzRNKeFXuDGu0xql5oS/NVBx3mleRt20RwyK3?=
 =?us-ascii?Q?c+AsYpKd5KP4dQOC5mdLLMgtSb8iHB5IVyh5vRUB8RXv5MgAW+HvAR2xNbUB?=
 =?us-ascii?Q?XL8gQdQEfCOF0288dwlfcCLIqHXh5JQ4MZbRqWk6gH8C1trSxJ1SQZtGtL6s?=
 =?us-ascii?Q?GQ94nwXnLW9E9WE0ZZYxLFcshbPZ81bugo+v0bpe69KyCjf0Kl1cKTN4VQrT?=
 =?us-ascii?Q?d9MhZtdyC6eYjGiMzBKahZZFRhlTpFkAS3RSEnKJF4fKydOw/H1/g94Kw26Y?=
 =?us-ascii?Q?wApXw/BJR/X+mGcwenR8aVANLHUiNighptMQZ5cfWy0YQnYj+HWDkea3DZs5?=
 =?us-ascii?Q?pjBKR1gDti3aAVMjiX0U1HjFtjt8loClq5rW6OSNwhn7+KufkECqDLtqWn9p?=
 =?us-ascii?Q?T+HxCJBz38Y8K+seblP99CjAZaXklNlT/2b/ibmBibM/Wg0UrCfNGAlIXuDY?=
 =?us-ascii?Q?hLA3igShsrozTGP1NptpCgSfVFHL8jeqXIjOv548VO8QfgNIPpQin+IRjlpx?=
 =?us-ascii?Q?xa4k0GPvH2rDbsoRFNBLNLoch6AeW2sWBnTaUKrLa2PBj8r2CH3ankDpplAG?=
 =?us-ascii?Q?wnj8QjxQNULLRuhHSY6GOO7bc/4IHxpOIzYmLpGeKTqhImRQb0LW6gYUR/HF?=
 =?us-ascii?Q?YGBcuZngip+O1EWaJ7K4iPiWfEL9Bg4vIrKmSbrv4P5+nbMEqtAiE4JRu6Q3?=
 =?us-ascii?Q?hl8sur/+lVfw+2W3NoYATL2D6wqZdfbpfvJeNyXN8Xik+luyIZxnFC5hTdK2?=
 =?us-ascii?Q?6r9pOXgHbpDsCp1OcisoOZEb9URwoqmfPzsceRmoW7D9IwPk8rFzLD2Ni9RC?=
 =?us-ascii?Q?gFGVolzr4TxKZNU3IJS6oa0ZVYzq0QP3ec2joE4cool4oAW5q2t3U7P0zvZq?=
 =?us-ascii?Q?qh8lPEy/LYVXL0qfSoybd1UdIKrn5xp2SP1hDito4/IGqMOmOD/d3JyBCgt9?=
 =?us-ascii?Q?bQxM2HDGXzcwYHoKlvvxAGxH7zMtK4ujvqs8Y2GN//AuLpLNa4jGsRMHnXau?=
 =?us-ascii?Q?BuE0R59hLEWka5t0luUVibmJVA9r3PxTQTh8pQjO3SAbh29PCAGKowKpA6Cj?=
 =?us-ascii?Q?NMLPcgv+PDKZ05QAp1RMclhtVvz7ixCUjxvp04r5GUzrQu+noNGuqP90N1SP?=
 =?us-ascii?Q?/16OOhe1vNDdWBT18UtosZMDvgfOL0iHHIqQ+JrsK4vGf3zeotNAc+nc102G?=
 =?us-ascii?Q?N3/t/a7QSNBY35DBcP/+WLRWty9tSkoWUhmiBKvYvgdlml2GZDYV030djGuB?=
 =?us-ascii?Q?OP4FYYkJjkJ//WA7m200pm8Ay5xyk24JyclSAgPqGuq6Q5gBgHMmq1e4qcL7?=
 =?us-ascii?Q?87z5MZouIQeCKm/iABO0rFa2/JeSl7k0KZWhXVGWLfqrRx2FIDn1T3y8KeS8?=
 =?us-ascii?Q?ibN4miMSYD9d1V/879/WQ669oxMkGpzKH7T/NLZN8Rdncdr0x9TOdbPH9Ei/?=
 =?us-ascii?Q?g+pwgwzB4mAvIPErAfwgPCf60HbWXjD9czZs5VAA2tcPgInmOcO+GXBOcG6S?=
 =?us-ascii?Q?Bu66x2OLOuTKfNIwz4LsybCaMGFZTskMk3263g5mc8NQ6H7pjUDMfyIrB2AX?=
 =?us-ascii?Q?vIHLiCciWw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5168a33d-6dad-40b4-005d-08de9ba92cac
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 11:13:23.5131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3zPyILzYxSEvyOu49sn+RLOeOoT1+s2QvFdLZ91nuqEKRDxZcSlHMkf/fSn0f4QoeEwLyZHqP5kzhXBU6QEIWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11533
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_041327_161559_AC6A704E 
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

Since describing the PCIe PERST# property under Host Bridge node is now
deprecated, it is recommended to add it to the Root Port node, so
creating the Root Port node and add the reset-gpios property in Root
Port.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dts | 17 ++++-------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi  |  5 +++++
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi          | 11 +++++++++++
 arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts  |  5 +++++
 4 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dts b/arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dts
index c78f101c3cc1..2ddd71f09da3 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dts
@@ -323,19 +323,10 @@ &ipu1_di0_disp0 {
 	remote-endpoint = <&parallel_display_in>;
 };
 
-&pcie {
-	pcie@0,0 {
-		reg = <0x000000 0 0 0 0>;
-		device_type = "pci";
-		#address-cells = <3>;
-		#size-cells = <2>;
-		bus-range = <0x00 0xff>;
-		ranges;
-
-		/* non-removable i211 ethernet card */
-		eth1: ethernet@0,0 {
-			reg = <0x010000 0 0 0 0>;
-		};
+&pcie_port0 {
+	/* non-removable i211 ethernet card */
+	eth1: ethernet@0,0 {
+		reg = <0x010000 0 0 0 0>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
index ba29720e3f72..fe9046c03ddd 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
@@ -754,11 +754,16 @@ lvds0_out: endpoint {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&gpio7 12 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie>;
 	status = "okay";
 };
 
+&pcie_port0 {
+	reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
+};
+
 &pwm1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm1>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
index 4dc2c410cf61..9438862b9927 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
@@ -302,6 +302,17 @@ pcie: pcie@1ffc000 {
 				 <&clks IMX6QDL_CLK_PCIE_REF_125M>;
 			clock-names = "pcie", "pcie_bus", "pcie_phy";
 			status = "disabled";
+
+			pcie_port0: pcie@0 {
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
 
 		aips1: bus@2000000 { /* AIPS1 */
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts b/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
index c5b220aeaefd..6b12cab7175f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
@@ -45,10 +45,15 @@ MX6QDL_PAD_GPIO_6__ENET_IRQ		0x000b1
 };
 
 &pcie {
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&max7310_c 5 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
+&pcie_port0 {
+	reset-gpios = <&max7310_c 5 GPIO_ACTIVE_LOW>;
+};
+
 &sata {
 	status = "okay";
 };
-- 
2.37.1


