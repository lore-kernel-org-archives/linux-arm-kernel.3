Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF90CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 21:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Be6CmeA7WhGKWOATU+IgFXolrTkHcEuodTkohAhBME=; b=D+Z7BA1y++qiv/GeFvWV2+499m
	U5PiCa2liGdSa1ctgTNvDLUbmEAiHge2I+s4zGfqNf5JmYVjNez2YsXOXboUbaFVVD4Ub0jo9z88r
	JcbZK/bqghINkW6SG5/svCH0q13owHkFVUFNWnlvCFtaLgydxVspvzoVcCNz51TPgibjCxBX2RfTL
	Ysrc+av30xwdw2uxwYcrqlMF260to6GIHnvQM1vwqK2pX4G+mphFdkMbFtU07uYeBbOoEFi3oZI+6
	9nV+AVb2i68mPFYJaAG/kbOxefjmmkTKV8JakTw46BTEE1YfffJ/QM9Sphe2AbE+SgwNQrKL6imRH
	mWWQdO4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utvG3-00000007i94-0AB6;
	Wed, 03 Sep 2025 21:43:11 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utp60-00000006qBx-1YVd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 15:08:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGdKdM7x8MoYqKi0AdvEnl0xbaISkFkPwuExrWNd1jLtToeBJ3PE7eH1WF67iu7Sa6NC5M6g7mhPigZ7+9Rk9HcDa0o9VdY1rM6IBxm82e4P3Rwzo71MPpbpCvWMX2dEb9SsVXCLYcyV9hDyq2Pabj0TKIPy+Yc2uKdZMGRxyUhoYwEz608iVsicwvA/NKzuuw1WltqH+uQ012JWjfkQxDjyKCYTpBEXLn+Qafy4cyZOL2H55SPbISusHDcs9hsceVpOZnHTgD0nhWKu46ZEfb18Qv5CD7YHb3iPO51LrQKTEfFzPyJt+ULqZxnTdidcXVOyo6rrkUZx4j4PLftrpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Be6CmeA7WhGKWOATU+IgFXolrTkHcEuodTkohAhBME=;
 b=UzbeDCsvvUr+c7BloWjfjawbNNhM3NaFw9O+Y7CtbeoJ2jdQiw/LcZr9DTMzIoaSfCcl1Bt+QRKWcsj0cu+NPizk3uMw3IRl2E5uxTKFfeXSLUTzXUlYBNTBWlESSzv+1dWBPW+4ZwANXqdrtld72RQG7tiqS11LH4UfTRb6FqGYeJK1Q1CIgZklKH6PdX5rvA0+H/L58lXI/dhw8bj6ONCNXkTcVHGbjcJZhVNPv2LGbv4MZvntC1wEj5jO25JsIhcqtuUFdryOR3ROIdPTKe1VdpPYVHYPik0eEwBCgXERDDw6FGotttNh8s+VzO7CQOWqD1f/JcKWEOK24QvEZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Be6CmeA7WhGKWOATU+IgFXolrTkHcEuodTkohAhBME=;
 b=UOPMXZp5tS4U8vRJA82N/XjZCFHyLaOHEGzbQuS87On/W2ooyDj4WtXK3yjKpTvHoRHVVj8yFazEsR4nonKCrt8AlEvwV/XO/C8B4a3whFXo+We4k6GRQiOCupDGsGK3DHFj9ai/ZpBLd2rK9CYVxWkNhNZrZXHKog5IUWPtsPFh6WSGOixbwCwrhJo+cRYWZ8Z41ZijOQqgnf3/zKuRQ1Gv5pHkfu9OHmq/IbMk6gwaMBbRS8vvC6I1hQiURyVtZfTng0JBSbvLSDvQZhnLW0KR8DxCCN6FY2VOjJitO5iLF4orL7LO6rP4ubqaHhfWGGaYd4/5hnvRl1FF15mm6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AS8PR04MB7989.eurprd04.prod.outlook.com (2603:10a6:20b:28b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Wed, 3 Sep
 2025 15:08:20 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%7]) with mapi id 15.20.9094.015; Wed, 3 Sep 2025
 15:08:19 +0000
Date: Wed, 3 Sep 2025 11:08:11 -0400
From: Frank Li <Frank.li@nxp.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jiada Wang <jiada_wang@mentor.com>, dmaengine@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/11] dmaengine: imx-sdma: fix missing
 of_dma_controller_free()
Message-ID: <aLhZ2zfh5bnNoH8X@lizhi-Precision-Tower-5810>
References: <20250903-v6-16-topic-sdma-v1-0-ac7bab629e8b@pengutronix.de>
 <20250903-v6-16-topic-sdma-v1-8-ac7bab629e8b@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903-v6-16-topic-sdma-v1-8-ac7bab629e8b@pengutronix.de>
X-ClientProxiedBy: PH7P221CA0052.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::23) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AS8PR04MB7989:EE_
X-MS-Office365-Filtering-Correlation-Id: 23948485-8e79-42a8-bce1-08ddeafbb7c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|10070799003|19092799006|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7qwy6JsQGxjn+fA9w7KHbCbt+CH3BdwdWqrrthqd8N/cMnF79sJwiJK0g8Ev?=
 =?us-ascii?Q?c5bPgRjtZM5mL+WMi68LD89FCYjbfbD6AgiRnA4133le2SO7bBpmkYVfJg17?=
 =?us-ascii?Q?qaHEwN0aIHaB2pu3/nvHPhahErCvKEqJ8oES6PoxQXwntUS1Mubox4xqUMol?=
 =?us-ascii?Q?ea8X7ZLQUd40hh10fZuF4K7DuIoH9qjBCan+kQfrQlmqR7H4R1pYMkcCuf55?=
 =?us-ascii?Q?CIo5OM6OoeVUM+HmadEKQBKAJ4T4VcvLi49ZtjOoJNszF8et8eVLWddQ+Gpx?=
 =?us-ascii?Q?fPN8GNdsHa6xK862wo+oNFXctJw4xndo0Yuqh9WicL+dh7IX0RcXCvjtzZgX?=
 =?us-ascii?Q?LvtP375/tbwG+hwY1b3nX7Sgt4l7QMUD0e2da2vWRVBuuiy4Rfjkzhzc8Bno?=
 =?us-ascii?Q?ZNuAwMZXSYEytiCi0ya0z6La45pETHvpa0C4Dy4/g4OJeIoVCqeJQLGtG5tn?=
 =?us-ascii?Q?d6C5iMeTX6JKv8xToir1lBcpsgieAxYRxB5uGgM4NzlvvK5gPjMhDs4s/yKs?=
 =?us-ascii?Q?Rw/vm89TBHDVvwVjG+k+q+d4ps/d6oAkfcluNwdZP4/BMlVGWwtEp/V7xL8o?=
 =?us-ascii?Q?U1Cy+yc96J9di16SelOxazgOdYE14/ZU2biaXLrx7aiN6Jy67aN6XIuSUnyV?=
 =?us-ascii?Q?b2gl3gtCz+H/NwMZusx1KAfmZ+yY5kmupHjw9uJtWWsAY3INX1VD6B2telEZ?=
 =?us-ascii?Q?u2X7F2gmFqiPlW/uoWmka7DAwNqfFi/qGLRZ28Wm7A1Nb4eY7tiOlCwjdg8B?=
 =?us-ascii?Q?IMX3foD5RWlBnWOCnPUuBDM4WmtVoConzOpj3/KcV8WHjNQdLb3zbqWnARHd?=
 =?us-ascii?Q?sz/FXreAyvUs/kKLc/QbVuReDOLb4xS1bnhENKmze/DZif8l9gegLjk+Loxx?=
 =?us-ascii?Q?/3MMtINBKKz8Ka+CPibtSlZU9v+gF4C2SV4yIDXfYrmnbWWomCrC/x7OCDB7?=
 =?us-ascii?Q?RdU9jAgpee5/w9BHE0Ggy2nmNzOEvXb7wcKgfpa0aS76TtBSD6fzp4+rXYnt?=
 =?us-ascii?Q?AQ+9lXgz7Xe3BQOcUBV3v8IsNR1HKhzMlC6gsmV9QojDWD478wWAHZ4OWSM7?=
 =?us-ascii?Q?kVglDETXGG5Ee3tZ7Buejo3viddWLZ8eEXhJ7sLXz1rDa5NVt88QWClQLFtj?=
 =?us-ascii?Q?HuMdAovN96uxf6u6+8iVX1N2vu9nUfmohjNPKA/FRDgYigGyMmL9yfKQNJJQ?=
 =?us-ascii?Q?sAgfHNxqxAgX9W91uPGK4Rt9kBIPNLvI+CIVv7YE6bTZpK8Ebu7ywB5RkXD4?=
 =?us-ascii?Q?yrSL0vCDZxM5RT6iloAa41nQYOS98WRuCOsMpQxdWGVPm2doK1tkjhbybU6/?=
 =?us-ascii?Q?Nyw3v5MyFhvq6xoPINJ9QeLhkjqVi8HG9cFwTOYdEkXAtfSRh16ts/NzuJRK?=
 =?us-ascii?Q?e9AhvyoWGmxQ21NpC+T6BT6GactZNilg547H+BtKsd7RndGwNWB9mQWGd2XE?=
 =?us-ascii?Q?N7LBYh4Cnec=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(10070799003)(19092799006)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cZbpk9Igy/4EdyWUHy1E/m9DnJ6WkrkFnsMRK3y/ciexyTcPz78ufbOfyCJf?=
 =?us-ascii?Q?8WRT6PHbvcPWnSmLZxc8lZh2ibZ/kzgQL4VJLKYDv9Md356q12rOmsCc2mWR?=
 =?us-ascii?Q?PqHXqkecTCmFbiCPAa2dS5pi2DQjBeVmCJWXpr5sOLB3B0am/kbe6WDgKH5L?=
 =?us-ascii?Q?jOkxb15igHyvnrOXRjg2lci6pLIeZ9/W4994RT0izkoxDWQgtiFDb02Cn04r?=
 =?us-ascii?Q?hGqj1+dne/mHe9jTiqBR7OFzagVV+B3BNxfshErXu46/oCH1TGu3I/ePy4aJ?=
 =?us-ascii?Q?hZ9el/Bqlcod2SLJ6wmXaENWaGe7TINTA2ryM8sZhCWLwT7tejPJyXD4xu0Q?=
 =?us-ascii?Q?Bdcw1fMmrnYDDGqgUWqxx5jpvmAdlMFvt4/VBVffJ6wo6cMpWTlknO91lqFI?=
 =?us-ascii?Q?5nad9yFqePHK5IH0G1z99GSVJ2JG8zyQiqezTn+O94d3lCVqOT6L9OM85RoY?=
 =?us-ascii?Q?MZ7GD4Z9n2Z5Cv/Wwqux49ym81RYZbBY44CU2QrZ9Kz87ySxuAuLOWpk4qld?=
 =?us-ascii?Q?XYMLUwAMjnpwM5yVx/5ADmOj9EBze75D8u/tpRRwUdLrfx5TPaydZ4/SKNdc?=
 =?us-ascii?Q?5+Cdsc/dTxWrLu5pjaEB30mqRhg2skTJuRfoVzWstFp0CTyl9VrRJHlxohjI?=
 =?us-ascii?Q?gepZBUcbdGu6zhRZ2d3R9RZYoqGppY416mPhcfYzRxV/6IdqIrC85wLeIASv?=
 =?us-ascii?Q?diIkvJDfW01J+p53qUSUxoqYeCRTe9Wfqx+nTSlOtxCWb4xwpP8MuBtzMq+/?=
 =?us-ascii?Q?HRFnGPtm0IJDCaCLcIlpf0eU/7shzFSI7k77Y5t6kUKOAYCtQ603iwYdTgQJ?=
 =?us-ascii?Q?M+EhfX/gPoNX/JI14zcj07y8BOwMkJS08fwnmEJ5/lxIZjvheBA+G85LodbH?=
 =?us-ascii?Q?tyAxpP+r9JtrZ59LAt0m8Zltk5UfkweM6Hh+UQfIQ1/q/jRk9VtmTvByKiFb?=
 =?us-ascii?Q?Ztj1zknO2UA4m7Ilb3hSPc0iK0Sya8LXhjp9ILtgjEsDY2o5yWDcjwMnTn3t?=
 =?us-ascii?Q?xmzFLlmlLwDYaJlyNsvzT2c69NLaNtMVDtTb3naZp0v9KDHrjzS6SGtREBGP?=
 =?us-ascii?Q?VujFn2nqffLhZgX+iekB6d2euDiB/lYmBAIE21OgrRIz/u65iXSQasvtTJfc?=
 =?us-ascii?Q?wOoePGpqdGs8WRDGsBGYJ9PKzJOzg76TbGeVxDjrmYG6h5yEIjyArFvhjcGY?=
 =?us-ascii?Q?YD7EIsJV0eXpyWULeMbdi4ns/W12xf3ANIjpRDq8h38QCGO1naIKJhS8zoeH?=
 =?us-ascii?Q?zrUyIJug7RoZTpZSyXWrv1aljMO0zS9iLjaS6t3ig6EBfPTg9CuaAHXHSVVv?=
 =?us-ascii?Q?I8YsatcNqK0Wku+QY+TSR5lR4TZ2YObMx3nF6PW/TEimlRoQwWNEakhep1Mu?=
 =?us-ascii?Q?YalP69iaGtmKRXd6O9NtFkhifwUmNZViA9eKH4tSBFIVTBk7cvKchutjzuxc?=
 =?us-ascii?Q?mhqa1U4/qqdtRmHU3N6DaHz3GA0MHpEaD7qm2zikk+bvvDB04idrpLxP60+w?=
 =?us-ascii?Q?o0XlU6coxKMmJS32MCNAUPST/dZe/03mdcirVqIM+DxmHYgB9lK68/3wAkvW?=
 =?us-ascii?Q?unjSoLt/8ckSQ4xb2oXkiN/E8CMuw9ahjV5pbuuCEQfB+cJYwYwkg/Yvr3xt?=
 =?us-ascii?Q?A9DYRqH0VBu186LM8xnqzq0Qx5wjgg2g6Iji71mXtnVn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23948485-8e79-42a8-bce1-08ddeafbb7c0
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 15:08:19.9090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: depLDcqY5sTAYD09AxAFzwfCFi76kz5uZDZjOtnOsijugfeNZyt/yBVBdF/Z3rQZgHgipvYIId0beKCbF7Ejhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7989
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_080824_413655_92269F10 
X-CRM114-Status: GOOD (  20.18  )
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

On Wed, Sep 03, 2025 at 03:06:16PM +0200, Marco Felsch wrote:
> Add the missing of_dma_controller_free() to free the resources allocated
> via of_dma_controller_register(). The missing free was introduced long
> time ago  by commit 23e118113782 ("dma: imx-sdma: use
> module_platform_driver for SDMA driver") while adding a proper .remove()
> implementation.
>
> Fixes: 23e118113782 ("dma: imx-sdma: use module_platform_driver for SDMA driver")

Look it is hard to back port to old kernel.  Can move it to before cleanup?

> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/dma/imx-sdma.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
> index e30dd46cf6522ee2aa4d3aca9868a01afbd29615..6c6d38b202dd2deffc36b1bd27bc7c60de3d7403 100644
> --- a/drivers/dma/imx-sdma.c
> +++ b/drivers/dma/imx-sdma.c
> @@ -2232,6 +2232,13 @@ static struct dma_chan *sdma_xlate(struct of_phandle_args *dma_spec,
>  				     ofdma->of_node);
>  }
>
> +static void sdma_dma_of_dma_controller_unregister_action(void *data)
> +{
> +	struct sdma_engine *sdma = data;
> +
> +	of_dma_controller_free(sdma->dev->of_node);
> +}
> +
>  static void sdma_dma_device_unregister_action(void *data)
>  {
>  	struct sdma_engine *sdma = data;
> @@ -2370,6 +2377,8 @@ static int sdma_probe(struct platform_device *pdev)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to register controller\n");
>
> +	devm_add_action_or_reset(dev, sdma_dma_of_dma_controller_unregister_action, sdma);
> +
>  	spba_bus = of_find_compatible_node(NULL, NULL, "fsl,spba-bus");
>  	ret = of_address_to_resource(spba_bus, 0, &spba_res);
>  	if (!ret) {
>
> --
> 2.47.2
>

