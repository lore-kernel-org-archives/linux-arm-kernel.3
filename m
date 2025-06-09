Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C994EC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 18:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KtxdfybRC+z4q6j32t25S1HAhXaSsDWINMjc2wuj3is=; b=WMMCZki2F25gruPQaX8V4+aFcd
	FBXbRFCJwekK8LD+9gMX1BO5Mtp592nhwPvl0/ZwahJbFKcLosmumYi2JFRIQQmbpoVM9/uQF4lvo
	YV/P/Ixk6fmIpbDcIjNznXrjtGFoimzh2M3QLywipClg9ISJIRsDoyMw5r3WfTVLX+LO19MT49hmg
	thKvVfBwgS935//nrg/dh0KWWo3fO8pf3KA3ULHARXwq6xBTge/k/VOMeu93wlpIeM1atPfjz8P/5
	qtKjxlD6CAItixyLUfqKfxsXfygeYh+4Z+qCNx9cdkZPesnYH56t5dzpPNGzuMibIyNlv/cWx/xVa
	5sNzRuGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOgpz-00000004ri9-36DW;
	Mon, 09 Jun 2025 18:03:11 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOfk4-00000004jGj-3gfb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 16:53:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X4f0NpWWYXogPsWmDUHmTgg4wZt2j5MMDUQ4RtlywMkYMi9gLlJUdhS/iUUEnMhWxxGEbntDYhwL6caYihno7ggVh1qfV4SsVeg8J7+HZfVYSYTbinAAnAPMmMOhtBT9vi0QpA93GJ09Mz0EfXFPITIMktZ3BEqgISEmV5vGaeVG/2wPcvrifsGdsZti7rul+xi7xmVphBgn/FtB6uVah2RMiuXFfGdv/UgO6SQ2sDDuch5E+aRRZwa99jUycHcfPu2Zyfbyp2RBTVSk/+5E55lonFTehbSMM3njz4A+WtqqC+U/0vtkgO9uDdyg1QaTr6RujslcucIv3jTE12dDNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtxdfybRC+z4q6j32t25S1HAhXaSsDWINMjc2wuj3is=;
 b=GcecjgaXtnyAk3aM5eSuQzpFqgozMJ3/NgexFvh51ZicSenuEwYVutgvlQxhxYZ476+QkXUo9UIZhwTht7LAdbXDDDKWk5kngv8eBesSX3uO505VaMd6xTe9dY6iEmzPdEjNw0bB5H+ih8FC4mqR4HOdwiVGA1yAimrMoh4JCAMZ51phCPFPwizkO4GgS0+lYGAksmycx2GL0J21aKWLzMrDBcfMr1SNw03vT4muVK6qI5ue11c/Az21N0sKPw2b4kXHR8+brwDy0g0SYmkYpkkuewhKPvkSpskvr8xnGqPFrpH4baQwojkmy7Yf9scgpxxDNmoz0/x+plLaLTeiRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtxdfybRC+z4q6j32t25S1HAhXaSsDWINMjc2wuj3is=;
 b=U4dY0vs0Nxd4NN8CHAafBVxevCSg4XNSvsCg2jQ3gGXNXHLLduqBzAc5OTg4iW0cSJfg54/+uJSN9UJmQHbBMHpOGhsYo2CXNJO3HxHD3g+uUXVWkFjnOjUPZLRcJ1ts2EmJivTEBpS4rSrhxgp6ingn4VdZnFETQYePPIVYEcfWHIpP1sz5J5gat5tsqKMoOMCvBVeKXz+fyA6VUQK8p9biN+YdUph4giNYZ4LVjl+Mfr1IgRbnHCQkbzw+C1c4PkxLQRBpoQ4oENY3lriiEyWFDWys7hgl+ukEWV34ONw4z8iTO0HYzB/UdAzAtZpDSiuOExobpcLBylcT7lmi6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10230.eurprd04.prod.outlook.com (2603:10a6:800:240::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Mon, 9 Jun
 2025 16:52:58 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 16:52:58 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	netdev@vger.kernel.org (open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:\b|_)ptp(?:\b|_))
Cc: imx@lists.linux.dev
Subject: [PATCH v2 2/6] arm64: dts: imx93: remove eee-broken-1000t for eqos node
Date: Mon,  9 Jun 2025 12:52:33 -0400
Message-Id: <20250609165237.1617560-2-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250609165237.1617560-1-Frank.Li@nxp.com>
References: <20250609165237.1617560-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0193.namprd05.prod.outlook.com
 (2603:10b6:a03:330::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10230:EE_
X-MS-Office365-Filtering-Correlation-Id: 930f0406-06af-48bb-3e50-08dda776165e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8LYRJp7gQpLYZyFyLtC72GBuKwr6DKMfEcXU710oD4Xo8Lzyt6lSDVVtEiLL?=
 =?us-ascii?Q?xdH7oewL1AFpkgH400XbiJHl11VsCMLsjnQyd0gv/pQgHJE/N1JSptj3ml4Q?=
 =?us-ascii?Q?Uk4lDYPwDkYRbbgqrhrKsLS0mbUKk/1TmPoTnkhlV+8anlaP5/VOIXXHqgwq?=
 =?us-ascii?Q?aSsoZr9Fx68adTTwbXe5xRuBDe7ug+ZL6lFA7Z3N1L9awQFegtE2OIYHjsQT?=
 =?us-ascii?Q?BUbWN9z06YNh8R/LL09QrhT3rGXUMRW9IlVCQ583L9UJSVfIMws+9qu56xxR?=
 =?us-ascii?Q?Sy0atZ6Hl6nZsJSi62AWsn5coIjhbYrSMsaiMsosx/gdKg91WUVRibgYc0wX?=
 =?us-ascii?Q?bRpYtdVjrL+l7XeG7aayf6Tz5C71PZJWmWhGXxn9qriw2ubC5DaBJud72WyY?=
 =?us-ascii?Q?5OQxMC67hG0pjungvJ3VypSWAmaCmL5QZEGuAP2bvhMq8ot7JmY5UT6GKpAr?=
 =?us-ascii?Q?fqTJPn7MWyHzEabI02ncOMUQTbb9fxn18ICjxwg27BdcmYpPauyO5kM9aMyB?=
 =?us-ascii?Q?iOy2tMdV0jhv6SkNQbu9VT0uI13HSu0Zs5Mna55BLb4JCtkbZxSAQn2s0kRe?=
 =?us-ascii?Q?l9042xra4hLzVryngsYMBLLDn8NjLts32ryqXmsWlHolE78S1SkmY/gzx+8E?=
 =?us-ascii?Q?StKg1dsprN9vZBd2vOzqJQUnftjQQNQ3MoZoV3SkUO4PQEEbmiKCBe1gJyb1?=
 =?us-ascii?Q?RHt4fSMwxjoulcxZPCID14VNohdyBiDWxEAFJH8rDarhzQ+/MZfBq6deDDyG?=
 =?us-ascii?Q?A2t3y68eR1PoGt+tLyiTCNqnNutNLHeGnGo4tgcqdw3NjEztUKiENe05+7bk?=
 =?us-ascii?Q?DKufSaO4YB0zlz4LI+8IBhnyBkPovCtOjtYLxN3KmhzcNqL+FA//3SEIYaSI?=
 =?us-ascii?Q?/oTgtmJl+pcD10n7RlfpPOcwmmFc/f9mqPakWrrO49LYolL7+5SRshQSQ2aq?=
 =?us-ascii?Q?G7JYggcGKopMJJFX2a338q1DmiGzzC0iiRfESuK0ekf0/spN6vWtoKY1VZR7?=
 =?us-ascii?Q?Nd8l5rHw9gMqD7Gdyos19xhlANfG9uUZHNWPCOZbxZVh10mThkYR7I29eDIy?=
 =?us-ascii?Q?p5D9xPUCL4K0aYIJ5Be7Lol0ZhclZxvrhVDqVjzazqT00wYDiH25U2K6rtvP?=
 =?us-ascii?Q?owMlAeRPYfXMltPixEX/F/3x4JRG8/8UX3Ut2kk2PLkBiF+hrDIRtPfwpb+8?=
 =?us-ascii?Q?tHnChI3q1QMhHv/yAdYQlNkF35ajTGGgpk5uCOcKuovDGxtR94fMq/ZiQlhf?=
 =?us-ascii?Q?gSgbIElgngOn3vXNXjfB02KCu3eX9xFgrCHfyhInz3Pf4I44zoeJidOlIqwB?=
 =?us-ascii?Q?bii5YwnByjk0Os7zWNIURfIO4JHLmCPE3otidIYH8F1ZpIi0J9YexIDwq/Lr?=
 =?us-ascii?Q?Zq4rnAdaC+7wrDPnbMfkdS0Xb8NAdvZwqJC59kudf7EdXfIGga/OxFsYCxDa?=
 =?us-ascii?Q?CjaHfhTIGbpUmlFivPh0u4dqzhY5uoGme7gGSoxcR9AWSHE5RsVZazP7/Awi?=
 =?us-ascii?Q?dFV7uvnxKy9TCXs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IDVrI8lARjxi4mmmuYNX0zOgCJzOwKaorKichGaBcxTzIzbHZEU9j1qfp6Pq?=
 =?us-ascii?Q?+Czj1APs5lUPdIcOADKoIDkOZ6V+78Nla4P6Jcu/sYNtl5p3fZ8GQMM6s/VQ?=
 =?us-ascii?Q?TfxphC2pEQehCXNIJ8eX8PSHVhEHIwQljYayTquhIvANLtQW3Y08M9Jcm7R8?=
 =?us-ascii?Q?sIWzi7rZsquOeG5tKJyG4YrYWajM8TrzH8WcpBjRKUKk3O2enhfnV8Ndzxzb?=
 =?us-ascii?Q?g652R0JoLDuLeNY+lkCciJhl11tvUOK2c+J5t0D9si818OdtV3SOPQC04xb8?=
 =?us-ascii?Q?hpqmqetdn1HZ79+PqM8opeh7u/cgRX96ATfFn9JLzWixLtCiXu/0AERDif9k?=
 =?us-ascii?Q?0GtcTmWdgiAbX0NsK+vBlaQUge31EiTWH4N0i9uRpqCuLYe8+YTN2CraADbL?=
 =?us-ascii?Q?HpGiaYpYT1hOlSLXNyqIzA9yep1CtHo47lbTJ8UDoanTkneH58TeM3zUoLkT?=
 =?us-ascii?Q?dhyZsT5Yu0gC3QJOHqjcIWg2ecPlRqHCb9jtxbEGqBHaLOA8UL9VaMCUxD+H?=
 =?us-ascii?Q?hUor3WsbN4X0wlkzM5/xtAPj3nmHmA0vEi0eQM4ScuzdgCqORIAhtWvtFwqp?=
 =?us-ascii?Q?ps9TeAgzQOccyGQborVga5V40h8fBQDCmTbeOab1/3WVOmMepXaFONZ8fo0O?=
 =?us-ascii?Q?YSTmCHnLeXsnxpclTqnuoHANIoS2JuuJRQ1M9BXfbTdSvzPgaDKZMr0Emp1h?=
 =?us-ascii?Q?VytU8D6jbM7BqT0XUL2DeB2AttwBIXmX7pbuZDl2xHN/zpuwNM85H5XyQmsy?=
 =?us-ascii?Q?9zmaG1S3MgCD5CUOyO2WBEGtl/zrmdaDNs93rljJDgM0doywS4tt4RjT24QK?=
 =?us-ascii?Q?GX/6TGMSJH+n+PVv8SmM3WURRAvN84tTIHUoRvsclx1Egqi5enpiQsUDBDwp?=
 =?us-ascii?Q?6/FJTyxOhjceqeU9QxKXBavRo0TAqsQnDVD7o0cjGbwqY848Fqiii3t1926K?=
 =?us-ascii?Q?L9gxyC/T2nVedTB3igbC1cEKsG5nTZCBnPxFPVROw7u2j03pgTRMmnEb6Ess?=
 =?us-ascii?Q?qyr2MjhY1JQVy7flWNxjTqjlmzu5GVD/LCX2n7IKefVPX2x1phGSfhYxXjA1?=
 =?us-ascii?Q?ku54IQ6vC+QQbql3IwluKIw7BTQ4k3CMC5YYC3822dBGw+wKVYtkDrhYxfS8?=
 =?us-ascii?Q?871b9YFJY3X/MEuA/t/mI8feHw9EJMHZV2BDd2fbzv2CsWChrZT+EZUmVmln?=
 =?us-ascii?Q?xsWbekWKnB3u7XH267ne+5LzZjEy1OTYwm9KrNh8AIVBDuKuOBR0C+qbaAJj?=
 =?us-ascii?Q?Hl/c1ng2sZhrw//0nJ+0YtCxIq6BuaQV5CMjqWF7XQGe2IUsO33p00QIYF4b?=
 =?us-ascii?Q?MPwnNsbcN34VCiMeISRE8y96E0p64CEIgTebbQHTTJyeNl85e+5reDd4XzXn?=
 =?us-ascii?Q?OOaIdTu8HT+Zqszf9CHAmAC4p9a0eCiwPpCdzAmdcnL1HYb6MfqXC5jDQfdA?=
 =?us-ascii?Q?fMDnrX+Z+ZHsl+5pHUwOCTIsiXRVe0zoAi6JZmv1kQRqGQiOxqSrz6K2n2bk?=
 =?us-ascii?Q?XVLyae+nElD0peGZN/lEIwPgntQUvm5dMbjozJelY5xlOqrEO7HP8MVGwROP?=
 =?us-ascii?Q?7N6bTrdk0Kfb3ZiU6cIhLENXnOgtWG+WctAWogm/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 930f0406-06af-48bb-3e50-08dda776165e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 16:52:58.2382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y+2sKfG3Dx23SWUtcVe1l+/y8NSZG4YuaSrS6YkrOChkBDpm4AwsROCvnCc+oApkbzhcRiu//7iLT41qeJS99A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10230
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_095300_919547_EA29CFD3 
X-CRM114-Status: GOOD (  10.72  )
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

From: Clark Wang <xiaoning.wang@nxp.com>

The "eee-broken-1000t" was added on 8mm for FEC to avoid issue of ptp sync.
EQoS haven't such issue. So, remove this for EQoS phys.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- add peng fan review tag
- add missed s-o-b
---
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts | 1 -
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index 8491eb53120e6..a6ebeb642eb65 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -217,7 +217,6 @@ mdio {
 
 		ethphy1: ethernet-phy@1 {
 			reg = <1>;
-			eee-broken-1000t;
 			reset-gpios = <&pcal6524 15 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <80000>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
index acbd981ba548a..cceca130c5b4e 100644
--- a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
@@ -184,7 +184,6 @@ mdio {
 		ethphy1: ethernet-phy@1 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <1>;
-			eee-broken-1000t;
 			reset-gpios = <&pcal6524 15 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <80000>;
-- 
2.34.1


