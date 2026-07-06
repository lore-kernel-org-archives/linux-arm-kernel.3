Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125E4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 16:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ut0uwGUHWw94blqbm1llRwcmHPYES1flSFqSaCMAUek=; b=rlrBZetvlqniuR1kjF7XAtC96N
	5emuCRvfVQImgmHuIeoveQHp7n6jvSEe6iniajIZaCxIRhFgrQvsVGzyWPRjvcWXlwdlZW3blbneX
	wkDKQn8/iB3jTIu9WcYdCWYhdlPx/b0CHfME6BRBX2NxLvWMyoX7K/ST0yaQyVcSFpM6TL/cwXjJo
	3oOdGMZKS/+dz1uYAEdFfJ9oSd8YdVSsy7B/xRNwREba7E4AhvBhlcWtxJ0JerLB6h5YKw2y0Xpi6
	23sNj16g7lII0fdYVgERxb99D8RKE2jSoxq7YyqZPD7kNmGUv3FPDbp3JrK3aoA6kHJirMobNIRL4
	Dz6flXXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmQG-0000000D6MH-3pV2;
	Mon, 06 Jul 2026 16:43:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmQF-0000000D6M0-1Q1V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 16:43:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B8A3240495;
	Mon,  6 Jul 2026 16:43:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01EF61F000E9;
	Mon,  6 Jul 2026 16:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783356234;
	bh=ut0uwGUHWw94blqbm1llRwcmHPYES1flSFqSaCMAUek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fba2E7g5/hQ1iwXdVKgfv7Ph9Gnt4E2HMHIqPhiVfcCBpy5DTgnudHerNmBviyqSo
	 6KgbJzKLB7/dSkzQGFujwwJj0EMXk7nn+gSj0IpqJfxDpWInrQQrdOD6BZAZY9tNBb
	 0x+dM/NFZK9we+73Jt3aV/n9PEmtlj2XPupkRgZS9uOnR3ZKSLhW5afpJ5Ir9uRoju
	 +CS9gp3ib1vnkoeqifIQj6MHP0JChc6jnExvu7G8bLRkDVX8eKQJCF7OsEE8WGytAS
	 yVVJWNmx+UIfcMe28FLyobhnG653Fw9SAFaIPDtHsqnzO+QyJi0hD8NMVw3JPLyFss
	 r9wBSOzTjly6w==
Date: Mon, 6 Jul 2026 18:43:44 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/5] PCI: dwc: Determine whether iMSI is used before
 calling .init
Message-ID: <4qyn4fljtb3cbzcmfpkdomkm7vqnwn2rfbtqng4iwmtvfd4bpj@t6kkw53erl7f>
References: <20260701203918.63189-1-marek.vasut+renesas@mailbox.org>
 <20260701203918.63189-2-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260701203918.63189-2-marek.vasut+renesas@mailbox.org>
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

On Wed, Jul 01, 2026 at 10:37:44PM +0200, Marek Vasut wrote:
> The R-Car Gen4 PCIe controller integration configures MSI registers
> in the controller driver .init callback, because those registers
> have to be configured while PERST signal is asserted, and the PERST
> signal is asserted across the controller driver .init callback.
> 
> The registers have to be configured differently in case the iMSI is
> or is not used. Assign pp->use_imsi_rx before the controller driver
> .init callback is called, so the controller driver .init callback
> implementation can use the pp->use_imsi_rx value.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

LGTM!

- Mani

> ---
> Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-pci@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V3: New patch
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 06722259d2e37..f5a38e6fd8d79 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -587,6 +587,12 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  	if (ret)
>  		return ret;
>  
> +	if (pci_msi_enabled()) {
> +		pp->use_imsi_rx = !(pp->ops->msi_init ||
> +				    of_property_present(np, "msi-parent") ||
> +				    of_property_present(np, "msi-map"));
> +	}
> +
>  	if (pp->ops->init) {
>  		ret = pp->ops->init(pp);
>  		if (ret)
> @@ -594,10 +600,6 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  	}
>  
>  	if (pci_msi_enabled()) {
> -		pp->use_imsi_rx = !(pp->ops->msi_init ||
> -				     of_property_present(np, "msi-parent") ||
> -				     of_property_present(np, "msi-map"));
> -
>  		/*
>  		 * For the use_imsi_rx case the default assignment is handled
>  		 * in the dw_pcie_msi_host_init().
> -- 
> 2.53.0
> 

-- 
மணிவண்ணன் சதாசிவம்

