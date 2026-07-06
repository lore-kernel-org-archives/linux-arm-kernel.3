Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27621C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 15:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HxF0jAg0iHZip1shix/R//UtLyJ4LseZYpKCYGFtkjQ=; b=OV9v4PqZ/pPZPVmnkX87NJnSvX
	L20v3P5jvlVDpZlCuMkQe89jSwOw+g/rCXWP8ji/B1383OdWElCkShIEAQTPl124UcdmFWW0nMoG/
	v0z9qEayqjnDXQMqER1zGkHMkG0Zy9eR0tWpeFEQMoGR0BXziAvzXSEnutkqnvZP4aII5pqMkvCZK
	qnmLXittN5b4WqLX0Cw/nBHWli0a2sRw1LSZqUy2k7IajxwIE97DzbyTZ+lYy3mhJmYcnNYg4+9MK
	NcT1TBx0lphy2Hk9/fx/QvgZvhOl6qBgG/WsWP/2QJkHxupXuazxz675zqKdxdjF1KdilikORK0p5
	Ua9SAomA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglYc-0000000Cwwn-3I5q;
	Mon, 06 Jul 2026 15:48:30 +0000
Received: from mail-westeuropeazon11011029.outbound.protection.outlook.com ([52.101.70.29] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglYa-0000000Cwvh-3C7l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 15:48:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h5vWOJxXSq0BA9hIwmDBFAJB+NrDAqpFuwMekWlr92Rzg7qd8lKvQQ8deJuoynKwFPSwiulkYxj5v27B20GHMR6NHeuqfJslK136JXzg5EkuJV8R01abxI6a/nVEyhaH+8s6Olp+nkeFFT/U+hHyn2eGzrp5+sfO98rCs2o5REh2gZtPAJrCdsrBwBEnzapD5yea8W+6dRZKcnivtt2trY6apZz5JWWKl9tqtkGOcfsXDUvaTNPZQEQ+i9YW/DyoUP9U4YF5Esb7PTOqzC1cqDaR09gWrwUZ8d7PHR1uzoSRGI5F5N9GgL3CEY2IrbDzn61DGGnfkyKR/M5BoHTaVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HxF0jAg0iHZip1shix/R//UtLyJ4LseZYpKCYGFtkjQ=;
 b=kbeWE4CJkOcGo3KiPBtCK6CJ/tUxwE0F39AFSiANtwukuLVayaHHB4ZCGBQJput1zIWkZYLp+h3T1BQODMy299Lt9iFjrCea/fAvEyz3YTgDWlJA1dHOUArsNJcl3xLOXW06xxLVhry1ZF78ujKj5KRelU6u4KX7tQfxH0Zo7iQ0vgs3nR8rK6E2hFYCUuo1efnzPF/bMvsbG1X2B9jq6csi7UvEsX+7HOJTkYkdPvK4+dEv9iGYFNUmA1mM1f18s04T65ZRfjdUhyd2xJtdomAL78tZYcIU395juvieby8WQa1/qmAWfolGFfjbMVZe0Jpfi0caEbj+aqyeCNXHQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HxF0jAg0iHZip1shix/R//UtLyJ4LseZYpKCYGFtkjQ=;
 b=CvQZZAYRZZvzzDvNgt+SJ0C5IWYTWAT+4wymPPQRZ/1Wbz0J7FKKWJfnV+HWfaeLel+e8MCqE4xL3iYSO/yT1OGVLcBg0U55poLOlIYQftrcvqxGSndB5hJEIgkqKvx+WFD/tzxcK3VOKn6sv+oLoHRBCfLJlC5GlbAOVytWZBUGb2VkQUKVTUIz/JAv40XMhoAuIC41ENB0TSUEy8rR1vwMmzDBet6bk//GSVkZR5sBpPeuLBQdG2JsLA7P0APB45WznGypozaClqTjQl3XdWJvvtx+Xag7nss9nJt7ogFwE9vpVWDy3hTCI9d3zheATxXh6FO6Y01IkHqyKvoQpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB11826.eurprd04.prod.outlook.com (2603:10a6:150:2d1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 15:48:23 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 6 Jul 2026
 15:48:22 +0000
Date: Mon, 6 Jul 2026 10:48:11 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: hongxing.zhu@oss.nxp.com
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	bhelgaas@google.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [PATCH v1] PCI: imx6: Add runtime PM support for i.MX95
Message-ID: <akvOO5ssYij30poT@SMW015318>
References: <20260706091639.3886856-1-hongxing.zhu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706091639.3886856-1-hongxing.zhu@oss.nxp.com>
X-ClientProxiedBy: PH7P220CA0159.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB11826:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d2b8421-480f-47b6-3d09-08dedb76023a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|7416014|376014|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: gWSYF9jbjOodDqK/p0x3xZOFwchXphz2dU9RdA8U82kLM0j+nvxu5CfvoS97EnwPrr9o8QUrHqqKsbjFhOS/jOABCbvN9KS8dDu0/iggH52hYzu8BHTPfgunANqm8X9c6YKCswVNO7VDAPlpuh+JpIX/wnyI6E+31sM2hX2+oisJgCtbYrh5AWIT2kG7gcrggIejCnwGiB73IwYoIus3GYPfdwlxWcf0o530qX8p1eqJnue/jrNurkTzVFzkQKl8PBEYOskNWoobbi9FY+fGRKjnwg8p9eGTCciPqcdvLTBpAapnSrRIi+Ws3EkZu6TMV0fmB3xhOK3j94Juq9oD2EfcdiGyx1/8l4oDV5l60DmXp7H9s6NNAm2E1ERbZLRlpqi5yQs0UtslyNY14xq25sukeWTAUJIeIo4dw3ctC3p9hfRrvTSWpGbrdhRcHY9Vgj7WAM2Bb0F+38tyyX2SrDBYyv4boiR86heyXJLZf0/ydCMwQKcM9UZ5S1LJKDFHZDVBHyQogTLjlmMrG2xt01Ch0kbt1csnjCr5hUjFyrLRJN30LHazjRV3qFX6ZpvpGwCFfT7lAcgdC/hJmp8NajznFHhYujwoJjHM0mxeqJt4T7+rG/Ea0qHxBm8GbL3FfLvKGAUVDtTaYEdaUtHXRJhv1y/cRYbqwvQjoMvSv8I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(7416014)(376014)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nz/8b9HNu4X8plWDd4GKjlHGOh6Ngv25Im+3Yf/40O6TAY+GEnztKHBUoCTv?=
 =?us-ascii?Q?Mwh0yn+ZIsrVgrOOop5fLuGNtmLZW651BTIw/L0Oc2A3IBnJHASx0ZO3R6yo?=
 =?us-ascii?Q?E9/Z/lNG+DnAXCvrevzMZ/cuc9X+fyo15wTjyQ8aHnzPEqtEU5/Y/amWAjjB?=
 =?us-ascii?Q?EE61gFvZ4alDsKiZsxeqpIfrOP0aGDS7K0lmK1FWcigN/aLBrV3na7D5nkpK?=
 =?us-ascii?Q?Aaf76UE9xEBnsPwVqi4AvKwXtU7qIUVbTABbBCA4gtIZ1P1uoGupq+S/lS9C?=
 =?us-ascii?Q?UEIfbwCFijgASZvo6DGKhXsDtkgNmAgV241Jv73dGDsEIclwkvZKeRNMhkTA?=
 =?us-ascii?Q?TexTQKzukbgxQvCCKwKgzdmC9hJJw4OF/k2sx/TT5S8Yf+aqM42vxM7bHuGM?=
 =?us-ascii?Q?rwtUpCgjQmgdmSf2Ed7SEDFOQ9BTRrogWzqw+U8g9XGh09kmwO7K3K1Ib2tc?=
 =?us-ascii?Q?rKkOrbol4aZM2HCWej51kAyveJ+D3oc37YVz011fN3rUwMJ+3IyLAv2u+5px?=
 =?us-ascii?Q?5jim+87scSDifubp5YuS0KF/yJMR0ncJY0oKo3v1nE5AXT2RPnBnBqCcix89?=
 =?us-ascii?Q?vIsY8lGpRhfaYbpa06OiWX6tWBuBdZKtyfKt+kyREYNlDeq1YXPhIN8/FnVe?=
 =?us-ascii?Q?xLd6P8DzoPBhJa1RKsAnkIzZEEvmthHE0ICvjclBMI/VeVYt1fJ79JtipctD?=
 =?us-ascii?Q?E19KAg4L1alK2sGKq20LB7jDMzO2PTz/bQuoCg0kG5aQpWHGx/g0IhICTR7L?=
 =?us-ascii?Q?siK1Wu/Azd1yVaFe/uTYa0jVvrYOJjvjHNwb6waoPHu2sEYx6L20zVKh2udn?=
 =?us-ascii?Q?rHf8J8m6WDWSOZpGXBt0Nr+n6NKwa6eWEnHKi/g1hzpVYBoLqK6Z0ykH0XOo?=
 =?us-ascii?Q?IVQJaygmJozbBWek+bxhlMwDXkLl62x2WQPdiqRCmDis71Ry7PXUpUnQDyqP?=
 =?us-ascii?Q?4u2knqjq4VCPgE41Zmeu2yo9Z6xgX/oLAwVPqFzHXrl+BMQPIeOmRLEUe4H/?=
 =?us-ascii?Q?i5Cu//y/j0mcgKNpDhOR5q9wxybzOXwpe++6uprjzsQujEg3XcPQzJ0B1wDv?=
 =?us-ascii?Q?Wd+x/mX3iVjPz+UIROx3Wl3FiKWRl1s9idVIUyTp8x/3A7UJk9K67ecgp8bh?=
 =?us-ascii?Q?q2NSO7cRYXrKzTTG7vCDRt2pxT2SlLDF0LF3xrqE34/+2/p/w3M6lGhAwjnf?=
 =?us-ascii?Q?pOEYWDQAy4mRJ6WmkQsW/t7xT5Rlx4pK5jaV0JaZiOg8x6z9S8tIhtgLNxtL?=
 =?us-ascii?Q?32tE2k/Aie9dkamNy6pRSwh86iotqu7Q4D8J83vrsCw3fB1TLf3WoEzoDjHz?=
 =?us-ascii?Q?ZoDvLaHwW3cBZO00QzHAIXAjZZZIJZSPluboJXWfOvprbwja/78NawylWL6X?=
 =?us-ascii?Q?fTRMhGi/kllqjvE4D+QUvbv1JKzCETVtcnbxk0fTwK1pUioq0Rx6SnGaSII4?=
 =?us-ascii?Q?CYVzStpQryztEKjqPbu/YgHe0l0QBAF8DwAwzH5nnupzlf8zYLdg+LC03S6y?=
 =?us-ascii?Q?h83/nvvbY8xtLhOhT7i0tp5YGnfSA17pvPfSlfxBXt55vsIB96PziRiFHSev?=
 =?us-ascii?Q?QvBw3oCNm0jsXBCuROU8HHyeXt+Zly6vAfhSozjmKTxn0gaO8bt2IGtQzJwT?=
 =?us-ascii?Q?oslHc5uONRLF3Y0MCiiSg67xUKvihBHRSCe0Ty4SCUP4cW/xvTeBJBfUxjp2?=
 =?us-ascii?Q?QyeNISdCtornWNZlkpROlH8nXU5y4/XBDWaOTAmv92xy9ewJbtxljmEq8wdP?=
 =?us-ascii?Q?CS39iitDcYPSb4Nrr7UT1qT1jMx8vEMUI3k1FHoBibFtHDsvuNQX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d2b8421-480f-47b6-3d09-08dedb76023a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 15:48:22.8175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9P94PtSIY1R2sRUqS0GYhL/VXSzQXQddjoWEoL2zZeJB7zauVolnrKXJUK0QPS8a2nU+R9TNj+K0WJYk49PTQl4EbBjOfV0GMZozzWnc8o33+O0Thv9er17n9kqyIwW7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11826
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_084828_802096_E4F30090 
X-CRM114-Status: GOOD (  25.41  )
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

On Mon, Jul 06, 2026 at 05:16:39PM +0800, hongxing.zhu@oss.nxp.com wrote:
> From: Richard Zhu <hongxing.zhu@nxp.com>
>
> Enable runtime PM support for i.MX95 PCIe Root Complex to allow dynamic
> power management when the PCIe link is idle.
>
> The i.MX95 PCIe controller supports entering D3hot state when PCIe
> devices are not actively in use. This implementation uses
> pm_runtime_no_callbacks() to leverage the PCI core's generic runtime PM
> handling. The PCI core automatically manages D-state transitions based
> on the runtime PM state of connected endpoint devices.
>
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 023145b0dd2c7..3c13f9888ab9a 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -130,6 +130,7 @@ enum imx_pcie_variants {
>  #define IMX_PCIE_FLAG_SKIP_L23_READY		BIT(12)
>  /* Preserve MSI capability for platforms that require it */
>  #define IMX_PCIE_FLAG_KEEP_MSI_CAP		BIT(13)
> +#define IMX_PCIE_FLAG_PM_RUNTIME		BIT(14)
>
>  #define imx_check_flag(pci, val)	(pci->drvdata->flags & val)
>
> @@ -1982,6 +1983,16 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  		 */
>  		imx_pcie_add_lut_by_rid(imx_pcie, 0);
>  	} else {
> +		if (imx_pcie->drvdata->flags & IMX_PCIE_FLAG_PM_RUNTIME) {
> +			pm_runtime_no_callbacks(dev);
> +			devm_pm_runtime_enable(dev);

Need check return value;

> +			ret = pm_runtime_get_sync(dev);

Is devm_pm_runtime_set_active_enabled() and devm_pm_runtime_get_noresume()
help your case? and simplify below error path.

> +			if (ret < 0) {
> +				pm_runtime_put_noidle(dev);
> +				return ret;
> +			}
> +		}
> +
>  		/*
>  		 * i.MX RC is powered off during suspend, force L2 entry to
>  		 * ensure proper endpoint notification before power loss.
> @@ -1993,8 +2004,11 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  			pci->pp.keep_rp_msi_en = true;
>  		pci->pp.use_atu_msg = true;
>  		ret = dw_pcie_host_init(&pci->pp);
> -		if (ret < 0)
> +		if (ret < 0) {
> +			if (imx_pcie->drvdata->flags & IMX_PCIE_FLAG_PM_RUNTIME)
> +				pm_runtime_put(dev);
>  			return ret;
> +		}
>
>  		if (pci_msi_enabled()) {
>  			u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_MSI);
> @@ -2012,6 +2026,9 @@ static void imx_pcie_shutdown(struct platform_device *pdev)
>  {
>  	struct imx_pcie *imx_pcie = platform_get_drvdata(pdev);
>
> +	if (imx_pcie->drvdata->flags & IMX_PCIE_FLAG_PM_RUNTIME)
> +		pm_runtime_disable(&pdev->dev);
> +

You use devm_pm_runtime_enable(), Needn't call pm_runtime_disable here.

Frank


>  	/* bring down link, so bootloader gets clean state in case of reboot */
>  	imx_pcie_assert_core_reset(imx_pcie);
>  	imx_pcie_assert_perst(imx_pcie, true);
> @@ -2130,6 +2147,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  		.flags = IMX_PCIE_FLAG_HAS_SERDES |
>  			 IMX_PCIE_FLAG_HAS_LUT |
>  			 IMX_PCIE_FLAG_8GT_ECN_ERR051586 |
> +			 IMX_PCIE_FLAG_PM_RUNTIME |
>  			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
>  		.ltssm_off = IMX95_PE0_GEN_CTRL_3,
>  		.ltssm_mask = IMX95_PCIE_LTSSM_EN,
> --
> 2.34.1
>
>

