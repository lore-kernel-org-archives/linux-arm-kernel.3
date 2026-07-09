Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F79BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 14:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Gs/+wI51uvlfIZPezddyVcPdCnytuHjB3tFf5wchmA=; b=G3Ngvg9zeGdiJxWFgdWXwU9+Ea
	6lGE4KwG7ENpqufiDnu+gmxZ+ELTlTRTCuWAG4MTYIdelHM4iqFbvi6p5kR7ecKmtxM0Bs+I20yhl
	6JX44NhJEdmnx8eiCcSe2tZ+j8camgROVd8BTjojLWnoxZ9AzsYXuogY71oSGYNKZWxJ/jB/t6LZk
	BLMbb4Kr4nnyF6TLu3/9EN0t1qidC8ozQGkwygasa5ShPlH/WEvQ2Twq9UPVEOne7cBWVhTCcVEVB
	+ZF80pQ1pVIe0MMDQsYZOIA7lBE1LfL/C74jbgelsD5IyaDILYThOedysPbTFqz9033RqZA/pwViP
	AcFtDiMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whq8n-00000002qZM-3AKX;
	Thu, 09 Jul 2026 14:54:17 +0000
Received: from mail-francecentralazon11013048.outbound.protection.outlook.com ([40.107.162.48] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whq8l-00000002qYr-2NYY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 14:54:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RrDmTJ9ekJwY3vquk75jT9rvXhgwTRkMruTZXav+cKn/i7EhERJ7YAdrDop7SfpgZ39wg6PXoDKRAAiS8hvMJXX2WCgq4mfSHaTpd/YPXDoNmd2G+22S73EHzf5ToM65eCNN0WXlO4sChxO2F/IgtV7cq0wEfxwS5Gq6yeNZv+v0QNWZ1TpVCZVk42lesGhFRfKx6NRK97RVm5ZbQ2uSJAv3FsRaVXKJTYLFyWf9zBHA3WrOQMhicewqEvROmRP4iJKHy+s/GDLfFoklLS9r7u3tSTcwUwXmrnzohBEVX/NfOiO6j9M5HS914v5dyc8eouxNWiVG88Jh8tU2YDXjEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Gs/+wI51uvlfIZPezddyVcPdCnytuHjB3tFf5wchmA=;
 b=Q2W7N45rDmM7WY1ZlzA457jvDq9ojDy4aFUg8r4Ai6o/xGLrl7B8iphaNdNM4U2bO4Dp4lTT7EAnDuZJRo4ZxE7wnjtbJKb2TtI6PVuFmCAcSSiOgyiqLA5a7Aql/5/NEnTz3JAoH3M2gNJEUdjqA60q40lgUD022s7sq5PMwH+Yz2Rcl0KVKgXJKLnXWZH4FSsBzrAKmFj370R5Cip4qfaEU0anzzrAzZmwArwyOayaN8FCE+MmBdt70fuoyQ89TqB+2UXDqGIfXsIfV98uZwE1yPbb/qzgcjzlnrGfDqq3LPQe7J8igYw1tF6Ja5uVfUab2cr2edOrHJ06Spg0Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Gs/+wI51uvlfIZPezddyVcPdCnytuHjB3tFf5wchmA=;
 b=Jwh/F/pzDI7BhHG8CnXhIGMXyLqQ0Ei1z/FZ6BsbBfP35HMCI0aNgXmjYI8sKR7WU3gtrN4h75vhgMZRkF0XTUDsLw4fOldnbu7AyqafyQ6mwvcCWhoRNRf6B6PSsF7KlKNwQ+yLg3gqXVc6L6o8uUSVUrfdOInnEXil3K5sEaGGWki3eCvISOKLZ6JWcpQ6Q7OZl6ny+yAqITHrC3X5DNkic22+nTBz73q3vaOwapWNiebAGSIEFmCVJ6LuiIvCLul/WRXsUQ28YIFzh/5GmXnD7iBNLQhw08RBclEe24wsNinBxLgCewkSaGXN1C4JBLWudBmIUSD9iUcnSMUGKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMBPR04MB11741.eurprd04.prod.outlook.com (2603:10a6:20b:6f3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 14:54:11 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 9 Jul 2026
 14:54:10 +0000
Date: Thu, 9 Jul 2026 09:53:57 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, amitkumar.karwar@nxp.com,
	neeraj.sanjaykale@nxp.com, marcel@holtmann.org,
	luiz.dentz@gmail.com, hongxing.zhu@nxp.com, l.stach@pengutronix.de,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	bhelgaas@google.com, brgl@kernel.org, imx@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, sherry.sun@nxp.com
Subject: Re: [PATCH V5 2/4] PCI: imx6: Add skip_pwrctrl_off flag support
Message-ID: <ak-2BQEUMg8Ewjz9@SMW015318>
References: <20260709101555.3034853-1-sherry.sun@oss.nxp.com>
 <20260709101555.3034853-3-sherry.sun@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709101555.3034853-3-sherry.sun@oss.nxp.com>
X-ClientProxiedBy: PH8P221CA0062.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMBPR04MB11741:EE_
X-MS-Office365-Filtering-Correlation-Id: cd670e94-8c90-40c0-e5ff-08deddc9ef30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|7416014|376014|19092799006|1800799024|22082099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: PSFR9sD2ngAsK2mgpQNVcuJV++Cu2XOvB5LUW822j39lkXYYGFfAaTP9HFgvRnHgWZY3EHsYWTbfY87mK7dOg88tqOLJSDdspqmreTDB8TjnuA553v2Zr1y5oDeytvWvnZiCzfxkf+xP+CGIWrXoeFQNSKmuPqQ6ggRgPasXr92kGJPcbbnITFlqvoVnm15RJaewQVbemGoK9H1CtX0VzbKyUFToNnDUuON3Q6d08X3Eafix4/YLpYb0auY4FkPFfP/yhhcFZKjU2IyKTQDGsN5jeLF6+FOThXEAQjZ3P/Oo3sH6Lf+rqxj+GQQLyouTHJYkQwPYnsyGWmr26K2Uq9VHbPNgM7ManjduBThpo59jLMxdBgKk2/2J+FyF7Afb4tE/E2icQd0UFSAhhvnykULaCmzGn1oiBKowNYFKSWkMvvP4TKgKZnSKDQCyhtOzld29MJsxXfhqBdht4Ic5oBm7qNOuXVJfd9yXfkwGgoYAko0U2PnKPz1bm16ovvY1P0fLlteC146zzIuMY+82dzPQ/d47PKE1bTZ3uzdySZbCx2vtYh8aSe59ZbZxq3AcThLuiup6J3ZVpJMpnhsCx61Ra3rk+mOCGUnair/SfdPK7bhDdnSvP7J6Z3TOZlDGUq/JGU/YgYPUZ+NwWkDCekVgTgLZITX9Br6tTUm9gLE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(19092799006)(1800799024)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sPdj9wfj6V7/BC8bPj/SiAvmlBtb9cSbI1XFogddXOD9yhmrzxtoMeV8Cqso?=
 =?us-ascii?Q?z6ax4DL+9CzokvcuoiiyzQh6nFLbixwKwZNTdkPUdX2+xdEq78E1O7+xdozi?=
 =?us-ascii?Q?w0zNioObnqm+LWqQ+OyNFN0E//5AQeg8co1AAPDcDaYI4m7tgHzYogJptoNU?=
 =?us-ascii?Q?4WrX/EMk6E9sweeZWQDm0dOOKrDZuY7c++U13ebH1CrgFbM02r24zfG1Vzz9?=
 =?us-ascii?Q?5ZXxxQBU9ZHL7bxx4O9m8Bi3B73kYVNgQhFNZ4Epm0GSHHo3Hz2YLHvAmkzi?=
 =?us-ascii?Q?MID1IZgdnWwbT6PIxGKgXFYh8vdZEfyTFz3XlEKY4mXKWaUt4U1s8hm9x1SF?=
 =?us-ascii?Q?4OG5o7hijbB1HsjnteGsYaJd3p/9q8rplbEkDxBX7jF8h8+H/MiCk/T5Hpmn?=
 =?us-ascii?Q?/rpofaF4J2DTnQcHA5nkd7tnyXwd975Zg1eRGwXBrIsDm4g+MiM20kiYy3fe?=
 =?us-ascii?Q?yhrEYvn+/pbv+ylp+rkyvUQDNHz73iiNe9WSDLiPvDqYd8leSW96OZwPrv3a?=
 =?us-ascii?Q?2zcbM8D028RhvGUUbwfe6j4IsFUlpCCkBKjkHmqX05nIF/vFGQPKFx8A8s/s?=
 =?us-ascii?Q?ikjaciALyS29Sw2zAMyVtYAwVdS3l/jtWDS0ciIcq8lyRIOim04PjNDtKVIB?=
 =?us-ascii?Q?ZRO6OqkEHfLB5hCjVRhnHCuAok21HSP5jy2bsbwt6SaolWXeie6f/OUEtODn?=
 =?us-ascii?Q?ulZuXTNbqGFBJemOY7Nn9uIDfnS/EwBc0KznIiUPihXislO0SQDBoVCuiTWM?=
 =?us-ascii?Q?yWjR4HDBx7YAUitU/KBdOtZBd1xpbnRiI/oHcHpkwMKWqurmfH9VmX4v78pf?=
 =?us-ascii?Q?0X5Aw7Kus5GM1JEykBPjmaM+yMXR3U4BgiB7hfI7ElehFJ3LEHAKmmjISy5V?=
 =?us-ascii?Q?25kVk1Yhi5aVKFuGUNjBEsebGcy8fLbfp9JyEDgOQDKopP+4Dq9f0MHSdSND?=
 =?us-ascii?Q?2Jkss81IXl89InKguWfj1EPQQEArE/cmcraaF8FxSH3zs2Oszcec7cyPxu0u?=
 =?us-ascii?Q?vI4fufcnjtETBA5q0uNU6K6TEXw4KkRsAq3D49l9u598jDqe3qqddV/529jc?=
 =?us-ascii?Q?hb83J7ADsJbsmulvGvdUAtrSJT4W3d5rlN9smZWRhP9Oyotrq6T0SrfTwXTw?=
 =?us-ascii?Q?6kyOBJULs1uCF0V6CPi6kzZGZiOKuXIRcj8K58fDJOdd2TC+g30jIo+B70qw?=
 =?us-ascii?Q?4+tKZT3PcLxsz8gl/idCujUc/oPuZAq/737FV1Csv7sicSmiBmog1RA4MZxG?=
 =?us-ascii?Q?YmaioqjtazHefmYsOjz9PM/YqTmNzffYBHFlVsrFrzTvSJu/0B62HndcmE9b?=
 =?us-ascii?Q?MaVXM4s9I6tUjT8n3Mq6qS7ZgSF3zUaVsivTt0YtzvkRGkpKOYIsG+U07onI?=
 =?us-ascii?Q?OIv6/3LEC5nqU2OGaR9Iliu7Wz4ytic+xO2JfHZVbuhUEW4qwjinWZOpn2B/?=
 =?us-ascii?Q?bI5RlIQgHi46R9qDuPiBlQ3WNfsJv6ezDQPUoAT+yG1hXLj0Xgt4YsXhkhZt?=
 =?us-ascii?Q?R/YdphltIicjpZVs7QGeXBcAKIjiHiPNsrLiIs9xGN5umzUS5f0IqkFrB+bv?=
 =?us-ascii?Q?2X7N56EIJz2gLeMYhHP9jm/ya/KefZ0KFFWgt4bPdZXapAUgf2u50gp5Yz5M?=
 =?us-ascii?Q?FoQpC9NtV6nsLuwvrNTsfuD833Vaqi0fjt8kKr7LVRFR52iPzSsRs/JJ82GT?=
 =?us-ascii?Q?y44PDPECDNSM2Hc8PEaEjSZoRH8tofpVPtPNvxzRs3AS9LRP+k1pfn7UHi2i?=
 =?us-ascii?Q?iWFGGrPcUJ7H3TAjX84ssJ6GWE2zpqO3nswBDA2Hkq+8PjXNwh+m?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd670e94-8c90-40c0-e5ff-08deddc9ef30
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 14:54:10.8054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eIoLWCrGxdG+ZNUjE6v00kXc68EEtMLtUSiB4vyAgIEK7BAx5r7vXUa1nT+ZT1zuq7KaEdcCqrwDMvV8qAVs5JvQDLjTn7kYy45MK/Ea0HqP9huFk62vOPqkeppiuDkh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11741
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_075415_630493_4197D3C5 
X-CRM114-Status: GOOD (  19.55  )
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

On Thu, Jul 09, 2026 at 06:15:53PM +0800, Sherry Sun (OSS) wrote:
> From: Sherry Sun <sherry.sun@nxp.com>
>
> Use dw_pcie_rp::skip_pwrctrl_off to avoid powering off devices during
> suspend to preserve wakeup capability of the devices and also not to
> power on the devices in the init path.
>
> This allows controller power-off to be skipped when some devices (e.g.
> M.2 Key E cards without auxiliary power) need to support PCIe L2 link
> state and wake-up mechanisms.
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 92f8e4a299e8..afcf3b6bf3cd 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1382,10 +1382,12 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
>  		}
>  	}
>
> -	ret = pci_pwrctrl_power_on_devices(dev);
> -	if (ret) {
> -		dev_err(dev, "failed to power on pwrctrl devices\n");
> -		goto err_reg_disable;
> +	if (!pp->skip_pwrctrl_off) {

if pci_pwrctrl_power_on_devices is true, where call pci_pwrctrl_power_on_devices()

> +		ret = pci_pwrctrl_power_on_devices(dev);
> +		if (ret) {
> +			dev_err(dev, "failed to power on pwrctrl devices\n");
> +			goto err_reg_disable;
> +		}
>  	}
>
>  	ret = imx_pcie_clk_enable(imx_pcie);
> @@ -1454,7 +1456,8 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
>  err_clk_disable:
>  	imx_pcie_clk_disable(imx_pcie);
>  err_pwrctrl_power_off:
> -	pci_pwrctrl_power_off_devices(dev);
> +	if (!pp->skip_pwrctrl_off)
> +		pci_pwrctrl_power_off_devices(dev);
>  err_reg_disable:
>  	if (imx_pcie->vpcie)
>  		regulator_disable(imx_pcie->vpcie);
> @@ -1473,7 +1476,8 @@ static void imx_pcie_host_exit(struct dw_pcie_rp *pp)
>  	}
>  	imx_pcie_clk_disable(imx_pcie);
>
> -	pci_pwrctrl_power_off_devices(pci->dev);
> +	if (!pci->pp.skip_pwrctrl_off)
> +		pci_pwrctrl_power_off_devices(pci->dev);

Not sure if there are counter in side power_(on|off) function, if not,
just skip power_off is enough.

Frank

>  	if (imx_pcie->vpcie)
>  		regulator_disable(imx_pcie->vpcie);
>  }
> --
> 2.50.1
>
>

