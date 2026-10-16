Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28E5CCA490
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 15:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVYCiekkOyhwUd0nYJup1UAFg8CDLC/MTHexAFCWBug=; b=LxN8dglhoAudXe1q0HDTzbDNlU
	OlsCKSul4Xe2QfITaSj9/u00euKlq7V6Awaoa1EnhNejBO1eE69cMWm97aizAte5Kukte5kqA2dbV
	GzL594CKyHkIBkeh54TQep47bBWa9dgOg5C9Bf3BmZPUkvf536sdgUVyUCxu0YLS0dEZJEf/ZRxYA
	FtRNHXF8PL4DHAjFZzHztg1jWXiX/MJ566jR4/T4qcJvPbJ/edhdLL84lXpgkDDru4Vs4K3+qThrM
	kixCpuc7Co4Kxdhd0+ca5dz2mGno1+sdtS5p7oe39BDBYAuKaRkZytwAi4B/G7hWMjAc4/ctjSwGk
	i9v4yWHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHk5y-00000003JcH-1DJR;
	Fri, 16 Oct 2026 15:43:46 +0000
Received: from mail-northeuropeazon11010063.outbound.protection.outlook.com ([52.101.84.63] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHk5v-00000003Jbe-2Qf1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 15:43:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MRuiX+q5vqNsLAveINfPqovc8TRkuUhrSiC0dKe+Zqcj9343VnbPbPmrz5q7GQq6lbgWiCUqQqT9RJekyPx53mncu9tM++C2NT9mgOO/7eEvTupJ08k08Km86iGhZ1wFgW3ouhO5Fw1PMdxAOfogyvCGzyMoLYI+CiuESwoV4J8MhP9Xe1vt68WezczJTfMN9wyw6h5rfJZfQeE7Jr+BajoJMakz66uOs+ynswRHjyxQqUBL7Ymo98fvHX+kUJZPT+par4SDXFAjCou+IMzXhr1XkT5SREeW93PXCO3OCTxe8zgTgbtob6Ombpq8ddA84QKspMjJzr27IKxvp36Szw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVYCiekkOyhwUd0nYJup1UAFg8CDLC/MTHexAFCWBug=;
 b=qUOOdWAwbdlzl31Bqy5gfe9EdNs02gPBGP9+tmmRis0jrxYV5QTAit0EKkVfU4meesINgltPuEbNmmUU/xugboqb7Uds9KVKR6kOogUkESSifI4dEiBl36z10I1WdkF1dhYSrGwFwgaCj9YxwWBJmrsy1slVgW89u2CeLAsZQ8tV3HX12rkaHhzvCbP3H4ktLDMFjxZ6un7kcH0GBMso0TWv4JQiBanomwoFqCQliQ07hjTGaPyV+xml8pGcsYz6m/b9c8ipwYP8x+cClLX7j2S1pxPI9Zy2bHMzCeYP/XGw9uJ8AqnK7RNEzMH+lNaLdCgHMF9rctf9PKfzwEjvEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVYCiekkOyhwUd0nYJup1UAFg8CDLC/MTHexAFCWBug=;
 b=GkEYc4NcWi1YFiUXvh4kwZ1cf9PuYGIonuXh8ygVRanxi6CTPai9Z9YKOXpBcp7KhK2FTNVRlftRlUkjQqSACKsNQBLDOyPI17gY7REMjJq1SRq/3kxHysNGIFAJfvgjQmOoyN4sHVWfwKXV5XMem64fcNW79xYdAEduTlTLD3EWeATc3D7W9hmKD8qmCWZNsfovG1npZ72mPulMLn5ly7NSRIJ2jB+CXQEKeYUtSd23+Jo6MKVLLIuA2T2FfhuSTIPjqyJ2oRICpm0E0M9MwQAhCkzS3Y4Tt6gufS0e5HoRmw8Zjf06mda9+g8BZ6EfaIzvrsYzJ1/ooqW7K68CKg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS5PR04MB9895.eurprd04.prod.outlook.com (2603:10a6:20b:651::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 15:43:38 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 15:43:38 +0000
Date: Fri, 16 Oct 2026 11:43:31 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, wens@kernel.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	zhongling0719@126.com, stable@vger.kernel.org
Subject: Re: [PATCH] dmaengine: sun6i: Fix physical channel index in
 interrupt handler
Message-ID: <atJGI-JbPGJEPqRD@lizhi-Precision-Tower-5810>
References: <20260706064123.66035-1-zenghongling@kylinos.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706064123.66035-1-zenghongling@kylinos.cn>
X-ClientProxiedBy: DS7PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:5:3af::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS5PR04MB9895:EE_
X-MS-Office365-Filtering-Correlation-Id: dc5661af-22a4-4f15-cdf7-08df2b9c3f3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|23010399003|366016|1800799024|19092799006|376014|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: VYjCKUZxn+UBaf3Z0jbXC4dV0piAbx2ihvs6YWO0ylD4971A4jF+rLqT68bI+EeH8B0sKVwyRMpYtTEJI9BnP8JZXN/epgbR99v2FSe9bLBdNr8J14Q4UksB+5AvofnRGnSu+jKUpyWOG9OEQw1np9/F/Pq6IVtwjd5sQ8CReae+//wrN+LsUwyfFz9ZEmgGlpnJewPW4rZ0e+f+xhjWCSs2DAPSJO14cmHtWDspK0bGf0zvMZb/Ezme8zkbLAX7VH6lfHvUIixysxEFcL9IIa2o2eoL+07v00LZN5GYnWk0uow9zq/ZT+wizcCeWPL83AoW/pgvs7Beq9unmhqN6ns/pldnfjE30mzDfVdFfHiatTqmORSEdCDfwIwXe70ZmfogzNLbNOQMBuPrLtmd64aX7m/L2yAY4tOHkHW0MOL+F+1VZwV+jfue59iDrLsfYjnOcjKcy0t8DWEdYKX/zvsisHe6ifZKE6mdm0w6ZxlwS4Op+v8hFQXBFFO0aw5rNF7F8KVnaIncBKcZGaLv3IorQ742mbVgdkx1+uy3LCW6aiVUmMiO5iSA0op/nfjP3/KX+Qvkzphk5Ecy70Sol68ULF/xnH4FTwDp/vvf6d/yOTmV+xv9Tf2972VvlOzO6IlnjynY+ExfQFpIzaiAzk0M82BvJ9reRXu2Wl0g6hI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(366016)(1800799024)(19092799006)(376014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eDsptKBWpDyvqOU7+lDCPcs8/VcIZkGNnPHOmMV7bub/kr433O+0g9rjOi1G?=
 =?us-ascii?Q?6meC3BsEXK1iVzvBQ7tLYmnV8Ja1snINrSXgilpAuthtiLtKrc6TD0wyJmNo?=
 =?us-ascii?Q?dfiNo6sKF7GcByroynLsPbJnBKeyuFsI9rOhvv1qJ8mzalAG3ihZcut0+DLr?=
 =?us-ascii?Q?BJLBbShPdtJ7a/qn825ev7D9s3l5IktY2Yrn0JGSpE47dgPjRkuPYjCzPaHR?=
 =?us-ascii?Q?yoHtnrEt1YhBie7Urhfr0s5QQqHUUisvZnvsb4RasF3OmBk03HgrwQEko3ro?=
 =?us-ascii?Q?NgEMaj5mSxa6FFNndN+TQH5Gj6evGcR3MAWfamjvcKUpxuAJw0qSWa2I5Kv2?=
 =?us-ascii?Q?H0iflWqqXGNXXOofSETHp4HltOYe4F1iNPvscSnvVSMyyD4EX2BEDHpnbWpe?=
 =?us-ascii?Q?OYbtIzynmElZJR3QmpjwptnrgU11QIm6Ayul/9//fYXYkUxZlny24T1K7Z//?=
 =?us-ascii?Q?4qvXL2bwjgfxT82eKMMRdnwarYH97plyAZX/DNncMbVB6+E9cuLjWEv/zkEY?=
 =?us-ascii?Q?yurJ/HvSyOAT/nuuLAww/x6maHm0IAjBjlugBD8hPymKqxZj8SujM+8OYHxh?=
 =?us-ascii?Q?livlssFIvO49XBGxXiI7CXb4VKfGfwsM0Vc2LfmDznY6jt1HC4eiel+gzFi5?=
 =?us-ascii?Q?YwdGJKFzf+cMXq+kMbnY/1RSZJHuRfcnEW12XG2XDv00D5wTRa3RQPsEGwiv?=
 =?us-ascii?Q?IDzKkuVmkRdcZmuRl9p/V90SyjYj8Q/5JnCbIB4ElmnQrmh/dpZ1+tWSqxu+?=
 =?us-ascii?Q?Mlw4iECUvRZ57u6zUpdqX8AHjavLPLoODLT8oZp4cVLLZK7o3sYOCtEUmo9d?=
 =?us-ascii?Q?8OQ0r+ND31zAONfEST/NKa2OHC67y6HGtivMNcuTIcYR4rN0mKtswNL8Eqof?=
 =?us-ascii?Q?3sC1rdX517PEo6ka6hgkeYJi40GT4iL5oF7JlAhQpfQMR260vxIVYRVZgICI?=
 =?us-ascii?Q?tze73JwD+AZCR0/rdU9eo1tEhP6RS+Tx7m3cz8vD/d+gPNeMIBiV90AS7soH?=
 =?us-ascii?Q?ZQt7CQkobxiqkZztj1bYh7yuilpyRRi1fhnwplvJ7z6lkQygwIq0ScOCoU3d?=
 =?us-ascii?Q?A7q0bhfTc1zRoAHDcQacAofy3ojJTSKGy9P6I/xIlGSRI6kXcI/c6ckXyhho?=
 =?us-ascii?Q?XX4+ugUziWj0V/BI4Bt6yMmmrAmIqWKr6jEV9YmLfr+/WaAbTvtrlr6rivp9?=
 =?us-ascii?Q?tJs5iNJcDoUieeEpyuVOV3nTPRj8R529Jm8FrQQH4BJsqJ3k8ng/afQIp1EJ?=
 =?us-ascii?Q?9HZCBEa5Ydt8COTposBJ7ZYJqIW2axueagZg7oxVkt8uMMrgsMyXRX17tzrx?=
 =?us-ascii?Q?3lyoX6jpbzNc/tkuT0EMB+nU4+04c09d7sQgtcgfqZe3sTtSmQsiV4jA1Ko0?=
 =?us-ascii?Q?RYdBXdwfT1O9Rt6cOgis7SHUvSsRyf3zcmKcwMVzPodXSAofkSBMG/2zyOS1?=
 =?us-ascii?Q?Li2hggVoLtKX0WWVSMJhyQ4LGaLByf2MAfMj7+snVf7mgCCknMqAD9BJ0VQa?=
 =?us-ascii?Q?1yXJara88bdvlMOjDG4UdaxZ29zcacCF0xZ2XX557S3e3xaQS5ER8gBpkTX9?=
 =?us-ascii?Q?c/R1/hnp89D81sBb/GMsIA2HDj9yB3fjdejz4VBdgA/D7fujFUFzsIZMVNE3?=
 =?us-ascii?Q?9qDTqIJ6sBFfPTQ16vHeT+wgpIHrAvfguQqA4/8eARpW37pONr83Dg44w1kX?=
 =?us-ascii?Q?32DIp7v/hY8Q2IlYI+Jl/flvEZT+zKB6sC7MoLuHKTTpYafu/oOEC1VNbO+X?=
 =?us-ascii?Q?jO1qUdDSdeMR9wFX5mXmychhsLpUJfXbToOhuhrp0wkAvnDGoqJy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc5661af-22a4-4f15-cdf7-08df2b9c3f3b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 15:43:38.7233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XaWvJ600OlAzB7Tb15vBHQtcE77mPnQxbEMtSnExgnUfpQt6Q4Dg7nAZeP7lsyhNH472RFMzpGmLA2bAWGUeONmF0SpZRpjiFiNx1aaNamSOHJDILMBvLeQdHXNXd4pd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9895
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_084343_645600_01B606B3 
X-CRM114-Status: GOOD (  18.31  )
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

On Mon, Jul 06, 2026 at 02:41:23PM +0800, Hongling Zeng wrote:
> The interrupt handler iterates over register banks in the outer loop
> (i = 0, 1, ...), where each bank covers DMA_IRQ_CHAN_NR (8) channels.
> However, the physical channel lookup uses only the inner loop index j,
> ignoring the bank offset i.
>
> This means for SoCs with more than 8 DMA channels, interrupts from
> physical channels 8 and above are incorrectly routed to physical
> channels 0-7. This can falsely complete descriptors for unrelated
> channels, potentially causing silent memory corruption.
>
> Fix by using the absolute channel index (i * DMA_IRQ_CHAN_NR + j).
>
> Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/sun6i-dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index a6487971ad09..fcc88a74d821 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -559,7 +559,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
>  		writel(status, sdev->base + DMA_IRQ_STAT(i));
>
>  		for (j = 0; (j < DMA_IRQ_CHAN_NR) && status; j++) {
> -			pchan = sdev->pchans + j;
> +			pchan = sdev->pchans + i * DMA_IRQ_CHAN_NR + j;
>  			vchan = pchan->vchan;
>  			if (vchan && (status & vchan->irq_type)) {
>  				if (vchan->cyclic) {
> --
> 2.25.1
>

