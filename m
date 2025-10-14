Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A254CCD192
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 16:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zifuc/1EF40LOUbpOqE6J2pwr/2giM9orZq8EijypQ=; b=Js4bCKkrG4DY5z+QIpBpUHra7B
	VIDYTOxr37jGstsCBa2EtyfxmPZnafyag1SsP2D3wnLbSE4FPA/xofyyaKlf4ur/EqcPMzqx72BcP
	FrG9nbqL9WSjblvaWmDL5e2E7vZLq50c+1ztEGaPCPeNQq/7a5sWrWLJenGLkhBI6kohgJmRarq7p
	lFHh/ZRa4SLSRVQRIToYv3HUIbaALYrUbpVxrKLwvrr7ugDSkZUbgHXVPXlPb9ipObZzEQqXMZULM
	oQkbLltQibOZy6SWMXMxvQg35tGlrcKXQ7jqM9xPBvBpVoQZm231etzKTbcULnrFk7HJqwQL/H/RW
	oJD/FlkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8hRS-0000000Gw2E-0Xij;
	Tue, 14 Oct 2025 16:00:02 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8hRQ-0000000Gw1E-2H68
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 16:00:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m44je7/a2rproicWd+El3mxyp5DuiGg4vw/ROIgfQCDcwiNf2Nh0XrFgrFG5RCt0ltNdOXRCaHuvWYd0vKDiN6C00DaJnjfM5UPFHspcTB8UBgWAlNXq5TiLP+q/c0ALf2+m4EkDJuxRxaXgPSBfKqXqLvQTV5g8XntK4DJ2DqGA2mJNTgkhXNkSrqhWsgh9bMqB2qKuXpQPC6k9otgDqFboWo9jAPzUqmz6WpSqUySrfeoE1KPkdNXjvC5OfDFTLGZ9pwO6wzoRRj1+ToojmqiwxYTDf/zqVHNI7tAW9xEhWdWocFW4o340uUBckiUCYqaDWOd9RVpjNUjC9fK8YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zifuc/1EF40LOUbpOqE6J2pwr/2giM9orZq8EijypQ=;
 b=NScaRTpsBoQghoevfIat7/QdRlyFoxWZC8NQewWW332O34FIo5Fjc+kNdgmEXIce7RMt2/Rng4EgCZIhJAjJe81TOv0XqEBPm7eodF9BglSFGis7OI9PhVOGX8p1doOBpj81Dcsb88ggHcnYf/Vj43LzSZ1VmBxqCJHlSjSW2157YHERfVvDO2englRC0+Ja24ORlQTeY/oGGxZwwAAsbnwSFOm50v5cOKN3LVAR0dK1WdrKVQug/bwWw+oTDZxD7W6tiqOFEAM7HUz99dLXIpSP0Gj4+GBYlJwCKQCqALKM3ouN7xoK+86v/re7YKJ4raRzd4NSje+03KoO1VTNlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zifuc/1EF40LOUbpOqE6J2pwr/2giM9orZq8EijypQ=;
 b=ZSPpJwA8RLg7bg+VDaMFcy/o2fyujy5Brr6iEqYmAVxErsYpZdNkE+q2kEznbuzAs8JeFFMub+B84mYE1jqXceBo0nr2Xa2ZpH/9xn5FcSf06tIqNDxkxSSEIRoLeRChFRJwHTUNEZtGRcQPCv9r/u69ykqZR17dCOJ+5Jei6IGhw72OBlsSHy/HfJ5SrLX6t9xMvuNF+UodW2zJi3d9UEHzYjxcBh6npWfyewHg1Wg5xAtW29/4/9nWnnBbJeHce1h9rhxsuQ0ygItifP9x7GZZV/NAIYaEzzrZVpVoP2175bQvRdc8a+lDacC/ggNu+HjBYRmmIiy1O17J6GIH2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by VI0PR04MB11538.eurprd04.prod.outlook.com (2603:10a6:800:2ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Tue, 14 Oct
 2025 15:59:51 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 15:59:51 +0000
Date: Tue, 14 Oct 2025 11:59:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/8] firmware: imx: scu-irq: Remove unused export of
 imx_scu_enable_general_irq_channel
Message-ID: <aO5zcO+xLvADuEtS@lizhi-Precision-Tower-5810>
References: <20251014-imx-firmware-v1-0-ba00220613ca@nxp.com>
 <20251014-imx-firmware-v1-5-ba00220613ca@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-imx-firmware-v1-5-ba00220613ca@nxp.com>
X-ClientProxiedBy: PH0PR07CA0018.namprd07.prod.outlook.com
 (2603:10b6:510:5::23) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|VI0PR04MB11538:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a3343e9-8901-4422-21d4-08de0b3ab54b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MWz3DYVtgUnrQM+VnKC6E3Xh128t7GEQLAfz0q+ZKjBUNTMJ66cP+zCteiXs?=
 =?us-ascii?Q?7NulK2YwYQfQ6Ii1zd2oI/v2tASH1mOx2wKBzpwIzTBSv0U3Idg5tKJnQAj8?=
 =?us-ascii?Q?ht7qaVebpt8rdHxApkvuWnJqIwATTSAUn4UHkzgNSqZ/tGrRL4jzk50vxCpY?=
 =?us-ascii?Q?2wjx5kCk5M7SFyXXkEE0WM9AdzrRxFipR3I6h+gOXsmlL85ZvDyVblR+GFqy?=
 =?us-ascii?Q?8vpUDCP2b4g5OaB2j+AnZvrkMkFUSfzYCJuAtMriU4V8yaiEjZrBNU7YCm/C?=
 =?us-ascii?Q?Jy+D2IM8p0slF+tyeKmlF4bJtxA0/JxHTupRQsWKUqkWI4jUpW6okxsRzeaK?=
 =?us-ascii?Q?sQqOxe5ujE+hkaXK81tcA+6h+dKkf4Ommey/XrfaZmahwxxQVWv7plSWvFNz?=
 =?us-ascii?Q?5IA/OSnj0oy4ZsugpRQkCNucYU5dCfQkUFIAwXP9VZU2z3r1zWR74XxHrFv5?=
 =?us-ascii?Q?knVKgY+rvzEheZHrLwvPV7pSIm1FTDgv+wYzdm/ILvhpPJ3Q1wg4YeVrXYWX?=
 =?us-ascii?Q?UJco95cG2aWpgU9/xhm9sJCDVqWiYdYRaSgpsbO3EE2tcnTse3Idmi4lYkjN?=
 =?us-ascii?Q?+VRRV3H7ZaZ0pcJmwp3dpEp7In0CObiUaK3PSOZAfQV0M7NxaLqgbUu4FNqw?=
 =?us-ascii?Q?yxJLeb4oHE4Z26o2XAQJHnKgRidFTS0UJMLd1ctaUueaf/5HtL1XbQbphbS/?=
 =?us-ascii?Q?9QyW7V7uIU8xzpVRHBrq+qifGjwoPhwFM53WE34IeAGGnTaAK1TRa4bE2kHB?=
 =?us-ascii?Q?OsmCfTnPyjhY4Z3J37TGDajPmUphEKC2VdGy3F2bgzPag5Bja11AqE1dHZ/f?=
 =?us-ascii?Q?LNdD3wNefakPv32AELxyI/51v0jmMztCUbatP2RtdVSUr6XeVFlFFkHyIJdF?=
 =?us-ascii?Q?YQGR3sxmcQIXFUPoc+ywQ148/UhPIVLTTZq9SmBtzFcoYO84CyCDhJ9NV/Hz?=
 =?us-ascii?Q?KuLnfKnstWTWiIx6/oodcuAkbuqaR+UbIy2QUkOUuWV+fNg7DyAxOxyXoPmi?=
 =?us-ascii?Q?lFxbpxHbFwojkjqYtJ3AQgnR5TvfKhFlWHzDv5uoOvs/qMANsLnQZWRXboSc?=
 =?us-ascii?Q?eys1Xy+13FiJrg4+dmKhR+XrsdICWPnJa52wFYXJcCil9xc4xzIUGSBo3TxL?=
 =?us-ascii?Q?VLaJfcBLmkIHbJfwyXf3RbhT+Kd0GWQUI4YvqeGuafMtwX9vJkyIoC0CFWI2?=
 =?us-ascii?Q?+aBU/r3GUBUNc/CJkJQIGYqL2gSyDI7SYzIhKvxrqSAEmEOe0gvf+Zbx8rPQ?=
 =?us-ascii?Q?HGvysraiw4TRXtbPRXXTx26Z1wpryybOjsZes8XUKmf4LwLN1h6v8tchHFgj?=
 =?us-ascii?Q?y+DEj2oo5tkChuzDfJRRze/ANLj+g+yuBq0H7vW95hIFBAfqG1r6NEHtnnd+?=
 =?us-ascii?Q?onqTkHcS34a+1HVwGBAcWKiLLIigQElScLC1Xn7xFMhxt+q8oaB0rR0ixr5h?=
 =?us-ascii?Q?/Nzrc7fGplpoRKJNbAb7Opsikzn22BANi/7V9/YN8/8jIzREzYBIO1M1MkIN?=
 =?us-ascii?Q?NxTZtXSXRF0IwBXv06H+NPhPGcsfSuIdew5I?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VSux+aaJqWFmaCku4ZMtXTKMOyjNbBYRSE2CUopdqmG9iM4UZ66uLQuhQ8XZ?=
 =?us-ascii?Q?UOkKVgIN1Xtq4Tv2v4n/MOBtcklGOpYa2hpjRPjEk6zGqXqOlI/D9S1V1pgE?=
 =?us-ascii?Q?ZwS+aJfKsrgLM4xfZpXGVznRvXDdKmTn5OILkq0SWF3OhapaEj/ZHqjajqVd?=
 =?us-ascii?Q?J3xGFhnogmmc7kTu2GSxQ7fWeV30smdR/KEVKEm+Av6yBGseC+XBY9xkfJen?=
 =?us-ascii?Q?rYZAaxFXyF43RgMDXkDizoRJF03DFKMCY6Z5Qk+eAPHN2wt+YelwMP8Ee0i6?=
 =?us-ascii?Q?MI3vQOD4xFbdTNXBhA313rYOOWA/NyeNE+HdLnlKpiu6WSHlrwy02c2rl6aR?=
 =?us-ascii?Q?T773XrvtLKDJxb8lLkKyeTFFGS66nMsuTQx3wXA2FBiGpmfkPv0ZCT4PXcHX?=
 =?us-ascii?Q?1ttVI0/D0M2mrAi6GmJpMUPn0GifoeU87B0PSPnyUdQ5KAOD5DrDvrl4Y/MS?=
 =?us-ascii?Q?QvNhNmb/HJU34HTpf0vG/7u6RUVghiaZ6rRnhjzSd+Q81VMQA3HjYVNPZ4Ec?=
 =?us-ascii?Q?fe9AcAAl6jBeak4UKv7R8HRuYjyDCGpB/3OxJzcH5fBK3nlngBqRpbnPRzwI?=
 =?us-ascii?Q?b0edjJvzJXFT66BjBoJ83DQNRwqgPHA/OoNESPigTzwGv0VjJmVUW0hiKvJj?=
 =?us-ascii?Q?wecadz7lhNSvmi6Y6OWDYHbv293YOx6HDXNsho5dqgvcm3SxyLrmGLNhHkIe?=
 =?us-ascii?Q?je1xljHUylHzvFwonispCmgFOZQHU9dwk5DBw/SQWkJH0D4kBrrA2PZtfUVp?=
 =?us-ascii?Q?NXpOrZwD9ocfWm0YCqa3qiCcDEseBIN34CMntBLBKrmmle5OtU6VC6FGEJdj?=
 =?us-ascii?Q?/3YL2CuXPg2ndHABTqhefmXx5RF15YM56ujyMOVo7BZ6fzac1xgqECvTYDkY?=
 =?us-ascii?Q?F9w4X6A+R58SiSsM+LTtRhO4wB1YNqw2wDbQjyC2WXvjXSv/Qz55jVBkw0Vp?=
 =?us-ascii?Q?ODR70akAEJQIlRp46AG/NpdpEEpW+kJPCTzC6yOGgTADWat9zxCb7dXZfwXc?=
 =?us-ascii?Q?4pu9/rOZ6oCzZY2empwXjBkNes3Nv8foR/hDNR3PQ6V2NLJggeW+X81fYiKe?=
 =?us-ascii?Q?Jhes3NuTFKyjaOBm02m0kR5VoMxdqviLN5uSaTbFwLcVYaHXvVc7qvHgUhlR?=
 =?us-ascii?Q?AO9Q3YF8bh5ygVU7B3QsMagtGlr+bs741PnPqFokw78mRCFssrocnosJmQr+?=
 =?us-ascii?Q?/yStHwerOc8ZJS4rSqpT3kLooIC70O9daTy65NoKFfWJxhCTAr97KA9P5AND?=
 =?us-ascii?Q?/Y9yvgRgWEeKxgj3ptgz6SSc+nVPJJJ0xZUa6IL4fNxSuF5AiDUrSAZQyO8b?=
 =?us-ascii?Q?QLda8GAYqFsiB5uXfP5S3uookwouVHIDhmQLg5jJCgKkKIpefFzmSVNKlQHu?=
 =?us-ascii?Q?wb/NsbK+lCg6OWTmtKhblFEQeX26hXKGLC6eIl5yrb4nI/m9cGu+mafh5ep0?=
 =?us-ascii?Q?PjeuG5/1+4VGBU7uEYqoAxYBEtElBXF5HP6zJsFGCpN0PsR4XQ76RQenEWaH?=
 =?us-ascii?Q?GSLY0Jz/hAfHrfYQUjdrMnwwpr4eNy5Vh882qQDx+ihxqXocfCHjdRGUajz/?=
 =?us-ascii?Q?G64QoDWx1D/Tb28BvHripLGf6DBbgIS6BsvVohji?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a3343e9-8901-4422-21d4-08de0b3ab54b
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 15:59:51.1945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OREMfy/fjFQzJ4qgeEcm+74pTH/C/RWNKa57p7OtQF2c3KCf9ywQbtfrw2WCTO+QJbZq13Mi0nIIQZweY2Q6Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11538
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_090000_606173_4353CF17 
X-CRM114-Status: GOOD (  16.38  )
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

On Tue, Oct 14, 2025 at 12:54:42PM +0800, Peng Fan wrote:
> Since its introduction, this symbol has not been used by any loadable
> modules. It remains only referenced within imx-scu.c, which is always built
> together with imx-scu-irq.c

imx_scu_enable_general_irq_channel is only referenced within imx-scu.c,
which always built together with imx-scu-irq.c.

>
> As such, exporting imx_scu_enable_general_irq_channel is unnecessary, so
> remove the export.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/firmware/imx/imx-scu-irq.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/firmware/imx/imx-scu-irq.c b/drivers/firmware/imx/imx-scu-irq.c
> index 1346b75596293892ccd90a856d46f52171d88734..0be9c4c75d826a641e7078a265d30f146e8eb14d 100644
> --- a/drivers/firmware/imx/imx-scu-irq.c
> +++ b/drivers/firmware/imx/imx-scu-irq.c
> @@ -259,4 +259,3 @@ int imx_scu_enable_general_irq_channel(struct device *dev)
>
>  	return ret;
>  }
> -EXPORT_SYMBOL(imx_scu_enable_general_irq_channel);
>
> --
> 2.37.1
>

