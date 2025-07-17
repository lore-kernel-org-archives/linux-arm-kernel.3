Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCC4C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 09:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jp84UrVQeqIjFOnZaUVZnWwJMwuQPnbhrYwnqRHzCAM=; b=NFPvyXASihtXzwAnLweS/Zk/8/
	j+cQ3Nn7gcq73vTPF8g+sEQxRTiT+VQEjrHFH0KWiw/PsLYnDNwjAPTJmOI0EpB8wRaSZUL98QwEC
	rh5rcRz9UtcacVZQob7Un7sCHt4eJjAQyHWpMDSyQmUT/ywe7FMHBaGyhOQWRGkoaMHljA5Z0Wq9Y
	5j7JMNBl5d/48/KTBCbtDc4a6BBmM4HpXrHo+wsO5SeVx7aqnI5PQT0l9H+kpqdB6BH8kRQGSFUU4
	6Eh+9gOrSWNtZjSZmvgbSu/v5OWcrafPVfm5Oy/1JOKBUjwgHupfsFqzwYdu13EFXxVG3FIew1oQQ
	LPMC2MOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLMV-00000009nKD-3EoK;
	Thu, 17 Jul 2025 09:57:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucKrh-00000009izw-36Xr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 09:25:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7EA605C077F;
	Thu, 17 Jul 2025 09:25:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7617CC4CEEB;
	Thu, 17 Jul 2025 09:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752744320;
	bh=21OlRn5Tc3SuYE+8FTQNy15rkxkozWxGI6bsYMCzUxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EM8GCicAlRYjBB8i/419ADE8vJ8mSfHU3Shjzg3mH1sYrOtHTfRa2jMuk0UFpEqYx
	 sCvduz/fUv7+1QNun6UnNQ9Rr6AYjQ2xTlN70IrLBv+pVUlIBhi/R2cp6g6T46M7Nf
	 7V2MeT95zjm0z4MH0kGvLVA6hdTdRA7SGDThcCgzjUcn24E9TnCmEyxjfeP/dbdi8P
	 Ka6/m2Sk3eNDsz49cHmSojmrG19f74O0uhI673imWmirrjsS42QFj7r2GjegdzFOIE
	 ixLmDgbH4w3SUy7e8vkCjHezJH2zl3Ra2N/GsMdowYkxpN9BXsp+otMUoHu3amxWD3
	 ZYbZQpzB3jigg==
Date: Thu, 17 Jul 2025 11:25:15 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] irqchip/gic-v5: Fix error handling in
 gicv5_its_irq_domain_alloc()
Message-ID: <aHjBe9k2Igl2iopq@lpieralisi>
References: <cover.1752693640.git.dan.carpenter@linaro.org>
 <4787a3c4-9713-4b99-9b8a-7ba227e91d02@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4787a3c4-9713-4b99-9b8a-7ba227e91d02@sabinyo.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_022521_816585_AC0F4B2F 
X-CRM114-Status: GOOD (  23.67  )
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

On Wed, Jul 16, 2025 at 02:38:22PM -0500, Dan Carpenter wrote:
> There are two issues to fix in this code:
> 1) If gicv5_alloc_lpi() fails the original code was checking the wrong
> variable.  Fix the mixup between "ret" and "lpi".
> 2) If irq_domain_alloc_irqs_parent() fails, then clean up all the loop
> iterations instead of just the current iteration.
> 
> Fixes: 57d72196dfc8 ("irqchip/gic-v5: Add GICv5 ITS support")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/irqchip/irq-gic-v5-its.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> index 55360ae9f1f6..8cc8563e27d5 100644
> --- a/drivers/irqchip/irq-gic-v5-its.c
> +++ b/drivers/irqchip/irq-gic-v5-its.c
> @@ -949,15 +949,18 @@ static int gicv5_its_irq_domain_alloc(struct irq_domain *domain, unsigned int vi
>  	device_id = its_dev->device_id;
>  
>  	for (i = 0; i < nr_irqs; i++) {
> -		lpi = gicv5_alloc_lpi();
> +		ret = gicv5_alloc_lpi();
>  		if (ret < 0) {
>  			pr_debug("Failed to find free LPI!\n");
>  			goto out_eventid;

This should be:

goto out_free_lpi;

otherwise we miss cleaning up for [0, i - 1] on LPI alloc failure.

I can fix it up - not sure it is worth splitting it into two patches,
just let me know please how you want me to handle it.

Thanks,
Lorenzo

>  		}
> +		lpi = ret;
>  
>  		ret = irq_domain_alloc_irqs_parent(domain, virq + i, 1, &lpi);
> -		if (ret)
> +		if (ret) {
> +			gicv5_free_lpi(lpi);
>  			goto out_free_lpi;
> +		}
>  
>  		/*
>  		 * Store eventid and deviceid into the hwirq for later use.
> @@ -979,7 +982,12 @@ static int gicv5_its_irq_domain_alloc(struct irq_domain *domain, unsigned int vi
>  	return 0;
>  
>  out_free_lpi:
> -	gicv5_free_lpi(lpi);
> +	while (--i >= 0) {
> +		irqd = irq_domain_get_irq_data(domain, virq + i);
> +		gicv5_free_lpi(irqd->parent_data->hwirq);
> +		irq_domain_reset_irq_data(irqd);
> +		irq_domain_free_irqs_parent(domain, virq + i, 1);
> +	}
>  out_eventid:
>  	gicv5_its_free_eventid(its_dev, event_id_base, nr_irqs);
>  	return ret;
> -- 
> 2.47.2
> 

