Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772DCF99344
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 09:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6q4OPy1nhf44l2Mv0aPsv4Wu3e2bmaPiChfMUWkIRtk=; b=X2+60I4DzUcat7SPVGJ623/+3u
	EmbUOPcC+bTXjpAu1mBQGTMSwo7DiY+mxsmvGp0DHU8XNa5e/HDc2c7vtmEKh1zd0lfSPEsWPQIl3
	g44Yuw6FHtZZNi6N7dxQreygevZmLqNMPvF8ZGRuLDIsO1Zliwrg4BGXxaWvrCzvUg4Bgzu7+5zo5
	7CbFsQnKOGlJfudfRpZfmjhhu4rAqf1LDCLrN/yI/TWHl0ef58w1qumltneUeujTINWYTnTJXLtey
	llHr0mvt/sAm7GBYgOE8kCIB4JVbwSZ+3wMghyt9ggXsF/drfuoE1dioY6+6c46f72cDeTIJbi2g2
	6Du6GEzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFqmd-0000000BRdn-1txF;
	Thu, 23 Apr 2026 09:55:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFqma-0000000BRdN-0tzJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 09:55:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A515D4012C;
	Thu, 23 Apr 2026 09:55:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2C2BC2BCAF;
	Thu, 23 Apr 2026 09:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776938139;
	bh=hjXKw9ZIE252a9rsG98aMcf0BLZY7m6ZNyMHOk/Jr1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YEbrkalUGTvyK99JDoFtLg70Wk+hN7Oie2xQBd1Vekime3odPu127ZQ/FCtuHbQhO
	 EsM3vLEBREFrcrvI2juwME/6AjKwhW5FpDh0Dl+DkUPkVje0FvBLdt9Qny1Kikhvez
	 U7doB3ZxTihI02CHZfy0k00ePC+2dnV7GrlNj+1sBu+OwLT74WJgJ6qZB2HuTn/JlV
	 ALcjMfHTa8GqsxBCMhwRsUJc5NaaA5/FCl/NmSNaRxVi+9bcria+s9L74fR/+l7uiI
	 EIU7QggWVQqbWyWQg902tLONJ2zQJtrBCEo9jvn4QuP1OFjlnKsje4L2AtB3jsjr1d
	 sxmyjmp6Ga/6g==
Date: Thu, 23 Apr 2026 10:55:34 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Sebastian Ene <sebastianene@google.com>
Cc: Marc Zyngier <maz@kernel.org>, oupton@kernel.org, will@kernel.org,
	ayrton@google.com, catalin.marinas@arm.com, joey.gouly@arm.com,
	Sudeep Holla <sudeep.holla@kernel.org>, korneld@google.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	mrigendra.chaubey@gmail.com, perlarsen@google.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Validate the FF-A memory access descriptor
 placement
Message-ID: <20260423-just-mega-starfish-22309c@sudeepholla>
References: <20260422102540.1433704-1-sebastianene@google.com>
 <86bjfb18v1.wl-maz@kernel.org>
 <aejOu98q1lEZoFfW@google.com>
 <20260422-jolly-curassow-of-amplitude-25fbaf@sudeepholla>
 <aenjvY5VJxFye52e@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aenjvY5VJxFye52e@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_025540_293053_F7B1D53A 
X-CRM114-Status: GOOD (  41.07  )
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

On Thu, Apr 23, 2026 at 09:17:49AM +0000, Sebastian Ene wrote:
> On Wed, Apr 22, 2026 at 08:29:06PM +0100, Sudeep Holla wrote:

[...]

> Hello Sudeep,
> 
> > That's just the current choice in the driver and can be changed in the future.
> > 
> > > and makes use of the same assumption in: ffa_mem_desc_offset().
> > > https://elixir.bootlin.com/linux/v7.0/source/include/linux/arm_ffa.h#L448
> > 
> > Again this is just in the transmit path of the message the driver is
> > constructing and hence it is a simple choice rather than wrong assumption.
> >
> > > The later one seems wrong IMO. because we should compute the offset
> > > based on the value stored in ep_mem_offset and not adding it up with
> > > sizeof(struct ffa_mem_region).
> > > 
> > 
> > Sorry what am I missing as the driver is building these descriptors to
> > send it across to SPMC, we are populating the field and it will be 0
> > before it is initialised
> 
> Right, what I meant is having something like this since this function is not limited
> to the driver scope and using it from other components would imply relying on the
> assumption: 'ep_mem_offset == sizeof(struct ffa_mem_region)'. We will also have to validate
> that the `ep_mem_offset` doesn't point outside of the mailbox designated buffer.
> 

Sure, we can extend the function itself or add addition helper to get the
functionality you are looking for the validation.

> ---
> diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
> index 81e603839c4a..62d67dae8b70 100644
> --- a/include/linux/arm_ffa.h
> +++ b/include/linux/arm_ffa.h
> @@ -445,7 +445,7 @@ ffa_mem_desc_offset(struct ffa_mem_region *buf, int count, u32 ffa_version)
>         if (!FFA_MEM_REGION_HAS_EP_MEM_OFFSET(ffa_version))
>                 offset += offsetof(struct ffa_mem_region, ep_mem_offset);
>         else
> -               offset += sizeof(struct ffa_mem_region);
> +               offset += buf->ep_mem_offset;
>
>         return offset;
>  }
> ---
> 
> And then move `ffa_mem_region_additional_setup` to be called earlier before `ffa_mem_desc_offset`:
> (so that it can setup the value for ep_mem_offset)
> 
> ---
> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> index f2f94d4d533e..66de59c88aff 100644
> --- a/drivers/firmware/arm_ffa/driver.c
> +++ b/drivers/firmware/arm_ffa/driver.c
> @@ -691,6 +691,8 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
>         mem_region->flags = args->flags;
>         mem_region->sender_id = drv_info->vm_id;
>         mem_region->attributes = ffa_memory_attributes_get(func_id);
> +
> +       ffa_mem_region_additional_setup(drv_info->version, mem_region);

Ah this could do the trick. I need to check if all the usages are covered
though.

>         composite_offset = ffa_mem_desc_offset(buffer, args->nattrs,
>                                                drv_info->version);
>  
> @@ -708,7 +710,6 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
>         }
>         mem_region->handle = 0;
>         mem_region->ep_count = args->nattrs;
> -       ffa_mem_region_additional_setup(drv_info->version, mem_region);
> ---
> 
> > 
> > > Maybe this should be the fix instead and not the one in pKVM ? What do
> > > you think ?
> > > 
> > 
> > Can you share the diff you have in mind to understand your concern better
> > or are you referring to this patch itself.
> 
> Sure, please let me know if you think this is wrong. I might have misunderstood it. 
> 

Nope, the patch helped to understand it quicker. Thanks for that.

> > 
> > > The current implementation in pKVM makes use of the
> > > ffa_mem_desc_offset() to validate the first EMAD. If a compromised host
> > > places an EMAD at a different offset than sizeof(struct ffa_mem_region),
> > > then pKVM will not validate that EMAD.
> > >
> > 
> > Calling the host as compromised if it chooses a different offset seems bit
> > of extreme here. I am no sure if I am missing to understand something here.
> > 
> 
> Sorry for not explaining it, in pKVM model we don't trust the host kernel so
> we can assume that everything that doesn't pass the hypervisor validation(in
> this case the ff-a memory transaction) can be a potential attack that wants
> to compromise EL2.
> 

I am aware of the principle in general, but this example with different offset
can't be assumed as comprised host if the offset + size is well within the
Tx buffer size boundaries. That should be the way for you to cross check for
any compromise IHMO.

-- 
Regards,
Sudeep

