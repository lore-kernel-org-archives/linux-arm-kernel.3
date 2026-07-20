Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EF8C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 14:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A29aetx0aVJv7rcuZPNrAFEWUH+M64h+DMEXRq7TAzs=; b=q7GNjeoAU/TSYhAshBxBBD772l
	n6BfIUwyMCl86xTjaA1nG1Dd9TD+Qk5Gup8x12xqIqGC+fbvXh5hJPQf40eEioYSUvKCniBrWda9v
	6B3p9FI7Y1v0ctupdw9cSMTJts47LhfoxoAhxq40yDSKCEMok+Ifn/ONRh8tU71Tv20/bLut/4yw+
	F64JXmGyY3rLvAoPbYpR6jubzEg58JmZ4HaBX1lM6W9/LMw89Wd/Tp0Q6/4GnIErxKfxxHhq+37Fv
	ht/jWrLmSGBO273dUayHpWvRfx8qyaWypJmkLzPDoL6h50ydVs6GCFg4D9555y+l63XsBA+TC2M3C
	5BQGjZ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlogN-00000006ueA-3l1Z;
	Mon, 20 Jul 2026 14:09:23 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlogJ-00000006uXq-0QNs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 14:09:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iYdzWS3BIyMOS9g3t6WpaHR2oxGuutuobxxqF0k6Lt/hp6QE8ZLRI3rxhMRZk0eHacYCinoq34HfiweVhQlnIPu5OW9J22ODOcr5uUo7vzwhxm416SHCbZsrSwVO2mYuBd6nyhlNKbJnsbq403yGgKmg1MCm8K5pLPkNSPNPXT9bwl5pBoYw6y52GqLMiW59aYg4M8p9fV/+tm8BIFHpdpY+coEpJv+nglWZIYRSWnMI3qMmBKTamDx2pwIsOUhFCLaM1GPRU8ZIV9lM/8BYJxfr4SwrTNLtGOMdXGACkQwXL/LFpwyZ4NuWcM/2OA0i486VOiwI+U57npsJAyYvmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A29aetx0aVJv7rcuZPNrAFEWUH+M64h+DMEXRq7TAzs=;
 b=aN6ngJ+PI89Dggg0j19QySR8b5FWoOxpFLvztCSdoehL0SZmM4ADTGT4yk60HYQfX+uy0Ll1qtl/sbb7u9B4V9JXxBCwrkheXRV+B73Axn7C7DLIYBfAA4KScyJypIX60nf8ah4IJI3ORByOwHfyZ13HHrjRmo6tJPVyXcGnmEBpe79E45LDR6q4BmQAcg/SGLMAW6oA3t+Ce9lMFzAs/xnAYvCPP301kU0tqrY4DAEUJQYiwNmJtvS7pib+3UlVdLYTkM1FK/9V1UygWYKvdaNVjivmFbXYjZlRDCEGRtlrcZ7aYZitoPwzFmm1n4WCBhaOGBQRTxmk8LDifF+L3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A29aetx0aVJv7rcuZPNrAFEWUH+M64h+DMEXRq7TAzs=;
 b=rG7NsZY28HirluTOJSGrtqIxHAX3rHinz1bmDnAjTpVnqp4ggzWRlURPwsjVOnVC9pyRQAAFOD0sy2K2q/e/SWo7kLkc0/CxKLcV4rYFfV15kUXrR3AxUFYKtMzKwBPkV67qp9bQ5xL8SHsxub32uYW127QPcfBxcW5kjkcsM+/Ect+6XCth8sogX6yVsDmdZU7IkThT947mJz/C0VZd7jq8Ss4BpbetwB7SInL7M4M5w7VTUNM3M8OSCeaT7XXIqZL+RuEOLH7++O3tPe8oHdmpzlQN/jXCgvyJkaXkAK52j77oe/4hv8tD4NWDmJ7SBlFxqntQ5ssr1C8t9W/ydg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS4PR04MB9412.eurprd04.prod.outlook.com (2603:10a6:20b:4eb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 14:09:15 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 14:09:15 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 20 Jul 2026 22:12:14 +0800
Subject: [PATCH v2 6/9] arm64: dts: imx8ulp-evk: Enable LPUART6 for
 Bluetooth
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-imx8ulp-dts-v2-6-d05c67676f53@nxp.com>
References: <20260720-imx8ulp-dts-v2-0-d05c67676f53@nxp.com>
In-Reply-To: <20260720-imx8ulp-dts-v2-0-d05c67676f53@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Sherry Sun <sherry.sun@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI2P153CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::14) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS4PR04MB9412:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f0b52fd-26fb-4ae7-2e56-08dee6687b3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|19092799006|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: yKjxSFcsJhME0ErVx9k+/ImwvxjOxE8POSnKB+6M8YeMEelMqqnbjSlmfWocvOZ4AaYDJKKJb2xhtEbuQ0lNuWFP7/rLt1DnT2isR+RhNW8UlDNtQzZM82Ee9IG5Jy6SnNgrKDvwmOw464bOncNYvUPdZ5JXEHX75VqBGF6wKyEtgzwak6RWxAM5yvtg+GJKfg0KAfuwAG42IJ5a+FCOjHOHhbBJpxoSjORwGdyFJ1QG5Ie+GqKp3l7OOSP4bmE3JSsq4IlPbkVE/6CPr09OBPgdWMvfUxltkNHAytrp+QjOSFGtAPqOEION7W7A7xCOjJM7UdmfnRRTzvZEW3WubrqHkg1DqaTzQ1AoPy3quEroI/b0zLz88RhUR1UlpuvariT3bx2bbDppwXeo1Qpz3PjyePJeTZUCLOfmoJ3/WYFXBHzlF2+Sy0R2ZiIleFIEj/o79+K25/Q5qiaGQSksq7d3ZkJ2zJv5sDHBcWHYgM5J19rmtvYy84OVdg8PsVsS1uQZSmlRC2sr3GjyWkSl+FqSGmcfkWAcY69qkC9VNteYDwTHcBzMyY9AfW/IIgYlcuwPK6beP2e/hrlnMWzDmj8BRgUji53ek7/Th5nfqJdGVe1q3AmWKF/eBPwMz/XiB2ZUnEujj17kViCM7utbqrVimSwP5xhMC3ZpdLtz7rQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(19092799006)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDhZVCtwRGVCZTRmMWVrekVKNDl2UmZmb3BycU5CUW54ZHhmUmNwM1d6dDJJ?=
 =?utf-8?B?eVFSMVRrRS8valVhWlR6ZUpKTFhlNVhBRWlRUTR1RUdBOFMyWVJHOWhrOEJO?=
 =?utf-8?B?Y0ZOeXBYdnMvOG0vcmpWK1VWL1IyZFhkVWpkcWJHRHZ0VWlXLzBWWFVZN2pk?=
 =?utf-8?B?aEpCZWNvQ3VIVlpiWkRZYXY5eHlQSU1EU09sK1JWZ2pONGc3SU9sZ0RNOEM0?=
 =?utf-8?B?WUVWdzR1WjBXcUVKcXBJVzd6YUQ3bUNxb1VPaGVVeFFmeGgwNEhKd1Y0OUpQ?=
 =?utf-8?B?WCt6STdnTktKRktlU1prT1M0dXpkYUxzR2Z1UHRLZkZQVmU1eDY1b1VnMUVk?=
 =?utf-8?B?MVZGekJDRWRHWDNTUWxDWHZsemtXeEtOK1pXbURHY1c1WmUzWExKMFVoRE1a?=
 =?utf-8?B?UmZpa1hWb3JVVGNzQXNFYWZ0QUR5UkFvL3RNOCtRZmFkY3pDcGhqVmpTeVBM?=
 =?utf-8?B?WTZ5b3NIa2gyMHBGNTg4SUZMTXg5WTk1cktySTlsYjltOGhkYnNTbmQveUpO?=
 =?utf-8?B?RUl0YUZRWHpkcGVnWG1OcTIzdCtFNVBzLzR0UkpPZkdtdWo1MVpsTitMK0sz?=
 =?utf-8?B?OEM3UVU1eWZta2lTSUNSY2hNOG5yeFk0OVlzUWNrc21QaGdOeG85YXA3RzB5?=
 =?utf-8?B?UmV6c3ozTUpIcUtQREZUMVVOVHRMRjdNbUg2K0hWNzUvR1hkSTV2ZnIxZ1hE?=
 =?utf-8?B?RXk4RjUrTHVPMUFmQ0pPYklYMFlTb21Lak42NXJKQkFtNzBJdzhLb052Z2Jt?=
 =?utf-8?B?NG41SWJ5WGkrdXc4N0p2dnRSdVNhK3N6RnZYNms5WjZadktMcFd3QlFPNk91?=
 =?utf-8?B?a2JSUFpWRUhuU2MzaytkWEpUMEczNkk3bjhUbEtKOG5DM1IwaWxNMUx4T1Rj?=
 =?utf-8?B?cTVNTkVJVEpId0V3cGd1UGY1cFZycHhoWnVuL1AxM3lMY1JNS0V0K2pSc2Js?=
 =?utf-8?B?UkpSKzdacFd2UVkwM0tOSTlKYUl1WGNFNUgyR0UxaENnUzJzaXhuQWxmOWh6?=
 =?utf-8?B?TStiTk4zTitXMUpZdlYzZUZGTTNiU08wcXRnNzZIeWlueE9yU1llMFUrUVNF?=
 =?utf-8?B?amsrdDNPSTVEclpGaEs1d0ZTZmZVVENMVU5oTVY0TkRiWEFOR0wyb01acjh6?=
 =?utf-8?B?SDMwR0Ztc3R6UU1RdzFldGZYNFB3L2tvdmlOUmVUaVYvNWFQM0t5cSthdGFm?=
 =?utf-8?B?NVdyNTdkSERHWlpvckQ5V0FIWWtxZFRUdXJab0JxRHZ2a1c0bzBydFpLUkg1?=
 =?utf-8?B?a2ZlQnhCRDVXQWhzRVdsZlo5dG9FZldlbFlBTCtVamNrSUtvM0luNm9CNmxn?=
 =?utf-8?B?ZUEycDFiRzRzSG5rMDhZR0p6R3Vlay8xdk1CMVZsOGFBVUJlR1dWK1VYUjFo?=
 =?utf-8?B?RHBXQTQzRzRuZVNnWm5zbE5IY0taV2s5V1J3bnpwd1ZTNllVaVBCTGJvSFJ1?=
 =?utf-8?B?WXNSY1VXMEE4dlBqV2xxUFNhUzV4c1JOWFFvV2tSQm9vMHRiTXpJMW9WTkZa?=
 =?utf-8?B?Mkt6UEJvTHVoSU1wUlgxMUhpUXlxbTA4UkZrRmhmQ1FocUJ2MkJjcFN3bFZL?=
 =?utf-8?B?cDgvR0tMbzJ6VDFuVERHelBUeVRoYXhIaXRMNHk3QU5UTzdLb3QwRE9MZ3ND?=
 =?utf-8?B?NWhkaDE1dkRCd05EZlNwQllOVzROaUk4NnRsUHZGWExCRENBTkd4R0dKRmtk?=
 =?utf-8?B?Y2xFV3U2c0owS2hFNDF6YzZ1dU1mUEpXTEd3am5uYkdBVUVYMmZ2Zmdzb0Vl?=
 =?utf-8?B?M3JuM2FLa01sb2Rya2JVeGhWTzlyZFZhVEJGV01hbmpiTUpxWS93QmN0YUxl?=
 =?utf-8?B?azJ5Qis5bSt6Z3VJQWlrbkVIUFpPSU0rVXZjbHVIUGtZZzdkd3FOMXBraFRP?=
 =?utf-8?B?Nmg0MmFQLzdSNlpUVDVJZEt1UDhwNHZCSnE4UVV5NFdoSDN1cm8yb2hPVkp0?=
 =?utf-8?B?dzRSZFI3VFFqTnZUUDZQR3pLR1kzMHk3bVVaNUNSdXI0T09TdXZhMjRaczdn?=
 =?utf-8?B?YTdvbHk0MHJITVVRMm1meG5GbUpuRG1Lak1ZY1I1NGgvNE9oL0hnVmxYSGVq?=
 =?utf-8?B?b0Z6NVh5dGhtdEhSOVN0QmRQcDFha3RlMGlOaTdrOFN0TDBkejdMSFNrMUVi?=
 =?utf-8?B?d1dwMG5ENUdGek0waVpPd2R0VWZSVllYZ0x0TldlWUlMMFVzODc1RkhCUEZl?=
 =?utf-8?B?VkdzQzNMVGJzNW9EUGdZWlg1Z2FuMlJiUzU2ZHRwSUtraFRMamdsQlN3dysy?=
 =?utf-8?B?bytWQWwyRVo0bVlMNmRPZ1h4WHdlVUppalNrOXJHdUMxek55M3VjczViWDl3?=
 =?utf-8?B?djNoYzVGQVVLUzdOYjQyZWtpTzNTTm55TW9kNE5tUXJLekp4Syt6ZnlXUWFN?=
 =?utf-8?Q?+PZuBOPVBFZxYjenGs8EwHGfA25r7lSJ3vN7Q?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f0b52fd-26fb-4ae7-2e56-08dee6687b3e
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 14:09:15.4762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /BtWUQVuQ37s/Picb/ON5CMh4BOkQYmN2TH4W66QlhOXP37xDiIB/W8epsJFgFuTCOS61ZNNTIPnlCWvnhU0Yukgoy0oXSY81AlzHIzk7nQEFSdhCAR/CrhZxm4LTrSD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9412
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_070919_155986_33752F63 
X-CRM114-Status: GOOD (  10.18  )
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

From: Sherry Sun <sherry.sun@nxp.com>

Enable lpuart6 with RTS/CTS flow control on the i.MX 8ULP EVK board
and add an NXP 88W8987 Bluetooth companion node to pair the UART
transport with the wireless chip.

i.MX8ULP 9X9 EVK use different lpuart6 pins which used for M.2 bluetooth,
also use the sai6 instead of sai5 for PCM interface on M.2, so need to
update the pin setting in dts.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts | 17 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts     | 20 ++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
index af8f0d6087f71..71c66c58edc4d 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
@@ -75,6 +75,23 @@ MX8ULP_PAD_PTE20__USB1_OC		0x10003
 	>;
 };
 
+&pinctrl_lpuart6 {
+	fsl,pins = <
+		MX8ULP_PAD_PTF18__LPUART6_TX    0x3
+		MX8ULP_PAD_PTF19__LPUART6_RX    0x3
+		MX8ULP_PAD_PTF16__LPUART6_CTS_B 0x3
+		MX8ULP_PAD_PTF17__LPUART6_RTS_B 0x3
+	>;
+};
+
+&lpspi5 { /* conflict with lpuart6 PAD_PTF16-19 */
+	status = "disabled";
+};
+
+&sai5 {
+	status = "disabled";
+};
+
 &sai6 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_sai6>;
diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 6a92c5ca9a412..84c61656f3f2b 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -167,6 +167,17 @@ &lpuart5 {
 	status = "okay";
 };
 
+&lpuart6 {
+	/* BT */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart6>;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
 &lpi2c7 {
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -349,6 +360,15 @@ MX8ULP_PAD_PTF15__LPUART5_RX	0x3
 		>;
 	};
 
+	pinctrl_lpuart6: lpuart6grp {
+		fsl,pins = <
+			MX8ULP_PAD_PTE10__LPUART6_TX	0x3
+			MX8ULP_PAD_PTE11__LPUART6_RX	0x3
+			MX8ULP_PAD_PTE9__LPUART6_RTS_B	0x3
+			MX8ULP_PAD_PTE8__LPUART6_CTS_B	0x3
+		>;
+	};
+
 	pinctrl_lpi2c7: lpi2c7grp {
 		fsl,pins = <
 			MX8ULP_PAD_PTE12__LPI2C7_SCL	0x20

-- 
2.34.1


