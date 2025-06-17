Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19076C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 09:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AycC/SqlmFtbCkiK+UJFsVg8F5mY3OZuVJE4LIVGke0=; b=n07gVW1Ktw9RsirrKawguSY7Uk
	tVWHiPBDKyRESVLGuT+6VmFWVyIplGrRiw60k15MBSplGDAhabscPieopV/3eRPLP8UqvrNWuCh+q
	V1JcW3S62P8ncQCK5MCm7cEdGv61ZPpAuP3wXBn0caTUpxmc14K43T10u17enfqiEZpFhIAvqvKDH
	TGmQ3yglBNeOft1UAg/NyThrq5LUWUVmoKvWB4Crk/6xWvxuKZeeJ5/x4sATEZgrtGGMsrunscTYj
	6PtN0kYTx7V48u7ufiGWAHHwK8rnLD8VcFms+H+bG8z7owE/rx/1lHLh/4p01YKoLfoYVuALy4dGh
	BhkYZ8vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSq3-00000006nUU-1EGX;
	Tue, 17 Jun 2025 09:42:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSeC-00000006kxy-2prG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 09:30:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750152627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AycC/SqlmFtbCkiK+UJFsVg8F5mY3OZuVJE4LIVGke0=;
	b=aHO0C+WFb6uHd6wlRwlmpjQRnN3bUchx8cK+CikHZieAmJ+cwzzau2P6patOihesDZ8X+5
	oHMAN/nuDo+2yeO0TWSYdDLOC0N1FozjEnuPItxH/XEaxG91l2hP7Z7z5W+3sdr2jyQoT/
	2mPExggWvryZEgf9KnmEHjdQeNC3sWk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-UafmLSfiOWmbSYv1DT11jw-1; Tue, 17 Jun 2025 05:30:24 -0400
X-MC-Unique: UafmLSfiOWmbSYv1DT11jw-1
X-Mimecast-MFC-AGG-ID: UafmLSfiOWmbSYv1DT11jw_1750152624
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f55ea44dso2269486f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 02:30:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750152623; x=1750757423;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AycC/SqlmFtbCkiK+UJFsVg8F5mY3OZuVJE4LIVGke0=;
        b=mkjA9gCFAnKXOsmo6DvhjSXIliXKQgG81MjT5yVuwgNPr2H6aueyHSe3WTvbAk5pGe
         zw+RNUY2hH9lYK+8WXAz81yIhCFBDCfg1KaXPHEGC4frx4Qmlo2FqDp66ymOCAhJLkAm
         1nCK0NHI9OCEtCd4IqU1VSlpSnPAj7q8hPc/nnCO2mfftsEDcCQJCDCJ7RRsjq6R0xud
         UL0ariTRTruCT+rJHUrF0nadkMPobm7vwrqpoRLHs5UeT4FTRE5TOBXVQDhim/0GCScJ
         n12GA+5TzXqzCHWvSZOsOjyiAEOATL0E9fOdkJWtkkj7fAcMtITijVTgyK6rEyXTOFG/
         MbmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcFhOPlheWQOiiVw4xjJUQJjyfTAYX7Sepjdxa8UxfuOurDWW4rGtvkAwGBjOm6/7pub73VtvE3ONx8gzzt8hL@lists.infradead.org
X-Gm-Message-State: AOJu0YyspKP/1AnkjUjPXROGe4yyZnH7FWnbva91uvy0BgUF3b9JBy3y
	Zzb+jDXhd0XFgQvQ1NbVtzccTC8XNwIJ8oVOakTudgpDg0iu3Trs7cs007VmpbTYdnzZAvcfpRM
	Ygg61BP0YpHUf3dCr2yJpkRh4t3+MGRFIP3lYC3bZGP0JzMmmk29DdiSg5PvelAu2wNoQC4/FEH
	Mv
X-Gm-Gg: ASbGncvelMsr8DIi4J1yoR4Tdu1dsjNzHS9Uf6gJTffKQMOVDJTA6sbIX2t56yXNo3L
	g2wEDjzhOr1plK07c1oNHZpuyZCcEcHzRyOAo661H6x1YyXqZhrwEYmxxFITZEfvz217xfyzAcl
	oGGJJ+0ogDOSy1ZBUjtYogYBf9ad5d1P/CFmlNvsgMiXLkBr1bUsoi6ZW1acVE7s1tUjL5yCD8k
	TaZrTcDclWC3epdvgi7oJI8IJPF39BxVUjRTpnVYYHLtF/joZDzVrEU21QRen8NO5XT56HnFo1u
	UxT5qctAJS2v8KN0iclQq2UGeXZeThj81lCDGpQON2L4YsyrmEXk2qbDWH+6UhLP4/jEfhSweH0
	ARBxU5g5DUY7DzMFtZPlOkn6NdjjfNwOrtmuTKaTNsgX+Cgk=
X-Received: by 2002:a05:6000:3109:b0:3a3:7387:3078 with SMTP id ffacd0b85a97d-3a572367b6bmr10595417f8f.4.1750152623479;
        Tue, 17 Jun 2025 02:30:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzIdOD1Y0VrtNcMDMGER4ExUmFNXEczyRtVtoCy/fV6z201YqQ8+qNgA+yjmzITUoW9nwVOw==
X-Received: by 2002:a05:6000:3109:b0:3a3:7387:3078 with SMTP id ffacd0b85a97d-3a572367b6bmr10595381f8f.4.1750152622944;
        Tue, 17 Jun 2025 02:30:22 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b79f45sm13384674f8f.101.2025.06.17.02.30.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 02:30:22 -0700 (PDT)
Message-ID: <b67f8dea-dc22-4c83-a71f-f5a2ecc8a8d7@redhat.com>
Date: Tue, 17 Jun 2025 11:30:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/14] mm: Filter zone device pages returned from
 folio_walk_start()
From: David Hildenbrand <david@redhat.com>
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
 dan.j.williams@intel.com, jgg@ziepe.ca, willy@infradead.org,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
 balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org, John@Groves.net,
 m.szyprowski@samsung.com
References: <cover.8d04615eb17b9e46fc0ae7402ca54b69e04b1043.1750075065.git-series.apopple@nvidia.com>
 <11dd5b70546ec67593a4bf79f087b113f15d6bb1.1750075065.git-series.apopple@nvidia.com>
 <6afc2e67-3ecb-41a5-9c8f-00ecd64f035a@redhat.com>
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
In-Reply-To: <6afc2e67-3ecb-41a5-9c8f-00ecd64f035a@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7sXZREMYAnAqzDpCOYCob49O1dMmdC8tVE28eeRg59c_1750152624
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_023028_790625_16367C8D 
X-CRM114-Status: GOOD (  21.32  )
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

On 17.06.25 11:25, David Hildenbrand wrote:
> On 16.06.25 13:58, Alistair Popple wrote:
>> Previously dax pages were skipped by the pagewalk code as pud_special() or
>> vm_normal_page{_pmd}() would be false for DAX pages. Now that dax pages are
>> refcounted normally that is no longer the case, so the pagewalk code will
>> start returning them.
>>
>> Most callers already explicitly filter for DAX or zone device pages so
>> don't need updating. However some don't, so add checks to those callers.
>>
>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>>
>> ---
>>
>> Changes since v1:
>>
>>    - Dropped "mm/pagewalk: Skip dax pages in pagewalk" and replaced it
>>      with this new patch for v2
>>
>>    - As suggested by David and Jason we can filter the folios in the
>>      callers instead of doing it in folio_start_walk(). Most callers
>>      already do this (see below).
>>
>> I audited all callers of folio_walk_start() and found the following:
>>
>> mm/ksm.c:
>>
>> break_ksm() - doesn't need to filter zone_device pages because the can
>> never be KSM pages.
>>
>> get_mergeable_page() - already filters out zone_device pages.
>> scan_get_next_rmap_iterm() - already filters out zone_device_pages.
>>
>> mm/huge_memory.c:
>>
>> split_huge_pages_pid() - already checks for DAX with
>> vma_not_suitable_for_thp_split()
>>
>> mm/rmap.c:
>>
>> make_device_exclusive() - only works on anonymous pages, although
>> there'd be no issue with finding a DAX page even if support was extended
>> to file-backed pages.
>>
>> mm/migrate.c:
>>
>> add_folio_for_migration() - already checks the vma with vma_migratable()
>> do_pages_stat_array() - explicitly checks for zone_device folios
>>
>> kernel/event/uprobes.c:
>>
>> uprobe_write_opcode() - only works on anonymous pages, not sure if
>> zone_device could ever work so add an explicit check
>>
>> arch/s390/mm/fault.c:
>>
>> do_secure_storage_access() - not sure so be conservative and add a check
>>
>> arch/s390/kernel/uv.c:
>>
>> make_hva_secure() - not sure so be conservative and add a check
>> ---
>>    arch/s390/kernel/uv.c   | 2 +-
>>    arch/s390/mm/fault.c    | 2 +-
>>    kernel/events/uprobes.c | 2 +-
>>    3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/s390/kernel/uv.c b/arch/s390/kernel/uv.c
>> index b99478e..55aa280 100644
>> --- a/arch/s390/kernel/uv.c
>> +++ b/arch/s390/kernel/uv.c
>> @@ -424,7 +424,7 @@ int make_hva_secure(struct mm_struct *mm, unsigned long hva, struct uv_cb_header
>>    		return -EFAULT;
>>    	}
>>    	folio = folio_walk_start(&fw, vma, hva, 0);
>> -	if (!folio) {
>> +	if (!folio || folio_is_zone_device(folio)) {
>>    		mmap_read_unlock(mm);
>>    		return -ENXIO;
>>    	}
>> diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
>> index e1ad05b..df1a067 100644
>> --- a/arch/s390/mm/fault.c
>> +++ b/arch/s390/mm/fault.c
>> @@ -449,7 +449,7 @@ void do_secure_storage_access(struct pt_regs *regs)
>>    		if (!vma)
>>    			return handle_fault_error(regs, SEGV_MAPERR);
>>    		folio = folio_walk_start(&fw, vma, addr, 0);
>> -		if (!folio) {
>> +		if (!folio || folio_is_zone_device(folio)) {
>>    			mmap_read_unlock(mm);
>>    			return;
>>    		}
> 
> Curious, does s390 even support ZONE_DEVICE and could trigger this?

Ah, I see you raised this above. Even if it could be triggered (which I 
don't think), I wonder if there would actually be a problem with 
zone_device folios in here?

I think these two can be dropped for now

-- 
Cheers,

David / dhildenb


