Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA76CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 23:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EPvbQ1EtJTgqqcXXxrcD3sjibKtkouuLrt2fwvBKuCo=; b=AGYGY9aZAYKcWiKNxDymiManaF
	0jVNbt2zqDMwLXd3lG4lQiMGLAdJ1FcVeKUf7GxcSTwy1zWbNy1b/eerZk/RZAvzGeDW8QkJbIv8z
	Xrg49ZX0lGFicD/aZwdds0BB+5wZV/Qb+2M65wdWzp94RFysdvMNbh0rX5/8emrXd9xUpz6lHfru0
	Ho0WvMoYrF1ll8Wl5IkXdgZoQy7UI743EHJC5XN1W3FZ6CbAVG+wUjeEklorB9crbZKUrcVkrT5Iq
	TqX2s1E9NHVGCjr1K02H0rW6F1jnWp+zUa7lTgZ1BxLFAwYZlzLh9KvTZhdOn5dt+RMoW78ZrgN4T
	Gg0nbNIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEc88-000000058q7-2tXP;
	Thu, 30 Oct 2025 23:32:38 +0000
Received: from out-180.mta0.migadu.com ([91.218.175.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEc82-000000058pT-3Sfw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 23:32:30 +0000
Date: Thu, 30 Oct 2025 23:32:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761867142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EPvbQ1EtJTgqqcXXxrcD3sjibKtkouuLrt2fwvBKuCo=;
	b=rQ6PPSjhqmg2IdFK5aV+HVTbe4voW0+TLPTF2k0+kL9UXz0NxzSOMtaLbhOcnZo0DErK5+
	WMp28hIY8amm9bTPluU0f78HJKiNnMG39vPrpA9pNO+BHu0lfFFWQjPqSP+fPUULlpVtLM
	KoCThdhoN7HfUwOodX7i2BEaD6MCinI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Jim Mattson <jmattson@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Bibo Mao <maobibo@loongson.cn>, "Pratik R. Sampat" <prsampat@amd.com>, 
	James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v2 2/4] KVM: selftests: Use a loop to walk guest page
 tables
Message-ID: <6ya5ya2bzl5mvpc25fj5o62hvmubi4egs246pbj6z2oocff3tv@b3pkl6ckflpt>
References: <20251028225827.2269128-1-jmattson@google.com>
 <20251028225827.2269128-3-jmattson@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028225827.2269128-3-jmattson@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_163228_788196_7DB04C92 
X-CRM114-Status: GOOD (  17.44  )
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

On Tue, Oct 28, 2025 at 03:30:40PM -0700, Jim Mattson wrote:
> Walk the guest page tables via a loop when searching for a PTE,
> instead of using unique variables for each level of the page tables.
> 
> This simplifies the code and makes it easier to support 5-level paging
> in the future.
> 
> Signed-off-by: Jim Mattson <jmattson@google.com>

Reviewed-by: Yosry Ahmed <yosry.ahmed@linux.dev>

> ---
>  .../testing/selftests/kvm/lib/x86/processor.c | 23 ++++++++-----------
>  1 file changed, 10 insertions(+), 13 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
> index 738f2a44083f..720c678187b5 100644
> --- a/tools/testing/selftests/kvm/lib/x86/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86/processor.c
> @@ -307,7 +307,8 @@ static bool vm_is_target_pte(uint64_t *pte, int *level, int current_level)
>  uint64_t *__vm_get_page_table_entry(struct kvm_vm *vm, uint64_t vaddr,
>  				    int *level)
>  {
> -	uint64_t *pml4e, *pdpe, *pde;
> +	uint64_t *pte = &vm->pgd;
> +	int current_level;
>  
>  	TEST_ASSERT(!vm->arch.is_pt_protected,
>  		    "Walking page tables of protected guests is impossible");
> @@ -328,19 +329,15 @@ uint64_t *__vm_get_page_table_entry(struct kvm_vm *vm, uint64_t vaddr,
>  	TEST_ASSERT(vaddr == (((int64_t)vaddr << 16) >> 16),
>  		"Canonical check failed.  The virtual address is invalid.");
>  
> -	pml4e = virt_get_pte(vm, &vm->pgd, vaddr, PG_LEVEL_512G);
> -	if (vm_is_target_pte(pml4e, level, PG_LEVEL_512G))
> -		return pml4e;
> -
> -	pdpe = virt_get_pte(vm, pml4e, vaddr, PG_LEVEL_1G);
> -	if (vm_is_target_pte(pdpe, level, PG_LEVEL_1G))
> -		return pdpe;
> -
> -	pde = virt_get_pte(vm, pdpe, vaddr, PG_LEVEL_2M);
> -	if (vm_is_target_pte(pde, level, PG_LEVEL_2M))
> -		return pde;
> +	for (current_level = vm->pgtable_levels;
> +	     current_level > PG_LEVEL_4K;
> +	     current_level--) {
> +		pte = virt_get_pte(vm, pte, vaddr, current_level);
> +		if (vm_is_target_pte(pte, level, current_level))
> +			return pte;
> +	}
>  
> -	return virt_get_pte(vm, pde, vaddr, PG_LEVEL_4K);
> +	return virt_get_pte(vm, pte, vaddr, PG_LEVEL_4K);
>  }
>  
>  uint64_t *vm_get_page_table_entry(struct kvm_vm *vm, uint64_t vaddr)
> -- 
> 2.51.1.851.g4ebd6896fd-goog
> 

