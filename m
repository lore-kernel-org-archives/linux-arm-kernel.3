Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2709FED9F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 17:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZGIidB3+Lw1LqPi8seN9lXbzXkHYjqC3r50E+WnL6o=; b=PuNXA8PKOs5hhdAMtWC9WkUV3w
	tqRrbOCnUY6km3uh/gVz1JrXIWFPtiGJV0+ZUrdjBU2OeXkvqKzG2JfUYPIS2Nsis79MWMGDe4K9W
	bej6pg07RiNaAwY7ttebd5Zk2+LC/PRUoCD8xcOCB9es2gVb3iZVmUJEL2mHIqjiyoKCdo+pqds9Y
	ts/cQsP+0M5+eHoGcI6kwrjh46JfzetD2Dp8A2xUejDuzT8FqUIoyoLNZ7Wp8hdbKrnKhUrtPPDIx
	Z7nJbDsaZZj5UYlyy63wCMH1GL2/sIStaZ9fj6938IVW4h3fuzoUH0io2+oXalTDtOFYXzpAvXuE2
	SHJqHeYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Ygx-00000006zQe-13oR;
	Tue, 17 Mar 2026 17:58:55 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Ygu-00000006zQE-3beK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 17:58:54 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-50906a98ffeso62721cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 10:58:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773770331; cv=none;
        d=google.com; s=arc-20240605;
        b=ZGKWFcv/+gIfmWec9lbJDR7YGV7lYWkUq4A0YL1vcoS0yA6FHkAOHgkNt9CoPLnMou
         L+GbMNs0EpTNaiIfJT4Ufxl/WPud679AQKGmTcQbXtInuaamrNbZZ+DgbC7NhFDVCatw
         SK4Q8+Y/yYsBzr1a51VoDZ3EoOW/rhDmZa8IN3dR5n6bdj+IMly/EaOWkq1vjT4q+4QB
         iNPHBVs/GFrIJMSzbTXzNBb1aFvZAXqRxsUCjMBqWHbYkYyril82LRxMPbK13yWnXcA6
         mOVZ4Hh1AIxA6xHpTYhD4a7sBUyw+u2q7hpAaFu+EByp3byBZMpEXeiKRZiwTIgfQPyb
         j8cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7ZGIidB3+Lw1LqPi8seN9lXbzXkHYjqC3r50E+WnL6o=;
        fh=DM11NY2CwHOdOMiPVyp75NfZp/LeB1DltthiM4eeXnA=;
        b=OwmrLGSFhMcjwKTgu4d0rwjIbE4Iddlzs/VaFGAS6DI3smtt+3vSZJW6PDvkZoMCMr
         LW9ONSsOxgXtYDeyoDMnBB6+hAhEOt9YaMzPhmmK+Y9abMzIV6F1qqKeiPcWcKtzRg5H
         JTEWeAP9wlukN1t1gMc1zpatOEW4STReFOJu//Br53uX+JB7MtHO2g0epqRco7qVLTR1
         FBTDmPmM2Qe+LsAZQuUyuQr0h/Cu11b3qNnqvLOF/Mab7JqVxRDoQhVo2Bl3OfWJYJfl
         vxm5apPPe0kQAAvLlZbc2ovoVySPCuFhpQ2zY3BZCIblkthxWk2hF7ofpsKus7m4kXII
         sBLA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773770331; x=1774375131; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZGIidB3+Lw1LqPi8seN9lXbzXkHYjqC3r50E+WnL6o=;
        b=qUZwaJsi0c+lZjFxC7FBrKtXWCRs+c5uKeWinFeKCutteoaH4F74uiybcmwXTrgA4d
         JYZ9zuDp/bfi8MbVtc1WnSkVWLRtIyRbGp5Y24bS0bYO93HeebzBnczxNuyDqEw8FQPr
         MJcw6bsLloOlKlWrxaUDUqRQSt2EpUH6TvdVDJZbeLlguMFa6Gn5lfk2nxwo975vk6sg
         ud/lg1DtPANYzGAS69GnawBTLG+9xEhJsoPXDSMCgWFXr9JoKSrqhDGr555s3xXKBKCm
         aia4DLa9SSXMLOUfKHjM3+fXbKdPQm0i0e4KgiTGqmhPLNzQ6DacnrcIJgjPV7gtmkr8
         qrWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773770331; x=1774375131;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZGIidB3+Lw1LqPi8seN9lXbzXkHYjqC3r50E+WnL6o=;
        b=SL9dPhKF1gV6TRohlGNsUb0KwijRcTlQmOl5kaDo6qBMK9m6kL+hpfQDFm1hOwBMHz
         d1Sq30ZPz+SFzpCYQ6CrvdrY6cqkUkNLROD80ZamWZGN0Oaw0Rb14NbbBBbc83TbLhfy
         BB8l/Zg5lz4e1HUQJ+2dMI9cy6TcfngBgVhNOTItDp7vUIIHnIld6JBeFPtITD99hSe0
         9ehVwiYzk3w9NmmfaYyjNcUX1SLMUNxAV46ww5GqooBqbAle/YhwD04cOEHU4487MnGQ
         NfiuihUt80X1S7t3WOti60pbXBGlytKomIFvLitS8QOtGGTJIJH5txiZNjgCSL531pPP
         R8kg==
X-Forwarded-Encrypted: i=1; AJvYcCWXFxQpGNyQ0edf1jR6QdBgfKdZ5NH1vHSVS776YxhbIRw9eQT2MiY+/CXtrwYw9g9Akb8jJVvCljklcJfbhoaZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwoQFuRVfobWtpnbzo+dbFwA/wM3WDYPo3y/z5R3FUL7zTRl1ix
	KwzTHwVgr87ELnEHen/rfC0SIZx6Cmgx5eJcbbY09hSr6kNvLTJEufoAH7H/ngvyrG+6lE3/kr/
	D9HFZNlr+rH1RlOOZywpI225KQ+ZZ6sfqat0yk6lg
X-Gm-Gg: ATEYQzxDB81tOY9sVr8nPNv3dQOkiTiDi3gp1wnYp6B3pvB0mMPzpWAhxloVurjkJg7
	dfBOCyfyVj7eJyYbvD4T0LJV2GLULSC78P03O0KjEEF8SgDVPdFMZ+WGuJGrUavynN56dOXpTBL
	jefs3jxXq0LMKWtTLKdSBC2j6kqmdtYBl56mJ4TVfGZa8En2G5KQ/VVT5ljVJfvJRsoeQbiIrOo
	wsk/1DcxEGYkkIlM0a5XbXwxy/1boA5uHuOwX4kyzBz1VSkvENdDaVDSk1Ivus+lIzL+VJQnnsz
	Aia6lh6v
X-Received: by 2002:ac8:5a44:0:b0:509:25c5:42b4 with SMTP id
 d75a77b69052e-50b148ee552mr819161cf.13.1773770330682; Tue, 17 Mar 2026
 10:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260316175451.1866175-1-maz@kernel.org> <20260316175451.1866175-18-maz@kernel.org>
In-Reply-To: <20260316175451.1866175-18-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Mar 2026 17:58:13 +0000
X-Gm-Features: AaiRm50jbtPseSvl2K70b49jlHPLFzhgUyMQfCMq-WaA1eYcMyCloNR5cbTnnlY
Message-ID: <CA+EHjTxf5BF7LZ1VaKqpa5N+WaZ8ZFFWvxQLxzKeBgY-_E1cQQ@mail.gmail.com>
Subject: Re: [PATCH 17/17] KVM: arm64: Convert gmem_abort() to struct kvm_s2_fault_desc
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_105852_920432_4B0E8900 
X-CRM114-Status: GOOD (  19.90  )
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
> Having fully converted user_mem_abort() to kvm_s2_fault_desc and
> co, convert gmem_abort() to it as well. The change is obviously
> much simpler.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


> ---
>  arch/arm64/kvm/mmu.c | 57 +++++++++++++++++++++-----------------------
>  1 file changed, 27 insertions(+), 30 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 18cf7e6ba786d..e14b8b7287192 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1567,33 +1567,39 @@ static enum kvm_pgtable_prot adjust_nested_exec_perms(struct kvm *kvm,
>         return prot;
>  }
>
> -static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> -                     struct kvm_s2_trans *nested,
> -                     struct kvm_memory_slot *memslot, bool is_perm)
> +struct kvm_s2_fault_desc {
> +       struct kvm_vcpu         *vcpu;
> +       phys_addr_t             fault_ipa;
> +       struct kvm_s2_trans     *nested;
> +       struct kvm_memory_slot  *memslot;
> +       unsigned long           hva;
> +};
> +
> +static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
>  {
>         bool write_fault, exec_fault;
>         enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
>         enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
> -       struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
> +       struct kvm_pgtable *pgt = s2fd->vcpu->arch.hw_mmu->pgt;
>         unsigned long mmu_seq;
>         struct page *page;
> -       struct kvm *kvm = vcpu->kvm;
> +       struct kvm *kvm = s2fd->vcpu->kvm;
>         void *memcache;
>         kvm_pfn_t pfn;
>         gfn_t gfn;
>         int ret;
>
> -       ret = prepare_mmu_memcache(vcpu, true, &memcache);
> +       ret = prepare_mmu_memcache(s2fd->vcpu, true, &memcache);
>         if (ret)
>                 return ret;
>
> -       if (nested)
> -               gfn = kvm_s2_trans_output(nested) >> PAGE_SHIFT;
> +       if (s2fd->nested)
> +               gfn = kvm_s2_trans_output(s2fd->nested) >> PAGE_SHIFT;
>         else
> -               gfn = fault_ipa >> PAGE_SHIFT;
> +               gfn = s2fd->fault_ipa >> PAGE_SHIFT;
>
> -       write_fault = kvm_is_write_fault(vcpu);
> -       exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
> +       write_fault = kvm_is_write_fault(s2fd->vcpu);
> +       exec_fault = kvm_vcpu_trap_is_exec_fault(s2fd->vcpu);
>
>         VM_WARN_ON_ONCE(write_fault && exec_fault);
>
> @@ -1601,24 +1607,24 @@ static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>         /* Pairs with the smp_wmb() in kvm_mmu_invalidate_end(). */
>         smp_rmb();
>
> -       ret = kvm_gmem_get_pfn(kvm, memslot, gfn, &pfn, &page, NULL);
> +       ret = kvm_gmem_get_pfn(kvm, s2fd->memslot, gfn, &pfn, &page, NULL);
>         if (ret) {
> -               kvm_prepare_memory_fault_exit(vcpu, fault_ipa, PAGE_SIZE,
> +               kvm_prepare_memory_fault_exit(s2fd->vcpu, s2fd->fault_ipa, PAGE_SIZE,
>                                               write_fault, exec_fault, false);
>                 return ret;
>         }
>
> -       if (!(memslot->flags & KVM_MEM_READONLY))
> +       if (!(s2fd->memslot->flags & KVM_MEM_READONLY))
>                 prot |= KVM_PGTABLE_PROT_W;
>
> -       if (nested)
> -               prot = adjust_nested_fault_perms(nested, prot);
> +       if (s2fd->nested)
> +               prot = adjust_nested_fault_perms(s2fd->nested, prot);
>
>         if (exec_fault || cpus_have_final_cap(ARM64_HAS_CACHE_DIC))
>                 prot |= KVM_PGTABLE_PROT_X;
>
> -       if (nested)
> -               prot = adjust_nested_exec_perms(kvm, nested, prot);
> +       if (s2fd->nested)
> +               prot = adjust_nested_exec_perms(kvm, s2fd->nested, prot);
>
>         kvm_fault_lock(kvm);
>         if (mmu_invalidate_retry(kvm, mmu_seq)) {
> @@ -1626,7 +1632,7 @@ static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>                 goto out_unlock;
>         }
>
> -       ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, fault_ipa, PAGE_SIZE,
> +       ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, s2fd->fault_ipa, PAGE_SIZE,
>                                                  __pfn_to_phys(pfn), prot,
>                                                  memcache, flags);
>
> @@ -1635,19 +1641,11 @@ static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>         kvm_fault_unlock(kvm);
>
>         if ((prot & KVM_PGTABLE_PROT_W) && !ret)
> -               mark_page_dirty_in_slot(kvm, memslot, gfn);
> +               mark_page_dirty_in_slot(kvm, s2fd->memslot, gfn);
>
>         return ret != -EAGAIN ? ret : 0;
>  }
>
> -struct kvm_s2_fault_desc {
> -       struct kvm_vcpu         *vcpu;
> -       phys_addr_t             fault_ipa;
> -       struct kvm_s2_trans     *nested;
> -       struct kvm_memory_slot  *memslot;
> -       unsigned long           hva;
> -};
> -
>  struct kvm_s2_fault_vma_info {
>         unsigned long   mmu_seq;
>         long            vma_pagesize;
> @@ -2296,8 +2294,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>         };
>
>         if (kvm_slot_has_gmem(memslot))
> -               ret = gmem_abort(vcpu, fault_ipa, nested, memslot,
> -                                esr_fsc_is_permission_fault(esr));
> +               ret = gmem_abort(&s2fd);
>         else
>                 ret = user_mem_abort(&s2fd);
>
> --
> 2.47.3
>

