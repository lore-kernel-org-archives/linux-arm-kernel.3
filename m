Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0285AE77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 09:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KifjnGKVqQ3XbGB/V/sFyzHQHhRGanZQhXvxaYt/h1o=; b=k3kDQeKhK/Gs1KMcU3FLO9euMD
	YPpUesTew8eiEjpZlHnpq6s9+jknRTj9LV0OCPSKGLKMc+Q9beY1x1DQrIX32Sqc3M+8sSP6PxFnD
	iFkSoMAcIk3XcBgVoFuAgWR3hscbPBKtSupOQr+67JtDg48xEZMsvTZSTVna2n9koWvnZPt94la40
	jGGt0XlNXEwVKg5iYH1y2cVrDkVUwKKYFWwmuUaxWPMd04AaE+djdf1dNI4vtAPHHLZLCMi/tI62Z
	0A3GNyoVxp678q+JDqcfl0ZVhycjsmrR1C87cukfVj3wyE+IMCVSx2zAWEtN9l9O0sL6bFYXSipFZ
	cSOkeN6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTcu-0000000CqvM-06RJ;
	Tue, 17 Dec 2024 09:12:24 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTLI-0000000Cmu7-0xc3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 08:54:13 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4361d5730caso27445e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 00:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734425651; x=1735030451; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KifjnGKVqQ3XbGB/V/sFyzHQHhRGanZQhXvxaYt/h1o=;
        b=OZgS1ItNahyrve93Lob1YJL1oFvxx0gSXtrM/ej8BAGLzl83TcojpuOG5liIXWPr10
         28OYa1JSdfs+qFBKRYfo4+E01lyvpfBD97UzXgFEDYQ17dpE6cDAtCtjW6UkrkcvaR8d
         ZZDXDn6vCyERx235eajfvtf/h3Dy/9NxNt0XyCQB0XsacH83AnZxoAAsJahNmuFZ/Q4U
         h4f+aSJatXWX9Pb/Mr//RgujM8tmVwfQ9OmN9CqaV0Z9a7DcNavUhYN1G/7ay1w6ghKY
         xqdkrC9I18zm5cDjFumiv2kJ6lqjrrtSMS7gRzo7BeRKNxxG2pkMk0donsl+YqV/dpMi
         bN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734425651; x=1735030451;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KifjnGKVqQ3XbGB/V/sFyzHQHhRGanZQhXvxaYt/h1o=;
        b=TvS4+SVY13DmIG2MvM9D8RcnTVIu7t5L+f2r49JER8QtOnuCfRHmJ0ScjNeWc+IZLo
         BuUo6EyR97UJrp6fvWrH610nTIht1jrzYOtaScp8AwzXxXfaysVglUmBmcwtJ5EmFqQv
         12bs4RCojBELFxOymBHI99ZUOzbamV3lkU4in05qp8bmA4FJXThN2TVC+2AHJZGlPUrR
         7XeV/YF+78SHaePmpexO+lRv4Y1l4uDfIpAoAbKj0bR6wWfL+CwNDFcvtnKHQrV9lHWb
         wXbM0abUm/6XgMeUxXFTmFFK60HHkPsVR2vIAW+0sF5+qRKL163qZ7yzfiy3a6KoJV1L
         RdlA==
X-Forwarded-Encrypted: i=1; AJvYcCV6Lm/D7NGuck3MG2JxaSYpHsDnyl8ki3w5k58eNpku21ksE3zp2dDBGikgnHiGy039z5AtfRuf6Z0m9beKQeYi@lists.infradead.org
X-Gm-Message-State: AOJu0YyJEaXqkBTwjG/ghCymQaLCgXEtLYSkA6VaaIYPUkouw5VcR9ps
	+9FECi7tqL9PfNlvSfxnOQcZ6lQ2/UkNWiMVBboacNL/MkxXs23sVPj+Hf8iyzh/DDUwsehKj6A
	CIo3RQD1ZW4UN1XGkC5HzRjgggvzF7RBMdy9T
X-Gm-Gg: ASbGncshIt3QXNgX8NfTmklUEWoYNJbqUWUHmg2JAOjZh0hRVWVeZfQeTIzFOionRbV
	zVBcu904HK6mAHG4X/1pGyUVf2OpmLpYnBX4JOwHhUjou2u/9o8xKcsVhwfzg/+mO87A=
X-Google-Smtp-Source: AGHT+IGO+h+C3q+EgS7FY8mjqUfew8qNlrw1ag/9aHnM+aCXQqiv7j2ErBqu43XDUVsb+Ip/LmfLThnGVSL5NVKFt2s=
X-Received: by 2002:a05:600c:5707:b0:434:f7fc:1b18 with SMTP id
 5b1f17b1804b1-436492cfbfamr901235e9.4.1734425650625; Tue, 17 Dec 2024
 00:54:10 -0800 (PST)
MIME-Version: 1.0
References: <20241216175803.2716565-1-qperret@google.com> <20241216175803.2716565-12-qperret@google.com>
In-Reply-To: <20241216175803.2716565-12-qperret@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Dec 2024 08:53:34 +0000
Message-ID: <CA+EHjTxRt=XoCZbRLE1UjMg4bzgoLYD9Lh0nzmjvPZ2Q4xQOkg@mail.gmail.com>
Subject: Re: [PATCH v3 11/18] KVM: arm64: Introduce __pkvm_host_unshare_guest()
To: Quentin Perret <qperret@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_005412_272319_26386D56 
X-CRM114-Status: GOOD (  21.89  )
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

On Mon, 16 Dec 2024 at 17:58, Quentin Perret <qperret@google.com> wrote:
>
> In preparation for letting the host unmap pages from non-protected
> guests, introduce a new hypercall implementing the host-unshare-guest
> transition.
>
> Signed-off-by: Quentin Perret <qperret@google.com>

Apart from nit below.
Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


> ---
>  arch/arm64/include/asm/kvm_asm.h              |  1 +
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
>  arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |  6 ++
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 21 ++++++
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 67 +++++++++++++++++++
>  arch/arm64/kvm/hyp/nvhe/pkvm.c                | 12 ++++
>  6 files changed, 108 insertions(+)
>
> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index 449337f5b2a3..0b6c4d325134 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -66,6 +66,7 @@ enum __kvm_host_smccc_func {
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_share_hyp,
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_hyp,
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_share_guest,
> +       __KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_guest,
>         __KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
>         __KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
>         __KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> index a7976e50f556..e528a42ed60e 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> @@ -40,6 +40,7 @@ int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
>  int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
>  int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
>  int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
> +int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
>
>  bool addr_is_memory(phys_addr_t phys);
>  int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> index be52c5b15e21..0cc2a429f1fb 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> @@ -64,6 +64,11 @@ static inline bool pkvm_hyp_vcpu_is_protected(struct pkvm_hyp_vcpu *hyp_vcpu)
>         return vcpu_is_protected(&hyp_vcpu->vcpu);
>  }
>
> +static inline bool pkvm_hyp_vm_is_protected(struct pkvm_hyp_vm *hyp_vm)
> +{
> +       return kvm_vm_is_protected(&hyp_vm->kvm);
> +}
> +
>  void pkvm_hyp_vm_table_init(void *tbl);
>
>  int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
> @@ -78,6 +83,7 @@ void pkvm_put_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu);
>  struct pkvm_hyp_vcpu *pkvm_get_loaded_hyp_vcpu(void);
>
>  struct pkvm_hyp_vm *get_pkvm_hyp_vm(pkvm_handle_t handle);
> +struct pkvm_hyp_vm *get_np_pkvm_hyp_vm(pkvm_handle_t handle);
>  void put_pkvm_hyp_vm(struct pkvm_hyp_vm *hyp_vm);
>
>  #endif /* __ARM64_KVM_NVHE_PKVM_H__ */
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index d659462fbf5d..3c3a27c985a2 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -244,6 +244,26 @@ static void handle___pkvm_host_share_guest(struct kvm_cpu_context *host_ctxt)
>         cpu_reg(host_ctxt, 1) =  ret;
>  }
>
> +static void handle___pkvm_host_unshare_guest(struct kvm_cpu_context *host_ctxt)
> +{
> +       DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
> +       DECLARE_REG(u64, gfn, host_ctxt, 2);
> +       struct pkvm_hyp_vm *hyp_vm;
> +       int ret = -EINVAL;
> +
> +       if (!is_protected_kvm_enabled())
> +               goto out;
> +
> +       hyp_vm = get_np_pkvm_hyp_vm(handle);
> +       if (!hyp_vm)
> +               goto out;
> +
> +       ret = __pkvm_host_unshare_guest(gfn, hyp_vm);
> +       put_pkvm_hyp_vm(hyp_vm);
> +out:
> +       cpu_reg(host_ctxt, 1) =  ret;
> +}
> +
>  static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
>  {
>         DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
> @@ -454,6 +474,7 @@ static const hcall_t host_hcall[] = {
>         HANDLE_FUNC(__pkvm_host_share_hyp),
>         HANDLE_FUNC(__pkvm_host_unshare_hyp),
>         HANDLE_FUNC(__pkvm_host_share_guest),
> +       HANDLE_FUNC(__pkvm_host_unshare_guest),
>         HANDLE_FUNC(__kvm_adjust_pc),
>         HANDLE_FUNC(__kvm_vcpu_run),
>         HANDLE_FUNC(__kvm_flush_vm_context),
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index fb9592e721cf..30243b7922f1 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -1421,3 +1421,70 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu,
>
>         return ret;
>  }
> +
> +static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ipa)

nit: This parameter in this patch, and others, is sometimes hyp_vm, at
others just vm. It would be nicer if it was always the same.


> +{
> +       enum pkvm_page_state state;
> +       struct hyp_page *page;
> +       kvm_pte_t pte;
> +       u64 phys;
> +       s8 level;
> +       int ret;
> +
> +       ret = kvm_pgtable_get_leaf(&vm->pgt, ipa, &pte, &level);
> +       if (ret)
> +               return ret;
> +       if (level != KVM_PGTABLE_LAST_LEVEL)
> +               return -E2BIG;
> +       if (!kvm_pte_valid(pte))
> +               return -ENOENT;
> +
> +       state = guest_get_page_state(pte, ipa);
> +       if (state != PKVM_PAGE_SHARED_BORROWED)
> +               return -EPERM;
> +
> +       phys = kvm_pte_to_phys(pte);
> +       ret = check_range_allowed_memory(phys, phys + PAGE_SIZE);
> +       if (WARN_ON(ret))
> +               return ret;
> +
> +       page = hyp_phys_to_page(phys);
> +       if (page->host_state != PKVM_PAGE_SHARED_OWNED)
> +               return -EPERM;
> +       if (WARN_ON(!page->host_share_guest_count))
> +               return -EINVAL;
> +
> +       *__phys = phys;
> +
> +       return 0;
> +}
> +
> +int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *vm)
> +{
> +       u64 ipa = hyp_pfn_to_phys(gfn);
> +       struct hyp_page *page;
> +       u64 phys;
> +       int ret;
> +
> +       host_lock_component();
> +       guest_lock_component(vm);
> +
> +       ret = __check_host_shared_guest(vm, &phys, ipa);
> +       if (ret)
> +               goto unlock;
> +
> +       ret = kvm_pgtable_stage2_unmap(&vm->pgt, ipa, PAGE_SIZE);
> +       if (ret)
> +               goto unlock;
> +
> +       page = hyp_phys_to_page(phys);
> +       page->host_share_guest_count--;
> +       if (!page->host_share_guest_count)
> +               WARN_ON(__host_set_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_OWNED));
> +
> +unlock:
> +       guest_unlock_component(vm);
> +       host_unlock_component();
> +
> +       return ret;
> +}
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index f2e363fe6b84..1b0982fa5ba8 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -376,6 +376,18 @@ void put_pkvm_hyp_vm(struct pkvm_hyp_vm *hyp_vm)
>         hyp_spin_unlock(&vm_table_lock);
>  }
>
> +struct pkvm_hyp_vm *get_np_pkvm_hyp_vm(pkvm_handle_t handle)
> +{
> +       struct pkvm_hyp_vm *hyp_vm = get_pkvm_hyp_vm(handle);
> +
> +       if (hyp_vm && pkvm_hyp_vm_is_protected(hyp_vm)) {
> +               put_pkvm_hyp_vm(hyp_vm);
> +               hyp_vm = NULL;
> +       }
> +
> +       return hyp_vm;
> +}
> +
>  static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struct kvm *host_kvm)
>  {
>         struct kvm *kvm = &hyp_vm->kvm;
> --
> 2.47.1.613.gc27f4b7a9f-goog
>

