Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139F8F4BB9A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 10:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e87oTYFo6x0wcbv2G/DM3RlOz3RZ3sk7332K9QNWF+A=; b=NwsjO9lXqpAx8efS9zNvAaNq0w
	ekRMUiM83IKGxd8mwYFSz3uhsO2+JK8PRwrKV7xbsC75oLrgxKSKwWzL3ovTzWh0SnyIxEBAAXYU9
	qJsu3k/lv3XxBZx4A+xyP+eF3Cc4Ko1ZMhpmhOAnhMM18XheHiYhbnt8D3uqcfgvXVSxYcVI9hFJ6
	Or36KFT3InA10EeHRDHQCpGsi/Q6VjsNeCmniBlT8EkFjAP0rPNKBbwOeQxlskU234m1afwD/Bzlv
	pjwMeCRYefwH51fA0eC5vlzG+A0ANkEFYnLe/juctwQNZCIg4KOFTtFTZz7rRfsYe4I1H7IOlpuVx
	oOsvjBiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCXa-00000003qlp-0obR;
	Wed, 25 Feb 2026 10:54:50 +0000
Received: from mail-francecentralazon11013064.outbound.protection.outlook.com ([40.107.162.64] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCXY-00000003qjl-3UcO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 10:54:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MpfPkS94d3WUXThUn8UKPGTlbqRvSEGsEBEJvIKPXSEZfj0yYnA/urjuQNDCPpptA6bFz769l9fp88qMdcskuEpf/jRpzYJEg0FYZw5mFQvoLP6YYkrorIn04/HBV0J5sI37mgH0iWRZIfbgJaTbco84PvKb6ubS3KNiXUw8SN4hDe8I9CksrYjzzXsrwGXt/8LAkZRvfp9K7JujCD+wXkVqbLB1hq/DnWTh6eEM0uc7cVUGmnSb7rl0lYAsGk1WyMhRM+D6H5r8bjcWtDWy84XDSHS4Za1l7z9XBth/3mARJVdXzmp/PITKZvDbqAST1mA/n/H533vn69KTI5Papw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e87oTYFo6x0wcbv2G/DM3RlOz3RZ3sk7332K9QNWF+A=;
 b=l90+m6hDm8o3RCECZQDK2Okm3/wpsTui2V65Z71R/Zil7S6i6MjBBgagwt1se0HdfvE4T/7rDk/o9h+aCAmaQpe42QIB7urmHxTWRtKaVY5jhxPV3ddoRuarlyqMRAKJRO1FVCj1aD6nq2vGX2Rt8gj1WBCJULoFN3+UNfDZHLswmkqOwtmycn7K/CxuyjvDwbp13Cb26vo57olF1pbFE7CXgLB1VeLPiJk0na/HZ5RFJpaFnbXOBRWrpwxtYNbplGhM8+zwYKlXHd+0pQ7zjqcuUBNtlsgDr5pwWlYBh3tAkNTJaUPgwH1CdTZST0+qR0nP0qCOvAgxH9WYx6h7lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e87oTYFo6x0wcbv2G/DM3RlOz3RZ3sk7332K9QNWF+A=;
 b=dkFgfVgTGQVd9xpYkVNZP+ynkOKCEP5J0B2ORNAfBSKpBQSKGAbsd92WnDTF4yMNuyi/RVzv/gkQdGXzDGt0GDg+QL7ReSl/3KW8kKM4TkyzoNIf37oC751E7dGpPaKO4lTPznZM+CCXloBZ/CnAjetAt4JGWDNvkizcuaCPLkJfuKKr5xWqp8wEVgkszklWurBnTWyyKvjv7rnlri82t387pxnYP1BtL15l+M4qCypEB9hY/OMRJD/5RQf97yR8yjOkWOyYQXttW/1JU4wQ5lNkPzLMB7QnxR8LTmZX6U4mIFPo+PQ7ZicYlTw4ARfUIyvoO88GBhGKcGBT2Srvhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AM9PR04MB7668.eurprd04.prod.outlook.com
 (2603:10a6:20b:2dd::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 10:54:44 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 10:54:44 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	Frank.Li@nxp.com,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V6 05/12] arm: dts: imx6qdl: Add Root Port node and PERST property
Date: Wed, 25 Feb 2026 18:55:16 +0800
Message-Id: <20260225105523.748775-6-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260225105523.748775-1-sherry.sun@nxp.com>
References: <20260225105523.748775-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0104.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::12) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AM9PR04MB7668:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b3be93b-2d60-43cc-851c-08de745c48e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: olCek7GlfTLhS5fBpFSEvrHjPTTPBtzwD9g6Nzi0VHQ3QLxCM1mq1EKyADWjMOPifnqQqoX8I4m7+eZIWOYLkMEGv9DlZ7PepJgFkvmnitb5C/ljHRr+p5eUcC56L+TNelajPhVnxSV07erzXSFkbIROCHqRyT+4ap92270dabZ9fAsMtvcV667kX+KdBubZCaRiT9+zxk4tWo64nJlEed6msX1tDE5znT4jioXljc6k/fZBJI2uVE0zFUuceLC1qtQM80Msgw+NpD2BhOlM7IwIrO8Pa/TjW9/cNVwpHji1WutW0xZH5cxbQwZn2vOg+Q3bVjgvskYAQGhc1QsRygzgMWSNvirJsVLbgo/w3HN0dDzDQG0XF7bu2fqaGwjovXywi2CvTWenUXS9tZrv9zf+3TrZLqmB3cqk1im3MnnXbT68NZFqfGSEyL4jTBG49DW795y89dvna510mHtq/cjv9jTfC2eJ+iy/HK2xK99KSvRSA3eYoJgp18M0wdsW8A19I9Y7Jb8Pf7azaTauSXIQGTnoPMantyTrNxhSE9wveKr8UZfOsjymTBem2LYFadYI6T9a3shqPaXJckcSqODuaziAX6paZ7XyXFdTHehw0KnE1BScPOMMHsmzCN/UdC8gv2hwnm+5JZ3ejQbthE4+JbeEdKQYujb4ZfvQaHxHXr4UEENcC+LbAWaVi76QNIiWefJOgd3RhvU1SpJ5tekMbzzs6yrPs3TOqwgbYk2GiO1fJV+6WKgYChenVBMoqUYN6LzeH9F2dS7hlLnDeXyg3HeaDRt8jIFLDWDmVsvWV7hdxJrUk+wNiH6iqZ9I
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(376014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2djC7vNk8SxxexO1nqKmx+daXc9UOkK+6xI1torLtzJ5v59WSPrnwKqKhT/v?=
 =?us-ascii?Q?ltY3XEYoaZ/+IqSIgbNRWQtKXsTCf59vxgGxTwp2cNVnV5zJmY91HjdZYoh3?=
 =?us-ascii?Q?CDU6DJKozEBDMiXTZGPdfSTrmFHYyjiy5tKU03HWnmdJs6DjkCcv8JwkLiZc?=
 =?us-ascii?Q?8sbkihRoyMkUk0XhFEcLaKeOryN4hpe+0yuzj81gSS4S4eUPmE+EGy2Zl7I9?=
 =?us-ascii?Q?tZrVr8zvFKpzaQWih4n6HmMfNz824jH90bULP0Xgg9AW8RnIPC4lctKSzvDa?=
 =?us-ascii?Q?yg0k48007+C9UG4bFuqRlCURb6VYWeq5FEqBBEtAr/MJheMOwtdg8miux2vI?=
 =?us-ascii?Q?cU/KP/vA7SeM7I1NGJp+Oly4KgNYuoESbd50rtdedClCjQkH6nXJ6uIZ9MmI?=
 =?us-ascii?Q?8tgnNyEQhdiGwQw8tn7GAeQsdl5E6KGxQs2drbEbxQyzV+RConvLr1CT+XzT?=
 =?us-ascii?Q?sGB73wkFWoKUljnaF3dKr9KYkzk2gBGorduiwdkrNecdh3ESErQE0psGldj9?=
 =?us-ascii?Q?aSgxDJRLKPHnR0Z6nKBs5tIUeMt5LMr60ls4fZ0OpyRPz2ccbktGntqnTj3O?=
 =?us-ascii?Q?Wz2I9+/bwS3ftEW2c3+5Rqj9VCuik5Ifg9gYWz9QApitxjfzR+HpJMKJL6Jc?=
 =?us-ascii?Q?uVAfcdU0HbkJws2UMqtAaygPEgyAt6u+R5KdoF0maif1K/NHah/qAcYEJYTH?=
 =?us-ascii?Q?fCn4fiSp6qiAq7vJjM5DX9ffoa0Qe9ZqnBCw5vNSQtsr0ElPVddnccRWUYlX?=
 =?us-ascii?Q?IKLBHw1rKw4BTXFF0EPazsmNmOlil0pkL8CjAt8/7cAlC/Bv94lHe3JkOoIO?=
 =?us-ascii?Q?1C4CrZSWHEYfN6gaMVbW1Ssuu6TewWTtJ1Tkamf/LnTh+Sken0pepW3nCeqQ?=
 =?us-ascii?Q?MfPn3PWcHinnsXFAucd1yVOoZ2xFIvPRHla/Q+TCas3+kiDNblQph8zWIKC5?=
 =?us-ascii?Q?jH+1gLjckt/MAhm2psjZhUhOVaqFr2oFkkrig97MeSM9Nob+/scyb8YSKBLj?=
 =?us-ascii?Q?pAGFx5edOhV4HK9QNDTRxy0jywRFcOPJVZC+CJcPnEgTMcRHpMvFMXzixLrU?=
 =?us-ascii?Q?rJ4kL3msLcJn5Ov+TUFXik/tjpcXhHmbKFpPxLezUi9aFpvED9zXOSmmc0Hi?=
 =?us-ascii?Q?lIY9fhsKV11FZnyTFXyuzHNWxe7uNzq/DwyucCf5R6SeRvEzks+X2dtCdhTB?=
 =?us-ascii?Q?B7UaJbQXeE5262CqD4P//Ky63r+INLkACIK6c9h9rMZ6EVX0/6s4n0QEDxpI?=
 =?us-ascii?Q?6JlZkqFktZr0XKSlDoJyCsdWgcQ2OkaDisacu9aJ/GrWad37tGRMWLc1eqRq?=
 =?us-ascii?Q?JxPDL27uhFFPS3d2V+NYDHYz/lYjGhSscqvZ8QBEh5L38C8pMMyX/u1Yhcqt?=
 =?us-ascii?Q?H57FfBnxD11msthRJ0Rx5VuOXP1/tvaLR9J/9BUpwc9570UwfA78rpy+QJnk?=
 =?us-ascii?Q?hzMpSSbbNnfBj+tiMRRWNZqW+C8Uu7+ogrSrcoILsNR+igVYsQNTXduubscP?=
 =?us-ascii?Q?ODHcVztiIUGbSqZYy6btAfE5sb9j4ucvSJ8sTTR/C55YTvNntK8nwdGrLG5y?=
 =?us-ascii?Q?DioxOagUI2iPkuphC6LlqrGogwjA7ag7pYhWQlVTxD2TMRI406zCzt83RNjr?=
 =?us-ascii?Q?h7zvbXD/gESDnOKvj6d3Qhv+ZByyQedl6F4h0rtwTMxSbsc0iYCh0j+jpLs9?=
 =?us-ascii?Q?ntsDyAsOlmyblWEfhd8CMqUkKFbDWrpNmSw5TFYrDUfEH0FlL3f+k/km8phl?=
 =?us-ascii?Q?GGzOCy+Buw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b3be93b-2d60-43cc-851c-08de745c48e9
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 10:54:44.3329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: spnVEAtmENxxNdZi11Dq5IoeIGkRUPAHALOt1AS7hzMf/yVjE0deA5f1f+07gu5u8cG0fw9rj5kYetPFJN4XnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7668
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_025448_872946_6ADA343A 
X-CRM114-Status: GOOD (  11.08  )
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
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi |  5 +++++
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi         | 11 +++++++++++
 arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts |  5 +++++
 3 files changed, 21 insertions(+)

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
index 76e6043e1f91..eeb376193398 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
@@ -289,6 +289,17 @@ pcie: pcie@1ffc000 {
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


