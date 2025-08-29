Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE38CA1001
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 12:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CIYlE8yYA+z63gvbmepekc4lArepb/yuA3iZBVH5fy4=; b=pJjhKVwScdPAIf6tlLUZZFzJDN
	qCZ/QAEtkLq0hckeNo8xt5buD1/SWBas3HWK7yietZ5AqpcAN6SpYDFmWyb3y++MledbkA5tPKhjg
	utmusweeo8uyTKGP6Fm+m8VscWbZYbn/IGjD80H4cUiVZdlG53JyQ0UgPPdJfC4Z6jZTwxSE2gAvM
	TTOPL0PkwPTYFi+TvmpEuQ4K3UkGF5Qjir3PK3dXQH6Cvpp9NrxMiiUyQOsnKhmbSgKL6asjKRvJV
	6qJYEtywY1k8JP9hcvlWJdFVUNoTAoayJLUnJBtvG/mk3kVlrQcE0ITxGsH2DTQEpG5rYRcQDrKa1
	aWKHuHeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uryAs-00000005dmS-0HVy;
	Fri, 29 Aug 2025 12:25:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urvsm-00000005Dzm-444A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 09:58:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756461535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CIYlE8yYA+z63gvbmepekc4lArepb/yuA3iZBVH5fy4=;
	b=W+rbOoLLBOHeoQKHG1uoVQDKp5ikl9iEU4IlEGMWryohinqWcu7/ySKkCiHCw3C45WyvGV
	fLPlqNEYIblJgMxm9Dqw7DDx1diIBZQygHxQhR10bxTKTf7SdMRKghONU3aVuXi/W0U9wN
	SlQiiD/cHUpjAietTfF0AtNYQqt5iFM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-8vAEm7I7PIWUIHsWdD7XSA-1; Fri, 29 Aug 2025 05:58:54 -0400
X-MC-Unique: 8vAEm7I7PIWUIHsWdD7XSA-1
X-Mimecast-MFC-AGG-ID: 8vAEm7I7PIWUIHsWdD7XSA_1756461533
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45b7a0d1a71so12207355e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 02:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756461533; x=1757066333;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CIYlE8yYA+z63gvbmepekc4lArepb/yuA3iZBVH5fy4=;
        b=qkG/PcgQiJxube9PJ26kexBttKQ5dsQPumGvir34sz7fQrVWGmaUzAtwPX5iiF/3S8
         ibjwJySrFRJ5G3T79lxJTbNVKRDxtnHlFKSt7ogwb2NMPPQGivFH4kqK9bkv8/Duc5T0
         KelHqZRODTyRnd35YzCAAv00gvBdh0YMI7SczZYzDlxO2U97mWDTfHVtmleR+J4Y1Jnb
         B6nkOlk9Q6nEBopvAzYzzZqkWjoIF6Z3Ka9X4joQiycfhbqR7OGwv1afw+PI91Onc5wT
         GMTcGy8GTyaB0M2oF4ZiGzu0lpOynL7jO4OrKc68Uf4I8I8IW58wd+yz0G9azn29G/g3
         mwug==
X-Forwarded-Encrypted: i=1; AJvYcCUCf8dvibKC+OfnABzkVsFRVkNu5Whjb7DJjcp/7w1uH9Lb1FZjWmHps1CH9iuiybbRLEb6+B/uIS75K/pa42kS@lists.infradead.org
X-Gm-Message-State: AOJu0YyDmgO5Z79jsiAR75npegTb8WS+b4aea/uUsLeNKPlsySywwcky
	2Y7LGKXKcBXOtpr2nU+E9kBbocRSSBlR1MBOHhteCim6hEgZYAseFUGAvW4EEoQZSqzrD2wLVYF
	S69YYHNKgwxaHenWvnA9Eji9u0KiZrbT+hm4DTC1WVk75si3sxF1ESuvEoE57N1MObQtPWZWuB1
	FM
X-Gm-Gg: ASbGnctPYFo0Lu2cw9RudxScv4Dj7Nv30Ea0H9ePvG000Afmi59XoXhp/2Zv+6usdMJ
	lloESba31L/+o89qUz+XM8NwiikBiauDlbCd3YaYX0Y7Z5s8qwPprOZVFIoCxASFO+nFsPLAoFd
	e/JCc+t+T8z2+ZeDH/D5tyDjHIDoV9AwhiQqPARme8koNNZR6DFwLK6oOVQxOLKvQ1fo3o4CNcX
	VH577Izz8OHHUVo8JJ1aW9amJpRYhXeomid2MeJ98ZfdzJg0KRh0dM9nYUl+FzmZoHw360FYKjp
	hDQWdPKm8jlcmsZprgsXCOidb30a0aoG64cbpBkjayAMW7mZS6mrctuFRIRJ3/0aTSlkWptSCQg
	/1uoFsM3adu3+z8UdeyO+LAx1yHKivwjjPYSYX8EbCxIUFRx15g/j67lFDeWmOrD/
X-Received: by 2002:a05:600c:35d0:b0:45b:7f72:340 with SMTP id 5b1f17b1804b1-45b7f720599mr16993455e9.25.1756461532874;
        Fri, 29 Aug 2025 02:58:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHP3EE2Ifsg5AHoStp93/zw+u97m2nZeBURa8lzMoGajSkuEytfaWCGtF8d2bBvl4JzWz9L2g==
X-Received: by 2002:a05:600c:35d0:b0:45b:7f72:340 with SMTP id 5b1f17b1804b1-45b7f720599mr16993185e9.25.1756461532358;
        Fri, 29 Aug 2025 02:58:52 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1d:100:4f8e:bb13:c3c7:f854? (p200300d82f1d01004f8ebb13c3c7f854.dip0.t-ipconnect.de. [2003:d8:2f1d:100:4f8e:bb13:c3c7:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7271cd01sm102235695e9.23.2025.08.29.02.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 02:58:51 -0700 (PDT)
Message-ID: <6a2e2ba2-e5ea-4744-a66e-790216c1e762@redhat.com>
Date: Fri, 29 Aug 2025 11:58:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/36] mm/page_alloc: reject unreasonable
 folio/compound page sizes in alloc_contig_range_noprof()
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 linux-kernel@vger.kernel.org, Zi Yan <ziy@nvidia.com>,
 SeongJae Park <sj@kernel.org>, Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Tejun Heo <tj@kernel.org>, virtualization@lists.linux.dev,
 Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com, x86@kernel.org
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-7-david@redhat.com>
 <3hpjmfa6p3onfdv4ma4nv2tdggvsyarh7m36aufy6hvwqtp2wd@2odohwxkl3rk>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <3hpjmfa6p3onfdv4ma4nv2tdggvsyarh7m36aufy6hvwqtp2wd@2odohwxkl3rk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3ycfYrPWAb2fgvuRmMlDS_Znz4-Q3j5D8JJ73vs3m0A_1756461533
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_025857_105466_AF5456F8 
X-CRM114-Status: GOOD (  19.73  )
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

On 29.08.25 02:33, Liam R. Howlett wrote:
> * David Hildenbrand <david@redhat.com> [250827 18:04]:
>> Let's reject them early, which in turn makes folio_alloc_gigantic() reject
>> them properly.
>>
>> To avoid converting from order to nr_pages, let's just add MAX_FOLIO_ORDER
>> and calculate MAX_FOLIO_NR_PAGES based on that.
>>
>> Reviewed-by: Zi Yan <ziy@nvidia.com>
>> Acked-by: SeongJae Park <sj@kernel.org>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> Nit below, but..
> 
> Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>
> 
>> ---
>>   include/linux/mm.h | 6 ++++--
>>   mm/page_alloc.c    | 5 ++++-
>>   2 files changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index 00c8a54127d37..77737cbf2216a 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -2055,11 +2055,13 @@ static inline long folio_nr_pages(const struct folio *folio)
>>   
>>   /* Only hugetlbfs can allocate folios larger than MAX_ORDER */
>>   #ifdef CONFIG_ARCH_HAS_GIGANTIC_PAGE
>> -#define MAX_FOLIO_NR_PAGES	(1UL << PUD_ORDER)
>> +#define MAX_FOLIO_ORDER		PUD_ORDER
>>   #else
>> -#define MAX_FOLIO_NR_PAGES	MAX_ORDER_NR_PAGES
>> +#define MAX_FOLIO_ORDER		MAX_PAGE_ORDER
>>   #endif
>>   
>> +#define MAX_FOLIO_NR_PAGES	(1UL << MAX_FOLIO_ORDER)
>> +
>>   /*
>>    * compound_nr() returns the number of pages in this potentially compound
>>    * page.  compound_nr() can be called on a tail page, and is defined to
>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>> index baead29b3e67b..426bc404b80cc 100644
>> --- a/mm/page_alloc.c
>> +++ b/mm/page_alloc.c
>> @@ -6833,6 +6833,7 @@ static int __alloc_contig_verify_gfp_mask(gfp_t gfp_mask, gfp_t *gfp_cc_mask)
>>   int alloc_contig_range_noprof(unsigned long start, unsigned long end,
>>   			      acr_flags_t alloc_flags, gfp_t gfp_mask)
>>   {
>> +	const unsigned int order = ilog2(end - start);
>>   	unsigned long outer_start, outer_end;
>>   	int ret = 0;
>>   
>> @@ -6850,6 +6851,9 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
>>   					    PB_ISOLATE_MODE_CMA_ALLOC :
>>   					    PB_ISOLATE_MODE_OTHER;
>>   
>> +	if (WARN_ON_ONCE((gfp_mask & __GFP_COMP) && order > MAX_FOLIO_ORDER))
>> +		return -EINVAL;
>> +
>>   	gfp_mask = current_gfp_context(gfp_mask);
>>   	if (__alloc_contig_verify_gfp_mask(gfp_mask, (gfp_t *)&cc.gfp_mask))
>>   		return -EINVAL;
>> @@ -6947,7 +6951,6 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
>>   			free_contig_range(end, outer_end - end);
>>   	} else if (start == outer_start && end == outer_end && is_power_of_2(end - start)) {
>>   		struct page *head = pfn_to_page(start);
>> -		int order = ilog2(end - start);
> 
> You have changed this from an int to a const unsigned int, which is
> totally fine but it was left out of the change log.  

Considered to trivial to document, but I can add a sentence about that.

> Probably not really
> worth mentioning but curious why the change to unsigned here?

orders are always unsigned, like folio_order().

Thanks!

-- 
Cheers

David / dhildenb


