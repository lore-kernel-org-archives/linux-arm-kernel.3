Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D132FD8764
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 12:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqdhsZMms3Hyv+l4q3AGibpbsTitIRWecBmHePuTWJ8=; b=bcutpua3/5KXqAQWQMqf8LwPg1
	TvYZyymwtz46lxFD/AVfOe4MPyegBnROjThiP5pYclLHpvwL9cxXkmCNWl7ntUY4EHdEiJBOA0JpS
	nunZB4II7uYXqbK7vU3pnbXDxKXEAOIh/tW/pthvbmwFqaw8cjzhUbA8sjJJLKPftLxn2A2f8QHl/
	kTpPZEH12l22BR/9HQlaZC/IXfVAnbkyJRkt7IjpgKPAGhM9sKBLgv1hkIAhzA9l9eOJnsnL+73Qj
	VfBZAkEGB0hnFlEg5JgmLdwTyup8RorsBlb7lk14W6cJUpJViTmL6YZiratvjK+9FR1VAhDjSgeZP
	n4/hyGzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TuE-00000006Ko3-3GBy;
	Tue, 17 Mar 2026 12:52:18 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TuC-00000006Kna-2GKe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 12:52:17 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-50906a98ffeso602211cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 05:52:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773751935; cv=none;
        d=google.com; s=arc-20240605;
        b=OZ75JlPvsdlmfjbx17K3nOaA5kL7BQvo8dyxjzBWi+mXTM0GY5rRXq/nhCW/r1U3Jk
         Wle1lf+4FeODJWJ8z0nnrwJc6gtAyaNHwasnHACHFFEqXN2Y47HMZzVfllRO6saKMH28
         yqi6l0kC+l73GFeBI1S8c1Bo3pLOZPp029wyhFyMS1/XV0pfcMQqAsqoqL9eUu+sDsFh
         DWraHReFG1toNBZBFnI4MNo7nQMgolSi6Vss7m0Gbr5E77LCR3sTAuzIUWpVbrMIk2Zf
         j2WAKabyTjwXtoNK64s06hI2s+WgTG1IWkvctPOHZ5KqjupgD7AdoZ6CEtQb0f+Ec/Mc
         VwIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yqdhsZMms3Hyv+l4q3AGibpbsTitIRWecBmHePuTWJ8=;
        fh=YM5jjOdURCpVdAvp6vjcyRUpNJJIYjVHDg7mtOAWu48=;
        b=lrAcGVa23pZtjNMuzmK2RjrQ4P0BGmbbRMLJB0+/VZxTn7STQQepFL4cLXXm/vEiZD
         yAiDgPHTKJ4Xzd5iwVe7Bs8n9JMc+tHQCwLqPjyTwBUXqk8yPNTFZl+8Uw09gw+Q9poJ
         bNZRSZ73N96PtHyBh5mMmovvgjbjfkSv4wllKSpjCbb5j3d4KvCwJnWt4mX9gSlYdby7
         2D9f1Fl4S27oyPkyr6mzEog7xjIeGrXzyZmlXCgqZCR8N2FhaScGhBabGaSVOEIIL3Ac
         LVjCgSwpxlG3pjwIEdyagzoXlbkgAlV52NNqFv4bYbm1U7yAJxn21MpbovXJkPuQlRs1
         GQfA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773751935; x=1774356735; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yqdhsZMms3Hyv+l4q3AGibpbsTitIRWecBmHePuTWJ8=;
        b=RNFPwu1yw8/3ASsLd1TBAS9XC8MDJY4CsiMetTX7U2fTfcWx6c4+esZK2Kkxu+2etJ
         S/oOgeYsPK31jpLraSoBKSRoXYb6kg8dYiDQXlKL5b5v8AM+inPsoAP0iHraXQcfo8Lc
         Wdm2LuZQWsPc0hwjvYLeAn9uwwaUnwJuCSwvLPCobpx3sCEP2ELreBR4OHRMyGTSTWkv
         2zdyUVxm08yoP3OJO2SZwfyBKLWB8Uv4N+s9SdJoNq9Ob4uFzmlVEMYYo7wqSPCp9pCz
         /p98WtJbPVfdrk6zl3M1b0Qs271MsjkDKYsfphg598vvQvVT36nzWjysBseLw1UhJ5cN
         9jrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773751935; x=1774356735;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqdhsZMms3Hyv+l4q3AGibpbsTitIRWecBmHePuTWJ8=;
        b=NWAFA6H/BsidkChsokrZVQOMZCk3GjcmrWoShVlgxT9LCrm46rp2V9oG+lHy6EBHb1
         7iyurZ5SGCuTRZitqDrY8vPflAykcDO5LPumJsRC0iwL1yXDgIidZhe8HijFFiIIVMHY
         Cebo7wgqDhxFNktJKXSRL227/m/Je7TUgPjhNZpXcZtn1uU4tOKMQ6LwGsE5jufa+q/1
         UNnpSxosEooVUR1pVQJtwdgSsxW8QEsEeEjWCYBMoiqHaBvcmBtKEY9fkbKxZILAKxVu
         OpcLKjWMaONDMDtMBgQoZ15d81qzYXLLPcPgFZBSXUUJw3FwuvT608Oz+Kjza6lqZAVF
         gt7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtRpZppFugbx2ua4Kvg82wmZoG66vgN7F1UKFkC/BkdVTxCW0iwC7XL1gKRZhVHGL77DspuFzDIjYk5SKevtcd@lists.infradead.org
X-Gm-Message-State: AOJu0YwID4LLLdf7HM/4HD6pRyaH4NiUfO21QdlweZtxOdFSnwoXYojA
	XQD97CsYK3v96L9btrF4i9WdLfVYLuYUZYteUx8Dng82EPCzyEiXniHrFuBkxRD+d1ECs7IXdL9
	laiX3Ut5Z+fEIveBseqz3t3lGgyzDjl2iSxNn9Ou2
X-Gm-Gg: ATEYQzwntfqrcMQtregR+UACzhDCQwdx/bcphydullH5QBji+2lPEom0lr+u5UXD2ur
	yX7dwUfOKpfQq1D/J1K7nwYk6z8zLiZBt4gpv7CzjczgVDLnSXkJU1Vm5oWvtnUd38zuvkDg0Zt
	GfEzLTQjQ2BstgpaGbTxiLgQ+68cdFfnfcPihnzEeCeleSPvyLaJfMO0NRJyI5RAyqj9ID6mjY8
	5EO0KvTugVeTiqp7tI0iJwsLdB7BumR2/NuETZYbwGL7f+wMNtOA5IVKJQYTlPNqOQn1USM8voJ
	JxfJjYk88GxkfeUqnqywUHuYPI1sponckliIP6YJA3pSrK4=
X-Received: by 2002:a05:622a:34f:b0:509:1cf9:ea11 with SMTP id
 d75a77b69052e-5099ae36e43mr13321661cf.7.1773751934515; Tue, 17 Mar 2026
 05:52:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260316175451.1866175-1-maz@kernel.org> <20260316175451.1866175-10-maz@kernel.org>
In-Reply-To: <20260316175451.1866175-10-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Mar 2026 12:51:37 +0000
X-Gm-Features: AaiRm50Du2xrfQCZBL5z6Chj3KUwzQGCZZeT5SEq7dCMJNMiEDXSdkpbqldTIWo
Message-ID: <CA+EHjTykfSjBQVpL5KPANzF7tvWCFiCkZUk2oTfQjgT8E7d5AQ@mail.gmail.com>
Subject: Re: [PATCH 09/17] KVM: arm64: Move VMA-related information to kvm_s2_fault_vma_info
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_055216_653884_1D91C660 
X-CRM114-Status: GOOD (  32.78  )
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

On Mon, 16 Mar 2026 at 17:55, Marc Zyngier <maz@kernel.org> wrote:
>
> Mecanically extract a bunch of VMA-related fields from kvm_s2_fault
> and move them to a new kvm_s2_fault_vma_info structure.
>
> This is not much, but it already allows us to define which functions
> can update this structure, and which ones are pure consumers of the
> data. Those in the latter camp are updated to take a const pointer
> to that structure.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

I really like how, with this patch, we now distinguish between
vma_pagesize and mapping_size. Less chance for bugs or confusion.

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/mmu.c | 113 +++++++++++++++++++++++--------------------
>  1 file changed, 61 insertions(+), 52 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index abe239752c696..a5b0dd41560f6 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1710,20 +1710,23 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
>         return vma_shift;
>  }
>
> +struct kvm_s2_fault_vma_info {
> +       unsigned long   mmu_seq;
> +       long            vma_pagesize;
> +       vm_flags_t      vm_flags;
> +       gfn_t           gfn;
> +       bool            mte_allowed;
> +       bool            is_vma_cacheable;
> +};
> +
>  struct kvm_s2_fault {
>         bool writable;
> -       bool mte_allowed;
> -       bool is_vma_cacheable;
>         bool s2_force_noncacheable;
> -       unsigned long mmu_seq;
> -       gfn_t gfn;
>         kvm_pfn_t pfn;
>         bool logging_active;
>         bool force_pte;
> -       long vma_pagesize;
>         enum kvm_pgtable_prot prot;
>         struct page *page;
> -       vm_flags_t vm_flags;
>  };
>
>  static bool kvm_s2_fault_is_perm(const struct kvm_s2_fault_desc *s2fd)
> @@ -1732,7 +1735,8 @@ static bool kvm_s2_fault_is_perm(const struct kvm_s2_fault_desc *s2fd)
>  }
>
>  static int kvm_s2_fault_get_vma_info(const struct kvm_s2_fault_desc *s2fd,
> -                                    struct kvm_s2_fault *fault)
> +                                    struct kvm_s2_fault *fault,
> +                                    struct kvm_s2_fault_vma_info *s2vi)
>  {
>         struct vm_area_struct *vma;
>         struct kvm *kvm = s2fd->vcpu->kvm;
> @@ -1745,20 +1749,20 @@ static int kvm_s2_fault_get_vma_info(const struct kvm_s2_fault_desc *s2fd,
>                 return -EFAULT;
>         }
>
> -       fault->vma_pagesize = BIT(kvm_s2_resolve_vma_size(s2fd, vma, &fault->force_pte));
> +       s2vi->vma_pagesize = BIT(kvm_s2_resolve_vma_size(s2fd, vma, &fault->force_pte));
>
>         /*
>          * Both the canonical IPA and fault IPA must be aligned to the
>          * mapping size to ensure we find the right PFN and lay down the
>          * mapping in the right place.
>          */
> -       fault->gfn = ALIGN_DOWN(s2fd->fault_ipa, fault->vma_pagesize) >> PAGE_SHIFT;
> +       s2vi->gfn = ALIGN_DOWN(s2fd->fault_ipa, s2vi->vma_pagesize) >> PAGE_SHIFT;
>
> -       fault->mte_allowed = kvm_vma_mte_allowed(vma);
> +       s2vi->mte_allowed = kvm_vma_mte_allowed(vma);
>
> -       fault->vm_flags = vma->vm_flags;
> +       s2vi->vm_flags = vma->vm_flags;
>
> -       fault->is_vma_cacheable = kvm_vma_is_cacheable(vma);
> +       s2vi->is_vma_cacheable = kvm_vma_is_cacheable(vma);
>
>         /*
>          * Read mmu_invalidate_seq so that KVM can detect if the results of
> @@ -1768,39 +1772,40 @@ static int kvm_s2_fault_get_vma_info(const struct kvm_s2_fault_desc *s2fd,
>          * Rely on mmap_read_unlock() for an implicit smp_rmb(), which pairs
>          * with the smp_wmb() in kvm_mmu_invalidate_end().
>          */
> -       fault->mmu_seq = kvm->mmu_invalidate_seq;
> +       s2vi->mmu_seq = kvm->mmu_invalidate_seq;
>         mmap_read_unlock(current->mm);
>
>         return 0;
>  }
>
>  static gfn_t get_canonical_gfn(const struct kvm_s2_fault_desc *s2fd,
> -                              const struct kvm_s2_fault *fault)
> +                              const struct kvm_s2_fault_vma_info *s2vi)
>  {
>         phys_addr_t ipa;
>
>         if (!s2fd->nested)
> -               return fault->gfn;
> +               return s2vi->gfn;
>
>         ipa = kvm_s2_trans_output(s2fd->nested);
> -       return ALIGN_DOWN(ipa, fault->vma_pagesize) >> PAGE_SHIFT;
> +       return ALIGN_DOWN(ipa, s2vi->vma_pagesize) >> PAGE_SHIFT;
>  }
>
>  static int kvm_s2_fault_pin_pfn(const struct kvm_s2_fault_desc *s2fd,
> -                               struct kvm_s2_fault *fault)
> +                               struct kvm_s2_fault *fault,
> +                               struct kvm_s2_fault_vma_info *s2vi)
>  {
>         int ret;
>
> -       ret = kvm_s2_fault_get_vma_info(s2fd, fault);
> +       ret = kvm_s2_fault_get_vma_info(s2fd, fault, s2vi);
>         if (ret)
>                 return ret;
>
> -       fault->pfn = __kvm_faultin_pfn(s2fd->memslot, get_canonical_gfn(s2fd, fault),
> +       fault->pfn = __kvm_faultin_pfn(s2fd->memslot, get_canonical_gfn(s2fd, s2vi),
>                                        kvm_is_write_fault(s2fd->vcpu) ? FOLL_WRITE : 0,
>                                        &fault->writable, &fault->page);
>         if (unlikely(is_error_noslot_pfn(fault->pfn))) {
>                 if (fault->pfn == KVM_PFN_ERR_HWPOISON) {
> -                       kvm_send_hwpoison_signal(s2fd->hva, __ffs(fault->vma_pagesize));
> +                       kvm_send_hwpoison_signal(s2fd->hva, __ffs(s2vi->vma_pagesize));
>                         return 0;
>                 }
>                 return -EFAULT;
> @@ -1810,7 +1815,8 @@ static int kvm_s2_fault_pin_pfn(const struct kvm_s2_fault_desc *s2fd,
>  }
>
>  static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
> -                                    struct kvm_s2_fault *fault)
> +                                    struct kvm_s2_fault *fault,
> +                                    const struct kvm_s2_fault_vma_info *s2vi)
>  {
>         struct kvm *kvm = s2fd->vcpu->kvm;
>
> @@ -1818,8 +1824,8 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
>          * Check if this is non-struct page memory PFN, and cannot support
>          * CMOs. It could potentially be unsafe to access as cacheable.
>          */
> -       if (fault->vm_flags & (VM_PFNMAP | VM_MIXEDMAP) && !pfn_is_map_memory(fault->pfn)) {
> -               if (fault->is_vma_cacheable) {
> +       if (s2vi->vm_flags & (VM_PFNMAP | VM_MIXEDMAP) && !pfn_is_map_memory(fault->pfn)) {
> +               if (s2vi->is_vma_cacheable) {
>                         /*
>                          * Whilst the VMA owner expects cacheable mapping to this
>                          * PFN, hardware also has to support the FWB and CACHE DIC
> @@ -1879,7 +1885,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
>                 fault->prot |= KVM_PGTABLE_PROT_X;
>
>         if (fault->s2_force_noncacheable)
> -               fault->prot |= (fault->vm_flags & VM_ALLOW_ANY_UNCACHED) ?
> +               fault->prot |= (s2vi->vm_flags & VM_ALLOW_ANY_UNCACHED) ?
>                                KVM_PGTABLE_PROT_NORMAL_NC : KVM_PGTABLE_PROT_DEVICE;
>         else if (cpus_have_final_cap(ARM64_HAS_CACHE_DIC))
>                 fault->prot |= KVM_PGTABLE_PROT_X;
> @@ -1889,74 +1895,73 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
>
>         if (!kvm_s2_fault_is_perm(s2fd) && !fault->s2_force_noncacheable && kvm_has_mte(kvm)) {
>                 /* Check the VMM hasn't introduced a new disallowed VMA */
> -               if (!fault->mte_allowed)
> +               if (!s2vi->mte_allowed)
>                         return -EFAULT;
>         }
>
>         return 0;
>  }
>
> -static phys_addr_t get_ipa(const struct kvm_s2_fault *fault)
> -{
> -       return gfn_to_gpa(fault->gfn);
> -}
> -
>  static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
> -                           struct kvm_s2_fault *fault, void *memcache)
> +                           struct kvm_s2_fault *fault,
> +                           const struct kvm_s2_fault_vma_info *s2vi, void *memcache)
>  {
> +       enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
>         struct kvm *kvm = s2fd->vcpu->kvm;
>         struct kvm_pgtable *pgt;
>         long perm_fault_granule;
> +       long mapping_size;
> +       gfn_t gfn;
>         int ret;
> -       enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
>
>         kvm_fault_lock(kvm);
>         pgt = s2fd->vcpu->arch.hw_mmu->pgt;
>         ret = -EAGAIN;
> -       if (mmu_invalidate_retry(kvm, fault->mmu_seq))
> +       if (mmu_invalidate_retry(kvm, s2vi->mmu_seq))
>                 goto out_unlock;
>
>         perm_fault_granule = (kvm_s2_fault_is_perm(s2fd) ?
>                               kvm_vcpu_trap_get_perm_fault_granule(s2fd->vcpu) : 0);
> +       mapping_size = s2vi->vma_pagesize;
> +       gfn = s2vi->gfn;
>
>         /*
>          * If we are not forced to use fault->page mapping, check if we are
>          * backed by a THP and thus use block mapping if possible.
>          */
> -       if (fault->vma_pagesize == PAGE_SIZE &&
> +       if (mapping_size == PAGE_SIZE &&
>             !(fault->force_pte || fault->s2_force_noncacheable)) {
>                 if (perm_fault_granule > PAGE_SIZE) {
> -                       fault->vma_pagesize = perm_fault_granule;
> +                       mapping_size = perm_fault_granule;
>                 } else {
> -                       fault->vma_pagesize = transparent_hugepage_adjust(kvm, s2fd->memslot,
> -                                                                         s2fd->hva, &fault->pfn,
> -                                                                         &fault->gfn);
> -
> -                       if (fault->vma_pagesize < 0) {
> -                               ret = fault->vma_pagesize;
> +                       mapping_size = transparent_hugepage_adjust(kvm, s2fd->memslot,
> +                                                                  s2fd->hva, &fault->pfn,
> +                                                                  &gfn);
> +                       if (mapping_size < 0) {
> +                               ret = mapping_size;
>                                 goto out_unlock;
>                         }
>                 }
>         }
>
>         if (!perm_fault_granule && !fault->s2_force_noncacheable && kvm_has_mte(kvm))
> -               sanitise_mte_tags(kvm, fault->pfn, fault->vma_pagesize);
> +               sanitise_mte_tags(kvm, fault->pfn, mapping_size);
>
>         /*
>          * Under the premise of getting a FSC_PERM fault, we just need to relax
> -        * permissions only if vma_pagesize equals perm_fault_granule. Otherwise,
> +        * permissions only if mapping_size equals perm_fault_granule. Otherwise,
>          * kvm_pgtable_stage2_map() should be called to change block size.
>          */
> -       if (fault->vma_pagesize == perm_fault_granule) {
> +       if (mapping_size == perm_fault_granule) {
>                 /*
>                  * Drop the SW bits in favour of those stored in the
>                  * PTE, which will be preserved.
>                  */
>                 fault->prot &= ~KVM_NV_GUEST_MAP_SZ;
> -               ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, get_ipa(fault),
> +               ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, gfn_to_gpa(gfn),
>                                                                  fault->prot, flags);
>         } else {
> -               ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, get_ipa(fault), fault->vma_pagesize,
> +               ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, gfn_to_gpa(gfn), mapping_size,
>                                                          __pfn_to_phys(fault->pfn), fault->prot,
>                                                          memcache, flags);
>         }
> @@ -1965,9 +1970,12 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>         kvm_release_faultin_page(kvm, fault->page, !!ret, fault->writable);
>         kvm_fault_unlock(kvm);
>
> -       /* Mark the fault->page dirty only if the fault is handled successfully */
> -       if (fault->writable && !ret)
> -               mark_page_dirty_in_slot(kvm, s2fd->memslot, get_canonical_gfn(s2fd, fault));
> +       /* Mark the page dirty only if the fault is handled successfully */
> +       if (fault->writable && !ret) {
> +               phys_addr_t ipa = gfn_to_gpa(get_canonical_gfn(s2fd, s2vi));
> +               ipa &= ~(mapping_size - 1);
> +               mark_page_dirty_in_slot(kvm, s2fd->memslot, gpa_to_gfn(ipa));
> +       }
>
>         if (ret != -EAGAIN)
>                 return ret;
> @@ -1978,6 +1986,7 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>  {
>         bool perm_fault = kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
>         bool logging_active = memslot_is_logging(s2fd->memslot);
> +       struct kvm_s2_fault_vma_info s2vi = {};
>         struct kvm_s2_fault fault = {
>                 .logging_active = logging_active,
>                 .force_pte = logging_active,
> @@ -2002,17 +2011,17 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>          * Let's check if we will get back a huge fault->page backed by hugetlbfs, or
>          * get block mapping for device MMIO region.
>          */
> -       ret = kvm_s2_fault_pin_pfn(s2fd, &fault);
> +       ret = kvm_s2_fault_pin_pfn(s2fd, &fault, &s2vi);
>         if (ret != 1)
>                 return ret;
>
> -       ret = kvm_s2_fault_compute_prot(s2fd, &fault);
> +       ret = kvm_s2_fault_compute_prot(s2fd, &fault, &s2vi);
>         if (ret) {
>                 kvm_release_page_unused(fault.page);
>                 return ret;
>         }
>
> -       return kvm_s2_fault_map(s2fd, &fault, memcache);
> +       return kvm_s2_fault_map(s2fd, &fault, &s2vi, memcache);
>  }
>
>  /* Resolve the access fault by making the page young again. */
> --
> 2.47.3
>

