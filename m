Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1D5C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 15:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NAb9L1Jb1IpHZFThK+1FsD3UJ25juyOi/e9eHIK8Xtw=; b=pjE3GyFbUj4laTdUAUM94hfmyM
	AFQ2F5kMMkPx6HNPSX1tYF8EQfwenylx0DJQTg4Gp4KNvc/w0dYedVt75A34tdVT9VJ1D8S1r/uCr
	WcRcJ0CiVcWeh5YUCljloyaadmyXMDvFFS8JqI4bPtmTfXNg3uvhMCfWN2LhDWSuB/P4dDUiSP8JT
	i5cb4WvrfRKdgiH+KfpgeTG6N4/BgvrtFcOt4WfdYEQEoNIxnE1smnUmky/HEwgfUfuMTN3OIbPXh
	5Pj5pfikW2yR8nEV/NKm1fB58ve1Y5PrT9NZd3lL3jPtvOO4hEtPvQLz0kvP03Ila0hQea1LPpXQW
	6ke0qjHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMw3-000000037si-0Ppd;
	Mon, 27 Jul 2026 15:08:07 +0000
Received: from mail-northeuropeazon11010063.outbound.protection.outlook.com ([52.101.84.63] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMw0-000000037rX-0otr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 15:08:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EGwPQDodM/Ij8sdkBCKwUzfIUaA6fSLwefqespgeWyDu1t+6lJ5uiEiavqHM0BDSbR/5gBhE+cfQa09DLPP+8PFNz/ddGMGp2saoitP5+SS6TJ+JuXzEmni4yqR1KXzFoLEBkNukHg5ibx1R5nJaZ34b3N4Oq8WNWMK2+uunlz7IpuMEg7oFFsbFlDPWkOCgLv1tRGUQasewpX9HR6hu1wrURPW0DRQe0uC9KLDoIRE/v0g5l6u5cstsmNpzMvPCsnUNjNtLK73tRSKGJo/QJCXY3Tif+bdX//w3TnpumDmAqfTMM2z57veKxCY8RtN2QrHbCZK9oHlY1hWU5IxfFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NAb9L1Jb1IpHZFThK+1FsD3UJ25juyOi/e9eHIK8Xtw=;
 b=k4u48sZQAd+L0/u/ad8+nuJe/ugh0WtzXX1pYzHMKRgnV0v1NRO9TYSyXDEzQms7jgzKantv4DlnBT4znnA20MtBs3z0v/SWRIXUDbygoAGtlI6bfcoXUV9bGYokvYxBs3d0UXAxJm9VNJ50znPQjMjyun+a+K2mBKV8Cm3nM3aSjIaJb7k+bO9E5zKjc/oOCb5Q4x15/ie63m9uZZ9AtMYv/URPcEaimuXzuDbitzbDNb4l/jihPvffwTEUBK64MZSPSTPo7mkmEDIpf+JTUVkuV8s4Gm8wbZg5A0nmSarsPB44F1us9z2AAWlZNFKqgicL3UxqdEj8iGqeHJB9jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NAb9L1Jb1IpHZFThK+1FsD3UJ25juyOi/e9eHIK8Xtw=;
 b=jWTQ8M6+nJwBfsCMt416GeVBDP/silBH3u6wPvBs2pyrYP+eMBX8Cgawe5cb8SvwTkezue6dO17UYYfZffdayks68hzd9vkWU6+cQN9IhX1KGOiMN+8BEMjfZW4y8S60RILFVG8+YdbwEJCmPvxYsntRt2MeLHtbynDQYydSylMawmbTe0uRhZkWgojxyfQQHtvmGbRuW0z8zEsq4iM+nBuGNUFKcGI3iXFwwKdF6Wp5DEy3uU2TJBti7q/FwHMaSRL+NSaAX8I2kWJ324ro8tp6/A4ZckLFsMGhEqfjc7+vTFpBY9eGyedxUtrHbO3LPQ/XlVo0is4scs8mOs77Cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB11633.eurprd04.prod.outlook.com (2603:10a6:150:2b0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 15:07:56 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 15:07:56 +0000
Date: Mon, 27 Jul 2026 10:07:48 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	dmaengine@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dmaengine: imx-sdma: Remove unused imx_dma_is_ipu()
 inline function
Message-ID: <amd0RAE8Ly8PuZqb@SMW015318>
References: <20260726102424.547951-1-vz@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260726102424.547951-1-vz@kernel.org>
X-ClientProxiedBy: PH7P220CA0074.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB11633:EE_
X-MS-Office365-Filtering-Correlation-Id: a7204112-3735-4247-9088-08deebf0d6f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|366016|1800799024|23010399003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Cx7t7D5VyYtS//KuHj5hMZkzr5Rdfe/fmLfx1AvLuiL76s2lBt0Y0MqB5LKHo6Rxzt9XAbIMaR1wyh5ct3nZwJ+BTaVVg5i7Bey1Csy/DRffCyAkRWKWu9FHaHmQYSeke2pC9bJvtJ4Np5UegubAt0XioFtxHZui4ihrsnPfP9BwOeiwMYt9X2HS0r++c6qQDWUhIahbXHiApotIwgNTZqMMWBqOcwnxe/PbpaqPeANrdfIe8EnW6RIY2Dr3xZ/8qZyQnH8Y2LhZAT0pd1wKlbLUtg/3rNqS9LgLFFls4fjChZjbqRm4ouCo+7gfoMV/RQ/0azLYRTHlZXgyM8Kucu/8JZp7uu+5zjBMJcmdpxFfL0/2XvyNKI/+vFW8+bKFZGzHRMlP/kjyE4gFs+/ytRKp9q0wLrQnmL25srNBkzMjfkaqqSoh3yudMZXwsL9aUbbRyJ31d/TwlmLpV2oJR1jJuVhTFr32xlYCmU56KI/vL6oz9TrrZBZW1jdz95Y5vUfX7GnIQkdvT0kVvb4kMzr2iPZQn/fsZJFl1OPJcnQOFBHUeiXpdPOUjtqZ3kAKMnUbbuL1LNRzlPnKo05OinSgE11R2/AfCvemOj+tY8YgprsmtzAoBMjSZXTgb9F7BrsykLkkpN+5swgfJy5OP8UZ0NBCy/tWlRuOcWhKp1Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(1800799024)(23010399003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CTBu9TUUt/cIddihvhyOm/6SVzaaNjaHN1eErXmQBNVY+3wsZZ/tLXH1PAJt?=
 =?us-ascii?Q?mGcOWbj5zujsKpupE3GeUfg3fdMMxxJX6AemvsW9ZaiVeeiXznyqHOpdTvhI?=
 =?us-ascii?Q?Vs+hvFHnfbzf9J9DHSBjtS3Eyn95x5vt8GphdH6QMX9nAVzkL87m3KRWpqda?=
 =?us-ascii?Q?9dGZjpBhYcTaMj7/6soVWUK8WQJxQDm5pnT8z9r/uFfVG3AIJ8W2VSqmQJh/?=
 =?us-ascii?Q?9MWwoSNEEXeqXzf9aFq+HBRb8e/4A8+/sWLPdubcfotLHEm76eG9njJq2/VR?=
 =?us-ascii?Q?AtJSAEKPyAguW6EKvpzq1WwLDAN/VqbYaB8MXnulqGUJgZROcTaIgacHrhpy?=
 =?us-ascii?Q?t5fZPLu8zPH8akFk9IxL7Do37pSTPiYL4FmPd3e/K5j4Bla8tjtX6SV5JF7b?=
 =?us-ascii?Q?yfWckR6CslfKMJIAYjCRA9NhvvQr1pAqA6rm5RATks862SqNSslGSWo8pZDR?=
 =?us-ascii?Q?+FJjpW2i8eUxGlAT8GITwPMp9fiSyhVxQ7pDv6IIu8n1gZsMzL1LqyNx4Lat?=
 =?us-ascii?Q?hB6kYcZat6rZyC1hBXWUb+ag7dmrj26P9Ni7renrlpT0e3ybLMSGCVZIKQCf?=
 =?us-ascii?Q?ziqu77FkrVHjucF8ryZ/AZ75x3rPQapo+EkLgBqWqNX3m8crBEMt4ZSSav5b?=
 =?us-ascii?Q?wXA0ZStynw3PGd6MxTyinczYZUJZP0T36zRVoumGuqZRgeqpKmawUIcaE8bf?=
 =?us-ascii?Q?VtuzX+Kn55JpnY9Jtk4CGh3UwQ+U9JUJJnsZR7XxZowymwkN/EHUnRNlD9T5?=
 =?us-ascii?Q?VyPqFRXQ6pncka+Om1OkeAjdFaHCLrwCz3M8Kz3/uDhT19mso3vamALrZNJk?=
 =?us-ascii?Q?DpGTjAwcbaSnuvdGMP2ILtx9nzW4Rtodgi2MmIymGQvSlXfW5X9vcbs4QGqQ?=
 =?us-ascii?Q?UGSC7imU15wUHSWU61WAUo/g7Yt6YYdyTtVcYC/Y1/fpfsh6DsOuJe0g4GwG?=
 =?us-ascii?Q?4jQPQ/hsaJkNbL2kSLLgFhabRuTW9+i4vb20AtHkJbQ++FuifwWBFDJ4tMVk?=
 =?us-ascii?Q?4pAb7z99j6H5nmauu4zoHlTnqyLNS9hFByAbKZaNrAAxDjNhIkEC2ILb1BFZ?=
 =?us-ascii?Q?7xpICwC6RR/nMR/Anm7Mn7XuTjEz0sDSkvtNiOKR3t4ctukgWaccbe5vyM2G?=
 =?us-ascii?Q?NXndEBPQrauoNsWb+yPt3bEloU5Dilr2I5PQT3LlmZto/qv8pJNFyNwoMDXi?=
 =?us-ascii?Q?+vM1UfVgIbw7lj3OWiY34mQnEocinNAaODv3WPRm+zzQhiyWUyCjkdQ4oo8e?=
 =?us-ascii?Q?RL6u7dp1uHjCFluiId77/KHibwrPfpAhOVq8D4F73HYlihAssZ5wOFO7/Uhk?=
 =?us-ascii?Q?MFIVzud+TfnGYJLnhXhE7xe5nxNUJ/sBVwFtrzHDiB5RXa73C357loaPzNeq?=
 =?us-ascii?Q?0/E6eVhghU0amq9cjT37TkEZ0JDJIUVErSVuS5ErDaxGRJhh0G9VhTzzqI9u?=
 =?us-ascii?Q?Kv9hZlcDOIRV/zDuLEksfOQ087764TShHq5VGtEh/HyRU+q/NTqCGtDcDr4L?=
 =?us-ascii?Q?fOmF93yij+CTXSHEwT4l1URVEKdU2wKk4GDqzlMZADdEMe3ZynHWMC2iOrRg?=
 =?us-ascii?Q?/y2fkdqYSJWl5qbVlOUrqwyo/KLOux73JQ9sEfAUkdcxCDLzdORh/Z4E55Ra?=
 =?us-ascii?Q?cUihcSNsxOv2nzXq5jWc0aHXlqjyjvQlMWRMOmV+9fsM8jP6jg/L2YXbBxJZ?=
 =?us-ascii?Q?arkZMCI0TIT1beXcezNQDXt9F1AIfxkWhSIl+9dAKNzYCRe+GBv3cp0YVXmI?=
 =?us-ascii?Q?f5u+jUDVRlLpogxIAVe5mQN2mAAiOoO3UpCUlLv1A4TAhnHPKFje?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7204112-3735-4247-9088-08deebf0d6f6
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 15:07:56.7390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YSWYVonvapARXbuuVjnUwUkABEQPCA9If5wbL2XUWD1mkOZ+0i+LhXPpeIqS6ixrikk+b0bHv9j1JzccT13KPoGyY2H0+oQq+PhUCmFJFD3rJVYJlfulz9FExBw/tRsX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11633
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_080804_545981_B6FD2965 
X-CRM114-Status: GOOD (  13.78  )
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

On Sun, Jul 26, 2026 at 01:24:24PM +0300, Vladimir Zapolskiy wrote:
> The last user of the inline helper function imx_dma_is_ipu() was removed
> by commit bfac19e239a7 ("fbdev: mx3fb: Remove the driver") a few years
> ago, and this helper also can be safely removed.
>
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  include/linux/dma/imx-dma.h | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/include/linux/dma/imx-dma.h b/include/linux/dma/imx-dma.h
> index 76a8de9ae151..16e491f63883 100644
> --- a/include/linux/dma/imx-dma.h
> +++ b/include/linux/dma/imx-dma.h
> @@ -57,11 +57,6 @@ struct imx_dma_data {
>  	int priority;
>  };
>
> -static inline int imx_dma_is_ipu(struct dma_chan *chan)
> -{
> -	return !strcmp(dev_name(chan->device->dev), "ipu-core");
> -}
> -
>  static inline int imx_dma_is_general_purpose(struct dma_chan *chan)
>  {
>  	return !strcmp(chan->device->dev->driver->name, "imx-sdma") ||
> --
> 2.51.0
>

