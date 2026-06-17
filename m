Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EFDCD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 20:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HDYrZEG4UBANLmNN40pYcs29L3FK7cCT2F0et4ZdubU=; b=oKT+p0+hPyuqnA6fkybLmH8/nQ
	8oSdaBDmxS+3Lwi+oPGi/MLQscqoHKOhkOh5+DeZN2V/3N+Pmi08o8ey2IdxdpnW58c3++QADCKHr
	MTci4fAX90wGavpWyPyMPKtcY2IEG8wxXMj+FEwky9S1GrI52wi4zGtQqglrpE4L7TB/lx3rDPm+O
	rhnKk1TpFDhFE8Q4PA3pRGBqLeRvkLEiv81dvkaZGYyCWKlbw2JQXntoeBDLfS15KGQMXy8C379Wl
	euja2wGDT3QWbUEB49KBWU+/3ysxFDsW+i3vTNIFMVWoNLi6tvObYYbzePuSgx2oEEJ61GevnUPne
	3HiIV3CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZxIt-00000000KqT-3zQ9;
	Wed, 17 Jun 2026 20:56:07 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZxIp-00000000Kpy-2jeZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 20:56:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/bAQRrXVYyUuPylKZ57G7BLjcllwIuHIGyy3jIfBMVdtrXvAS87DUIV8gl6XHeaoxFYQvdlmpMZnJESO5ZvMVK/Rai9beHcVGwGMGuNP+Fola4va/+lLbS/7fqyiZG0WRiyc0JKQAnAL2zC4Pe5R3bWfnkG6kMsv7LbQ2yvIqIa63pgHxkAamYVUNRXPAjEu87uxxM1Z5k0BV9i7b3Jcr2xerFPdDSRGjq93K4bKKjQxbRPErVVWIAt/dkjjDvj/g2wSkVnyBv7+fYPY9WjilRsZ2PIHiTmGtx9CTX8ZkjGFodD+QlCJDHVUWScwfdQTFGudABEEJkohgF1lQjhvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HDYrZEG4UBANLmNN40pYcs29L3FK7cCT2F0et4ZdubU=;
 b=NpHK8jNuFDgFzM/+YZvt85xlWq8nIhINwde/PgouyIo4aI0j9pWN6G+ab3P5etr+eBir8AhCaaI9eUWVRjIVIKlx20t7LaSyc/6dEqDCCdeA/HN61lOoKoVjgbGWrI0xyV0AfZN2Z9DYkqnY9KlyVo+WCQOsim5m2FdtKDIkuY+X+vCXjgnSAyUoVMmfAT5GivsSzg6Aa/35svxl9euV33X+0SmlZoRWcV26CHN1pMkQNslPmh+Gf6JH0chwQ37ljZ4I8+2jLm1Ze6uU7vjp/mA6hxjirIWsJ+//wAPE/FxfXKKqWS9p5bD08TY5xrlTmsize59/9OfzTwyi6WgayQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HDYrZEG4UBANLmNN40pYcs29L3FK7cCT2F0et4ZdubU=;
 b=HvnCA/2TgVaN6byfPjaitYp25JCkZuZD3fjlqNEoAqQot3/9ZrwF3DyAxJDT/idnBSwTwLEM6aFWmjDmVoP2wNe7MsliRaqJP5c1xbzl6WHFPT6USsG9TAQ8/FuY3GR1TdCwyx6l+K2jNAOiiVPlLVGyjW6nPFtAWfcqdVu2KRm+fJJ6kn7hZNSXsuvFmUBD0NDNhgp3qg33n/43oBGV1lt4fpZv4UEqYBXEb6rUc1kofdcmpWovQaSI5ViqbDuCLfm02sIkZJr6G6DspXJLjOfTVN/YRExpyxgfu0AaEJuhyS+SkDyJ87pVYKJQUa1zGUgA+JGMZkZCEaKndJVpgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB9888.eurprd04.prod.outlook.com (2603:10a6:102:385::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Wed, 17 Jun
 2026 20:55:56 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 20:55:55 +0000
Date: Wed, 17 Jun 2026 16:55:48 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, wens@kernel.org,
	jernej.skrabec@gmail.com, samuel@sholland.org, mripard@kernel.org,
	arnd@arndb.de, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, zhongling0719@126.com
Subject: Re: [PATCH v3] dmaengine: sun6i-dma: Fix memory leak in
 sun6i_dma_terminate_all
Message-ID: <ajMJ1It4b4yCWghf@lizhi-Precision-Tower-5810>
References: <20260617023411.574488-1-zenghongling@kylinos.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617023411.574488-1-zenghongling@kylinos.cn>
X-ClientProxiedBy: PH0PR07CA0013.namprd07.prod.outlook.com
 (2603:10b6:510:5::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB9888:EE_
X-MS-Office365-Filtering-Correlation-Id: d9489bd6-2915-4da6-9a1e-08deccb2d35e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|23010399003|366016|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: c/ZommpGo+WdYtaE6m5TrgiD9+H2lGjP1aAZeWnhP1pzeYCayREeQTcnVGq+XXGgI0HowZgxZ7WKh31SxhabOu8E465cZFxee3dBfVZOyHUW1PUUk0oIWTsqFS6JSt7Rhw6VsGOY1p5sIFkqKFEdogRWZMGoe3XCA9Cywtnj4rmBlzs6884cfJcX96Geg1YzUtRXOgsM2Pu0Pk6kB0BQTof8njPL3MUyWroOQbBBReap/ZzbCvht5azKyurpyA21+iZL88KGPb7ZsD3g0FA5AP6XzR48O6HDo2lTaTMLgPv78Wt5Vvuu4SfpU67FyXnkU+NhCARq/zGZk0PLHjcZXgN/hTQZNrKhgS8WVdfgRLnHofHf+VVV2lDOOdo5YtAxXimUsDZH3ybnwdGrVhURLUtVPztCyamkMmgjId6xKyuyNxgMHxFUyIYvlwVyXX58lZnpEARsSBRhA5y2ktKOGMci6SkJz7cW5ho8YiZ+GRUaW02e7ziVNhs6tXawLi7w9OHa5hHjyeAmU7+UiyM1FA767mfCYfaTHXe1/nxqrzSnF1zO5NOVRXsonqygU3Oe694suXtGXeGlwjhI3qL9IfWJmR390njpw7wP91Mb7NHuDUT4C3pXQVfXkLjB5/mRlbWBMce8FACwsROR1s2s0ZVNSsv9YCiXRAHI3QiPuDFxo7nDX2Vdyo7m9RuU94ve
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(23010399003)(366016)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/dmOLIdNk2l23iY2PCLleyHWsfoLCdI2HHj7UFgxgrHsGuiHFvFYEhuW9all?=
 =?us-ascii?Q?vouyPYD4dmQeY/AcWBL2yNnUCPre0dadw59JCUYBOWJLQkHCeKXylc8J5+3/?=
 =?us-ascii?Q?dfHG7t4FTSAR3ppZ4PaPAm0bghEGwDIc/rlyv2ltd6YMMC+IjtV3KdAPl+Nu?=
 =?us-ascii?Q?XMLuSsvVMzuy5HVsJSU8Ls4U0SCyf4oC0qxnIVg6qM1aOMj3HNdCGeVNcu5/?=
 =?us-ascii?Q?qFyxfBXlFGPlhvQd2g66+jZFnL8bS1iCL+oqzGQvHRFoRN6EMLFL0D09zGyF?=
 =?us-ascii?Q?UFjN/jz53ZJPhmfsptyH7pdH+4BTpIUNPr8ZIa4/hJ/e8OGCQnDU0u3Yo8kV?=
 =?us-ascii?Q?y7CMZnaZjdJ8ca5IhqfC4LjglU1pZ2sjzgdHksXTlQyqonndwSqo5PzP5v7Z?=
 =?us-ascii?Q?R7Z030HN4eDQD8KcdujX6yZGieNFgZr0zmLOW1cRtInZ8qkXMRplOchcEjb1?=
 =?us-ascii?Q?Zsq1BXSKefFLLfuUdqY9Od/sDzO40e5032KsmZmdyOoTiaF7wrzf0psYV1GK?=
 =?us-ascii?Q?p8Z9Ga+9d0Uh/GQz8UmDnnqTjeMrRkleXSPZx9SuuItyO6dPKaie70dnLXWx?=
 =?us-ascii?Q?PeHeGidVU8b/fbgcniLIz3Zp9Nway7Y/v/B2kC4SAAcMQMK0Qn02bf2Vgj+G?=
 =?us-ascii?Q?p/LC8ucFO7KL8Xej5WfPJkpirZ/dTevFK4JwsdspX4ZH++kSlgXBZfF+hJ3k?=
 =?us-ascii?Q?BQXnfR5XWbwMABJKXQNVDvVBnkbMgOsdDwuBNcYl/nvk/34zOiOGLphxWn2P?=
 =?us-ascii?Q?yeWyWBp2GSCMB/4DRulIPzEBQqbIOcf8ZIN9+/6+BhjLnnDhDsY+ZKX1ArG9?=
 =?us-ascii?Q?7w0KH6Q8AlKnBmQQsAzUvjyHOWtp3yqeab0G+EYN6419L4KDzgm+WjS320LH?=
 =?us-ascii?Q?ZR1+lKz16mNkVxPBEl7ok3rniQCkZfjWEsgdHifu3dk0HSp4sCTFuc7ip60f?=
 =?us-ascii?Q?9vTJ7qIczzXV2E/DgEEirBxvCjKZPIWEgeYIxOliFli0i1cmIK01mZC1AgYO?=
 =?us-ascii?Q?aL1S+TeJwlnxBelFvOyr5P/LMvAUOd/s4/pykFDKBE3Z+1xM94o8g3hFFsiu?=
 =?us-ascii?Q?F0dM+LDfijg/Y9qVV0ay1WFiWOUH/G8wjCQn/frcgI4ODCLV/ClLJ+tcAaWS?=
 =?us-ascii?Q?FqJICRQQPpFCFBKDXxYHwjpILNFpQSo0noDt1gzA/U8+W329seOHmeKcGM/Y?=
 =?us-ascii?Q?4aHK2Tbh/Y9Q3uklMFWMhWXUS6fl0yEERYxYv7RH6jXpUuAkHoxlUBRzFNxp?=
 =?us-ascii?Q?xseEukouyPZzHJk/ExE86hrmIOJfcXh1CYfJ5PuqF27uhiJ/2BFAZQz5y20H?=
 =?us-ascii?Q?KC3LYTQ7wwCu9wubJfBSB0MpiY7r5bOypRprEQI4zE7/BD/x/KIyl+fRj5L9?=
 =?us-ascii?Q?WShjk5leI9oWkJeZFiVayJgpJoRgBnbLl17IrXc1HjdR+2rveWHda5oCYNUa?=
 =?us-ascii?Q?9FnZeTlQaLNFd306gO0xf17NI0Bt6qLb+Aod5PFwpm1pE9Kt2nRpe+dESeGw?=
 =?us-ascii?Q?ZAOa8O7dnFFfI9VXRCJawB37oHQd4ELQ1wEH3QVjr+GF91+NGu2SIUe6dwa8?=
 =?us-ascii?Q?Nu5npeHWm4+Ts8iMwbPBRoFTVkdc1tZlEYqH8phzeFObz6LmIe0AE3+1Wl/A?=
 =?us-ascii?Q?APp49sBmmiD7j9cG6X6viB1HejrvtpijIcZhF8r2F1cutfJXD6BSxb959zm7?=
 =?us-ascii?Q?yK4mQZKYelv0jPwSk75Eg/qS29XEPQaOe9vmkGwSiq8TDMuRHRId5LDcYAAJ?=
 =?us-ascii?Q?TDZ+jhhT+YTOH8nlTe4k12pTmKOOC0HYbBiT+30TyHVs0U8QWYnc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9489bd6-2915-4da6-9a1e-08deccb2d35e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 20:55:55.7407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6MSQm/sQF88k81hEvTtuQ0OKrS2JO7I7+vXRCrG+9vIm6sKms5QxaCkLM342QxtmjaGXknbBuuqtQDl8wIBtsvGJDMb4iwwMlSX0USGKOSHXeNLBO2jdxgV9AxmmfW4W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9888
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_135603_712735_99BB642F 
X-CRM114-Status: GOOD (  22.58  )
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

On Wed, Jun 17, 2026 at 10:34:11AM +0800, Hongling Zeng wrote:
> When terminating a non-cyclic DMA transfer, the active descriptor
> is not properly reclaimed. The descriptor is removed from the
> desc_issued list in sun6i_dma_start_desc(), but in
> sun6i_dma_terminate_all(), only cyclic transfer descriptors are
> added to the desc_completed list before cleanup.
>
> For non-cyclic transfers, pchan->desc is set to NULL without first
> adding the descriptor back to a list that vchan_get_all_descriptors()
> can collect. This causes the descriptor and its associated LLI chain
> to be permanently leaked.
>
> Fix by ensuring both cyclic and non-cyclic active descriptors are
> added to the desc_completed list before setting pchan->desc to NULL.

Can you update this to match your change.

Frank

>
> Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Suggested-by: Frank Li <Frank.li@oss.nxp.com>
>
> ---
>  Change in v2;
>  -Add pchan->desc != pchan->done check to prevent race condition
>   where completed descriptors could be double-added to desc_completed
>   list, causing list corruption
> ---
>  Change in v3:
>  -Fix by using vchan_terminate_vdesc() as suggested by Frank Li
> ---
>  drivers/dma/sun6i-dma.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index 7a79f346250a..134ae840f176 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -946,16 +946,13 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
>
>  	spin_lock_irqsave(&vchan->vc.lock, flags);
>
> -	if (vchan->cyclic) {
> -		vchan->cyclic = false;
> -		if (pchan && pchan->desc) {
> -			struct virt_dma_desc *vd = &pchan->desc->vd;
> -			struct virt_dma_chan *vc = &vchan->vc;
> -
> -			list_add_tail(&vd->node, &vc->desc_completed);
> -		}
> +	if (pchan && pchan->desc && pchan->desc != pchan->done) {
> +		struct virt_dma_desc *vd = &pchan->desc->vd;
> +
> +		vchan_terminate_vdesc(vd);
>  	}
>
> +	vchan->cyclic = false;
>  	vchan_get_all_descriptors(&vchan->vc, &head);
>
>  	if (pchan) {
> --
> 2.25.1
>

