Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1096DD6ACF5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 13:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rhkE3V+WRgTUutnGMMOhEB5fF9t8Gk8brXU0JFceuoU=; b=n/IG9XcuKJTnPIBn3hg7k1fGWQ
	09CtqQBN/ylZjVkzYK9jC2LL0RD0Tm9qdJb9imc8ThdhkRz5GZ9JEB7qgvpQ0j502Oh0oSq49o1+q
	0LI8OXRaDlb2waoYLUJ+wNQXA2tsSEtArK1+Qyo1tVfWSzmUsLmUrAxd8V+Rec9KVeMahzPcLyBkz
	CQdlyt8gKjV1d0ZpxJvGUEE35KT4pXW8h1IRsB5rCJsGqj9mGNEY6Lkuq8TBki5u7yR2JRIgWukmT
	q9sMZOERYvPw/+v8inZeECnc0hYgvu4UVs95hV84wGJqhNjKwp/CHLCSweamWaDzVT2D+E+d1UTY0
	ANcd3rMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWDq0-00000008Vcl-2hPK;
	Thu, 18 Dec 2025 13:14:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWDpx-00000008VcL-48Gr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 13:14:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9EB3F43C0F;
	Thu, 18 Dec 2025 13:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C95C4CEFB;
	Thu, 18 Dec 2025 13:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766063673;
	bh=IjUpMsiPC2X0Nu3tv0tNZRe1sV4zwg2lN0zest+uSWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JkKvgiPoTvb3rcoWcXYnl/KK1aWTARrbyCVhX98N2Z5yxvwnY7chEuGmcbzOSFVtF
	 XC8OWU1vidNrYWGJlJPoTnsQduX86T16+h6kBhvVzT69IA5E+Ecrn3ERge2JV2o0gY
	 Ji7D2buPz4nE4PEJro+yw6diXv10PpOgOq9hQRJ2Pk9cSLBz4f+Z+cycZYXqyh3yWX
	 8NhOvENiQzRYJjlCCwchgGLit3OIGAzFwJ2uNHpbtbYvcoSqzYrhPpVoKDQsKRK+4f
	 0nrbp4frSgdkxZ/Te9FNH+UNia+5xUY77MNDvIu9xHCtNYAvT8YSGcoRXPnxzc+Aa8
	 H7vZPBf/YHWAA==
Date: Thu, 18 Dec 2025 18:44:27 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, michal.simek@amd.com, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI: xilinx: Fix INTx IRQ domain leak when MSI
 allocation fails
Message-ID: <hxxoboh4z7wrstodn3g263zj334sybearuj53myhmzmnocywij@w3rkiu7xiaxi>
References: <20251119033301.518-1-vulab@iscas.ac.cn>
 <20251218102314.1474-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251218102314.1474-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_051434_044792_4017F2E2 
X-CRM114-Status: GOOD (  19.54  )
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

On Thu, Dec 18, 2025 at 06:23:14PM +0800, Haotian Zhang wrote:
> In xilinx_pcie_init_irq_domain(), if xilinx_allocate_msi_domains()
> fails after pcie->leg_domain has been successfully created via
> irq_domain_create_linear(), the function returns directly without
> cleaning up the allocated IRQ domain, resulting in a resource leak.
> 
> Add irq_domain_remove() call in the error path to properly release the
> IRQ domain before returning the error.
> 
> Fixes: 313b64c3ae52 ("PCI: xilinx: Convert to MSI domains")
> Suggested-by: Manivannan Sadhasivam <mani@kernel.org>

Sorry, I didn't suggest this change ;)

> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
> Changes in v2:
>   - Correct the Fixes tag to point to the commit that introduced the
>     legacy IRQ domain leak on MSI allocation failure.
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

Looks like this domain is not removed in the further failure path. You need to
rename xilinx_free_msi_domains() to xilinx_free_irq_domains() and remove this
domain in that function as well.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

