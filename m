Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9774AFF60CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 07:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/cwu/SeH3SfCCgP2L8oc/DSQIQp4Zk6QaYlLaa68cA=; b=v2/WyHUMa6JmbTwzgVyzc806so
	Jjx1MYq3Xon3glcfD07dxXtMSmpGPo6BnxRyLAYTavdl44GX6NDxsX9UNoiwm3r7WIZTbDppNFA27
	GuMcDGohG+1Wm//h3o8rg4cyrRSj8nSgqs1UWPO5fJyef7o/Lqt7sSKbI+N8fSBywb8U0r5NpbWYh
	AwLsaOEn0IekLnVcq8qcU5dmYsIxag8gmAMrmFBMTJ9x0LuE7lvfXXYol8/mdpF5jR5tnIo9IwcEH
	6Kr2CYjWARDrL/3x4Kr0g/vh5v/EP7QdC6nVbr4bp0aHmq6rn0yvJOgi8g68+8UEKrnHgRgzvwCAR
	ZzE3Ehaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TFr-0000000CRJl-0JjD;
	Tue, 31 Mar 2026 07:11:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TFp-0000000CRIj-23lo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 07:11:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A09491596;
	Tue, 31 Mar 2026 00:11:05 -0700 (PDT)
Received: from [10.57.18.211] (unknown [10.57.18.211])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EDE0C3F641;
	Tue, 31 Mar 2026 00:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774941071; bh=2SiH6CKgnh1H6NsZAZBece6LP/f2wHoqT/JSzoVa0D4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZiaxDb2imkt5mju3NjuHU0SG6oqITQ2pfgBob/9neKocePc7CZ9665498i5NzgOoH
	 cFDfhUlmv8XEfYTvlgRM1tEuFqlHlof8sIk6WOaxvGWguO4dz5dmnnAWLyMPYAJ58J
	 3aOpP5e/m+FjP8rF7UeKulGErUVKby0isHTXxHQA=
Message-ID: <1c92ac00-80c3-4fb2-82ae-ab365cc0ffd8@arm.com>
Date: Tue, 31 Mar 2026 12:41:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/30] KVM: arm64: Clean up control flow in
 kvm_s2_fault_map()
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>,
 Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <tabba@google.com>,
 Will Deacon <will@kernel.org>, Quentin Perret <qperret@google.com>
References: <20260327113618.4051534-1-maz@kernel.org>
 <20260327113618.4051534-14-maz@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260327113618.4051534-14-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_001113_587336_CA765AC8 
X-CRM114-Status: GOOD (  18.65  )
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
> From: Fuad Tabba <tabba@google.com>
> 
> Clean up the KVM MMU lock retry loop by pre-assigning the error code.
> Add clear braces to the THP adjustment integration for readability, and
> safely unnest the transparent hugepage logic branches.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  arch/arm64/kvm/mmu.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index ee2a548999b1b..c6cd6ce5254be 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1897,10 +1897,9 @@ static int kvm_s2_fault_map(struct kvm_s2_fault *fault, void *memcache)
>  
>  	kvm_fault_lock(kvm);
>  	pgt = fault->vcpu->arch.hw_mmu->pgt;
> -	if (mmu_invalidate_retry(kvm, fault->mmu_seq)) {
> -		ret = -EAGAIN;
> +	ret = -EAGAIN;
> +	if (mmu_invalidate_retry(kvm, fault->mmu_seq))
>  		goto out_unlock;
> -	}
>  
>  	/*
>  	 * If we are not forced to use page mapping, check if we are
> @@ -1908,16 +1907,17 @@ static int kvm_s2_fault_map(struct kvm_s2_fault *fault, void *memcache)
>  	 */
>  	if (fault->vma_pagesize == PAGE_SIZE &&
>  	    !(fault->force_pte || fault->s2_force_noncacheable)) {
> -		if (fault->fault_is_perm && fault->fault_granule > PAGE_SIZE)
> +		if (fault->fault_is_perm && fault->fault_granule > PAGE_SIZE) {
>  			fault->vma_pagesize = fault->fault_granule;
> -		else
> +		} else {
>  			fault->vma_pagesize = transparent_hugepage_adjust(kvm, fault->memslot,
>  									  fault->hva, &fault->pfn,
>  									  &fault->fault_ipa);
>  
> -		if (fault->vma_pagesize < 0) {
> -			ret = fault->vma_pagesize;
> -			goto out_unlock;
> +			if (fault->vma_pagesize < 0) {
> +				ret = fault->vma_pagesize;
> +				goto out_unlock;
> +			}
>  		}
>  	}
>  
> @@ -1951,7 +1951,9 @@ static int kvm_s2_fault_map(struct kvm_s2_fault *fault, void *memcache)
>  	if (fault->writable && !ret)
>  		mark_page_dirty_in_slot(kvm, fault->memslot, fault->gfn);
>  
> -	return ret != -EAGAIN ? ret : 0;
> +	if (ret != -EAGAIN)
> +		return ret;
> +	return 0;
>  }
>  
>  static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,


