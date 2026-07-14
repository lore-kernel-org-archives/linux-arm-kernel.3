Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EB8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gInOkK3MFigtNNyYqGsnLpkL8fDUvGl+QQ8TMQawvRY=; b=mP4fIOl8oOeY/XvKmyYzdKf26w
	sxBp5RDbRQ70Myfoqg8zhXYSF3JT7iyR76a4MO9G0CNqdP3IirGdigL7yfV62Qj8Rj1NoJMUe11mZ
	9tmPNw3EI1P3gCtfpzKUvkFQwSLiWzxb0YkFloNQAu3vMxDwsL+5TSKKtCuT3RNA8XjWw4CkOnKBS
	0xlhrZ1GyIOiiDgw97tqxRc16iM2Qfgsuq4yaKQjh5ktODV8f4r6ghxT1CPv7fEc1P6uU5E1SwHs2
	knY0BMfzfoDmDJOCbmarwF6eLsk2onZIgwD2UVGdBq2orSFQqbo2G9kd/lJtRpvuqGraifB8E9bMc
	QtUsBpzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjczI-0000000C8I2-41CM;
	Tue, 14 Jul 2026 13:15:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjczG-0000000C8Gc-2WvJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:15:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CA5B2F;
	Tue, 14 Jul 2026 06:15:44 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 865693F93E;
	Tue, 14 Jul 2026 06:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784034948; bh=XNSSPDJ8EnkeQo0QXv5LSXTkwnk4M9Ns8GM6m16X5iY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=loiza8Xn9ZMCVC8EzOXT0Ilp4WN0t9srxb9YTlDASgBX/M7LNi9u8EIqrXzxF3eRX
	 f3KP5VkQ+HCA0N7xsi28RE7+IBj8/oxcFArRnYY86m5IeooFSon5ZmgmxCEm7PPzww
	 VEL8EEgTDd/pNnHxRpdxcHBk8caq+zqlW5takq5I=
Date: Tue, 14 Jul 2026 14:15:39 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, steven.price@arm.com
Subject: Re: [PATCH] KVM: arm64: Reject guest_memfd memslots when the VM has
 MTE
Message-ID: <alY2e8bfsMDyI2QZ@raptor>
References: <20260714110756.116950-1-alexandru.elisei@arm.com>
 <CA+EHjTxFAqO38zZNTM5oQ26X7eUcu3ggfhMY2gn2bB4sMbOxoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTxFAqO38zZNTM5oQ26X7eUcu3ggfhMY2gn2bB4sMbOxoQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_061550_728343_6C8A705B 
X-CRM114-Status: GOOD (  44.34  )
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

Hi Fuad,

On Tue, Jul 14, 2026 at 12:44:57PM +0100, Fuad Tabba wrote:
> Hi Alex,
> 
> On Tue, 14 Jul 2026 at 12:08, Alexandru Elisei <alexandru.elisei@arm.com> wrote:
> >
> > The user cannot use MTE on VMAs created by mapping a guest_memfd file,
> > as arch_calc_vm_flag_bits() does not set VM_MTE_ALLOWED.
> >
> > When creating a guest_memfd backed memslot,
> > kvm_arch_prepare_memory_region() rejects the memslot if MTE is enabled for
> > the VM and if guest_memfd has been mapped in a VMA that intersects the
> > memslot.
> >
> > However, the documentation for KVM_SET_USER_MEMORY_REGION2 explicitly
> 
> nit: s/explicitely/explicitly/

I think that's what I wrote :)

> 
> > states that the only condition for userspace_addr is for it to be a legal
> > userspace address, but the mapping is not required to be valid nor
> > populated at memslot creation.
> >
> > If userspace sets userspace_addr to an address that hasn't been mapped, or
> > if userspace_addr belongs to a VMA that isn't backed by the guest_memfd
> > file, or if the VMA doesn't intersect the memslot, memslot creation is
> > successful and KVM ends up with a VM with MTE and guest_memfd-backed
> > memslots.
> >
> > Forbid guest_memfd memslots unconditionally when the VM has MTE to prevent
> > this from happening.
> >
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> 
> Is this worth a Fixes: tag?

Fixes: 32e200bd6e44 ("KVM: arm64: Enable support for guest_memfd backed memory")

?

> 
> > ---
> 
> git am chokes here: this kvmtool snippet between '---' and the real
> diff parses as a stray patch fragment ("patch fragment without
> header"). Worth indenting it or moving it below a scissors line ("--
> >8 --") so the patch applies, though didn't test to see if this
> actually works :)

Indentation worked, thanks.

> 
> >
> > Tested by using Fuad's patches to add guest_memfd support for kvmtool at [1],
> > with the following changes to arm64/kvm.c:
> >
> > @@ -125,10 +125,12 @@ static void kvm__arch_enable_mte(struct kvm *kvm)
> >                 return;
> >         }
> >
> > +       /*
> >         if (kvm->cfg.arch.guest_memfd) {
> >                 pr_debug("MTE is incompatible with guest_memfd");
> >                 return;
> >         }
> > +       */
> >
> >         if (kvm->cfg.arch.mte_disabled) {
> >                 pr_debug("MTE disabled by user");
> >
> > and kvm.c:
> >
> > @@ -332,8 +332,15 @@ int kvm__register_mem(struct kvm *kvm, u64 guest_phys, u64 size,
> >                                 .guest_memfd_offset     = guest_memfd_offset,
> >                         };
> >
> > +                       if (munmap(userspace_addr, size) < 0)
> > +                               die_perror("munmap hack");
> > +
> >                         ret = ioctl(kvm->vm_fd, KVM_SET_USER_MEMORY_REGION2,
> >                                     &mem2);
> > +
> > +                       if (mmap(userspace_addr, size, PROT_RW, MAP_SHARED | MAP_FIXED,
> > +                           guest_memfd, guest_memfd_offset) == MAP_FAILED)
> > +                               die_perror("mmap hack");
> >                 } else {
> >                         struct kvm_userspace_memory_region mem = {
> >                                 .slot                   = slot,
> >
> > (not pasting the full diff because last time I did, git got confused and
> > considered the snippet part of the actual patch).
> >
> > Without this patch, I was able to create a VM with MTE and guest_memfd
> > backed ram (the guest reported MTE as enabled, but I didn't test that it
> > actually worked).
> >
> > With this patch, creating a VM with MTE is rejected.
> >
> > [1] https://lore.kernel.org/kvmarm/20260712142536.1391557-1-fuad.tabba@linux.dev/
> >
> >  arch/arm64/kvm/mmu.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index 6c941aaa10c6..30c2ea235fa5 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -2648,8 +2648,11 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
> >         /*
> >          * Only support guest_memfd backed memslots with mappable memory, since
> >          * there aren't any CoCo VMs that support only private memory on arm64.
> > +        *
> > +        * MTE is also not supported with guest_memfd.
> >          */
> > -       if (kvm_slot_has_gmem(new) && !kvm_memslot_is_gmem_only(new))
> > +       if (kvm_slot_has_gmem(new) &&
> > +           (kvm_has_mte(kvm) || !kvm_memslot_is_gmem_only(new)))
> >                 return -EINVAL;
> 
> This folds two unrelated rejections into one condition. I'd split them
> so each carries its own comment:
> 
>         /* guest_memfd is incompatible with MTE. */
>         if (kvm_slot_has_gmem(new) && kvm_has_mte(kvm))
>             return -EINVAL;
> 
>         /*
>          * Only support guest_memfd backed memslots with mappable memory,
>          * since there aren't any CoCo VMs that support only private memory
>          * on arm64.
>          */
>         if (kvm_slot_has_gmem(new) && !kvm_memslot_is_gmem_only(new))
>             return -EINVAL;
> 

Sure.

> More importantly, this only closes one direction.
> prepare_memory_region() runs on memslot changes, but KVM_CAP_ARM_MTE
> gates only on !kvm->created_vcpus and never looks at memslots, so the
> reverse order still gets you there:
> 
>       1. KVM_SET_USER_MEMORY_REGION2 with a gmem slot   (no MTE yet -> ok)
>       2. KVM_ENABLE_CAP(KVM_CAP_ARM_MTE) (no vCPUs -> ok)
> 

Yes, that's a good point.

> Since the justification is that userspace can do unexpected things,
> the enable-MTE path wants the symmetric check too (reject if a gmem
> memslot already exists), or enforce the invariant at one choke point.

I can iterate through all the memslots and check that none are backed by a
guest_memfd file when userspace enables the MTE capability.

Will wait for a day or two to send v2.

Thanks,
Alex

