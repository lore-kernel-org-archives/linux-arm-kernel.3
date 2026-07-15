Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B41DC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5YzhyrUcudFiHsttxrR4skqR0APEgQNzPTocQAdW8Y=; b=fIVuh/YnrZ+/a/pHqdVyi6pSdk
	Kvyz1GM7zjsNigKASOBquJoLmW86aIpCbwqktxpWSKa1/XaR18uIXZBVrryam6OzRWAppGaQfYp0e
	oiCE3pbUt0WyZq6IulY3CloJGxnfwKNzTOTF05kBRmXP7ltnA5w8dQifz0cUgNVoTV/JedwHrMRV7
	R91/SGK8NoLbi5pkELeS+I3uTFrhWeDCOHFHyZFBJQRoMP71a/LOJ2CsmsLaPljNgNWwBbjnNOm68
	nsKVJSSVB10nsxyMPUhW9lBsHI1QC53FtdDfgcjBDyDpvgsw5Lbpg5pDhhUkFf3Yw0a5tWGbXOybA
	fCQ5Eccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjylK-0000000EnmE-34SO;
	Wed, 15 Jul 2026 12:30:54 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjylD-0000000EnfI-1ioU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:30:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lXUhr+lpw/u0oilRhx011vJpztdu8fPyXXSosV1QXqioJGiFX+Pj1fRAtG4FCRgK6ejmdgO8kSX7mIG6ogNOzMuMOSKknd7f57zSRWZOg2r0pVvDkIXd/xLJiWv6nbXfpDeRXZ23f+vGjVuWSbwT+ag6iDcWGyUmeEC8rw52Dc3tkrG2Ky0JvDaaWCsE9iQ7pcK+67W5tYZOxLy65TzbFIRkK0B2+AT4i9kS9241rj6ZkDwbZJfeynWgkB8pg0yfdI1sCib5fh2Y9ozPTIR+WWiDFusgVpsUeyAHsIt7m23BrnzmvLictZf3S73UMnrQ+SiO+MeV+WVT5GA+nWoQUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5YzhyrUcudFiHsttxrR4skqR0APEgQNzPTocQAdW8Y=;
 b=ZpKFVG640QPVqQ+eiNTWTHE/lvDKvYCWaIY3RgPpROvnsHjg4isdvhuwB8mUW62/JgOIsX/QcSq1PbijsF0LzbKA66xATETHsdPjq8no6YY3y000ZXXKTFI9Y+qP/RUz9mtJMeqdrsLsgGmWBTWwbxRrn1hTMGmzFzxg3UUtTUob3AVfbPm8WyoTOOeMKh5xrr3t0hh5AC2VDpSJ/whp4TRuuV34DxufjN1XZaTEIX1xkPnG+pVUuy2b5uBT6WUbbGexPri8ZUgNcMMiXmF4w5k43KvSRakgnvl5+axioh/1/vvk2770Md26GXOeQiWzu9DkPLb2e908mIWMcwdyXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5YzhyrUcudFiHsttxrR4skqR0APEgQNzPTocQAdW8Y=;
 b=ebYzLh+azW3z/zOEGM36AUPluL/NhdHWYvNG4Tdvc/Rtxn8OeFzsJdAqN40ix/mEFHYvM6i51xyT3POIffVpjI0Tc2P2Ngdo/SXDaSShfv9uQMbJWXBZUCNsW8KHxhigZi4IbOA9DPGcJO7z0fO9LpqlYnd2cvFuQv2WmFFLQNA8yi8i9zKCq2zR/CjGLkzWgbeqEtTfMsFNxSOuJfLaC5xn2Wo45yqtMmQuY+tdQPSU0kz8XTdpUoaUHPnvFur8/0vCO7FkEksgOSHhxGtJyiFDhTE4NMo8rHsQ8wNLxJGJAmyiET8ui3HzX7WMAzagkPQWH/8flCc9D0jCqGjYww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by VI0PR04MB12133.eurprd04.prod.outlook.com (2603:10a6:800:313::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Wed, 15 Jul
 2026 12:30:44 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0202.018; Wed, 15 Jul 2026
 12:30:44 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 15 Jul 2026 20:33:10 +0800
Subject: [PATCH 9/9] arm64: dts: imx8ulp-9x9-evk: Rename model string to
 reflect die size
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-imx8ulp-dts-v1-9-19651358b599@nxp.com>
References: <20260715-imx8ulp-dts-v1-0-19651358b599@nxp.com>
In-Reply-To: <20260715-imx8ulp-dts-v1-0-19651358b599@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI2PR06CA0014.apcprd06.prod.outlook.com
 (2603:1096:4:186::11) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|VI0PR04MB12133:EE_
X-MS-Office365-Filtering-Correlation-Id: b1d95974-446a-4842-c6c8-08dee26ce418
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|19092799006|1800799024|366016|11063799006|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: wsFkYxd9WgMsfY9dYrGlWudRr6Yy5uljHc7/NchTPU1LIDUs+eRMLR+QFGofY5LyGE8KPoxVxxxoVgkwAfs5lplGB4GH8OFEE5Ri3DQhmwJpVgn1hOs57CdDar8olyOsCa1124+98otu4tFjNdW+nPRYwRJY3SSdlOq9LKgAgis0e9ouiLvNdHaH0MT75psk7DOcWfIlYO7LyP+d9TGQX6WXd+7DR0ylSV5Yv8+k0Tsu4X4nI9CqW5nbz1k25QKlk2SbiWq7qlwXUTnnJqyKg7C5/mbC/mGRDR3vCqGz7qKZSDr5vpMxlaTP9XmfBiqh0aghYF5ErjvjeFjX/5LUokMLLXpoYNnq6MQwzA7rk0yv9PdaisRstwit2KCEAUldOKjtDnkakq4xP82jxKQsO3CYVHek87Pu3v6kzt+mFkq+ZYvAvZMlAQw9NZzaStqyb8iXKury9SvD3btctUwg4yW1+s8pN+DCyq7bxruwFSIhmFfDvTFriSA3oLjx2ZKGmbFn+Z/FQfcXImEqPUXDlms9AQ7MEONU/Jt3xfyd5b/58rDADhUn02EHyoLHyBoqoBvocDSgrssm8k/C1pCKEduJSyBNg4/upJVRji7uqqG3PTR/PosOaQmfp6kNBLCxixMIEhMpTL1nsGAtjdNkKrZDKkx31M0B5FaRq0flrhU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(19092799006)(1800799024)(366016)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXF5Nk1ickhFQm8rOUJpdFVaaXMwbHl1alJVMkRVVWN0NFFEeDJVaTVyVE9n?=
 =?utf-8?B?OCt1Q2plWC93UnNJOGtVYXpQUUoyZWtQeTA3NDduOGVrT1ZVVWxVM0NObHZR?=
 =?utf-8?B?SG9GTjBiZE5hNlV0QWNOdkNrdUZsaEIxZGZ6Mm5yV0FrL0ZtSm8yZ3ltL3Fy?=
 =?utf-8?B?VVQ2REZ2b2Z0MUN6VUxBWS94ZmxWZFJPVEd5a2VuZVZkOU1JOVJaeTVwS2Ro?=
 =?utf-8?B?NDdOaEhrSVM5b25ZZ2xRbjBQakppeXlac3EvbjVQS1FzUENqakhUTHRrdkdo?=
 =?utf-8?B?WlJmeWI2Q210WjdCdHVUYk5DMndIcUtpN252QW9qR0srQXJoQ1h0akxLZW0v?=
 =?utf-8?B?OWsxUjk0SXZ5cW81YVptVGRVUmJYaExGTDRQcG1xRys0L1p0WHMzUDhQMXlU?=
 =?utf-8?B?M0pCVC9wYTczUW1xcjlQaDVVcTFQTEVlVzRmYWV0eGhqRG03eGRHZ0V4YUJS?=
 =?utf-8?B?L3BxV2duSFU5T2xQalB1cUNjbWZWUWhWSDNOMEUrMXZrNGFqT2tsM3g2R2s4?=
 =?utf-8?B?SE1xNHBDc2RUemtHNUg1bHNUbGtmeGtUd1JEQUIyTWJBT25lbi80N1dIbDZH?=
 =?utf-8?B?UGRsZktGdnc1Q0Z0Yzc5K0tWUmpvWGxhamZPSWRxYkE1bmR3bm9VQksvSXBT?=
 =?utf-8?B?a1IyR25MY2pSTHZhbTc0bVFuZUVmNFBLTGpQa2Rib0RSbFJ5emE4NWJzdWZD?=
 =?utf-8?B?V2ZYeVNpT09RODFqZTV1ZjQxYXY2bXYzQ0szc1ZaUDFnclRPMTNaekRvdGww?=
 =?utf-8?B?TTZGNFlCOGFOOUt0OGtvMlZNbGlpL01LU1k1YWR5b1dxcld0bkp2M3NOeTAy?=
 =?utf-8?B?NnNlMmI5a2hkaFcwQ2hUMVBmdWZGY285d29ocFFVbENna09oTElXQWh2L2Vo?=
 =?utf-8?B?V3crT25VcVRjaGhhMjNEejFvMTBBd255dlVwTEN0VnlTSkxmSGt6aHFLd2FP?=
 =?utf-8?B?WEFvZit2MkVnSzhDemlkQnd2b3plWGRFRW9oMlpxQ3Q1dG1ONmpYYVRaUlR4?=
 =?utf-8?B?Z1JRYXBKc2wxYWdmZTN6ajhYcWRxZTI4YXhJOHFRS3NGbDlPYlJuVmR3cUpK?=
 =?utf-8?B?SUIwa3E2UUJma0ZaMlBWbERmU2VkbE9hellrY0hoQzArbjY3SElDQkJKZlRa?=
 =?utf-8?B?ZUlnWS9rTGY2V3A0YmhWR2hZbE9CaFIrWktERGFRYjREdmphdjhpRVJmSVk0?=
 =?utf-8?B?NzAxc0x4c1ByWE95ajBNUnN0UjlOc2taV3huNVdTVjFzTEIwUmN4TDhQaHAr?=
 =?utf-8?B?ZUVxRm9xUlc1VHQvSmRBcEdtZzluaklqUklUZ2UyUFhJelp2WXNwdWgwZWt2?=
 =?utf-8?B?QWpCakZBK28zS1lxdERFNGVOakk2TWtrelhYbkRTTkd4bldsYitRZnBWNUFP?=
 =?utf-8?B?cG1KUy9ZVWgzcHZ2QUlaZjN2YWk3V21VVkZEWHZsYWZUcmdKYkF3WkJFWC9C?=
 =?utf-8?B?Mklma3pid2pyaklldlE5M1Q5SWtiK0h0K3lCMlExckhwYis5UDErYkVubmta?=
 =?utf-8?B?M3NNbkI2ZnduN3VqQVBxTXZucDAvSzFvSXBXczN3Y0ZJSjhMYXR3VzhVSjVt?=
 =?utf-8?B?YTZFbzhYMExWd29oRnZyVmtvWXQ3UWpqY2RWQUtQU25ZdnZPUmQrM1JVY2pB?=
 =?utf-8?B?NGNUQ3lzTENmZWx5M09VeFFHM0ovMnFsM1VUWmxZcTdrc1BNa0h5THc1NEx4?=
 =?utf-8?B?QlVPWGNobFdmWFlscXZSSDhkdW1NN2NUVGgwdEYrNURuUG9iRTVqTE9JbjNx?=
 =?utf-8?B?dkJ2dVhCZjZnUTFVWU1pSnpha0oxMDdkcWxCelhBWW5BaFZDSnV3ZDBXTWhl?=
 =?utf-8?B?Um4vaWRPdmRkNGZHeHhlMTBLWFhKdXhXMzB1UmRnUHRvNG5ZLzB2bFZNdzZR?=
 =?utf-8?B?MDFSakhjZGNlTDFpQ2dyOTVObldCdnh4Qnc2VDljNm5IdElHT2pMQlo1bDM1?=
 =?utf-8?B?cHExdEs1YTh4VUZwRUNNV0Ztdnk1aVk4eSt2L3ZPWHRoTzlmUGV5anM5RjdN?=
 =?utf-8?B?SjZBKytWanoxNlBzZ2h3L291VmZlY1JCK0xIL2ZjZXNCTUM0c1VLd2hCWXdX?=
 =?utf-8?B?WThiWXIvSHBua2NTQVArdFpsS3E1RmhwSTdMdXp6LzY1c2huZkFSMDZiWHpj?=
 =?utf-8?B?eUpZSjBIVis5VjUyMlordm9HVnVNUDRPMTZwSWVZNnV5QW5mWTFoNmdYbFVz?=
 =?utf-8?B?N1VFanU0OVdTQlpXaGFwbWtCNHV6MnhzV254ZXl4dzZleTVNMmZrbTZDTDdt?=
 =?utf-8?B?aklEY2NoMTJqUncyd0dXN0Q5WWVkeno4MGd5UTg3NWtteEMrZVJrNXdCNmkv?=
 =?utf-8?B?R2NzWEFvVHhPd0pJRW95blgxZUtkcW9GSWJ5LzV3dFVnY1RPWTJUUTByOGZP?=
 =?utf-8?Q?MzeaSQjPqmbX5QUQprqvjWKvQGDWSLRSg18xb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d95974-446a-4842-c6c8-08dee26ce418
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:30:44.5464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p6wkotZaPoAYWePoGXxibBYXeXzE88t6EFTd9wkyiXzTJa3c/p8HFRl/onR+4XV+v0y04JVC2rTAneo1jIgbzAWyu7ORf0sletImUB+wuxn2ovsd59ZuOCzKgdOPwQW5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_053047_492591_0BB75D8D 
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

From: Peng Fan <peng.fan@nxp.com>

Rename the board model from "NXP i.MX8ULP EVK9" to "NXP i.MX8ULP 9x9
EVK" to follow the i.MX naming convention where the die size (9x9 mm)
is used instead of an opaque board revision suffix.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
index 71c66c58edc4d..e6bc6e6555f57 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
@@ -8,7 +8,7 @@
 #include "imx8ulp-evk.dts"
 
 / {
-	model = "NXP i.MX8ULP EVK9";
+	model = "NXP i.MX8ULP 9x9 EVK";
 	compatible = "fsl,imx8ulp-9x9-evk", "fsl,imx8ulp";
 
 	gpio-keys {

-- 
2.34.1


