Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DF1CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 14:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKA2s4pKua9X1CWRsVvWK1z1fAlw0fK6x1iEfzyam4k=; b=FPXkVfEsV5Ei/ElilXD6waNP1L
	YYJ/zqyjRnPXAndIBG0MA3Am6Et8CK0JNDJiR7jlrNBj1eBOWAxVlhPAPl8yQEu5hBk9thID7vAQs
	SED5QoAL52qhE4X2EszouBQxi3qt89TIHb3LC+nNBKvI4HGBRC+BAh7y2S0+OFMWxeC0GlY0XFMoO
	DKCp6iEVw0jr2jiZfmibZ2UuryK0wctzTOtHUbM5wHt/4Z/qcCN8XbUWJ9k2MKECEDzXBV3GOOXqJ
	tnHNt8FjIRMnbu/SZjCLwRfBtUhuU6kQW7817y1jJa6M6shwsRwQQeK0Ir/tCz/3G3HgHjPEEvQlq
	8sAEADyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCIac-00000009dhj-1V29;
	Fri, 24 Oct 2025 14:16:22 +0000
Received: from mail-westeuropeazon11011067.outbound.protection.outlook.com ([52.101.70.67] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCIaa-00000009dgz-0uNF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 14:16:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CzLLuA82AE4DUrCY4TeOPlMmMyZj2Ngl36bp/+8cJnA2MK+ZLanJDg9Cco6NI95zVCM9v+OCl/iJpja9vxzvCNWEwLscZumCafV1xOTvdxTR771H5Bawh7bOLEh7BbQWj3WAokgLEvgXXammFnXihtV95kyaTltj6qFY5VNs8pOwXrIlKTkycOJcfomo5uZcYWXeJoDdM1ftDTUAe/MrVEy2PRwLY+V7+5zmbx3xkk2WDY3K8dlSKG7o1T4QSUeSAb46Oi9IJdav20DB/N+GFBBTdalFzJasyBHH+1eKjEVnSpocvRuivj2XWSZV41Gy3Zu5msOwrhDpl/Wp/Xit+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKA2s4pKua9X1CWRsVvWK1z1fAlw0fK6x1iEfzyam4k=;
 b=JURU2W+g13wfEkEeeSVkRiqQsLzCbKXZvvybHTz6Yj1jcZ5ylW3iOSY/42RcLKjhOJqi4qpW6A/kTx9ePcAgnfUhgTg4nfu/meBFtjPzfgOI+UxQtY+nzH4uaGwSJlIKOez2NADW8FwGFx8Ey/bhiLbVYaWs6NjGCessopk1oPFIzafhbivgRxjpICLbroZsw7GrushBwe4JxWWmTIfQbLcNUgTbZ8ddFwpmZZk28cRSqXvGJKNQPqr3dBWEz0ZJA4a4dkQUk0KLBJoJHn0ZESnsSPJMxf8RvurolORfitZKvv7RhSNwmB4l/nNO/g3hiApMPlw+pp73RFSHZ2uKDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKA2s4pKua9X1CWRsVvWK1z1fAlw0fK6x1iEfzyam4k=;
 b=JOg0zfTI1lHoKs7iB1xucvh25xCXRxCGWw8ePlQY1hkP0ZDqADy49GwqzgjzSXeeWgBGR+0r7p3ZofSZKt3tFz/kUsGwW8elbAIqUEYriuW+vwt8vdBcegQJkhT4NnLJCxj9pPDKqIE0B6iMprHx0vIUbmM/2T0Jmc52WfxGh+vs/XDbbYTien4NBYCN6AQIXZsI3Y3VrhgwYshhpJv6Sk36epYUckpLKjZXHVPOqIoe8yKIEfs190en9iw1WkknnGgzGEMUYK3+j9hNE0Y1xyw5Mf2EML6ic4UU/IoMjp/QrQOV0bxrdwcBlcDQE1PtLe/5AVq7OG2nR23iT6wR0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DU4PR04MB11816.eurprd04.prod.outlook.com (2603:10a6:10:626::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 14:16:17 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 14:16:16 +0000
Date: Fri, 24 Oct 2025 10:16:10 -0400
From: Frank Li <Frank.li@nxp.com>
To: carlos.song@nxp.com
Cc: broonie@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-spi@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: imx: keep dma request disabled before dma transfer
 setup
Message-ID: <aPuKKrb56CLLeYTb@lizhi-Precision-Tower-5810>
References: <20251024055320.408482-1-carlos.song@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024055320.408482-1-carlos.song@nxp.com>
X-ClientProxiedBy: PH7P223CA0005.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::7) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DU4PR04MB11816:EE_
X-MS-Office365-Filtering-Correlation-Id: c27a1dba-bc6d-4e1a-12bc-08de1307e54a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W7DXPf8rk2CKobzAi4fAdTYzkkQHLgYgf6j7vDstEcHn5fr2NCskNsIP18su?=
 =?us-ascii?Q?/AEQzQMkJOEWsYITLmxruqTxS1qNe45OGHXoBCjNSXgBXEaPna9X6PpgUGII?=
 =?us-ascii?Q?bnMyvIVr5kZugyhWngyfF2h6VnMQl3NP8mO/lSX/WhyNBuuVEYfB4PcRgc1o?=
 =?us-ascii?Q?/vrX5NJyu+IFiiq5E5repWP2Yj+QcDAshkRYVniz//tCs+jPdo46d2Xm1bjh?=
 =?us-ascii?Q?rQlgBMcH6/ZDu5ICUrNg1QMuBbyt/4fbkGRMCYFsY/m5TZjBpFKrXrVY4IhD?=
 =?us-ascii?Q?X4OzJ9Znng4fGIJC+aUu23MPbki2EDZRp19dYYGVci0u5cxwRahEOllIbNBq?=
 =?us-ascii?Q?tqGZ7uPCUo15kjFOG9tWe+dL2269HU0uhgQa5kO82fdNiz1Dpljor1srCGJj?=
 =?us-ascii?Q?PE75GRrj4rK5bxtKlNd2AAYfjdFDmeOAHulu8wEzyDvPS5iBH1fv8kkdo+/R?=
 =?us-ascii?Q?qmrFF9xKX1Yn6i5dnq5RAUGr9vLYcIoqEk0h+lCDj08tbuQOmxj+Y77sXpDh?=
 =?us-ascii?Q?8XQEWyTlEbZHMSde4lebUoYZ6BwuYxkAwExusSoQs6kPz1FLZkTv8ArZxSZT?=
 =?us-ascii?Q?TxaBtdtWuCbaGs1gVmymgae+WFoQ9UvAggltHorpNZaHEIea7S3PxxnfznfB?=
 =?us-ascii?Q?Obv302+W498gnjouomVE2HqU//v9m7bFeZqKPhQLWFs8k+PszrROwXaoLknz?=
 =?us-ascii?Q?w2kneJBdeMKnbf1VSl5EUL6kvJ1tdd0Ara0M1Io9TxGU+FVgJ97CXqPTO2ZK?=
 =?us-ascii?Q?RNZaReGAK0YRVc3MCs8s9idreEMKqhs0jZ+a3dxdHzRRclAhKlJMJZFlwfVy?=
 =?us-ascii?Q?upuO6bEX+jxgG7Aadie3UMbkGPTsovimYlFbHdlyqSEMESlYvOoai4kbWt66?=
 =?us-ascii?Q?+yEF9Fmcra0MQSnxPFncC29M/8NXibUvXXQgaE8R+xrndiRW32E6tUH8Pr0n?=
 =?us-ascii?Q?Ru78Xhc/oU1YyRPoI+cyjACXe5DkFCTR2jCQfYYrhmSqpoT3CRpOS13KlGuS?=
 =?us-ascii?Q?LfC5sWtLj0vGndxOtIkc1mvPCx2DbfQRtT62cF5ywgxo5kXKc0KIFiCxllsX?=
 =?us-ascii?Q?I6mO/TO1klVC7EtCmP4oHFX0mMM51U3uBitmJ4ODkwLgVKyA4WTq+fTQuhun?=
 =?us-ascii?Q?Lqpydm5m0VHJKMaNXu8Q6YaCQ9SISZmEvDT++YSGc28wNhP5KOxtuiikU8U/?=
 =?us-ascii?Q?S/79quv8ymtXYemshvXHirkjuQ4g+cJstNstnkcVuBkO7xdwcY8q/4iCQixh?=
 =?us-ascii?Q?EAhDNWGVyhLBhTH5+avlIfVuBlQv9feFP1NiGyetw5LFIhZSfdh4JeVL0KA2?=
 =?us-ascii?Q?YUAWoqnDxRVVxcrVfJHe4kG08LGnVsOtZ4Qe92o2ooap9oB7udMgFTP64tI0?=
 =?us-ascii?Q?8x+XYkrBp/7i2bh1uhYg1x8jbB3/h0+/MHUrTSvHQ+RE54scoGHacKkw0sLt?=
 =?us-ascii?Q?YK6yoZCuDl0RrnSzAMcjID2o27jCKJbfVlviiCTxzDKqy75dtnr3V+EKVtPq?=
 =?us-ascii?Q?qkI6ErvZIBGFisu+XXqkUA+WAS3kkfhOkXqj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8pGRvVdGkGFrBJiCZf8K3RGAUxg2N2QRWC9hUei5PcAWhO8fk3/BKpfQE46Q?=
 =?us-ascii?Q?dYLUHBdC8RpRv+tlqJBVRN6K54x/xPjMdBU6jQ4R0HelxQ4lmnTrXi4KcyYF?=
 =?us-ascii?Q?TVpdkaZb2lnYRIas2hS37iKHs4qrbQ3QTUugYobAcUspuflg5XE54Wgt8orB?=
 =?us-ascii?Q?KP7qtMsl5W91wQvUIOsUWfG6dhPCxMu3yR9D6LIZWOMWa9UuqSKICVPlLa5a?=
 =?us-ascii?Q?YJUTMzTi3n6vrzaAYs1i4YHwL2JLDnPwW7UYGfQc1iIelqdWjw8ykMZSnHCC?=
 =?us-ascii?Q?DoZv/lcuYJ7Ike+AheYjqWeFU1gy5pImehCx4rSkzAl5vW8gHqhwa0Fx1+hC?=
 =?us-ascii?Q?azoqYAmsALjOzxbrJ2vaQPgOAzfClXX9SOPVOJvTubwa0f8kYPXS+m4HFKNm?=
 =?us-ascii?Q?u+V4KZVeJ9Nkk8pQw1JQDdzf97DCsORUjbNd6mpYnulw2rYwht7eRBYD+Qvm?=
 =?us-ascii?Q?k39xQXopV8MZ5QFv3JH/NvMs0sdxcbVm5AhazhHDXN6KruqfuI3CIAU6XIPC?=
 =?us-ascii?Q?dEv7pZ4pWJWTuU9rRX7NcFTkggD3QJblQDqM/rnNCN5Bb4H5TkhEEOVpE/X5?=
 =?us-ascii?Q?B9mTAyhd1eGGdlit5GxKF0S58o66Odfgd5IVkYcxYWUEr4cCaGJqEdFRgJHj?=
 =?us-ascii?Q?ltEUfX+U2898xyP7+Vj85ZjPH4T2H3WueIjFYydVw+YkhNoDtKIoqvZWQvbU?=
 =?us-ascii?Q?xq9AxcVB9Jir/iipwWKM+TVt46qLIeZ55y+faCOVl50b1aPtCIfPf5RS1lUI?=
 =?us-ascii?Q?Trbnp8riwu+91GyB9GiBo1K3Dhdnswm6XC1mE13GfNCWi9j50zblHS9LesZu?=
 =?us-ascii?Q?UVutATk8GpqKCpWN2o0tagmnGZ1Dt7h6Ais8soYcKW46ScrlZk/x9HsRNISG?=
 =?us-ascii?Q?2M+tJMl3czL94A6N9T4BrVKBrSnjdHrS7tAzsqr7YjidyUhMWmDM//PRveyh?=
 =?us-ascii?Q?Wt89yv2bbfoKuXGtPOpyZLGFPy5gePVSBk/UEDQDKtgI5+ZgVFJB3UQGkp5F?=
 =?us-ascii?Q?R/at2hcE2xF29OfRp0UOY/3K8yC+UD9kflTAZqLow/MW1OjTcEXd7b7wXWdA?=
 =?us-ascii?Q?Y7aZ2AErRNRRaREmvQXwVzSGb4VDucxI5hW1pCgkeKTAgBWn4e80XLxfCro0?=
 =?us-ascii?Q?M9fLxrkl6SFxpLm5qmwVTmfc9XJoHN3PM+E/ep892OVYETq7L39yPU3WxK3R?=
 =?us-ascii?Q?3ZdB4ucwS9GvWP0hMvhl7ECFqcLDLjYfIBuUxBgwOESfEy1Z217a8BIjAv9k?=
 =?us-ascii?Q?Uyfd4uQPWs65HT5+Z+wYaToW3Dae8F6vuUoErtCSdfP1KJWeGhktlDWikD2q?=
 =?us-ascii?Q?vsauK1OsfcRW2+OxFKixgJMtDqboDbpu4lFM3g70kUYJYPbjvVm1ifYzqS7L?=
 =?us-ascii?Q?Hby6CZ6K1VBtKTLkrXPleD4dHRTsgzof+GX0ZqMRsqy1E0UJnPrRrmnhw985?=
 =?us-ascii?Q?WKtA5kDJ05H6ANCPQPbeghxCu+MRLsQD4w3leX+yFcZmK4h7gshT0xoXrh4M?=
 =?us-ascii?Q?MqzLciCemh35tRpw6SkODV9Z6qNotjozM8Nmw3vdvEeYdWi0phxxT7iNJkmg?=
 =?us-ascii?Q?QizPXakv+burMXIMnyew6nT5l1lBpNZ5ne9pRqEj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c27a1dba-bc6d-4e1a-12bc-08de1307e54a
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 14:16:16.8579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R5WVRhSOWszpXGMf4DKKA09MbeFk+appQQ6V+Bb6+/958l4mO0ThF1/VQZKkwRkhXoqWNTxnsukcqMMLkwmiQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11816
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_071620_422896_B9596B63 
X-CRM114-Status: GOOD (  20.55  )
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

On Fri, Oct 24, 2025 at 01:53:20PM +0800, carlos.song@nxp.com wrote:
> From: Robin Gong <yibin.gong@nxp.com>
>
> Since sdma hardware configure postpone to transfer phase, have to disable
> dma request before dma transfer setup because there is a hardware
> limitation on sdma event enable(ENBLn) as below:

Due to a hardware limitation on SDMA event enable (ENBLn), the DMA request
must remain disabled until the DMA transfer setup is complete.

Ref spec section [...]
>
> "It is thus essential for the Arm platform to program them before any DMA
>  request is triggered to the SDMA, otherwise an unpredictable combination
>  of channels may be started."

SDMA hardware configuration is postponed to the transfer phase, so enabling
the DMA request too early may cause unpredictable channel activation. Then
keep dma request disabled before dma transfer setup.

Frank
>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Robin Gong <yibin.gong@nxp.com>
> ---
>  drivers/spi/spi-imx.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
> index cd40db61d8d1..765ea507dd8d 100644
> --- a/drivers/spi/spi-imx.c
> +++ b/drivers/spi/spi-imx.c
> @@ -529,9 +529,15 @@ static void mx51_ecspi_trigger(struct spi_imx_data *spi_imx)
>  {
>  	u32 reg;
>
> -	reg = readl(spi_imx->base + MX51_ECSPI_CTRL);
> -	reg |= MX51_ECSPI_CTRL_XCH;
> -	writel(reg, spi_imx->base + MX51_ECSPI_CTRL);
> +	if (spi_imx->usedma) {
> +		reg = readl(spi_imx->base + MX51_ECSPI_DMA);
> +		reg |= MX51_ECSPI_DMA_TEDEN | MX51_ECSPI_DMA_RXDEN;
> +		writel(reg, spi_imx->base + MX51_ECSPI_DMA);
> +	} else {
> +		reg = readl(spi_imx->base + MX51_ECSPI_CTRL);
> +		reg |= MX51_ECSPI_CTRL_XCH;
> +		writel(reg, spi_imx->base + MX51_ECSPI_CTRL);
> +	}
>  }
>
>  static void mx51_ecspi_disable(struct spi_imx_data *spi_imx)
> @@ -772,7 +778,6 @@ static void mx51_setup_wml(struct spi_imx_data *spi_imx)
>  	writel(MX51_ECSPI_DMA_RX_WML(spi_imx->wml - 1) |
>  		MX51_ECSPI_DMA_TX_WML(tx_wml) |
>  		MX51_ECSPI_DMA_RXT_WML(spi_imx->wml) |
> -		MX51_ECSPI_DMA_TEDEN | MX51_ECSPI_DMA_RXDEN |
>  		MX51_ECSPI_DMA_RXTDEN, spi_imx->base + MX51_ECSPI_DMA);
>  }
>
> @@ -1539,6 +1544,8 @@ static int spi_imx_dma_transfer(struct spi_imx_data *spi_imx,
>  	reinit_completion(&spi_imx->dma_tx_completion);
>  	dma_async_issue_pending(controller->dma_tx);
>
> +	spi_imx->devtype_data->trigger(spi_imx);
> +
>  	transfer_timeout = spi_imx_calculate_timeout(spi_imx, transfer->len);
>
>  	/* Wait SDMA to finish the data transfer.*/
> --
> 2.34.1
>

