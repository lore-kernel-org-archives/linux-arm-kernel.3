Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BDFC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 08:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TapH0bvfu0u1GHTNPMOp+g876md8ToR9iwOJaRTwufk=; b=ZPATbZxlmjtbtMOcVlzdIknqLu
	ifbnmHGZpvHmCIvm9pz9VOSMu6jS64F1U2ihkXui1ENoH8I6d935/VARTRw6tR0Nag5jJ25IRWZ0p
	5M7O1X9EOiv/h0cTOxdHvmK6zll9M8u4W/rluqKDC8pgZHlBe98xMvQCap9/N7IQx9OCJzWIxBu/+
	v5TYJtAWTdoyQiJnWUHPKsps7NARwIVV5gD6FRTn8TeepuXS7DTI6Vst/ZeQ0Uvz5hGQqLXRjA4B1
	oIpTXzNQiZrUiiY/Cf2rjLwDIAPFGj8b35S4LGHwaNOoyxtc/abgxb/Lp8c4bYcGeFHug2t6XvqWT
	jeomRFmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujZ4U-0000000Ea1v-1eNT;
	Wed, 06 Aug 2025 08:00:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujZ1z-0000000EZdB-43EA
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 06 Aug 2025 07:57:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TapH0bvfu0u1GHTNPMOp+g876md8ToR9iwOJaRTwufk=; b=LxiOL6H2ef98h3FQUg11uoQlDD
	n3qVoDQXLiNetWcX1NzldqwJi0zEQek6NpTLNYL3DTd2Egzw4ATqVz9FmbO5tLDiokvg0PQBF2jkq
	G0z7WFPngXSpJ/gSIB/Fhqewte70xW/2hhhjhEPrWgFW2QB3OaLdPP4sDdqRVEfTk9o2Y12KPG2TW
	HfXw4d5bHy9XnI6E5y1Sccii2x0cdDLM8vJZfvNgSeukswzrxclM5BR9uSYOAP4wMdX4BvYcKy3Rx
	oo1vEoKeNqXz03cCNPPqmE+lCHZpB3d2KcGnz9ERdTZNt6d8lP3Olytl0HKPn0w9CTKZyBTK7Z/2j
	y25u5urw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujZ1w-0000000EFQM-1pmi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 07:57:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 843761F37;
	Wed,  6 Aug 2025 00:57:37 -0700 (PDT)
Received: from [10.57.88.107] (unknown [10.57.88.107])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F221C3F5A1;
	Wed,  6 Aug 2025 00:57:43 -0700 (PDT)
Message-ID: <e68455fe-37b8-4f9c-b7ba-3a2f72d6c76e@arm.com>
Date: Wed, 6 Aug 2025 08:57:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6 3/4] arm64: mm: support large block mapping when
 rodata=full
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>, will@kernel.org,
 catalin.marinas@arm.com, akpm@linux-foundation.org, Miko.Lenczewski@arm.com,
 dev.jain@arm.com, scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250805081350.3854670-1-ryan.roberts@arm.com>
 <20250805081350.3854670-4-ryan.roberts@arm.com>
 <06e63282-771c-48ec-bcfd-b174e94d52bf@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <06e63282-771c-48ec-bcfd-b174e94d52bf@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_085748_905607_D3F598AB 
X-CRM114-Status: GOOD (  34.37  )
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

On 05/08/2025 18:59, Yang Shi wrote:
> 
> 
> On 8/5/25 1:13 AM, Ryan Roberts wrote:
>> From: Yang Shi <yang@os.amperecomputing.com>
>>
>> When rodata=full is specified, kernel linear mapping has to be mapped at
>> PTE level since large page table can't be split due to break-before-make
>> rule on ARM64.
>>
>> This resulted in a couple of problems:
>>    - performance degradation
>>    - more TLB pressure
>>    - memory waste for kernel page table
>>
>> With FEAT_BBM level 2 support, splitting large block page table to
>> smaller ones doesn't need to make the page table entry invalid anymore.
>> This allows kernel split large block mapping on the fly.
>>
>> Add kernel page table split support and use large block mapping by
>> default when FEAT_BBM level 2 is supported for rodata=full.  When
>> changing permissions for kernel linear mapping, the page table will be
>> split to smaller size.
>>
>> The machine without FEAT_BBM level 2 will fallback to have kernel linear
>> mapping PTE-mapped when rodata=full.
>>
>> With this we saw significant performance boost with some benchmarks and
>> much less memory consumption on my AmpereOne machine (192 cores, 1P)
>> with 256GB memory.
>>
>> * Memory use after boot
>> Before:
>> MemTotal:       258988984 kB
>> MemFree:        254821700 kB
>>
>> After:
>> MemTotal:       259505132 kB
>> MemFree:        255410264 kB
>>
>> Around 500MB more memory are free to use.  The larger the machine, the
>> more memory saved.
>>
>> * Memcached
>> We saw performance degradation when running Memcached benchmark with
>> rodata=full vs rodata=on.  Our profiling pointed to kernel TLB pressure.
>> With this patchset we saw ops/sec is increased by around 3.5%, P99
>> latency is reduced by around 9.6%.
>> The gain mainly came from reduced kernel TLB misses.  The kernel TLB
>> MPKI is reduced by 28.5%.
>>
>> The benchmark data is now on par with rodata=on too.
>>
>> * Disk encryption (dm-crypt) benchmark
>> Ran fio benchmark with the below command on a 128G ramdisk (ext4) with
>> disk encryption (by dm-crypt).
>> fio --directory=/data --random_generator=lfsr --norandommap            \
>>      --randrepeat 1 --status-interval=999 --rw=write --bs=4k --loops=1  \
>>      --ioengine=sync --iodepth=1 --numjobs=1 --fsync_on_close=1         \
>>      --group_reporting --thread --name=iops-test-job --eta-newline=1    \
>>      --size 100G
>>
>> The IOPS is increased by 90% - 150% (the variance is high, but the worst
>> number of good case is around 90% more than the best number of bad
>> case). The bandwidth is increased and the avg clat is reduced
>> proportionally.
>>
>> * Sequential file read
>> Read 100G file sequentially on XFS (xfs_io read with page cache
>> populated). The bandwidth is increased by 150%.
>>
>> Co-developed-by: Ryan Roberts <ryan.roberts@arm.com>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
>> ---
>>   arch/arm64/include/asm/cpufeature.h |   2 +
>>   arch/arm64/include/asm/mmu.h        |   1 +
>>   arch/arm64/include/asm/pgtable.h    |   5 +
>>   arch/arm64/kernel/cpufeature.c      |   7 +-
>>   arch/arm64/mm/mmu.c                 | 237 +++++++++++++++++++++++++++-
>>   arch/arm64/mm/pageattr.c            |   6 +
>>   6 files changed, 252 insertions(+), 6 deletions(-)
>>
> 
> [...]
> 
>> +
>> +static DEFINE_MUTEX(pgtable_split_lock);
>> +
>> +int split_kernel_leaf_mapping(unsigned long addr)
>> +{
>> +    pgd_t *pgdp, pgd;
>> +    p4d_t *p4dp, p4d;
>> +    pud_t *pudp, pud;
>> +    pmd_t *pmdp, pmd;
>> +    pte_t *ptep, pte;
>> +    int ret = 0;
>> +
>> +    /*
>> +     * !BBML2_NOABORT systems should not be trying to change permissions on
>> +     * anything that is not pte-mapped in the first place. Just return early
>> +     * and let the permission change code raise a warning if not already
>> +     * pte-mapped.
>> +     */
>> +    if (!system_supports_bbml2_noabort())
>> +        return 0;
>> +
>> +    /*
>> +     * Ensure addr is at least page-aligned since this is the finest
>> +     * granularity we can split to.
>> +     */
>> +    if (addr != PAGE_ALIGN(addr))
>> +        return -EINVAL;
>> +
>> +    mutex_lock(&pgtable_split_lock);
>> +    arch_enter_lazy_mmu_mode();
>> +
>> +    /*
>> +     * PGD: If addr is PGD aligned then addr already describes a leaf
>> +     * boundary. If not present then there is nothing to split.
>> +     */
>> +    if (ALIGN_DOWN(addr, PGDIR_SIZE) == addr)
>> +        goto out;
>> +    pgdp = pgd_offset_k(addr);
>> +    pgd = pgdp_get(pgdp);
>> +    if (!pgd_present(pgd))
>> +        goto out;
>> +
>> +    /*
>> +     * P4D: If addr is P4D aligned then addr already describes a leaf
>> +     * boundary. If not present then there is nothing to split.
>> +     */
>> +    if (ALIGN_DOWN(addr, P4D_SIZE) == addr)
>> +        goto out;
>> +    p4dp = p4d_offset(pgdp, addr);
>> +    p4d = p4dp_get(p4dp);
>> +    if (!p4d_present(p4d))
>> +        goto out;
>> +
>> +    /*
>> +     * PUD: If addr is PUD aligned then addr already describes a leaf
>> +     * boundary. If not present then there is nothing to split. Otherwise,
>> +     * if we have a pud leaf, split to contpmd.
>> +     */
>> +    if (ALIGN_DOWN(addr, PUD_SIZE) == addr)
>> +        goto out;
>> +    pudp = pud_offset(p4dp, addr);
>> +    pud = pudp_get(pudp);
>> +    if (!pud_present(pud))
>> +        goto out;
>> +    if (pud_leaf(pud)) {
>> +        ret = split_pud(pudp, pud);
>> +        if (ret)
>> +            goto out;
>> +    }
>> +
>> +    /*
>> +     * CONTPMD: If addr is CONTPMD aligned then addr already describes a
>> +     * leaf boundary. If not present then there is nothing to split.
>> +     * Otherwise, if we have a contpmd leaf, split to pmd.
>> +     */
>> +    if (ALIGN_DOWN(addr, CONT_PMD_SIZE) == addr)
>> +        goto out;
>> +    pmdp = pmd_offset(pudp, addr);
>> +    pmd = pmdp_get(pmdp);
>> +    if (!pmd_present(pmd))
>> +        goto out;
>> +    if (pmd_leaf(pmd)) {
>> +        if (pmd_cont(pmd))
>> +            split_contpmd(pmdp);
>> +        /*
>> +         * PMD: If addr is PMD aligned then addr already describes a
>> +         * leaf boundary. Otherwise, split to contpte.
>> +         */
>> +        if (ALIGN_DOWN(addr, PMD_SIZE) == addr)
>> +            goto out;
>> +        ret = split_pmd(pmdp, pmd);
>> +        if (ret)
>> +            goto out;
>> +    }
>> +
>> +    /*
>> +     * CONTPTE: If addr is CONTPTE aligned then addr already describes a
>> +     * leaf boundary. If not present then there is nothing to split.
>> +     * Otherwise, if we have a contpte leaf, split to pte.
>> +     */
>> +    if (ALIGN_DOWN(addr, CONT_PMD_SIZE) == addr)
>> +        goto out;
>> +    ptep = pte_offset_kernel(pmdp, addr);
>> +    pte = __ptep_get(ptep);
>> +    if (!pte_present(pte))
>> +        goto out;
>> +    if (pte_cont(pte))
>> +        split_contpte(ptep);
>> +
>> +out:
>> +    arch_leave_lazy_mmu_mode();
>> +    mutex_unlock(&pgtable_split_lock);
>> +    return ret;
>>   }
>>     /*
>> @@ -640,6 +857,16 @@ static inline void arm64_kfence_map_pool(phys_addr_t
>> kfence_pool, pgd_t *pgdp) {
>>     #endif /* CONFIG_KFENCE */
>>   +static inline bool force_pte_mapping(void)
>> +{
>> +    bool bbml2 = system_capabilities_finalized() ?
>> +        system_supports_bbml2_noabort() : bbml2_noabort_available();
>> +
>> +    return (!bbml2 && (rodata_full || arm64_kfence_can_set_direct_map() ||
>> +               is_realm_world())) ||
>> +        debug_pagealloc_enabled();
>> +}
>> +
>>   static void __init map_mem(pgd_t *pgdp)
>>   {
>>       static const u64 direct_map_end = _PAGE_END(VA_BITS_MIN);
>> @@ -665,7 +892,7 @@ static void __init map_mem(pgd_t *pgdp)
>>         early_kfence_pool = arm64_kfence_alloc_pool();
>>   -    if (can_set_direct_map())
>> +    if (force_pte_mapping())
>>           flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>>         /*
>> @@ -1367,7 +1594,7 @@ int arch_add_memory(int nid, u64 start, u64 size,
>>         VM_BUG_ON(!mhp_range_allowed(start, size, true));
>>   -    if (can_set_direct_map())
>> +    if (force_pte_mapping())
>>           flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>>         __create_pgd_mapping(swapper_pg_dir, start, __phys_to_virt(start),
>> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>> index c6a85000fa0e..6a8eefc16dbc 100644
>> --- a/arch/arm64/mm/pageattr.c
>> +++ b/arch/arm64/mm/pageattr.c
>> @@ -140,6 +140,12 @@ static int update_range_prot(unsigned long start,
>> unsigned long size,
>>       data.set_mask = set_mask;
>>       data.clear_mask = clear_mask;
>>   +    ret = split_kernel_leaf_mapping(start);
>> +    if (!ret)
>> +        ret = split_kernel_leaf_mapping(start + size);
>> +    if (WARN_ON_ONCE(ret))
>> +        return ret;
> 
> This means we take the mutex lock twice and do lazy mmu twice too. So how's about:
> 
> mutex_lock()
> enter lazy mmu
> split_mapping(start)
> split_mapping(end)
> leave lazy mmu
> mutex_unlock()

Good point. In fact it would be even better to share the same lazy mmu
invocation with the permission change code below. How about something like this:

---8<---
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 5b5a84b34024..90ab0ab5b06a 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -625,8 +625,6 @@ static int split_pud(pud_t *pudp, pud_t pud, gfp_t gfp)
 	return 0;
 }

-static DEFINE_MUTEX(pgtable_split_lock);
-
 int split_kernel_leaf_mapping(unsigned long addr)
 {
 	pgd_t *pgdp, pgd;
@@ -636,14 +634,7 @@ int split_kernel_leaf_mapping(unsigned long addr)
 	pte_t *ptep, pte;
 	int ret = 0;

-	/*
-	 * !BBML2_NOABORT systems should not be trying to change permissions on
-	 * anything that is not pte-mapped in the first place. Just return early
-	 * and let the permission change code raise a warning if not already
-	 * pte-mapped.
-	 */
-	if (!system_supports_bbml2_noabort())
-		return 0;
+	VM_WARN_ON(!system_supports_bbml2_noabort());

 	/*
 	 * Ensure addr is at least page-aligned since this is the finest
@@ -652,9 +643,6 @@ int split_kernel_leaf_mapping(unsigned long addr)
 	if (addr != PAGE_ALIGN(addr))
 		return -EINVAL;

-	mutex_lock(&pgtable_split_lock);
-	arch_enter_lazy_mmu_mode();
-
 	/*
 	 * PGD: If addr is PGD aligned then addr already describes a leaf
 	 * boundary. If not present then there is nothing to split.
@@ -734,8 +722,6 @@ int split_kernel_leaf_mapping(unsigned long addr)
 		split_contpte(ptep);

 out:
-	arch_leave_lazy_mmu_mode();
-	mutex_unlock(&pgtable_split_lock);
 	return ret;
 }

diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 6a8eefc16dbc..73f80db2e5ba 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -131,6 +131,8 @@ bool can_set_direct_map(void)
 		arm64_kfence_can_set_direct_map() || is_realm_world();
 }

+static DEFINE_MUTEX(pgtable_split_lock);
+
 static int update_range_prot(unsigned long start, unsigned long size,
 			     pgprot_t set_mask, pgprot_t clear_mask)
 {
@@ -140,14 +142,23 @@ static int update_range_prot(unsigned long start, unsigned
long size,
 	data.set_mask = set_mask;
 	data.clear_mask = clear_mask;

-	ret = split_kernel_leaf_mapping(start);
-	if (!ret)
-		ret = split_kernel_leaf_mapping(start + size);
-	if (WARN_ON_ONCE(ret))
-		return ret;
-
 	arch_enter_lazy_mmu_mode();

+	/*
+	 * split_kernel_leaf_mapping() is only allowed for BBML2_NOABORT
+	 * systems. !BBML2_NOABORT systems should not be trying to change
+	 * permissions on anything that is not pte-mapped in the first place.
+	 */
+	if (system_supports_bbml2_noabort()) {
+		mutex_lock(&pgtable_split_lock);
+		ret = split_kernel_leaf_mapping(start);
+		if (!ret)
+			ret = split_kernel_leaf_mapping(start + size);
+		mutex_unlock(&pgtable_split_lock);
+		if (ret)
+			goto out;
+	}
+
 	/*
 	 * The caller must ensure that the range we are operating on does not
 	 * partially overlap a block mapping, or a cont mapping. Any such case
@@ -155,8 +166,8 @@ static int update_range_prot(unsigned long start, unsigned
long size,
 	 */
 	ret = walk_kernel_page_table_range_lockless(start, start + size,
 						    &pageattr_ops, &data);
+out:
 	arch_leave_lazy_mmu_mode();
-
 	return ret;
 }
---8<---

Of course this means we take the mutex while inside the lazy mmu section.
Technically sleeping is not allowed while in lazy mmu mode, but the arm64
implementation can handle it. If this is a step too far, I guess we can keep 2
separate lazy mmu sections; one for split as you suggest, and another for
permission change.

Thanks,
Ryan

> 
> Thanks,
> Yang
> 
>> +
>>       arch_enter_lazy_mmu_mode();
>>         /*
> 


