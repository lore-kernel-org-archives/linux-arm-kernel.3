Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C6FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 08:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1N9/dh1gKenUxv/OYzR+uI9tVKa+QsTNdZz3DDWPEPs=; b=DZlPgrQRdLy10Ghiso9MnR5pCo
	iRh5hkm135h1ZGV/acz+dBnuuRKiXdOUe1omuCX+W1Ye+7IcNt5PSOjBZZ+z0HVLAOUsmPzlEUi2m
	wOzjQhrHJv8SmIvK0vH6TvrqUjpgLq6bSY2K7Lte+txqcnXwrQoC3rM33TU2l+uXFfjPHeMwnriyJ
	LCLnWLuYS/RHcMuLViI53/iQWVtTzF6Ht8uuy/l36ioBUf6dXBMXspbxkgB0JdCHy+5zCXRvRgeSu
	UiDM1gU3E1EMf3X278ks3x5vANuIG8z+qMZoV6KbS01c0RK0t6k/Pok64qJhEfEKlm9eKQIlZDFCO
	mhCu6Q9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tir9u-0000000E8vf-2n9i;
	Fri, 14 Feb 2025 08:34:50 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tir76-0000000E8Ka-1x4Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 08:31:57 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-21f48ebaadfso35888585ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 00:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739521915; x=1740126715; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1N9/dh1gKenUxv/OYzR+uI9tVKa+QsTNdZz3DDWPEPs=;
        b=SDedV1NA5dij8g6RFnzr5jzNy1JPwZkC6Lkfeqm8TVJEoymKd64uPdaw8584X6IgPO
         qWuzxYtAjCq7xNeKGZSz2mM8He4raXiZ0RXyHJQ5ZxlJY8exHTGdd2EnxeHlaPexPPJe
         rPsmRCRCPWnnj4v0psaEY4tsLq9RvXjsf54BB/R8VdzmT9uuGj5x8d8yYDbBhVmxqghT
         slkEZcBAWj9Vb+6+LwVAZXsffwaZDtWgHp/bUc77afCf9hPc1PlawKrcK67UQsAnI/Zx
         +XwMmLc/KAYz9h2vOJ4MJhh/sgzg7P1gqXIOqMscamr6lTxqyxsnrRoQuIo35YkzdkgO
         /o4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739521915; x=1740126715;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1N9/dh1gKenUxv/OYzR+uI9tVKa+QsTNdZz3DDWPEPs=;
        b=JtDbrT/zTiuTmRA6KBgFM82HzEN0navJxNvQeBMIoxKuiKFnmq3076ViwXW6FlLWcc
         FrDZs2MtOaB5hTqFGrhmzwf+zsQfnb+TCQFqBKEbOehXA95vFXuSqhuWAkrA4JLD2tEp
         oxyL5HBYMi3KpmuN136GN+GyzZhGv0+0Cof2N6Bibahldj0KI/3t/U/x/IyRh0YURrpD
         EYPPs4KQncO6GMZg0DhxQB7xWvqJq5MVjSMaGxW32YcrRI+Ma36nQZWwwCc68DKhRhv1
         j2PRyeXVXs8l0ZOniw/6cDLKZb5Bcl+CbUx6a+BxS7GEF4szMLJIJgkWXhIrypFvus9a
         3I/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVYYjMoqtELptjSDumjriowW0GbcsjRiqTd2/vFu6BBdPgfwvRBpbAxKJx9ZUO1zXewcVfpGWjAiAvx2p1jVek@lists.infradead.org
X-Gm-Message-State: AOJu0YzdKyQmIZtcyA7BZawZX2dA6N0ATSLAEaz0cJ2dvE1qlU6o8btX
	1cbmAL3zSwYOUXENEIFQoRIanyLiEc3ADhb1sCKNVHU2hCKbQOpAKyEm44afvUE=
X-Gm-Gg: ASbGncucM3pR0CltIDvyeHrltBWcJqLbF/46c21WW+zqNgbCFOHj6dtlaAnttx0zpZU
	P7c3wdSasjz5BHYOsy/SMUb6JZdf5Djtj1CQ98wsehzYM3hie3UabnjPskuQdNBv0xj3oe0fhOs
	Hupq0zacyHMrZ2CRiM2DkuaVJCrEaSrtTarJEWvkxmKVy3X2SHB6X6kYWYQkKGiY0UFBetgOzty
	axhkc6dAKhvp/RIUw3KauKwNRIR1k2biTCcp2AVJBF6p1W4uMAkC0MOfq+YmB96y+H1zVl6dGi2
	02zighgc51wtJy2MvQGMC+xbbhEo3NiFaA5V1Tyl
X-Google-Smtp-Source: AGHT+IFish6SuWBlkvc7bmWP37Y6+7Yh+XXEUSCWODRR3jA2THJeF+j5+UDYBR8TSK0wMeZq/qTgUg==
X-Received: by 2002:a17:902:ec83:b0:220:ce37:e31f with SMTP id d9443c01a7336-220ce37e53fmr85586195ad.17.1739521915507;
        Fri, 14 Feb 2025 00:31:55 -0800 (PST)
Received: from [10.84.150.121] ([63.216.146.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf9757365sm4588023a91.0.2025.02.14.00.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 00:31:55 -0800 (PST)
Message-ID: <c2ae16f5-9ce7-4616-be76-c777d3fa16c6@bytedance.com>
Date: Fri, 14 Feb 2025 16:31:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm: pgtable: fix NULL pointer dereference issue
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>
Cc: linux@armlinux.org.uk, ezra@easyb.ch, hughd@google.com,
 ryan.roberts@arm.com, akpm@linux-foundation.org, muchun.song@linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Ezra Buehler
 <ezra.buehler@husqvarnagroup.com>, stable@vger.kernel.org
References: <20250214030349.45524-1-zhengqi.arch@bytedance.com>
 <f15bd993-20de-41ae-8631-9ce557cd9d20@redhat.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <f15bd993-20de-41ae-8631-9ce557cd9d20@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_003156_518986_C4466EAC 
X-CRM114-Status: GOOD (  26.68  )
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



On 2025/2/14 16:11, David Hildenbrand wrote:
> On 14.02.25 04:03, Qi Zheng wrote:
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
>> Reported-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
>> Closes: 
>> https://lore.kernel.org/lkml/CAM1KZSmZ2T_riHvay+7cKEFxoPgeVpHkVFTzVVEQ1BO0cLkHEQ@mail.gmail.com/
>> Fixes: fc9c45b71f43 ("arm: adjust_pte() use pte_offset_map_rw_nolock()")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>> Changes in v2:
>>   - change Ezra's email address (Ezra Buehler)
>>   - some cleanups (David Hildenbrand)
>>
>>   arch/arm/mm/fault-armv.c | 38 ++++++++++++++++++++++++++------------
>>   1 file changed, 26 insertions(+), 12 deletions(-)
>>
>> diff --git a/arch/arm/mm/fault-armv.c b/arch/arm/mm/fault-armv.c
>> index 2bec87c3327d2..ea4c4e15f0d31 100644
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
>> @@ -123,16 +122,18 @@ static int adjust_pte(struct vm_area_struct 
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
>> +    unsigned long pmd_start_addr, pmd_end_addr;
> 
> Nit: reverse christmas tree would make us put this line at the very top.
> 
> Maybe do the initialization directly:
> 
> const unsigned long pmd_start_addr = ALIGN_DOWN(addr, PMD_SIZE);
> const unsigned long pmd_end_addr = pmd_start_addr + PMD_SIZE;

Agree, will do.

> 
>>       pgoff_t pgoff;
>>       int aliases = 0;
>>       pgoff = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
>> +    pmd_start_addr = ALIGN_DOWN(addr, PMD_SIZE);
>> +    pmd_end_addr = pmd_start_addr + PMD_SIZE;
>>       /*
>>        * If we have any shared mappings that are in the same mm
>> @@ -141,6 +142,14 @@ make_coherent(struct address_space *mapping, 
>> struct vm_area_struct *vma,
>>        */
>>       flush_dcache_mmap_lock(mapping);
>>       vma_interval_tree_foreach(mpnt, &mapping->i_mmap, pgoff, pgoff) {
>> +        /*
>> +         * If we are using split PTE locks, then we need to take the pte
>> +         * lock. Otherwise we are using shared mm->page_table_lock which
>> +         * is already locked, thus cannot take it.
>> +         */
>> +        bool need_lock = IS_ENABLED(CONFIG_SPLIT_PTE_PTLOCKS);
>> +        unsigned long mpnt_addr;
>> +
>>           /*
>>            * If this VMA is not in our MM, we can ignore it.
>>            * Note that we intentionally mask out the VMA
>> @@ -151,7 +160,12 @@ make_coherent(struct address_space *mapping, 
>> struct vm_area_struct *vma,
>>           if (!(mpnt->vm_flags & VM_MAYSHARE))
>>               continue;
>>           offset = (pgoff - mpnt->vm_pgoff) << PAGE_SHIFT;
>> -        aliases += adjust_pte(mpnt, mpnt->vm_start + offset, pfn, vmf);
>> +        mpnt_addr = mpnt->vm_start + offset;
>> +
>> +        /* Avoid deadlocks by not grabbing the same PTE lock again. */
>> +        if (mpnt_addr >= pmd_start_addr && mpnt_addr < pmd_end_addr)
>> +            need_lock = false;
>> +        aliases += adjust_pte(mpnt, mpnt_addr, pfn, need_lock);
>>       }
>>       flush_dcache_mmap_unlock(mapping);
>>       if (aliases)
>> @@ -194,7 +208,7 @@ void update_mmu_cache_range(struct vm_fault *vmf, 
>> struct vm_area_struct *vma,
>>           __flush_dcache_folio(mapping, folio);
>>       if (mapping) {
>>           if (cache_is_vivt())
>> -            make_coherent(mapping, vma, addr, ptep, pfn, vmf);
>> +            make_coherent(mapping, vma, addr, ptep, pfn);
>>           else if (vma->vm_flags & VM_EXEC)
>>               __flush_icache_all();
>>       }
> 
> 
> Apart from that LGTM. Hoping it will work :)

+1

> 
> Acked-by: David Hildenbrand <david@redhat.com>

Thanks!

> 

