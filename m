Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DD4CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 06:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oGSikzDgjztdJ3Q7JkFPGEQ7ryVkE1QRQC8t6acVk38=; b=LaQhm3adul7/iMcIwGSa8ePRxu
	eC05mCjxXMoi1vECLvdfPrpdb27M99LHgPDCG/Jxyv0SjhU1FOtmFm18VZVULUUP/LF5qFW3KlOSF
	dJ3qrL7tjuwx2EgU2ltP2FM3TQN9m7GFRFKpfOvGfCwhTZ/PUYMTwOfTPRrgt4vWvbJV+PwJJPPUo
	SRAYRa3WXIhghf6IoB2oA5l68o4/9Ah/KeTDHad4yaaApT6cI1bHBmyXDsFfIjFVH1hyZ5aNRj+Si
	6yI9cbXAQos6yt279nuOHI46enmZeS+hYiOlZzXMQgacjRN68ko6ig3bdhDhMJhBXi53eQjL2E3Vt
	N8lamjxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ0dv-0000000DgGx-1yH1;
	Mon, 15 Jun 2026 06:17:55 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ0ds-0000000DgG5-3UbA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 06:17:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJtgku+rLiq4xsGQd96rYs/8THFNiKZpq7hdwOgiPRnPE2YdwcLVCnAfj9jv+klQ4fZW6lH79O54SYKbbVYxVGGtEXp8AXn6pEXzOEtylb1plK6zYBvoV5n6nT4PgPK+ZrtI6pLELjYogJKbMfn783hI/w91v3hHN3yCtRdOgKik2U3M3jW6TxmuHEP2ivuTutwKvzE16JiMG+GBjltuQG3Fiv5gNAegf1P5rzhPTXI5rcS21NLqmgUE1YPKQSC0M5vf2BVrgA5zF0/WyXt1njsbqLD/ls6RjwvVEcNLP5kqgVK2ZFfHzM+nj3jNwNKTZlq5oF4NMAeBzA/nrXki6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGSikzDgjztdJ3Q7JkFPGEQ7ryVkE1QRQC8t6acVk38=;
 b=F2Gmp+N7+5WbSTDox9tS3X7pFPPjEjv+gFQ0MO2vK5bFe9UTaz52WpUdG1DnHCvMtQbitpWSJUnwcNRHULUTlNOEaCJm7PBOJeEjmkwqCbzWjLBcQZLdaSmWe/pmKs2q1Sdff1ZQYUwh1wAOqshtUyJaaXufU/FupZUWJp5HDRl+u1x2lY/Kv5BqsTv8OGaJAZtKfB6h01P4pSbNhu0BcocZUax9hLrfOM/NqJoO0XmMyP5ow0Nq4bP1dC2rsU9/URunMtm3+Uy3COP+XZxCbdyJ+ykyN3JpoEY7lxOWygHMWIFznUW4eSQhEJUulXYq3jwk7WW5uBSBwPdMODeUyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGSikzDgjztdJ3Q7JkFPGEQ7ryVkE1QRQC8t6acVk38=;
 b=FnEUNn13czUd0yGypei7QYl3b02mnVSGtMfoIQGqlUE9n8Y3T8TLDT89WbDKY0vt10xhUhBZe+Ch1b9VLM/az3VrhKiYhf3NLe7eUSnbYWzRDoMwI06YeWEUwHKDuLIqRJIlE12WXu/ncPOFeJXb0FyNPwrIXS+KB+yC3JPhbB6lzSxfWqfBgElJFmKJwDrK6ehBX1+bNR1xMyDAwcGbxu6y/HlCVOEJDYzwz8cqe95rT5pd4lbW9l2XHGsIYMPhco49Jbx7obMUdFjqQW2RfkbsHXM926svm+K2tUBKlX4Jm/uuNm7giNmwlCiCBv5Q/823u/hWGNFtQXqm1momzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by AM9PR04MB7697.eurprd04.prod.outlook.com (2603:10a6:20b:2d6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 06:17:46 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%4]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 06:17:46 +0000
Date: Mon, 15 Jun 2026 14:20:56 +0800
From: Joy Zou <joy.zou@oss.nxp.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Frank Li <Frank.li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jiada Wang <jiada_wang@mentor.com>, dmaengine@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/10] i.MX SDMA cleanups and fixes
Message-ID: <ai+ZyPqPy1q1P3W7@shlinux89>
References: <20250911-v6-16-topic-sdma-v2-0-d315f56343b5@pengutronix.de>
 <aZ8cVP7E-BOEJKFu@lizhi-Precision-Tower-5810>
 <4srixmuzaay4tetvlgribjtri5rm7akycy545vrg3d62ifmjsg@iflrkv65u3k5>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4srixmuzaay4tetvlgribjtri5rm7akycy545vrg3d62ifmjsg@iflrkv65u3k5>
X-ClientProxiedBy: SG2P153CA0006.APCP153.PROD.OUTLOOK.COM (2603:1096::16) To
 VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:EE_|AM9PR04MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: ba46284d-ffcd-4eb8-8175-08decaa5d115
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|23010399003|376014|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: mfDGz7Ovbld/4P4AKqz2u6IST/7UIXLeoEJxMi0TPLRfCzshe52eixr+nVKtLJoOcRRlx8ux0Douqh6f7kUnXukoFAorOocXcjRcZ66/ZenxiIxRLLH+CtcVDRt/A6qyAC5xozWHlki/cVQVBuaAZI9AXIdKFJa/rOwMXzxjH3YVKxlxHA4qKQOy81y4UXxo2QWoSGMyxo5DUHs6QV1grFMvj4KGgZeMTUDm5uvZIKcT+O4XrTrGDKJf/pGSmoShGMpJPEB34HGuYLpcuAAXoeCyZHsVQ+WxM9IMdkzaPZoYVGCoIwP68RCw8G/KUTS00GiURNyicH08DvmJRXEC/GFonPX2w1cuVs3kmycd1PC6ywxDi+9rqokhm/plC6wN9rng6vTM57lm4FarKDmr/Ta1pfnR8WGuS2fbAueerAPLlyfrI2YJQEjp6j7zbRskYXUQlbJlQbD/sUacbMBixh453byESTqpLyfI5f6b2FlV7mpiugrlEO5ODUVJHXUKAbS3WpqSltKj1yKsWzuhhmpfKEZfExnEdzSiYYtGD68mQTQJ93PNGiyIwnfFX4M4kTqBkJRvHMVnMAbtps0P+0Dqu3tMZVHRiNDziwZWjG9Qkfw3t95vZConoSutOyeuiI8tbO4eUP6op/FPBaQfMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tqoIqvwXuN2F7cP7LdsKsZKVz6q0Vp3vPCjjwKq2komHZHAFhB/Ubh/fADyJ?=
 =?us-ascii?Q?S0tUH6cB/z8lqI73veXRPS0f2/XpeF49F+XoJC7yXYZafVpY9ej90q+x85fL?=
 =?us-ascii?Q?g1BVpQKYbh3gFPyhANJEfaIuKkJZKt5NvwHMr5F07MGijOqEUkshSIJWQQmV?=
 =?us-ascii?Q?13tmd9hIvMUElaKtkNNOoYIQ7UFMsppSyWKB5ohi5IVkoaFxdckHtYXCJeYE?=
 =?us-ascii?Q?Ki6AtZUjr13C8b/vr3LOBka81mFzudhqsevM09yBE/m2UtmkcQ3QnD6Rzu0n?=
 =?us-ascii?Q?mmArMIB09n36UEMQKmfRurKHEnGBwCy/KkY6bSJ0Jw5EOptu35ToyOadkbp6?=
 =?us-ascii?Q?mS4EbjzNLQXtyB+DCGLFxl1+8AiXJEvEGA8m2Exh2eoDuFbDauDo0XX/cGsb?=
 =?us-ascii?Q?z83hcyjN2NC2R/19OKFxGHqmmZYwY1iuBB1XkT/M2kFcs+1PToJVfxLcDF9u?=
 =?us-ascii?Q?NlAl47r+0MVrUzPcD+tFsetJNx4w71CVqnLEykn0cKrZTLGJRP6RblLO2lc2?=
 =?us-ascii?Q?08kWEbzu5jc19bDEQYfnB2T58VVEZkB0XkanycVhLmxjCzpgEVZRiwXqAC95?=
 =?us-ascii?Q?+YxjmU7cVg+i4zn1VKl03VqeRlazH3TbXw15r8irN1nsrvmj5qn4XXvbms/B?=
 =?us-ascii?Q?IyL4n5tS2eyaMsKcsW+AD7yQhu/jFrd864K4F95xz+269CqTh7sWGIQ1IbRC?=
 =?us-ascii?Q?72Rm39dqoFv39HHfJrsK6J9mQ407M/Ee8j2raaRcEPnlE5KOS2ciApcga8N2?=
 =?us-ascii?Q?269b5VqewRzr7AIAWbvyIyJz5vuswpm1RwrfOae1TgnUrTTTeil/vwO5oG2U?=
 =?us-ascii?Q?QI9y+v6/AZOwJqY4TCwIaCDjo9AjyfIxKG+0xHelEgsQPm2wz8iGZodQIYOT?=
 =?us-ascii?Q?/XSRHbOFX5/Hyvc3ITj+C7H8qBEF9rZwueb4PvBpg8sPWymBb2OA0NnrAIs6?=
 =?us-ascii?Q?CedLSe1qEhuVdXynQp0mhsO7Nr28qzlIdods5a1rxM5BwIOUAhs2Dfi8kl/a?=
 =?us-ascii?Q?yED5B90eqqDn9jBmQfKfkNbtI3b/DEq5cKc/dhiICZCUw4lc9pz9HlTp4u91?=
 =?us-ascii?Q?ChouBjux9QYrVTELGxkC2MhmSEwSx7HFPAf5ew16qq/UHtOF8ZAdITdcRsfl?=
 =?us-ascii?Q?HT7jylOopn8AqEiRxAnPryy3tjjNqHueFQsLdGRG2NrWS5zQ/6OOZcDRA+ky?=
 =?us-ascii?Q?4XqHtOT2K74g7FGvV9u9NkgXnTCjQjGSPhnCS/iM74Sn+C6Iq7fvg1qxbn5y?=
 =?us-ascii?Q?ASnrXhPr7Cf0cbckVzqn43/iYRdXijVJcLjxCwLo23SSKTs8LkKtJxf82gK3?=
 =?us-ascii?Q?ZaE2gwsQxHkhZ9TNy1viUIkpLHFJG4DOAsZYj0BKR06JAQAR6pik6LJaMsBl?=
 =?us-ascii?Q?8boB0ky16KUT3f99g7ZRhNGxiHw9IY25Kx6qOY9pjOWEfDgHA5MhOR4VX5Pr?=
 =?us-ascii?Q?lgwjnOeXzQiBpoBOt959u5KXWsNItyO63Ja1pAAXOBl3i6sDLf3l79axZRST?=
 =?us-ascii?Q?nCjWqn/1xpBeumFZGSfRwu/giQOijK3HZQ0XfRjEBUqwPKb1oo1yDokZnHjE?=
 =?us-ascii?Q?y+DDw48F1rcuDxmDI8LZpxGntypdFWYhujXYQuJP/oLAe7IFdydsmP4Ryo+G?=
 =?us-ascii?Q?G4QIqxg88j6tZdLoAuWRmC2MfxtuXDPzlNHvMd69xUdxQ1c6744wj8S2eQa/?=
 =?us-ascii?Q?rdva9ndpyVWxxubZbJvSqXPQoeBwgqYZp643vfX4Wok/YYWXeGtEu0Nesgp0?=
 =?us-ascii?Q?VKljFyt9ulY1uF8Cxb97o3WkgbrnYYe7ciOTT5mtq6QIr6MfwlK5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba46284d-ffcd-4eb8-8175-08decaa5d115
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 06:17:46.3233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JW8O1fryhekT1YJrjrUIS7x5zdZYfPS4URKaIsrBj6sI0oaUrtNsX8ztyuz7P+2nz47W07kBIIB9gOgzwVc3veZXSP4eeDVkqpu7BnhtFpgFrJMQ2BwKLxWB+WLTXlxm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7697
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_231752_880379_59011544 
X-CRM114-Status: GOOD (  28.94  )
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

On Wed, Feb 25, 2026 at 06:05:33PM +0100, Marco Felsch wrote:
> On 26-02-25, Frank Li wrote:
> > On Thu, Sep 11, 2025 at 11:56:41PM +0200, Marco Felsch wrote:
> > > Hi,
> > >
> > > by this series the i.MX SDMA handling for i.MX8M devices is fixed. This
> > > is required because these SoCs do have multiple SPBA busses.
> > >
> > > Furthermore this series does some cleanups to prepare the driver for the
> > > upcoming DMA devlink support. The DMA devlink support is required to fix
> > > the consumer <-> provider issue because the current i.MX SDMA driver
> > > doesn't honor current active DMA users once the i.MX SDMA driver is
> > > getting removed. Which can lead into very situations e.g. hang the whole
> > > system.
> > 
> > Marco Felsch:
> > 
> > 	Can you help rebase these patches?
> 
> Sure, will do.
Hi Marco,
	Are you planning to release another patchset version?
BR
Joy Zou
> 
> Regards,
>   Marco
> 
> 
> > 
> > Frank
> > 
> > >
> > > Regards,
> > >   Marco
> > >
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > ---
> > > Changes in v2:
> > > - Link to v1: https://lore.kernel.org/r/20250903-v6-16-topic-sdma-v1-0-ac7bab629e8b@pengutronix.de
> > > - Split DMA devlink support and SDMA driver fixes&cleanups into two series
> > > - Make of_dma_controller_free() fix backportable
> > > - Update struct sdma_channel documentation
> > > - Shuffle patches to have fixes patches at the very start of the series
> > > - Fix commit message wording
> > > - Check return value of devm_add_action_or_reset()
> > >
> > > ---
> > > Marco Felsch (10):
> > >       dmaengine: imx-sdma: fix missing of_dma_controller_free()
> > >       dmaengine: imx-sdma: fix spba-bus handling for i.MX8M
> > >       dmaengine: imx-sdma: drop legacy device_node np check
> > >       dmaengine: imx-sdma: sdma_remove minor cleanups
> > >       dmaengine: imx-sdma: cosmetic cleanup
> > >       dmaengine: imx-sdma: make use of devm_kzalloc for script_addrs
> > >       dmaengine: imx-sdma: make use of devm_clk_get_prepared()
> > >       dmaengine: imx-sdma: make use of devm_add_action_or_reset to unregiser the dma_device
> > >       dmaengine: imx-sdma: make use of devm_add_action_or_reset to unregiser the dma-controller
> > >       dmaengine: imx-sdma: make use of dev_err_probe()
> > >
> > >  drivers/dma/imx-sdma.c | 181 ++++++++++++++++++++++++++-----------------------
> > >  1 file changed, 96 insertions(+), 85 deletions(-)
> > > ---
> > > base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
> > > change-id: 20250903-v6-16-topic-sdma-4c8fd3bb0738
> > >
> > > Best regards,
> > > --
> > > Marco Felsch <m.felsch@pengutronix.de>
> > >
> > 
> 
> -- 
> #gernperDu 
> #CallMeByMyFirstName
> 
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
> 

