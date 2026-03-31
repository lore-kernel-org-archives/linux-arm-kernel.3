Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CF9FF60CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 07:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sq3T1DzoMLO9Ws69g9lTvv0Xhsch2Y9QPzTP3lTfM9g=; b=DjXoyiCWlTBfoTDaKgBd6ULC3j
	NXBvzAP7k9xtwsEl/YOiGW2ZOF+rrhWA62n+zIbPVtllG0W4bj2JKwucO+s+j+nvP/jBfy6tF7CBB
	1fu/CnwvWUO2O/3wOMIlrVflCGN1LwGkD4tz8bNh9clQyYGGqn6nypcXfD+u6UnxmIN4WDQ++Mdky
	3wP/m9E1pqjSoCeHSybnam/SUrK3icZvC5z537hRFpLkpoCEprmDOOhvyAi1/K19YQGBi3pZ9v+cL
	oojbbcXSFFvGiY8B4z4vqsKNH2XuAyvWekFsop1ps6Wzcv21HbflVoFv5btT4Pl8zKfOaKe+KonUc
	A7jFJa8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TWR-0000000CUUO-1HVC;
	Tue, 31 Mar 2026 07:28:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TWN-0000000CUTR-11j1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 07:28:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0802A495B;
	Tue, 31 Mar 2026 00:28:12 -0700 (PDT)
Received: from [10.57.18.211] (unknown [10.57.18.211])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8AED53F641;
	Tue, 31 Mar 2026 00:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774942097; bh=kdsJ3g2eaTU1MECoZPvu7qbxM61nRqIBwKT0qvl9+ss=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cGVNBoiPOj2/VMnLTabPEgViojzmPo93OiL/bnktpqu9ikVoEnTLDlnE+CS2qsq3G
	 5xySVo0MjOdfU81Qs7NPVclPT+EEHn5v/ayPXJKWuiwvdITGmqRG90JWKH10y1wYzr
	 ehLh2htBIOVdb3UWpT9KB1eOZSCSJ1D8k5wOYPdY=
Message-ID: <2f4e1c85-b124-4b4c-a3b6-c8d8784e6418@arm.com>
Date: Tue, 31 Mar 2026 12:58:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/30] KVM: arm64: Kill fault->ipa
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>,
 Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <tabba@google.com>,
 Will Deacon <will@kernel.org>, Quentin Perret <qperret@google.com>
References: <20260327113618.4051534-1-maz@kernel.org>
 <20260327113618.4051534-15-maz@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260327113618.4051534-15-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_002819_420079_186750B1 
X-CRM114-Status: GOOD (  18.99  )
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
> fault->ipa, in a nested contest, represents the output of the guest's
> S2 translation for the fault->fault_ipa input, and is equal to
> fault->fault_ipa otherwise,
> 
> Given that this is readily available from kvm_s2_trans_output(),
> drop fault->ipa and directly compute fault->gfn instead, which
> is really what we want.
> 
> Tested-by: Fuad Tabba <tabba@google.com>
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  arch/arm64/kvm/mmu.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index c6cd6ce5254be..67e5e867e01dc 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1643,7 +1643,7 @@ static short kvm_s2_resolve_vma_size(struct vm_area_struct *vma,
>  				     unsigned long hva,
>  				     struct kvm_memory_slot *memslot,
>  				     struct kvm_s2_trans *nested,
> -				     bool *force_pte, phys_addr_t *ipa)
> +				     bool *force_pte)
>  {
>  	short vma_shift;
>  
> @@ -1681,8 +1681,6 @@ static short kvm_s2_resolve_vma_size(struct vm_area_struct *vma,
>  
>  		max_map_size = *force_pte ? PAGE_SIZE : PUD_SIZE;
>  
> -		*ipa = kvm_s2_trans_output(nested);
> -
>  		/*
>  		 * If we're about to create a shadow stage 2 entry, then we
>  		 * can only create a block mapping if the guest stage 2 page
> @@ -1722,7 +1720,6 @@ struct kvm_s2_fault {
>  	bool is_vma_cacheable;
>  	bool s2_force_noncacheable;
>  	unsigned long mmu_seq;
> -	phys_addr_t ipa;
>  	gfn_t gfn;
>  	kvm_pfn_t pfn;
>  	bool logging_active;
> @@ -1738,6 +1735,7 @@ static int kvm_s2_fault_get_vma_info(struct kvm_s2_fault *fault)
>  {
>  	struct vm_area_struct *vma;
>  	struct kvm *kvm = fault->vcpu->kvm;
> +	phys_addr_t ipa;
>  
>  	mmap_read_lock(current->mm);
>  	vma = vma_lookup(current->mm, fault->hva);
> @@ -1748,8 +1746,7 @@ static int kvm_s2_fault_get_vma_info(struct kvm_s2_fault *fault)
>  	}
>  
>  	fault->vma_pagesize = 1UL << kvm_s2_resolve_vma_size(vma, fault->hva, fault->memslot,
> -							     fault->nested, &fault->force_pte,
> -							     &fault->ipa);
> +							     fault->nested, &fault->force_pte);
>  
>  	/*
>  	 * Both the canonical IPA and fault IPA must be aligned to the
> @@ -1757,9 +1754,9 @@ static int kvm_s2_fault_get_vma_info(struct kvm_s2_fault *fault)
>  	 * mapping in the right place.
>  	 */
>  	fault->fault_ipa = ALIGN_DOWN(fault->fault_ipa, fault->vma_pagesize);
> -	fault->ipa = ALIGN_DOWN(fault->ipa, fault->vma_pagesize);
> +	ipa = fault->nested ? kvm_s2_trans_output(fault->nested) : fault->fault_ipa;
> +	fault->gfn = ALIGN_DOWN(ipa, fault->vma_pagesize) >> PAGE_SHIFT;
>  
> -	fault->gfn = fault->ipa >> PAGE_SHIFT;
>  	fault->mte_allowed = kvm_vma_mte_allowed(vma);
>  
>  	fault->vm_flags = vma->vm_flags;
> @@ -1970,7 +1967,6 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  		.memslot = memslot,
>  		.hva = hva,
>  		.fault_is_perm = fault_is_perm,
> -		.ipa = fault_ipa,
>  		.logging_active = logging_active,
>  		.force_pte = logging_active,
>  		.prot = KVM_PGTABLE_PROT_R,


