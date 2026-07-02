Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F188C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 11:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Z6/MIsd4UOhGyYY0mV9tt+5Bux/N1Jt/2yY8v/LFyk=; b=AR97TSMKII26GGc8hw0L8Nlv7I
	KTpxWEWZbfDXohgkSqtaPq1ZyDOusXYyOii24XIzhWZeip1cR8w6gzd1QV1c3FT0vzk9WWjJ8bABM
	LbojohKM2KqNPxZxusZ/er4GPXbl4H7+ANOX4ZS9B7QE3khVx9DowiO4gV25kcWVhI1jp14hXRW7p
	z2E6kD43iN9Arwv+2JcuS11BWS2gUIZ1uPmvqD/Wnvuqjzxu+TWMgG+H8XX7nG8a3CzSDhBH0vKzt
	MEqWgp9xE2h+Q9Mi1GGw4IVsz+MTmx9kKiahgrUDeZoCF6Y0zy3M4qh2qNHjAIVERx/pX4rGsSRZI
	08lt8FaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfFRh-00000004IpD-3fdQ;
	Thu, 02 Jul 2026 11:19:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfFRf-00000004IoT-1CYD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 11:19:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F9D9356E;
	Thu,  2 Jul 2026 04:18:58 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 86CE83F85F;
	Thu,  2 Jul 2026 04:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782991142; bh=0+zbDFXG6FtoGNtPuSLojExer0eoDd5/HSltKVjcE8Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jLgTVXGkfty017eV2riR0+pXviDlDkCMTHhGcgt9RTFpDMf7WzD95UHx6UjL/VZrB
	 5HxBJpcSCbV/VEJGyzUYEYiKshHxZFqK7/nFkpaVG/DXCoDsXfvOrOoa5Nx/Wds7PL
	 0w+g5jYewf9x3NNvyLBAmT28W5+zV5vnR+C58YF4=
From: Leonardo Bras <leo.bras@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Bradley Morgan <include@grrlz.net>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] KVM: arm64: Record whether pKVM stage 2 mapping is cacheable
Date: Thu,  2 Jul 2026 12:18:58 +0100
Message-ID: <akZJIm6mTza7qAuu@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <86qzllpy1g.wl-maz@kernel.org>
References: <20260701192428.17430-1-include@grrlz.net> <86qzllpy1g.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_041903_404255_316553E2 
X-CRM114-Status: GOOD (  32.06  )
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

On Thu, Jul 02, 2026 at 09:59:23AM +0100, Marc Zyngier wrote:
> + Vincent, Leo
> 
> On Wed, 01 Jul 2026 20:24:28 +0100,
> Bradley Morgan <include@grrlz.net> wrote:
> > 
> > pKVM keeps its own mapping list for stage 2 operations. Its flush path
> > uses that list directly, so it lost the PTE attribute check done by the
> > generic stage 2 walker.
> > 
> > Record whether a mapping is cacheable and skip cache maintenance for
> > mappings that are not cacheable.
> > 
> > Fixes: e912efed485a ("KVM: arm64: Introduce the EL1 pKVM MMU")
> > Signed-off-by: Bradley Morgan <include@grrlz.net>
> > ---
> > Changes since V3:
> > - addressed some review :)
> 
> This isn't a change log. If you want to be taken seriously, I'd
> suggest you start by following the process. You are otherwise wasting
> people's time. Again.

Agree... the process has a reason: the changelog here helps the reviewer 
having an overview of what actually changed between versions, and that 
makes reviewing much easier, and costs very little to the contributor.

Also, the 1 week waiting time is really important, as mentioned before, as 
it allows more reviewers and maintainers to give feedback: different 
people, from different companies and lifestyles have different schedules 
for dev/rev, but in general it happens weekly. So waiting for a week is 
really recommended, as it tends to avoid people re-reading 2+ versions of 
the same patchset, and allows revs time to discuss the suggestions in the 
same thread.

(I know the waiting can be really frustating, and that sending a vN+1 fast 
seems to show that you are interested in it, but it really does not help)

> 
> You also failed to Cc people who have provided feedback on previous
> versions. That's not right.

(Bradley: usually you want as many people as possible to review your stuff, 
so CC'ing previous reviewers is actually good for you)

> 
> > 
> >  arch/arm64/kvm/pkvm.c | 51 ++++++++++++++++++++++++++++++++++---------
> >  1 file changed, 41 insertions(+), 10 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> > index 053e4f733e4b..6d1cad890c7e 100644
> > --- a/arch/arm64/kvm/pkvm.c
> > +++ b/arch/arm64/kvm/pkvm.c
> > @@ -302,9 +302,32 @@ static u64 __pkvm_mapping_start(struct pkvm_mapping *m)
> >  	return m->gfn * PAGE_SIZE;
> >  }
> >  
> > +#define PKVM_MAPPING_NR_PAGES_MASK     GENMASK_ULL(47, 0)
> > +#define PKVM_MAPPING_NC                        BIT_ULL(48)
> > +
> > +static u64 pkvm_mapping_nr_pages(struct pkvm_mapping *m)
> > +{
> > +	return m->nr_pages & PKVM_MAPPING_NR_PAGES_MASK;
> > +}
> 
> No. You've been pointed to the correct data structure (an anonymous
> structure containing bit fields). Please consider taking the review
> comments into account.

(and if you do not agree with the suggestion, discuss it in the same 
thread. Although as Marc shows below, it becames much simpler like that)

Thanks! 
Leo


> 
> This would avoid most of the churn in this patch, and make it easy to
> backport. Something like the untested hack below.
> 
> 	M.
> 
> diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> index 74fedd9c5ff02..cdddc9e3a11f5 100644
> --- a/arch/arm64/include/asm/kvm_pkvm.h
> +++ b/arch/arm64/include/asm/kvm_pkvm.h
> @@ -195,7 +195,10 @@ struct pkvm_mapping {
>  	struct rb_node node;
>  	u64 gfn;
>  	u64 pfn;
> -	u64 nr_pages;
> +	struct {
> +		unsigned long nr_pages:48;
> +		unsigned int  nc:1;
> +	};
>  	u64 __subtree_last;	/* Internal member for interval tree */
>  };
>  
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index 428723b1b0f5c..5932b93bded58 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -369,7 +369,7 @@ static int __pkvm_pgtable_stage2_unshare(struct kvm_pgtable *pgt, u64 start, u64
>  
>  	for_each_mapping_in_range_safe(pgt, start, end, mapping) {
>  		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn,
> -					mapping->nr_pages);
> +					(u64)mapping->nr_pages);
>  		if (WARN_ON(ret))
>  			return ret;
>  		pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
> @@ -473,6 +473,7 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
>  	mapping->gfn = gfn;
>  	mapping->pfn = pfn;
>  	mapping->nr_pages = size / PAGE_SIZE;
> +	mapping->nc = !!(prot & (KVM_PGTABLE_PROT_DEVICE | KVM_PGTABLE_PROT_NORMAL_NC));
>  	pkvm_mapping_insert(mapping, &pgt->pkvm_mappings);
>  
>  	return ret;
> @@ -503,7 +504,7 @@ int pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
>  	lockdep_assert_held(&kvm->mmu_lock);
>  	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
>  		ret = kvm_call_hyp_nvhe(__pkvm_host_wrprotect_guest, handle, mapping->gfn,
> -					mapping->nr_pages);
> +					(u64)mapping->nr_pages);
>  		if (WARN_ON(ret))
>  			break;
>  	}
> @@ -517,10 +518,11 @@ int pkvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
>  	struct pkvm_mapping *mapping;
>  
>  	lockdep_assert_held(&kvm->mmu_lock);
> -	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
> -		__clean_dcache_guest_page(pfn_to_kaddr(mapping->pfn),
> -					  PAGE_SIZE * mapping->nr_pages);
> -
> +	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
> +		if (!mapping->nc)
> +			__clean_dcache_guest_page(pfn_to_kaddr(mapping->pfn),
> +						  PAGE_SIZE * mapping->nr_pages);
> +	}
>  	return 0;
>  }
>  
> @@ -537,7 +539,7 @@ bool pkvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr, u64
>  	lockdep_assert_held(&kvm->mmu_lock);
>  	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
>  		young |= kvm_call_hyp_nvhe(__pkvm_host_test_clear_young_guest, handle, mapping->gfn,
> -					   mapping->nr_pages, mkold);
> +					   (u64)mapping->nr_pages, mkold);
>  
>  	return young;
>  }
> 
> -- 
> Without deviation from the norm, progress is not possible.

