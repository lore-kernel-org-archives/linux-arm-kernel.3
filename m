Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED273C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 14:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KDxJowX8uG8aO7Na9kyr/L73fRaMGy5rrKi3qF4akZQ=; b=bahGb9EsrqBGUrvil9kmlgRU1a
	p3sDfDVRg9ZGZWEtqNlUWph5S8YUky6Mqp44WcXqHGUqoftPjJU98ejJvB0mJVfIeV7ItxgMbQpfp
	9CxAMAdt/0NlJEJw3mnYW28xzAGwoVlavMJebIoK+KRMNMrWJ1zVpouml/XI2UGQCCPLefYPjkzg5
	OFPmny7p990OS3NB9D74A+TzTJgjLCQxu/go9xHrYNU+uxAuEKXrPIsq3DTQrXSaj1QkdZ5XZDC+d
	NagcxFnrutLQTrFqIs9cyJ1z0KMstn6r8zfHOyTKsB5pzgtPIt1q97fOK6OSsv1YwHvDP7wFciBDt
	EPHk9Lyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgNaq-00000009NWs-3QUG;
	Sun, 05 Jul 2026 14:13:12 +0000
Received: from devianza.investici.org ([2c0f:f930:0:4::108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgNan-00000009NVr-1cWl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 14:13:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1783260776;
	bh=KDxJowX8uG8aO7Na9kyr/L73fRaMGy5rrKi3qF4akZQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=nb/ADLbrfwqNbUN+fLGRFnh4SKVPd2HH10HBW4ts4pYCmHVpsUo1H8ShmnkkY+S7w
	 +6PeX9SmHE7A7sYyPQtedO1Z0eZ90rQXo4UYFDDsRyIyh1fM2H5FVkwhuqV7gSrhB7
	 4qg60LsyEdxfBzyuFQi6TYZSrxZZZkUmb0hK13Cg=
Received: from mx2.investici.org (unknown [127.0.0.1])
	by devianza.investici.org (Postfix) with ESMTP id 4gtTwS1K3mz6vMK;
	Sun, 05 Jul 2026 14:12:56 +0000 (UTC)
Received: by mx2.investici.org (Postfix) id 4gtTwR5Gm8z4y71;
	Sun, 05 Jul 2026 14:12:55 +0000 (UTC)
Date: Sun, 05 Jul 2026 15:12:55 +0100
From: Bradley Morgan <include@grrlz.net>
To: Dev Jain <dev.jain@arm.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>
CC: Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>,
 Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Quentin Perret <qperret@google.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4=5D_KVM=3A_arm64=3A_Record_whe?=
 =?US-ASCII?Q?ther_pKVM_stage_2_mapping_is_cacheable?=
In-Reply-To: <a3b2423e-d8bc-4713-90ef-5bfac7079834@arm.com>
References: <20260701192428.17430-1-include@grrlz.net> <a3b2423e-d8bc-4713-90ef-5bfac7079834@arm.com>
Message-ID: <FBC97CAC-3047-4FA1-AB83-DBE1C1270123@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_071309_869845_FBC5D000 
X-CRM114-Status: GOOD (  16.80  )
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

On July 5, 2026 3:08:58 PM GMT+01:00, Dev Jain <dev.jain@arm.com> wrote:
>
>
>On 02/07/26 12:54 am, Bradley Morgan wrote:
>> pKVM keeps its own mapping list for stage 2 operations. Its flush path
>> uses that list directly, so it lost the PTE attribute check done by the
>> generic stage 2 walker.
>> 
>> Record whether a mapping is cacheable and skip cache maintenance for
>> mappings that are not cacheable.
>> 
>> Fixes: e912efed485a ("KVM: arm64: Introduce the EL1 pKVM MMU")
>
>Is Fixes tag required? If I am reading correctly, Arm ARM says this:
>
>"For VA-based cache maintenance instructions, the instruction operates on
>the
>caches regardless of the memory type and cacheability attributes marked
>for
>the memory address in the VMSA translation table entries. This means that
>the effects of the cache maintenance instructions can apply regardless of:
>  Whether the address accessed:
>    Is Normal memory or Device memory.
>    Has the Cacheable attribute or the Non-cacheable attribute."
>
>So nothing goes wrong if we do dcache clean for non-cacheable memory.

hmmm. Makes sense, fair enough, in V5 I'll also remove the fixes tag


>> Signed-off-by: Bradley Morgan <include@grrlz.net>
>> ---
>> Changes since V3:
>> - addressed some review :)
>> 
>>  arch/arm64/kvm/pkvm.c | 51 ++++++++++++++++++++++++++++++++++---------
>>  1 file changed, 41 insertions(+), 10 deletions(-)
>> 
>> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
>> index 053e4f733e4b..6d1cad890c7e 100644
>> --- a/arch/arm64/kvm/pkvm.c
>> +++ b/arch/arm64/kvm/pkvm.c
>> @@ -302,9 +302,32 @@ static u64 __pkvm_mapping_start(struct pkvm_mapping
>*m)
>>  	return m->gfn * PAGE_SIZE;
>>  }
>>  
>> +#define PKVM_MAPPING_NR_PAGES_MASK     GENMASK_ULL(47, 0)
>> +#define PKVM_MAPPING_NC                        BIT_ULL(48)
>> +
>> +static u64 pkvm_mapping_nr_pages(struct pkvm_mapping *m)
>> +{
>> +	return m->nr_pages & PKVM_MAPPING_NR_PAGES_MASK;
>> +}
>> +
>> +static bool pkvm_mapping_is_nc(struct pkvm_mapping *m)
>> +{
>> +	return m->nr_pages & PKVM_MAPPING_NC;
>> +}
>> +
>> +static void pkvm_mapping_set_nr_pages(struct pkvm_mapping *m, u64
>nr_pages,
>> +				      bool nc)
>> +{
>> +	WARN_ON_ONCE(nr_pages & ~PKVM_MAPPING_NR_PAGES_MASK);
>> +
>> +	m->nr_pages = nr_pages & PKVM_MAPPING_NR_PAGES_MASK;
>> +	if (nc)
>> +		m->nr_pages |= PKVM_MAPPING_NC;
>> +}
>> +
>>  static u64 __pkvm_mapping_end(struct pkvm_mapping *m)
>>  {
>> -	return (m->gfn + m->nr_pages) * PAGE_SIZE - 1;
>> +	return (m->gfn + pkvm_mapping_nr_pages(m)) * PAGE_SIZE - 1;
>>  }
>>  
>>  INTERVAL_TREE_DEFINE(struct pkvm_mapping, node, u64, __subtree_last,
>> @@ -350,7 +373,7 @@ static int __pkvm_pgtable_stage2_reclaim(struct
>kvm_pgtable *pgt, u64 start, u64
>>  			continue;
>>  
>>  		page = pfn_to_page(mapping->pfn);
>> -		WARN_ON_ONCE(mapping->nr_pages != 1);
>> +	       WARN_ON_ONCE(pkvm_mapping_nr_pages(mapping) != 1);
>>  		unpin_user_pages_dirty_lock(&page, 1, true);
>>  		account_locked_vm(current->mm, 1, false);
>>  		pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
>> @@ -369,7 +392,7 @@ static int __pkvm_pgtable_stage2_unshare(struct
>kvm_pgtable *pgt, u64 start, u64
>>  
>>  	for_each_mapping_in_range_safe(pgt, start, end, mapping) {
>>  		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn,
>> -					mapping->nr_pages);
>> +				       pkvm_mapping_nr_pages(mapping));
>>  		if (WARN_ON(ret))
>>  			return ret;
>>  		pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
>> @@ -448,7 +471,7 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt,
>u64 addr, u64 size,
>>  		 * permission faults are handled in the relax_perms() path.
>>  		 */
>>  		if (mapping) {
>> -			if (size == (mapping->nr_pages * PAGE_SIZE))
>> +			if (size == (pkvm_mapping_nr_pages(mapping) * PAGE_SIZE))
>>  				return -EAGAIN;
>>  
>>  			/*
>> @@ -472,7 +495,9 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt,
>u64 addr, u64 size,
>>  	swap(mapping, cache->mapping);
>>  	mapping->gfn = gfn;
>>  	mapping->pfn = pfn;
>> -	mapping->nr_pages = size / PAGE_SIZE;
>> +	pkvm_mapping_set_nr_pages(mapping, size / PAGE_SIZE,
>> +				  (prot & (KVM_PGTABLE_PROT_DEVICE |
>> +					   KVM_PGTABLE_PROT_NORMAL_NC)));
>>  	pkvm_mapping_insert(mapping, &pgt->pkvm_mappings);
>>  
>>  	return ret;
>> @@ -503,7 +528,7 @@ int pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable
>*pgt, u64 addr, u64 size)
>>  	lockdep_assert_held(&kvm->mmu_lock);
>>  	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
>>  		ret = kvm_call_hyp_nvhe(__pkvm_host_wrprotect_guest, handle, mapping->gfn,
>> -					mapping->nr_pages);
>> +				       pkvm_mapping_nr_pages(mapping));
>>  		if (WARN_ON(ret))
>>  			break;
>>  	}
>> @@ -517,9 +542,13 @@ int pkvm_pgtable_stage2_flush(struct kvm_pgtable
>*pgt, u64 addr, u64 size)
>>  	struct pkvm_mapping *mapping;
>>  
>>  	lockdep_assert_held(&kvm->mmu_lock);
>> -	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
>> +	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
>> +		if (pkvm_mapping_is_nc(mapping))
>> +			continue;
>> +
>>  		__clean_dcache_guest_page(pfn_to_kaddr(mapping->pfn),
>> -					  PAGE_SIZE * mapping->nr_pages);
>> +					  PAGE_SIZE * pkvm_mapping_nr_pages(mapping));
>> +	}
>>  
>>  	return 0;
>>  }
>> @@ -536,8 +565,10 @@ bool pkvm_pgtable_stage2_test_clear_young(struct
>kvm_pgtable *pgt, u64 addr, u64
>>  
>>  	lockdep_assert_held(&kvm->mmu_lock);
>>  	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
>> -		young |= kvm_call_hyp_nvhe(__pkvm_host_test_clear_young_guest, handle, mapping->gfn,
>> -					   mapping->nr_pages, mkold);
>> +		young |= kvm_call_hyp_nvhe(__pkvm_host_test_clear_young_guest,
>> +					   handle, mapping->gfn,
>> +					   pkvm_mapping_nr_pages(mapping),
>> +					   mkold);
>>  
>>  	return young;
>>  }
>
>

Thanks!

