Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B341C44515
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 17:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vrIIp5vvuim1vMqA0JaquYGqHqFXlC/x9tIPiRIrp0w=; b=hrpSDMyVLUIQ5N4Hnbujakjf+1
	WKDtneQaJP6geRstUeUI4wycXAYv6e0mXQQCXPh8bvfWoYENMOyj9P9igVS9BebwHn2pR5wVP/FHv
	dsbPA1edv5QsXs4uLf0TziQmX2zyaqyy5LL61ZuAqYcm1BZd8krGoIVJo2CoXJ/qrZ0xItFFcOnbg
	tk1wsA8adlfLslJK2nT1zF81jgzpXMyeCpL3z0zlQpXFCE3cAI9OaTslJNYukRF8jgvDXUXyHG1uj
	GMqaBgWxcFLcXag9cymaVeOq+lrm3EZIQBW0XF31Qs9BN9DuV6grT+dBLoGG36iHt8sFypIlZljnL
	/U41XINA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkm4V-00000002pbM-23tM;
	Fri, 17 Jul 2026 17:09:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkm4U-00000002pbD-1WKV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 17:09:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C5EE843A57;
	Fri, 17 Jul 2026 17:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D3E11F000E9;
	Fri, 17 Jul 2026 17:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784308197;
	bh=vrIIp5vvuim1vMqA0JaquYGqHqFXlC/x9tIPiRIrp0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i5TbUhyEKURDYC//pmORMnyZIHNvtflLPqTTUQgKjllucYKinkcQl+ssuKZrzA7nW
	 0n1w6zhI7AJ8gx3SWYRLm94qclZsGIEQ9CYPDjQfTiGpHLt9Ff7ggdTTeowCJZyvZT
	 mmNL9TJt8Z4HGsobH3Avb+VLWn2yNV9cWWxBd8b16diMtjrchCYgSJTlEAAgI4EMtR
	 aiifL/uiUt/WVKnSRKSEfa6fDxMc1TzQVBaCh2F+csc0OP+bVjd9+fe4qH0b2/tfHr
	 XdbQCSQJDcpGeFjTha6ceq7sFcmk0kmVqlPIxSwi/mMCo0mGgQBP0XzDJPuvtj9nIW
	 X6fVJCtnhYTmQ==
Date: Fri, 17 Jul 2026 12:09:56 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: hongxing.zhu@oss.nxp.com
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	bhelgaas@google.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, Soeren Moch <smoch@web.de>,
	stable@vger.kernel.org, Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [PATCH v3] PCI: imx6: Keep i.MX6Q Root Port MSI capability with
 iMSI-RX to work around hardware bug
Message-ID: <20260717170956.GC11343@bhelgaas>
References: <20260717033203.2965045-1-hongxing.zhu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717033203.2965045-1-hongxing.zhu@oss.nxp.com>
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

On Fri, Jul 17, 2026 at 11:32:03AM +0800, hongxing.zhu@oss.nxp.com wrote:
> From: Soeren Moch <smoch@web.de>
> 
> On some NXP chipsets, disabling Root Port MSI/MSI-X Capabilities blocks
> MSIs originating from Endpoints from reaching the iMSI-RX controller.
> 
> To address this hardware bug, commit 3a4e8302e72f ("PCI: imx6: Keep Root
> Port MSI capability with iMSI-RX to work around hardware bug") preserves
> Root Port MSI and MSI-X Capabilities on i.MX7D, i.MX8MM, and i.MX8MQ
> when iMSI-RX is in use.
> 
> The same applies to i.MX6Q, i.MX6QP and i.MX6SX. So preserve Root Port
> MSI/MSI-X Capabilities there as well.
> 
> Note that preserving these Capabilities means Root Port-originated MSIs
> such as AER and PME won't be received due to separate hardware limitations.
> Users may need to use workarounds such as passing the 'pcie_pme=nomsi'
> command-line parameter.
> 
> Fixes: f5cd8a929c825 ("PCI: dwc: Remove MSI/MSIX capability for Root Port if iMSI-RX is used as MSI controller")
> Cc: <stable@vger.kernel.org> # 7.0+
> Signed-off-by: Soeren Moch <smoch@web.de>
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Acked-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Applied to pci/for-linus for v7.2, thank you!

> ---
> changes in v3:
> - Extend the fix to i.MX6QP and i.MX6SX variants as well.
> - Update the commit descriptions suggested by Bjorn.
> 
> changes in v2:
> - collect a-b and r-b tags
> - use correct fixes tag (Manivannan)
>   (reference commit that introduced the bug, not the incomplete fix)
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 98e1db751132a..dba27eac6bff6 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1995,7 +1995,8 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  		.flags = IMX_PCIE_FLAG_IMX_PHY |
>  			 IMX_PCIE_FLAG_SPEED_CHANGE_WORKAROUND |
>  			 IMX_PCIE_FLAG_BROKEN_SUSPEND |
> -			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
> +			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND |
> +			 IMX_PCIE_FLAG_KEEP_MSI_CAP,
>  		.dbi_length = 0x200,
>  		.gpr = "fsl,imx6q-iomuxc-gpr",
>  		.ltssm_off = IOMUXC_GPR12,
> @@ -2011,7 +2012,8 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  		.flags = IMX_PCIE_FLAG_IMX_PHY |
>  			 IMX_PCIE_FLAG_SPEED_CHANGE_WORKAROUND |
>  			 IMX_PCIE_FLAG_SKIP_L23_READY |
> -			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
> +			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND |
> +			 IMX_PCIE_FLAG_KEEP_MSI_CAP,
>  		.gpr = "fsl,imx6q-iomuxc-gpr",
>  		.ltssm_off = IOMUXC_GPR12,
>  		.ltssm_mask = IMX6Q_GPR12_PCIE_CTL_2,
> @@ -2026,7 +2028,8 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  		.flags = IMX_PCIE_FLAG_IMX_PHY |
>  			 IMX_PCIE_FLAG_SPEED_CHANGE_WORKAROUND |
>  			 IMX_PCIE_FLAG_SKIP_L23_READY |
> -			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
> +			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND |
> +			 IMX_PCIE_FLAG_KEEP_MSI_CAP,
>  		.dbi_length = 0x200,
>  		.gpr = "fsl,imx6q-iomuxc-gpr",
>  		.ltssm_off = IOMUXC_GPR12,
> -- 
> 2.34.1
> 

