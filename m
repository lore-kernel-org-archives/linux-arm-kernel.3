Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64C4CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szLE0S72oFPtCHbqy6RYhj+xzfkKN142/ocsCt11p94=; b=kcxi3K+3lpTB/aeXrTB0fHiFrZ
	Hr/teakFdliAeFnCugWD+CiFlIGyGrs21eOx7E4Mf1Xy9ghR1KWgKtis1GXgBAIgqNv5m1uLJvRGT
	KM5hYULkBNegF1qkTlKwMsKmW4sVuP8MJ7ZUi+7c/3kARlxK6pDvtQvFWBOxkvGOSqbKM1kT30XHy
	O1rIN+pCdvXccxAbUq0thtdrXybJ5viMexgoOz3cYg7k66C9h8acD4a7MN/s+Bqa4tZ8moT1Vbxpm
	Nqwhcgau7+x2BzgWS3IC1fI1WTBNL29skMy6OfJNgKmuJwszQx9ZkUumj8TEEObaTluJCtjIBEgWr
	T8vyjh9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnah-0000000H3zk-2hn4;
	Wed, 17 Jun 2026 10:33:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnaf-0000000H3y2-2g7o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:33:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 175C540533;
	Wed, 17 Jun 2026 10:33:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 749A61F000E9;
	Wed, 17 Jun 2026 10:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781692429;
	bh=szLE0S72oFPtCHbqy6RYhj+xzfkKN142/ocsCt11p94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N37b7IhgoLv0nxsiTXFRbKaFHlR4HBRYKnrPzolbj6l4lHrypkiYiRraYPnPdiubo
	 mKX35W+0Fmhe6GwAubfGWzQWrwAGV87fmOeAlG0NnfsiiNNXzXkTTMyTt3dSDWHSLI
	 WQaNuRFAaxGAFo1gwCbVJAOtA6yEab3oT8GxxiML/HK3sToP8Ru5ugvj4jtucO8cp7
	 Bp02jPEYrbv1etezulBk/di4LkHhR4eSduZBgOlvzIK7GV6DpUVSRV3RFSUIGDPVqB
	 XOXbDPaXbzxDMGb34jsJzWBqpbp4/k6tM8ZbGC99oiJI51tWsVgeSper9fg1cJxUne
	 KMateyyg0kgWQ==
Date: Wed, 17 Jun 2026 12:33:39 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used
Message-ID: <lstafqaogzunb2azyqwvtt3swrk42nu3n5zyct2la5fqxomaqg@wyrz3qolhist>
References: <20260617030008.154449-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260617030008.154449-1-marek.vasut+renesas@mailbox.org>
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

On Wed, Jun 17, 2026 at 04:59:44AM +0200, Marek Vasut wrote:
> In case MSI are enabled, but DWC built-in iMSI-RX is not in use, the
> MSI are handled via GIC ITS. Configure all controller MSI registers
> fully.
> 
> Set or clear MSI capability register MSICAP0 MSI enable MSIE bit and
> PCIe Interrupt Status 0 Enable register PCIEINTSTS0EN MSI interrupt
> enable MSI_CTRL_INT bit according to MSI enable state, set both bits
> if MSI are enabled, clear both bits if MSI are disabled.
> 
> If MSI are disabled, or MSI are enabled and iMSI-RX is used, then
> deconfigure AXIINTCADDR and AXIINTCCONT to 0, which disables any
> pass through of MSI TLPs onto the AXI bus and then further into
> GIC ITS translation registers.
> 
> If MSI are enabled and iMSI-RX is not used, the configure AXIINTCADDR
> with target address of GIC ITS translation registers, and configure
> AXIINTCCONT to enable MSI TLP pass through onto AXI bus and into the
> GIC ITS. This specific configuration allows handling of MSI via the
> GIC ITS instead of integrated iMSI-RX.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> NOTE: This would not be possible without prior work from Shimoda-san
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
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c | 53 +++++++++++++++++++--
>  1 file changed, 48 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index 485cfa8bd9692..ba6e3bedd6d0a 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -31,6 +31,10 @@
>  #define DEVICE_TYPE_RC		BIT(4)
>  #define BIFUR_MOD_SET_ON	BIT(0)
>  
> +/* MSI Capability */
> +#define MSICAP0			0x0050
> +#define MSICAP0_MSIE		BIT(16)
> +
>  /* PCIe Interrupt Status 0 */
>  #define PCIEINTSTS0		0x0084
>  
> @@ -55,6 +59,16 @@
>  #define APP_HOLD_PHY_RST	BIT(16)
>  #define APP_LTSSM_ENABLE	BIT(0)
>  
> +/* INTC address */
> +#define AXIINTCADDR		0x0a00
> +/* GITS GIC ITS translation register */
> +#define AXIINTCADDR_VAL		0xf1050000

As Marc pointed out, this address should be fetched from DT, not hardcoded in
the driver.

> +
> +/* INTC control & mask */
> +#define AXIINTCCONT		0x0a04
> +#define INTC_EN			BIT(31)
> +#define INTC_MASK		GENMASK(11, 2)
> +
>  /* PCIe Power Management Control */
>  #define PCIEPWRMNGCTRL		0x0070
>  #define APP_CLK_REQ_N		BIT(11)
> @@ -305,6 +319,39 @@ static struct rcar_gen4_pcie *rcar_gen4_pcie_alloc(struct platform_device *pdev)
>  	return rcar;
>  }
>  
> +static void rcar_gen4_pcie_host_msi_init(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *dw = to_dw_pcie_from_pp(pp);
> +	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
> +	u32 val;
> +
> +	/* Make sure MSICAP0 MSIE is configured. */
> +	val = dw_pcie_readl_dbi(dw, MSICAP0);
> +	if (pci_msi_enabled())
> +		val |= MSICAP0_MSIE;
> +	else
> +		val &= ~MSICAP0_MSIE;
> +	dw_pcie_writel_dbi(dw, MSICAP0, val);
> +
> +	if (!pci_msi_enabled() || pp->use_imsi_rx) {

If MSI is not enabled, then what's the point in clearing these registers (also
above)? I see it as a redundant code. Is there a necessity to clear them?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

