Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD76CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FOIvFa8ZMzf8OO0WTtZVL5hdqjc17Ki1h+dPCUrNLQg=; b=HfIk/4c+GZnVjKzlDbEcmgi+v6
	jaoXTlFJUQpk//0OAimdf58L89lcBPqPeTBZSPg1dfMZT+YGd5HjoX4Axdz/nEaZscNsb461gGLpr
	ki4XFewbY1QRlEinW918XYC42b1MQ2r1D4XRIIZ1qdGBcVTrMo1p9upqxokc57dkTQ1awlBd6sAg5
	IdFGx9waaKSNZujLQkgabEJ312b/3+8MALUWGzyzZFA2n1pPkEUDXjkNB4MuRJiwEj6U86XznzqJ4
	lXPOI2tm/vrrDLpfIZolAvdTICPSKnSm/+AP49YOb7EoIyoNUU7yk9Y1dM52GlKnPhDYEnDrwbf/Y
	GMKKy67w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVGp-00000003IR4-19sS;
	Tue, 29 Sep 2026 10:41:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVGh-00000003IOG-21YZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 10:41:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66642497;
	Tue, 29 Sep 2026 03:40:56 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 44B443F86F;
	Tue, 29 Sep 2026 03:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790678459; bh=UZr89XgYGJTx/73Z6djBBnqWD8Mg/Y/eUHrTZhuEFYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jIm3ldFb5pk3+tqKp3bdQ7jRyTBU1tt/T+9urehbXxS751TBWNYOlsCXfYtzsid40
	 pjThz3FBE7KeWWRNb56VbfgtpD+nqCUsLGsts7sSKdMDUhbcN0SzuK7+DnrWg1A1hz
	 gpXx3jj1Rs1nnhyI/5x63AX1JHz53K4I6IZrCOS8=
Date: Tue, 29 Sep 2026 11:40:46 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
	will@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v18] arm64: mm: Handle Granule Protection Faults (GPFs)
Message-ID: <aruVrvQcYCGe0HJ6@arm.com>
References: <20260913070459.2547407-1-suzuki.poulose@arm.com>
 <aqrGPK0lFBFXL2qY@arm.com>
 <985520fa-99b0-4620-bfee-8e6321b36104@arm.com>
 <aqvCwM_73qMpqzvV@arm.com>
 <749ab0c9-810d-4989-8fa5-1706124f05bc@arm.com>
 <arKVcjCOJf8p9rWL@arm.com>
 <4e315360-5b7a-4a0e-99c0-679a0271e625@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e315360-5b7a-4a0e-99c0-679a0271e625@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_034103_606917_6D703BEB 
X-CRM114-Status: GOOD (  32.80  )
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

On Mon, Sep 28, 2026 at 12:01:18PM +0100, Suzuki K Poulose wrote:
> On 22/09/2026 15:49, Catalin Marinas wrote:
> > On Tue, Sep 22, 2026 at 02:21:13PM +0100, Suzuki K Poulose wrote:
> > > I had another look and we could handle this via kvm_fault_is_gmem_abort()
> > > see in arch/arm64/kvm/mmu.c:
> > > 
> > > 
> > > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > > index 87e49251e0447..af5a4bf961aae 100644
> > > --- a/arch/arm64/kvm/mmu.c
> > > +++ b/arch/arm64/kvm/mmu.c
> > > @@ -1731,6 +1731,9 @@ static int gmem_abort(const struct kvm_s2_fault_desc
> > > *s2fd)
> > >          gfn_t gfn;
> > >          int ret;
> > > 
> > > +       if (!kvm_slot_has_gmem(s2fd->memslot))
> > > +               return -EINVAL;
> > 
> > I wonder whether we should add a KVM_BUG_ON() here. With the rest of the
> > changes, we should never get in this situation. Well, to be revisited
> > for private devices.
> > 
> > Also maybe move it to the caller, kvm_vm_mem_abort(), and not change
> > kvm_fault_is_gmem_abort(). Something like:
> > 
> > 	if (private_ipa_fault(kvm, s2fd->fault_ipa) &&
> > 	    KVM_BUG_ON(!kvm_slot_has_gmem(s2fd->memslot), kvm))
> > 		return -EIO;
> > 
> > To me it makes more sense for gmem_abort() to be called only *if* it's a
> > gmem slot. So any inconsistency, avoiding user_mem_abort() for private
> > memory, should be done in the caller. I assume the caller will also have
> > to route the private device path as well rather than rely on
> > gmem_abort().
> > 
> > > +
> > >          if (!perm_fault) {
> > >                  memcache = get_mmu_memcache(vcpu);
> > >                  ret = topup_mmu_memcache(vcpu, memcache);
> > > @@ -2277,10 +2280,12 @@ static bool private_ipa_fault(struct kvm *kvm,
> > > phys_addr_t fault_ipa);
> > >   static bool kvm_fault_is_gmem_abort(struct kvm *kvm,
> > >                                      const struct kvm_s2_fault_desc *s2fd)
> > >   {
> > > -       if (!kvm_slot_has_gmem(s2fd->memslot))
> > > -               return false;
> > >          if (kvm_memslot_is_gmem_only(s2fd->memslot))
> > >                  return true;
> > > +       /*
> > > +        * For Realms, all private faults must be backed by GMEM.
> > > +        * TODO: Handle Trusted device private memory mappings.
> > > +        */
> > >          if (private_ipa_fault(kvm, s2fd->fault_ipa))
> > >                  return true;
> > >          return false;
> > > 
> > > 
> > > Also, I have the following hunk for preventing memslot modifications.
> > > I will add this to v20 integration branch, which is almost ready ;-)
> > > 
> > > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > > index 582b48e34486b..87e49251e0447 100644
> > > --- a/arch/arm64/kvm/mmu.c
> > > +++ b/arch/arm64/kvm/mmu.c
> > > @@ -2783,6 +2783,18 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
> > >          }
> > >   }
> > > 
> > > +static bool kvm_prevents_memslot_change(struct kvm *kvm, enum kvm_mr_change change)
> > > +{
> > > +       /* Cannot modify memslots once a pVM has run or Realm created */
> > > +       if (change != KVM_MR_DELETE && change != KVM_MR_MOVE)
> > > +               return false;
> > > +
> > > +       if ((kvm_vm_is_protected_pkvm(kvm) && pkvm_hyp_vm_is_created(kvm)) ||
> > > +            kvm_realm_is_created(kvm))
> > > +               return true;
> > > +       return false;
> > > +}
> > > +
> 
> This needs to be tweaked for Realm to support non-secure device assignment.
> Aneesh reports that the Device assignment fails now,
> because the Device BAR reset deletes the memory slot and re-registers
> it, which the above change prevents.
> 
> I will modify that to
> 1. Prevent "Guest-memfd" backed memory slot deletion. Makes sure that
>    nothing can replace a private memory slot.
> 2. Allow non-Guest-memfd backed memory slots to be created
>   after the Realm is created. We anyways prevent "private" memory
>   to be mapped from a non-Guest-memfd memslot.

Yes, I think this should be fine. But at least with the last version I
looked at, we did not prevent private memory from being mapped from
non-guest_memfd slots (there was a way to delete the gmem slot, add a
normal one while the guest does a private IPA access). If we prevent
gmem slot deletion, we no longer have this issue, although we should
warn somewhere on the user_mem_abort() both.

Anyway, to be discussed on the KVM patches, not here. I raised it
initially here as I was looking whether a non-gmem slot ever ends up
private and trigger the GPF.

-- 
Catalin

