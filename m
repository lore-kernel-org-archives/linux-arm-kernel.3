Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91AA0EA8124
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 14:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PuCkMEByZMxqj/zHvUkCHxhdjjDnz2VOyRyYvkibzO0=; b=C4yU3oGKZNO2xsIHUHqnuEAIft
	ZrsvDgjtH37usSPawcVEN13/Oeq1kxK6FbaszIzQUnneQjG9ov5trfHz9mkHDubpVnGI3a4IEPglE
	C1v/TMUQo9m4D70HqvJb9vgu118sBsPoGDb1dwksHzo5QtTCtUW2csfDSMApDscZIhk0vVwBsnhsr
	qdy/xR383bgvrfVeKUpvyQU+RyLCN64G4eatqsLmrW3u3DUfZ1pe+Pyl3bTHD3ArvFilgebZ3KOz0
	W7njGRZJroy9EUz0akv9QejT0HTBMf56RC1tWNj6osOg66G+zE1os++BGVmz/mOc/pHONdBorxqwx
	a7/gcW1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpp7J-0000000H4fM-3mEo;
	Tue, 10 Feb 2026 14:53:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpp7G-0000000H4em-2Jsb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 14:53:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40833339;
	Tue, 10 Feb 2026 06:53:16 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3DB8B3F63F;
	Tue, 10 Feb 2026 06:53:19 -0800 (PST)
Date: Tue, 10 Feb 2026 14:53:15 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v2 07/35] KVM: arm64: Remove is_protected_kvm_enabled()
 checks from hypercalls
Message-ID: <aYtGWwcVrDQeGCma@raptor>
References: <20260119124629.2563-1-will@kernel.org>
 <20260119124629.2563-8-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119124629.2563-8-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_065326_686134_FF9E9C91 
X-CRM114-Status: GOOD (  28.83  )
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

Hi Will,

On Mon, Jan 19, 2026 at 12:46:00PM +0000, Will Deacon wrote:
> When pKVM is not enabled, the host shouldn't issue pKVM-specific
> hypercalls and so there's no point checking for this in the pKVM
> hypercall handlers.
> 
> Remove the redundant is_protected_kvm_enabled() checks from each
> hypercall and instead rejig the hypercall table so that the
> pKVM-specific hypercalls are unreachable when pKVM is not being used.
> 
> Reviewed-by: Quentin Perret <qperret@google.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_asm.h   | 20 ++++++----
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 63 ++++++++++--------------------
>  2 files changed, 32 insertions(+), 51 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index a1ad12c72ebf..2076005e9253 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -60,16 +60,9 @@ enum __kvm_host_smccc_func {
>  	__KVM_HOST_SMCCC_FUNC___vgic_v3_init_lrs,
>  	__KVM_HOST_SMCCC_FUNC___vgic_v3_get_gic_config,
>  	__KVM_HOST_SMCCC_FUNC___pkvm_prot_finalize,
> +	__KVM_HOST_SMCCC_FUNC_MIN_PKVM = __KVM_HOST_SMCCC_FUNC___pkvm_prot_finalize,
>  
>  	/* Hypercalls available after pKVM finalisation */

This comment should be removed, I think the functions that follow, up to
and including __KVM_HOST_SMCCC_FUNC_MAX_NO_PKVM, are also available with
kvm-arm.mode=nvhe.

If you agree that the comment should be removed, maybe a different name for
the define above would be more appropriate, one that does not imply pkvm?

> -	__KVM_HOST_SMCCC_FUNC___pkvm_host_share_hyp,
> -	__KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_hyp,
> -	__KVM_HOST_SMCCC_FUNC___pkvm_host_share_guest,
> -	__KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_guest,
> -	__KVM_HOST_SMCCC_FUNC___pkvm_host_relax_perms_guest,
> -	__KVM_HOST_SMCCC_FUNC___pkvm_host_wrprotect_guest,
> -	__KVM_HOST_SMCCC_FUNC___pkvm_host_test_clear_young_guest,
> -	__KVM_HOST_SMCCC_FUNC___pkvm_host_mkyoung_guest,
>  	__KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
>  	__KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
>  	__KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
> @@ -81,6 +74,17 @@ enum __kvm_host_smccc_func {
>  	__KVM_HOST_SMCCC_FUNC___kvm_timer_set_cntvoff,
>  	__KVM_HOST_SMCCC_FUNC___vgic_v3_save_aprs,
>  	__KVM_HOST_SMCCC_FUNC___vgic_v3_restore_vmcr_aprs,
> +	__KVM_HOST_SMCCC_FUNC_MAX_NO_PKVM = __KVM_HOST_SMCCC_FUNC___vgic_v3_restore_vmcr_aprs,
> +
> +	/* Hypercalls available only when pKVM has finalised */
> +	__KVM_HOST_SMCCC_FUNC___pkvm_host_share_hyp,
> +	__KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_hyp,
> +	__KVM_HOST_SMCCC_FUNC___pkvm_host_share_guest,
> +	__KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_guest,
> +	__KVM_HOST_SMCCC_FUNC___pkvm_host_relax_perms_guest,
> +	__KVM_HOST_SMCCC_FUNC___pkvm_host_wrprotect_guest,
> +	__KVM_HOST_SMCCC_FUNC___pkvm_host_test_clear_young_guest,
> +	__KVM_HOST_SMCCC_FUNC___pkvm_host_mkyoung_guest,
>  	__KVM_HOST_SMCCC_FUNC___pkvm_reserve_vm,
>  	__KVM_HOST_SMCCC_FUNC___pkvm_unreserve_vm,
>  	__KVM_HOST_SMCCC_FUNC___pkvm_init_vm,
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index a7c689152f68..eb5cfe32b2c9 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -169,9 +169,6 @@ static void handle___pkvm_vcpu_load(struct kvm_cpu_context *host_ctxt)
>  	DECLARE_REG(u64, hcr_el2, host_ctxt, 3);
>  	struct pkvm_hyp_vcpu *hyp_vcpu;
>  
> -	if (!is_protected_kvm_enabled())
> -		return;
> -
>  	hyp_vcpu = pkvm_load_hyp_vcpu(handle, vcpu_idx);
>  	if (!hyp_vcpu)
>  		return;

I've always wondered about this. For some hypercalls, all the handler does is
marshal the arguments for the actual function (for example,
handle___kvm_adjust_pc() -> __kvm_adjust_pc()), but for others, like this one,
the handler also has extra checks before calling the actual function.  Would you
mind explaining what the rationale is?

As someone who is not intimately familiar with the code, I find this surprising,
and each time I want to understand what a hypercall does (in this case,
__pkvm_vcpu_load()), I have to remind myself that the handler might also have
code that is relevant if I want to get the full picture.

Thanks,
Alex

> @@ -185,12 +182,8 @@ static void handle___pkvm_vcpu_load(struct kvm_cpu_context *host_ctxt)
>  
>  static void handle___pkvm_vcpu_put(struct kvm_cpu_context *host_ctxt)
>  {
> -	struct pkvm_hyp_vcpu *hyp_vcpu;
> +	struct pkvm_hyp_vcpu *hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
>  
> -	if (!is_protected_kvm_enabled())
> -		return;
> -
> -	hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
>  	if (hyp_vcpu)
>  		pkvm_put_hyp_vcpu(hyp_vcpu);
>  }
> @@ -254,9 +247,6 @@ static void handle___pkvm_host_share_guest(struct kvm_cpu_context *host_ctxt)
>  	struct pkvm_hyp_vcpu *hyp_vcpu;
>  	int ret = -EINVAL;
>  
w> -	if (!is_protected_kvm_enabled())
> -		goto out;
> -
>  	hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
>  	if (!hyp_vcpu || pkvm_hyp_vcpu_is_protected(hyp_vcpu))
>  		goto out;
> @@ -278,9 +268,6 @@ static void handle___pkvm_host_unshare_guest(struct kvm_cpu_context *host_ctxt)
>  	struct pkvm_hyp_vm *hyp_vm;
>  	int ret = -EINVAL;
>  
> -	if (!is_protected_kvm_enabled())
> -		goto out;
> -
>  	hyp_vm = get_np_pkvm_hyp_vm(handle);
>  	if (!hyp_vm)
>  		goto out;
> @@ -298,9 +285,6 @@ static void handle___pkvm_host_relax_perms_guest(struct kvm_cpu_context *host_ct
>  	struct pkvm_hyp_vcpu *hyp_vcpu;
>  	int ret = -EINVAL;
>  
> -	if (!is_protected_kvm_enabled())
> -		goto out;
> -
>  	hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
>  	if (!hyp_vcpu || pkvm_hyp_vcpu_is_protected(hyp_vcpu))
>  		goto out;
> @@ -318,9 +302,6 @@ static void handle___pkvm_host_wrprotect_guest(struct kvm_cpu_context *host_ctxt
>  	struct pkvm_hyp_vm *hyp_vm;
>  	int ret = -EINVAL;
>  
> -	if (!is_protected_kvm_enabled())
> -		goto out;
> -
>  	hyp_vm = get_np_pkvm_hyp_vm(handle);
>  	if (!hyp_vm)
>  		goto out;
> @@ -340,9 +321,6 @@ static void handle___pkvm_host_test_clear_young_guest(struct kvm_cpu_context *ho
>  	struct pkvm_hyp_vm *hyp_vm;
>  	int ret = -EINVAL;
>  
> -	if (!is_protected_kvm_enabled())
> -		goto out;
> -
>  	hyp_vm = get_np_pkvm_hyp_vm(handle);
>  	if (!hyp_vm)
>  		goto out;
> @@ -359,9 +337,6 @@ static void handle___pkvm_host_mkyoung_guest(struct kvm_cpu_context *host_ctxt)
>  	struct pkvm_hyp_vcpu *hyp_vcpu;
>  	int ret = -EINVAL;
>  
> -	if (!is_protected_kvm_enabled())
> -		goto out;
> -
>  	hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
>  	if (!hyp_vcpu || pkvm_hyp_vcpu_is_protected(hyp_vcpu))
>  		goto out;
> @@ -421,12 +396,8 @@ static void handle___kvm_tlb_flush_vmid(struct kvm_cpu_context *host_ctxt)
>  static void handle___pkvm_tlb_flush_vmid(struct kvm_cpu_context *host_ctxt)
>  {
>  	DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
> -	struct pkvm_hyp_vm *hyp_vm;
> +	struct pkvm_hyp_vm *hyp_vm = get_np_pkvm_hyp_vm(handle);
>  
> -	if (!is_protected_kvm_enabled())
> -		return;
> -
> -	hyp_vm = get_np_pkvm_hyp_vm(handle);
>  	if (!hyp_vm)
>  		return;
>  
> @@ -600,14 +571,6 @@ static const hcall_t host_hcall[] = {
>  	HANDLE_FUNC(__vgic_v3_get_gic_config),
>  	HANDLE_FUNC(__pkvm_prot_finalize),
>  
> -	HANDLE_FUNC(__pkvm_host_share_hyp),
> -	HANDLE_FUNC(__pkvm_host_unshare_hyp),
> -	HANDLE_FUNC(__pkvm_host_share_guest),
> -	HANDLE_FUNC(__pkvm_host_unshare_guest),
> -	HANDLE_FUNC(__pkvm_host_relax_perms_guest),
> -	HANDLE_FUNC(__pkvm_host_wrprotect_guest),
> -	HANDLE_FUNC(__pkvm_host_test_clear_young_guest),
> -	HANDLE_FUNC(__pkvm_host_mkyoung_guest),
>  	HANDLE_FUNC(__kvm_adjust_pc),
>  	HANDLE_FUNC(__kvm_vcpu_run),
>  	HANDLE_FUNC(__kvm_flush_vm_context),
> @@ -619,6 +582,15 @@ static const hcall_t host_hcall[] = {
>  	HANDLE_FUNC(__kvm_timer_set_cntvoff),
>  	HANDLE_FUNC(__vgic_v3_save_aprs),
>  	HANDLE_FUNC(__vgic_v3_restore_vmcr_aprs),
> +
> +	HANDLE_FUNC(__pkvm_host_share_hyp),
> +	HANDLE_FUNC(__pkvm_host_unshare_hyp),
> +	HANDLE_FUNC(__pkvm_host_share_guest),
> +	HANDLE_FUNC(__pkvm_host_unshare_guest),
> +	HANDLE_FUNC(__pkvm_host_relax_perms_guest),
> +	HANDLE_FUNC(__pkvm_host_wrprotect_guest),
> +	HANDLE_FUNC(__pkvm_host_test_clear_young_guest),
> +	HANDLE_FUNC(__pkvm_host_mkyoung_guest),
>  	HANDLE_FUNC(__pkvm_reserve_vm),
>  	HANDLE_FUNC(__pkvm_unreserve_vm),
>  	HANDLE_FUNC(__pkvm_init_vm),
> @@ -632,7 +604,7 @@ static const hcall_t host_hcall[] = {
>  static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
>  {
>  	DECLARE_REG(unsigned long, id, host_ctxt, 0);
> -	unsigned long hcall_min = 0;
> +	unsigned long hcall_min = 0, hcall_max = -1;
>  	hcall_t hfn;
>  
>  	/*
> @@ -644,14 +616,19 @@ static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
>  	 * basis. This is all fine, however, since __pkvm_prot_finalize
>  	 * returns -EPERM after the first call for a given CPU.
>  	 */
> -	if (static_branch_unlikely(&kvm_protected_mode_initialized))
> -		hcall_min = __KVM_HOST_SMCCC_FUNC___pkvm_prot_finalize;
> +	if (static_branch_unlikely(&kvm_protected_mode_initialized)) {
> +		hcall_min = __KVM_HOST_SMCCC_FUNC_MIN_PKVM;
> +	} else {
> +		hcall_max = __KVM_HOST_SMCCC_FUNC_MAX_NO_PKVM;
> +	}
>  
>  	id &= ~ARM_SMCCC_CALL_HINTS;
>  	id -= KVM_HOST_SMCCC_ID(0);
>  
> -	if (unlikely(id < hcall_min || id >= ARRAY_SIZE(host_hcall)))
> +	if (unlikely(id < hcall_min || id > hcall_max ||
> +		     id >= ARRAY_SIZE(host_hcall))) {
>  		goto inval;
> +	}
>  
>  	hfn = host_hcall[id];
>  	if (unlikely(!hfn))
> -- 
> 2.52.0.457.g6b5491de43-goog
> 
> 

