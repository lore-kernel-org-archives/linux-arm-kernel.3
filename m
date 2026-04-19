Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72ED0EA718A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 11:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:To:References:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CVIi4BTXGqRWLbaF1AjKsZST1JQete5I/BbrbNbXtW8=; b=LwGNLb60spzM23SUBFH7NuH83t
	cJXBbezSYFHqUuwB7NVV+auJ4oh7IRkxj/L1vj88bTtIxveFT/CfJW6/A9Jmu6eb08NPVIImFoC83
	ovBXSGFb+9rBedUVuaj+Bvdgrq02PCBa2dYhhRyKHPGZnWC2fLkl0Glaqk/+NSLEpAROCd6lcfBee
	9w/d80yZP9TP9fw/mUVT8QmCE9rKwweU6rxCY50Osg6wi/2KznA3ItCh3ACgPkRPOnE5YwfuJUof7
	HbMAdyAaVAEavw5S5a8dIxMUXdvnxS0djBewByIAknZxM7lF2Uvu3v8RiQeJc3X/lCay72YzxJcVs
	5hrXjmFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEQGG-00000005jpg-27JY;
	Sun, 19 Apr 2026 11:24:24 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEQGC-00000005jpG-46Tk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Apr 2026 11:24:22 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2b299b3c739so9422515ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 04:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776597859; x=1777202659; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:cc:to:references
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CVIi4BTXGqRWLbaF1AjKsZST1JQete5I/BbrbNbXtW8=;
        b=M4JeiIWhP8Sx1YPx1sk8YrGHMHSxypEwcmgYHSEN+oJwINrE8OcNHoeq0+w59xVqvQ
         MbWKRKoN+3hZfkoSj1UIAuMI3JI6vLmX0/A4GIfwQYZWtP2FGtWlQHrctFr3Q/TWyEnT
         O2/JMR6PnykR4o34t0g0m9paldTpPvrc7dDzirIFuGM1z+sUgtI6fTjf2jSvhtkGOFej
         hbvPuvbYBMfy6gm4HXBLZlDezPgGJ7UsTBZh/5k64mX9kaGcG/OIhCX1X8n3AO+x5ANR
         DN2fiQXX6/4B8rfQI8IgdYcHuMuiC7bEaDX5T8kEyvlmvSmyrHgofhLnsNsZ48EWy+SH
         sa6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776597859; x=1777202659;
        h=content-transfer-encoding:in-reply-to:from:cc:to:references
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CVIi4BTXGqRWLbaF1AjKsZST1JQete5I/BbrbNbXtW8=;
        b=NGQpL3l4dZ2J4ftmuZuDJdn7Nj7eorg89nd40asbtv6HQ0hArnCOtaz/ngaCgeHbjY
         XpV2i/op8kcmpc0M5eoW+Pn8Bs4qi5zsQmubZPt0DFTPaiTI3m5C0v4zKwHrRLPEhIsm
         axGVBg+DYFqRNd1lc7IDSyi160OeI6H6CpgsiPHN5oy5U+59G9p7XMixZkT4S+ioemhi
         S+HP5v+fU/JrBXgYnZZ/IC0Tr9FAcmH1GxnyDSOPG7sFsN33tQg/phqbDfvJ/CA32fWx
         hR/swUqWR13crjjqrelYJMVZRs5s/hpw7Gp/MtL/ig3G/QtCL1XOvD+4A/kscbQhM1t8
         hLbA==
X-Forwarded-Encrypted: i=1; AFNElJ9p4aAtl3mKGe8A9oD59S2QzY6zz7qyEDZ0PpTIVobyznYDwWzgflZH51jmUJurr6vrixMmugS2hm6tR8QSnHTV@lists.infradead.org
X-Gm-Message-State: AOJu0YyPkw/19uXqbYDB2FZA1kwkVyc9Zk9LLJBgwc6P2QezJUPtsytI
	x3j72J7rt2nQoxQZYt1LAOS+9uqGlODiQjO3wbG5eB8CUuTDbENrtvP4
X-Gm-Gg: AeBDietlu1kOVy+L3TvVkDPCA/5q2MFGAiPpYJjSxAcp0E17sYKkXQVLoKft4n7Rn0y
	nRKJrDhOfgMNGiKe0V3npvTlu5UvkIc1Moiel6OETh2Yq2/b1PkU2+b+Mwobv+4g5l10Db0rExO
	HwSUVwQK1x7ocvrMW29yFGARJe6u3IwxVXLj+iTMgVuMsY6iVaRCsoNN2pMR2a49y5UyOaZMMVD
	CEoLbz2ni9YzNcIDvnS+mvEldgskRTrXSXQeuZyved31O7UkvHJFxfdfp9ACJib3PCHFFI6UTN2
	Q3kANM7K4xKQmROWmITlNqRKa5XqJv8Y0z3wvuIn30owLGmDNOXQDmUFefU5wDPKaKojP9jCzc8
	Qrj4DdUisIPlpbCVHctWHPlmrOBJrAvvHyZbAtOcBBgKkmSgUcs5YzepbKZvl2WSTxvCXoknSA1
	lblV0ty/FtxR2wVthmcWQdfrASlH4ZRzgkMEoYpHtvs4p8F5EWU3QkFYKLL5B+i88Iw4Y3O378z
	jFqXFkvWU2Uoda/SJ5vQBw7XlxCRNBH29obEXaI2gsKU/WZyu84ADQGZHKCzGoU
X-Received: by 2002:a17:903:198c:b0:2b2:90f3:d774 with SMTP id d9443c01a7336-2b5f9e85c92mr103655085ad.2.1776597859436;
        Sun, 19 Apr 2026 04:24:19 -0700 (PDT)
Received: from [127.0.0.1] (211-76-176-101.dynamic-ip.pni.tw. [211.76.176.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab29398sm72897605ad.66.2026.04.19.04.24.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Apr 2026 04:24:18 -0700 (PDT)
Message-ID: <07686318-dfdc-43d0-bfb4-5635e2eb70da@gmail.com>
Date: Sun, 19 Apr 2026 19:24:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 4/4] mm: add PMD-level huge page support for
 remap_pfn_range()
Content-Language: en-US
References: <5d04929b-576f-4926-9f3b-be9a41a3e010@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>, lorenzo.stoakes@oracle.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, willy@infradead.org, jgross@suse.com,
 catalin.marinas@arm.com, will@kernel.org, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, luto@kernel.org,
 peterz@infradead.org, akpm@linux-foundation.org, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 lance.yang@linux.dev, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, anshuman.khandual@arm.com, rmclure@linux.ibm.com,
 kevin.brodsky@arm.com, apopple@nvidia.com, ajd@linux.ibm.com,
 pasha.tatashin@soleen.com, bhe@redhat.com, thuth@redhat.com,
 coxu@redhat.com, dan.j.williams@intel.com, yu-cheng.yu@intel.com,
 yangyicong@hisilicon.com, baolu.lu@linux.intel.com,
 conor.dooley@microchip.com, Jonathan.Cameron@huawei.com, riel@surriel.com,
 wangkefeng.wang@huawei.com, chenjun102@huawei.com
From: Yin Tirui <yintirui@gmail.com>
In-Reply-To: <5d04929b-576f-4926-9f3b-be9a41a3e010@gmail.com>
X-Forwarded-Message-Id: <5d04929b-576f-4926-9f3b-be9a41a3e010@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_042421_085836_BB11602A 
X-CRM114-Status: GOOD (  43.13  )
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

Hi David,

Thanks a lot for the thorough review!

On 4/14/26 04:02, David Hildenbrand (Arm) wrote:
> On 2/28/26 08:09, Yin Tirui wrote:
>> Add PMD-level huge page support to remap_pfn_range(), automatically
>> creating huge mappings when prerequisites are satisfied (size, alignment,
>> architecture support, etc.) and falling back to normal page mappings
>> otherwise.
>>
>> Implement special huge PMD splitting by utilizing the pgtable deposit/
>> withdraw mechanism. When splitting is needed, the deposited pgtable is
>> withdrawn and populated with individual PTEs created from the original
>> huge mapping.
>>
>> Signed-off-by: Yin Tirui <yintirui@huawei.com>
>> ---
> 
> [...]
> 
>>  
>>  	if (!vma_is_anonymous(vma)) {
>>  		old_pmd = pmdp_huge_clear_flush(vma, haddr, pmd);
>> +
>> +		if (!vma_is_dax(vma) && vma_is_special_huge(vma)) {
> 
> These magical vma checks are really bad. This all needs a cleanup
> (Lorenzo is doing some, hoping it will look better on top of that).
> 
Agreed. I am following Lorenzo's recent cleanups closely.

>> +			pte_t entry;
>> +
>> +			if (!pmd_special(old_pmd)) {
> 
> If you are using pmd_special(), you are doing something wrong.
> 
> Hint: vm_normal_page_pmd() is usually what you want.

Spot on.

While looking into applying vm_normal_folio_pmd() here to avoid the
magical VMA checks, I realized that both __split_huge_pmd_locked() and
copy_huge_pmd() currently suffer from the same !vma_is_anonymous(vma)
top-level entanglement.I think these functions could benefit from a
structural refactoring similar to what Lorenzo is currently doing in
zap_huge_pmd().

My idea is to flatten both functions into a pmd_present()-driven
decision tree:
1. Branch strictly on pmd_present().
2. For present PMDs, rely exclusively on vm_normal_folio_pmd() to
determine the underlying memory type, rather than guessing from VMA flags.
3. If !folio (and not a huge zero page), it cleanly identifies special
mappings (like PFNMAPs) without relying on vma_is_special_huge(). We can
handle the split/copy directly and return early.
4. Otherwise, proceed with the normal Anon/File THP logic, or handle
non-present migration entries in the !pmd_present() branch.

I have drafted two preparation patches demonstrating this approach and
appended the diffs at the end of this email. Does this direction look
reasonable to you? If so, I will iron out the implementation details and
include these refactoring patches in my upcoming v4 series.

> 
>> +				zap_deposited_table(mm, pmd);
>> +				return;
>> +			}
>> +			pgtable = pgtable_trans_huge_withdraw(mm, pmd);
>> +			if (unlikely(!pgtable))
>> +				return;
>> +			pmd_populate(mm, &_pmd, pgtable);
>> +			pte = pte_offset_map(&_pmd, haddr);
>> +			entry = pfn_pte(pmd_pfn(old_pmd), pmd_pgprot(old_pmd));
>> +			set_ptes(mm, haddr, pte, entry, HPAGE_PMD_NR);
>> +			pte_unmap(pte);
>> +
>> +			smp_wmb(); /* make pte visible before pmd */
>> +			pmd_populate(mm, pmd, pgtable);
>> +			return;
>> +		}
>> +
>>  		/*
>>  		 * We are going to unmap this huge page. So
>>  		 * just go ahead and zap it
>>  		 */
>>  		if (arch_needs_pgtable_deposit())
>>  			zap_deposited_table(mm, pmd);
>> -		if (!vma_is_dax(vma) && vma_is_special_huge(vma))
>> -			return;
>> +
>>  		if (unlikely(pmd_is_migration_entry(old_pmd))) {
>>  			const softleaf_t old_entry = softleaf_from_pmd(old_pmd);
>>  
>> diff --git a/mm/memory.c b/mm/memory.c
>> index 07778814b4a8..affccf38cbcf 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -2890,6 +2890,40 @@ static int remap_pte_range(struct mm_struct *mm, pmd_t *pmd,
>>  	return err;
>>  }
>>  
>> +#ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
> 
> Why exactly do we need arch support for that in form of a Kconfig.
> 
> Usually, we guard pmd support by CONFIG_TRANSPARENT_HUGEPAGE.
> 
> And then, we must check at runtime if PMD leaves are actually supported.
> 
> Luiz is working on a cleanup series:
> 
> https://lore.kernel.org/r/cover.1775679721.git.luizcap@redhat.com
> 
> pgtable_has_pmd_leaves() is what you would want to check.

Makes sense. This Kconfig was inherited from Peter Xu's earlier
proposal, but depending on CONFIG_TRANSPARENT_HUGEPAGE and
pgtable_has_pmd_leaves() is indeed the correct standard. I will rebase
on Luiz's series.

> 
> 
>> +static int remap_try_huge_pmd(struct mm_struct *mm, pmd_t *pmd,
>> +			unsigned long addr, unsigned long end,
>> +			unsigned long pfn, pgprot_t prot)
> 
> Use two-tab indent. (currently 3? :) )
> 
> Also, we tend to call these things now "pmd leaves". Call it
>  "remap_try_pmd_leaf" or something even more expressive like
> 
> "remap_try_install_pmd_leaf()"
> 

Noted. Will fix the indentation and rename it.

>> +{
>> +	pgtable_t pgtable;
>> +	spinlock_t *ptl;
>> +
>> +	if ((end - addr) != PMD_SIZE)
> 
> 	if (end - addr != PMD_SIZE)
> 
> Should work

Noted.

> 
>> +		return 0;
>> +
>> +	if (!IS_ALIGNED(addr, PMD_SIZE))
>> +		return 0;
>> +
> 
> You could likely combine both things into a
> 
> 	if (!IS_ALIGNED(addr | end, PMD_SIZE))
> 
>> +	if (!IS_ALIGNED(pfn, HPAGE_PMD_NR))
> 
> Another sign that you piggy-back on THP support ;)

Indeed! :)

> 
>> +		return 0;
>> +
>> +	if (pmd_present(*pmd) && !pmd_free_pte_page(pmd, addr))
>> +		return 0;
> 
> Ripping out a page table?! That doesn't sound right :)
> 
> Why is that required? We shouldn't be doing that here. Gah.
> 
> Especially, without any pmd locks etc.

...oops. That is indeed a silly one. Thanks for catching it.
I will fix this to:

	if (!pmd_none(*pmd))
		return 0;

> 
>> +
>> +	pgtable = pte_alloc_one(mm);
>> +	if (unlikely(!pgtable))
>> +		return 0;
>> +
>> +	mm_inc_nr_ptes(mm);
>> +	ptl = pmd_lock(mm, pmd);
>> +	set_pmd_at(mm, addr, pmd, pmd_mkspecial(pmd_mkhuge(pfn_pmd(pfn, prot))));
>> +	pgtable_trans_huge_deposit(mm, pmd, pgtable);
>> +	spin_unlock(ptl);
>> +
>> +	return 1;
>> +}
>> +#endif
>> +
>>  static inline int remap_pmd_range(struct mm_struct *mm, pud_t *pud,
>>  			unsigned long addr, unsigned long end,
>>  			unsigned long pfn, pgprot_t prot)
>> @@ -2905,6 +2939,12 @@ static inline int remap_pmd_range(struct mm_struct *mm, pud_t *pud,
>>  	VM_BUG_ON(pmd_trans_huge(*pmd));
>>  	do {
>>  		next = pmd_addr_end(addr, end);
>> +#ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
>> +		if (remap_try_huge_pmd(mm, pmd, addr, next,
>> +				pfn + (addr >> PAGE_SHIFT), prot)) {
> 
> Please provide a stub instead so we don't end up with ifdef in this code.

Will do.

> 

Appendix:

Based on the mm-stable branch.

1. copy_huge_pmd()

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 42c983821c03..3f8b3f15c6ba 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1912,35 +1912,11 @@ int copy_huge_pmd(struct mm_struct *dst_mm,
struct mm_struct *src_mm,
 		  struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
 {
 	spinlock_t *dst_ptl, *src_ptl;
-	struct page *src_page;
 	struct folio *src_folio;
 	pmd_t pmd;
 	pgtable_t pgtable = NULL;
 	int ret = -ENOMEM;

-	pmd = pmdp_get_lockless(src_pmd);
-	if (unlikely(pmd_present(pmd) && pmd_special(pmd) &&
-		     !is_huge_zero_pmd(pmd))) {
-		dst_ptl = pmd_lock(dst_mm, dst_pmd);
-		src_ptl = pmd_lockptr(src_mm, src_pmd);
-		spin_lock_nested(src_ptl, SINGLE_DEPTH_NESTING);
-		/*
-		 * No need to recheck the pmd, it can't change with write
-		 * mmap lock held here.
-		 *
-		 * Meanwhile, making sure it's not a CoW VMA with writable
-		 * mapping, otherwise it means either the anon page wrongly
-		 * applied special bit, or we made the PRIVATE mapping be
-		 * able to wrongly write to the backend MMIO.
-		 */
-		VM_WARN_ON_ONCE(is_cow_mapping(src_vma->vm_flags) && pmd_write(pmd));
-		goto set_pmd;
-	}
-
-	/* Skip if can be re-fill on fault */
-	if (!vma_is_anonymous(dst_vma))
-		return 0;
-
 	pgtable = pte_alloc_one(dst_mm);
 	if (unlikely(!pgtable))
 		goto out;
@@ -1952,48 +1928,69 @@ int copy_huge_pmd(struct mm_struct *dst_mm,
struct mm_struct *src_mm,
 	ret = -EAGAIN;
 	pmd = *src_pmd;

-	if (unlikely(thp_migration_supported() &&
-		     pmd_is_valid_softleaf(pmd))) {
+	if (likely(pmd_present(pmd))) {
+		src_folio = vm_normal_folio_pmd(src_vma, addr, pmd);
+		if (unlikely(!src_folio)) {
+			/*
+			 * When page table lock is held, the huge zero pmd should not be
+			 * under splitting since we don't split the page itself, only pmd to
+			 * a page table.
+			 */
+			if (is_huge_zero_pmd(pmd)) {
+				/*
+				 * mm_get_huge_zero_folio() will never allocate a new
+				 * folio here, since we already have a zero page to
+				 * copy. It just takes a reference.
+				 */
+				mm_get_huge_zero_folio(dst_mm);
+				goto out_zero_page;
+			}
+
+			/*
+			 * Making sure it's not a CoW VMA with writable
+			 * mapping, otherwise it means either the anon page wrongly
+			 * applied special bit, or we made the PRIVATE mapping be
+			 * able to wrongly write to the backend MMIO.
+			 */
+			VM_WARN_ON_ONCE(is_cow_mapping(src_vma->vm_flags) && pmd_write(pmd));
+			pte_free(dst_mm, pgtable);
+			goto set_pmd;
+		}
+
+		if (!folio_test_anon(src_folio)) {
+			pte_free(dst_mm, pgtable);
+			ret = 0;
+			goto out_unlock;
+		}
+
+		folio_get(src_folio);
+		if (unlikely(folio_try_dup_anon_rmap_pmd(src_folio, &src_folio->page,
dst_vma, src_vma))) {
+			/* Page maybe pinned: split and retry the fault on PTEs. */
+			folio_put(src_folio);
+			pte_free(dst_mm, pgtable);
+			spin_unlock(src_ptl);
+			spin_unlock(dst_ptl);
+			__split_huge_pmd(src_vma, src_pmd, addr, false);
+			return -EAGAIN;
+		}
+		add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
+
+	} else if (unlikely(thp_migration_supported() &&
pmd_is_valid_softleaf(pmd))) {
+		if (unlikely(!vma_is_anonymous(dst_vma))) {
+			pte_free(dst_mm, pgtable);
+			ret = 0;
+			goto out_unlock;
+		}
 		copy_huge_non_present_pmd(dst_mm, src_mm, dst_pmd, src_pmd, addr,
 					  dst_vma, src_vma, pmd, pgtable);
 		ret = 0;
 		goto out_unlock;
-	}

-	if (unlikely(!pmd_trans_huge(pmd))) {
+	} else {
 		pte_free(dst_mm, pgtable);
 		goto out_unlock;
 	}
-	/*
-	 * When page table lock is held, the huge zero pmd should not be
-	 * under splitting since we don't split the page itself, only pmd to
-	 * a page table.
-	 */
-	if (is_huge_zero_pmd(pmd)) {
-		/*
-		 * mm_get_huge_zero_folio() will never allocate a new
-		 * folio here, since we already have a zero page to
-		 * copy. It just takes a reference.
-		 */
-		mm_get_huge_zero_folio(dst_mm);
-		goto out_zero_page;
-	}

-	src_page = pmd_page(pmd);
-	VM_BUG_ON_PAGE(!PageHead(src_page), src_page);
-	src_folio = page_folio(src_page);
-
-	folio_get(src_folio);
-	if (unlikely(folio_try_dup_anon_rmap_pmd(src_folio, src_page, dst_vma,
src_vma))) {
-		/* Page maybe pinned: split and retry the fault on PTEs. */
-		folio_put(src_folio);
-		pte_free(dst_mm, pgtable);
-		spin_unlock(src_ptl);
-		spin_unlock(dst_ptl);
-		__split_huge_pmd(src_vma, src_pmd, addr, false);
-		return -EAGAIN;
-	}
-	add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
 out_zero_page:
 	mm_inc_nr_ptes(dst_mm);
 	pgtable_trans_huge_deposit(dst_mm, dst_pmd, pgtable);


2. __split_huge_pmd_locked()

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 3f8b3f15c6ba..c02c2843520f 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3090,98 +3090,50 @@ static void __split_huge_pmd_locked(struct
vm_area_struct *vma, pmd_t *pmd,

 	count_vm_event(THP_SPLIT_PMD);

-	if (!vma_is_anonymous(vma)) {
-		old_pmd = pmdp_huge_clear_flush(vma, haddr, pmd);
-		/*
-		 * We are going to unmap this huge page. So
-		 * just go ahead and zap it
-		 */
-		if (arch_needs_pgtable_deposit())
-			zap_deposited_table(mm, pmd);
-		if (vma_is_special_huge(vma))
-			return;
-		if (unlikely(pmd_is_migration_entry(old_pmd))) {
-			const softleaf_t old_entry = softleaf_from_pmd(old_pmd);
+	if (pmd_present(*pmd)) {
+		folio = vm_normal_folio_pmd(vma, haddr, *pmd);

-			folio = softleaf_to_folio(old_entry);
-		} else if (is_huge_zero_pmd(old_pmd)) {
+		if (unlikely(!folio)) {
+			/* Huge Zero Page */
+			if (is_huge_zero_pmd(*pmd))
+				/*
+				 * FIXME: Do we want to invalidate secondary mmu by calling
+				 * mmu_notifier_arch_invalidate_secondary_tlbs() see comments below
+				 * inside __split_huge_pmd() ?
+				 *
+				 * We are going from a zero huge page write protected to zero
+				 * small page also write protected so it does not seems useful
+				 * to invalidate secondary mmu at this time.
+				 */
+				return __split_huge_zero_page_pmd(vma, haddr, pmd);
+
+			/* Huge PFNMAP */
+			old_pmd = pmdp_huge_clear_flush(vma, haddr, pmd);
+			if (arch_needs_pgtable_deposit())
+				zap_deposited_table(mm, pmd);
 			return;
-		} else {
+		}
+
+		/* File/Shmem THP */
+		if (unlikely(!folio_test_anon(folio))) {
+			old_pmd = pmdp_huge_clear_flush(vma, haddr, pmd);
+			if (arch_needs_pgtable_deposit())
+				zap_deposited_table(mm, pmd);
+			if (vma_is_special_huge(vma))
+				return;
+
 			page = pmd_page(old_pmd);
-			folio = page_folio(page);
 			if (!folio_test_dirty(folio) && pmd_dirty(old_pmd))
 				folio_mark_dirty(folio);
 			if (!folio_test_referenced(folio) && pmd_young(old_pmd))
 				folio_set_referenced(folio);
 			folio_remove_rmap_pmd(folio, page, vma);
 			folio_put(folio);
+			add_mm_counter(mm, mm_counter_file(folio), -HPAGE_PMD_NR);
+			return;
 		}
-		add_mm_counter(mm, mm_counter_file(folio), -HPAGE_PMD_NR);
-		return;
-	}
-
-	if (is_huge_zero_pmd(*pmd)) {
-		/*
-		 * FIXME: Do we want to invalidate secondary mmu by calling
-		 * mmu_notifier_arch_invalidate_secondary_tlbs() see comments below
-		 * inside __split_huge_pmd() ?
-		 *
-		 * We are going from a zero huge page write protected to zero
-		 * small page also write protected so it does not seems useful
-		 * to invalidate secondary mmu at this time.
-		 */
-		return __split_huge_zero_page_pmd(vma, haddr, pmd);
-	}
-
-	if (pmd_is_migration_entry(*pmd)) {
-		softleaf_t entry;
-
-		old_pmd = *pmd;
-		entry = softleaf_from_pmd(old_pmd);
-		page = softleaf_to_page(entry);
-		folio = page_folio(page);
-
-		soft_dirty = pmd_swp_soft_dirty(old_pmd);
-		uffd_wp = pmd_swp_uffd_wp(old_pmd);
-
-		write = softleaf_is_migration_write(entry);
-		if (PageAnon(page))
-			anon_exclusive = softleaf_is_migration_read_exclusive(entry);
-		young = softleaf_is_migration_young(entry);
-		dirty = softleaf_is_migration_dirty(entry);
-	} else if (pmd_is_device_private_entry(*pmd)) {
-		softleaf_t entry;
-
-		old_pmd = *pmd;
-		entry = softleaf_from_pmd(old_pmd);
-		page = softleaf_to_page(entry);
-		folio = page_folio(page);
-
-		soft_dirty = pmd_swp_soft_dirty(old_pmd);
-		uffd_wp = pmd_swp_uffd_wp(old_pmd);
-
-		write = softleaf_is_device_private_write(entry);
-		anon_exclusive = PageAnonExclusive(page);

-		/*
-		 * Device private THP should be treated the same as regular
-		 * folios w.r.t anon exclusive handling. See the comments for
-		 * folio handling and anon_exclusive below.
-		 */
-		if (freeze && anon_exclusive &&
-		    folio_try_share_anon_rmap_pmd(folio, page))
-			freeze = false;
-		if (!freeze) {
-			rmap_t rmap_flags = RMAP_NONE;
-
-			folio_ref_add(folio, HPAGE_PMD_NR - 1);
-			if (anon_exclusive)
-				rmap_flags |= RMAP_EXCLUSIVE;
-
-			folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
-						 vma, haddr, rmap_flags);
-		}
-	} else {
+		/* Anon THP */
 		/*
 		 * Up to this point the pmd is present and huge and userland has
 		 * the whole access to the hugepage during the split (which
@@ -3207,7 +3159,6 @@ static void __split_huge_pmd_locked(struct
vm_area_struct *vma, pmd_t *pmd,
 		 */
 		old_pmd = pmdp_invalidate(vma, haddr, pmd);
 		page = pmd_page(old_pmd);
-		folio = page_folio(page);
 		if (pmd_dirty(old_pmd)) {
 			dirty = true;
 			folio_set_dirty(folio);
@@ -3218,8 +3169,6 @@ static void __split_huge_pmd_locked(struct
vm_area_struct *vma, pmd_t *pmd,
 		uffd_wp = pmd_uffd_wp(old_pmd);

 		VM_WARN_ON_FOLIO(!folio_ref_count(folio), folio);
-		VM_WARN_ON_FOLIO(!folio_test_anon(folio), folio);
-
 		/*
 		 * Without "freeze", we'll simply split the PMD, propagating the
 		 * PageAnonExclusive() flag for each PTE by setting it for
@@ -3236,17 +3185,82 @@ static void __split_huge_pmd_locked(struct
vm_area_struct *vma, pmd_t *pmd,
 		 * See folio_try_share_anon_rmap_pmd(): invalidate PMD first.
 		 */
 		anon_exclusive = PageAnonExclusive(page);
-		if (freeze && anon_exclusive &&
-		    folio_try_share_anon_rmap_pmd(folio, page))
+		if (freeze && anon_exclusive && folio_try_share_anon_rmap_pmd(folio,
page))
 			freeze = false;
 		if (!freeze) {
 			rmap_t rmap_flags = RMAP_NONE;
-
 			folio_ref_add(folio, HPAGE_PMD_NR - 1);
 			if (anon_exclusive)
 				rmap_flags |= RMAP_EXCLUSIVE;
-			folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
-						 vma, haddr, rmap_flags);
+			folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR, vma, haddr,
rmap_flags);
+		}
+	} else { /* pmd not present */
+		folio = pmd_to_softleaf_folio(*pmd);
+		if (unlikely(!folio))
+			return;
+
+		/* Migration of File/Shmem THP */
+		if (unlikely(!folio_test_anon(folio))) {
+			old_pmd = pmdp_huge_clear_flush(vma, haddr, pmd);
+			if (arch_needs_pgtable_deposit())
+				zap_deposited_table(mm, pmd);
+			if (vma_is_special_huge(vma))
+				return;
+			add_mm_counter(mm, mm_counter_file(folio), -HPAGE_PMD_NR);
+			return;
+		}
+
+		/* Migration of Anon THP or Device Private*/
+		if (pmd_is_migration_entry(*pmd)) {
+			softleaf_t entry;
+
+			old_pmd = *pmd;
+			entry = softleaf_from_pmd(old_pmd);
+			page = softleaf_to_page(entry);
+			folio = page_folio(page);
+
+			soft_dirty = pmd_swp_soft_dirty(old_pmd);
+			uffd_wp = pmd_swp_uffd_wp(old_pmd);
+
+			write = softleaf_is_migration_write(entry);
+			if (PageAnon(page))
+				anon_exclusive = softleaf_is_migration_read_exclusive(entry);
+			young = softleaf_is_migration_young(entry);
+			dirty = softleaf_is_migration_dirty(entry);
+		} else if (pmd_is_device_private_entry(*pmd)) {
+			softleaf_t entry;
+
+			old_pmd = *pmd;
+			entry = softleaf_from_pmd(old_pmd);
+			page = softleaf_to_page(entry);
+
+			soft_dirty = pmd_swp_soft_dirty(old_pmd);
+			uffd_wp = pmd_swp_uffd_wp(old_pmd);
+
+			write = softleaf_is_device_private_write(entry);
+			anon_exclusive = PageAnonExclusive(page);
+
+			/*
+			* Device private THP should be treated the same as regular
+			* folios w.r.t anon exclusive handling. See the comments for
+			* folio handling and anon_exclusive below.
+			*/
+			if (freeze && anon_exclusive &&
+				folio_try_share_anon_rmap_pmd(folio, page))
+				freeze = false;
+			if (!freeze) {
+				rmap_t rmap_flags = RMAP_NONE;
+
+				folio_ref_add(folio, HPAGE_PMD_NR - 1);
+				if (anon_exclusive)
+					rmap_flags |= RMAP_EXCLUSIVE;
+
+				folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
+							vma, haddr, rmap_flags);
+			}
+		} else {
+			VM_WARN_ONCE(1, "unknown situation.");
+			return;
 		}
 	}

-- 
2.43.0


-- 
Yin Tirui


