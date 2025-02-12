Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732A8C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 08:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HySIueFNNrdqyZ9t5cvOG6oajgzigJ0xtnthc9wXE54=; b=DeN2e2O++imF1KHBdrPh/y8wj0
	58ks2EgXWYxiW9heGBbTVSCRjxTpKFxOSUxf7gHCDoRzz7xzJ01x38VCJFKO7HPIeQkfK/NqEVvHe
	vWl4V0KrvjbsXMEf8M0oHbGiSKsQEwTpRXPQMxqkMQlWt2ab8VZLWGtL3GSmtR2T1fhGN5BaBbDC+
	YXfA57ONZkJck6Kotfq5225djnl2mRll7W+qDThtiS1MoRd8qUJw3pIADP6yefi9ibnXZwRzlDfNf
	xtfZVZC3Pj0a1KMqDXQ4aqkgZrKiJ5ML9qYwe511lh0ULmNRge1W1e1p3yDGQJ6/HWGVJ9rFMARAy
	BmOUM1+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti8ED-00000006eaL-18YU;
	Wed, 12 Feb 2025 08:36:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti88Y-00000006dEM-2R5g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 08:30:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739349025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HySIueFNNrdqyZ9t5cvOG6oajgzigJ0xtnthc9wXE54=;
	b=R2eToQi0OXelWC2o48hMFt1Leh8QXURzI3C8ySftdgGfeBeysoXslx9BCUwlEgGWazM30O
	pIR+EYAf5xoZLAQOXVAMQZ2g8gBELu0IWwLdjd8t18jTlOPdufOyybZZ33qFbcqZjTiadZ
	vGs2hEMuRLshAFeNLjt00Xn0tuA3ciQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-wsConxntNVOYsa3xsAnFVQ-1; Wed, 12 Feb 2025 03:30:24 -0500
X-MC-Unique: wsConxntNVOYsa3xsAnFVQ-1
X-Mimecast-MFC-AGG-ID: wsConxntNVOYsa3xsAnFVQ
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38dd8d11139so676423f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 00:30:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739349023; x=1739953823;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HySIueFNNrdqyZ9t5cvOG6oajgzigJ0xtnthc9wXE54=;
        b=eahr+KbRkSDjkyVbY1DQVzla/oJAf6ON20JYdgML/wU1DU12viRpPOQoQhVxLVELgD
         ll9JV9LYXZUkWGWxc5C9fPHWxf9Jo78GEBiXMpT5b3zdL8HVbNsIC3DC4Fj7ux7x0rGF
         zU6mfOGpsRrqfhpMdOJnm7l7Chv7qX7ItaHiGgm7JeBuqQ3zXsjPFhs6LHSfRLlJzRFx
         v6Ypm4xVF8X6rs5K0Sw6yGbXiXb8CIWLdO+fOWaQbSkD4wH97CKQsiiAxf4iUG9d4b0c
         LB6URhudgIR7Nb9PmYkxVvx791qTDT2G/gUkKs+HzdYpCip8zAVthekdDV3NnB/QHe8g
         ehhA==
X-Forwarded-Encrypted: i=1; AJvYcCWwAmz+F1oKytT1ITjqHMGogHK+7r91SkIzbqnwiJERdsQIXJJo8n2iPITWRPtK+UKbDykZzNXl13Yzbvt3zywg@lists.infradead.org
X-Gm-Message-State: AOJu0YzP7vFQA6ojy7iRpH6H2YPfGFouDYy+Cjw19qrUmn0BN7Jc91/6
	IBR1NZUxM3cDGQSq10EqCIP1e9TcCmXO5HiSKc18+tvSgggshtuW3Xi+Obwt/oOpWz3J5zGtO6n
	fcWDUEouN0NM/hM6ANy98vqQkhWiBtw8/DXSp/6ebdC/QxoQGS3YTC1i4jCDEFOIRx6Gz2Gc0
X-Gm-Gg: ASbGncv4AEWDkfsAlR0YnGG/YacXnaYZyY0l8CumEufecpBd58g1YTvpuHNNskXBmwT
	Q7CKxd4AG6aOD0Ycv7pk1BtspAZF+GfHgKbgNwP98kO6FTmUWcfILBFxqc42vFE62ZjWhLzq1DY
	RSxgUSPsvY9yLZoFDUyjxAXc3dRumNs1nPMJF24ZwCCv61vgoVxlbC3Hl9RAcHmuvOb3NlCiZ6H
	Ls+ZsxNAiqKLuAIVf+KRxZeN23D3WZKEZ7IbbTf87hNnHwYQ/n8lY5k7j5c2SuQwrgwg0SjbrUH
	uSb6Z3hp1qH4WEKM7vopoRSV+q8x6kxJjO4Zc66hbyslX44zS4x+XEW+J9DL4zPsqWyF47giP6h
	AuGO/OoCN8LO1yZ8uNo/DsKCyAKxK+Q==
X-Received: by 2002:a5d:6107:0:b0:38d:d3e2:db40 with SMTP id ffacd0b85a97d-38dea271527mr1246843f8f.17.1739349022851;
        Wed, 12 Feb 2025 00:30:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXM4Spi0sx5c4IGLUIHF8A1qqqZcsJbmawcndR3hb6ZbF2T223kr192mn2XjxsoZmlUj/XcA==
X-Received: by 2002:a5d:6107:0:b0:38d:d3e2:db40 with SMTP id ffacd0b85a97d-38dea271527mr1246814f8f.17.1739349022370;
        Wed, 12 Feb 2025 00:30:22 -0800 (PST)
Received: from ?IPV6:2003:cb:c70c:a600:1e3e:c75:d269:867a? (p200300cbc70ca6001e3e0c75d269867a.dip0.t-ipconnect.de. [2003:cb:c70c:a600:1e3e:c75:d269:867a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f2084ebdesm244867f8f.70.2025.02.12.00.30.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 00:30:21 -0800 (PST)
Message-ID: <1399ea09-b53c-4eba-a023-34b8906c9bdd@redhat.com>
Date: Wed, 12 Feb 2025 09:30:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm: pgtable: fix NULL pointer dereference issue
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: linux@armlinux.org.uk, ezra@easyb.ch, hughd@google.com,
 ryan.roberts@arm.com, akpm@linux-foundation.org, muchun.song@linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <be323425-2465-423a-a6f4-affbaa1efe09@bytedance.com>
 <20250212064002.55598-1-zhengqi.arch@bytedance.com>
 <d5bba68b-1dba-4367-8d4f-103348b80229@redhat.com>
 <54c30b02-c19e-4e51-8faf-7d6c5560ef6f@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <54c30b02-c19e-4e51-8faf-7d6c5560ef6f@bytedance.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bGPoRXsURIbFDFfgkzAoBBl-VIjaKNd-ShsRu-sJn6s_1739349023
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_003026_690695_4E1EFF6D 
X-CRM114-Status: GOOD (  23.98  )
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

On 12.02.25 09:28, Qi Zheng wrote:
> 
> 
> On 2025/2/12 16:20, David Hildenbrand wrote:
>> On 12.02.25 07:40, Qi Zheng wrote:
>>> When update_mmu_cache_range() is called by update_mmu_cache(), the vmf
>>> parameter is NULL, which will cause a NULL pointer dereference issue in
>>> adjust_pte():
>>>
>>> Unable to handle kernel NULL pointer dereference at virtual address
>>> 00000030 when read
>>> Hardware name: Atmel AT91SAM9
>>> PC is at update_mmu_cache_range+0x1e0/0x278
>>> LR is at pte_offset_map_rw_nolock+0x18/0x2c
>>> Call trace:
>>>    update_mmu_cache_range from remove_migration_pte+0x29c/0x2ec
>>>    remove_migration_pte from rmap_walk_file+0xcc/0x130
>>>    rmap_walk_file from remove_migration_ptes+0x90/0xa4
>>>    remove_migration_ptes from migrate_pages_batch+0x6d4/0x858
>>>    migrate_pages_batch from migrate_pages+0x188/0x488
>>>    migrate_pages from compact_zone+0x56c/0x954
>>>    compact_zone from compact_node+0x90/0xf0
>>>    compact_node from kcompactd+0x1d4/0x204
>>>    kcompactd from kthread+0x120/0x12c
>>>    kthread from ret_from_fork+0x14/0x38
>>> Exception stack(0xc0d8bfb0 to 0xc0d8bff8)
>>>
>>> To fix it, do not rely on whether 'ptl' is equal to decide whether to
>>> hold
>>> the pte lock, but decide it by whether CONFIG_SPLIT_PTE_PTLOCKS is
>>> enabled. In addition, if two vmas map to the same PTE page, there is no
>>> need to hold the pte lock again, otherwise a deadlock will occur. Just
>>> add
>>> the need_lock parameter to let adjust_pte() know this information.
>>>
>>> Reported-by: Ezra Buehler <ezra@easyb.ch>
>>> Closes:
>>> https://lore.kernel.org/lkml/CAM1KZSmZ2T_riHvay+7cKEFxoPgeVpHkVFTzVVEQ1BO0cLkHEQ@mail.gmail.com/
>>> Fixes: fc9c45b71f43 ("arm: adjust_pte() use pte_offset_map_rw_nolock()")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>>> ---
>>>    arch/arm/mm/fault-armv.c | 40 ++++++++++++++++++++++++++++------------
>>>    1 file changed, 28 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/arch/arm/mm/fault-armv.c b/arch/arm/mm/fault-armv.c
>>> index 2bec87c3327d2..3627bf0957c75 100644
>>> --- a/arch/arm/mm/fault-armv.c
>>> +++ b/arch/arm/mm/fault-armv.c
>>> @@ -62,7 +62,7 @@ static int do_adjust_pte(struct vm_area_struct *vma,
>>> unsigned long address,
>>>    }
>>>    static int adjust_pte(struct vm_area_struct *vma, unsigned long
>>> address,
>>> -              unsigned long pfn, struct vm_fault *vmf)
>>> +              unsigned long pfn, bool need_lock)
>>>    {
>>>        spinlock_t *ptl;
>>>        pgd_t *pgd;
>>> @@ -99,12 +99,11 @@ static int adjust_pte(struct vm_area_struct *vma,
>>> unsigned long address,
>>>        if (!pte)
>>>            return 0;
>>> -    /*
>>> -     * If we are using split PTE locks, then we need to take the page
>>> -     * lock here.  Otherwise we are using shared mm->page_table_lock
>>> -     * which is already locked, thus cannot take it.
>>> -     */
>>> -    if (ptl != vmf->ptl) {
>>> +    if (need_lock) {
>>> +        /*
>>> +         * Use nested version here to indicate that we are already
>>> +         * holding one similar spinlock.
>>> +         */
>>>            spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
>>>            if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(pmd)))) {
>>>                pte_unmap_unlock(pte, ptl);
>>> @@ -114,7 +113,7 @@ static int adjust_pte(struct vm_area_struct *vma,
>>> unsigned long address,
>>>        ret = do_adjust_pte(vma, address, pfn, pte);
>>> -    if (ptl != vmf->ptl)
>>> +    if (need_lock)
>>>            spin_unlock(ptl);
>>>        pte_unmap(pte);
>>> @@ -123,16 +122,17 @@ static int adjust_pte(struct vm_area_struct
>>> *vma, unsigned long address,
>>>    static void
>>>    make_coherent(struct address_space *mapping, struct vm_area_struct
>>> *vma,
>>> -          unsigned long addr, pte_t *ptep, unsigned long pfn,
>>> -          struct vm_fault *vmf)
>>> +          unsigned long addr, pte_t *ptep, unsigned long pfn)
>>>    {
>>>        struct mm_struct *mm = vma->vm_mm;
>>>        struct vm_area_struct *mpnt;
>>>        unsigned long offset;
>>> +    unsigned long start;
>>>        pgoff_t pgoff;
>>>        int aliases = 0;
>>>        pgoff = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
>>> +    start = ALIGN_DOWN(addr, PMD_SIZE);
>>
>> I assume you can come up with a better name than "start" :)
>>
>> aligned_addr ... pmd_start_addr ...
>>
>> Maybe simply
>>
>> pmd_start_addr = ALIGN_DOWN(addr, PMD_SIZE);
>> pmd_end_addr = addr + PMD_SIZE;
> 
> you mean:
> 
> pmd_end_addr = pmd_start_addr + PMD_SIZE;
> 
> Right?

Yes :)

>>
>>> +
>>>            /*
>>>             * If this VMA is not in our MM, we can ignore it.
>>>             * Note that we intentionally mask out the VMA
>>> @@ -151,7 +159,15 @@ make_coherent(struct address_space *mapping,
>>> struct vm_area_struct *vma,
>>>            if (!(mpnt->vm_flags & VM_MAYSHARE))
>>>                continue;
>>>            offset = (pgoff - mpnt->vm_pgoff) << PAGE_SHIFT;
>>> -        aliases += adjust_pte(mpnt, mpnt->vm_start + offset, pfn, vmf);
>>> +        mpnt_addr = mpnt->vm_start + offset;
>>> +        /*
>>> +         * If mpnt_addr and addr are mapped to the same PTE page, there
>>> +         * is no need to hold the pte lock again, otherwise a deadlock
>>> +         * will occur.
>>
>> /*
>>    * Avoid deadlocks by not grabbing the PTE lock if we already hold the
>>    * PTE lock of this PTE table in the caller.
>>    */
> 
> Maybe just:
> 
> /* Avoid deadlocks by not grabbing the same PTE lock again. */
> 

Agreed.

-- 
Cheers,

David / dhildenb


