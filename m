Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD710FF4956
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 07:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bweAg06bZLqh2untPlgCTD/6LOJFYxy0tFYmtozX06w=; b=y46i1BWO6M2x+oH/md29emi88f
	TqNeQ51cHdL8CWnU1VsE1lJfy5sl2jBJQ1jButP1tUF0oj08CkPJbJNHLUCEXtmB2idCltgr9Wp2T
	pHdtQUmYS07AZWlD8F7SR+pSyYXHozjcRoU/ez0LnJ2/WPIXmw/aus7QMXfF01TSELsePtS6Nw90C
	JQ9VkrDYfrqD+Ub9JX3IhuYmG0v7n8K+W4RhgltlwU9EqQghNC00NKMpQr5CylRLicimZJlg2xXdv
	shRbz1mCI1h3PxAMvK6RKB7y8On056k82gLB9R3WoWk0c9wPtzpXE0CwIXPIXZWVuy7CJlgvVzIPk
	ML/jmAbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w76xS-0000000Al6Y-3fuG;
	Mon, 30 Mar 2026 07:22:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w76xQ-0000000Al5D-1Syy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 07:22:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 695B844293;
	Mon, 30 Mar 2026 07:22:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C5CFC4CEF7;
	Mon, 30 Mar 2026 07:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774855363;
	bh=BtBXwrPvvOGvQ6wmb6po9SBw/9Uo3r3w4iIszL2DWEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lSyCfOqvUQ+vAlWFaCfOnumDXGkoPCZFhcfrOVrvq98HloqW15nTT8awjVylYkPvc
	 lzCH2y7/qdPJxJvoXCAi5l3C1MxzCYbyYQ1hmM6ZbI5VtXe0v/Dfjrd+FgT9iNDAgk
	 +K96jXv0OMpnazRiYi2Ye1UcpE/9zCr4rXbA9HtkPcklficoQk5wF110eBCCp/Lgiq
	 6wkl6plS+LTN2iUbLvocU/sMzRrk5L6l2sAwp8/mrPtOnefJ2e9sEFJZeLP7k7AODq
	 2Mg1xktcK4SrD/rH7UxLNUDJ4SJmSbAiX9ZnuCwa+LYPcj2P18khkYeTJaaRpMa2HX
	 Kd4cvwa2V2+SA==
Date: Mon, 30 Mar 2026 12:52:31 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: Re: [PATCH v2] PCI: imx6: Don't remove MSI capability For
 i.MX7D/i.MX8M
Message-ID: <kqv3x4qocp7rkas5oedlpzd43h3ez7dg26hqnfgubbjdhhxlwe@rfnsicbv7qba>
References: <20260319091823.446030-1-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260319091823.446030-1-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_002244_428624_42C80473 
X-CRM114-Status: GOOD (  23.21  )
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

+ Qiang

On Thu, Mar 19, 2026 at 05:18:23PM +0800, Richard Zhu wrote:
> The MSI trigger mechanism for endpoint devices connected to i.MX7D,
> i.MX8MM, and i.MX8MQ PCIe root complex ports depends on the MSI
> capability register settings in the root complex. Removing the MSI
> capability breaks MSI functionality for these endpoints.
> 

What is the relation between Root Port MSI and endpoint MSI? Endpoint MSIs
should be routed to the platform MSI controller (DWC i.MSI-RX or External like
GIC-ITS) independent of the Root Port MSI state.

I'm just trying to understand the issue here.

- Mani

> Preserve the MSI capability for i.MX7D/i.MX8M PCIe root complex to
> maintain MSI functionality.
> 
> Cc: stable@vger.kernel.org
> Fixes: f5cd8a929c825 ("PCI: dwc: Remove MSI/MSIX capability for Root Port if iMSI-RX is used as MSI controller")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
> v2 changes:
> CC stable tree.
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 20dafd2710a3..0b0d6a210406 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -41,6 +41,7 @@
>  #define IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE	BIT(11)
>  #define IMX8MQ_GPR_PCIE_VREG_BYPASS		BIT(12)
>  #define IMX8MQ_GPR12_PCIE2_CTRL_DEVICE_TYPE	GENMASK(11, 8)
> +#define IMX8MM_PCIE_MSI_CAP_OFFSET		0x50
>  
>  #define IMX95_PCIE_PHY_GEN_CTRL			0x0
>  #define IMX95_PCIE_REF_USE_PAD			BIT(17)
> @@ -117,6 +118,7 @@ enum imx_pcie_variants {
>  #define IMX_PCIE_FLAG_HAS_LUT			BIT(10)
>  #define IMX_PCIE_FLAG_8GT_ECN_ERR051586		BIT(11)
>  #define IMX_PCIE_FLAG_SKIP_L23_READY		BIT(12)
> +#define IMX_PCIE_FLAG_KEEP_MSI_CAP		BIT(13)
>  
>  #define imx_check_flag(pci, val)	(pci->drvdata->flags & val)
>  
> @@ -976,10 +978,17 @@ static int imx_pcie_start_link(struct dw_pcie *pci)
>  {
>  	struct imx_pcie *imx_pcie = to_imx_pcie(pci);
>  	struct device *dev = pci->dev;
> -	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> +	u8 offset;
>  	u32 tmp;
>  	int ret;
>  
> +	if (imx_pcie->drvdata->flags & IMX_PCIE_FLAG_KEEP_MSI_CAP) {
> +		offset = dw_pcie_find_capability(pci, PCI_CAP_ID_PM);
> +		dw_pcie_dbi_ro_wr_en(pci);
> +		dw_pcie_writeb_dbi(pci, offset + 1, IMX8MM_PCIE_MSI_CAP_OFFSET);
> +		dw_pcie_dbi_ro_wr_dis(pci);
> +	}
> +
>  	if (!(imx_pcie->drvdata->flags &
>  	    IMX_PCIE_FLAG_SPEED_CHANGE_WORKAROUND)) {
>  		imx_pcie_ltssm_enable(dev);
> @@ -991,6 +1000,7 @@ static int imx_pcie_start_link(struct dw_pcie *pci)
>  	 * started in Gen2 mode, there is a possibility the devices on the
>  	 * bus will not be detected at all.  This happens with PCIe switches.
>  	 */
> +	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
>  	dw_pcie_dbi_ro_wr_en(pci);
>  	tmp = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
>  	tmp &= ~PCI_EXP_LNKCAP_SLS;
> @@ -1897,6 +1907,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  	[IMX7D] = {
>  		.variant = IMX7D,
>  		.flags = IMX_PCIE_FLAG_SUPPORTS_SUSPEND |
> +			 IMX_PCIE_FLAG_KEEP_MSI_CAP |
>  			 IMX_PCIE_FLAG_HAS_APP_RESET |
>  			 IMX_PCIE_FLAG_SKIP_L23_READY |
>  			 IMX_PCIE_FLAG_HAS_PHY_RESET,
> @@ -1909,6 +1920,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  	[IMX8MQ] = {
>  		.variant = IMX8MQ,
>  		.flags = IMX_PCIE_FLAG_HAS_APP_RESET |
> +			 IMX_PCIE_FLAG_KEEP_MSI_CAP |
>  			 IMX_PCIE_FLAG_HAS_PHY_RESET |
>  			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
>  		.gpr = "fsl,imx8mq-iomuxc-gpr",
> @@ -1923,6 +1935,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  	[IMX8MM] = {
>  		.variant = IMX8MM,
>  		.flags = IMX_PCIE_FLAG_SUPPORTS_SUSPEND |
> +			 IMX_PCIE_FLAG_KEEP_MSI_CAP |
>  			 IMX_PCIE_FLAG_HAS_PHYDRV |
>  			 IMX_PCIE_FLAG_HAS_APP_RESET,
>  		.gpr = "fsl,imx8mm-iomuxc-gpr",
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்

