Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF148FF60C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 05:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YYKEvvECp557eH8+PIi5XxNJ+boFC+brG4+qRSDdZ3w=; b=Xs0URg9oBvk5otXSRQb2Za3QFR
	w9KDkuntXXtXTtU3UblTj6TUHrgthjyC66o39Z/DLmrUpfZbGxnoCujWOePpU9Ozr+NAqvI5issRJ
	fBUSCBLBS0FQdjvqUw6dQqhS5ATctDlaPvjnIqcRJFpDFbAiOVqy87rroApWfQz5ojE5oUOdMqldW
	X6F+WdAfnGBaIuf+bYpvf/a1ecDnPTSw137tFjZ3/SrP1O65ZR32obDg322UxsjFJKlabbK9xReGh
	0tA2xBEmTHZwOncOBmW4wtOFH9E/kXPJNREkEIRpI3KftKPhsBujxf7Tns/v/mGyDRq7HCfHu3pa/
	hKsjm4VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Rsg-0000000CJuw-1CuU;
	Tue, 31 Mar 2026 05:43:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Rsd-0000000CJub-0L4n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 05:43:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F651493B;
	Mon, 30 Mar 2026 22:43:02 -0700 (PDT)
Received: from [10.57.18.211] (unknown [10.57.18.211])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03D1A3F641;
	Mon, 30 Mar 2026 22:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774935788; bh=vSB+ljS0jlhp1cm4eU7MyoYZxLluHbOT/8kE0YlcoaI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UcpTubK+EvW+7IXovLRXihaJceuFtVVv/2TbkFcvixMghUlnloG/D5wcq1cmQt/bU
	 0gc/qT4RsaXBg/GLVxWOnhkdSiZ/M7mCCQijhg378kx6Xj+56B1lPHXAx9hgUYtvk6
	 aZzLSM6CDWf+C0onhJJ46xM3pRi07C4BgmO5zA5o=
Message-ID: <8deec1ce-044e-484a-9f9c-82163f3ac801@arm.com>
Date: Tue, 31 Mar 2026 11:13:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/30] KVM: arm64: Initialize struct kvm_s2_fault
 completely at declaration
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>,
 Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <tabba@google.com>,
 Will Deacon <will@kernel.org>, Quentin Perret <qperret@google.com>
References: <20260327113618.4051534-1-maz@kernel.org>
 <20260327113618.4051534-11-maz@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260327113618.4051534-11-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_224311_289522_E10B35FD 
X-CRM114-Status: GOOD (  21.14  )
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

On 27/03/26 5:05 PM, Marc Zyngier wrote:
> From: Fuad Tabba <tabba@google.com>
> 
> Simplify the initialization of struct kvm_s2_fault in user_mem_abort().
> 
> Instead of partially initializing the struct via designated initializers
> and then sequentially assigning the remaining fields (like write_fault
> and topup_memcache) further down the function, evaluate those
> dependencies upfront.
> 
> This allows the entire struct to be fully initialized at declaration. It
> also eliminates the need for the intermediate fault_data variable and
> its associated fault pointer, reducing boilerplate.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  arch/arm64/kvm/mmu.c | 34 ++++++++++++++++------------------
>  1 file changed, 16 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index e77b0b60697f6..2b85daaa4426b 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1962,8 +1962,9 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  			  struct kvm_memory_slot *memslot, unsigned long hva,
>  			  bool fault_is_perm)
>  {
> -	int ret = 0;
> -	struct kvm_s2_fault fault_data = {
> +	bool write_fault = kvm_is_write_fault(vcpu);
> +	bool logging_active = memslot_is_logging(memslot);
> +	struct kvm_s2_fault fault = {
>  		.vcpu = vcpu,
>  		.fault_ipa = fault_ipa,
>  		.nested = nested,
> @@ -1971,19 +1972,18 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  		.hva = hva,
>  		.fault_is_perm = fault_is_perm,
>  		.ipa = fault_ipa,
> -		.logging_active = memslot_is_logging(memslot),
> -		.force_pte = memslot_is_logging(memslot),
> -		.s2_force_noncacheable = false,
> +		.logging_active = logging_active,
> +		.force_pte = logging_active,
>  		.prot = KVM_PGTABLE_PROT_R,
> +		.fault_granule = fault_is_perm ? kvm_vcpu_trap_get_perm_fault_granule(vcpu) : 0,
> +		.write_fault = write_fault,
> +		.exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu),
> +		.topup_memcache = !fault_is_perm || (logging_active && write_fault),
>  	};
> -	struct kvm_s2_fault *fault = &fault_data;
>  	void *memcache;
> +	int ret;
>  
> -	if (fault->fault_is_perm)
> -		fault->fault_granule = kvm_vcpu_trap_get_perm_fault_granule(fault->vcpu);
> -	fault->write_fault = kvm_is_write_fault(fault->vcpu);
> -	fault->exec_fault = kvm_vcpu_trap_is_exec_fault(fault->vcpu);
> -	VM_WARN_ON_ONCE(fault->write_fault && fault->exec_fault);
> +	VM_WARN_ON_ONCE(fault.write_fault && fault.exec_fault);
>  
>  	/*
>  	 * Permission faults just need to update the existing leaf entry,
> @@ -1991,9 +1991,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  	 * only exception to this is when dirty logging is enabled at runtime
>  	 * and a write fault needs to collapse a block entry into a table.
>  	 */
> -	fault->topup_memcache = !fault->fault_is_perm ||
> -				(fault->logging_active && fault->write_fault);
> -	ret = prepare_mmu_memcache(fault->vcpu, fault->topup_memcache, &memcache);
> +	ret = prepare_mmu_memcache(vcpu, fault.topup_memcache, &memcache);
>  	if (ret)
>  		return ret;
>  
> @@ -2001,17 +1999,17 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  	 * Let's check if we will get back a huge page backed by hugetlbfs, or
>  	 * get block mapping for device MMIO region.
>  	 */
> -	ret = kvm_s2_fault_pin_pfn(fault);
> +	ret = kvm_s2_fault_pin_pfn(&fault);
>  	if (ret != 1)
>  		return ret;
>  
> -	ret = kvm_s2_fault_compute_prot(fault);
> +	ret = kvm_s2_fault_compute_prot(&fault);
>  	if (ret) {
> -		kvm_release_page_unused(fault->page);
> +		kvm_release_page_unused(fault.page);
>  		return ret;
>  	}
>  
> -	return kvm_s2_fault_map(fault, memcache);
> +	return kvm_s2_fault_map(&fault, memcache);
>  }
>  
>  /* Resolve the access fault by making the page young again. */

