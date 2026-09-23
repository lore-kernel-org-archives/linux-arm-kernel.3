Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A4DC98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+eKCb4NMKp5Jh6mgKOVM0bUpZ6A4Z9I4O3FILpuvuc=; b=hMt2WGGv1HsAgPVjV3szQCZCCW
	za2JD0qXkaK86cRxNy/ODEwo55GnMuR9JThE7XytvYSPhS2lJpevfhmlRbTnVDBMLe1OpK1p7pmHe
	SAJ4xod2rGjFUIuH9KDghTesBf/U+TgvluGlr1O/iIK6d8X5lfJhuhtCAwU9wT/i1OLUxG+AyJFrc
	2iFguP9H5YgDdD/JvCeUVnpf9JVgE0IArGULPVwE4Yzn1VCuuIHqnK0/GfzEI83e5/RGP6Mi4CQA+
	PvjP6eljWYk0XqQuV9go/eVfSZScczZX8r45Lggms4Zhsmcke6hMx17Fj+8LD5myhi7PC7IjkWQ4D
	LKoQf9iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Op9-00000008iyD-37OG;
	Wed, 23 Sep 2026 15:23:55 +0000
Received: from mail-northeuropeazon11010021.outbound.protection.outlook.com ([52.101.84.21] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Op2-00000008iu2-2ksn;
	Wed, 23 Sep 2026 15:23:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hykzf0vtcSbo9N/qKa7XHMIwYUa/As6Cw4UvJ4CSY+eYbQJ1ksk8x6arAAaQQI6X7Xa/yPSyW1VU1aypfDpcpPDTykR7PHfrRRCtFi7f6TxiVt06EOKkYXr/2ezq8Mb2jPD0yeFhNTb6gpYHIAAUOS7U5aauxtltCBPeVLixhqKH1fFV5+4+VkxuJr1lagSYAwoIoEfLQyqyxL4Z8+wBdc9qnzxtwp89Gc2SUMGMl/RlMOu+x8hq7Tx6qO8fCLUCGgV+O/Bbq9nvmcwP/zIXSFkJfdVRBoros+lW0gaVk3Gf9tgVXtO0KVBSARHkSn9xBHc0oc4vbgPR8cKDf4i9Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+eKCb4NMKp5Jh6mgKOVM0bUpZ6A4Z9I4O3FILpuvuc=;
 b=hy3Kn80Ylyw6kQBWn1HHtrX5BEaiO6fx/nRfqvtLF6ne5sPPMLPPVgB8FT3PnzLo+CtPrOoMTJM1yDmdVEl4rf34/xmsktYLc93KEyIcshgUkeu4nyPs5WIqCODE6PVkvM9Km9zzi1JoqBgXdM6wklLCbq058auYn6jLQRkCtXHgBCE1qD7jTcByDbWVIbNM33Hxvuy7ZBXvYXeWtb+hEoDdaK9G97pEDNti0kQ9ztdHZVeEjx8/vnv/VIs3joxUZEwvmzRCKjzMz+g/L0cXsIsUjVR2f4/2s1SWaa3Xtc2+5UEpm/dJEDjpRpQMpyXl/sociX1B5Z7f/5ti+3mEWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+eKCb4NMKp5Jh6mgKOVM0bUpZ6A4Z9I4O3FILpuvuc=;
 b=Mr3urwW5RY+Pykeh1R6qyzNWf34mvYHgIMKFa4XmgUgcKky7AZJgineoewLyk5d484FertvA7XJHl7q72jhzm8s4BFj7qnRDJQ4wAu1HM2iuCUhawdHmH2LR/XpvyJ3u87ka68/O+1ha010s/yaqs5ZNbtQ7YKIvpYNVZHwLrHSYK5fawnoCRqEJFBorLDtZ++PBYXqvjvPsv9aUKJZs+lvWrihJTX5dpMy/SzIn6+FfAKwIi98aJQ8PieHqOrodPN4iCHT/2ElbrNP72l252dj6Pk1Ab3JQw49GvBGArqwwC91Ap708txpd0O1ibV/JUGX2cDfRZZtS1xw71K91Eg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10928.eurprd04.prod.outlook.com (2603:10a6:800:261::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 15:23:42 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 15:23:42 +0000
Date: Wed, 23 Sep 2026 10:23:33 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Ginger Li <ginger.jzllee@gmail.com>
Cc: sean.wang@mediatek.com, vkoul@kernel.org, Frank.Li@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: milbeaut-hdmac: Fix deadlock with the channel
 IRQ handler
Message-ID: <arPu9TwyACiAlw94@SMW015318>
References: <20260923094426.67872-1-ginger.jzllee@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923094426.67872-1-ginger.jzllee@gmail.com>
X-ClientProxiedBy: PH7P220CA0179.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10928:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cd48f3f-a39b-4890-624c-08df1986a666
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|7416014|376014|19092799006|1800799024|6133799003|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 6gFbUrUuOfQJNyEZq+kOjVIJnCJYYk5/lNm7M74xSGWDUYAh1xszWbiAEwGG0VoPFehc35eJRPm33jNBaUBLy0Fhn6VoNl45/QfRS/bru3ZKJcAVq4GLcxSzWkBYr1NnJkc01U34+RyyAKejbdOJ1PczQgis7/T2rKr+ibEOihyPgG0qApLRwhFQilSnvaczGAM8ByCfY3GzunNqzBHa5Qp7cjpfhzmEhMT4E1Exaz9nSlQSwh9b/DFDkuVLjQrpIeb3p2KWXp+z9H6SHZLNR4icCwahX/OoO6j0tm6Eq3X76rDZjb3SPSC+/wv/5jSwl10LNQ/fNdqYXzqs/udq3nys+FaIDHpvCkHe/YBLoNzCipt+cbBqn8Jt7Q1jhdgUmjeHQvxCNe5c89nliq18zq+C06pniG+FqdtIivKnBcADTlPXAn+hK1csPOgPGXIM+unh5XxosQFsHPSsB0aoKn09DO3+IZYo0EovsHZP6/K/JkUk4QWoXXFNr4Y1pk+1TPLFJOE6bZQvrncm0xM17SYidlS3tRgAp1U8PSfs0zj63YLQWNuAe+FfPo/QJYdLU4XZHgQwTL6sZL9ZvljC9zD/BN2d1SspLoRuAsIYzkXwFSF5MXI9AQQcM/cLnksd6V20ZLBz78a82DU/pnZyMStoGyNLg8VpaKpqgTHv5p0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(19092799006)(1800799024)(6133799003)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yn30zA1oGaFIP4Eiv3cbGvEnI248+gHZLCQhbd1KpHqk9wyA2Trx0YZuRsiI?=
 =?us-ascii?Q?KMZXfGnFoHYh23lDVU0YY9/Td5Az0kwOGBOkxE+oyDDHHLAaxs+mIIYIbLw5?=
 =?us-ascii?Q?71taDTluMbN1iHRJD6o91DLdKt32VsRD2X6KUYHN5nfj3qgXqmZLRgpZnFQY?=
 =?us-ascii?Q?W3EfwkWXjA/t8jtWtKaMeLx9NUfAxdUBRpAvsQQ8r563VAuIBu5lVGd5GFTb?=
 =?us-ascii?Q?tTMy262VM7AkQGXpATox3xQqpEDak4+VxUGZ8LZAlhlo2s2D5Lc/SPf7mpMl?=
 =?us-ascii?Q?2kj9RLxZO8AqARU9qtoUQKUZwmy5ZeLJs7IWfOBrnyp1iLHjgUwzS9igNU4a?=
 =?us-ascii?Q?67l2i0mghlhOIMkjhow3iRc2RDBjRBwiDb3QF1gOP3iQIQoRCRZVXG6p77pb?=
 =?us-ascii?Q?A2vycasCeRo6wtw7KXKB1/DIXGHZaencGcEDlt1DD/DgU9+gEk6Q9kzA99FT?=
 =?us-ascii?Q?s2xCzAcmYJhKbCKUhtL8SZPiUvY4YmS6R9fgvlxXHSUyNwZ3M7Nj0PC4+zSn?=
 =?us-ascii?Q?SMX44V6+jy5mfL2z4D6Z0ZwBR6g49H26WpZuoUgXPVttsPtPtX7AAcgpbb5E?=
 =?us-ascii?Q?N4to7nn2TgxjSjEG6EKdDXNZXw3NJp1ilXa7JdcbqYYhbe2HFW8X18XUgdYQ?=
 =?us-ascii?Q?UJmwqBs+GhN1swFiOTqQD7wVJ3qgzQzd+lmDyR1gKw/6jJadtOrgZ3y6dn8V?=
 =?us-ascii?Q?PLTbdiqDUUzplAJr5sSjRuUUqxpn2MehgnApB/5OftIZRdA0LPpziOsWIT4A?=
 =?us-ascii?Q?FUnkQcAVxi7Pi/btlgGtA5QfhBVoUjbiGYVD6i+7ZDxehHUyOp+9afrR1cPh?=
 =?us-ascii?Q?HoHp0Luooi/O6RgVhFIiaYTQ8GlUf5HV7iXCwX3kbv251EnLfUPj/yo5Y+Cm?=
 =?us-ascii?Q?G/MTN+uwkxWVX+g53UTsmNx3KgU5UEnBLvxb+1cAHs6xXLuIaCcBiyyCtg1J?=
 =?us-ascii?Q?OUA+gbfNQSNZ73AmN+Uz9CXIUXDaTVxqiacc1ft4sgDsjhJf1BlUUff/C1pa?=
 =?us-ascii?Q?SlUGRh7NdA5SYol52enb3hmApQTntfSHlvmkM49DXVz5p48rLMFDST4c1+mr?=
 =?us-ascii?Q?0sztvCr4nNiKyPOqofwLfCO/Rq92oMlIHfyYTVC0bIra1M+moPPp4xh0tjvv?=
 =?us-ascii?Q?PMTBzcYhafVd8y0+vNu1Kd6qIv+52U7kaOQMEVSn6CR/WnDy8GF1GflyZQwN?=
 =?us-ascii?Q?OTk8ieh8tyvSLJaHhyq6AXA0zUADDXJvqnru9XxAJghqGo6kYaaRC+P5a/bo?=
 =?us-ascii?Q?Ma8v+elyPCkUDu8sgcX26iT59BQCHca++F9kFvYoMefJraSqX7N6iT9fqx7n?=
 =?us-ascii?Q?KIDGjOua7lbibu4AbEv95o7duB9W6IyJBo7NbFQ7/oEDEtg9QDTT0kr0ULpO?=
 =?us-ascii?Q?H9Ss5UB5T2nzmO4E8aLv8PJG3eI0nnXxOVcomkmd2iex98MH75wCaUejLhw9?=
 =?us-ascii?Q?y5tKSb5CF5WUk+s+3sWYNNE/UumZI6yyWZ0i88o/VKJeoYb/x/zt2zrBkvhE?=
 =?us-ascii?Q?vSlM0npNkj3tULlxSEwCvFWu4IrA6BMBw9J7PsszOFb7FMMD1ap6dD2nsnxJ?=
 =?us-ascii?Q?EX/17z8iZtsN8XmPPmt9Xhoi6chGtYOih0B+PIY6KUcwnPqBt3Q4d1zONKXt?=
 =?us-ascii?Q?sxdY8VzqG+o4Pj4pDHoSbIQziaLFTr41ChyaIQstbiVTC4LwQ9NIocU3Elcs?=
 =?us-ascii?Q?0oSDxGgTYa1Yyqymn0KTsstnuf7VNrxc+ZMYSlcG4VDucG9Zz2iIxKPszKao?=
 =?us-ascii?Q?Wx3AuQncwnB2iLnUSY9rPb5Wx0vdVyOZ5M7Fibh4Dvp/iCfXYd3W?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd48f3f-a39b-4890-624c-08df1986a666
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 15:23:42.1265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r+kQBw/vuU0xn9fOTG1zom4zGXBDcAPhXhFsjWujHJOjicWCNCaiPPOfHijC7xo464/QjntVK8JD9ocpJa+Lwm64pu3oDVUFKFdQhbHvIT19YLInjTWf11UXE4LSnbTN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10928
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_082348_754428_69ED3541 
X-CRM114-Status: GOOD (  20.55  )
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

On Wed, Sep 23, 2026 at 05:44:26PM +0800, Ginger Li wrote:
> [You don't often get email from ginger.jzllee@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> milbeaut_hdmac_interrupt() is a hardirq handler and takes mc->vc.lock with a
> plain spin_lock() for the whole time it runs.  interrupts are disabled locally
> in that context, so the handler itself is fine.
>
> milbeaut_hdmac_chan_config(), milbeaut_hdmac_chan_pause() and
> milbeaut_hdmac_chan_resume() are called from process context and take the same
> lock with a plain spin_lock() as well, so interrupts stay enabled while the
> lock is held.
>
> If a channel interrupt is delivered on the CPU that is inside one of those
> critical sections, milbeaut_hdmac_interrupt() spins on a lock that the
> interrupted code is holding and can never release, and the CPU hangs.
>
> Take mc->vc.lock with spin_lock_irqsave() in those three functions, as
> milbeaut_hdmac_issue_pending() and the other process context users of this
> lock already do.
>
> Fixes: 6c3214e698e4 ("dmaengine: milbeaut-hdmac: Add HDMAC driver for Milbeaut platforms")
> Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/milbeaut-hdmac.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma/milbeaut-hdmac.c b/drivers/dma/milbeaut-hdmac.c
> --- a/drivers/dma/milbeaut-hdmac.c
> +++ b/drivers/dma/milbeaut-hdmac.c
> @@ -214,10 +214,11 @@ milbeaut_hdmac_chan_config(struct dma_chan *chan, stru
>  {
>         struct virt_dma_chan *vc = to_virt_chan(chan);
>         struct milbeaut_hdmac_chan *mc = to_milbeaut_hdmac_chan(vc);
> +       unsigned long flags;
>
> -       spin_lock(&mc->vc.lock);
> +       spin_lock_irqsave(&mc->vc.lock, flags);
>         mc->cfg = *cfg;
> -       spin_unlock(&mc->vc.lock);
> +       spin_unlock_irqrestore(&mc->vc.lock, flags);
>
>         return 0;
>  }
> @@ -226,13 +227,14 @@ static int milbeaut_hdmac_chan_pause(struct dma_chan *
>  {
>         struct virt_dma_chan *vc = to_virt_chan(chan);
>         struct milbeaut_hdmac_chan *mc = to_milbeaut_hdmac_chan(vc);
> +       unsigned long flags;
>         u32 val;
>
> -       spin_lock(&mc->vc.lock);
> +       spin_lock_irqsave(&mc->vc.lock, flags);
>         val = readl_relaxed(mc->reg_ch_base + MLB_HDMAC_DMACA);
>         val |= MLB_HDMAC_PB;
>         writel_relaxed(val, mc->reg_ch_base + MLB_HDMAC_DMACA);
> -       spin_unlock(&mc->vc.lock);
> +       spin_unlock_irqrestore(&mc->vc.lock, flags);
>
>         return 0;
>  }
> @@ -241,13 +243,14 @@ static int milbeaut_hdmac_chan_resume(struct dma_chan
>  {
>         struct virt_dma_chan *vc = to_virt_chan(chan);
>         struct milbeaut_hdmac_chan *mc = to_milbeaut_hdmac_chan(vc);
> +       unsigned long flags;
>         u32 val;
>
> -       spin_lock(&mc->vc.lock);
> +       spin_lock_irqsave(&mc->vc.lock, flags);
>         val = readl_relaxed(mc->reg_ch_base + MLB_HDMAC_DMACA);
>         val &= ~MLB_HDMAC_PB;
>         writel_relaxed(val, mc->reg_ch_base + MLB_HDMAC_DMACA);
> -       spin_unlock(&mc->vc.lock);
> +       spin_unlock_irqrestore(&mc->vc.lock, flags);
>
>         return 0;
>  }
> --
> 2.43.0
>

