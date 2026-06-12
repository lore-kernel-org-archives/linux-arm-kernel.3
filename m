Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1978CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 02:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aFrCUzIcqsP2jLLQtdKiK9uGtRC1I1ntV3IR+frNfUs=; b=JniqxbIolEoRyf4M4BiqCNIUQp
	KZd1mCpioOLfut0Tlij+JU6+0NtXXQ2fs358Vg/dDR/yA0d4zp8tHzNbsfU65B9n6Hpshmlqsg1Xn
	NNaZximHndcl8D/ub2JfyD0hwfmdSbWx2wOH02a1rpyYliCUBZdQc2Se9P8HU7WfD5UqdBlNhkK4s
	FAqJx0Cxd5sxPOQMMwflMYjea3OgBHcrLl86/WyXbIbLvhC1+RArgD5+XGTTdiavdLYscZFySM/l0
	qHoiwXayO4bOrXjxAr3fvqAjZGbc/v7yvoPMfVr6Esgz5fYUdzA3FMFRP+aA+QkRsHvS8w/r4vjL7
	6bKd7kOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXrXg-0000000AHwp-0uHH;
	Fri, 12 Jun 2026 02:22:44 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXrXd-0000000AHwU-2jws
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 02:22:42 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-36b9ec98144so439622a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 19:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781230960; x=1781835760; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aFrCUzIcqsP2jLLQtdKiK9uGtRC1I1ntV3IR+frNfUs=;
        b=pD1Gjbp5ctokakYMxSMjTQwsYPLHqjDcTKB7u7zFX4P9plQ6IyRaq2LQBF+LFuJpXO
         Lb7bVX8GqF6SJErr9co1DDqXx2zgY3Ys6PS+6aYcQwtmvZYnE8wxnTOAew1lZNJ4f63B
         YIY+KUh9yz4oYCxcaIzerZ3LPWSD1erw0bUNP2siPfTg6Dd0c7/GiC1I533p932S2/J9
         alxKAlWmSakICU/l6Fpa+ETczxETEWwZnb4QWL+PyCb14dShUN8IS/P18JFGzlVbuNOf
         8yTd8xLDC3XqEj3weMa1PoxB4cqqjc3x5DKM65Xak0Juqv68qm0V8rLMZoHVosEMZyGF
         8r6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781230960; x=1781835760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aFrCUzIcqsP2jLLQtdKiK9uGtRC1I1ntV3IR+frNfUs=;
        b=Qk+0Hv1GBEgQSRiksF64maKb+8ZpH2QY88xqIwtsBaqGGSgAJnpCAYkd3sU+GzSuFi
         1WnZEUO804t9jnlxWR9361vZWjjKzCL8ANNdmnzdlG+4n080vumV8OmZRD87B9svYFfx
         wkkgPWfR/SGgsqvXKMLrlKU9F/6uAPtk5RzJqBXU3/aX3u1XDS7QWvBlHFzSKb2M2lBq
         bVMHE96ysVUj6BEBfDxuT+AGfHsB4O+USL3Xjt7mVr4+RVEspXhB1cU0MJQgvQBcCYmy
         gHOFLUBYQM6TZ8gjJpgOaQYewfZrDzAXvyfuS5rqSnKX4DuQhktP09SaSDOJJtiwO3qO
         UN4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+Rkoim5KwQIdxazfyJM+RaEmGQWtW/wqg41S/QuUHwMPeEGjbhsSiwgeGJ+WRnLzOTSz4wjyQWTJ4zt8JkJxd8@lists.infradead.org
X-Gm-Message-State: AOJu0YzqFXhO67al7fQcoXJUGqE6kKCwiu6ncUipZyurjkkqJOLO+cDu
	WC84vkNy6RinLpAJ9ZPGy0rDdwjwqoInb+lGYqfVQ5JJJR9GxdOBgiI3
X-Gm-Gg: Acq92OESWkz0DfywJqGt+lsj2BmySmVTUWTOyEvkFbYkrfduGQd6R1D72VsU+ntF+Az
	sG3CvQxqzV7Q7F4belOSoezshU9HtqGeRuWpShKfDNAcWUi88j4e+Z9Kvxa8PtwRBttNHxlrHfb
	CO0jgNedm5Adv0wCZeXNNRA1D38CiLHz5EI75F+U4GlJj1Rq/YbGoXRg3w31I77VxsUHt8tEXF0
	A436wi8zfoeYH1RGw8DJS9WkGM7w2kYR11ScLFAtkYyUFSS5gT/A5xujZmwcOkWlQdSDNZog1/G
	KvCat2BorAM60iOFpGmQbVKLl+JWuuKkT/W2ErFAWFnS+L/NlqcfXCa3BMADdesYVcXh2Rq0ec0
	btbVOwzNvtQVpXfSH94ljetdsb8ADdZbxyrjZTSh7gbu+xeScmGijZCdnPSMgI//jEzbZuJlnvZ
	rbfCpoZjX9r9rBhFHB/WPrYt2Ire5B7CSFdLFiXAy5gEkp6f89yMei1g==
X-Received: by 2002:a17:90b:5103:b0:36d:689a:cb27 with SMTP id 98e67ed59e1d1-37a0468ca6dmr979488a91.24.1781230959988;
        Thu, 11 Jun 2026 19:22:39 -0700 (PDT)
Received: from v4bel ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm313668a91.2.2026.06.11.19.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 19:22:39 -0700 (PDT)
Date: Fri, 12 Jun 2026 11:22:35 +0900
From: Hyunwoo Kim <imv4bel@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, Sascha.Bischoff@arm.com,
	jic23@kernel.org, timothy.hayes@arm.com, andre.przywara@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	imv4bel@gmail.com
Subject: Re: [PATCH] KVM: arm64: vgic: Check the interrupt is still ours
 before migrating it
Message-ID: <aitta-IcWnRepEva@v4bel>
References: <aiHnI1mu6SGQrgnz@v4bel>
 <aiJmBfXAxcytfGha@kernel.org>
 <87ecila0w3.wl-maz@kernel.org>
 <aiKMNIUMv9GQiIbD@kernel.org>
 <ailsCnyoS82r_QRz@v4bel>
 <865x3qtmg6.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <865x3qtmg6.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_192241_726635_3F3B91BF 
X-CRM114-Status: GOOD (  61.29  )
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

On Wed, Jun 10, 2026 at 05:00:25PM +0100, Marc Zyngier wrote:
> On Wed, 10 Jun 2026 14:52:10 +0100,
> Hyunwoo Kim <imv4bel@gmail.com> wrote:
> > 
> > On Fri, Jun 05, 2026 at 01:43:32AM -0700, Oliver Upton wrote:
> > > On Fri, Jun 05, 2026 at 08:42:52AM +0100, Marc Zyngier wrote:
> > > > On Fri, 05 Jun 2026 07:00:37 +0100,
> > > > Oliver Upton <oupton@kernel.org> wrote:
> > > > > 
> > > > > On Fri, Jun 05, 2026 at 05:59:15AM +0900, Hyunwoo Kim wrote:
> > > > > > vgic_prune_ap_list() drops both ap_list_lock and irq_lock while migrating
> > > > > > an interrupt to another vCPU. After reacquiring the locks it only checks
> > > > > > that the affinity is unchanged (target_vcpu == vgic_target_oracle(irq))
> > > > > > before moving the interrupt, which assumes that an interrupt whose affinity
> > > > > > is preserved is still queued on this vCPU's ap_list.
> > > > > > 
> > > > > > That assumption no longer holds if the interrupt is taken off the ap_list
> > > > > > while the locks are dropped. vgic_flush_pending_lpis() removes the
> > > > > > interrupt from the list and sets irq->vcpu to NULL, but leaves
> > > > > > enabled/pending/target_vcpu untouched. As the interrupt is still enabled
> > > > > > and pending, vgic_target_oracle() returns the same target_vcpu, so the
> > > > > > affinity check passes and list_del() is run a second time on an entry that
> > > > > > has already been removed.
> > > > > > 
> > > > > > Also check that the interrupt is still assigned to this vCPU
> > > > > > (irq->vcpu == vcpu) before moving it.
> > > > > > 
> > > > > > Fixes: 0919e84c0fc1 ("KVM: arm/arm64: vgic-new: Add IRQ sync/flush framework")
> > > > > > Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
> > > > > 
> > > > > Looking at this and the other VGIC patch you sent (which should've been
> > > > > a combined series), are you trying to deal with a vCPU writing to
> > > > > another vCPU's redistributor? I.e. vCPU B setting GICR_CTLR.EnableLPIs=0
> > > > > behind the back of vCPU A?
> > > > > 
> > > > > That is extremely relevant information as the off-the-cuff reaction is
> > > > > that no race exists. But since the GIC architecture is awesome and
> > > > > allows for this sort of insanity, it obviously does....
> > > > > 
> > > > > Anyway, for LPIs resident on a particular RD, there's zero expectation
> > > > > that the pending state is preserved when EnableLPIs=0. So I'd rather
> > > > > vgic_flush_pending_lpis() just invalidate the pending state.
> > > > 
> > > > Just clearing the pending state introduces a potential problem as we
> > > > now have an interrupt that is neither active nor pending on the AP
> > > > list. It is not impossible to solve (we now have similar behaviours
> > > > with SPI deactivation from another vcpu), but that requires posting a
> > > > KVM_REQ_VGIC_PROCESS_UPDATE to the target vcpu.
> > > 
> > > Right, I was suggesting that in addition to deleting the LPI from the AP
> > > list we actually invalidate the pending state so that someone sitting on
> > > a pointer to a to-be-freed LPI sees vgic_target_oracle() returning
> > > NULL
> > > 
> > > > > Beyond that, I see two other fixes for lifetime issues around the
> > > > > vgic_irq in the middle of migration. I'd like to see explicit RCU
> > > > > protection around the release && reacquire of the ap_list_lock rather
> > > > > than depending on the precondition that IRQs are disabled.
> > > > 
> > > > I'm not sure I follow. Are you suggesting turning the AP list into an
> > > > RCU protected list?
> > > 
> > > No, sorry, I should expand a little.
> > > 
> > > We store a reference on the vgic_irq struct in the AP list, which is
> > > stable so long as the ap_list_lock is held. It should be possible for
> > > the refcount to drop to 0 between releasing the ap_list_lock and
> > > reacquiring it.
> > > 
> > > So either vgic_prune_ap_list() takes an additional reference on the
> > > vgic_irq before dropping the ap_list_lock or rely on RCU to protect
> > > vgic_irq structs observed with a non-zero refcount.
> > 
> > What are your thoughts on this approach?
> > 
> > 
> > Best regards,
> > Hyunwoo Kim
> > 
> > ---
> > 
> > diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
> > index 933983bb2005..7fb871c3ccd8 100644
> > --- a/arch/arm64/kvm/vgic/vgic-init.c
> > +++ b/arch/arm64/kvm/vgic/vgic-init.c
> > @@ -523,7 +523,7 @@ static void __kvm_vgic_vcpu_destroy(struct kvm_vcpu *vcpu)
> >  	 * Retire all pending LPIs on this vcpu anyway as we're
> >  	 * going to destroy it.
> >  	 */
> > -	vgic_flush_pending_lpis(vcpu);
> > +	vgic_flush_pending_lpis(vcpu, true);
> > 
> >  	INIT_LIST_HEAD(&vgic_cpu->ap_list_head);
> >  	kfree(vgic_cpu->private_irqs);
> > diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
> > index 5913a20d8301..f85d63f17af0 100644
> > --- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
> > +++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
> > @@ -303,7 +303,7 @@ static void vgic_mmio_write_v3r_ctlr(struct kvm_vcpu *vcpu,
> >  		if (ctlr != GICR_CTLR_ENABLE_LPIS)
> >  			return;
> > 
> > -		vgic_flush_pending_lpis(vcpu);
> > +		vgic_flush_pending_lpis(vcpu, false);
> >  		vgic_its_invalidate_all_caches(vcpu->kvm);
> >  		atomic_set_release(&vgic_cpu->ctlr, 0);
> >  	} else {
> > diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
> > index 1e9fe8764584..09629a38fc0a 100644
> > --- a/arch/arm64/kvm/vgic/vgic.c
> > +++ b/arch/arm64/kvm/vgic/vgic.c
> > @@ -192,7 +192,7 @@ static void vgic_release_deleted_lpis(struct kvm *kvm)
> >  	xa_unlock_irqrestore(&dist->lpi_xa, flags);
> >  }
> > 
> > -void vgic_flush_pending_lpis(struct kvm_vcpu *vcpu)
> > +void vgic_flush_pending_lpis(struct kvm_vcpu *vcpu, bool destroy)
> >  {
> >  	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
> >  	struct vgic_irq *irq, *tmp;
> > @@ -204,6 +204,13 @@ void vgic_flush_pending_lpis(struct kvm_vcpu *vcpu)
> >  	list_for_each_entry_safe(irq, tmp, &vgic_cpu->ap_list_head, ap_list) {
> >  		if (irq_is_lpi(vcpu->kvm, irq->intid)) {
> >  			raw_spin_lock(&irq->irq_lock);
> > +			/* Leave interrupts pending a migration for prune. */
> > +			if (!destroy && irq->vcpu != vgic_target_oracle(irq)) {
> > +				raw_spin_unlock(&irq->irq_lock);
> > +				continue;
> > +			}
> 
> It's rather unclear to me what the semantics of this are.
> 
> If vcpu-a decides to nuke the LPIs of vcpu-b and the LPI had in the
> meantime been migrated to vcpu-c, but obviously not observed by vcpu-c
> yet as the LPI is still on vcpu-b's AP-list, then I don't see the
> point in keeping this state.
> 
> Am I missing something obvious?

I looked a bit more into Oliver's review, the one suggesting that pending 
be cleared only for resident LPIs while the ones being migrated are left 
in place.

What the leave preserves is the pending edge of a single LPI whose target 
is already vcpu-c but which is still on vcpu-b's ap_list. This edge is 
always lost when we just clear it, but for a device that fires again a 
later INT reaches vcpu-c through the oracle, so it is mostly harmless. The 
exception is a software LPI that never fires again(irq->hw == false): 
that edge is then lost with no way to recover it, because 
its_sync_lpi_pending_table only re-syncs the LPIs whose target_vcpu matches, 
and the disable path does no pending writeback. I am not entirely sure about 
this part, though.

Since this does not look like the common case, if it does not need to be 
covered I will send v2 keeping only the pending clear and the ref hold in 
vgic_prune_ap_list(). What do you think?

> 
> > +			/* Pending state is not preserved across EnableLPIs=0. */
> > +			irq->pending_latch = false;
> 
> That part I agree with.
> 
> >  			list_del(&irq->ap_list);
> >  			irq->vcpu = NULL;
> >  			raw_spin_unlock(&irq->irq_lock);
> > @@ -797,6 +804,9 @@ static void vgic_prune_ap_list(struct kvm_vcpu *vcpu)
> > 
> >  		/* This interrupt looks like it has to be migrated. */
> > 
> > +		/* Keep the interrupt alive while the locks are dropped. */
> > +		vgic_get_irq_ref(irq);
> > +
> >  		raw_spin_unlock(&irq->irq_lock);
> >  		raw_spin_unlock(&vgic_cpu->ap_list_lock);
> > 
> > @@ -839,6 +849,8 @@ static void vgic_prune_ap_list(struct kvm_vcpu *vcpu)
> >  		raw_spin_unlock(&vcpuB->arch.vgic_cpu.ap_list_lock);
> >  		raw_spin_unlock(&vcpuA->arch.vgic_cpu.ap_list_lock);
> > 
> > +		deleted_lpis |= vgic_put_irq_norelease(vcpu->kvm, irq);
> > +
> >  		if (target_vcpu_needs_kick) {
> >  			kvm_make_request(KVM_REQ_IRQ_PENDING, target_vcpu);
> >  			kvm_vcpu_kick(target_vcpu);
> > diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
> > index 9d941241c8a2..c1ac24ede899 100644
> > --- a/arch/arm64/kvm/vgic/vgic.h
> > +++ b/arch/arm64/kvm/vgic/vgic.h
> > @@ -341,7 +341,7 @@ void vgic_v3_put(struct kvm_vcpu *vcpu);
> >  bool vgic_has_its(struct kvm *kvm);
> >  int kvm_vgic_register_its_device(void);
> >  void vgic_enable_lpis(struct kvm_vcpu *vcpu);
> > -void vgic_flush_pending_lpis(struct kvm_vcpu *vcpu);
> > +void vgic_flush_pending_lpis(struct kvm_vcpu *vcpu, bool destroy);
> >  int vgic_its_inject_msi(struct kvm *kvm, struct kvm_msi *msi);
> >  int vgic_v3_has_attr_regs(struct kvm_device *dev, struct kvm_device_attr *attr);
> >  int vgic_v3_dist_uaccess(struct kvm_vcpu *vcpu, bool is_write,
> > 
> 
> I reckon this would work just as well with just the pending state
> being removed in vgic_flush_pending_lpis(), and the reference holding
> hack in gvgic_prune_ap_list().
> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.


Best regards,
Hyunwoo Kim

