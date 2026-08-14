Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC6CC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 17:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5h8TZyTAoXCJSe2JoTmpCYR1pmYfom6HhzPNs541mqc=; b=cf94RtjEB10SAnErx5z7Pj5pVi
	v3GzN3xqmbgLa7MAjRNQz4/eugfDeNrrdhHeL3b8xIfOvvTbUrx1mI/a7XWCqShvR1AJ0BZ86OeRe
	VAmDsCkvLsDlQev0kRtkWrTXGsROwmvWRGYfKKk0Cx98+VAtSyCWlJ62ZCh4FfC29ke7HXCQd0TyC
	uT6bjdC0OWyEkBTxNeD3qEdbnxVLFaYZmC41X8euDUks4e6VlGWPa8RIsoE84pac+DY9Aq1LUmhKw
	HiznNrpJbxoTQgIciMB9mbRGpzmg50OX+ijafn6RILyv/NZ8pvsfFjUbvD1lzp9ZnG8wb7HPOMth8
	yHjmEa9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuvGW-00000002x2S-2KuK;
	Fri, 14 Aug 2026 17:00:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuvGV-00000002x2F-2QIC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 17:00:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9284260A77;
	Fri, 14 Aug 2026 17:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1039E1F000E9;
	Fri, 14 Aug 2026 17:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786726818;
	bh=5h8TZyTAoXCJSe2JoTmpCYR1pmYfom6HhzPNs541mqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iYr4Y5Eh/+tycun1pMxUojBy/q6lPiP/keXRcHaBSkCOTsADvBhLlq+k7j88jjymh
	 DDXubt+0LZkSN6Z13OvJ3eigY9EN1hRhm0cim5eRZrl2weUSwJc/Sb35LlzlPTOOKF
	 Piycj7xXDFFeH49JTzrBnCtj1kvrd11LTxepjpWutUfA//aO4mCWwS807TwQzvsOOq
	 S7JaEOBq8CgJ8mrw0eBmcaAr/7wSxTYrVWUjv1yv9JF89Mn2z5yZDKFPsNgusYJsMH
	 rXsgxwZBSLlIydhx3Np+3edmXbhgfv+Hmg0esZ2rRDRS/VjQuGFDxrgntyW5z8Ld+3
	 UHJTvK91M4aTA==
Date: Fri, 14 Aug 2026 18:00:01 +0100
From: Simon Horman <horms@kernel.org>
To: phucduc.bui@gmail.com
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] net: xilinx: axienet: Propagate errors from
 optional IRQ lookup
Message-ID: <20260814170001.GQ265046@horms.kernel.org>
References: <20260813042012.17631-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813042012.17631-1-phucduc.bui@gmail.com>
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

On Thu, Aug 13, 2026 at 11:20:11AM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no optional IRQ is available, while other errors should be propagated.
> 
> Propagate all error codes returned by platform_get_irq_optional() other
> than -ENXIO.
> 
> Another call to platform_get_irq_optional() in the same function already
> handles the return value this way. Apply the same error handling to this
> call site for consistency.

It would be useful to explain how this problem was discovered,
and what testing the patch has seen. Please add an Assisted-by
tag if appropriate.

Link: https://docs.kernel.org/process/coding-assistants.html

> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index fcf517069d16..d23e9796725d 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -2957,12 +2957,16 @@ static int axienet_probe(struct platform_device *pdev)
>  			lp->tx_irq = irq_of_parse_and_map(np, 0);
>  			of_node_put(np);
>  			lp->eth_irq = platform_get_irq_optional(pdev, 0);
> +			if (lp->eth_irq < 0 && lp->eth_irq != -ENXIO)
> +				return lp->eth_irq;
>  		} else {
>  			/* Check for these resources directly on the Ethernet node. */
>  			lp->dma_regs = devm_platform_get_and_ioremap_resource(pdev, 1, NULL);
>  			lp->rx_irq = platform_get_irq(pdev, 1);
>  			lp->tx_irq = platform_get_irq(pdev, 0);
>  			lp->eth_irq = platform_get_irq_optional(pdev, 2);
> +			if (lp->eth_irq < 0 && lp->eth_irq != -ENXIO)
> +				return lp->eth_irq;
>  		}

The same check seems to have been added to both arms of the if/else
condition. So it seems to me that it could be moved out of that condition.

I would suggest placing it below the existing rx_irq/tx_irq condition
which appears a few lines below this hunk so that those and
dma_regs errors are still propagated.

>  		if (IS_ERR(lp->dma_regs)) {
>  			dev_err(&pdev->dev, "could not map DMA regs\n");
> -- 
> 2.43.0
> 

