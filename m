Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4785C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 14:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aFEuiAB6On50xK+1XFljNyvw9ZXsH4xm83lUVn6pETQ=; b=MhOWbKVQEaeHojZuRJYtt/lEGb
	lVIdMI9+YmoMoAGsUx2NuqPHiiwRzOP6tX+sLsHOMErMdiTTQyUgh+rIJKMBM5VXJuFuN1kCK4jzE
	6/pZ7OLesVTtkqnvrEmngzrbBKYyMVOgAeIHNJ2yacodfcGj91eqs+Pd9OaDoGy9H3ylv/l/xC0Uk
	Do345g+2eBhHE3giGYAx6HZeodTclBL97Znz5YHd+5+F+VsnN0R2RZEyYhqdMD0Qa0tG/mMUJJgNQ
	tfrkuSLV6QqqhE/CQVYTC8Ln5QIUHeF6rOp/8XGJWDKEcTTABZB4SxqYJMLRb7/4upH2y61AoFVPU
	cef5hsCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojCt-00000005Yvr-0RXv;
	Tue, 28 Jul 2026 14:54:59 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojCq-00000005YvO-1Mmm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 14:54:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=omolo0djMOIGy85N5OCOm5oBsrdmnjHYOZZOT9HsDmP8BYAOeGniGTaX39BBunG5CaafpIIlWkxpueawuzaNR7qxBnuF+n5rFTSlEt61fhUqju9RknL1p4dWCfkKOqfi1MYPCutX574G+XxWedmlTdv6N1vOZ3hoLAZ+JycJ/08llApECqfYDNAQXvfQr/DSSc/S6N34ph94t8kPBGA1gPpqB/yaTOBz6HPE9dRbkd+1wcH22x6cA+5tpR+E6ptP33AjaqWpQnheQyzQJPCJakhZjYDpTZGxl8etfn/ew29d2hkNLe6GWYpZze0r5Cq9V4K//D/6KibdMr/X/TEixA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFEuiAB6On50xK+1XFljNyvw9ZXsH4xm83lUVn6pETQ=;
 b=FYfTqxO2xWpJOKJA7NrXYj6SCWWTRtKK3Pd9ZOpv0sJ6zdy4Hw1jX22ZSXtm02wh0EyvcqmWB05bZz9NqT/i4u8+rPc2jQcOSjPxI8rEeX1v9hcnq9aC67dGPPERk8mXr5FLlMVabH424765QVfe2B3kBN70ycQtJCSorRP1EbhAR+zBzMC8h00ewkDgIEm57nOgbDbrsBFtJzlq25pVhq30KtPw3Y9WdLDJey/8y+BhVsmkbPTSahOLM6L1fbDYPd29cF5yUtXjUzBZdVk3uJXTwD8YAEbp+DkbWqCFWcatMO8/bPEjLIKYicKrB1Bh53zkIbt0RcRCq5QL0aSOmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFEuiAB6On50xK+1XFljNyvw9ZXsH4xm83lUVn6pETQ=;
 b=VFzZYiUYRch31ATrElSBWoOng/hSzFVNV2HiV2M6pO7OT4fwgHo1Apy0k7RBPhhJH9xessFCzJSuxq1gCZYJRUnRKRw/pro+DOXNUZTd6MdqB5o+8g+LZYuBnOCU519yFEAX8DmQlr0A1iKft7ihi4aswpPzMZ4BBg+A9DM2pMnupU2niyrWNvH0WyoDJyVDchNNBpTBpIULxEwngzsONfX3Ywe1quhjB6SdEgAa0KkULioVwYbVqkjV3gfky4qpp1gpwJmnTUINIp5z2C5rH6m5PON2taVpeiuwiWKtlDkGnMuR46CnRiQNNB1+XtNAl5C+0Fs0KIfYqH5YBYDSIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMBPR04MB457368.eurprd04.prod.outlook.com (2603:10a6:20b:798::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 14:54:50 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 14:54:49 +0000
Date: Tue, 28 Jul 2026 09:54:39 -0500
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
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v5 1/4] media: nxp: imx8-isi: Use BIT_ULL() for 64-bit
 stream masks
Message-ID: <amjCr-Ium4bGp-QT@SMW015318>
References: <20260728-isi-v5-0-1d22ab91602a@oss.nxp.com>
 <20260728-isi-v5-1-1d22ab91602a@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728-isi-v5-1-1d22ab91602a@oss.nxp.com>
X-ClientProxiedBy: SA0PR12CA0006.namprd12.prod.outlook.com
 (2603:10b6:806:6f::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMBPR04MB457368:EE_
X-MS-Office365-Filtering-Correlation-Id: 954b0ece-f0ba-46e4-b99a-08deecb82c46
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|376014|23010399003|366016|1800799024|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: kfnA9hxFWy83hS3Z2hstecZ0zFt0HKb1CjAZuLFzyhHx9hSeerS9RgHrCl+b6x+wray4oFfslG207pj/79Q+wgGeX79aGqVpMymJvasAfsG3qKdW2gdybZD/i2jwc83ksoVzLpf49rFoGpX/B9RT4l0EYp1BJgxtHHMt9VG7o+jGl2o7891VGvTTsETkHkv4RkfO7yMTrSjyoLAm0d4j8FcaBMHDWdTmePRHSZU69hakjP3qxVjvYzFIOzd3pM2uieWgdtFlkLUUvWaktOvZYmfBIS9IllolCckpzqmavtYOTO+/IJgS69SVlHve7OoVgKIl7bjjorpXwklwNklb+PcKxXb9k85z7VNu3g0pZEHzgRZOzPcpQ6yutXZ4F2xILYpq+DtMcM2GS6EttiHsEbe+832D0YFWyDTuE+oTjtFpTukKGW36D3O/ARA+WfbanH1HEkwKrcGFafRH4wIgKmIW3144jHZGuVMxmyhQ/rfodXvP5L9Lg5P/9kzaYzhQlGXoEDRHx22ptIdm7ZDG3IFZFKI60eF0c9G1S8BRAGXPxHpcLPB5B16rVye4WKaqaR9zv3rezWsqNZXepE/Kt1M/JlQTgt5Ov0+ytC3FqJlVWPdiEWzyBXrb4ELa5M3MOkgX5MsZ4U5c9Xq2yQaTR96MZAHRduxb8Cug+UpMtfs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(23010399003)(366016)(1800799024)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J/BcnObnKmkZ8a6wr8/ysTUbaolR/gvytyua1kGyiNfcKwR0rrAa5vbujhIs?=
 =?us-ascii?Q?FF4T/NATtsD+FZ1Dbyxl6CGG8uTDHbwoluqXJYH843RQVuhAZTcGfgw1Jj72?=
 =?us-ascii?Q?MD0PL/yXaLm7ZtqeCIfMA/an6dTvkqYJ6/iWUiENA/7rLkkOosZ5D23jX+f+?=
 =?us-ascii?Q?QoDW1nSSNjlFOf99XetytJ5PPUwKvN69lYSBfgIINHZRK7Tzy8trRvyrLiY5?=
 =?us-ascii?Q?e8mn5lXDLBly6A8glDtimonyuu8yqsm3F4N2Sje7SgUKBmQkAn5gotrJCPKi?=
 =?us-ascii?Q?iKD4g6VutNiXA0nt0AhDPsUK43cHPFGe6zSgVXjXmtv26pPjxPnvRSHtxn6+?=
 =?us-ascii?Q?gfFWSs6goPI5NVrbuzDA2tWVCIMowicpUM8qb04iFkcqMm1d+B5VEHttgOR5?=
 =?us-ascii?Q?R7tJppJt30Nf1WTKOxBueAP2N42Zdv/Ui6gRUzYtK2lRNJJtnmqwxyWRCJQR?=
 =?us-ascii?Q?TZBLRS6fn+q0pSfNgWnnp1f3W2HbngrLPM9+SnbEIIvJcOugSl4bWbtUfoMz?=
 =?us-ascii?Q?ruYQQiYq6sUA3xCJeUYtczYP/0jJqyalOdpp/ix+mJuwBmPonc5AJV0GDJqh?=
 =?us-ascii?Q?+xv4h/ObypEp+Y2kJGd746jDIWPO3vtq4TiR5k0zyVWUao3Tg5owQTuqD6Rd?=
 =?us-ascii?Q?3SD0qEKazYXZfwOGF3X0v2Jzsg00lJaof7lvlp0Cfj2uyWrRvF/vKMFlv3Au?=
 =?us-ascii?Q?JrLjgbPgpE4fUc7+k7mZMGffHlDv46WDLEHziUpz8YJRMRq4T8uVRxvMe5jV?=
 =?us-ascii?Q?wLphMdwWMoWk8jKuqMs9GMqa603dvEa8nM+tzB5b+vhGukv/6yOJrdQaw0SB?=
 =?us-ascii?Q?EvgVub1UQo30vPUcM3CZWi2MYCtloHT0JEju7iAqoJnvnhBaxRqwjYzuei9z?=
 =?us-ascii?Q?L8nUHNHEOuzjNC1NTfkZI6Pj1Z1EKoTb1CNbqSlj8qScFWMwCJd7ELfBm1uH?=
 =?us-ascii?Q?21aux6XyOf7l8uqDFgYu25gHvHi3qJKbT6Wpdeu3X/n+iwbfzsYJruQMyYyv?=
 =?us-ascii?Q?7lBK6TiBeKJ+R1QODtNF9MbAmYcn9NAvCIf6jBNLGPtm24iW2iqjt4LkeEUF?=
 =?us-ascii?Q?x8/SjMj6Zx98iW5yxHWrG7Axn9NorTBAsx6oUl46xkwWYi46xvfF95CztM7M?=
 =?us-ascii?Q?TDvIjgR2vCFdWlrS588RS7AoJqYO7KtBbldrOvutZlVoLu+cKwaAgcHeMI00?=
 =?us-ascii?Q?2/omrQX67MdQ45yo01+q/OmNZp1d8KHotNtCEaiU0ybQTpu0aUJrTyPDyLMz?=
 =?us-ascii?Q?Ke239FdSjGMUfeb/7tsy5p4eIVHqMFLlC22FDDoB6sbn4rA+W0guNsDHlkRD?=
 =?us-ascii?Q?XQ8pdA5lI7b+FfsrqJTxTXS8anGU9iui//mYUeJR4HpnvvDzZMCoAuzo7Dh3?=
 =?us-ascii?Q?49Ns8C3PSSOC7QHsFmZXz+EBbuM/S7qHZxrivbwuiN617EA8uSAontLQ7w2g?=
 =?us-ascii?Q?Ig4MAM59mj3s4Sir/e+x13pqnG4sSmJyI06tmUzHO3i0q7DhfjE1yMGY421F?=
 =?us-ascii?Q?NGKOfyrv3CgiLCl8W2BWnXg/5LiBpRKdfCCXaPLC6ExF2KeN8a6jmjprG582?=
 =?us-ascii?Q?BsAdfcZkwm2PN2HP12NAGF1jftDSQzkqB5wX0haU0ln58YJHdQy/uALXBdxW?=
 =?us-ascii?Q?h8Wx9JpGKEEr22UXm+KNTY7Yq4Fs2buYXp3mQ4pHUig30hf69V5EvzLE0mWY?=
 =?us-ascii?Q?vJHBnvsZVmy0KNCx5L4o2TlqUrMwpGgQhNX+fA7AyPmubux4Zmm8TdheUI0X?=
 =?us-ascii?Q?n4PerkvpMBuXbIU4xpEPKw0tdQ03vqFcDAioWEo8TN1CdqfkDD4U?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 954b0ece-f0ba-46e4-b99a-08deecb82c46
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 14:54:49.7135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KPuYcjo9YM6aVu75LnixxG2iobXU6t3iQlDO/MzdGHlaUs91olfZCr3KZ3QrwdUEax1tmK30bnU87cqe60gMHcDrKrIa41F2N52Qf5AjL2VTWOQCITbMTAr7OuAAmgEp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB457368
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_075456_373658_8ADF15E3 
X-CRM114-Status: GOOD (  14.97  )
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

On Tue, Jul 28, 2026 at 02:58:56PM +0800, Guoniu Zhou wrote:
> Use BIT_ULL() instead of BIT() for u64 stream masks to avoid incorrect
> results on 32-bit architectures when stream IDs are 32 or greater.
>
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index 9f0231ca47a3..9db9c6e55c2c 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -157,10 +157,10 @@ mxc_isi_crossbar_xlate_streams(struct mxc_isi_crossbar *xbar,
>  	 */
>  	for_each_active_route(&state->routing, route) {
>  		if (route->source_pad != source_pad ||
> -		    !(source_streams & BIT(route->source_stream)))
> +		    !(source_streams & BIT_ULL(route->source_stream)))
>  			continue;
>
> -		sink_streams |= BIT(route->sink_stream);
> +		sink_streams |= BIT_ULL(route->sink_stream);
>  		sink_pad = route->sink_pad;
>  	}
>
>
> --
> 2.34.1
>
>

