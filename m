Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446AFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 10:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4QGWW1RLtNBDbETX6KRbddrgCmdMMHyJIwPxEZlaNdE=; b=jfa4ZSka1Hqt9uawph3O4lcLQM
	KohoRTBnZ87n4QmTovzDLcy9TfvFBrPJsZvO1vX7Uny1BnEjeP6gHltTnX/vpso5ILJmdSGTRb0VV
	ZuNGop8YE1J+Wa2uEPErlwS4GG+J3VVNjyq8VHbVZdhKa24RhHq0B6Fh3bk4/YIPJjfGQPANrY8fY
	m7UNsyUL9K7bcQB/SOnKDgx4/q4/iGHU3YXhaw0dxIaphNzKHC3SVxF2H1wsozlm6Q8DQ40eR9aAf
	iZVilHvCTdEFeDtAYFrGBmBoRcNf0z73FGPXcPxU/cF9PpFIIllfp+ItfF0RpDDuaOd6DBPW2Jalk
	sN6apWsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfEt0-00000004CcE-3FyG;
	Thu, 02 Jul 2026 10:43:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfEsx-00000004CbZ-44lb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 10:43:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D108356E;
	Thu,  2 Jul 2026 03:43:06 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 45C0F3F905;
	Thu,  2 Jul 2026 03:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782988990; bh=+4PKb6Dp6n7a3V/fzWDIaIAutpbvzIi9naXFZOWB2rQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q7/q3hOMtR/ugZ2cmsiH1Lv3A5dpBlKo1r+gMI0gqDnJGDt2/VsD0BWElvdoBwXmZ
	 FfoOr60L3XRsCTEi1XB36tDIihPR+wT9wYqhrBXf84yjobY8ir20Fv8ab1BHl68/0y
	 Kuaj7wr19+NgVSaimvWPNmLW2e8f9esRUh3WhJmc=
From: Leonardo Bras <leo.bras@arm.com>
To: Bradley Morgan <include@grrlz.net>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Marc Zyngier <maz@kernel.org>,
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
	Gavin Shan <gshan@redhat.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] KVM: arm64: skip pKVM cache flushes for non cacheable mappings
Date: Thu,  2 Jul 2026 11:43:06 +0100
Message-ID: <akZAuqOk7ocNFhcH@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <BCFEB62C-FA80-474B-A9F5-9CD6CA87E857@grrlz.net>
References: <20260624160028.15591-1-include@grrlz.net> <20260624160028.15591-2-include@grrlz.net> <akU64YK5dqcWGdCD@LeoBrasDK> <5105C9D2-C708-452E-BA61-F22083A33C74@grrlz.net> <akVGDoI9FltrVduP@LeoBrasDK> <EB48DA64-1E2E-4D8C-8F8A-ED6257AD93E9@grrlz.net> <akVGxdakrVYp8kho@LeoBrasDK> <BCFEB62C-FA80-474B-A9F5-9CD6CA87E857@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_034312_181851_6EEF2ED4 
X-CRM114-Status: GOOD (  32.53  )
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

On Wed, Jul 01, 2026 at 05:57:48PM +0100, Bradley Morgan wrote:
> On July 1, 2026 5:56:37 PM GMT+01:00, Leonardo Bras <leo.bras@arm.com>
> wrote:
> >On Wed, Jul 01, 2026 at 05:54:40PM +0100, Bradley Morgan wrote:
> >> On July 1, 2026 5:53:34 PM GMT+01:00, Leonardo Bras <leo.bras@arm.com>
> >> wrote:
> >> >On Wed, Jul 01, 2026 at 05:40:46PM +0100, Bradley Morgan wrote:
> >> >> On July 1, 2026 5:05:53 PM GMT+01:00, Leonardo Bras
> ><leo.bras@arm.com>
> >> >> wrote:
> >> >> >On Wed, Jun 24, 2026 at 04:00:26PM +0000, Bradley Morgan wrote:
> >> >> >> pKVM keeps its own mapping list for stage 2 operations. Its flush
> >> >path
> >> >> >> uses that list directly, so it lost the PTE attribute check done
> >by
> >> >the
> >> >> >> generic stage 2 walker.
> >> >> >> 
> >> >> >> Record whether a mapping is cacheable and skip cache maintenance
> >for
> >> >> >> mappings that are not cacheable.
> >> >> >> 
> >> >> >> Fixes: e912efed485a ("KVM: arm64: Introduce the EL1 pKVM MMU")
> >> >> >> Signed-off-by: Bradley Morgan <include@grrlz.net>
> >> >> >> ---
> >> >> >>  arch/arm64/kvm/pkvm.c | 51
> >> >++++++++++++++++++++++++++++++++++---------
> >> >> >>  1 file changed, 41 insertions(+), 10 deletions(-)
> >> >> >> 
> >> >> >> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> >> >> >> index 428723b1b0f5..ca6e823028c2 100644
> >> >> >> --- a/arch/arm64/kvm/pkvm.c
> >> >> >> +++ b/arch/arm64/kvm/pkvm.c
> >> >> >> @@ -302,9 +302,32 @@ static u64 __pkvm_mapping_start(struct
> >> >pkvm_mapping
> >> >> >*m)
> >> >> >>  	return m->gfn * PAGE_SIZE;
> >> >> >>  }
> >> >> >>  
> >> >> >> +#define PKVM_MAPPING_NR_PAGES_MASK	GENMASK_ULL(47, 0)
> >> >> >> +#define PKVM_MAPPING_CACHEABLE		BIT_ULL(48)
> >> >> >
> >> >> >Out of curiosity here, why do you choose to use bit 48 here instead
> >of,
> >> >> >let's say, bit 63?
> >> >> >
> >> >> >(I know it makes absolutely no difference to inner working here, as
> >> >there 
> >> >> >should probably not be 2^48 pages in one mapping.)
> >> >> >
> >> >> >Thanks!
> >> >> >Leo
> >> >> 
> >> >> 
> >> >> sup Leo, here's a quote from maz 
> >> >
> >> >Hi Bradley,
> >> >
> >> >> 
> >> >> "This thing is already big enough, let's not add a bool right in the
> >> >> middle (use pahole to find out why this is bad).
> >> >
> >> >I suppose you proposed to add a bool into a struct, maybe?
> >> >It would screw the struct alignment.
> >> 
> >> yep, crappy old me
> >> 
> >
> >Hah, you were probably focused on the big picture.
> >
> >> 
> >> >> Given that nr_pages
> >> >> is for a range, and that the minimum page size uses 12 bits, the
> >> >> largest number of pages you can have here is 56-12=48 bit wide.
> >That's
> >> >> another 16 bits worth of flags you can use."
> >> >
> >> >Humm, makes sense.
> >> >And since he mentions 16 bits worth of flags, you start by using the
> >48th 
> >> >bit. Ok, got your rationale.
> >> >
> >> >(I would possibly start with the 63, though, but that's more on
> >personal 
> >> >taste)
> >> 
> >> 48 won't make the world blow up :)
> >
> >yeap,
> 
> 
> Would you like to be CCed on v4 or nahhhh?

Whatever you feel like :)

Thanks!
Leo

> 
> >> 
> >> >> 
> >> >> this should just clarify things, any questions, feel more than free
> >to
> >> >ask!
> >> >> 
> >> >> (btw V4 is coming soon)
> >> >
> >> >Thanks!
> >> >Leo
> >> >
> >> >> 
> >> >> >> +
> >> >> >> +static u64 pkvm_mapping_nr_pages(struct pkvm_mapping *m)
> >> >> >> +{
> >> >> >> +	return m->nr_pages & PKVM_MAPPING_NR_PAGES_MASK;
> >> >> >> +}
> >> >> >> +
> >> >> >> +static bool pkvm_mapping_is_cacheable(struct pkvm_mapping *m)
> >> >> >> +{
> >> >> >> +	return m->nr_pages & PKVM_MAPPING_CACHEABLE;
> >> >> >> +}
> >> >> >> +
> >> >> >> +static void pkvm_mapping_set_nr_pages(struct pkvm_mapping *m, u64
> >> >> >nr_pages,
> >> >> >> +				      bool cacheable)
> >> >> >> +{
> >> >> >> +	WARN_ON_ONCE(nr_pages & ~PKVM_MAPPING_NR_PAGES_MASK);
> >> >> >> +
> >> >> >> +	m->nr_pages = nr_pages & PKVM_MAPPING_NR_PAGES_MASK;
> >> >> >> +	if (cacheable)
> >> >> >> +		m->nr_pages |= PKVM_MAPPING_CACHEABLE;
> >> >> >> +}
> >> >> >> +
> >> >> >>  static u64 __pkvm_mapping_end(struct pkvm_mapping *m)
> >> >> >>  {
> >> >> >> -	return (m->gfn + m->nr_pages) * PAGE_SIZE - 1;
> >> >> >> +	return (m->gfn + pkvm_mapping_nr_pages(m)) * PAGE_SIZE - 1;
> >> >> >>  }
> >> >> >>  
> >> >> >>  INTERVAL_TREE_DEFINE(struct pkvm_mapping, node, u64,
> >__subtree_last,
> >> >> >> @@ -350,7 +373,7 @@ static int
> >__pkvm_pgtable_stage2_reclaim(struct
> >> >> >kvm_pgtable *pgt, u64 start, u64
> >> >> >>  			continue;
> >> >> >>  
> >> >> >>  		page = pfn_to_page(mapping->pfn);
> >> >> >> -		WARN_ON_ONCE(mapping->nr_pages != 1);
> >> >> >> +		WARN_ON_ONCE(pkvm_mapping_nr_pages(mapping) != 1);
> >> >> >>  		unpin_user_pages_dirty_lock(&page, 1, true);
> >> >> >>  		account_locked_vm(kvm->mm, 1, false);
> >> >> >>  		pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
> >> >> >> @@ -369,7 +392,7 @@ static int
> >__pkvm_pgtable_stage2_unshare(struct
> >> >> >kvm_pgtable *pgt, u64 start, u64
> >> >> >>  
> >> >> >>  	for_each_mapping_in_range_safe(pgt, start, end, mapping) {
> >> >> >>  		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn,
> >> >> >> -					mapping->nr_pages);
> >> >> >> +					pkvm_mapping_nr_pages(mapping));
> >> >> >>  		if (WARN_ON(ret))
> >> >> >>  			return ret;
> >> >> >>  		pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
> >> >> >> @@ -448,7 +471,7 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable
> >> >*pgt,
> >> >> >u64 addr, u64 size,
> >> >> >>  		 * permission faults are handled in the relax_perms() path.
> >> >> >>  		 */
> >> >> >>  		if (mapping) {
> >> >> >> -			if (size == (mapping->nr_pages * PAGE_SIZE))
> >> >> >> +			if (size == (pkvm_mapping_nr_pages(mapping) * PAGE_SIZE))
> >> >> >>  				return -EAGAIN;
> >> >> >>  
> >> >> >>  			/*
> >> >> >> @@ -472,7 +495,9 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable
> >> >*pgt,
> >> >> >u64 addr, u64 size,
> >> >> >>  	swap(mapping, cache->mapping);
> >> >> >>  	mapping->gfn = gfn;
> >> >> >>  	mapping->pfn = pfn;
> >> >> >> -	mapping->nr_pages = size / PAGE_SIZE;
> >> >> >> +	pkvm_mapping_set_nr_pages(mapping, size / PAGE_SIZE,
> >> >> >> +				  !(prot & (KVM_PGTABLE_PROT_DEVICE |
> >> >> >> +					    KVM_PGTABLE_PROT_NORMAL_NC)));
> >> >> >>  	pkvm_mapping_insert(mapping, &pgt->pkvm_mappings);
> >> >> >>  
> >> >> >>  	return ret;
> >> >> >> @@ -503,7 +528,7 @@ int pkvm_pgtable_stage2_wrprotect(struct
> >> >kvm_pgtable
> >> >> >*pgt, u64 addr, u64 size)
> >> >> >>  	lockdep_assert_held(&kvm->mmu_lock);
> >> >> >>  	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
> >> >> >>  		ret = kvm_call_hyp_nvhe(__pkvm_host_wrprotect_guest, handle, mapping->gfn,
> >> >> >> -					mapping->nr_pages);
> >> >> >> +					pkvm_mapping_nr_pages(mapping));
> >> >> >>  		if (WARN_ON(ret))
> >> >> >>  			break;
> >> >> >>  	}
> >> >> >> @@ -517,9 +542,13 @@ int pkvm_pgtable_stage2_flush(struct
> >kvm_pgtable
> >> >> >*pgt, u64 addr, u64 size)
> >> >> >>  	struct pkvm_mapping *mapping;
> >> >> >>  
> >> >> >>  	lockdep_assert_held(&kvm->mmu_lock);
> >> >> >> -	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
> >> >> >> +	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
> >> >> >> +		if (!pkvm_mapping_is_cacheable(mapping))
> >> >> >> +			continue;
> >> >> >> +
> >> >> >>  		__clean_dcache_guest_page(pfn_to_kaddr(mapping->pfn),
> >> >> >> -					  PAGE_SIZE * mapping->nr_pages);
> >> >> >> +					  PAGE_SIZE * pkvm_mapping_nr_pages(mapping));
> >> >> >> +	}
> >> >> >>  
> >> >> >>  	return 0;
> >> >> >>  }
> >> >> >> @@ -536,8 +565,10 @@ bool
> >pkvm_pgtable_stage2_test_clear_young(struct
> >> >> >kvm_pgtable *pgt, u64 addr, u64
> >> >> >>  
> >> >> >>  	lockdep_assert_held(&kvm->mmu_lock);
> >> >> >>  	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
> >> >> >> -		young |= kvm_call_hyp_nvhe(__pkvm_host_test_clear_young_guest, handle, mapping->gfn,
> >> >> >> -					   mapping->nr_pages, mkold);
> >> >> >> +		young |= kvm_call_hyp_nvhe(__pkvm_host_test_clear_young_guest,
> >> >> >> +					   handle, mapping->gfn,
> >> >> >> +					   pkvm_mapping_nr_pages(mapping),
> >> >> >> +					   mkold);
> >> >> >>  
> >> >> >>  	return young;
> >> >> >>  }
> >> >> >> -- 
> >> >> >> 2.53.0
> >> >> >> 
> >> >> >
> >> >> 
> >> >> Thanks!
> >> >
> >> 
> >> Thanks!
> >
> >Thanks!
> >
> 
> Thanks!

