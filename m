Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72109C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 22:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=1xljQTmqJlCzKIHpALxY+4GD7OjjFlayegI2A0zHBXY=; b=tyJvpwm/3SWVQW
	39GIL4AlXFlz+CVReGJwKl9Fp3F5CPP/G2/YS2ANeBDEzlRNLL1nFz2zlBT0ZhDIMfHo0Fp182viF
	5w9jJAVMJ/MukZmHg/WKSrABAiwePa9CNoSTpGbiTdVp9PK/tmElg4ty1zgi+NWGjgsmbK5puyJt6
	HSBf6J9ujm20QI6TMJWVqk2tCKrnKSi1TGKjUIHS0ue/zviNuWxuJ456qTdbCn6zkNYDvd5qJxbIJ
	yhzLDUZCu2L17g+EkmyxvdX+mj9LXwGwEvtdJSfpqscMzKbfdHO7iL0VNtrlVQ027jA+RHHJaTDOu
	zFQhH4juTyDykKg8KThQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkUXr-00000000jOI-0LnE;
	Thu, 16 Jul 2026 22:27:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkUXq-00000000jO4-1ns5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 22:27:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D4E5140322;
	Thu, 16 Jul 2026 22:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88F1B1F000E9;
	Thu, 16 Jul 2026 22:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784240825;
	bh=1xljQTmqJlCzKIHpALxY+4GD7OjjFlayegI2A0zHBXY=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=UPpLHQ452t47t7yKSVf2NY5R05kKElpfJvJu4gfkdUp4VGi/FyRTWbsAkzD0HKGEk
	 eOU5MY0FbwoQ5El9idrCMexlCd44Kxls9YZDsBScrje6Fs8MVyPyiV8ngXCHCmkjQa
	 FjD/UsPU7oIi4130Lfpc+hxylmLL0M8RRRDXnCu9TnJlKz8MmWFXLQPuOlyF3WFU29
	 jOk6xjqNZU5Zuk+zpiQ2NJTXgvmL55f3lRt7dDmc3WOCzU/UpWpQUnp/bB7/EGLQCV
	 z6flHmUHuXrqzuqmt9V9TO8R/j2A2vPSjWDl1e954cHcQ7nVj6xQ7USFR6y98zTfSl
	 NQJhQfXCnmGcw==
Date: Thu, 16 Jul 2026 17:27:04 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Soeren Moch <smoch@web.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>, stable@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI: imx6: Keep Root Port MSI capability also for
 i.MX6Q
Message-ID: <20260716222704.GA240248@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716214054.47372-1-smoch@web.de>
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

On Thu, Jul 16, 2026 at 11:40:54PM +0200, Soeren Moch wrote:
> On the NXP i.MX6Q chipset MSIs from the endpoints won't be received by
> the iMSI-RX MSI controller if the Root Port MSI capability is disabled.
> 
> Even though the Root Port MSIs won't be received by the iMSI-RX controller
> due to design, this chipset has some weird hardware bug that prevents
> the endpoint MSIs from reaching when the Root Port MSI capability is
> disabled.
> 
> Hence, always keep the Root Port MSI capability for this chipset.
> 
> Note that by keeping Root Port MSI capability, Root Port MSIs such as AER,
> PME and others won't be received by default. So users need to use
> workarounds such as passing 'pcie_pme=nomsi' cmdline param.

I'd like to align the subject a little more with 3a4e8302e72f and
avoid repeating the ".. from reaching when the Root Port MSI ..." part
of the commit log, which seems to be missing a word.  So I propose the
following (if you think it's accurate):

  PCI: imx6: Keep i.MX6Q Root Port MSI capability with iMSI-RX to work around hardware bug

  On some NXP chipsets, disabling Root Port MSI/MSI-X Capabilities blocks
  MSIs originating from Endpoints from reaching the iMSI-RX controller.

  To address this hardware bug, 3a4e8302e72f ("PCI: imx6: Keep Root Port MSI
  capability with iMSI-RX to work around hardware bug") preserves Root Port
  MSI and MSI-X Capabilities on i.MX7D, i.MX8MM, and i.MX8MQ when iMSI-RX is
  in use.

  The same applies to i.MX6Q, so preserve Root Port MSI/MSI-X Capabilities
  there as well.

  Note that preserving these Capabilities means Root Port-originated MSIs
  such as AER and PME won't be received due to separate hardware limitations.
  Users may need to use workarounds such as passing the 'pcie_pme=nomsi'
  command-line parameter.

Also, we need to resolve the Sashiko question about whether IMX6QP and
IMX6SX also need this.  NXP folks, can you verify?

> Fixes: f5cd8a929c825 ("PCI: dwc: Remove MSI/MSIX capability for Root Port if iMSI-RX is used as MSI controller")
> Cc: <stable@vger.kernel.org> # 7.0+
> Signed-off-by: Soeren Moch <smoch@web.de>
> Acked-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> ---
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Cc: Richard Zhu <hongxing.zhu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: linux-pci@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: imx@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org
> 
> This patch is similar to
> 3a4e8302e72f ("PCI: imx6: Keep Root Port MSI capability with iMSI-RX to work around hardware bug")
> 
> Tested on a tbs2910 board [1]
> [1] arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dts
> 
> changes in v2:
> - collect a-b and r-b tags
> - use correct fixes tag (Manivannan)
>   (reference commit that introduced the bug, not the incomplete fix)
> 
> Since this is a fix for a regression in linux-7.0+, can this still be merged for 7.2-rcS ?
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 98e1db751132..8130cf93c2bb 100644
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
> -- 
> 2.43.0
> 

