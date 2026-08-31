Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6E5C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 15:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcbM4KiYKzMqpIgGXHUsy4Y4+Lba+isvDaMSWr/F/KY=; b=gjfNbPPwUlV67BX2S8QYkz+0wv
	sMWxEzJGf6/t3nkSb0L+pXm2Aj0CK413tL5fcJtgyhFO+bP/CT++qeSeUszM7iCfwSBo1+ZIJMUFL
	d9A9UyvoVGv7luXCOHirz8APXf+oypzvqPpVFybVFZHYMR5I84nPBZB+blucRXtCIjatLgkWIm2qX
	uHezbmoqFkXOVY9dLR8w/aVMHjpcLNqACp4w6vUWa/ODJKfpsZWhDW4tg73tvy8dmyyG6J4cJqiVA
	GGNTAA8V8/e8v4R3i6HfZ9cZ8fqMAlEfCrn1Ki9d6XeEzxucBYY534EF6O1wtJjtdFR3L7ln3mB8w
	f5VhF6dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x140W-00000009sNU-3OUu;
	Mon, 31 Aug 2026 15:33:12 +0000
Received: from mail-francecentralazon11013050.outbound.protection.outlook.com ([40.107.162.50] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x140U-00000009sN1-1AIX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 15:33:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gWdTPzZ40sQxLMlm9jpirElBbyA4pzWbhlMCYzI6iaaTjDS9Kq3j1fk1LyCNJ8HkG5ocGj1snfmaToenOm6O7f89B2AE/+qQtiPALI7dyQZ0LRNF18vHiAXQuIAfSlXjMvtZExgCe3EwjMAALmt8aKOvoJhemiInk+XeeMdYKXojnQe5UGXiyiFWFW0/SCEXmhCSxfItzD0YTEQRu5EakZOnmDRkL9P+3ypvXN6TZYH7NF/mczc7t/noSPdCWN2spqYQWNLmJWjPY8Qmh3zFMyLLS4QZ0I4+ay6Nd7b+FMvMw8wbwRJrI7UOFX+pq1/mgWQUp+qB/WyHKPLz/xAXAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcbM4KiYKzMqpIgGXHUsy4Y4+Lba+isvDaMSWr/F/KY=;
 b=H9U77AQL1O3ib/2wmi0zYmXHKcsNIzGa4W5fDzXo7FFpNhNpjjCgzJ52Kfj9OJy9qA+xbnsAccW1cgg/Lka4OJwMBMfjl3ZoBirmx+3eb809BrS7QfGF6SzG9MWJVOTEToR4qhu1yyNv10qMfOHruRi7fIjVVwwAfGMRF3CaH6rZ5hnuPD+/UIj3ZoXUh4o8RnWKwtluFGtnqIISngvq6nG0EwzH8YgI7ysDfasaOpq5XMmYy/dK+QZHVissLWYjNfQIwMKA3hwT6fcSHx1DTHujDgpXrFxYUAFPc85M3Gsacis6pz5N8+HWvFUouOjcyLiR4DCWpizyrdcugpx7bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcbM4KiYKzMqpIgGXHUsy4Y4+Lba+isvDaMSWr/F/KY=;
 b=M7ub6rKrAeSZvlSrM/Vuhj7ap+Klgp8JUShup3eIssp3l37qUY8aNAL1DC70o00EeVc54z+SYnifwFNTubWAl0wCh8ZMQiv+EakFwEhMejDS7wYeaDjD4UBNVzeMuUXhLg2t5xscayR1Hfn8I4Tq5jw7wZiUH02l1vhGSreoJczjK2+rgzhMIqTexCtspC5mP+jOkCGv4PsiZ7lxfGJkIgghRiOoYD0hSHj93xiV/mj+3SRJtPtUyoXVqCIqck3mQzVr7+MH8XG876mWhzm8wOXAzs5g1LQbsJMsKpKi/2paakKsnvuyhoihn3UY3nsNrhycfJHy1haJWPo2OBDoXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7778.eurprd04.prod.outlook.com (2603:10a6:20b:24a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 15:33:05 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 15:33:05 +0000
Date: Mon, 31 Aug 2026 10:32:54 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/6] media: nxp: imx8-isi: Add i.MX952 ISI support
Message-ID: <apWepjTUoZO2gwn0@SMW015318>
References: <20260831-isi_imx952-v2-0-fafdb4b446d4@oss.nxp.com>
 <20260831-isi_imx952-v2-5-fafdb4b446d4@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-isi_imx952-v2-5-fafdb4b446d4@oss.nxp.com>
X-ClientProxiedBy: CY5PR19CA0043.namprd19.prod.outlook.com
 (2603:10b6:930:1a::33) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7778:EE_
X-MS-Office365-Filtering-Correlation-Id: 59b46409-c9bc-4421-5256-08df0775265a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|19092799006|10067099003|22082099003|4143699003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: gUGzi8ztVHww47voHs5yGIbhzpJMt1jg826hE4j+mRcweZFBou98S8rSRFVPwHzyw0SYoOvbCHW80j1NzM+QMLLd7G/5tfg8puIEQyHy2BmJyIZyTCWp8xUvqSJv/mebwd1C/NKCn9cDnMqwXNpSGfoQJeHBtINdjuXQl/g8mCp3IBxafgnEWO1rqvWtBUgQaUpVgwKXh6n4tJhd9lv+D6gDk3zFb6P2/xunmvInwEqAmsltkt2kC9mY6R6S5RFuKQomQu/oEzwyF2V5MatvlXTmNw6xH7KpTX/kMIX4ZW//O3kuZV/LGKQg5H1A7xjSXNOMVY28ej88ZJ3Iv+doRsea7cU3fQUODj9TmY9lOBap7H9TdWVrK/3+lhcrkeZ6zqHxDnoGEo7BG4/Ao8+wpio4uxR1Tq2hjMB4u1kNLh4PoU/+6F9hboueTjmegWnO/Avs5oAdZZOdafW2naVWn+PUt3Ur+1oZ9uyKDSPCLvvu0pFdhMLOqf9pM0kXNldkGQYVa4KJuRB3fCJTLErU/dwJSP0M6YVzqH4p+Mf1DgChTvGO6y63qsSWMsC2kU/UU2ohKq75vwurCLMSt7AoDC7UFeazDOyiCgFzVHlZx7003FDGE6x7iztHNhotZtE/Cm6k+JlKiB9MwcHXCbOTAEdR02vmc+d9+gN7+eb9Tec=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(19092799006)(10067099003)(22082099003)(4143699003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tNunQUfzWIZp+vSDaV8yLgk2+ByhEizAeLivJ67D60phyN/aDeQNHnwuLHqC?=
 =?us-ascii?Q?Ey6fXcDxPhsNR+r8ejqmetl0BjNMAqyjX4zmzLl8WlKastIfEGJxNIx8NvUl?=
 =?us-ascii?Q?eTuGBee5bXGx9ewLqG650D+yuuUv4z6fqmmIEi+ts/xR9rfmFSGNETsgUlNg?=
 =?us-ascii?Q?VLCgtNnfm/8+kWh/Gx2K2GS61kUbcXGLH7I5xrw12JLbGJDHA0siOFwtE/Hw?=
 =?us-ascii?Q?4oOrjZyWQDikwayMXso6r2f7uZY6uwYPZ97t1B0Z5ZVop7RYqB90Mbofj91D?=
 =?us-ascii?Q?IVry1l4OAzYTaTbGVs8pftcKZ6oOyw/k3pWr0Vkm7yKAdI6CjVuzeggUl5G1?=
 =?us-ascii?Q?Hx+WoVukMLcIILbtcOK0Jwzs7tdJ4oNwKbPK5Y22HsAp5Z6lg8KdGxm/BrUC?=
 =?us-ascii?Q?i+KNFjydpP43ebwrrM9256gudY8LTI5uhfWoP+kUSUsy3fVR0usV64xrMY5W?=
 =?us-ascii?Q?eTp00O+p83S5hNVcDShkdHTcxmxEbuUAHPgNE5+SGCFhpYXcSCpxvQTrEScj?=
 =?us-ascii?Q?YQg/cDk95H1n5UF6EgtJ4b729iUr85sFAQMddMG09v3Fm/DNAxwOYpuOZ3qb?=
 =?us-ascii?Q?yL9rL0vmCsJB/Rl33PAEgZHfWGVhMgZBdYD3INSqeImG6aNFbd4hbcZ0Mt/D?=
 =?us-ascii?Q?bzNrN6YhpQHEJN7nXnTHnICgvhngu/fSUHQAHKGI4j31isBnfGQsYgm3Px7o?=
 =?us-ascii?Q?ESNK8JcN8ABP0BsWO1+P73wBIG1fhAnVwi8Dr7SeClaOYUjhFkrYUactIMoA?=
 =?us-ascii?Q?uj9o19twZAJyD6AcTgWJuFCb41+ATro0GB49Kt7zLyS6abf0hEX+O+rXluEm?=
 =?us-ascii?Q?Va1WEywqY0xmkryoETDw+/BQe8bZesHSk/HZcTHlIf3E621ynYF0Hq368sWP?=
 =?us-ascii?Q?OYI/3T1PrKxQ3mf2zWwMATcZwxvCqzjagx4qHoyZm/QqMj5grtXxzQScOfSw?=
 =?us-ascii?Q?jX42XtSMEKDVK2BmERTeM7Sz7tuU8WNe18gV2NwKbJyQy3CNh0k85DBucBSJ?=
 =?us-ascii?Q?LZpWbi/XTMY1rW8EzLJHTW9sWdUrCFREbecDBNDXO9UYTViu1Hg8RnvhyvQW?=
 =?us-ascii?Q?1PyEQq62riDonW5RFNFTIZcGZ+yAdyOoCRSYph/IPQrp/GzQBZAkztA02jXZ?=
 =?us-ascii?Q?iFY6rkmlMQWm+GeT7RNOOQ2Qkskp8nq/nvD9gm4LLLNPNHHG050j5TjyvtzD?=
 =?us-ascii?Q?b52hWeDcY3pow/lQ9mRQh80IZ9isqjfXnIJZKOEUhSpECDWvGSUqHw3J3I4d?=
 =?us-ascii?Q?ixbaj6VhYIJYzAVM9kkqtm4Q2rvh6hR1xZdwD2BtlPwLLkokgUMZfIEDGq9Y?=
 =?us-ascii?Q?7m4NOjxg9YN920rW/ncwZdW2TLsJYJcCP/nSLMluigiJ2QDFGJzfZoS0ENTI?=
 =?us-ascii?Q?M5g3jhDhnW67HxiUbADVKeFpLxFQD1aTFjodemAxS2P8SL09ckoSZnScFQdt?=
 =?us-ascii?Q?1vwH052binX4AMw05dqUt96rDoKf8K6HRYJz/YP7f58GkoR95mBxffczpkgW?=
 =?us-ascii?Q?MgSElx9so2A07b9ZZQT3VsQYAt8MUgY3QD7uHeEsvUiXwJh0gL4nP5C3J/fm?=
 =?us-ascii?Q?8NpC5n7xOWG6TxzQNO5Ua36WNX/fKALIAL66EiB+6LjZ5A01vdVWGO3n0Y8X?=
 =?us-ascii?Q?ZLCVtxn6olukpqv4NPjExtuV+AZPmceddUncCoDyVELfuQw1lgviUET/ADDE?=
 =?us-ascii?Q?4U9HvN5eIOYFO919RH5mIwp8DsjycAHA5hE8DnIqqclG4e0x9Ew5mBdWg63Z?=
 =?us-ascii?Q?bsjwSoBI9C9GTWaDDJaYwACLphuEFa928F9BOShro2ufRiloAr+L?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b46409-c9bc-4421-5256-08df0775265a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 15:33:04.8991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +fzY+VeAmWDx7Jt/ecEhRcIS8glDhtOCe/FA6xiHeBSWpwICRrCgZo3bZ6dSX4wak/lj6Yw1XA2M90jC9f83FgcrC43fQH1FUOGXwvwjlzGSUUIsFdS5jhD9DiP+qarw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7778
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_083310_324249_F22238A9 
X-CRM114-Status: GOOD (  19.12  )
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

On Mon, Aug 31, 2026 at 11:37:00AM +0800, Guoniu Zhou wrote:
> The i.MX952 ISI is reused from the i.MX95 ISI with a minor silicon
> revision. It can process up to 8 image sources simultaneously and
> obtain image data from up to 4 pixel link sources.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---

If fallback to imx95, needn't this patch at all.

Frank

>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 13 +++++++++++++
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h |  2 +-
>  2 files changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index e627054bbc8e..d492631dfb6d 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -384,6 +384,18 @@ static const struct mxc_isi_plat_data mxc_imx95_data = {
>  	.has_36bit_dma		= true,
>  };
>
> +static const struct mxc_isi_plat_data mxc_imx952_data = {
> +	.num_ports		= 4,
> +	.num_channels		= 8,
> +	.num_vc			= 8,
> +	.reg_offset		= 0x10000,
> +	.ier_reg		= &mxc_imx8_isi_ier_v2,
> +	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.format_mask		= GENMASK(30, 24),
> +	.buf_active_reverse	= true,
> +	.has_36bit_dma		= true,
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * Power management
>   */
> @@ -574,6 +586,7 @@ static const struct of_device_id mxc_isi_of_match[] = {
>  	{ .compatible = "fsl,imx91-isi", .data = &mxc_imx91_data },
>  	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
>  	{ .compatible = "fsl,imx95-isi", .data = &mxc_imx95_data },
> +	{ .compatible = "fsl,imx952-isi", .data = &mxc_imx952_data },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, mxc_isi_of_match);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> index 7c4e736f4651..35dec3a650ac 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> @@ -22,7 +22,7 @@
>  #define CHNL_CTRL_SW_RST					BIT(24)
>  /*
>   * CHNL_CTRL_BLANK_PXL: i.MX8{QM,QXP} only
> - * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX95 only
> + * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX{95,952} only
>   */
>  #define CHNL_CTRL_BLANK_PXL(n)					FIELD_PREP(GENMASK(23, 16), (n))
>  #define CHNL_CTRL_VC_ID_1(n)					FIELD_PREP(BIT(16), (n))
>
> --
> 2.34.1
>
>

