Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9971CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 11:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sc/B6wiF0kc9SOOcKX9/mC30ZDmPvdOcQYxylCdpoDk=; b=DRPvTxW6dtaFF3CUNEON7w72vQ
	npjrzQZmsySOTVJULiaPkFaz27F+CVnjrhwhQul2T5HItM97vsAii5LOD+sxBRdNo9L+eCOZ1ejVL
	jevQ948gkphb5x7maYfEuoYhpYcxjDxpaexub/wQXgYS1WP9DTVRK/6MO++2xUbLNUgCsX36VLNDZ
	0icPTNOVvwjuESQXEPG0278HqTDGhyO/zeHkOBc6VPMbGj8yD8wG2iol0c8BzDxB596ikhcvDlpq+
	yC8k5Mnkq+GMlNcUxEoMZPBLMfXupsOjL1pnVdYksmAzXJlqSzPVxTyOttYyqkT1dPGgKiIhBER68
	gdQb2c/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbchv-00000004tUV-05Ui;
	Mon, 22 Jun 2026 11:20:51 +0000
Received: from mail-westeuropeazon11011043.outbound.protection.outlook.com ([52.101.70.43] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbchs-00000004tU7-47Wt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 11:20:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VV2wlfccEIAM23k+k4GlYWznyG40QMN6Zu8wVVlmp3vbvxMXkZVVAJNDOeZsxJ7D2PMmNYDcVoerWwhuWt0z6dbBCN7dYs1WGG3UsYC8MkNP8JvFIwhjtKHcCOrKepdDJQlL/A2vt3RG4kYz4b6E5gfrBIKFcaXZKFKIk/Oc4Wz7F1LIVxe1UztxpuLuJerDK1Rp+yMQxHm6Sxu7rrb1SCgFwKybW8UO3jY0U7MV1CvwcdtTdN0m07cqOwZHpEb2dNy4r8CARtrDySAVhQ+bx9ZWU1K0dpRQHwlPWoJ7RWTfNRlG/5H9UTcEZAZot0uO7ODZt3lLHfiuzd94Q+lZ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sc/B6wiF0kc9SOOcKX9/mC30ZDmPvdOcQYxylCdpoDk=;
 b=LbnnclhAmNBwL/xfiE5Nhxsf0VrBqp3Dai9OY9WEI8NlkA5dfzaHNpXGa2aeeexvFrShSm/cIyCfQ2ILWnHyijMTwLGDYqwbd8Uc92xlPRna8VlK0tHDAUj7xa0bZIy2mXdjR/DKxlbvY+qCRWhTvRGExCAc6kDRnQS0PDP3Jc4yp20Q7h5t5i7c61B3rbsQXO6c1j2jM46cuWzY32P2x4SAuXeunSgf6UYzh4MlbIFq10+R1kS2Qf0vkfSNxIWVKn0W3qF4lgDLokLemWpRkEs1w4kC30K/z3B0OeZ8hZNPF7VzF1FZ92H+OHF2/CxUmJ7z6V7dan184MrOoD4Xlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sc/B6wiF0kc9SOOcKX9/mC30ZDmPvdOcQYxylCdpoDk=;
 b=kE1dwQKZpYE/uavqI2U9G9ulN1l8rSKRUI91JQ69/Re2WswLOf+ePOSwbZlTiRTzZA8rgm+fcgBCN2uDh3mqWX9Xmo6rdOxpUfUlsKyts47FSXteqQ8vyUljbIbBGgKC33WVXZAlrPYC6PCTwl1vxpv1epwClHbgGlcwPvjZ5+a7dQDvsNy3Mlp2Dzv9F5rauqFJ8aPGUGP285TpoaM6jpi653INcg7Yy6IUBTYxr8PBjZkFQRv9AVzygdGZAUrE0usMb8jdDtG5VE65OCqCHJa1YZF2vSVpq4LdD+7GUlB6FdYxeDmIakmV6vZjJtR7ahw4YZBu7ZeeJHWhuEjUjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PA4PR04MB9709.eurprd04.prod.outlook.com (2603:10a6:102:26b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 11:20:41 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0139.009; Mon, 22 Jun 2026
 11:20:41 +0000
Date: Mon, 22 Jun 2026 19:24:00 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v3 01/10] mailbox: imx: Forward the timeout/ error in
 imx_mu_generic_tx()
Message-ID: <ajkbUNkn6MSw8txc@shlinux89>
References: <20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de>
 <20260617-imx_mbox_rproc-v3-1-77948112defc@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617-imx_mbox_rproc-v3-1-77948112defc@linutronix.de>
X-ClientProxiedBy: SI1PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::9) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PA4PR04MB9709:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b9c75ab-c532-49a2-4374-08ded0504b4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|19092799006|23010399003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: /UYkdyHatYGRdfyBiQD3WnrhV1p36cmaDl7U0QwU6Vu4SRIU78cjfozom/ucZsa3/nzHvF+YWxft6eePsK4FcPSYCwRt+ROEpfMwpftzZdN4dL6UnebwgpyO8zfi1Hm+TTGkerT6XXeHLLRe7E/zEMSFg3bDdCfAqonO0zjb9KkBLpR28z9vzpbp4W6Ess8LroLe/tRKZgO7cKjd3iATxrtKHXt/16NDKeXUUEPNf6G3tAzsna3wMLc5Vd5dUKXkT7Jxfzl1R09QdmZDDvNGGKfIA+f3DRO21f+7VKGpFpsoct+vucO7tclDwSigza/IJx4AXlljl3z3D/OqQdqd0RasvsTAqf1+xkviNEdYv5mCiuWnHENCdKmco3X1YKiBRFxH74KY27ufIe/6l8/uTNrfe9hOU2uB6pU1U5bf8/TdtaK1q/7aViYOYGfw/ETKe1JqmNKnBDudqAssxWYkx/VvzIP/3YDL/m0ujNLY/lfOBahN83Ka737jHkts1Pi9JhKAutzoS5HvWuUm3/Zt7ws3uS0lKiaB2zCcoljw1oXLwBeZt3qB638nrWos2vIF4Gndww3RQtFJRL6SmD97vIDO68Li/r47vV6VjiH5k8gCV/CzxwpFwXF+VfedMXpcnPcAW9QJ6HhP2uXt3rQBu4AzAK+oBS8hVbFEtfuAjkQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(23010399003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EOXCED7ejezImvXJQnNmb8gHJhiKd2cxDca3uouBezyP6ts9r0knS5KAKodL?=
 =?us-ascii?Q?WCOammnetLmcUSeHUtCBq6qWwcfULCI8pJwMufU1WbZTbKyTTKReJV5dTpse?=
 =?us-ascii?Q?mckcbFLggudZgism1fBe7cn5mw3vUxhUQjHwUfvTVdqZHyI4CeANP6QE8aoN?=
 =?us-ascii?Q?/iMHGahGVh32uMc19wNsnLCGAw34haLg55uVuqJ3HIBukJjdzetkj8ctIMsH?=
 =?us-ascii?Q?OZtKuSCi5Wlw79G+QaHzJyBQej/NJYheu6ChCg4NmLjRSS1U8B/Ig832+NNX?=
 =?us-ascii?Q?y3IhM0Eg6OSnlY70Mzj8UzBeIDUf1H3zPV0l0rKSo2Cg5ikWiqzhhlVDpy8P?=
 =?us-ascii?Q?Ar4shSlK629vRJ9sbvd5FQsGMTX0WnDiPPbxrNsTLZg+6IY1ng8AyfNlF9Ia?=
 =?us-ascii?Q?xEqtYeVW9vYg+E/+8eVz+hN6JNlCe2khbXaSGmyTRJB0Mt3DH9A9LuyQmLaY?=
 =?us-ascii?Q?JkZN5R2eYshwp9QGOSlo4fYmLG+XdxIXjyjXlVxiQMMY2pBhu11mpJGgLpoZ?=
 =?us-ascii?Q?6cLNcShQO6QU8Lp/bletpBhKgTUCcz7r3KM0wdqJha5vxg/XZ40cLd4FW5sV?=
 =?us-ascii?Q?eTo4USpFkX2hMyf1UH8a+pSArhTd858QohaejImuKd+IinhGEo7bg3F1SEWt?=
 =?us-ascii?Q?izlFXSF8gnKxnLrjtaeixQGe1F7+JLekFaORs6U1J6CPP9WmVDTd8JckJbPe?=
 =?us-ascii?Q?NGVcS8F6l+A3Xp4cJYgGf3McfiuD6foH3BVCGmEylxcL8vhw2eB2cPeAtcNj?=
 =?us-ascii?Q?QuxGBbiaXz24n8YNxTSYukoc5Nf7JQHAQB96D49Ugqy+dXZddNuUmJH15uI9?=
 =?us-ascii?Q?fZL32gHWdPbP2WK1DlVA+fPpa9g7V4/99gA2g5HFmS24ReGYdw7N4EyGscBe?=
 =?us-ascii?Q?TJzQsYnxR8/0rSiNi1qA/vn2mqSRC0gBLzSe+vWvF2UYcnqPagPCCL2TpcJK?=
 =?us-ascii?Q?8/ZuPbgjfyEcyM5mqnca/xaeGW6gcvKMmS6gNaAQnn6+p//dNAnvblsKBh4i?=
 =?us-ascii?Q?714Gpn9ZPWTdMa1zxCs1ozGWjcRCcTDJ57eLgkc8PIutYUqo+Vc5w0SZJWAz?=
 =?us-ascii?Q?rWZxrzpLv1hBSjAQm4J1pydYZbf+2UGmsJmhjufyLpJzdHb60ZJNOGnbuStg?=
 =?us-ascii?Q?3BIt0kd9CjhbqyjDSwtqadUmt56IX5GTKo7vsEiu2Wk8/LceS1ARvtyTb8MR?=
 =?us-ascii?Q?M6/CBT1gfQf9Mgr80hc/MUUSNaFI2APfs/mtcOOn3QhUxwSssVl7Vx0gJZ9T?=
 =?us-ascii?Q?8YFltED4SPYcgy8zhdgegy0/c46V8iP0ihWiIBq/L0G7kJxGaV3LWfkj6I7y?=
 =?us-ascii?Q?3YbRYG+wAJLObWAetgw9KPiJcUpqoqSSP3o9uwbTkD73QP75/0mDVfmNHwqL?=
 =?us-ascii?Q?Fagx+9n44Cm1RWSClkdwrWzUJzfHyMVpW8T/6jdlILUTHgIunjBZNtnGxMcN?=
 =?us-ascii?Q?5ew77MvQdug2kdcO6bOsFRJK4DRdVanExf2++SSsi4JFJCQj72bItbxESlvc?=
 =?us-ascii?Q?bmrsnfrCZEkLB8R5g9KRUJE9SylAq5YxjIzIv1dXAznAscQbp73M3ojjCNj3?=
 =?us-ascii?Q?wHds4MCLlzYrTbHYdZ39N0IO5d9iLbgAAZ85RJqANTxe2ZsTphBGeGVjk5Jf?=
 =?us-ascii?Q?8A2zrQGvbdu1rl+9LO86iVNnoHa19ie5/5OMKzFQHZ2BH8PW11NmIQGr5C7B?=
 =?us-ascii?Q?0E+38FRK7asXX2TRe1Kcz0VmqP5yCjapAUBdmrjmevvtl1xFDkSGqiVYffMk?=
 =?us-ascii?Q?7KBEi13bC0LsPKd2xlMfppeEsMXfrGAgmdwj0cAhDm1iXHjeA2lU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b9c75ab-c532-49a2-4374-08ded0504b4e
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 11:20:41.4751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gNiVLXLxLdPCXU4gweL8xSkgitkvWtUuJER/3mI8PTuqkpu+xvUOHeB/qUoaZ2BXdQwXs+exvN3uYPXCDDd1i75cZ8k5b63JcoQiZMqUgi5OITe9S8P4EUatoLMqwS+B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9709
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_042049_047238_2C139DFA 
X-CRM114-Status: GOOD (  12.61  )
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

On Wed, Jun 17, 2026 at 08:55:26AM +0200, Sebastian Andrzej Siewior wrote:
>imx_mu_generic_tx() for the IMX_MU_TYPE_TXDB_V2 type polls on a register
>which may timeout and is recognized as an error. This error is siltently
>dropped and not dropped to the caller.
>
>Forward the error to the caller.
>
>Fixes: b5ef17917f3a7 ("mailbox: imx: fix TXDB_V2 channel race condition")
>Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>---
> drivers/mailbox/imx-mailbox.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
>index 246a9a9e39520..0028073be4a71 100644
>--- a/drivers/mailbox/imx-mailbox.c
>+++ b/drivers/mailbox/imx-mailbox.c
>@@ -227,6 +227,7 @@ static int imx_mu_generic_tx(struct imx_mu_priv *priv,
> 	u32 val;
> 	int ret, count;
> 
>+	ret = 0;
> 	switch (cp->type) {
> 	case IMX_MU_TYPE_TX:
> 		imx_mu_write(priv, *arg, priv->dcfg->xTR + cp->idx * 4);
>@@ -259,7 +260,7 @@ static int imx_mu_generic_tx(struct imx_mu_priv *priv,
> 		return -EINVAL;
> 	}
> 
>-	return 0;
>+	return ret;

We may need to use atomic API for TXDB_V2. For the patchset itself, it
looks good to me.

Reviewed-by: Peng Fan <peng.fan@nxp.com>

> }
> 
> static int imx_mu_generic_rx(struct imx_mu_priv *priv,
>
>-- 
>2.53.0
>

