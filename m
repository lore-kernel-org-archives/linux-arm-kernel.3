Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F341C5B567
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 19:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=unmWTVjKgPHTQyj2SnnDeQXONLvEwexmaYx3XqyFK38=; b=clEy0aoUmJo3KBf9Sb9tBMF0yV
	u63txBBCi/W6944zHjGulvgECo/xyUZJZBRKBV1H47TcuNmBzy98J5W58uX2Kd/59brB8DVUbbXHw
	qdbuFD9MyVcMVjekW+hSResQfwPOcSefTdlZB4RtaNal/tMHLk8SovVTfGhOvVj0ybWknAQH9QGPP
	IM1oUx9dspU42CsZJsM0q1+JIhtgBwUwBK8cMrHNmSpUrF0iLAREQNs82dt2ByrrrU4T8A4+2oB2Q
	DxsmSyt86NYSJ6cCFz0SDWwzMk01cjkqITnCfSHGYsauTi9rLnJx6g/s6k1938eAk3qZo6IQo1OTc
	qwZ1aewQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtVIX-0000000ChZq-0IOR;
	Mon, 10 Aug 2026 19:04:33 +0000
Received: from mail-westeuropeazon11011057.outbound.protection.outlook.com ([52.101.70.57] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtVIU-0000000ChZR-2rUW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 19:04:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H7duxNz+qpBE53V5ub+CAtFKBz4NHbeT5zcCtpG+3Ff6Ubj+GjecvEtjLJcmiJJu9ELfxFdiuM2wHvWsJkvM45kab9htF9vdmPOxtnJtY9jaREwxrSih1WP854rCtlnfdS3OSbVAEbu6Wpq8rL63WcWbMjBQFVzuw6DbubJ109z3WWc+xbF5FS1WlS5PdjadMBhmuZqRX1hfWyJRAo9Sh9VDmHjVmk+1zcJQBa0HYc4WYo2SlJfQjGnanVh7tYqBdaViA2e9pJNiSYQdwVkkVbY5dBTNWt3JajP1/bKU13OlIUO7/a8Dfh3wBDNN8Z85En8usBVs8F9LZgqRwwuoTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=unmWTVjKgPHTQyj2SnnDeQXONLvEwexmaYx3XqyFK38=;
 b=FjBga6GrzT619leNCgwwfVj8sdP7i+VX8blj1r2Ds5XmJ/eHNtl4nL/924yUvfJfFTW4Q2II7nw21tW7S7XLYbNBPUNUdgW/yWAAatTR1FKT3RRiLWh18JcalrTTRC+cZVYBTfhuf4u7+VoYrl9O6aCbNCaVj2AMQjjEyH3cpVSF/4z1BEfgshJTSX2KF8+f11qCD/kDHpiIywpYEyZpprGVWtCnZ6UWRO3CF2FXvewlzKlgYfgrhNOuhjXUtXz8KH2B05f+/QDFjbLkuL3i43DQD7SSK8TqBbkWjMUzcOWl9f6j3Khtz09SlA28ua/YT8ruTm2pVGqGaokqrVHJhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=unmWTVjKgPHTQyj2SnnDeQXONLvEwexmaYx3XqyFK38=;
 b=uZj9tglokzml21bgE2UFxWzmomFNFDTCm9qhdd77f+7WNofPEGMQwqDGWtq+ttbXKASewSfDEK8xZnYEOiMObKEP1G8vx8rG5OhPc1sXnd/wwUOyrrFVODxwu2blJyXDbe9uEA2nSm2v/7tsBbFD+gHakLnEO/Mv1geDyDi8J+ZPGuaJ7nvgamG8lcyocvJ7ev+qqZw/UC8xicMUJTpctD/icHGQXNuNscT/gK+tax5+BgxcGiyrZGuv9LC2TYUY+GHqTRRkOCBvVbLcfXV8IR0mbcouVLESwKos43a2ARCV462rRKSU6qUP9cnoWAgGnip3tA9dlityOL9tGcXBow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS5PR04MB11468.eurprd04.prod.outlook.com (2603:10a6:20b:6ca::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 19:04:25 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 19:04:25 +0000
Date: Mon, 10 Aug 2026 14:04:14 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: phucduc.bui@gmail.com
Cc: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-usb@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/2] usb: chipidea: ci_hdrc_imx: Propagate errors from
 optional IRQ lookup
Message-ID: <anogrivri-VtE3Q_@SMW015318>
References: <20260810093112.47807-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810093112.47807-1-phucduc.bui@gmail.com>
X-ClientProxiedBy: PH7P221CA0031.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS5PR04MB11468:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bd3f001-b12e-46bb-a0cf-08def71231c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|366016|1800799024|376014|7416014|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 8qC7QINMyta3+aXUTrQrXfq50Jo8V+hmkJoeq/mWZSDYTeM/uLMl6RERdRnUv41J6yLSLE2/PvBIGeTpq+cLPo4dlR5GVlO3iLT/QXbqk4PsEtSYO+wefUFr1JrWs80wY3Vn/Wvrueik3OLePPO9aTQXuy1+2l41s/kF14yCysmENpWYTnpz97NZplpmOlCEto5juQLIhcg8qFn02BPSRlYxY0BO981J6SkM4DtUfj5T7gEdPDOtWvgW8urKaDwcsOHbkqNUn8l+8/pOYYEpx750ZzQ8BrR46HTockU55Gc6kCq7HR5sJc72GTJdX94TICsG6QQr1CqednprhLUJXh6jB8qFHb9M1kd58R8z0o7ajUZvoduW9DYOKzwSdUhnfCPNygoOaRSUFs9qrkJdWNs0Y/DW4cFceWgz6jWl5PeSt2VWFZZiLM/ENLSt7THNDqIAl0gB+emy6IGjBaWii/nZSWsPGIedEY1t/Wo0LLrtSOsDw59Y2HEhb+2GHW/SY/bkadlhywH3GNtd5Lu1gfRFJerdcqHYkNkpq4g6HmmtowZBiUgVDMEsupRIaISFTOfZRKOMOICMZLh4PBE4519tfNUW4jlqVv6eAIDn7Tf0TWTDa3wD+mnTdZiOYbRx0rgiqb/4t0G6XPSWHrktD+oJL86i/54JeQfEHJQAxGc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(1800799024)(376014)(7416014)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?teYlRn4l/dE2zyL3MW8m4pU9cQmect8ZSnCQe0o0YMeh4YNW1Ynv5zl5sekk?=
 =?us-ascii?Q?6Lm1YEdWBBNggzet0kvFXiNYiOER4Ytj2/lwQe/88gT6u6JCsOBWVtOut3MD?=
 =?us-ascii?Q?cVdSl3BB7rgwnZFBrZv42k78bTocYTGrOg9WmRBVUdnKjbl5o1krps/eoYWV?=
 =?us-ascii?Q?IeXeBAra1vf1YuQCpZ5Ys9XLiUzl3/frpUUMsP9B74+vDdwi0Omd5EfeKE74?=
 =?us-ascii?Q?rkHdUqWtxk+9Ili8gg9Hda6oTgJFI1pG6DLVTRIQ1WAy1p0PxKKAw4EL70O8?=
 =?us-ascii?Q?vDMJu0ZYWq8RuFDWyZNmXVx8lCJlI6P+QCnJzamZ3XoNXnXV6GAKZldu+FbY?=
 =?us-ascii?Q?srHSoLWkeCFZ7RfjNMRCdN6ew5iCN8gXAZsFYF/DOfUGZidgMjgr7vT6ZuPd?=
 =?us-ascii?Q?yAP7IwzuOgomOQ70tHrqfg/xZil+6MdI0rwxUGxgfQu8vvzFeHBOD4xvSV3N?=
 =?us-ascii?Q?7y/ZpvCtJ7Zu+MyMWqVqxF8U0ZZdpq0Q9UZEuPw7yILqlyKprpKVTCRmOVTR?=
 =?us-ascii?Q?OJ5m4IQBYOFxctxk8Bxr1NIitXpf0vKtZfwettdp2q0SxEE+TT453a2bFy5o?=
 =?us-ascii?Q?nWhY5gLN9XBqL5+ZK88QNiSlC7mE+Bf5vtfHxsLxzZA7tHNRoXt6R8obzyAg?=
 =?us-ascii?Q?Ff5+DyQXrAaLT2Hv+fMqJ5l7TedkAoFlauq46bO1ZQUrYLY2w+Mkndc7IOoQ?=
 =?us-ascii?Q?f/hvjtl3EbNk0GoRr49CRFokMNC7FESasK7C/3aLpOTmAT7z5Q7BbWd0A4HR?=
 =?us-ascii?Q?FCEpvavoQC/rX+Bi+z1H7+ARjf1hjQ/aZhfxGcV8aIgkeetpYsyDae4+nGOm?=
 =?us-ascii?Q?LeWmtbinhTQPWyj9I3fAoiB2ZZ83zmHGnFTkatOAelT+iQv8zPQYu7Ae5o5r?=
 =?us-ascii?Q?ffg7ck3Dymr7OdJRRPVLCBYoq1n76CquXW4F8ROglgstJANVGFSfw4MC3vGi?=
 =?us-ascii?Q?7kqRL0L+TMfp1OCiG6fXFMkz1p9+FTlylHb3+uk2GBA3UJDGV3nel+dfDIj/?=
 =?us-ascii?Q?N5xTH1xlY/fDlscf4du0K14PqkjD8giNd6fDXZwz3irgRYMsMc4CloqMfWed?=
 =?us-ascii?Q?/nvXdaE4w6tb2eRI4i2FHDPkka5Z+oYTLrtzzADq2wERGXrF6m50Tuj/bxJC?=
 =?us-ascii?Q?fphJupQ5pu0FLToEp4wkJn7m+tUt5hijFWP0q00uZuQKvHtb1BuQQDiCu0ny?=
 =?us-ascii?Q?w8OQpfj3fGbJttJHOAKkvfnD2SGr1QaSaLMXl7ABsjv38QoLtSJV8xvlaKFT?=
 =?us-ascii?Q?Pa8d6/VREK2qjm3qqoX1CcD9jdEz4RqTUmGFiUYIPJMNJ7+R2jKX59PddFRg?=
 =?us-ascii?Q?Xh4+Ro1l7nG47xfo0np+nhndj1TrD2o9YVkI5jWeeLQ8VloL84PBxvSa72+M?=
 =?us-ascii?Q?z29PGncvzGkWw/hA3S6mEmhZnZ2JjHZPrCVo93/SYjKj6difewPdUxJBCAGy?=
 =?us-ascii?Q?uhwCNeq0noiMx0K4M8KsT1WeELlN2azVf4CQOakwwePITbjE4VkWfcEoplVY?=
 =?us-ascii?Q?JPGCMbwfy39dTiVxi6yjfinUtRO9QKSy2bzMem225RgWBs10OX/Xnr8JrgaQ?=
 =?us-ascii?Q?f/NSPEIptkr451xV/5HRD0drkEZHRLqh3vE+/ke1ZiEMPxQRh+YaKLnpKTGV?=
 =?us-ascii?Q?6KhWcM8xTEZEUb0M60WKGVnZ86gDXhTbyMDq53lVdz91fZQJhL0M5Zldkui+?=
 =?us-ascii?Q?L9TTBiGK/T0DjsnOu96lzwS2O3N6aAJF7ilYVGIZ9G/A/u6jOGcOjFdxLDy6?=
 =?us-ascii?Q?RJowGfkP+S/08lUmkzKqR2BFGW8clbTwBEizWKl68Eb7S6skHPdr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bd3f001-b12e-46bb-a0cf-08def71231c4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 19:04:25.1286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r1frj74lmzKGcNgyFsftcDEHhCx1oLSqGMGPYIhuqsSYvWBZwRdzZd1B3VdbHLpsY9ugH9/vQ0q+E7/IHb4ErG3c081r3TdRbszyJmQe8rE9sI3HTWZGF0I1AQ0JHnU+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11468
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_120430_723071_BE0FD78B 
X-CRM114-Status: GOOD (  19.93  )
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

On Mon, Aug 10, 2026 at 04:31:11PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no IRQ is available, while other errors should be propagated.
>
> Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
> probe without the IRQ.
>
> Acked-by: Peter Chen <peter.chen@kernel.org>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Link v2:
> https://lore.kernel.org/all/20260807065619.30604-1-phucduc.bui@gmail.com/
> Changes in v3:
>  - Use the phy_shutdown label instead of err_clk as suggested by
>    Sashiko's review.
>  - Add Peter Chen's Acked-by tag.
>
>  drivers/usb/chipidea/ci_hdrc_imx.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 56d2ba824a0b..9e529398c607 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -525,6 +525,10 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  		data->supports_runtime_pm = true;
>
>  	data->wakeup_irq = platform_get_irq_optional(pdev, 1);
> +	if (data->wakeup_irq < 0 && data->wakeup_irq != -ENXIO) {
> +		ret = data->wakeup_irq;
> +		goto phy_shutdown;
> +	}
>  	if (data->wakeup_irq > 0) {
>  		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
>  		if (!irq_name) {
> --
> 2.43.0
>
>

