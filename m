Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282D8D262B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 07:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o2iwux9E65mdgSa6shhcc1XCeeEEey9tdn/ba013p+o=; b=0NOn/5e1TsrnJFu5tt0O0QLSgA
	K0Eg/BAjlcMTSwjOhdfFfPRDS/QN4ASg2tiNZP4iX0uRfBELlZMTwpBYD66Nmi3g4LfP5ctycnivr
	FVd2F7SZhtIVFn0KvqDWpzRAMLTV9swIUmOOeTP22l74o01U5svSlfUHd2SBENbTX5Y33yAeRAW3f
	42uxhFfVrn/BhkgHkKb/YKRReEk05FL6j7X1EeO6bXYtfQELLf8qAk0lA+UQZmQoEeNdPupsrIltB
	DhQQ7LlvTcIu3QF2CUIh3emTxPCs6FLAa4LqRbqZeJ3D0I6tUjabUotBNV50ORkqphSwdBKG5WQaK
	dw4WLFcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viT2c-000000052nT-0DJj;
	Wed, 21 Jan 2026 07:54:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viT2Z-000000052n6-2EVp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 07:54:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F83043504;
	Wed, 21 Jan 2026 07:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E80DAC116D0;
	Wed, 21 Jan 2026 07:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768982050;
	bh=TC2tcJfS2vWZBe0m/+BUUBgTB+Yd6OYy+mlQ7DX9l5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZZAiZ1YE6AiRjIWAhVzofjXAwpVtlMftLzINR9Foi5IBYGEqBk1/OAY+Ddvjl+i+S
	 HJDBwTQs3pdOnyCQ8rfsjZauZ7H2ZJSlvTfuSi1VvT0grFVC8yYDQxCNOi7nJcPzSZ
	 JurscrLIXiiwYjavr2jeR2mvyXsGHzu+h98xwN161zMF7215uPhpdRuFunx4Oli0e7
	 LPWmQ4cjB2gH5Y7tSGQdFDujYHnZv7bDjseRgXJ5NHlnSiJ1ZK+1Ox0aEhiFn1g3JH
	 4g0sPvi0rwDbcffy++1aRiTN7nayp/Q94w1q1AN9uK8ypPZWL35JZlYmuGQ6rDCXPI
	 Xe1cNNZFn0y8w==
Date: Wed, 21 Jan 2026 13:23:57 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, jingoohan1@gmail.com, l.stach@pengutronix.de, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v9] PCI: dwc: Don't poll L2 if skip_l23_wait is true
Message-ID: <drqhmcl5vzuk7dx5g4fjhrsfstu2tssmmotychgyf3vcus2tz5@rqsrsrbpjc2o>
References: <20260114083300.3689672-1-hongxing.zhu@nxp.com>
 <20260114083300.3689672-2-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260114083300.3689672-2-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_235411_619070_65C4C1B5 
X-CRM114-Status: GOOD (  28.30  )
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

On Wed, Jan 14, 2026 at 04:33:00PM +0800, Richard Zhu wrote:
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
> PCIE_PME_TO_L2_TIMEOUT_US(10ms) if the skip_l23_wait flag is true in
> suspend.
> 

I think this patch should simply say:

"In i.MX6QP and i.MX7D SoCs, LTSSM registers are not accessible once
PME_Turn_Off is broadcasted to the link. So there is no way to verify whether
the link has entered L2/L3 state or not.

Hence, add a new flag 'dw_pcie_rp::skip_l23_wait' and set it for the above
mentioned SoCs. This flag when set, will allow the DWC core to skip the L23 poll
and just wait for 10ms as per the delay mentioned in PCIe spec r6.0 sec
5.3.3.2.1."

Does it look good?

- Mani

> Cc: stable@vger.kernel.org
> Fixes: 4774faf854f5 ("PCI: dwc: Implement generic suspend/resume functionality")
> Fixes: a528d1a72597 ("PCI: imx6: Use DWC common suspend resume method")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c             |  5 +++++
>  drivers/pci/controller/dwc/pcie-designware-host.c | 15 +++++++++++++++
>  drivers/pci/controller/dwc/pcie-designware.h      |  1 +
>  3 files changed, 21 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 4668fc9648bf..cbe98824427b 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -114,6 +114,7 @@ enum imx_pcie_variants {
>  #define IMX_PCIE_FLAG_BROKEN_SUSPEND		BIT(9)
>  #define IMX_PCIE_FLAG_HAS_LUT			BIT(10)
>  #define IMX_PCIE_FLAG_8GT_ECN_ERR051586		BIT(11)
> +#define IMX_PCIE_FLAG_SKIP_L23_WAIT		BIT(12)
>  
>  #define imx_check_flag(pci, val)	(pci->drvdata->flags & val)
>  
> @@ -1777,6 +1778,8 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  		 */
>  		imx_pcie_add_lut_by_rid(imx_pcie, 0);
>  	} else {
> +		if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_SKIP_L23_WAIT))
> +			pci->pp.skip_l23_wait = true;
>  		pci->pp.use_atu_msg = true;
>  		ret = dw_pcie_host_init(&pci->pp);
>  		if (ret < 0)
> @@ -1838,6 +1841,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  		.variant = IMX6QP,
>  		.flags = IMX_PCIE_FLAG_IMX_PHY |
>  			 IMX_PCIE_FLAG_SPEED_CHANGE_WORKAROUND |
> +			 IMX_PCIE_FLAG_SKIP_L23_WAIT |
>  			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
>  		.dbi_length = 0x200,
>  		.gpr = "fsl,imx6q-iomuxc-gpr",
> @@ -1854,6 +1858,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  		.variant = IMX7D,
>  		.flags = IMX_PCIE_FLAG_SUPPORTS_SUSPEND |
>  			 IMX_PCIE_FLAG_HAS_APP_RESET |
> +			 IMX_PCIE_FLAG_SKIP_L23_WAIT |
>  			 IMX_PCIE_FLAG_HAS_PHY_RESET,
>  		.gpr = "fsl,imx7d-iomuxc-gpr",
>  		.mode_off[0] = IOMUXC_GPR12,
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index fad0cbedefbc..5aa7f23bb58e 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -1194,6 +1194,21 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  			return ret;
>  	}
>  
> +	/*
> +	 * Skip L23 poll and wait to avoid the read hang, when LTSSM is
> +	 * not powered in L2/L3/LDn properly.
> +	 *
> +	 * Refer to PCIe r6.0, sec 5.2, fig 5-1 Link Power Management
> +	 * State Flow Diagram. Both L0 and L2/L3 Ready can be
> +	 * transferred to LDn directly. On the LTSSM states poll broken
> +	 * platforms, add a max 10ms delay refer to PCIe r6.0,
> +	 * sec 5.3.3.2.1 PME Synchronization.
> +	 */
> +	if (pci->pp.skip_l23_wait) {
> +		mdelay(PCIE_PME_TO_L2_TIMEOUT_US/1000);
> +		goto stop_link;
> +	}
> +
>  	ret = read_poll_timeout(dw_pcie_get_ltssm, val,
>  				val == DW_PCIE_LTSSM_L2_IDLE ||
>  				val <= DW_PCIE_LTSSM_DETECT_WAIT,
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index f87c67a7a482..b31f8061f23a 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -442,6 +442,7 @@ struct dw_pcie_rp {
>  	struct pci_config_window *cfg;
>  	bool			ecam_enabled;
>  	bool			native_ecam;
> +	bool                    skip_l23_wait;
>  };
>  
>  struct dw_pcie_ep_ops {
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்

