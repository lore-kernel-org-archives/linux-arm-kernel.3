Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8D4105A593
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 12:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKLxxEU65SlqDngWWvRHgSKqsWXkYbLkN9S5HA9LstA=; b=cNF9IbykKX9zSceaIH8eMI6Ix+
	LIq1FyvpYDmiZYYZ3UTWcSe/bdf+8cGJkvJTETF+7JchManifsgZSFGf+FBQZLfG4XBD+Rqo5wmr3
	tYalWNtx++dZdNl3T9xCLVq341BVemzQ64WZCaUfnuWMlZWpSEow1xRM4sKRAoRxHJK7UDIaHPPHm
	9ickTRHH02/TlYymPzOpfc6iRieowLJ5u/hpwKqC/64qZrVldOkne6Q4aCtjmokNKEH5CGX+p4rOO
	rnknlBjROYUhgM2ZLVey/TLrCGuuyTM4/s10CLhbsrGINxWCWv3zCp61Spu395uKaXg9N93KqoKEx
	U8Km3K3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fGe-0000000E3Nw-35v3;
	Thu, 12 Mar 2026 12:35:56 +0000
Received: from mail-francesouthazon11011029.outbound.protection.outlook.com ([40.107.130.29] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fGc-0000000E3M0-0mgi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 12:35:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jIS39jY7VA52CMitK7udWW/gOUGQUuUdfgh2IF2rEdn2bfC2xtaHAqNRqG0Sa5KGtOnGteta8lFND3/yeHcV6jCtDAoj6v6MRNc+61mHlj8d2OoF2ZLVJic2X4NVohZlIkJXUzZ4d6/g4FGvsdEmtSbc+Qt3V592Ji1csgR6/oX3z/AdgjRBH4XFTMB4ZRxPH0OFVZ1lJTChg1Tvl8W7DQ8xx2SsodJKfB+cePL3FxGHP1wn2uBLoEK+47I4NnM8NvvPbKeKQHY6MS/jkXpa6efg0Wv+aLN0f94kBnz4z5oiqPGswiPTyK3bZ1Q9IhRg/ql/2a4GaDTK40fOmyzlWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HKLxxEU65SlqDngWWvRHgSKqsWXkYbLkN9S5HA9LstA=;
 b=alvwRHgow5tS/Iizsul6k6JPl/kOU/eL0EHrKoXq6hCiLOfkAQAH40AZUSV81+aMa/OkbbXO+gZUWuKINTe7lNGZxHoWYB0NmkbPzu4/QjzJWc7nqY2FtaE4P+wrO5xqftx+V+wAoXjNCJSttkkKeI/KIivBwctrX2prW0qlz5tbUVE2wvbPVGJbPLe+14Cgxn+tSDG7J/7XlYhP1IKb6QprMexzllJVYvPrCBEkDp4KXP6w1fs7zZNVXaddKZKXLpXwdEgPoqOzZ+HBYO/s2nY7VNzPRqmpdbWh+gR3BYdosaKAXeD5PhwRoA5RqAbolrzjhKTnsziDe6BNQzGzuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HKLxxEU65SlqDngWWvRHgSKqsWXkYbLkN9S5HA9LstA=;
 b=UP6YetewcdzUbLUr+spItZyKiqI7rYbxjaBPm5uM+Jy3/SBMs8BZO8Uv+Hnu1qHldXJGUNXFYMsevDjJjbUnbOk4IRRNbCr8tDGFpz5YBMoxQCPBwQRGvy9KL7mgyi5eAF2Kz8bfcoSLccNPaZZcA6+fmSz0Xqehhu2GfzKQUuXp80FsM355iQXjp856G8iYU88QlPaY1cnUXjX1R8Qw7+FbtzF0Dbk9dWXVQgfdj5mgnhXH3D/pedUyqf6GSHB92Wrcx1RJ90unbS23GuO0hzCoKxmOJOZRXa7lhDW7TOHOFmB0AbZS3nB4IKy8Op1G6i7yTlFBLpOP2V4O8zQIIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by FRWPR04MB11271.eurprd04.prod.outlook.com (2603:10a6:d10:19c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 12:35:48 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 12:35:48 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 12 Mar 2026 20:36:59 +0800
Subject: [PATCH 4/4] remoteproc: imx_rproc: Add support for i.MX94
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-imx943-rproc-v1-4-3e66596592a8@nxp.com>
References: <20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com>
In-Reply-To: <20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR01CA0050.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::21) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|FRWPR04MB11271:EE_
X-MS-Office365-Filtering-Correlation-Id: d4b7f230-9e3a-476d-c8de-08de8033e364
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|19092799006|366016|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: GSvPKAYfvC1wiDxM3YUlVztsameaDxL2LYFVVLi/qCbmXBPu/ffLLHDdyqQuembmTQiewMBNn69hlmFehmMA+8QlBkX7FjgcewMXBk8nUC/LF7s1kNxNnproygI8IUYh/9wsw3/p0atwnWYcomGw0SVlMDiMb67xdDfcLe5Vh5I0GZIwPkAjvJIJqgqE6RAHpU/0h4iUd7wv7g2bVi1f7UnjdrGJuuzsxWqv+W74ubD9XjYrW0Tx77ZnwHizUNPTsFx/CgqJaHrzpCCGwBseVoMt/yYM7rN2vYfMOGgQut/Pc4y3Qo6YBE8vySWJSkSVLra0e5OnCFTD/Ufyo72tIj8+nNHqUd5HcxteT62H+r+4KimSaoqdoGeXiPf4aelecG0wIFnjONKMnQgYteoMR6JfVzEzVFnSZvv5PjTKCyfkvgUnpmp025JCxavG+RDUbwmakPgdQXdF7HcqSzcSmzvf9RMZPTMfRXPdMBeVGmhtpTUWdavQiKTEqo9yXaUinpmF2HVsi3uCEsgVFXGkzDlI7oYSC1TTBA/aomYuLYCXuO483p03b78KEfimQ7V6PSiFR93ZwH6abtF87cXUX+agD9J2sQqegFdqKIX2zJ51IUWwmWL6Pf9UfAMNFBtV+rELTdAxeOFOOBd4qAcpFfaPHaMrig3oMp1R9LRZP95rpEZBuOebPgjZ0wQ73FfHWEvg2OzEOyH8kg9TOiu73OXQs0KeLPncs0mLk9l3Vz85tWH5w8IZo7j7ggY0iRvntm8mS/KXDEo5NtyM1D/rXSWf+KNTW6Aev7yR2MOrBBU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(19092799006)(366016)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHJNeTE4anBnWkpGekJud0p3SnBaVnJDNytuZVlvYjc1ODVIRDh0YjJvMHFS?=
 =?utf-8?B?SkdUVWNLTGZML0ZHTWxnVzRmRGJvQkh0ZEREdE8xM2VkUEloRXk2emlZa2d5?=
 =?utf-8?B?MXNOSTVQZkluWElZZHprRWUxVzBBcDFHSWE3OWZsN1ZmZFUrUTE5UHRaTk5t?=
 =?utf-8?B?Q20zbGhEUkJpMDYyUnNTUDdPZ3d6Z2VjT3pzOXAvSXZoZExCWWlWdWRNK3cz?=
 =?utf-8?B?enBzVWsraU05TlJlY1RsL0dyZ3U0c1p1bE1BanY5bDBZT2lZdGFSOE1lUG9Z?=
 =?utf-8?B?NGdDaXFvNHRmeXJvcDZLc056Rmh4NlhmY1hTT1BTT2dyaE5WMy9lWWhVMXNh?=
 =?utf-8?B?MVZSUUhieXZOU2Z0bWdPbjU2OUgyaDRjV25KUjFlSHlzRTIyTzlFSU9yWUg2?=
 =?utf-8?B?Nm1FU3l4cGY2OHpCa1YzeldWZWRpaUY0UTJCckxoVVFvNjRHRFdMNk9rYVB6?=
 =?utf-8?B?alBiRFA5N3d2WWtZSGhlVkZtbjQ4bjIvNUJ6TytCZTdUUzFOMnY2VU9Db1hZ?=
 =?utf-8?B?ZUdtNzN6c0ZvUThmZWxnWnFIL1dZUDNLWEdCeEZ4QjJhdXVhbHFXZjY4Rk9O?=
 =?utf-8?B?V05zVGlSd2tzOFE2T1hRVFc2K3B5akorTW1qU1BLVlNnbk0zbWt5ekx1eThF?=
 =?utf-8?B?TnJYK3FBazJ2WFQzNXRRaG40RjVTQVF6SElBYUtRNUVQS1cxb1Y5SkVKU0Nj?=
 =?utf-8?B?eEVyMjVGWEVvZXdkQWdhOUcvSkVlY0RSR1ZJZnZ4SndUeTk5Z0d1Z0M1RG8v?=
 =?utf-8?B?Qk1KSVNIVmV0bVBmbGhDOFF4aHJ6bDl5d2V0SFpQNnA4bHJpUElMWFpFbTZa?=
 =?utf-8?B?Z3UrOWFmT0VvR2hNbzVCejR3RWQvWittY2tqRnhUb2E2MWNhTGd1UVlzMnRo?=
 =?utf-8?B?YWUvQW90KytPNVFPbS9xWFhMZ1Y5aW4xVWM4a3lGM2FiU3BMQlJadVVUaXpY?=
 =?utf-8?B?ak1tR0JMTFliLzhpOVNTWGFqekhsRmZid2djTm82cmgxNUtGbGF5RlgxVlV4?=
 =?utf-8?B?RmgrZGp2Unp0STFhOVdHOFU1WWhReHVRRlBUQ00zZ1lBYXN2b1FQY1NiWUR1?=
 =?utf-8?B?Uk1BOVFTcFZoQ003cFY1TkxyOHJZOGVJa1pIS2Y5Q3h1MkFjQm4rdlRWbkJO?=
 =?utf-8?B?NEM3WEhHa05jWVJ3bENkRm9UYXhRMnZXYmEweTE4Vm9SVFp6SHc2L3pPTm9k?=
 =?utf-8?B?S3lDeEVBbEJKMi9LWlR6SG9rR0FHT3pEZ3dnVFVQUmpZYTNGaGtIQm41T1k0?=
 =?utf-8?B?QmVlQTdYcG5IeHpqRFErT0NOUnZvaXJVU1RkYWdTVWZqei9oOEUyZEs4NUZ2?=
 =?utf-8?B?S3Q4aDlXWHhiTG1mWVhFNlZ3SElxdkU4elBVMDRHVkprVFZVZHdHdzFJY0Fv?=
 =?utf-8?B?aVMyMnluSEtIWkFCMHBEZGtXc1J3V2NVNlFocG5mT3hZQnVmYUJQcU5zVHox?=
 =?utf-8?B?eTRyeTk0dXlwanVZOW1Od0ZoK1o4dk5qUnlVTWExVDFKODlPeGZ4ZGhsM01J?=
 =?utf-8?B?VkVSb21GYnhNdXVONHpKT3YrL1NXY290SXlETWJwUU9OSDliZ2VhNERGUHlD?=
 =?utf-8?B?YTg0d096MU52WTZxMGNraktZY2ttazZJbnFWSzJIdm5tZUtlNmw2d1NDbXM4?=
 =?utf-8?B?K0d4R1BHRk9kc2llNTFuMWZteXFBYWVyelU4WnpqVjhRcjhsdzY0MU5lY1Jn?=
 =?utf-8?B?M05NaWNhbmZqQUNweWFhOWY4eUJoeGNOV0hxTFNxTWFsbTBRdEF6ZDQzMHBo?=
 =?utf-8?B?VGVRSjVMYk85cXJVdHU3REZDSUtIcW4xK09HU2hUaFFxMEg3OUh4dVptallV?=
 =?utf-8?B?WEx1WUh3ZTZieXNYeWVSQ2VvVzc1bHJmNktNNFRPNFpLSVpRWi9UZ1MrV0xK?=
 =?utf-8?B?RVpXMFo2UVVrRllBRHlQU2pjZFUvdHV5RjdSYlRzRVNmN0gyRStVODhpMnl6?=
 =?utf-8?B?NlBzWmx3ekd3cTJBVlVzazZFUTVnZ0NOdEdVZG9IRUtXcVA1OHBWaWZPRmxE?=
 =?utf-8?B?c2taN1VwTGh5SHJ3Z3oxYUVQYmlGa080UThRaWRveEoybFJZR2JZNHFaVVhP?=
 =?utf-8?B?RUEydFk1L0NvYnZ1eVU0Z2Jkdy9WYWRCYmJkS2ZyTUVCWlcxRyt1SnhqK3JR?=
 =?utf-8?B?MUpLSTVscG11SDUrVThXRklNTWl6d2dNRlZoSmdQNGxFM3hTRytWakc4aWZG?=
 =?utf-8?B?SU8xSU0wT3M0QmVieGUxdWtJWkdVSE9veHJFNDdXMHVNaFJ5SzdKaDZma2tB?=
 =?utf-8?B?L2NRNXlxSXpxdjR2VkhYQlFtSitJMitGWTNmUFc1NCt5MWsvZ2hZM2dvWUlR?=
 =?utf-8?B?bkt5d0g3YXdZeWtmTXp1eExoa0t5M2RFbzh3NEZ5THptZGkyV0I5Zz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b7f230-9e3a-476d-c8de-08de8033e364
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 12:35:48.2759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0kYVZ5s7oOSj/JPeRGjgGUsRr/bxLlvRuiDrivlsPKL387vk5AKkB24lauVcWVDYKoGLjTQa75MO+lOa/Qpmtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11271
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_053554_256447_0F47F881 
X-CRM114-Status: GOOD (  10.77  )
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

Add basic remoteproc support for the i.MX94 M-core processors, including
address translation tables and device configuration data for the CM70,
CM71, and CM33S cores.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 68 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 9b07103857b13018bdf62431cbfeffa3e3c1a15c..8278643eeb390518981e8beae086b73be265f50b 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -146,6 +146,47 @@ static const struct imx_rproc_att imx_rproc_att_imx95_m7[] = {
 	{ 0x80000000, 0x80000000, 0x50000000, 0 },
 };
 
+static const struct imx_rproc_att imx_rproc_att_imx94_m70[] = {
+	/* dev addr , sys addr  , size	    , flags */
+	/* TCM CODE NON-SECURE */
+	{ 0x00000000, 0x203C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
+	/* TCM SYS NON-SECURE*/
+	{ 0x20000000, 0x20400000, 0x00040000, ATT_OWN | ATT_IOMEM },
+
+	/* DDR */
+	{ 0x80000000, 0x80000000, 0x50000000, 0 },
+};
+
+static const struct imx_rproc_att imx_rproc_att_imx94_m71[] = {
+	/* dev addr , sys addr  , size	    , flags */
+	/* TCM CODE NON-SECURE */
+	{ 0x00000000, 0x202C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
+	/* TCM SYS NON-SECURE*/
+	{ 0x20000000, 0x20300000, 0x00040000, ATT_OWN | ATT_IOMEM },
+
+	/* DDR */
+	{ 0x80000000, 0x80000000, 0x50000000, 0 },
+};
+
+static const struct imx_rproc_att imx_rproc_att_imx94_m33s[] = {
+	/* dev addr , sys addr  , size	    , flags */
+	/* TCM CODE NON-SECURE */
+	{ 0x0FFC0000, 0x209C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
+	/* TCM CODE SECURE */
+	{ 0x1FFC0000, 0x209C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
+
+	/* TCM SYS NON-SECURE */
+	{ 0x20000000, 0x20A00000, 0x00040000, ATT_OWN | ATT_IOMEM },
+	/* TCM SYS NON-SECURE */
+	{ 0x30000000, 0x20A00000, 0x00040000, ATT_OWN | ATT_IOMEM },
+
+	/* M33S OCRAM */
+	{ 0x20800000, 0x20800000, 0x180000, ATT_OWN | ATT_IOMEM },
+
+	/* DDR */
+	{ 0x80000000, 0x80000000, 0x50000000, 0 },
+};
+
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
 	/* dev addr , sys addr  , size	    , flags */
 	/* TCM CODE NON-SECURE */
@@ -1466,6 +1507,30 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
 	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx94_m70 = {
+	.att		= imx_rproc_att_imx94_m70,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx94_m70),
+	.ops		= &imx_rproc_ops_sm_lmm,
+	.cpuid		= 1,
+	.lmid		= 2,
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx94_m71 = {
+	.att		= imx_rproc_att_imx94_m71,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx94_m71),
+	.ops		= &imx_rproc_ops_sm_lmm,
+	.cpuid		= 7,
+	.lmid		= 3,
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx94_m33s = {
+	.att		= imx_rproc_att_imx94_m33s,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx94_m33s),
+	.ops		= &imx_rproc_ops_sm_lmm,
+	.cpuid		= 8,
+	.lmid		= 1,
+};
+
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx95_m7 = {
 	.att		= imx_rproc_att_imx95_m7,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx95_m7),
@@ -1489,6 +1554,9 @@ static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx8qm-cm4", .data = &imx_rproc_cfg_imx8qm },
 	{ .compatible = "fsl,imx8ulp-cm33", .data = &imx_rproc_cfg_imx8ulp },
 	{ .compatible = "fsl,imx93-cm33", .data = &imx_rproc_cfg_imx93 },
+	{ .compatible = "fsl,imx94-cm70", .data = &imx_rproc_cfg_imx94_m70 },
+	{ .compatible = "fsl,imx94-cm71", .data = &imx_rproc_cfg_imx94_m71 },
+	{ .compatible = "fsl,imx94-cm33s", .data = &imx_rproc_cfg_imx94_m33s },
 	{ .compatible = "fsl,imx95-cm7", .data = &imx_rproc_cfg_imx95_m7 },
 	{},
 };

-- 
2.37.1


