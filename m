Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C3F103A9A8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 11:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDOXt1Lp7eP5mpi7Y8WE2CktQeu6zGJWAaXA2Zd08q8=; b=fLthpDLgciYhQxkGAqiJ5JJkiu
	Zir+XeWwjbwU65X2BkCan0vt2ejScOuvHuMITC2xnJsphfRZ7wzQNC3InPpy8xQ3FDJ4MdbxIH7Ph
	xkzuQZVwRwkPjOVFcOWCv8q05WErcYf8QTFWtRpI2caPm77mmgxd/6HgJymt/ixd2eIEnMakp1u9h
	Ehj2ou2jDZjvdhOAWO8vO9z4JWBF+ebrm8Is2eP9ug+ELf2m+myzyc6jt+uwS+g8z+lXkQrMz9W22
	3iUvlIKeuBgpGqZoAKmxbkRFg8NaQXAw8gPBlLwOXgGsLoHGZBWauF1wpZ4Bphfk76mHJHJ5VEy6Z
	kiUjFQqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5M0K-00000003Ci3-3rwT;
	Wed, 25 Mar 2026 11:02:28 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5M0I-00000003CgJ-3Hgt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 11:02:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dtxWG7bW3yn1l+jEihwh+p//dFc078ZOnAX7/GpWHiigwkoa+iBoq5UsE11mKR7ZSCvYcSxGnIQCEcAl4HAKw68hGW5fmAdQwVjVZTY89U0+x0OMR2YdmMYQCenZlKb78p8qn41pu2Gv1ttAE86e2hVz2W4LGGXRS3m4fvZHEoM66qjchfXXZ7B9+W3aXBGoUY3cV3q332AVJl11jivwcpGTKturOCrudJO8RwJ9X86Jzr/ESXytE92HQwfhBmjB4tjRmqDxHNiQclgsO50an61kFlFirhjptJMVh2hhUYAsgfkr6W5R2gxOUOflefFCY5JW0ZzKOVd7s7cl+Pi5Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDOXt1Lp7eP5mpi7Y8WE2CktQeu6zGJWAaXA2Zd08q8=;
 b=w73xkIQ+WhNKfFixpVoVv99tz40ik/nRrG5m7ibrL2hO60DIgUlhtwXaOihwm6gGYjwb7VJmEaLLompFtPxJgmDHG+BJuAY2dztSDbXldICOqGtPoZi3P63NvNbrdPpFbvXei4Ab+tcSbd97uEV983mcl58xGmhhZdl86JE7aB76cxRNiIdFbKK89M3FDE8Nrkx4qm/4CVYhQPgjYFxKr1Pz4CUJBgknWsA8BvCE9QLEfqz3QNWbGaO850MWDyQ9r2IdtcUGph8ldbi4wK4Nf0Xc//hFBa7dbWMd7AUR71IPOyi28XqxpFO0P0U5Y/Z1gUc2VfL3y5FInkCXgVXOiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDOXt1Lp7eP5mpi7Y8WE2CktQeu6zGJWAaXA2Zd08q8=;
 b=WE1OqR4trE1vC0H3ZqbMxAkPA5SWG2tM0DXqjjrPa4nSOBbl4hsW3ZDqLDUoMz2WBf3l5q7mHsq3ZxOgJJhcG7jEA1fyyN4MTn+LzBYrN0CeiwhAH51F0ZlvPCZmz0e21D5SMJdMOk1grfEhOOnLXbflU2ojiB9r1QdAz2XiXcHySoz20usycbgXJ77VMpsL72FHb/vsXJKXfJzTPjrgImpvpHPW5csxG2uVQWYQ8CGEJqO0DNR8txpDi4Sm3cRNxt90ebYxQpC1hOPiCGPyXh++juiNBypCeg26+OkSsDGXWdx0gm+oCjyKkCtPHSDKXQzQLMnRD2aIeSxQfAmEYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PA1PR04MB10398.eurprd04.prod.outlook.com
 (2603:10a6:102:44d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 11:02:21 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 11:02:21 +0000
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
Subject: [PATCH 7/8] arm64: dts: imx8dxl/qm/qxp: Move power supply properties to Root Port node
Date: Wed, 25 Mar 2026 19:00:57 +0800
Message-Id: <20260325110058.2854742-8-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260325110058.2854742-1-sherry.sun@nxp.com>
References: <20260325110058.2854742-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0174.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::12) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|PA1PR04MB10398:EE_
X-MS-Office365-Filtering-Correlation-Id: ad5a170d-b2c8-40dc-4a95-08de8a5dfd20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|366016|1800799024|19092799006|376014|7416014|921020|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: uajsl5f98acXCAEGRo2SY/Kr74ORWYCcJ/Dz5Z9aqxfXd2deHVcsh9N8QK1i01RFRrTSoTCLU4oTn8sM75NTNksNpf+CtWl3YXsr44I1U0sgt4l7PY0XFFdXHKiO0lwbxBNo0k7MxMOTiQC/z0ZWms1kiYPkNH1EPgjww+LhrRksE5CoNVz9OBUOjw7DfvC1k54/ks06eqaIzi7MmcAdSeNcCAPYI2QmwZEjNqrf+dRdmUWlBArUt+rDwwR8qJJL3EMPTWnbI9OQRjbxx9aCyiWr4GkoKRKkf2jMtURUun7vWNQ9xNHrVYt4myZaPz9qp8YsElamfeVahW0PebjUt++M5LQuyz4bQyceNnAP3ApKlZ9UuwTeeoTxn5ZQWzHVh8uF8gmpHM/bBxL40z2SKM6MvzV69bn6ahKgeAQ/yyS6U7lyflqOPSdUOkZ02stylepW/Frb3eiIPpNCpGBoRLQ7VO3ZvKcQ3ZViIjp1RLaVOeJQHNqCN1Igx8sVEkYRUdmrNeTcmIV8sJ7Dwpayv/zrr18fCoEUwpCNPiSMLSt+TP6F+T2Lwss+LYTb1mBQfAqTDpjFYejWm7j4HTCaw+RMGRElWNG/1xmpuYHpyQoQT2xSbO2wKu4r17E/8u3SQg/Ktq4oEN8/7kp1Uo3xD52GcgS+/tpSBYr3yqs9YDaJODAdzMX8xCG2T+TnM1eytvnL3GNQn0RUz+fASVp4xHk/oFMVd6n6fmR1P1Reu9aTs9rsth71pic485Q6UQaz5/WOK7P7Ra+XMmvJEZeT6DzfzXhExtRxBYby/hcv6JhmJ2xGrxZRh3eV0DKrZzoD
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(19092799006)(376014)(7416014)(921020)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z8pwjNt0oJWUBca12DeJifnLkh4wbuOc3xRp/fqjb3A7QGBFxyrPwJqPC+Sk?=
 =?us-ascii?Q?u3hJ8Lx9OWKihQHao18dyRPAlmx+pJkCdAMQMVdQ8c2O80KiikQUBy+E65ZE?=
 =?us-ascii?Q?C6chD8M2PZqAgLeIzXa7W6kBVDGo1wJsFxuOOd76m2IUdfKPjOIQ5tGL6n5P?=
 =?us-ascii?Q?dysIX8rrarlpJjp2CntnIGfQniTXXdH9loWTO8fdGk4hahhsE55QXy7edBM+?=
 =?us-ascii?Q?YF0I4p4K2al3trGmtZ0ezzf8RAiZexs+Eh7HCZ7bZBFJvHiH+A5RnGx6Yn1p?=
 =?us-ascii?Q?TTvw+lfrWuXMjjEj8zXE3VkJ6EpNQL48bklkYoKiPjb3l1IqbAJ0q+j2yiI7?=
 =?us-ascii?Q?6HGmtgty18F+P4n1oJQxD+yuv7vxfF1wJRJPmKpPFJVfUuSTKS+HksvG/PDt?=
 =?us-ascii?Q?CBGJqHsTVntuh+qAXm16orkMgSHAXuvpvd+TW9/t+NljZOC0O8dXmYk/VfEJ?=
 =?us-ascii?Q?+8ku7hZEMpTjh9uv2FVq3bmLMCujVYGA9RUJ9wgRlfgPROko4eV00cS67aky?=
 =?us-ascii?Q?uVkU9peK4fjVQWKKabCrAxULUH/+3mhAv4nt1aZdHaDPKIEwy5bScgphjQAG?=
 =?us-ascii?Q?mU6aKbWhFIpnIHNA0QJieb+7DBkQlt9njZPRFjyhGITnhJGowYBh5DJcmsfZ?=
 =?us-ascii?Q?10R6uOw7s6k3OkmBtzkWo3cSNbBfh2uCZV/0YZ8LftiWE2NCZBaWUN4pQGgn?=
 =?us-ascii?Q?9f+bdlkcWo8gkI32nR1nVRo1ur8644OZg80rBzwTITMaFJY8bHA1uHKlmIsG?=
 =?us-ascii?Q?cApXClzS+/+z/p/dWS5JUogcGhjmaVCTZUypeW2Ks+Hf8SzWCBiWZwtHEO+q?=
 =?us-ascii?Q?FLQtLC9Jgn3+QW6ka5m6m6goPfkBulP07hxyKOk1b199pNykQhqxVIxxrGfP?=
 =?us-ascii?Q?NKJfKBJMcYjBF8fnaKj0HRUW23C6RAYu6/BMcW75zXltjvBEFoD6pZhk4mQG?=
 =?us-ascii?Q?CwneeuebDsn8h94ue9WMir3HBsTWKeDVokWAt5u+LppszPEnZ615HZi5yMrk?=
 =?us-ascii?Q?LSPLxK+ZENl28MQltqejPzLh/lZIP4w/HmCaGPkHsJogKcDjizHHPPXKpcvP?=
 =?us-ascii?Q?R4xcVL44jzdR06vYJqkye/qOBqleuuAY78wqIZvSSkhPAlCIwQkPp949hJOP?=
 =?us-ascii?Q?AGWNrgSG2mPOSrIob8hFxc4S50YRUnPB1MqDk5bYXVUzAmJ6yeQrwUgCeyD4?=
 =?us-ascii?Q?18M/mIOiYMWy43dyTQ1y8aRXezYEpMJXkHhoMtTIjQLB9XFVcopPr1LZwQiu?=
 =?us-ascii?Q?nrnrrJiBtnniFL+NRuIzVmjpc6ntvEUNQwwLuF6TJQHswxKc/AT2UwwyOCCh?=
 =?us-ascii?Q?5V2417MHF+U2eABd5vYws9Icm9qQzfBAGqtHFtYvrzP4ofQo9y0HX2Adz4xq?=
 =?us-ascii?Q?sE50FoIlq7TDhLPZroSZFTHyU4/kBhIr+PsMSJ/wyMcI39Eip1qJ3zJX/jw+?=
 =?us-ascii?Q?HcwO+MKOTBWTEgj5vMs9dOXgzhfafHiDu4TCd88+6EVkRCs1OoTQjTucXlyo?=
 =?us-ascii?Q?whKLjH3jqOhiAKx+ZG0ryD8YgT2HhTnGuD1mullu0OjG/8C6+fEWG3NkFJNZ?=
 =?us-ascii?Q?L+sH3/APh1god7nhW13b5UhF3tqTOHSqDDk/tLWimWITLRk+Oncc/6pFyiep?=
 =?us-ascii?Q?vDBHcScz316g4cNVT9t3LTfYrvtN7872mit9PJHUIFruOJ5OoX/wxAids/la?=
 =?us-ascii?Q?Eg52MrKXa5XC0EQrl1BW66RQqTvseFVSdbPVgaRzD+CMsvRw74uBC2aD58gw?=
 =?us-ascii?Q?7IPJljVNqQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad5a170d-b2c8-40dc-4a95-08de8a5dfd20
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 11:02:21.8917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uhihRpC97oKgx1PHXz0kOWcqEw1SCZKPgj/umTteKI2iF7O9bxdOEb4uouAj1jOK/TqFBaQ8LpjXA7FkkdeGPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10398
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_040226_828562_1C7B49F8 
X-CRM114-Status: GOOD (  12.41  )
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

Move the vpcie-supply and vpcie3v3aux-supply properties from the PCIe
controller nodes to the Root Port child nodes to support the new PCI
pwrctrl framework.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts | 4 ++--
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts  | 4 ++--
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
index 8f2c2bd00cde..5f2ff7df2a95 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
@@ -653,8 +653,6 @@ &pcie0 {
 	pinctrl-names = "default";
 	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
-	vpcie-supply = <&reg_pcieb>;
-	vpcie3v3aux-supply = <&reg_pcieb>;
 	status = "okay";
 };
 
@@ -670,6 +668,8 @@ &pcie0_ep {
 
 &pcieb_port0 {
 	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
+	vpcie-supply = <&reg_pcieb>;
+	vpcie3v3aux-supply = <&reg_pcieb>;
 };
 
 &sai0 {
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 02f7589bd860..a199823c313c 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -804,14 +804,14 @@ &pciea {
 	pinctrl-names = "default";
 	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&lsio_gpio4 29 GPIO_ACTIVE_LOW>;
-	vpcie-supply = <&reg_pciea>;
-	vpcie3v3aux-supply = <&reg_pciea>;
 	supports-clkreq;
 	status = "okay";
 };
 
 &pciea_port0 {
 	reset-gpios = <&lsio_gpio4 29 GPIO_ACTIVE_LOW>;
+	vpcie-supply = <&reg_pciea>;
+	vpcie3v3aux-supply = <&reg_pciea>;
 };
 
 &pcieb {
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index cd127d0a0a75..c1d920003b1b 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -724,8 +724,6 @@ &pcie0 {
 	pinctrl-names = "default";
 	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
-	vpcie-supply = <&reg_pcieb>;
-	vpcie3v3aux-supply = <&reg_pcieb>;
 	supports-clkreq;
 	status = "okay";
 };
@@ -741,6 +739,8 @@ &pcie0_ep {
 
 &pcieb_port0 {
 	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
+	vpcie-supply = <&reg_pcieb>;
+	vpcie3v3aux-supply = <&reg_pcieb>;
 };
 
 &scu_key {
-- 
2.37.1


