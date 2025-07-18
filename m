Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB3CC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 10:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IThWopyG59QFfW7JPxL801J2a+T1wquzUQOgCQQ3Obw=; b=MYPVueeClfNQc9co8brmieARpC
	hR+Pm7zOOnwGgrouTKG6be5bZpuV/Qc8m701LfoiedEX2Cqd8y50CxnPDsEn7iotzfeDvfBSEIpbp
	7cN/3O0dS2MAh4FpS9aG2mqgcIzA8JPVN2cB7Zn6fuM/1CnSw5JVgg3kgdAttMPZSBo6FmFp3lgqD
	pCBqynkIfeLQIvvPOYRNjPMPDMxwB5MMhIjEu986xKadqmUYX1kEc7SYZba3kgWVPJdjvUl1Ira2/
	uFuDxtnYrXRGBDIqyZSUQxF8mD2ln8t2g2MsTOhO3qe3oDplEHpzC2qcNVMdqJbTqOfz2rrYJ6lmz
	SNYEq/8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uciem-0000000CLfk-2juL;
	Fri, 18 Jul 2025 10:49:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uci8f-0000000CHP0-3DT9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 10:16:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACA17176C;
	Fri, 18 Jul 2025 03:16:15 -0700 (PDT)
Received: from [10.57.87.202] (unknown [10.57.87.202])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B71593F694;
	Fri, 18 Jul 2025 03:16:20 -0700 (PDT)
Message-ID: <38b08607-b9d9-425b-81c4-b227dda427b3@arm.com>
Date: Fri, 18 Jul 2025 11:16:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] KVM: arm64: Map hyp text as RO and dump instr on
 panic
Content-Language: en-GB
To: Mostafa Saleh <smostafa@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
 oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, qperret@google.com, keirf@google.com
References: <20250717234744.2254371-1-smostafa@google.com>
 <20250717234744.2254371-3-smostafa@google.com>
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20250717234744.2254371-3-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_031625_895464_8B80164B 
X-CRM114-Status: GOOD (  23.05  )
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

Hi Mostafa,

On 18/07/2025 00:47, Mostafa Saleh wrote:
> Map the hyp text section as RO, there are no secrets there
> and that allows the kernel extract info for debugging.
> 
> As in case of panic we can now dump the faulting instructions
> similar to the kernel.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>   arch/arm64/kvm/handle_exit.c    |  4 +---
>   arch/arm64/kvm/hyp/nvhe/setup.c | 12 ++++++++++--
>   2 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
> index de12b4d4bccd..d59f33c40767 100644
> --- a/arch/arm64/kvm/handle_exit.c
> +++ b/arch/arm64/kvm/handle_exit.c
> @@ -566,9 +566,7 @@ void __noreturn __cold nvhe_hyp_panic_handler(u64 esr, u64 spsr,
>   	kvm_nvhe_dump_backtrace(hyp_offset);
>   
>   	/* Dump the faulting instruction */
> -	if (!is_protected_kvm_enabled() ||
> -	    IS_ENABLED(CONFIG_NVHE_EL2_DEBUG))
> -		dump_instr(panic_addr + kaslr_offset());
> +	dump_instr(panic_addr + kaslr_offset());
This makes the dumping in nvhe no longer conditional on 
CONFIG_NVHE_EL2_DEBUG. A change from what you introduced in the patch. 
Perhaps it makes sense to reorder the patches; do the preparatory work 
for instruction dumping before the enabling.>
>   	/*
>   	 * Hyp has panicked and we're going to handle that by panicking the
> diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
> index a48d3f5a5afb..90bd014e952f 100644
> --- a/arch/arm64/kvm/hyp/nvhe/setup.c
> +++ b/arch/arm64/kvm/hyp/nvhe/setup.c
> @@ -192,6 +192,7 @@ static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
>   	enum pkvm_page_state state;
>   	struct hyp_page *page;
>   	phys_addr_t phys;
> +	enum kvm_pgtable_prot prot;
>   
>   	if (!kvm_pte_valid(ctx->old))
>   		return 0;
> @@ -210,11 +211,18 @@ static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
>   	 * configured in the hypervisor stage-1, and make sure to propagate them
>   	 * to the hyp_vmemmap state.
>   	 */
> -	state = pkvm_getstate(kvm_pgtable_hyp_pte_prot(ctx->old));
> +	prot = kvm_pgtable_hyp_pte_prot(ctx->old);
> +	state = pkvm_getstate(prot);
>   	switch (state) {
>   	case PKVM_PAGE_OWNED:
>   		set_hyp_state(page, PKVM_PAGE_OWNED);
> -		return host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_HYP);
> +		/* hyp text is RO in the host stage-2 to be inspected on panic. */
> +		if (prot == PAGE_HYP_EXEC) {
> +			set_host_state(page, PKVM_NOPAGE);
> +			return host_stage2_idmap_locked(phys, PAGE_SIZE, KVM_PGTABLE_PROT_R);
> +		} else {
> +			return host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_HYP);
> +		}
>   	case PKVM_PAGE_SHARED_OWNED:
>   		set_hyp_state(page, PKVM_PAGE_SHARED_OWNED);
>   		set_host_state(page, PKVM_PAGE_SHARED_BORROWED);
-- 
Thanks,

Ben


