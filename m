Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866E6C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 07:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/vPL+QRTAJRy2jmMBpBSnLHtWSz64IfzWyzEz70uZKI=; b=tFQ2FAATbdRz5zSW4Hk+8V+mLc
	VJG9qz5e+77861fozDZhkh3OiwLwy61DtFCc2lxa4eT2XMrlxenMt2KDK4sQZ5iwRUaIQ+6jnOqgq
	UaRUv2Y1S8doIEaqp3wx9MKHgwurUSJmY/5RObDTo1QHjTViAdlDpLkVnscHDHRyOpeAJbILHZvXb
	+E9WWZWo8nxJt/e73hfiu3f4AIvEC5AxtvO9oZol45N8gAjnWXkHoxoRYJrzVwgn23VJkZbx0lvBC
	i866ALhKTyP060Xz9da5GkNM0OeHEz/LIygBM9UJKbcbzjGckPUuHD5yzSvyVKe0H32Xt2wlZl4Rb
	IhPmppmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujYjt-0000000EX3y-3jmR;
	Wed, 06 Aug 2025 07:39:10 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujYdu-0000000EWS0-01Z8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 07:32:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fJewFuaZyBaf6BRSev9s3+fNs0GD1RvuyKdhQ3MVu4V3cE9FCTKAD9IT9EqOQ7IIGgtZoQ+zwHpJEcnQ1ma1pmmMVynI01pzEF2H7peo+7e7xVOGaUj+1mxBC3M92ZMPDe6SdSmC1CwLtNUQhPMy9CWpKyzV0N6XX7LU/7oiNcVm/643cAV/DGEeXXnVDfqZHRihlx8nY4VvwrSXagHKxct7/UF8C2c3oKFRE3VUG+Pm5NztmSw2vTlq8NT2xr+0iDiHr3JAwL7ZBP5wCOmIvAKxyoPZKR4kTUI/gBNl+jLMpysl4G7kfXFQG15KioiVcQ9+G1KmKGJUuC6nb3pHoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vPL+QRTAJRy2jmMBpBSnLHtWSz64IfzWyzEz70uZKI=;
 b=D/DUWCGXYaSw3CXjkJcJecGCkTLEFlMrWh//sO2JvxPoA0zu9Zjui4PRH4tQEdBZgzdTgzgcSi37Qa71ZH0DsGLc15JG/yoA7WVTt7PgIQ3/xqU50AxtQctkPu4qMe89L6yxqP9eimQegIcp95NZiek1rwfe+XVV9qzs3UC0TAIzia2YbGTgqNHbBoB3M8MgSXVEIhHmyLVQYfWlteg32DkrPFqd8oAbwOC7tEvdX/vxG5OjeakX3RZjCyR40LOiyglPO4w0ikm187IX1bb3ayNlv+VVzyP1UiPvi2goqtZdgvh9n1lPMuDoM77yMkcVHxbYsxi9eIaFVUmhG+WAKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/vPL+QRTAJRy2jmMBpBSnLHtWSz64IfzWyzEz70uZKI=;
 b=V96sT+G7g/CWbnZ4V/7NC8AXwLOWe0IO5cdi/tOi1AzT4u4+vxjWfLfgFk3p0tGcVtzhnKwiaCeFPkypwgm/7F6GiQmH7ZHvzofPRRbaG/6PlZTndDJgfe+lvASYjEDZuST2Cvhssx31u1og8J0SvUdi7j1oC1WRlubDb5sIwkFbsS9HGhBLyRuw7GYnFz31o4rKpe2WyobwiwEyxsDwT4fJgYJJXpfbYtdv2AaeQ+m8LYsjVhK87BBMMONHvwOIDeIKwZCNtIeATS4WfwJzY+ulEyEe8jUsCVbenAQp00Ms57JvkIrqh/ShOvgbJRrNP+OZJbrRWDlDnhf2paB0Cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by AS8PR04MB8136.eurprd04.prod.outlook.com (2603:10a6:20b:3f7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 07:32:49 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%5]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 07:32:49 +0000
Date: Wed, 6 Aug 2025 10:32:44 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: Lucas Stach <l.stach@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"open list:NXP i.MX 8MQ DCSS DRIVER" <dri-devel@lists.freedesktop.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] drm/imx: Remove goto label that are only used once
Message-ID: <od4kpr5k22jruqa3gk4mgbcte73wlhmew7nep2xumo2j7iofxo@nd434suk47p5>
References: <20250805074645.625911-1-liaoyuanhong@vivo.com>
 <20250805074645.625911-4-liaoyuanhong@vivo.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805074645.625911-4-liaoyuanhong@vivo.com>
X-ClientProxiedBy: AS4P251CA0013.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d2::18) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|AS8PR04MB8136:EE_
X-MS-Office365-Filtering-Correlation-Id: dc15dc5c-8b6e-4a9d-91af-08ddd4bb71c0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/n78zpbEMTonzFdk7ZiD7lpFh649ue3GuXou1/5FdJBjX7TW+fEncAzmcXzA?=
 =?us-ascii?Q?0TJsGylNFiVrtYFKxMPRwHikGvdDktxQN3qY3uiQfn/fpc/7VhbqnlkJT+jp?=
 =?us-ascii?Q?Ru1Bctkzj/HsV+eCZVkbLnOudGjY3Fzp2F8witPyKO7z1ksHFHrggBrTatiG?=
 =?us-ascii?Q?lhIzo6if2omypBSBKUjLm34GoGOXjEikb7YT47zvDaDIviM58zhyqsDnVKBS?=
 =?us-ascii?Q?yTQqA817sGLR9ZRJG/MtFg65T60OxcKXtwNZHfarEDtV8TXJ5KE7Zl38i1RK?=
 =?us-ascii?Q?ep4oKAUcJBbjj/3o8/v41BM0ZCGIU9d8g6DUYymgTZnvQz6P5ohLh5u5LuC9?=
 =?us-ascii?Q?Jy1LwAOZFHNxnOewD85TRlb2f1gi5FGSquvoH/5dtZ8Oj/BmAlSkFVtGbaMf?=
 =?us-ascii?Q?wFOcbfG7UU/RM5XsZTy4E+kdpl5uElDozOTBoFyDuPXkzj0sTgujQB7ktJZP?=
 =?us-ascii?Q?sAuFNugtSo51ygbStiPIACkYojTMDJNUFYu3lgk3cpkL+D/voqi9gW2GVIoR?=
 =?us-ascii?Q?i+q7ulooz076zM5yfTM2IqRJ+JJDgosozhEg9qBt7d6YByVEM5uueFJo0+wn?=
 =?us-ascii?Q?NBKpXI+MUtRwvAbEZU7DDebYwVpQTmCbgOvtt8BYbz/PbtRrfmhcZWNIcwDJ?=
 =?us-ascii?Q?P/5DriKKVimXzHCPxidAyuKAPgfDH2YSATiB+IPQl6DeqL5lbvMgWGcPuA/H?=
 =?us-ascii?Q?sR9HyM9Cmhsn2UHXuKIKOwgWbL0see5O0EMj1nibtQYJ7o1h0kCLWScYJBkg?=
 =?us-ascii?Q?+F+AONo0tXZ0IA9W5ksJLM5hNqcib62kgnb7EpjiRFhLDqSdPk2xWLtTIUsm?=
 =?us-ascii?Q?XoziAOJuxEdipwbJ6EU2pj58iDRibeQWu4d1TurmBRutxMwPM38B+y2Z/x+Q?=
 =?us-ascii?Q?2YXCU9rcYPZbyRfi1sevgRdNBZhtGx9Ij//x5Ny6GQk4bx8TerdsKqjUFVmH?=
 =?us-ascii?Q?qSfZt7IwHGoslA3Mb1hnujsS+GVrMV8vHt1iUJu4kPrdfPFC7swa2o6tIs7D?=
 =?us-ascii?Q?CEPKKe0CKCAOoJJkjdA60ekKNrcXyyOqyAz6f3et/lr5RjMsLANOA3TuVdpN?=
 =?us-ascii?Q?Ypw8eCeoLWNB/w/zGTxGJIUrUuT1bWgejnx6InHB00e57U7O6d6Z5QDfg6CH?=
 =?us-ascii?Q?VFwVOpcyodCpYOAxg20PJc+TRAUaARrb2OOH9mrZSi2cLwFzesm+oNpbvJ7s?=
 =?us-ascii?Q?dO683IS6LcsUaK3tZoT8hSFB9RrpNl5E5h3SgbWCJeJHqHfSINv3x3caoI7A?=
 =?us-ascii?Q?cy1dfqNIJmMzIfhjP/thx8jyDYqbHTpQVfWo3r3q6aYlfk1qjnnaRVFnE8GN?=
 =?us-ascii?Q?ieQ8MeFhb03o23ASn8k5JbIB33eNw6EhlmR0rU2kMZcnD7Y4FD2PrQQLugb6?=
 =?us-ascii?Q?tXnL99VHJdFM5z7+yGFSmKFgVadrW+R0D47R6vVSiXSycbPvyQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h733mz8Mdmn25it2WEtFCLZnlSqfrdPWOFcX02+1hC+sm0mNLkiTe4yrPjyZ?=
 =?us-ascii?Q?bpotfLDeAyPT991oEySTBQpwwBd9CoFT7JVvukKrtQ47VzcUXWT+KAarDKUh?=
 =?us-ascii?Q?jl5mTW/tapW9mfORSfC1855ir4yi7W84WWVf9+WrICg3RjYC8+LWwlTqMspP?=
 =?us-ascii?Q?roS6ixY1XA7ysgy/0pbdYhnutnwa5eYWebXhqgJKM+ng4F3M2kWRvc5UpCuE?=
 =?us-ascii?Q?t0gOS3nw1FC6jepo6aGJMBQeoqnl2dFDhBmFonVrozoCy/1yLVUBMWD1oerJ?=
 =?us-ascii?Q?IYdodaXEXqwmi3flTqWDKi0+35EKTFZ2sMFu0oaCEFOqrE6/97T20a033xG3?=
 =?us-ascii?Q?nxgA3EC0Bx9mdL6yiZ3wfMZ1EUKhEfF0zEhR1fe2RBzWds1IQZd1bTqDejgq?=
 =?us-ascii?Q?cjuZXOkjYoSkEgkJuyHQYuT7Bh3twYpbiP/Rpbnj1usa3wFr8MsTeWnK3Yu6?=
 =?us-ascii?Q?F5ZqDmj1cnVVrlpD3Z1l/Q/JxydOZwkcvSYi1TNt7P9S44g2rvl5ANfna8zD?=
 =?us-ascii?Q?r7L6d2gHd+TTKnhF1KFDBVh1Jcay/WuGAd3ENz0YYv4g9cpGTThQjTok73H1?=
 =?us-ascii?Q?hUULUmhfdKNVMEw91aYKFnj2owzyCAQFrwRJZzgpX5jbVSxKiccwA/0/TXmg?=
 =?us-ascii?Q?301Y/FjgydMZ7byMKSF/ni1fcm4idcJRmhEfVTtUXVshkQcfsm1v7OWmJVwX?=
 =?us-ascii?Q?maJFofsUTy9Zn63aPntnU+H9vr4ZBpyth3LSqpzjmSeEfbrDC3ZnMOrTSW6v?=
 =?us-ascii?Q?hz65Jt6L82htFL1G3MoxuaSZ9RtC/LsMrLiG+p1pVuGtWDRgQmjlzLIi0nSu?=
 =?us-ascii?Q?VEz5oY0oVd2kbhJEEAOkH6YPMK4EgjYyQozZhlf53sRpaRjRxe93DjQtzdNg?=
 =?us-ascii?Q?M9zaVHxkFO+LBIXZMA+0NvsBUezOo4IBt6FjznMXhUrFqnh4BqILr4zNbOaF?=
 =?us-ascii?Q?IGH/dugE/8YqpSHIwu4RqmYQqbxLM4cOcbH74fAXWvutonPE/pAQmRv4jlWW?=
 =?us-ascii?Q?4iQVacsyjKexJJOarNNeN4+aZZSCydF+vWd1oaOXN0DNhMK3A8OwOordpqas?=
 =?us-ascii?Q?kO+h3oA7nAoehbPaLgWb5xPKi8Iy9fUbpjejab5CyJwC7kh2fgmwj4hvb9bW?=
 =?us-ascii?Q?nfLOHEDcq5SFw41zjMMhMm3FMUwwsq+lZQl1of3QZC16eELawUm8AH1rGFsD?=
 =?us-ascii?Q?YnHKuxfSqq6pwq8l+1XndTHTSS6LgLmSajjfp6m1rwW/NJyjsV+8KjnanbB9?=
 =?us-ascii?Q?gynwCY1yHWITbFTlfN7/d0dVo3/xNk3WOKypsK5tv+51DFboSA7cywM3OcVm?=
 =?us-ascii?Q?FFqUqQpFBkft4As2H157jUAjWommGV4XkP42AKVS7/MvBExVKUb0+4Bp+Ejl?=
 =?us-ascii?Q?2cZQz71I7yDJWmh7w4QWSJo6o60t1Xe1SThO0OvPY89EsvCKUUDPrsq4L5jR?=
 =?us-ascii?Q?4pE9e3NUwSRewG4qe21WFIk96rTdEZpDIjDbsoglEVaLCZ56wJZ3gK7XHP8g?=
 =?us-ascii?Q?1hk370jD/EN5ztp7u8j6vm3l6vFsaJhS81uk9yXMe6D7qO+yb6yUZDwqj+Ej?=
 =?us-ascii?Q?RTHbWpo5J7R8wSbAlr/uh+MrmSGbJIGWxIniJ4bHL2Y1WX3AynZJHtmWdxY+?=
 =?us-ascii?Q?XA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc15dc5c-8b6e-4a9d-91af-08ddd4bb71c0
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 07:32:49.3877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cDJTpx91obl7pHfwynOAuGrgY7hgGRR8KVuBBJcruTUue/yG/chFDlapkVZssdWRXt+pzpaJF1TBy7E+yWTcxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_003258_040354_D54D7A34 
X-CRM114-Status: GOOD (  16.97  )
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

Hi Liao,

On Tue, Aug 05, 2025 at 03:46:18PM +0800, Liao Yuanhong wrote:
> Remove unnecessary goto labels to improve code readability. 
> 
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
>  drivers/gpu/drm/imx/dcss/dcss-drv.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-drv.c b/drivers/gpu/drm/imx/dcss/dcss-drv.c
> index 19b027cc1dc4..3df060a2f6bf 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-drv.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-drv.c
> @@ -65,15 +65,11 @@ static int dcss_drv_platform_probe(struct platform_device *pdev)
>  	if (IS_ERR(mdrv->kms)) {
>  		err = PTR_ERR(mdrv->kms);
>  		dev_err_probe(dev, err, "Failed to initialize KMS\n");
> -		goto dcss_shutoff;
> +		dcss_dev_destroy(mdrv->dcss);
> +		return err;

I suppose you can now get rid of 'err' variable and 'return
dev_err_probe()' directly.

Thanks,
Laurentiu

>  	}
>  
>  	return 0;
> -
> -dcss_shutoff:
> -	dcss_dev_destroy(mdrv->dcss);
> -
> -	return err;
>  }
>  
>  static void dcss_drv_platform_remove(struct platform_device *pdev)
> -- 
> 2.34.1
> 

