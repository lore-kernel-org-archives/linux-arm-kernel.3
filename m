Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935B9C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bAEEgP6dyTLmybqNXaUE2EHyk+3HifBCatGtI1CHAZY=; b=QmeUOAMiTvAWraO5CK9ZwKMcU3
	/yOdY4nESd15OYbw4phJrCjNqa2O6jxOEd+a7AmPsI6mT+o3cs14vYLyUzdOJaWJc+FzM3UAtR4L3
	msEEU+WwupE3Zdf1GzwdVUjJMNDdP91mADSQwdnfDynKz5Qpu1ZQvejCn8daQgzjpNaraihvrh8XI
	Yg3pXZWNVPsAL7gnhfHLBjC/YyB+FAAxTg5qj4tnkGF0v6Re9l2QgF0coWg49nSZrTtArvVjF7wqT
	Y6W/c4Ty4456yuh6LRPF9ZAAfe3Hgwwi/6ILZCo9vhwEhFldkL3J6NsQk7zu5E84QT/fJ1LinuqB4
	OY0Y7L/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumE5-0000000270q-182p;
	Fri, 14 Aug 2026 07:21:13 +0000
Received: from mail-francesouthazon11011045.outbound.protection.outlook.com ([40.107.130.45] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumE3-000000026yp-0sOK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:21:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IOOXk2j4DjFh5Z5+Xip3dMDkGeunBC4znUzw3Ss+rOC56+adV3Qt8xDerhxZM3/OImSVn3vv6La3gGuVHpjcID5FD+c0e15li/RmIzKPgTiPfyst186cQrqOaJAxIdQEK7SF7QqMXagFMUzdNGt/ELBeIz1c7DG5rk9C13R8B09GDAWAxUSbUa2Rs8aQBKPxq5/FhwME1IC45thVRqQJk+RqHD/Q1oiLmAY8J/qwZgmA36FK8y5LW5geQwjZ8Z/c2N3b+wY4aXnvAICb6yonNGlwvJrzAAetcDwYltjiYOLmnDnE9SvNhPmShq6aehuYYyCFL9pfWHhkGdRtdR4ryQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAEEgP6dyTLmybqNXaUE2EHyk+3HifBCatGtI1CHAZY=;
 b=OPvgUnqqu+d21GWxLV0ctaznh/jJ/zF5jNUlz4gHC52lygEanDvoB6IksRbo3azJ5yjnVOTDk/74jYGcsHrkKOBvGRW9SLIPTNPpJKSfdxmn74EJZyJSkzlSI9OM4zw7MElzVDzNKxYQD/+NHFVQBstm7gXNKuDj3as02fdDhjvzUMu7QQYyqLQTn1hSZgB5HGwvlrHiapxOQnxJFtXHYGdo5jx9UE6mIdlBs/iobuXSwVFRa+Mau648IBR9pjEl/EGSqUMeKCBbFYNG8lNpbkQ8/diHgT3jVGJsN7pUJROk/JuAGFqJhH0FQvhWzQCNy3NRhTACLOSLQAynjmJgjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAEEgP6dyTLmybqNXaUE2EHyk+3HifBCatGtI1CHAZY=;
 b=r/mB52qNTefleKP5GoKWBG7PybGBBJoelYbQQ/goGdRv7vMymN7QYnLq6XpR40KST9esPhxDk5g91/ZtMU9rV6oYTMxDWx9ekPP0s+dvk2BO88idsVxLgeQyGM9yps5uErmpMUApebW+QyzBAetBVLI4w7iqtTk8vi6vP+oVDrAL6j4XwfT5ywg+2cafn7OW44XL0A+S3iSFYeVKp+Hio61j4LnXYlHW/HrFRVM7gDIhZjVB83/2w9AC/k1Sfl54mZujg8Ie6l+VY9f2jtcjit0oL2Kf4Ub5asPIYio8md/wM6g5w24pA10/8UMEmtab+u6PnGdcY5xzCZSlzcaBJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AMDPR04MB11650.eurprd04.prod.outlook.com
 (2603:10a6:20b:716::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 07:21:08 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 07:21:06 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	imx@lists.linux.dev
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/17] arm64: dts: imx93-11x11-evk: Add pinmux and mark conflicting devices for MQS1
Date: Fri, 14 Aug 2026 16:20:09 +0900
Message-ID: <20260814072022.4064009-6-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
References: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0102.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c4::17) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AMDPR04MB11650:EE_
X-MS-Office365-Filtering-Correlation-Id: 89d91bdc-accc-4449-9628-08def9d49b3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|19092799006|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: rBmuq0jSkP0PCwudyPEButMwNRuxnpuqrxIJ8HLtZdGUuok8Z4ex82aXuwjVn2axgjqwGiEf3MlsTdTwxLey/CezwFBgLi5F90oZpK2uZsmBKao4prpIFxUyXyOyUzkQQ9UHAfarIogj1lnGVf/5Tg0PhIzKrK2KnsI68fVSdByu6mLWnvWeaCWBOplvU4pE5BslAzICIz4oTuaZnZDC0ugluu3ii3ew2wls4cQoh0Sja2oHj2VYMreY0DaKh+E3K3dD2JoUEZ94ix3xs1wpFT0v2cPUJqSrHaIUl4FJ72r/cD6edB8BTd0vM7HHlgQPDqV23hSVppoVYJlRwpmgSNs3k2wfXT0CED8M2AyIF/2GRLS4ZlTyJg1hQDHD01K0H3/iClTVx3TNL6frZzSTioM/QWWFgAhT+r2j+y/1LzSm5OS1BAy+IYMtQYyFXUkNWSAOuNPd+XIgMwlmGpwWlCYavgDHzrR3ofnDlmSiBWJKsLyXj/x9KgNdAIrre48CNK6PPcWdNbDnNw7YWMDFDNE/bYxQdF4uevaXd2KtQTLIRak3XW0DG0p2d0AMNIpB2guaVizw6gY4wQ+jlZaIED3lkWiSESegEQM2fiq0x5Jdwd/h0lJF8z4f4pOVo7ObDp8vrg1gSkF9JyWBsaOyDxwb4rGwtiny2Y0FLF0xxF4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(19092799006)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hIx3miWN5yoSwlsvM9nFyrsdos3JFQjkoSO1clbGPAPu8pEH30hJ9iQtFV3b?=
 =?us-ascii?Q?WL6SiZob3h5hbc1038cAtL8p/XdfWpntK5K7D1q52hYutIL0XsAUHEPam+YV?=
 =?us-ascii?Q?UI75ecgy3gZvbbI9M7OsjCA5kOe/+VjmVt+D8wPozNj2q2EmQ4n79M+tNHG1?=
 =?us-ascii?Q?i2lZb8zW1/m5tyMJWNRfw/UqBJt45QklQwJ5jfH3JXd3VTwoIfUb08ajhBI6?=
 =?us-ascii?Q?xLQ+RbnaLukFSHIzrpmaTN2uq1RK8jq2SdKZFmcoO77EEjEbELhUvvzsWf74?=
 =?us-ascii?Q?HSEsVvfSRzpBTfwUugxRX2MOJbXG5+JyTOsd8B4rrXM0dUjrHmuo0xhDKCmr?=
 =?us-ascii?Q?AYj0BAS7Woqlz3RA5DqX5mLyQO+ttNIjjH3Nwqz2FHt0wWXqEHQhTc13Ji0R?=
 =?us-ascii?Q?qrQ8hJ8lktlMoIgSrAesG9MzYJcg8TErnb5ThcrDjXCL9Aq88WDqd+Ob+yJ8?=
 =?us-ascii?Q?NTDaUbRZdxQYMUuYGV5QlIGTgteY7ysNC42kdDa8G+xs30FpaI+cxXflHb8c?=
 =?us-ascii?Q?JSZYZXLxVVyij+/3lsW65yM7pBtcDl7l5HKA4SMBtJjifxXjHkB/i3iaOBAq?=
 =?us-ascii?Q?u6ov+MYYxTYNLq+HpHswDQGDGQ5NPQL89Jd3/+/E8zBuTOFYCUNAFgQqFnr9?=
 =?us-ascii?Q?L9UBvZ86qd05Khz0z3Zeupdhjs0/CHRSQdCAGuhiNzTtUk8MlPDIAcIy+Y64?=
 =?us-ascii?Q?amQJsy5jAIZdC9BSJFsLPiD6wMxLu2qM2U76zm9+Ctm+7KURPgMfFK7s/0RH?=
 =?us-ascii?Q?auYgyk/vpVeqLuBwB/8E0xn9LKOJd9OQtLnqvjvvVfuFWzS7B9cZfew9sPMP?=
 =?us-ascii?Q?DP9gp9gxNkJ7Uz/hLsok3FvHbZpLHZQxE7K2vAF6p/2c819yGj/oldn2/WAc?=
 =?us-ascii?Q?OVOXybfSpY/c059APaem15HZ6sYfFpK4AVZnU5xYNFCDQOx3+z+r4XNGtso4?=
 =?us-ascii?Q?rif8Gp49JMKPT9YcHW2sJXM6a3n+dLp1TY3tsHWogIBTijIYWZeANihilH0r?=
 =?us-ascii?Q?wlMy+12VOISMfYkYXXpfgx2YGtHvdSdKMxW5VPhbBgZScw3PJ0bKFiy80RKT?=
 =?us-ascii?Q?sT00cZC3zjuHrQ+MuiCIXpEU46TWb9h4xT8ZQzOTuNqaBtHb1klrDCHi/B8O?=
 =?us-ascii?Q?lDVJ3CyRSdTb2MUMMtQhKwhW7GC2aR1OXdVoVPJwyjyTlvCUQysAZ1KNiMtq?=
 =?us-ascii?Q?TbFK6JSXfzogRMH9C/HijtVz0mPjJmOovv2WFjCaagfx5lmfiTTgLNGtCUEY?=
 =?us-ascii?Q?k5E2iCewbhzznPEs3VG5clb4Dwt8zFCagexPZCVe5n1gdumssKf47s+rzCMA?=
 =?us-ascii?Q?dNi3KrP8H7yT7oBUIhTwrd+zyiNZEnSmsBdPvT490iGc/31wMyN8yAgjzOMN?=
 =?us-ascii?Q?ij47Xml1dEcdpL+7cBrW2ftob282+zTlVeUGz9qqYQVCRuGC9Uz6mOIGbIPm?=
 =?us-ascii?Q?PZaYqZGf0a0ywdLNfciybXrBxQPCNOVsQ2/Kr3CxmSckcrVbqQVTudcIWeoB?=
 =?us-ascii?Q?Bu7XM/oyLwz+gKrh/rlZYUDZqksGN5vbJAqhB4apVOAisiGu1hQgJQ0jk+jc?=
 =?us-ascii?Q?f0EGVBaOO9ZnNA6h6XeIGf6/xhZWP+jCaGapYYvxqz9CpV76fdfnpitFvwxz?=
 =?us-ascii?Q?cCfwdxIMJmTDPOMEq5jU0UiViaKpMKSwbhjLOk5xkKUvuRqCERfI6HgDgIc5?=
 =?us-ascii?Q?hZDwdzoMQMY3HBayrhfQlwMARmVVhA3mzWh+xROtDhS64Kz/dxBcWNxxIAjA?=
 =?us-ascii?Q?1kDVVqYKoBEjd95Zdlmdb1zpBjnD1vd79tHdrGz/3UJanJYyxmvU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d91bdc-accc-4449-9628-08def9d49b3e
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 07:21:06.7423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jFOvb3GxB0ujMLSIad0kVEXxdLsukY6/1GKqUDkZWzVnyxK4XRYU5Bu2P+n7CYuYfIeCfAO8QLUDqS88HeUag772PqIEFmu4he99OUOTAbs2baVxxdm1h2lNP8Q7Cfo/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11650
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_002111_265410_3A2EF4CF 
X-CRM114-Status: GOOD (  11.00  )
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

From: Chancel Liu <chancel.liu@nxp.com>

MQS1 shares pins with PDM and its sound card conflicts with the BT SCO
card. Add the MQS1 pinctrl group and label the conflicting device and
card so the shared imx9-mqs overlay can disable them. The overlay and
its Makefile rule are added in a later patch.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx93-11x11-evk.dts    | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index 4418fc6a0901..71822d06ebf6 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -71,7 +71,7 @@ bt_sco_codec: bt-sco-codec {
 		#sound-dai-cells = <1>;
 	};
 
-	sound-bt-sco {
+	mqs1_conflict_card: sound-bt-sco {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "bt-sco-audio";
 		simple-audio-card,format = "dsp_a";
@@ -105,7 +105,7 @@ cpu {
 	};
 };
 
-&micfil {
+mqs1_conflict_dev: &micfil {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_pdm>, <&pdm_fun>;
 	pinctrl-1 = <&pinctrl_pdm_sleep>;
@@ -115,6 +115,11 @@ &micfil {
 	status = "okay";
 };
 
+&mqs1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mqs1>, <&mqs1_fun>;
+};
+
 &pcal6524 {
 	m2-pcm-level-shifter-hog {
 		gpio-hog;
@@ -127,6 +132,10 @@ &sai1 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_sai1>;
 	pinctrl-1 = <&pinctrl_sai1_sleep>;
+	clocks = <&clk IMX93_CLK_SAI1_IPG>, <&clk IMX93_CLK_DUMMY>,
+		 <&clk IMX93_CLK_SAI1_GATE>, <&clk IMX93_CLK_DUMMY>,
+		 <&clk IMX93_CLK_DUMMY>, <&clk IMX93_CLK_AUDIO_PLL>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k";
 	assigned-clocks = <&clk IMX93_CLK_SAI1>;
 	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
 	assigned-clock-rates = <12288000>;
@@ -150,6 +159,13 @@ &usdhc3 {
 };
 
 &iomuxc {
+	pinctrl_mqs1: mqs1grp {
+		fsl,pins = <
+			MX93_PAD_PDM_CLK__MQS1_LEFT			0x31e
+			MX93_PAD_PDM_BIT_STREAM0__MQS1_RIGHT		0x31e
+		>;
+	};
+
 	pinctrl_pdm: pdmgrp {
 		fsl,pins = <
 			MX93_PAD_PDM_CLK__PDM_CLK			0x31e
-- 
2.50.1


