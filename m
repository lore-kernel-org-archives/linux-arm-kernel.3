Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0ACC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 08:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=612jIvxL1e9qxD4qIQOZLpI6wF7davzI0ud5ar8CQG0=; b=qQeEoPjHUqk7xeoiQXzPeubQp0
	feLKNU1YLfuRDkXUTqtzpxwOHY+mQ7YBYz3mdNBgZTb3Q9Duw7oguUe/DZGzrxty068iZaS0zLdo8
	t76X/x46KtOVRSF7gUlrq+gBeMFCLb+DT1R4RaKwIk+HVryUOz1VzUW6pjTpHMUsBiCYjGSRLrM05
	/qeYZaqro5MbGx+gij5Z38TU/hFz8Zp3AI+BIO3WIvmEvtzRqvVn/8UDGr35+ZaLIMfUCXy4LavXu
	lvk+DBdO5PdlJ7RVZdJM0fTq658AvnjOJpErDP1vc7JpZO0ZSwDtOCDmBhlE8MmxFpQ/gZQAkw+JP
	fy/xZ1SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti8Cp-00000006eLw-2AqW;
	Wed, 12 Feb 2025 08:34:51 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti873-00000006cra-2PJI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 08:28:55 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21f6f18b474so56301385ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 00:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739348933; x=1739953733; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=612jIvxL1e9qxD4qIQOZLpI6wF7davzI0ud5ar8CQG0=;
        b=a6Kj20v57AKaxb5EKHIyLg6Qz7gup4fYraDd0nVs821N6CgMv+TiOn75F/TG9wNRGv
         ggkibAjNw84kk+jHH/NNr0o7qCeNgJ0CUQV/Vc36Ea96EBW/FbaP/v1j1yW/Ny7x10br
         50iAQ4qN0DmXAUjEKDJybxDWaFrQxwYnhtBlQkBAd/RbnDkgWb5qgc8XtoAzTmr7kZI6
         crAHPqhn+Nr2TlBGzb881vs0orFrnGOppg9dBznRc7hrJ35+1XiQ96C3A8ROoNhlPfDr
         xLUJgLLfhsRS0WhGCgWAEJZo+D7nRWGKruDv+kHCsd60Uyia+NZKN681C6ZfwYqu0ucq
         t7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739348933; x=1739953733;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=612jIvxL1e9qxD4qIQOZLpI6wF7davzI0ud5ar8CQG0=;
        b=s0sfWBc8Ut7474ov4EFZP9uUo+dhvwKlWUoWBscjcOa2TtHqcQH7sPmFluiwiPSH8f
         I3HbqXba46cYsCtknooan+v+J609gBfZF5hgm+bGkBzPVWn14YAWZRMHdL9PTz3Sw4g/
         0LfcLzvEux2mQ29p4ehxP43h8R7d4dRLddcUUix56FFMWC7flbJgYS5ykfrlnnuAtTi4
         leiHghuKrNdPmejz5IW5g7vQy4+toBGbeZFz9HCNKD8aO3q8t+sl8LoD+bU33o1ZiR6i
         NqKfBd/I7hAR6u2UL8eNDnfABw2PEtWEzD7wDOdFrFNLJ+cjpoMY7TKEpEycJVqK8Wlh
         pWYA==
X-Forwarded-Encrypted: i=1; AJvYcCUnhEcDuXB8jxCi2n/toNPaniT6R7V5T89GwJ6zwR8TrOUplXDnlN+r9mvZnDC60jrHf+pIPaYgUnmJi39NBVYB@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0YsiI5g3ie+menp+JHuLd9fbLSrge/x8mg9QpslqzhkwNZZvA
	jncAUDucfb7IzJBQKT3Yss8BCEFff812n8XBRC3zCXh0WWVwIX2m7dsxw1DdgpY=
X-Gm-Gg: ASbGnctxOeVYSKbWPH27Kdn64hlOFek82UxALHidRfLPZpZQQKo+rLBM3YhjVXxznqS
	qFXaotNbCLT5TyTRLlljJXWDieGI7ZSgxLUfghjw8JI8t9aMemMxJPaiIuhSpCDJQs1aA7imbQs
	bIHwQBCdS4eGtyn7LpoFrGTuLur9XatHg4vWf5PKxgpCYsOY1GJ0ZlqQOIqYjoom4FQlGnhdYeg
	5M7JVucaiQtAdODZhst8Fb/PqqfsiicuQu5v4BRswpQbyLynNSkDKREoha5TwFEipFTUJoOwP84
	gon7k8O6tCx18vuZa1FhFf74HbbgkaraHGIkaG7wOQ==
X-Google-Smtp-Source: AGHT+IHo8yGkr5oWd5KwlTZvIww/CgYd/mju7TZBIcFxDlPlQYOvlk0NqYOCKf+nhwBq6H3RsyfUFg==
X-Received: by 2002:a05:6a21:7a4c:b0:1db:f68a:d943 with SMTP id adf61e73a8af0-1ee5c74731bmr3748745637.17.1739348932670;
        Wed, 12 Feb 2025 00:28:52 -0800 (PST)
Received: from [10.84.150.121] ([203.208.167.154])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51aeccfc5sm10700388a12.17.2025.02.12.00.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 00:28:52 -0800 (PST)
Message-ID: <54c30b02-c19e-4e51-8faf-7d6c5560ef6f@bytedance.com>
Date: Wed, 12 Feb 2025 16:28:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm: pgtable: fix NULL pointer dereference issue
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>
Cc: linux@armlinux.org.uk, ezra@easyb.ch, hughd@google.com,
 ryan.roberts@arm.com, akpm@linux-foundation.org, muchun.song@linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <be323425-2465-423a-a6f4-affbaa1efe09@bytedance.com>
 <20250212064002.55598-1-zhengqi.arch@bytedance.com>
 <d5bba68b-1dba-4367-8d4f-103348b80229@redhat.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <d5bba68b-1dba-4367-8d4f-103348b80229@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_002853_640371_9ECA7563 
X-CRM114-Status: GOOD (  27.90  )
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



On 2025/2/12 16:20, David Hildenbrand wrote:
> On 12.02.25 07:40, Qi Zheng wrote:
>> When update_mmu_cache_range() is called by update_mmu_cache(), the vmf
>> parameter is NULL, which will cause a NULL pointer dereference issue in
>> adjust_pte():
>>
>> Unable to handle kernel NULL pointer dereference at virtual address 
>> 00000030 when read
>> Hardware name: Atmel AT91SAM9
>> PC is at update_mmu_cache_range+0x1e0/0x278
>> LR is at pte_offset_map_rw_nolock+0x18/0x2c
>> Call trace:
>>   update_mmu_cache_range from remove_migration_pte+0x29c/0x2ec
>>   remove_migration_pte from rmap_walk_file+0xcc/0x130
>>   rmap_walk_file from remove_migration_ptes+0x90/0xa4
>>   remove_migration_ptes from migrate_pages_batch+0x6d4/0x858
>>   migrate_pages_batch from migrate_pages+0x188/0x488
>>   migrate_pages from compact_zone+0x56c/0x954
>>   compact_zone from compact_node+0x90/0xf0
>>   compact_node from kcompactd+0x1d4/0x204
>>   kcompactd from kthread+0x120/0x12c
>>   kthread from ret_from_fork+0x14/0x38
>> Exception stack(0xc0d8bfb0 to 0xc0d8bff8)
>>
>> To fix it, do not rely on whether 'ptl' is equal to decide whether to 
>> hold
>> the pte lock, but decide it by whether CONFIG_SPLIT_PTE_PTLOCKS is
>> enabled. In addition, if two vmas map to the same PTE page, there is no
>> need to hold the pte lock again, otherwise a deadlock will occur. Just 
>> add
>> the need_lock parameter to let adjust_pte() know this information.
>>
>> Reported-by: Ezra Buehler <ezra@easyb.ch>
>> Closes: 
>> https://lore.kernel.org/lkml/CAM1KZSmZ2T_riHvay+7cKEFxoPgeVpHkVFTzVVEQ1BO0cLkHEQ@mail.gmail.com/
>> Fixes: fc9c45b71f43 ("arm: adjust_pte() use pte_offset_map_rw_nolock()")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>>   arch/arm/mm/fault-armv.c | 40 ++++++++++++++++++++++++++++------------
>>   1 file changed, 28 insertions(+), 12 deletions(-)
>>
>> diff --git a/arch/arm/mm/fault-armv.c b/arch/arm/mm/fault-armv.c
>> index 2bec87c3327d2..3627bf0957c75 100644
>> --- a/arch/arm/mm/fault-armv.c
>> +++ b/arch/arm/mm/fault-armv.c
>> @@ -62,7 +62,7 @@ static int do_adjust_pte(struct vm_area_struct *vma, 
>> unsigned long address,
>>   }
>>   static int adjust_pte(struct vm_area_struct *vma, unsigned long 
>> address,
>> -              unsigned long pfn, struct vm_fault *vmf)
>> +              unsigned long pfn, bool need_lock)
>>   {
>>       spinlock_t *ptl;
>>       pgd_t *pgd;
>> @@ -99,12 +99,11 @@ static int adjust_pte(struct vm_area_struct *vma, 
>> unsigned long address,
>>       if (!pte)
>>           return 0;
>> -    /*
>> -     * If we are using split PTE locks, then we need to take the page
>> -     * lock here.  Otherwise we are using shared mm->page_table_lock
>> -     * which is already locked, thus cannot take it.
>> -     */
>> -    if (ptl != vmf->ptl) {
>> +    if (need_lock) {
>> +        /*
>> +         * Use nested version here to indicate that we are already
>> +         * holding one similar spinlock.
>> +         */
>>           spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
>>           if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(pmd)))) {
>>               pte_unmap_unlock(pte, ptl);
>> @@ -114,7 +113,7 @@ static int adjust_pte(struct vm_area_struct *vma, 
>> unsigned long address,
>>       ret = do_adjust_pte(vma, address, pfn, pte);
>> -    if (ptl != vmf->ptl)
>> +    if (need_lock)
>>           spin_unlock(ptl);
>>       pte_unmap(pte);
>> @@ -123,16 +122,17 @@ static int adjust_pte(struct vm_area_struct 
>> *vma, unsigned long address,
>>   static void
>>   make_coherent(struct address_space *mapping, struct vm_area_struct 
>> *vma,
>> -          unsigned long addr, pte_t *ptep, unsigned long pfn,
>> -          struct vm_fault *vmf)
>> +          unsigned long addr, pte_t *ptep, unsigned long pfn)
>>   {
>>       struct mm_struct *mm = vma->vm_mm;
>>       struct vm_area_struct *mpnt;
>>       unsigned long offset;
>> +    unsigned long start;
>>       pgoff_t pgoff;
>>       int aliases = 0;
>>       pgoff = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
>> +    start = ALIGN_DOWN(addr, PMD_SIZE);
> 
> I assume you can come up with a better name than "start" :)
> 
> aligned_addr ... pmd_start_addr ...
> 
> Maybe simply
> 
> pmd_start_addr = ALIGN_DOWN(addr, PMD_SIZE);
> pmd_end_addr = addr + PMD_SIZE;

you mean:

pmd_end_addr = pmd_start_addr + PMD_SIZE;

Right?

> 
> Then the comparison below also becomes easier to read.
> 
>>       /*
>>        * If we have any shared mappings that are in the same mm
>> @@ -141,6 +141,14 @@ make_coherent(struct address_space *mapping, 
>> struct vm_area_struct *vma,
>>        */
>>       flush_dcache_mmap_lock(mapping);
>>       vma_interval_tree_foreach(mpnt, &mapping->i_mmap, pgoff, pgoff) {
>> +        unsigned long mpnt_addr;
>> +        /*
>> +         * If we are using split PTE locks, then we need to take the pte
>> +         * lock. Otherwise we are using shared mm->page_table_lock which
>> +         * is already locked, thus cannot take it.
>> +         */
>> +        bool need_lock = IS_ENABLED(CONFIG_SPLIT_PTE_PTLOCKS);
> 
> Nit: move "unsigned long mpnt_addr;" below this longer variable+init.

OK, will do.

> 
>> +
>>           /*
>>            * If this VMA is not in our MM, we can ignore it.
>>            * Note that we intentionally mask out the VMA
>> @@ -151,7 +159,15 @@ make_coherent(struct address_space *mapping, 
>> struct vm_area_struct *vma,
>>           if (!(mpnt->vm_flags & VM_MAYSHARE))
>>               continue;
>>           offset = (pgoff - mpnt->vm_pgoff) << PAGE_SHIFT;
>> -        aliases += adjust_pte(mpnt, mpnt->vm_start + offset, pfn, vmf);
>> +        mpnt_addr = mpnt->vm_start + offset;
>> +        /*
>> +         * If mpnt_addr and addr are mapped to the same PTE page, there
>> +         * is no need to hold the pte lock again, otherwise a deadlock
>> +         * will occur.
> 
> /*
>   * Avoid deadlocks by not grabbing the PTE lock if we already hold the
>   * PTE lock of this PTE table in the caller.
>   */

Maybe just:

/* Avoid deadlocks by not grabbing the same PTE lock again. */

Thanks,
Qi

> 
> ?
> 
>> +         */
>> +        if (mpnt_addr >= start && mpnt_addr - start < PMD_SIZE)
>> +            need_lock = false;
> 
> 
> 

