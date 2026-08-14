Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39DFC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 19:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y/p0wzOXAOOuCXGBb8sadiAlrfLrUESYFCKs83aXYAw=; b=pIXKwW6ADHJg9knO+Q+dUatOVA
	VnHkMs4zNK0VttJTxAT+n+yk+S3zKi1947svDZ6r/BWsqbPuHZSN6JZ8Tp+bSyGBRQlsLHixKqegL
	R/7KX3BW2JQo14ki3P/V/p2hjwgIoAE5qaIPcmu62kzSUgzhS9bdXDpeWs0kLliG4PSstHxAc4WXd
	NDxUlYGQB6ZSNFwOt0ZoCCy43DbTcA1UAG7SQErNwC++w8JqBIirTCNfTMSDhtLCWGaq63qPpeKY4
	klDcckktXqNG/Ibt+q2YFQ4JFGIdnuugTQOOC1WhY5V4d5ynRqDr0tO1V+nMLdUqSRNmTOxP2KvAj
	xYNBWiUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuxN6-000000035Mi-1uwr;
	Fri, 14 Aug 2026 19:15:16 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuxN4-000000035M6-1LJD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 19:15:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PaGRD3a6ONX6MaPHvp/9E2xqS7iI2jklGlsClLrYIhmm6ipaCAkC9QWLBRnXsWch9fkVxpZpI4SmiK5DXLKhpNKhs5pz/XSHpMJPj3ckwGA7OlHYRyAQRVz0+AM+S3g8haxCEVsvwbxQfzRHVRrEDCHbjte1Mxo4oRWhGouKqBtuo1zvD8TceRsUM05xIa7ey/Coe0domjAwteqh1186EjO8G44V++kHnVWeoKcB6LjMdvQB5EJzrT2Ye8KHHgaGc8EiYNrzmt/YG5jToEPsONxcjA+k3YwJOILRn9UX90tNNCLXOVbP2Ox1xeuQef+08u9/iymbbXSBE8yEmLdl3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/p0wzOXAOOuCXGBb8sadiAlrfLrUESYFCKs83aXYAw=;
 b=uT1tQ/1e2K2/QbqwQzs3PQLYL3kP5W2lwTIpjscAqSU74eMyAk28ZVGHkLT7BvOJaFU0V7UJOo/AzKK5ByjpdB6ODy+m+N+WawNm8ItTWR9qP+GBTPKbkeJ8gbqUJaIOsQ8nNPopO2RT03zcnsvIQuxmFktHUAwTXgWwZxsf+lBK55dOD2/rGjBZyZrXfHS5VEwPY2/u9zhwy8D/hAb9O2UhffNvFwhMF85xpWks8MXkQAP8bc1SEshtky6GJFbeHWqstWlnfm02MRvAakiwCT9n4KcZodpvgAt4s6YCnve9y6r4U4/I+o1bcMnzXy34ZeW6GFq8OlANjJSbshX5mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/p0wzOXAOOuCXGBb8sadiAlrfLrUESYFCKs83aXYAw=;
 b=s1V9v+z579+Kz4s9ULIR98SBA8/v/3c2yR0HxKCnf/x4/6AVOPg1NT04tf1HSt2nmJUP94FMpBbtdsk9seO5xipoHSnQmg1+G7pZIVAXgwHI0DuwU1Kp8sUrXj8LImnFVDrojBpGaOj7Swjha/wNR3W7uEDkOMi/aq5zN2v2BMHTk21+CuQQ+vqaOeVcGF2lINtFPnaNoQkP+BvsWZioXTNi7ivInDedsnl4vK2SylnX8jcc0RBNf/4hifNkCICvl+OLyGN0qac7z5+HTAuPbxT4SrvHxICEh4dSySZ88cZI9s8nYvDogeC8VDUZGPLkm4yHHE82ZnUQYgwl5lWUcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB11865.eurprd04.prod.outlook.com (2603:10a6:800:2f8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 19:15:06 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 19:15:06 +0000
Date: Fri, 14 Aug 2026 15:14:58 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Sinan Kaya <okaya@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] dmaengine: qcom: hidma: fix autosuspend cleanup during
 teardown
Message-ID: <an9pMnafob9F-Ry_@lizhi-Precision-Tower-5810>
References: <20260808112551.2786782-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260808112551.2786782-1-lgs201920130244@gmail.com>
X-ClientProxiedBy: PH5P222CA0009.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB11865:EE_
X-MS-Office365-Filtering-Correlation-Id: bba1ec0e-c779-4b60-d8fe-08defa385985
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|7416014|19092799006|366016|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: si/k6qlOBIv61Rn1Raw/CRx+abhFeM4UzA3ne/xT+rxTfwDk+hwCTm3R5hUaFc9u7w9WxULpMVZCQriLuiI241cwOMdBnJBy44hRHiedEeBssQU3S/hRN+DWzsjyc8jfEjYwMpvzoYymB8/9GAqGxJ88TB5CeFh+B+g756/lCewLWqlouZqqq/bvJhNV8DB48BrYWjEJhLkkgq7h+StX3yrh957Fq3wPbLejKsXdY1bv0XCRjbMI1EiABVbs25/ftQtx6X4zLw2256yF/5wYfCnv5RpszbbGLxvDbTdRygObgeKw6NCfmgdjvbVbzEdSq62O02586mrirdpzPGwXi3YCDspMXqPZ+iBnyu6Tat3cvljPeDHG55R8C68GXCjUN2ysKw11eciNqTFhvH2QzvE2Wiv9i5JPPSyk5CIP0NyhzEpZsHW8gp5eQfeTv3o/vEYSqyxSEzqPtct/mB3FUFMuRvgI4zBYfPpNz1Eu8yah/VT8PZjgaMcA1DjqcaLPNqHRNB7PIfF7endEOuF6rrwA3neN57wp9I+vYnB/5m+wDCZ9eREYzAGrDTxSpZRGFuPdcHJvRpyA6fWaNLJXxGL8+8qoheqPqSueya9sYZTjfmeqx4Z1BJ4Y6b2SMG3YzXG4GyfKh/br8XI/MFTJu/X+PGFcAOPQGhk/+BQl+tg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(7416014)(19092799006)(366016)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7bJ9IzypGUCPZavwC+SF0TKmzpgnXAlFm9MmfGdBzdP9xHDN+MBIIlnPwhfw?=
 =?us-ascii?Q?zgW1q0N/qlT28HVLlkclrLzf4y1rZfI+1tNJbmcpn7//aS5NfEDj/B864teV?=
 =?us-ascii?Q?F2ENCh67YfyWFFPaaSgqM12BqgcFeOnyprZleYK+Pp+ptTV5jW5l2DcKEB78?=
 =?us-ascii?Q?BoXawKKOLu4WQ3OF08LNDaZTf3Kv1nCY5bjWpXywyKTE80cJn1p3CxPj0L/I?=
 =?us-ascii?Q?GUZT5wrLYtgGIP8srDvLAQoJ7HIk+Fb+RwNbomOY3paotsBtKBRKHSCJWfP4?=
 =?us-ascii?Q?3YhJnrCy/ITuOfGlhI51yPS9rnp6pzfzgzieVPipAFC++P0LouF2Q9degsCl?=
 =?us-ascii?Q?iX5GpBxMUQzpt7/N3BMbDZdvakAo+t6OV5Rxydsn6imC7PfIEqGbsDOBGaKj?=
 =?us-ascii?Q?8tR1TpsnacLlO4/XAgeQ8Qk5Pk7sSo7OS3Svk3fF0Uqe5CweIjAF4bsXbj9F?=
 =?us-ascii?Q?KiLuq+IqQJzdn3leE+t9+aGtPCDj6/Bl2IiAEag21JgAB4vdwc1xqTQihij+?=
 =?us-ascii?Q?mPYu4XFF9CVEoT2eIyAbFWIa/P+v5iyHDzCSn9ld5eA6PahYLROGTJbH2Oi2?=
 =?us-ascii?Q?XXfvcEgoiIZGXBW2m2d6CC4thyBtUeeECigB/sNA8GQcINtQTvKIAN21iTOl?=
 =?us-ascii?Q?mKOOnnINqwq/zf+R+1/BL7BQr9pyQB4vkC8cWDZKzb4f0cIUYDf50ll7oki5?=
 =?us-ascii?Q?P77vzIBe/ogD+znzLTFeEOGe0B8VCiIPqYFUqHk4kluJ+n1ivH0bZl71rCcf?=
 =?us-ascii?Q?HzPN+SqdNMGUj3EfWO7DySFusB9yEzVGDktasGWmUFrfEhHZu/+MLrC/4Iyl?=
 =?us-ascii?Q?pKhnWf1puFvhz/75Pz7Dk/p4pcF6ZducJayn5kDI3nJngDWXZ3F76Cvott8V?=
 =?us-ascii?Q?UjaKtwpnTPh56c1ajLB4CVK17YWL7NFn3h6iozilKWLSJ2K3mrOhNy7hMfof?=
 =?us-ascii?Q?tbNSEyvIST3M1sp9vKgORDUbFSf/9nhin3KrrHniQpaIP2E3lDWtW0oP8yk8?=
 =?us-ascii?Q?PlzRnd+mxYosoPVGLIGEFaIUFORTfVqljITr4ZAoO/0K6ENHPyAy9AVMiiLb?=
 =?us-ascii?Q?utoIdTDCCVWPvdWN34wreRGFoCgI8IPzrnpS4CzZI0e1B6jLR6VqacSUNRHm?=
 =?us-ascii?Q?bzLRJrxThTsBzyDgcbfUFoOFXgUoRzWrtwOPr+EYczqWnkrmXfD9sSI/kxGo?=
 =?us-ascii?Q?6FPnihasCCbXSxmIUce0O6rpVKbQIAEpUv2OZhBfkx1S0Cnj20wMWRfCco6U?=
 =?us-ascii?Q?DLa4pRDTZiVQXJ+ngGqHsy7zbHcoMLaKBAaTquLgCAP9CqRjEcAP5RuHO05f?=
 =?us-ascii?Q?/v31vXkQUI0mmhVPDUqr1Hd2dwdvCq04HRG+2nsL/eAxfGVcJ3i3dofaoMgQ?=
 =?us-ascii?Q?H6YiL3NMaBoAQ/Oux4iWfwPmQpMtrUkYSVdhDl0t2xClg34c85uKTsERnqiC?=
 =?us-ascii?Q?G906/48/Bw5GCQad20KVQJnljCs1vNdrjUMmMuk4URRpU/vhm/pDpcRbRZ4a?=
 =?us-ascii?Q?SuJ4tQbrGdWqlKPDlpDWjCZx2l293/jpaUHzQOoW2GtB2WrBAGzlVxquYKVq?=
 =?us-ascii?Q?wI113ol3D3Gru5+FDP129HCfw9qJZugSpFLNhMhv9YX5Gr3wFXElf9psdvey?=
 =?us-ascii?Q?IaTOER7j65sO0S2CThk9KoNh3zo/pO8mTaBfBL0ApzGovs+t1fbxUJkFc49i?=
 =?us-ascii?Q?CLFnbycvUfgQUXyJfxCfbyEynWC9Jrem/+xFDVjsQnQjsuvunBHuVjc60lkc?=
 =?us-ascii?Q?7ZLcyFdRy9NmRWoUCl7kpqS5hsZdFbwwcumg5jizJieeMJ8DiKap?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bba1ec0e-c779-4b60-d8fe-08defa385985
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 19:15:06.1844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ulcC/47ZJCSGGoUy+jMGJelqpQlgyIF1vCSYIDcvn0b5QDxHqztDKDz6zYMrrGkHE6VLkg2o6vgx/nxuLR2UnEiN3Bzl8ExjCG/xzkyOAhC2MwrgBbvmmQfEujVgBgOT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11865
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_121514_372945_F30CE39B 
X-CRM114-Status: GOOD (  18.21  )
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

On Sat, Aug 08, 2026 at 07:25:51PM +0800, Guangshuo Li wrote:
> hidma_probe() calls pm_runtime_use_autosuspend(), but neither the probe
> failure path nor hidma_remove() calls the matching
> pm_runtime_dont_use_autosuspend() before disabling runtime PM.
>
> If the autosuspend delay is set to a negative value while autosuspend
> is enabled, the runtime PM core increments usage_count to prevent
> runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> during teardown, this reference is not dropped and usage_count remains
> unbalanced.
>
> Add the missing pm_runtime_dont_use_autosuspend() calls to both the
> probe failure and remove paths before disabling runtime PM.
>
> This issue was found by manual code inspection.


I seen many similar patches to fix similar problem for difference DMA
engineer driver.

Please use devm_runtime_pm_enable() to fix it.

Frank
>
> Fixes: 67a2003e0607 ("dmaengine: add Qualcomm Technologies HIDMA channel driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/dma/qcom/hidma.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
> index c939635be21d..78fd765c81e4 100644
> --- a/drivers/dma/qcom/hidma.c
> +++ b/drivers/dma/qcom/hidma.c
> @@ -893,6 +893,7 @@ static int hidma_probe(struct platform_device *pdev)
>  		hidma_free(dmadev);
>  bailout:
>  	pm_runtime_put_sync(&pdev->dev);
> +	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  	return rc;
>  }
> @@ -930,6 +931,7 @@ static void hidma_remove(struct platform_device *pdev)
>
>  	dev_info(&pdev->dev, "HI-DMA engine removed\n");
>  	pm_runtime_put_sync_suspend(&pdev->dev);
> +	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  }
>
> --
> 2.43.0
>

