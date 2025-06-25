Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A819CC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 14:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQ708vu4avBCMPhkM+hqdqAXtmzk7kBGgUnbB1W0/yM=; b=Ndn6eVU9CDmGIHsTVSn71aRDUw
	WiKfMRIeetGWqtRlzzhIKWk0YApRQF5Bs7uJ7ZzzojbrIB+pZpMR1nFq0/Vz+CVwThXAAHqZwCeYp
	erQ/faavwUdWaQAHJGmwXM0HPRadrOVJt6+8NjBpt1xXxE39O6OsDbtthNZVXgQtPubmFibcydRa4
	zBBBnwwCxgOoDyLADgR2fwa0YwWkmKllOu+XjsJwYVhPdbdmL4Rl1tnEYehfDnzJ7jRPn1Nz6IBDh
	jPycNEUc1zsGUtFQ+Q3sGnFVWA+XyifjQ6axsMYZXUSRQjzXS5b+eq8bfJ31GDkWTG5k0ey2oIc/A
	3uLRBIHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUR2t-00000008xI8-3cHV;
	Wed, 25 Jun 2025 14:24:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNqg-00000008Osc-3Vem
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 10:59:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750849165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=GQ708vu4avBCMPhkM+hqdqAXtmzk7kBGgUnbB1W0/yM=;
	b=gi1CxZlMf+H2JYkAEiZDL1rKw3wdK7NlhYobf9Wz//sOFgQicHy9zpk7fLkbfgeheDJDQ0
	4PXos7jMxdyB45os5bTjdbcojiqvyWKezNQfW/oXLeZnpJO/gCEVrm111/JQC7a1HXjZdH
	5E6V/hv5HhLGIuTztJMlSAP0yKfn4GE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-vCclSUHlNOCP-b4q47qWHg-1; Wed, 25 Jun 2025 06:59:24 -0400
X-MC-Unique: vCclSUHlNOCP-b4q47qWHg-1
X-Mimecast-MFC-AGG-ID: vCclSUHlNOCP-b4q47qWHg_1750849163
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451d3f03b74so8988475e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 03:59:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750849163; x=1751453963;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GQ708vu4avBCMPhkM+hqdqAXtmzk7kBGgUnbB1W0/yM=;
        b=OJOvUcifEzGfu4IQ6IyRG3sxFCSuUq+6rpkvDA6qElCxTkMxA+2PuOGp+K0Ycf/pzr
         feW0njWQB6r6rY44l/TcLALM0XOR+V/aB1Fun22lk8bad8tfudgOHWM/adpwTw4j+bFY
         F5ieDu7k1NQQfrQ4kGwJq/sq/pAb5IpCCXDM4M5KfzEeDbZ5002lZmdlRIxgaqxQtZqs
         iYjKRnP2I8b2um1L0AgBEVX+8vkJPIk0+2pJqzjw12faOLktNTSBtDKz0uJ+xX0TTupx
         h6cE6KifLyfrQkSQKbjSww0F7be7G4sR46Q7hsCLmp4diQ/J21pcOzTGHJEwbqvN2dWT
         PsRQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/PsCSGX8HSDdoqLiayh4wcZUpAIrlTFWgu6oGXQ+9vKt/l3rrQawX4wdQUY+aMabPPoJW2By24AI4ORdEZX3W@lists.infradead.org
X-Gm-Message-State: AOJu0YwIv+XztQTu2QnwwECCfnaJbpc0pT9TC6yWldobk7JWNpW8xAON
	nPl0j+Q33hr3ha0tyq2fTdnZEzFZ0RyYEzRwiCjvllXTPajgg1ZY5tfIlw/rKT+wVM78A2i6huL
	IrARo1iMqxyHQeK0V6Z3xgznwOntrV3/XYAMlvl3uaZh3dhdy9zMIiCIeq5PU/Re+RFrDNpLiXZ
	jB
X-Gm-Gg: ASbGncvikZC5H2ZCqMuiUGlMK0sbATmuJnolYgMWEOjbaYJqlUiAh2FEAQ/bZpDgZFS
	OkSkon1ghcyF3IDqeIfNLE3LLTFqe6zUT7nwBcnIPgobucVw93/m7xpWElQQgRV6QfcekQG9KUd
	CAumHG114fPZg8/ft37zlAeMf4abEd15HNBZTZS2yZkEogP5g56sDOBhYQrPmy+QAxz/No3waUb
	Ajb191q8SS5qeb1LzbY5IlyJkehH/dA9IEFIwuG4D72Lbns5DTjTcl8eIP7YUvpG73whG2Cufb3
	x3ZFyR5IUjd0FpThHfsfhFVT+MiLjV5Gbu+kPc2HOXwbC5hmwnWUQiPx+HGIoWINiuae60dvrAF
	Nd/DS+UJNlG9mWbmDIYOMna5wMShRKG5CesyLttHaa+KX
X-Received: by 2002:a05:600c:64cf:b0:43d:fa58:700e with SMTP id 5b1f17b1804b1-45381af6af8mr20391345e9.33.1750849163262;
        Wed, 25 Jun 2025 03:59:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDpfug9PmYOC/S+NqZ57NJ8Jm3l0ZdGNpTYbf8qxhN/FecM/8gb7Bcic4PKJ268lMQ/vZeMA==
X-Received: by 2002:a05:600c:64cf:b0:43d:fa58:700e with SMTP id 5b1f17b1804b1-45381af6af8mr20391015e9.33.1750849162720;
        Wed, 25 Jun 2025 03:59:22 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:1b00:5d6b:db26:e2b7:12? (p200300d82f121b005d6bdb26e2b70012.dip0.t-ipconnect.de. [2003:d8:2f12:1b00:5d6b:db26:e2b7:12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80ff461sm4398628f8f.67.2025.06.25.03.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 03:59:22 -0700 (PDT)
Message-ID: <146b4cb1-aa1e-4519-9e03-f98cfb1135d2@redhat.com>
Date: Wed, 25 Jun 2025 12:59:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: Barry Song <21cnbao@gmail.com>
Cc: Lance Yang <ioworker0@gmail.com>, akpm@linux-foundation.org,
 baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
 <20250624162503.78957-1-ioworker0@gmail.com>
 <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
 <CAGsJ_4wyByWJqzsDGhx=4=Xs+3uUZt6PZdyVoUCUMAo350cm-g@mail.gmail.com>
 <8a157228-0b7e-479d-a224-ec85b458ea75@redhat.com>
 <CAGsJ_4xPEqXozZCy623LzD6Y01cM9XrbrrYAbddXnUj2eZ8O2Q@mail.gmail.com>
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
In-Reply-To: <CAGsJ_4xPEqXozZCy623LzD6Y01cM9XrbrrYAbddXnUj2eZ8O2Q@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 95Cd5nu3lGdYnKXTC_9f4BdIuoPNuGx8n_ToyZjdLj0_1750849163
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_035926_954233_85718535 
X-CRM114-Status: GOOD (  19.35  )
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

On 25.06.25 12:49, Barry Song wrote:
> On Wed, Jun 25, 2025 at 10:43 PM David Hildenbrand <david@redhat.com> wrote:
>>
>> On 25.06.25 12:38, Barry Song wrote:
>>>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>>>> index fb63d9256f09..241d55a92a47 100644
>>>>> --- a/mm/rmap.c
>>>>> +++ b/mm/rmap.c
>>>>> @@ -1847,12 +1847,25 @@ void folio_remove_rmap_pud(struct folio *folio, struct page *page,
>>>>>
>>>>>     /* We support batch unmapping of PTEs for lazyfree large folios */
>>>>>     static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
>>>>> -                     struct folio *folio, pte_t *ptep)
>>>>> +                                           struct folio *folio, pte_t *ptep,
>>>>> +                                           struct vm_area_struct *vma)
>>>>>     {
>>>>>         const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>>>> +     unsigned long next_pmd, vma_end, end_addr;
>>>>>         int max_nr = folio_nr_pages(folio);
>>>>>         pte_t pte = ptep_get(ptep);
>>>>>
>>>>> +     /*
>>>>> +      * Limit the batch scan within a single VMA and within a single
>>>>> +      * page table.
>>>>> +      */
>>>>> +     vma_end = vma->vm_end;
>>>>> +     next_pmd = ALIGN(addr + 1, PMD_SIZE);
>>>>> +     end_addr = addr + (unsigned long)max_nr * PAGE_SIZE;
>>>>> +
>>>>> +     if (end_addr > min(next_pmd, vma_end))
>>>>> +             return false;
>>>>
>>>> May I suggest that we clean all that up as we fix it?
>>>>
>>>> Maybe something like this:
>>>>
>>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>>> index 3b74bb19c11dd..11fbddc6ad8d6 100644
>>>> --- a/mm/rmap.c
>>>> +++ b/mm/rmap.c
>>>> @@ -1845,23 +1845,38 @@ void folio_remove_rmap_pud(struct folio *folio, struct page *page,
>>>>     #endif
>>>>     }
>>>>
>>>> -/* We support batch unmapping of PTEs for lazyfree large folios */
>>>> -static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
>>>> -                       struct folio *folio, pte_t *ptep)
>>>> +static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
>>>> +               struct page_vma_mapped_walk *pvmw, enum ttu_flags flags,
>>>> +               pte_t pte)
>>>>     {
>>>>            const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>>> -       int max_nr = folio_nr_pages(folio);
>>>> -       pte_t pte = ptep_get(ptep);
>>>> +       struct vm_area_struct *vma = pvmw->vma;
>>>> +       unsigned long end_addr, addr = pvmw->address;
>>>> +       unsigned int max_nr;
>>>> +
>>>> +       if (flags & TTU_HWPOISON)
>>>> +               return 1;
>>>> +       if (!folio_test_large(folio))
>>>> +               return 1;
>>>> +
>>>> +       /* We may only batch within a single VMA and a single page table. */
>>>> +       end_addr = min_t(unsigned long, ALIGN(addr + 1, PMD_SIZE), vma->vm_end);
>>>
>>> Is this pmd_addr_end()?
>>>
>>
>> Yes, that could be reused as well here.
>>
>>>> +       max_nr = (end_addr - addr) >> PAGE_SHIFT;
>>>>
>>>> +       /* We only support lazyfree batching for now ... */
>>>>            if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
>>>> -               return false;
>>>> +               return 1;
>>>>            if (pte_unused(pte))
>>>> -               return false;
>>>> -       if (pte_pfn(pte) != folio_pfn(folio))
>>>> -               return false;
>>>> +               return 1;
>>>> +       /* ... where we must be able to batch the whole folio. */
>>>> +       if (pte_pfn(pte) != folio_pfn(folio) || max_nr != folio_nr_pages(folio))
>>>> +               return 1;
>>>> +       max_nr = folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr, fpb_flags,
>>>> +                                NULL, NULL, NULL);
>>>>
>>>> -       return folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_flags, NULL,
>>>> -                              NULL, NULL) == max_nr;
>>>> +       if (max_nr != folio_nr_pages(folio))
>>>> +               return 1;
>>>> +       return max_nr;
>>>>     }
>>>>
>>>>     /*
>>>> @@ -2024,9 +2039,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>>>>                            if (pte_dirty(pteval))
>>>>                                    folio_mark_dirty(folio);
>>>>                    } else if (likely(pte_present(pteval))) {
>>>> -                       if (folio_test_large(folio) && !(flags & TTU_HWPOISON) &&
>>>> -                           can_batch_unmap_folio_ptes(address, folio, pvmw.pte))
>>>> -                               nr_pages = folio_nr_pages(folio);
>>>> +                       nr_pages = folio_unmap_pte_batch(folio, &pvmw, flags, pteval);
>>>>                            end_addr = address + nr_pages * PAGE_SIZE;
>>>>                            flush_cache_range(vma, address, end_addr);
>>>>
>>>>
>>>> Note that I don't quite understand why we have to batch the whole thing or fallback to
>>>> individual pages. Why can't we perform other batches that span only some PTEs? What's special
>>>> about 1 PTE vs. 2 PTEs vs. all PTEs?
>>>>
>>>>
>>>> Can someone enlighten me why that is required?
>>>
>>> It's probably not a strict requirement — I thought cases where the
>>> count is greater than 1 but less than nr_pages might not provide much
>>> practical benefit, except perhaps in very rare edge cases, since
>>> madv_free() already calls split_folio().
>>
>> Okay, but it makes the code more complicated. If there is no reason to
>> prevent the batching, we should drop it.
> 
> It's not necessarily more complex, since page_vma_mapped_walk() still
> has to check each PTE individually and can't skip ahead based on nr.
> With nr_pages batched, we can exit the loop early in one go.

I said "complicated", not "complex". The code is more complicated than 
necessary.

-- 
Cheers,

David / dhildenb


