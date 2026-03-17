Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E66FD7072
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 10:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6z2QesgUHrW6ujbflxaKSakZAZnvUy6jDbI7p8UXByU=; b=Saj0lSBlzW4gwGqMN6gZXuCD00
	mjDOP2nOW7kX+3Ss2oZ+/6gK54LPXO7vKcTU65O60tS2yF+MmyfQG8Rmn3MWwpKklk+Kb0vmeOXhI
	IRYKzwJzOv1WFC+lzGvJpUMNkRvlwCvrITUJuVF0+IvFLExVyNi4HM5XdECaQjuU+rtNPKX10jr8w
	nLdO/fwigu8y9+eu7VNkAQploMAjkm0Y2NUxgzm2KGr8immXqy9Eyz9rf46KV0C2nnIqz5FFO/J4m
	0UiSDpmIvQG5f3A9KhOCvm4buuENLohLcQDq0KCIb9x54u4rnlu0bHd3yAajduMeT7d6wJ0AtCC65
	kcv7WHXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Re9-000000061BZ-2B5R;
	Tue, 17 Mar 2026 10:27:33 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Re6-000000061Ak-2I5o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 10:27:31 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-50906a98ffeso534321cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 03:27:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773743249; cv=none;
        d=google.com; s=arc-20240605;
        b=k7YyobyP2BKhZqf1Vma9P5AeX8s6aHYVKREewW4dsmGZOdg2jvmh4TFyTAfiuk+o9R
         uXpypzfvg2HHDUGO275BMnMpYnHGk9C86zZZQcQWU6sSHUg8vj87K5cw1d2YS0O4jukG
         n/hJ2k7XLUhranfEEVdGgFGIB/NFib/IJAoJToGccEAabqCfCX9k5nVwEv1iC6RsyUOi
         lxsfGVBHrqiT+Vo25CnNMOHmRirDfBeKLnGWZGsAPoqzMrww8q78j0UevmSdgSDCevOC
         +0r+1P7DaVobmMyIKggLlp102ebBRFZtic/PBSjytuFKwFMIqL+Lw1E2r1rpiTtQ4VVH
         YkLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6z2QesgUHrW6ujbflxaKSakZAZnvUy6jDbI7p8UXByU=;
        fh=hqbr6sHa3N7/Ov2j4LlAImeZLkfZeWctzKZJENTw/nk=;
        b=UiArLGKu0lgcdubFniploEh4i95NXxKN6h/G9mXr+jKWi8UYUmK7lfHHsnCBn6cw0R
         hLFAqQbzEKYKGDnX/vww0Fy7uxhknlMczcSB6NzX274tbH6dSIYmzmaOwzVePqd+MZjX
         yTdFsjJE9W9anpMzbYZyeZ4JJ4WX3oRzVM4vXD7B581IqoFMk+mj5On/ER7QUSp1v6sI
         2HJuylrep3VSya3c9m2a84/42sB66XLZb9GklelMfljsvn2EGiGTYartlwzqT9D31gM7
         kapruydeNuYkXV1Vr8r9Z7N/UD7ue2r3FyPoUCT/F2DZDgQqtLcSa0avWV6YKOL5+Poa
         pAkQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773743249; x=1774348049; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6z2QesgUHrW6ujbflxaKSakZAZnvUy6jDbI7p8UXByU=;
        b=Jv7Frb74zSsIQ1Cuq9Z83aBHWibRYk1q5JwGIQqTBWA+lnHV6oZ6YwxCeIGMtudUWs
         gJzbgDx6OoIwjzZrwIMASWVirc+03xSm7iuNBH1KnXOWXoLRxz8zMDqobs6V3PgaBDqa
         s9xCNIJLiSjcFQZHjpiZemuFPOlQmp1iuJDQFEeZ8ZEgBpIwPCFfE9raaOqMO4ZFfGes
         EweM8zWswU7Sg7P824edaS8wuGcigf/0jLe4B4oLA9yzescen7YaKb0TiFcbZzISBWnW
         eM8KvPSxRJYzXGOemHAXHHcnaQz8NYcosSNy9IxmAj6I+Yty2CwyrXP5cxNrJzsM3tnD
         o0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773743249; x=1774348049;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6z2QesgUHrW6ujbflxaKSakZAZnvUy6jDbI7p8UXByU=;
        b=Vm64jV77dZ5B5amQssnsc7Jr4hL9qOIcplhbWPDO8A8S1SPEeFjnEMPY0PamZcHrsV
         35gT2rwPCliIDtPI8FC55Fp7Z53unmV8EtoKseCOzcYpRX/QOHD6Ye0C2SSf300t83h6
         z/aS4x3OTP2NUw1JlpiNYyHBZOisMOYOaj8A+bMMA6sA0FIchHpsa8JXVpHAjvwvbzDM
         A8pNQIETNuwL7jJZ0IC3O1CcCNI6ZE6OrLpMzwOKLciOE8JH0JQBSdhUOx5Tx38O3nNV
         UvGkXfhHXSYRnRb/dErAhM/N9rWekHBIz3ZcU1vNgqMT2xYm1vbe3N//5D8BjFMBT4y7
         wlRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXq12b1vBet54iOamkoHbNjn7rETHvk0JP5qJRf4IXOWh0uv0fH+VOAkvFJULkvQP37s8/irD75h5Qrrfc29Zwr@lists.infradead.org
X-Gm-Message-State: AOJu0YycPsaViJim5DB8/UxA1OfCAUYLvwKeAOwYrKEgM1dSpZ/ALd65
	kiDmVRxWcDRpmUsi/cUnE+K9Vf8cossvi1o7pSGKxEpMhxSyZxH0dSIKvuEOQzbsOT5E/wts0s2
	3HU4iYXw4nfyN+KfgXhNXQs6UdatjHFHVUVrTzHou
X-Gm-Gg: ATEYQzx6uwOVW6Sf1SL0Vz8esVPNVkMHa8QP+6jkyI8gEGMdSUCVPExn23pKwaqWNUP
	QvnvB3U1r2R1IFGhSbpNUyj6kpI0eBcBwqQ8ro+Pks6vVsTegTis2sW+xuyc9s/AY03DRK7lEeo
	whkwwxEbLVAyOpV6+7dmMC/aIMIRuY4AxfpYl6Xwz8sQCwSYrYJgqJy8tIpYsiPvR9kz2IX8Ohd
	mhBGGcPtGyRzbai1nObvGnT6dTbzsdsAIpUuMd0Rq0U+FdCz5bbytWMsPnJ6J4ASPZbnjbm/jaz
	sqagAOeUDUprXa9qL164vhquHSfw8OkC2Iuo
X-Received: by 2002:ac8:57c7:0:b0:501:3b94:bcae with SMTP id
 d75a77b69052e-50998d2b71amr13100431cf.8.1773743248721; Tue, 17 Mar 2026
 03:27:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260316175451.1866175-1-maz@kernel.org> <20260316175451.1866175-4-maz@kernel.org>
In-Reply-To: <20260316175451.1866175-4-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Mar 2026 10:26:51 +0000
X-Gm-Features: AaiRm52HtiPqd9e-rProreG2CqS-RI4t2RwOOd-r6myF45LuqD4GGHks47r9O8I
Message-ID: <CA+EHjTxE1T5TC2EnaUPDF2_wtMi8RgbTntYep8_YQE73x7t1CA@mail.gmail.com>
Subject: Re: [PATCH 03/17] KVM: arm64: Move fault context to const structure
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_032730_658672_02F18981 
X-CRM114-Status: GOOD (  29.23  )
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
> In order to make it clearer what gets updated or not during fault
> handling, move a set of information that losely represents the
> fault context.
>
> This gets populated early, from handle_mem_abort(), and gets passed
> along as a const pointer. user_mem_abort()'s signature is majorly
> improved in doing so, and kvm_s2_fault loses a bunch of fields.
>
> gmem_abort() will get a similar treatment down the line.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/mmu.c | 133 ++++++++++++++++++++++---------------------
>  1 file changed, 69 insertions(+), 64 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index ab8a269d4366d..2a7128b8dd14f 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1640,23 +1640,28 @@ static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>         return ret != -EAGAIN ? ret : 0;
>  }
>
> -static short kvm_s2_resolve_vma_size(struct vm_area_struct *vma,
> -                                    unsigned long hva,
> -                                    struct kvm_memory_slot *memslot,
> -                                    struct kvm_s2_trans *nested,
> -                                    bool *force_pte)
> +struct kvm_s2_fault_desc {
> +       struct kvm_vcpu         *vcpu;
> +       phys_addr_t             fault_ipa;
> +       struct kvm_s2_trans     *nested;
> +       struct kvm_memory_slot  *memslot;
> +       unsigned long           hva;
> +};
> +
> +static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
> +                                    struct vm_area_struct *vma, bool *force_pte)
>  {
>         short vma_shift;
>
>         if (*force_pte)
>                 vma_shift = PAGE_SHIFT;
>         else
> -               vma_shift = get_vma_page_shift(vma, hva);
> +               vma_shift = get_vma_page_shift(vma, s2fd->hva);
>
>         switch (vma_shift) {
>  #ifndef __PAGETABLE_PMD_FOLDED
>         case PUD_SHIFT:
> -               if (fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))
> +               if (fault_supports_stage2_huge_mapping(s2fd->memslot, s2fd->hva, PUD_SIZE))
>                         break;
>                 fallthrough;
>  #endif
> @@ -1664,7 +1669,7 @@ static short kvm_s2_resolve_vma_size(struct vm_area_struct *vma,
>                 vma_shift = PMD_SHIFT;
>                 fallthrough;
>         case PMD_SHIFT:
> -               if (fault_supports_stage2_huge_mapping(memslot, hva, PMD_SIZE))
> +               if (fault_supports_stage2_huge_mapping(s2fd->memslot, s2fd->hva, PMD_SIZE))
>                         break;
>                 fallthrough;
>         case CONT_PTE_SHIFT:
> @@ -1677,7 +1682,7 @@ static short kvm_s2_resolve_vma_size(struct vm_area_struct *vma,
>                 WARN_ONCE(1, "Unknown vma_shift %d", vma_shift);
>         }
>
> -       if (nested) {
> +       if (s2fd->nested) {
>                 unsigned long max_map_size;
>
>                 max_map_size = *force_pte ? PAGE_SIZE : PUD_SIZE;
> @@ -1687,7 +1692,7 @@ static short kvm_s2_resolve_vma_size(struct vm_area_struct *vma,
>                  * can only create a block mapping if the guest stage 2 page
>                  * table uses at least as big a mapping.
>                  */
> -               max_map_size = min(kvm_s2_trans_size(nested), max_map_size);
> +               max_map_size = min(kvm_s2_trans_size(s2fd->nested), max_map_size);
>
>                 /*
>                  * Be careful that if the mapping size falls between
> @@ -1706,11 +1711,6 @@ static short kvm_s2_resolve_vma_size(struct vm_area_struct *vma,
>  }
>
>  struct kvm_s2_fault {
> -       struct kvm_vcpu *vcpu;
> -       phys_addr_t fault_ipa;
> -       struct kvm_s2_trans *nested;
> -       struct kvm_memory_slot *memslot;
> -       unsigned long hva;
>         bool fault_is_perm;
>
>         bool write_fault;
> @@ -1732,28 +1732,28 @@ struct kvm_s2_fault {
>         vm_flags_t vm_flags;
>  };
>
> -static int kvm_s2_fault_get_vma_info(struct kvm_s2_fault *fault)
> +static int kvm_s2_fault_get_vma_info(const struct kvm_s2_fault_desc *s2fd,
> +                                    struct kvm_s2_fault *fault)
>  {
>         struct vm_area_struct *vma;
> -       struct kvm *kvm = fault->vcpu->kvm;
> +       struct kvm *kvm = s2fd->vcpu->kvm;
>
>         mmap_read_lock(current->mm);
> -       vma = vma_lookup(current->mm, fault->hva);
> +       vma = vma_lookup(current->mm, s2fd->hva);
>         if (unlikely(!vma)) {
> -               kvm_err("Failed to find VMA for fault->hva 0x%lx\n", fault->hva);
> +               kvm_err("Failed to find VMA for hva 0x%lx\n", s2fd->hva);
>                 mmap_read_unlock(current->mm);
>                 return -EFAULT;
>         }
>
> -       fault->vma_pagesize = 1UL << kvm_s2_resolve_vma_size(vma, fault->hva, fault->memslot,
> -                                                            fault->nested, &fault->force_pte);
> +       fault->vma_pagesize = BIT(kvm_s2_resolve_vma_size(s2fd, vma, &fault->force_pte));
>
>         /*
>          * Both the canonical IPA and fault IPA must be aligned to the
>          * mapping size to ensure we find the right PFN and lay down the
>          * mapping in the right place.
>          */
> -       fault->gfn = ALIGN_DOWN(fault->fault_ipa, fault->vma_pagesize) >> PAGE_SHIFT;
> +       fault->gfn = ALIGN_DOWN(s2fd->fault_ipa, fault->vma_pagesize) >> PAGE_SHIFT;
>
>         fault->mte_allowed = kvm_vma_mte_allowed(vma);
>
> @@ -1775,31 +1775,33 @@ static int kvm_s2_fault_get_vma_info(struct kvm_s2_fault *fault)
>         return 0;
>  }
>
> -static gfn_t get_canonical_gfn(struct kvm_s2_fault *fault)
> +static gfn_t get_canonical_gfn(const struct kvm_s2_fault_desc *s2fd,
> +                              const struct kvm_s2_fault *fault)
>  {
>         phys_addr_t ipa;
>
> -       if (!fault->nested)
> +       if (!s2fd->nested)
>                 return fault->gfn;
>
> -       ipa = kvm_s2_trans_output(fault->nested);
> +       ipa = kvm_s2_trans_output(s2fd->nested);
>         return ALIGN_DOWN(ipa, fault->vma_pagesize) >> PAGE_SHIFT;
>  }
>
> -static int kvm_s2_fault_pin_pfn(struct kvm_s2_fault *fault)
> +static int kvm_s2_fault_pin_pfn(const struct kvm_s2_fault_desc *s2fd,
> +                               struct kvm_s2_fault *fault)
>  {
>         int ret;
>
> -       ret = kvm_s2_fault_get_vma_info(fault);
> +       ret = kvm_s2_fault_get_vma_info(s2fd, fault);
>         if (ret)
>                 return ret;
>
> -       fault->pfn = __kvm_faultin_pfn(fault->memslot, get_canonical_gfn(fault),
> +       fault->pfn = __kvm_faultin_pfn(s2fd->memslot, get_canonical_gfn(s2fd, fault),
>                                        fault->write_fault ? FOLL_WRITE : 0,
>                                        &fault->writable, &fault->page);
>         if (unlikely(is_error_noslot_pfn(fault->pfn))) {
>                 if (fault->pfn == KVM_PFN_ERR_HWPOISON) {
> -                       kvm_send_hwpoison_signal(fault->hva, __ffs(fault->vma_pagesize));
> +                       kvm_send_hwpoison_signal(s2fd->hva, __ffs(fault->vma_pagesize));
>                         return 0;
>                 }
>                 return -EFAULT;
> @@ -1808,9 +1810,10 @@ static int kvm_s2_fault_pin_pfn(struct kvm_s2_fault *fault)
>         return 1;
>  }
>
> -static int kvm_s2_fault_compute_prot(struct kvm_s2_fault *fault)
> +static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
> +                                    struct kvm_s2_fault *fault)
>  {
> -       struct kvm *kvm = fault->vcpu->kvm;
> +       struct kvm *kvm = s2fd->vcpu->kvm;
>
>         /*
>          * Check if this is non-struct page memory PFN, and cannot support
> @@ -1862,13 +1865,13 @@ static int kvm_s2_fault_compute_prot(struct kvm_s2_fault *fault)
>          * and trigger the exception here. Since the memslot is valid, inject
>          * the fault back to the guest.
>          */
> -       if (esr_fsc_is_excl_atomic_fault(kvm_vcpu_get_esr(fault->vcpu))) {
> -               kvm_inject_dabt_excl_atomic(fault->vcpu, kvm_vcpu_get_hfar(fault->vcpu));
> +       if (esr_fsc_is_excl_atomic_fault(kvm_vcpu_get_esr(s2fd->vcpu))) {
> +               kvm_inject_dabt_excl_atomic(s2fd->vcpu, kvm_vcpu_get_hfar(s2fd->vcpu));
>                 return 1;
>         }
>
> -       if (fault->nested)
> -               adjust_nested_fault_perms(fault->nested, &fault->prot, &fault->writable);
> +       if (s2fd->nested)
> +               adjust_nested_fault_perms(s2fd->nested, &fault->prot, &fault->writable);
>
>         if (fault->writable)
>                 fault->prot |= KVM_PGTABLE_PROT_W;
> @@ -1882,8 +1885,8 @@ static int kvm_s2_fault_compute_prot(struct kvm_s2_fault *fault)
>         else if (cpus_have_final_cap(ARM64_HAS_CACHE_DIC))
>                 fault->prot |= KVM_PGTABLE_PROT_X;
>
> -       if (fault->nested)
> -               adjust_nested_exec_perms(kvm, fault->nested, &fault->prot);
> +       if (s2fd->nested)
> +               adjust_nested_exec_perms(kvm, s2fd->nested, &fault->prot);
>
>         if (!fault->fault_is_perm && !fault->s2_force_noncacheable && kvm_has_mte(kvm)) {
>                 /* Check the VMM hasn't introduced a new disallowed VMA */
> @@ -1899,15 +1902,16 @@ static phys_addr_t get_ipa(const struct kvm_s2_fault *fault)
>         return gfn_to_gpa(fault->gfn);
>  }
>
> -static int kvm_s2_fault_map(struct kvm_s2_fault *fault, void *memcache)
> +static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
> +                           struct kvm_s2_fault *fault, void *memcache)
>  {
> -       struct kvm *kvm = fault->vcpu->kvm;
> +       struct kvm *kvm = s2fd->vcpu->kvm;
>         struct kvm_pgtable *pgt;
>         int ret;
>         enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
>
>         kvm_fault_lock(kvm);
> -       pgt = fault->vcpu->arch.hw_mmu->pgt;
> +       pgt = s2fd->vcpu->arch.hw_mmu->pgt;
>         ret = -EAGAIN;
>         if (mmu_invalidate_retry(kvm, fault->mmu_seq))
>                 goto out_unlock;
> @@ -1921,8 +1925,8 @@ static int kvm_s2_fault_map(struct kvm_s2_fault *fault, void *memcache)
>                 if (fault->fault_is_perm && fault->fault_granule > PAGE_SIZE) {
>                         fault->vma_pagesize = fault->fault_granule;
>                 } else {
> -                       fault->vma_pagesize = transparent_hugepage_adjust(kvm, fault->memslot,
> -                                                                         fault->hva, &fault->pfn,
> +                       fault->vma_pagesize = transparent_hugepage_adjust(kvm, s2fd->memslot,
> +                                                                         s2fd->hva, &fault->pfn,
>                                                                           &fault->gfn);
>
>                         if (fault->vma_pagesize < 0) {
> @@ -1960,34 +1964,27 @@ static int kvm_s2_fault_map(struct kvm_s2_fault *fault, void *memcache)
>
>         /* Mark the fault->page dirty only if the fault is handled successfully */
>         if (fault->writable && !ret)
> -               mark_page_dirty_in_slot(kvm, fault->memslot, get_canonical_gfn(fault));
> +               mark_page_dirty_in_slot(kvm, s2fd->memslot, get_canonical_gfn(s2fd, fault));
>
>         if (ret != -EAGAIN)
>                 return ret;
>         return 0;
>  }
>
> -static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> -                         struct kvm_s2_trans *nested,
> -                         struct kvm_memory_slot *memslot, unsigned long hva,
> -                         bool fault_is_perm)
> +static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>  {
> -       bool write_fault = kvm_is_write_fault(vcpu);
> -       bool logging_active = memslot_is_logging(memslot);
> +       bool perm_fault = kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
> +       bool write_fault = kvm_is_write_fault(s2fd->vcpu);
> +       bool logging_active = memslot_is_logging(s2fd->memslot);
>         struct kvm_s2_fault fault = {
> -               .vcpu = vcpu,
> -               .fault_ipa = fault_ipa,
> -               .nested = nested,
> -               .memslot = memslot,
> -               .hva = hva,
> -               .fault_is_perm = fault_is_perm,
> +               .fault_is_perm = perm_fault,
>                 .logging_active = logging_active,
>                 .force_pte = logging_active,
>                 .prot = KVM_PGTABLE_PROT_R,
> -               .fault_granule = fault_is_perm ? kvm_vcpu_trap_get_perm_fault_granule(vcpu) : 0,
> +               .fault_granule = perm_fault ? kvm_vcpu_trap_get_perm_fault_granule(s2fd->vcpu) : 0,
>                 .write_fault = write_fault,
> -               .exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu),
> -               .topup_memcache = !fault_is_perm || (logging_active && write_fault),
> +               .exec_fault = kvm_vcpu_trap_is_exec_fault(s2fd->vcpu),
> +               .topup_memcache = !perm_fault || (logging_active && write_fault),
>         };
>         void *memcache;
>         int ret;
> @@ -2000,7 +1997,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>          * only exception to this is when dirty logging is enabled at runtime
>          * and a write fault needs to collapse a block entry into a table.
>          */
> -       ret = prepare_mmu_memcache(vcpu, fault.topup_memcache, &memcache);
> +       ret = prepare_mmu_memcache(s2fd->vcpu, fault.topup_memcache, &memcache);
>         if (ret)
>                 return ret;
>
> @@ -2008,17 +2005,17 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>          * Let's check if we will get back a huge fault->page backed by hugetlbfs, or
>          * get block mapping for device MMIO region.
>          */
> -       ret = kvm_s2_fault_pin_pfn(&fault);
> +       ret = kvm_s2_fault_pin_pfn(s2fd, &fault);
>         if (ret != 1)
>                 return ret;
>
> -       ret = kvm_s2_fault_compute_prot(&fault);
> +       ret = kvm_s2_fault_compute_prot(s2fd, &fault);
>         if (ret) {
>                 kvm_release_page_unused(fault.page);
>                 return ret;
>         }
>
> -       return kvm_s2_fault_map(&fault, memcache);
> +       return kvm_s2_fault_map(s2fd, &fault, memcache);
>  }
>
>  /* Resolve the access fault by making the page young again. */
> @@ -2284,12 +2281,20 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>         VM_WARN_ON_ONCE(kvm_vcpu_trap_is_permission_fault(vcpu) &&
>                         !write_fault && !kvm_vcpu_trap_is_exec_fault(vcpu));
>
> +       const struct kvm_s2_fault_desc s2fd = {
> +               .vcpu           = vcpu,
> +               .fault_ipa      = fault_ipa,
> +               .nested         = nested,
> +               .memslot        = memslot,
> +               .hva            = hva,
> +       };
> +
>         if (kvm_slot_has_gmem(memslot))
>                 ret = gmem_abort(vcpu, fault_ipa, nested, memslot,
>                                  esr_fsc_is_permission_fault(esr));
>         else
> -               ret = user_mem_abort(vcpu, fault_ipa, nested, memslot, hva,
> -                                    esr_fsc_is_permission_fault(esr));
> +               ret = user_mem_abort(&s2fd);
> +
>         if (ret == 0)
>                 ret = 1;
>  out:
> --
> 2.47.3
>
>

