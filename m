Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CF9C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 15:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+tpfRGH7i5sTO/wxbu6ryccPyRQKGQ/wc6pTrM309k=; b=yhgAi1TLnHfms7uFUw0rLUATWI
	dDQA7w61jB8eERygLVNJKYQ+kl8FO7kQDbWoXPFvhmjTtuVcDjKiAfUAHEz8aujpkkuJIyOEKnCS0
	PKN0y+RSZC4nMq0Sq5oatT9Ssl3GbEHgGl2/c/7GI4k1yCRXDqJkuFJeQUIBnnMNy+cMJt/U67PrS
	G3xgIglEGCNnTG8liED6DuZqCfMNMPc6NGsfDJh02JcGqQGAL4lReVHUACtGUHgQfrnb4B75If8yw
	E49F5GzYFmPyZsGCe0nWe8DC9fo9o2bibKoR5cu+lZ/PIA4968FPJBRjIJ5RAWx9zQC4609LjpApP
	IYOQcTdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thsJI-00000004JlW-0Mpe;
	Tue, 11 Feb 2025 15:36:28 +0000
Received: from mail-vi1eur05on20621.outbound.protection.outlook.com ([2a01:111:f403:2613::621] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thsHs-00000004JW4-3bAk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 15:35:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q4jZAiFuEt+7ry5VS0lIJwrH4+v+ftk8Vlc7m1nWKE3HRiwOIsoBR26X44ZRjD1R29c3xpp2U3/cYemAxsSt1eht39cAgSwKv38xI+kWUquGWs72zGtb7YZ8bguXnnP0aDAw/3ODoIcEsmEmve5Te2jNhclyt+f0t/noBp89htJUTXYfye4JB9ofkCzHaVTYwXiICu712l4u79oHJ0uXgn/Ohdi6KQMyyxvgIAyl2neU8/IZ4BLafmu9+NKXaACnKgTNS1fXZ0KAYM267zXb9NRuxd3m8V8GGTSgseneGoV1CgnrIVxnfQDlE+vYyCVHgD7hpKvBJ23PwsfYJ/me6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+tpfRGH7i5sTO/wxbu6ryccPyRQKGQ/wc6pTrM309k=;
 b=Jv+vMwn9tF5UwVT1smf7IuWnN8mPgMS+b80HlSsp5nFIabL677nmiEpBZU342fe6bYGCheNtt9NtZNBZp1mrzieKmdq/RhNcHOdbq5S7799MfYDxvIooyXBVG9dbz+rkHauFjQanPMKrNc30vF3aTD0WEvIlxhqghA2+YuRpB8R6udqnZfu6eN23VVO6/Qe2llE1XVBtINxOOAe9zkFnMe/Luw98KbcILerOnicqGgRr9UbHGQjWzQk+IUgmSBdqok0osEDE4xNkE98dmq67VZ/4EM7+ca39fz8/oa1X9YisF+xZOzeUw7kJfHXNABk5pKjE9fUPkhNJCgc+/yh/rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+tpfRGH7i5sTO/wxbu6ryccPyRQKGQ/wc6pTrM309k=;
 b=hG1hPQ3OZmGa09IIxFkco/ULN+aOs51qDu/HfTaRfcidM22i0vNJLdQ9OaikKv4baIO7EQudz2mNXN/FXbY+Ap5p61A9YKirN4z2Bb8ZL/SgVg29ZiL1A5K9edRXPxY1eKMjw7D8NGxbyDBwHev23lpaGgCjEvNL0uj58HggTx9eBrlIUZ1NDX1CqVlYe/uT95QL5lxdMCpoaCpKjO4v4k7SOSvCASEFt1kTjop4bByBMwTf897+QUidXGahO3LyRKozZrayK+tFH+PxHwkB9iPVM3ZUlOGBSSc3rIlrsJqOb189nAZcW4tWJt6R1h6CCWkd7UVoT/fqdNx9qDlcew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBAPR04MB7415.eurprd04.prod.outlook.com (2603:10a6:10:1aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 15:34:56 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Tue, 11 Feb 2025
 15:34:56 +0000
Date: Tue, 11 Feb 2025 10:34:46 -0500
From: Frank Li <Frank.li@nxp.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de,
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: imx-card: Add playback_only or capture_only
 support
Message-ID: <Z6tuFp9nZFMJMgDa@lizhi-Precision-Tower-5810>
References: <20250211035737.3886974-1-shengjiu.wang@nxp.com>
 <20250211035737.3886974-3-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211035737.3886974-3-shengjiu.wang@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0107.namprd03.prod.outlook.com
 (2603:10b6:a03:333::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBAPR04MB7415:EE_
X-MS-Office365-Filtering-Correlation-Id: e262086f-e950-46d6-609a-08dd4ab1a351
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|1800799024|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r62SAp022vLTI0lTJs9Ew+dmwg4e/IwbC8WyREdgVqB/Alqt0ytpufpgAw42?=
 =?us-ascii?Q?EwFVxk/5jeKs1AtXPaFltF3pkQHT6yF5IteacCPrQV0bd6zHmvonvWoeADUx?=
 =?us-ascii?Q?Fungp9Sq2Lh+SJNOZhrwgqTmmgXHVXYfo4vCE9UM9STEklqJOr7H5MDwPfKu?=
 =?us-ascii?Q?k64sI2rQf+LwGXgUjCLcVy6DWPVHSwjA/nsYcW9cE2giqFEBjr8aPvL9JFYZ?=
 =?us-ascii?Q?abOkgeK1rXrQPvSx843wM7Kq7q/55hbXm9fNMknQZMlb5dD1TwXs1DWON+1C?=
 =?us-ascii?Q?yPIzodhyENkhmi/Qo0qwBTEdVRff0YBuKOgbh7/TIMdQYMZ1NeF2wxoD+PGs?=
 =?us-ascii?Q?ltVBZm+d5kCGmQPz2PBfT5idy2i7SdPieXVL8B5B3qQf94cbsna0sbZAQUzE?=
 =?us-ascii?Q?MqiGcPBVSIYn4zor4kb45tTl8BaHp1LMSF2gJSHruXzVdNn1S5YuopjYyBnf?=
 =?us-ascii?Q?8KqHuvEASH45Mf7xhyYocyMTVTr2wJRb5vkO9woyGhB7Fu2WkS5AR+q+F98n?=
 =?us-ascii?Q?+ABl4DL1KYZySrj2Dl5QFDC2bSO2FW9rjZjPcBl/aGFwek933FRwfmlTzuI0?=
 =?us-ascii?Q?KD8bJCORjwDhO95jJXFnWhst5NKOQYFtwrsJGmnrBjwuPanJ4jLMZh9QGP7u?=
 =?us-ascii?Q?q+3H+QLX9rYkwr8d4BJcyAjtFM9gJiT0eWHSX+r9r1GUcQwcpKh0E9BVV7LI?=
 =?us-ascii?Q?YXfxsVgQcnOd036o+T9Ny41Fu3I9t66vw28/cbEaX/e1+ivOvg2uiEZngEi9?=
 =?us-ascii?Q?lCiUjD+RRuXO7nWaCjZhkzaYj80dF1yYk+OXGMEIYLfqggZet9gVdvJrZ18w?=
 =?us-ascii?Q?tIfJF+QplomTAuBoYPgBs6BAz6515zcjPLiIgUWYQzwo18sJvNhDJh/BD7Dc?=
 =?us-ascii?Q?BwxcXm5Aw89KPcVaXuUPJDpnOYWYs0ZYuvvnxqRdtaFPTfgj2IyQPs6W+SSC?=
 =?us-ascii?Q?RpGL2ubG/6qUkty+96vWw0hvVXNkq8mWIwqINNadWufEYkScLRNaO7OU830Y?=
 =?us-ascii?Q?pZqLm3a9TW9sTMYzPY6/rSzWvq0XjLoDAU5yLlx7YrPvQaqXCXkr+DBicHEQ?=
 =?us-ascii?Q?1Bwzf/kZ4ig2MIfmMMTCF5a9vdMbGTqrkcTYn9fc1rtrUktOm8MgZdq9wAng?=
 =?us-ascii?Q?lG8tHSHjjVE1YEDGlOYBaA1ZHQhV6PSb3FUETqmRJD7RmINHYCyh+fOI+BnG?=
 =?us-ascii?Q?7r+X4sg6CzQ2a/B+q4u3BpdEZiuHTvEReuKn5nnBx82MjzJd5yIuptrn1eFi?=
 =?us-ascii?Q?1W1G1ji8pB+VTGCk2IBNG2oE9eo5W0nWQkoKLcSYWKu2UDjs16/Zf1rsRpoV?=
 =?us-ascii?Q?cz+bqTV5hJBj0Qn7xZRyPPYuoOvZ8ZrAhOhq+0PoLESA8z7PNzg7pJjZHX3v?=
 =?us-ascii?Q?DyLKo38wfrws04zjZZvnCrbgtskKP+Jtrc9xPDPqRjPYv8dDPQzCRlin9bfj?=
 =?us-ascii?Q?vJmjWIiSZzKYNrq87bDqBQsNT2m8WVB7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GHfC9T3BbXRn1+rOA2zkgfIhMbDC8X2vC8RMnc7Ee4JtYC9lX8C26mnvEbSM?=
 =?us-ascii?Q?ZM6nbsRiQ4akom5qgK4G+koD73bmGLYYmdfvAp66Lg+svFatYEFrL36HvmLj?=
 =?us-ascii?Q?Z8sYRJHsvvLwcwBP6X2RmAZ7tc3kJb4vnrMOAmsn2XrPP8S1nQph4VAIi+N5?=
 =?us-ascii?Q?EdnKW3LY28PWYCKa9yApddV53QCe++zzJ16gsyvFN6xmsCGsijfr8tiJoSJ7?=
 =?us-ascii?Q?3hwBlK8Gu/Szme4oxds5U6bg9JHbPggltvNTKL8CRjCMX/2sRyuQFAOjXgzv?=
 =?us-ascii?Q?XIngbLJXr6S22UwrFEBxkdYKurNgAx+xILTDLDiiGX/XYkN/SKYfhq6B/koD?=
 =?us-ascii?Q?nMtDr6slqXP15bZEBJMa/kA3Cf4gBMe5McWHu0i82tgc2yYKGNz0/lel7coT?=
 =?us-ascii?Q?gz/IEQbWxv3RGDujGWz20lbhpuluIefro987UvrIVkjCgU+9tLPvqVy9hIWE?=
 =?us-ascii?Q?qt2TZmIncM3XelUCtHKbSH5s5PO51+1TzhykjJIlFk1HJd7d+6LG4z4p++wD?=
 =?us-ascii?Q?7XDkoC2OhoBL5InVxuTlD16J5MKif259bTjTxrgXKm/HOFyS0IXw03Mj0+Ij?=
 =?us-ascii?Q?kXz7nz8PTNOfFjAja2cC6aDyX/JpUnNhDC8iHT8NrBpv7PUTeRoRZo6EdJqq?=
 =?us-ascii?Q?iop85q56PW7Sa8rVa3eJT5A8389raLy4osYWWuh2WwkZ739MJdNPLeD7OqAB?=
 =?us-ascii?Q?T55rZzHJGK+vR0L+0KgbVWoB+MJzWlVLKlIe3Wxm1Li8oOknrCL0Q7fDNTG/?=
 =?us-ascii?Q?S8+J8tTVq+/lofs6sNoS07Z/McaGwIQL7NGpcAkfC100OnvuOVArS5wbVbMD?=
 =?us-ascii?Q?8qx0KIRIkmZRy7x64Cerhka+hYzqg7l2hE6zqNMuZwF9Sx2MR/KX9jF+TP37?=
 =?us-ascii?Q?dslo3SGW1DxVhTmKyAgS9wS96M6Fkr1sEP5qIhF+Y6hfOmTnV2qt7j2EOimL?=
 =?us-ascii?Q?pyvU7H+bB4vqD+cpvZHOV3zP542Gs0zFt2hIeHvIPQMyEUeJ/UfYku9RMhhI?=
 =?us-ascii?Q?gJaIbaQT1V3LJ472b27AM+4EeZA1MsxMZUnwE6KZwL2kHAb4uVyapTYXT6e1?=
 =?us-ascii?Q?oUFAC5DMz2HxvFgPnkZeLL2hwNjLYDdzgldLnYRHKEul9JCX/TVbgP+ufLxy?=
 =?us-ascii?Q?B6N/fzjTajaT6km6zQZQhhva/ccWBM6ak2JbuMGCMbCuGNljY9HNK4OzAo9e?=
 =?us-ascii?Q?NJO/dibK8CXvGI4CIPuNvoS9gZJryA+qXYgcri/bT4AoBM0ERIbzEZ17EXsG?=
 =?us-ascii?Q?rIqO4zckY/G8p5JPJvIFKB2SNjgw4zLjhDZgYtoCF9OY9utT7aM3xGviAKvi?=
 =?us-ascii?Q?9r/iPOAgPzlxZrbI4YuRJdjSEOPf9TalRUPCgXt9RZoLIs2qdAeCO+TH9as0?=
 =?us-ascii?Q?1jsL6lDt4tW4ot5I7vPU2ayOAl1E1aEO2+dDQoWJLYMQD0EI66yeXkS4BJyI?=
 =?us-ascii?Q?0OruynxE3agssV7NHRlv/f/3DztHg9kZCVn3xFi+9eDqpQmvcQhlDa+PX1ps?=
 =?us-ascii?Q?S3JBH9DsZoYWUEpO3i2o4TBID/bP7jCA5whwG8M1Oz4traOug2CfMcepZVe6?=
 =?us-ascii?Q?+CpfM53NdKykzC7QR7BckydQPs4IeORJDRWMH06g?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e262086f-e950-46d6-609a-08dd4ab1a351
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 15:34:56.7550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CpCvLBSNZuNInBlhDetmysEOvpfb/4WnePywli5qdibIruaKbzGNh73TuUGITJ/GFsrJTroG48I4wa6kximPZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7415
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_073500_902831_D9645DE1 
X-CRM114-Status: GOOD (  17.14  )
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

On Tue, Feb 11, 2025 at 11:57:37AM +0800, Shengjiu Wang wrote:
> With the DPCM case, the backend only support capture or
> playback, then the linked frontend can only support
> capture or playback, but frontend can't automatically
> enable only capture or playback, it needs the input
> from dt-binding.

wrap at 75 chars

>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/imx-card.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
> index ac043ad367ac..905294682996 100644
> --- a/sound/soc/fsl/imx-card.c
> +++ b/sound/soc/fsl/imx-card.c
> @@ -518,6 +518,7 @@ static int imx_card_parse_of(struct imx_card_data *data)
>  	struct snd_soc_dai_link *link;
>  	struct dai_link_data *link_data;
>  	struct of_phandle_args args;
> +	bool playback_only, capture_only;
>  	int ret, num_links;
>  	u32 asrc_fmt = 0;
>  	u32 width;
> @@ -679,6 +680,10 @@ static int imx_card_parse_of(struct imx_card_data *data)
>  			link->ops = &imx_aif_ops;
>  		}
>
> +		graph_util_parse_link_direction(np, &playback_only, &capture_only);
> +		link->playback_only = playback_only;
> +		link->capture_only = capture_only;
> +

if only use once, needn't local variable.

graph_util_parse_link_direction(np, &link->playback_only, &link->capture_only)

Frank

>  		/* Get dai fmt */
>  		ret = simple_util_parse_daifmt(dev, np, codec,
>  					       NULL, &link->dai_fmt);
> --
> 2.34.1
>

