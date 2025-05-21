Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C95FC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 12:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=01nQBgf3U3XQarvHKQKbgaSPFi0ZTBcwoE8UBRIN1oc=; b=pVjLhHgCBdOJ/dcl70KK5mTK4T
	b+L61FjfI1zo8VuuLT8PyfpQD2dZD8MP2okVJBQy/x+32zqzKyc3wQ7f97MsGS/xAEb5hk11V60X7
	3MlZpdK6D/ujhCj4QtDdsawyMqXIq2A8cM/u1EiC+ydDtVFul0GqbEaWY1WORxeVeNQN00+hpRnmm
	KLynsNzsafQdWaxOyWhUgTxrHTQq1HdDbU67vgreXGJtl5SjlJUDwD4zWlI8r1EAhani2MShQCS43
	XQGX03dUkRUbM0o/sLoq/bwAw2hXDTzP3q+Q/PCgmDPtfsevYyaH8mn5bakAXhCpiQDd8dLb9Cn95
	N70oX9rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHiG7-0000000FjY2-0tco;
	Wed, 21 May 2025 12:09:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHiD8-0000000FixQ-3Xfn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 12:06:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747829174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=01nQBgf3U3XQarvHKQKbgaSPFi0ZTBcwoE8UBRIN1oc=;
	b=aPOGpu4IQfrQb5bA9D1eGduB721+wsdxzy5j5xPrP8DI49qgCl/ICccEEDq50shiPKKK9I
	ScMg0FppZPiq0pSt5xG4agazmhznSNGcqnthdVeLtZT31MxPCduXYTorN4PgfFtKVVXlHc
	3naAd9eZiz6ePooP+hASaQxCUvjtewk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-TcVjv89DPZCS-ATLQDtHBg-1; Wed, 21 May 2025 08:06:12 -0400
X-MC-Unique: TcVjv89DPZCS-ATLQDtHBg-1
X-Mimecast-MFC-AGG-ID: TcVjv89DPZCS-ATLQDtHBg_1747829171
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43ea256f039so53314505e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 05:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747829171; x=1748433971;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=01nQBgf3U3XQarvHKQKbgaSPFi0ZTBcwoE8UBRIN1oc=;
        b=lT/9rrQ0VJvX+7N/c2xf90FeQK1Tz+alP+iUySUP+h0tVZrF5aoRCKfacg3u4x7g+L
         FlZGtsFb6cO4S5quFa8j2pBpO5/dgJWlz43ITTxgIkekv/1qUkGyZ28lJGjJ/aRW3DJ7
         gFdjCARqbHmctN78BtjFBxx5g+S6tvHxDrSe5RXIpea7zjG5JIzhxwJwuSt3FzsZ0I/E
         E3qrXRWMo1nIdbAl002hLb1WzPJQpvDNvdBy4Ul4bF3UnMZL4IVniI7x4mJaUULDHXvr
         ehkGZjkx4YqjxGnQt5hB93FAptTEHenQmFsFZwq2Jb/WU4Vw2C2ZCqbUrG7KPaCo3W5H
         WQVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeq3WS6hus0lFE+GdaFI5AWloJIboDjz4Y3FbttaQPo7hlk1yYQrFeUjMmCVo5pNuEBWk94JI2N6BA+GzXmnfv@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8apnKMNvFciyJK8/dSDJ29CXiznmJhMo6d8oIyEJYKKd2JnX0
	HCarNh6Q2dA0V1kpwMLTrjtR46mee6gLhkWodiodiYOvKaUtMWb0rlUjgruTzfYER5rY5+UP7Et
	NnTujafJsJ2JzXqH1nzUqMvVDVfN+BTPpDrNOF1MU3UHvXkGMnKMrY1sXAGLVIKK3WxcxcfCQsE
	Ud
X-Gm-Gg: ASbGncsOFaxqSCqOqganrDtDNr+FAv5VCpCcN24WfHHD8SU2yqkNF+jFTpRDDrxkwSg
	f4MZTAzA/tWZK3NHVGSBW7o6JRe/LPxrG+C8Z1Y0s9QUsNhyZDnU+CDTHex3wQzfiUrqhAazn1t
	r6JbHkkrqrrZNX+MUCVDOY2+5I7t7/bpNZN8Z8GEdbrsIiLQHnXNI7jIEOAAg7BdQJfeAtResYM
	9q9mxxqPvjDdvelTv1MIIYidsopDkA/1yttB0r830zd/bBR+hD7oosVupp3t96pbOUtMxsCE/e1
	SEKBhkhMV1VKwDJKwLR3sU6+q0rol0xNZFKreVfDPWLSF1u5c7ZeEUeXWpTKbtLS9pTeIADZTSy
	7yma4s/84r65fl6Xxslsik7FHMNmdj7pazXHvr9w=
X-Received: by 2002:a05:600c:154a:b0:43c:fcbc:9680 with SMTP id 5b1f17b1804b1-442fd664848mr153450655e9.25.1747829170852;
        Wed, 21 May 2025 05:06:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlgtcVM/I7MVqWoMzPxbrhrrCqOaG89wRdWndpt86tHax21t0a+EFc7uXazYaQG0PsNikFYw==
X-Received: by 2002:a05:600c:154a:b0:43c:fcbc:9680 with SMTP id 5b1f17b1804b1-442fd664848mr153450065e9.25.1747829170340;
        Wed, 21 May 2025 05:06:10 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:9c00:e2c7:6eb5:8a51:1c60? (p200300d82f259c00e2c76eb58a511c60.dip0.t-ipconnect.de. [2003:d8:2f25:9c00:e2c7:6eb5:8a51:1c60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca889e6sm19596701f8f.71.2025.05.21.05.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 05:06:09 -0700 (PDT)
Message-ID: <912757c0-8a75-4307-a0bd-8755f6135b5a@redhat.com>
Date: Wed, 21 May 2025 14:06:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] mm: Optimize mprotect() by batch-skipping PTEs
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
References: <20250519074824.42909-1-dev.jain@arm.com>
 <20250519074824.42909-2-dev.jain@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250519074824.42909-2-dev.jain@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Zomy5KXvtfdLLNzh4brzb7rVU2f-JZsYaLj14lmI2Bo_1747829171
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_050614_959219_C18FB868 
X-CRM114-Status: GOOD (  22.51  )
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

On 19.05.25 09:48, Dev Jain wrote:

Please highlight in the subject that this is only about MM_CP_PROT_NUMA 
handling.

> In case of prot_numa, there are various cases in which we can skip to the
> next iteration. Since the skip condition is based on the folio and not
> the PTEs, we can skip a PTE batch.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>   mm/mprotect.c | 36 +++++++++++++++++++++++++++++-------
>   1 file changed, 29 insertions(+), 7 deletions(-)
> 
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index 88608d0dc2c2..1ee160ed0b14 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -83,6 +83,18 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>   	return pte_dirty(pte);
>   }
>   
> +static int mprotect_batch(struct folio *folio, unsigned long addr, pte_t *ptep,
> +		pte_t pte, int max_nr_ptes)
> +{
> +	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> +
> +	if (!folio_test_large(folio) || (max_nr_ptes == 1))
> +		return 1;
> +
> +	return folio_pte_batch(folio, addr, ptep, pte, max_nr_ptes, flags,
> +			       NULL, NULL, NULL);
> +}
> +
>   static long change_pte_range(struct mmu_gather *tlb,
>   		struct vm_area_struct *vma, pmd_t *pmd, unsigned long addr,
>   		unsigned long end, pgprot_t newprot, unsigned long cp_flags)
> @@ -94,6 +106,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>   	bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
>   	bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
>   	bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
> +	int nr_ptes;
>   
>   	tlb_change_page_size(tlb, PAGE_SIZE);
>   	pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
> @@ -108,8 +121,10 @@ static long change_pte_range(struct mmu_gather *tlb,
>   	flush_tlb_batched_pending(vma->vm_mm);
>   	arch_enter_lazy_mmu_mode();
>   	do {
> +		nr_ptes = 1;
>   		oldpte = ptep_get(pte);
>   		if (pte_present(oldpte)) {
> +			int max_nr_ptes = (end - addr) >> PAGE_SHIFT;
>   			pte_t ptent;
>   
>   			/*
> @@ -126,15 +141,18 @@ static long change_pte_range(struct mmu_gather *tlb,
>   					continue;
>   
>   				folio = vm_normal_folio(vma, addr, oldpte);
> -				if (!folio || folio_is_zone_device(folio) ||
> -				    folio_test_ksm(folio))
> +				if (!folio)
>   					continue;
>   
> +				if (folio_is_zone_device(folio) ||
> +				    folio_test_ksm(folio))
> +					goto skip_batch;
> +
>   				/* Also skip shared copy-on-write pages */
>   				if (is_cow_mapping(vma->vm_flags) &&
>   				    (folio_maybe_dma_pinned(folio) ||
>   				     folio_maybe_mapped_shared(folio)))
> -					continue;
> +					goto skip_batch;
>   
>   				/*
>   				 * While migration can move some dirty pages,
> @@ -143,7 +161,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>   				 */
>   				if (folio_is_file_lru(folio) &&
>   				    folio_test_dirty(folio))
> -					continue;
> +					goto skip_batch;
>   
>   				/*
>   				 * Don't mess with PTEs if page is already on the node
> @@ -151,7 +169,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>   				 */
>   				nid = folio_nid(folio);
>   				if (target_node == nid)
> -					continue;
> +					goto skip_batch;
>   				toptier = node_is_toptier(nid);
>   
>   				/*
> @@ -159,8 +177,12 @@ static long change_pte_range(struct mmu_gather *tlb,
>   				 * balancing is disabled
>   				 */
>   				if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) &&
> -				    toptier)
> +				    toptier) {
> +skip_batch:
> +					nr_ptes = mprotect_batch(folio, addr, pte,
> +								 oldpte, max_nr_ptes);
>   					continue;
> +				}


I suggest

a) not burying that skip_batch label in another if condition

b) looking into factoring out prot_numa handling into a separate 
function first.


Likely we want something like

if (prot_numa) {
	nr_ptes = prot_numa_pte_range_skip_ptes(vma, addr, oldpte);
	if (nr_ptes)
		continue;
}

... likely with a better function name,


-- 
Cheers,

David / dhildenb


