Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD6BE6F07F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 19:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=TfjN2FkupChScPj51tVFnwRpzYeduDtz6rkLr7e6vqw=; b=XG+FNVugRq9qwG
	02ajl2JxrgVJZ/SQDsy8yj41PtMg3iQp6Udp2czDLW2I5MC89EgA95UlOUxPGxpTHS3BC/Mm9PQtJ
	zOCGQsKxDsnFUTShL437BBJSlO30PgnYniaJ4kpJpP8KxVMIiaat7XwXEaMpB+wFCTBuReW9bqNgd
	BTy7CCzgzOBvU2lcAWID0Q0pNQbwFL+L3w3VDlr4xEtQqVUeqVisxP/iBdzyW3R049QPL0aSkhcR6
	qjs4T+LJnNRsBeK/Zgb0C7Ze6p1FviBbo+F0G5i5Lo4TXc+mrPXCksJITv+Wb8kJjp3Z+SN+3Cbik
	LKa/6yQoPHoJkUtt5GVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6xSL-000000089aX-0LLE;
	Fri, 01 Nov 2024 19:37:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6xPT-000000088tA-2fFC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 19:34:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0C678A44960;
	Fri,  1 Nov 2024 19:32:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13110C4CECD;
	Fri,  1 Nov 2024 19:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730489654;
	bh=7e9jDreQwHjgDrpNnSCJNcACMMOlV2ucUiJHzRNtnGQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Gy+q2VQMdeHnjT5y9u5t9/F6PhF4uzgoSRel0mDRxxSyq3QjYHlyR4JkyEpXP8DV3
	 NeeZZkqknM2VXeMV9BBFpQDx5/GPmVVoWetU6spQS9H2CQ3fzgckmHv3TmKRx9CNOF
	 9LamE0J7mmr/CfZm2sXjfEBuujzSZdz7fwU9dP8P/IceaUMELWqXxj6a5Jp2kNdgo1
	 lTV8bFkOtCBbVdt4w5kdTXRqpo2esomrCNQqXTliqOkebr1XfYjhQxMGHIF41TFvlE
	 cFF9mSY87h88i+ZHBUH+zvZzdw5IQllMK89EDpz4QgXnua1Kz00jrJw6m4A26J6BJi
	 Ar+DeHd6YbhrA==
Date: Fri, 1 Nov 2024 14:34:12 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Stefan Eichenberger <eichest@gmail.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>
Cc: lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org,
	robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	francesco.dolcini@toradex.com, Frank.li@nxp.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v4] PCI: imx6: Add suspend/resume support for i.MX6QDL
Message-ID: <20241101193412.GA1317741@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030103250.83640-1-eichest@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_123415_839735_BD8CEF7A 
X-CRM114-Status: GOOD (  35.82  )
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

On Wed, Oct 30, 2024 at 11:32:45AM +0100, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> The suspend/resume functionality is currently broken on the i.MX6QDL
> platform, as documented in the NXP errata (ERR005723):
> https://www.nxp.com/docs/en/errata/IMX6DQCE.pdf
> 
> This patch addresses the issue by sharing most of the suspend/resume
> sequences used by other i.MX devices, while avoiding modifications to
> critical registers that disrupt the PCIe functionality. It targets the
> same problem as the following downstream commit:
> https://github.com/nxp-imx/linux-imx/commit/4e92355e1f79d225ea842511fcfd42b343b32995
> 
> Unlike the downstream commit, this patch also resets the connected PCIe
> device if possible. Without this reset, certain drivers, such as ath10k
> or iwlwifi, will crash on resume. The device reset is also done by the
> driver on other i.MX platforms, making this patch consistent with
> existing practices.
> 
> Without this patch, suspend/resume will fail on i.MX6QDL devices if a
> PCIe device is connected. Upon resuming, the kernel will hang and
> display an error. Here's an example of the error encountered with the
> ath10k driver:
> ath10k_pci 0000:01:00.0: Unable to change power state from D3hot to D0, device inaccessible
> Unhandled fault: imprecise external abort (0x1406) at 0x0106f944
> 
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Richard and Lucas, does this look OK to you?  Since you're listed as
maintainers of pci-imx6.c, I'd like to have your ack before merging
this.

> ---
> Changes in v4:
> - Improve commit message (Bjorn)
> - Fix style issue on comments (Bjorn)
> - s/msi/MSI (Bjorn)
> 
> Changes in v3:
> - Added a new flag to the driver data to indicate that the suspend/resume
>   is broken on the i.MX6QDL platform. (Frank)
> - Fix comments to be more relevant (Mani)
> - Use imx_pcie_assert_core_reset in suspend (Mani)
> 
>  drivers/pci/controller/dwc/pci-imx6.c | 57 +++++++++++++++++++++------
>  1 file changed, 46 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 808d1f1054173..c8d5c90aa4d45 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -82,6 +82,11 @@ enum imx_pcie_variants {
>  #define IMX_PCIE_FLAG_HAS_SERDES		BIT(6)
>  #define IMX_PCIE_FLAG_SUPPORT_64BIT		BIT(7)
>  #define IMX_PCIE_FLAG_CPU_ADDR_FIXUP		BIT(8)
> +/*
> + * Because of ERR005723 (PCIe does not support L2 power down) we need to
> + * workaround suspend resume on some devices which are affected by this errata.
> + */
> +#define IMX_PCIE_FLAG_BROKEN_SUSPEND		BIT(9)
>  
>  #define imx_check_flag(pci, val)	(pci->drvdata->flags & val)
>  
> @@ -1237,9 +1242,19 @@ static int imx_pcie_suspend_noirq(struct device *dev)
>  		return 0;
>  
>  	imx_pcie_msi_save_restore(imx_pcie, true);
> -	imx_pcie_pm_turnoff(imx_pcie);
> -	imx_pcie_stop_link(imx_pcie->pci);
> -	imx_pcie_host_exit(pp);
> +	if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_BROKEN_SUSPEND)) {
> +		/*
> +		 * The minimum for a workaround would be to set PERST# and to
> +		 * set the PCIE_TEST_PD flag. However, we can also disable the
> +		 * clock which saves some power.
> +		 */
> +		imx_pcie_assert_core_reset(imx_pcie);
> +		imx_pcie->drvdata->enable_ref_clk(imx_pcie, false);
> +	} else {
> +		imx_pcie_pm_turnoff(imx_pcie);
> +		imx_pcie_stop_link(imx_pcie->pci);
> +		imx_pcie_host_exit(pp);
> +	}
>  
>  	return 0;
>  }
> @@ -1253,14 +1268,32 @@ static int imx_pcie_resume_noirq(struct device *dev)
>  	if (!(imx_pcie->drvdata->flags & IMX_PCIE_FLAG_SUPPORTS_SUSPEND))
>  		return 0;
>  
> -	ret = imx_pcie_host_init(pp);
> -	if (ret)
> -		return ret;
> -	imx_pcie_msi_save_restore(imx_pcie, false);
> -	dw_pcie_setup_rc(pp);
> +	if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_BROKEN_SUSPEND)) {
> +		ret = imx_pcie->drvdata->enable_ref_clk(imx_pcie, true);
> +		if (ret)
> +			return ret;
> +		ret = imx_pcie_deassert_core_reset(imx_pcie);
> +		if (ret)
> +			return ret;
> +		/*
> +		 * Using PCIE_TEST_PD seems to disable MSI and powers down the
> +		 * root complex. This is why we have to setup the rc again and
> +		 * why we have to restore the MSI register.
> +		 */
> +		ret = dw_pcie_setup_rc(&imx_pcie->pci->pp);
> +		if (ret)
> +			return ret;
> +		imx_pcie_msi_save_restore(imx_pcie, false);
> +	} else {
> +		ret = imx_pcie_host_init(pp);
> +		if (ret)
> +			return ret;
> +		imx_pcie_msi_save_restore(imx_pcie, false);
> +		dw_pcie_setup_rc(pp);
>  
> -	if (imx_pcie->link_is_up)
> -		imx_pcie_start_link(imx_pcie->pci);
> +		if (imx_pcie->link_is_up)
> +			imx_pcie_start_link(imx_pcie->pci);
> +	}
>  
>  	return 0;
>  }
> @@ -1485,7 +1518,9 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  	[IMX6Q] = {
>  		.variant = IMX6Q,
>  		.flags = IMX_PCIE_FLAG_IMX_PHY |
> -			 IMX_PCIE_FLAG_IMX_SPEED_CHANGE,
> +			 IMX_PCIE_FLAG_IMX_SPEED_CHANGE |
> +			 IMX_PCIE_FLAG_BROKEN_SUSPEND |
> +			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
>  		.dbi_length = 0x200,
>  		.gpr = "fsl,imx6q-iomuxc-gpr",
>  		.clk_names = imx6q_clks,
> -- 
> 2.43.0
> 

