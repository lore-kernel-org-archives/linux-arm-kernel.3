Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D337CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 15:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wVlrXHnfiL25suG2Bq5kyObbN7xkHUhH2LoOugwPTw=; b=jnd7fSxkDMbAc0CSU2eO1LDFUT
	zBP8vxUk5k9YJBDKijbmfTwwaabbHWz/XZofn+q9d6rbL3plLNvf7xRLZjoYCZGmzVZouuXpk4KGq
	ZR54eBm2c3z7iWSUyz1JEv+iByxqNtrT2EXmhAThry2swsNCvmWkDc4tQKhdAZcOQY7kzbyfF3qku
	cOVP1PZOx3xLtj3h1KyzKiz645MCdqmBqeyECjByjVsgb39fe+rIsiIiktfdTFg1aqqyXB0jcEGHj
	SbLiFBJT+f4zkSTAjW/5qKOevnI2agJE6UR7Zp/apX7Mrl9cT1arjlIEg+YVM0gBCZwUDxXJ8HU/Z
	uopxoCkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCJmr-00000009opu-2XRi;
	Fri, 24 Oct 2025 15:33:05 +0000
Received: from mail-northeuropeazon11011004.outbound.protection.outlook.com ([52.101.65.4] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCJmp-00000009oos-2ET3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 15:33:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FHFyPtTJcfwIujBERpYIm7Uyo9b6ZuD6cn/DBPPeVdTxq1NK+RjRbqUcHjp5VZs8/TLsYMc8Qt1HG4uxoObSeIe5Hb4e4ZyoxqFa1b4vZbBk+gnVetQF9gpVLU7WLXtkVCCUEWjNE2Gr1aZaS8074yyuzdPYlg2l+TC0Tmm/YvYktKkSzx9zv6+lzbsYTOwi7nfYzXtNr5P2XYahctLxzXKb+S/apoLOU2dPuDh15h16mT9Li1qY6e+1QAL9KyUjsLUVkcQYNb9poZ1mqOZKOWALOf8V5Ww9cMecZChdZSe0szjDV/9f9Zg+ea/WFtKXgNGPGY/6zhe0csJSJshrVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wVlrXHnfiL25suG2Bq5kyObbN7xkHUhH2LoOugwPTw=;
 b=NWlizxMGUz1mHmU2qX0z5su+2tSnbr0FDTNijnspCfXkaYkjlvWFxKStKMYAkPaIl6JqvEufK0cDG3J2HGRi6kLdAFy1jX47lVlO5hrEaDFFQm2ImaduCPnME02spXJ+obbgUOAs7h3rirffIlRraIgicKY3sWoz8vSHLj3AQSyOAjmtzn1LIrBls4bds291oWMakprdPjKEWtTF0kCWBbgq/xl6WcXczldW3jcpOn07/eaQSB1izQBOoIDswUiGV3f9AOXyQJgLBVHAtvzMhiPxcxLwamO5xMB50N99Y3PLNcTK92Y9rgEcD3/nQbGhQ2sth+GegW/YWpWfK2bm2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wVlrXHnfiL25suG2Bq5kyObbN7xkHUhH2LoOugwPTw=;
 b=LqXWh7LZyjuKEa8ztxXRGix3nxJFfDLZ9GDJuuzeGYGeWpFZYrzTQZWff/ZxmLW2d2KYuWHxL2TedMOjJQglrXmPhBiqDDXWH9vaZtrZ/LLK36cx+Tadi+CnqbXULAAu64LGW7pl9M4R7AWLGB86ippRatFKycz8vAwd8cvqkTfBuy4gAk8WoZH4WjNPRWw91UbyixzQ05AiKxee1IFUuNl16pQzVRD4SdFws6yFJ09+ibAJ2b2QxULfCEvfJzLy8IMK0L2hGuXuXkaKy3IgwL5UUuS+28Qj3Ocn8zNYT/FrX1rpQtObtYqc6iCqmZZ158KKuLP2g2J+A0cGVpahAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DU2PR04MB8856.eurprd04.prod.outlook.com (2603:10a6:10:2e3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 15:33:00 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 15:33:00 +0000
Date: Fri, 24 Oct 2025 11:32:52 -0400
From: Frank Li <Frank.li@nxp.com>
To: carlos.song@nxp.com
Cc: broonie@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-spi@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: imx: remove CLK calculation and check for target
 mode
Message-ID: <aPucJCNbyptl2kX+@lizhi-Precision-Tower-5810>
References: <20251024055211.408440-1-carlos.song@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024055211.408440-1-carlos.song@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0115.namprd05.prod.outlook.com
 (2603:10b6:a03:334::30) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DU2PR04MB8856:EE_
X-MS-Office365-Filtering-Correlation-Id: 446696b2-c999-4231-95a5-08de13129cfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4rK49g8PWeB0tJqCqNR4UCOvXYrmkUCYibDYUhJXfXha3DGrH4w85m4uiYu2?=
 =?us-ascii?Q?rHO8KFAqnw3OehMWWwVmrZrrQcWBEphp7Vag1AOAtL//IPy0lSKu12/isomZ?=
 =?us-ascii?Q?9XqOpD6yrq3/Xi7f5i8naUTdN25R9Y5eSFeWqlOARSQLJmW1iAYVyIVM5GXn?=
 =?us-ascii?Q?RC2k0Hu7Fyzu3hsf59+6ose0T+MAhRMDHBqwcGxbxApoRBswD93/AyLdOAoC?=
 =?us-ascii?Q?f/GdLaykd9uUFTIlqF79p64RpoxWBj6N11az8gz9yFzqbN+vtYVlP3SMhKeq?=
 =?us-ascii?Q?bDo6tVli2I2OiTZj9PtH5zrhvh1YcXyi+WClLnNaSwwC0hypYGMDoVScuM5R?=
 =?us-ascii?Q?hxyIf+ehitM7nV8g4RaoTPeccHOADZ19gpKobAgATe3uMn2M/BQq7OLcUsEx?=
 =?us-ascii?Q?97sY+k4XJWhh8Z4qH/m6wXxlI2eFYRJVqrtUuJRsyb+GQBSJpqvw1mMss5RS?=
 =?us-ascii?Q?tUW8gM5DD1sgir7AgS5SBooN9GWpyEb3Nkikt77pzzEwnEfOyjND/W8F4tZe?=
 =?us-ascii?Q?Zt2epe2FsVRlujRyI/2ZvDqGYJcIcQWk7cgUG1SQLGNh09Y6g6ZQAnQ/zFku?=
 =?us-ascii?Q?mvhoMJ1chnStsGzb/wcdVd6enoJ210dtT8srz1ABI0J/kr9E1RuaaixwgyVo?=
 =?us-ascii?Q?J0WnNk+aa2ruH8JElZ22sa36X30svVTdEbwlfJdPwjmdr773/U5Dbpp/UH42?=
 =?us-ascii?Q?JXFURZJB+RAScJVKpduo3sCgn7f5pTlnLphhwfVwdUBYFMC7PxGbBEUdvxFf?=
 =?us-ascii?Q?o0DGMHt+f50KigL54j+gOhNQpEmp6tQs5cHLATRtH3RnM+/mu4unlhyCB5/P?=
 =?us-ascii?Q?uIDKMkLP/m/OhJrnIZSLecYe899vPTIPlHvgWBW16gps7j9uC8Id9nGNWr2W?=
 =?us-ascii?Q?krdvr9j3MamUPsv6scDOB2bYwg/oXTwyxz1nBgGKsCbflRN7RGtgrmc+V7QH?=
 =?us-ascii?Q?Q1r0HSrKkvVPIQD6T6n3/cfAg0FoNRjDxAb7jaeFddVJoIC8hLjZMPiWJ7qu?=
 =?us-ascii?Q?65El6MTl/j6KFHpWWMsZwwC0uX62gH8dYuuPRHRv1vuxvrktMSjHDek69cF5?=
 =?us-ascii?Q?hlbyKjLaMwELT7VLxbjuBOHU1op5UfBOrlsH/1erAroDlwf4Lfjq0DtIe+Cv?=
 =?us-ascii?Q?dPPUzTNjnvrH5FSbgi/TBZ9EBI0WjLsVDzNGcKLIe3u3Jh7JSoN/4Qx+LO3D?=
 =?us-ascii?Q?r5+n8TBPV9yysO1zlQaP5UU/NrDGEtcwAr8G/2qBO1pXwUZso2LOw/uphbT3?=
 =?us-ascii?Q?K5UWxqVyehmDvNVr1sdd2SMkP2ZhOhVbtfuRBa8uukm7W5X9gSmodzbRKK0s?=
 =?us-ascii?Q?9AsLv9FNHHYfvASF7LkbJI5m0BB6GdKlLW5+/DCcV5sh87c0aGUN6Jwiul0u?=
 =?us-ascii?Q?DAJGMlRGLC/A+dhajvxCRtggmJp1Wau/JAktw2QymyjHcX/gQBQ/bA1bhbFl?=
 =?us-ascii?Q?ER+OpdLZxP26pgS0wvN7AggHUHDjAwPCgek3+imsC366WsqFA9T1SdAxkHtC?=
 =?us-ascii?Q?TIskG3x5gxFCKJ3PPuAV7dkGxmyL7NHprc0g?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FDUjj4B5rDayCUAwqJ1Rpe7RU4mw0o4pKD3mfPjgCcNmeUvQ4OU/6ZEjTBZJ?=
 =?us-ascii?Q?lQptBLWQcguFsC2fV+d2oEm/2EC+/Snpo/VoIOiJEMDtQsauxkcS+XjbkqMO?=
 =?us-ascii?Q?fR+o+mKa3FN/fpGKCadB1tmt3DK6Epy0N4KPNybWRDyxYHuzk65Lg3UQPrgt?=
 =?us-ascii?Q?GN/3lOE1De+9ah4F6yFZBvgFeMH4mez00V+j3Wd2jN14/MpPvYBvmAIZo/rW?=
 =?us-ascii?Q?hSX7uR0xj9jumV3F5cbF7LHtf/gDO86N7s6OsOdhzUYNjvvMEv25p8fe41Aa?=
 =?us-ascii?Q?2lOMl9bLUK26QbUIfAg75uzdljkoikToSuFXnlkhsIXX/Q3COzzd/j3fQAY4?=
 =?us-ascii?Q?fkltwJ31+/lBub2v6LN1jzShbfk1sIyJcbmU8AD5WMdO9m2DWO6cKbKqhn93?=
 =?us-ascii?Q?Tsx3T+GYfvJSwgy5tDKoNKToYIuYL23GYgNBTpDLuI7s5Iz5sk9+Dw2SNzu2?=
 =?us-ascii?Q?ZHFM4V1xWy9RuLVW2PFWUl2CoiMFkmp9kYUBWm/O9gPXI3/G2XmrymR0vKeJ?=
 =?us-ascii?Q?pqmAMDoaSd148zstPJxi98atEyFkILoVr6JwUZ8ddWgkYuNhj5/8vuEGEPVu?=
 =?us-ascii?Q?Y0OvX7EchSrM4PTn2+I0b1I7U+tgJZFawIw2sLXxIe373mKZrRlU/Q7d5Sp0?=
 =?us-ascii?Q?APYXG3oH6zIFLZV2l6Zfkq+qB4UQGXkw0OsDH0sP+75FR60hfXOeYa3Sizxr?=
 =?us-ascii?Q?5ZYsADPMAIzpR+RNXsD7zGh9ThCZYQxUc4FJyJnSXYQiplZDOGtVj9BjcDSF?=
 =?us-ascii?Q?8G5O+7r0qHQ7W246uBwxAXALG2tReb0psK3w99Ku0RUy0JViUFZHTDUO0T/v?=
 =?us-ascii?Q?imvW9bIOBc01yAFD2avHT6cLKWrTKISLy9bY8EU6QYBr4xaydxm8Kjj/5Zl1?=
 =?us-ascii?Q?g/LjrIzLglPSc81uS7qABVKwIcKzk0FzkBquWm+a2LZKhf5SFvgWk8j+IlKE?=
 =?us-ascii?Q?dAYRnEJydCnepfjzew0Y+W46sEwHsaR9OrUtbNas8TuIU3GqqIzbMj29lUNB?=
 =?us-ascii?Q?uxnLdbdlRDwFxnZOMqGAlr6UYwdJ8BmevHDJKpPDwVWAWLwUbKoMMD3rqGq0?=
 =?us-ascii?Q?1FEmssP0C9ToX/gjTL/hLQOsxhFxcj72hptza1uaEeNQ+HvFug9QjqcjF8aY?=
 =?us-ascii?Q?Mvc6xCAqZlD2q50rMHy7G6TNI+tQnl2U1R9FtWU6jdLUsuHKzpBxRC/z0906?=
 =?us-ascii?Q?ZM19/MSetxO3JTFA230a7iYzNAtidZYl9ylHekSN96qpvafkUZA44I5mJb/b?=
 =?us-ascii?Q?mvV3fxmn4rAIdh6+xs7WMmISzsrJ727IDpxTjmyTNEIdO8Sty7Km5hydj1BR?=
 =?us-ascii?Q?2PAcPbgF6WyVaPSj5i0WREBzMVUdUZ9DkIkuxbog/ozGY9kwUtIebbfDE7AD?=
 =?us-ascii?Q?U6bHXJW7Y4YZxwVQU9ANSMAkTXZEWjgBMWv3fhc0qQJBnyadFoy4ZBFQGwo6?=
 =?us-ascii?Q?AdVQbzRRyvnxonXSUAGflNznpNNXf5Q23cHkXv12NzkaczI/3oAK3Cle4pzj?=
 =?us-ascii?Q?a6A5wkLG7vV42CyQVZ3gvbUfNQj8A3jgN0I/ES6XvWW+dH2JGS/AWNfkr9AO?=
 =?us-ascii?Q?iBo7OKUJAnznwvL9LROgabMg3xw2t7CkMbDM+HO0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 446696b2-c999-4231-95a5-08de13129cfc
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 15:32:59.9474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2OMMoj8Xk7LKypcGNqeQ+j+G3TOreR+7qDSrJoMrj1b+HzH2WaFGmJe3RyxSFRy7LHD5KusPDMRI8r5LZxb3qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8856
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_083303_574368_C2766654 
X-CRM114-Status: GOOD (  21.48  )
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

On Fri, Oct 24, 2025 at 01:52:11PM +0800, carlos.song@nxp.com wrote:
> From: Clark Wang <xiaoning.wang@nxp.com>
>
> In target mode, the clock signal is controlled by the master. Target does
> not need to check, calculate and configure the clock frequency division.
> The target can directly use the root clock to sample the SCL signal.
>
> Therefore, remove check, calculation and frequency division function of
> the clock for target mode.
>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/spi/spi-imx.c | 28 ++++++++++++++++++----------
>  1 file changed, 18 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
> index 4ffee6c5d5c4..6eb4bfb7be4a 100644
> --- a/drivers/spi/spi-imx.c
> +++ b/drivers/spi/spi-imx.c
> @@ -42,6 +42,7 @@ MODULE_PARM_DESC(polling_limit_us,
>  		 "time in us to run a transfer in polling mode\n");
>
>  #define MXC_RPM_TIMEOUT		2000 /* 2000ms */
> +#define MXC_SPI_DEFAULT_SPEED	500000 /* 500KHz */
>
>  #define MXC_CSPIRXDATA		0x00
>  #define MXC_CSPITXDATA		0x04
> @@ -692,8 +693,11 @@ static int mx51_ecspi_prepare_transfer(struct spi_imx_data *spi_imx,
>  	/* set clock speed */
>  	ctrl &= ~(0xf << MX51_ECSPI_CTRL_POSTDIV_OFFSET |
>  		  0xf << MX51_ECSPI_CTRL_PREDIV_OFFSET);
> -	ctrl |= mx51_ecspi_clkdiv(spi_imx, spi_imx->spi_bus_clk, &clk);
> -	spi_imx->spi_bus_clk = clk;
> +
> +	if (!spi_imx->target_mode) {
> +		ctrl |= mx51_ecspi_clkdiv(spi_imx, spi_imx->spi_bus_clk, &clk);
> +		spi_imx->spi_bus_clk = clk;
> +	}
>
>  	mx51_configure_cpha(spi_imx, spi);
>
> @@ -1316,15 +1320,18 @@ static int spi_imx_setupxfer(struct spi_device *spi,
>  	if (!t)
>  		return 0;
>
> -	if (!t->speed_hz) {
> -		if (!spi->max_speed_hz) {
> -			dev_err(&spi->dev, "no speed_hz provided!\n");
> -			return -EINVAL;
> +	if (!spi_imx->target_mode) {
> +		if (!t->speed_hz) {
> +			if (!spi->max_speed_hz) {
> +				dev_err(&spi->dev, "no speed_hz provided!\n");
> +				return -EINVAL;
> +			}
> +			dev_dbg(&spi->dev, "using spi->max_speed_hz!\n");
> +			spi_imx->spi_bus_clk = spi->max_speed_hz;
> +		} else {
> +			spi_imx->spi_bus_clk = t->speed_hz;
>  		}
> -		dev_dbg(&spi->dev, "using spi->max_speed_hz!\n");
> -		spi_imx->spi_bus_clk = spi->max_speed_hz;
> -	} else
> -		spi_imx->spi_bus_clk = t->speed_hz;
> +	}
>
>  	spi_imx->bits_per_word = t->bits_per_word;
>  	spi_imx->count = t->len;
> @@ -1839,6 +1846,7 @@ static int spi_imx_probe(struct platform_device *pdev)
>  	controller->prepare_message = spi_imx_prepare_message;
>  	controller->unprepare_message = spi_imx_unprepare_message;
>  	controller->target_abort = spi_imx_target_abort;
> +	spi_imx->spi_bus_clk = MXC_SPI_DEFAULT_SPEED;
>  	controller->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH | SPI_NO_CS |
>  				SPI_MOSI_IDLE_LOW;
>
> --
> 2.34.1
>

