Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B61C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 13:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CWttItOwWOczR/JIXXwPQrDzLPV075F/+DhRIjyDOBE=; b=QFPfLCx2kElEt1LRH8w5hZg1fg
	zXjuUyL4HuPTbLZHhCr6oszJ00GisX9JlmdpQtCx2g9Ze3aJStKK96ji7Pq5V46i6Vvnc0QOmq9Ln
	5iTSesizASdw0SxP95zksznNTM4GQ6kJ2TlGIORcnijnxMYck3Yp3UrLbIoSUQsOrKZgBP3uR4D65
	ypmV0zmAXVByOGjB9c97VrAKtLmiCjZNsVzX7wovVa3QdLlVPGXiyb7DFwSIxundub5hfWs5gpThN
	F3J032rkQLKHsct6IYSVBxShQcIy/dFIGeMpRboKiDVmUSeg9dNS+/JzeUYl/1Z5vXFb20vjPEspV
	Q+s+jOKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTh2y-00000002qF4-0rYv;
	Mon, 23 Jun 2025 13:17:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfZd-00000002XAz-0hjm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 11:42:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 64F2DA5145C;
	Mon, 23 Jun 2025 11:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E13C4CEEA;
	Mon, 23 Jun 2025 11:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750678972;
	bh=2m5CfZQaw2dv5R3Bx1BYdCmiNkSM8d2I9a7oqNpDaJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vJQ3ID8qLCiFR8Pxde6rF2KJJUAOZVH8hsgrPoPWLp9XsVub8YquvV1sgl7Xc7+ep
	 owTauxF/ndQDiCzVeTf2yjAcNYDE/pW79OdZKaH6JbutbKuWrCSeGIi/Joi25lDODC
	 uBi3KqSVZav3oTXjLfjJadHCrwVa2fHUmhMBabGYPVDhK2i1vkp/9Tmg72GCOdjQn8
	 1la1NsNuC4JyZ59DCFc9mXQT/RJHTgQrYRjZA5yhQMrCbFzuvCAbURgwj65ULx4ayz
	 E2Pi5T2PJt/7QLTKK7VUDglj7VtKrzyylDa9NGdbCYpWq1IBICjrRHHdWc/z9tCqyJ
	 8ZOHbkT/1SwBg==
Date: Mon, 23 Jun 2025 05:42:50 -0600
From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Tim Harvey <tharvey@gateworks.com>
Subject: Re: [PATCH v3 1/2] PCI: imx6: Remove apps_reset toggle in
 _core_reset functions
Message-ID: <kjsaipr2xq777dmiv2ac7qzrxw47nevc75j7ryma32vsnyr2le@mrwurn6rgnac>
References: <20250616085742.2684742-1-hongxing.zhu@nxp.com>
 <20250616085742.2684742-2-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250616085742.2684742-2-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_044253_334203_C9003C7C 
X-CRM114-Status: GOOD (  18.85  )
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

On Mon, Jun 16, 2025 at 04:57:41PM +0800, Richard Zhu wrote:
> apps_reset is LTSSM_EN on i.MX7, i.MX8MQ, i.MX8MM and i.MX8MP platforms.
> Since the assertion/de-assertion of apps_reset(LTSSM_EN bit) had been
> wrappered in imx_pcie_ltssm_enable() and imx_pcie_ltssm_disable();
> 

What about other i.MX chipsets like 6Q and its cousins? Wouldn't this change
affect them since they treat 'apps_reset' differently?

- Mani

> Remove apps_reset toggle in imx_pcie_assert_core_reset() and
> imx_pcie_deassert_core_reset() functions. Use imx_pcie_ltssm_enable()
> and imx_pcie_ltssm_disable() to configure apps_reset directly.
> 
> Fix fail to enumerate reliably PI7C9X2G608GP (hotplug) at i.MX8MM, which
> reported By Tim.
> 
> Reported-by: Tim Harvey <tharvey@gateworks.com>
> Closes: https://lore.kernel.org/all/CAJ+vNU3ohR2YKTwC4xoYrc1z-neDoH2TTZcMHDy+poj9=jSy+w@mail.gmail.com/
> Fixes: ef61c7d8d032 ("PCI: imx6: Deassert apps_reset in imx_pcie_deassert_core_reset()")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 9754cc6e09b9..f5f2ac638f4b 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -860,7 +860,6 @@ static int imx95_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
>  static void imx_pcie_assert_core_reset(struct imx_pcie *imx_pcie)
>  {
>  	reset_control_assert(imx_pcie->pciephy_reset);
> -	reset_control_assert(imx_pcie->apps_reset);
>  
>  	if (imx_pcie->drvdata->core_reset)
>  		imx_pcie->drvdata->core_reset(imx_pcie, true);
> @@ -872,7 +871,6 @@ static void imx_pcie_assert_core_reset(struct imx_pcie *imx_pcie)
>  static int imx_pcie_deassert_core_reset(struct imx_pcie *imx_pcie)
>  {
>  	reset_control_deassert(imx_pcie->pciephy_reset);
> -	reset_control_deassert(imx_pcie->apps_reset);
>  
>  	if (imx_pcie->drvdata->core_reset)
>  		imx_pcie->drvdata->core_reset(imx_pcie, false);
> @@ -1247,6 +1245,9 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
>  		}
>  	}
>  
> +	/* Make sure that PCIe LTSSM is cleared */
> +	imx_pcie_ltssm_disable(dev);
> +
>  	ret = imx_pcie_deassert_core_reset(imx_pcie);
>  	if (ret < 0) {
>  		dev_err(dev, "pcie deassert core reset failed: %d\n", ret);
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்

