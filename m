Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FE3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 14:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C7sypIWpfrbckmpFwZe0rtgqz/X36rJYVjvWXWwxSrs=; b=glyXC3xZL6uQVV+XQCexn488oP
	7Fb2XdT1Uwg7nB1xeyY8ZDIHueaSnA/TxPs0vR77LuF/SHTZ7KEJlPzJSb1pUOXEU8XAeEsFP689/
	iWOvK6DynfZZej10Ll74UQqnJEG20B4PWOZPPX+VZop9rwxAgYZ4pr4NB5dnk9qfI9hp52VIlHuSr
	PkNl9UBOf6IJ7cO1CP8fBEz+XSa2WPJTCA0t2Rmp5Qpmw2yQtFdVmldBhS0GnveCQVibpabmkt72W
	BNHNJqpazvVA6MfUFB7ECz1wyWQ1wHpSH5k2h9qJ+JJbOzU2pF5HWWp+gCyp0Y+sADaT5qTp/ERp+
	S7MAOF+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDOZ-0000000EyYk-05Cb;
	Mon, 29 Jun 2026 14:55:35 +0000
Received: from mail-norwayeastazon11013033.outbound.protection.outlook.com ([40.107.159.33] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDOW-0000000EyYO-34iJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 14:55:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q0nFMQqu0kSwfs+KLuNA7MrEZpYn1ko6btkT9bt0Ca2cu1PITCzd2U086HC8+gugVDpK5Tel0HkkSYLfYKGFJlp7Jbu+YBc3IavNmysJAUSrjNNvAftIdhvYXI8TpE8tmMrt5TEPg0jTbCv2lKCpnE8y43guyA8WLorcR81fj0rGv31lCZKsBJ0XfRNxtP5H6tfOGBBATmapxd9ql26oFApo4Bjp2b+dS23b/vc6rMPQ/iX8J8+4WQbojaYrDj4ozwXmduTmXmDwrRUw07/D/aJ5GgXsIUan8O1gzWlmSMfaYZtFIPG8D6zu1lfWQ+rCGczKiPjtph5RDsO2Vq0xYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C7sypIWpfrbckmpFwZe0rtgqz/X36rJYVjvWXWwxSrs=;
 b=yFaipZcLBDXRRiOCcaSzzqwNe5U1RpTREMufBQ5ooHHWV+VRJIdI/9O3ZsO62As6H/dXmexwEg1ng7NuMo4eDnqvTqA328vtvPBY0Xyps8k1IbrjeLpZErVZb2SULLpjuwRsJP2+dV72kJTna5aIRU1T/zPtgcuaqrcey4o9jDizq/1+EZh1591ObWArGsysf4BoJObJ1yXz2el9l8Oc8smtOqG0qZ4GfZ54sWf9xyamtP5Xzta+3MuZN1OBaTaEn4/PFcEJcmvPbGxRR4LlryG3DBGKK7m1MViRYK3/PGznmhYDNrfUN/NuYEFr3frTHsNslLN6xMqFesoJ2yEMvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7sypIWpfrbckmpFwZe0rtgqz/X36rJYVjvWXWwxSrs=;
 b=LfWDRjJNMIFcdycVFlYJPr8uBM05VMfsQ04ddjwtjFmwqKqxUTWNM4P7Cddaq0t3wMjxShKATdfqER3R37gj4mevotNxFZhHVdhf2P0NIwy632N/XhMZVHulz4pxO1TYOcCbpRJhSVlrbcjA53GR3+MMr5gpo3ajFsB0GlyIs+fm29lxaE8iVfdARfHMfXbPe3Q9MKVszmjtoMthK2gkg8ZOGrSX1EEC3Fb1HF/MJvJ/8Z4Um+nMEncEIlnBbEhP0JXBsbbudOoJYB+AMyGBOZtsrpwfZe61nIHhM2YWWeSQEXdoEfvjlYukLj4HUYRiC+MX27qUpWcuvqDiYr6lJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB5PR04MB12228.eurprd04.prod.outlook.com (2603:10a6:10:64a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Mon, 29 Jun
 2026 14:55:27 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 14:55:27 +0000
Date: Mon, 29 Jun 2026 09:55:16 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Christian Hemp <c.hemp@phytec.de>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/5] media: nxp: imx8-isi: Fix per-stream reference
 counting for multiplexed streams
Message-ID: <akKHVAcjsotmIRad@SMW015318>
References: <20260629-isi-v1-0-deebfdb1b07b@oss.nxp.com>
 <20260629-isi-v1-2-deebfdb1b07b@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-isi-v1-2-deebfdb1b07b@oss.nxp.com>
X-ClientProxiedBy: SA0PR11CA0006.namprd11.prod.outlook.com
 (2603:10b6:806:d3::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB5PR04MB12228:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f126ad8-fafd-4f1c-6b56-08ded5ee74ce
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|23010399003|376014|1800799024|366016|22082099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: aXdG0hH2O9z+Iy3cf7UyHVp8j5fPEzLMQ7VQbSyCpi4mmgvbyXDPYTHOitAhqrQCCxMyJCTYSiWAAyqJuzL/efAPRYbCYvni3tQL5/qpivoFA936pKLBodpsmG1LQsi9DPhELgrvIKQfsy7QZ1M1iYeBsoW05lbCDz9Xw1jR0sYao+vJxqwx5uSRAmhLHX0gwq3E+43euhBlBDvdoOvd3zwR1cRoU6vaCvxC2w5QVOlSwSI1L5xkWuNuHa+swdFJ4shBijEaNkW8X0JFtmt/uRT13wK9ppRYrCBn6LeZ81HSWiFRhkBeytC4rPiDujx6b3wjnVNYvqfFr2oqVmvtHWNeBuu+lu5w9wPlS3wwnSue3vS3XsP7nBQONpuLl2EA5GDJkKaq5CKyhWWcOchxs52Zv/jOSIOnJ1rrX1U3bNWz1aOIcVVIkHO3dG7ykSoyy1eCkIVcoPJgBvgi9th5vHKHJSkvhVhp0SEvE6mMEYq7otyuVL6V9terKl/z67sRiBcBvusOoPTiyRNOynHMtPSjDAXuhYf+3QEKZPLy2W0Mc+XJRp5YHPEetyNY6Y8Tvn2vgyMCodTrenq/WmdGVTSW04JAmDr7HchH3lluBOkxizag5kP/fK55U8lYKS2IH0oX87uLLZH5VEC3X3TMLa5v18+XgSW3GeNWPYRPYcs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(23010399003)(376014)(1800799024)(366016)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DHa3zKTqzlLgzFHY+sj3H9upI1eZnNtQQa++IHPAXVtwrm6hkK58B6xjWm06?=
 =?us-ascii?Q?LWEbfNpy81XgkvW6hwYCDgflTjzPxZLW8SJsrBqU1o1JMgdKGO+s+YLarpmL?=
 =?us-ascii?Q?gCF3PD5xhKRxlG8pwKUDC+bGioOGbNaafTCmlcjWOC5IbirvY/OVgzWs9zAj?=
 =?us-ascii?Q?90Nvsuz0fc263hGEzWADgvm5bsJPIu2j7YRAQrn9wk9eD9TOBiuWCECIF/qK?=
 =?us-ascii?Q?eOk8r0Ye+ej1lS2fVxWkxfbpvxDkbCB9FDrTze856oOK2egDXCSaYSfRpNrZ?=
 =?us-ascii?Q?gukSWNnce7nigH2trbJ8NhilH7Wo+vgtQR8OOqu3QtKdOfpeEJgwPx4nwKfH?=
 =?us-ascii?Q?STxEA3+uO0m7XlBA1d2mmTBrkNGzcdafiFiDUvrVbjGpBNC7ayMKH+fmjguX?=
 =?us-ascii?Q?SIQfqWk9l2TN8PKXmdaQvjbhBbFEmUxhYtJSzWFH65esa2v1GzGu83ntXVLD?=
 =?us-ascii?Q?9FtYR8DHj1aCd4iDY8bhZD38GSW6bjo32NRh0jU7n2AJuHVvuj6z/VHKvIk7?=
 =?us-ascii?Q?knBG9PAEBJ2D+PnesZPaMAorF3znxs8eL1U64SiDsdzItqy3uEn3DY/yaLrC?=
 =?us-ascii?Q?hJ13e09H5x0/MvE0/SasBi1q/tx6hmlNhIm4j3Eymh/FEEQMzN6QydgomjCX?=
 =?us-ascii?Q?tp6bEY27GZYDGqiUOXFWA7y9LBbdR7ZoCYHDvaKqOrx0KZpcRMBfekSvuQz+?=
 =?us-ascii?Q?Kxar9ad2sHAyUyYrLp1XozvPo0dwMEn8ckWxrnd0q88j7JdaGzZA+Nke+ODM?=
 =?us-ascii?Q?TLR4TEt3iwyObEb1Azt6eXs1C/N2D0QSPQPgyvDEXJW8QkhJ4MbSf96UjGfw?=
 =?us-ascii?Q?WosOXXSG86TW3YgsoHjUJeM8DTCvWmoxAyASu96XxXMtjlAPd4svd8LhjRcs?=
 =?us-ascii?Q?s2jIzw0aM6jYVhdx2I0uPwr07ZPmop+e3P9IZM0E3JssroB+5wlPzfI6hFUc?=
 =?us-ascii?Q?Y27+O+1LX5HbJgEewXQzCqPs9gY/M6Ph+4WttLyaYKi8UgqstmAoFY7B2W+4?=
 =?us-ascii?Q?JYCvL4tCf28B8rJnXsCM5oEERscugBYqqOBkJZD4YTyN/8As2m1Ow2SCyKHZ?=
 =?us-ascii?Q?DRyRzbncmPWvXf+Cki4ih4NseIaw4qAsfSumqJby8r0y6Ux/d1Iv/Ud8S0Ol?=
 =?us-ascii?Q?TP/Ufj9LY9s0bdH/SqV72PpTOEtTEfi/GMnRZ9GkDl3dM17CTlsruMSHpz0s?=
 =?us-ascii?Q?YBKpX9s24JGFauaxBj/nIhcD6H/i2d8JbjQZtfDIguzHupAKBzVIE8rpANG6?=
 =?us-ascii?Q?7ugK0WrYFL3D1XwYEgIqhW7o0wmyokfPda/z0pzyezGugtwxAzk4qjnXAspn?=
 =?us-ascii?Q?wjrFvl9Od4WUTr+az+gIP+FbWu0quuXlq4QhaiJ89W+s7AsgSkiC1zZXA6OC?=
 =?us-ascii?Q?lTCOd2w4ZvUPuubAm/k3HrUebR8DfO0oS2urZaTgnU6Cgl01DbLgXOZ9c32/?=
 =?us-ascii?Q?MZStbuNuPBOdpLLJrk7emPQTwSzjHrb8/M5NUwhDn844gYKH3z2i41vh/y1O?=
 =?us-ascii?Q?E/fxAbdYgCq5My7ivoDmYCsD+wqutFIV/C01uGDhQJvs8CXJDCmWhAiJGh+K?=
 =?us-ascii?Q?FBZJ5TcwLI1Akxzn681g7agmPno5Abra2NJNPyxv3dN7xctQJz1XS9cp3FLw?=
 =?us-ascii?Q?ZRo5Mim1CoV6kijofkLKSZpwmzvQ0/wgMNEDyXe1XpSkeCsPV6uBa3/75EKl?=
 =?us-ascii?Q?SQ4MUia//G9Pc6hT2diGJ2aEIA6z8Cwl88lkKKbypEstgrUJWAktI0xuh6VS?=
 =?us-ascii?Q?DYxRscpry3qur7egU9glev1VYq0WAzGbwTf+JO+2lBU2mYy8voDJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f126ad8-fafd-4f1c-6b56-08ded5ee74ce
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 14:55:27.4042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F6900f53WnB0/P5ttl6tNUe0ikipzOdgKnukgC+gIxm5JZ4HMSB1kvO4Gi0zRpK00784DJfbhqCq3iSiZxfa3nGu6hlplK+sL77u99VRzxeHMRiarSBlvu0+fbW824xO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR04MB12228
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_075532_930739_6734786B 
X-CRM114-Status: GOOD (  31.11  )
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

On Mon, Jun 29, 2026 at 03:44:56PM +0800, Guoniu Zhou wrote:

subject: use per-stream state to fix ...

> The ISI crossbar fails to properly enable multiple streams from different
> virtual channels on the same input pad. Only the first stream gets enabled
> in hardware, subsequent streams are silently ignored.
>
> The driver uses a single enable_count per input to track the input state.
> When enable_count is non-zero, the code assumes the input is already active
> and skips calling v4l2_subdev_enable_streams() for additional streams:
>
>   Call 1: enable_streams(stream 0)
>     -> enable_count == 0, enable gasket and stream 0 in hardware
>     -> enable_count = 1
>
>   Call 2: enable_streams(stream 1)
>     -> enable_count == 1, skip hardware enable (BUG!)
>     -> enable_count = 2
>     -> stream 1 never gets enabled
>
> Similarly on disable, when enable_count reaches zero, ALL streams are
> disabled regardless of which streams are actually still active.
>
> Fix this by tracking per-stream state using:
> - enabled_streams (u64 bitmask): tracks which streams are currently enabled
> - enabled_count[] (array): per-stream reference counter to support the same
>   stream being enabled/disabled multiple times
>
> Now each stream is independently enabled/disabled in hardware based on the
> enabled_streams bitmask, while enabled_count[] provides reference counting
> for scenarios where the same stream is enabled multiple times,  such as
> duplicate cases in the ISI stream.
>
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |   4 +-
>  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      | 121 +++++++++++++++++----
>  2 files changed, 104 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 7547a6559d4c..bb2cfba27e20 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -185,7 +185,9 @@ struct mxc_isi_dma_buffer {
>  };
>
>  struct mxc_isi_input {
> -	unsigned int			enable_count;
> +	u64				enabled_streams;
> +	/* Counter per stream */
> +	unsigned int			*enabled_count;
>  };
>
>  struct mxc_isi_crossbar {
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index 29f14d30dbbb..a4a063c60c76 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -345,6 +345,8 @@ static int mxc_isi_crossbar_enable_streams(struct v4l2_subdev *sd,
>  	struct mxc_isi_crossbar *xbar = to_isi_crossbar(sd);
>  	struct v4l2_subdev *remote_sd;
>  	struct mxc_isi_input *input;
> +	u64 streams_to_enable;
> +	unsigned long stream;
>  	u64 sink_streams;
>  	u32 sink_pad;
>  	u32 remote_pad;
> @@ -358,30 +360,47 @@ static int mxc_isi_crossbar_enable_streams(struct v4l2_subdev *sd,
>
>  	input = &xbar->inputs[sink_pad];
>
> -	/*
> -	 * TODO: Track per-stream enable counts to support multiplexed
> -	 * streams.
> -	 */
> -	if (!input->enable_count) {
> +	if (!input->enabled_streams) {
>  		ret = mxc_isi_crossbar_gasket_enable(xbar, state, remote_sd,
>  						     remote_pad, sink_pad);
>  		if (ret)
>  			return ret;
> +	}
> +
> +	/*
> +	 * Track per-stream enable counts to support multiplexed streams.
> +	 * Only enable streams that are not already enabled.
> +	 */
> +	streams_to_enable = sink_streams & ~input->enabled_streams;
>
> +	if (streams_to_enable) {
>  		ret = v4l2_subdev_enable_streams(remote_sd, remote_pad,
> -						 sink_streams);
> +						 streams_to_enable);
>  		if (ret) {
>  			dev_err(xbar->isi->dev,
>  				"failed to enable streams 0x%llx on '%s':%u: %d\n",
> -				sink_streams, remote_sd->name, remote_pad, ret);
> -			mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
> -			return ret;
> +				streams_to_enable, remote_sd->name, remote_pad, ret);
> +			goto err_gasket_disable;
>  		}
> +
> +		input->enabled_streams |= streams_to_enable;
>  	}
>
> -	input->enable_count++;
> +	/* Increment reference count for all requested streams */
> +	for (stream = 0; stream < xbar->num_sources; stream++) {
> +		if (!(sink_streams & BIT(stream)))
> +			continue;
> +
> +		input->enabled_count[stream]++;
> +	}
>
>  	return 0;
> +
> +err_gasket_disable:
> +	if (!input->enabled_streams)
> +		mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
> +
> +	return ret;
>  }
>
>  static int mxc_isi_crossbar_disable_streams(struct v4l2_subdev *sd,
> @@ -391,6 +410,8 @@ static int mxc_isi_crossbar_disable_streams(struct v4l2_subdev *sd,
>  	struct mxc_isi_crossbar *xbar = to_isi_crossbar(sd);
>  	struct v4l2_subdev *remote_sd;
>  	struct mxc_isi_input *input;
> +	u64 streams_to_disable = 0;
> +	unsigned long stream;
>  	u64 sink_streams;
>  	u32 sink_pad;
>  	u32 remote_pad;
> @@ -404,19 +425,36 @@ static int mxc_isi_crossbar_disable_streams(struct v4l2_subdev *sd,
>
>  	input = &xbar->inputs[sink_pad];
>
> -	input->enable_count--;
> +	/*
> +	 * Decrease the enable count for each stream. Only disable streams
> +	 * whose count reaches zero.
> +	 */
> +	for (stream = 0; stream < xbar->num_sources; stream++) {
> +		if (!(sink_streams & BIT(stream)))
> +			continue;
>
> -	if (!input->enable_count) {
> -		ret = v4l2_subdev_disable_streams(remote_sd, remote_pad,
> -						  sink_streams);
> -		if (ret)
> -			dev_err(xbar->isi->dev,
> -				"failed to disable streams 0x%llx on '%s':%u: %d\n",
> -				sink_streams, remote_sd->name, remote_pad, ret);
> +		if (!(input->enabled_streams & BIT(stream)))
> +			continue;
>
> -		mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
> +		if (--input->enabled_count[stream] == 0)
> +			streams_to_disable |= BIT(stream);
>  	}
>
> +	if (!streams_to_disable)
> +		return 0;
> +
> +	ret = v4l2_subdev_disable_streams(remote_sd, remote_pad,
> +					  streams_to_disable);
> +	if (ret)
> +		dev_err(xbar->isi->dev,
> +			"failed to disable streams 0x%llx on '%s':%u: %d\n",
> +			streams_to_disable, remote_sd->name, remote_pad, ret);
> +
> +	input->enabled_streams &= ~streams_to_disable;
> +
> +	if (!input->enabled_streams)
> +		mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
> +
>  	return ret;
>  }
>
> @@ -447,6 +485,42 @@ static const struct media_entity_operations mxc_isi_cross_entity_ops = {
>   * Init & cleanup
>   */
>
> +static int mxc_isi_stream_counters_alloc(struct mxc_isi_crossbar *xbar)
> +{
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < xbar->num_sinks; ++i) {
> +		struct mxc_isi_input *input = &xbar->inputs[i];
> +
> +		input->enabled_count = kcalloc(xbar->num_sources,
> +					       sizeof(*input->enabled_count),
> +					       GFP_KERNEL);

kzalloc_objs();

Frank
> +		if (!input->enabled_count) {
> +			dev_err(xbar->isi->dev,
> +				"failed to alloc memory for ISI input(%d)\n", i);
> +			ret = -ENOMEM;
> +			goto err_free;
> +		}
> +	}
> +
> +	return 0;
> +
> +err_free:
> +	while (i--)
> +		kfree(xbar->inputs[i].enabled_count);
> +
> +	return ret;
> +}
> +
> +static void mxc_isi_stream_counters_free(struct mxc_isi_crossbar *xbar)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < xbar->num_sinks; ++i)
> +		kfree(xbar->inputs[i].enabled_count);
> +}
> +
>  int mxc_isi_crossbar_init(struct mxc_isi_dev *isi)
>  {
>  	struct mxc_isi_crossbar *xbar = &isi->crossbar;
> @@ -484,6 +558,10 @@ int mxc_isi_crossbar_init(struct mxc_isi_dev *isi)
>  		goto err_free;
>  	}
>
> +	ret = mxc_isi_stream_counters_alloc(xbar);
> +	if (ret)
> +		goto err_free;
> +
>  	for (i = 0; i < xbar->num_sinks; ++i)
>  		xbar->pads[i].flags = MEDIA_PAD_FL_SINK
>  				    | MEDIA_PAD_FL_MUST_CONNECT;
> @@ -492,7 +570,7 @@ int mxc_isi_crossbar_init(struct mxc_isi_dev *isi)
>
>  	ret = media_entity_pads_init(&sd->entity, num_pads, xbar->pads);
>  	if (ret)
> -		goto err_free;
> +		goto err_free_cnt;
>
>  	ret = v4l2_subdev_init_finalize(sd);
>  	if (ret < 0)
> @@ -502,6 +580,8 @@ int mxc_isi_crossbar_init(struct mxc_isi_dev *isi)
>
>  err_entity:
>  	media_entity_cleanup(&sd->entity);
> +err_free_cnt:
> +	mxc_isi_stream_counters_free(xbar);
>  err_free:
>  	kfree(xbar->pads);
>  	kfree(xbar->inputs);
> @@ -512,6 +592,7 @@ int mxc_isi_crossbar_init(struct mxc_isi_dev *isi)
>  void mxc_isi_crossbar_cleanup(struct mxc_isi_crossbar *xbar)
>  {
>  	v4l2_subdev_cleanup(&xbar->sd);
> +	mxc_isi_stream_counters_free(xbar);
>  	media_entity_cleanup(&xbar->sd.entity);
>  	kfree(xbar->pads);
>  	kfree(xbar->inputs);
>
> --
> 2.34.1
>
>

