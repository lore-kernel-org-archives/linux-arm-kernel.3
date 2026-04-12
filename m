Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C4EF3ED67
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 01:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z33xsKjnfc8ymmYn3GG5GpCRD+kV12fgUV85oozOpDk=; b=OTvyBzJ6KeVqcbQvmeB2zfc6rO
	EfhT1JWpWipfsdysWKYKIfHboRTghvHkIr9qLTfXl/virqoGnq3Mc2lDzHChAfXYhk34x6h768Whq
	ZNuZoQdDeIooRxuZ47AXeh0XbsPf4FX+rIOc/tgYIOYCGMT1qdTubCRWkgt4imaO8VJ5CsqMU1nTL
	hDuu8aiKjC/mK2yL46/PJ+6myiVsa0QP+I3ZcYjGauasKxN3/o9dwTI9l20/50VeP083ZsL4SiRbq
	h0OPPsjV7AvTcDxcQvN+iptzkNVW5x3vtDMVoHFlaiO25rVipkNCrZON/qC2+WdZ+O6+qtkfRuqTJ
	aS1g2zog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBjC6-0000000Dw83-47Vl;
	Sun, 12 Apr 2026 01:00:58 +0000
Received: from mail-westeuropeazon11013027.outbound.protection.outlook.com ([52.101.72.27] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBjC4-0000000Dw7j-1tUe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 01:00:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L8pwNqnHFnS/3Wa3pX6jiKYegXNsIkr2o+Xr0e01RO7rcz7oNepZ8eMFBkW5feN+aWzL76zIR0Bnzf1wI7Ft7ZXd0RSFMpwRhr9jgyUr07gqayJF1IHZFrZClCKAnIUzBQcBNceZXXsXgd6HwZe8gh7rjK0EiL9HcPu/RQt4qpkjlllhUaxNke7pBhfXv5w2cH3Yb0Ym/DuPPUxTAY2RLaDE0N6xewo75xb7s71Ax30PF8X6ahP8Rw5MDwig1YSSSV6v+lKHJwVb0jqpQsr36J4bb7k68JdRQiQpeUVv4sPlKAwmKxjJUgHTOEOow+oxDiPXnmWh9qFlxGdtu2vWxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z33xsKjnfc8ymmYn3GG5GpCRD+kV12fgUV85oozOpDk=;
 b=SdIgNp1gsSKZWIaFOyOkJYgEpKsV55xlwTJFSAsQ0laHM5higBWNDEmFHLQwhHhg58HtR61tS55p2QuatN0uDINb0AlLJLmk6MdcgKuRag2xissfW7Uj2eXuh9+fC91Ybv2s3bxdBnClAKgipxstpPMfhfA8x4E+fYbtOB8EfCw0oJmnyVy7xfzvnF8Y2ktNNkIj1cjULPtNtIDInCTVGhatYOLPNMpbzZDjZeCgCJ22/6Uxl8rMnsTOi/bkSvVb+S4JIbSb5d3IB0/RGrOR6Xy+sxo9dCh/H1V8o4mnEFwDQ5oIH40s3yP7TrKC9V1ADRvyaRNxyx5ft2b2Qg2PTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z33xsKjnfc8ymmYn3GG5GpCRD+kV12fgUV85oozOpDk=;
 b=KRlLsCprgEYaOmJkIq/5JbIB4KZkn87Z6t3kGXxBwT980GeUGg/cZNPvTezPd0upa5iCf2DAQak+uBPu9bBoIlvFxoJaW/jO3NuIrOt7oW+hcfbp1AM+Gym4GEbrydqpP5qVbnoB0jGQcb+27bpjmZqNk5ilHGT41mYVLFOI8Gzye84ZQlLBIZbeShTmno008U3kDN3+y4x3xl6I/7rKMMJ3c3MELRRriWK54/qvdJS3hiLdBREkCULjRaNWe+RQlb8zO8cWIGNAsEB+SePljWeInPzd8+DX1y+fPCemdURksARjnVUK1hW+f3rB9T2EhcS1s70LYlpJGDA1djYi2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAWPR04MB10032.eurprd04.prod.outlook.com (2603:10a6:102:38d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.44; Sun, 12 Apr
 2026 01:00:49 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.044; Sun, 12 Apr 2026
 01:00:49 +0000
Date: Sat, 11 Apr 2026 21:00:40 -0400
From: Frank Li <Frank.li@nxp.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>, linux-pm@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] thermal/drivers/imxl:Fix runtime PM handling on
 early returns
Message-ID: <adruuOUj7IpBlcio@lizhi-Precision-Tower-5810>
References: <20260412-imx-v1-0-cc3b45d63811@gmail.com>
 <20260412-imx-v1-2-cc3b45d63811@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412-imx-v1-2-cc3b45d63811@gmail.com>
X-ClientProxiedBy: PH7P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::29) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAWPR04MB10032:EE_
X-MS-Office365-Filtering-Correlation-Id: 63e8a54e-5a9d-4a68-295c-08de982eef9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|19092799006|7416014|376014|1800799024|366016|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: WL1Ed0G9IJRduD/qUkAZB9iFwiuzki8Pmf1IhbKJomEkfCi9BBT0Vdk5cL33JLOcStXBbT74u4xwc6odNtpkDP+zcDB8/MctQh96ble0hnE7aPS7XkXI7PiLFmlrIPmYusOZe7HWemiV1+rBpPBzN3+TQFkijuajv6zafi5RGNAD1q51zmpJ50lcyQS9qwutiHRtv0eSV2Wsar9RwxsIFh8X94GMuXk0LBLQdl7pD8k6gNHkY/Y+I/bt+l0VtQBbOWf7EdAMiwTXwD40NDuc85z33MIOzLGxQ9I0hwP2DPaGWdIb5w2znSXDp28m7+5PF44Dvqj1CuCL1GV8BXGCKkt+w3k5iEf4Sp51trDidGTT3Lh8N+gRnQjVR8xHbGtDABYggUngAAYbgRnbeLaHstaP3Swz2QUT5sI//Y7tlo69aqoG26Tho7y+Iww20bktz1iqSHnbyviZbltwWNuJqfcKdyxIXmCJzKuYFbIxw6uEglRLnLMe40aC10HbBK5Mr5HUzwZ3hOXl9MzUPu7vm8waVH2fmthmuxwxegHy6L7EUckBaBKb5HTyMPvBc9rC8p4O5QmjRzNtrRZCMTV24Vl5IH3JlMl5s6qhsxdqk6hFx6SQtI4mYrykUpfY9tVWzHBwhhnuHN1U1m2Q25rjLC0pOe49cIG7G/pPkxD/7lGXsnB/hX8/8T48MANUuwJoTdk1hS/YCbP6FbZdhIILex4Sh5A7w0rg7w5+DFgjXCDd0biH/MhMCoGTWCkjqrgVJgIsZkE7KdfXDdvopm5+dxcK0UVdWL75IWS62ueiNOY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(7416014)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yxYodxfHMgb/a8NEOIZ/GxC2hTYquQm3S9hUQOyz8wylSyjXrG2imf4Zpt6H?=
 =?us-ascii?Q?AN4Te/AdDl9Mcc3v0g2Rbb5bSJHrbBJzJRDRQTRPhj7t1xnM1BmDN8bLCuGD?=
 =?us-ascii?Q?xTi5yHmDq/nE9j8yx5zzKG5rvzcK17GBbwIIl7wj+j6HxF85qcSUSqJCGVoD?=
 =?us-ascii?Q?2OJ4ZPebXLJE8b+qUfwqbLUn3upYqbKdq6cfLZuYKSEUpE1F4NeysrjOnX/p?=
 =?us-ascii?Q?HQAqmdw2Wu+TraMfDl6C3DwxIG1U8C+q/Ueg5CsqmIn8zvXWj3dEe1Oz+1KN?=
 =?us-ascii?Q?2Pa79i+98RRl9s+Bczvxm7jV2KOkiXcwrnbsB9oj4eAT8ISTQRWfhRsW3+Yr?=
 =?us-ascii?Q?26TuJtg/zLlAaxRxAfRepw5FK3GUFxUL4XY3IMPZzdDtttzyW6liv83VNkq1?=
 =?us-ascii?Q?VlUidtdo4gvOMMYR3FMfm9bUYUub+41GKYstR1nN71m5Ss7dUMOpbiZDWHCQ?=
 =?us-ascii?Q?v1hBb5fkGZCtICCaLbkC0h2u4u6J4kq+8vCDBpLL4IftxUsbWB8fw/bRKjER?=
 =?us-ascii?Q?etYQfAz7sjNJ/HEDU/NP5UzKxnDgZIm5RkgW2tdf/+KW+JaFEQvCNTyNkoOa?=
 =?us-ascii?Q?TDRZJ4/14ki7n1K+7nQIOzUqj3boLmoRrbMRQ1hyl+5hx5FuC7GZqL6HXlI+?=
 =?us-ascii?Q?JO+0slpWQYIQejygzbLSXwWX9yOEisFgoEzCk0rlyMAXD6VvgdIjwGSzmitJ?=
 =?us-ascii?Q?QxBxOfFsDt4lVF0NHKKb/coyjGq0/Nc7KzxHChMoHzpuvCag9rQgxA1BWDhc?=
 =?us-ascii?Q?rbebZQrYyjYZyHxQmSXawoLtxdD3+T/NNySVpp3a1YOOpnnsJddae7zEYwUe?=
 =?us-ascii?Q?nNdB0krRTVbBiXlQS9dYgRbnc2J3g56irXWjMFG2JrszBW9VWoRetUQNJ9hr?=
 =?us-ascii?Q?20ZSLbVplWHOTjrBqTvIhGxDFozcf04UFz8U75Wl3o4wPzluLTeoTpxASeeZ?=
 =?us-ascii?Q?AiiccL1NdesK0STk4A2JhVpKx9t8R6hXRBlmTyIMyD+6ygpTDdksuEsBrt/p?=
 =?us-ascii?Q?YeV3LRmCW4ZlcCQ6i4/R5gpFMhDWPHveThDf38QBdoeUCjs8UFZe2dy73n1o?=
 =?us-ascii?Q?Q26TvAHcGGRJN8kAICXLByeuZo9oY+2QQiAAKQpCOJGg8t9GJd8EJ4eAqGCm?=
 =?us-ascii?Q?BF/dovL8jjpVJXeAlop475qwjz/UHcbKyYw1+lyJNXwZ5/rHtpfbZy7mHuRT?=
 =?us-ascii?Q?20oYwECrdCp6a8wEyCYkICkeePCsoRgVHb2pq5jxPP+NkZvNjxFj1gRrig2v?=
 =?us-ascii?Q?xn+mnV32TTpD2BIx38/wZ3bAKLS3Kk869sOBnpplnTavR8BkVxVhFbgAOuBH?=
 =?us-ascii?Q?b0Mnfr249RzMfiLZ1Vm/6ofTubXgYjfECXCkYtZfr6ZcwOtcy8ulO2W8ouYk?=
 =?us-ascii?Q?Cr4ZFkvzA7nu/HajEaiWJLyH34vr6fqwhpKT5TjqqMvkWQ41fchrG+neGc/c?=
 =?us-ascii?Q?AHZ6PGUlVUIvtSdoHZjNK3x+LPoN8l26oULa0KYlMjesVGeAnl+aBR9BL1Fe?=
 =?us-ascii?Q?pI1Mv4mQxiWsjHu2BH+J0bpyPjwhuiKdNw6UAzK5E21xLhQsmEgu3H0Dafzj?=
 =?us-ascii?Q?QiwFGXJgHNKBGVnqAPVJr0ko0q6ntueRm0bd2SD2sguwJ/1K9GMgVWEzMOTm?=
 =?us-ascii?Q?Fso1m6+WshDnO1VZWpdsGI7DpyVyMbElejsuqXsrKPSx2c2zBO1tcDS659R4?=
 =?us-ascii?Q?eYZPNIXIgnHuuA4TL63oUNFrQDoMxPWuX1ji2hDfXflcrZ6VmecnoWD2GT5T?=
 =?us-ascii?Q?cGwfm44F7w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63e8a54e-5a9d-4a68-295c-08de982eef9d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2026 01:00:49.0517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1tcd6AeSghCM8Fo54kz7RC3wkMkn45QNBwIYgxfW+6evcHCrIMEsQn2HySRSO0nxPXAJOmqltrCAVYQbv93dXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_180056_512966_99B05CEA 
X-CRM114-Status: GOOD (  17.47  )
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

On Sun, Apr 12, 2026 at 03:03:04AM +0800, Felix Gu wrote:
> Use PM_RUNTIME_ACQUIRE() in imx_get_temp() and imx_set_trip_temp() so
> runtime PM references are released correctly even when the functions
> return early on errors.
>
> Fixes: 4cf2ddf16e17 ("thermal/drivers/imx: Implement runtime PM support")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/thermal/imx_thermal.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
> index 68f9ce41a670..9d9ae7871068 100644
> --- a/drivers/thermal/imx_thermal.c
> +++ b/drivers/thermal/imx_thermal.c
> @@ -260,8 +260,9 @@ static int imx_get_temp(struct thermal_zone_device *tz, int *temp)
>  	u32 val;
>  	int ret;
>
> -	ret = pm_runtime_resume_and_get(data->dev);
> -	if (ret < 0)
> +	PM_RUNTIME_ACQUIRE(data->dev, pm);
> +	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
> +	if (ret)
>  		return ret;
>
>  	regmap_read(map, soc_data->temp_data, &val);
> @@ -302,8 +303,6 @@ static int imx_get_temp(struct thermal_zone_device *tz, int *temp)
>  		enable_irq(data->irq);
>  	}
>
> -	pm_runtime_put(data->dev);
> -
>  	return 0;
>  }
>
> @@ -337,8 +336,9 @@ static int imx_set_trip_temp(struct thermal_zone_device *tz,
>  	struct imx_thermal_data *data = thermal_zone_device_priv(tz);
>  	int ret;
>
> -	ret = pm_runtime_resume_and_get(data->dev);
> -	if (ret < 0)
> +	PM_RUNTIME_ACQUIRE(data->dev, pm);
> +	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
> +	if (ret)
>  		return ret;
>
>  	/* do not allow passive to be set higher than critical */
> @@ -348,8 +348,6 @@ static int imx_set_trip_temp(struct thermal_zone_device *tz,
>  	imx_set_alarm_temp(data, temp);
>  	trips[IMX_TRIP_PASSIVE].temperature = temp;
>
> -	pm_runtime_put(data->dev);
> -
>  	return 0;
>  }
>
>
> --
> 2.43.0
>

