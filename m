Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0AACE8D76
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 18:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=0i6EaakP7Es4XB87gU2pcBYJj8mKbd/2nCJCriEGFxw=; b=BP7Mxs6wmY6xli
	o5mJOhoXCQMAukHwNLSe1+QRo+9CyGWRTNBiO8Dza7yPPX8zZl+hdxIkxbihinRt8JywT7jHz2QrW
	I5/e9qCJoBzC9skAvgiH31/p7rNJpdBXRUo3vEBU9ZiC4kuM747KU2EXi7xgPrZVmLN7x0yZmJYYL
	WrIVL/EwSimPwR6GA73EQWsuAKD63HVr4i5yKsf1sWq/y2ZIsVHUc8JonShqLGkmLfXsVKROGg15c
	NS8I0LSPwZxkLtruAxFYEpJ36Na8Sc3pjzV2XacKFJvZpBy8n3c84aqL72z06CyDRTPx8to8xqRcU
	EZq7zyQgkz2RwHhEC5vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJz1D-0000000CzEk-1si0;
	Fri, 14 Nov 2025 18:59:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJz1B-0000000CzEU-2Df9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 18:59:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D22F960186;
	Fri, 14 Nov 2025 18:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A38BC2BC86;
	Fri, 14 Nov 2025 18:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763146770;
	bh=kb4vVC9exWAZjRCcwIcqHoYZzk1sVFsAZ4sy0TjOZnU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=D7sY7WBeYKhYRE/ZqKAyww/oiMkz2yorlpOCsTSA+VvkPWjr4qNoyWG22jVnny5ZW
	 gs1lnsk0CkM9PLT8NG7WmjnBImZZHVdI8gOxC3VQpxvgPcLkzEdBrtzzqtbFIsQ0QO
	 v32878CMEiOi4xiYQJ1TBCOG/KaHrVdGiSzlX97rOSKcTu5CP4UUQ4g3RtU8sxkNrI
	 DlvTIhLY8Jbdf6Dk7U87xsmeJ84UQ5oukLg/g92pvyDyFFQk7wVrNMfGMTGPwTmAog
	 h0k2wxcVHwtgw0dF6Ye7nsueTLiIYzzq82Md5pqoA3DuqNnN4suN+uYB/KwaQhUd3C
	 qy3j20hjujKbw==
Date: Fri, 14 Nov 2025 12:59:28 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-pci@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: stm32: Fix LTSSM EP race with start link.
Message-ID: <20251114185928.GA2335574@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114-perst_ep-v1-1-e7976317a890@foss.st.com>
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

On Fri, Nov 14, 2025 at 08:45:52AM +0100, Christian Bruel wrote:
> If the host has deasserted PERST# and started link training before the link
> is started on EP side, enabling LTSSM before the endpoint registers are
> initialized in the perst_irq handler results in probing incorrect values.
> 
> Thus, wait for the PERST# level-triggered interrupt to start link training
> at the end of initialization and cleanup the stm32_pcie_[start stop]_link
> functions.

I've seen this kind of thing in other drivers, and I wondered whether
it was safe because the host asserts and deasserts PERST#
asynchronously, independent of anything the endpoint is doing.

I assume it's possible that the host deasserts PERST# before this
driver has the stm32_pcie_ep_perst_irq_thread() thread set up.  If
that happens and the driver doesn't see the PERST# interrupt, does
everything still work correctly?

> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> ---
>  drivers/pci/controller/dwc/pcie-stm32-ep.c | 38 ++++++------------------------
>  1 file changed, 7 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-stm32-ep.c b/drivers/pci/controller/dwc/pcie-stm32-ep.c
> index 3400c7cd2d88a279c49ef36a99fc7537c381c384..d0654bb43759bb8d0f0d7badbf7bdae839241fcf 100644
> --- a/drivers/pci/controller/dwc/pcie-stm32-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-stm32-ep.c
> @@ -37,36 +37,9 @@ static void stm32_pcie_ep_init(struct dw_pcie_ep *ep)
>  		dw_pcie_ep_reset_bar(pci, bar);
>  }
>  
> -static int stm32_pcie_enable_link(struct dw_pcie *pci)
> -{
> -	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> -
> -	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
> -			   STM32MP25_PCIECR_LTSSM_EN,
> -			   STM32MP25_PCIECR_LTSSM_EN);
> -
> -	return dw_pcie_wait_for_link(pci);
> -}
> -
> -static void stm32_pcie_disable_link(struct dw_pcie *pci)
> -{
> -	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> -
> -	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR, STM32MP25_PCIECR_LTSSM_EN, 0);
> -}
> -
>  static int stm32_pcie_start_link(struct dw_pcie *pci)
>  {
>  	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> -	int ret;
> -
> -	dev_dbg(pci->dev, "Enable link\n");
> -
> -	ret = stm32_pcie_enable_link(pci);
> -	if (ret) {
> -		dev_err(pci->dev, "PCIe cannot establish link: %d\n", ret);
> -		return ret;
> -	}
>  
>  	enable_irq(stm32_pcie->perst_irq);
>  
> @@ -77,11 +50,7 @@ static void stm32_pcie_stop_link(struct dw_pcie *pci)
>  {
>  	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
>  
> -	dev_dbg(pci->dev, "Disable link\n");
> -
>  	disable_irq(stm32_pcie->perst_irq);
> -
> -	stm32_pcie_disable_link(pci);
>  }
>  
>  static int stm32_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> @@ -152,6 +121,8 @@ static void stm32_pcie_perst_assert(struct dw_pcie *pci)
>  
>  	dev_dbg(dev, "PERST asserted by host\n");
>  
> +	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR, STM32MP25_PCIECR_LTSSM_EN, 0);
> +
>  	pci_epc_deinit_notify(ep->epc);
>  
>  	stm32_pcie_disable_resources(stm32_pcie);
> @@ -192,6 +163,11 @@ static void stm32_pcie_perst_deassert(struct dw_pcie *pci)
>  
>  	pci_epc_init_notify(ep->epc);
>  
> +	/* Enable link training */
> +	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
> +			   STM32MP25_PCIECR_LTSSM_EN,
> +			   STM32MP25_PCIECR_LTSSM_EN);
> +
>  	return;
>  
>  err_disable_resources:
> 
> ---
> base-commit: 31115ecec74fe5c679a149d7037009f26b3aa8a9
> change-id: 20251113-perst_ep-0b57b9679cf9
> 
> Best regards,
> -- 
> Christian Bruel <christian.bruel@foss.st.com>
> 

