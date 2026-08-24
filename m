Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8610C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 02:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oVvw27lj2MNH4Xbpx/tPfQSZ20ijWJ53dNpeHX2Y5qg=; b=n6f6/QQ0WcAB/5CdygFPGtH4aQ
	J9wTYiW7PFKaaAwHFMXjHwseLLUPEDsytc8p/R+/Hz3erIJkqXJCWbJ9fc6WwOKDTRkVD2qCVBVjU
	fG6O+s9NwaE5FLAK9XeAalFkDtn11QgYNRNESETtD+PDQQojsd1EbNh7xyTMaEnb/AwEFZwEQSrMJ
	LBqPO4cN/8GSLVdkVhwY+Un3xnQTjHejGCU7Ko/0YiOsewHBmgRL7PhBSGoDohvFsed0SEORrMhTG
	mNsOlTtqc/9ICo1GE+ey4uEszBsm2usdgeR7nKjXrFx6YCvxdKRoiUmVNxdO4ky6Wlz97FwNaLYqF
	H44idWqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyKJu-0000000Fmh6-0yer;
	Mon, 24 Aug 2026 02:21:54 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyKJm-0000000FmRz-2nPq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 02:21:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eqy6gSdB6Mi4jpEc6A266naB9MWPeuH4wDEchVJ3MrwnyAP4iZWm+xWPiGSb6zahilkihfyAYaOFDGgG00TkVf3GCvyvGkttUjVwipNYSzRN2/Zdt5H0PdkjryWwKCs4Xo/lQ9K1YqeaTVOEdjBcfE2wHchsLx3vBk9Veh7wl1ZLBUXgA/XFAGviiOukTKBBoP4OAYtuZbgKSWen+xstxqD9PkyBhR2vDTjVXL3dzGlB9j8ETnhjGQa+EbLqY2k7+bohJo06JBsLWgWZ1kxa/21q4YuygZChBumPKo8SYIy6FADat3EStxD5eol8e+AU/qM1MzF83utO3nV0/Df6RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVvw27lj2MNH4Xbpx/tPfQSZ20ijWJ53dNpeHX2Y5qg=;
 b=xeKR3yCDcr+V/UKIZgetMSG2zJgZk1XNySfQWQo7ILBPnOwRT2St6tdpE/5BvzYeyYEaeGErRqKrnvCniF0l+ovq/53hyeBxtbPK33Uk5XObRLt5KctxAOxCJM9Dt69oQziODIiGJDFg5fKWLjL0GpwHJButzfeAL0R3xoATbCLIYiDS3LO5ZKZhX089cpmYfXmpqm21M7S7RQv9CRJkA5seuodSbBAH6uEyR/nLqS83QDNRlHRFumvuyB0I+o0nYywguZUZxpejf8KsEvl8BkzIn+99P3csQ5xsS4euy80HzjZJwD4nGIPf/rNplOew/EREApWlPnJIbFsRSovHeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVvw27lj2MNH4Xbpx/tPfQSZ20ijWJ53dNpeHX2Y5qg=;
 b=GIQenqZ0xqMRyTjG5BJlYxrp8OXjMxel4C6f27nJ8h8QreyoNgwbUnoH8nRLoBFqoLow//IrZrrIgOLIn5xcMVpIHGkVFX92yFOmLLLzDxydB6opMo2DoU4NP/sqIHaz++5oeg4P4Ftg47is/QgdSFBi7cV1tv8MRZmW1N581ZJx2DXHbF94EM+EcS7J1+HDTJ2LZHlIUvqTZFhwY7NbwpDRKhxDJ+dh5uLDMZ0e8GU8gxNn1cuAjBVrIOC+PndORCgrUfLQHqorWAru4ump4gaUzWlW/OP1dtwJNmjeROHS8+zTrYEm2bVwJVbjbv/za101wXYDkaKN1mWj/PSaGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AS8PR04MB8562.eurprd04.prod.outlook.com
 (2603:10a6:20b:421::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 02:21:44 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 02:21:44 +0000
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
Subject: [PATCH v3 11/17] arm64: dts: imx95: Add clock and sound-dai-cells properties for MQS1
Date: Mon, 24 Aug 2026 11:20:14 +0900
Message-ID: <20260824022020.2812810-12-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
References: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0170.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2cb::8) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AS8PR04MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: a0d7c755-4ba6-4cce-0a85-08df018670ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|23010399003|366016|3023799007|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: uOuNfXQ20MJH2kL9IVvXJWRSTi6RIEa3lLKa6Zi3GSwmKrFVwP9eRzAGKNpICEuRVSegWO34pj85GxkiWp2hUhnub5JF5dq3V8FYPOqwc74JGkr4qS4061S2t83STVkF7E3XxCWEBXQ+OD1gdzkPN4Vg/LMBzVOMvgi9s1sf9iUXUmOX9BP4UG6NPrG/mU5PsqhDwp4Dad/K4oEyNNfb0kQoi5ygDjCgn3bBI4GO9J+h2EHIgxLS/A0G+lLA+pEy5Kgz1dMIHMuphk5sB3ji/xygPNe5iz2IluRobqCP9rSeDEl/ufxurEbg9fNxxJYM7EuLdh6Fadq1QdvjVFvM1sSRmv1WRIuQWey+casXO/eL8kpwAzSWpAEYkuqh79LuNaS/8JYGFgx3t46HTkLty79GeLsUGYGLxQKMM5PQQuhjV6y2Y3GRPqaB/O/9sP63EaWqfgXfaeoX+URFKZgyO7hXl7Xds2bdKjvpOTDWoxvi39N1AZrCHdvzA8V2t6nwFVbrUvf8ZB8zzRgeA9ri80Ftsf6o8yNFFry7YbB2jeRzhR2+1qmRMiVkczq+Lfjs+tNW0aisBkb9Z1FlZYvFg7uvwQV6EpOjvuhg07h013BxChnk6wIUa0IVlBSaIUeGt3C5kHYXBMVie2V0Fhd2vZnSnG8041QUNb1JpCt0y+A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(23010399003)(366016)(3023799007)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aynuOGTWSKfVEV9N9mqf8UCWYK6bwkHtKFlIGw1oOG1y3hdymXv2wTfVdAcr?=
 =?us-ascii?Q?wCHdtEZ6K8c8sssIWGN4xHNTelnPJwru5TuIkjgX4usdk0BZpzAPcSrdFkRH?=
 =?us-ascii?Q?Dkb8emVWpUFo51X+sylrdO5LOb3uvlxuGv+CgsCglUOgAx+JEZR04CXV5dV+?=
 =?us-ascii?Q?HA0uhGjRkjb7cLIiF1dSqVo7aoSXz6fV2w85Nc/6OePhkEjPnXJHnBvrhdBp?=
 =?us-ascii?Q?Ctz0WleVjAg83uxv2kLBtdFounDbdEU4EnGmoODvxkQQbPD6xFckmbdtCXsB?=
 =?us-ascii?Q?xWOFYDB26qGGu6lyDGsr8GVHJHdEIMyE2J4QAYGIl+FIZjWcblB0Hd0ijpdY?=
 =?us-ascii?Q?owTrvr91MPRrQLmdHaGciU4E43Gdc7XM4kNdJcEtsBfROrJWFyBdvFxmMAAV?=
 =?us-ascii?Q?6r7i4yrYfYOB0C6yT+mDtmHEhUyQjQwz9uTPH4OB9qp0jd0/n2HuT39Tb1NM?=
 =?us-ascii?Q?2JJCA9BkwofvNgTc+GitRDdXPLVtDZRp6ScNJxcH0mqZRQujN3QR/3jCFAVR?=
 =?us-ascii?Q?S05Ol7GRBeYdsGVGPard9t0ArQbiNgQ9cE4kajyfZ6Zzy5RQGETn2aB9dzDf?=
 =?us-ascii?Q?z6WqzPGT4gfcoEpRqZp/4TCNS1oFt+pdkDBqiJgroo9dXbrPj70qLepZZiNv?=
 =?us-ascii?Q?PS07r8mom2FyXiiqyYvJzCpayEhMChRtliVb0OSR0xCIU64Mw2RycBgkH+1W?=
 =?us-ascii?Q?DdioeWgkt1NSlmny7LNQbXx+5DCCGmKm9Eoan002S6MFWG7Lpx73tbE5c5YL?=
 =?us-ascii?Q?K58FoBL3SntT0PcTYvsaU6YV08ykk81skXOGE3wVtWN1XIvt6y19j7CpnD55?=
 =?us-ascii?Q?dmIfkfpaIt85pK/gRYDBgehiPA2Ws88vI5lWpHHjGAMEnjBW02mtJcEPGQFX?=
 =?us-ascii?Q?aRCsu7XpKqYUizjoQtseadR9gQ9JtpHB/SqvtEGJO2nOGSRqb8GCPTilhXJv?=
 =?us-ascii?Q?E40EveHWuBR71h6fv/i+v5sv2hKVhkiE1uPhtV4y6mrZ9Ftf28CbwjMgu9/V?=
 =?us-ascii?Q?kMLN7MX4stcGr7te22ajyOz7ViAZ3cwXIpNFIPevIx9bb/QsaAc4vhdNm6H1?=
 =?us-ascii?Q?ZfhgXXV2Vjt5B0mLyrQlZ2DMPIFejrkfW5dfgvjz2LX6BK/KCm4JRSxzwnIn?=
 =?us-ascii?Q?so8Ad4KRs4aqQrZqrxpH0rgrh6QY/mWwEmByidWEgZzj463BSNOWDFNOkDA8?=
 =?us-ascii?Q?cXWgK2B7Hoqgr3beTlq3c0JtQpUasbWdTTa92i6OYoeXeHdQSiah824bUvn0?=
 =?us-ascii?Q?3wSB5EXgtHHa3YJB+APWFkGKeSnO5xtOuaxgyQYvhH8t4AIno3gVunBiTNK3?=
 =?us-ascii?Q?YDzS6PwcrsUHzN8lFEVDuPcqNKNHwKOOvEHkix+pqQ8Ouz2e6NqKSGNwj3ir?=
 =?us-ascii?Q?L0Ypp1fItJPrJtjgNfEEtbqhsjyyhn3WCOWENOOszw6KQIxYHzYxblsV1jk8?=
 =?us-ascii?Q?OOVo6CAQOi32oL/fAgXEJ5ElKLg9di+A0u3oTBshKRKiut5obv3HWWnz2pRZ?=
 =?us-ascii?Q?qtsXXMLtpbu3w+/KvpFW4OYidTy+5PRA0p37wVf7SscFLJ6OVkuVy4LALKmY?=
 =?us-ascii?Q?ERYsqAZjbzm2ThGH5NcLsFXLj4GPdakPQ6xH1yXjjulNpHr7SvHU7cKi9k4G?=
 =?us-ascii?Q?zThcmocdUi2KHb2uRkaGiV1RIy+fadfSV2PYU3STuu5EZSpsp+fJENv3T14t?=
 =?us-ascii?Q?A4cWsD4dMkl52KIidSZVCAHgBC8Y6sUJPy7LnsJvAQDz6REZexHXfnBj1Tp4?=
 =?us-ascii?Q?ZbrtacBH8AIdE3NR9B31STMVcpqyD+BKv7RI/GQ2BU3N1c5dRs+F?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d7c755-4ba6-4cce-0a85-08df018670ed
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 02:21:44.2954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iOvcneJsCH1idci7GH9I2kmhCC7OOPujgnnnuXvB/oyUOn2dXWD15nXFrznP2Mmm+tDrsMPX4HehNMy1NM6sag7oHay9scTh22ZDHqy5I6asb7H+0Eb+miUbgVMdMl28
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8562
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_192146_723496_CCE9E5EB 
X-CRM114-Status: GOOD (  11.72  )
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

MQS1 MCLK input is driven from the respective SAI1 MCLK output, and
sound-dai-cells describes the node as an ASoC DAI provider. Both are
fixed SoC integration properties rather than board specific, so add them
here in the common dtsi instead of duplicating them in each board dts.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts     | 2 --
 arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts | 2 --
 arch/arm64/boot/dts/freescale/imx95.dtsi               | 3 +++
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
index 0f43e3be7058..0a1646ae5b00 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
@@ -480,8 +480,6 @@ &mu7 {
 };
 
 &mqs1 {
-	clocks = <&scmi_clk IMX95_CLK_SAI1>;
-	clock-names = "mclk";
 	pinctrl-0 = <&pinctrl_mqs1>;
 	pinctrl-names = "default";
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts
index b87a26b0d7fc..1f62d729a5e7 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts
@@ -450,8 +450,6 @@ &micfil {
 };
 
 &mqs1 {
-	clocks = <&scmi_clk IMX95_CLK_SAI1>;
-	clock-names = "mclk";
 	pinctrl-0 = <&pinctrl_mqs1>;
 	pinctrl-names = "default";
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 38fc47024841..7bc74307d9ae 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -439,6 +439,9 @@ hugo_funnel_out_port0: endpoint {
 
 	mqs1: mqs-1 {
 		compatible = "fsl,imx95-aonmix-mqs";
+		clocks = <&scmi_clk IMX95_CLK_SAI1>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
 		status = "disabled";
 	};
 
-- 
2.50.1


