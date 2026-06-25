Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57599CDE001
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 16:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/qUuySUP5X73d9RjT6LN4JM1jTe2UT2ivULeVpJCHU=; b=uMYZDmOqT2uT8fF7LtHuVTlR+h
	JDl3AjnPUPkcavzhJ3E3gz9Y4f2a/Im8I+7Lvm32hL5Q2MW/tADEU2pRT8+9tHOLjzC1G32BSAvKy
	pl3hZiNTjpOQHxkB+Aoa58a24s+IZzMf0de0PAyHP2LSYKDOqIXqrvtQG3xqJV2OT+O6Z/1cwD3z2
	C23GE/TLkOS0P3c+viX4OErzWGV9IWuJljHloPHfA5w344Wp5rbqAzQ28jAC450r2deN+iZh0SSYc
	1bCAspBi3V6iTRWu+uIREH+JQK9KQMkFGYh2a2/IkNNNF9dBAXGpthif8FZmLz8pCwwt+oJYvJpWG
	ltx0Hrsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcmue-00000009Tkk-1gvm;
	Thu, 25 Jun 2026 16:26:48 +0000
Received: from mail-westeuropeazon11010039.outbound.protection.outlook.com ([52.101.69.39] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcmub-00000009Tk4-3Fn8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 16:26:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lUzEZ0Bk2HAypICdUvJBHV7JkKiyeIjBquNRu8DZHr1e9uu1KbtoC4He3bGtQg9S4wH/3jJMpSvcFPNKblEurIaZ8oYkNb4N00HTfPsLAQ11DnWf7tYlGV7eZpoZDIlIS4ZpuyGtyxdrxOeL89GliSd5me2ckSB4d5A2994a/5wXOPsBs+kCoMMX/dzjMkiVvBxgMFJ4yaQ6VNVP4Ean/VQNQNa16+6+ZQXWlQxs+73jSnk9rraSxefmudtPMG05N87VKKu7Z2JmVKaxToUb9Up2U2YDx1Ge420nd2OoKPyjiPSFlKGUYEeR4AexKKrgAWOg5gsJj/ZelW+ifxaEBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/qUuySUP5X73d9RjT6LN4JM1jTe2UT2ivULeVpJCHU=;
 b=RRiAisxDz/KnEwngXMEa3zqxnhmq9w9v/AuQtuqTe9GeGX2ggDS6DD86WVwZo/OMUBDByyD9m7Wo9eSeAZOvJN7YBaPwPLzj4J25SW/Hwx1Sj4sn6WJroTVEz3eZX3bWRfGsse3vnDd1pFz1+B77n+nLaLeWWkXeHqBNB9YyjlmDLiGE46OOftM5NmK5570g32YV5UOodeOdH7FVpmmHl+AjZpwig49lLFHMEbMfhMSZIWAcguLkJ8rgR+wSqfPqb8md75eDIdBjvWVOpCHqZKLOHnpOxR9vfpCBcZn2B8/7//dLE+GZDXgJ3Uq6ACTqKKHvP5Ky+O8OclE/4X4RLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/qUuySUP5X73d9RjT6LN4JM1jTe2UT2ivULeVpJCHU=;
 b=cpVHS7OhpAWpV9vE3gopGL1M1Su257QIvh1iK7A3MrAkvOxn8GjxBnjO7PORsYKF/ehLKYgaPA3tzRgIh6tUAvtp9FA/0KaIMyUMbJz0RcVEAQ6e4WYGDHScvFQETFbsR2yvhUlQ8C+CqQyF5sdRat2tNt3sjd1woza+AJkzafVcR1uXnO5F9y6q0l07Rrm9bWMKbRtjHtwrj9j7hMj6CW1OpIYqivkM+44BJQVr2BRC8nlqPvvaXTW6HnjcQ2f4CSi/tyk61VtAkyFRBoIHupVW50R44pa5Y71MrcLCk6f6InBMzxz2dT+77l1HJ7SUm0wPwcLzCTmUl3ybM/XmUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV4PR04MB11329.eurprd04.prod.outlook.com (2603:10a6:150:29d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 16:26:39 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 25 Jun 2026
 16:26:39 +0000
Date: Thu, 25 Jun 2026 11:26:30 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: ziniu.wang_1@oss.nxp.com
Cc: adrian.hunter@intel.com, ulfh@kernel.org, haibo.chen@nxp.com,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, imx@lists.linux.dev, linux-mmc@vger.kernel.org,
	s32@nxp.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] mmc: sdhci-esdhc-imx: remove unnecessary
 mmc_card_wake_sdio_irq check for tuning save/restore
Message-ID: <aj1WtoGc-43LYWrs@SMW015318>
References: <20260625105934.2890635-1-ziniu.wang_1@oss.nxp.com>
 <20260625105934.2890635-2-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625105934.2890635-2-ziniu.wang_1@oss.nxp.com>
X-ClientProxiedBy: SN7PR04CA0036.namprd04.prod.outlook.com
 (2603:10b6:806:120::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV4PR04MB11329:EE_
X-MS-Office365-Filtering-Correlation-Id: 647e20ed-e8cc-4c92-c7a2-08ded2d688e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|23010399003|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: JVNR7Oaf7pnaRnAveyhnmg04PlH6MXLTjimd330X7CTD5IJOP3bLRbpcDUClE38B0zALVlLVbxdrnW6JoUgtw8TcgkOA0qXF/W3emEyLe3fU9pO8Jc9bOnhDJNrSe3As7q7lMdWle7l38wn2WGycBtSl+e8oEP+PU8SzrCPWASCDS0JhqJ46sCP669GX9JnHaTGOZ4b/IDQnZOKLv2IBtC+/R/fbgKbb5WBR8DisC4OzPwePcdv9CiPMfN/gCFvL1Xk2MuuUtg0QNRXzJF6BiUIDDQ9sL4XOtnWIAv+P9SIwzCZkKLJGB7MSZspEgbl49xi+1nbl+vqrKmdntybsC4WvSnQfCamvtpMD8pD52k/n4k4Ts23rz7cMoQSYferUJk1lGLgYAnKEiixm79cJeRY3JT8AkO11AbK403wQlNW2BVZO9zucpjycMr/E81rEcEdGbLbPkpIR1PEGiTJjeARGkl4mqOJyy0r11FniKhgb+FnnSoOLDfWc1WB6TUfOFYr+8PIJ0rjJpldhvWXjdZTMgB+ulGwlvvxr/++txeleiXaG3QDdnIOMTkBNGn0OsKNc5v6I8E24wdeA0b/MFquIXHPwThtSEbVJoUsjQF7cwiXv8F+1A0jpFJg466DUOzirCOx/FK1cdiP4nQdFQZrFUX4rkpsZv9qhVcxs/44=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q5+b+axUDGst7zUVq7n4LE0ERn3mnClYB1/TYrLwrdAyAmqxOUiJHBW+xCH6?=
 =?us-ascii?Q?Zo/N1Umr5pNwWoX8tf3nM5SdghxAt44StxqLJ03pj675N9hbcmZI2LxK6RQv?=
 =?us-ascii?Q?zLSmB4UAD+cogh0LE2Q6AEW3Zylc5eW3GuuJWvCxxZQXx331SkbuudCYpQDC?=
 =?us-ascii?Q?Yk61LvFZCSwCtJ9yZ+i4myfoLyPTco8u/bUEZM22sO7wLUc4CeKhDYA8/AId?=
 =?us-ascii?Q?WYRf0fRPQmyFRXvU5VKanQEqoPW2Rh5xZ0U300+H93cQRZ2dzK5EcvDEBtRD?=
 =?us-ascii?Q?KMDhPFgEUgqjhHsXqO3pX6iQu5NvmK97ikdOSnAmVDf7iQKS/9fnC7n13pdE?=
 =?us-ascii?Q?yPEDTI3LGZlOtTXA36nTIfaJTbuxTO3l6Kf1f6SmzR1yo0+iXchUzegSPTNC?=
 =?us-ascii?Q?W+aSGFypQyeIwYzuwFhenlc9XV1k/YzRtXYDbsaPso7Q7XU4PqqqvrBBsxcL?=
 =?us-ascii?Q?n3Eu/J0fw/u97FhNIQ7j6G515mFTUhVbDMuj2gE1jnbPtKtGbh2LQQFF6hct?=
 =?us-ascii?Q?jp/jmJQgBSUrnA2QGJ7t3NbY8MdjJ345m+zL2Lbs4gCTb2pmphYv94iV5O3Q?=
 =?us-ascii?Q?4cKmOPseTilbC7RjfjYzO/AfXxf6dhqJtdcIod3//V2VproakOe+FOl48GJv?=
 =?us-ascii?Q?9BdA2TPa9C8WvNuJszKGEU3AbDvyCIXXCUBTg5JqKclx6be521dYqdC9WVGo?=
 =?us-ascii?Q?3SEvg32saVfmV3esg22f1Or4aOtGoSrDd8zYchYZ0MCcwQHJ9EfQbg8/gWp9?=
 =?us-ascii?Q?PLw+SUEPczvr6unys4b1e2uJGQ7a49WyrQCT4aR/dt/r0v+54khC++ffWeKF?=
 =?us-ascii?Q?Q0wn6DaDSqw2ID88h9yDpBHm2hW2XtCOdSLROeoWCx6uG8fTFlA7PDeEu6HT?=
 =?us-ascii?Q?hxKsiZ2TvlduwLKrc+w1xDWPw45/uD0G+I4vOT4yAIsWE1qK3gvlH5rDB3zX?=
 =?us-ascii?Q?P4nUGZmmGslJPEHT+yVhG6KFx4fYrg7Z7RoSMZMITUU9/sVbzzmRYCnOMd9Y?=
 =?us-ascii?Q?zaMRvsCF8cH4duTw2SeaQBWldCoOLO7IwaPFn5/8JN2lrzdOMme2ebhJoVn9?=
 =?us-ascii?Q?11V6UR7OJRcAX6oEYeC8PmOTMCSN4lCUyYrg0RZbZECv2ttpPnwnl7ORAs6q?=
 =?us-ascii?Q?gi8Ap26xXyiYOIIzHw2AHOM7c+pXgSSsKnLqskuy0zO8rCVKjPCJ7ncHqQ8Y?=
 =?us-ascii?Q?pwyQRbqqoJnPJhDt8uN3a2+VltjMRerVRYfG8OfjNxAszKKd083sfsoU/Y4n?=
 =?us-ascii?Q?N0/2wE6+cJvFHgJ1TnIyvOPOBOuY5+xjjsIN4ZyEshaSFfS1rWKAbwwKqV95?=
 =?us-ascii?Q?bSm6eEQUOJkSul02+8DCHQfLVrhtN23KDunHDYsrUUx8SmN0/pv0p6FlR650?=
 =?us-ascii?Q?oHouRMCTFCisV47snUtMa4i11+QZR8X6x5+CE45vQSspwi6jfo5a3JPDp5Xt?=
 =?us-ascii?Q?z68p7Ko6Bl2rhYu98PkPTtE+5umevUio0942JapKAIzHNTOWFD0HSctr0eFS?=
 =?us-ascii?Q?ay51OS3/DDZ89BIM06TNRpVqDyjC7C/s34094+YnakQr4AsmkF5UpUaHWrka?=
 =?us-ascii?Q?qd7YAm3CYr4DTckyPBU0y35RXaaUbJIzYdYKYlsQK11eTKVMOEbGhD2QRLr7?=
 =?us-ascii?Q?DQZ0NdsMYeZ5RvIPVZBjE+iF+mShBT3J3V99Ho00b8aGKJb/Kr/PgEl+BWaX?=
 =?us-ascii?Q?oUmPoG+IgFK854aSLD798P2d8QQSaRA9C1wokU0n3GDpIZ95uf0DBD5zJIep?=
 =?us-ascii?Q?xzft0LOPwGlWsVfku5iGbARWo/D7aCF7Yc26usvNrafXEO6k02Ln?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 647e20ed-e8cc-4c92-c7a2-08ded2d688e2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 16:26:39.7588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 94JeUCDqwJyF+JSDfSe1aJrFRgp0k1ojytCStIKCUNA4uFc0LQQFvMKRXvkRXUrIphypGTRnsLxBKqogVysGl0DtSHIQuJ0Y9NfzTV0P/HlV5MUHPHpxUDABB6OhBAic
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11329
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_092645_894982_23012AC5 
X-CRM114-Status: GOOD (  23.56  )
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

On Thu, Jun 25, 2026 at 06:59:30PM +0800, ziniu.wang_1@oss.nxp.com wrote:
> From: Luke Wang <ziniu.wang_1@nxp.com>
>
> The tuning save/restore during system PM is conditioned on
> mmc_card_wake_sdio_irq(), but this check is unrelated to whether
> tuning values need to be preserved. The actual requirement is that
> the card keeps power during suspend and the controller is a uSDHC.
>
> SDIO devices using out-of-band GPIO wakeup maintain power during
> suspend but do not set the SDIO IRQ wake flag. In this case the
> tuning delay values are not saved/restored.
>
> Remove the unnecessary mmc_card_wake_sdio_irq() condition from both
> the suspend save and resume restore paths.
>
> Fixes: c63d25cdc59a ("mmc: sdhci-esdhc-imx: Save tuning value when card stays powered in suspend")
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/mmc/host/sdhci-esdhc-imx.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index 18ecddd6df6f..6526d65538de 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -2064,8 +2064,7 @@ static int sdhci_esdhc_suspend(struct device *dev)
>  	 * to save the tuning delay value just in case the usdhc
>  	 * lost power during system PM.
>  	 */
> -	if (mmc_card_keep_power(host->mmc) && mmc_card_wake_sdio_irq(host->mmc) &&
> -	    esdhc_is_usdhc(imx_data))
> +	if (mmc_card_keep_power(host->mmc) && esdhc_is_usdhc(imx_data))
>  		sdhc_esdhc_tuning_save(host);
>
>  	if (device_may_wakeup(dev)) {
> @@ -2124,8 +2123,7 @@ static int sdhci_esdhc_resume(struct device *dev)
>  	 * restore the saved tuning delay value for the device which keep
>  	 * power during system PM.
>  	 */
> -	if (mmc_card_keep_power(host->mmc) && mmc_card_wake_sdio_irq(host->mmc) &&
> -	    esdhc_is_usdhc(imx_data))
> +	if (mmc_card_keep_power(host->mmc) && esdhc_is_usdhc(imx_data))
>  		sdhc_esdhc_tuning_restore(host);
>
>  	pm_runtime_put_autosuspend(dev);
> --
> 2.34.1
>
>

