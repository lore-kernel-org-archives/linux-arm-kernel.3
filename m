Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E897C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 15:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xr1bYx1/NgwtSi0fbT8uhgva4ZKgzWeaQhenquWgbfg=; b=Z3cBAjfXGaOIGuyQDN49M+ewOn
	5ar/XkykT+/9wzuanRYy3ADNHhRUfSqrgSVWx4gH1JbMpl6ZERcno5AP5enteA2D7cGFzxLAO+ebq
	rd/AHkTCDUQlXOHjWJVBlFENDtL21Ph4zsjUEwhr4e5ZeWHAL7KXDRo6X3IKzkDG24Y6/gExKtSqv
	IOIeKWZ+Z+jJTXY9Fi+jHiaN9BndHMnetMMRtgs0DUmI6e1ZWIWOu+9QZW0cqTL2mefd1YqKA2IDk
	kYhX5gsDUJyKfXUF9QFXdgP5M1yIsySKh1mxZHEUJgBPnOp09DEXqCD9ynmhJBIQqShuQuYxb8wNR
	aaYsKGhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws0Sn-000000069KO-3Uk2;
	Thu, 06 Aug 2026 15:56:57 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws0Sk-000000069Je-3IiC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 15:56:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oD81uyZMRwFlAwmeFreY13mY2aegFO5yoSl3uvMxhvrzyrQUkX60EPOL9VghwNqIHGoLhnEI+EQuXrkDoNfjix3uAzkzZqpMgaBZf6mZV8fr+un1w5gbnZI0TdIfpJto2BXgq99NCPAOXEVi62Ey8gB2P3yvcn02+kEb3CJO8McRUjUUNx730ZtgXTYKobH+YP0HCxJB1bPN9J7Sm6hThICDBbKbQGYcjve5hVupCldFy3ltAEp6AHNN5Ssca2jqGH5eIfFRax0l6m9510vw71nwhhtINAzRDQ64gWwnvxIAygim5nW1UNLU4yffydryvBQvA6p1ESCyL/YirCIGAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xr1bYx1/NgwtSi0fbT8uhgva4ZKgzWeaQhenquWgbfg=;
 b=zF58dqeqfGcpV9WzAGL7RIFgOvjjrcDJ6Z+P9zd20JS7li3HHvnllR/pB4QvOzQeeyPfec9ki+L/FDRVwxykZBNzE4HiWZbgc+tp/d/Bo6QS1ILGrxF71CX+EP/LgP2R1BaReGxAb9A0DbOO4t8MAyUWuFFSWnuO0MNsHIarSxTZvm72iZBAcIQX/T+sz470YPKS+esAxfDdE7OTmAT9OsvZyt9a7YktpRoi+E+BJPqT4vI0hNjSOwu0ln98WPieFMP0DTl9tWODBZsE0H76qVw84oAFqS2QkkWoCdTAL9KIWvVIpTn5enqTfPeOCgq7HqGgLLhM9v2Puf/lSOIxxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xr1bYx1/NgwtSi0fbT8uhgva4ZKgzWeaQhenquWgbfg=;
 b=W6FF/myf7coH+nDppeDRzaM3pq48NRbRJx74qgpJ0l066n+fCJWjS+OlI6m7LRb0OqHZvlgqMg4k6cbYa4dKbH/y7Wjsw/jBsA/Pm2wzaSA36eF1mX/r3HmK/RNnQB1fOXQxNIa5JapYnBkSj6Vc5kkQ1a3VXO4k3zgZTqL2sMUzNS24XN8k5og3KoYOV6NZ7tjAy2G0F/ekOHeARoRDxnjo9ASfDXDGrWEgl06QdC7HzFNLo/50nAQiMT4gP2XgP5SV84dC3ZYZSP3JimCDgajsXgmasq81oK4z7v1LfauaBWcUW7XqXhXikX6qm1tY7jFhjA4qkq+FJFh3vF1NVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB11079.eurprd04.prod.outlook.com (2603:10a6:10:589::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 15:56:50 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 15:56:50 +0000
Date: Thu, 6 Aug 2026 10:56:40 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Golla Nagendra <nagendra.golla@amd.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, michal.simek@amd.com,
	robh@kernel.org, krzk+dt@kernel.org, radhey.shyam.pandey@amd.com,
	kees@kernel.org, sakari.ailus@linux.intel.com, yukuai3@huawei.com,
	git@amd.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] dmaengine: zynqmp_dma: Reject zero-length memcpy
 transfers
Message-ID: <anSuuPHDh2lcAhBL@SMW015318>
References: <20260806123014.2120447-1-nagendra.golla@amd.com>
 <20260806123014.2120447-6-nagendra.golla@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806123014.2120447-6-nagendra.golla@amd.com>
X-ClientProxiedBy: PH0PR07CA0055.namprd07.prod.outlook.com
 (2603:10b6:510:e::30) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB11079:EE_
X-MS-Office365-Filtering-Correlation-Id: d1c1ae2c-70d7-4af7-7bbc-08def3d35362
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|19092799006|23010399003|366016|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: w9MlxkYVo4xkyuvIUN6lNua6yLFbY0Wbvcr9L6ygQLLeF0vGcnk17EEaP19nKQUCutYaNAxTb5gyAR3mbCvKHT4urJOLuEdvwgXds0lN3WeXpr0q9J63ysuuKT0wbI92oB/XbFsEFpac5RY/HAeK/dxpJiH1mwRqFmiOAVeSg9Hembk3IoD9YjEY9eSoF3VqB3cwUOiUGaL3rC0uWuoCJJf/5plAGJPx5ModZm8xsDGP5Fe1fXb3741HmbJZJd0TqoBX37DhvZj5vIJX8eVoTbdlYhSlZ8qwMe/aRtHbQJBP1rKjtDyM2mLWlMQes0j1e1o7oDVyib4xwEWDDdNHs1le5a+3s7ly5x/ga9dIxmQnBkk8Wzwm2V1FxlBNGBNYsHtb2hvW4gEBshidhjoZHI00VWR6FXo2axG3SIp+n+KPtEbVHgz7MY3ZLaSjz250Mh1G6REDeIUMqDZKuWO/OpCgtVzDc1qKvffCsgBGlzx9F6o2X9dPgBKQOGvuFG9IryI+bw4lO/VpHgHSFVDqqgno1+8WI1kOdr9WlqXkjRTTTlKfgkOJ68RUQXJbzMHpwp80u1PNP/bVTX5S58A2Agd1buPzn4cLID2rcSqbvsJeYnJEU4THJN16pc9IWoeKatpZc1hWJ8ClJd4bUhmcAacOk6cYeyPAg5KVBi2+1eA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(23010399003)(366016)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I8yYVFyhAxmlzeeAVZlE9rVdp0BrHgWQ88Cz87aZPp1jPEBvfQBV40qGKkpD?=
 =?us-ascii?Q?5Fa3+XtFo2uw8Y/M9Esa16dnXnZDDSFKFogpe9Kssg8Uk86gpV0cEbH3Xuzd?=
 =?us-ascii?Q?coFm4VkZl0A+tlKkhjVRf1ZkMkHV+cg0X6ZhmONouzGomIrAa/1+wJIQ0UWx?=
 =?us-ascii?Q?gF7fN4sAllBbtWsxJZSvodUu20CyzpV0WvLvgTPllxIFMhl9+/c/ourLfDKp?=
 =?us-ascii?Q?IvtZ7Bh+2jePxpJ6B7YAAW0g8bOk/XhtrrauifiOu7kF7IGiQFZTNAu4XdCf?=
 =?us-ascii?Q?OvQukR9VgUXPagexiRz0uKK8ibSO9rxIN1V5a1lvT1yhHXq5iGccZwcoc77y?=
 =?us-ascii?Q?n/tD7bxiWDkdxU4LbrUKoWrjfdpe+gwzNDsGSiNQBQviR735xTsFEVsoayQz?=
 =?us-ascii?Q?gnpresZLnaoswXAYLv5opS0U5bYcxr4GhL3L/QFuzRcFxusVWZkBM8bDxw5K?=
 =?us-ascii?Q?7g4v2hbu2STB6ASoknQwG7yEgUqTo1j8wtJxGVDUK9flMGv5jb3MHBOj5//W?=
 =?us-ascii?Q?mmHcBzPUEYSFGcvguePGwIQq4SJlWcIzVs1uko7y0ZXapVYr5hmcPofTiQci?=
 =?us-ascii?Q?Tb/6ysPjQ0amMOF2N6FRax71KAA0YzPqT1K8/u4DB846lnSSgQ9TzMuTH/kh?=
 =?us-ascii?Q?pKviDpEnoAlLxs+U8sb2JtWA7p3barj+Mv+8ijXwFgJv/y8nQVnUGweNkUhw?=
 =?us-ascii?Q?LMAoUGQ+uIDF5yMMyJT0UBtZy+j3TqXP4JcjOQc9klld4lhWwPUdUHfSdRhS?=
 =?us-ascii?Q?W14zpN9U+yx7S+STkszUdhzc53Y5BWzAsRCUuDQg10uiqI8AWMZgyrTRtTI+?=
 =?us-ascii?Q?RxKr+fn26Kx/B0Zd+HLFcgesKTH5ZMVI0DB2TrqyBZX70np7eLSKfm4rZgWo?=
 =?us-ascii?Q?vwhCO5/Iz6eVRmwqbY479W1Sk6fAXbCDCLYihDTD5bpbeqzbStHXjYPkp+Gw?=
 =?us-ascii?Q?ShpQlFtFHp/LU6vW72FC3I3IQP70MIipMsixwd3NTqXDkUzGNe3eDc4CYNnY?=
 =?us-ascii?Q?mNYZqOO/N2MR7fnHbzvVVpDKgqgHZWWGoEkIo8Wxpg1SF1a7ybpNRMd2SOUa?=
 =?us-ascii?Q?agSEP/siY+xmvq2gYOW3uCbkA4syL/YYyUF/EuvrX52JXpfVugjpNWX9la/R?=
 =?us-ascii?Q?mLuQ1AyYm9ECK7ZKsGY9yaESxanxdS1xWq8HHu66pR147o992DDCnr8pFLAj?=
 =?us-ascii?Q?bddAvNXZjQ2Zoqa2/hOkNe8KD1SiujPmbbNNz7fQ/dTXqL+DMz8PGEINzgO9?=
 =?us-ascii?Q?DBSkKh+JowD3QFGpvjzzsEaQ2Gx1FoaI+3gWGsd2PYlt7pvn3fsj/gS10gP8?=
 =?us-ascii?Q?MzMu0MN1PsBomBoRIxm2DW6kslF9ysKO/XhSeMBePi83YCtqsOTyKVwImvUq?=
 =?us-ascii?Q?mwmZ/IBix2tgFjJF1maay0RufPORMvFawL6qt2DjhVee9bvMLSKRU/Q4lU3R?=
 =?us-ascii?Q?P3pOz5JKyiuiCNQkEmrRdxM4+0YFQ76Q/kvlaQQvE6aOuxkANAunU9UDcxzO?=
 =?us-ascii?Q?HRF+r26efLpNyNKf8eV30lSz0jxL4dkxoGAERRIo0Kh1lXXLQLGtuMfkPI9t?=
 =?us-ascii?Q?nY84DsxoVmTqlf31dbWbo1xBDdrTWdfuXdg0EIW8mkPQonXBEDzr5iNdxjPv?=
 =?us-ascii?Q?T2djyQD6tSXgYn+e/ssq3ad+f+WA1sx3hV72y724JJLjWuu77pLWEWITyUXP?=
 =?us-ascii?Q?/Doy+YjfICX8SqH7Y76Fz6j4Pqj001UXapTqnJnz37F5we7/Rx7lIUc5mDbK?=
 =?us-ascii?Q?u62/cSdgfQyGpCaVSUukvA2ECH7SgvkZ8zaW1dcJEJEgzBsKcW8Z?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1c1ae2c-70d7-4af7-7bbc-08def3d35362
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 15:56:49.9295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZoGhh4e4CZ/kAYVyYSw8yawzYslJZIAZp2DgLRUE7KHc2NpJjiXz/u/SXi/i3m3jvCQIjFj6vJYRvddbN9JYkZEB24xkwWZdcR5GjzsAg8tMUNBEP2V/E5wuQroL0J0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_085654_828194_CBD455D5 
X-CRM114-Status: GOOD (  16.33  )
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

On Thu, Aug 06, 2026 at 06:00:13PM +0530, Golla Nagendra wrote:
> Zero-length prep_memcpy() needlessly consumed a descriptor slot. Reject
> zero-length memcpy at prep time and document the behaviour.
>
> Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
> ---

Is it caller problem, which pass down zero len? or are there special usage,
such as memory barrier.

Frank

>  drivers/dma/xilinx/zynqmp_dma.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
> index 2d56ea08ce45..e70874d65123 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c
> @@ -836,7 +836,8 @@ static void zynqmp_dma_synchronize(struct dma_chan *dchan)
>   * @len: Transfer length
>   * @flags: transfer ack flags
>   *
> - * Return: Async transaction descriptor on success and NULL on failure
> + * Return: Async transaction descriptor on success and NULL on failure or
> + *	   zero length transfer
>   */
>  static struct dma_async_tx_descriptor *zynqmp_dma_prep_memcpy(
>  				struct dma_chan *dchan, dma_addr_t dma_dst,
> @@ -851,6 +852,9 @@ static struct dma_async_tx_descriptor *zynqmp_dma_prep_memcpy(
>
>  	chan = to_chan(dchan);
>
> +	if (!len)
> +		return NULL;
> +
>  	desc_cnt = DIV_ROUND_UP(len, ZYNQMP_DMA_MAX_TRANS_LEN);
>
>  	spin_lock_irqsave(&chan->lock, irqflags);
> --
> 2.43.7
>

