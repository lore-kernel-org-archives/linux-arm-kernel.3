Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256A6C4452C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 14:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5YzhyrUcudFiHsttxrR4skqR0APEgQNzPTocQAdW8Y=; b=f4mVhGd8L5qXy2kse0JIWW+pA0
	9y5arkMDKTm7Au9GxaL48bDIhWlqCr+qA+CVUKBHGX+QDPKkV2/iH5zw8pcrZC4jSUIB6TP1kVuYI
	a1v/xmA9gMkTn6SJAxp/zzLdGf2MUH+6PwlDj9cxG95H5navjqIqGrsG2C84o7dZakRLPP2fxQ2SH
	P46YTvIIV1IuMjL96iu+DBLstgjC/KjU6OxoeHPAdVgA0Cd0eiEUTeqOd/2uz+1/4GlTpUnMkRE4G
	7uBpIqs+RaqY+Np5ni3BlmU9BnpWv3di4e2qkwqj+3uglMDElGD8mYJepSiEhXl9cSK2M5IWgcnZg
	GVM2oebw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wloge-00000006urg-2rG2;
	Mon, 20 Jul 2026 14:09:40 +0000
Received: from mail-swedencentralazon11013049.outbound.protection.outlook.com ([52.101.83.49] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlogc-00000006uoX-1FK7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 14:09:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qX+PuliRQEn19l2Lb5Mwe3GO6rC803tQ75MPmnLefYuNt35gNnrw0TtvJVP/21JK9yCWM2NMUiRjhTjC5SouvPqbniNXHa6Ghdwerpi8hrLHZHuRA3MPTKZrJxdBxtNBsH1Y0S8rleDZSmqOo7VM637ZK9iKeVBYXJ3pALSdIhhrfm+k4+btlC9ygbr4BGHZZvoixYFsVT8VTYyHxSk6H+n3aqXcguQvsFXpFn5Vlqj6Eo5Yjq6NdSZXwNIxQQyIMsXOu5L79MW8CLnil7qQ+mZj8jdtFghtbtLxE4Bm727YC69wJkVYDc8p+Lzpxk88Jz0AI5eOm5BmmuWfcccJgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5YzhyrUcudFiHsttxrR4skqR0APEgQNzPTocQAdW8Y=;
 b=QeIYn3AK8Bt1GJgw5vIORGIW/kR1trq6YvtTtvfjheMowxg89oniGlxsHC+efTBJo/1pd3u8nkOOPHodLHjbTTJeyfOFyUSFPkFlTyKODyu9yy7hBhrMS4sIgz+L0+2R5tnYlCnTISjmzYR1oyTW+SIXzlTX9xTIavzYA+yOGk2GYjy1GQWb4CgVDK8D+YRSfgSOTWUVgovLIWRoYB7IeZSKiUSDy7gTCYrW0WyB+tNYko657TtKaAWFTlgne/ESqHEwS6RVxu7IYgTDxD7/cHm3dEDabgisObwlHMMbeN27DeK/gRY3++4xHRa4gh3ZOsUXX6vGG9MgcDM128HWlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5YzhyrUcudFiHsttxrR4skqR0APEgQNzPTocQAdW8Y=;
 b=a9vl/1OG6B13x9VChJDPAYV6JWvn0QFf96U4UxP4fllw/bkkYNFeimPB2BsLDS2b6FNIhF6NBub4aA6pQtFEnRz747tvV5BerOCgELUao5oRvDa/IoRkVOZOgkQ2bEzeSpCYKQYv6EWQITOY1igJqW4kV/BXCsVFcLbPQsrDzOSap4kkBmmB/tcY1wKtVnVKK9PwKWf57mxe+KIW4sf797hu15KEqcyICwh8MEI9CqC9xphOkAa2vlbz2IJooUO0CF2d50hi9GDZO4d+HQNQDsCyPgWmcVwD8ACV5n/BWC7TSLVP2n+lsmqsO+x2zOozOLMZFipSNTAPtpx0UECbzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AMCPR04MB12647.eurprd04.prod.outlook.com (2603:10a6:20b:76d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 14:09:34 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 14:09:34 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 20 Jul 2026 22:12:17 +0800
Subject: [PATCH v2 9/9] arm64: dts: imx8ulp-9x9-evk: Rename model string to
 reflect die size
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-imx8ulp-dts-v2-9-d05c67676f53@nxp.com>
References: <20260720-imx8ulp-dts-v2-0-d05c67676f53@nxp.com>
In-Reply-To: <20260720-imx8ulp-dts-v2-0-d05c67676f53@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SG2PR01CA0188.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::10) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AMCPR04MB12647:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fb9401a-c314-41c0-69c1-08dee668868a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|23010399003|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: YA5akTEn8f6W01kgoAAAM3fAC4tOPI6mvv4ZaOFkN/0MxpQMK3tiD2Sge/h56cf/zOQDGEC/v7izl9HrmLOh57C0stLLyBlyQXkXA/iGzFTGdsOmbVNTGBehOudZEqEXCYF6LYhR3S754rafT5qvvutaUCXb++rmgKfZR7hhIRPvesqY9sHHFKVYAGJdzsAOEcKNYt3HRhOrNx4oXLaIM0Xtaz1JMBmJKHzSvnu9iLkgogjoMx74wZ454BKynVc3ZzZ67Zz7A4eDnWzMuHeJ1iUrtF+4ZsO5JhJMifqwOcAxMi0esPrqOeXFlFeuQzfs7E77vI6QOV2KE62qR7ZgJgQKQogRbxqw6uQKGw5zna1fIRiqJ7fJN9zPRx7z86/L+Fq+0D2Mrm4XIOHV/F/mMzcxmtV6NBd//FeLDGiGH+G6n4+ilj0MBGC9S56buZ4/mScBE6Oml15X8KARj5rnzT24I7TIlgDlqsvWqxFPsehvIDO8LeQLS0j1xBZhUTQyPxfnVYZQi8bNkVd83zKSDnPaptGRO+F5ZnzASPAuuPAnBaiTMeeHd3DOtrwsCA/eNPZS0+gESTOBjmTzhwybrB2N1Pq4/C5Qy6lrqRLrkD4kQsVQbVMIMedjqnDF1ctVN0fYubTPJSo4gK78pyROFGaHdEtj02Z9wx10kDOLGLY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTFvSXdzV0EwK1VVVGhCbkJLejNMNTdJdTVpRHVkWG5QdWFVaStMM0hMU0dn?=
 =?utf-8?B?TSt0dUQrOWg1bzJVOEFqaHJpdVBsVnhZNkVHdGlUTjVvRHFSN2IzY2VZU1B4?=
 =?utf-8?B?bkhmSDJxUWxnRnNXT2RRRDkxaGxGdnMzVzdsU1dOc3A3VjBIMHlRYjA2SnhS?=
 =?utf-8?B?R2NDRldrR3hwZlVwR3YwTGtHWStHalBRcnNOTDdJTEpzcnpVKzJpWHdycnBz?=
 =?utf-8?B?Sko3ZmVhdTJOSUVQdjVJZnVBanNvdWw0SExqMU91WW1MckgwZXVpaUwxZ3FN?=
 =?utf-8?B?ZGNSVDdxMDl6Qk9naXJRWUMzcmZRNmhRemlYMFVKdjJPdUpKNjlQMm9RMFdU?=
 =?utf-8?B?emJpS3IvTnJDNjZkM2RSVEVUNjRneUtvb2VtbzBSMThCVzcyeUlMUnZjVU1T?=
 =?utf-8?B?NXNFY2h3Sk04emhRZ2MwT0krcVRsQXVHd24wV3FlYlpyeXNTMmg5UjIramcw?=
 =?utf-8?B?d1o1Q2lQcmtQWnRmYzE0YXh3bWxBNEVROVUwSzl2cTE5bTFqTEdwd095Unpo?=
 =?utf-8?B?cDNlckRDcXRZaEFnWDY4QUtydE51K0R2U1FHZUtqTU03OVZlbFFLS1p6d3N1?=
 =?utf-8?B?NEtSd3QrR1BDYTVzRXc1UnRncG1ZL2p6VGVLc2VjYkhkd3VSMSs1djhaOGpl?=
 =?utf-8?B?ajVVZzI3Y3A4ZFdlZTJtWHpwSkdvek9pNWxaK0ltemxZaDBEV3VDeG0wTXln?=
 =?utf-8?B?eUkxRnJuTjRGSXJ4ckZiYSt0bFVjeVF6QmNzQmtGQzFRWWJXUFdxY2wzZDl0?=
 =?utf-8?B?YUhvbklNMXIyRnhMS09SS01LOGJBWHZuSWQwV241bGFXczRSU1hINzdERzRy?=
 =?utf-8?B?YndZNjlNazZCOWQrU1FkZ0dyODVuQWRtQ2Q3Tnc2Uk1DdEp0U1I3MWpGY1ZF?=
 =?utf-8?B?MEdqcXl0VnUyZUdEb3VNbUJhS2liajJXeFRGSkR3RTE2UEtVMmRXc2FrNDF0?=
 =?utf-8?B?R21zUWVKalc4dm12ekRvLzBpYUFJREVOalAvczZKT2pWc2I2SzVCUTlrNWdP?=
 =?utf-8?B?UCtTaFFpb0JWRUpwYjRWeUUwY2pZRlEreWllbWJTYzNxUmpYOE8vTHAyUVlY?=
 =?utf-8?B?SDR1b0d6cnl4NkRHNFYzbzl4eFBJZkw3VTVTalErRG5zdm11WGRvMEdBUGR3?=
 =?utf-8?B?Wk9zY3pyNVpacTV4NFJNVGEvVEttdG0zbnlNYmQySW5yS1dNRHRDNXJjbS9Q?=
 =?utf-8?B?akNybDN4Wml0R1EvOTBseHZtdDZWbVZsMUxCM2I0U0QwdTdYWXRxZWQ4Z1R2?=
 =?utf-8?B?ZzFmaFlCK0dUL1UrZ1hCaXZ0d0NkU0FndzU1SFdLR2M3dlg5YTM2WkwyREtG?=
 =?utf-8?B?M2lNUnVWK1M1b3ZpTmphZG8zS2Q4b2pENDhRcksrZWU2eXg5WDBaY2tBM3pv?=
 =?utf-8?B?VS90NXVzRWNLZlBvQjlPOTNHRHFIZ3VmSkNaK2ZHKzRrTTRaMlVGNm1kcTMy?=
 =?utf-8?B?dEFTME0yNVRZUGl1ajlaMUI2Z29WQTlIalAwNVVDNm9Oa0lmdmErNzR0NFNu?=
 =?utf-8?B?czlTOUsrSFgxNkY1MDZqcElrZmdLNFhpbFQ2cjNvK0tuYTlsT2U5Q1dITUh4?=
 =?utf-8?B?QngzS1JoejdjZlpFTjVrVDg5TGZsRld0a2pUMFhCbitTZlk1MzllRTdpUUYz?=
 =?utf-8?B?djJBbkM3NVdMTGkxcnR2bS96QmswU3c2V0w0RjhQVHJYeFdVSXVTOVJyblox?=
 =?utf-8?B?UENCLzV3dFVQM1VjcWY0R0VTc3B2Ny9lQnZpK1N3MHV6NjdYNjhITDlPWDB2?=
 =?utf-8?B?cVRUMTlLa21rM056ZDhWdGNMQUVOV1Z6bnFZckwvSkhmV1lSQ0pOQXhrQmo0?=
 =?utf-8?B?S1ZCeFBseHUyTXlndGE0R2doL2FlVlpQZG5oREFNTDZJQ3FjNlM3b1B1WDNr?=
 =?utf-8?B?TWszVkIvNDlyWm9RQzQxZ2h2M0VyTW02S1B0UXVjdHFwQnRqcGhObFJHRlFl?=
 =?utf-8?B?YUhkejFIakFiaENjMG44RUgzdnJWVzF3bWJNV3lmWTlTZ21UTnJPVEZxazk0?=
 =?utf-8?B?akZwdk80VmlVUVlXb3JJYks0aXgvd1h3RFdGcXRjZVcwNTNGU1FodXlVajI4?=
 =?utf-8?B?d252NUwrOVdwZWlqMUNCYUJQLzZBS0xCQ0Z1N1crNTc5V24zUjJlUllocE5p?=
 =?utf-8?B?RDJQUE9MSm93TEZMeVFQMEk4WVZMVmtuK3ZkS3paWGp1ZENRM1FTMHp2MG1T?=
 =?utf-8?B?N3owM1ovUGY2b3JzS1JtT0txTUFjQUx6bVViQXhvSVp6MTFsWG5sNit5RU9j?=
 =?utf-8?B?Wm5rZXdKR3ZSRGRzTGpCVE9mazFYb0l5clFEbENoelBRYlhoMU1ER0FNNmxh?=
 =?utf-8?B?RzJmcmYyL0lOTnVIVURsUWZxZHViNk1Wa1VzRnBORDZGRmhSMWhJRjI1UFBQ?=
 =?utf-8?Q?u6T31s2w0qZZLw0vsscny8aTRtKpMKvXymdje?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb9401a-c314-41c0-69c1-08dee668868a
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 14:09:34.2434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bIvlazvXR413AVEATvTLSZRN0yk6huLcMPlDsmD5y4T4pFxaCWljgUgWY3mVNk7b5s43ivfU7oVyRI8CpvyAn4QeuTMCa68JoJNkvdUFO0FR7A3U1NhvxHeJeixNWbK2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMCPR04MB12647
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_070938_343849_1F9297A8 
X-CRM114-Status: GOOD (  10.66  )
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


