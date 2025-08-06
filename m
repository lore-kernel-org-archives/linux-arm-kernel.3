Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A46C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 08:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=idlUt3rsM+yBY2pffT/6Us1aEZrNslTr2qkjcKhWpWM=; b=1dhu+l3ZhktuQY6YK1VJKntBXA
	xBfZ+D8gtiZeLVAkJ0KGJcV6lI8B/PMrfebFJPmkVlwNvfZAT/9Mhz+xJU1qYncrY3coCSja/BOqU
	T22tN554/8ByqyzSi6JZk4HZ9tXOFYdFPMzvSr/OAnmSYl6VxHoyd7OR2WmpwqT0BE7xgOSe2awKm
	xU00CS6zSyRha/PaQ10KB8Zmw1U3Sxi6RghTEun4Fx9b9y/41Q/R1fCIltxGPXasvBYZ0uvrQdaFm
	rFjKIQBd//X9OiSW/gD3Zazqo8DoP4BvfohWWiL5V1U5X7wO6Lc9hEQPYIzztp9XWoZl5fPUOHxTc
	5XrFNYhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujZEz-0000000EbHH-1qno;
	Wed, 06 Aug 2025 08:11:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujZCS-0000000Eb1P-0yhC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 08:08:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754467718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=idlUt3rsM+yBY2pffT/6Us1aEZrNslTr2qkjcKhWpWM=;
	b=AmDrYEvo9vgs5+Eii0UAt5YAoL+K9eQxeCqd59LtcMMUyKHiZanb8o+GNkTlQvjOL+9YU3
	6Dd9i/zxzK3tVdbvX6xA2gZkmDnj8qAP8l7r3EABq+pVJNjvCo1Xa8+FApIIT4nzhyUuyc
	4aRC5bc9UwEbadX2xkgzE2XBhH3pG1w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-ljXH1fCUNKuedSI5kOqmKw-1; Wed, 06 Aug 2025 04:08:37 -0400
X-MC-Unique: ljXH1fCUNKuedSI5kOqmKw-1
X-Mimecast-MFC-AGG-ID: ljXH1fCUNKuedSI5kOqmKw_1754467716
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-459de0d5fb1so21026675e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 01:08:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754467716; x=1755072516;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=idlUt3rsM+yBY2pffT/6Us1aEZrNslTr2qkjcKhWpWM=;
        b=Ms0jFKdd36DCKQQz4w4gKIP66SJP6wnh00PJ7QXtRz60qrMR/jx18i9jUHNWbwIBg2
         BAxmDLfPA5GzUMQjCUNBVGRkVAbxnz5XQUa7dngmGOURZC7XlGCxbGB2SGXjrRZcc9/F
         WsgidJpzyiRdbi7TUCnl5fZyxkmcmuinPAAyzJ8wzSFcL45sH63/niPCx5dWGSV/0bEL
         BpETIS0F4eIsTql2RSn6wFU0+8gdPDkYeQMtT8nVSDKGRb5/MCP/heUXLcZWqyRsfKH8
         qsXlAHwsJmvkaseEI3msdsPC0cZiO89Rl2kE3ZZI4K3zMPAusIMO70NFD9Yb9Lewds7e
         X8TQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfeeIy2dIvPjleKnm6cZVZf0YtJU4fIKUSfDom1z+K3JubCeC/JiQ4mTCWoY77qZT3IadGNTsn8JerRpr3GnC7@lists.infradead.org
X-Gm-Message-State: AOJu0YwNJ7ksTajSDhq71T5+5ohEoUNheUtNJzWI2EH3oCPt+lb9ywqY
	nSaBdGrLRgzR4jKUMqosz9NFfknlNOFlJrzFpoI9vDTCx8nn/4Y6s8FJfB4AT8trTXYr8k/ZKDn
	LpAYxptAYv11hgyggxWl21rswHTkgPNI5ONopkMGH8gQuaX6+QuXWs30uVsmV7g4Sf8QuSmNOvk
	bF
X-Gm-Gg: ASbGnctWFE9BGyDtBsrgx0Yyzk/FeuzK6CvOqJwH6xbO3EPe7u8hp7F55ovSEBIrqH6
	SZ3WIdRboRFu6HvDZasgjvOCmPZ6ufh7fOU6UGZ1Vsoa4wQJaW5TGZ0uUq3d7vOAMB7XeKHEfU1
	dqoa9yMYflJtu75JbWKlezVEtPxmXlf+q6lF/iw5/knJzPtIkzXAwgxPKrlDSOwGiWompWH/n4H
	h7sMiKeBSsSY1FbSJSXSQoW+nGBMDf5kWVouGwOVvKu9OukQjKqueOz0Utf4b2/gJcWPoiUoXKN
	CVyXl7GIpEFbIM9Z00BVsyiOaALrcCl7d/Uu3k28vm103c8ZzfpI0KmaUTnlf79ZD619Z/c=
X-Received: by 2002:a05:600c:5307:b0:459:dde3:1a56 with SMTP id 5b1f17b1804b1-459e7e4cbbdmr10990955e9.28.1754467716127;
        Wed, 06 Aug 2025 01:08:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnF+JC70Y+wij7D0xhvmStL7sg8B0/W7PEfpWoYIUbNo5rKcmTj513UkofaGh3WuFA13jIvg==
X-Received: by 2002:a05:600c:5307:b0:459:dde3:1a56 with SMTP id 5b1f17b1804b1-459e7e4cbbdmr10990605e9.28.1754467715584;
        Wed, 06 Aug 2025 01:08:35 -0700 (PDT)
Received: from [192.168.3.141] (p4fe0ffa9.dip0.t-ipconnect.de. [79.224.255.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e58400f5sm35850175e9.2.2025.08.06.01.08.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 01:08:34 -0700 (PDT)
Message-ID: <7567c594-7588-49e0-8b09-2a591181b24d@redhat.com>
Date: Wed, 6 Aug 2025 10:08:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] mm: Optimize mprotect() by PTE batching
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250718090244.21092-1-dev.jain@arm.com>
 <20250718090244.21092-7-dev.jain@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <20250718090244.21092-7-dev.jain@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HckynwqwwrCpwbOxSLxHD7ZrN4LT9HEtUDzUTIh-rpw_1754467716
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_010840_422371_F703C247 
X-CRM114-Status: GOOD (  46.22  )
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

On 18.07.25 11:02, Dev Jain wrote:
> Use folio_pte_batch to batch process a large folio. Note that, PTE
> batching here will save a few function calls, and this strategy in certain
> cases (not this one) batches atomic operations in general, so we have
> a performance win for all arches. This patch paves the way for patch 7
> which will help us elide the TLBI per contig block on arm64.
> 
> The correctness of this patch lies on the correctness of setting the
> new ptes based upon information only from the first pte of the batch
> (which may also have accumulated a/d bits via modify_prot_start_ptes()).
> 
> Observe that the flag combination we pass to mprotect_folio_pte_batch()
> guarantees that the batch is uniform w.r.t the soft-dirty bit and the
> writable bit. Therefore, the only bits which may differ are the a/d bits.
> So we only need to worry about code which is concerned about the a/d bits
> of the PTEs.
> 
> Setting extra a/d bits on the new ptes where previously they were not set,
> is fine - setting access bit when it was not set is not an incorrectness
> problem but will only possibly delay the reclaim of the page mapped by
> the pte (which is in fact intended because the kernel just operated on this
> region via mprotect()!). Setting dirty bit when it was not set is again
> not an incorrectness problem but will only possibly force an unnecessary
> writeback.
> 
> So now we need to reason whether something can go wrong via
> can_change_pte_writable(). The pte_protnone, pte_needs_soft_dirty_wp,
> and userfaultfd_pte_wp cases are solved due to uniformity in the
> corresponding bits guaranteed by the flag combination. The ptes all
> belong to the same VMA (since callers guarantee that [start, end) will
> lie within the VMA) therefore the conditional based on the VMA is also
> safe to batch around.
> 
> Since the dirty bit on the PTE really is just an indication that the folio
> got written to - even if the PTE is not actually dirty but one of the PTEs
> in the batch is, the wp-fault optimization can be made. Therefore, it is
> safe to batch around pte_dirty() in can_change_shared_pte_writable()
> (in fact this is better since without batching, it may happen that
> some ptes aren't changed to writable just because they are not dirty,
> even though the other ptes mapping the same large folio are dirty).
> 
> To batch around the PageAnonExclusive case, we must check the corresponding
> condition for every single page. Therefore, from the large folio batch,
> we process sub batches of ptes mapping pages with the same
> PageAnonExclusive condition, and process that sub batch, then determine
> and process the next sub batch, and so on. Note that this does not cause
> any extra overhead; if suppose the size of the folio batch is 512, then
> the sub batch processing in total will take 512 iterations, which is the
> same as what we would have done before.
> 
> For pte_needs_flush():
> 
> ppc does not care about the a/d bits.
> 
> For x86, PAGE_SAVED_DIRTY is ignored. We will flush only when a/d bits
> get cleared; since we can only have extra a/d bits due to batching,
> we will only have an extra flush, not a case where we elide a flush due
> to batching when we shouldn't have.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>


I wanted to review this, but looks like it's already upstream and I 
suspect it's buggy (see the upstream report I cc'ed you on)

[...]

> +
> +/*
> + * This function is a result of trying our very best to retain the
> + * "avoid the write-fault handler" optimization. In can_change_pte_writable(),
> + * if the vma is a private vma, and we cannot determine whether to change
> + * the pte to writable just from the vma and the pte, we then need to look
> + * at the actual page pointed to by the pte. Unfortunately, if we have a
> + * batch of ptes pointing to consecutive pages of the same anon large folio,
> + * the anon-exclusivity (or the negation) of the first page does not guarantee
> + * the anon-exclusivity (or the negation) of the other pages corresponding to
> + * the pte batch; hence in this case it is incorrect to decide to change or
> + * not change the ptes to writable just by using information from the first
> + * pte of the batch. Therefore, we must individually check all pages and
> + * retrieve sub-batches.
> + */
> +static void commit_anon_folio_batch(struct vm_area_struct *vma,
> +		struct folio *folio, unsigned long addr, pte_t *ptep,
> +		pte_t oldpte, pte_t ptent, int nr_ptes, struct mmu_gather *tlb)
> +{
> +	struct page *first_page = folio_page(folio, 0);

Who says that we have the first page of the folio mapped into the first 
PTE of the batch?

> +	bool expected_anon_exclusive;
> +	int sub_batch_idx = 0;
> +	int len;
> +
> +	while (nr_ptes) {
> +		expected_anon_exclusive = PageAnonExclusive(first_page + sub_batch_idx);
> +		len = page_anon_exclusive_sub_batch(sub_batch_idx, nr_ptes,
> +					first_page, expected_anon_exclusive);
> +		prot_commit_flush_ptes(vma, addr, ptep, oldpte, ptent, len,
> +				       sub_batch_idx, expected_anon_exclusive, tlb);
> +		sub_batch_idx += len;
> +		nr_ptes -= len;
> +	}
> +}
> +
> +static void set_write_prot_commit_flush_ptes(struct vm_area_struct *vma,
> +		struct folio *folio, unsigned long addr, pte_t *ptep,
> +		pte_t oldpte, pte_t ptent, int nr_ptes, struct mmu_gather *tlb)
> +{
> +	bool set_write;
> +
> +	if (vma->vm_flags & VM_SHARED) {
> +		set_write = can_change_shared_pte_writable(vma, ptent);
> +		prot_commit_flush_ptes(vma, addr, ptep, oldpte, ptent, nr_ptes,
> +				       /* idx = */ 0, set_write, tlb);
> +		return;
> +	}
> +
> +	set_write = maybe_change_pte_writable(vma, ptent) &&
> +		    (folio && folio_test_anon(folio));
> +	if (!set_write) {
> +		prot_commit_flush_ptes(vma, addr, ptep, oldpte, ptent, nr_ptes,
> +				       /* idx = */ 0, set_write, tlb);
> +		return;
> +	}
> +	commit_anon_folio_batch(vma, folio, addr, ptep, oldpte, ptent, nr_ptes, tlb);
> +}
> +
>   static long change_pte_range(struct mmu_gather *tlb,
>   		struct vm_area_struct *vma, pmd_t *pmd, unsigned long addr,
>   		unsigned long end, pgprot_t newprot, unsigned long cp_flags)
> @@ -206,8 +302,9 @@ static long change_pte_range(struct mmu_gather *tlb,
>   		nr_ptes = 1;
>   		oldpte = ptep_get(pte);
>   		if (pte_present(oldpte)) {
> +			const fpb_t flags = FPB_RESPECT_SOFT_DIRTY | FPB_RESPECT_WRITE;
>   			int max_nr_ptes = (end - addr) >> PAGE_SHIFT;
> -			struct folio *folio;
> +			struct folio *folio = NULL;
>   			pte_t ptent;
>   
>   			/*
> @@ -221,11 +318,16 @@ static long change_pte_range(struct mmu_gather *tlb,
>   
>   					/* determine batch to skip */
>   					nr_ptes = mprotect_folio_pte_batch(folio,
> -						  pte, oldpte, max_nr_ptes);
> +						  pte, oldpte, max_nr_ptes, /* flags = */ 0);
>   					continue;
>   				}
>   			}
>   
> +			if (!folio)
> +				folio = vm_normal_folio(vma, addr, oldpte);
> +
> +			nr_ptes = mprotect_folio_pte_batch(folio, pte, oldpte, max_nr_ptes, flags);
> +
>   			oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
>   			ptent = pte_modify(oldpte, newprot);
>   
> @@ -248,14 +350,13 @@ static long change_pte_range(struct mmu_gather *tlb,
>   			 * COW or special handling is required.
>   			 */
>   			if ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
> -			    !pte_write(ptent) &&
> -			    can_change_pte_writable(vma, addr, ptent))
> -				ptent = pte_mkwrite(ptent, vma);
> -
> -			modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
> -			if (pte_needs_flush(oldpte, ptent))
> -				tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
> -			pages++;
> +			     !pte_write(ptent))
> +				set_write_prot_commit_flush_ptes(vma, folio,
> +				addr, pte, oldpte, ptent, nr_ptes, tlb);

While staring at this:

Very broken indentation.

> +			else
> +				prot_commit_flush_ptes(vma, addr, pte, oldpte, ptent,
> +					nr_ptes, /* idx = */ 0, /* set_write = */ false, tlb);

Semi-broken intendation.

> +			pages += nr_ptes;
>   		} else if (is_swap_pte(oldpte)) {
>   			swp_entry_t entry = pte_to_swp_entry(oldpte);
>   			pte_t newpte;


-- 
Cheers,

David / dhildenb


