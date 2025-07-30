Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F89C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 07:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C11Z4s7maMC9t4HfaUcyhZ9g8doKAnpOOrT7IPCh0q0=; b=v4/LXElcwPR3uq6FAPu/XKrVc5
	+yK9r1R8rE4u51rfjhDw3zRspo4NAulLdnSnDgH7zdQE7TLMbQDWuWYOIA2kcQOClcSMzWhLPjsEt
	LTemBHhiHaEbHMhBSEk8m0PDDbHj2Sp3p3IX4qRN2Q6/QV+lbtkQHskNOBZArYczdORWrx+A5Okca
	4qe5UvHK+pmqojwIGc0n6sWttBGEmMC0hiMhwMJg4R5zolUb3GBUvDfdFY0z7QUE94mjlYxp5vh4x
	qnLQ+aCNAFx6Zr2QBKD0ugAhtLJBZmlTgTh6U7H7kPfy3H2NEnEgTbLt78s2mZtHyV2irIUQ7Yzje
	NWVZXyaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh1Mc-00000000tXc-0R0x;
	Wed, 30 Jul 2025 07:36:38 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh1K5-00000000tIM-3FHQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 07:34:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753860842; x=1785396842;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2RgN0j+ENwauyGI9Svu9rEjlit08q6gOS10LSTOfkCM=;
  b=dgQCGZ41f9BMyUpaizAmHskIyJqNUDoeMvP5gIewZYOnXdQAoWl57qsu
   b0Njlj2eSw3KpU5HAD6Z+ImKDvC4to1k7f/94MRMrFYkL54Nk0orgIwbp
   iUBGu+Ow4aloH7q1nVpjJp/hloPBidzK0R5I1Q3tqL4zVTCYiODKnAxwe
   JAlqhV3FgkJSn0yrJ2HZ7hx0oeexgk+u0MJJ5sJYth6WS7uDkzGWEp45u
   zW27yFsrX9tujTFa9plhsHX2X0HPcQlY9WB2QhmyGzLMZ4RSY1f4D32hT
   zpbrxPAl74v1P5cCWl/oudOi7bI34ImiebXpHP4/jwycKkh3Z2VqgbYwX
   A==;
X-CSE-ConnectionGUID: caKjweE8QqyxABWiDm1iHw==
X-CSE-MsgGUID: 0pkPzMxTSQSCneyZ4zwbng==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="56240679"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="56240679"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 00:34:00 -0700
X-CSE-ConnectionGUID: H09GH9DDRK6iwMUT5DFTZA==
X-CSE-MsgGUID: 9J0CZfBtR+i2FENGg5ZkzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="162636483"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.247.1]) ([10.124.247.1])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 00:33:54 -0700
Message-ID: <e67b0825-abcb-4bac-bc3c-2e8b513f1d57@intel.com>
Date: Wed, 30 Jul 2025 15:33:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 14/24] KVM: x86/mmu: Enforce guest_memfd's max order
 when recovering hugepages
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Gavin Shan <gshan@redhat.com>,
 Shivank Garg <shivankg@amd.com>, Vlastimil Babka <vbabka@suse.cz>,
 David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>,
 Ackerley Tng <ackerleytng@google.com>, Tao Chan <chentao@kylinos.cn>,
 James Houghton <jthoughton@google.com>
References: <20250729225455.670324-1-seanjc@google.com>
 <20250729225455.670324-15-seanjc@google.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20250729225455.670324-15-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_003401_866713_62245C34 
X-CRM114-Status: GOOD (  28.21  )
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

On 7/30/2025 6:54 AM, Sean Christopherson wrote:
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
> 
> Note, calling kvm_mem_is_private() in the non-fault path is safe, so long
> as mmu_lock is held, as hugepage recovery operates on shadow-present SPTEs,
> i.e. calling kvm_mmu_max_mapping_level() with @fault=NULL is mutually
> exclusive with kvm_vm_set_mem_attributes() changing the PRIVATE attribute
> of the gfn.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/x86/kvm/mmu/mmu.c          | 82 +++++++++++++++++++--------------
>   arch/x86/kvm/mmu/mmu_internal.h |  2 +-
>   arch/x86/kvm/mmu/tdp_mmu.c      |  2 +-
>   3 files changed, 49 insertions(+), 37 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 20dd9f64156e..61eb9f723675 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -3302,31 +3302,54 @@ static u8 kvm_max_level_for_order(int order)
>   	return PG_LEVEL_4K;
>   }
>   
> -static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
> -					u8 max_level, int gmem_order)
> +static u8 kvm_max_private_mapping_level(struct kvm *kvm, struct kvm_page_fault *fault,
> +					const struct kvm_memory_slot *slot, gfn_t gfn)

I don't see why slot and gfn are needed here. Just to keep consistent 
with host_pfn_mapping_level()?

>   {
> -	u8 req_max_level;
> +	u8 max_level, coco_level;
> +	kvm_pfn_t pfn;
>   
> -	if (max_level == PG_LEVEL_4K)
> -		return PG_LEVEL_4K;
> +	/* For faults, use the gmem information that was resolved earlier. */
> +	if (fault) {
> +		pfn = fault->pfn;
> +		max_level = fault->max_level;
> +	} else {
> +		/* TODO: Call into guest_memfd once hugepages are supported. */
> +		WARN_ONCE(1, "Get pfn+order from guest_memfd");
> +		pfn = KVM_PFN_ERR_FAULT;
> +		max_level = PG_LEVEL_4K;
> +	}
>   
> -	max_level = min(kvm_max_level_for_order(gmem_order), max_level);
>   	if (max_level == PG_LEVEL_4K)
> -		return PG_LEVEL_4K;
> +		return max_level;
>   
> -	req_max_level = kvm_x86_call(gmem_max_mapping_level)(kvm, pfn);
> -	if (req_max_level)
> -		max_level = min(max_level, req_max_level);
> +	/*
> +	 * CoCo may influence the max mapping level, e.g. due to RMP or S-EPT
> +	 * restrictions.  A return of '0' means "no additional restrictions", to
> +	 * allow for using an optional "ret0" static call.
> +	 */
> +	coco_level = kvm_x86_call(gmem_max_mapping_level)(kvm, pfn);
> +	if (coco_level)
> +		max_level = min(max_level, coco_level);
>   
>   	return max_level;
>   }
>   
> -static int __kvm_mmu_max_mapping_level(struct kvm *kvm,
> -				       const struct kvm_memory_slot *slot,
> -				       gfn_t gfn, int max_level, bool is_private)
> +int kvm_mmu_max_mapping_level(struct kvm *kvm, struct kvm_page_fault *fault,
> +			      const struct kvm_memory_slot *slot, gfn_t gfn)
>   {
>   	struct kvm_lpage_info *linfo;
> -	int host_level;
> +	int host_level, max_level;
> +	bool is_private;
> +
> +	lockdep_assert_held(&kvm->mmu_lock);
> +
> +	if (fault) {
> +		max_level = fault->max_level;
> +		is_private = fault->is_private;
> +	} else {
> +		max_level = PG_LEVEL_NUM;
> +		is_private = kvm_mem_is_private(kvm, gfn);
> +	}
>   
>   	max_level = min(max_level, max_huge_page_level);
>   	for ( ; max_level > PG_LEVEL_4K; max_level--) {
> @@ -3335,25 +3358,16 @@ static int __kvm_mmu_max_mapping_level(struct kvm *kvm,
>   			break;
>   	}
>   
> +	if (max_level == PG_LEVEL_4K)
> +		return PG_LEVEL_4K;
> +
>   	if (is_private)
> -		return max_level;
> -
> -	if (max_level == PG_LEVEL_4K)
> -		return PG_LEVEL_4K;
> -
> -	host_level = host_pfn_mapping_level(kvm, gfn, slot);
> +		host_level = kvm_max_private_mapping_level(kvm, fault, slot, gfn);
> +	else
> +		host_level = host_pfn_mapping_level(kvm, gfn, slot);
>   	return min(host_level, max_level);
>   }
>   
> -int kvm_mmu_max_mapping_level(struct kvm *kvm,
> -			      const struct kvm_memory_slot *slot, gfn_t gfn)
> -{
> -	bool is_private = kvm_slot_has_gmem(slot) &&
> -			  kvm_mem_is_private(kvm, gfn);
> -
> -	return __kvm_mmu_max_mapping_level(kvm, slot, gfn, PG_LEVEL_NUM, is_private);
> -}
> -
>   void kvm_mmu_hugepage_adjust(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
>   {
>   	struct kvm_memory_slot *slot = fault->slot;
> @@ -3374,9 +3388,8 @@ void kvm_mmu_hugepage_adjust(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>   	 * Enforce the iTLB multihit workaround after capturing the requested
>   	 * level, which will be used to do precise, accurate accounting.
>   	 */
> -	fault->req_level = __kvm_mmu_max_mapping_level(vcpu->kvm, slot,
> -						       fault->gfn, fault->max_level,
> -						       fault->is_private);
> +	fault->req_level = kvm_mmu_max_mapping_level(vcpu->kvm, fault,
> +						     fault->slot, fault->gfn);
>   	if (fault->req_level == PG_LEVEL_4K || fault->huge_page_disallowed)
>   		return;
>   
> @@ -4564,8 +4577,7 @@ static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
>   	}
>   
>   	fault->map_writable = !(fault->slot->flags & KVM_MEM_READONLY);
> -	fault->max_level = kvm_max_private_mapping_level(vcpu->kvm, fault->pfn,
> -							 fault->max_level, max_order);
> +	fault->max_level = kvm_max_level_for_order(max_order);
>   
>   	return RET_PF_CONTINUE;
>   }
> @@ -7165,7 +7177,7 @@ static bool kvm_mmu_zap_collapsible_spte(struct kvm *kvm,
>   		 * mapping if the indirect sp has level = 1.
>   		 */
>   		if (sp->role.direct &&
> -		    sp->role.level < kvm_mmu_max_mapping_level(kvm, slot, sp->gfn)) {
> +		    sp->role.level < kvm_mmu_max_mapping_level(kvm, NULL, slot, sp->gfn)) {
>   			kvm_zap_one_rmap_spte(kvm, rmap_head, sptep);
>   
>   			if (kvm_available_flush_remote_tlbs_range())
> diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
> index 65f3c89d7c5d..b776be783a2f 100644
> --- a/arch/x86/kvm/mmu/mmu_internal.h
> +++ b/arch/x86/kvm/mmu/mmu_internal.h
> @@ -411,7 +411,7 @@ static inline int kvm_mmu_do_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
>   	return r;
>   }
>   
> -int kvm_mmu_max_mapping_level(struct kvm *kvm,
> +int kvm_mmu_max_mapping_level(struct kvm *kvm, struct kvm_page_fault *fault,
>   			      const struct kvm_memory_slot *slot, gfn_t gfn);
>   void kvm_mmu_hugepage_adjust(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault);
>   void disallowed_hugepage_adjust(struct kvm_page_fault *fault, u64 spte, int cur_level);
> diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
> index 7f3d7229b2c1..740cb06accdb 100644
> --- a/arch/x86/kvm/mmu/tdp_mmu.c
> +++ b/arch/x86/kvm/mmu/tdp_mmu.c
> @@ -1813,7 +1813,7 @@ static void recover_huge_pages_range(struct kvm *kvm,
>   		if (iter.gfn < start || iter.gfn >= end)
>   			continue;
>   
> -		max_mapping_level = kvm_mmu_max_mapping_level(kvm, slot, iter.gfn);
> +		max_mapping_level = kvm_mmu_max_mapping_level(kvm, NULL, slot, iter.gfn);
>   		if (max_mapping_level < iter.level)
>   			continue;
>   


