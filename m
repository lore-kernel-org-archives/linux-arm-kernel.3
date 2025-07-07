Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66931C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 19:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=YIldWJFesOVsGt87pEY3SAylzj10S1WiWJKoIwdOeoc=; b=1LK9QREoj0HIsl
	BKsR84GdXzcEMwZITIPGolaHD5QWgSEf2qXoZ8hRKzrQWukSllcW4whdtoBiXAQWzoyzMn7lk/PO0
	lxg0Ntu6iNzrIWRO/GiWdsNGf5kzCMzkPZrKB3UwjUoQE1oLncdk1+NfNRappVIoilY+zpp19xdUK
	mmzFz3MG4LjL50YNF+1a5QRc4ZNgLEEA33a7ppB6RBJvq9+GGLGD84XA1v1N0S6JpcZNXi1JvHMES
	AYfZ/C5yaUpeGB4FqqtKQDBntKr9ZO7pGFRoIMQENJaYMZNUdyoaycIleVU2KJoBmtNhKSWZb4e/R
	yF7ZXqN2obq2l7KEr4og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYrdr-00000003S2O-0Jyc;
	Mon, 07 Jul 2025 19:36:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYrbW-00000003RpB-2vEs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 19:34:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E6BA3A53FF5;
	Mon,  7 Jul 2025 19:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF8EC4CEE3;
	Mon,  7 Jul 2025 19:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751916857;
	bh=q4Un9UMyAO/m5V5UCHaW8IYs1wCaLRO9F9XqUTWH3xE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=olvyWCrKA61vFemOq86pVptJUU70apmXkO1jxlJM/MIPixuIzFTpCaEOnxAvPAIN+
	 XPZ+T0AMf1zFyP5Ax8dCgixUzT+l4ErYyinB5XaNIvo2oUvj3bj3OHQV0Hu8v4Aacd
	 rki8Y/zvnAsFt9rAzExc2W8ZCKotFSsp4ETOJGnaffLAN8NtX/c6AIgv9mTT4xnU1i
	 fbWMeRaoNbYy2H5JcYaIngnm7EwkZGqU9HoRjwOPsXehuh4GHnfb2t7srYQkNzxpn7
	 sTneFKW+7gU2MCU33a6o5cMT3X8OQezYF97b0Mtf0xYjRDj2PwGuR/oHxuopGppRxw
	 /Tbcb0SDmJ7dw==
Date: Mon, 7 Jul 2025 14:34:15 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	bhelgaas@google.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI: imx6: Correct the epc_features of i.MX8M chips
Message-ID: <20250707193415.GA2095765@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617073441.3228400-1-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_123418_804903_5F715E02 
X-CRM114-Status: GOOD (  19.65  )
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

On Tue, Jun 17, 2025 at 03:34:41PM +0800, Richard Zhu wrote:
> i.MX8MQ PCIes have three 64-bit BAR0/2/4 capable and programmable BARs.
> But i.MX8MM and i.MX8MP PCIes only have BAR0/BAR2 64bit programmable
> BARs, and one 256 bytes size fixed BAR4.
> 
> Correct the epc_features for i.MX8MM and i.MX8MP PCIes here. i.MX8MQ is
> the same as i.MX8QXP, so set i.MX8MQ's epc_features to
> imx8q_pcie_epc_features.
> 
> Fixes: 75c2f26da03f ("PCI: imx6: Add i.MX PCIe EP mode support")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

"Correct the epc_features" doesn't include any specific information,
and it's hard to extract the changes for a device from the commit log.

This is really two fixes that should be separated so the commit logs
can be specific:

  - For IMX8MQ_EP, use imx8q_pcie_epc_features (64-bit BARs 0, 2, 4)
    instead of imx8m_pcie_epc_features (64-bit BARs 0, 2).

  - For IMX8MM_EP and IMX8MP_EP, add fixed 256-byte BAR 4 in
    imx8m_pcie_epc_features.

> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 5a38cfaf989b..9754cc6e09b9 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1385,6 +1385,8 @@ static const struct pci_epc_features imx8m_pcie_epc_features = {
>  	.msix_capable = false,
>  	.bar[BAR_1] = { .type = BAR_RESERVED, },
>  	.bar[BAR_3] = { .type = BAR_RESERVED, },
> +	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = SZ_256, },
> +	.bar[BAR_5] = { .type = BAR_RESERVED, },
>  	.align = SZ_64K,
>  };
>  
> @@ -1912,7 +1914,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
>  		.mode_off[1] = IOMUXC_GPR12,
>  		.mode_mask[1] = IMX8MQ_GPR12_PCIE2_CTRL_DEVICE_TYPE,
> -		.epc_features = &imx8m_pcie_epc_features,
> +		.epc_features = &imx8q_pcie_epc_features,
>  		.init_phy = imx8mq_pcie_init_phy,
>  		.enable_ref_clk = imx8mm_pcie_enable_ref_clk,
>  	},
> -- 
> 2.37.1
> 

