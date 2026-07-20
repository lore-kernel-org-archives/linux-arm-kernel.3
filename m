Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08487C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 15:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pR0d5vXJntV8YWpyahhjgINvxifwuEFLOZnHeSDTT1U=; b=vCmCkDxliB1rHTGXzGyYvHEtz7
	n2lr2Jzab2pnpXawNM37zRyHWgxMAvBONERxmiN8CjYlUEBsSKITVwYkgnPRbMQmHjLi9C/1mf1Dm
	70ncie9r+cU64yIj/8YFTVEM3bXBVe0EFL88kvUtAbL3e8+AQt9YnrwPkib8OQP0sE9n93zoE6J5X
	rZHaLy244riND3sSzspHKlURbQbmm+t3KuZyMvdxQUBKJL5ff9tp4YcBOkyI6gTe/polrtt4rX5YA
	Je0ZBONZVvssVCTRUC9OHmTA+gWu/SeqZWCTxF9Goa01GtJ7I0CMf5dxhNGS5O3ADyyF/7QnPsK55
	vbf5+C9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpnl-00000007AKm-2jIo;
	Mon, 20 Jul 2026 15:21:05 +0000
Received: from out-186.mta1.migadu.com ([95.215.58.186])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpni-00000007AJi-1aEf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 15:21:04 +0000
X-Forwarded-Encrypted: i=1; AHgh+RqnDIxwLfEWq06K1nirNN+S4XzZB3w329DVE102cjCnk/lQmfU9iIRT5pCb1uH4ogKQV6Rgx5uUOlcZ8wG4H9ZE@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784560860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pR0d5vXJntV8YWpyahhjgINvxifwuEFLOZnHeSDTT1U=;
	b=GKAcT4/JCyD0s9rFa78u9sh26RI3H22ExFL5Ev+CkroOBsBU8mZTWVxbhVTR3euSyLmtXm
	F6L5/xaIeF6IasjHWtOlnDOXSi7E/laY9Z60K/krTy+vA/cZhOmWHVnv4yuTy2isppQ93i
	hMigT35aTZkbJAbuQPUBA3Dj254f+v8=
X-Gm-Message-State: AOJu0YxCIq+AIusFGlq2kHSExCbxX36pxgjcwPmIUl+6s+pnXpNVxT4s
	gyZe8N0FO1sAAJ3wJWIo6AAKHkp0RqzehTgVd3g8tdSsWtSphku1asZ0S0+kZzZ4/qby/HzDYnh
	WcERE8GA6RZMNJx2CUPhbaJu9BarYKWuIIoKarVxh
X-Received: by 2002:ac8:5a48:0:b0:50f:af60:3496 with SMTP id
 d75a77b69052e-525ffcd074bmr2357411cf.1.1784560848685; Mon, 20 Jul 2026
 08:20:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260720130942.135033-1-alexandru.elisei@arm.com>
In-Reply-To: <20260720130942.135033-1-alexandru.elisei@arm.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 20 Jul 2026 16:20:11 +0100
X-Gmail-Original-Message-ID: <CA+EHjTy90Y3mcjmWMVq0exDv+BL_ZywXS9ppab4mse8aTcprnQ@mail.gmail.com>
X-Gm-Features: AUfX_myRYMnudEm8zTjDOi3Lb7snKdugWnRSZfDpepQBEheVH7jJ17hpyI4P3QY
Message-ID: <CA+EHjTy90Y3mcjmWMVq0exDv+BL_ZywXS9ppab4mse8aTcprnQ@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: arm64: Reject guest_memfd memslots when the VM
 has MTE
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	catalin.marinas@arm.com, will@kernel.org, steven.price@arm.com
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_082102_561626_6B7A591F 
X-CRM114-Status: GOOD (  37.50  )
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

On Mon, 20 Jul 2026 at 14:10, Alexandru Elisei <alexandru.elisei@arm.com> wrote:
>
> The user cannot use MTE on VMAs created by mapping a guest_memfd file,
> as arch_calc_vm_flag_bits() does not set VM_MTE_ALLOWED.
>
> When creating a guest_memfd backed memslot,
> kvm_arch_prepare_memory_region() rejects the memslot if MTE is enabled for
> the VM and if guest_memfd has been mapped in a VMA that intersects the
> memslot.
>
> However, the documentation for KVM_SET_USER_MEMORY_REGION2 explicitly
> states that the only condition for userspace_addr is for it to be a legal
> userspace address, but the mapping is not required to be valid nor
> populated at memslot creation.
>
> If userspace sets userspace_addr to an address that hasn't been mapped, or
> if userspace_addr belongs to a VMA that isn't backed by the guest_memfd
> file, or if the VMA doesn't intersect the memslot, memslot creation is
> successful and KVM ends up with a VM with MTE and guest_memfd-backed
> memslots.
>
> The same happens if the order is reversed: when userspace enables MTE, KVM
> does not check if memslots backed by guest_memfd are already present.
>
> Fix both issues by rejecting guest_memfd-backed memslots when MTE is
> enabled, and by reject MTE when guest_memfd-backed memslots are already
> present.
>
> Fixes: 32e200bd6e44 ("KVM: arm64: Enable support for guest_memfd backed memory")
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba < fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
>
> v1 can be found at [1].
>
> Changes in v2:
>
> * Added the Fixes tag (Fuad)
> * Split the condition in kvm_arch_prepare_memory_region() (Fuad)
> * Added the check in kvm_vm_ioctl_enable_cap() (Fuad)
>
> Tested by using Fuad's patches to add guest_memfd support for kvmtool at [2],
> with the following changes:
>
>         diff --git a/arm64/kvm.c b/arm64/kvm.c
>         index 36b3284e4a92..de83b5d7e517 100644
>         --- a/arm64/kvm.c
>         +++ b/arm64/kvm.c
>         @@ -125,10 +125,12 @@ static void kvm__arch_enable_mte(struct kvm *kvm)
>                         return;
>                 }
>
>         +       /*
>                 if (kvm->cfg.arch.guest_memfd) {
>                         pr_debug("MTE is incompatible with guest_memfd");
>                         return;
>                 }
>         +       */
>
>                 if (kvm->cfg.arch.mte_disabled) {
>                         pr_debug("MTE disabled by user");
>         diff --git a/kvm.c b/kvm.c
>         index 96583f916442..cc8628b558ea 100644
>         --- a/kvm.c
>         +++ b/kvm.c
>         @@ -332,8 +332,15 @@ int kvm__register_mem(struct kvm *kvm, u64 guest_phys, u64 size,
>                                         .guest_memfd_offset     = guest_memfd_offset,
>                                 };
>
>         +                       if (munmap(userspace_addr, size) < 0)
>         +                               die_perror("munmap hack");
>         +
>                                 ret = ioctl(kvm->vm_fd, KVM_SET_USER_MEMORY_REGION2,
>                                             &mem2);
>         +
>         +                       if (mmap(userspace_addr, size, PROT_RW, MAP_SHARED | MAP_FIXED,
>         +                           guest_memfd, guest_memfd_offset) == MAP_FAILED)
>         +                               die_perror("mmap hack");
>                         } else {
>                                 struct kvm_userspace_memory_region mem = {
>                                         .slot                   = slot,
>
> (indentation is weird on purpose so git doesn't get confused). That's to
> test that the user can create a guest_memfd memslot after MTE has been
> enabled for the VM. Without this patch, I was able to create a VM with MTE
> and guest_memfd backed ram (the guest reported MTE as enabled, but I didn't
> test that it actually worked). With this patch, creating a VM with MTE is
> rejected.
>
> To test that KVM rejects enabling MTE *after* creating a guest_memfd backed
> memslot, I modified kvmtool to enable MTE *after* creating the memslot.
> Same situation: without this patch, KVM allows that, with this patch, KVM
> rejects enabling MTE.
>
> [1] https://lore.kernel.org/kvmarm/20260714110756.116950-1-alexandru.elisei@arm.com/
> [2] https://lore.kernel.org/kvmarm/20260712142536.1391557-1-fuad.tabba@linux.dev/
>
>  arch/arm64/kvm/arm.c | 25 +++++++++++++++++++------
>  arch/arm64/kvm/mmu.c |  4 ++++
>  2 files changed, 23 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 50adfff75be8..9a6c72a18672 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -149,14 +149,27 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
>                 set_bit(KVM_ARCH_FLAG_RETURN_NISV_IO_ABORT_TO_USER,
>                         &kvm->arch.flags);
>                 break;
> -       case KVM_CAP_ARM_MTE:
> -               mutex_lock(&kvm->lock);
> -               if (system_supports_mte() && !kvm->created_vcpus) {
> -                       r = 0;
> -                       set_bit(KVM_ARCH_FLAG_MTE_ENABLED, &kvm->arch.flags);
> +       case KVM_CAP_ARM_MTE: {
> +               struct kvm_memory_slot *memslot;
> +               int bkt;
> +
> +               guard(mutex)(&kvm->lock);
> +               if (!system_supports_mte() || kvm->created_vcpus)
> +                       break;
> +
> +               r = 0;
> +               guard(mutex)(&kvm->slots_lock);
> +               kvm_for_each_memslot(memslot, bkt, kvm_memslots(kvm)) {
> +                       if (kvm_slot_has_gmem(memslot)) {
> +                               r = -EINVAL;
> +                               break;
> +                       }
>                 }
> -               mutex_unlock(&kvm->lock);
> +               if (r == 0)
> +                       set_bit(KVM_ARCH_FLAG_MTE_ENABLED, &kvm->arch.flags);
>                 break;
> +
> +       }
>         case KVM_CAP_ARM_SYSTEM_SUSPEND:
>                 r = 0;
>                 set_bit(KVM_ARCH_FLAG_SYSTEM_SUSPEND_ENABLED, &kvm->arch.flags);
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 6c941aaa10c6..2d95203386ba 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -2652,6 +2652,10 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>         if (kvm_slot_has_gmem(new) && !kvm_memslot_is_gmem_only(new))
>                 return -EINVAL;
>
> +       /* guest_memfd is incompatible with MTE. */
> +       if (kvm_slot_has_gmem(new) && kvm_has_mte(kvm))
> +               return -EINVAL;
> +
>         hva = new->userspace_addr;
>         reg_end = hva + (new->npages << PAGE_SHIFT);
>
>
> base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
> --
> 2.55.0
>

