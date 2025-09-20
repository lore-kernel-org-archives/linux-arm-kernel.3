Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD284CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 06:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=olBYB8H/5wzYGSIQ0CbHKXHIUTROXILGzTd/Faktx5M=; b=ZRmLivqkQmwWRRzOVjkcvbvDzn
	X5MP0gCyNhPcJc4mdBzjBzt13WmnxDU4JxMu7io/Stq+lyZlaG1RoKlzZQmOhTYz+/UFe9dop+7Wl
	6rNNWR7kF3Eru5ZRh4wqv0YLs/jEZ4vn/bgDSYnAOhyX3J105eixMj+2HTa68jUBhIk4eA8vREAF2
	GkeLltek2/oOvPak8QoU/Nq6ZBRq3zzDkcDMupQ0xYvvW+HH057yGOWgZLggsB4HvGb7sPPizzHqV
	sW1UOA5ALsPAXR7vDHZiaUl4lqqLimB+AofN07aOphMcIWcXY5n3eSTJP5drDYMeqo3WfghBgYCBK
	iQV21YDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzr7q-00000004t4T-3jQT;
	Sat, 20 Sep 2025 06:31:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzr7l-00000004t2R-2ee6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 06:31:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3EE3F43A42;
	Sat, 20 Sep 2025 06:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2ADBC4CEEB;
	Sat, 20 Sep 2025 06:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758349868;
	bh=6m5MeUsjHwYKpcu37nk6GaAJpIuoU6LYXn0bvV59usA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D3Gvx192UmTP57TK3xRcgevRDrvN9PDsEaOCrs9cmRWFIdQrDqd/ckMreS86+4pMb
	 rlT97DJCCOb+TC6+fQGsMavVS02NQLURKGReh+aw0dCucn3kk8rrponYAMyCahXVbS
	 CzJbzXCUvO8NdVnUCr5C99wr3AWbkf94/My/23M00nMDUP8OzcdW5lnqgwyzCCL7/1
	 lAwVeymOKJsWaMn/7aq+EiHDeHuxX5CTn60vLvj+bXSBTIKa1V6eb/MwogrYkX6tzW
	 jWzAabfgDow8gTmZRlIHAkbUrQf7wldTrAzS0MOQlIyOz1SpjAaS+YDUWvb6ZVUUZ6
	 RSFDUDcoP6WfA==
Date: Sat, 20 Sep 2025 12:00:59 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, jingoohan1@gmail.com, l.stach@pengutronix.de, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/6] PCI: imx6: Don't poll LTSSM state of i.MX7D PCIe
 in PM operations
Message-ID: <jj2zirv5d2ly2otqyiyuid7au2lw4ygthiwhp7ptqs5lmvxbve@k43sdnqrvqx7>
References: <20250902080151.3748965-1-hongxing.zhu@nxp.com>
 <20250902080151.3748965-5-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250902080151.3748965-5-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_233109_689248_0D6EEB48 
X-CRM114-Status: GOOD (  14.64  )
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

On Tue, Sep 02, 2025 at 04:01:49PM +0800, Richard Zhu wrote:
> Add a quirk flag(QUIRK_NOL2POLL_IN_PM) for i.MX7D PCIe. Don't poll the
> LTSSM states after issue the PME_Turn_Off message.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

This one too should be squashed with patch 2.

- Mani

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 18b97bd0462b..a59b5282c3cc 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1863,6 +1863,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
>  		.enable_ref_clk = imx7d_pcie_enable_ref_clk,
>  		.core_reset = imx7d_pcie_core_reset,
> +		.quirk = QUIRK_NOL2POLL_IN_PM,
>  	},
>  	[IMX8MQ] = {
>  		.variant = IMX8MQ,
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்

