Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A51CD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 10:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YaB9xj1MvxQDYjyA5zyT+jOopAc8FY7shUuMjpNMZdk=; b=a+gWeJYAQhIHCuS3NHPjAIPOUJ
	4ow8Hz9Qa47g9/9ZjjImvyb0pDHbD3DNfYj6Y5CR6vDmPKbEPbbu1Bp+h7dhOjfGU1M92pF6M0IY1
	ZfpUw66PYvEn9to/LqH9r/d/G3sI+TGSnY+D3c9st/uYATD5gg5VIo/0alvoLrePm54zslqTAej8f
	rO02ZTUDjE209Z6cpibjMt9rOOwYUGYcL43xupiDHyjdvVliX0QqNEcIgn+bVVGgGK64M37I89m6D
	/wf8u8NI1zMsQau95x5WZ1GaqzyZT2xW4AHi21BDS7KwsKYJNalr+pHveuIcMdalBYJq9tBQNzNUU
	NEKP0RLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6P9-000000021VB-1oYC;
	Wed, 13 May 2026 10:01:27 +0000
Received: from mail-norwayeastazon11013029.outbound.protection.outlook.com ([40.107.159.29] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6P4-000000020xZ-0g2B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 10:01:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fy71jsdtqnpMhv0M3EyoF/4ZoGhXYW2RCLbTp5GJ1gZWSoes1QulmwgLrgJX+TA3TwbRbUb0dgWxg8U5c06ePsE0OL5x7JYmJHNk1oW+pERgKV8gU1OyKWr76OlO1Umhel2uCafvpBb6pAULjo8Cp695OeagxeL5DpnhNxGpsH1+lQIT+y7Yljc2btJ7xNEP8qVs+REG/InyyWsssnuOI5jQzRrrEMf9BYgqxNijzxxsFzXwHbMa7OOgO/A/X30xKzvez50iQzzuYjkuebGuP9/Wf8hTupjDVPDFeudSivTHoZAFfMhnIwgHHIp88fTCXAhbZxYOiZfMc6HvTcw6kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YaB9xj1MvxQDYjyA5zyT+jOopAc8FY7shUuMjpNMZdk=;
 b=VEvQMsiGIum9rqX5ZJtTGvobUklN7mQDZDAUArpp5A2Nq6LhKJLc+vmFRuq4Pt7Z+puhiJEp6wY1u6wdx7xWFtu1A72wds1cNuvOVLYKFwC0w5J3TXw1SCfV6ce8/KirFCyCcrh7+WSiR7woVE1CyQVl7uUyz6lEHOXrpe9A2Fvmr3+I6jZb30pnEj1C3znMEu9wDPbL6dWGNFyakfDBj3jv6MT13uv2IQAdClEBIBS2Jlu6CK02qcRhUYlhnR1odz4UoMIbXeLkSjZ1CJ3xXWGjm8QVW0+OstG6Tzmt2HrydxCbZrF1IEE30xQsWwInIPveu37EJr/K8QrzHm9N5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YaB9xj1MvxQDYjyA5zyT+jOopAc8FY7shUuMjpNMZdk=;
 b=EEQC8vMb6N1y7IDPw1VYF/0JdoTweW2hJ5+pBEvYqXrOKZHc1nfdxviyIfUCoK1dBct9WGs+pbvOhMtYSU2NMwMcxQEyv4sj67tYd1Tq+FVKW/7lfy383EDKX+1vdXZbMjUGIgZXLTogCh4tZIJ8pSsVeXfXzsbMZR7nuwUYrTQyG0O3uD54BVCa4zN9k5ykJyoXRXNncu++fF/vH/oCt0VbWG4zDgXEyyLAOE63ftEBR17KAT0uup2yJC4zPqsAfc5/sm3pxHJtyr6l+38PNMHgftahwMEcuj7HDML+kGiA9Zs9hBCpgcdnxq8tSEhP7eN9Kva8ilCKbIyGg5dt5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8)
 by VI1PR04MB7134.eurprd04.prod.outlook.com (2603:10a6:800:12e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 10:01:14 +0000
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c]) by AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c%3]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 10:01:14 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Wed, 13 May 2026 18:02:15 +0800
Subject: [PATCH 2/3] arm64: dts: imx93: Add LVDS Display Bridge support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-imx93-ldb-v1-2-d11c5c3cc197@nxp.com>
References: <20260513-imx93-ldb-v1-0-d11c5c3cc197@nxp.com>
In-Reply-To: <20260513-imx93-ldb-v1-0-d11c5c3cc197@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA0PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::16) To AS1PR04MB9287.eurprd04.prod.outlook.com
 (2603:10a6:20b:4dd::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9287:EE_|VI1PR04MB7134:EE_
X-MS-Office365-Filtering-Correlation-Id: 080584a3-140d-4371-cf5c-08deb0d691a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|19092799006|11063799003|3023799003|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: f+yEWQOcsDuwVz91tRg1IUcovApj36DAFBMrS1TvjqcyVKZsTYCbUiuvv22lJybP7GC5cQ1PRs0sNXaVJMth4S/7cuWcHo6riWUwcdIQQkjS+NEoShQj0M69fK0ZhXj4N0J3zAOwWAioAZssyvkl0blYbnpVLXI/ZtY7P30GzomseD8uNqkOxmyZke8FXk5pp1uxwlAzRkg1MUr8DNJDwYRdItt/YSG8ZXkCox5pe0xYIee8VF7581HrWSgt5SRVWyR+wqyYbc3OBxD4xcZ/WP+Xld9ZxgN10sp6IwWprZbSjU6aP8jPVDYdTOqisiByxo4HxivbghMfmAwGXE20jZ9Totrzwvfxy26sOTEzvVaMLiIzIbpsLFD300m5ctlgku2FtE+9hQBL+vB4Osj0QbrxS7+mceYStOTsfXfEtJXxDOd3cJL8nFMtgkvqpX/Hncg5uxXUAEOtBwgnD8pA2Ks1YBY+TS34GALB6ul7lJyZPfRpn/No/Xzw0LZ/fIynCQbqRAuY/2E2sckL6XWLviHFS1JXvrMARoM1eEydqH8mh7Ix3bUOPtdwnXZo4lSJj040/2GcQeyp5B9qqiYKMVgqux0ujgYf3DWcDCRbLvx1maoq8km2HVDr9Z/wb+akLE37/r0cymwCt6xcWD3L4pvzoR9gEc+0SpH85hK5u3trr9eezN9woy95o1o945t6Hhrce+FVHLg0UW/FTuLf9hV9V3YWftSDqZ5ND62x3uKyVY4rfS3Hn08FLm5bhtlT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(19092799006)(11063799003)(3023799003)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHlxL2o4S0tmTVdlRGc4blczOUdDT29EbnRvVmpranA3ZmVRUUJrNXhLR1NM?=
 =?utf-8?B?K2RnaEw0Wk10bWJnT1BRZ09JRWdOQi9qaCs3bERDMm9QN29MM2krKzc0Q2Rs?=
 =?utf-8?B?cGtGcTlvMkQ1bTZoK1Z0WVhST0ZZcjFZZmE4ZE80OXlDQ0Z5ank4TSt5NElE?=
 =?utf-8?B?aS9hSTJ4a0U5M0cxTk1jSkg3VEhLQTB2dGdhbjdNS0luc2psNTErMzVZNHYv?=
 =?utf-8?B?Y3JRZ1FtcnkxM1RQekJFblJxVWRVQ2NUYWcwaEY5UUJDVjg0SUk4WlZuVWNG?=
 =?utf-8?B?UDF0eTJkZXlTRndvNk5uc1ZOMVN4MWljUHhmc2RwL29oQmVnL1hNSC83c0s2?=
 =?utf-8?B?TmVndVlHcXRMb3RuUm53dFVnTzA4ZFNtcStpNlBwL241T0ZsZmNCUVlVV051?=
 =?utf-8?B?MFZ2MHliZUVBZ3RyTE9oY0EwTFNsemtrcnlRRzl1UFhNSnNkN1J3M2ZFN0tC?=
 =?utf-8?B?YVF2bXdJbGYrT0JiajRJL280T2k1ZVBmZEFIcytwT0pjazU3TVBCYWJJYTZL?=
 =?utf-8?B?SFg5U2dla25PMWRDNnZDUUFvQW9MMlgxaHV5YWJ5c2JFaEZzNHZoMFZuSkw0?=
 =?utf-8?B?aDJWR01Fb05XQTRXRHNkOWFEZ3FMclNXMnpmUXJUUXZlNUdrTDZNd1NEcFpa?=
 =?utf-8?B?T3BVYzNsY0pLbnZkSm85ZWNxcVJ2RVg0OEFhT2RDZWxEYjNxeXZvNUtORmNi?=
 =?utf-8?B?S1VYUVJmOENNRHJYRmZ5K2M4VTBrNS9MYnU5bEk3MWpxWGo4VTVuL09udzhY?=
 =?utf-8?B?UlUrY2ZzcTJoSml2RXJDOUdiQU1RalpIZ3E3TTN4aUZrNS9ldFc2YkZscnoz?=
 =?utf-8?B?c0NNOW9hWHRXcXY1ZElhQTVvYVpjNEdSN0ZseHhxNWpEUlUrSDBCckkxdVdU?=
 =?utf-8?B?RVhaa1ZPN3NlaXZENEpySlJINERLdTAzYVAwdVhJaXY0U0xpN0d1WlVncmJ0?=
 =?utf-8?B?ZjNubHcxaFpMcnVJM1Y4bEZoYzZWTHlCakMvemIzaUUyMU1oRWN4QmtxdTF3?=
 =?utf-8?B?d1dZdHdlVGtLMU51Q2RGSC8vNmdMelh4N0dzT24yYW5lWmp2d1VpaFNIbFQy?=
 =?utf-8?B?RGN6bHRJZytqTzgzc3krQkU3bHZaME1hMWo4Ukl1alpJUDRFZHYrdkZGbHJz?=
 =?utf-8?B?bSthNmxjb1NuZzBXWHZNTGxadkIwSTZVa2V0MDRtT2I2YkloM0ZEU2lPdkpV?=
 =?utf-8?B?NEZ3YlBPREhkeGNXdERqL09Sb2M0ZTNOSURPanlHSE1pd3M0Y1V6OVZ6VjJu?=
 =?utf-8?B?aGJSN3dUeDlvd0pvS21Gb0ZjRC8veWMzTE1iN3FkK3dQUThrWkRlSWFmZ1hK?=
 =?utf-8?B?VXZYWUhuYXRCM29RL29KWGlZUnhINndOTkZ0R3Z0QUhyWGFqVmMzczJXdGdM?=
 =?utf-8?B?MWswYkhYa3NjcCtsLzNITE9wWUthcndCWDViTGoycWt6SlRocnd2WWRkWFls?=
 =?utf-8?B?NVRMRzFoeENNZDNrVy81MXlxQ2JvTGdSc1RFZERsUlBFQUUyazc2OWlrNTNY?=
 =?utf-8?B?dW9zNEM2c2ZWMGFxZ1FIWFIyZzR5cVkxL00vTVF2MnlZSi95MzNvTHR6NEFJ?=
 =?utf-8?B?T0d6aTVsbnVFUU9XY3pMb08vOGIvZ0VNM2RnQ1pyamFNVWJGR0ZMUEljSmhK?=
 =?utf-8?B?ZHRRMnZGMHJXMVNNN2J3TnE2eXlJRGY1TTc1MUw0UmJvQktKNEFadisreTNn?=
 =?utf-8?B?STI3OVV4eG5WVGMrU1J5ekJnUjJPUzdLR21WMUhuOC84OEk1V3lVM25jMDNS?=
 =?utf-8?B?NmluVWRBbmtKd3JSYkVTNDFNYW5aZU5VdHJGR1c5YWVQMGhyMjhSZlJuVjNS?=
 =?utf-8?B?cy80R3MzenFzQUtkdys4NklHRzM5ajlMbjR1a1pLNGJzMndRK3dVMVl2R1lH?=
 =?utf-8?B?TjFuZlgyWEt5NDBHbUNvbDA5bW0zQmFzOHhnTTlGRFVPL24vMVJGSGZ0bVRQ?=
 =?utf-8?B?N1REY2ZUQ3pIV1B3c3ZSZEplUStQWEJ4aUJZWVVSK3ZBZDl2WXYwOEdiRzZV?=
 =?utf-8?B?NkV0QndOTTVoem50eDdtZzBNVGRvUVlGaHdYVGZPem1ueldHZFprbjZkOThn?=
 =?utf-8?B?dGlmdWlZWjhDVm4zZEN1UnpJOXl0MXJwRGZJaWxjazhVaE82alRtc0N6WkRI?=
 =?utf-8?B?aEdISnlmSkxOall6TFFXNnhvMkZwN2V0Uk1DV1d2THloZTRSZ3ZhcWFpUW9K?=
 =?utf-8?B?TG92SDRvbXFtdFdBeE9iNzBYaWZ0MXpud2FmdU1MaVRLc3pUdExGdUw4ZzdZ?=
 =?utf-8?B?WU4vT0FaMUswMEQ3djhqQ0t1YXlwOWRGMk8vUWJGbklRWmNpSm95Tk5uL2sr?=
 =?utf-8?B?Q2JoWjNqVW1YNUFpWUwwYkhXMUxLK3VnTE8weVlaQVY0dEdKdjg3UT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 080584a3-140d-4371-cf5c-08deb0d691a4
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 10:01:14.7889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yahm2luEPeMTGYDAhm8cwQqTLGlEc5vASsh/gfAqZPTcHAalu37SPE5z+fkmuWQ+TYj1PfhQEg5jEKzxSXH5lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_030122_282828_9C13E944 
X-CRM114-Status: GOOD (  11.46  )
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

Add LVDS Display Bridge(LDB) child node to mediamix blk-ctrl node
so that video could be output through a LVDS interface.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 37 ++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index b9abe143cb56..79fb4a15b733 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -178,6 +178,7 @@ &lcdif {
 	port {
 		lcdif_to_ldb: endpoint@1 {
 			reg = <1>;
+			remote-endpoint = <&ldb_from_lcdif>;
 		};
 
 		lcdif_to_dsi: endpoint@2 {
@@ -186,6 +187,42 @@ lcdif_to_dsi: endpoint@2 {
 	};
 };
 
+&media_blk_ctrl {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	lvds_bridge: bridge@20 {
+		compatible = "fsl,imx93-ldb";
+		reg = <0x20 0x4>, <0x24 0x4>;
+		reg-names = "ldb", "lvds";
+		clocks = <&clk IMX93_CLK_LVDS_GATE>;
+		clock-names = "ldb";
+		assigned-clocks = <&clk IMX93_CLK_MEDIA_LDB>;
+		assigned-clock-parents = <&clk IMX93_CLK_VIDEO_PLL>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				ldb_from_lcdif: endpoint {
+					remote-endpoint = <&lcdif_to_ldb>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				ldb_lvds_ch0: endpoint {
+				};
+			};
+		};
+	};
+};
+
 &src {
 	mlmix: power-domain@44461800 {
 		compatible = "fsl,imx93-src-slice";

-- 
2.43.0


