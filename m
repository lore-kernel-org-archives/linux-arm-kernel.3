Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41437CE9D78
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 16:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+Ejsdv+4cSG7ZPhph+YM70TsgyLaB5ykH3UcPAAKxY=; b=S0/MIAu5K16AhNHK1oq03sZYAv
	a3BB9UyuyKJzGZgmfkAHSgFPlX5ibdgikxo5rGn+L71wBr6HRM2b1fBnmP3j6HlOGDomO3+GHAd+5
	oGQQcvJKdsDRLSMfHRjFzuOhHYsyfaQTbhHHG8+mNf3EdD67Y0s4z/xjV0oO+DnpTnO8ikgCo2TgQ
	DlPyNIemyZ7AoBe4rOEZvjxgHq4BpCayFakhWUf9iUgSiYLvWzwJDJ7Y5Tz1lohTbrOcd7QVD4cqn
	UCLC2jw/E3qNmJ/2gtLp3KSDV9Lp70NkiioUbqSf+20LyBJrsz05+5PPLUa//zWf6yjkPn5TR9pEQ
	hYChUCyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9tU-0000000DTwf-2xqf;
	Tue, 06 Jan 2026 16:26:52 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9tS-0000000DTw6-1WiK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 16:26:51 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so12075215e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 08:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767716808; x=1768321608; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w+Ejsdv+4cSG7ZPhph+YM70TsgyLaB5ykH3UcPAAKxY=;
        b=CLLzOvzJPS1ozv6kHd1cNHL9Q0fR2vcXFatS/TwXUku144CuyZibU2zrqCX9Ph9k6T
         aSiBIi8arnrPxfaxjHtFRj+5Pd3tmJeT7YHJHuRmJrljk0kCOeAIKv8axOBt2YhZwQNs
         ygq30zMTC4CItwNgEVDDaBJiIMb/GMYsVPCrnu326Xk5iLdhjHJ0q3EU+8Uyb7TEWVT/
         pjcARQv2qXYg3hAdSSwP9YIJ+OWgYawXZ7dMvVD8gqcFI7jq1JGU3S6w6qP6ShbuSLyE
         FazUhFGmqS7ih6UfNw6cJGVilCLRsrSzmL74/c2WlQyAWGGeX/kVOcNxRzD86fvw4qb7
         rsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767716808; x=1768321608;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+Ejsdv+4cSG7ZPhph+YM70TsgyLaB5ykH3UcPAAKxY=;
        b=gPZ/G3l8pP0L/AV9xAwTU3WaVbZjKo946F02jwToBrNg8hML+0EYQbTJNhQdmQqkxP
         vxX1v6vT1HZQ6vbRqHV+546KJoGFyF28eKvMknog5gqGDetChZkX/9KAa/aVrQEZkw4g
         VM0DQgEDcbR6lCHRwjsB7bTEfWOU66xSTEyDRFToU25sB0eIFqgJuC+Lc89CPLuNwSUY
         L1j+0bTa5eQ4cNtQwPBFKmT8z/0S7OvKjIPOOygjIwc4H57Jjyg8ypi++hj5MLLTT3XM
         5ZkYQyDd5SEJcbHMGxLOr6y3YMR9XdlRuS6bZo8tGQT/0clYTIptu4JYkLFo2ew5s0Zn
         LAlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJHbctlFujF1ezuCjNLBeFFNjDGvkyfmEuMNI7exJrvLZFjqBKY5pxawmHLcMfk0cXib8D8ZH328movyqiOM1i@lists.infradead.org
X-Gm-Message-State: AOJu0YzKnco97n789khekR3251YJtidkYy4shoPpIVe4Ot3Bd2eSG7to
	pIm2e0pdYFw9mVr9M03Z7MRMcraNbcokuVtjbqHBk004n58CkVi4zAP6xuUwGt292A==
X-Gm-Gg: AY/fxX7lebtu5I/7STVn1ISYSz7ONecffturkmqNrgYhaejIyNd1DjKujWwSEArdfsP
	+g/ozRF/CQY6Lq72jt8t+SB0yK5tgBSlRNLvZAZGxirCaRur32VWngdjgcdUWCzs1ILNq+Isw+g
	GbQKISyPYzzDWFlT0DFd50qcA/XYJ5mysUWJE9iX9D8i25V4xxLepK3elgr2z3ovdepXKuSD6kq
	4xRlgg7bRYKG5LWaPbXTnfl79WclUUqVTVRBLpLwspzfecI3r8GpLCj6q3aebirDQ/ipstpBwdm
	vPOGIUyHveY+P0NLkLMhXSEPK52HklKxXci3jCO03L+Sn2VpAZi72I4QVhn/W/zpB8Q7KD10Xgc
	6DB5v4dJzOzmV3tBeDdmy/vxKnJ9Wk7W5LhryYphDE9R1gHS9N2DLYMWQTcvAfhJz4ZuXdg1tRJ
	faYInPL43Z0VDWGISQx1MoR2GSEOizP2MO4nh6gczQk5UOPYoM1A==
X-Google-Smtp-Source: AGHT+IF7hlGyFV379hs3oKbqbIx8gkC6RYZlwJeShX+Gt9MMQwN8OR3S6eiOzaGyxDfGnvr8mxiw5w==
X-Received: by 2002:a05:600c:8216:b0:476:4efc:8ed4 with SMTP id 5b1f17b1804b1-47d7f073134mr38448755e9.11.1767716808352;
        Tue, 06 Jan 2026 08:26:48 -0800 (PST)
Received: from google.com (44.145.34.34.bc.googleusercontent.com. [34.34.145.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f410c25sm57181765e9.2.2026.01.06.08.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 08:26:47 -0800 (PST)
Date: Tue, 6 Jan 2026 16:26:44 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 13/30] KVM: arm64: Introduce
 __pkvm_reclaim_dying_guest_page()
Message-ID: <aV03xOYPTdurX2k4@google.com>
References: <20260105154939.11041-1-will@kernel.org>
 <20260105154939.11041-14-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105154939.11041-14-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_082650_460819_371B1B21 
X-CRM114-Status: GOOD (  27.69  )
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

On Mon, Jan 05, 2026 at 03:49:21PM +0000, Will Deacon wrote:
> To enable reclaim of pages from a protected VM during teardown,
> introduce a new hypercall to reclaim a single page from a protected
> guest that is in the dying state.
> 
> Since the EL2 code is non-preemptible, the new hypercall deliberately
> acts on a single page at a time so as to allow EL1 to reschedule
> frequently during the teardown operation.
> 
> Co-developed-by: Quentin Perret <qperret@google.com>
> Signed-off-by: Quentin Perret <qperret@google.com>
> Signed-off-by: Will Deacon <will@kernel.org>

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

> ---
>  arch/arm64/include/asm/kvm_asm.h              |  1 +
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
>  arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |  1 +
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  9 +++
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 79 +++++++++++++++++++
>  arch/arm64/kvm/hyp/nvhe/pkvm.c                | 14 ++++
>  6 files changed, 105 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index cad3ba5e1c5a..f14f845aeedd 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -86,6 +86,7 @@ enum __kvm_host_smccc_func {
>  	__KVM_HOST_SMCCC_FUNC___pkvm_unreserve_vm,
>  	__KVM_HOST_SMCCC_FUNC___pkvm_init_vm,
>  	__KVM_HOST_SMCCC_FUNC___pkvm_init_vcpu,
> +	__KVM_HOST_SMCCC_FUNC___pkvm_reclaim_dying_guest_page,
>  	__KVM_HOST_SMCCC_FUNC___pkvm_start_teardown_vm,
>  	__KVM_HOST_SMCCC_FUNC___pkvm_finalize_teardown_vm,
>  	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_load,
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> index 9c0cc53d1dc9..cde38a556049 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> @@ -41,6 +41,7 @@ int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
>  int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
>  int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
>  int __pkvm_host_donate_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu);
> +int __pkvm_host_reclaim_page_guest(u64 gfn, struct pkvm_hyp_vm *vm);
>  int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu,
>  			    enum kvm_pgtable_prot prot);
>  int __pkvm_host_unshare_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *hyp_vm);
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> index 04c7ca703014..506831804f64 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> @@ -74,6 +74,7 @@ int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
>  int __pkvm_init_vcpu(pkvm_handle_t handle, struct kvm_vcpu *host_vcpu,
>  		     unsigned long vcpu_hva);
>  
> +int __pkvm_reclaim_dying_guest_page(pkvm_handle_t handle, u64 gfn);
>  int __pkvm_start_teardown_vm(pkvm_handle_t handle);
>  int __pkvm_finalize_teardown_vm(pkvm_handle_t handle);
>  
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index a5ee1103ce1f..b1940e639ad3 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -570,6 +570,14 @@ static void handle___pkvm_init_vcpu(struct kvm_cpu_context *host_ctxt)
>  	cpu_reg(host_ctxt, 1) = __pkvm_init_vcpu(handle, host_vcpu, vcpu_hva);
>  }
>  
> +static void handle___pkvm_reclaim_dying_guest_page(struct kvm_cpu_context *host_ctxt)
> +{
> +	DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
> +	DECLARE_REG(u64, gfn, host_ctxt, 2);
> +
> +	cpu_reg(host_ctxt, 1) = __pkvm_reclaim_dying_guest_page(handle, gfn);
> +}
> +
>  static void handle___pkvm_start_teardown_vm(struct kvm_cpu_context *host_ctxt)
>  {
>  	DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
> @@ -622,6 +630,7 @@ static const hcall_t host_hcall[] = {
>  	HANDLE_FUNC(__pkvm_unreserve_vm),
>  	HANDLE_FUNC(__pkvm_init_vm),
>  	HANDLE_FUNC(__pkvm_init_vcpu),
> +	HANDLE_FUNC(__pkvm_reclaim_dying_guest_page),
>  	HANDLE_FUNC(__pkvm_start_teardown_vm),
>  	HANDLE_FUNC(__pkvm_finalize_teardown_vm),
>  	HANDLE_FUNC(__pkvm_vcpu_load),
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index ae126ab9febf..edbfe0e3dc58 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -725,6 +725,32 @@ static int __guest_check_page_state_range(struct pkvm_hyp_vm *vm, u64 addr,
>  	return check_page_state_range(&vm->pgt, addr, size, &d);
>  }
>  
> +static int get_valid_guest_pte(struct pkvm_hyp_vm *vm, u64 ipa, kvm_pte_t *ptep, u64 *physp)
> +{
> +	kvm_pte_t pte;
> +	u64 phys;
> +	s8 level;
> +	int ret;
> +
> +	ret = kvm_pgtable_get_leaf(&vm->pgt, ipa, &pte, &level);
> +	if (ret)
> +		return ret;
> +	if (!kvm_pte_valid(pte))
> +		return -ENOENT;
> +	if (level != KVM_PGTABLE_LAST_LEVEL)
> +		return -E2BIG;
> +
> +	phys = kvm_pte_to_phys(pte);
> +	ret = check_range_allowed_memory(phys, phys + PAGE_SIZE);
> +	if (WARN_ON(ret))
> +		return ret;
> +
> +	*ptep = pte;
> +	*physp = phys;
> +
> +	return 0;
> +}
> +
>  int __pkvm_host_share_hyp(u64 pfn)
>  {
>  	u64 phys = hyp_pfn_to_phys(pfn);
> @@ -958,6 +984,59 @@ static int __guest_check_transition_size(u64 phys, u64 ipa, u64 nr_pages, u64 *s
>  	return 0;
>  }
>  
> +static void hyp_poison_page(phys_addr_t phys)
> +{
> +	void *addr = hyp_fixmap_map(phys);
> +
> +	memset(addr, 0, PAGE_SIZE);
> +	/*
> +	 * Prefer kvm_flush_dcache_to_poc() over __clean_dcache_guest_page()
> +	 * here as the latter may elide the CMO under the assumption that FWB
> +	 * will be enabled on CPUs that support it. This is incorrect for the
> +	 * host stage-2 and would otherwise lead to a malicious host potentially
> +	 * being able to read the contents of newly reclaimed guest pages.
> +	 */
> +	kvm_flush_dcache_to_poc(addr, PAGE_SIZE);
> +	hyp_fixmap_unmap();
> +}
> +
> +int __pkvm_host_reclaim_page_guest(u64 gfn, struct pkvm_hyp_vm *vm)
> +{
> +	u64 ipa = hyp_pfn_to_phys(gfn);
> +	kvm_pte_t pte;
> +	u64 phys;
> +	int ret;
> +
> +	host_lock_component();
> +	guest_lock_component(vm);
> +
> +	ret = get_valid_guest_pte(vm, ipa, &pte, &phys);
> +	if (ret)
> +		goto unlock;
> +
> +	switch (guest_get_page_state(pte, ipa)) {
> +	case PKVM_PAGE_OWNED:
> +		WARN_ON(__host_check_page_state_range(phys, PAGE_SIZE, PKVM_NOPAGE));
> +		hyp_poison_page(phys);
> +		break;
> +	case PKVM_PAGE_SHARED_OWNED:
> +		WARN_ON(__host_check_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_BORROWED));
> +		break;
> +	default:
> +		ret = -EPERM;
> +		goto unlock;
> +	}
> +
> +	WARN_ON(kvm_pgtable_stage2_unmap(&vm->pgt, ipa, PAGE_SIZE));
> +	WARN_ON(host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_HOST));
> +
> +unlock:
> +	guest_unlock_component(vm);
> +	host_unlock_component();
> +
> +	return ret;
> +}
> +
>  int __pkvm_host_donate_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu)
>  {
>  	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index 7f8191f96fc3..9f0997150cf5 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -832,6 +832,20 @@ teardown_donated_memory(struct kvm_hyp_memcache *mc, void *addr, size_t size)
>  	unmap_donated_memory_noclear(addr, size);
>  }
>  
> +int __pkvm_reclaim_dying_guest_page(pkvm_handle_t handle, u64 gfn)
> +{
> +	struct pkvm_hyp_vm *hyp_vm;
> +	int ret = -EINVAL;
> +
> +	hyp_spin_lock(&vm_table_lock);
> +	hyp_vm = get_vm_by_handle(handle);
> +	if (hyp_vm && hyp_vm->kvm.arch.pkvm.is_dying)
> +		ret = __pkvm_host_reclaim_page_guest(gfn, hyp_vm);
> +	hyp_spin_unlock(&vm_table_lock);
> +
> +	return ret;
> +}
> +
>  int __pkvm_start_teardown_vm(pkvm_handle_t handle)
>  {
>  	struct pkvm_hyp_vm *hyp_vm;
> -- 
> 2.52.0.351.gbe84eed79e-goog
> 

