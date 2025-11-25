Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FA3D0EE3D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 21:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=driN3gQ+vgYqrovLXKaWVmBgemdqIgrh+XAlnLz7sPI=; b=g1MV34AqV1usKuAiaRbI76xpvD
	LG4h8sAHP67BGTt92DU4bo4jxDI8VrfiVnuwe3oFQ52MuHDlIMJpwStT5hvVd+TwYoGDC5ZFk7Z71
	2jo8yngl+Kw0o02WP7T93L2IHtPG+k725RQeY+DaToOh0mN8btbWC/yUKSWQqmImHR8BhFKEqYwOF
	pWvw8Qjg17r98an1RzDb7H3AO505MVEdAEr3/m1pgKWcMo4yJZKceEeXxz53kKp7u3JWts5PxFMb/
	hIcjwa6HGkiXTT00G1bgtDV5fGr/ov6mflW4rt5xvs48HVFVz6LJ0vgI8xZUoUuE/DJ0KVosjnIaY
	OC92c0wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO0Nv-0000000Dwgw-3So9;
	Tue, 25 Nov 2025 21:15:39 +0000
Received: from mail-francesouthazon11011047.outbound.protection.outlook.com ([40.107.130.47] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO0Nt-0000000DwgP-16y6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 21:15:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdFWNp4fQ3j80ZNsKhmeZHFTHoHPHazK6ZYtSl0bknwz6lRMV6YFk3CHy8/B07t8vXkdru8SeDllv0zRMCxN0uOeCe8gfyQ0xAN2xQxLMgdF8bBonK/3zRiu5fPqwE3SYaBepa576YCMWgy+LwqlILmJFraDELiXh9oJ6/TGrQ7eCpGnmTaal+6t1rGzg6IHZ6mf6lKxh/WNTRr+5meseL4Ibyl7+MjxYSsovlCjjPQT7vUff/JYnTsMe8ZwxiJih26r6RpR45Rj+vEWEhMviCQ7B1phkp3vaX6UdIuejYqXqVo5iW5XvEb5JSZ63dszwS5OjkgBsylWdGMPunI3oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=driN3gQ+vgYqrovLXKaWVmBgemdqIgrh+XAlnLz7sPI=;
 b=ibaN/0vtLFKI8wPlh/MZE0lyewWBzEZoF4+NdM9JkP8NT8zElvk3BTD8ELK0rVzoFiJQ3+mwnwQ0LEGy9EHjo2sXPNE6qPll3VO65IRfpfI40Zv1dYwY0q6LCvm8IpT7hP0f0naXGnGCMgh+PLmp5y2x+96uHx0cS9S8BWK7atO1HppUJHYFldo7pcA8KpFjTzlc4iV90WyzahHr9OchiIn/GjiUE73U23901J1wdpRUJfh/hjRE/m/gXnsc7W8jVR1zeNQDXSw3TtoT7ew6LmlTLR7XkP+HZSWF5jDQKATaciwYv4gWYX1lErfzJUN7a9ZGk5mTrqqq0tDE15ZcEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=driN3gQ+vgYqrovLXKaWVmBgemdqIgrh+XAlnLz7sPI=;
 b=ZhgXSogSITlSKHN/BcLLnv2WjFkB0noNWn8ACGYJ3YzDjHgIkRUwCpboS8EKjRWV0EKoMkO6X7koqodWKmRuMHOYAaoMj0O9QS41s0F2BdHLYEtZCo3t4YKIYPLgc7GJFC1CwH2h7trrBHFdI+i6AkdSKjtpQX+xhb93rV8kEoEG6w8d8mxEQOUnI23A/zC1S/VUzhKPnDAe+fOQpDLwJZMhjkZ8LMXdwgDXIozDD9dYhOz+LWZ4oI0ccISZZBIFne9BuvQ5xRME+0oF0dL050IvbQ0Q6NIxBcm9FgAtZnNek6ZqbwTTO71H3Bh5xyZCEfzYBx76NXgrhaqnvqp4BQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by VI2PR04MB10931.eurprd04.prod.outlook.com (2603:10a6:800:271::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 21:15:26 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.009; Tue, 25 Nov 2025
 21:15:26 +0000
Date: Tue, 25 Nov 2025 16:15:17 -0500
From: Frank Li <Frank.li@nxp.com>
To: Ayush Kumar <ayushkr0s@gmail.com>
Cc: slongerbeam@gmail.com, p.zabel@pengutronix.de, mchehab@kernel.org,
	gregkh@linuxfoundation.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-newbies@vger.kernel.org
Subject: Re: [PATCH] staging: media: Remove unnecessary braces from if
 statement
Message-ID: <aSYcZYDUsJ3jy8cR@lizhi-Precision-Tower-5810>
References: <20251125202331.36505-1-ayushkr0s@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125202331.36505-1-ayushkr0s@gmail.com>
X-ClientProxiedBy: SJ0PR03CA0122.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::7) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|VI2PR04MB10931:EE_
X-MS-Office365-Filtering-Correlation-Id: e0fd8ae9-1c13-4ada-58fe-08de2c67c0ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|52116014|376014|7416014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9iltRz1vXFhhKOCFKL6FOkLPskOlSU/ugTemCCrN7CZStS+IlYa1nhLkNKPT?=
 =?us-ascii?Q?shAxZafv6ZHN0f2a/82R6xs4ooYQcCW7ehlXIuBBAZ+WO++7D0oewNkNGJRK?=
 =?us-ascii?Q?rY1iDnV+Gvq1xHc0cSjz5njFKg9vHDNTghi1r89d4cKQxWgS6TfpnxIwJSyv?=
 =?us-ascii?Q?n6aV1gjp+0AYkrKHd1Rn/0n74L2vEvSvRJ7G2XxAMEFAn49VKML+MIykeGeO?=
 =?us-ascii?Q?CbCyJioNGXbAMxkt3bJ2DmKpq4vKFLrWazpWK52S+bIuBFnExbPr++oWlpxX?=
 =?us-ascii?Q?nX2iv3DonOTPwptGiuryu41ZzKzrH2GPAzYZQPYAHviUtzkaRvV0HSI8qzbb?=
 =?us-ascii?Q?PqxyHB73cabzWF1JtLNQhGQK95izaXMPAQGTkxfIFaGvIojBzcI5HEBeQreI?=
 =?us-ascii?Q?NTIACeLscqn1FcQqx9J6ldYyDfDqTyIoG2HNzM7CNZ6e7t+iazWnORp3fhF2?=
 =?us-ascii?Q?O2q6Rk2+Rq6BF9YCQp7dgJRTG0zqVIIq1ngOgqk8r2UiDf3zhtxnRoXiNvy3?=
 =?us-ascii?Q?0wEv/nAjcrcGlQ04rEIlfZckrPEAHczgFeXNBDBkfZMdSvWlBjTAK47XAhTF?=
 =?us-ascii?Q?gbsR9bDx5/awHehHcad2dXdul697WKqUKSL7KxullqGdastd99FwNDTvEMsx?=
 =?us-ascii?Q?gp1sSGLMTKUFCwwQSgWd7a+YriK7iDvXMjZIlodSdaKV4hwy7/olIhTf2fk8?=
 =?us-ascii?Q?4orte8niyxW0uY++AeO2GMZ//szD2mEbB00yZUGCdq06lF5OlbZgHXR8XHdU?=
 =?us-ascii?Q?0/3AGdo6ZDKPIpGtdNo+8NBs5mATf7vnzHovreqVg8RI8Fo/0D3XfZbu36GY?=
 =?us-ascii?Q?wJoA5d6BdlnhRsr95I/Aifgk1AyRH62tM0cgmXLvpG1RG6dWyPliRzLuLw03?=
 =?us-ascii?Q?lW1pV31VpS2/01YXSXytlBW/a47QnRmoLHuwwsv4KDnFlI3+8urFcPYyOJXj?=
 =?us-ascii?Q?ewhtYrqV6YeHKM+NUg3BtLy8KRsXfQtjsHJpanfnC/iCNWXjTd/aEe8RfMYt?=
 =?us-ascii?Q?w9DLjyKluGznDlmKsCspBgshI2hdM1V80ublnUBNZYj3uk2KqsDTv4HFWeCB?=
 =?us-ascii?Q?g2q25twWcQG7wVBcq3BNunmkgVPwVKtM9MP+NNT0h4ftuSHdgoRPdV71GKds?=
 =?us-ascii?Q?NTMoIrt6TBFh9kpJSAHIdJzS2+KV6NggWseXYTcHx3A0/jOC32E0RUvxyeta?=
 =?us-ascii?Q?tkkRZtjVQ9gEH9rR+sL28qVhnONPRUPxnj6UlgPA/p7cniNzzNtO3LTrr3Z2?=
 =?us-ascii?Q?MXOfQ9JSAEuPDFiTgrSKBlHSvYLNNE/diOIkfZ14u4qozOpf4hvRHpHue/PB?=
 =?us-ascii?Q?/BUNcwik+IthKm3xUWFbXjOFxH5zBTIC5asVVDEdAFrCMVGzhbUrJCQ/NVPE?=
 =?us-ascii?Q?HL7u5i7pnfkfPpfkSVDB5OiO7ieiI8ps7xbsFSe45ONIm7Kmd+AwkmWYkCCK?=
 =?us-ascii?Q?mCR20fco2jGzxanxWJ7voDckabZSgPM7BHb0LSe0w9xvFRT25WYYqTr1ulqJ?=
 =?us-ascii?Q?iFXn2J7Tw4mAcjzJD7+ZUooagut5lRTtwb8K?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(376014)(7416014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q4rZ322I6s3E9hajpoc0XNY2yA9IGKNOOkfBWHGv7Gs8CoSoua5pD9PgNIKz?=
 =?us-ascii?Q?cE5IChjOWbBhUJRrPhA/zRQhk8jAblFAYHfVcwlxvYdSQf2aEugUJeoObfcz?=
 =?us-ascii?Q?zKEj2u/eTmpgJf6o0JU6PKdnKg7CaHwyqymPdD2IUOAH2iX1R4/6RyZMTdwV?=
 =?us-ascii?Q?cJJ9A808+ZFiIAWufdUfrICjWtRUdK4uCY3CglYWq41hb9KIXXa4gbhv9cTO?=
 =?us-ascii?Q?fcbhuaKH0bNhlvYrQFlf6dkNkC1i2YNhidP+nBre/egDzm10Dvfv7nMLq3/s?=
 =?us-ascii?Q?0JPUCl9mAV1LUuOTxwPLjWMjaO/5qzChrusH9zrwT4FQA7kRJuF6n1BymRK+?=
 =?us-ascii?Q?Q8lK/EY5Kuuz8KZOb1EP4O5TQMMoh4DxQ/q5JOdXgXPJDM6bkFmG+ihT02Nw?=
 =?us-ascii?Q?GGco4aJOw/40cw4QTbaiiE7nK+m6UU9afaw8iPb7icaFinW/LG1puyby15Lv?=
 =?us-ascii?Q?CXZucMPtJs7TultvH+pTZTrsk9ZJBde/UYsFIV4I2LHq5mc4UthGFrIg0Tnk?=
 =?us-ascii?Q?f4bmyl+ZAUwzTAipxFiHbDJVDPhID9LNdyMagXhCOh9YW/yB0zv072JNIq+0?=
 =?us-ascii?Q?THtN/OfjRU8VY0q66VZPdH0hx6DF3GcRcG1yCpn3aLrs8/KZXv1NL2dw4ZAb?=
 =?us-ascii?Q?5mTujcEAoT5gpjqrAJMBHBBZkHrWB4vACJ15xYVEg93U4jHKIQMcDN/ZKfom?=
 =?us-ascii?Q?4j+fZpQyCrYwSrmuyHaQ9Jcz6A7P0z2WNsd2khDWh8t3IV38qnWuMhdnvQRv?=
 =?us-ascii?Q?xIk/BFgXb83eVCuk32K7agjeOMRA6s7h5OaMyZA9os6XF2Fp+Xr0aPLUdQIj?=
 =?us-ascii?Q?LWwP7Qkcqi2GGajgnlipeiYfPNrkzm9IDmanQ39K0N3GgGjhvJWtSbHI3r84?=
 =?us-ascii?Q?Ffm7Ww2uPcIiviVAsG0yPAJynnc+VF130GVUMpoVeMc9iNpkvw0JdksiDPo2?=
 =?us-ascii?Q?WnOe0PzEi3biPqqCrteGfpDW/p7jK9CDdpZT+fxvQyPbrQkbJFOyrX5VGNd3?=
 =?us-ascii?Q?VQ1ALHx9q8u1A5tUYld/ZeY4tP3FVQ9gbraJsyS73baiuSrP6xl+Hxbr1s7W?=
 =?us-ascii?Q?gn4pRV3O9Co5fPPRKca2uMo/m9Wk5TVk+myYkMFAz84VviLYar6OJMk2GI7l?=
 =?us-ascii?Q?8yThhAuFAR0+rxhJsqKNp87gFppyRx/yoevY5law0Dz2N3wnh7s1pBWQpxNL?=
 =?us-ascii?Q?zmF4++B1h7LTB28DHcz2BPbjE4uBqriTKkfaY1t5YwautU1icfpzbHsWnojb?=
 =?us-ascii?Q?GqMm5Ukmpme2z5jjFxgO4CqenAIQNlbM4asOKGdnNuikTtK0bUzJxirxjqxW?=
 =?us-ascii?Q?8PyjO1ECZixIQIwBYMPWbVjHBz79gNMx6ewpfyIQmOy3jTLTr2S/h5H18a24?=
 =?us-ascii?Q?sSXkGQdUyFZ2pdubqs6gxqpG+rfGEjJsZnyslN6Un+HEuqk5gEzm1+8hpIPK?=
 =?us-ascii?Q?CCYplhEgcWX81ZfZwKFIw4aL1yb3EIYH7tg95Lpy7gPF8UuntFfAgbSt4Uky?=
 =?us-ascii?Q?8a45iJ1JwAr4OxcID6WJnJFSxSJMVk7SfwvSvpkhqcKf2T9GBbh92/SSzkzA?=
 =?us-ascii?Q?8Z5F5FV1dtoI/6mazP3JS0d50fDGjGF92jgdsl7y?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0fd8ae9-1c13-4ada-58fe-08de2c67c0ed
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 21:15:26.5614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WvSAcLNQviroEY/QDgSUmjuc5LFRhaf+NBfa2FGssaaXqweXHJBw8dDl+XF2cSIiZeVkyRpio8GxMmtVEA02GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10931
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_131537_310336_A774BBCC 
X-CRM114-Status: GOOD (  15.79  )
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

On Tue, Nov 25, 2025 at 08:23:31PM +0000, Ayush Kumar wrote:
> Adhering to Linux kernel coding style guidelines (Chapter 3: Indentation).
>
> Signed-off-by: Ayush Kumar <ayushkr0s@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/staging/media/imx/imx-media-of.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
> index bb28daa4d713..7413551052ae 100644
> --- a/drivers/staging/media/imx/imx-media-of.c
> +++ b/drivers/staging/media/imx/imx-media-of.c
> @@ -57,9 +57,8 @@ int imx_media_add_of_subdevs(struct imx_media_dev *imxmd,
>  		of_node_put(csi_np);
>  		if (ret) {
>  			/* unavailable or already added is not an error */
> -			if (ret == -ENODEV || ret == -EEXIST) {
> +			if (ret == -ENODEV || ret == -EEXIST)
>  				continue;
> -			}
>
>  			/* other error, can't continue */
>  			return ret;
> --
> 2.43.0
>

