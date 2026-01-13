Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA10AD2F33A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 15:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yfpTf1rl/C9iunh+ff9S/MAYt41hwnn4QGlkCjjRxZg=; b=3wggZejwck0+Yu89s6HKn3ONiN
	MHtHVzJoCXCp1lXauJrbQWgXzHQAZS0GS6IWZRKDy5z+PmTKEz0R5S8yLNrath9+IvUaviwYIY6Gu
	2yteCLpGZF7mUr1uLHKkASIT48hCYFFI3rsFToBWa+hFhncqjR/f3okH0HRuxrKy7uAqhgtEQfe5v
	2UXUw0aIMcjf/7Z9PtvsxwhgSJzALiGdeOmYMz5xlRQ2gSpYIjWVPEf1ElkiVXZ6Pav6RiXiS9ltz
	cNTa1JTpOoLfRaqlcWu2zYCKHAnhAdvDPH+CLCKRCSgrlUAE2q1fyKEWkk/bKDSIbKYZc5IcHoNwu
	7oR+04Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgJ3-00000007MdM-0ADa;
	Tue, 13 Jan 2026 15:27:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgJ0-00000007MbQ-3NwL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 15:27:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1962F4443E;
	Tue, 13 Jan 2026 15:27:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E390BC19422;
	Tue, 13 Jan 2026 15:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768318058;
	bh=YnOpqEglNY3vQ34HlVAtTWoHG1niNCbvODOpEPP4Da0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qUbW/ctGDpVNHIWSDXuEs4Lg//dBztmnD1lFa1/DswaUBhGMQG8LcNuaWyVh8lSqa
	 bdrX9NbeJiGGjUjpK2fl6RC36mlUcGahyYWHrkY1m2q1xMZ4gnnT6c2IbCC//qp6TV
	 09uxecf2G5d7dFC76MYa7M5MHwou7AYuciyDmbFLuS1ebmNJWJUsDdm654jCu0m4Hh
	 ohp2M0fVGDTiBGN2w+FM7hxCGErdkTrYPp7bsn33nEduJX3zTl9i9QWa3zouJsRUqL
	 rQiinTcLS7VzUANttixMWtyzidyb93Jos0p179GjByaNs3drEjIfBA5lAQoX6nUTDu
	 VHBFvTrD5RRbg==
Date: Tue, 13 Jan 2026 20:57:28 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, jingoohan1@gmail.com, l.stach@pengutronix.de, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v8 1/2] PCI: dwc: Don't poll L2 if QUIRK_NOL2POLL_IN_PM
 is existing in suspend
Message-ID: <g3yuqj2yyq236x7fzwdfl5s7onvuwd2ot7btadf3qs36vchleb@4kwfwpo4ni36>
References: <20260107024553.3307205-1-hongxing.zhu@nxp.com>
 <20260107024553.3307205-2-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260107024553.3307205-2-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_072738_908125_6ECED44B 
X-CRM114-Status: GOOD (  29.33  )
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

On Wed, Jan 07, 2026 at 10:45:52AM +0800, Richard Zhu wrote:
> Refer to PCIe r6.0, sec 5.2, fig 5-1 Link Power Management State Flow
> Diagram. Both L0 and L2/L3 Ready can be transferred to LDn directly.
> 
> It's harmless to let dw_pcie_suspend_noirq() proceed suspend after the
> PME_Turn_Off is sent out, whatever the LTSSM state is in L2 or L3 after
> a recommended 10ms max wait refer to PCIe r6.0, sec 5.3.3.2.1 PME
> Synchronization.
> 
> The LTSSM states are inaccessible on i.MX6QP and i.MX7D after the
> PME_Turn_Off is sent out.
> 
> To support this case, don't poll L2 state and apply a simple delay of
> PCIE_PME_TO_L2_TIMEOUT_US(10ms) if the QUIRK_NOL2POLL_IN_PM flag is set
> in suspend.
> 
> Cc: stable@vger.kernel.org
> Fixes: 4774faf854f5 ("PCI: dwc: Implement generic suspend/resume functionality")
> Fixes: a528d1a72597 ("PCI: imx6: Use DWC common suspend resume method")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c         |  4 +++
>  .../pci/controller/dwc/pcie-designware-host.c | 34 +++++++++++++------
>  drivers/pci/controller/dwc/pcie-designware.h  |  4 +++
>  3 files changed, 32 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 4668fc9648bf..d84bfcd1079c 100644
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
> @@ -1860,6 +1863,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
>  		.enable_ref_clk = imx7d_pcie_enable_ref_clk,
>  		.core_reset = imx7d_pcie_core_reset,
> +		.quirk = QUIRK_NOL2POLL_IN_PM,
>  	},
>  	[IMX8MQ] = {
>  		.variant = IMX8MQ,
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 43d091128ef7..06cbfd9e1f1e 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -1179,15 +1179,29 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  			return ret;
>  	}
>  
> -	ret = read_poll_timeout(dw_pcie_get_ltssm, val,
> -				val == DW_PCIE_LTSSM_L2_IDLE ||
> -				val <= DW_PCIE_LTSSM_DETECT_WAIT,
> -				PCIE_PME_TO_L2_TIMEOUT_US/10,
> -				PCIE_PME_TO_L2_TIMEOUT_US, false, pci);
> -	if (ret) {
> -		/* Only log message when LTSSM isn't in DETECT or POLL */
> -		dev_err(pci->dev, "Timeout waiting for L2 entry! LTSSM: 0x%x\n", val);
> -		return ret;
> +	if (dwc_quirk(pci, QUIRK_NOL2POLL_IN_PM)) {
> +		/*
> +		 * Add the QUIRK_NOL2_POLL_IN_PM case to avoid the read hang,
> +		 * when LTSSM is not powered in L2/L3/LDn properly.
> +		 *
> +		 * Refer to PCIe r6.0, sec 5.2, fig 5-1 Link Power Management
> +		 * State Flow Diagram. Both L0 and L2/L3 Ready can be
> +		 * transferred to LDn directly. On the LTSSM states poll broken
> +		 * platforms, add a max 10ms delay refer to PCIe r6.0,
> +		 * sec 5.3.3.2.1 PME Synchronization.
> +		 */
> +		mdelay(PCIE_PME_TO_L2_TIMEOUT_US/1000);
> +	} else {
> +		ret = read_poll_timeout(dw_pcie_get_ltssm, val,
> +					val == DW_PCIE_LTSSM_L2_IDLE ||
> +					val <= DW_PCIE_LTSSM_DETECT_WAIT,
> +					PCIE_PME_TO_L2_TIMEOUT_US/10,
> +					PCIE_PME_TO_L2_TIMEOUT_US, false, pci);
> +		if (ret) {
> +			/* Only log message when LTSSM isn't in DETECT or POLL */
> +			dev_err(pci->dev, "Timeout waiting for L2 entry! LTSSM: 0x%x\n", val);
> +			return ret;
> +		}
>  	}
>  
>  	/*
> @@ -1204,7 +1218,7 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  
>  	pci->suspended = true;
>  
> -	return ret;
> +	return 0;
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_suspend_noirq);
>  
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 31685951a080..dd760c17bdcc 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -305,6 +305,9 @@
>  /* Default eDMA LLP memory size */
>  #define DMA_LLP_MEM_SIZE		PAGE_SIZE
>  
> +#define QUIRK_NOL2POLL_IN_PM		BIT(0)
> +#define dwc_quirk(pci, val)		(pci->quirk_flag & val)
> +

Though I like this quirk idea, I think at this point a simple flag will do the
job.

>  struct dw_pcie;
>  struct dw_pcie_rp;
>  struct dw_pcie_ep;
> @@ -520,6 +523,7 @@ struct dw_pcie {
>  	const struct dw_pcie_ops *ops;
>  	u32			version;
>  	u32			type;
> +	u32			quirk_flag;

You can just add a flag "skip_l23_wait" in dw_pcie_rp as this is a Root Port
behavior.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

