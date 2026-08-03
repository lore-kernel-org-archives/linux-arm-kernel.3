Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC77C55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SrfiqAbkUXqCvf27Ok5o3KIsVichjIDlSrqK3qQT0e8=; b=MRa8SR60zR5zn+d5c4DWxzJiab
	9U1pZ6hWjf4w0ON9POczyFlg009jBL/ODN5ev5x4OW2XXFvXMwCjJrKrYrGQ/QeEMtZbZy303xxjR
	ZdwW6FRtazX9aRP2JP0fpV/0QFJggXpbtqGG9zr6bIpGORzvaeq16At6f/U9ODDUL6Bv9IvYQZOup
	mICAaWla7BfkA+8d8jkPXDaPGdGvDurd9KQCrJ25pe/v5T56hEJKWF0EDUd4C1bID90qDS97Mbolr
	qg4lekH5+vZWASBEPrsBVM0MklMyAMyptNLp0F4u8xnTniK1Rc3xH9g2OOqpqXGFdVIWMwqQRhJWU
	YeKz5zfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqqFt-0000000Gtjx-42sg;
	Mon, 03 Aug 2026 10:50:49 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqqFq-0000000GtjS-3YYL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 10:50:48 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c197eaaab00so521783266b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 03:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785754245; x=1786359045; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SrfiqAbkUXqCvf27Ok5o3KIsVichjIDlSrqK3qQT0e8=;
        b=I/s/lg/6UBSWPBcnwP/NrVQwI/xWDHcOTeK63MFMCTdr1dsS28Wp/4SqR+GHWyveyy
         SEciWcDRXzH6wLoKjKo2apNygd3J1QQAbVk6Btjq7JeqjaY6+ckZhEwCWSLDX/qzD5RN
         lYmSAhIPpV9XhU4mzBOZfqpiGDu5wTN4vbXdgc8zfBn4HSs2ekkViJKumI8ZjG7DwQkH
         Fatz1I/WaieH0RkUjULaKfb00ZX9zYDVvT8G//N6G0u5NlKuSR7EuNxmrlmQ/EF4DVS2
         4XGlcLCdnzSIYDIf140dFasRJ6fXpkPy/iQ3tq9mxnKkpIMw+GT6WNJQqzd6DjBS9LLB
         mNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785754245; x=1786359045;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SrfiqAbkUXqCvf27Ok5o3KIsVichjIDlSrqK3qQT0e8=;
        b=Ine5IlbFq0MynmJuBcQSJo5LsGsUrUi+7nxw2rigchs1c5GI5+wyELCu1jvo8OCSiI
         cDZYsbx5dp3E74rvUwdUjmdzfc+2r2GduETMPw1sVp78pfXWjMLpIt42S90kD+/fuDkW
         baEmRyMPPwt6AgL9l143SyQtnCmy/gZTj1ppErUQ4VWiJFhtuX1oGe0zQS/pIGgYFwVo
         a1Kr8iE/tlGWIrNW20JVnkIENNMBB++VXC0ddavxGLGW3V5LTo7WSjiEb1Xb+yxBP+Wi
         DVn8JHuMOi7SjS5FMrCUAJjrVE4QUpoO/1TdIWPMWQnY+HGF2RVJREbXwBqm55M7THCJ
         P0ZQ==
X-Forwarded-Encrypted: i=1; AHgh+RoBWsd0bzy1XxWo1N4DPw0/OVKMC8eGu5nfyViAJy3C9HVZ+gjIynTX8fFqLM0oHR/wV3Z8o8QYOM3huub7YUyI@lists.infradead.org
X-Gm-Message-State: AOJu0YxZdIMiuCog2iufZsoP7nejb6ziusvziFsAwi637Wr6h8lNE+kY
	3OzZWO/mf/j2wlpUZRZ5K7lJ8sQLtFanc1zZ+K3khsOI17php5rXrSUXaHspRl3h0A==
X-Gm-Gg: AR+sD11sFqZAgT6zj82BIaOLw7DY2I5nhaoBs5lW4Kijni/Fc5RRUyYFD+r8hdUAZ2P
	PKGT9ztlKHyvVT1Va4nD9EDdNoa6Yg5e1S2MhwxXBZAsKcmrWYnkO3LbwufMQWZHQO9y5YTFM9G
	kQ2gqsuBZKYbyRYAm2EwooOw3TDWJJJORn7zE2i0a69Dbkr1WNxWyi9eQie8kFq6MAgRil0LrKk
	L8wNzB4dnM7iDkrnhApmdUPwhXL8c4xOgb8Gd78MftIb6o4RRArJMZV76hCBfjqcVrTug0dA7kL
	lylmc1cN6mNm426/4hRgYXw20Q9RIW2jKCJbt8LZoNDEVOBMPsg9r3b2t3lbreKoFyW88nKrEIk
	UAa12GxNlIeyTGlcok+nGkbHUkJ20Uja7lsh1WdIj6rHlmT8mmxK5FfFCapLWYCBpMGh5CzgpWu
	euUV2ydwrFkEQOVU1pI9oAUcp8Ryq1lyDQkJyZAZ1Nk70hWOEoAO5RHurKMUFFIhWJoi087+Hg9
	79tu2wBwoxS6RmsnFWUVA9EKCB7+CWk
X-Received: by 2002:a17:906:c40a:b0:c15:d6c8:2816 with SMTP id a640c23a62f3a-c1fe8230c0bmr497154566b.27.1785754244148;
        Mon, 03 Aug 2026 03:50:44 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c201265eb75sm81014766b.3.2026.08.03.03.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:50:42 -0700 (PDT)
Date: Mon, 3 Aug 2026 11:50:38 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org,
	rostedt@goodmis.org, mhiramat@kernel.org, alexandru.elisei@arm.com,
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, qperret@google.com, ardb@kernel.org,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	tabba@google.com
Subject: Re: [PATCH v1 11/11] KVM: arm64: Tag host-VA hypercall parameters
 __hostva
Message-ID: <anByfvv9scyNuHrJ@google.com>
References: <20260720161343.1367007-1-fuad.tabba@linux.dev>
 <20260720162412.1401272-1-fuad.tabba@linux.dev>
 <20260720162412.1401272-2-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720162412.1401272-2-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_035047_036659_BA1303B0 
X-CRM114-Status: GOOD (  31.20  )
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

On Mon, Jul 20, 2026 at 05:24:12PM +0100, Fuad Tabba wrote:
> The nVHE hypervisor takes host virtual addresses as hypercall arguments
> and translates each with kern_hyp_va() before use. Nothing marks them as
> host-owned, so dereferencing one untranslated at EL2 - a recurring bug
> class - is invisible to the compiler.
> 
> Add a __hostva sparse address space, active only for EL2 code, and tag
> the host-VA parameters in the hypercall declarations. kern_hyp_va_host()
> is the only sanctioned unwrap: it translates the address, preserves the
> pointee type (stripped of qualifiers, as with the percpu accessors) and
> drops the tag with a __force cast, so an untranslated host VA fails
> sparse. The tag flows from the shared declaration into the generated
> handler and on into the donated-memory and tracing-descriptor helpers,
> so a handler cannot extract a host VA without it. Host code sees plain
> pointers, and the tag is checker-only: no code is generated.
> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/include/asm/kvm_hcall.h      | 43 ++++++++++++-------
>  arch/arm64/include/asm/kvm_mmu.h        | 10 +++++
>  arch/arm64/kvm/hyp/include/nvhe/pkvm.h  |  6 ++-
>  arch/arm64/kvm/hyp/include/nvhe/trace.h |  5 ++-
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c      | 57 +++++++++++++------------
>  arch/arm64/kvm/hyp/nvhe/pkvm.c          | 11 ++---
>  arch/arm64/kvm/hyp/nvhe/trace.c         |  4 +-
>  7 files changed, 82 insertions(+), 54 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_hcall.h b/arch/arm64/include/asm/kvm_hcall.h
> index 6aa2df90a14a4..3033a6ba1462a 100644
> --- a/arch/arm64/include/asm/kvm_hcall.h
> +++ b/arch/arm64/include/asm/kvm_hcall.h
> @@ -27,6 +27,18 @@ struct kvm_vcpu;
>  struct vgic_v3_cpu_if;
>  struct vgic_v5_cpu_if;
>  
> +/*
> + * A host VA carried by a hypercall argument. At EL2 such a pointer must not
> + * be dereferenced until it is translated with kern_hyp_va_host(); sparse
> + * flags any use that skips the translation. The tag describes the EL2 view
> + * only: the host dereferences its own VAs freely.
> + */
> +#if defined(__KVM_NVHE_HYPERVISOR__) && defined(__CHECKER__)
> +#define __hostva	__attribute__((noderef, address_space(__hostva)))
> +#else
> +#define __hostva
> +#endif

Could we have __kern, just like we have __user. 

Ideally this could be used later to mark the values we don't trust, so not only
VAs but also nr_pages. In mem_protect.c e.g.

size_t pfn_range_is_valid(u64 __kern pfn, u64 __kern nr_pages) 

so that size is only trusted once pfn_range_is_valid() has run.

And beside, that matches "kern_hyp_va" 

> +
>  /*
>   * Hypercall signatures are declared as (type, name) argument pairs.
>   * __KVM_HCALL_MAP() applies a macro to each pair, in the mold of __MAP()
> @@ -157,24 +169,24 @@ DECLARE_KVM_HOST_HCALL0(int, __pkvm_prot_finalize)
>  
>  /* Hypercalls that are always available and common to [nh]VHE/pKVM. */
>  DECLARE_KVM_HOST_HCALL_VOID(__kvm_adjust_pc, 1,
> -	struct kvm_vcpu *, vcpu)
> +	struct kvm_vcpu __hostva *, vcpu)
>  DECLARE_KVM_HOST_HCALL(int, __kvm_vcpu_run, 1,
> -	struct kvm_vcpu *, vcpu)
> +	struct kvm_vcpu __hostva *, vcpu)
>  DECLARE_KVM_HOST_HCALL0_VOID(__kvm_flush_vm_context)
>  DECLARE_KVM_HOST_HCALL_VOID(__kvm_tlb_flush_vmid_ipa, 3,
> -	struct kvm_s2_mmu *, mmu, phys_addr_t, ipa, int, level)
> +	struct kvm_s2_mmu __hostva *, mmu, phys_addr_t, ipa, int, level)
>  DECLARE_KVM_HOST_HCALL_VOID(__kvm_tlb_flush_vmid_ipa_nsh, 3,
> -	struct kvm_s2_mmu *, mmu, phys_addr_t, ipa, int, level)
> +	struct kvm_s2_mmu __hostva *, mmu, phys_addr_t, ipa, int, level)
>  DECLARE_KVM_HOST_HCALL_VOID(__kvm_tlb_flush_vmid, 1,
> -	struct kvm_s2_mmu *, mmu)
> +	struct kvm_s2_mmu __hostva *, mmu)
>  DECLARE_KVM_HOST_HCALL_VOID(__kvm_tlb_flush_vmid_range, 3,
> -	struct kvm_s2_mmu *, mmu, phys_addr_t, start, unsigned long, pages)
> +	struct kvm_s2_mmu __hostva *, mmu, phys_addr_t, start, unsigned long, pages)
>  DECLARE_KVM_HOST_HCALL_VOID(__kvm_flush_cpu_context, 1,
> -	struct kvm_s2_mmu *, mmu)
> +	struct kvm_s2_mmu __hostva *, mmu)
>  DECLARE_KVM_HOST_HCALL_VOID(__kvm_timer_set_cntvoff, 1,
>  	u64, cntvoff)
>  DECLARE_KVM_HOST_HCALL(int, __tracing_load, 2,
> -	void *, desc_hva, size_t, desc_size)
> +	void __hostva *, desc_hva, size_t, desc_size)
>  DECLARE_KVM_HOST_HCALL0_VOID(__tracing_unload)
>  DECLARE_KVM_HOST_HCALL(int, __tracing_enable, 1,
>  	bool, enable)
> @@ -189,13 +201,13 @@ DECLARE_KVM_HOST_HCALL(int, __tracing_enable_event, 2,
>  DECLARE_KVM_HOST_HCALL_VOID(__tracing_write_event, 1,
>  	u64, id)
>  DECLARE_KVM_HOST_HCALL_VOID(__vgic_v3_save_aprs, 1,
> -	struct vgic_v3_cpu_if *, cpu_if)
> +	struct vgic_v3_cpu_if __hostva *, cpu_if)
>  DECLARE_KVM_HOST_HCALL_VOID(__vgic_v3_restore_vmcr_aprs, 1,
> -	struct vgic_v3_cpu_if *, cpu_if)
> +	struct vgic_v3_cpu_if __hostva *, cpu_if)
>  DECLARE_KVM_HOST_HCALL_VOID(__vgic_v5_save_apr, 1,
> -	struct vgic_v5_cpu_if *, cpu_if)
> +	struct vgic_v5_cpu_if __hostva *, cpu_if)
>  DECLARE_KVM_HOST_HCALL_VOID(__vgic_v5_restore_vmcr_apr, 1,
> -	struct vgic_v5_cpu_if *, cpu_if)
> +	struct vgic_v5_cpu_if __hostva *, cpu_if)
>  
>  /* Hypercalls that are available only when pKVM has finalised. */
>  DECLARE_KVM_HOST_HCALL(int, __pkvm_host_share_hyp, 1,
> @@ -220,10 +232,11 @@ DECLARE_KVM_HOST_HCALL0(int, __pkvm_reserve_vm)
>  DECLARE_KVM_HOST_HCALL_VOID(__pkvm_unreserve_vm, 1,
>  	pkvm_handle_t, handle)
>  DECLARE_KVM_HOST_HCALL(int, __pkvm_init_vm, 3,
> -	struct kvm *, host_kvm, void *, vm_hva, void *, pgd_hva)
> +	struct kvm __hostva *, host_kvm, void __hostva *, vm_hva,
> +	void __hostva *, pgd_hva)
>  DECLARE_KVM_HOST_HCALL(int, __pkvm_init_vcpu, 3,
> -	pkvm_handle_t, handle, struct kvm_vcpu *, host_vcpu,
> -	void *, vcpu_hva)
> +	pkvm_handle_t, handle, struct kvm_vcpu __hostva *, host_vcpu,
> +	void __hostva *, vcpu_hva)
>  DECLARE_KVM_HOST_HCALL0(int, __pkvm_vcpu_in_poison_fault)
>  DECLARE_KVM_HOST_HCALL(int, __pkvm_force_reclaim_guest_page, 1,
>  	phys_addr_t, phys)
> diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
> index 6eae7e7e2a684..55fac40377c03 100644
> --- a/arch/arm64/include/asm/kvm_mmu.h
> +++ b/arch/arm64/include/asm/kvm_mmu.h
> @@ -7,6 +7,8 @@
>  #ifndef __ARM64_KVM_MMU_H__
>  #define __ARM64_KVM_MMU_H__
>  
> +#include <linux/compiler.h>
> +
>  #include <asm/page.h>
>  #include <asm/memory.h>
>  #include <asm/mmu.h>
> @@ -140,6 +142,14 @@ static __always_inline unsigned long __kern_hyp_va(unsigned long v)
>  
>  #define kern_hyp_va(v) 	((typeof(v))(__kern_hyp_va((unsigned long)(v))))
>  
> +/*
> + * Translate a __hostva-tagged host VA, dropping the tag: the only sanctioned
> + * unwrap. Translation only, no ownership or bounds validation; the result
> + * carries the pointee type stripped of the tag and of any cv-qualifiers.
> + */
> +#define kern_hyp_va_host(v)						\
> +	((TYPEOF_UNQUAL(*(v)) *)__kern_hyp_va((unsigned long)(__force void *)(v)))
> +
>  extern u32 __hyp_va_bits;
>  
>  /*
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> index 2643a1a819668..dcbe8b8913270 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> @@ -7,6 +7,7 @@
>  #ifndef __ARM64_KVM_NVHE_PKVM_H__
>  #define __ARM64_KVM_NVHE_PKVM_H__
>  
> +#include <asm/kvm_hcall.h>
>  #include <asm/kvm_pkvm.h>
>  
>  #include <nvhe/gfp.h>
> @@ -69,9 +70,10 @@ void pkvm_hyp_vm_table_init(void *tbl);
>  
>  int __pkvm_reserve_vm(void);
>  void __pkvm_unreserve_vm(pkvm_handle_t handle);
> -int __pkvm_init_vm(struct kvm *host_kvm, void *vm_hva, void *pgd_hva);
> +int __pkvm_init_vm(struct kvm *host_kvm, void __hostva *vm_hva,
> +		   void __hostva *pgd_hva);
>  int __pkvm_init_vcpu(pkvm_handle_t handle, struct kvm_vcpu *host_vcpu,
> -		     void *vcpu_hva);
> +		     void __hostva *vcpu_hva);
>  
>  int __pkvm_reclaim_dying_guest_page(pkvm_handle_t handle, u64 gfn);
>  int __pkvm_start_teardown_vm(pkvm_handle_t handle);
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/trace.h b/arch/arm64/kvm/hyp/include/nvhe/trace.h
> index 4aa36fd76b9e2..58e0ad3329034 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/trace.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/trace.h
> @@ -4,6 +4,7 @@
>  
>  #include <linux/trace_remote_event.h>
>  
> +#include <asm/kvm_hcall.h>
>  #include <asm/kvm_hyptrace.h>
>  
>  static inline pid_t __tracing_get_vcpu_pid(struct kvm_cpu_context *host_ctxt)
> @@ -46,7 +47,7 @@ static inline pid_t __tracing_get_vcpu_pid(struct kvm_cpu_context *host_ctxt)
>  void *tracing_reserve_entry(unsigned long length);
>  void tracing_commit_entry(void);
>  
> -int __tracing_load(void *desc_va, size_t desc_size);
> +int __tracing_load(void __hostva *desc_va, size_t desc_size);
>  void __tracing_unload(void);
>  int __tracing_enable(bool enable);
>  int __tracing_swap_reader(unsigned int cpu);
> @@ -59,7 +60,7 @@ static inline void tracing_commit_entry(void) { }
>  #define HYP_EVENT(__name, __proto, __struct, __assign, __printk)      \
>  	static inline void trace_##__name(__proto) {}
>  
> -static inline int __tracing_load(void *desc_va, size_t desc_size) { return -ENODEV; }
> +static inline int __tracing_load(void __hostva *desc_va, size_t desc_size) { return -ENODEV; }
>  static inline void __tracing_unload(void) { }
>  static inline int __tracing_enable(bool enable) { return -ENODEV; }
>  static inline int __tracing_swap_reader(unsigned int cpu) { return -ENODEV; }
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index f2501249f4391..679b6df9c998d 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -269,7 +269,7 @@ DEFINE_KVM_HOST_HCALL0_VOID(__pkvm_vcpu_put)
>  }
>  
>  DEFINE_KVM_HOST_HCALL(int, __kvm_vcpu_run, 1,
> -	struct kvm_vcpu *, host_vcpu)
> +	struct kvm_vcpu __hostva *, host_vcpu)
>  {
>  	int ret;
>  
> @@ -294,7 +294,7 @@ DEFINE_KVM_HOST_HCALL(int, __kvm_vcpu_run, 1,
>  
>  		sync_hyp_vcpu(hyp_vcpu);
>  	} else {
> -		struct kvm_vcpu *vcpu = kern_hyp_va(host_vcpu);
> +		struct kvm_vcpu *vcpu = kern_hyp_va_host(host_vcpu);
>  
>  		/* The host is fully trusted, run its vCPU directly. */
>  		fpsimd_lazy_switch_to_guest(vcpu);
> @@ -421,9 +421,9 @@ DEFINE_KVM_HOST_HCALL(int, __pkvm_host_mkyoung_guest, 1,
>  }
>  
>  DEFINE_KVM_HOST_HCALL_VOID(__kvm_adjust_pc, 1,
> -	struct kvm_vcpu *, vcpu)
> +	struct kvm_vcpu __hostva *, vcpu)
>  {
> -	__kvm_adjust_pc(kern_hyp_va(vcpu));
> +	__kvm_adjust_pc(kern_hyp_va_host(vcpu));
>  }
>  
>  DEFINE_KVM_HOST_HCALL0_VOID(__kvm_flush_vm_context)
> @@ -432,27 +432,27 @@ DEFINE_KVM_HOST_HCALL0_VOID(__kvm_flush_vm_context)
>  }
>  
>  DEFINE_KVM_HOST_HCALL_VOID(__kvm_tlb_flush_vmid_ipa, 3,
> -	struct kvm_s2_mmu *, mmu, phys_addr_t, ipa, int, level)
> +	struct kvm_s2_mmu __hostva *, mmu, phys_addr_t, ipa, int, level)
>  {
> -	__kvm_tlb_flush_vmid_ipa(kern_hyp_va(mmu), ipa, level);
> +	__kvm_tlb_flush_vmid_ipa(kern_hyp_va_host(mmu), ipa, level);
>  }
>  
>  DEFINE_KVM_HOST_HCALL_VOID(__kvm_tlb_flush_vmid_ipa_nsh, 3,
> -	struct kvm_s2_mmu *, mmu, phys_addr_t, ipa, int, level)
> +	struct kvm_s2_mmu __hostva *, mmu, phys_addr_t, ipa, int, level)
>  {
> -	__kvm_tlb_flush_vmid_ipa_nsh(kern_hyp_va(mmu), ipa, level);
> +	__kvm_tlb_flush_vmid_ipa_nsh(kern_hyp_va_host(mmu), ipa, level);
>  }
>  
>  DEFINE_KVM_HOST_HCALL_VOID(__kvm_tlb_flush_vmid_range, 3,
> -	struct kvm_s2_mmu *, mmu, phys_addr_t, start, unsigned long, pages)
> +	struct kvm_s2_mmu __hostva *, mmu, phys_addr_t, start, unsigned long, pages)
>  {
> -	__kvm_tlb_flush_vmid_range(kern_hyp_va(mmu), start, pages);
> +	__kvm_tlb_flush_vmid_range(kern_hyp_va_host(mmu), start, pages);
>  }
>  
>  DEFINE_KVM_HOST_HCALL_VOID(__kvm_tlb_flush_vmid, 1,
> -	struct kvm_s2_mmu *, mmu)
> +	struct kvm_s2_mmu __hostva *, mmu)
>  {
> -	__kvm_tlb_flush_vmid(kern_hyp_va(mmu));
> +	__kvm_tlb_flush_vmid(kern_hyp_va_host(mmu));
>  }
>  
>  DEFINE_KVM_HOST_HCALL_VOID(__pkvm_tlb_flush_vmid, 1,
> @@ -468,9 +468,9 @@ DEFINE_KVM_HOST_HCALL_VOID(__pkvm_tlb_flush_vmid, 1,
>  }
>  
>  DEFINE_KVM_HOST_HCALL_VOID(__kvm_flush_cpu_context, 1,
> -	struct kvm_s2_mmu *, mmu)
> +	struct kvm_s2_mmu __hostva *, mmu)
>  {
> -	__kvm_flush_cpu_context(kern_hyp_va(mmu));
> +	__kvm_flush_cpu_context(kern_hyp_va_host(mmu));
>  }
>  
>  DEFINE_KVM_HOST_HCALL_VOID(__kvm_timer_set_cntvoff, 1,
> @@ -499,15 +499,15 @@ DEFINE_KVM_HOST_HCALL0_VOID(__vgic_v3_init_lrs)
>  }
>  
>  DEFINE_KVM_HOST_HCALL_VOID(__vgic_v3_save_aprs, 1,
> -	struct vgic_v3_cpu_if *, cpu_if)
> +	struct vgic_v3_cpu_if __hostva *, cpu_if)
>  {
> -	__vgic_v3_save_aprs(kern_hyp_va(cpu_if));
> +	__vgic_v3_save_aprs(kern_hyp_va_host(cpu_if));
>  }
>  
>  DEFINE_KVM_HOST_HCALL_VOID(__vgic_v3_restore_vmcr_aprs, 1,
> -	struct vgic_v3_cpu_if *, cpu_if)
> +	struct vgic_v3_cpu_if __hostva *, cpu_if)
>  {
> -	__vgic_v3_restore_vmcr_aprs(kern_hyp_va(cpu_if));
> +	__vgic_v3_restore_vmcr_aprs(kern_hyp_va_host(cpu_if));
>  }
>  
>  DEFINE_KVM_HOST_HCALL(int, __pkvm_init, 4,
> @@ -579,16 +579,17 @@ DEFINE_KVM_HOST_HCALL_VOID(__pkvm_unreserve_vm, 1,
>  }
>  
>  DEFINE_KVM_HOST_HCALL(int, __pkvm_init_vm, 3,
> -	struct kvm *, host_kvm, void *, vm_hva, void *, pgd_hva)
> +	struct kvm __hostva *, host_kvm, void __hostva *, vm_hva,
> +	void __hostva *, pgd_hva)
>  {
> -	return __pkvm_init_vm(kern_hyp_va(host_kvm), vm_hva, pgd_hva);
> +	return __pkvm_init_vm(kern_hyp_va_host(host_kvm), vm_hva, pgd_hva);
>  }
>  
>  DEFINE_KVM_HOST_HCALL(int, __pkvm_init_vcpu, 3,
> -	pkvm_handle_t, handle, struct kvm_vcpu *, host_vcpu,
> -	void *, vcpu_hva)
> +	pkvm_handle_t, handle, struct kvm_vcpu __hostva *, host_vcpu,
> +	void __hostva *, vcpu_hva)
>  {
> -	return __pkvm_init_vcpu(handle, kern_hyp_va(host_vcpu), vcpu_hva);
> +	return __pkvm_init_vcpu(handle, kern_hyp_va_host(host_vcpu), vcpu_hva);
>  }
>  
>  DEFINE_KVM_HOST_HCALL0(int, __pkvm_vcpu_in_poison_fault)
> @@ -623,7 +624,7 @@ DEFINE_KVM_HOST_HCALL(int, __pkvm_finalize_teardown_vm, 1,
>  }
>  
>  DEFINE_KVM_HOST_HCALL(int, __tracing_load, 2,
> -	void *, desc_hva, size_t, desc_size)
> +	void __hostva *, desc_hva, size_t, desc_size)
>  {
>  	return __tracing_load(desc_hva, desc_size);
>  }
> @@ -670,15 +671,15 @@ DEFINE_KVM_HOST_HCALL_VOID(__tracing_write_event, 1,
>  }
>  
>  DEFINE_KVM_HOST_HCALL_VOID(__vgic_v5_save_apr, 1,
> -	struct vgic_v5_cpu_if *, cpu_if)
> +	struct vgic_v5_cpu_if __hostva *, cpu_if)
>  {
> -	__vgic_v5_save_apr(kern_hyp_va(cpu_if));
> +	__vgic_v5_save_apr(kern_hyp_va_host(cpu_if));
>  }
>  
>  DEFINE_KVM_HOST_HCALL_VOID(__vgic_v5_restore_vmcr_apr, 1,
> -	struct vgic_v5_cpu_if *, cpu_if)
> +	struct vgic_v5_cpu_if __hostva *, cpu_if)
>  {
> -	__vgic_v5_restore_vmcr_apr(kern_hyp_va(cpu_if));
> +	__vgic_v5_restore_vmcr_apr(kern_hyp_va_host(cpu_if));
>  }
>  
>  typedef void (*hcall_t)(struct kvm_cpu_context *);
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index 205c52535c887..bfc9f07f336a1 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -644,9 +644,9 @@ static size_t pkvm_get_hyp_vm_size(unsigned int nr_vcpus)
>  		size_mul(sizeof(struct pkvm_hyp_vcpu *), nr_vcpus));
>  }
>  
> -static void *map_donated_memory_noclear(void *host_va, size_t size)
> +static void *map_donated_memory_noclear(void __hostva *host_va, size_t size)
>  {
> -	void *va = kern_hyp_va(host_va);
> +	void *va = kern_hyp_va_host(host_va);
>  
>  	if (!PAGE_ALIGNED(va))
>  		return NULL;
> @@ -658,7 +658,7 @@ static void *map_donated_memory_noclear(void *host_va, size_t size)
>  	return va;
>  }
>  
> -static void *map_donated_memory(void *host_va, size_t size)
> +static void *map_donated_memory(void __hostva *host_va, size_t size)
>  {
>  	void *va = map_donated_memory_noclear(host_va, size);
>  
> @@ -805,7 +805,8 @@ void teardown_selftest_vm(void)
>   *
>   * Return 0 success, negative error code on failure.
>   */
> -int __pkvm_init_vm(struct kvm *host_kvm, void *vm_hva, void *pgd_hva)
> +int __pkvm_init_vm(struct kvm *host_kvm, void __hostva *vm_hva,
> +		   void __hostva *pgd_hva)
>  {
>  	struct pkvm_hyp_vm *hyp_vm = NULL;
>  	size_t vm_size, pgd_size;
> @@ -896,7 +897,7 @@ static int register_hyp_vcpu(struct pkvm_hyp_vm *hyp_vm,
>  }
>  
>  int __pkvm_init_vcpu(pkvm_handle_t handle, struct kvm_vcpu *host_vcpu,
> -		     void *vcpu_hva)
> +		     void __hostva *vcpu_hva)
>  {
>  	struct pkvm_hyp_vcpu *hyp_vcpu;
>  	struct pkvm_hyp_vm *hyp_vm;
> diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
> index 97203ddd3cf45..5d0fcdce9507d 100644
> --- a/arch/arm64/kvm/hyp/nvhe/trace.c
> +++ b/arch/arm64/kvm/hyp/nvhe/trace.c
> @@ -206,9 +206,9 @@ static bool hyp_trace_desc_is_valid(struct hyp_trace_desc *desc, size_t desc_siz
>  	return true;
>  }
>  
> -int __tracing_load(void *desc_hva, size_t desc_size)
> +int __tracing_load(void __hostva *desc_hva, size_t desc_size)
>  {
> -	struct hyp_trace_desc *desc = kern_hyp_va(desc_hva);
> +	struct hyp_trace_desc *desc = kern_hyp_va_host(desc_hva);
>  	int ret;
>  
>  	ret = __admit_host_mem(desc, desc_size);
> -- 
> 2.39.5
> 

-- 
Vincent

