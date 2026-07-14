Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C16CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 21:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=FYLD+NQ3yFPrFtbxnnlrRNCjugvsXj89g6HloVaglxs=; b=Z2WkfanWfy2uGfM+apmc1NYXX1
	IjNqNzBfWA9okj+yCEyNkEQhrQrke49ZEvwp5nfF8FCfOxq8xt6hik1bHI5xrOYBT9p8CiDFx9ul0
	3wAst/vwMDRML6aeHQURE+5g4eBKQF6aopJ2HCdBUAcojhB3XQeXoeMrf5ToAyMAz/geYkX+IjtKR
	hPaCmO6CcBbvsY93tbxxJ9H+ccWMES8dfew3u0JvNC7vBXOa3+83ghtXvp/Rb0Oo9fwlkw4yxLdGd
	sBV5/Bopi3EWIFCuEy4+uSgzzkeBsro7BzsWUIVhyqjeKqzR+5+kHaSYTxZmGUHzpgIkQqmAcYMcF
	7TDoZRlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjkOg-0000000DJ3N-1R2U;
	Tue, 14 Jul 2026 21:10:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjkOf-0000000DJ2r-08Ew
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 21:10:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 062B1601D9;
	Tue, 14 Jul 2026 21:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 847131F00A3D;
	Tue, 14 Jul 2026 21:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784063431;
	bh=FYLD+NQ3yFPrFtbxnnlrRNCjugvsXj89g6HloVaglxs=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=B/T2AbrfLUNgebIFoIO2AxPaQSi4huO5+GJE3Q2Y57ZrNwR6HS5N9Ki45t/1UAC3/
	 rV9DLAcJHzYu/VGNAl6PQrOV+ThGzBEgkp3M/C6pbpA9JHGkuItAMZCCmz/r7T5Zqp
	 olo9UA0Q24xvVJGF5bfKipii+3YDgfQnYAAvHRRSPJQjwYtxk1JMeBAWqi+0ssa0ev
	 GmbXseZzB25y9ke//Gy6ri1XbJtoo2wpRL0twmxk9yfe+EkZpiZzhq+XJxC1byaBgx
	 w/HGLdj7IlQCAIC9uzTQ44N3BIK+hoWHKdLBUnqIXG//hqa6bRsWePVCP54hkrL89x
	 e1EWRrFgEuSfQ==
Date: Tue, 14 Jul 2026 16:10:30 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-pci@vger.kernel.org, kernel test robot <lkp@intel.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] PCI: rcar-gen4: Isolate driver to ARM64
Message-ID: <20260714211030.GA1412991@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260714131957.38067-1-marek.vasut+renesas@mailbox.org>
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

On Tue, Jul 14, 2026 at 03:19:27PM +0200, Marek Vasut wrote:
> The driver includes linux/irqchip/arm-gic-v3.h which pulls in headers
> which are available only on ARM and ARM64, on other architectures the
> headers are not present and the driver fails to build. This driver is
> used only on ARM64 hardware, isolate its build only to ARM64 to avoid
> build failures on other architectures.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202607100310.iQw5m9Uo-lkp@intel.com/
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Mani, I assume you'll squash this into 89bded511a66 ("PCI: rcar-gen4:
Configure AXIINTC if iMSI-RX is not used") so it's connected to the
addition of the linux/irqchip/arm-gic-v3.h include and there's no
bisection hole?

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
> V2: This is a rework of PCI: rcar-gen4: Inline GIC_TRANSLATER offset macro
>     which isolates the driver build to ARM64 via Kconfig instead:
>     https://lore.kernel.org/linux-pci/CAMuHMdVvWE7YZgKvreSn_vJLOVD4eMmn3TCGOyqSXksqjBCwvg@mail.gmail.com/
>     https://lore.kernel.org/linux-pci/20260714110041.GA1349622@bhelgaas/
> ---
>  drivers/pci/controller/dwc/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> index 49a7a2c50ca15..3260d916110b2 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -346,7 +346,7 @@ config PCIE_RCAR_GEN4
>  
>  config PCIE_RCAR_GEN4_HOST
>  	tristate "Renesas R-Car Gen4 PCIe controller (host mode)"
> -	depends on ARCH_RENESAS || COMPILE_TEST
> +	depends on ARM64 && (ARCH_RENESAS || COMPILE_TEST)
>  	depends on PCI_MSI
>  	select PCIE_DW_HOST
>  	select PCIE_RCAR_GEN4
> @@ -357,7 +357,7 @@ config PCIE_RCAR_GEN4_HOST
>  
>  config PCIE_RCAR_GEN4_EP
>  	tristate "Renesas R-Car Gen4 PCIe controller (endpoint mode)"
> -	depends on ARCH_RENESAS || COMPILE_TEST
> +	depends on ARM64 && (ARCH_RENESAS || COMPILE_TEST)
>  	depends on PCI_ENDPOINT
>  	select PCIE_DW_EP
>  	select PCIE_RCAR_GEN4
> -- 
> 2.53.0
> 

