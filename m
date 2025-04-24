Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB9A2C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 21:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XSJt09CWKPOf+EGnLW8nyqe/QhTx1Ajx0DdE2d0+ieI=; b=K3InoSZqKijPzYPAVjxTOo4oYa
	zTqnh3rlAk/Ks6nVMkkIeLI0fDDhILOD4hg5hik26bRCQW0r+v2fg3+vqCtgBQjiE9w2m/857wBSd
	ts4LHpt4WyLjW/jvklFlcpOLBTPqJuONVNFG7WcCycsBcCGyfNANAUE2vHsLL3V+bKumZOP9zRIKp
	wbjQoGORyL3W3ohMZ4QtmgZ95fXmW4KxhSSrVrs8rlrNckzuu1TZSO57eD6aidKTXCmsOLaPvYIz8
	+YIwzPNeVznW1TehRFkSKC9pauv7VbKMEFK5oTrElOjthtyDFQ1MAN6UcgZvY5GH5xoep/MoXQWxo
	3qdWnCkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u83tB-0000000FOC4-3oB4;
	Thu, 24 Apr 2025 21:13:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u83rJ-0000000FO0j-3pYJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 21:11:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745529108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XSJt09CWKPOf+EGnLW8nyqe/QhTx1Ajx0DdE2d0+ieI=;
	b=T6DVecWsTeDIsFWQuUwJPgil5Ob0EK12uvjVpsaYz6uaSp/GKABqwZVkGaF8RHPP1EM+M3
	iswsI8Bw8w2w/9U+dmywvEesz5Bg7yocefqJhx8CZwjg73PWLxl48FvsfJIGLHu3h99sN2
	pwQW/VLN5nVbxrrsoOVUcGqZaMBmOUc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-241-ck3CseLYPoKMa6qHFuoCJA-1; Thu, 24 Apr 2025 17:11:47 -0400
X-MC-Unique: ck3CseLYPoKMa6qHFuoCJA-1
X-Mimecast-MFC-AGG-ID: ck3CseLYPoKMa6qHFuoCJA_1745529106
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d00017e9dso9176775e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 14:11:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745529106; x=1746133906;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XSJt09CWKPOf+EGnLW8nyqe/QhTx1Ajx0DdE2d0+ieI=;
        b=ew4l6CfjIJeFdfSYHKSt1WMdvG75Ovg6yFLI8/GEEa10+xKSk450pQH0lax1vZZGVv
         iMKwTZRk2m2ZPeOCYU2AAd2TUrBvm84YyNZz1x4R9xNWIEPqKIpo5Q7xw10YJh4xyyMi
         R0NmZHVWqcC7U0kDNpeP7zM/kuaYYC4ut0d6aP/ShLWh8KPxzkx/FqTB2GhYSM4euS9R
         CkQnZfRjpzVjdl9Ct4sBKno0xWvGTwkHUkTnH/mUTNEJTWoesedeMkCqr/nOVlU3lRxI
         d7XXEaODXJawgbXG9etjFdAMZZvOSWlGYak3owXespGyAwQ6ub4U0bHIqKRSSqKnrax5
         xHFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1ZafQ0P5M0A7EyvecWaOk+tKYV7BzfcGtJ6BS6TPiFP6ksu622cZ9h25nl/N5FTTY/Du+7Ruaovt06ZD99R30@lists.infradead.org
X-Gm-Message-State: AOJu0YypMLVUlWLMk3O6zb91mi+tOmCWkoTTtNDt3FIS4jnu6WG2V59m
	3oD9VQZO4nfAXYSUv13z4tlr98SZyiq+p4xcbKwBOQXulRJ3og7RoG29IyElP0h03sIwVEpm52N
	a16zlnnVXsKqv+buq6k3M6p6UCs68Xq6etGT5TnVbZBwx5qJoUX8kQp//hhHgigE9nEU0YbAT
X-Gm-Gg: ASbGnctVGrnhv9IXx82ElauSLvBdDhg/dc9in/AZGhrkArN6pwm530WgiHRU0ZqcIZn
	ixP1N/LNRA4Dkp6oTIoamFjiROWMs6V+3vxGkC88o26G3rj1rpZ7itL68QK9j6dJcpQwk3yvKEz
	oc5Iq8Jdju7JXdKz1oX+SXkQ1Z5022/ZX/34W5RRe2+o5s5dJ/Sn98fwaWHL2NT6hjiQEaLE/oB
	dScekfts++3YMuGedmIeVTiiTPPg3bDUuqn0yCgKUWz9yKYvq5/waIGx3aCiXI5QVy64HYi6tGu
	NRBBG0LxiO7TckNZabKcsfZGdwuP+H//VxNJrEv+Mwu+Y+M+e6j70yTW9QD84Pnj+tvDqYdTjv9
	6drrCyJmddKq0Pgsxlil+JdS8sYDd680gvW+b
X-Received: by 2002:a05:600c:8012:b0:43c:e7ae:4bcf with SMTP id 5b1f17b1804b1-4409bc06f4cmr44141635e9.0.1745529106308;
        Thu, 24 Apr 2025 14:11:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcF4PqwYVcKyDhNajp+9yGkVLlqSoBI+pDcioIx4vbWO4AH3K4GqMgkz2s+HBMzGQ0VesaZA==
X-Received: by 2002:a05:600c:8012:b0:43c:e7ae:4bcf with SMTP id 5b1f17b1804b1-4409bc06f4cmr44141435e9.0.1745529105905;
        Thu, 24 Apr 2025 14:11:45 -0700 (PDT)
Received: from ?IPV6:2003:cb:c74e:ff00:f734:227:6936:cdab? (p200300cbc74eff00f73402276936cdab.dip0.t-ipconnect.de. [2003:cb:c74e:ff00:f734:227:6936:cdab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2ac5a9sm34371385e9.23.2025.04.24.14.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 14:11:45 -0700 (PDT)
Message-ID: <0eae5cc8-5714-44dc-97b4-e1b991c0e918@redhat.com>
Date: Thu, 24 Apr 2025 23:11:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] mm: Introduce for_each_valid_pfn() and use it from
 reserve_bootmem_region()
To: David Woodhouse <dwmw2@infradead.org>, Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Sauerwein, David" <dssauerw@amazon.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Ruihan Li <lrh2000@pku.edu.cn>
References: <20250423133821.789413-1-dwmw2@infradead.org>
 <20250423133821.789413-2-dwmw2@infradead.org>
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
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250423133821.789413-2-dwmw2@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FISGxyNwSauCXRS-YF5EYyZdHynMMjAzQ34aAfiCqtM_1745529106
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_141150_141745_BBB61CE1 
X-CRM114-Status: GOOD (  25.34  )
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

On 23.04.25 15:33, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Especially since commit 9092d4f7a1f8 ("memblock: update initialization
> of reserved pages"), the reserve_bootmem_region() function can spend a
> significant amount of time iterating over every 4KiB PFN in a range,
> calling pfn_valid() on each one, and ultimately doing absolutely nothing.
> 
> On a platform used for virtualization, with large NOMAP regions that
> eventually get used for guest RAM, this leads to a significant increase
> in steal time experienced during kexec for a live update.
> 
> Introduce for_each_valid_pfn() and use it from reserve_bootmem_region().
> This implementation is precisely the same naïve loop that the function
> used to have, but subsequent commits will provide optimised versions
> for FLATMEM and SPARSEMEM, and this version will remain for those
> architectures which provide their own pfn_valid() implementation,
> until/unless they also provide a matching for_each_valid_pfn().
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>   include/linux/mmzone.h | 10 ++++++++++
>   mm/mm_init.c           | 23 ++++++++++-------------
>   2 files changed, 20 insertions(+), 13 deletions(-)
> 
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 6ccec1bf2896..230a29c2ed1a 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -2177,6 +2177,16 @@ void sparse_init(void);
>   #define subsection_map_init(_pfn, _nr_pages) do {} while (0)
>   #endif /* CONFIG_SPARSEMEM */
>   
> +/*
> + * Fallback case for when the architecture provides its own pfn_valid() but
> + * not a corresponding for_each_valid_pfn().
> + */
> +#ifndef for_each_valid_pfn
> +#define for_each_valid_pfn(_pfn, _start_pfn, _end_pfn)			\
> +	for ((_pfn) = (_start_pfn); (_pfn) < (_end_pfn); (_pfn)++)	\
> +		if (pfn_valid(_pfn))
> +#endif
> +
>   #endif /* !__GENERATING_BOUNDS.H */
>   #endif /* !__ASSEMBLY__ */
>   #endif /* _LINUX_MMZONE_H */
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 9659689b8ace..41884f2155c4 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -777,22 +777,19 @@ static inline void init_deferred_page(unsigned long pfn, int nid)
>   void __meminit reserve_bootmem_region(phys_addr_t start,
>   				      phys_addr_t end, int nid)
>   {
> -	unsigned long start_pfn = PFN_DOWN(start);
> -	unsigned long end_pfn = PFN_UP(end);
> +	unsigned long pfn;
>   
> -	for (; start_pfn < end_pfn; start_pfn++) {
> -		if (pfn_valid(start_pfn)) {
> -			struct page *page = pfn_to_page(start_pfn);
> +	for_each_valid_pfn (pfn, PFN_DOWN(start), PFN_UP(end)) {

                           ^ space should be removed

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


