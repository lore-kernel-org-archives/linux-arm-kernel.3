Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D392C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 17:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i5Fpnp1ancK4uqQ+bke1E/v9FRGhMDHd1t3dbc6Ndw4=; b=qJmG2jqp0DlwRoHmDQuPb1naYJ
	r0jz7FA1itvAGicRLXxU/WyXuHki8PfUaZovXjxU4dIJK8sltuR6EBxOsgd3a6VZoG1JpgPtEJ0y+
	f8/ZUZI2JiB8FJI2ecw3GijQ9CerRJBy1QQMwe8JysVyWx/e4lYLvbdKKMxtpwKCCJW1EPr0UvsX+
	VzQms/nq9KVZ0TX6ysdZf2CY70v1NCDBunmp7AVG87LQaEk6+UkcjphOfHg42+n3/TGh3kG504UWw
	2M1nOrcDxgw6ZK5GixNdRCyq/xXQwoemhNh503UqYt3WbCTywUlMzsmeO0neAHzW79iJpeIyXnUvj
	VPDnuDxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2hZ-00000007c9H-2VIJ;
	Tue, 10 Jun 2025 17:23:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOz59-00000006ymC-0uOi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 13:32:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749562322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=i5Fpnp1ancK4uqQ+bke1E/v9FRGhMDHd1t3dbc6Ndw4=;
	b=NlTupnIJRL20UTe/aRGL9tyosMPdvdJR1kNGVqmq8cCNsdEtjQHOOmG4Ds3yT3f1c0I7OY
	cDLm403i0DrzkyBqh947mHhyyndHVEhTwBlbgmHVm0r0BMo+43YqJu4MZtlLLy5f63kmOx
	oQ0msSlJ9jWHo2xv/OkRbdl7ql9F92M=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-afskXbQiM8K4DtC-Mci-LQ-1; Tue, 10 Jun 2025 09:32:00 -0400
X-MC-Unique: afskXbQiM8K4DtC-Mci-LQ-1
X-Mimecast-MFC-AGG-ID: afskXbQiM8K4DtC-Mci-LQ_1749562319
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a50816ccc6so3468164f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 06:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749562318; x=1750167118;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i5Fpnp1ancK4uqQ+bke1E/v9FRGhMDHd1t3dbc6Ndw4=;
        b=faCb8Plx02F+iirZtrVpLRN/6aQ+5z43WoJ3dpJwgwKwUhODPJ56VScBt6mvQGSP8R
         K3Z1vlIXeYtQrNfqs2MBQe4+Cu2hnWv1UkfIxYgt1/p7Kkb8uT62qZwvZRYLwqG/p2q8
         CLTJb7rYinbartDyn1/AvfpAX91S1izXkOHnl1OBitU9onp3og3Wd80lb4DcMrd2XOOV
         gEn+G6aalMFULkEArFjxG06zbTDeHZL9heG9e6cNA+QqFCTLx866XqB2Ssi/OykPu72p
         RCC31ETSYHGTkO5fYAQRITk7GAoM7xTY1CNRArU47vD6W2oX4TyvNZX727vgSC+9q3mU
         bwBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsE4hwtdHv3eqylqdA38jLA31wpW2/ul54SocuOi87H26KjM39SiCG3UO72IeqQlFadx6PVlbPqjTfP7yvVy6z@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe8G6JX73i5jVOui2mPjg6HOpIHss95SlewvjrnDVLm96tWzLZ
	/yRkikF27MO1Bs5OTTQ/vFkUB8kNzqps52EsvY4Kkb3x4xWKnX1Ij3qS9JlSz5MTIP7xi861vCf
	Jynm0FEaxZcFQA/Ayqn3/q9pTrHkZRG/KjrQqEx6aB7Fp2b+ak2LIJlzEJ6307akwoJzrnMto2d
	HY
X-Gm-Gg: ASbGncsXVZInuJ819xVhlhM5KVZKAt9APVTtsuXoy/baD0z+9qk3gVcFQmI3KSzoOaD
	c6eK3b9YNNaJd2AkS59T0+ivVF08L0flfcaVUCUYgfGab1/ambrvuBap6kUKpJYedvNa1s+3dNx
	dCnz/VIw1al+W1MNFf13J0CRXh74s0IiNRUvt0p/RZV5GMVojpXW56NQhc6K2U3wSDA8tCaqtPd
	/NwX09iWSm0pk7kyrav6sdPs6OafE+hCIcrNWFGZSNsQWex0BHrRTx1M313fXkBdMxOPvEBkTYt
	pqIlUAByLgGGg9qbh3GehvvEGAlM+v0/qkq/4iW8LSwERzKuyImHUYA=
X-Received: by 2002:a05:6000:2088:b0:3a4:d64a:3df6 with SMTP id ffacd0b85a97d-3a5319b1ab1mr12545695f8f.3.1749562318566;
        Tue, 10 Jun 2025 06:31:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBz2MCHP4FDmWbrNWVVCs+qMkHLQsIUdhZuONWhAyKldgeOr1oERa3231LF39yoOLWzudsWQ==
X-Received: by 2002:a05:6000:2088:b0:3a4:d64a:3df6 with SMTP id ffacd0b85a97d-3a5319b1ab1mr12545656f8f.3.1749562318125;
        Tue, 10 Jun 2025 06:31:58 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12420074f8f.53.2025.06.10.06.31.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 06:31:57 -0700 (PDT)
Message-ID: <bea0969f-5a6c-4486-aeba-964fa79bd714@redhat.com>
Date: Tue, 10 Jun 2025 15:31:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm: Allow lockless kernel pagetable walking
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org,
 catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
 vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
 steven.price@arm.com, gshan@redhat.com,
 linux-arm-kernel@lists.infradead.org, yang@os.amperecomputing.com,
 ryan.roberts@arm.com, anshuman.khandual@arm.com
References: <20250610114401.7097-1-dev.jain@arm.com>
 <20250610114401.7097-2-dev.jain@arm.com>
 <db04bd02-0090-4aff-bb2e-0d1e023757a5@lucifer.local>
 <970e1b84-7f47-4a51-ad99-4df9026b8f7d@redhat.com>
 <359668fb-df61-4135-89ee-2675a06a5c1b@lucifer.local>
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
In-Reply-To: <359668fb-df61-4135-89ee-2675a06a5c1b@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ok8JrhbHy3BdOlN5gl1BxVKdrIYQ9jXunuzFEIM23d0_1749562319
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_063203_333546_381B8EB1 
X-CRM114-Status: GOOD (  15.92  )
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

On 10.06.25 15:27, Lorenzo Stoakes wrote:
> On Tue, Jun 10, 2025 at 03:24:16PM +0200, David Hildenbrand wrote:
>> On 10.06.25 14:07, Lorenzo Stoakes wrote:
>>> OK so I think the best solution here is to just update check_ops_valid(), which
>>> was kind of sucky anyway (we check everywhere but walk_page_range_mm() to
>>> enforce the install pte thing).
>>>
>>> Let's do something like:
>>>
>>> #define OPS_MAY_INSTALL_PTE	(1<<0)
>>> #define OPS_MAY_AVOID_LOCK	(1<<1)
>>>
>>> and update check_ops_valid() to take a flags or maybe 'capabilities' field.
>>>
>>> Then check based on this e.g.:
>>>
>>> if (ops->install_pte && !(capabilities & OPS_MAY_INSTALL_PTE))
>>> 	return false;
>>>
>>> if (ops->walk_lock == PGWALK_NOLOCK && !(capabilities & OPS_MAY_AVOID_LOCK))
>>> 	return false;
>>>
>>
>> Hm. I mean, we really only want to allow this lockless check for
>> walk_kernel_page_table_range(), right?
>>
>> Having a walk_kernel_page_table_range_lockeless() might (or might not) be
>> better, to really only special-case this specific path.
> 
> Agree completely, Dev - let's definitely do this.
> 
>>
>> So, I am wondering if we should further start splitting the
>> kernel-page-table walker up from the mm walker, at least on the "entry"
>> function for now.
> 
> How do you mean?

In particular, "struct mm_walk_ops"

does not quite make sense when not actually walking a "real" mm .

So maybe we should start having a separate structure where *vma, 
install_pte, walk_lock, hugetlb* does not even exist.

It might be a bit of churn, though ... not sure if there could be an 
easy translation layer for now.

-- 
Cheers,

David / dhildenb


