Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B422ACD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 18:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l6kOsKjpcCNvCmXxwOH93ZURdxywG3QWkIOA9Gg2afA=; b=Epq9rflVFKM2De+bkJ5gpCNmzw
	mZMhPuDgFPck9yACupYEqExS0KlOzYCRBRuGb+IG4eEy/Tij0/Sde7yxdxe2rb7ubI+proatCPWcQ
	/lSN7pblvzB4M4KLXp86cf58DoqhCXJ+Ayu6SEfxVFf4U5ASLCSBsrioBQ/PFJ+b4DPdKAIdav2eq
	Rnfgtlh8kn6bWUn1nChHNy87B5GaK0J+8qPcM0A2rICfxAZhADIOq1zDVT6L2nkga25dCebHUwd25
	O99nFOK3HlMVmYLHr+QEZCUbKX4TLkl/zMAi7pz2E6gHOtTcGi9zFRnbPntVYrtdC+lvgwJSfqAUM
	XOEvHPCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPlpV-00000005UfP-2Dob;
	Wed, 20 May 2026 18:39:41 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPlou-00000005TRZ-2l2M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 18:39:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UuldstZ/N7K55kxaRpLTkguVum9ZuvQzDBpH2u4GE2ccnhoqjTHxkfNXchC30m5RAffCooGhO00G1Ual4L8DxA3hwozdevPYBMg4KlZwGwvPsBXynWGVQUSpcE3CfMVAJ1Y07zjms2Pf8E9QyVdM9tIwuLGXjvttJpeZe4xOtDhMWi3Ff0/QUq4XJIJyM9Vs1YzSZIT61t6QwJ1qYN4u115hwT6jK9zbnREwi1GtUMwDWJLu9dfsxIpwv8HX+ubmPRP5CDn3jn9nmYoI761svJ7Z4hZVMVOIvZgjuq5bEVjeWsbpznQ2EUwe+OrolOJbidBGyVENSURnxL8wXbjoFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6kOsKjpcCNvCmXxwOH93ZURdxywG3QWkIOA9Gg2afA=;
 b=nHPMmCxmRUWN+q2Z79tqhWBZucn15J0y9dyx3o5IANiGcHw1BfMBkWaHOCu3SljVw8JslINZd8SQ0Eo/rho9FHbXqoN6tOZiMMmQ3ZDXmDrprc3XfV8YjMQV4hWaaAvyV2a1SVLJGQs7dZLDiEQL71LZBQlxwwWrx5QKzZ6v27k+nNsq51REWhFlr3T9BZ3T0drbpAKqOP9/W16AjPnAsTXMoyGkReCF/6SiIGp/PzHFFwH9pv1RtTl352a62iQPNxoJ21ppAQriTyMZITrvPIZeJH3k9X+El4lRwMjrFaH9xgm1bHu3LPa62cEfmTtqGWwKJphdIoKR2uSKxucW3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6kOsKjpcCNvCmXxwOH93ZURdxywG3QWkIOA9Gg2afA=;
 b=C6UGr9oBrxQjGLLPYsU6WuYUnSwykB5Fdx7L6gDkOzgbkHKvMaFLsJHnLGMeV0ZiZSu1mkO8Z93TScPS16Dc5nXZApjd4s8VaVj/zVQu2fOkcNMRo6kevllMfcfKKZEfofDomn1MxIhyczD8jXwPMZkAd23mYvyMy5LbHRtZ13hHtjtlpep86c+e4k09vcxW+AtWeXFxy3Dsf50GRdsMYnB+Z8SDIv7MYFgW6034ui0ocujsg6JiPyCqi3UQNaUVIwD7hhk/7jBgxqIv9qDhTP2BSfjhbm/wIqXZRdR00u4IeIK2d3zmvxXSNuxu323Hfen/6Nx8cnoJFNEhPA+Jtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AMBPR04MB12312.eurprd04.prod.outlook.com (2603:10a6:20b:723::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Wed, 20 May
 2026 18:39:00 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 18:39:00 +0000
Date: Wed, 20 May 2026 14:38:48 -0400
From: Frank Li <Frank.li@nxp.com>
To: "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	bhelgaas@google.com, hongxing.zhu@nxp.com, l.stach@pengutronix.de,
	imx@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, sherry.sun@nxp.com
Subject: Re: [PATCH V3 1/8] PCI: imx6: Integrate new pwrctrl API for pci-imx6
Message-ID: <ag3_uFchYZoE9sMn@lizhi-Precision-Tower-5810>
References: <20260520084904.2424253-1-sherry.sun@oss.nxp.com>
 <20260520084904.2424253-2-sherry.sun@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520084904.2424253-2-sherry.sun@oss.nxp.com>
X-ClientProxiedBy: SJ0PR05CA0132.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AMBPR04MB12312:EE_
X-MS-Office365-Filtering-Correlation-Id: 851392eb-62a8-4f1d-c127-08deb69f0ec7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|376014|52116014|7416014|1800799024|11063799006|22082099003|56012099003|18002099003|38350700014|4143699003;
X-Microsoft-Antispam-Message-Info: avd2O8kc1c+9jqhHOLGpqfDcorN79YIYbOz9BeOIZD/uCvIRdFQc0Hh4DPhoYiGSVV2VPKCbywxGKPpuJnP3AXNDavxT2V6lQHf3DkDWKG8Xpu2A0GnBI8XZc0fUNSANpadOLWqqQ+QansSleM0vKj+ZCE7rtUgL4m0i4PEFUN/dDMO5G8Z/hSfhl36XjqFUX7IEtDNcFl9hDqvnBxnnFv/dxQTNQB+SkrSa/dXTuTlSzEr2pMgjCFTN5h2EeKkfDlpAz7SaoProBBQP3oIuOPLMaB578mMZLEz+vVDvF0rOQraptq5glMyp5j8uPglQzk7piNR0AMI7njnNvd22APRa4qtOrXZBi2oTpgDgFSWkCuMcZOow62dILsTaGslgqKyU2ZdX+VwXe8l0GjpWJHZQTZw+WD/ACmJevAAFuTTEUP0eb6bpXiP/Rcqtwm4B0HVbMuV+n97qE9CAd7nPXsU2xMmR6AmhtbJvhREgypkcH2CTWtRXrfKYT7V4YHKxQxE4XDtD9SI1MxBA+3mXUqiCDWJTlo6IrGxRfiglG45OsqmcJmQxwH9hDKHcdRqufXNQaHyB2Hu4XZkJEwv5FCZVD6XdRc/emRdea25JuQvT0I9aFg+iL0pPBg4xbkFWut1cGlL0RTk8pzuehykbyIL/Vy3rUQxpNbxbrGI1NmQt7dOQjcWcps8ByKhxwA8X+j2JiLnEZbSfIv5OvEMkiAtmf7s1mb/i78D+IK59bNoTTDRbeWpz4GjRhgvj22mg
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(52116014)(7416014)(1800799024)(11063799006)(22082099003)(56012099003)(18002099003)(38350700014)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2kklEzewmn34FV3bIExavHzho0OWr4DmCleh1c4DUNHefThcyAotU5VHXbBn?=
 =?us-ascii?Q?8avloLC6Gip7mfJ9dKvbM96aV4eBlfrrRpoM5ZkjtpXH0OoOvn83sFf1KLIY?=
 =?us-ascii?Q?rhlI2GkE+A+pjgZXwBDVrxHT68uNQ/Y9+50b7bLP4zWln6H8rt5lY0LtmQG5?=
 =?us-ascii?Q?Q8kzrbnz7PZn372VPevE2EJpvLiIL6dJFQauelNKbqz36BljSyQ27rdiE0pV?=
 =?us-ascii?Q?PjjCwzA7XzC3oIUY/EI3rSnwGJ4xkTGwq7SZRC4CoeVWWI2/+1LyZNp4DRAm?=
 =?us-ascii?Q?OnWA1Lf/kaTg2PMCL3Fsmt/v+QZIFB8w8ZMFzVFG618+uxHepNYG8t9vVxt2?=
 =?us-ascii?Q?sx2uEo7lmrj+bJ3LZXFE3rpgzBglap+uBqa1t5GvtYNjBe5zfjXceuxBF84h?=
 =?us-ascii?Q?UVt6Ve+1hOuOQ3cAtYdox8hI2SfF2zWpP//0kW9KLx5zO2GPHW/2R1gMcRC3?=
 =?us-ascii?Q?B7MmAGehv2iQxaXriiF80iMBpmyoRdufKSjZ9x4vVtVtYLuUf9S+AzXamZBJ?=
 =?us-ascii?Q?jxd/DGXHlFlP69gNy2N9wWP1AY24HG89QYV+0/vf2vEGMQdjluZI0phgV0pk?=
 =?us-ascii?Q?k4VENNZfjOmRV61gRRumqHyWG+R/vJ4UZ2zXGr8uLzqnMpm8CGzEg76M74Tf?=
 =?us-ascii?Q?KToPMy8c2rTN2CfQxEG7ZdorHtJsuoESiO1U/VKPOFveaIo+Ku6agPSWsa4Z?=
 =?us-ascii?Q?VpTqr7Jw2QK4Fv81mvvl3Zl6V8iR/YW2NV0R4+2JPT1BaQqUnqazOFtDBg7y?=
 =?us-ascii?Q?UjnHPONdFWwHOlGQw0XvTXwXmqHbK/pBAKpmoN/Q+vY0wf6h/EJkYOZmiP9b?=
 =?us-ascii?Q?ccTGkPBFVvtHV8uraVkduo+QUkxWYQm9jGalhSlaSXICLGHCSJMCeRehMOL3?=
 =?us-ascii?Q?/PPEZeuuFncraNmu2Z2pjvYaRDmLrZrpJkcvfsv8RjUJIna0OGSZIhkJHPDv?=
 =?us-ascii?Q?KP26KP5NXPYRtWWHByShSIfZIjOsAjpK4Mc85ospgNqOkc+pIUYW+OV8lifN?=
 =?us-ascii?Q?pwEBSuJ5q36hAntu/4XO92K15XLzpypju7W9IrSKrkAAIjt0QnGs9wSRP86N?=
 =?us-ascii?Q?3ciGJ886FXO8i9I8DX5hF7swhuRQP3qUm/7k2gD+xfAgQUyCTI0U+BcQiTZr?=
 =?us-ascii?Q?yv7B1qZ3LDzAmJksW+iuuA0+ZCI8GBr8dUPp13CQyRcNAc+7u6CoLBEuNK3I?=
 =?us-ascii?Q?AebxRhrxH4korUyB+dY59kDj/YqvYXfpvGvVc1d/sS0bpeNT2p8/3swvScXY?=
 =?us-ascii?Q?n1QBVgftSPdAdUeAhzHnUAKj+dXFqy4Z5CHuoTWs8RPzkrNTa+fAKLwUsUiB?=
 =?us-ascii?Q?lE03CoIbpmuDLpbAZudmsAULgl2l4SM3J6anmj45YuysSufsdH/TVQ2CqBVr?=
 =?us-ascii?Q?rEsAKRoO7eZPSvs1PtRBMoO7qnpELcsHehFZK4CiSzTv6itK/kbLehabBl3S?=
 =?us-ascii?Q?sU4KbDh62EavQ4t+kiCzOHDcmvmf4oGlC50HQvCC9a03YuuI/tP7N0WV9vQD?=
 =?us-ascii?Q?sUHb8LeBwhMqtyewGhHJhUdD7LHBbd+rMA2BfnAhBIryLlP5v9+KUZP91aTP?=
 =?us-ascii?Q?RQ/QB94yiPyWJfJNJeE4ENr3Ir/hhwnqcrAiH5Y12U0k2iTTA7gp9mbyxH3L?=
 =?us-ascii?Q?v0A2a7M5ywe65jWootXyM//K9BDGFI65kDe0l2qOYnizqxnd7CyxDrU+n4XC?=
 =?us-ascii?Q?QeS8hg3LmoiQ+y9ZBzB2cTCg343L3krLYTLFsbEPIOup3wdqoIUakKZReEVp?=
 =?us-ascii?Q?6QcVhpVe1Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 851392eb-62a8-4f1d-c127-08deb69f0ec7
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 18:38:59.9963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n1v454oHBaEehe/G3iPdzIFKctcjBYD1gAuxGhOKniG+uEx6tjMd65Kk6HxzpMD5OVJIZOcsw24GKkpf5XpWrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12312
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_113904_732241_618B1978 
X-CRM114-Status: GOOD (  26.03  )
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

On Wed, May 20, 2026 at 04:48:57PM +0800, Sherry Sun (OSS) wrote:
> From: Sherry Sun <sherry.sun@nxp.com>
>
> Integrate the PCI pwrctrl framework into the pci-imx6 driver to provide
> standardized power management for PCIe devices.
>
> Legacy regulator handling (vpcie-supply at controller level) is
> maintained for backward compatibility with existing device trees.
> New device trees should specify power supplies at the Root Port
> level to utilize the pwrctrl framework.
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/pci/controller/dwc/Kconfig    |  1 +
>  drivers/pci/controller/dwc/pci-imx6.c | 24 +++++++++++++++++++++++-
>  2 files changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> index 216ede0a867e..aa0b784c85b4 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -114,6 +114,7 @@ config PCI_IMX6_HOST
>  	depends on PCI_MSI
>  	select PCIE_DW_HOST
>  	select PCI_IMX6
> +	select PCI_PWRCTRL_GENERIC
>  	help
>  	  Enables support for the PCIe controller in the i.MX SoCs to
>  	  work in Root Complex mode. The PCI controller on i.MX is based
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 773ab65b2afa..b137551871fc 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -20,6 +20,7 @@
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/pci.h>
> +#include <linux/pci-pwrctrl.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
> @@ -1331,6 +1332,7 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
>  			return ret;
>  	}
>
> +	/* Legacy regulator handling for DT backward compatibility. */
>  	if (imx_pcie->vpcie) {
>  		ret = regulator_enable(imx_pcie->vpcie);
>  		if (ret) {
> @@ -1340,10 +1342,22 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
>  		}
>  	}
>
> +	ret = pci_pwrctrl_create_devices(dev);
> +	if (ret) {
> +		dev_err(dev, "failed to create pwrctrl devices\n");
> +		goto err_reg_disable;
> +	}
> +
> +	ret = pci_pwrctrl_power_on_devices(dev);
> +	if (ret) {
> +		dev_err(dev, "failed to power on pwrctrl devices\n");
> +		goto err_pwrctrl_destroy;
> +	}
> +
>  	ret = imx_pcie_clk_enable(imx_pcie);
>  	if (ret) {
>  		dev_err(dev, "unable to enable pcie clocks: %d\n", ret);
> -		goto err_reg_disable;
> +		goto err_pwrctrl_power_off;
>  	}
>
>  	if (pp->bridge && imx_check_flag(imx_pcie, IMX_PCIE_FLAG_HAS_LUT)) {
> @@ -1402,6 +1416,11 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
>  	phy_exit(imx_pcie->phy);
>  err_clk_disable:
>  	imx_pcie_clk_disable(imx_pcie);
> +err_pwrctrl_power_off:
> +	pci_pwrctrl_power_off_devices(dev);
> +err_pwrctrl_destroy:
> +	if (ret != -EPROBE_DEFER)
> +		pci_pwrctrl_destroy_devices(dev);
>  err_reg_disable:
>  	if (imx_pcie->vpcie)
>  		regulator_disable(imx_pcie->vpcie);
> @@ -1420,6 +1439,7 @@ static void imx_pcie_host_exit(struct dw_pcie_rp *pp)
>  	}
>  	imx_pcie_clk_disable(imx_pcie);
>
> +	pci_pwrctrl_power_off_devices(pci->dev);
>  	if (imx_pcie->vpcie)
>  		regulator_disable(imx_pcie->vpcie);
>  }
> @@ -1931,6 +1951,8 @@ static void imx_pcie_shutdown(struct platform_device *pdev)
>  	/* bring down link, so bootloader gets clean state in case of reboot */
>  	imx_pcie_assert_core_reset(imx_pcie);
>  	imx_pcie_assert_perst(imx_pcie, true);
> +	pci_pwrctrl_power_off_devices(&pdev->dev);
> +	pci_pwrctrl_destroy_devices(&pdev->dev);
>  }
>
>  static const struct imx_pcie_drvdata drvdata[] = {
> --
> 2.37.1
>

