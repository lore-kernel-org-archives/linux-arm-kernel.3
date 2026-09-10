Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D985C79FBB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 20:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZ7ZXsnCUAQTYC3E96kxY/lFhI1O8FPk1ZGcdlaqnBI=; b=1GpC+ar48vp/6x+CiYAbFthG/j
	nsvwGbSVhf4Lquwpc3k6XLvOdxa7EWDZDn2Pxe6JxSCS8sfV2yxOlW73zyKBGJThF4Rv9ZH1/IFpk
	cFT3DCYBzln4x12OQ6fVPg0mpkW7Z7Eo1Lv2wwDkvJRZLvwhovOC7t5cRcY0+2ILdMnpk75W+1zHD
	iHsAxc25fxTEymaCfzd2/SKVlcEhDZC8RxP2BQJivhl5M+XKyU3+rqP3SvyqCKWqdq0Z8+bnXQWeW
	SdZqkdNyQfBK91G8MAIeVOZO1dEVaFtWhGZVpGq3CfAF5tTE80B/BCgrbrc6pBgLUn4V2O64DbDVc
	5MzxDgAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4lWf-0000000FLiQ-1vjd;
	Thu, 10 Sep 2026 20:37:41 +0000
Received: from mail-northeuropeazon11011021.outbound.protection.outlook.com ([52.101.65.21] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4lWc-0000000FLhp-3yw8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 20:37:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h7VSFgFuMGFB7hD8XQ0cb41Qacnd/sD4Nq+UQ2BxdJlMKLtma8xwrUO6F1+884d7BdNI9ezvvj3ku++Srl8qhexIqmtHEB7Ntt4i6yezTcIHfPuiPWd4nGVFaomlvh2s4fdBRWjgLeT3kKj7WIqRN+PitmfSjg03jDisfWyqRbDrxozbP4jPcONK1ukfQL+D5AqXX4Rlk9gFYYiVB9d/U24xeavctfFNXWqU1lU7eBpaO+JHmVZkDu6IiXwgkG2+TZhK+Lfxha7O8R+K5zMMlOSc09c1oShD8JPSx5R5eDI8gWSfcGqtyqGV14vzrlcpKZQn1kr+9wNYFfo/WI4ksg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZ7ZXsnCUAQTYC3E96kxY/lFhI1O8FPk1ZGcdlaqnBI=;
 b=OVGBjPKR7zlQcCWgg0EWf002Q8sb78u6U9wa381QwFa6Ec7uc5lQLPMb/od50UZSConc+m1C4nObZdtkBQyKNjDSRTWrmQr9uhsHmestKDvxuATdzx5LxuyDCdK8980zLFK+h2INqioEzlCi3VsSEtHCtHxtjpSeSYwZzgkomoJkdNZPIlPwF17XLneFoEnIKPhzwHBhgMScSCQIBkDwA+qiEAha7Auh13GylBCdRp0Jtj9q2xp2A/SzCVURQky3QCI5gpDlrB3LjY1KoUuxzNgS5x1ndmY08/1axfuKJgeF/+zpdHnmyNongsR+IDKZ1FH+Jvz6A+rbXRavbchFcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZ7ZXsnCUAQTYC3E96kxY/lFhI1O8FPk1ZGcdlaqnBI=;
 b=fVa2YKVRFjaf8VcV5e9xSWWHg3Fv8pr/q+eS3o78qe6w29az/C7y6F66Y5VE5LDeiM+ubs+yEYLqgjpN45UO7qwWpBxCbyawMdwRhbJK2VNyREd+sT5u5la55P42JXXNyavr6KwORfOjqvUdskZ5rtTb1rKTRFLb+hvpQ9UYIK9DVyxGzIgLR+pbaGnOIN4xTt284a2oLkBGiZKDR+Qy9CQDZ+EHVHkrstt6X6F1LxJHbhmyY3Z/Z5k18slKj1GDjdT257x8npFXD+zlGA563kPrVEs8vK8ALr5xdwkYRwpWGj/gCBXJlGYyB2LU6SNn9owoL5qDe3lLuKJ1h5le0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8745.eurprd04.prod.outlook.com (2603:10a6:20b:43e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 20:37:34 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 20:37:34 +0000
Date: Thu, 10 Sep 2026 16:37:25 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com, lafley.kim@chipsnmedia.com,
	marek.vasut@mailbox.org, Ming Qian <ming.qian@oss.nxp.com>
Subject: Re: [PATCH v7 4/9] media: chips-media: wave6: Add v4l2 m2m driver
 support
Message-ID: <aqMVBbzCnEsxx54Y@lizhi-Precision-Tower-5810>
References: <cover.1788496816.git.nas.chung@chipsnmedia.com>
 <235b2de7057182d619a361dffc247f1c1f438a3c.1788496816.git.nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <235b2de7057182d619a361dffc247f1c1f438a3c.1788496816.git.nas.chung@chipsnmedia.com>
X-ClientProxiedBy: PH7PR17CA0072.namprd17.prod.outlook.com
 (2603:10b6:510:325::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: 97a80ddb-eb4e-4d54-dcfe-08df0f7b57e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|19092799006|22082099003|56012099006|4143699003|3023799007|11063799006|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: X8jR5XTVS3DR+uzV3a5i7/Gb5AZQAElB7F7G0Cxaup3CgLuKN5KtNheS+sv/FNF2jo58WMG1D0F4HgL3d+WhorOtFF9kYaHUb4+xOrO4eIiPz63dnmQIVqSR6RKZCKz4GTRpdBrCeCrYoaTnAFpI2hb/Hq7kyvKlO9+gheYE6eCGjC0tJVWhPJw0pYHf/ZKnKEHBPvE448cdPOL84YlN25m61QYvI1JQY2iFoWGxLNX6/S9OdFqNF4ZA7VEijdcV3RvznG0Bd+NxlO7BUGlPEBBtXCNYtj+TFZyZ96eLEEkzfDMcpS275l3qIf+VSeLLRyi/jVDGT3g9Kipdur0WJjSYoZrPqpHRxqG2PICTse26tso1BlqJBkKenNyiCO3aqIMssJpQ5eBHLcDfdpZ3ViJK86/q/6qp55OnvBy4BxiN5Lf0a1qKEunf2tIjMjidM3SdhiI3Uo+xgYFQgvECM/e2+ostarF0p8kjN/BtOlNJ7y3AaRk39C51W1BZIUzMWnOfKRebSB7FiHNvjlv0BJJjLMOvWw2StaX6VQh3h09Qwur+gDaAtbh5jRlj6x+sUOXR2YPfkt6+H48GzXjgJlmiv434/3/gF/Ix0+R7YLxDOnVzm2fFoWrKna6IrD0RZfruF3QZq6zB69MxN8DQM8beB+f5q0A/EJPg3AodUAU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(19092799006)(22082099003)(56012099006)(4143699003)(3023799007)(11063799006)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p/CBQxa7ZXstuOMr1AJr0alGjeHmqTUInpyOt0SKn10BSlqvGhv6NubqRABU?=
 =?us-ascii?Q?2LNpdra1jqSr00PqA8DMf0+q0BUz8Z0aPWBlDOKf0u7+rQYCN0pc3EeR9agG?=
 =?us-ascii?Q?zaZ3AIyO4ArzzH1SmRRxSL84TiKfdAfkO8xR9soJCmFakoZHswNVv0dqXeyT?=
 =?us-ascii?Q?Cj8Slg4LZ0KLnTxB0/neAuXTdhCS3lNH7yZWY94VZyUILnNs5CFPN6/gmGWN?=
 =?us-ascii?Q?pcAnT9fnmxg+ywqWB+TO+NNaUtKr8TlsYhz/m8OZlYZrzIItroinQs9mDFoU?=
 =?us-ascii?Q?okCdVu2hZmwzxbDbn0jAO8Re6yFyA2Z1ERr+zXNB1f0ZwfsmdOrYaC8rhyKi?=
 =?us-ascii?Q?qKsS3DK090Kj8pCrT20zA9CuCBtZDZbbj9ZT7uaYdrkt3sjqr9inP7UZD/0c?=
 =?us-ascii?Q?yW/J7f2LB0a6VDyKRb0Lum+GLROuxJ2XEMLnh0wh2wJ3yU7WF6QGslzEdIt8?=
 =?us-ascii?Q?ArJNtrUiwmNK0omnsQ+sBTa6OmC9yxnwlQ69xLyGj5eaUwRNr3GSyLMEtvX7?=
 =?us-ascii?Q?gwJ1m8IPhdnHQeB1c48gcn/VCb+LqC0NeFFxrGghLG5bBidxGb0QK3w1JEuj?=
 =?us-ascii?Q?kk2uUQa0t95OxwPjTOL3bD9usrb0XWG0Xa58jcQdUJBxaPsIIGSe3eYplLoU?=
 =?us-ascii?Q?zMYxxkpzpjHA5nnxwqK4WLZCQQvhveD18sWGvYyZ2Y3tp//8aX6VyFgMJ0J1?=
 =?us-ascii?Q?/vmZiAQL457q3HseHV/Cgd2ZKNLMlOob6W2yHJMMpj0pf9fFri+Pvs39RF0j?=
 =?us-ascii?Q?6aI8TDahoLnQXl7/u7uBwC+kpRbTzUJS4hoBcAy45JS3lhrP2h3Q8RFOlI0P?=
 =?us-ascii?Q?gtQZ094R0eLuewiuv6XNpdmR51pIHSLNtJ10O73av3dBdhXzzaV03Q2PnXfR?=
 =?us-ascii?Q?VG2bzHdzJbTM5AE+CGSr9ddu2zuwgfp046SxjtF7yKefyWsUoqbs9bSdYvb9?=
 =?us-ascii?Q?SPUbdw3dW6+OPP0SxZuZiCO4738e6XZ1C3IQK2eTEnECzc6e7fRIH24ePsPl?=
 =?us-ascii?Q?MrO4xa2frlu2aX/cFnLNn5n81cuamdj8/Mdb/wa2Zw3yLw3tuiT9EhoTunbA?=
 =?us-ascii?Q?x4dUKmNN0lnP6VcxRtoPmOAb5gx+VO5Wg5cv4JQ+g7f6Tlb4JIou450buHt8?=
 =?us-ascii?Q?kubIJ+5c6gCBlqqHGFfdfCmTVuOrQvEdjxSHX0XYXsCpiZJL5/kNtG+tneCt?=
 =?us-ascii?Q?y8HX+TD/R5+q1H/bQ2bWY6+jF5Lqb7z7SoqW8RAXJVpUDn7kkeGGGC1drTO9?=
 =?us-ascii?Q?KkBhJkQrUi/K9HiLgvDNk46LrHpThVPCC3yKuj31TUQyr0jAveajOjuckM9X?=
 =?us-ascii?Q?rOAAQqJSz8NuPnRqb6WfjNuqGxR62Ug4QvWFDm1HY74gybSrJ5fzFGrGdj/S?=
 =?us-ascii?Q?Oga/m7148nhA1dtsQ8PF/GjF6rh1BDym5Ga994O7/mW2TKG2sWC1TwbKlW+H?=
 =?us-ascii?Q?j6vL3pJJk5IoXl4TRTSBCW3AGFHD06buwgWn7iKXMNlHDz6ZP+//TP96ADsm?=
 =?us-ascii?Q?CuS30bqMxC0NR8+kTyuTB/5uv6MEI9VNlIODOpyUIJwwhV+Xpm8hYbSVDzNt?=
 =?us-ascii?Q?ymcJUYa5ywI2zoZcV+uPxU4SeJK6YfWPdAB9moMBiHyD8ojAb/WCWWP3Wl0u?=
 =?us-ascii?Q?tZDfeIC1k5hEhqTHO7d8E9EvrVbHDT+bBnMtRZ/Ko5MDAV1Kx38e+eGieWWy?=
 =?us-ascii?Q?iGhJ8Xz/X1m12xp63BR/S2Igzcw06X3Fu0ZVd1r322ThM98j2sbtKR9blPw7?=
 =?us-ascii?Q?l2bsTFgG/6HX6RffzHsPn0m2bC65EOMhxgpopB/GlBcK7DM8D54R?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a80ddb-eb4e-4d54-dcfe-08df0f7b57e8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 20:37:34.2164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqtb5wOAUb9pTCsNZt32Sj0/v1HmFXKeqfxHcx56B1iZBtXBmnzbi8TXetCtvp5cEoHKhkZtWFhEg8iX8jwwCcx9n0Q7K7Vg09+/WV1d95GMiOqIroVX2nbCNGWpH4Eo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8745
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_133738_993665_AA43B38B 
X-CRM114-Status: GOOD (  15.62  )
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

On Fri, Sep 04, 2026 at 03:46:30PM +0900, Nas Chung wrote:
> Add v4l2 m2m stateful driver support for the
> Chips&Media Wave6 video codec IP, including both encoder and decoder.
>
> The following features and formats are supported:
> Encoder (8bit only):
> - Supported codecs: AVC, HEVC
> - Supported input formats:
>   * V4L2_PIX_FMT_YUV420/NV12/NV21
>   * V4L2_PIX_FMT_YUV422P/NV16/NV61
>   * V4L2_PIX_FMT_YUYV
>   * V4L2_PIX_FMT_YUV24/NV24/NV42
>   * V4L2_PIX_FMT_RGB24
>   * V4L2_PIX_FMT_P010
>   * V4L2_PIX_FMT_ARGB32
>   * V4L2_PIX_FMT_RGBA32
>   * V4L2_PIX_FMT_XRGB32
>   * V4L2_PIX_FMT_ARGB2101010
> - Supports multiplanar format
> - Although 10-bit input formats are supported (e.g., P010, ARGB2101010),
>   encoded output is limited to 8-bit streams
> - Supports crop
> - Supports extensive v4l2 encoder control
>
> Decoder (8bit only):
> - Supported codecs: AVC, HEVC (8bit only)
> - Supported output formats: V4L2_PIX_FMT_YUV420/NV12/NV21
> - Supports multiplanar format
> - Supports scale down
> - Supports dynamic resolution change
>
> Note: While other versions of the Wave6 IP may support VP9 decoding and
> AV1 decoding and encoding those formats are not implemented or validated
> in this driver at this time.
>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> Tested-by: Ming Qian <ming.qian@oss.nxp.com>
> Tested-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
...
> +
> +u64 wave6_vpu_cycle_to_ns(struct vpu_core_device *core, u64 cycle)
> +{
> +	unsigned long rate;
> +
> +	if (!core->num_clks || !core->clks)
> +		return 0;
> +
> +	rate = clk_get_rate(core->clks[0].clk);
> +	if (!rate)
> +		return 0;
> +
> +	return (cycle * NSEC_PER_SEC) / rate;

div_u64, otherwise 32bit compiler build failure.

Frank
> +}
> +
> +int wave6_vpu_wait_interrupt(struct vpu_instance *inst, unsigned int timeout)
> +{
> +	int ret;
> +
> +	ret = wait_for_completion_timeout(&inst->irq_done,
> +					  msecs_to_jiffies(timeout));
> +	if (!ret)
> +		return -ETIMEDOUT;
> +
> +	reinit_completion(&inst->irq_done);
> +
> +	return 0;
> +}
> +

