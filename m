Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83FECAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 06:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62y4CLkDTarNyvoa1g4SCOZri6dTFC7LGT6qbWvvuxI=; b=bqaIhetu+IpcSVIziLXVcdf2az
	OGxTukqBteSVfHBxSjparX63s6AmGQK3RFkFWDmNWpykGwwrTeBQUgc9lAyJUkWBDnotWMZVGtsz7
	KPBEmgw6hnCCfQdlCoKnZGiTH4ErJiBKwLm1SR9LZfRcogsaENNJTxrSKgo3+PVPEDlzsmWOQncBd
	V3fZnNwSbO3ZSaAcS6iPWfKCiW5pRh1vLgOU3VnvUCita+bodlOgQFcGHtJ51t06peqN32bNjnEBb
	Vhrvt5FHMtiZZ3CUbKNBbM+3j/dRyHRdL61hR8MunZLQSDR/FEQt4fyj2bm04IpvQa/KxCLbUX4PZ
	y/1QfG6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzr6v-00000004stn-2CTb;
	Sat, 20 Sep 2025 06:30:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzr6t-00000004stc-3dut
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 06:30:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ED80E6013C;
	Sat, 20 Sep 2025 06:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3C2FC4CEEB;
	Sat, 20 Sep 2025 06:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758349814;
	bh=2k5IAu27hx+JRHKzZ8QOmu78VZOavxLARXFZgcU9fYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mXHssqsiBIowA8JUuWIXSrjdL5B9O09OGaKPzRIp5uFgELwA335L63yPiaqCW9pHq
	 gi+ExuCPgiLttYYWNLoMhjLw0VPwECdPOyoM5fYWmdeZ1yALzQrMZoimYEC98ddTyb
	 pl1TFHgwel2klKU5Bk+LsbglO6nPlK9GLcmrjsibJ9JAKo0vcIoVCMxzs2SzcANm6D
	 rvmOyfqOSCWVdfsPtR3KiHWdE0+hxdZkF9j1IgP5hEQhBUJhzBtIxxnOaHcoJYqsFF
	 ihMfe76aMzqKBLA3RIwteKNpGbhdsnKY4J2zl0Ds7+nBvGpv9hRHX8HZK8TWYu9Obn
	 Lo2H+XNLpMNRw==
Date: Sat, 20 Sep 2025 12:00:06 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, jingoohan1@gmail.com, l.stach@pengutronix.de, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/6] PCI: imx6: Don't poll LTSSM state of i.MX6QP PCIe
 in PM operations
Message-ID: <jwvprh7rvvzwxb5bsny5h3s74srbifurlusbpniupf4uujkflk@caaxxgw7xebq>
References: <20250902080151.3748965-1-hongxing.zhu@nxp.com>
 <20250902080151.3748965-4-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250902080151.3748965-4-hongxing.zhu@nxp.com>
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

On Tue, Sep 02, 2025 at 04:01:48PM +0800, Richard Zhu wrote:
> Refer to PCIe r6.0, sec 5.2, fig 5-1 Link Power Management State Flow
> Diagram. Both L0 and L2/L3 Ready can be transferred to LDn directly.
> 
> It's harmless to let dw_pcie_suspend_noirq() proceed suspend after the
> PME_Turn_Off is sent out, whatever the LTSSM state is in L2 or L3 after
> a recommended 10ms max wait refer to PCIe r6.0, sec 5.3.3.2.1 PME
> Synchronization.
> 
> The LTSSM states of i.MX6QP PCIe are inaccessible after the PME_Turn_Off
> is kicked off. To handle this case, don't poll L2 state and add one max
> 10ms delay if QUIRK_NOL2POLL_IN_PM flag is existing in suspend.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Squash this patch with the previous one.

- Mani

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 80e48746bbaf..18b97bd0462b 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -125,6 +125,7 @@ struct imx_pcie_drvdata {
>  	enum imx_pcie_variants variant;
>  	enum dw_pcie_device_mode mode;
>  	u32 flags;
> +	u32 quirk;
>  	int dbi_length;
>  	const char *gpr;
>  	const u32 ltssm_off;
> @@ -1765,6 +1766,7 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	pci->quirk_flag = imx_pcie->drvdata->quirk;
>  	pci->use_parent_dt_ranges = true;
>  	if (imx_pcie->drvdata->mode == DW_PCIE_EP_TYPE) {
>  		ret = imx_add_pcie_ep(imx_pcie, pdev);
> @@ -1849,6 +1851,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  		.enable_ref_clk = imx6q_pcie_enable_ref_clk,
>  		.core_reset = imx6qp_pcie_core_reset,
>  		.ops = &imx_pcie_host_ops,
> +		.quirk = QUIRK_NOL2POLL_IN_PM,
>  	},
>  	[IMX7D] = {
>  		.variant = IMX7D,
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்

