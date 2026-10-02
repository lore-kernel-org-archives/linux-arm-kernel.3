Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D589CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 13:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zutG9mUcjLueo0MzuInQdFJ8bIEoz3oYFAJlUN7gtlY=; b=mC+xZqQYWZVxH9dTNSAYmxAtCs
	l5sY1mR9VvIqXJGDAUmRENEoYFxt+hPdgnWrLlegjL7ry183Ct5LotUV90kNgRtppMzxR4hVzL3ES
	LZa4IJAZMVs0unorh36KCo4A/QeaUn54woT6WFNXcPQoy8kP9fwoQcwqWsg+pD+utVRuAIS8BjNz1
	DrBszK/NAbSOrI6Ac6H4kFcZEzX+UZmGLuaEOs4pVWneuMKjW7UKmahFrt2dyYT+W1NBOooacZOG7
	WW0x9S2jRHsOnrl5Qkzhem5ppAiUHnx1+fIXyp779a17NaO1aY+E+5t8E7wjskNLqbBrM4apsikj3
	YLhZMtVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcyl-0000000BdQN-17js;
	Fri, 02 Oct 2026 13:07:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcyj-0000000BdPu-2BfN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 13:07:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 92BEA60A70;
	Fri,  2 Oct 2026 13:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D6AB1F000FF;
	Fri,  2 Oct 2026 13:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790946428;
	bh=zutG9mUcjLueo0MzuInQdFJ8bIEoz3oYFAJlUN7gtlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F9QcbWULshIQZvrn1zMqIefdmWtYOHM01umX8e189rB6EyZcm6vGk2Lyo95pkctjr
	 Nl44pNLm7NmBJvHZtMqt5mwnYXCJEIlGQLY/Gd/7RpmJQQT0Cei+610YcgytZGxGnE
	 fWNXRY6TmzB2nYKUlvtE4JdK49sb1wwL2459HLaPZtkx6ndVgCJHJKoimUuXwPsAnr
	 wLGEz5f9DjqtDt2F94H+5p01EM7zDXn2uW6tGSgS7tRWEER8Ca8YpAMItgRlj4zLER
	 N0NHG6MrfA8cmo8lRp8UUrdroQRDGk0HLzk7vmfRqL3gSDkM+cF+7wtcv5bfN5X/I2
	 KRizQpBGpd8ig==
Date: Fri, 2 Oct 2026 14:07:02 +0100
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Yuchao Zhang <ndaugoing@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/7] KVM: arm64: Move OUTSIDE_GUEST_MODE publication
 past context being saved
Message-ID: <ar-sdhZPCg7YKtGM@willie-the-truck>
References: <20260929093548.3598547-1-maz@kernel.org>
 <20260929093548.3598547-2-maz@kernel.org>
 <CA+EHjTwZSFUZmavbB4tE-eFxHg9WF80CA230EwvynuNcZQ0prg@mail.gmail.com>
 <86a4p0403b.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86a4p0403b.wl-maz@kernel.org>
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

Hi folks,

Sorry, but this is probably an incredibly unhelpful drive-by comment
but Marc was talking about vcpu->mode the other day and I couldn't
resist looking at it some more. Like a moth to a flame...

See below.

On Tue, Sep 29, 2026 at 03:13:28PM +0100, Marc Zyngier wrote:
> On Tue, 29 Sep 2026 13:59:23 +0100,
> Fuad Tabba <fuad.tabba@linux.dev> wrote:
> > On Tue, 29 Sep 2026 10:35:42 +0100, Marc Zyngier <maz@kernel.org> wrote:
> > > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > [...]
> > > @@ -1386,6 +1385,12 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
> > >
> > >               kvm_arch_vcpu_ctxsync_fp(vcpu);
> > >
> > > +             /*
> > > +              * All the state has been synchronised, let advertise
> > > +              * we're outside of the guest.
> > > +              */
> > > +             smp_store_release(&vcpu->mode, OUTSIDE_GUEST_MODE);
> > 
> > Pardon my atomics :)
> 
> This is not an atomic instruction. However, it composes with atomics.
> 
> > , but what does the release pair with? On the halt
> > path, the only reader I can find is the cmpxchg() in
> > kvm_vcpu_exiting_guest_mode()
> 
> From Documentation/atomic_t.txt:
> 
> <quote>
>  - RMW operations that have a return value are fully ordered;
> 
>  - RMW operations that are conditional are unordered on FAILURE,
>    otherwise the above rules apply.
> </quote>
> 
> The acquire side of cmpxchg() is therefore interacting with the above
> release, which gives us the required ordering.
> 
> However, there is a problem if cmpxchg() fails, as there is no
> ordering in that case, and I'm not sure the smp_mb__before_atomic()
> saves the bacon in that case. It feels we'd need an acquire
> somewhere, a bit like this:

(as discussed off list, you can use smp_acquire__after_ctrl_dep() if
you're feeling really brave)

> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 03bfc92864b6e..2efb4febcb235 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -563,9 +563,15 @@ static inline int kvm_vcpu_exiting_guest_mode(struct kvm_vcpu *vcpu)
>  	 * The memory barrier ensures a previous write to vcpu->requests cannot
>  	 * be reordered with the read of vcpu->mode.  It pairs with the general
>  	 * memory barrier following the write of vcpu->mode in VCPU RUN.
> +	 *
> +	 * cmpxchg() is not ordered when failing, so make sure we perform an
> +	 * acquire in that case.
>  	 */
>  	smp_mb__before_atomic();
> -	return cmpxchg(&vcpu->mode, IN_GUEST_MODE, EXITING_GUEST_MODE);
> +	if (cmpxchg(&vcpu->mode, IN_GUEST_MODE, EXITING_GUEST_MODE) != IN_GUEST_MODE)
> +		return smp_load_acquire(&vcpu->mode);
> +
> +	return IN_GUEST_MODE;
>  }
>  
>  /*
> 
> > , and the LPI-disable and MOVALL halts
> > then take ap_list_lock or irq_lock. Would WRITE_ONCE() be enough?
> 
> We need a release so that we know for sure that any state stored
> before is visible by the time we can observe OUTSIDE_GUEST_MODE, and
> WRITE_ONCE() doesn't provide that (it can be reordered).
> 
> I don't see what taking a lock changes to the ordering requirement.
> 
> >
> > Should the early exit path (the kvm_vcpu_exit_request() bail-out) get
> > the same treatment? I think that's what Sashiko is trying to say in
> > the patch 5 review [1].
> 
> I don't understand what sashiko is trying to say, but this is clearly
> missing from the patch, see below. Not sure how I missed that one.
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 9a4871cd796bc..1a3a15bc6f55c 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -1333,13 +1333,13 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  		smp_store_mb(vcpu->mode, IN_GUEST_MODE);
>  
>  		if (ret <= 0 || kvm_vcpu_exit_request(vcpu, &ret)) {
> -			vcpu->mode = OUTSIDE_GUEST_MODE;
>  			isb(); /* Ensure work in x_flush_hwstate is committed */
>  			if (kvm_vcpu_has_pmu(vcpu))
>  				kvm_pmu_sync_hwstate(vcpu);
>  			if (unlikely(!irqchip_in_kernel(vcpu->kvm)))
>  				kvm_timer_sync_user(vcpu);
>  			kvm_vgic_sync_hwstate(vcpu);
> +			smp_store_release(&vcpu->mode, OUTSIDE_GUEST_MODE);

I'm struggling to see why a release is sufficient here, but I'm also
struggling to understand the bigger picture so I'm probably just confused.

I can see why a release is necessary for the saved state to be visible
to another CPU that has kicked the vCPU out of the guest and then uses
vcpu->mode == OUTSIDE_GUEST_MODE as the indication that the state is
safe to consume. However, don't we also need to make sure that any
subsequent check for a pending request on _this_ vCPU is ordered after
that write to the mode? Now that we've toggled it away from IN_GUEST_MODE,
I think IPIs can be elided by the kick, so a subsequent call to
e.g. kvm_request_pending() must be observed after that toggle, otherwise
I think we could miss a request.

Can you see the tree I'm barking up here?

Will

