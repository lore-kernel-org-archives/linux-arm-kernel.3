Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4411710F9318
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 03:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N17GwnouQ1vd5eyMJIViOgXQuO6KJsoQSiPLq2VgXus=; b=DXqM26CRUxum4b15YzJYW2dR9P
	7538+qDf5mavlUDvdvERQMaSaqqUtV4+BoBL/az18sc5nHODGzjyyV+T61KWIBFTg6R/Xs9gA9H46
	RO0EAzBAzh2iry45wXoUfu4bmqQhf+MGXnIb7SSpQ8y/2HMTPh0EsJlQBag+Y3f7ylUsA/HUlpA6F
	71cjnVKsmLhqusdxW597ib/NjS5IGmO5DzMF5kKDL8QOh2MYDFk1OjWBnQsx7C0Fj4+wvosL+QJmQ
	8YfeWsA3zzviOs5+yxB8PDTFcEJ7K4Cqw8G3VNLPRg9Om1P/SbzLArrrDnHEhn4Ig36EuuAf0bzxP
	cHTgJ0gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7mDu-0000000Dtwv-0G7P;
	Wed, 01 Apr 2026 03:26:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7mDr-0000000DtwX-40tQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 03:26:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5DDE61713;
	Tue, 31 Mar 2026 20:26:20 -0700 (PDT)
Received: from [10.164.18.48] (unknown [10.164.18.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 364EE3F915;
	Tue, 31 Mar 2026 20:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775013986; bh=UzsoticdyH/0uzKlAtuoDnpldxKmYMWxES2cT2U7dOI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nI4G83G9mlaa0vku4CRuCmhtI7cQ3DW36IaKxZaVcm4XTpQF8Vv1rh9iQ0JFYei1S
	 hOUVjhtjCaQclU8INr2sxVq5O9QvpDgZEaOyrcxzbSU3nKJ9QDTB8MdoVGFPfnEEAw
	 lh4tXtRgdJUOzEwAB00OIC7ZQ4vfzxbnOtEP77+o=
Message-ID: <c6d17e42-d782-43de-94be-2507acdaf217@arm.com>
Date: Wed, 1 Apr 2026 08:56:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/30] KVM: arm64: Constrain fault_granule to
 kvm_s2_fault_map()
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>,
 Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <tabba@google.com>,
 Will Deacon <will@kernel.org>, Quentin Perret <qperret@google.com>
References: <20260327113618.4051534-1-maz@kernel.org>
 <20260327113618.4051534-19-maz@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260327113618.4051534-19-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_202628_230403_A2956DD4 
X-CRM114-Status: GOOD (  21.61  )
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

On 27/03/26 5:06 PM, Marc Zyngier wrote:
> The notion of fault_granule is specific to kvm_s2_fault_map(), and
> is unused anywhere else.
> 
> Move this variable locally, removing it from kvm_s2_fault.
> 
> Tested-by: Fuad Tabba <tabba@google.com>
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  arch/arm64/kvm/mmu.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 1e0d93d6d265a..981c04a74ab7a 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1724,7 +1724,6 @@ struct kvm_s2_fault {
>  	bool logging_active;
>  	bool force_pte;
>  	long vma_pagesize;
> -	long fault_granule;
>  	enum kvm_pgtable_prot prot;
>  	struct page *page;
>  	vm_flags_t vm_flags;
> @@ -1908,9 +1907,9 @@ static phys_addr_t get_ipa(const struct kvm_s2_fault *fault)
>  static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>  			    struct kvm_s2_fault *fault, void *memcache)
>  {
> -	bool fault_is_perm = kvm_s2_fault_is_perm(s2fd);
>  	struct kvm *kvm = s2fd->vcpu->kvm;
>  	struct kvm_pgtable *pgt;
> +	long perm_fault_granule;
>  	int ret;
>  	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
>  
> @@ -1920,14 +1919,17 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>  	if (mmu_invalidate_retry(kvm, fault->mmu_seq))
>  		goto out_unlock;
>  
> +	perm_fault_granule = (kvm_s2_fault_is_perm(s2fd) ?
> +			      kvm_vcpu_trap_get_perm_fault_granule(s2fd->vcpu) : 0);
> +
>  	/*
>  	 * If we are not forced to use page mapping, check if we are
>  	 * backed by a THP and thus use block mapping if possible.
>  	 */
>  	if (fault->vma_pagesize == PAGE_SIZE &&
>  	    !(fault->force_pte || fault->s2_force_noncacheable)) {
> -		if (fault_is_perm && fault->fault_granule > PAGE_SIZE) {
> -			fault->vma_pagesize = fault->fault_granule;
> +		if (perm_fault_granule > PAGE_SIZE) {
> +			fault->vma_pagesize = perm_fault_granule;
>  		} else {
>  			fault->vma_pagesize = transparent_hugepage_adjust(kvm, s2fd->memslot,
>  									  s2fd->hva, &fault->pfn,
> @@ -1940,15 +1942,15 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>  		}
>  	}
>  
> -	if (!fault_is_perm && !fault->s2_force_noncacheable && kvm_has_mte(kvm))
> +	if (!perm_fault_granule && !fault->s2_force_noncacheable && kvm_has_mte(kvm))
>  		sanitise_mte_tags(kvm, fault->pfn, fault->vma_pagesize);
>  
>  	/*
>  	 * Under the premise of getting a FSC_PERM fault, we just need to relax
> -	 * permissions only if fault->vma_pagesize equals fault->fault_granule. Otherwise,
> +	 * permissions only if vma_pagesize equals perm_fault_granule. Otherwise,
>  	 * kvm_pgtable_stage2_map() should be called to change block size.
>  	 */
> -	if (fault_is_perm && fault->vma_pagesize == fault->fault_granule) {
> +	if (fault->vma_pagesize == perm_fault_granule) {
>  		/*
>  		 * Drop the SW bits in favour of those stored in the
>  		 * PTE, which will be preserved.
> @@ -1984,7 +1986,6 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>  		.logging_active = logging_active,
>  		.force_pte = logging_active,
>  		.prot = KVM_PGTABLE_PROT_R,
> -		.fault_granule = perm_fault ? kvm_vcpu_trap_get_perm_fault_granule(s2fd->vcpu) : 0,
>  		.write_fault = write_fault,
>  		.exec_fault = kvm_vcpu_trap_is_exec_fault(s2fd->vcpu),
>  		.topup_memcache = !perm_fault || (logging_active && write_fault),


