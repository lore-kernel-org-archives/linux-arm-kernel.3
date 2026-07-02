Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C942C43602
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 14:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yck47zcByevXRW9PaNo4vNiwJK3y51xvS+uhfVcQUH8=; b=Scxvg1lghGpHXBz9gfwHrL37pk
	81LeSTX2goCte+UW90C0thQci4BB96AZsqP+4YRhuMHQ7y6barZWvgKsid11k8PgRPENA4pitb0dC
	WW1eH4tVB+iKNfI5TNDy5nozrfPnDQyJst20qTk/5K8aBkwXDGj08xK6E1b80AYDCOFPTGaufe4s/
	z23c0LfUsHEB3YJj37xtr7LG3TxhxqFSu9Ox9lSYDXW9ceHUXuqWbbVRJm8Q2MZbwcoBi9JBL6tae
	vGIDzE/PUbdA75U5OoXE1nie5jbIUfr6czo5cNfSBiPGdUXolQLuLSqiAQpBQNOkXbbCTJXLVcD7w
	yNLDfa0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIm8-00000004jM0-350l;
	Thu, 02 Jul 2026 14:52:24 +0000
Received: from devianza.investici.org ([2c0f:f930:0:4::108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIm4-00000004jLA-3lJE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 14:52:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1783003935;
	bh=yck47zcByevXRW9PaNo4vNiwJK3y51xvS+uhfVcQUH8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=FnpUWfrbjPTPKg9x2FatIxUrRfOIwjzPfjQtS0fVADxkOBTu2pBNsKYpFec3cEh90
	 c0PawhBq7e4TMeO73hqOcy2fVf5OYUP4Hl0UsbVREvFWlWOY9brXdXgAgjxljwDJHx
	 9bs2U2lp+vi+vdiB+XeLA1y+NbW72YeW4cKdT59o=
Received: from mx2.investici.org (unknown [127.0.0.1])
	by devianza.investici.org (Postfix) with ESMTP id 4grfxC28xNz6vMx;
	Thu, 02 Jul 2026 14:52:15 +0000 (UTC)
Received: by mx2.investici.org (Postfix) id 4grfxB5CJ7z4y2q;
	Thu, 02 Jul 2026 14:52:14 +0000 (UTC)
Date: Thu, 02 Jul 2026 15:52:14 +0100
From: Bradley Morgan <include@grrlz.net>
To: Leonardo Bras <leo.bras@arm.com>, Marc Zyngier <maz@kernel.org>
CC: Oliver Upton <oupton@kernel.org>, Fuad Tabba <tabba@google.com>,
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Quentin Perret <qperret@google.com>,
 Vincent Donnefort <vdonnefort@google.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4=5D_KVM=3A_arm64=3A_Record_whe?=
 =?US-ASCII?Q?ther_pKVM_stage_2_mapping_is_cacheable?=
In-Reply-To: <akZJIm6mTza7qAuu@LeoBrasDK>
References: <20260701192428.17430-1-include@grrlz.net> <86qzllpy1g.wl-maz@kernel.org> <akZJIm6mTza7qAuu@LeoBrasDK>
Message-ID: <6495D546-8FC7-4A31-B18C-88F34E1B64BB@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_075221_373370_129A0CCD 
X-CRM114-Status: GOOD (  28.00  )
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

On July 2, 2026 12:18:58 PM GMT+01:00, Leonardo Bras <leo.bras@arm.com>
wrote:
>On Thu, Jul 02, 2026 at 09:59:23AM +0100, Marc Zyngier wrote:
>> + Vincent, Leo
>> 
>> On Wed, 01 Jul 2026 20:24:28 +0100,
>> Bradley Morgan <include@grrlz.net> wrote:
>> > 
>> > pKVM keeps its own mapping list for stage 2 operations. Its flush path
>> > uses that list directly, so it lost the PTE attribute check done by
>the
>> > generic stage 2 walker.
>> > 
>> > Record whether a mapping is cacheable and skip cache maintenance for
>> > mappings that are not cacheable.
>> > 
>> > Fixes: e912efed485a ("KVM: arm64: Introduce the EL1 pKVM MMU")
>> > Signed-off-by: Bradley Morgan <include@grrlz.net>
>> > ---
>> > Changes since V3:
>> > - addressed some review :)
>> 
>> This isn't a change log. If you want to be taken seriously, I'd
>> suggest you start by following the process. You are otherwise wasting
>> people's time. Again.
>
>Agree... the process has a reason: the changelog here helps the reviewer 
>having an overview of what actually changed between versions, and that 
>makes reviewing much easier, and costs very little to the contributor.
>
>Also, the 1 week waiting time is really important, as mentioned before, as
>it allows more reviewers and maintainers to give feedback: different 
>people, from different companies and lifestyles have different schedules 
>for dev/rev, but in general it happens weekly. So waiting for a week is 
>really recommended, as it tends to avoid people re-reading 2+ versions of 
>the same patchset, and allows revs time to discuss the suggestions in the 
>same thread.
>
>(I know the waiting can be really frustating, and that sending a vN+1 fast
>seems to show that you are interested in it, but it really does not help)

Well, it's fair, let me give you reasoning on why I do quick Rerolls.

So, if I do something wrong, e.g: checkpatch, I don't want to wait a week,
because I would get grilled for a said checkpatch failure.


In this case, I was just excited /shrug.
>> 
>> You also failed to Cc people who have provided feedback on previous
>> versions. That's not right.
>
>(Bradley: usually you want as many people as possible to review your
>stuff, 
>so CC'ing previous reviewers is actually good for you)

Vincent not being CCed was dumb of me, no idea how I didn't get him on get
maintainers.

For you, I didn't want to annoy you with another patch, since maintainers
tend to be stressed and annoyed. And I didn't wanna add on to the pain.

>> 
>> > 
>> >  arch/arm64/kvm/pkvm.c | 51
>++++++++++++++++++++++++++++++++++---------
>> >  1 file changed, 41 insertions(+), 10 deletions(-)
>> > 
>> > diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
>> > index 053e4f733e4b..6d1cad890c7e 100644
>> > --- a/arch/arm64/kvm/pkvm.c
>> > +++ b/arch/arm64/kvm/pkvm.c
>> > @@ -302,9 +302,32 @@ static u64 __pkvm_mapping_start(struct
>pkvm_mapping *m)
>> >  	return m->gfn * PAGE_SIZE;
>> >  }
>> >  
>> > +#define PKVM_MAPPING_NR_PAGES_MASK     GENMASK_ULL(47, 0)
>> > +#define PKVM_MAPPING_NC                        BIT_ULL(48)
>> > +
>> > +static u64 pkvm_mapping_nr_pages(struct pkvm_mapping *m)
>> > +{
>> > +	return m->nr_pages & PKVM_MAPPING_NR_PAGES_MASK;
>> > +}
>> 
>> No. You've been pointed to the correct data structure (an anonymous
>> structure containing bit fields). Please consider taking the review
>> comments into account.
>
>(and if you do not agree with the suggestion, discuss it in the same 
>thread. Although as Marc shows below, it becames much simpler like that)
>
>Thanks! 
>Leo
>

I'll test it. If it's good. I'll do 

Suggested-by? Or co-developed by?

I'll hold the patch on for a week.


Thanks you lot for taking my bull crap.

>> 
>> This would avoid most of the churn in this patch, and make it easy to
>> backport. Something like the untested hack below.
>> 
>> 	M.
>> 
>> diff --git a/arch/arm64/include/asm/kvm_pkvm.h
>b/arch/arm64/include/asm/kvm_pkvm.h
>> index 74fedd9c5ff02..cdddc9e3a11f5 100644
>> --- a/arch/arm64/include/asm/kvm_pkvm.h
>> +++ b/arch/arm64/include/asm/kvm_pkvm.h
>> @@ -195,7 +195,10 @@ struct pkvm_mapping {
>>  	struct rb_node node;
>>  	u64 gfn;
>>  	u64 pfn;
>> -	u64 nr_pages;
>> +	struct {
>> +		unsigned long nr_pages:48;
>> +		unsigned int  nc:1;
>> +	};
>>  	u64 __subtree_last;	/* Internal member for interval tree */
>>  };
>>  
>> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
>> index 428723b1b0f5c..5932b93bded58 100644
>> --- a/arch/arm64/kvm/pkvm.c
>> +++ b/arch/arm64/kvm/pkvm.c
>> @@ -369,7 +369,7 @@ static int __pkvm_pgtable_stage2_unshare(struct
>kvm_pgtable *pgt, u64 start, u64
>>  
>>  	for_each_mapping_in_range_safe(pgt, start, end, mapping) {
>>  		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn,
>> -					mapping->nr_pages);
>> +					(u64)mapping->nr_pages);
>>  		if (WARN_ON(ret))
>>  			return ret;
>>  		pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
>> @@ -473,6 +473,7 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt,
>u64 addr, u64 size,
>>  	mapping->gfn = gfn;
>>  	mapping->pfn = pfn;
>>  	mapping->nr_pages = size / PAGE_SIZE;
>> +	mapping->nc = !!(prot & (KVM_PGTABLE_PROT_DEVICE | KVM_PGTABLE_PROT_NORMAL_NC));
>>  	pkvm_mapping_insert(mapping, &pgt->pkvm_mappings);
>>  
>>  	return ret;
>> @@ -503,7 +504,7 @@ int pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable
>*pgt, u64 addr, u64 size)
>>  	lockdep_assert_held(&kvm->mmu_lock);
>>  	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
>>  		ret = kvm_call_hyp_nvhe(__pkvm_host_wrprotect_guest, handle, mapping->gfn,
>> -					mapping->nr_pages);
>> +					(u64)mapping->nr_pages);
>>  		if (WARN_ON(ret))
>>  			break;
>>  	}
>> @@ -517,10 +518,11 @@ int pkvm_pgtable_stage2_flush(struct kvm_pgtable
>*pgt, u64 addr, u64 size)
>>  	struct pkvm_mapping *mapping;
>>  
>>  	lockdep_assert_held(&kvm->mmu_lock);
>> -	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
>> -		__clean_dcache_guest_page(pfn_to_kaddr(mapping->pfn),
>> -					  PAGE_SIZE * mapping->nr_pages);
>> -
>> +	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
>> +		if (!mapping->nc)
>> +			__clean_dcache_guest_page(pfn_to_kaddr(mapping->pfn),
>> +						  PAGE_SIZE * mapping->nr_pages);
>> +	}
>>  	return 0;
>>  }
>>  
>> @@ -537,7 +539,7 @@ bool pkvm_pgtable_stage2_test_clear_young(struct
>kvm_pgtable *pgt, u64 addr, u64
>>  	lockdep_assert_held(&kvm->mmu_lock);
>>  	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
>>  		young |= kvm_call_hyp_nvhe(__pkvm_host_test_clear_young_guest, handle, mapping->gfn,
>> -					   mapping->nr_pages, mkold);
>> +					   (u64)mapping->nr_pages, mkold);
>>  
>>  	return young;
>>  }
>> 
>> -- 
>> Without deviation from the norm, progress is not possible.
>

Thanks!

