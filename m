Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CE8C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 17:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mpe9oKaiEbfB05dXqSqSLq6O1r6s9FrJ+B97+HDCer0=; b=RtlHHc7SI/sQGXdR8SXNndJhQk
	etTAzA6god0I34VBQdX8zz9F+n7pzuyYoEt4VfphKzcxmdZ0j/f40OVKbMl0zbDUIi2DZKm1AEEam
	79u7iQv+Nc/KjpvIC6W/BHoLAKp49KTXm9Vc18EhjavB8jJJAFZUwxiG74674vx+biUGckn8eOnc4
	Utz8UWUsrCg7c/tpMXC84GrvWw7FAW0shQRKvyoje8OTBOXWJsjzxYZcUrVmxHYHhXqujAUR+DcQF
	rkoK/xsgEDaHM/rhczwMjdX9pkEJt2Tyb+lxuK8JZKPnNziNAUAlqYD6JnozNXVGgo82bFI+h4z+d
	t21rF5yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZrS-00000008066-1jHd;
	Tue, 17 Jun 2025 17:12:38 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRYt3-00000007qGr-0h0u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 16:10:14 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-313fab41f4bso4480297a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 09:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750176612; x=1750781412; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mpe9oKaiEbfB05dXqSqSLq6O1r6s9FrJ+B97+HDCer0=;
        b=cfojn7FNsqyo3DM/VSw+hWbODOe3U2dug1Pw/AMNN32rbP4tuvqjxIwC91jLS3A/4z
         wY47R5QNIxrp9E+2WXuk9xmkmd4TEjVpG3ii+qwmwfJlAXt6BxOHL98CEbrUNVVuCEYW
         ZT0OKA1/SJAnFiYOBzcC8oHxt8q9ZsRBcNPJL6urxP8iVzOPvpIA5vG/ZhDD+1T8Dg0M
         QCtOVzl0tX8Np+eeTQJocxVgqj3obOGqvYVTjLjeAv/RrxQLiMm9JwxaQhfd8p8y9oG1
         9Of6gOnb3d9c7LNYW9oA4SMir7cpPG8dclPcBFc4BbeveLV/BdLnMrZ/qqkLkpPQBwY3
         fNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176612; x=1750781412;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mpe9oKaiEbfB05dXqSqSLq6O1r6s9FrJ+B97+HDCer0=;
        b=uszcYf1ViSkQ2JACydZIfX+GALPjG1cbIX4r7Y5iMdgdYI4MdBgXv+YOuAx/AUML+Y
         RMIA3s4nRa1/nOUqhQA4xbgkxEf+ZJWakLvnnFPl+OSnHFC8pbW3bH9Ryqtw8tqh1jB6
         jWwF2uJcKivhF0zcf2vRvxhQEBQTTGgfDoJ3RXmT1hX3UsVcqhB8M9QnqFlO+hLL+/7p
         vRnLALlCheaXXxKrWUvJdXRxYDf+fFkID4T9ph+W7eRsCuQGoK3I5zdq7xTnXWgYuo0Z
         xh2Xu7mCU4vcrRIWedIKUQoN/ZBrP57WFBY2Ncegxh+GtBlD4EBK5AreDfn3xx38kNUX
         O+mg==
X-Forwarded-Encrypted: i=1; AJvYcCU24Mj2j6FZOe5esaFtMDQ2qbz4ZKG9liDbyn0odtvDBRAon2KXSDYobsnUmFaAWrQO0i5WIJy4ly0V9O6LFkx0@lists.infradead.org
X-Gm-Message-State: AOJu0YztcLjQQDa/Z1+7urphE2S/7qfx3R6yH06NFidPjnGcAd9H8IIJ
	P92ptQVjtimSCkwGVNMUXo4BEuaNZd2U5xs1flt3u3Ee7LvHdDGd54KkIz9htGeB4lZsPuJko44
	iMK99pw==
X-Google-Smtp-Source: AGHT+IFq1bSy5ue6p5VOY2+WKnKKimaXelT5uMjgsHODbKGY/Q+ifAgtUVMh8UXZFapv6bjOQtBJ96fEnfQ=
X-Received: from pjl7.prod.google.com ([2002:a17:90b:2f87:b0:311:b3fb:9f74])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:55cd:b0:312:1ae9:152b
 with SMTP id 98e67ed59e1d1-313f1d12fe0mr17819830a91.23.1750176611703; Tue, 17
 Jun 2025 09:10:11 -0700 (PDT)
Date: Tue, 17 Jun 2025 09:10:10 -0700
In-Reply-To: <bmx43lru6mwdyun3ktcmoeezqw6baih7vgtykolsrmu5q2x7vu@xp5jrbbqwzej>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com> <20250611224604.313496-14-seanjc@google.com>
 <bmx43lru6mwdyun3ktcmoeezqw6baih7vgtykolsrmu5q2x7vu@xp5jrbbqwzej>
Message-ID: <aFGTYoxlLhZsiMUC@google.com>
Subject: Re: [PATCH v3 12/62] KVM: SVM: Inhibit AVIC if ID is too big instead
 of rejecting vCPU creation
From: Sean Christopherson <seanjc@google.com>
To: Naveen N Rao <naveen@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_091013_207832_0763761D 
X-CRM114-Status: GOOD (  32.62  )
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

On Tue, Jun 17, 2025, Naveen N Rao wrote:
> On Wed, Jun 11, 2025 at 03:45:15PM -0700, Sean Christopherson wrote:
> > diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
> > index ab228872a19b..f0a74b102c57 100644
> > --- a/arch/x86/kvm/svm/avic.c
> > +++ b/arch/x86/kvm/svm/avic.c
> > @@ -277,9 +277,19 @@ static int avic_init_backing_page(struct kvm_vcpu *vcpu)
> >  	int id = vcpu->vcpu_id;
> >  	struct vcpu_svm *svm = to_svm(vcpu);
> >  
> > +	/*
> > +	 * Inhibit AVIC if the vCPU ID is bigger than what is supported by AVIC
> > +	 * hardware.  Immediately clear apicv_active, i.e. don't wait until the
> > +	 * KVM_REQ_APICV_UPDATE request is processed on the first KVM_RUN, as
> > +	 * avic_vcpu_load() expects to be called if and only if the vCPU has
> > +	 * fully initialized AVIC.
> > +	 */
> >  	if ((!x2avic_enabled && id > AVIC_MAX_PHYSICAL_ID) ||
> > -	    (id > X2AVIC_MAX_PHYSICAL_ID))
> > -		return -EINVAL;
> > +	    (id > X2AVIC_MAX_PHYSICAL_ID)) {
> > +		kvm_set_apicv_inhibit(vcpu->kvm, APICV_INHIBIT_REASON_PHYSICAL_ID_TOO_BIG);
> > +		vcpu->arch.apic->apicv_active = false;
> 
> This bothers me a bit. kvm_create_lapic() does this:
>           if (enable_apicv) {
>                   apic->apicv_active = true;
>                   kvm_make_request(KVM_REQ_APICV_UPDATE, vcpu);
> 	  }
> 
> But, setting apic->apicv_active to false here means KVM_REQ_APICV_UPDATE 
> is going to be a no-op.

That's fine, KVM_REQ_APICV_UPDATE is a nop in other scenarios, too.  I agree it's
not ideal, but this is a rather extreme edge case and a one-time slow path, so I
don't think it's worth doing anything special just to avoid KVM_REQ_APICV_UPDATE.

> This does not look to be a big deal given that kvm_create_lapic() itself 
> is called just a bit before svm_vcpu_create() (which calls the above 
> function through avic_init_vcpu()) in kvm_arch_vcpu_create(), so there 
> isn't that much done before apicv_active is toggled.
> 
> But, this made me wonder if introducing a kvm_x86_op to check and 
> enable/disable apic->apicv_active in kvm_create_lapic() might be cleaner 
> overall

Hmm, yes and no.  I completely agree that clearing apicv_active in avic.c is all
kinds of gross, but clearing apic->apicv_active in lapic.c to handle this particular
scenario is just as problematic, because then avic_init_backing_page() would need
to check kvm_vcpu_apicv_active() to determine whether or not to allocate the backing
page.  In a way, that's even worse, because setting apic->apicv_active by default
is purely an optimization, i.e. leaving it %false _should_ work as well, it would
just be suboptimal.  But if AVIC were to key off apic->apicv_active, that could
lead to KVM incorrectly skipping allocation of the AVIC backing page.

> Maybe even have it be the initialization point for APICv: 
> apicv_init(), so we can invoke avic_init_vcpu() right away?

I mostly like this idea (actually, I take that back; see below), but VMX throws
a big wrench in things.  Unlike SVM, VMX doesn't have a singular "enable APICv"
flag.  Rather, KVM considers "APICv" to be the combination of APIC-register
virtualization, virtual interrupt delivery, and posted interrupts.

Which is totally fine.  The big wrench is that the are other features that interact
with "APICv" and require allocations.  E.g.  the APIC access page isn't actually
tied to enable_apicv, it's tied to yet another VMX feature, "virtualize APIC
accesses" (not to be confused with APIC-register virtualization; don't blame me,
I didn't create the control knobs/names).

As a result, KVM may need to allocate the APIC access page (not to be confused
with the APIC *backing* page; again, don't blame me :-D) when enable_apicv=false,
and even more confusingly, NOT allocate the APIC access page when enable_apicv=true.

	if (cpu_need_virtualize_apic_accesses(vcpu)) {  <=== not an enable_apic check, *sigh*
		err = kvm_alloc_apic_access_page(vcpu->kvm);
		if (err)
			goto free_vmcs;
	}

And for both SVM and VMX, IPI virtualization adds another wrinkle, in that the
per-vCPU setup needs to fill an entry in a per-VM table.  And filling that entry
needs to happen at the very end of vCPU creation, e.g. so that the vCPU can't be
targeted until KVM is ready to run the vCPU.

Ouch.  And I'm pretty sure there's a use-after-free in the AVIC code.  If
svm_vcpu_alloc_msrpm() fails, the avic_physical_id_table[] will still have a pointer
to freed vAPIC page.

Thus, invoking avic_init_vcpu() "right away" is unfortunately flat out unsafe
(took me a while to realize that).

So while I 100% agree with your dislike of this patch, I think it's the least
awful band-aid, at least in the short term.

Longer term, I'd definitely be in favor of cleaning up the related flows, but I
think that's best done on top of this series, because I suspect it'll be somewhat
invasive.

