Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36A8C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 16:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SysFyUs14YLUrxpDggJRT0n8GSqZz6w5DrYu8j3hIbc=; b=f4bsv+Rc3v2/DS+RUvz9QzLtPX
	cApuOhRPSvZCPIUApI+Y+F92NUKT0/DftKOmjKlBueNm82R4jcLkcRGK6aAftARSp8Vh+z0pD8mTu
	B8uSvKV5fUaggsP+zgCyIGHIg8cJ+N6F+p+8DmsldREf6WVAgQ+Gcd+YO+n92oh1nR6/NRG6EkXTP
	/MI7HdsEhJ1AnUPjT6JnkKzDZeXU44PPp9XO4JsiKru6tjbGZigV7EEyDQFOPUYOy44oVy6gS9PGP
	SqS8zmNKYNHQS4OLqkGaJ+5t8RNnqA97DPi1J504ERX9yBLkkb5OeNL0aGEfpEbDfLYkwH0zXfoYG
	Iq10i5Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEWIi-0000000A6nc-29IR;
	Mon, 12 May 2025 16:46:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEW3T-0000000A3GA-4217
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 16:31:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 519FF436FA;
	Mon, 12 May 2025 16:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8833BC4CEEE;
	Mon, 12 May 2025 16:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747067463;
	bh=yuUA8tc5ZQqaQNeKWPw3vq4fpyzsoAnPGRVVajrP1Ro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W9giMf73LsTUzZNJr9gPt9p1NMj5cDbRqADZxoP2tAfFMC77oInW8wkwnv/SqAp+B
	 nFV7yonnJvuO83Jm3OEwh3lCBSCuinNfJGTawYqXETtzQ1/aRVY/5Wr8mZfx4MRU7X
	 HGXQi7Z3swtqFnN/8LCa8DeZ2dgEQNIQen7LOszdERpG1ishKTHCjdAIDnqbODWsEX
	 3WC/NL6rk+4hWMiQbAFEfgsUfKsjBg/jr/nBpTfGQbZqK609ezrE6kS6ol2PAb8g9r
	 MlAQVRzg7/coHkJl6iUpvhj6KYqzikE67F93aji/tDg5HQqeNUwIgIapOfO7ehrDs2
	 HeGc8Ymw6rF6A==
Date: Mon, 12 May 2025 18:30:58 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>
Subject: Re: [PATCH 2/4] irqchip/gic-v3-its: Implement .msi_teardown()
 callback
Message-ID: <aCIiQmfDUNrOCC2y@lpieralisi>
References: <20250511163520.1307654-1-maz@kernel.org>
 <20250511163520.1307654-3-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511163520.1307654-3-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_093104_042124_BAB94F70 
X-CRM114-Status: GOOD (  37.45  )
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

On Sun, May 11, 2025 at 05:35:18PM +0100, Marc Zyngier wrote:
> We currently nuke the structure representing an endpoint device
> translating via an ITS on freeing the last LPI allocated for it.
> 
> That's an unfortunate state of affair, as it is pretty common for
> a driver to allocate a single MSI, do something clever, teardown
> this MSI, and reallocate a whole bunch of them. The nvme driver
> does exactly that, amongst others.
> 
> What happens in that case is that the core code is buggy enough
> to issue another .msi_prepare() call, even if it shouldn't.
> This luckily cancels the above behaviour and hides the problem.
> 
> In order to fix the core code, let's start by implementing the new
> .msi_teardown() callback. Nothing calls it yet, so a side effect
> is that the its_dev structure will not be freed and that the DID
> will stay mapped. Not a big deal, and this will be solved in the
> following patch.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/irqchip/irq-gic-v3-its-msi-parent.c | 10 ++++
>  drivers/irqchip/irq-gic-v3-its.c            | 56 +++++++++++++--------
>  2 files changed, 45 insertions(+), 21 deletions(-)

First off, thanks a lot for putting this together, it makes an awful
lot of sense to me.

> index 0115ad6c82593..3472b97477104 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -3620,8 +3620,43 @@ static int its_msi_prepare(struct irq_domain *domain, struct device *dev,
>  	return err;
>  }
>  
> +static void its_msi_teardown(struct irq_domain *domain, msi_alloc_info_t *info)
> +{
> +	struct msi_domain_info *msi_info;
> +	struct its_device *its_dev;
> +	struct its_node *its;
> +	u32 dev_id;
> +
> +	dev_id = info->scratchpad[0].ul;

I have just managed to get to a keyboard :), I don't think the dev_id
makes it to this point, we overwrite it with the its_dev pointer in
its_msi_prepare() (could use second scratchpad for the pointer maybe ?).

I was bitten by this while removing the old IWB code into the new one
(unrelated to this code but that's how I noticed scratchpad is a union).

Ignore me if I am mistaken, just reading the code, have not tested it
(but I am about to do it for v5).

Thanks,
Lorenzo

> +
> +	msi_info = msi_get_domain_info(domain);
> +	its = msi_info->data;
> +
> +	guard(mutex)(&its->dev_alloc_lock);
> +
> +	its_dev = its_find_device(its, dev_id);
> +
> +	/* If the device is shared, keep everything around */
> +	if (its_dev->shared)
> +		return;
> +
> +	/* LPIs should have been already unmapped at this stage */
> +	if (WARN_ON_ONCE(!bitmap_empty(its_dev->event_map.lpi_map,
> +				       its_dev->event_map.nr_lpis)))
> +		return;
> +
> +	its_lpi_free(its_dev->event_map.lpi_map,
> +		     its_dev->event_map.lpi_base,
> +		     its_dev->event_map.nr_lpis);
> +
> +	/* Unmap device/itt, and get rid of the tracking */
> +	its_send_mapd(its_dev, 0);
> +	its_free_device(its_dev);
> +}
> +
>  static struct msi_domain_ops its_msi_domain_ops = {
>  	.msi_prepare	= its_msi_prepare,
> +	.msi_teardown	= its_msi_teardown,
>  };
>  
>  static int its_irq_gic_domain_alloc(struct irq_domain *domain,
> @@ -3722,7 +3757,6 @@ static void its_irq_domain_free(struct irq_domain *domain, unsigned int virq,
>  {
>  	struct irq_data *d = irq_domain_get_irq_data(domain, virq);
>  	struct its_device *its_dev = irq_data_get_irq_chip_data(d);
> -	struct its_node *its = its_dev->its;
>  	int i;
>  
>  	bitmap_release_region(its_dev->event_map.lpi_map,
> @@ -3736,26 +3770,6 @@ static void its_irq_domain_free(struct irq_domain *domain, unsigned int virq,
>  		irq_domain_reset_irq_data(data);
>  	}
>  
> -	mutex_lock(&its->dev_alloc_lock);
> -
> -	/*
> -	 * If all interrupts have been freed, start mopping the
> -	 * floor. This is conditioned on the device not being shared.
> -	 */
> -	if (!its_dev->shared &&
> -	    bitmap_empty(its_dev->event_map.lpi_map,
> -			 its_dev->event_map.nr_lpis)) {
> -		its_lpi_free(its_dev->event_map.lpi_map,
> -			     its_dev->event_map.lpi_base,
> -			     its_dev->event_map.nr_lpis);
> -
> -		/* Unmap device/itt */
> -		its_send_mapd(its_dev, 0);
> -		its_free_device(its_dev);
> -	}
> -
> -	mutex_unlock(&its->dev_alloc_lock);
> -
>  	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
>  }
>  
> -- 
> 2.39.2
> 

