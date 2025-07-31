Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93885C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 08:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZtgeTLUnQXMXWU42NDS+n+b9sSh//OO5LLzxtMDq45g=; b=hMnN7Ty+2CHo+VJDo95c5+jWqI
	90yya5ROZ9X5fjNcTSC/F4u7pGW4XOSQKTVYDr57UCcRTGjIt6+E2dOH5wMENhxlrMBaM/2I4w/4C
	kxPGYQFkMq3bydsVtIrTBuFu1P7anSkmQF+oRNMpOSdmErf8EtvIiwqw2us35B0UphNlj5Jr5Fo/s
	+iKGiKsZ02jhWMVQTC6KjDF1mSt+icLgqwlmXRbN9lioJa0rPnzIT4WANok8ISRIgzAFaKeHdR0Wd
	SbYQZ9GXgPPuJbabvBrKppfuFYrarse/vPU2wkdkzuYQe+YaQE5peGj5kTiEv/bKdPJDiGEKeFKqJ
	r/veLKxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOkw-00000003Aom-2E5q;
	Thu, 31 Jul 2025 08:35:18 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOS4-000000038ku-10Co
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 08:15:49 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4aef56cea5bso63371cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 01:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753949747; x=1754554547; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtgeTLUnQXMXWU42NDS+n+b9sSh//OO5LLzxtMDq45g=;
        b=XvQHAMAGtPs7DBAHz6bJbaoOuU9Zkz24PcLxWRGwyvUrKylE7Kmi90kDwwDfXMf2VS
         F51D8dasV3SAYHrMYOT54eWX4LAX0gvCPgaXk42QUQ9UxhVnM3uSY7YtV6sMX6KVwGqY
         2HkoqnYD4b5yeGVM1WhIdpoXJf4lhPZoMFOIdVfK5+Q6kumpzAvhdu4K8Zgbi0ZrFDID
         0bnfiGhCuc3VmCyzGhUDNXxhU9sHviSkHckXi/ak9/cvB/qrIKIVO/w/Iu8js5KEtNRi
         4I6nqyNGNLkgTnH/U0G+1Ke//lfF1Op/oWlgaHF8Fm5Q2k7qBkuxaTOcGKqlXSesau9W
         WTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753949747; x=1754554547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZtgeTLUnQXMXWU42NDS+n+b9sSh//OO5LLzxtMDq45g=;
        b=vMyk/6jBpcYOqROk9aDKoEBChcrnNOYAnFpbyyyrFMJWzQO8FoGplXLN+0nGfZP1ji
         O61ghKd1q1sNkKTy12+pm9uXvMEwFPIEppNX7vHNuNcQDHzKidIKkSrz3QXEuebZC6If
         +GEoM77iHjKGJgj3yXrjKcgl8W98egZo7kTpa+rh4MLpQG0UX2RX/+5xwLUVcxl4azws
         JSPe7Y2FOHo9gj+Lp3mvToRJfwudNNZs3hNBMFfG7JarEqgaw6Z5/E+QYLEq8r8rQm9V
         xjmRi4hyXJierm36FrA5aI2OtXV5uPdgzTBOnTw0GFXghA6kwjhUBFljMn7Aad6uha9H
         5+2w==
X-Forwarded-Encrypted: i=1; AJvYcCWoh/GpdQ2btAzn8w14q4LJ/ULBQVorS27A4BllvpNkFCHx4k9f5mgctiOn3OreoyKYjoeaqts9Cjfugwd99GUw@lists.infradead.org
X-Gm-Message-State: AOJu0YyC99X8QIRaraQQgJzy5kPV6bBAMVYB2ERXg9GjThP2bQbKoilr
	AAVsZmJz8IfFu3V71Z857H3Q+aHB7v/esD7Hq99w7Jb88L6vEIhF+LdzLLKvmHiyvTnizBM6u0+
	U9F3Eto/3WyJN6cSseTTdR7s9H9ZzVO7X4lsshSpo
X-Gm-Gg: ASbGncusxiNXSZtCSkk1X0oj/QwdOll/LcGLbm+sLczqLbARuZU7Kfj4meB6wWkZD4L
	gSpZch/c16w3bnmCs9JNrlFj2Wq4oe5oTL64ysrtwOYiRUDkIJQ5fH12uvdheMg3qwdYLVFqYHT
	86FifwwkLSlI3DSb/YErQb6ghPdkFxvqL58/n+G8di7vLi5fS6+kcsQZ6PtTOYc0j7sqCJJ4Hay
	HeIl2VpwAUNdhEqzQ==
X-Google-Smtp-Source: AGHT+IF3jlBckt17asL1OJitjRV0KoT4GNPiTrULyMmi9374k00fq9EfEoagert0ixcsHtiWtn0sZ/lfGp2Bbtfgh5k=
X-Received: by 2002:a05:622a:1989:b0:479:1958:d81a with SMTP id
 d75a77b69052e-4aeefd25399mr2200101cf.6.1753949746748; Thu, 31 Jul 2025
 01:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com> <20250729225455.670324-13-seanjc@google.com>
In-Reply-To: <20250729225455.670324-13-seanjc@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 31 Jul 2025 09:15:10 +0100
X-Gm-Features: Ac12FXy9BehYhXYWaAAmIrERtbmas51wza3GSdkE_3UpVeAlSRu_uO9i-1FddA8
Message-ID: <CA+EHjTwuXT_wcDAOwwKP+yBetE9N46QMb+hUKAOsxBVkkOgCTw@mail.gmail.com>
Subject: Re: [PATCH v17 12/24] KVM: x86/mmu: Rename .private_max_mapping_level()
 to .gmem_max_mapping_level()
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
X-CRM114-CacheID: sfid-20250731_011548_284867_05889EF3 
X-CRM114-Status: GOOD (  20.40  )
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
> From: Ackerley Tng <ackerleytng@google.com>
>
> Rename kvm_x86_ops.private_max_mapping_level() to .gmem_max_mapping_level()
> in anticipation of extending guest_memfd support to non-private memory.
>
> No functional change intended.
>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---

nit: remove my "Signed-off-by", since I'm not a co-developer, and instead:

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>  arch/x86/include/asm/kvm-x86-ops.h | 2 +-
>  arch/x86/include/asm/kvm_host.h    | 2 +-
>  arch/x86/kvm/mmu/mmu.c             | 2 +-
>  arch/x86/kvm/svm/sev.c             | 2 +-
>  arch/x86/kvm/svm/svm.c             | 2 +-
>  arch/x86/kvm/svm/svm.h             | 4 ++--
>  arch/x86/kvm/vmx/main.c            | 6 +++---
>  arch/x86/kvm/vmx/tdx.c             | 2 +-
>  arch/x86/kvm/vmx/x86_ops.h         | 2 +-
>  9 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
> index 18a5c3119e1a..62c3e4de3303 100644
> --- a/arch/x86/include/asm/kvm-x86-ops.h
> +++ b/arch/x86/include/asm/kvm-x86-ops.h
> @@ -145,7 +145,7 @@ KVM_X86_OP_OPTIONAL_RET0(vcpu_get_apicv_inhibit_reasons);
>  KVM_X86_OP_OPTIONAL(get_untagged_addr)
>  KVM_X86_OP_OPTIONAL(alloc_apic_backing_page)
>  KVM_X86_OP_OPTIONAL_RET0(gmem_prepare)
> -KVM_X86_OP_OPTIONAL_RET0(private_max_mapping_level)
> +KVM_X86_OP_OPTIONAL_RET0(gmem_max_mapping_level)
>  KVM_X86_OP_OPTIONAL(gmem_invalidate)
>
>  #undef KVM_X86_OP
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 50366a1ca192..c0a739bf3829 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1922,7 +1922,7 @@ struct kvm_x86_ops {
>         void *(*alloc_apic_backing_page)(struct kvm_vcpu *vcpu);
>         int (*gmem_prepare)(struct kvm *kvm, kvm_pfn_t pfn, gfn_t gfn, int max_order);
>         void (*gmem_invalidate)(kvm_pfn_t start, kvm_pfn_t end);
> -       int (*private_max_mapping_level)(struct kvm *kvm, kvm_pfn_t pfn);
> +       int (*gmem_max_mapping_level)(struct kvm *kvm, kvm_pfn_t pfn);
>  };
>
>  struct kvm_x86_nested_ops {
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index fdc2824755ee..b735611e8fcd 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -4532,7 +4532,7 @@ static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
>         if (max_level == PG_LEVEL_4K)
>                 return PG_LEVEL_4K;
>
> -       req_max_level = kvm_x86_call(private_max_mapping_level)(kvm, pfn);
> +       req_max_level = kvm_x86_call(gmem_max_mapping_level)(kvm, pfn);
>         if (req_max_level)
>                 max_level = min(max_level, req_max_level);
>
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index 7744c210f947..be1c80d79331 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -4947,7 +4947,7 @@ void sev_gmem_invalidate(kvm_pfn_t start, kvm_pfn_t end)
>         }
>  }
>
> -int sev_private_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn)
> +int sev_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn)
>  {
>         int level, rc;
>         bool assigned;
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index d9931c6c4bc6..8a66e2e985a4 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -5180,7 +5180,7 @@ static struct kvm_x86_ops svm_x86_ops __initdata = {
>
>         .gmem_prepare = sev_gmem_prepare,
>         .gmem_invalidate = sev_gmem_invalidate,
> -       .private_max_mapping_level = sev_private_max_mapping_level,
> +       .gmem_max_mapping_level = sev_gmem_max_mapping_level,
>  };
>
>  /*
> diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> index 58b9d168e0c8..d84a83ae18a1 100644
> --- a/arch/x86/kvm/svm/svm.h
> +++ b/arch/x86/kvm/svm/svm.h
> @@ -866,7 +866,7 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code);
>  void sev_snp_init_protected_guest_state(struct kvm_vcpu *vcpu);
>  int sev_gmem_prepare(struct kvm *kvm, kvm_pfn_t pfn, gfn_t gfn, int max_order);
>  void sev_gmem_invalidate(kvm_pfn_t start, kvm_pfn_t end);
> -int sev_private_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn);
> +int sev_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn);
>  struct vmcb_save_area *sev_decrypt_vmsa(struct kvm_vcpu *vcpu);
>  void sev_free_decrypted_vmsa(struct kvm_vcpu *vcpu, struct vmcb_save_area *vmsa);
>  #else
> @@ -895,7 +895,7 @@ static inline int sev_gmem_prepare(struct kvm *kvm, kvm_pfn_t pfn, gfn_t gfn, in
>         return 0;
>  }
>  static inline void sev_gmem_invalidate(kvm_pfn_t start, kvm_pfn_t end) {}
> -static inline int sev_private_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn)
> +static inline int sev_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn)
>  {
>         return 0;
>  }
> diff --git a/arch/x86/kvm/vmx/main.c b/arch/x86/kvm/vmx/main.c
> index dbab1c15b0cd..dd7687ef7e2d 100644
> --- a/arch/x86/kvm/vmx/main.c
> +++ b/arch/x86/kvm/vmx/main.c
> @@ -831,10 +831,10 @@ static int vt_vcpu_mem_enc_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
>         return tdx_vcpu_ioctl(vcpu, argp);
>  }
>
> -static int vt_gmem_private_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn)
> +static int vt_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn)
>  {
>         if (is_td(kvm))
> -               return tdx_gmem_private_max_mapping_level(kvm, pfn);
> +               return tdx_gmem_max_mapping_level(kvm, pfn);
>
>         return 0;
>  }
> @@ -1005,7 +1005,7 @@ struct kvm_x86_ops vt_x86_ops __initdata = {
>         .mem_enc_ioctl = vt_op_tdx_only(mem_enc_ioctl),
>         .vcpu_mem_enc_ioctl = vt_op_tdx_only(vcpu_mem_enc_ioctl),
>
> -       .private_max_mapping_level = vt_op_tdx_only(gmem_private_max_mapping_level)
> +       .gmem_max_mapping_level = vt_op_tdx_only(gmem_max_mapping_level)
>  };
>
>  struct kvm_x86_init_ops vt_init_ops __initdata = {
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index 66744f5768c8..b444714e8e8a 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -3318,7 +3318,7 @@ int tdx_vcpu_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
>         return ret;
>  }
>
> -int tdx_gmem_private_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn)
> +int tdx_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn)
>  {
>         return PG_LEVEL_4K;
>  }
> diff --git a/arch/x86/kvm/vmx/x86_ops.h b/arch/x86/kvm/vmx/x86_ops.h
> index 2b3424f638db..6037d1708485 100644
> --- a/arch/x86/kvm/vmx/x86_ops.h
> +++ b/arch/x86/kvm/vmx/x86_ops.h
> @@ -153,7 +153,7 @@ int tdx_vcpu_ioctl(struct kvm_vcpu *vcpu, void __user *argp);
>  void tdx_flush_tlb_current(struct kvm_vcpu *vcpu);
>  void tdx_flush_tlb_all(struct kvm_vcpu *vcpu);
>  void tdx_load_mmu_pgd(struct kvm_vcpu *vcpu, hpa_t root_hpa, int root_level);
> -int tdx_gmem_private_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn);
> +int tdx_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn);
>  #endif
>
>  #endif /* __KVM_X86_VMX_X86_OPS_H */
> --
> 2.50.1.552.g942d659e1b-goog
>

