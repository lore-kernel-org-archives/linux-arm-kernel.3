Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8C7D68BEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 08:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7mG6PIwqZuufDBGnc5u3u6lCXcatMZ53T6sBvxbHGp0=; b=VRpu2hPWB7tP3wNEv+SjRm+4/U
	ZUdprofNSqoGTxIjLr1mAa5Ir0MqEbmjRwzeTy2PfTMcfcmxVaf9QhVNO6QJkvQrlMZQzUefskLhI
	DT51zN9mvvW0/i3YpfDtWJ+Fu7gM5g1vP5clLfSF1PXwkBN2Qz2SJXggQJTQtr/LIcM5vCDhxUE3C
	yn/sD6CG4sDLVaTufjhsWSqyQGO/lukZ56/mHXTV6E6/ekx2qWN06GVK5ocnRzOuvRc3ddRwYj3IU
	3Nz4hKA6D0xKDy+9o5Uea9C40InWTS2UBLGjm+Dwyi775UYphg4bUWc8Fp/WXKwyspYQSAmnoutus
	+dy7jhMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW97L-000000081ub-198M;
	Thu, 18 Dec 2025 08:12:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW97K-000000081sk-03nU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 08:12:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1AC8060121;
	Thu, 18 Dec 2025 08:12:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC494C4CEFB;
	Thu, 18 Dec 2025 08:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766045528;
	bh=IjrB11SdaPLV5NaGWPvfB9w9VeD/+npcJivOYx8PYM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nYTsZB76hS3lGlVOK1YECoiOFzqD9h2VsGi4szEhcspTTExuwq+TccXresnRbaS1w
	 qgci9nrWl25AsbNpAkLFxC0xWPau1K6y+UAH53+uWjY0TZSM+u1ys5e3t6s84yF5AI
	 58FbrYarZtCJsUsWI4cBjfWAf3kCYyK6pdTB7O0AV+9cuYKBl7oUhcqR+uAa6wqHMu
	 yL5zuNsBB03PM8XzJXM3dTOVZbrdEI6ncHUpgVW0Kc5mSL8yeMlluKbFgaMS0Snqja
	 zXLL4d8aKSzNerNsHvi6dQC/x+ckI6RsqFoHt/cqHEb3nWadT8dUBHYG6zLcbkctX4
	 w5R6mjGu/A1hg==
Date: Thu, 18 Dec 2025 13:41:55 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, michal.simek@amd.com, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: xilinx: Fix INTx IRQ domain leak when MSI
 allocation fails
Message-ID: <oelexrnhxsvscyxsrsl2gh25kvfqclxnrah6x27anjj3knuqg7@yexgfqzba6fr>
References: <20251119033301.518-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251119033301.518-1-vulab@iscas.ac.cn>
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

On Wed, Nov 19, 2025 at 11:33:01AM +0800, Haotian Zhang wrote:
> In xilinx_pcie_init_irq_domain(), if xilinx_allocate_msi_domains()
> fails after pcie->leg_domain has been successfully created via
> irq_domain_create_linear(), the function returns directly without
> cleaning up the allocated IRQ domain, resulting in a resource leak.
> 
> Add irq_domain_remove() call in the error path to properly release the
> IRQ domain before returning the error.
> 
> Fixes: 699ca3016268 ("PCI: xilinx: Check for __get_free_pages() failure")

Is this the correct tag?

- Mani

> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/pci/controller/pcie-xilinx.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-xilinx.c b/drivers/pci/controller/pcie-xilinx.c
> index 937ea6ae1ac4..e8cf320f3764 100644
> --- a/drivers/pci/controller/pcie-xilinx.c
> +++ b/drivers/pci/controller/pcie-xilinx.c
> @@ -480,8 +480,10 @@ static int xilinx_pcie_init_irq_domain(struct xilinx_pcie *pcie)
>  		phys_addr_t pa = ALIGN_DOWN(virt_to_phys(pcie), SZ_4K);
>  
>  		ret = xilinx_allocate_msi_domains(pcie);
> -		if (ret)
> +		if (ret) {
> +			irq_domain_remove(pcie->leg_domain);
>  			return ret;
> +		}
>  
>  		pcie_write(pcie, upper_32_bits(pa), XILINX_PCIE_REG_MSIBASE1);
>  		pcie_write(pcie, lower_32_bits(pa), XILINX_PCIE_REG_MSIBASE2);
> -- 
> 2.50.1.windows.1
> 

-- 
மணிவண்ணன் சதாசிவம்

