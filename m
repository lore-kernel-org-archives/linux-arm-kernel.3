Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF9DC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 13:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXQqRrfSMAyOpnqI+nXSErAlrjOy9m1anxQWfZHMfi4=; b=wI1IyW88ApkCvE5pMniF7TiaX1
	eWlcq+8rB5RLMGoa4CD/pzNEwI7E1RnEaI+myA2dvC3PL1jL+cOiI9ZS3UISuGXuRQD1AurkH49wV
	1F/b3Utw6yzofZzR9syjbjdW/S5LIK0WBz73q/uEEjzW1/VMhpc0l5DdE9XFGzAirnZQUQVs6KE8Y
	+o5lfHII2CUQm9pKRk/UDkwlG0g6wZiTtMnFHsFttH368URStWYHqoZZxtJpe+tNnzrPr2aH2/jC7
	+w6vmohj4nunjCfN1oj3bLBUKtpmmdhxz745V5316Mc/2Z8yzIGe9vcX87taa7RAQg4l3H/z3SvoZ
	bN/rTPxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzQb-0000000Eu9x-2WhC;
	Wed, 15 Jul 2026 13:13:33 +0000
Received: from out-181.mta1.migadu.com ([95.215.58.181])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzQZ-0000000Eu9O-1D5V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 13:13:32 +0000
X-Forwarded-Encrypted: i=1; AHgh+Rp6+TLIfdMpnCSwYOaLxy9KUqNuF3lQCJLuwm5HcKtON8UG4XJOn+SJ5oEx7SAXzjHudX9yJ+yb2LE8U0GwlOWC@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784121208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qXQqRrfSMAyOpnqI+nXSErAlrjOy9m1anxQWfZHMfi4=;
	b=f68js/zDsMtBDzsJqbJCnmuWo4PmEoOvWL61tK0YVjMO86qbhYLUn48WgwMDDqfZYGcntY
	Bpb71FTRXEVnhhruq1Cuc1tx1651vClSoCpUEv/zAwnm9Z6PLTdd5p5gBMt37mvOapoyja
	D96zbzjLML1/9nNxERd9WcIv9AuG21E=
X-Gm-Message-State: AOJu0YzGoFTObBGs2SJ06v5Sf0Ik31Bvg4SFCKYfagaKqdrna3ev9Ln0
	xrHPHZHi7hRHhxSZWdOOoYtch6s1jufonAcSXM23V8F3IKp06NVUS0Egk+4xUtetq7fWoRKV7gM
	q7ttAhNlU37CDCaaUF92058quyjR4okvZvMfFn20h
X-Received: by 2002:a05:622a:53cb:b0:51c:7a90:a79a with SMTP id
 d75a77b69052e-51d83860d08mr27396621cf.26.1784121194870; Wed, 15 Jul 2026
 06:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com> <20260706175415.2604046-17-vdonnefort@google.com>
In-Reply-To: <20260706175415.2604046-17-vdonnefort@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 15 Jul 2026 14:12:37 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxhKBeTf1QvdjHm7MDG654ct2Et2X9trA1bGdZiJj_sEQ@mail.gmail.com>
X-Gm-Features: AUfX_mx7GarJDmJkKq7zMzXRvynC3BwHr2gkth2ZeAGOpnvLMG6dIWBJ2r8WH88
Message-ID: <CA+EHjTxhKBeTf1QvdjHm7MDG654ct2Et2X9trA1bGdZiJj_sEQ@mail.gmail.com>
Subject: Re: [PATCH v2 16/18] KVM: arm64: Alloc pkvm_hyp_vcpu using pKVM heap allocator
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_061331_536075_52192662 
X-CRM114-Status: GOOD (  19.62  )
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

On Mon, 6 Jul 2026 at 18:54, Vincent Donnefort <vdonnefort@google.com> wrote:

...
> -int __pkvm_init_vcpu(pkvm_handle_t handle, struct kvm_vcpu *host_vcpu,
> -                    unsigned long vcpu_hva)
> +int __pkvm_init_vcpu(pkvm_handle_t handle, struct kvm_vcpu *host_vcpu)
>  {
>         struct pkvm_hyp_vcpu *hyp_vcpu;
>         struct pkvm_hyp_vm *hyp_vm;
>         int ret;
>
> -       hyp_vcpu = map_donated_memory(vcpu_hva, sizeof(*hyp_vcpu));
> +       hyp_vcpu = hyp_alloc(sizeof(*hyp_vcpu));

On Sashiko's alignment point: hyp_alloc only guarantees 8-byte
alignment while pkvm_hyp_vcpu wants 16 (the __uint128_t vregs[32]),
and the old map_donated_memory path was page-aligned, so it's a real
reduction.

But if my understanding of the ARM ARM is correct, and please note
that I just consulted the spec when replying to this, so it's a big
*if*: I don't think it faults. We run EL2 with SCTLR_EL2.A == 0
(INIT_SCTLR_EL2_MMU_ON has SA but not A), and FPSIMD save/restore is
plain LDR/STR/LDP/STP of Q registers. From the ARM ARM (DDI 0487M.c,
B2.8.2.1.1):

"When the value of SCTLR_ELx.A applicable to the current Exception
level is 0: An unaligned access is performed."

and, covering LDP/STP:

"For these instructions, the definition of an unaligned access is
based on the size of the accessed elements, not the overall size of
the memory access. This affects SIMD and SVE element and structure
loads and stores, and also load/store pair instructions."

However, the alignment here is still weaker than the
kmalloc/alloc_pages callers relied on , so it might be cleaner to give
hyp_alloc a 16-byte minimum alignment at the allocator level rather
than per-caller. What do you think?

Cheers,
/fuad


>         if (!hyp_vcpu)
> -               return -ENOMEM;
> +               return hyp_alloc_errno();
>
>         hyp_spin_lock(&vm_table_lock);
>
> @@ -926,24 +892,12 @@ int __pkvm_init_vcpu(pkvm_handle_t handle, struct kvm_vcpu *host_vcpu,
>         }
>  unlock:
>         hyp_spin_unlock(&vm_table_lock);
> -
>         if (ret)
> -               unmap_donated_memory(hyp_vcpu, sizeof(*hyp_vcpu));
> +               hyp_free(hyp_vcpu);
> +
>         return ret;
>  }
>
> -static void
> -teardown_donated_memory(struct kvm_hyp_memcache *mc, void *addr, size_t size)
> -{
> -       size = PAGE_ALIGN(size);
> -       memset(addr, 0, size);
> -
> -       for (void *start = addr; start < addr + size; start += PAGE_SIZE)
> -               push_hyp_memcache(mc, start, hyp_virt_to_phys);
> -
> -       unmap_donated_memory_noclear(addr, size);
> -}
> -
>  int __pkvm_reclaim_dying_guest_page(pkvm_handle_t handle, u64 gfn)
>  {
>         struct pkvm_hyp_vm *hyp_vm = get_pkvm_hyp_vm(handle);
> @@ -993,7 +947,7 @@ int __pkvm_start_teardown_vm(pkvm_handle_t handle)
>
>  int __pkvm_finalize_teardown_vm(pkvm_handle_t handle)
>  {
> -       struct kvm_hyp_memcache *mc, *stage2_mc;
> +       struct kvm_hyp_memcache *stage2_mc;
>         struct pkvm_hyp_vm *hyp_vm;
>         struct kvm *host_kvm;
>         unsigned int idx;
> @@ -1014,7 +968,6 @@ int __pkvm_finalize_teardown_vm(pkvm_handle_t handle)
>         hyp_spin_unlock(&vm_table_lock);
>
>         /* Reclaim guest pages (including page-table pages) */
> -       mc = &host_kvm->arch.pkvm.teardown_mc;
>         stage2_mc = &host_kvm->arch.pkvm.stage2_teardown_mc;
>         reclaim_pgtable_pages(hyp_vm, stage2_mc);
>         unpin_host_vcpus(hyp_vm->vcpus, hyp_vm->kvm.created_vcpus);
> @@ -1036,7 +989,7 @@ int __pkvm_finalize_teardown_vm(pkvm_handle_t handle)
>                         unmap_donated_memory_noclear(addr, PAGE_SIZE);
>                 }
>
> -               teardown_donated_memory(mc, hyp_vcpu, sizeof(*hyp_vcpu));
> +               hyp_free(hyp_vcpu);
>         }
>
>         hyp_free(hyp_vm);
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index 8a8b5b84825c..1899b05d9fc2 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -153,28 +153,19 @@ static void __pkvm_destroy_hyp_vm(struct kvm *kvm)
>
>         kvm->arch.pkvm.handle = 0;
>         kvm->arch.pkvm.is_created = false;
> -       free_hyp_memcache(&kvm->arch.pkvm.teardown_mc);
>         free_hyp_memcache(&kvm->arch.pkvm.stage2_teardown_mc);
>  }
>
>  static int __pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu)
>  {
> -       size_t hyp_vcpu_sz = PAGE_ALIGN(PKVM_HYP_VCPU_SIZE);
>         pkvm_handle_t handle = vcpu->kvm->arch.pkvm.handle;
> -       void *hyp_vcpu;
>         int ret;
>
>         init_hyp_stage2_memcache(&vcpu->arch.pkvm_memcache);
>
> -       hyp_vcpu = alloc_pages_exact(hyp_vcpu_sz, GFP_KERNEL_ACCOUNT);
> -       if (!hyp_vcpu)
> -               return -ENOMEM;
> -
> -       ret = kvm_call_hyp_nvhe(__pkvm_init_vcpu, handle, vcpu, hyp_vcpu);
> +       ret = pkvm_call_hyp_req(__pkvm_init_vcpu, handle, vcpu);
>         if (!ret)
>                 vcpu_set_flag(vcpu, VCPU_PKVM_FINALIZED);
> -       else
> -               free_pages_exact(hyp_vcpu, hyp_vcpu_sz);
>
>         return ret;
>  }
> --
> 2.55.0.rc2.803.g1fd1e6609c-goog
>

