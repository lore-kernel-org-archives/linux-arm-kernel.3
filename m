Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE514C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 12:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZTjlriJNovbGFgS9HkWbfhtaAG34L0csh/r7kxJL48=; b=MIFcW56Sig4UkcOfE91kWkDOw5
	ep8+pEb9co3t44Y2RuocJcUHYWmOBXvpIMtfd1IpgndKT+b8wIDuLmxi9QkI8KM78Dt6YF7gcYieB
	LxOSGG4pGYTrqeBwKVPLbCkHtODkSwHdmS72joE7wVnF6DX2RadHb3rVQNMOCMPZ06jiK1/K5YreB
	Ju+8qVSw4KGlctEVBiDDNmZ+VERWcNSAPoGXhOwnkWzmPWy2kKnXmNCRZnwZgozV6geuPRkxl5xmV
	yvGzz1dNXmauEkgLNCNg0knP6tI+jygKG5E7qz9od48fM4iND2cdm/7ZE40GWkakPldAkORxoZ9gg
	GkPDFMQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPbO-0000000Bqdx-27As;
	Mon, 10 Aug 2026 12:59:38 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPbM-0000000BqdI-0mXa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 12:59:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v5PpnjVlh8NFgOXR+vVhLkkPnjhzDRdXiF1p7G92+xl7Sk/Fm2eya/zMjPdaVf/OU2XG9TRr98kp8q8ynuZxt6n2gZcEd9wju+rADyWXoqyY2uxNndphOTINuxGEAjdRyBEv3pjJ5ECWM2i6pE2U1t4AjNjda8sUusApIBuMsjfqMJNXksvILUldhoyIXstnRfVvLsG/HSLkac0Pm3Q1ahz83ogfhB7O3LhfYY1g1JV2Ml90BBjHy20QTL5Uv1CsrJEy/1NKL1wostX3FnIeKIZ1F5uN3j4FQVEb+4HY04x+Ppkwszrm6DFHN2QjVnsX3J24E4ByifsjWnlfe5vNFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rZTjlriJNovbGFgS9HkWbfhtaAG34L0csh/r7kxJL48=;
 b=HZRdR/gNXL6lJeSP5L93F0NQx6m8I4Lme9BXSw+axwZh+AOtBcUh18gK7QZoTOSQL7qar/8V1WKmZJKNGbb0yG/olEaycQL6lwmztGwfhFRrD2/ZWbWqyjA9SOcfn8NK2bMkOFmc+ZU1ICov+Tsi0QXoD5MNQJQfKyF8N/QfoYlGo/U94KZErSEqinsaNT8S85eic/mOmcu2pvU8/DpJWu7gJ8/xEJyKhbzGVDRJGll82OHLNclvi6/nL0vtBb9mth4aY//Ds34bqJvId5Rc505RqkDET2dBw2ubrhUQ5WYVS+1O4MaqWT34Gt56Ud+mO5f9D3Z7LsiJLSdLTamlxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZTjlriJNovbGFgS9HkWbfhtaAG34L0csh/r7kxJL48=;
 b=ohB41OwK9bvBJNLRJoFm/cHwP5FdIPO9QtrPE+WmKSNeQlg3tCMUSK1BAwN5+/HE+RR9JTyrnr7oz5z+N6NMyD/J92a7TcKK455LKiXWjQpTj4493U5b6amLXr1zwtruwN7XzEAV91D6SPutS7ykDmPBIiD0kpf957KJl00brwxGYBZ2ZiMOVd/BNet2Pkdh/m6GeBpqzuQp8mSm77/0vhbBkRLi5oLHhBtKZ2d/Z+uYfF4Mh2iw1LvwY8QFdiYpKQ3Ou38K+NXHV2CIDUH3nnCRPSdUqqFbHqZSlO8DU4aJnglRWb54RFBT8/Ax378XDBuahTgghEP5J9QWg6cSvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM9PR04MB8841.eurprd04.prod.outlook.com (2603:10a6:20b:408::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 12:59:31 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 12:59:31 +0000
Date: Mon, 10 Aug 2026 21:03:24 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: imx: scu: fix autosuspend cleanup on probe failure
Message-ID: <annMHHQGlxTgzRkp@shlinux89>
References: <20260808082933.2692878-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260808082933.2692878-1-lgs201920130244@gmail.com>
X-ClientProxiedBy: SI2PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::10) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM9PR04MB8841:EE_
X-MS-Office365-Filtering-Correlation-Id: b8624262-e484-405c-ec2f-08def6df3843
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|23010399003|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: MUQI7IjHJQrfegaPT/UxXHHcaA28JJjmlHzG/LSzoS4tGeg0GorW97vzP6DKQI2aKIIAySD8n/lER1299MCIxyyDGq42hJXHTCypW/nboXW4E0h+I3InxDS0eSe3nr7q0HzzhkE9oSuZoAGSme9wwPXSiOZhqc5mVtmJPXPUlBMXpXi3PD5lZUgkWrGTvp4Ol2CYhIUuPkoMigLlv+smntZ0itO8l6u4kwuWSZsixG1jBCf3dwLPBWYov2lmaXYCMwb2JkztgZTrIljn6c9cqylPDrBOdLjqteWw93owVp22GPyd9+Ro9O+FYU1Pxqe9YJAQIv0JBIVmEoeksc95TdqsU2lWigTdpsfPcf3OpKk5oYsm/9YCvf+WJgoiF3Sh2btpZqBrM5FV3piaAfGCb/RxjsM8jCIETyoVD7WPEsULkPhY6cREbMpGDrut6Yy4NP+0CW14WD6AmzOSM15YIruCCASkc/xbto/Qckvtu9YS/bm0AKNFOgplZ16W29ovPJRnlGjX5cw9zu+HM4TqtD7Ap0GHdpEbzW9vqvV2yGHqjXj8WUq8yVEaCWTyrcppX7swxdUk0ovo/o+UmTQRPynySIfX0zaTfLl6HPS2FyW9VeA5QZ9/a1+ox7PNHPVzO3ekgCfLk5II6P7Ls7upaoaLVCGNgHmO7BRgr2O8AsA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(23010399003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmFySEtueS9PYUsxUW5tUHc5eVFiWXI4azI1c0VzQ2tDMU55WE1PNHZRYTNQ?=
 =?utf-8?B?c3NmRzd2S01XWFRZai9wbGNTclNCczdwRG9HMUdpNkNlQWJjb3o5bWFuN2No?=
 =?utf-8?B?TGFZRDM1b0tGL1p6N3pVbktHbXRiZmkwRVNhajVlSUhFdkIwL3VUZ1Y2ZU8z?=
 =?utf-8?B?dXRMZ2JNNXVCY0h0MkZJU1Z4VEdrQ0VQUDBtUHlrcXoySDRTdHlIL01hTGdu?=
 =?utf-8?B?VzcyYUhSMWhmZHV2UG1qcGNwZFRtL3UxaHM1dXlHSUxwVjZZUTR5SlZNZkZq?=
 =?utf-8?B?ZHFudWtiVC9Pb1pEOG10ZWZCM0w0UW84ZVdtMHU2eEhJaElHZmMrY1FoV09i?=
 =?utf-8?B?NHpwZXU5Q0NCRDI1Nnd4MGRaYlRJQktIY05mMzJmTkc1M2U5N2JweDFnTzd6?=
 =?utf-8?B?L1NGT01VMnp0SitUS3pMdjNRRmw0RmM4MDd2L2dkRXVrbmhVb0VwbFA1OGpk?=
 =?utf-8?B?RHhHaDFaamRnOUN5Vm41ejFpVkxNS2d6Rlk5VGt5dXVHOFk5YkN4dkVKYWYr?=
 =?utf-8?B?V2g0V29mY0dlSG15VmVsTUc0YjA5dXVPS0tnQWRObFZpTTF1bGhQblM3Tyt5?=
 =?utf-8?B?NnpBTmVMdmRITkVpaHgwOU9aaDJDdHNUZitCcHc3UFZ0M1lhTU8xWktqV0Vr?=
 =?utf-8?B?L2FybnNwc0dVVTNYamxYQUM2ZTRRMjl2VUdSWmtaTHozWVg3dmoxd1lnZ21y?=
 =?utf-8?B?RkdDcmhvcy9zek1GRVBSTkp1dE1KYkUzUTdxT0RqRUw1eEtNY2lhQmU1MUtk?=
 =?utf-8?B?cGlCNWdsdFh5TGxFbXhPYS9GSTVVa2c5WDNZVml4Yk51eWdHL29KT1M4MGlk?=
 =?utf-8?B?RVJTVFZtQ3p6d1FEL28rYjBXR1BObkdLTDYzZUkzeGhYOER4MEFiMi9aSHgw?=
 =?utf-8?B?MTJqV0J3MFE0SkIvOGFVRklXTXdzenl1c2pvRFdxeTBNQk1mRDMzakVSbUlI?=
 =?utf-8?B?bmhxUDNXbk5jQUdLREdxZG9PYlR1K3BiOWpsa2dPSWJCVm1PZE5CQVZ1TjBY?=
 =?utf-8?B?ZWVQNDFWS3dQcHoyTzRZT21CNFQ1Z2tueHRiSk9hSXphQ2p1WWE5WWZoL1gw?=
 =?utf-8?B?TVY3dDQ3YTRRekxzaUZobm40dTJONUsyMlpwMGZnVklvTEFxZHZGSmd5S0F2?=
 =?utf-8?B?SHdHNzE4K0dTTHprMHVibWdWUEc2djd3bCsxNklTYnZkU1k4cTZDUkM3Vk9Y?=
 =?utf-8?B?NWFHeFFHNGpMdkdmZ2g5OHVQeG9aeXJtTGdLVnhBNTJ3UklDbXdXY0ZjU2My?=
 =?utf-8?B?Y21Dejlrei9pRitNZ0ZYdDB3LzNnNyswRTlVOFBXbDVYV3VlR2h3bkRRK0pt?=
 =?utf-8?B?bkRtcHNMZnhlT3l1K3ZNZnRZUngxZ0haaXFDRjlrR3V5ek1UQjAwZ2pRREsx?=
 =?utf-8?B?S0paU0l0SEwrb2FRZFBvUWVWVXBjWnViMHlMcFJ1d0luZFF2VkVNM1Z0NFZM?=
 =?utf-8?B?a3JTekExMDROQTY2cGp3N0J2eEppK2RtU0U1QVZmem5ZcFc5ZzhCZitRWHlT?=
 =?utf-8?B?RFFuYVZhRXdPYUs5QUNQWGljRStBak1BaTQxSFhJUElVT1kxR2ZpOHp0Rkcw?=
 =?utf-8?B?S0czUDBFNTk5U2tFWmZ5TVJRdU81bWlETU8vL2NiUUVsRXRsbElmY2Vra2Mx?=
 =?utf-8?B?K1FrWldKWG5Id2Jab3pLb205MVBYeFZlYnVtcjdjb0E2d0lNNWl1TWVnM2NW?=
 =?utf-8?B?aUJNekhrMGhEbC8yc2NWcG1Ec0lzQ3JUby91dkVpc3BkbC9LVWp1RFV3Qm11?=
 =?utf-8?B?bmwySE01MldxT3loWWdkbDhlYkVYTzFmUzV3RjJUY2M4ZzB1bnZKMWFVL3k3?=
 =?utf-8?B?K1hJOWd5YXlwODcxOVg2NlZ2eFBLdi9wQjVTQ2FuWWZjRzRVUmM0b1JkYUdy?=
 =?utf-8?B?UkFoSU8xZHArK3ZaMmRrcnFTS0VneDllK1V6TTlXeWttbUFKL1FCRVl6bUF0?=
 =?utf-8?B?L0g1MVpjMGVCUFUxK2NSVDFtVjYzTVkwQ1NIUnB3V0M0S3U0dkJzcUY1OVdT?=
 =?utf-8?B?RGMvUEI1VW1BVmxuVnpSbEV6R1BheTN1c0MvV0FRMW1HN0RUMHVBR2JmeDgx?=
 =?utf-8?B?Z3BZcjB3OHJMZk5taWl2YWNXeUZCcWVqT1llbzBtNk5YL3ZmVGw5ZFZ0ME9Q?=
 =?utf-8?B?MjFKaTNHRUlyUkpKc2pLNmVpdlB5aE4zdFdTRXNqNkhISnlpeGo5VHlmQUZr?=
 =?utf-8?B?V2x5SWwvby8rK3RWaTQ0VnBqRXE1eW5HTDg3di9QbjJNNUVZUnREdHhWUmJz?=
 =?utf-8?B?dDRXQWJJR2hnZ3ZFazJ2cTlnS2s3bXNtR2orYm9Lc3QvWERBNTZHckh2MlZt?=
 =?utf-8?B?enUwaDd2cEN4b1NQZ2dhQjZUbjZIQkRuNkN4blRsUm51RXJYZ04xeldsbG53?=
 =?utf-8?Q?bn9RVcgOKRA/HsXLgFlqEluEKhJetgLnz7FSR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8624262-e484-405c-ec2f-08def6df3843
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 12:59:31.8342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 70gbiBnPX5XlbNd8V9c3elEbfW8rRGrfMTI6Q1+HRYHgv5Rpqz5cSghbr2NoyxUEwQ3qOWvxogXTE0shE2haigxqGu80lMx3ygTr49QWRiMLxODe8wNyWHEk9LPXDJQV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8841
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_055936_230791_AF6164B1 
X-CRM114-Status: GOOD (  17.85  )
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

Hi,

On Sat, Aug 08, 2026 at 04:29:33PM +0800, Guangshuo Li wrote:
>imx_clk_scu_probe() calls pm_runtime_use_autosuspend() for non-CPU
>clocks, but its probe failure paths do not call the matching
>pm_runtime_dont_use_autosuspend() before disabling runtime PM.
>
>If the autosuspend delay is set to a negative value while autosuspend
>is enabled, the runtime PM core increments usage_count to prevent
>runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
>during cleanup, this reference is not dropped and usage_count remains
>unbalanced.
>
>Add the missing pm_runtime_dont_use_autosuspend() calls to the probe
>failure paths before disabling runtime PM.
>
>This issue was found by manual code inspection.
>
>Fixes: 78edeb080330 ("clk: imx: scu: add runtime pm support")
>Cc: stable@vger.kernel.org
>Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
>---
> drivers/clk/imx/clk-scu.c | 4 ++++
> 1 file changed, 4 insertions(+)
>
>diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
>index 9b33df9967ec..6d29fcc2306d 100644
>--- a/drivers/clk/imx/clk-scu.c
>+++ b/drivers/clk/imx/clk-scu.c
>@@ -542,6 +542,7 @@ static int imx_clk_scu_probe(struct platform_device *pdev)
> 		ret = pm_runtime_resume_and_get(dev);
> 		if (ret) {
> 			pm_genpd_remove_device(dev);
>+			pm_runtime_dont_use_autosuspend(dev);
> 			pm_runtime_disable(dev);
> 			return ret;
> 		}
>@@ -550,6 +551,9 @@ static int imx_clk_scu_probe(struct platform_device *pdev)
> 	hw = __imx_clk_scu(dev, clk->name, clk->parents, clk->num_parents,
> 			   clk->rsrc, clk->clk_type);
> 	if (IS_ERR(hw)) {
>+		if (!(clk->rsrc == IMX_SC_R_A35 || clk->rsrc == IMX_SC_R_A53 ||
>+		      clk->rsrc == IMX_SC_R_A72))
>+			pm_runtime_dont_use_autosuspend(dev);
> 		pm_runtime_disable(dev);
> 		return PTR_ERR(hw);

This is not complete fix. I just write one, see below:

imx_clk_scu_probe() sets up runtime PM for non-CPU clocks by calling
pm_runtime_use_autosuspend(), pm_runtime_enable(), and
pm_runtime_resume_and_get(). The probe failure paths do not properly
undo these operations:

1. When pm_runtime_resume_and_get() fails, pm_runtime_dont_use_autosuspend()
   is not called before pm_runtime_disable(), leaving the autosuspend
   setting unbalanced.

2. When __imx_clk_scu() fails, pm_runtime_disable() is called
   unconditionally even for CPU clocks, which never had pm_runtime_enable()
   called, causing an unbalanced disable depth. For non-CPU clocks,
   neither pm_runtime_put_noidle() nor pm_runtime_dont_use_autosuspend()
   are called, leaving both the usage count and autosuspend setting
   unbalanced.

Fix the first path by adding pm_runtime_dont_use_autosuspend() before
pm_runtime_disable(). Fix the second path by guarding all three cleanup
calls — pm_runtime_put_noidle(), pm_runtime_dont_use_autosuspend(), and
pm_runtime_disable() — with the non-CPU clock check.

Fixes: 78edeb080330 ("clk: imx: scu: add runtime pm support")
Signed-off-by: Peng Fan <peng.fan@nxp.com>

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 9b33df9967ece..63ab4801ddaa7 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -542,6 +542,7 @@ static int imx_clk_scu_probe(struct platform_device *pdev)
                ret = pm_runtime_resume_and_get(dev);
                if (ret) {
                        pm_genpd_remove_device(dev);
+                       pm_runtime_dont_use_autosuspend(dev);
                        pm_runtime_disable(dev);
                        return ret;
                }
@@ -550,7 +551,12 @@ static int imx_clk_scu_probe(struct platform_device *pdev)
        hw = __imx_clk_scu(dev, clk->name, clk->parents, clk->num_parents,
                           clk->rsrc, clk->clk_type);
        if (IS_ERR(hw)) {
-               pm_runtime_disable(dev);
+               if (!((clk->rsrc == IMX_SC_R_A35) || (clk->rsrc == IMX_SC_R_A53) ||
+                   (clk->rsrc == IMX_SC_R_A72))) {
+                       pm_runtime_put_noidle(dev);
+                       pm_runtime_dont_use_autosuspend(dev);
+                       pm_runtime_disable(dev);
+               }
                return PTR_ERR(hw);
        }


Regards,
Peng

> 	}
>-- 
>2.43.0
>

