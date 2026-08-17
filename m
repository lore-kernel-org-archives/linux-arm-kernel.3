Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29390C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 13:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQbbwXRwsGg+5DQxFAP2p7EhWbMy0GwB4Qout9kJBvk=; b=43+u6F2Mrgy2DmYx4zYKQWcP1p
	+WjphIqix75b0h5sFupKMV9nrbkbePyXioAWOV3d4/TuWjevin9VddRs4dpLvtlNnWqp1NEg6X1cF
	SJ/qWCArOLtS2b9Md1dYSzMXOrk2H9JASPRsIoStFLW0yl5K1JYByfy/qobgAf360S6kIcbXAXS7R
	f+XFHcdXG/x5Jp1FXA2fgemBirrxj3OgKUuO/4AAGMIrJBW7RZJGVVilHbGWHkSX3rOFIsThCW3C0
	HYBMbpYnGaKZYl7MVWOFnL6AgzlU038DVFeZUt6nenicXW0GuukktHWlnnACT+ZlZ5SDjT/fYZ3oF
	1lZj1p0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxYu-00000006EIy-1UgG;
	Mon, 17 Aug 2026 13:39:36 +0000
Received: from out-137.mta1.migadu.com ([2001:41d0:203:375::89] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxYq-00000006EIa-2dDD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 13:39:34 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=KcVp/1fJnqJBuaB0ZDe7+Nc6xjwsaG94W8vZoTy51xg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786973969; v=1; x=1787578769;
 b=D5O0+6SIJ+LdcFRXcedVRwH34O3lNiMvzAAYzAeXTAeKmvl7EWmzQJZBr01KOA/D/Idxtd/A
 QcN4r+oRDfxbZc5zmPUy+OVTSiJ1XDh+Bnbcfc2lmEKq+uYathz+6QME9xbe+hNVQ94xukCTwfF
 5KKTE5FivRDOlzXIK0DtpBN4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from mail-lf1-f54.google.com (209.85.167.54)
	by smtp.migadu.com with ESMTPS id 2f4d3b59bc350621;
	Mon, 17 Aug 2026 13:39:29 +0000
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b2a8173142so2476e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 06:39:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrngiVjfqyLFtOPPlrjWFK/Dl7NlNyVmgEaiXr1ZkPcKB5/v0MG9do6tlY7ksN8CSC8sMULbn9TEBxedKIsS9ty@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5URD0UY6YE8u7O3hTnlYNrjm1j4khSMdGZDQJz4N0wZihf8wl
	fxDTEi+VmZJ5n61n+yj18iWmr95exTe4V7CXDkwmWK4YF/Yhy06BYVHRSlD8sLHLW1btKyKtW2w
	drf8ZoJWXUPKeFWLaICoJw7pc+HEvOGQS42epClOz
X-Received: by 2002:a05:6512:3b8b:b0:5b1:ca0b:25d2 with SMTP id
 2adb3069b0e04-5b4707f7928mr7180e87.4.1786973968367; Mon, 17 Aug 2026 06:39:28
 -0700 (PDT)
MIME-Version: 1.0
References: <20260731143541.956291-1-vdonnefort@google.com> <20260731143541.956291-14-vdonnefort@google.com>
In-Reply-To: <20260731143541.956291-14-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 17 Aug 2026 14:38:51 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzutNyarb02Hf89i_hy7AvHJax7ntPP4Vutvv+55-DEYA@mail.gmail.com>
X-Gm-Features: AcwNN1XK3sFQsVm12Mp4_homFe-Y3YvqYEb_xPrUoMLUgRmukyJty_u1Q8KT9xM
Message-ID: <CA+EHjTzutNyarb02Hf89i_hy7AvHJax7ntPP4Vutvv+55-DEYA@mail.gmail.com>
Subject: Re: [PATCH v4 13/17] KVM: arm64: Alloc pkvm_hyp_vm using pKVM heap allocator
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_063932_879125_6FA42CF4 
X-CRM114-Status: GOOD (  26.39  )
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

On Fri, 31 Jul 2026 at 15:36, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> Transition the allocation of the hypervisor VM state structure
> (pkvm_hyp_vm) from the host to the hypervisor using
> the new pKVM heap allocator (hyp_alloc()).
>
> Previously, the host was responsible for calculating the size of,
> allocating, and donating memory for pkvm_hyp_vm during VM creation. With
> the heap allocator in place, the hypervisor now allocates this structure
> dynamically at EL2.
>
> Use the pkvm_call_hyp_req() wrapper in the host to invoke
> __pkvm_init_vm, which automatically handles any top-up requests if the
> hypervisor runs out of heap memory during allocation.
>
> Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
>
> diff --git a/arch/arm64/kvm/hyp/hyp-constants.c b/arch/arm64/kvm/hyp/hyp-constants.c
> index b257a3b4bfc5..501ab35a3840 100644
> --- a/arch/arm64/kvm/hyp/hyp-constants.c
> +++ b/arch/arm64/kvm/hyp/hyp-constants.c
> @@ -7,7 +7,6 @@
>  int main(void)
>  {
>         DEFINE(STRUCT_HYP_PAGE_SIZE,    sizeof(struct hyp_page));
> -       DEFINE(PKVM_HYP_VM_SIZE,        sizeof(struct pkvm_hyp_vm));
>         DEFINE(PKVM_HYP_VCPU_SIZE,      sizeof(struct pkvm_hyp_vcpu));
>         return 0;
>  }
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> index 624367d0ef5b..8e930c8729af 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> @@ -82,8 +82,7 @@ void pkvm_hyp_vm_table_init(void *tbl);
>
>  int __pkvm_reserve_vm(void);
>  void __pkvm_unreserve_vm(pkvm_handle_t handle);
> -int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
> -                  unsigned long pgd_hva);
> +int __pkvm_init_vm(struct kvm *host_kvm, void *pgd);
>  int __pkvm_init_vcpu(pkvm_handle_t handle, struct kvm_vcpu *host_vcpu,
>                      unsigned long vcpu_hva);
>
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index d99c9b1b0c82..c1aa6d773c26 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -575,14 +575,35 @@ static void handle___pkvm_unreserve_vm(struct kvm_cpu_context *host_ctxt)
>         __pkvm_unreserve_vm(handle);
>  }
>
> +static void errno_to_smccc(int ret, struct kvm_cpu_context *host_ctxt)
> +{
> +       struct pkvm_hyp_req req = { .type = PKVM_HYP_NO_REQ };
> +
> +       switch (ret) {
> +       case -ENOMEM: {
> +               u32 nr_pages = hyp_alloc_topup_needed();
> +
> +               if (nr_pages) {
> +                       req.type = PKVM_HYP_REQ_HYP_ALLOC;
> +                       req.mem.nr_pages = nr_pages;
> +               }
> +               break;
> +       }
> +       }
> +
> +       cpu_reg(host_ctxt, 1) = ret;
> +       pkvm_hyp_req_to_smccc(host_ctxt, &req);
> +}
> +
>  static void handle___pkvm_init_vm(struct kvm_cpu_context *host_ctxt)
>  {
>         DECLARE_REG(struct kvm *, host_kvm, host_ctxt, 1);
> -       DECLARE_REG(unsigned long, vm_hva, host_ctxt, 2);
> -       DECLARE_REG(unsigned long, pgd_hva, host_ctxt, 3);
> +       DECLARE_REG(unsigned long, pgd_hva, host_ctxt, 2);
> +       void *pgd;
>
>         host_kvm = kern_hyp_va(host_kvm);
> -       cpu_reg(host_ctxt, 1) = __pkvm_init_vm(host_kvm, vm_hva, pgd_hva);
> +       pgd = (void *)kern_hyp_va(pgd_hva);
> +       errno_to_smccc(__pkvm_init_vm(host_kvm, pgd), host_ctxt);
>  }
>
>  static void handle___pkvm_init_vcpu(struct kvm_cpu_context *host_ctxt)
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index 079d6f397893..09f609db8556 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -11,6 +11,7 @@
>
>  #include <asm/kvm_emulate.h>
>
> +#include <nvhe/alloc.h>
>  #include <nvhe/mem_protect.h>
>  #include <nvhe/memory.h>
>  #include <nvhe/pkvm.h>
> @@ -797,24 +798,22 @@ void teardown_selftest_vm(void)
>   * Unmap the donated memory from the host at stage 2.
>   *
>   * host_kvm: A pointer to the host's struct kvm.
> - * vm_hva: The host va of the area being donated for the VM state.
> - *        Must be page aligned.
> - * pgd_hva: The host va of the area being donated for the stage-2 PGD for
> - *         the VM. Must be page aligned. Its size is implied by the VM's
> - *         VTCR.
> + * pgd: The va of the area being donated for the stage-2 PGD for the VM. Must
> + *      be page aligned. Its size is implied by the VM's VTCR.
>   *
>   * Return 0 success, negative error code on failure.
>   */
> -int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
> -                  unsigned long pgd_hva)
> +int __pkvm_init_vm(struct kvm *host_kvm, void *pgd)
>  {
>         struct pkvm_hyp_vm *hyp_vm = NULL;
>         size_t vm_size, pgd_size;
>         unsigned int nr_vcpus;
>         pkvm_handle_t handle;
> -       void *pgd = NULL;
>         int ret;
>
> +       if (!PAGE_ALIGNED(pgd))
> +               return -EINVAL;
> +
>         ret = hyp_pin_shared_mem(host_kvm, host_kvm + 1);
>         if (ret)
>                 return ret;
> @@ -834,15 +833,15 @@ int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
>         vm_size = pkvm_get_hyp_vm_size(nr_vcpus);
>         pgd_size = kvm_pgtable_stage2_pgd_size(host_mmu.arch.mmu.vtcr);
>
> -       ret = -ENOMEM;
> +       hyp_vm = hyp_alloc(vm_size);
> +       if (!hyp_vm) {
> +               ret = hyp_alloc_errno();
> +               goto err_unpin_kvm;
> +       }
>
> -       hyp_vm = map_donated_memory(vm_hva, vm_size);
> -       if (!hyp_vm)
> -               goto err_remove_mappings;
> -
> -       pgd = map_donated_memory_noclear(pgd_hva, pgd_size);
> -       if (!pgd)
> -               goto err_remove_mappings;
> +       ret = __pkvm_host_donate_hyp(hyp_virt_to_pfn(pgd), PAGE_ALIGN(pgd_size) >> PAGE_SHIFT);
> +       if (ret)
> +               goto err_free_hyp_vm;
>
>         init_pkvm_hyp_vm(host_kvm, hyp_vm, nr_vcpus, handle);
>
> @@ -860,8 +859,9 @@ int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
>  err_destroy_stage2:
>         kvm_guest_destroy_stage2(hyp_vm);
>  err_remove_mappings:
> -       unmap_donated_memory(hyp_vm, vm_size);
>         unmap_donated_memory(pgd, pgd_size);
> +err_free_hyp_vm:
> +       hyp_free(hyp_vm);
>  err_unpin_kvm:
>         hyp_unpin_shared_mem(host_kvm, host_kvm + 1);
>         return ret;
> @@ -997,7 +997,6 @@ int __pkvm_finalize_teardown_vm(pkvm_handle_t handle)
>         struct pkvm_hyp_vm *hyp_vm;
>         struct kvm *host_kvm;
>         unsigned int idx;
> -       size_t vm_size;
>         int err;
>
>         hyp_spin_lock(&vm_table_lock);
> @@ -1040,8 +1039,7 @@ int __pkvm_finalize_teardown_vm(pkvm_handle_t handle)
>                 teardown_donated_memory(mc, hyp_vcpu, sizeof(*hyp_vcpu));
>         }
>
> -       vm_size = pkvm_get_hyp_vm_size(hyp_vm->kvm.created_vcpus);
> -       teardown_donated_memory(mc, hyp_vm, vm_size);
> +       hyp_free(hyp_vm);
>         hyp_unpin_shared_mem(host_kvm, host_kvm + 1);
>         return 0;
>
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index bfbb1266491d..a9b85ad37787 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -191,8 +191,8 @@ static int __pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu)
>   */
>  static int __pkvm_create_hyp_vm(struct kvm *kvm)
>  {
> -       size_t pgd_sz, hyp_vm_sz;
> -       void *pgd, *hyp_vm;
> +       size_t pgd_sz;
> +       void *pgd;
>         int ret;
>
>         if (kvm->created_vcpus < 1)
> @@ -209,28 +209,15 @@ static int __pkvm_create_hyp_vm(struct kvm *kvm)
>         if (!pgd)
>                 return -ENOMEM;
>
> -       /* Allocate memory to donate to hyp for vm and vcpu pointers. */
> -       hyp_vm_sz = PAGE_ALIGN(size_add(PKVM_HYP_VM_SIZE,
> -                                       size_mul(sizeof(void *),
> -                                                kvm->created_vcpus)));
> -       hyp_vm = alloc_pages_exact(hyp_vm_sz, GFP_KERNEL_ACCOUNT);
> -       if (!hyp_vm) {
> -               ret = -ENOMEM;
> -               goto free_pgd;
> -       }
> -
> -       /* Donate the VM memory to hyp and let hyp initialize it. */
> -       ret = kvm_call_hyp_nvhe(__pkvm_init_vm, kvm, hyp_vm, pgd);
> +       ret = pkvm_call_hyp_req(__pkvm_init_vm, kvm, pgd);
>         if (ret)
> -               goto free_vm;
> +               goto free_pgd;
>
>         kvm->arch.pkvm.is_created = true;
>         init_hyp_stage2_memcache(&kvm->arch.pkvm.stage2_teardown_mc);
>         kvm_account_pgtable_pages(pgd, pgd_sz / PAGE_SIZE);
>
>         return 0;
> -free_vm:
> -       free_pages_exact(hyp_vm, hyp_vm_sz);
>  free_pgd:
>         free_pages_exact(pgd, pgd_sz);
>         return ret;
> --
> 2.55.0.508.g3f0d502094-goog
>

