Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15032CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 06:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XGx1pgc6gfVGwxtmmb45cQnmwiy69DB1lS7v2YZXyE4=; b=nXRdcalTKEwyKp3AagQhxbv69Q
	J1AUebQPNlH3qvGG6ihZpdXcKk+v/7nVLOvtgV02g+S42iWHx1bWmWmPkYg06T2l7d3D567y9hGMQ
	PP6gzkCL/2eRIWBI8+Bsj7mFVwu6pPGy1uiCNzN8tdwdXrKxz06GPQAgjbdvn0LdP4x45LubmMffW
	t0arY9Q3ZKsFd9W+6Mn13GNzrwRremjcpgq+1X+Mqo/UCX/0cd0+2lnJ97VsOyjvtF1KuF+OcxXm0
	Md5heCfvHbNa/vjz4Jc/SY7Ct67EoSj73f7K3hblIr0zI9Hwjf/KItgyUFHzltBYf/rz50LsZEp60
	m6Ci4Jzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzr5q-00000004shW-2nEy;
	Sat, 20 Sep 2025 06:29:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzr5o-00000004shO-3nIu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 06:29:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 12BBA6013C;
	Sat, 20 Sep 2025 06:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8071DC4CEEB;
	Sat, 20 Sep 2025 06:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758349747;
	bh=lsXrFVLVVP9m7FF0K5jKakOvUcFLx4HMxLX5PqFqHl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bv3OTZMMtf23WfTRwCojxCISILg6q3AsIaxhzSxVqz0ZbI8KEsjM0fWGmrgMBv1lJ
	 vqeD/OoS1EZXRpLRoEbtbfh53ase85/5rpaQ4uXvR6IAC8dke/eX3xxde3VodbmFqQ
	 YqgWzmEulSZZ+qrfljy0zqsXLc+jSlkd1hoqpypU/0vDV+gMb+CZwxL4vPOkwOhpwm
	 k2DWf9bBC9H6ZKRDZY5qt61NRBXrcqevMeBkmbmqScfAOtMPMRT52mGcp//WTaJm6W
	 ltCMALC9cru0HztqsISFXjepJYUrmKHm6iCsz66BfW5inV+WLlj+CwukxAUtqJiEsz
	 U3weTvQ7X4pRg==
Date: Sat, 20 Sep 2025 11:58:58 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, jingoohan1@gmail.com, l.stach@pengutronix.de, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/6] PCI: dwc: Don't poll L2 if QUIRK_NOL2POLL_IN_PM
 is existing in suspend
Message-ID: <p4hqjnhpih2uy5hzf7llrd3ah7ov6sijkuqjecpvv5j2iqrsji@kxj5xwb7a5p4>
References: <20250902080151.3748965-1-hongxing.zhu@nxp.com>
 <20250902080151.3748965-3-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250902080151.3748965-3-hongxing.zhu@nxp.com>
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

On Tue, Sep 02, 2025 at 04:01:47PM +0800, Richard Zhu wrote:
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

This statement is not accurate. A single register read cannot cause hang AFAIK.
I'm guessing that the link down (LDn) happens after initiating PME_Turn_Off and
the access to CSR register (LTSSM) causes hang.

Is my understanding correct?

> To support this case, don't poll L2 state and apply a simple delay of
> PCIE_PME_TO_L2_TIMEOUT_US(10ms) if the QUIRK_NOL2POLL_IN_PM flag is set
> in suspend.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

We need Fixes tag also and you do need to set the flag in relevant glue driver
in this patch itself so that it can cleanly be backported.

- Mani

> ---
>  .../pci/controller/dwc/pcie-designware-host.c | 34 +++++++++++++------
>  drivers/pci/controller/dwc/pcie-designware.h  |  4 +++
>  2 files changed, 28 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 9d46d1f0334b..57a1ba08c427 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -1016,15 +1016,29 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
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
> @@ -1040,7 +1054,7 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  
>  	pci->suspended = true;
>  
> -	return ret;
> +	return 0;
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_suspend_noirq);
>  
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 00f52d472dcd..4e5bf6cb6ce8 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -295,6 +295,9 @@
>  /* Default eDMA LLP memory size */
>  #define DMA_LLP_MEM_SIZE		PAGE_SIZE
>  
> +#define QUIRK_NOL2POLL_IN_PM		BIT(0)
> +#define dwc_quirk(pci, val)		(pci->quirk_flag & val)
> +
>  struct dw_pcie;
>  struct dw_pcie_rp;
>  struct dw_pcie_ep;
> @@ -504,6 +507,7 @@ struct dw_pcie {
>  	const struct dw_pcie_ops *ops;
>  	u32			version;
>  	u32			type;
> +	u32			quirk_flag;
>  	unsigned long		caps;
>  	int			num_lanes;
>  	int			max_link_speed;
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்

