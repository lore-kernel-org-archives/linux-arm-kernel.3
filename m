Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C630C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 19:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vfQI9Zp3u7xxHzx8USFneWg+7J0GkvoymFFOyqkhxfc=; b=XaPOFGfdQDowRqLkIyB534uiZg
	eO7JjPDcRxpl0cx/mAABXk7e6G3gg3ZnzmD9ERvnLnGKpGp6EKzaTYPr+F/keNFg2NA6D5H4BqKeL
	HAtngoTyxybtgBZp+eqbIiU/n9kr/cHRK2VU7C9EKnec/Q2mjoeFqWYYPE3ljAj1/PP99K2FpnjYB
	uLCyKfWHqeN7H+lu4OCgG5/qNNvvmfPAPsSedjvF62uk8ZzD1a4BXfMBrmq3HAKVVwS7TJ4advM1r
	+/UjZkVaVEXwUSd6cQPB+wFO4ssWH6I7x6r0Xlq8nmiGxu2t522xyyGmlEKAPX1m0r0MbPHEy0ZCw
	/W9AECQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9jW-00000006fuj-2P6w;
	Tue, 24 Jun 2025 19:55:06 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU6UK-00000006Gb2-0Orz;
	Tue, 24 Jun 2025 16:27:13 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so63425655e9.1;
        Tue, 24 Jun 2025 09:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750782430; x=1751387230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfQI9Zp3u7xxHzx8USFneWg+7J0GkvoymFFOyqkhxfc=;
        b=D8J2FrCFQlAC/fmX/uAaDxs7Sr5TwHolmSsdgOjHVwXmBDsnWyGH5UWnMXGVUdKiah
         bo3bOlrshrLOe+v+lUaGOpKnetJ/22DeRTcC54nt2VsmOYTLWCpkBBfYFHW1N6Ip5Yzp
         I1/tLIroTBdGOIYZsDAI3pbxFiyCzc6tCgLpW8feJCa7dxtizAzXMN2Ov9YOmPEZ2kKs
         6HKzz9NinFdHlRHAlw7J9ioNXVuaSLLbDVMkvGftiG0cG5LJh9vQTXytEK2fGi9QAW35
         qYmF0i/tkd2G7sENjTiHyxqMq28oYxX1GM2bHCkOFqaTm1O0uNrNpIIrYs5CMUidl2L8
         aTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750782430; x=1751387230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfQI9Zp3u7xxHzx8USFneWg+7J0GkvoymFFOyqkhxfc=;
        b=ReM9bQWTT/NFEQjMHCIqkFv49wqfkK8qPnQ6hoR7v7UBz5ft09SGuY7Fh+v74ajwqv
         8Rj02M4xho98tqmTyaMBfMI2+HzDv0ZT8IFiQ7nnqVEtzMlczirSYxRvweOqKCpWYSmz
         KK7Zdr45ZQY6pqwII0afviiWPpzI9UZU1CJbKGwj0WuiwNUsu3kdKFgqJ8cGwehmRzn3
         tfnmUIY/sbMLvFAKU2KNHEuZYVZGSs5oDw++icZDfxH7tS5spJGF3C45zuEQU3jNdknL
         J2jEBhwW9QgNygKCIrxX9z6lFiecpn1mh6nYjxvp1v1PuUdsYb0SN+WvBHQrrb/tsDu6
         wfZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUY8OMhB3kvemjrs7zoSdhcbDDtSq3nFz38/L7vacrtoiz8yxDHK/yp4IEC1SGj1fDYwOpgKQ3tic1Rm+Q=@lists.infradead.org, AJvYcCXPEzKD8aVMNQlDo21qMeztWjoRGtEW2fJCyRBibxxYY9+fRwCpIDofZBPs7c800LKXSzUOfQHei6IhLBzXftSH@lists.infradead.org
X-Gm-Message-State: AOJu0Ywxbk6vLX3Zt3aEx8Zb3uinDSqX/oVDtEOvhHWxWhoG5eRcCvle
	1AY3olymE6kYqRuAaY+H9GXudJHAdo5XtyCbhoMZuvGSFqFIP6ScZaq5
X-Gm-Gg: ASbGnctIbkbzxFFCIrn10Cncj3Np4TWeAcUnkHiG4L6p0FalSJpJwUTT22k36IbH84s
	O5QJOFEReMeYkD6R77z1MTTOfJXVPl+8VBUiicAJjgnO4k/x6asCTOLgJ5Wn88SKuJbIuTaC/q7
	is+1VCEPwKLfX7hOaPNFfJrBkujok0qq1aWGadN25Uz5b98pcdFVPlQoMQxVw0PiWDvuj/uCVS0
	1oQ6o5mrJDG4BSYwezd660y81q0ckYdGrDlqINRMWTCXlMkXbHQ/Ss7K67d/BfXu78BT9lm6eus
	2ncWe5qlTfFlUD99waGAB8NlKhoxyrNNkZ7zX1NjwHF3U4ClGw==
X-Google-Smtp-Source: AGHT+IGjHJmY+eS3Ezzzmmv0iIiNJG0AeJ4sIzX9fod1PSWFl8jor/RhAVVtop+K7gu3E2hIu7gfhA==
X-Received: by 2002:a05:6000:4a16:b0:3a4:ee3f:e9a6 with SMTP id ffacd0b85a97d-3a6d1331fd2mr14561131f8f.54.1750782430437;
        Tue, 24 Jun 2025 09:27:10 -0700 (PDT)
Received: from localhost.localdomain ([2a09:0:1:2::305a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805175asm2267875f8f.20.2025.06.24.09.27.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Jun 2025 09:27:10 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
To: david@redhat.com
Cc: 21cnbao@gmail.com,
	akpm@linux-foundation.org,
	baolin.wang@linux.alibaba.com,
	chrisl@kernel.org,
	ioworker0@gmail.com,
	kasong@tencent.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	lorenzo.stoakes@oracle.com,
	ryan.roberts@arm.com,
	v-songbaohua@oppo.com,
	x86@kernel.org,
	ying.huang@intel.com,
	zhengtangquan@oppo.com
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large folios during reclamation
Date: Wed, 25 Jun 2025 00:25:03 +0800
Message-ID: <20250624162503.78957-1-ioworker0@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_092712_137646_C1921703 
X-CRM114-Status: GOOD (  25.63  )
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

On 2025/6/24 23:34, David Hildenbrand wrote:
> On 24.06.25 17:26, Lance Yang wrote:
>> On 2025/6/24 20:55, David Hildenbrand wrote:
>>> On 14.02.25 10:30, Barry Song wrote:
>>>> From: Barry Song <v-songbaohua@oppo.com>
>> [...]
>>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>>> index 89e51a7a9509..8786704bd466 100644
>>>> --- a/mm/rmap.c
>>>> +++ b/mm/rmap.c
>>>> @@ -1781,6 +1781,25 @@ void folio_remove_rmap_pud(struct folio *folio,
>>>> struct page *page,
>>>>    #endif
>>>>    }
>>>> +/* We support batch unmapping of PTEs for lazyfree large folios */
>>>> +static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
>>>> +            struct folio *folio, pte_t *ptep)
>>>> +{
>>>> +    const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>>> +    int max_nr = folio_nr_pages(folio);
>>>
>>> Let's assume we have the first page of a folio mapped at the last page
>>> table entry in our page table.
>>
>> Good point. I'm curious if it is something we've seen in practice ;)
> 
> I challenge you to write a reproducer :P I assume it might be doable 
> through simple mremap().
> 
>>
>>>
>>> What prevents folio_pte_batch() from reading outside the page table?
>>
>> Assuming such a scenario is possible, to prevent any chance of an
>> out-of-bounds read, how about this change:
>>
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index fb63d9256f09..9aeae811a38b 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -1852,6 +1852,25 @@ static inline bool 
>> can_batch_unmap_folio_ptes(unsigned long addr,
>>       const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>       int max_nr = folio_nr_pages(folio);
>>       pte_t pte = ptep_get(ptep);
>> +    unsigned long end_addr;
>> +
>> +    /*
>> +     * To batch unmap, the entire folio's PTEs must be contiguous
>> +     * and mapped within the same PTE page table, which corresponds to
>> +     * a single PMD entry. Before calling folio_pte_batch(), which does
>> +     * not perform boundary checks itself, we must verify that the
>> +     * address range covered by the folio does not cross a PMD boundary.
>> +     */
>> +    end_addr = addr + (max_nr * PAGE_SIZE) - 1;
>> +
>> +    /*
>> +     * A fast way to check for a PMD boundary cross is to align both
>> +     * the start and end addresses to the PMD boundary and see if they
>> +     * are different. If they are, the range spans across at least two
>> +     * different PMD-managed regions.
>> +     */
>> +    if ((addr & PMD_MASK) != (end_addr & PMD_MASK))
>> +        return false;
> 
> You should not be messing with max_nr = folio_nr_pages(folio) here at 
> all. folio_pte_batch() takes care of that.
> 
> Also, way too many comments ;)
> 
> You may only batch within a single VMA and within a single page table.
> 
> So simply align the addr up to the next PMD, and make sure it does not 
> exceed the vma end.
> 
> ALIGN and friends can help avoiding excessive comments.

Thanks! How about this updated version based on your suggestion:

diff --git a/mm/rmap.c b/mm/rmap.c
index fb63d9256f09..241d55a92a47 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1847,12 +1847,25 @@ void folio_remove_rmap_pud(struct folio *folio, struct page *page,
 
 /* We support batch unmapping of PTEs for lazyfree large folios */
 static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
-			struct folio *folio, pte_t *ptep)
+					      struct folio *folio, pte_t *ptep,
+					      struct vm_area_struct *vma)
 {
 	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
+	unsigned long next_pmd, vma_end, end_addr;
 	int max_nr = folio_nr_pages(folio);
 	pte_t pte = ptep_get(ptep);
 
+	/*
+	 * Limit the batch scan within a single VMA and within a single
+	 * page table.
+	 */
+	vma_end = vma->vm_end;
+	next_pmd = ALIGN(addr + 1, PMD_SIZE);
+	end_addr = addr + (unsigned long)max_nr * PAGE_SIZE;
+
+	if (end_addr > min(next_pmd, vma_end))
+		return false;
+
 	if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
 		return false;
 	if (pte_unused(pte))
@@ -2025,7 +2038,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				folio_mark_dirty(folio);
 		} else if (likely(pte_present(pteval))) {
 			if (folio_test_large(folio) && !(flags & TTU_HWPOISON) &&
-			    can_batch_unmap_folio_ptes(address, folio, pvmw.pte))
+			    can_batch_unmap_folio_ptes(address, folio, pvmw.pte, pvmw.vma))
 				nr_pages = folio_nr_pages(folio);
 			end_addr = address + nr_pages * PAGE_SIZE;
 			flush_cache_range(vma, address, end_addr);
--
Thanks,
Lance

