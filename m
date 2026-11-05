Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AAE606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 07:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rLq+wqGV;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TX8/hlrZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zrvvUaVfaZs4vDYlI6rznRYoDcQzDwIPJyL+WelT6AU=; b=rLq+wqGVLslxieMSxlQqI9ZcJs
	UDI6fYNYi9tr1R0fZfJnjQWJi1m78IhxFy/1a5JmL7d0rWH0gnLkPlVdHD+Zr2/XgksQZE0q/B0bl
	CmZDHFtZJzjmOtRYidsWOko+jQof2OtWoa6fZdFx2KN6j/XVTn8Il1Zd4liYpDcaONWzFTLfFg2GA
	0swt2EfHttS3Y+ER0MYXgkZWCL+u4HCD9wS0o6Ir3mqzQm0G/vTUWiSfl5c+leJgddO5hWKjRdpsV
	R0gy4meX+jfDOy5Ty9rm34rLv+rVgUxkKrRz1w4R5RY8N7g6pugMt3bUZG8XI4lLZH3enqMnz6bN0
	heN0z3yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOs0K-0000000821Y-0mzP;
	Thu, 05 Nov 2026 07:35:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOs0I-0000000821S-46JH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 07:35:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E28E411CF;
	Thu,  5 Nov 2026 07:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C818B1F00A17;
	Thu,  5 Nov 2026 07:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793864122;
	bh=zrvvUaVfaZs4vDYlI6rznRYoDcQzDwIPJyL+WelT6AU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TX8/hlrZnmQT8FsWt5Y+gLHUMA+kFofqylnXc/dIK7wGgmMzD+42ZAdjIXSw+G2ZF
	 yVQK5Bzv+T+XNntoBIQLAYD+gH4oU24IYm0kFKwn+JujgJctaFxjFxvNqEjUHpajPP
	 NS3q3DP/lDqf2waCTm3Bp4eVvpZj5zc4q6uMdaE9vDOlIYqLgg836Y4e8HolcQA7Lh
	 WfkVV6s5bI/XBq5HgtxK0qdGjTrvOTxSJn/eBFNeZ4RtJbS+Py6G1Y3xA5Ee8X5hbr
	 cYDKnzao5ceNGDTEbR9m8fVERzuHJm1QoY9PV52W6cPadbflFp3PZI6zAO/dZBv3pq
	 aZ8fVmbDum/MA==
Date: Thu, 5 Nov 2026 08:35:17 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/10] irqchip/gic-v5: Reject SPIs not backed by an IRS
Message-ID: <auwxtSfBOeKXC6w_@red-moon>
References: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
 <20261104-host_gicv5_fixes-v2-1-e47ad20ea3c8@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104-host_gicv5_fixes-v2-1-e47ad20ea3c8@arm.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 05:47:55PM +0000, Sascha Bischoff wrote:
> It is possible to build a multi-IRS GICv5 system where there are gaps
> in the global SPI range that are not backed by any IRS. In the current
> incarnation, this results in dereferencing a null pointer.
> 
> Reject cases where the firmware attempts to use those SPIs during IRQ
> allocation by catching the case where there is no chip_data associated
> with the irq (meaning that there is no IRS to back it). Spit out a
> warning about broken firmware when this is encountered as it shouldn't
> be using non-existent SPIs in the first place.
> 
> Fixes: 5cb1b6dab2def ("irqchip/gic-v5: Add GICv5 IRS/SPI support")
> Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>

https://docs.kernel.org/process/maintainer-tip.html

"Ordering of commit tags", if there is a v3.

Lorenzo

> ---
>  drivers/irqchip/irq-gic-v5.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
> index 8c0303af71e7d..f3cce2bd28cc3 100644
> --- a/drivers/irqchip/irq-gic-v5.c
> +++ b/drivers/irqchip/irq-gic-v5.c
> @@ -727,6 +727,15 @@ static int gicv5_irq_spi_domain_alloc(struct irq_domain *domain, unsigned int vi
>  
>  	irqd = irq_desc_get_irq_data(irq_to_desc(virq));
>  	chip_data = gicv5_irs_lookup_by_spi_id(hwirq);
> +	/*
> +	 * The global SPI range may contain IDs not covered by any IRS, i.e., it
> +	 * may have gaps, in which case there is no IRS to back the SPI. Catch
> +	 * broken firmware trying to use any of those SPIs.
> +	 */
> +	if (!chip_data) {
> +		pr_warn("Firmware bug! Unimplemented SPI (0x%lx)!\n", hwirq);
> +		return -EINVAL;
> +	}
>  
>  	irq_domain_set_info(domain, virq, hwirq, &gicv5_spi_irq_chip, chip_data,
>  			    handle_fasteoi_irq, NULL, NULL);
> 
> -- 
> 2.34.1
> 

