Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8E8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 03:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2EPUUaDCtX1GE49FNOyQPu9f9QsxnwxJcZLBrWzrMFM=; b=SWuKSCCt246BTTFGFZNvBfiEai
	RRbynIoKJ4YCyTnhphqz7z+Tlm6A6XQZ7hU8RCZUwWFfVQZuEwG8yWAuKLb688gSdcZ3M7Ruox9ne
	TSV2bf/6e5mqhNXkeBO4OFmUHSCtx/6jtdThujVejRH0lpjk51WsflOsEqU+LsPWBwLGEFcFjY27H
	guitAXrXZygBT+gc+o0IWJVggvi3zU+fK51U6aC1B88kw2P+PKSHTBRDCRpOY0oJ3BqJPj3gVP1hC
	Rh8OngCbZfXkU3uR4Vph402vsOsbRLgwhX4JsTcJuFT/0+NNNXsU9Z4F3Gd5SUZlWd/LOi0BBnVyx
	Fm8djoMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf8S3-00000003WmJ-40U7;
	Thu, 02 Jul 2026 03:50:59 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf8S0-00000003Wll-3kWh;
	Thu, 02 Jul 2026 03:50:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ph7NjdVxIVyBBDqLxRHG3xXPMjl5QU5LgFeGwKeI26oRvOyuLoCU8+q/Bvzbajr+MqEB1NMQx2vJbxA4GXtDY0SF9uNLzQ7SenRl7yAQ4+XgWwZCQdy8LwsCNCXgu6lbJJgiccrgNagw2Ldio1yYYUhTMslyBBlKK2Lj1oTXYyebPqU7oWyOxgmnc8MpEaqZ4TlndWygux0DZ21Hm0fK8jJjcLOSRpkY9vDSvAd1jgUt1MWjacny2Qy/sXEsoZSO4p/zKZfiIc7+j8SL8/9f5q3Jz8G0ca+/7ERtN5j+F8elsolc+ANisoIrohV3o9rGJGgPyZTCWGdzVqjiQA20BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2EPUUaDCtX1GE49FNOyQPu9f9QsxnwxJcZLBrWzrMFM=;
 b=ilG7FH57cw+ZkPNF1QDtL+PRWR+eSCZu8D9wGAxVaFi6EVGZWc94QBtU2yq5OzhXxn5ASHM9eFoh5crkdK3hS/eKz1ep+pDYOTb/53fw2e19Zz5wOA2Gu7re5WmNaq9M2s/JzSsNlM+gc6pgn+qyh+7If8YSUOmvroqBX+GKlbxdo+85UZXLaSIo2vB6b4AynK/orfZPBlXCNx0BZRFY1e3P+bg8WUbBHsYtau4Pwq/uhGmgcXyoCk3gERyF7ouO4F7wtmdoNzuSnK2XRtl0v9AaI9O//cWjAYIbFSYvAuPQRWMhOthEwAKDe/kUUeKLCGsBVeoCAEcOqBkcSHrNiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2EPUUaDCtX1GE49FNOyQPu9f9QsxnwxJcZLBrWzrMFM=;
 b=NA+AQULuhzEQr5c8dcUpaoXTPpmTb9eQtSBxzymgAgB+JcEOvEQDNHaoSH69Mch4z20MyBk31CYd+7XPeLhm4sxv5/5BaAVccQqWGTlz7eSzQ5LfS2p6c7G9X2YO7oiNtFf0nZFq7IeUrRt0iCsr7vAfDMYSPl4BXUVK+gK8qQcBHjN5RuxJIE6Ffyo7xRzHwRJh7Xhp74DaSRz415Vpr9YAu6i97/1a+i45MRjOsBuLASsNieomWr6+wa2nfaNRwbfWlh/hwudmKMNSew5JkxWQYkMkTMFohz2npiFwgPM424HoTSvNfrsys2zNPUET0mBq9cbFiCDNzZrkfM8pGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MRWPR04MB12353.eurprd04.prod.outlook.com (2603:10a6:501:7f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Thu, 2 Jul
 2026 03:50:48 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 2 Jul 2026
 03:50:47 +0000
Date: Wed, 1 Jul 2026 22:50:38 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Long Cheng <long.cheng@mediatek.com>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dmaengine: mediatek: mtk-uart-apdma: Return -ENOMEM on
 memory allocation failure
Message-ID: <akXgDorjjPfuExXN@SMW015318>
References: <20260701200703.117929-1-vz@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701200703.117929-1-vz@kernel.org>
X-ClientProxiedBy: PH2PEPF00003852.namprd17.prod.outlook.com
 (2603:10b6:518:1::77) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MRWPR04MB12353:EE_
X-MS-Office365-Filtering-Correlation-Id: c82afd8b-2929-4c6a-53c8-08ded7ed19e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|7416014|376014|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: kKkH8CDxN6nbNMO3nJrOOHVqEUAYT0fEZGIlxN8flM/uIaQjiGFUueP2zzKPI4jc5nFPZg+EbHJlDzDwNFFb0t3esaT5hZxPwQBqjHaG+blryUhaz/xG9dVqBj1Ku1PS/v8XoYu3LFLg4Cyejme1YRcSchbHve/LosuNOjVYNeDuTaViBe3++z6GZ9aqsnvqoQgN0Qz/Pdl9vqIFtqmHhpmDsk3m4HGQW3w3KLKqMvNkznLE09zP4L3MOUhl9OpTY2xP6Ml+1vZllFil3Sx0aDOTHAH5/vlCKUEEIEBkSm8L6dhDLg9aj4ouaU5TzDw4sCyWxNNRx1Y2UHqgGUIlQ89h6WN+dHvVfHurgFiAfzl/npUzVVPhhX7+RPA8Cj/1oE+fwZ3MQ2m4fBLN22IMzErTydZ7lvWXqJ9kLsf/wXxj3mgW8h5WsQ9VW2wjLl9jsgl2UskQnICE39GBPoJjxvBwawG2G4Rl7gJNcXmuwBCdRJdMEf/BLsOQniUb5jrkkHvDf0MrrPugVxI1axZlUkpQdPfSUPupQl1WHhwgnlC/vEwzbkF8R1yQxiARRMXafEiLaDcuc2LmYNnlCdTBwtA2bIo3zw4beWkLyT1K6JWxkuIOrG8e2TtngP0JR0RyLXdbsOWDs/MCWa9hV/Szfu2tOk9Pbq9XrMe3kRtzFFU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(7416014)(376014)(56012099006)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YwJMep2/alQGUYOhp/GxRVQuoNG16fQfaXCVpC2e9+1pQZPOTwrRFJrHn66n?=
 =?us-ascii?Q?cUeG2LJgiptPvJzrPaZS5EEzb4Uf5nuMipQ2W67jbYOr4csGepiOJQRUZ6TH?=
 =?us-ascii?Q?/22Xq+dun6c5217vosGsbeVkmd7IK7ihuWf1tbBFIErK5nWfeXl1DcbkOeGj?=
 =?us-ascii?Q?06u3maQvbKeHmdv38emWQ3RfPnsGvnyG3AAwo1wAnUxRy24d/5ubEM2ZE5XC?=
 =?us-ascii?Q?hJpvwNDv72xJkaouR/jKZtN1wnFG0KEOA8IS2T2ZQjKFfcerE7XcuT7hjvHK?=
 =?us-ascii?Q?8AWulFFb+cUzyG8Fm4I8omKpq9glrQNFNf8sXmceV7CsqJcW1nnUfFkKlGeg?=
 =?us-ascii?Q?nbhOTtJzs5BFtlf9WtClMoB2g37uxw+tepVuBOTz2ZwXWnAvartv1YGPTork?=
 =?us-ascii?Q?Ffhgg2/JMXWyo3fedF7q9G65Jo6DCSLpPgpYrZT4oiVFoCT8f2HPQgquGG0M?=
 =?us-ascii?Q?aAEGk+Ig6ld3bmKi97ObBZif2uwZo+4KkQehb/x2Pd9gwadDRYpbmZatHvFo?=
 =?us-ascii?Q?jx/UyEhft9c/DkhCw+wahFMke0KcY9R/U4H7zGBIdwetpl/uVx644kSbdFVj?=
 =?us-ascii?Q?UUWp91DLBK9Uba0fngeTG/ly1U00564OqyNZdZ1AsI340gII7in9y6CST+Sb?=
 =?us-ascii?Q?N+t6TLQa4h2KBn8z1j/mDj9D7jzcpgfuJ4dVbrbGMLLYA1BqkEqhe8WD52a6?=
 =?us-ascii?Q?Zd7D0duDWhPWUGrmfG30ApyAI1HOe2CiWSAXhJXuZHbQik43Ya0AF1z0QytF?=
 =?us-ascii?Q?84Clc3SwBizEdeBvvJl/nIXqwQjttZy4OxVaPv4weWM2YfUlFKtacj1K+M7p?=
 =?us-ascii?Q?hv9SSmaeWROjaRa5fuw5N707bEXTlOIEsjmjSciRFSRy3JkfdUiS1DgZiL+Z?=
 =?us-ascii?Q?4LVO9vuiarCOsmjmspoMV+BgVIXbV3MeADl6UUCOOJKnMVorJDQxfpm/pmjW?=
 =?us-ascii?Q?hC1fTAyfNd5SLnDa3YxoyUq0MK0EuWmDbpfmew8UqTHoQIDsbxv5kzoSnn6O?=
 =?us-ascii?Q?yc++wkiSZiKSzicPZUdnDKW442e+7jbT9ZH6E0IFwLbwvHdyiuHpV3S7W44Q?=
 =?us-ascii?Q?TB3TInt3Hyd2eMobqiEtFHx2f/fEBlUvTskQzWMON12o7tW2oUOVomVqNMBo?=
 =?us-ascii?Q?hDmTjRxHl8wFud/uhu2+DxNEpESeTiicCMDhNgTcS4x1n5vHWRTTRSUAf7jT?=
 =?us-ascii?Q?vKVrHZZVz6K8Y2nu4u2f2DzONJTzhEbR9HLwdHQ22wHE5tkSjNJaKgjSnTtR?=
 =?us-ascii?Q?hwyKLqacui1UwlSeucb1YSCltPchsQuU4WkF5rt0C6n+w3OCQ71YtuFDKNbe?=
 =?us-ascii?Q?vXeetN+Ej/UTKn1trY/hMe+3gO9zz8HgVpFP7eow4FCd92WcYOcpjnHMRuKV?=
 =?us-ascii?Q?7+OKRJcYLHPyOtkuCQzp15wU7NowaU1XEfnTjQI7f+Fw7bGB+w7S1uLZunZu?=
 =?us-ascii?Q?lR1CIfBKbOOGxqst8DaqoMCdgJaOgJS7VqKfKenzzL/YAMENxBCJbsKZPltw?=
 =?us-ascii?Q?DpJBMVpozzcMwOnj0RLzRIblX/wpIk9X9TNr4xZpTNGKU/F3mLPu+gXNpT0o?=
 =?us-ascii?Q?BhaVfbgJpEFUb0qHYQyqla1B7Bn+QzG1L/S//ujds9aoaiLz7uQg6Ncw1d5N?=
 =?us-ascii?Q?L2vvFaV4t/bNCqh77b/tJuOjR2dxJ3uMh9f/cTUK393zg32k/0rIxJbh22D9?=
 =?us-ascii?Q?hORhpboMh41nVW0rrmVRnisz5KIMNuklrKUJmvr5OFJpn5LWPObll6Uqnxz0?=
 =?us-ascii?Q?JwQg1OFxi5zYnJyHZRSBqWPx+rEtTl4Pluv8mkQ+4Zz6d7MZMUQV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c82afd8b-2929-4c6a-53c8-08ded7ed19e4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 03:50:47.8022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MysojvxxKgwO9VanVaYgwDdOZjdVoyRr7lm2BhwG5dXygUVlGptR/GWmDvdgtGYxfp+FfwS7cTdEMY2SH+3M1J+Rg0b6oObJbIL8EvSZ5FKgXCqyTXMZw/d+FbfqUCLw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12353
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_205056_933829_ACBFB6F8 
X-CRM114-Status: GOOD (  19.10  )
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

On Wed, Jul 01, 2026 at 11:07:03PM +0300, Vladimir Zapolskiy wrote:
>
> If dynamic memory allocation in driver's probe function execution fails, it
> should be reported to the driver's framework with -ENOMEM error code.
>
> Fixes: 9135408c3ace ("dmaengine: mediatek: Add MediaTek UART APDMA support")
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/mediatek/mtk-uart-apdma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
> index c269d84d7bd2..f74e9a328588 100644
> --- a/drivers/dma/mediatek/mtk-uart-apdma.c
> +++ b/drivers/dma/mediatek/mtk-uart-apdma.c
> @@ -531,7 +531,7 @@ static int mtk_uart_apdma_probe(struct platform_device *pdev)
>         for (i = 0; i < mtkd->dma_requests; i++) {
>                 c = devm_kzalloc(mtkd->ddev.dev, sizeof(*c), GFP_KERNEL);
>                 if (!c) {
> -                       rc = -ENODEV;
> +                       rc = -ENOMEM;
>                         goto err_no_dma;
>                 }
>
> --
> 2.51.0
>

