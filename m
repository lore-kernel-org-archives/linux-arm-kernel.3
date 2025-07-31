Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B351CC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 08:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ym+KfsIsiJuhcwUQE9TjvZiMZ2sqbIuEwLQHI4C8Z9k=; b=C7wEhIH+GGDdjtkSdk9KQAZT3e
	kh6RWpD6f4t4vFL/FUlSFD4LriurYYAfDqx3aU+aknhtCdu2AMm3IdncbnTN8nqJpewEh2T0n/RHB
	AhLra+i8f9Jc/NjJ7L0jMiYPQz2cHB/qPU83iWyrXQnZ3P3RUpyTvo3MY2Th29HYPlNT7X5HkSD1h
	S3GUXSKzeQ7AmH6HWn5d64QH3joDCOE+j0kqjBMKFNQR3k6+p8TzfJdkiAodU5W1oSUv0/RoQmrtm
	FEBw+fKKqHc40IOFOEOiYPB/zdCEaY+0agWtcQ5CuyDtex2oroxV2vQ6m6YbrrutXB9yb55Ao4PtK
	8AHYX7oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOg1-00000003AEZ-2ObR;
	Thu, 31 Jul 2025 08:30:13 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhON4-000000038H6-2adv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 08:10:39 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4ab86a29c98so204781cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 01:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753949437; x=1754554237; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ym+KfsIsiJuhcwUQE9TjvZiMZ2sqbIuEwLQHI4C8Z9k=;
        b=R3AYMCaICur9IGficCfQjVwv8XcDCvt7obB7JhNawW1ZKLUEAkhaxqJ7TcFrROz/DQ
         2Oudq/YHgKbSCbrHluGYMRE/iawm6anBumMMgXFOOAz4jYzVsPD07tjka8bQoffaYaTT
         oWS7Bh5BVa3Sazezc0PqX/kV3V6WJDAyIsvJTuv8BUMMEtArLAP/BinqzUBF/MvooOz+
         dNVmSdS8Gguzk1C2EbVlJe5p8Qz8DQtisLVkU7ZmpVeamaTSK6ogHHuSSgZpi+sB/lWX
         lCy/wnNqZyqASMd5sZXI6n0TGfPm+p1d0xjBGr4HovdWNDmr/v3Kqm2+IcWShRdCdY3p
         Gfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753949437; x=1754554237;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ym+KfsIsiJuhcwUQE9TjvZiMZ2sqbIuEwLQHI4C8Z9k=;
        b=QGCfLbqrUwg/j/VyAM7tZvsY/yn8l73TBRBxcn3qCqG7zjuhwx2Z9cvgm2nFMLMIV8
         +5RkiwDMCUrgZjnLQ3A2SmW2kblDyidOO+C2hHFnUyZ+80oKDKE7Sg5nDcdsys/BWRDI
         DtdWBIwGJt7FV31yRkfzzPOA1wS7CylqxOwj6k8naEAlYrAY7MaCzjud3MR+QTMHzgTE
         K7Gx2tjVm1gWjZIqCHyEZe7ohVOF12928yWwt17O/iYPaqim+iG/r2s8PgCWlb3xBpfj
         jl/AfweivzyaukhJy4EDqDpKEWroIPx8rE/CDaAwsELsAlwzh8A9sdb2ZBQosoMV/LyD
         kKjw==
X-Forwarded-Encrypted: i=1; AJvYcCVhLzpGgCQRFX6mdALBO3QsFDd50hYLwt6PEvXHUQmwGhtKL23sZeb9ZeOCCCZYu5A5BmzPj1JahdhEwi0f5GCh@lists.infradead.org
X-Gm-Message-State: AOJu0YzPl5iUUmwuR+OrOtJYmZNjPLcABQIEgywuOj7GmlaupAAUbJZa
	3TUMpXYJM9KytkDoYeurURi4IyQqf1tjmuor7qCUtQrRFxkIJ8gkkQ5QmHzCXWZ4gLUGS6OH5Bg
	+LhuxRF6bEjIQUeXtuq7SjvxRFijW1g1bDE6FivEz
X-Gm-Gg: ASbGnctgjMcp+9SyQvZs/TpzsyOHNkX6An4anwwiCHTFGEbaWkPStEpnihVJ2zoBNtY
	a/jAlIPLTJHvN40XO1Jp3OSr9tQILIGfvh2SyqhMWJnVy8l6WWIyZQt6xwyrfALPcEhuguWxX2C
	6q1Qffox1dEbey6UP3O0SWWuhN2ctFw/abKPaTI4hhd0H93VQBmXNaq5YkXFCkpVuosLiB0vaCS
	XNnK+Q=
X-Google-Smtp-Source: AGHT+IEr614AdjVOstI02RZSVaGE5epiw35pXc2xn/jyt9ydIWXUAOksQA4Mp9/n1z18ca9eQ0yhZiXPM3aYgvD8DAg=
X-Received: by 2002:a05:622a:255:b0:4a9:d263:dbc5 with SMTP id
 d75a77b69052e-4aeeff8921bmr2537351cf.20.1753949437046; Thu, 31 Jul 2025
 01:10:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com> <20250729225455.670324-15-seanjc@google.com>
In-Reply-To: <20250729225455.670324-15-seanjc@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 31 Jul 2025 09:10:00 +0100
X-Gm-Features: Ac12FXwIu2LcfxL6Yt1oELL8kCAb5y4pcRQakHDJXAJPvI-67xBPicQzU3SN_SI
Message-ID: <CA+EHjTxHn-wFH08Z3sV+dq3aGGGmwtinD1qePABSiG6f5xW+WA@mail.gmail.com>
Subject: Re: [PATCH v17 14/24] KVM: x86/mmu: Enforce guest_memfd's max order
 when recovering hugepages
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Gavin Shan <gshan@redhat.com>, Shivank Garg <shivankg@amd.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, David Hildenbrand <david@redhat.com>, 
	Ackerley Tng <ackerleytng@google.com>, Tao Chan <chentao@kylinos.cn>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_011038_659873_54352B05 
X-CRM114-Status: GOOD (  30.09  )
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

On Tue, 29 Jul 2025 at 23:55, Sean Christopherson <seanjc@google.com> wrote:
>
> Rework kvm_mmu_max_mapping_level() to provide the plumbing to consult
> guest_memfd (and relevant vendor code) when recovering hugepages, e.g.
> after disabling live migration.  The flaw has existed since guest_memfd was
> originally added, but has gone unnoticed due to lack of guest_memfd support
> for hugepages or dirty logging.
>
> Don't actually call into guest_memfd at this time, as it's unclear as to
> what the API should be.  Ideally, KVM would simply use kvm_gmem_get_pfn(),
> but invoking kvm_gmem_get_pfn() would lead to sleeping in atomic context
> if guest_memfd needed to allocate memory (mmu_lock is held).  Luckily,
> the path isn't actually reachable, so just add a TODO and WARN to ensure
> the functionality is added alongisde guest_memfd hugepage support, and
> punt the guest_memfd API design question to the future.

nit: *alongside
>
> Note, calling kvm_mem_is_private() in the non-fault path is safe, so long
> as mmu_lock is held, as hugepage recovery operates on shadow-present SPTEs,
> i.e. calling kvm_mmu_max_mapping_level() with @fault=NULL is mutually
> exclusive with kvm_vm_set_mem_attributes() changing the PRIVATE attribute
> of the gfn.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---


Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>  arch/x86/kvm/mmu/mmu.c          | 82 +++++++++++++++++++--------------
>  arch/x86/kvm/mmu/mmu_internal.h |  2 +-
>  arch/x86/kvm/mmu/tdp_mmu.c      |  2 +-
>  3 files changed, 49 insertions(+), 37 deletions(-)
>
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 20dd9f64156e..61eb9f723675 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -3302,31 +3302,54 @@ static u8 kvm_max_level_for_order(int order)
>         return PG_LEVEL_4K;
>  }
>
> -static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
> -                                       u8 max_level, int gmem_order)
> +static u8 kvm_max_private_mapping_level(struct kvm *kvm, struct kvm_page_fault *fault,
> +                                       const struct kvm_memory_slot *slot, gfn_t gfn)
>  {
> -       u8 req_max_level;
> +       u8 max_level, coco_level;
> +       kvm_pfn_t pfn;
>
> -       if (max_level == PG_LEVEL_4K)
> -               return PG_LEVEL_4K;
> +       /* For faults, use the gmem information that was resolved earlier. */
> +       if (fault) {
> +               pfn = fault->pfn;
> +               max_level = fault->max_level;
> +       } else {
> +               /* TODO: Call into guest_memfd once hugepages are supported. */
> +               WARN_ONCE(1, "Get pfn+order from guest_memfd");
> +               pfn = KVM_PFN_ERR_FAULT;
> +               max_level = PG_LEVEL_4K;
> +       }
>
> -       max_level = min(kvm_max_level_for_order(gmem_order), max_level);
>         if (max_level == PG_LEVEL_4K)
> -               return PG_LEVEL_4K;
> +               return max_level;
>
> -       req_max_level = kvm_x86_call(gmem_max_mapping_level)(kvm, pfn);
> -       if (req_max_level)
> -               max_level = min(max_level, req_max_level);
> +       /*
> +        * CoCo may influence the max mapping level, e.g. due to RMP or S-EPT
> +        * restrictions.  A return of '0' means "no additional restrictions", to
> +        * allow for using an optional "ret0" static call.
> +        */
> +       coco_level = kvm_x86_call(gmem_max_mapping_level)(kvm, pfn);
> +       if (coco_level)
> +               max_level = min(max_level, coco_level);
>
>         return max_level;
>  }
>
> -static int __kvm_mmu_max_mapping_level(struct kvm *kvm,
> -                                      const struct kvm_memory_slot *slot,
> -                                      gfn_t gfn, int max_level, bool is_private)
> +int kvm_mmu_max_mapping_level(struct kvm *kvm, struct kvm_page_fault *fault,
> +                             const struct kvm_memory_slot *slot, gfn_t gfn)
>  {
>         struct kvm_lpage_info *linfo;
> -       int host_level;
> +       int host_level, max_level;
> +       bool is_private;
> +
> +       lockdep_assert_held(&kvm->mmu_lock);
> +
> +       if (fault) {
> +               max_level = fault->max_level;
> +               is_private = fault->is_private;
> +       } else {
> +               max_level = PG_LEVEL_NUM;
> +               is_private = kvm_mem_is_private(kvm, gfn);
> +       }
>
>         max_level = min(max_level, max_huge_page_level);
>         for ( ; max_level > PG_LEVEL_4K; max_level--) {
> @@ -3335,25 +3358,16 @@ static int __kvm_mmu_max_mapping_level(struct kvm *kvm,
>                         break;
>         }
>
> +       if (max_level == PG_LEVEL_4K)
> +               return PG_LEVEL_4K;
> +
>         if (is_private)
> -               return max_level;
> -
> -       if (max_level == PG_LEVEL_4K)
> -               return PG_LEVEL_4K;
> -
> -       host_level = host_pfn_mapping_level(kvm, gfn, slot);
> +               host_level = kvm_max_private_mapping_level(kvm, fault, slot, gfn);
> +       else
> +               host_level = host_pfn_mapping_level(kvm, gfn, slot);
>         return min(host_level, max_level);
>  }
>
> -int kvm_mmu_max_mapping_level(struct kvm *kvm,
> -                             const struct kvm_memory_slot *slot, gfn_t gfn)
> -{
> -       bool is_private = kvm_slot_has_gmem(slot) &&
> -                         kvm_mem_is_private(kvm, gfn);
> -
> -       return __kvm_mmu_max_mapping_level(kvm, slot, gfn, PG_LEVEL_NUM, is_private);
> -}
> -
>  void kvm_mmu_hugepage_adjust(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
>  {
>         struct kvm_memory_slot *slot = fault->slot;
> @@ -3374,9 +3388,8 @@ void kvm_mmu_hugepage_adjust(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>          * Enforce the iTLB multihit workaround after capturing the requested
>          * level, which will be used to do precise, accurate accounting.
>          */
> -       fault->req_level = __kvm_mmu_max_mapping_level(vcpu->kvm, slot,
> -                                                      fault->gfn, fault->max_level,
> -                                                      fault->is_private);
> +       fault->req_level = kvm_mmu_max_mapping_level(vcpu->kvm, fault,
> +                                                    fault->slot, fault->gfn);
>         if (fault->req_level == PG_LEVEL_4K || fault->huge_page_disallowed)
>                 return;
>
> @@ -4564,8 +4577,7 @@ static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
>         }
>
>         fault->map_writable = !(fault->slot->flags & KVM_MEM_READONLY);
> -       fault->max_level = kvm_max_private_mapping_level(vcpu->kvm, fault->pfn,
> -                                                        fault->max_level, max_order);
> +       fault->max_level = kvm_max_level_for_order(max_order);
>
>         return RET_PF_CONTINUE;
>  }
> @@ -7165,7 +7177,7 @@ static bool kvm_mmu_zap_collapsible_spte(struct kvm *kvm,
>                  * mapping if the indirect sp has level = 1.
>                  */
>                 if (sp->role.direct &&
> -                   sp->role.level < kvm_mmu_max_mapping_level(kvm, slot, sp->gfn)) {
> +                   sp->role.level < kvm_mmu_max_mapping_level(kvm, NULL, slot, sp->gfn)) {
>                         kvm_zap_one_rmap_spte(kvm, rmap_head, sptep);
>
>                         if (kvm_available_flush_remote_tlbs_range())
> diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
> index 65f3c89d7c5d..b776be783a2f 100644
> --- a/arch/x86/kvm/mmu/mmu_internal.h
> +++ b/arch/x86/kvm/mmu/mmu_internal.h
> @@ -411,7 +411,7 @@ static inline int kvm_mmu_do_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
>         return r;
>  }
>
> -int kvm_mmu_max_mapping_level(struct kvm *kvm,
> +int kvm_mmu_max_mapping_level(struct kvm *kvm, struct kvm_page_fault *fault,
>                               const struct kvm_memory_slot *slot, gfn_t gfn);
>  void kvm_mmu_hugepage_adjust(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault);
>  void disallowed_hugepage_adjust(struct kvm_page_fault *fault, u64 spte, int cur_level);
> diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
> index 7f3d7229b2c1..740cb06accdb 100644
> --- a/arch/x86/kvm/mmu/tdp_mmu.c
> +++ b/arch/x86/kvm/mmu/tdp_mmu.c
> @@ -1813,7 +1813,7 @@ static void recover_huge_pages_range(struct kvm *kvm,
>                 if (iter.gfn < start || iter.gfn >= end)
>                         continue;
>
> -               max_mapping_level = kvm_mmu_max_mapping_level(kvm, slot, iter.gfn);
> +               max_mapping_level = kvm_mmu_max_mapping_level(kvm, NULL, slot, iter.gfn);
>                 if (max_mapping_level < iter.level)
>                         continue;
>
> --
> 2.50.1.552.g942d659e1b-goog
>

