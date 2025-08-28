Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6AB0CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 23:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWFVCA1eidbRWe4Mvk+B7obYKckT+mqN7M8LbBoJEjM=; b=4PRR0CZ7MaC3So9XGzOPZdmRtn
	ep0EW9QOgPaKeVYYsVv9okZ3McUbFtrDUSdUW0fOjDbHxS3N/IRGnBBUKEu6mdqxSyU9CJ6R4lEP5
	1dxju3pCgkmAvpAESMMBDBFaRCyFy4c0nFhZmZLe4glWzfwqUFRHjWIOteos3EA8qKRp37cUaygSE
	NwTJ9kdKluOhCLxTSyu9UtqelJTDeZbfH2XqgYXC+Av73VroCb+GKF5VTn9d/aTQJOFcJBXqvFIE7
	ZuRUcdLsTjZLcV8fe5yITyxCF3hEzpeeLDFaVWIPPDn/PzWT068tK+crrVeDzxk5tDabXGC5Fnb0J
	41cqW5Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urm1C-00000003fiz-3Lat;
	Thu, 28 Aug 2025 23:26:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urjbA-00000003FWx-0IeQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 20:51:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756414314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TWFVCA1eidbRWe4Mvk+B7obYKckT+mqN7M8LbBoJEjM=;
	b=LnDnbKmCy2/YUzPjTsaiBoVqM1piA608572AGEvYZzom2KkhsoQr9hIiZabsAzGtvR+tqn
	Av8HZtAXP/+2uqM1hha0i/cibf/CitQ+YH3pFVGJsH86kyZpimjlmOtN1mPrq58h+J7JG1
	qAwnjv7u3f/ZVbOY6qdoMpyG+6E7NYo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-Fu5JcXCzNn-lZa5WKnEQNw-1; Thu, 28 Aug 2025 16:51:52 -0400
X-MC-Unique: Fu5JcXCzNn-lZa5WKnEQNw-1
X-Mimecast-MFC-AGG-ID: Fu5JcXCzNn-lZa5WKnEQNw_1756414311
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45b612dbc28so9257855e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 13:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756414311; x=1757019111;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TWFVCA1eidbRWe4Mvk+B7obYKckT+mqN7M8LbBoJEjM=;
        b=EX3dFTEmaBnXpCZwGuS6dc5n0vmWCTi0ix0y7PuahLuq/ELLK5Ey+j7GG+qrekiU6y
         xaoNz5ddpGrBsOEVWezn6/BrZ2IUobuydn8abPJF4ksUscBznsTb6JXSPqzaiRAg5YdN
         1JUQepHrMDnk3uhCtvcr5ZL2IeAH4ut6KQIDq2LHqPT0JSe1W0YxFsnoKbsst6XMJQEw
         mhTbWR7TFj/5yuhdgSfe2YGdVmY7ibk93sYQY04nXkQaMqXueWZzNmuEjEesZZTDC5w/
         D2x8YIQ0kpg+sUAiiqPNHsPXgcmXB5Nbcwa1Z0FqtnPIU8aR97svAVMOHV7joMiKmtSK
         n80w==
X-Forwarded-Encrypted: i=1; AJvYcCXH3XDf0b7D5DIoMEZ0ESlqf/EVt6D0+kwmTLm6D7oFMJ5lR28x8CMFB5xG8ctPdgoQELzs0ecbjAD/9qj/2yMI@lists.infradead.org
X-Gm-Message-State: AOJu0YxoXHMzCcXB1IIaN3Okt6JyKQ+gOCvrP+eRUrTTTnoOYddw2j6q
	K4zVIHmv4U/0gOqG9unaD+I0mbBz7QK+uoNAoD6Tt7LhbhFhy8LoFtJP9dU+oE/5H33qYTiqWO9
	zheSw4+rPL1cckZmEsSVZ+zr1S5EdgZ6kdimOkUSYMHzLG4qq1iwmsnOAf2OJWZaZMoltG7OONh
	Cd
X-Gm-Gg: ASbGncsPsEAKPj3yV3T3banQhKLhR15xr0sxiwTlv4qgxf/72gVRPc7fqU5tbfZZ8MA
	YoQ1eqeMnefBDqiRn+zhx7OKBUjbloPUb3EN64yt5ElZnGSZ3692f52Jvah83qkm7FIK71gaqTO
	ixqg1gyTQruRByHXPqwMpjtX/dOq0XoyuoUxVGbc1LOf3mQRxb4/fdjdQ/GFDne1YspqFqP7RA6
	wnw87ePryZYF9qceg4zcgN3ESzb2LYoPAufeyV3ZoxYhfgPUeWzavxX/Zta3UHPnAdN+bBcL38N
	N9VfoAEKwOJdJHwnIoliIEmnaP/iGyIf9fw1O7yXHd06ZfbI1ewit7T2boNDUY0FtkoHZpCFP78
	39zooYf69OececmW+M74K2fHEssERQig98AdAKZAnQrkXxe2LzrVikzku57Ro93enI4A=
X-Received: by 2002:a05:600c:c491:b0:45b:4d47:5559 with SMTP id 5b1f17b1804b1-45b517dadd6mr212975655e9.36.1756414310756;
        Thu, 28 Aug 2025 13:51:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBxEpIi+OizhCOrvRivNgDFtglg6ujTEy6gKjCh35xHRfgibjOrf5BEosBm4/LLfFcliwoKA==
X-Received: by 2002:a05:600c:c491:b0:45b:4d47:5559 with SMTP id 5b1f17b1804b1-45b517dadd6mr212975405e9.36.1756414310334;
        Thu, 28 Aug 2025 13:51:50 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f28:c100:2225:10aa:f247:7b85? (p200300d82f28c100222510aaf2477b85.dip0.t-ipconnect.de. [2003:d8:2f28:c100:2225:10aa:f247:7b85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7df3ff72sm8506805e9.1.2025.08.28.13.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 13:51:49 -0700 (PDT)
Message-ID: <2be7db96-2fa2-4348-837e-648124bd604f@redhat.com>
Date: Thu, 28 Aug 2025 22:51:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 20/36] mips: mm: convert __flush_dcache_pages() to
 __flush_dcache_folio_pages()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
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
 Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
 Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-21-david@redhat.com>
 <ea74f0e3-bacf-449a-b7ad-213c74599df1@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZoEEwEIAEQCGwMCF4ACGQEFCwkIBwICIgIG
 FQoJCAsCBBYCAwECHgcWIQQb2cqtc1xMOkYN/MpN3hD3AP+DWgUCaJzangUJJlgIpAAKCRBN
 3hD3AP+DWhAxD/9wcL0A+2rtaAmutaKTfxhTP0b4AAp1r/eLxjrbfbCCmh4pqzBhmSX/4z11
 opn2KqcOsueRF1t2ENLOWzQu3Roiny2HOU7DajqB4dm1BVMaXQya5ae2ghzlJN9SIoopTWlR
 0Af3hPj5E2PYvQhlcqeoehKlBo9rROJv/rjmr2x0yOM8qeTroH/ZzNlCtJ56AsE6Tvl+r7cW
 3x7/Jq5WvWeudKrhFh7/yQ7eRvHCjd9bBrZTlgAfiHmX9AnCCPRPpNGNedV9Yty2Jnxhfmbv
 Pw37LA/jef8zlCDyUh2KCU1xVEOWqg15o1RtTyGV1nXV2O/mfuQJud5vIgzBvHhypc3p6VZJ
 lEf8YmT+Ol5P7SfCs5/uGdWUYQEMqOlg6w9R4Pe8d+mk8KGvfE9/zTwGg0nRgKqlQXrWRERv
 cuEwQbridlPAoQHrFWtwpgYMXx2TaZ3sihcIPo9uU5eBs0rf4mOERY75SK+Ekayv2ucTfjxr
 Kf014py2aoRJHuvy85ee/zIyLmve5hngZTTe3Wg3TInT9UTFzTPhItam6dZ1xqdTGHZYGU0O
 otRHcwLGt470grdiob6PfVTXoHlBvkWRadMhSuG4RORCDpq89vu5QralFNIf3EysNohoFy2A
 LYg2/D53xbU/aa4DDzBb5b1Rkg/udO1gZocVQWrDh6I2K3+cCs7BTQRVy5+RARAA59fefSDR
 9nMGCb9LbMX+TFAoIQo/wgP5XPyzLYakO+94GrgfZjfhdaxPXMsl2+o8jhp/hlIzG56taNdt
 VZtPp3ih1AgbR8rHgXw1xwOpuAd5lE1qNd54ndHuADO9a9A0vPimIes78Hi1/yy+ZEEvRkHk
 /kDa6F3AtTc1m4rbbOk2fiKzzsE9YXweFjQvl9p+AMw6qd/iC4lUk9g0+FQXNdRs+o4o6Qvy
 iOQJfGQ4UcBuOy1IrkJrd8qq5jet1fcM2j4QvsW8CLDWZS1L7kZ5gT5EycMKxUWb8LuRjxzZ
 3QY1aQH2kkzn6acigU3HLtgFyV1gBNV44ehjgvJpRY2cC8VhanTx0dZ9mj1YKIky5N+C0f21
 zvntBqcxV0+3p8MrxRRcgEtDZNav+xAoT3G0W4SahAaUTWXpsZoOecwtxi74CyneQNPTDjNg
 azHmvpdBVEfj7k3p4dmJp5i0U66Onmf6mMFpArvBRSMOKU9DlAzMi4IvhiNWjKVaIE2Se9BY
 FdKVAJaZq85P2y20ZBd08ILnKcj7XKZkLU5FkoA0udEBvQ0f9QLNyyy3DZMCQWcwRuj1m73D
 sq8DEFBdZ5eEkj1dCyx+t/ga6x2rHyc8Sl86oK1tvAkwBNsfKou3v+jP/l14a7DGBvrmlYjO
 59o3t6inu6H7pt7OL6u6BQj7DoMAEQEAAcLBfAQYAQgAJgIbDBYhBBvZyq1zXEw6Rg38yk3e
 EPcA/4NaBQJonNqrBQkmWAihAAoJEE3eEPcA/4NaKtMQALAJ8PzprBEXbXcEXwDKQu+P/vts
 IfUb1UNMfMV76BicGa5NCZnJNQASDP/+bFg6O3gx5NbhHHPeaWz/VxlOmYHokHodOvtL0WCC
 8A5PEP8tOk6029Z+J+xUcMrJClNVFpzVvOpb1lCbhjwAV465Hy+NUSbbUiRxdzNQtLtgZzOV
 Zw7jxUCs4UUZLQTCuBpFgb15bBxYZ/BL9MbzxPxvfUQIPbnzQMcqtpUs21CMK2PdfCh5c4gS
 sDci6D5/ZIBw94UQWmGpM/O1ilGXde2ZzzGYl64glmccD8e87OnEgKnH3FbnJnT4iJchtSvx
 yJNi1+t0+qDti4m88+/9IuPqCKb6Stl+s2dnLtJNrjXBGJtsQG/sRpqsJz5x1/2nPJSRMsx9
 5YfqbdrJSOFXDzZ8/r82HgQEtUvlSXNaXCa95ez0UkOG7+bDm2b3s0XahBQeLVCH0mw3RAQg
 r7xDAYKIrAwfHHmMTnBQDPJwVqxJjVNr7yBic4yfzVWGCGNE4DnOW0vcIeoyhy9vnIa3w1uZ
 3iyY2Nsd7JxfKu1PRhCGwXzRw5TlfEsoRI7V9A8isUCoqE2Dzh3FvYHVeX4Us+bRL/oqareJ
 CIFqgYMyvHj7Q06kTKmauOe4Nf0l0qEkIuIzfoLJ3qr5UyXc2hLtWyT9Ir+lYlX9efqh7mOY
 qIws/H2t
In-Reply-To: <ea74f0e3-bacf-449a-b7ad-213c74599df1@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZTwinBHXHTvLlK_qc-wmz7S7MFQknxPxfWZwgv9NFQw_1756414311
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_135156_185821_9ACF3AAD 
X-CRM114-Status: GOOD (  21.78  )
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

On 28.08.25 18:57, Lorenzo Stoakes wrote:
> On Thu, Aug 28, 2025 at 12:01:24AM +0200, David Hildenbrand wrote:
>> Let's make it clearer that we are operating within a single folio by
>> providing both the folio and the page.
>>
>> This implies that for flush_dcache_folio() we'll now avoid one more
>> page->folio lookup, and that we can safely drop the "nth_page" usage.
>>
>> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   arch/mips/include/asm/cacheflush.h | 11 +++++++----
>>   arch/mips/mm/cache.c               |  8 ++++----
>>   2 files changed, 11 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/mips/include/asm/cacheflush.h b/arch/mips/include/asm/cacheflush.h
>> index 5d283ef89d90d..8d79bfc687d21 100644
>> --- a/arch/mips/include/asm/cacheflush.h
>> +++ b/arch/mips/include/asm/cacheflush.h
>> @@ -50,13 +50,14 @@ extern void (*flush_cache_mm)(struct mm_struct *mm);
>>   extern void (*flush_cache_range)(struct vm_area_struct *vma,
>>   	unsigned long start, unsigned long end);
>>   extern void (*flush_cache_page)(struct vm_area_struct *vma, unsigned long page, unsigned long pfn);
>> -extern void __flush_dcache_pages(struct page *page, unsigned int nr);
>> +extern void __flush_dcache_folio_pages(struct folio *folio, struct page *page, unsigned int nr);
> 
> NIT: Be good to drop the extern.

I think I'll leave the one in, though, someone should clean up all of 
them in one go.

Just imagine how the other functions would think about the new guy 
showing off here. :)

> 
>>
>>   #define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 1
>>   static inline void flush_dcache_folio(struct folio *folio)
>>   {
>>   	if (cpu_has_dc_aliases)
>> -		__flush_dcache_pages(&folio->page, folio_nr_pages(folio));
>> +		__flush_dcache_folio_pages(folio, folio_page(folio, 0),
>> +					   folio_nr_pages(folio));
>>   	else if (!cpu_has_ic_fills_f_dc)
>>   		folio_set_dcache_dirty(folio);
>>   }
>> @@ -64,10 +65,12 @@ static inline void flush_dcache_folio(struct folio *folio)
>>
>>   static inline void flush_dcache_page(struct page *page)
>>   {
>> +	struct folio *folio = page_folio(page);
>> +
>>   	if (cpu_has_dc_aliases)
>> -		__flush_dcache_pages(page, 1);
>> +		__flush_dcache_folio_pages(folio, page, folio_nr_pages(folio));
> 
> Hmmm, shouldn't this be 1 not folio_nr_pages()? Seems that the original
> implementation only flushed a single page even if contained within a larger
> folio?

Yes, reworked it 3 times and messed it up during the last rework. Thanks!

-- 
Cheers

David / dhildenb


