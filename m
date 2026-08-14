Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE322C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 14:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/1grzznB+89bHM+0PkXsL38SBuOhcx+in+EjSS4JaY=; b=chQ4POS8V6bFiF6oEPYW3RGg4y
	h0OVUEQa7NV0HSdwaOi7qqztxLKERh0jj8ISWCAoasLjIkw/Yey68/JwKHe36AZmVYZcwOyJ3bWjA
	b2TBEfkdIV8lmp6fAOmN/RLRr/GV3n0bx4L/AsJ8Q9dOAj/uA+pDtGM62NixBHxUXVCDkQKoxAZUS
	lAqfqwi0P4cbkhec/la/vdTSw0Z1kXn4iotgJ/j6dsKtWAnyXJRPR/L/QHLpIQCrCpgpRBPSyWcN7
	sJsMPqKzg0tenxcXBZcxw0sF6vGBVznOVZajNVJHQpT5p7kmiNus9KxfYbLPoqvxtqO6buAIlP4N5
	1XKIsbgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wut0g-00000002npn-1BoF;
	Fri, 14 Aug 2026 14:35:50 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wut0e-00000002npC-0JqT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 14:35:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Db8UemO9guQjN5m/1f1dkUtPJ/NM3Z9ek8kQ2c3imEK89sqOZhfRdgtj6Nte69jfEiLLgMc36S8QcF3GNNoPrujG23rw+21+R/Zf8mxyZzbYnLnNezuw7AJKHHO64fBZ5n9olfOk0tVnp4Oz/g4lzFn4HlW6XALOBenezFtUsqL0TstpONimwgVElHvI5M2NOdZhxukbZeeqfTdtBucb+TiijDP5RFB96i8i3rfd4SG3+N9E9Fu6WOE3DOcoCnP0yWymoal1vpOLh7M12Y2WhXpAbh/PQLrD6+ArF+F5YARYQ5C3aJauxqUWHnkoaDFMh79G2YHI4D8gycU4Zf6DIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/1grzznB+89bHM+0PkXsL38SBuOhcx+in+EjSS4JaY=;
 b=rKE2P/g6YtqKNQgtYcPSNXGsk0eS2NFxcsjD77dRhf+16YaIGdOB5ofcAVbgC4wz4aTsdof4LvYCB7Ak3U1d6/IaXKg9Riwhak3usFSpMlDhD+jmHZGh5YEYHfJAHwYLjBJ3RmWhzUxG+3It8ZadpsTt9LZa7l6PP5NnVxXtP9T5Ml3UIc58dbZL0WNPfCFYn2ygUeSyY31JYWXOcHMDna9M5ncXsJBKf+t/bizZF/9IHsgKl7QPe7OhOIynDjKOeyC/e7BWZBSnTAptyTkknBG1gdFZNljvIOdgVChKgyljkzC1w1V1/Dk5WEfwtXm5FnxZtbEolZzwxpsCiQjfMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/1grzznB+89bHM+0PkXsL38SBuOhcx+in+EjSS4JaY=;
 b=vsxdMgFVpx7Uqnih0ScvgGe+kmX2hN2FDzXMwtlExdtuVl7G3BBabW38CC/tJHNvsyv8iTXbl0tTDVoNyLacFwOLiPgsRW6T5GO7L0u61PFFDfm9R6Y0mo024qKec/Hy+cJP8l8nnYv/jX/uzaVg10GJhnetuEIk+ylE8hphN0ii0E7AYLM/BYsLeOvQmZuZOltF8MHdlO9dR0oFi4XK/U1ka0OfTuVNDQDJoghr9wEvTrHSezrRECJJYEkWU2aYveg8HWcal9d72EGrWeLG7Dm7HwFNchBiUVtZhWaQhmdcoL/uNjuSijzefmFdiER9oRSpR5GBdvLfktUqcNgoXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10978.eurprd04.prod.outlook.com (2603:10a6:800:27e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 14:35:43 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 14:35:43 +0000
Date: Fri, 14 Aug 2026 09:35:34 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Ruoyu Wang <ruoyuw560@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>,
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: mxs: fix DMA channel leak on probe error
Message-ID: <an8ntm6GRhFJnrqZ@SMW015318>
References: <20260814134033.1386874-1-ruoyuw560@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814134033.1386874-1-ruoyuw560@gmail.com>
X-ClientProxiedBy: PH8PR15CA0012.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10978:EE_
X-MS-Office365-Filtering-Correlation-Id: d62b79f0-0f82-4fac-6376-08defa115222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|376014|7416014|366016|23010399003|6133799003|56012099006|10067099003|11063799006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: BpGKuPWfTxRgwmE1UWpIGzh3oBzJgPK+9s/90ObTBbSGXoI0jJe6umWb8jcvulwd1VH9OJKyWRthkSs/A30Mm+YRy+AVcvLpxEyr0VpjuMqUuPXpzksjjUBJo+wNjYR5LQtPPazGI80Prk54SiahRkAXYuyusaCRaWQdka7o3HHVlv+Vi9GlQGlZTd5k14RWfuqiJ2r+2lyipWjx0iJCk1ybCtLVVxWuvd7SA4knx4T9e2f8GbvPcBMJS1ZNZIJWVoQ2nN7u75AwZOWBBuQsBt95jSu/IR2/POYyPGVUr4g7MwD0jGMJVdpT+3NXNt2fbWtmiucCzWkW6TfSwUlVMSQItaJPEyc9i/pvB5wXsjllysvlMlPErN19rA7MswVZWzcacipDos5YnZhStOiadBfcA6/aWCCtnZD9PTFFnPdNbT3y414soXt2d2h9HzKwMjHUvIafh6/LS9oSRCjAAPKgCH1oqF52tvISz2UQvnIcCBQw2szI/vTTlMe82wF3SJn22/DdB4F/WrXeq/Z4JsJSuXGR7JkSx+ZjAq+J5k4EH5IG8aqvHwDXdfVWfsFR6EduCVt3RZPcd04l04FaFBQxyC1g+K+l48499mhMJNjRQldLrSJkGQForASXQSQn2LCPdzErOcoUm8ZJUGBPOwOgeSO3hbvzD/TmxFx6ip4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(7416014)(366016)(23010399003)(6133799003)(56012099006)(10067099003)(11063799006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8jy7HRYdOkAM7W9YXGWwRCmyvOvoW0+vIEH95T7YpqpX8KaGCpUTXqlajCgy?=
 =?us-ascii?Q?Lbzg2Yy0CGOkxopQIfa25WO1QNJ9y4NeTp2ft9EYFfTbLYi2n8EBaLPo9BmH?=
 =?us-ascii?Q?bZC4mvKTvSImRMgRkP3P2JAGqB1zZkugj3fTYVX2/JaJHZi2x8TQPK5eWcip?=
 =?us-ascii?Q?l2VYYtdFLbh8p3BZUz0YGvsAIIdthjDtlPx99YbunFZE4yX4iY+QV1fl62k4?=
 =?us-ascii?Q?Ynfi/X/Ir6//YZGdEg9/JwqerAfhQSI6Rd/w3RsLwsLV1JocXo1WE/r7sDyb?=
 =?us-ascii?Q?2xyp6vmm/rLyaMDM8HExwHBOHHwHC+z/8rnWy5sVJRCr+fIm+QRng4fGGiSz?=
 =?us-ascii?Q?OTHfaZq44ELhyq1jcw8XQSh4RB7jdmtWeUaEVRyzStE+CyTiSfgJYufE1SyL?=
 =?us-ascii?Q?qzFUXgfkUihLr4OcYoyiqwdvs/wfyA9wf7R7ksscry3Xz7HPSqNqdwZoUIxf?=
 =?us-ascii?Q?CYOQMZkSDuGKaV3tY3ezLqGvHJT9VLb75KMkc7kV6mKvQz95wRhwrQ0RREtw?=
 =?us-ascii?Q?MsMeOYomJvYVA3Z7QTaH8bVtS3/wOZltHzbnB3aD2oTJMejz0iXYlOVBqRCl?=
 =?us-ascii?Q?HMsJ3LkPncbgERamxF17XPSRN7l5/fcal8MYcbtKd0ir6uSxNs2Ay0Q5p0Fx?=
 =?us-ascii?Q?B4qTpuGQ5PBAdXgY8Fn/zf3F3aVEHTxhrUoO4C63bzDsH9sPfHLgcM3PSamF?=
 =?us-ascii?Q?PKD8dmjYvJVX/1Vp17alXQrh1XaH5VpBtBVOcAhhdUb36pgerRx2sp7cT1jb?=
 =?us-ascii?Q?KFZzU6cZek2M8nzR1c7smG356YqYZpSqllZyiUDJ147pOxq8XElkw008VXRr?=
 =?us-ascii?Q?iRAuojpoqruxDfObEnJ77rgUcEoOeltAr0/yH6ow62o/sXuBisiKwgYUImOo?=
 =?us-ascii?Q?WvW7N7bwb3yFLaeZog4M7wsF+NNKXVH2N7XivW4Sil4iOE6v7VFcViIsiPBr?=
 =?us-ascii?Q?NqzuqsYvm6/PVcVEp/bKV/g+pATzu5MxgWDwieUvxuVtd2BLI3rs17iEJzHY?=
 =?us-ascii?Q?OrgzzX0LrwurIYMeiaROh7cffwIbg9VL7zY0lJsGAaCH7zebhUB3RLTU7FpA?=
 =?us-ascii?Q?E4OZU6lnRf5TpVGMnQms1yyBusXbNz2T38q77zqVj7cDwOkOUKAmRKf6t9eQ?=
 =?us-ascii?Q?Zl4H37XcuJfTAqJkMcQZu+eVq4xeJkx7H2SmcvLrPbkSSvna0xuu/F5uLTZB?=
 =?us-ascii?Q?RrbhDYM5GIEgKcAKpjluAl6ZPOs7jp6vKhnyQ/nk7azPpehrqbzJLvSvSl1a?=
 =?us-ascii?Q?l8mKf9rgoB2noNNkjfB+tYmL+qG1lwd0fF2z2hYwcG65YsI7pSgb9xpKWBPY?=
 =?us-ascii?Q?Z+X1R+cKWijneBhea0a8pFmqJFRKWohMVjkqYKUh5qGKNAqr1FmausPZVrGg?=
 =?us-ascii?Q?0b0uScGjhTvf8oUGdemYLruLXcNL1R4CsNpojujdLkqjXUx38MhWV/wEgOBm?=
 =?us-ascii?Q?hvjrHsyoIxT4Qwm8F1xQMaL+O9U6Rhf19XLEHjo6Nm+yujA39UmNPtihgWs5?=
 =?us-ascii?Q?oD5lS5aelt+EBbgw+pVSwWlzMLPxarLU0DciSZ5gkAevmJUmZn9WRqi0MN56?=
 =?us-ascii?Q?Pq4QRB0S2pQaXopHTdHDxKh4XrqTN2o0XtVxmSStTRyklM5OY2j9iESeAzgi?=
 =?us-ascii?Q?9ODV+FSv8B2a2UVF7Q/in6s0Gi0vA6z5ti6JYUV/CNiCYe8Yi1sKXLeqXA7Y?=
 =?us-ascii?Q?PNhhypt/ohEUSu0Fas5Z9gDYcylxCHg9IO4iutsqTDmLl9vFKwWC29O4Ym1q?=
 =?us-ascii?Q?IBI+xhg0SmRjIjh/XSRZjjrLDlMsnGcnO+/cu6r6pA0qqBDymNwO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d62b79f0-0f82-4fac-6376-08defa115222
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 14:35:43.6057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yjj1owo3VoDEYY2kBgCrlEU2e8TIvtEVo6xwjQprvFeUheg4erF2uHmr5t7gkCeY0BP9PGzrkkpp027xLs+2GxdIDZ9V2H/xI9N9R9m6cAtF4e7OIowrR352Cqm8+ZxH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10978
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_073548_150734_DB1BD340 
X-CRM114-Status: GOOD (  24.03  )
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

On Fri, Aug 14, 2026 at 09:40:33PM +0800, Ruoyu Wang wrote:
> [You don't often get email from ruoyuw560@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> dma_request_chan() grants the driver exclusive use of the channel until
> dma_release_channel() is called. If controller reset or I2C adapter
> registration fails after the request, mxs_i2c_probe() returns without
> releasing it. The failed probe does not invoke mxs_i2c_remove(), so the
> channel remains allocated and can prevent a later probe from acquiring
> it.
>
> Release the DMA channel on both post-request error paths. Keep the
> adapter-registration unwind ordered after the existing controller reset.
>
> This issue was found by a static analysis checker and confirmed by
> manual source review.
>
> Fixes: 62885f59a261 ("MXS: Implement DMA support into mxs-i2c")
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
> ---
>  drivers/i2c/busses/i2c-mxs.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
> index 4e07babea9c3f..a5c8b44ec8142 100644
> --- a/drivers/i2c/busses/i2c-mxs.c
> +++ b/drivers/i2c/busses/i2c-mxs.c
> @@ -849,8 +849,10 @@ static int mxs_i2c_probe(struct platform_device *pdev)
>
>         /* Do reset to enforce correct startup after pinmuxing */
>         err = mxs_i2c_reset(i2c);
> -       if (err)
> +       if (err) {
> +               dma_release_channel(i2c->dmach);

Please use devm_dma_request_chan() to fix this problem

Frank
>                 return err;
> +       }
>
>         adap = &i2c->adapter;
>         strscpy(adap->name, "MXS I2C adapter", sizeof(adap->name));
> @@ -865,6 +867,7 @@ static int mxs_i2c_probe(struct platform_device *pdev)
>         if (err) {
>                 writel(MXS_I2C_CTRL0_SFTRST,
>                                 i2c->regs + MXS_I2C_CTRL0_SET);
> +               dma_release_channel(i2c->dmach);
>                 return err;
>         }
>
> --
> 2.51.0
>
>

