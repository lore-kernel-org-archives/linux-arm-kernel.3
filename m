Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADEFC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 17:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AwRGa0XFsqqIwrjVkk74Q1qsmmr8uiY3g/0R4Yfi5MQ=; b=UttqRzDZCb1onrYhDpFLkMacua
	kzVmJUy+dpiXhXlVi9o6IAaL7cdchWtX+aie5rAfJApc7Qc82mVkObyl41DE9dHOKXAlZsuYoz1XI
	XcFJIF5Jl1k5SM15jNQiaiXjgcb35FsiqC0mFT98bjI0+nWMWd7tsXE+el/v1hhD4ysystKUj56f4
	xH7132T5U+aqRNOZpW0hHDS718+3LCFLdP5LLWXDRpuP0Jjluoy+wkKdC6gCxCGeGnHOtDtgyFDMT
	oGJJ5cdbOYNlem47jGi6u/RWAoP9QJ3UK8bMmH+JhL9IuF7polcyta5MHNXHpTpY7WG7mfadNvQEI
	RrTi5jkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRDLC-000000054iV-2LI0;
	Mon, 16 Jun 2025 17:09:50 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRAsw-00000004iP3-3vQ4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 14:32:32 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b2fb8226e1cso5277094a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 07:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=csie.ntu.edu.tw; s=google; t=1750084347; x=1750689147; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AwRGa0XFsqqIwrjVkk74Q1qsmmr8uiY3g/0R4Yfi5MQ=;
        b=E52ZTV05/aBKQ02S9XA/ZtWOBPPCeasURx3p7SfB7izykbrWyjDfAwpKOF/irXBAzR
         KZh9i0ai/TJagvLBM+nTAviyIxwJCLH1at+Qj38J6HZs93x4BVqyC27AwAcidfolqCJP
         YGikYtuI8AXUd2/5u/mD47u9YFJkN5D0aFfqc0dKZN6sGaJQzQknbjIk4R8Hc+teIbLg
         p53eObQ6htVJ1XS7hqIBKztv0ApLhReI5YFjlfO4KAiphPIzBBRDegDwuJvxfmRwWlt7
         Y9bhS9WgpiC3mSG70xtLhTN5obTxWf028Oc0ew1QKR/vpFg5fPkx9c6PEnFMTbKQldsJ
         0YnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750084347; x=1750689147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AwRGa0XFsqqIwrjVkk74Q1qsmmr8uiY3g/0R4Yfi5MQ=;
        b=WA1zbNJFjdgMZVGxNDudPZjo8nPQ9WO7XZHiN0RVwfL1jJMhVZQZ3LB+Be2yqO7GVA
         DWVOjkW7EMmsjbXTx+R/wDfFyeqywgp7xxqlSnc+OimVa9bTgt/EUmVLTp8N21sbVVRn
         suyi0pWgMDadY6yO8vK7XLa6kzIduSzcXe4nfSrlo9lyrsonFpX5z/YajZ5ZDolF77BR
         ipoXTKDrUEVz3mzA6Zo/64vwooZPTp1Mhc8GYjH/d8eS+7ZcQFqx9DIcxYGuDkSkfDmu
         Qgr+Pmh21+90NWJi9FEuO61l8t52iMcw58MGFKNPBYpaIYxrE93t4/bb7Aqi99qL8+ln
         wdjw==
X-Gm-Message-State: AOJu0YzuQbAMJCeoxcavDZzI4d+shu57zZxa82TP4JFONlyvty9cCMx6
	RUnc+ribKicocwJ1dYZHUI9+6OP7zVA8uUS8wBBk5ciuRP5xL53/LfNtR+/YjUBLqHTQniXEyHz
	eLP/02j6Y4aH/MOOGC5xgH+VE9skvPiP+/U0asBJyfFuo2meg8BcY5FiXkObCjR+RUE5zZQ==
X-Gm-Gg: ASbGnct+toUlY82JnqUipZXX33aUJF1JRZYJsYCBSmpRiPTAgG6TMcox+YZcOD0ZWsX
	y3DMKmNOhwoRd7iLDt2xl2d6DWunSQSeTu6uZd9TjqpPsOnj8Ja15yuHNOQSVoIgLHXyRwysdcX
	CrXEh3i6BEIoZHvXI7mdWht+1DEzqejY5o8CFj4f7+5CG33tp58BQAKaDGgZR3OCPx4txXeXHxB
	lj2axEONG756qVhbWyfCxitlS3YyhfSTUat7fc5IWQIYFoFpUMI/9R/i0oSL3RuqEvayyqs4FGE
	t/YH0KvLDUTg9Ni26j5pvix62JB0PR2mSv6wIFm3cGM2Kvemfuao8/EflGOcb9R2NX8j8hlBAmA
	NaZB7Y6Y4K07BQIuH6ulvl0/z
X-Google-Smtp-Source: AGHT+IEtkJExy6WPafNCco+WTYoFOLE/6qqMQggbf4cftPJzDAhAGmjRrQdyLE0tM9+TfIxVnZRz4w==
X-Received: by 2002:a17:903:2ac7:b0:235:278c:7d06 with SMTP id d9443c01a7336-2366ae00e80mr158071555ad.8.1750084346886;
        Mon, 16 Jun 2025 07:32:26 -0700 (PDT)
Received: from zenbook (36-228-20-239.dynamic-ip.hinet.net. [36.228.20.239])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea8d1asm61456935ad.162.2025.06.16.07.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:32:26 -0700 (PDT)
Date: Mon, 16 Jun 2025 22:34:58 +0800
From: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Jintack Lim <jintack@cs.columbia.edu>, 
	Christoffer Dall <christoffer.dall@arm.com>
Subject: Re: [PATCH] KVM: arm64: nv: Fix s_cpu_if->vgic_lr[] indexing in
 vgic_v3_put_nested()
Message-ID: <2p4urq6ij5zq77c7viydmqqaj2doeyja43khvcjgn5pkpe7saz@eyfvuykscn22>
References: <20250614145721.2504524-1-r09922117@csie.ntu.edu.tw>
 <86qzzkc5xa.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86qzzkc5xa.wl-maz@kernel.org>
X-Gm-Spam: 0
X-Gm-Phishy: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_073231_263879_00C9D5A4 
X-CRM114-Status: GOOD (  47.18  )
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

On Mon, Jun 16, 2025 at 11:54:57AM +0100, Marc Zyngier wrote:
> On Sat, 14 Jun 2025 15:57:21 +0100,
> Wei-Lin Chang <r09922117@csie.ntu.edu.tw> wrote:
> > 
> > s_cpu_if->vgic_lr[] is filled continuously from index 0 to
> > s_cpu_if->used_lrs - 1, but vgic_v3_put_nested() is indexing it using
> > the positions of the set bits in shadow_if->lr_map. So correct it.
> > 
> > Signed-off-by: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
> > ---
> >  arch/arm64/kvm/vgic/vgic-v3-nested.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/vgic/vgic-v3-nested.c b/arch/arm64/kvm/vgic/vgic-v3-nested.c
> > index 4f6954c30674..29741e3f077b 100644
> > --- a/arch/arm64/kvm/vgic/vgic-v3-nested.c
> > +++ b/arch/arm64/kvm/vgic/vgic-v3-nested.c
> > @@ -343,7 +343,7 @@ void vgic_v3_put_nested(struct kvm_vcpu *vcpu)
> >  	struct shadow_if *shadow_if = get_shadow_if();
> >  	struct vgic_v3_cpu_if *s_cpu_if = &shadow_if->cpuif;
> >  	u64 val;
> > -	int i;
> > +	int i, index = 0;
> >  
> >  	__vgic_v3_save_vmcr_aprs(s_cpu_if);
> >  	__vgic_v3_deactivate_traps(s_cpu_if);
> > @@ -368,10 +368,11 @@ void vgic_v3_put_nested(struct kvm_vcpu *vcpu)
> >  		val = __vcpu_sys_reg(vcpu, ICH_LRN(i));
> >  
> >  		val &= ~ICH_LR_STATE;
> > -		val |= s_cpu_if->vgic_lr[i] & ICH_LR_STATE;
> > +		val |= s_cpu_if->vgic_lr[index] & ICH_LR_STATE;
> >  
> >  		__vcpu_sys_reg(vcpu, ICH_LRN(i)) = val;
> > -		s_cpu_if->vgic_lr[i] = 0;
> > +		s_cpu_if->vgic_lr[index] = 0;
> > +		index++;
> >  	}
> >  
> >  	shadow_if->lr_map = 0;
> 
> Nice catch, thanks a lot for tracking it down.
> 
> However, I think we should get rid of this double-indexing altogether,
> or at least make it less error-prone. This thing is extremely fragile,
> and it isn't the first time we are getting bitten with it.

Hi Marc,

Yes agreed, making this more robust is better than just the bug fix.
Thanks for the effort.

> 
> Looking at the code, it becomes pretty obvious that the shadow index
> is always the number of bits set in lr_map, and that we could
> completely drop the 'index' thing if we simply counted these bits
> (which isn't that expensive).
> 
> I came up with the (admittedly much bigger) following fix.
> 
> Thoughts?

Just one nit below:

> 
> 	M.
> 
> From 2484950b8fc3b36cca32bf5e86ffe7975a43e0e7 Mon Sep 17 00:00:00 2001
> From: Marc Zyngier <maz@kernel.org>
> Date: Sun, 15 Jun 2025 16:11:38 +0100
> Subject: [PATCH] KVM: arm64: nv: Fix tracking of shadow list registers
> 
> Wei-Lin reports that the tracking of shadow list registers is
> majorly broken when resync'ing the L2 state after a run, as
> we confuse the guest's LR index with the host's, potentially
> losing the interrupt state.
> 
> While this could be fixed by adding yet another side index to
> track it (Wei-Lin's fix), it may be better to refactor this
> code to avoid having a side index altogether, limiting the
> risk to introduce this class of bugs.
> 
> A key observation is that the shadow index is always the number
> of bits in the lr_map bitmap. With that, the parallel indexing
> scheme can be completely dropped.
> 
> While doing this, introduce a couple of helpers that abstract
> the index conversion and some of the LR repainting, making the
> whole exercise much simpler.
> 
> Reported-by: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Link: https://lore.kernel.org/r/20250614145721.2504524-1-r09922117@csie.ntu.edu.tw
> ---
>  arch/arm64/kvm/vgic/vgic-v3-nested.c | 81 ++++++++++++++--------------
>  1 file changed, 42 insertions(+), 39 deletions(-)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-v3-nested.c b/arch/arm64/kvm/vgic/vgic-v3-nested.c
> index d22a8ad7bcc51..bd22e42ce9112 100644
> --- a/arch/arm64/kvm/vgic/vgic-v3-nested.c
> +++ b/arch/arm64/kvm/vgic/vgic-v3-nested.c
> @@ -36,6 +36,11 @@ struct shadow_if {
>  
>  static DEFINE_PER_CPU(struct shadow_if, shadow_if);
>  
> +static int lr_map_idx_to_shadow_idx(struct shadow_if *shadow_if, int idx)
> +{
> +	return hweight64(shadow_if->lr_map & (BIT(idx) - 1));
> +}
> +
>  /*
>   * Nesting GICv3 support
>   *
> @@ -209,6 +214,29 @@ u64 vgic_v3_get_misr(struct kvm_vcpu *vcpu)
>  	return reg;
>  }
>  
> +static u64 translate_lr_hw_bit(struct kvm_vcpu *vcpu, u64 lr)

I believe translate_lr_pintid() better describes what this function is
doing.

For everything else, I don't spot any issues after review.

Reviewed-by: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>

> +{
> +	struct vgic_irq *irq;
> +
> +	if (!(lr & ICH_LR_HW))
> +		return lr;
> +
> +	/* We have the HW bit set, check for validity of pINTID */
> +	irq = vgic_get_vcpu_irq(vcpu, FIELD_GET(ICH_LR_PHYS_ID_MASK, lr));
> +	/* If there was no real mapping, nuke the HW bit */
> +	if (!irq || !irq->hw || irq->intid > VGIC_MAX_SPI)
> +		lr &= ~ICH_LR_HW;
> +
> +	/* Translate the virtual mapping to the real one, even if invalid */
> +	if (irq) {
> +		lr &= ~ICH_LR_PHYS_ID_MASK;
> +		lr |= FIELD_PREP(ICH_LR_PHYS_ID_MASK, (u64)irq->hwintid);
> +		vgic_put_irq(vcpu->kvm, irq);
> +	}
> +
> +	return lr;
> +}
> +
>  /*
>   * For LRs which have HW bit set such as timer interrupts, we modify them to
>   * have the host hardware interrupt number instead of the virtual one programmed
> @@ -217,58 +245,37 @@ u64 vgic_v3_get_misr(struct kvm_vcpu *vcpu)
>  static void vgic_v3_create_shadow_lr(struct kvm_vcpu *vcpu,
>  				     struct vgic_v3_cpu_if *s_cpu_if)
>  {
> -	unsigned long lr_map = 0;
> -	int index = 0;
> +	struct shadow_if *shadow_if;
> +
> +	shadow_if = container_of(s_cpu_if, struct shadow_if, cpuif);
> +	shadow_if->lr_map = 0;
>  
>  	for (int i = 0; i < kvm_vgic_global_state.nr_lr; i++) {
>  		u64 lr = __vcpu_sys_reg(vcpu, ICH_LRN(i));
> -		struct vgic_irq *irq;
>  
>  		if (!(lr & ICH_LR_STATE))
> -			lr = 0;
> -
> -		if (!(lr & ICH_LR_HW))
> -			goto next;
> -
> -		/* We have the HW bit set, check for validity of pINTID */
> -		irq = vgic_get_vcpu_irq(vcpu, FIELD_GET(ICH_LR_PHYS_ID_MASK, lr));
> -		if (!irq || !irq->hw || irq->intid > VGIC_MAX_SPI ) {
> -			/* There was no real mapping, so nuke the HW bit */
> -			lr &= ~ICH_LR_HW;
> -			if (irq)
> -				vgic_put_irq(vcpu->kvm, irq);
> -			goto next;
> -		}
> -
> -		/* Translate the virtual mapping to the real one */
> -		lr &= ~ICH_LR_PHYS_ID_MASK;
> -		lr |= FIELD_PREP(ICH_LR_PHYS_ID_MASK, (u64)irq->hwintid);
> +			continue;
>  
> -		vgic_put_irq(vcpu->kvm, irq);
> +		lr = translate_lr_hw_bit(vcpu, lr);
>  
> -next:
> -		s_cpu_if->vgic_lr[index] = lr;
> -		if (lr) {
> -			lr_map |= BIT(i);
> -			index++;
> -		}
> +		s_cpu_if->vgic_lr[hweight64(shadow_if->lr_map)] = lr;
> +		shadow_if->lr_map |= BIT(i);
>  	}
>  
> -	container_of(s_cpu_if, struct shadow_if, cpuif)->lr_map = lr_map;
> -	s_cpu_if->used_lrs = index;
> +	s_cpu_if->used_lrs = hweight64(shadow_if->lr_map);
>  }
>  
>  void vgic_v3_sync_nested(struct kvm_vcpu *vcpu)
>  {
>  	struct shadow_if *shadow_if = get_shadow_if();
> -	int i, index = 0;
> +	int i;
>  
>  	for_each_set_bit(i, &shadow_if->lr_map, kvm_vgic_global_state.nr_lr) {
>  		u64 lr = __vcpu_sys_reg(vcpu, ICH_LRN(i));
>  		struct vgic_irq *irq;
>  
>  		if (!(lr & ICH_LR_HW) || !(lr & ICH_LR_STATE))
> -			goto next;
> +			continue;
>  
>  		/*
>  		 * If we had a HW lr programmed by the guest hypervisor, we
> @@ -277,15 +284,13 @@ void vgic_v3_sync_nested(struct kvm_vcpu *vcpu)
>  		 */
>  		irq = vgic_get_vcpu_irq(vcpu, FIELD_GET(ICH_LR_PHYS_ID_MASK, lr));
>  		if (WARN_ON(!irq)) /* Shouldn't happen as we check on load */
> -			goto next;
> +			continue;
>  
> -		lr = __gic_v3_get_lr(index);
> +		lr = __gic_v3_get_lr(lr_map_idx_to_shadow_idx(shadow_if, i));
>  		if (!(lr & ICH_LR_STATE))
>  			irq->active = false;
>  
>  		vgic_put_irq(vcpu->kvm, irq);
> -	next:
> -		index++;
>  	}
>  }
>  
> @@ -368,13 +373,11 @@ void vgic_v3_put_nested(struct kvm_vcpu *vcpu)
>  		val = __vcpu_sys_reg(vcpu, ICH_LRN(i));
>  
>  		val &= ~ICH_LR_STATE;
> -		val |= s_cpu_if->vgic_lr[i] & ICH_LR_STATE;
> +		val |= s_cpu_if->vgic_lr[lr_map_idx_to_shadow_idx(shadow_if, i)] & ICH_LR_STATE;
>  
>  		__vcpu_assign_sys_reg(vcpu, ICH_LRN(i), val);
> -		s_cpu_if->vgic_lr[i] = 0;
>  	}
>  
> -	shadow_if->lr_map = 0;
>  	vcpu->arch.vgic_cpu.vgic_v3.used_lrs = 0;
>  }
>  
> -- 
> 2.39.2
> 
> 
> -- 
> Without deviation from the norm, progress is not possible.

