Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D88CA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 18:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Jh/1RGNQCl2of1ehBd878hDhfOQRQZl4/z0JdhTN/c=; b=WQcpfm0qlAPe2pvVei8jhJBYmt
	41J5qL3GOrORVj9CujysvFBTjcMohBYW3l7YJU8mO7map9QXsA5OsfzLwf5HFOmw+YFmyA+yFkDJz
	pieDYLX4KsX0VoyHCwRbwsqBDO1dVfAgGCdITCuNbO34INRSYmVprF6Gog/eIO1K8+gWsQqGm0RcB
	sS6WuRj4sP8vGS3HcnwgbQxLQne1o4D6m7FOfjBkR1++7CR8ckJX4d9RZqYctm8OJEd7uiIL/i1XC
	FtIuBNhQEP0V5xJ3U05LYrSptHw10H9QqfElqd20OM9YfIfrP5zl5IdsV5zB8lUc0tuOPl+yvRfEC
	CE9TqhKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFbR-000000071Nn-0HqK;
	Fri, 09 Oct 2026 18:45:57 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFbO-000000071NB-2Ovm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 18:45:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cw+iA5kWPspVf+KopZ/y59ez4dX5GXmGzjEMx79fQq8cxu0A+K+c8qEg7MT2HzbyekYxIJDiye5TVCT5GASQy0HHRYW8otqV+5E+LHpE0bz+GVJvQ8GMf/20chQXeqWYDvlvdKS0vXPn4wzHo/1x88EPsk1EGebS7Cim+hI4vGQnR1alUrYyrWH0w/EP1xOTWAFKIIqbsKwRX9kEyUFASioFUVa4q4HmB3rWrNr62GrT0z/obFyakztw2hGyZkCqTbZ/wdgdJhJzKojDigRzCpjU5toXHwHQRl6QBxW/yQsK0fAt3ZvlL4oPv3w9k/whRiaeHWab468huRjFcfVONQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Jh/1RGNQCl2of1ehBd878hDhfOQRQZl4/z0JdhTN/c=;
 b=zHJsGoFEptWcql8i+RLeQA421sRB0H1yLtbtU1knslmHeFiZpzjIe/BBPoFoSCHwk+CWqaYLArmNyh4s1Pq1lmSJNpr4q7x9oKvPsmnronqWwdXErIMvqTQAH6mdxhef/WE9XwsQ6noTxuo2keS6wc2CCNNSX4OVcy0L1xjzt4Vio6RdTD9lfa4QJZENA10c9RZKXhjTtI/B4x0WnSrQ36lZRbyxuT4vamKmW6o0OBl+H0Alltv45gANsPYoKrSS9pqbMAbncyUsQqLlG7mn3rwfljKVnCTzSqud+ydtaFCIFqsCjIQQz9rheVZN0CmBzqXx4AbgIJdxmynQiL+2og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Jh/1RGNQCl2of1ehBd878hDhfOQRQZl4/z0JdhTN/c=;
 b=R3YyC/XOZHpNB9L38Aw4KqCXRNSHPESVG8pMmaUOfFtVhKBkIw7eKtDen4p16OM8RrlaFzDeNU5QFnn3wmStrtX1ngce7zADI6HLl1j8xyuD4Rn+yp+hxmPGxsneB+gzkh3bXnLcQhFsqa80H0nsn/60bnp4ImaI9xcdPGmIRo9AQVptuXCuv/qxaWWPCinnQsqlgVjTP3wrejR3NxLYIy6+RM5uTwN0PPeH9DNM1sX3uJZGyWasKuQ+FPgJE8gajFIHqwhBimO3JbEhWSph3abuabhih1X/rb8IYzp/GblFV/MR/im21dXC9hw5U23m4wBVPIj73D29DBpyZdrKCQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8327.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Fri, 9 Oct
 2026 18:45:48 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 18:45:48 +0000
Date: Fri, 9 Oct 2026 13:45:44 -0500
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
Subject: Re: [PATCH v5 07/13] gpio: mxc: convert pad wakeup compatible checks
 to hwdata flags
Message-ID: <ask2WA3tzibGhXEr@SMW015318>
References: <20261010-gpio-mxc-cleanup-v5-0-1e59e6ddfa00@nxp.com>
 <20261010-gpio-mxc-cleanup-v5-7-1e59e6ddfa00@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010-gpio-mxc-cleanup-v5-7-1e59e6ddfa00@nxp.com>
X-ClientProxiedBy: FR4P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8327:EE_
X-MS-Office365-Filtering-Correlation-Id: 52c3a789-da1b-463d-95d9-08df2635890a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|23010399003|19092799006|1800799024|376014|56012099006|22082099003|11063799006|4143699003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: SpOfX6jzPq5by1ihLubVXWUcDRKFTHgQq7blbuxp8Fp1ohjFOp+LgA3B3Nfd+gHu7AqajzTLdEx4q79BkMSYqOLef7uEyqAbQ6cWsmmRX0DtmaC71kMbkItggqdc4uDTA0s8pJ5KtzsanSSLQWlcm2tc9x2vyfrMSrXJYXB3VYExgB7zu4ErU/1hfzfbeDCaFK7TmGTxgbmkS8d0lia8DkuMaOqVQYS7hY4M0B2+8EFNrx5xFQ2BM1+rMSZs+bic+o3/mlCfAS079ssSltfBzvuYw7nDdNi/anWjL57Z0Z0RG7qRSFjBg2RYI7v4Lcij4RfeumkCmATp9f3JXP9TXzPjsfzkAlJGl0wShhJPgJJxxoNqt+n13F0iTmfQ8kwq91QA3rjUS86tENUe7xMnGrzweGhC3ZkXz/t7I4xwH5z2WD2UgKnzehLuBz1G3PgLVJRwf0GxFK+gmgsYaps1wVw9/0qE4jORY9B+7HIhUBBsP2Z7XrFIDTFOqh+i8otY73L/hCij70DgH/ow2B4UIL0fnRNOTNOCKltonEX3IFhaqcHXg+GXAqJ+LddlNTDod/sLf4OD4ppe4fPWCvyL+mMk1a2L1+jFF3SIeIIUnE9ZbFj98HEC/0ZgXwxsa8cdQQqr/iGYaEZygFTaPrGQaKgCaaSsbpjoeacNUq4qPp4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(19092799006)(1800799024)(376014)(56012099006)(22082099003)(11063799006)(4143699003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NL9iXOi8W3SKw3I/ga4M0MdmS+ugoJhD+/Z0ii8+cxCKYhjzJuNXF9bfzF3m?=
 =?us-ascii?Q?ajJcuuzOTquGkiSK45nKuMzRUVO/ROldEk7anXy7vHSrh4ct7xMUeuy+14gT?=
 =?us-ascii?Q?Kf+EV1A0pLOklaLX+wl9hSecuQHpbXR9vA5ZcFMEZy7SDzPmF+IiAMGMirkf?=
 =?us-ascii?Q?M1RS7FhU2YWnBVKGPiNUJHguyLwnQXZv+LSkg0O2t+NdtUpWxOJdgnwijzU/?=
 =?us-ascii?Q?2XPqZZ2bXEVEeYXOOcHSlzC00w2+TWuLZQA3gv5Klt3yAGweAztpw1iUgOMZ?=
 =?us-ascii?Q?H59tpFsyP/OyuLN9F3u6OwiH0NWHg/vVkQ4P0yW95bKsM0eyLiTJnT+U2Nyj?=
 =?us-ascii?Q?dB6ecnVPmHziFpcsJrgVWjkMY4mbD8usHULCkZENrhyEcj/M0XIgcxlFMP8f?=
 =?us-ascii?Q?IkRgYhpQKYqPyl61v9xAVhfV5LSsJnyNmfceu8qpitAziPLCQsm3B7kMq3Cv?=
 =?us-ascii?Q?97PB8ylwbssBXGSEA2P9ZiQKGnsbmjeHIqUB1gFSDjGt2C11QoC1gMgx8iFk?=
 =?us-ascii?Q?pojl7BJQQyRdt2sNryH+j1Kk9z/tYNOzNSWfi9YwC3228Nbbs98ZTjFQTSvD?=
 =?us-ascii?Q?/hgEnMUvBMXOWKy5X6Eb6PnKgGPIxwrXOqNnku8L5cQyI5QnK7mvpDDyav/j?=
 =?us-ascii?Q?GduTNjOlRkFdUnvYjku3J2ikhoRnhukzeqHijMwDPE8agYpHCdbwjpoi24xz?=
 =?us-ascii?Q?A0QCNgA7tOl3QRliT4HxbjkZhMcaXyGSVcIGINCkZvvwS7M4jMS21rD35ccu?=
 =?us-ascii?Q?ZA28bZ0wfE0eXpnKc5Zx2qCJ7KhK2xRdRndeue94jSi05xESVHdTKv6j30es?=
 =?us-ascii?Q?UWmV5ekc9w28cHIhQ3pTUe0OmAwkfC66SKAMZTBZKdT2cwjxe5u0af9YLwA5?=
 =?us-ascii?Q?AlIMKh/QiKEZmqOmcLqAVR1CgUiFSpNAU4PMla+KLXFyflzck4WdGNegXNLL?=
 =?us-ascii?Q?nw14g/5L8moeSqeE7K6Jcps/kfmSqaO3mngp5gpRnDWisujNXlkRe4elOo/s?=
 =?us-ascii?Q?5qnFO3bCStwQ3rjPx9J77jKJxfQ+6xG7ntF2FQACw2s7UpbQiuaDdr4qKcen?=
 =?us-ascii?Q?B/2mFCzf6RPCO7fHoW/xrKSRHgOQ6cd1N2fMXGSMTGVmYBTd+oaiX+otJl62?=
 =?us-ascii?Q?w6v/n6LeUTjfG8us7TVeLwWfOX5UmCOT0w+wcVovrmREjgDXbV2v6WZrY0xG?=
 =?us-ascii?Q?/yK0j+6Jwxvi8+8emYjLoCqO9a5fl9hDupf2Opz87TZjjrQLy7xUqq96bAhr?=
 =?us-ascii?Q?5BccvUziqhnaID1JRv3AtGOA5BnfIBmnWF10tKRXSnoX8q5DV84gxMKY3OJq?=
 =?us-ascii?Q?z2Z0uIdJRyPwwpdZvGhxvJBpJPllZX+y5SLtqXBn8lmY05W8HeYi8phTDZez?=
 =?us-ascii?Q?he4gjuZhbgVNc95u6J9AGUwJCPtJ6+oy2ObjSh/PTlmW7vNNUAL0oioDtpU0?=
 =?us-ascii?Q?2GVTOpcZDPlcixXBQY0dPrZbESXC9DsYEoLsZKf/LiGdS2Q5RHVeuu+JNwZo?=
 =?us-ascii?Q?tyylPV8xmor0MDn0BjUw2wNDcpwVj+Mx8Idc6Y8UJSEB2Me9FVID2nA+fW2a?=
 =?us-ascii?Q?vnolo65JBqHFibfeMst20IZqin7SAVnApOWgwEpuMxPBZMeaxmfm/c/Yu4rU?=
 =?us-ascii?Q?K2V/AekAXmStNxLja+ogDd9UhILn0hiiBkAYoR8+tgTKLeHEYWdIimf47Weo?=
 =?us-ascii?Q?ZJtOnD7vSoNBmtNR1fM5xMXYTxwHCtoZnudITWs9ymhvK5Pb+WmX68JFkayg?=
 =?us-ascii?Q?qjIXf1ec5Nyr7oDtn8Q7do/SgM809RtsgddNSLsH4VO3Dq4ZNaFS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52c3a789-da1b-463d-95d9-08df2635890a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 18:45:48.6053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ptCdSR53//CD+pc32Rf7lgM1svQr9EU4yjV7OxhSg6Dd9HMk0fXr8eybkIkqW+WjMQ5tHO3FfHvlmQ4uRx38mNT3F4Ecq3RRXinVldbjEag36tUevMOZmILvwEEoixEg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8327
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_114554_635796_542FE5D0 
X-CRM114-Status: GOOD (  25.90  )
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

On Sat, Oct 10, 2026 at 02:05:28AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> mxc_gpio_generic_config() and mxc_gpio_set_pad_wakeup() call
> of_device_is_compatible() on every invocation to determine pad wakeup
> capability and i.MX8QM-specific behavior.  These properties are
> invariant for the lifetime of the device.
>
> Extend the hwdata flags scheme introduced in the previous commit with
> MXC_GPIO_HAS_PAD_WAKEUP and MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN, adding
> dedicated hwdata instances for imx8qm and imx8qxp (also used by imx8dxl).
> This replaces the repeated device tree string comparisons in the
> suspend/resume path with simple flag tests on static per-compatible
> data.
>
> While at it, clean up mxc_gpio_generic_config() to use a local ret
> variable for clarity instead of the == 0 comparison.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/gpio/gpio-mxc.c | 46 ++++++++++++++++++++++++++++++++++------------
>  1 file changed, 34 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 1a35b23747b4..70fa139338c9 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -34,6 +34,8 @@
>  #define IMX_SCU_WAKEUP_HIGH_LVL		7
>
>  #define MXC_GPIO_HAS_POWER_OFF		BIT(0)
> +#define MXC_GPIO_HAS_PAD_WAKEUP		BIT(1)
> +#define MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN BIT(2)
>
>  /* device type dependent stuff */
>  struct mxc_gpio_hwdata {
> @@ -132,6 +134,26 @@ static struct mxc_gpio_hwdata imx7d_gpio_hwdata = {
>  	.flags = MXC_GPIO_HAS_POWER_OFF,
>  };
>
> +static struct mxc_gpio_hwdata imx8qm_gpio_hwdata = {
> +	MXC_GPIO_HW_DATA_COMMON,
> +	.flags = MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN | MXC_GPIO_HAS_PAD_WAKEUP,
> +};
> +
> +static struct mxc_gpio_hwdata imx8qxp_gpio_hwdata = {
> +	MXC_GPIO_HW_DATA_COMMON,
> +	.flags = MXC_GPIO_HAS_PAD_WAKEUP,
> +};
> +
> +static inline bool mxc_gpio_fall_edge_wakeup_broken(struct mxc_gpio_port *port)
> +{
> +	return port->hwdata->flags & MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN;
> +}
> +
> +static inline bool mxc_gpio_has_pad_wakeup(struct mxc_gpio_port *port)
> +{
> +	return port->hwdata->flags & MXC_GPIO_HAS_PAD_WAKEUP;
> +}
> +
>  static inline bool mxc_gpio_has_power_off(struct mxc_gpio_port *port)
>  {
>  	return port->hwdata->flags & MXC_GPIO_HAS_POWER_OFF;
> @@ -158,9 +180,9 @@ static const struct of_device_id mxc_gpio_dt_ids[] = {
>  	{ .compatible = "fsl,imx31-gpio", .data = &imx31_gpio_hwdata },
>  	{ .compatible = "fsl,imx35-gpio", .data = &imx35_gpio_hwdata },
>  	{ .compatible = "fsl,imx7d-gpio", .data = &imx7d_gpio_hwdata },
> -	{ .compatible = "fsl,imx8dxl-gpio", .data = &imx35_gpio_hwdata },
> -	{ .compatible = "fsl,imx8qm-gpio", .data = &imx35_gpio_hwdata },
> -	{ .compatible = "fsl,imx8qxp-gpio", .data = &imx35_gpio_hwdata },
> +	{ .compatible = "fsl,imx8dxl-gpio", .data = &imx8qxp_gpio_hwdata },
> +	{ .compatible = "fsl,imx8qm-gpio", .data = &imx8qm_gpio_hwdata },
> +	{ .compatible = "fsl,imx8qxp-gpio", .data = &imx8qxp_gpio_hwdata },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mxc_gpio_dt_ids);
> @@ -575,15 +597,16 @@ static void mxc_gpio_restore_regs(struct mxc_gpio_port *port)
>  static bool mxc_gpio_generic_config(struct mxc_gpio_port *port,
>  		unsigned int offset, unsigned long conf)
>  {
> -	struct device_node *np = port->dev->of_node;
> +	int ret;
> +
> +	if (!mxc_gpio_has_pad_wakeup(port))
> +		return false;
>
> -	if (of_device_is_compatible(np, "fsl,imx8dxl-gpio") ||
> -	    of_device_is_compatible(np, "fsl,imx8qxp-gpio") ||
> -	    of_device_is_compatible(np, "fsl,imx8qm-gpio"))
> -		return (gpiochip_generic_config(&port->gen_gc.gc,
> -						offset, conf) == 0);
> +	ret = gpiochip_generic_config(&port->gen_gc.gc, offset, conf);
> +	if (ret)
> +		return false;
>
> -	return false;
> +	return true;
>  }
>
>  static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
> @@ -591,7 +614,6 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
>  	unsigned long config;
>  	bool ret = false;
>  	int i, type;
> -	bool is_imx8qm = of_device_is_compatible(port->dev->of_node, "fsl,imx8qm-gpio");
>
>  	static const u32 pad_type_map[] = {
>  		IMX_SCU_WAKEUP_OFF,		/* 0 */
> @@ -612,7 +634,7 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
>  		else
>  			config = IMX_SCU_WAKEUP_OFF;
>
> -		if (is_imx8qm && config == IMX_SCU_WAKEUP_FALL_EDGE) {
> +		if (mxc_gpio_fall_edge_wakeup_broken(port) && config == IMX_SCU_WAKEUP_FALL_EDGE) {
>  			dev_warn_once(port->dev,
>  				      "No falling-edge support for wakeup on i.MX8QM\n");
>  			config = IMX_SCU_WAKEUP_OFF;
>
> --
> 2.51.0
>
>

