Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F21BE88D63
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 21:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=JUYivlWneDYv2wCp3O4ECZT/dJL5ql68tL2T//GvL/w=; b=4OXg15y3+9wr0+
	9jCNrsicnqiiMY23h/rlknbcoGX01rOrEBt7PtIpx6uAxAe7j6/V28zA0SMTWCPDMWjBVo/vYjui0
	PRg8Xh3nWHFfZjpduatuvDP2B7P1oGf9VvAz9s8VA/JimWuxrXwA7kWnbrCmX5heqMcOCborlNAkM
	hfaroyjaZSPrwFQ80ji3Cm+esgxTKbuYjRyDllG6NRkgTh/IWaJe/AO0eXB20wfrN8w7CBUYNz7XB
	xOFnZ2oCQiCuOK76gYCZrd16ocTKWE8c8KpJ2gwTaEIaPPv8HbjserMEbJxZy2/gNPpBQTCQKEfaM
	YpwZp3RlVwxKtGaKrluQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8mVh-00000002ftG-0tpK;
	Fri, 03 Apr 2026 21:57:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8mVf-00000002fst-25j7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 21:57:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 53FD6416E0;
	Fri,  3 Apr 2026 21:56:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EA43C4CEF7;
	Fri,  3 Apr 2026 21:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775253418;
	bh=uHkzLeYRPMdYHIG9yS72h3rCLUWaLfdftqsXVr+qimI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=MBQKPM5UnHKHXaLvuAW2yMteTzbBKm6o+cIPktQNSj7g8MkMeNPI9vLcMxFjuJ5vd
	 QYvwf90vLdXpqUi2aCAm2lAexHcIkCPFbho11IkgLhK/rv4OkSUIFXxsHTB64iQcO9
	 LCLHcm8pKQbw1FvuWQ9zeVB3j6Fqk23nWR6UV6iLk+tTxrqJJkyu3i9xyHUGNbpiFA
	 KM7nX6SaPg/sgjKVXQWQvkhlIieK0m1LaUm+XOvgxte3WdlX/D1pVFjqJ3e02+2nHU
	 IMwMUAeQtPdkLF5kzicxA/yiDeQBrGz69Oz8j182HYbEGlwSjB+7SqkOVS0EF6cqu7
	 ofu8KrqrngGhA==
Date: Fri, 3 Apr 2026 16:56:56 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	bhelgaas@google.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3] PCI: imx6: Don't remove MSI capability for
 i.MX7D/i.MX8M
Message-ID: <20260403215656.GA360979@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331085252.1243108-1-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_145659_596616_D365B59F 
X-CRM114-Status: GOOD (  27.65  )
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

On Tue, Mar 31, 2026 at 04:52:52PM +0800, Richard Zhu wrote:
> The MSI trigger mechanism for endpoint devices connected to i.MX7D,
> i.MX8MM, and i.MX8MQ PCIe root complex ports depends on the MSI
> capability register settings in the root complex. Removing the MSI
> capability breaks MSI functionality for these endpoints.
> 
> Add keep_rp_msi_en flag to indicate platforms (i.MX7D, i.MX8MM, i.MX8MQ)
> that should preserve the MSI capability during initialization.

I guess Mani added this to the commit log:

  Note that by keeping Root Port MSI capability, Root Port MSIs such as AER,
  PME and others won't be received by default. So users need to use
  workarounds such as passing 'pcie_pme=nomsi' cmdline param.

Why can't we fix this automatically?  I hate it when users are
expected to use command line parameters to work around issues.

Obviously we know at probe-time, before any PCI devices are
enumerated, so it seems like we should be able to do the equivalent of
"pcie_pme=nomsi" even without the parameter.

> Cc: stable@vger.kernel.org
> Fixes: f5cd8a929c825 ("PCI: dwc: Remove MSI/MSIX capability for Root Port if iMSI-RX is used as MSI controller")
> Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
> v3 changes:
> Use a flag 'dw_pcie_rp::keep_rp_msi_en' to identify SoCs that require MSI
> capability preservation, and skip the capability removal in
> pcie-designware-host.c accordingly.
> 
> v2 changes:
> CC stable tree.
> ---
>  drivers/pci/controller/dwc/pci-imx6.c             | 7 +++++++
>  drivers/pci/controller/dwc/pcie-designware-host.c | 2 +-
>  drivers/pci/controller/dwc/pcie-designware.h      | 1 +
>  3 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 20dafd2710a3..fde173770933 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -117,6 +117,8 @@ enum imx_pcie_variants {
>  #define IMX_PCIE_FLAG_HAS_LUT			BIT(10)
>  #define IMX_PCIE_FLAG_8GT_ECN_ERR051586		BIT(11)
>  #define IMX_PCIE_FLAG_SKIP_L23_READY		BIT(12)
> +/* Preserve MSI capability for platforms that require it */
> +#define IMX_PCIE_FLAG_KEEP_MSI_CAP		BIT(13)
>  
>  #define imx_check_flag(pci, val)	(pci->drvdata->flags & val)
>  
> @@ -1820,6 +1822,8 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  	} else {
>  		if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_SKIP_L23_READY))
>  			pci->pp.skip_l23_ready = true;
> +		if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_KEEP_MSI_CAP))
> +			pci->pp.keep_rp_msi_en = true;
>  		pci->pp.use_atu_msg = true;
>  		ret = dw_pcie_host_init(&pci->pp);
>  		if (ret < 0)
> @@ -1897,6 +1901,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  	[IMX7D] = {
>  		.variant = IMX7D,
>  		.flags = IMX_PCIE_FLAG_SUPPORTS_SUSPEND |
> +			 IMX_PCIE_FLAG_KEEP_MSI_CAP |
>  			 IMX_PCIE_FLAG_HAS_APP_RESET |
>  			 IMX_PCIE_FLAG_SKIP_L23_READY |
>  			 IMX_PCIE_FLAG_HAS_PHY_RESET,
> @@ -1909,6 +1914,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  	[IMX8MQ] = {
>  		.variant = IMX8MQ,
>  		.flags = IMX_PCIE_FLAG_HAS_APP_RESET |
> +			 IMX_PCIE_FLAG_KEEP_MSI_CAP |
>  			 IMX_PCIE_FLAG_HAS_PHY_RESET |
>  			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
>  		.gpr = "fsl,imx8mq-iomuxc-gpr",
> @@ -1923,6 +1929,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  	[IMX8MM] = {
>  		.variant = IMX8MM,
>  		.flags = IMX_PCIE_FLAG_SUPPORTS_SUSPEND |
> +			 IMX_PCIE_FLAG_KEEP_MSI_CAP |
>  			 IMX_PCIE_FLAG_HAS_PHYDRV |
>  			 IMX_PCIE_FLAG_HAS_APP_RESET,
>  		.gpr = "fsl,imx8mm-iomuxc-gpr",
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index a74339982c24..7b5558561e15 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -1171,7 +1171,7 @@ int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
>  	 * the MSI and MSI-X capabilities of the Root Port to allow the drivers
>  	 * to fall back to INTx instead.
>  	 */
> -	if (pp->use_imsi_rx) {
> +	if (pp->use_imsi_rx && !pp->keep_rp_msi_en) {
>  		dw_pcie_remove_capability(pci, PCI_CAP_ID_MSI);
>  		dw_pcie_remove_capability(pci, PCI_CAP_ID_MSIX);
>  	}
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index ae6389dd9caa..b12c5334552c 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -421,6 +421,7 @@ struct dw_pcie_host_ops {
>  
>  struct dw_pcie_rp {
>  	bool			use_imsi_rx:1;
> +	bool			keep_rp_msi_en:1;
>  	bool			cfg0_io_shared:1;
>  	u64			cfg0_base;
>  	void __iomem		*va_cfg0_base;
> -- 
> 2.37.1
> 

