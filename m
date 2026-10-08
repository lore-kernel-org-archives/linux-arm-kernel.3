Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0669ECA600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 20:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kTKgznc29tfemJK1zKctDOC+pnbgyzSmmEaNevmf7EM=; b=vyWwP0clxTfCjVJDuuuQdjsM8c
	B3eNgHeAhdGFP4Dfghot3X4cV8XbEIvtLKKhIv8ObeM7A1nj7cTg08diigC5/eQMHX+b0k8xb4iOu
	HGsDG+SagtFvrAdmtjH7IvV51RL6N25ekgDNMKmp/YNeS8x6vWx+e99N4rKiHJ3qiV16DyuB9vYTb
	pymf796OeA1affZ4YQ59wFe5drH529Jcgfq7WRnfv/29oF8v4y2U3w9foq9UDD4mwckbl4TRUQm+V
	ijB/YuRHRxLZuz4QC513Bksw83Tq6HEw1In6j53ZOufYyEgyi3srDaTlyvOPoU+PiwYfW59g5nSv6
	Lsl4tjjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEuXx-000000050N4-3YCW;
	Thu, 08 Oct 2026 20:16:57 +0000
Received: from mail-westeuropeazon11013050.outbound.protection.outlook.com ([52.101.72.50] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEuXv-000000050MY-3XpG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 20:16:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jonxyTtygwYiwhQCzHVmdMO3kVzGE7/nIdwOHmBp9OrNup5GNzy9VOBZAd+uXQeyEvNBJ7h+aqXtKmjtRI66Cj+dlU0yGnXRHM8CdhYo+uPvxcSimnPRApkSuGHnvQjzjLWIIKvNcp4tZIwyLVXVXyBFw3tdZcwOG6esg6U7UJtbFNeSTrGU1XhFHL+iUSt+9MakNqYyiBufc/rQB+riGjgK/Wu3hrVe45ZwctEcaCkPgzvj5ogOzToDZE8N8M4+ca/ZTxMMx5z0rc45lBjNZEQY0JriUKJcf7ANNiAuNim89lM+UDhTrgweemST9xf2XW7r7xUm3uj/CLr58U9wYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTKgznc29tfemJK1zKctDOC+pnbgyzSmmEaNevmf7EM=;
 b=qLRegzDRa5U0WiwYiLikKgg0eUFG3GGdrjBdKHwZjyS9Wdmw8nvvUbZvTU5nCBT7mTeDtjzZUicEmQgDCyRgECiyqAYtHtSGV5wFqZ2isRx1djIc18v+rjYZHm+eITkfopHs+6qpSAcGONamhcCOMPcYZr9PxBqOC/vjAYb/OoQKixbNwFXWSB8xzN07feuPELPeOlmNP/zs9CeEt+24oabMyi4h3diHT6sbxTWsMAC9ORY8XT36lwcXYYxUHg71y2ss/hYE8/GHDiyiGsENbQC1Jy2BM4RRKpzJOCpAqMJG7nLGATL5wuGFkL7SohxxfC40obWNUsGx4miS+Jzh/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kTKgznc29tfemJK1zKctDOC+pnbgyzSmmEaNevmf7EM=;
 b=GUBHFBk5oEgWXh6sngSxow8pTXPTfKWEX/MikYytZXM+NXGmR+zoI1W9T31AmXxw2XBxHsU+pdX03ZcbDJpBmIcFtDwiTd95VraIXcHjNJzg/kwUSSSTsRq9PWy/rozPH7dyrYKkGevi4R5CPVxyvG2M7L/uMr4gN44kmzA6gEKiF1RXdIEnlJFF15u+wrSliSVM3kEPDOsxf8kgBNOoptNd09YFES7XtLmjei1lrt10XRDJd/2bUNKEtYR+OXP6QKpkyIxavnyL9Jux3mXogkLB5GSBhiysdXiLwjtIObzS/LeiIhRl+ZAf3hmiJjMcGWsoyoD83LH0/y7hNJMl1g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by BR2PR04MB737718.eurprd04.prod.outlook.com (2603:10a6:2c8:6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Thu, 8 Oct
 2026 20:16:51 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 20:16:51 +0000
Date: Thu, 8 Oct 2026 15:16:48 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4 08/10] gpio: mxc: use local dev variable
Message-ID: <asf6MKuL5Z9YY8M8@SMW015318>
References: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
 <20261007-gpio-mxc-cleanup-v4-8-c9f5a8b50df9@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-gpio-mxc-cleanup-v4-8-c9f5a8b50df9@nxp.com>
X-ClientProxiedBy: AS4P195CA0031.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:65a::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|BR2PR04MB737718:EE_
X-MS-Office365-Filtering-Correlation-Id: ec64706a-9ecf-4b0f-1285-08df257916c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|19092799006|366016|23010399003|1800799024|7416014|4143699003|56012099006|11063799006|22082099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: WAJ4U4HBGf2YePvz5f3oqlyDhFGGM7/iVnHqSTTiWqKSC6FWfERBp2fwEBHhh7h9SAuWB2xXVo00CCPJtdZoo4tY+eh9DFSeDcB9/iPtFB5XobD5lFZo8Zt/OyA7S+GqTJcogFabmC2GvAgptuVbYk+dxmBJZcbVpfvsBJOoTkfaPSrhzLzmxAw9EvEqAghAu2jyxzF/TFSnl1H/eD5tz3z/H7GKmHZ6BEZQpiLM9OUPPoNX5rdok2Gb3r62SIcWKmdNEx88yISV3PjqNOMuCR/sAZ2SFXGutfa4QLmuUids4TD8vMEusMaL8Un2Z+nLfVwwAdzipjv8Nurun8aqakJ5ajQY8Fr2WzOp8CBuIDuFmdPwUicXRnsr69Vbo4Xpu7iIJeMgv5UAa6LpxzjlIRAjSEs/EfOV3GaU1/nfnZPXOCeBUloTEdr7cEraVun2sgafmEMZBwB9MDfnL+ss+s52ZRSvHsJDinbk4PxoNdfRLvcB97xl9iux6e8VRsbWS9D1e3WkOLE74dFEM0iPuryl/iynxanLG6KAs7qshjA9Q/uKvHx9N7r0Q/V6Xtl+Ay54tMOHMtz/iwSR8dm7DTlOABIfKgmaiJMECm6ble1raWHokIh4oTATcZzHGsbauoCMgU/k+zVFICrNfb6PnDJaEjdFUPSHQsoiK6KXg6A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(23010399003)(1800799024)(7416014)(4143699003)(56012099006)(11063799006)(22082099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0acKwTDG8EYc0tmXK7OVBnr7GMu33yu0OkOLWW59gICWIoJEh6qLhJLyX5tu?=
 =?us-ascii?Q?gf7CirTfBkI72P/X1SKm/QoZM4eXmuzwkQR/SHTKeQNrgn3GuAnyVbCMkfnT?=
 =?us-ascii?Q?w4s6G6iZLQRgcBMBW/td9ll/IhS0q5bPyCt3rjk6a4PtO+cenJwnQ0R6i0aM?=
 =?us-ascii?Q?MrsI46So02pqIKOdIlLZA/BYXeEh2Tn103WVy3deWRgRTxswlTvm+DTC7kwa?=
 =?us-ascii?Q?NnyYSKDewNzJCdgTorJwPIOLYm0BHdQl0lj1YsFwGYRypQVaMLiIjx41/cKn?=
 =?us-ascii?Q?Nf5xC6mKv2XgRgJ3SeAskwmPLRemJphC3spyrUSUTNfgMkeYWu6/zqP5/MOr?=
 =?us-ascii?Q?dy2sQbxLEh7AKyE/zJhI1mQlbsN6LiIKymnruQ0j73lUgDQAY/MApmVRdQIt?=
 =?us-ascii?Q?GZsZxiiEnsGAdu68gTfZR4ARs5sQEU+MnJdK9G5qp57ognLxk+4irGosrjTm?=
 =?us-ascii?Q?eZFXhzrAIuRie3G3EhgsVwOETqpYcWW9k+/Tn3r/0DFtwFAxxOs13jNLW0H7?=
 =?us-ascii?Q?hg6L1QDs3UuMY2eQqHHk6/8DHyn0JP7eZFmHdEFVjGXvH4WPwIITwsytsrEx?=
 =?us-ascii?Q?vUrADTxhLK6bijA89CeLVcMCEkQKrZfkxwbY4d4/l+rsDb6cPPVXZpGXwLaE?=
 =?us-ascii?Q?VpWebYzp8suUzw2dFDyRsnvu9O/cbAX39IcruS6UX9fSce33uOwHVzL9lnWl?=
 =?us-ascii?Q?TjkHijxUbxxa6KGk4bR829bz7PfjQKZ1VpQzhvdwV3ZCUI7BAWtwARKxEA9v?=
 =?us-ascii?Q?2rrJFuAuUJXuchEyjsqS8u5DNWZEhndVG5oTmORyeRjZuYUpLoW/FSfp3uqJ?=
 =?us-ascii?Q?sHvpeYtC3hdnhWNhXNegmT0sA3rZ6vvJU//zP0JiBdVR345KFfPJH7eSR7+0?=
 =?us-ascii?Q?/1thZ75ThyJBdXuvxcjwIa/bJBH8n0Tq+a4qHYoTRwB8V06kboGYd7PUPTu7?=
 =?us-ascii?Q?dC/qB+8wPVjjYOqnsNK3O8gKK7q3EIuikrwNWA2N4KYWN96NWQ5WiJzKV6ub?=
 =?us-ascii?Q?tFKQ7h0RMqFMDJGAefwvBosJuC+3QaivU9CFMgzmkGVLJ5U+YUcgDUeexImD?=
 =?us-ascii?Q?5d9m0E16EsqFFQ7xhyxgqALV2tomE4BSf7HNQ9owe8SGzA5HE26yGt3SzUlP?=
 =?us-ascii?Q?hJEJrkqgvBq8qZJv7THBddx+FOb2gxmwzSs9DsmbHkJei9v2ZOpgewWbA13z?=
 =?us-ascii?Q?+1V/Y5LfSHwKoVrrPsDneY0QNL9Wr/yDa4oCet2C+58ZMbB3j1INkTMdvHPD?=
 =?us-ascii?Q?g04ylsjhBhNUn1F9ojIDBcQbpQGVY/q1LLl9ksCpV4eHvve1tQMDNL7zhDZn?=
 =?us-ascii?Q?Ce9VIQlr9cmz3RAv4/z/ibjDpRYRdI8b7FEvLTRVfmF46dVBQ0y8XouG0EX0?=
 =?us-ascii?Q?bMmKh2A7mJZvfFtT8nHY0rqxqyjETyfGCTCAe8qWARM/R5roGr8vtMTIy4VH?=
 =?us-ascii?Q?Q5t8sP5dBQx5EjGNOh5whxvlVREInc8+nG94uzzK8kTygqJN/oALotEq07AW?=
 =?us-ascii?Q?HrJ/lsa0crGKgHqjrMjccJ53q999spezjzycVQaTrts0U0oYYhISC+oPLtrD?=
 =?us-ascii?Q?0bDT5yd82tFiX05NOvzWsU+sV4gP8xMhWc7j9OkQlsnSKUl87E52QyeGWQtN?=
 =?us-ascii?Q?C1nsFBmuX6k10T7/T70PKbzAISwWrJ2t7+FhXKVU2slOeAxlP3PMNizxXo8R?=
 =?us-ascii?Q?gIW4GumFWKoSuU1yvpQKDr9IRNZQuhSTlMs62KZHuPzJDFagKPF1q8jH2p6X?=
 =?us-ascii?Q?7PvyGTMjeVgXpBwa9iH0ZEKHKMd4paH2jmiyHqA5mDySFfAdPLLp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec64706a-9ecf-4b0f-1285-08df257916c7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 20:16:51.4890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /0s7rFFkZLXMlbeWJwtfAQWTrBNAlJ9QanZDXPs8jkqyWrkiCTCTJaoiZbh9YXU0OqvVPtt7LkzPD8RFO7fE/mDk8KvZ25kjLcPAv2XY0iOiF8N/JAOzuz/VPNkQyFrB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR2PR04MB737718
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_131655_890328_320C2C3D 
X-CRM114-Status: GOOD (  20.39  )
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

On Wed, Oct 07, 2026 at 06:44:23PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Introduce a local 'struct device *dev' variable to replace repeated
> '&pdev->dev' dereferences throughout mxc_gpio_probe(), improving
> readability.
>
> No functional change.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/gpio/gpio-mxc.c | 43 ++++++++++++++++++++++---------------------
>  1 file changed, 22 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index f5f9ef1564cd..9d69524e06db 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -449,18 +449,19 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>  {
>  	struct gpio_generic_chip_config config = { };
>  	struct device_node *np = pdev->dev.of_node;
> +	struct device *dev = &pdev->dev;
>  	struct irq_domain_info d_info;
>  	struct mxc_gpio_port *port;
>  	int irq_count;
>  	int irq_base;
>  	int err;
>
> -	port = devm_kzalloc(&pdev->dev, sizeof(*port), GFP_KERNEL);
> +	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
>  	if (!port)
>  		return -ENOMEM;
>
> -	port->dev = &pdev->dev;
> -	port->hwdata = device_get_match_data(&pdev->dev);
> +	port->dev = dev;
> +	port->hwdata = device_get_match_data(dev);
>
>  	port->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(port->base))
> @@ -481,17 +482,17 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>  		return port->irq;
>
>  	/* the controller clock is optional */
> -	port->clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
> +	port->clk = devm_clk_get_optional_enabled(dev, NULL);
>  	if (IS_ERR(port->clk))
>  		return PTR_ERR(port->clk);
>
> -	err = devm_pm_runtime_get_noresume(&pdev->dev);
> +	err = devm_pm_runtime_get_noresume(dev);
>  	if (err)
> -		return dev_err_probe(&pdev->dev, err, "Failed to get PM runtime\n");
> +		return dev_err_probe(dev, err, "Failed to get PM runtime\n");
>
> -	err = devm_pm_runtime_set_active_enabled(&pdev->dev);
> +	err = devm_pm_runtime_set_active_enabled(dev);
>  	if (err)
> -		return dev_err_probe(&pdev->dev, err, "Failed to enable PM runtime\n");
> +		return dev_err_probe(dev, err, "Failed to enable PM runtime\n");
>
>  	/* disable the interrupt and clear the status */
>  	writel(0, port->base + GPIO_IMR);
> @@ -508,7 +509,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>  	} else
>  		port->mx_irq_handler = mx3_gpio_irq_handler;
>
> -	config.dev = &pdev->dev;
> +	config.dev = dev;
>  	config.sz = 4;
>  	config.dat = port->base + GPIO_PSR;
>  	config.set = port->base + GPIO_DR;
> @@ -517,7 +518,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>
>  	err = gpio_generic_chip_init(&port->gen_gc, &config);
>  	if (err)
> -		return dev_err_probe(&pdev->dev, err, "Failed to init gpio chip\n");
> +		return dev_err_probe(dev, err, "Failed to init gpio chip\n");
>
>  	port->gen_gc.gc.request = mxc_gpio_request;
>  	port->gen_gc.gc.free = mxc_gpio_free;
> @@ -531,41 +532,41 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>  	else /* silence boot time warning */
>  		port->gen_gc.gc.base = -1;
>
> -	err = devm_gpiochip_add_data(&pdev->dev, &port->gen_gc.gc, port);
> +	err = devm_gpiochip_add_data(dev, &port->gen_gc.gc, port);
>  	if (err)
> -		return dev_err_probe(&pdev->dev, err, "Failed to add gpiochip data\n");
> +		return dev_err_probe(dev, err, "Failed to add gpiochip data\n");
>
> -	irq_base = devm_irq_alloc_descs(&pdev->dev, -1, 0, 32, numa_node_id());
> +	irq_base = devm_irq_alloc_descs(dev, -1, 0, 32, numa_node_id());
>  	if (irq_base < 0)
> -		return dev_err_probe(&pdev->dev, irq_base, "Failed to alloc irq desc\n");
> +		return dev_err_probe(dev, irq_base, "Failed to alloc irq desc\n");
>
>  	d_info = (struct irq_domain_info) {
> -		.fwnode		= dev_fwnode(&pdev->dev),
> +		.fwnode		= dev_fwnode(dev),
>  		.size		= 32,
>  		.hwirq_max	= 32,
>  		.virq_base	= irq_base,
>  		.ops		= &irq_domain_simple_ops,
> -		.dev		= &pdev->dev,
> +		.dev		= dev,
>  	};
>
> -	port->domain = devm_irq_domain_instantiate(&pdev->dev, &d_info);
> +	port->domain = devm_irq_domain_instantiate(dev, &d_info);
>  	if (IS_ERR(port->domain))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(port->domain),
> +		return dev_err_probe(dev, PTR_ERR(port->domain),
>  				     "Failed to create irq domain\n");
>
> -	irq_domain_set_pm_device(port->domain, &pdev->dev);
> +	irq_domain_set_pm_device(port->domain, dev);
>
>  	/* gpio-mxc can be a generic irq chip */
>  	err = mxc_gpio_init_gc(port, irq_base);
>  	if (err < 0)
> -		return dev_err_probe(&pdev->dev, err, "Failed to init generic irq chip\n");
> +		return dev_err_probe(dev, err, "Failed to init generic irq chip\n");
>
>  	list_add_tail(&port->node, &mxc_gpio_ports);
>
>  	mxc_update_irq_chained_handler(port, true);
>
>  	platform_set_drvdata(pdev, port);
> -	pm_runtime_put_autosuspend(&pdev->dev);
> +	pm_runtime_put_autosuspend(dev);
>
>  	return 0;
>  }
>
> --
> 2.51.0
>
>

