Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D721C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 21:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pku8GHPaxhSQ41SOECDhGw3a3aohHX3YGpZ/O7z1uVI=; b=ZcqXmLZ3J8sUH+FsPHwCFRSzeu
	7LYj2XooyxXgoZxo1UqqSgCSfxYexW8+YOnn+mQffWZhOixhziCTJ2y7LP4MF2lFkccaMwc+rMTBy
	e/yJsYchlGrq1x5EaBDLlaxQv+JcTYFTZvgap2tB4QeFekjAV0+c2g4fZfxImXGWAxOarMxOLLYLq
	RJE1AzXSbKlmrYYbd6jMT9gUCeXFos5G2ouWvyHuL3FraxxFhakOfb0kPu1PHLOjzsZLzzxpVbeP1
	myfvhYUue2LDkYVaUc1EAJIMwHYxV0lkvjms9sh5AzEUPgPfPFJcOY8YiAPRB28NBTXdZcgfa7wyy
	S+pJAPjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whZsl-00000000RtH-437y;
	Wed, 08 Jul 2026 21:32:39 +0000
Received: from mail-northeuropeazon11010050.outbound.protection.outlook.com ([52.101.84.50] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whZsj-00000000Rsa-435A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 21:32:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBaU9CMrXPtJiJWKu9xZYwQ46C1uHiE1RcDVsB7FhwmAT8yeCDAWlukMcyHhMNprapzDR4++dBx8rqw/ackqSY5ot0hrIcYi8AuWgH008G1bErYJrF6qmY7pLELMjAvHN8C46gqUJtHCmtvU4TOEqBO7wMbYdUZlRSFWQDxov95AqkXvkouVBo8ELEemxNXkB00GoplvL02ihZSn5yItkeJbmJQNFCUusQ138BBd9AfXeuowSptnDmilTfzH8FJ32W5iR1Ndju2nh0oWsEkEJUwavVDfL8KhIqcvl5Q2/Taq166okPy0Hfy8+3hQLIOMr4XVxS53mjL4FyPMyh0Arw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pku8GHPaxhSQ41SOECDhGw3a3aohHX3YGpZ/O7z1uVI=;
 b=XpQQnnnUS8eXQHx/QjcqGd7hn5vn4xkiD795i1YoshXS8H4XP9qz+tGAAto5NLqDG/qTvNc68kofzGvpdWsnAi44i3SHPKOlEaZzzDAEFxD5hWXfsVM7w7tgU/RY5HtxVkSU8B8fv6VGmODaiZzsSLwGDT+gnoNS4qW5tlmyUjjZe4ENu1I+Z7dGQuvlqrhCw5ErvRquHuHL+iaD8mK+beULebL/PoRkC3U9vz1Vs4jBSBPjJmEfUTDflUIGvKaKYR/bjn335AFL4NA497qhpb9QRcoAQurwNnzwp8Xp4XWKpE3ZnVl1jPud4qNLx9vJ9zL78V5zPxRHPY98RaWSAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pku8GHPaxhSQ41SOECDhGw3a3aohHX3YGpZ/O7z1uVI=;
 b=J1IPZdq0Nn/0rcn9uNHt3mgG5V5Cg0SUGbFAdI9J38GeTRcFeEjW+SzXVJO6UYKUDkb7N6vkx6iXRh7Bs/mCjDFFx0JBb++GVnHFDDTH2T4KyzsMPQmMWKKEPTAwdlyMKa684FyaZ1uZunq4/zZVF6C6/geGsBhVxxkk87eLKEUztR79bmyj8y47YHpsLAHeeg8KIMDf3781bnIyaUH6/qov+gGIMmvkvVBcBJ4A2qdFE3oAC9ujC+YGpjK+g/9ClGRLRbzsLE05SBDLutPqYUVUREaGeQEr3aK39PPx+Ici55ONp67cQ7WY2kdMjlYX5z+8lsFTuDb7huanXxc0Yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10341.eurprd04.prod.outlook.com (2603:10a6:800:217::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 21:32:32 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 21:32:32 +0000
Date: Wed, 8 Jul 2026 16:32:22 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: ludovic.desroches@microchip.com, vkoul@kernel.org, Frank.Li@kernel.org,
	tudor.ambarus@linaro.org, nicolas.ferre@microchip.com,
	linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, zhongling0719@126.com,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v4] dma: at_hdmac: Fix use-after-free by proper tasklet
 cleanup
Message-ID: <ak7B5gxc9LrMmxO4@SMW015318>
References: <20260708025959.40283-1-zenghongling@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260708025959.40283-1-zenghongling@kylinos.cn>
X-ClientProxiedBy: PH7P221CA0045.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10341:EE_
X-MS-Office365-Filtering-Correlation-Id: 36b003e5-ad7a-40f5-3384-08dedd386b14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|1800799024|366016|376014|19092799006|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: z6nDbytrhPQDHKO/xC6IT0g4XIUzP2LSWvlH0adQ/pI7UC3tAPLrM7RsSIF/f+sMn2Vbbp1U/dSa6YM3Bb7m5sxL4ifjAg6oSfB0PWcj84TfFBlUrvzEz1iiy18ZUtGxF9pJHm8CyD+ac+P0xT/OKRSCyi1HzmzIr2GoIlfwG6CVZtJx8nBMbq2kzVXrEA7lL5Q4wD4/EQ5RuIIfVdAGFfaDTND1fsJF57QbRWdAkZIZ3GZWfrdz0R8HUQ4gM+uATkU6Jcz+TB/O1NoGTq8q4/xhbkCr2+jdIfzF1NPYYdWCpATlkoIztEwetrsO7E/5BKjmFmVwF3CifJag6XqzI/i4VLq5H/K+uejo9FrpZGK8b3EtNfp5KU8QNVgWzq0iKLdORSRzNRCU/V9BNmit20h28K2cub/zm44Bsj/vUSR3tilJV3RcyOe9Y4k5Da9CwniMDjIr7MYMUQYWjlVkAv0la+/0EPmnbtaI/g8uPsAgeM5zT0pKFUrOzIEhdcU6/3TX5Z3fE5N1Pvw5OAuiSbCT+rXpasneJAEWTBaYzP4orsj++i/Pj1BqgevumhbHP+lbOtF+5K1PBDJ79SwTqsaOfDCzA3Kwq+zHgE0oj02Ta6obW2i0mflozx2nlRKOszsHON5i8suIvcSAbYysskJOMXKzwMWX0fGcxdZryo8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(366016)(376014)(19092799006)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SC9UWVB0RG8vbnZhVjBFOEwvd3Y2d1dsNmxOTDluSlo0dzJ4NXQxMWlkVS9N?=
 =?utf-8?B?aCtUMmpkTXJoajdtbkxXNzlMYy9WWUR1YVdsU01xZS83SXNDNkhEVmZVSFFY?=
 =?utf-8?B?SWpJMzZKWHk3K2hGQkROUlFJOStiWUdGeGJmaEJkSG9sWGozMXdlRURCYSs2?=
 =?utf-8?B?NWN2V3FiYk9kbmx5emE2ZWN0T1pIa0QxNmlPeUN0VXZ0NGhEaVMrZThMMktZ?=
 =?utf-8?B?RkNRVGlrTVoxOHpLZENkYjBTOG9GN2xDSmxuMzg2Y3NIamVlZ2FRNG1TN2hl?=
 =?utf-8?B?WlU1OGJScDBLU21uRUFmNmVKZFhVcFhZWkdBa0hUSWFORWswSTlJeEYvK3Iz?=
 =?utf-8?B?TG53cDR4VjFVelZ2ZEVJdzNSK1d1dGRnSEcybXZ5Mzg5RmJrdEF5OWVYakJU?=
 =?utf-8?B?S0hHS2ZQbmlCUVBWSVdNWnVteEowUkN3RnJGVnpsbkdJWkU1S001cGZFRmxX?=
 =?utf-8?B?a0Nla3JUNTlwVnlDSkt1T29lZmEvMU9vUnBSbzYrL2YxbFE0b0VRb2VqeTc1?=
 =?utf-8?B?MzJPaFBrc3ZEb1VxblZwSlUxYmNMQnFmMEZUTGxSVUloOTg2c3M5dnlPZkZk?=
 =?utf-8?B?d291Z2xYc2JPMjlzODJHTExWakEyeVZ2R0s1NnJqTkh1YXFMSDgwUEN0b0xk?=
 =?utf-8?B?YUwzblR3WHI1U21GSWd3M3Q4UDg0bHM2MlFyV1lnaHhGU1p5cjI2RzhiUkJk?=
 =?utf-8?B?bGFNWHVtdFdERTFCdGNSUHdRQVBMa21iMkRDWENDbWNPM0lMT1FOS3V6UW5w?=
 =?utf-8?B?L2VCSzVDUGRWRkNyMVBSRisxL28rNEtmcW02bVJ4Wit1OVJ0QzhmVmdHWER1?=
 =?utf-8?B?cVVzbHozOU92SEV4Q1ZJb3l0VVZRaTJNTFQ1bFJqQzdGaXV3MktRNlErdmtS?=
 =?utf-8?B?TUVMaHBZNHhkY2tGcXhneHBLaEYwYjVwcTNreml2N2NCbkIycXhaM3VMQWU0?=
 =?utf-8?B?L3d0N1lVeVZ3ZGVwbnBkaGRjSDhaaTlIajhmeFRORkpTZ3RZSHZyQW5Zc3JF?=
 =?utf-8?B?emlCR1EwNGM2VkRMUmtYdlhmNEhpWG5sa0RHWkZzcHNqOTQwSmFtQWVGMEVM?=
 =?utf-8?B?SStSek9jN2kzdkE2ZWhqZzdjMkV0aU5oNGJIaTdiUXY1OExxMXdZam5CbjA2?=
 =?utf-8?B?SkNYL2l0MEVWNXRIOTJLT3hlbUxjYXlaWTRGWURVQm1aTGxwa3dzVmJYYVls?=
 =?utf-8?B?ZEVNSk9PYmk4M0x6bUtZSlY1UmtFbVlpMUtuaGVmV3Z4TXBNRDZrSXRYWTBv?=
 =?utf-8?B?Ri9CSWMxS0JvbFIwdkxLVXdqOXJRc3VzK0NmcVFEa0VPdktKVm04SlAxRmNV?=
 =?utf-8?B?eVlzVGZYa3VqcDVWdjhWOVQ4ZWdnbTNmZ3lQU1hZRVZqRmxLUU9ObGIvV0Zh?=
 =?utf-8?B?YXo4WSs2Y2pkMFNHMjlGeDhuRmVPalFnMUhSMXZOUWNjQ09yTDJTTDVvbG5v?=
 =?utf-8?B?MC9NWTJpWmtGSmllYnlLVm1JUnlmY0Voak43MWtKUWxuTHpTMTcydHFFMFBJ?=
 =?utf-8?B?MHQ1aDI3Z1V4OWRkdTY5WUdrSHNrSGtBdDd6dzh5b2ZHMERhc05aUk4vTW83?=
 =?utf-8?B?NURucnlLb3JQZlRJY0pSTjZ0ZmdQUUM2RksvSHhhc05Pem1HRk1qaUhnUEhZ?=
 =?utf-8?B?T3NqczZxalk3YmNodGlRcWhtMHlFOFBGQXVDd3NQNFlxZFFDQm9sUlg0dFlp?=
 =?utf-8?B?ZEQ3dXhKcHZhb21LQ040VGpzS3FPY013eUtpTE9qVWE2SHVFTWRZNjd4ZE1x?=
 =?utf-8?B?S21uSG85SWtVQjFWaVhrcDJ4eDdXTGlQT01ickVrUzVmRnk3WmtzeDM1L3li?=
 =?utf-8?B?Sy9EbXpuanQxaWx3NXpXSm9VeXVWY1dDNEJUTFRaT3pKQnh4c0hYNi9OSW13?=
 =?utf-8?B?ckpmS2lzTi9KUHBNVGlQMndKRHhFYUo3elJXN3RVb291YWt6N0VNaFBSbjRi?=
 =?utf-8?B?cEtoOFM5SG1mbHZoRHBRVzVpZWlLTTYvZExpKzJna0pBdFJuTHBSZzd4dml5?=
 =?utf-8?B?UGZBK0dzRGRaeUhtR0xjOEJaTmlyWEpZeldnSzROMEl4R3hXMU1uWEFpZG80?=
 =?utf-8?B?YklxS3pUUjVkV0NNZVg0RGJsYzhJVW1id09aaDYxSHlKZnpsTU1GNlBkazVO?=
 =?utf-8?B?c3ViMVIvOHV2ZkN1VHRpcno2Zms0dzJZdEkyc01lRVlaODJUcmJIaWEyYzVS?=
 =?utf-8?B?ejlpZzR4NnYvdnpzVWVDTTd6TjRXQTRyWmFIRnRyWnpHaUFCUEpBaVYyUUdY?=
 =?utf-8?B?V20vOEc2Y2tFbldBeHBrdGdDOHRSU0JJam1OVEk2cU1zSDRHUkFCRXRjSzhk?=
 =?utf-8?B?MFg2TEozOVVlTEdndnhEKzJGK2lsZDlJZWhWQWYzalNzSnk0ZFZjV0NVSm9k?=
 =?utf-8?Q?Xjgv4IdnFxy9xjV0KuKUn8k/EDLmUdTSJlqlU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b003e5-ad7a-40f5-3384-08dedd386b14
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 21:32:32.1396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/IgggfYk6e4PNPbjrxo0jZXiu3js5SS/m3jEpsy3tDv8tDe+qHL8AKZaEV63fHAbjqke7Wsqqe2B7iRa/wJC6c+d/eojN9rEQjGoaWec/9PebsKK9fw5V0Rx7iGbfpV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10341
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_143238_007931_C7909502 
X-CRM114-Status: GOOD (  21.84  )
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

On Wed, Jul 08, 2026 at 10:59:59AM +0800, Hongling Zeng wrote:
> Current cleanup paths have a use-after-free vulnerability:
> - vchan_init() creates tasklets that access at_dma_chan memory
> - free_irq() only waits for IRQ handler, NOT tasklets
> - atdma is devm-managed and freed after probe/remove
> - Running tasklets accessing freed memory → Use-After-Free!
>
> The fix requires careful ordering:
> - free_irq() FIRST to synchronize with running IRQ handlers and prevent
>   them from scheduling new tasklets
> - Then kill tasklets to wait for already-scheduled ones to complete
> - Only then free other resources
>
> Fixes: ac803b56860f ("dmaengine: at_hdmac: Convert driver to use virt-dma")
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/all/20260604073945.54B311F00898@smtp.kernel.org/
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
>
> ---
> Change in v4:
>   - Fix error path fallthrough causing double-free_irq()
>   - Use channel iteration index (chan_id not initialized before registration)
>   - Remove unnecessary defensive checks
> ---
>  drivers/dma/at_hdmac.c | 31 ++++++++++++++++++++++---------
>  1 file changed, 22 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
> index e5b30a57c477..044a0fb38b7a 100644
> --- a/drivers/dma/at_hdmac.c
> +++ b/drivers/dma/at_hdmac.c
> @@ -1940,6 +1940,20 @@ static void at_dma_off(struct at_dma *atdma)
>  		cpu_relax();
>  }
>
> +static void at_dma_cleanup_channels(struct at_dma *atdma)
> +{
> +	struct dma_chan *chan, *_chan;
> +	int i = 0;
> +
> +	list_for_each_entry_safe(chan, _chan, &atdma->dma_device.channels,
> +			device_node) {
> +		/* Disable interrupts */
> +		atc_disable_chan_irq(atdma, i++);
> +		tasklet_kill(&to_at_dma_chan(chan)->vc.task);
> +		list_del(&chan->device_node);
> +	}
> +}
> +
>  static int __init at_dma_probe(struct platform_device *pdev)
>  {
>  	struct at_dma		*atdma;
> @@ -2105,12 +2119,17 @@ static int __init at_dma_probe(struct platform_device *pdev)
>  err_of_dma_controller_register:
>  	dma_async_device_unregister(&atdma->dma_device);
>  err_dma_async_device_register:
> +	free_irq(platform_get_irq(pdev, 0), atdma);
> +	at_dma_cleanup_channels(atdma);
>  	dma_pool_destroy(atdma->memset_pool);
> +	dma_pool_destroy(atdma->lli_pool);
> +	goto err_clk;

I forget the reason why need goto here. Can you call disable_irq() or
disable hardware irq and call synchronize_irq() at free_irq() place. then
goto can fallback to below clean up code

Frank

>  err_memset_pool_create:
>  	dma_pool_destroy(atdma->lli_pool);
>  err_desc_pool_create:
>  	free_irq(platform_get_irq(pdev, 0), atdma);
>  err_irq:
> +err_clk:
>  	clk_disable_unprepare(atdma->clk);
>  	return err;
>  }
> @@ -2118,23 +2137,17 @@ static int __init at_dma_probe(struct platform_device *pdev)
>  static void at_dma_remove(struct platform_device *pdev)
>  {
>  	struct at_dma		*atdma = platform_get_drvdata(pdev);
> -	struct dma_chan		*chan, *_chan;
>
>  	at_dma_off(atdma);
>  	if (pdev->dev.of_node)
>  		of_dma_controller_free(pdev->dev.of_node);
>  	dma_async_device_unregister(&atdma->dma_device);
>
> -	dma_pool_destroy(atdma->memset_pool);
> -	dma_pool_destroy(atdma->lli_pool);
>  	free_irq(platform_get_irq(pdev, 0), atdma);
>
> -	list_for_each_entry_safe(chan, _chan, &atdma->dma_device.channels,
> -			device_node) {
> -		/* Disable interrupts */
> -		atc_disable_chan_irq(atdma, chan->chan_id);
> -		list_del(&chan->device_node);
> -	}
> +	at_dma_cleanup_channels(atdma);
> +	dma_pool_destroy(atdma->memset_pool);
> +	dma_pool_destroy(atdma->lli_pool);
>
>  	clk_disable_unprepare(atdma->clk);
>  }
> --
> 2.25.1
>

