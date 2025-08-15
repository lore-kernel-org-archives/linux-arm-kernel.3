Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247A9CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3K94yifV4gSSqBELwb8wZ+/k1coPBg69fCGUlBmZqk8=; b=us/XWq5velaKV0nhy+2dJW1jep
	mTNptCRf11kM2wPFj1KG9pG482FIrfxA6fibY2CbIjLAr3Rx+1Xhcn9C50Bw7VUxKmG/6ONKTJI6R
	AhkFIGRL9N8EMRXUOPQd4jV1Eg4/288Uuv5VshyalxhXh+AzUkBvhinxcP49EiKX5n9n6ohNxTEkN
	FiQZbEXo+pkFjsbkacv8NcSzRsIpRirIAFa4iFh66pudPWiV2V4KEgaFT5UyWZSskKTpf5iTH1uv7
	IotcOs+/InXOLfJfjsDJlGo61VJmW7/1SvxjOOSkBqPorRj9dtQejo12cdsdV6dcc/ywVvhaJvhV9
	bKYORoMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umwH6-00000002piN-09qn;
	Fri, 15 Aug 2025 15:23:24 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umrbF-00000002CNZ-312J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 10:23:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u0jZD8pKhlpJP8qCRjcdv6YEUafzmgumJp8i5w5tW/uRtUV0Uz0RNgsNd8UfKTkYLQHE5CwSz4l0cYULcazWv887froohq4NxmtJIKhcroS9UVAeaoYTV/4VStECRh0c3NkIeBcHBm1jA5+mcI7jo4bArb9OmP+Yo8qTAtecWWX9B2GVpxmzVAP7x2r0Qd3KXOrG7vXSu4DP1oRw8x5tYVXhQTufiUq3f2cwXjtAb5YI97jJ2gf18Wp7G+ocWTVmmWyBzhsggsuTodEOF//pfXOKEsgmtSC5jEDDc2iesfhGGDsL74EKAl29CRFCBHXpQLI/v4C53lxozm/IZPXRgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3K94yifV4gSSqBELwb8wZ+/k1coPBg69fCGUlBmZqk8=;
 b=XMMbiJy8V8TdXZ3HdyQ1SGjcWilHKBi64Jci4FQZ1KuFi/mJEQaVbE6W0oZwFQAUc34p8SuzVhTVJszHt05MAGqAftz8O7dqYNtVL6R/1rvRYGOVLn+fuYQbYtL8Q1+9T4DDcqfdkxPFG+qA5yiabJ8Nh8jyzfo4NIulDgOXNif4rMF9FEVIAn3Q7TWAim01fgYYYQE2hY9Spha1yPoeeQH84fhVhpw/A2idPGipWXg2G5Qrpbi6pPCDspITkECtqb85okmfb554cJXZYhh5kNlwHwwfnvk8eawLbtSYlGLQxCn8OXOpp0pq/2UnrakpK/wZWS2EY4ceDdMUyfkNRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3K94yifV4gSSqBELwb8wZ+/k1coPBg69fCGUlBmZqk8=;
 b=GCaREZp+OWc4ZSSTfokNgk/T9aGzmZil/eagBFOowE1Q6tjsJsO0cY7eLNze5hRkmUxx37642VNFkQo8/9u8dK2xN9hpslYV5cCzP1tqnu0qnTJq+9fVkECBpV7gAllSBVLXHyAyc8WLZTXklfaMIIfhVkMWwi24+4RXeu4jGUA6TOq0vxGu5jSfUvnsAiLBnkzs/QmI98MMWGHsFrhPVH76vR1tPwMJzxaHcbBX3Q1EXRCJMva77eBNPxP0mkvasFpgmgkxMQeprPtGaTCNMci6xjVjk7pNW0affwaPOBUrz7Fh6RbU4cp0SAoxwfDK6B/RMn8oXHElGU+mHOYbdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by PA1PR04MB10178.eurprd04.prod.outlook.com (2603:10a6:102:463::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 15 Aug
 2025 10:23:50 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%6]) with mapi id 15.20.9052.006; Fri, 15 Aug 2025
 10:23:50 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com
Subject: [PATCH v3 3/3] arm64: dts: imx8mn-evk: support more sample rates for wm8524 card
Date: Fri, 15 Aug 2025 18:23:17 +0800
Message-Id: <20250815102317.910014-4-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250815102317.910014-1-shengjiu.wang@nxp.com>
References: <20250815102317.910014-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0002.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::16) To VI1PR04MB7055.eurprd04.prod.outlook.com
 (2603:10a6:800:123::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|PA1PR04MB10178:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ce8db0a-d445-4573-bbfd-08dddbe5d3ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|52116014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QahNuuiLiNIaXk67lgqV4NaiRff+GVjaJHyY7YvOTgsq7dVmsKAIgaK+72P2?=
 =?us-ascii?Q?KRxHlmwfYCNgSvMp4qlJ6Rk1LaaWv7ILUmplUaeaWGGJknRituh6+nj9ZCwG?=
 =?us-ascii?Q?wXJrp5qcxSE2O44qSjm2asmm/u6eppmvXtddsPiBgLrn7V1DvXvUxVnZXctl?=
 =?us-ascii?Q?viQy/a4BGhT1MVmd0wxOO5WR2vD0GBK5CQi1Oirs+W59zTxp0gPXCPhl1M0y?=
 =?us-ascii?Q?YgPzC6wh6X3FhOrLfGcyweuFnDbWTc6kXRx9ikAAjamsFsO2oO8W+hOJLrmN?=
 =?us-ascii?Q?7Uk7GI11IEk7vExL1cFbj0sfG1j18eVPMk+H9uHhM8r85pu4VMAfjlCCsfJ7?=
 =?us-ascii?Q?ghwtNB2uiFw5c0dH5jYVh1Q2EvGcfj+/bgUDmXZDIdWfdnpJd5qEDTvE3wzA?=
 =?us-ascii?Q?TquJ4z7jN/fajUzqxzaF+6eTYEx8ArIZDcDeRuy3eKLZ7rmC83DgBRr2RcwT?=
 =?us-ascii?Q?lEdVlGs/Sh2FmzArkWkePyO3tGHpLeTJHq3ZOhq4veqiJbpfC52zJ/gby0Mq?=
 =?us-ascii?Q?yuPmmyzXYcozL666M7En0CnSwR/17F7i5dI6ssu/90by43nk8lLKhoQahKxm?=
 =?us-ascii?Q?xSxdNW5Dww2VkZ+fA66fljSX/w9Rk+1A5Ho5DTp/Z4UKlKcmhWC1tOxqmGnm?=
 =?us-ascii?Q?uuLInQNBdUIMRLIQBSIMVGIk4BrfBoW8Pr0IbiNMJ6JqEBE4l85kZ/5Ns3+8?=
 =?us-ascii?Q?ywZQpBJ66F16UgwclHQa8v8x7zOMOddxMgMbrizxMlwNsign5sRWSbLxrjeV?=
 =?us-ascii?Q?IUFC3zyxyLLaGzkZj8PiMkkvFUSaXjt9qqATfEX8wbmvs2L1oKzDOivTQjAG?=
 =?us-ascii?Q?fOGcC9fPVsc4barJsdwJ4xGyLNsZHvHpmZhWOpsKsyUese2ptz/VNhKqLkz7?=
 =?us-ascii?Q?ax8dpcc3czdTCgvvHr9bgJNI9+tFlAFQj0hMEPGguap8OIogA+d3KE3QTyk2?=
 =?us-ascii?Q?djgdVHTo+1cIheqmpoT5hhyN3PWxSdoRhwOg9bj1zC4aSafBs9n0C8LGitLo?=
 =?us-ascii?Q?ibFagU/OwU6k4ENpTESSxId6QclqcnRiWGo/2pXEBXnfqyZkKRI/OIXwuqP7?=
 =?us-ascii?Q?Wr35vrNuC5mdu5dh44KEdWovYqc4MHmg+FJ9yk2EYuo0xl0z9Gb65aCsolKt?=
 =?us-ascii?Q?zvqTQngwtvtvyz+OVH4DD2q5RfMZ+QheJ9MPnwe4izwjvawFm2ltllLg13VC?=
 =?us-ascii?Q?GYEwK/e4ZOuJwZMQoblfV2BXmr+1d32uSF1ILNlIGbrsfqkd586e1qmznr8g?=
 =?us-ascii?Q?pfYabemjMTL/xObDVUVAge07dPSfkmsNFy2R88BC7GVjVst+V6+GeWB1hr7e?=
 =?us-ascii?Q?P6yhdS149JR3QoiGkZqLndPU3I+Vzbt314t3AGvFN8YjGKWlvdPWJlzTairl?=
 =?us-ascii?Q?JJvBi9yU7mz5B4yIrBDFD+/yIUJBxAnaXO3egmmhSgqA/92jJuulihydpf8t?=
 =?us-ascii?Q?NhHXnmwaiH0H9JOT4lHeEUd1tC+AP3kADYBFQK+EroDTpJ9uRanmUubqSWZO?=
 =?us-ascii?Q?mE5TC1AZ3l8Zw2Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(52116014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JxUBeTWjL0fWb78IjVIgZhmMD5W3ocHbro8eHiFkPxgHiPHV0ekZXKraFcRv?=
 =?us-ascii?Q?56IT4tGCiFno68LWWdayIH00gCRJwB9uzuSx10idNNp08nafLl1vmP4gKE4U?=
 =?us-ascii?Q?2apjCax4AFzeMV5hg+tfcwH2gm0YfoEZT9TMcQ6Juv6w4056WKzW2WEiLJO5?=
 =?us-ascii?Q?PgBmIaq7h5Ewb+/4p8BoZZA/C1UB76MiovWUManYL2pcCvXREdE+blDnYVLK?=
 =?us-ascii?Q?RWF0naIFU4GAhd6p7PFL7cJfn1kYfgkIlVtdZfOe8/tSYyn9pZ5vqMAFSWSK?=
 =?us-ascii?Q?1ms4swd1/Xk5yB8J+Fttnrl/08gfQMXGDR2dpo48HflUtTPl3/3LvOoZJgbo?=
 =?us-ascii?Q?37QPHGyPvIzVduM6V9LUToOLPbz2ag8vBnbgUZ6yeANo63vlT0tr8WXbhgCU?=
 =?us-ascii?Q?sTmuE8n+SlBaebBUCKBnNLkrQX6JSSnbVHIFgnVkH8LENyGI74bvaACDYKl3?=
 =?us-ascii?Q?C+SgJuFrH7fzYaAXP24EP2OsV4PkFKLHbitibByCt03+N5YGyiSgC/DIfOr9?=
 =?us-ascii?Q?Ihkz9/HYGQLiC0nVGMYDIuR4OiZJ7p/4WwAF6Z+6sCcLODUaqzIOpMmJyB0d?=
 =?us-ascii?Q?bDNQuAvCgGBxMhBovbl6WbOiRNU1uYH2oKoYupubU9r0ruRrkJlLL/5tPu6g?=
 =?us-ascii?Q?UHD7V/aS3zAzfuK1iAogbPqRZTyiANe2wh/vPZLMFK31Nlwg+1/kMhSydpLc?=
 =?us-ascii?Q?3Kz6H4zkh194sB8eSZJjVOXbgo13c63Ih7ZB4bQwWvoVu1vmeBHR4L5G2off?=
 =?us-ascii?Q?Dpz+dtbs1ZBaGBWfiEHq6YzVKhCLW92qxN9xMBeh22N10L+sZ5iiAd9HQTdu?=
 =?us-ascii?Q?Os3UMiAd6QaydPzY0em7YGTG7q1dtYhHRvd5YwM73yZiC1pESDrGUZoly1wW?=
 =?us-ascii?Q?Cuw25Qh+FAp4P/PitJCs7yJ89+GpP37LJCuFw+/McTfrSI6G7zAGyJZ24Qni?=
 =?us-ascii?Q?A9CMYUMBiD9sPsS2wT/NnDEYeIVNac+2fIQg0Pk8W9DpdH9ApY7+26ezpKKP?=
 =?us-ascii?Q?2rBzRtngbHe5cUsqmHRIN1ymfip/QIvVbYL1D0SnMEwHcLFwjwCk1nmEjeI0?=
 =?us-ascii?Q?KwXb5n2ptTGDkbYtf79lDNwTMaoq+JD1pscglqQ49mo2xhxGKeGFqScM5HNy?=
 =?us-ascii?Q?KMHK4gwNr63irogzvwYnGahceOwZu0ZfzERKofcm0z/lCAAeOkJ8sNZD/3YH?=
 =?us-ascii?Q?aVjZeLDe7XTcnNmR44rOZ75F7Y+3l7FoVZYa4qcBpstQWiOTz3vTKyP9Cp6S?=
 =?us-ascii?Q?eq+MTCdOPd/7tl3FW9TW8PdlhHsNhOaSo0DKkKYlf6NfDBaQLHPYpEP2QFOq?=
 =?us-ascii?Q?IVFGa4APWKuYWw8994CAJrRwppm6pC8vsHI945K/p7aJ5ynecO5SWtAybzlq?=
 =?us-ascii?Q?oO6zM9qkMXuL6rHGfVDpMWu4Ee4Z9J2DucFD2ekDM3xFc8HtAzRdyBi7yRiR?=
 =?us-ascii?Q?s0lYFHm3CPx7UC7n293sYQbZHWMyGJLk9uPaJxyiQkwN9gZb6Ula0+ASu6Dr?=
 =?us-ascii?Q?DZURjIWhyhzWjxartvqrB24n3o7cOXvJsRO0gaECDFGDKrz7TOuDWVnV+wu9?=
 =?us-ascii?Q?430jYRHngPCMyIph9C3ztJMJ6oz8GEMSdlf9zbld?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce8db0a-d445-4573-bbfd-08dddbe5d3ab
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 10:23:50.5078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sdL/dEjlqkoBb0eTYywqao5ZVEjSIDivx5qUKbBqpH10kRWGKXkbqnI6dFS3ETKD/m+y/j6c/LX1e/J0JysmTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_032353_763004_B33DD4AB 
X-CRM114-Status: GOOD (  11.35  )
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

The wm8524 codec is connected to the SAI interface. There are two audio
plls on i.MX8MN, one pll can be the clock source of 44kHz series rates,
another pll can be clock source of 48kHz series rates.

Previously it only supported 48kHz series rates, with this change the
supported rates will include 44kHz series rates, from 8kHz to 192kHz.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
index 33d73f3dc187..145355ff91b4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
@@ -387,6 +387,11 @@ &sai3 {
 	assigned-clock-parents = <&clk IMX8MN_AUDIO_PLL1_OUT>;
 	assigned-clock-rates = <24576000>;
 	fsl,sai-mclk-direction-output;
+	clocks = <&clk IMX8MN_CLK_SAI3_IPG>, <&clk IMX8MN_CLK_DUMMY>,
+		<&clk IMX8MN_CLK_SAI3_ROOT>, <&clk IMX8MN_CLK_DUMMY>,
+		<&clk IMX8MN_CLK_DUMMY>, <&clk IMX8MN_AUDIO_PLL1_OUT>,
+		<&clk IMX8MN_AUDIO_PLL2_OUT>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pll11k";
 	status = "okay";
 };
 
-- 
2.34.1


