Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A7CC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 13:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tiB+crGGScj+uBEmnT5pjDTTsJ8sTaY4Haz6s7DPJxI=; b=aV81HNR4+k0IjLXug1q5DwBAP5
	MXwUjxpSCZ7jzTITWbkoUuREt7R+6zG0oFddeSJyHzcOQH0DLvwoeNvqTj4S4d+9F/JjDwnBpm/0E
	uCFRpVcWnvsigTbeb8YYxYUUaLt7oWIeTbGIQkZvwunU+gOZrhPwp6u3wdawjVkVMhsa4oPQ5FKKl
	4kwcjzV4M2UVNSwTPv43Z5SHiuz3cgayz0q7/0bSMIVdRnbCc8nQXpBACoJoDyd5b8K/olLG9sBcT
	wJPIJ3P4VyVNRO/fDr59K0XQmWETnsA2BjuwTfFlLw9fNZPa11tVFxJALqnJTG5yxbH8IAG1ZlsgI
	283cnibA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxXK-00000008Sl7-0eTT;
	Wed, 02 Jul 2025 13:30:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxNu-00000008QZz-2Yk9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 13:20:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BE19661129;
	Wed,  2 Jul 2025 13:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE0E9C4CEED;
	Wed,  2 Jul 2025 13:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751462421;
	bh=Vw+TK6BmCACUGzgvGFj2GeLrvABo3wOiWncJZBGBnxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J1fKOICrttxn/1HT2v5kxU/WySxxo4X9A+Cr+GbsuBkSPKO0J4MxTupYq3LJa+cdh
	 4IGb3a6rWpdZi+AMS4jEzeYgqdh8tzYFLGbkY7wjLoc9P3aBtfQm6t09FLg0Lm01Gq
	 jkGTdfgJF2Lxp0yji0nM/xl+KDpLOj4mtKWRrqm7iJOKpIDG8HgzsLYChQfT0Bm/uo
	 MD8jMkxcYbRMETnsvqGpi5nJIEmVAZFB1rvgzWmPcZVa19+Vcyixoi2JUhe1c6YM6j
	 5XZ0YuC6vk7NY7QGH/bADWMYgPj8J2VR88K4Gg/qxP+CFHdrisjL+TPxOO8YjHGiWS
	 wzu2l721Fdwfg==
Date: Wed, 2 Jul 2025 18:50:02 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Anup Patel <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, Shuah Khan <shuah@kernel.org>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, dlemoal@kernel.org, jdmason@kudzu.us, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v19 08/10] pci: imx6: Add helper function
 imx_pcie_add_lut_by_rid()
Message-ID: <s6uvv5yotunkzmmc7hoxsxccihuoze5e6hkzdpmgqjaq7otlh6@uazl74vzsweg>
References: <20250609-ep-msi-v19-0-77362eaa48fa@nxp.com>
 <20250609-ep-msi-v19-8-77362eaa48fa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250609-ep-msi-v19-8-77362eaa48fa@nxp.com>
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

On Mon, Jun 09, 2025 at 12:34:20PM GMT, Frank Li wrote:
> Add helper function imx_pcie_add_lut_by_rid(), which will be used for
> Endpoint mode in the future. No functional change.
> 

What do you mean by 'used for Endpoint mode'? Endpoint mode is already supported
by this driver. So be explicit on how the new helper is going to be used.

Also, looks like this patch is independent of the doorbell patches. So this and
9/10 should come first.

- Mani

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v14 to v16
> - none
> 
> change from v13 to v14
> - new patch
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 5a38cfaf989b1..032b906c44dfa 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1096,18 +1096,14 @@ static void imx_pcie_remove_lut(struct imx_pcie *imx_pcie, u16 rid)
>  	}
>  }
>  
> -static int imx_pcie_enable_device(struct pci_host_bridge *bridge,
> -				  struct pci_dev *pdev)
> +static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>  {
> -	struct imx_pcie *imx_pcie = to_imx_pcie(to_dw_pcie_from_pp(bridge->sysdata));
> -	u32 sid_i, sid_m, rid = pci_dev_id(pdev);
> +	struct device *dev = imx_pcie->pci->dev;
>  	struct device_node *target;
> -	struct device *dev;
> +	u32 sid_i, sid_m;
>  	int err_i, err_m;
>  	u32 sid = 0;
>  
> -	dev = imx_pcie->pci->dev;
> -
>  	target = NULL;
>  	err_i = of_map_id(dev->of_node, rid, "iommu-map", "iommu-map-mask",
>  			  &target, &sid_i);
> @@ -1182,6 +1178,13 @@ static int imx_pcie_enable_device(struct pci_host_bridge *bridge,
>  	return imx_pcie_add_lut(imx_pcie, rid, sid);
>  }
>  
> +static int imx_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_dev *pdev)
> +{
> +	struct imx_pcie *imx_pcie = to_imx_pcie(to_dw_pcie_from_pp(bridge->sysdata));
> +
> +	return imx_pcie_add_lut_by_rid(imx_pcie, pci_dev_id(pdev));
> +}
> +
>  static void imx_pcie_disable_device(struct pci_host_bridge *bridge,
>  				    struct pci_dev *pdev)
>  {
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

