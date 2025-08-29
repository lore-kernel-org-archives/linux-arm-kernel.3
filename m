Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9642CCA1001
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 15:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hoDokfG1MQmzSDgEaptCicCjaaQpWxY2iqh8txE4sWo=; b=xrbPFPVQP3tqT3lIM+Y7DPm3sp
	Oi41nRxSYrFFCB8tlyZhkxwkfdXiiZMFJ3EE4RyZjaPBdyd8doOQZoUxZiNJCofle7FTUnWF/QdsM
	mUH7ZS9YaSzIeFSHyXpXU/Jguqu8c9v713lFYGqi5RJ9CBbcwLNegNRh2VY+1tS20QjbNkw25K0w4
	xeoL6vA0nrqnseXCl8j0Tfba/zbULHTXQIGnntBFI3InmaevgKOY3UeY4ri0aPmr8jSpf14mkreEl
	Wlj9Xpe4Pn8b+Ng9n20M40kzzMBxHfU8rOBeQUJMxD4gcTEIwgV0qQ6/2NjHFGOtM8gWVF5okBKdQ
	e1gpdQkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us1GD-00000006FKy-2fCZ;
	Fri, 29 Aug 2025 15:43:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urxjX-00000005YXn-0c7s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 11:57:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756468650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hoDokfG1MQmzSDgEaptCicCjaaQpWxY2iqh8txE4sWo=;
	b=PoDbdZsuLw8LnZq1ZtrtYhXr+W5yqW3VAc/aI/SpZhOyPdqHWktPOL7kfku0ezcqID9cwX
	eEvPXexzStorZYu4aSe3zzIUOehOYnitdUY0bZiJv8Y4hUxqv7B95jjQ2s15op1BHrOpCB
	jnw6NCK0gq3h2KmTD7RBvKfdaW0/+pg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-5W076EaRMj-qwuROH3OynA-1; Fri, 29 Aug 2025 07:57:27 -0400
X-MC-Unique: 5W076EaRMj-qwuROH3OynA-1
X-Mimecast-MFC-AGG-ID: 5W076EaRMj-qwuROH3OynA_1756468646
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45b7f0d1449so4064935e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 04:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756468646; x=1757073446;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hoDokfG1MQmzSDgEaptCicCjaaQpWxY2iqh8txE4sWo=;
        b=YugjorSVVO53Kkm7mV80hqTk7/1wGANE4QXLSXEOFP+GO4+87aK/V/1Gw/dRmOZvtK
         wiZLJGtU1ZdQSm9bVV0Nx9F7J9yCQD2Hiip7ZZWLSAZBV656h72UVj9krj1PKgVB68Iy
         RwBIaKsl7ZAP9/zqGm3VjvM8GWlFxB2E1erayGXxXgQs6wxgH49IctlHl1idJDaOTnVc
         tQ3JFBmCjH+h3ZQbSWWWZA3ivTnTEHx8dOGQYRz2YpCOKUmrVueMzvYbJNC5L12nCDMN
         lKVVffPoQlm+gKgT3cdygLJqPE08o203ozhKfQNjWN2aGpF2f1craus1/G3MWeL/UMKK
         cCRw==
X-Forwarded-Encrypted: i=1; AJvYcCVSXV77J+xtPNRBntzoYpttgKKulzlxMzsPnGRd2QezXXZIMisqgoaAdzlYJgtWeAQoZs9i2nqPkxxNO5df9PTI@lists.infradead.org
X-Gm-Message-State: AOJu0YxS3q5YwX+GGBY81YGzJDRpiJlemWrf7OhN//NtjWidHkMc/W67
	q9MbxbLL7OmSjxhXxyJNkxBaopLP/oQf9ETcQpZIQzLvtaec9eLH6rt4ez5r+RwIVheQ6dcCx2s
	+AFiRdH3cZ1Xxm/QZOYpzXZXthKfzzNjgraVdhGAM7EKBGvmEsTS1tPpAnnxf6GnMhjz0LyDPbo
	jE
X-Gm-Gg: ASbGncsiWnM9rMmCBp31ggreN5zE3XLkUU6RM39gAXrPGrdQyq/ddCf3EvsntTei6J/
	OUTck5cSgfe0XmT4AFCVgnuTI96sExxBb0IXZRqpkqFfuWjOJb5JqJ0CKD/rSOzmtPWjPX0ZaJX
	R/IQCGOBIZ9PH6gb0izK5R6ACZz/Y3MMODTe38S7szSs4owvz4jKbyFpDhitUdevzJerxt+FCXt
	gLPgKJJmdtAZjB2WAoBi4rRj9YLv+P/ZDZmIiFH7oyCJQ6axU7nn3fMXRACkPmbBDKjzbekEvC5
	U6m/REbZh6J/CkXJYDGJknZ8WamuzCGGSsaLViy84/z1kGdNY330uztz5bysQdwKuTQqFq+Dr7M
	XQyetmswMRkhx3fucqi74Jp1TJyTD0SLp5eRX1Thao+gAnFvMjyOzCsjsCCla0NQ=
X-Received: by 2002:a05:600c:348d:b0:45b:80ab:3359 with SMTP id 5b1f17b1804b1-45b80ab35acmr15395005e9.0.1756468645780;
        Fri, 29 Aug 2025 04:57:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG95+220rsAfy23meKWNy4rnKbzYvRZ5zPoY4wdVrGBgRqoKPVywzJTjIuqBTuNai4wkDfQaw==
X-Received: by 2002:a05:600c:348d:b0:45b:80ab:3359 with SMTP id 5b1f17b1804b1-45b80ab35acmr15394435e9.0.1756468645290;
        Fri, 29 Aug 2025 04:57:25 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1d:100:4f8e:bb13:c3c7:f854? (p200300d82f1d01004f8ebb13c3c7f854.dip0.t-ipconnect.de. [2003:d8:2f1d:100:4f8e:bb13:c3c7:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6b99sm116739135e9.4.2025.08.29.04.57.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 04:57:24 -0700 (PDT)
Message-ID: <eff8badd-0ddd-4a5f-a2ef-0e3ded39687a@redhat.com>
Date: Fri, 29 Aug 2025 13:57:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/36] mm: limit folio/compound page sizes in
 problematic kernel configs
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, Zi Yan <ziy@nvidia.com>,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Marco Elver <elver@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Michal Hocko <mhocko@suse.com>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Tejun Heo <tj@kernel.org>, virtualization@lists.linux.dev,
 Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com, x86@kernel.org
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-12-david@redhat.com>
 <baa1b6cf-2fde-4149-8cdf-4b54e2d7c60d@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <baa1b6cf-2fde-4149-8cdf-4b54e2d7c60d@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HRBrdt4b1OEi5p2OkQB9IUiuikLhjo-1Ho4eW1D_zQ4_1756468646
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_045731_274171_EBA22E62 
X-CRM114-Status: GOOD (  21.10  )
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

On 28.08.25 17:10, Lorenzo Stoakes wrote:
> On Thu, Aug 28, 2025 at 12:01:15AM +0200, David Hildenbrand wrote:
>> Let's limit the maximum folio size in problematic kernel config where
>> the memmap is allocated per memory section (SPARSEMEM without
>> SPARSEMEM_VMEMMAP) to a single memory section.
>>
>> Currently, only a single architectures supports ARCH_HAS_GIGANTIC_PAGE
>> but not SPARSEMEM_VMEMMAP: sh.
>>
>> Fortunately, the biggest hugetlb size sh supports is 64 MiB
>> (HUGETLB_PAGE_SIZE_64MB) and the section size is at least 64 MiB
>> (SECTION_SIZE_BITS == 26), so their use case is not degraded.
>>
>> As folios and memory sections are naturally aligned to their order-2 size
>> in memory, consequently a single folio can no longer span multiple memory
>> sections on these problematic kernel configs.
>>
>> nth_page() is no longer required when operating within a single compound
>> page / folio.
>>
>> Reviewed-by: Zi Yan <ziy@nvidia.com>
>> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> Realy great comments, like this!
> 
> I wonder if we could have this be part of the first patch where you fiddle
> with MAX_FOLIO_ORDER etc. but not a big deal.

I think it belongs into this patch where we actually impose the 
restrictions.

[...]

>> +/*
>> + * Only pages within a single memory section are guaranteed to be
>> + * contiguous. By limiting folios to a single memory section, all folio
>> + * pages are guaranteed to be contiguous.
>> + */
>> +#define MAX_FOLIO_ORDER		PFN_SECTION_SHIFT
> 
> Hmmm, was this implicit before somehow? I mean surely by the fact as you say
> that physical contiguity would not otherwise be guaranteed :))

Well, my patches until this point made sure that any attempt to use a 
larger folio would fail in a way that we could spot now if there is any 
offender.

That is why before this change, nth_page() was required within a folio.

Hope that clarifies it, thanks!

-- 
Cheers

David / dhildenb


