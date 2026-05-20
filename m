Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FC9CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 18:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pooei0qzeU1Pl31VVxdmiBfOIqU0jFLjTBIcf0vO1Jc=; b=FXvldlKKOCplU7KM7sB1t8vuF2
	w+z5D/61yBK0QIjpfcxR1oh4k4J8XHRdo1X5xn2C+IomFHV9/rXi+/u7a8FPQojIFy+N03m27eQnC
	EJoIY/oFi9CihqLrYq8YmNYM+9lVUMxMFrP9V57VP4ewcZG3Q1GuWoVDxnqwPZGgC95Z8CXlrFENn
	TelBnvRfMxrRREjvgbTilmrV3bVdR51cOxz/mpDFLbKxU+cZ/BcGquWGeVc+2+nx4oN2CVM4JLu4c
	P5y7GbaqBjH7PniMFCPouOyASLqd/ZRZW0gbvg8Y3G0DbVHOqhml/GTI9P2zjEwaGIBxrd2SE4M3K
	NwokWHzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPlfa-00000005RiL-2ffS;
	Wed, 20 May 2026 18:29:26 +0000
Received: from mail-swedencentralazon11013038.outbound.protection.outlook.com ([52.101.83.38] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPlfY-00000005Rhm-1N4h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 18:29:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y2Fp/fH2LEC/BVitjM8EL31GqUpiWX2gQXaI2SQnCcJSXufydMmRn4BteDT1v4bUzzy4mfhjMjCFPsyX7GTmMsCnJ1AM2LWIZhc8tmjzQG4cvdMjRiwPFhWfpnq5rZnr35yDiWgQAQ543XI06mFcm86f+ZMAjTd1jVGOvvQWw/udmRDL/hGzcm+6/vPrs6H6AIBZWm+GLazRuhM2MhNzhQIXn99Z8lrXM29bYYo2ADjeDqQX94k9/Zwkj1LAjYbh5aB5aj0vIFIjPsDEffumGd+wJuVZpp/YtVbpLZJGuW6HEMYcD11znWrI8rcwI3ikE3gF97LvSbWEldtAGm81JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pooei0qzeU1Pl31VVxdmiBfOIqU0jFLjTBIcf0vO1Jc=;
 b=CKJ5nToUcPVBoWIgyhmld9nC1wdiVow7XklZ7odwSPCYUBbI4390+/nU1zcynCoSHoDq1TopylzxyFMnWHSK9QlGDV4YwJH0BSPpYRk9oErggI4Tq2DW0ABrnRdfCxqXXOFxFoCZNoss3CokzuWFEEF1txCaO54KgeSMUyYZPKx5bIJzPh9bHKQa8G66/Oe0fNo7CPZ7ddIU7ma2JgFNkNLkH/BxqssOgr6IHMQmCNEDFum0sysfsq7a3bgtPQapRw+n6UStL/dcxz9wmsOh9CbS1yk6SuzM7MFVXjnboeyAxgL/JMirjdAfZ6jpbSdSLVNeXVQ/gtIHMu0FzyYE4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pooei0qzeU1Pl31VVxdmiBfOIqU0jFLjTBIcf0vO1Jc=;
 b=Jj+ZEUFUiW6ISHw7YH81S21+lQKzpMkZ1gQjovg74y+Q/v0imXASnEy+CltR8O7nAmzsLT/chBmHjRjDJrvkoHkaNrcs1Qp+kmHYY82mYm0jq5gqcfaUh+d7AFVtA6cwQGdLF/P8CUe3E38YVvVs892uqn9k+d1y5c2YUljyMrBa3iRwRys+Pwg389+8BTnVnO3pT+2EGW7wZgEOgGP4kIpE7SnaopndRv1hxe5N9Qu8QIaLRos3XaaFNptOmUWVj94zsJxHkYQh3KtBW6++tAWs6MXkKmwvqRK9Uf3lUqXIuDtBlWeQokxZVRmFxrJ5KnCmVKyvzBBuVu36UoEu4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB11659.eurprd04.prod.outlook.com (2603:10a6:10:607::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Wed, 20 May
 2026 18:29:18 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 18:29:17 +0000
Date: Wed, 20 May 2026 14:29:09 -0400
From: Frank Li <Frank.li@nxp.com>
To: "Carlos Song (OSS)" <carlos.song@oss.nxp.com>
Cc: aisheng.dong@nxp.com, andi.shyti@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, carlos.song@nxp.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] i2c: imx-lpi2c: fix resource leaks switching to
 devm_dma_request_chan()
Message-ID: <ag39dZ9ZQ-ewu3cL@lizhi-Precision-Tower-5810>
References: <20260520093323.2882070-1-carlos.song@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520093323.2882070-1-carlos.song@oss.nxp.com>
X-ClientProxiedBy: SA0PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:806:130::22) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB11659:EE_
X-MS-Office365-Filtering-Correlation-Id: b5c51be7-db18-4d4d-b8f1-08deb69db3c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|56012099003|22082099003|18002099003|38350700014|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: tMDSufcA0NAmxV7lSbZSo2GeN5saF/KyLDftA2U3IbskB3fvPB3tNeye/Whb9yRXTdSQ6qGB3hoz1nj3gSpFrvkVrH1wXPX3S89jHVETJd+DM5cHFDWEbNy7jqCcNXjFAfe65IVRwC0+WcJKsYxJeryr6fy5xv/m+BUs4POoHYUfc6sT+VCL72wSlhoovP+/bFJ17qYBT6TzjEfw+JwsuBWzvx2SAUAYZqFsrWIWGofzdmYBQ78X0i/OisJpz4r/xhznaW5jLk7l1PpDCEBmXGQSdJ13ajYw2y23a7LkXuQFhWkP6GBqRMgc5DuUlfUBuPQ1uxmXHU0fVEp6mCNfVNOqbBbo8nVVilfnDpWR802c79CaB/M+/80EbH8AKdcMlPyDevkPDncojaoZtnwo/+s/skr2q/kOynX7EQC2TR27L0Jx//B1GHTiDjmfQ9cq04fIZgZt3SWQdD5CKg6GhB/pzWxfq+viX6z8xif/9py2tWgohg9/GnaWfgsvXbFP607h+c8ALlcm6/d3r5gtEJ4NYedMClx6IYFDdfR+LPv8uD2pdsXIRNiQGNrpiJuG60baJPXWAl03D0Hpshc+0vdV90mNTvduZJ2dnWIMRm2yyEG5YXSer6m0q5SVdRSK1zdClsagR/yM2LmyQyp9Vk54lSpjJpn01bTyhbJoWapUiae/s2hQkcpAzxUMDGCDZulRYt2RuRjV1lfThoY68wosWsRNL6fyyXsCd2rQPTCWRpVdCuO1kloIhG35FRM8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(56012099003)(22082099003)(18002099003)(38350700014)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VQ825bHEMUCUAva5p0W2wA4ezpO7NhZnzrHBtv66ZDMcTupE17hT8P16lixg?=
 =?us-ascii?Q?J2FPPV4zoG8/5ihdnAEm/1tfiTrXX+7qA7xhAsY8vKFleSl/2r/QfMuNg+7v?=
 =?us-ascii?Q?a4vW6FhHg1iQ2pItFFCuxCHExnvdO1sm77Af+i0r8c7/bJa3oRFr0AXsQe4Z?=
 =?us-ascii?Q?LM4ag0VY0FB5Y3TDf5ob0GNqBuWIRtBjpnjApn1RriYFl13fiQiWz2a/hOBx?=
 =?us-ascii?Q?m/4Q5WXQAL3UdEbdxdozgzaHD+oQJc8yrC6HcWENTYUpncqD3bkI0ad4Rwpw?=
 =?us-ascii?Q?2lx1H0EHxmjHJeRFqHkKROFtZO88OQUbDw3qsLWZYDxBypLgw3k7trfW2bnK?=
 =?us-ascii?Q?zpm21/OR0cYWJ2KpPkw46u3t7gLh/pQih6NFksHAR3VH7hRLohGKhbHix/dI?=
 =?us-ascii?Q?U70r/r9StXqtE8g+OmmElowweBWHzqMRIdowSvJV9r6BHBVJ4TUxz7Hfsj5K?=
 =?us-ascii?Q?UyJN/yeZsMdXNQcT4MkwK021zdZzzBbacrwK/5OuizUdsLBnlrIocxVNhyF4?=
 =?us-ascii?Q?gKo1lEpyvL/2apExlFz9PjsjjX00ZVuGMbX1Y25nz/SV2UG3ZKXAWuXET+Xr?=
 =?us-ascii?Q?i+sE4x1H71P5LsXsdyQSTy3riczyyWacnhyMpK8UmOWfHwcWQDsHr3kExf6K?=
 =?us-ascii?Q?WEyjwp0P846/6ZnofzlKhFLx+5oLtQi1E2JQnN41x68GEPPYfY17a7jukgo7?=
 =?us-ascii?Q?HggyWAJM1NgbejgsAm/7AR35zSNrwcUNK/LkxJGXDthYxEC0Xz4Z2JDXfU7t?=
 =?us-ascii?Q?2OGeeSVqdW0CxeMrH6t/53/uQCe2z/P8upFVBKPOyNVYijZCzIm6yKEDv1l8?=
 =?us-ascii?Q?aWNYOSJmIzJ8TUNUjdWddH1OV5RzPTMtYO35afOdVuizRCBGjq0/18YTmztV?=
 =?us-ascii?Q?ZUPaDMDmMtgjX3QT/LCk9Nsm7yhE/XhLdkeUyqOtGxOfUCaaEWYlqjaICBuW?=
 =?us-ascii?Q?wuWntXv4ZpRZ2aSusRR7d0imeIj+5QqviO156wzPR+FfkipJaigii6giRs+u?=
 =?us-ascii?Q?RQq7xBF8AQ6Ra88awEIM480E0epDkzCqEekqXPL67v2g4Uu1XWxa5vd/DY+N?=
 =?us-ascii?Q?B+LRoXBHfKSkVvz53v1L9BdF8P00XwjkkoTvCppFbANJEuZUHhwiFgMUOMVR?=
 =?us-ascii?Q?fUvWNHmuwme8WMrmh2rgnzbAT9d0aKRyaQwwyJeT205rgF1jzeK6+XRPHabc?=
 =?us-ascii?Q?G5C9I9CDVFmwMBwPZbk7ISTnc1QYFXSygNmIaP1Xh7wdRq2bpssA5p3vAHle?=
 =?us-ascii?Q?Im5cQ/NTxq1Uf3EhbPVqEwa9Hs/6rr7bBLHE3wfEoX0vT3IlAzVxtKx6UYBQ?=
 =?us-ascii?Q?OS6DYq6FMDTwSTu37qR42gOpKP1aHo7zH2ggq4Tob5+tL+bfoNfdzFw17JQb?=
 =?us-ascii?Q?pjUIuejqktbMEyDIsl+OC5mpJWoRXg+c063/+J5hEJnSElM1Qmf29r4EFRz6?=
 =?us-ascii?Q?2JchqLCN7XQDODxquAxZlhIRK/F2zLPwGiaBniq9V8xgwDkhXH9imdBb6gEO?=
 =?us-ascii?Q?OUG7J+gROTNuZ4NLIzUTbyzJRuf1Vp5e07FT8zoVfxbExMlFZtYWeUZ03eYa?=
 =?us-ascii?Q?yRo9cVb2g/j2hMUxzf3YXorQYvlAiaStyjDvPqve0pg3zx4c9iJjneY4nGIm?=
 =?us-ascii?Q?QczLUkj3oLcE+HSAKfAzOXjO3de4nu+PkP+5ligaqCdNx7sxM+PNzrk857V0?=
 =?us-ascii?Q?lTAuE74dH58YPUxg7H2NEgrRNtKK6F9f7crbjz6x7zrntRSq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c51be7-db18-4d4d-b8f1-08deb69db3c7
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 18:29:17.7490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QjyUld8sKU4YF2zKKqxN3vM/foD8DMgnzQR9fplDiz53lmYP8KbZaCPB9HFqLPQZ+aVIWg9TjIa79tjvdcm2Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11659
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_112924_375612_B98B13B7 
X-CRM114-Status: GOOD (  31.02  )
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

On Wed, May 20, 2026 at 05:33:23PM +0800, Carlos Song (OSS) wrote:
> From: Carlos Song <carlos.song@nxp.com>
>
> The LPI2C driver requests DMA channels using dma_request_chan(), but
> never releases them in lpi2c_imx_remove(), resulting in DMA channel
> leaks every time the driver is unloaded.
>
> Additionally, when lpi2c_dma_init() successfully requests the TX DMA
> channel but fails to request the RX DMA channel, the probe falls back
> to PIO mode and completes successfully. Since probe succeeds, the devres
> framework will not trigger any cleanup, leaving the TX DMA channel and
> the memory allocated for the dma structure held for the lifetime of the
> device even though DMA is never used.
>
> Switch to devm_dma_request_chan() to let the device core manage DMA
> channel lifetime automatically. Wrap all allocations within a devres
> group so that devres_release_group() can release all partially acquired
> resources when DMA init fails and probe continues in PIO mode.
>
> Fixes: a09c8b3f9047 ("i2c: imx-lpi2c: add eDMA mode support for LPI2C")
> Cc: stable@vger.kernel.org
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Change for v2:
>   - Wrap all allocations in lpi2c_dma_init() within a devres group so
>     that devres_release_group() releases all partially acquired resources
>     (dma structure memory, TX DMA channel) when DMA init fails and probe
>     continues in PIO mode. Without this, a successful TX channel request
>     followed by a failed RX channel request would leave the TX channel
>     and dma structure held for the lifetime of the device.
> ---
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 53 ++++++++++++++++++------------
>  1 file changed, 32 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
> index 6e298424de5e..dedcc24e63ec 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -1383,55 +1383,66 @@ static int lpi2c_imx_init_recovery_info(struct lpi2c_imx_struct *lpi2c_imx,
>  	return 0;
>  }
>
> -static void dma_exit(struct device *dev, struct lpi2c_imx_dma *dma)
> -{
> -	if (dma->chan_rx)
> -		dma_release_channel(dma->chan_rx);
> -
> -	if (dma->chan_tx)
> -		dma_release_channel(dma->chan_tx);
> -
> -	devm_kfree(dev, dma);
> -}
> -
>  static int lpi2c_dma_init(struct device *dev, dma_addr_t phy_addr)
>  {
>  	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
>  	struct lpi2c_imx_dma *dma;
> +	void *group;
>  	int ret;
>
> -	dma = devm_kzalloc(dev, sizeof(*dma), GFP_KERNEL);
> -	if (!dma)
> +	/*
> +	 * Open a devres group so that all resources allocated within
> +	 * this function can be released together if DMA init fails but
> +	 * probe continues in PIO mode.
> +	 */
> +	group = devres_open_group(dev, NULL, GFP_KERNEL);
> +	if (!group)
>  		return -ENOMEM;
>
> +	dma = devm_kzalloc(dev, sizeof(*dma), GFP_KERNEL);
> +	if (!dma) {
> +		ret = -ENOMEM;
> +		goto release_group;
> +	}
> +
>  	dma->phy_addr = phy_addr;
>
>  	/* Prepare for TX DMA: */
> -	dma->chan_tx = dma_request_chan(dev, "tx");
> +	dma->chan_tx = devm_dma_request_chan(dev, "tx");
>  	if (IS_ERR(dma->chan_tx)) {
>  		ret = PTR_ERR(dma->chan_tx);
>  		if (ret != -ENODEV && ret != -EPROBE_DEFER)
>  			dev_err(dev, "can't request DMA tx channel (%d)\n", ret);
> -		dma->chan_tx = NULL;
> -		goto dma_exit;
> +		goto release_group;
>  	}
>
>  	/* Prepare for RX DMA: */
> -	dma->chan_rx = dma_request_chan(dev, "rx");
> +	dma->chan_rx = devm_dma_request_chan(dev, "rx");
>  	if (IS_ERR(dma->chan_rx)) {
>  		ret = PTR_ERR(dma->chan_rx);
>  		if (ret != -ENODEV && ret != -EPROBE_DEFER)
>  			dev_err(dev, "can't request DMA rx channel (%d)\n", ret);
> -		dma->chan_rx = NULL;
> -		goto dma_exit;
> +		goto release_group;
>  	}
>
> +	/*
> +	 * DMA init succeeded. Remove the group marker but keep all resources
> +	 * bound to the device, they will be freed at device removal.
> +	 */
> +	devres_remove_group(dev, group);
> +
>  	lpi2c_imx->can_use_dma = true;
>  	lpi2c_imx->dma = dma;
>  	return 0;
>
> -dma_exit:
> -	dma_exit(dev, dma);
> +release_group:
> +	/*
> +	 * DMA init failed. Release ALL resources allocated inside this
> +	 * group (dma memory, TX channel if already acquired, etc.) so
> +	 * that a successful PIO-mode probe does not hold unused resources
> +	 * for the entire device lifetime.
> +	 */
> +	devres_release_group(dev, group);
>  	return ret;
>  }
>
> --
> 2.43.0
>

