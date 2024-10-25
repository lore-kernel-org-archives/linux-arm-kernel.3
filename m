Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DECD149F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 22:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=SiRqgI7Zfaex7nI3vRv5r+pM9CxakGyUF9M8Ufw1xZE=; b=n699gt+oHLbyY1
	I43v0SAE/nwFLC+DYwgFF2vdlTCjjIGygXoVv4r3GkamnjuNm+lKo4VWAPbCTiIrph5l4T2biWiQI
	PBnrMrmtoIkAO7PfE9OUEJ5txig969Ht1aulIvxP9D5u7E0Ddk4/j9NfAMoc+Pjt5jq6v86S8HkSA
	48jvh0uuvD63t+f52XNorwmWVE8zr3gAfaO5mi4H6jVvry4/VCxb7a/jmaLV8HPxzw8b/+3yYkJBe
	Qyqgs1KOAJUWcexf+s9bj+F3zJ7cOP7lTmfwVxzDSqNE/0bdpFVvTd1nIigtkuxUmtij2PU5v9wXC
	IumohMJ/cIx+b08Rgm6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4SuY-00000005SLp-1Dzt;
	Fri, 25 Oct 2024 22:36:02 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4SrH-00000005Rjk-1eyt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 22:32:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3FEB7A44B88;
	Fri, 25 Oct 2024 22:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7A4C4CEC3;
	Fri, 25 Oct 2024 22:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729895558;
	bh=lvgqZKZL3hTSMXjWYkYB2dg3KyAAN40oIeI42dzGJls=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=bMqCwlt3rfSKnmYXP3CO1qHyjKGshQkpsafQF2TFtPpe8OJLF2eHJv0QZVeGh+vbR
	 mbzYexzaFGMPKNILD/JuyECnaOF+BCjy7vXA8rpIu+ArdNAIBFHXogFUA7gI78NmNw
	 wOCRX2/ZwmipiTNEyEGV/F1wK5DWL6poIRULNFbfZmKBLUvU5H3rTni7OtT7niq9ka
	 6DyqbPXG8uK7S+Rc1Pr712yHYZUiycuKhtO6fWFTbc5fYdkealO2joTF2KcJlqVq1C
	 k9JPcaw/czcYbe+l2XGV0RtVOMjgzc35OBiIKlLVTsemNgsTlJayFIt4grrcdQFn/i
	 K0gq2aNy4BUKQ==
Date: Fri, 25 Oct 2024 17:32:36 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Abraham I <kishon@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: Re: [PATCH v4 4/4] PCI: imx6: Add i.MX8Q PCIe Endpoint (EP) support
Message-ID: <20241025223236.GA1030308@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024-pcie_ep_range-v4-4-08f8dcd4e481@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_153239_586233_85FC0C91 
X-CRM114-Status: GOOD (  23.42  )
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

On Thu, Oct 24, 2024 at 04:41:46PM -0400, Frank Li wrote:
> Add support for i.MX8Q series (i.MX8QM, i.MX8QXP, and i.MX8DXL) PCIe
> Endpoint (EP). On i.MX8Q platforms, the PCI bus addresses differ from the
> CPU addresses. The DesignWare (DWC) driver already handles this in the
> common code.
> 
> Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Chagne from v3 to v4
> - none
> change from v2 to v3
> - add Mani's review tag
> - Add pci->using_dtbus_info = true;
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index bdc2b372e6c13..5be9bac6206a7 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -70,6 +70,7 @@ enum imx_pcie_variants {
>  	IMX8MQ_EP,
>  	IMX8MM_EP,
>  	IMX8MP_EP,
> +	IMX8Q_EP,
>  	IMX95_EP,
>  };
>  
> @@ -1079,6 +1080,16 @@ static const struct pci_epc_features imx8m_pcie_epc_features = {
>  	.align = SZ_64K,
>  };
>  
> +static const struct pci_epc_features imx8q_pcie_epc_features = {
> +	.linkup_notifier = false,
> +	.msi_capable = true,
> +	.msix_capable = false,
> +	.bar[BAR_1] = { .type = BAR_RESERVED, },
> +	.bar[BAR_3] = { .type = BAR_RESERVED, },
> +	.bar[BAR_5] = { .type = BAR_RESERVED, },
> +	.align = SZ_64K,
> +};
> +
>  /*
>   * BAR#	| Default BAR enable	| Default BAR Type	| Default BAR Size	| BAR Sizing Scheme
>   * ================================================================================================
> @@ -1448,6 +1459,8 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	pci->using_dtbus_info = true;

I mentioned this elsewhere, but I think the using_dtbus_info part
should be part of a series that only deals with the address
translation, and adding IMX8Q_EP should be in a separate series.

>  	if (imx_pcie->drvdata->mode == DW_PCIE_EP_TYPE) {
>  		ret = imx_add_pcie_ep(imx_pcie, pdev);
>  		if (ret < 0)
> @@ -1645,6 +1658,14 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  		.epc_features = &imx8m_pcie_epc_features,
>  		.enable_ref_clk = imx8mm_pcie_enable_ref_clk,
>  	},
> +	[IMX8Q_EP] = {
> +		.variant = IMX8Q_EP,
> +		.flags = IMX_PCIE_FLAG_HAS_PHYDRV,
> +		.mode = DW_PCIE_EP_TYPE,
> +		.epc_features = &imx8q_pcie_epc_features,
> +		.clk_names = imx8q_clks,
> +		.clks_cnt = ARRAY_SIZE(imx8q_clks),
> +	},
>  	[IMX95_EP] = {
>  		.variant = IMX95_EP,
>  		.flags = IMX_PCIE_FLAG_HAS_SERDES |
> @@ -1674,6 +1695,7 @@ static const struct of_device_id imx_pcie_of_match[] = {
>  	{ .compatible = "fsl,imx8mq-pcie-ep", .data = &drvdata[IMX8MQ_EP], },
>  	{ .compatible = "fsl,imx8mm-pcie-ep", .data = &drvdata[IMX8MM_EP], },
>  	{ .compatible = "fsl,imx8mp-pcie-ep", .data = &drvdata[IMX8MP_EP], },
> +	{ .compatible = "fsl,imx8q-pcie-ep", .data = &drvdata[IMX8Q_EP], },
>  	{ .compatible = "fsl,imx95-pcie-ep", .data = &drvdata[IMX95_EP], },
>  	{},
>  };
> 
> -- 
> 2.34.1
> 

