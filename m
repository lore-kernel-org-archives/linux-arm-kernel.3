Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF34BCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 09:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2z4dGI6pY2qYULVKlOheBpEWKW9LxPbnHe465RmS/ko=; b=O95FoAzYKE40FXZeaCjFToVBoq
	GfPog0hQyBOP5HYomEFCaYLlKM9DYs+uc6HM9AC6c9MsxO7nYtGkagpTyICyCYLOXcmViFbFCzdyz
	8B0sLBbtIdTQEmJ/2N640rpszh968O/Vup/aCIGBylzyJP3b1+5jvCULmmVYGGTwrKehOYHOSY1Zl
	WAX5AupBP4t9D2jAyPy/P506EQ9zwk1IV+pSqmFeet+6CzdVq6QOnsBJgjPr9k4+oJQrhqLgauVgm
	MeT895Do8TTpu60TPV3kwvSrL+cbbH1oNpkQqKki2evS+xUOWfQ0M5WlNIH6xKKmaDHDfeowqqyAw
	rpAFpOOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOVt-000000057jG-1y5j;
	Mon, 10 Nov 2025 09:48:41 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOVp-000000057hm-45yl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 09:48:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1762768114; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=2z4dGI6pY2qYULVKlOheBpEWKW9LxPbnHe465RmS/ko=;
	b=WLgqhIwpqLXysnvbB4r8/wSRsnOsqijNz87K6fgsSh0TLLDXKu8SeHJYbQRlIb2vWx5MwSBrkkdyqkZChUarqkTod8/l7pXEzrAwSYyj9XAGnMQa3x6tL9ums3R4D+hDYKM6PwDqaycnS0yqUVOMPmCzsmaIfzHHEUIkLj5PfHo=
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0Ws1o7uu_1762768111 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 10 Nov 2025 17:48:32 +0800
Date: Mon, 10 Nov 2025 17:48:31 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 12/45] KVM: arm64: GICv3: Extract LR folding primitive
Message-ID: <kjr4rlg6wajbv6f2dggydbjusslqomtreu5x7ugdrvaqmk7hwb@igganp2dw7go>
References: <20251109171619.1507205-1-maz@kernel.org>
 <20251109171619.1507205-13-maz@kernel.org>
 <3tb7ekdzl5f4rs24bla63vw22awejhbn7ngvttid7v7bzaer2m@62bxshf7uj34>
 <868qgeutxm.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <868qgeutxm.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_014838_492552_38EB0E48 
X-CRM114-Status: GOOD (  30.26  )
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

On Mon, Nov 10, 2025 at 09:18:45AM +0800, Marc Zyngier wrote:
> On Mon, 10 Nov 2025 09:01:21 +0000,
> Yao Yuan <yaoyuan@linux.alibaba.com> wrote:
> >
> > On Sun, Nov 09, 2025 at 05:15:46PM +0800, Marc Zyngier wrote:
> > > As we are going to need to handle deactivation for interrupts that
> > > are not in the LRs, split vgic_v3_fold_lr_state() into a helper
> > > that deals with a single interrupt, and the function that loops
> > > over the used LRs.
> > >
> > > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > > ---
> > >  arch/arm64/kvm/vgic/vgic-v3.c | 88 +++++++++++++++++------------------
> > >  1 file changed, 43 insertions(+), 45 deletions(-)
> > >
> > > diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
> > > index 3ede79e381513..0fccfe9e3e8dd 100644
> > > --- a/arch/arm64/kvm/vgic/vgic-v3.c
> > > +++ b/arch/arm64/kvm/vgic/vgic-v3.c
> > > @@ -33,78 +33,76 @@ static bool lr_signals_eoi_mi(u64 lr_val)
> > >  	       !(lr_val & ICH_LR_HW);
> > >  }
> > >
> > > -void vgic_v3_fold_lr_state(struct kvm_vcpu *vcpu)
> > > +static void vgic_v3_fold_lr(struct kvm_vcpu *vcpu, u64 val)
> > >  {
> > > -	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
> > > -	struct vgic_v3_cpu_if *cpuif = &vgic_cpu->vgic_v3;
> > > -	u32 model = vcpu->kvm->arch.vgic.vgic_model;
> > > -	int lr;
> > > -
> > > -	DEBUG_SPINLOCK_BUG_ON(!irqs_disabled());
> > > -
> > > -	cpuif->vgic_hcr &= ~ICH_HCR_EL2_UIE;
> > > -
> > > -	for (lr = 0; lr < cpuif->used_lrs; lr++) {
> > > -		u64 val = cpuif->vgic_lr[lr];
> > > -		u32 intid, cpuid;
> > > -		struct vgic_irq *irq;
> > > -		bool is_v2_sgi = false;
> > > -		bool deactivated;
> > > -
> > > -		cpuid = val & GICH_LR_PHYSID_CPUID;
> > > -		cpuid >>= GICH_LR_PHYSID_CPUID_SHIFT;
> > > -
> > > -		if (model == KVM_DEV_TYPE_ARM_VGIC_V3) {
> > > -			intid = val & ICH_LR_VIRTUAL_ID_MASK;
> > > -		} else {
> > > -			intid = val & GICH_LR_VIRTUALID;
> > > -			is_v2_sgi = vgic_irq_is_sgi(intid);
> > > -		}
> > > +	struct vgic_irq *irq;
> > > +	bool is_v2_sgi = false;
> > > +	bool deactivated;
> > > +	u32 intid;
> > >
> > > -		/* Notify fds when the guest EOI'ed a level-triggered IRQ */
> > > -		if (lr_signals_eoi_mi(val) && vgic_valid_spi(vcpu->kvm, intid))
> > > -			kvm_notify_acked_irq(vcpu->kvm, 0,
> > > -					     intid - VGIC_NR_PRIVATE_IRQS);
> > > +	if (vcpu->kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3) {
> > > +		intid = val & ICH_LR_VIRTUAL_ID_MASK;
> > > +	} else {
> > > +		intid = val & GICH_LR_VIRTUALID;
> > > +		is_v2_sgi = vgic_irq_is_sgi(intid);
> > > +	}
> > >
> > > -		irq = vgic_get_vcpu_irq(vcpu, intid);
> > > -		if (!irq)	/* An LPI could have been unmapped. */
> > > -			continue;
> > > +	irq = vgic_get_vcpu_irq(vcpu, intid);
> > > +	if (!irq)	/* An LPI could have been unmapped. */
> > > +		return;
> > >
> > > -		raw_spin_lock(&irq->irq_lock);
> > > +	/* Notify fds when the guest EOI'ed a level-triggered IRQ */
> > > +	if (lr_signals_eoi_mi(val) && vgic_valid_spi(vcpu->kvm, intid))
> > > +		kvm_notify_acked_irq(vcpu->kvm, 0,
> > > +				     intid - VGIC_NR_PRIVATE_IRQS);
> >
> > The fds notifiy happens before checking irq's mapping before
> > this patch, and now in reversal order w/ above change. It's
> > fine for vLPI, and for vSPI no necessary call
> > kvm_notify_acked_irq() if the it has been remapped, no

Oops.. I want to say "and for vSPI no necessary call
kvm_notify_acked_irq() if it has been unmapped...".

> > gsi<->pin mapping there. Is above understanding correct ?
>
> We can only notify an irqfd for an SPI, never for an LPI. Given that

> only looking up an LPI can result in a NULL pointer (if it has been
> concurrently removed), this change is immaterial

You're right. The spis is allocated in vgic_init().

>
> This results in something that is easier to understand, as I find it
> more logical to weed out the error cases first before taking any
> significant action.

Yes, this makes the code better than beforem and thanks for your explanation!

>
> Thanks,
>
> 	M.
>
> --
> Without deviation from the norm, progress is not possible.

