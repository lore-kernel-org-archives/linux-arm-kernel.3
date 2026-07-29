Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54206C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 16:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=maBSX4x4149xGscMIRI+eWtyIRtwupXnBB1oY9K+LCE=; b=PIXunxeTDbYp/ozhRqXjNHYtGi
	7BeYhFsorP/16dW9BT6vexjQ0wsoU5hAwR2HeuXbPP3TbIHzws/pLFOlAdIAgrQR7zxqjZfeMjhSc
	dTaSHlbo2C7o/l2NLhz5VunGvp1mKMA0w0KFC+bu5Q8UPCja4oLqe14ZNEfniYTxSnUdz0Lj9nUbT
	X+QiNR3baskyfUouXzC4x1/7oFoX7TCR5yx2B9E6Q2vXiwEJA9/yauhRxtiALbkSR39ygGlYwGDqv
	18vT5Q/gxAhcIeawEydCAejDKEO3zal2nXN1hNUyc0g3nNIDORAtLJfx+/R2pAwHAgJuUI/MYE2Ch
	aGy4EC1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6i1-00000008Tk9-03i5;
	Wed, 29 Jul 2026 16:00:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6hz-00000008Tjs-2ktA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 16:00:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2DB4542ADE;
	Wed, 29 Jul 2026 16:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 172621F000E9;
	Wed, 29 Jul 2026 16:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785340839;
	bh=maBSX4x4149xGscMIRI+eWtyIRtwupXnBB1oY9K+LCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ReVk91SuVmAlMIEJUY3lALq9p7JPqmfIp4FaohTAVCG9zjpLA1rXW6DEK5pI6L3Lt
	 Vlx87KwvhrLeAoNAVYOi/q5YmeXaj0kJwvjNIY4COk3g0Hz5BAWYn8kQdRGXoSpCcb
	 3oXa3D7femsLl2w2LIZeNtUjZSkMmxHbrDXPB6BjJKCOzcWNHQWos3V4tqQB2c5Lxo
	 A8onamXl+69+QslW9DcoMrZWd8ik8NoWZR2KxQY6rjFTgoLH87q40v3bjdw8vxKZWC
	 NO//u9SWUEcGpR9kInUwCfRLACoMQ8SCsvEcjZKiyfFra8KlWBQgg4qpcRAYw4OMjo
	 LJXZZ5v7U3yEw==
Date: Wed, 29 Jul 2026 18:00:29 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Michal Simek <michal.simek@amd.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCHv2] PCI: xilinx: use fwnode_irq_get() for INTx IRQ lookup
Message-ID: <g3gtckpqgacw44jqqb5hb3oejpelxvbba47tdwsvksxbbskygp@mcwtsbypoyar>
References: <20260716205811.800920-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260716205811.800920-1-rosenp@gmail.com>
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

On Thu, Jul 16, 2026 at 01:58:11PM -0700, Rosen Penev wrote:
> Replace irq_of_parse_and_map() with fwnode_irq_get(dev_fwnode(dev), 0)
> in xilinx_pcie_parse_dt(). For an OF-backed device this is equivalent to
> the previous call, but uses the generic firmware-node API.
> 

What is the benefit of using fwnode API for OF only driver?

- Mani

> Unlike irq_of_parse_and_map(), fwnode_irq_get() returns a positive IRQ or
> a negative errno and never 0 (it rewrites 0 to -EINVAL). Store the result
> in an int and check for irq < 0, returning the error (including
> -EPROBE_DEFER). This also adds the error handling the previous code
> lacked, where irq_of_parse_and_map() failures were passed straight into
> devm_request_irq().
> 
> Built for ARM (multi_v7_defconfig + CONFIG_PCIE_XILINX) with LLVM=1;
> drivers/pci/controller/pcie-xilinx.o compiles cleanly.
> 
> Assisted-by: opencode:hy3-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v2: use dev_err_probe to handle EPROBE_DEFER.
>  drivers/pci/controller/pcie-xilinx.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-xilinx.c b/drivers/pci/controller/pcie-xilinx.c
> index 4aa139abac16..58532296182f 100644
> --- a/drivers/pci/controller/pcie-xilinx.c
> +++ b/drivers/pci/controller/pcie-xilinx.c
> @@ -20,10 +20,10 @@
>  #include <linux/of_address.h>
>  #include <linux/of_pci.h>
>  #include <linux/of_platform.h>
> -#include <linux/of_irq.h>
>  #include <linux/pci.h>
>  #include <linux/pci-ecam.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  
>  #include "../pci.h"
>  
> @@ -535,7 +535,7 @@ static int xilinx_pcie_parse_dt(struct xilinx_pcie *pcie)
>  	struct device *dev = pcie->dev;
>  	struct device_node *node = dev->of_node;
>  	struct resource regs;
> -	unsigned int irq;
> +	int irq;
>  	int err;
>  
>  	err = of_address_to_resource(node, 0, &regs);
> @@ -548,7 +548,10 @@ static int xilinx_pcie_parse_dt(struct xilinx_pcie *pcie)
>  	if (IS_ERR(pcie->reg_base))
>  		return PTR_ERR(pcie->reg_base);
>  
> -	irq = irq_of_parse_and_map(node, 0);
> +	irq = fwnode_irq_get(dev_fwnode(dev), 0);
> +	if (irq < 0)
> +		return irq;
> +
>  	err = devm_request_irq(dev, irq, xilinx_pcie_intr_handler,
>  			       IRQF_SHARED | IRQF_NO_THREAD,
>  			       "xilinx-pcie", pcie);
> @@ -585,10 +588,8 @@ static int xilinx_pcie_probe(struct platform_device *pdev)
>  	pcie->dev = dev;
>  
>  	err = xilinx_pcie_parse_dt(pcie);
> -	if (err) {
> -		dev_err(dev, "Parsing DT failed\n");
> -		return err;
> -	}
> +	if (err)
> +		return dev_err_probe(dev, err, "Parsing DT failed\n");
>  
>  	xilinx_pcie_init_port(pcie);
>  
> -- 
> 2.55.0
> 

-- 
மணிவண்ணன் சதாசிவம்

