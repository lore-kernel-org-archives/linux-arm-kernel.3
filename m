Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C679AC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 08:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sX9GbqVIjmwrvhX5OSfDHPFCq4jInN5mZum+NpNw7Gs=; b=rNY1Ik1cQtYOz0o3A3wUMUY5sP
	lE1C4G90wtN1TMfQy99fJyDYvYs5xIypLGmwx5h9sfhJA/Mk107VYSIKBPMKpPBm+q9DpwyXFRwus
	kmZPbHwTy/w3eT0gzESMJ3QHk3LmtOVBzy+tCS5D6wSIkIuZfsEWa//KmmyAUQzLYyd0XVsCWLCRk
	/svHZf3Y42eg1k9dN2ObugS6A9e0heQqnh1Dghj6MixvY0Q/LxUX8f31vbcfzcKP4qdYsKLw1XQeX
	fhttxitHz0JjJ6CyrVHwe9WunrQ8wWisU+ex79JBxWiaeWZ93FSSYlzMOmm9pukbmF7GkTFXqxQU1
	oOxQ6YAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhORE-000000038gR-3E1f;
	Thu, 31 Jul 2025 08:14:56 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOIc-000000037ei-1kZZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 08:06:03 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4aef56cea5bso59951cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 01:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753949161; x=1754553961; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sX9GbqVIjmwrvhX5OSfDHPFCq4jInN5mZum+NpNw7Gs=;
        b=XNdJ3Pt+ElI0xbOt/czNyveV0LC970+la8NMoJoLPIFem1B3or7vhgZqa+ccncQ2Le
         JSqpooIT0l0Y5p+8vERYf10kHbgvvBxcdY9btYey+wtehpgvjgdB2dKkVfiaKlylTDDO
         eVCk7ncC4l7l1CoLZb9RGSi+eJs8LhNRnrTdeSBoNhR/nCzpiO3HtzLwCRCzdA3fe/NZ
         AXoBlo94+Y8Bu0hjSKtreAseAalg2EIYqDPAmgjP8tpvgA0J2xaLaGVdAbY3L1vRYMvR
         P69MBZtEDS0lNjFK4WrViQRBiLGjsrNqf4kYcbu0YdG+ckT15vTn7ZuiAOoChpEQin5H
         DeKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753949161; x=1754553961;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sX9GbqVIjmwrvhX5OSfDHPFCq4jInN5mZum+NpNw7Gs=;
        b=dVTmro9z7rmQPPo9JJYDA/aHMva2aDy8rQcl3tsCRDNS+ar0dSOVzQh+g30ByJ2LAB
         u+xfa7YpzF6+1xmWDXa2WXYcQj/TqxJyZuWZG09bJv5fEQSfgd9VG3x+4TQeVWcQxIWr
         gGijFBd745ERsJ7sCZYVVnOy683xKAIoBGTdgDrCE/eaFz5obpm4kioh8J1UzFTBe2oV
         hWNTvo+3jXnfcb9SmU1U5cQpvxehzvORe2uOa4h7GAIAbDJGy6NvkkYT+L8wOW/Stg0F
         9z4mb6uB52GlqEaKwdv9NErRlRMBiPDoxdkc6LGmItCWZlFGtWSPui20RU6pN6nPoEGI
         f3FA==
X-Forwarded-Encrypted: i=1; AJvYcCXsN168Wex+9XNP0DBA29WNbYgb5apF3fFgSYggA48ZyNwepfv3N21JghRi3kJYU+8vx39+10oW7pwFYthYNgW4@lists.infradead.org
X-Gm-Message-State: AOJu0YzXrUpESWnSE4IQiWVdWnJqxnRw6X9iV7Iyzxjg03NsZIKiPusZ
	FH2MiH6/Ye9GBaQibsUPC6sLqbsumPb2k7XU9jkiHWKDsypagWVhvijqzjJipYp5k5Cc7g/KzaA
	KSihjMYqEg1PN4s65ht3x8+vFvJKCZHd/wluRqhXJ
X-Gm-Gg: ASbGncsXHmjGhwz9y2LkmA98R7Y19YUCEJNwCpPJLX0PZTr5oYYSbiZjcJTgDoHIZSf
	M+DMurQ2Sh92Kuj/r6urjX9Fj7O85PBpYXHVKm14ljplU5uhGwGqjqA4lRerWHCUNW/2V2nM7Fw
	lkyLup3kA1rj6DwI85EJbVNhewbBh0/XGKRQG2uZmLF54uQp3gHxjWo+Gf/FUGYBDmqfna9/wgU
	XZ8Wa8ZmIYEnbP8kQ==
X-Google-Smtp-Source: AGHT+IH4yq+cZN4dHwzK7g8E7DSjy0bGu3xiXGytk3StPe2WtxT21gv+bvGK0jCbJI3gRQMQxRtljt9Le12kOsEdiUI=
X-Received: by 2002:a05:622a:1989:b0:479:1958:d81a with SMTP id
 d75a77b69052e-4aeefd25399mr2167431cf.6.1753949160761; Thu, 31 Jul 2025
 01:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com> <20250729225455.670324-16-seanjc@google.com>
In-Reply-To: <20250729225455.670324-16-seanjc@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 31 Jul 2025 09:05:24 +0100
X-Gm-Features: Ac12FXyz8RfnHssTX6SapaASSN1w3XZbMdMXGmxSRe7KK501NuRu89FkBwEbo-Y
Message-ID: <CA+EHjTz0g+Fd-893WYA9+WBhvMvbsrXvFtL3OGa8ohC6DdVbdw@mail.gmail.com>
Subject: Re: [PATCH v17 15/24] KVM: x86/mmu: Extend guest_memfd's max mapping
 level to shared mappings
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
X-CRM114-CacheID: sfid-20250731_010602_458535_F5EABFA7 
X-CRM114-Status: GOOD (  22.85  )
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
> Rework kvm_mmu_max_mapping_level() to consult guest_memfd for all mappings,
> not just private mappings, so that hugepage support plays nice with the
> upcoming support for backing non-private memory with guest_memfd.
>
> In addition to getting the max order from guest_memfd for gmem-only
> memslots, update TDX's hook to effectively ignore shared mappings, as TDX's
> restrictions on page size only apply to Secure EPT mappings.  Do nothing
> for SNP, as RMP restrictions apply to both private and shared memory.
>
> Suggested-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>  arch/x86/include/asm/kvm_host.h |  2 +-
>  arch/x86/kvm/mmu/mmu.c          | 12 +++++++-----
>  arch/x86/kvm/svm/sev.c          |  2 +-
>  arch/x86/kvm/svm/svm.h          |  4 ++--
>  arch/x86/kvm/vmx/main.c         |  5 +++--
>  arch/x86/kvm/vmx/tdx.c          |  5 ++++-
>  arch/x86/kvm/vmx/x86_ops.h      |  2 +-
>  7 files changed, 19 insertions(+), 13 deletions(-)
>
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index c0a739bf3829..c56cc54d682a 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1922,7 +1922,7 @@ struct kvm_x86_ops {
>         void *(*alloc_apic_backing_page)(struct kvm_vcpu *vcpu);
>         int (*gmem_prepare)(struct kvm *kvm, kvm_pfn_t pfn, gfn_t gfn, int max_order);
>         void (*gmem_invalidate)(kvm_pfn_t start, kvm_pfn_t end);
> -       int (*gmem_max_mapping_level)(struct kvm *kvm, kvm_pfn_t pfn);
> +       int (*gmem_max_mapping_level)(struct kvm *kvm, kvm_pfn_t pfn, bool is_private);
>  };
>
>  struct kvm_x86_nested_ops {
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 61eb9f723675..e83d666f32ad 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -3302,8 +3302,9 @@ static u8 kvm_max_level_for_order(int order)
>         return PG_LEVEL_4K;
>  }
>
> -static u8 kvm_max_private_mapping_level(struct kvm *kvm, struct kvm_page_fault *fault,
> -                                       const struct kvm_memory_slot *slot, gfn_t gfn)
> +static u8 kvm_gmem_max_mapping_level(struct kvm *kvm, struct kvm_page_fault *fault,
> +                                    const struct kvm_memory_slot *slot, gfn_t gfn,
> +                                    bool is_private)
>  {
>         u8 max_level, coco_level;
>         kvm_pfn_t pfn;
> @@ -3327,7 +3328,7 @@ static u8 kvm_max_private_mapping_level(struct kvm *kvm, struct kvm_page_fault *
>          * restrictions.  A return of '0' means "no additional restrictions", to
>          * allow for using an optional "ret0" static call.
>          */
> -       coco_level = kvm_x86_call(gmem_max_mapping_level)(kvm, pfn);
> +       coco_level = kvm_x86_call(gmem_max_mapping_level)(kvm, pfn, is_private);
>         if (coco_level)
>                 max_level = min(max_level, coco_level);
>
> @@ -3361,8 +3362,9 @@ int kvm_mmu_max_mapping_level(struct kvm *kvm, struct kvm_page_fault *fault,
>         if (max_level == PG_LEVEL_4K)
>                 return PG_LEVEL_4K;
>
> -       if (is_private)
> -               host_level = kvm_max_private_mapping_level(kvm, fault, slot, gfn);
> +       if (is_private || kvm_memslot_is_gmem_only(slot))
> +               host_level = kvm_gmem_max_mapping_level(kvm, fault, slot, gfn,
> +                                                       is_private);
>         else
>                 host_level = host_pfn_mapping_level(kvm, gfn, slot);
>         return min(host_level, max_level);
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index be1c80d79331..807d4b70327a 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -4947,7 +4947,7 @@ void sev_gmem_invalidate(kvm_pfn_t start, kvm_pfn_t end)
>         }
>  }
>
> -int sev_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn)
> +int sev_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn, bool is_private)
>  {
>         int level, rc;
>         bool assigned;
> diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> index d84a83ae18a1..70df7c6413cf 100644
> --- a/arch/x86/kvm/svm/svm.h
> +++ b/arch/x86/kvm/svm/svm.h
> @@ -866,7 +866,7 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code);
>  void sev_snp_init_protected_guest_state(struct kvm_vcpu *vcpu);
>  int sev_gmem_prepare(struct kvm *kvm, kvm_pfn_t pfn, gfn_t gfn, int max_order);
>  void sev_gmem_invalidate(kvm_pfn_t start, kvm_pfn_t end);
> -int sev_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn);
> +int sev_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn, bool is_private);
>  struct vmcb_save_area *sev_decrypt_vmsa(struct kvm_vcpu *vcpu);
>  void sev_free_decrypted_vmsa(struct kvm_vcpu *vcpu, struct vmcb_save_area *vmsa);
>  #else
> @@ -895,7 +895,7 @@ static inline int sev_gmem_prepare(struct kvm *kvm, kvm_pfn_t pfn, gfn_t gfn, in
>         return 0;
>  }
>  static inline void sev_gmem_invalidate(kvm_pfn_t start, kvm_pfn_t end) {}
> -static inline int sev_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn)
> +static inline int sev_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn, bool is_private)
>  {
>         return 0;
>  }
> diff --git a/arch/x86/kvm/vmx/main.c b/arch/x86/kvm/vmx/main.c
> index dd7687ef7e2d..bb5f182f6788 100644
> --- a/arch/x86/kvm/vmx/main.c
> +++ b/arch/x86/kvm/vmx/main.c
> @@ -831,10 +831,11 @@ static int vt_vcpu_mem_enc_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
>         return tdx_vcpu_ioctl(vcpu, argp);
>  }
>
> -static int vt_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn)
> +static int vt_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
> +                                    bool is_private)
>  {
>         if (is_td(kvm))
> -               return tdx_gmem_max_mapping_level(kvm, pfn);
> +               return tdx_gmem_max_mapping_level(kvm, pfn, is_private);
>
>         return 0;
>  }
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index b444714e8e8a..ca9c8ec7dd01 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -3318,8 +3318,11 @@ int tdx_vcpu_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
>         return ret;
>  }
>
> -int tdx_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn)
> +int tdx_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn, bool is_private)
>  {
> +       if (!is_private)
> +               return 0;
> +
>         return PG_LEVEL_4K;
>  }
>
> diff --git a/arch/x86/kvm/vmx/x86_ops.h b/arch/x86/kvm/vmx/x86_ops.h
> index 6037d1708485..4c70f56c57c8 100644
> --- a/arch/x86/kvm/vmx/x86_ops.h
> +++ b/arch/x86/kvm/vmx/x86_ops.h
> @@ -153,7 +153,7 @@ int tdx_vcpu_ioctl(struct kvm_vcpu *vcpu, void __user *argp);
>  void tdx_flush_tlb_current(struct kvm_vcpu *vcpu);
>  void tdx_flush_tlb_all(struct kvm_vcpu *vcpu);
>  void tdx_load_mmu_pgd(struct kvm_vcpu *vcpu, hpa_t root_hpa, int root_level);
> -int tdx_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn);
> +int tdx_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn, bool is_private);
>  #endif
>
>  #endif /* __KVM_X86_VMX_X86_OPS_H */
> --
> 2.50.1.552.g942d659e1b-goog
>

