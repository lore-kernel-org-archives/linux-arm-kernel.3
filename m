Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57B0C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 22:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l8umoIOiHlq6O9MjF4d/G4aj42DX/gVwivjE+q65GRk=; b=tLaJ8KdeN/BQibH3MajNZK23F/
	w5BT2u25LadtAtGxELs9uYmSRoXOrqpe/SSftvwKPJpk+HeIW4rUuPzzLiHiPXaKndrB1UBKAVf0j
	XvJOFxvucCGogKIY+yghpqeHZftlLMCPkURns0FwM2llJdIQBndwUFB6Yi1Otp71jK55jNxoOzb6T
	8s5HeRHjgEaIv49mQU/AeESq8mAQFo5PyeRo1cBHtw9MD+acLm1KG0Wb6lLEZ5x3/hR46cVA1a9Ej
	pGKVTTUn0Rfvlv5R4eoElEXEGxVRTaCLupy8sfNdIK2NpjqqcHy1+sOKhwLvqSbsGOZ5BrfrayAK5
	Ob9FKrSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1X1k-0000000DUS1-1ubi;
	Tue, 01 Sep 2026 22:32:24 +0000
Received: from mail-northeuropeazon11012031.outbound.protection.outlook.com ([52.101.66.31] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1X1h-0000000DURg-0lZ9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 22:32:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LwsQ/68VAXiwGYsKja2V2nOerWvZn2njr/wiuAcFjnvToFXQKRuS6Hy2/pWYJ7raJhNNK0AoZQlJsxjJhOzXtNip46gGogUm1hZ14t+5YCSnZTE2knmwj1RlvsZbqduOg0AWrWWrnibWiPQGY/Izt/9e8wNo6rVfOOsTUlpYC23Symn1/tkSfx1XoQg48AMAYZANrb3RgrUv3kSO8rM6QMDsfzrZNhBAsiqda+ueIVQrldNVNq2IVShuNKZm0tZPQIJVDfQarlTsSciEGG2fkfvvGKVmfXQVapxcQP1TH3Pm945mZYY/HfCjS5aLHSsijQ19KpEgHmXY5iabLWS70g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8umoIOiHlq6O9MjF4d/G4aj42DX/gVwivjE+q65GRk=;
 b=Z/k6DV3/Eppbw08HzP6Uj9dXXDaLdrpUJidEgsbqW637h9lCxCRa38SRibmSMEHShR+tJ+Fl2BT6SOmRrmicicpLtoS0EwSHGstFInnQjs5DOfPWsavbRM0fuYMpIFWipuXir5NI/EfjuRyBFPbWNLLtUGsT95MvRdKiqk+xAiO4pMnx9x5URxrOzS4sG+NWWRF/KlsUk5MegJIWqVQUEzskOXtB3eJK8ka09yx2DnRYlsP6MIB0d0hJWArCZbeuTzsVY0jkjliv2uohozMDSuoSoH4QVG1Z+ngszNx71nPpPunuTq6WacdOezWov0tJhmWrJUKp0LZ19DwjpUtJIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8umoIOiHlq6O9MjF4d/G4aj42DX/gVwivjE+q65GRk=;
 b=jCLf/GyFHBu9Cr5smwSf1EtTH9+sle+IJzxQGyFn0VGsx8mKYW6vYKy1dd6TL9tqbTEBMsN15u0vPx9XjijafHAw6GbhtArwH00EGWDvFvPYxMluueLzK+wurxduXs+q6wdLNoXhcFaLE0Esh1EdNbPuwX33r+23HpP5VhVdYpMlCB6hSckpH/QJp11YFoJSYyy6MlFMe9+4P6FWzger1D5vedPs53RSqOHkl+0Y+/xNbjojtefIG4ShkOmcLXToKYKN8vjeqVKY014P8CZg4syFcdrJwWCXvft4nuHb/n7R2OdxdYULCPh2bAKFhI64UBea9+eBNYh/GThMLn/Ygg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB10080.eurprd04.prod.outlook.com (2603:10a6:150:1a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 22:32:16 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 22:32:16 +0000
Date: Tue, 1 Sep 2026 18:32:09 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 04/34] dmaengine: at_xdmac: move irq bottom half to
 dmaengine BH
Message-ID: <apdSaS3-dY6VNVdU@lizhi-Precision-Tower-5810>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <452a0aad787e4d64a057f13f47302782e9b3752e.1786384168.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <452a0aad787e4d64a057f13f47302782e9b3752e.1786384168.git.allen.lkml@gmail.com>
X-ClientProxiedBy: CYZPR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:930:89::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB10080:EE_
X-MS-Office365-Filtering-Correlation-Id: 08e7ac3f-9439-4149-d06b-08df0878e051
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|19092799006|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: jtUIV0z+6NWaYfLmV7R+7ExDovnd9FruWbnJgR5RQ2rYqHmEApdhPp5bdoAyl4DJOuAAyo6w5Z0NB88W4wzpaPBnC03vmq87aEk3/KLjPIH5WaK9/tzhop3/R2zbOKXvFFgExNeFNs8zrs1ifbOYMfwolhpLBE1H7fQAxFYTmdxq3L5veW/WkhlSCIG4IwNm9+1lsGjvmqnK2O7Ut4GjsdrrunB7qVeqeD0mXMH/VLgYwajWKzW+Hfi/eHDDQ54YnEPcILEJHcKFjQVYGVEA+lUp1ydWhcSA63cjAzbw9w1EmtGkGlMdyNL9ezXa3haBxtbp6QyDy9zdKOPGFDg9oRa6BMBD6ctOGvL2pBTGQpGHkeSqrnEUpkjSrYm5KhT00BqeJ24EZ33ZakOoeqV6RHFjQFEhh6xQJIfsvwyOPmcf8EQKe66qEyXj4gAVO1BJF71CMkFvCERdqd+lCKEeDZg/pM9jtXTROFC1Fl6jOCJKVN7xQ0HRqRvI5v6BxAzqlkgliJWVxzd540N48WVuV1Um5J/R18qzXfMxweadaKY/Xj4XgGPZKbzATjEwcVph2finMvseRjDNenRovJSjjgeYhiGmCZEwQmDhOJEzWYWHap+rcOPxlaOTqO2TXQABFgea+iPxwakHpIIEwTni++TzMwj5PbKIXspf65d/NAM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(19092799006)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9lPRFKNK87+IzuaMACKETry/FNTA/0PnRM49R4KIS1JCpCEZU/8Vcn9VTxqa?=
 =?us-ascii?Q?e3wisAaoxnrmACWhAM2i6YgYFpempX3v7EjlOeWl4JiTVbfR6lpTAhjxgfiU?=
 =?us-ascii?Q?i+dXkiLDgs+mBZ5++1TsEY6YRZwN9g5G6njy1lUqdrWxYqwcIRfB+63AqUjg?=
 =?us-ascii?Q?myR0I0aJli0wANl6Oflx8uzTpBc6dJwBZalYaIg1xLeL56m+YRvD+igjBGNp?=
 =?us-ascii?Q?21t0m5LLcXTVEov1uWLAkdRqSHjHn8O2ULix/p0ERTBtNSAQhoRAIInwF72Q?=
 =?us-ascii?Q?LMNKwg5n+FSAXzQlk3Jo/zpnJR+4IIxjBzCQ5FM59F1Oz6DF5S9YfY3lQS5S?=
 =?us-ascii?Q?u0bTJgC9XTg1hWGXY08l0j533EI7DlIdt+pAoIZql6dKoNuysqGk1dbU4D+L?=
 =?us-ascii?Q?nuzAbRT6Gff65untBab/soXGHHATyHRwEmPeOA06WIDr1T1L4QWgV3jqsyU5?=
 =?us-ascii?Q?s+L6wEsUytv9eRkLiTYS1dEls9oOC14vA3dxe52OQuzTo8BfqjP6MXOp5kPc?=
 =?us-ascii?Q?7HyBQu3juO/FWJgndS56L9AwBVDAyYWcYdlVZd5E2csj+CYruSu5foQk8it1?=
 =?us-ascii?Q?uUq+V5C49LuyLPuTqNYo6746FRGgknHPAt6VEDFPD2gkYI5Oz6REzDAxQ38X?=
 =?us-ascii?Q?KGxDiNUytBeGGgqWTJHGKjT71E7VF2y23hsFUhC0XA3SRgFzrvXXQt2bbHGX?=
 =?us-ascii?Q?YtJHoNPZiSe3Pd0Qsy7/g8A3Hd7DnSH1gEnip1anf6oqS5psFWFv2vgAQqyn?=
 =?us-ascii?Q?rr/MKFlpJmPMwrlxIFTmDry08iJmezSGQGzIX2tIHrTxsDQb2jm2H7CXPt8F?=
 =?us-ascii?Q?6EaylGBfF89rOrgu5+A9eahax+bztqGUwlVFnOb0E6hw3DNHjje/LrFemNNO?=
 =?us-ascii?Q?oEJDfSCuuqZwFm7hF+ROQieV+AuQC0s1SBX9ULVUSXA8gal91leqzXDBZFHh?=
 =?us-ascii?Q?pk2HcXw6yJq/r8v2UESYUZvfRkHbnQ6T3s88ureZ0F/6hCG1cAbS+to+hUT2?=
 =?us-ascii?Q?SeV5jKKfQi+sLVZk/kDPS4pzg0O4RCKdp5IziXImEYEK4aPRXxPjwSgsVh7E?=
 =?us-ascii?Q?Smiun+xxeZ5Gl09gTiEUGWmArgaF+90fJBN7QgXaqV/+UrX5E70hdyRLACMU?=
 =?us-ascii?Q?3ooOXTqrsg4I020gEW4zA8cj4wwlyXDkCsT88lQ+EiNOQWU6zWcAozjLVf0y?=
 =?us-ascii?Q?0l2MLH1bgKRkc0/YrQ4SKL3FF1TkZWpGOcqrzfSIByRz9Ekhm1YetYmnAroR?=
 =?us-ascii?Q?XdGTi6KQodyQym96BryY7hZjCKySChiAsGfdBF/Ocrez0T3u/E/uir06ZlrM?=
 =?us-ascii?Q?6h/HHMBI2DKbcbUeBYRH2AKbF6Axi7FH0GEHGopLKR7tMGfNA0Vg+Vq5kXYE?=
 =?us-ascii?Q?+dKcZlZ8b+58i07Z9daQb3dw1Qs6VVd/i5KZLyxpyIdsdcpIE37cTOhmyxw6?=
 =?us-ascii?Q?T4IAQYAiPzBdn/t27gsNMBrNMFBOLatzso65XERw0KiO2wb3DdBNJApQlP35?=
 =?us-ascii?Q?TpTyelzYmnp34fqlGH75NcDazOSApdNzy9ZILKpbKhL93l6gXN3hAn52KItM?=
 =?us-ascii?Q?w4B2KzHsUr8RI7N9+z/U0LJAUCCUmGiVw9fHU3gpPMoRx+44KDwZJzTA5vrA?=
 =?us-ascii?Q?T7xcGZlIXWEW/LJRRKqYDKSp7NbGg+g1q8t2MaNk+gTDqfjFFolj3H7ptMbN?=
 =?us-ascii?Q?Es9qFM/gwDgAF3D1J62OYdFEjkjjgz5OPqW+FqysRAxOhxXEg0las6NNkiwT?=
 =?us-ascii?Q?X0s1fzIjTL62pdyzzjSIRJMy5ROHoDLfn4JhdWuRcdzc9bGjuDDF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e7ac3f-9439-4149-d06b-08df0878e051
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 22:32:16.5212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qx1Z5q7GliGtvcQR9+rhVX0ePJzcl17h50vTFxGkBbldP8JthQx50Te9WJyqlQ513zWK8nSIl/0lN7b7v0vCmcST2b0a1ZEyTq7OWr53cUpkx9gL2+WzDqhbytcsDNlg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_153221_230310_B77DE9F0 
X-CRM114-Status: GOOD (  21.34  )
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

On Mon, Aug 10, 2026 at 11:09:05AM -0700, Allen Pais wrote:
> Replace the per-channel tasklet with the shared dmaengine BH helper.
> The handler continues to run in softirq context while dmaengine owns
> the common scheduling and teardown mechanism.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/at_xdmac.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
> index 901971e8bae6..5a970f9f3831 100644
> --- a/drivers/dma/at_xdmac.c
> +++ b/drivers/dma/at_xdmac.c
> @@ -228,7 +228,6 @@ struct at_xdmac_chan {
>  	u32				save_cndc;
>  	u32				irq_status;
>  	unsigned long			status;
> -	struct tasklet_struct		tasklet;
>  	struct dma_slave_config		sconfig;
>
>  	spinlock_t			lock;
> @@ -1759,9 +1758,9 @@ static void at_xdmac_handle_error(struct at_xdmac_chan *atchan)
>  	/* Then continue with usual descriptor management */
>  }
>
> -static void at_xdmac_tasklet(struct tasklet_struct *t)
> +static void at_xdmac_tasklet(struct dma_chan *chan)
>  {
> -	struct at_xdmac_chan	*atchan = from_tasklet(atchan, t, tasklet);
> +	struct at_xdmac_chan	*atchan = to_at_xdmac_chan(chan);
>  	struct at_xdmac		*atxdmac = to_at_xdmac(atchan->chan.device);
>  	struct at_xdmac_desc	*desc;
>  	struct dma_async_tx_descriptor *txd;
> @@ -1865,7 +1864,7 @@ static irqreturn_t at_xdmac_interrupt(int irq, void *dev_id)
>  			if (atchan->irq_status & (AT_XDMAC_CIS_RBEIS | AT_XDMAC_CIS_WBEIS))
>  				at_xdmac_write(atxdmac, AT_XDMAC_GD, atchan->mask);
>
> -			tasklet_schedule(&atchan->tasklet);
> +			dmaengine_schedule_bh(&atchan->chan);
>  			ret = IRQ_HANDLED;
>  		}
>
> @@ -2317,7 +2316,7 @@ static int at_xdmac_probe(struct platform_device *pdev)
>  		return PTR_ERR(atxdmac->clk);
>  	}
>
> -	/* Do not use dev res to prevent races with tasklet */
> +	/* Do not use devm resources to prevent races with the BH worker */
>  	ret = request_irq(atxdmac->irq, at_xdmac_interrupt, 0, "at_xdmac", atxdmac);
>  	if (ret) {
>  		dev_err(&pdev->dev, "can't request irq\n");
> @@ -2397,7 +2396,7 @@ static int at_xdmac_probe(struct platform_device *pdev)
>  		spin_lock_init(&atchan->lock);
>  		INIT_LIST_HEAD(&atchan->xfers_list);
>  		INIT_LIST_HEAD(&atchan->free_descs_list);
> -		tasklet_setup(&atchan->tasklet, at_xdmac_tasklet);
> +		dmaengine_init_bh(&atchan->chan, at_xdmac_tasklet);
>
>  		/* Clear pending interrupts. */
>  		while (at_xdmac_chan_read(atchan, AT_XDMAC_CIS))
> @@ -2458,7 +2457,7 @@ static void at_xdmac_remove(struct platform_device *pdev)
>  	for (i = 0; i < atxdmac->dma.chancnt; i++) {
>  		struct at_xdmac_chan *atchan = &atxdmac->chan[i];
>
> -		tasklet_kill(&atchan->tasklet);
> +		dmaengine_kill_bh(&atchan->chan);
>  		at_xdmac_free_chan_resources(&atchan->chan);
>  	}
>  }
> --
> 2.43.0
>

