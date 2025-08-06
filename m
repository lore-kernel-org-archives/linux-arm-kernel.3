Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85B5C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 10:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nKNoeRnJQHE9xlWRNjmXu0K+b82kSOJOZJ1O9/cC1ug=; b=z1eiLEBIgSywlK+zCxqMXK0RO0
	ijYMBI3N5kTvhNn+ydVsP0ZBuWSdzBBW3MvannrA8xq5vwT3pvoaTfcZINxRwoMyxh5exjVEWfu5I
	9QUGYrekqLhyRmL575PmdtSVgyG0spTj34zZUWceGyipjeQvW7wUkSa6TEwmrnLctCe7o49D2Jdbu
	jKP4iweBPx9lSGyVXiSe1zTaf9nWMFwFrOozj70H5PIjKDONXHmLQmVUMyoeZG6QWqZGhejb69iSq
	1kahgjE6EcnvHoOh4fmHo8ur3hs08yjemKd/Jn1fzCmmtNkl5HuZbD0dPrqtHPUE85Whz7Rvj3lLY
	fJFilHCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujbCS-0000000Es26-1ubV;
	Wed, 06 Aug 2025 10:16:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujb8e-0000000Erem-3yi2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 10:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754475171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nKNoeRnJQHE9xlWRNjmXu0K+b82kSOJOZJ1O9/cC1ug=;
	b=LFsNEfJwrFdYgMKmoEoGSQ8/vZOF+QQBzT1ijjx9h+K/taTPgDTJLm30ZbGN5g3Dc8zJ/W
	fc3VesgVAaMAzjKjTTAUlXdZqafzxbsBypU54z6kwDX/Bvmct0BWfDWU3W08YZFR6RbOzr
	7eghnG6UtOvRPkWgfkO+MOO75M4Ro5I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-YSkCHwHmO22p-OL56Nsrmw-1; Wed, 06 Aug 2025 06:12:50 -0400
X-MC-Unique: YSkCHwHmO22p-OL56Nsrmw-1
X-Mimecast-MFC-AGG-ID: YSkCHwHmO22p-OL56Nsrmw_1754475169
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3b7865dc367so3934377f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 03:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754475169; x=1755079969;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nKNoeRnJQHE9xlWRNjmXu0K+b82kSOJOZJ1O9/cC1ug=;
        b=OjxrbecYKBXi5w9uRzyqJK3EKWpKKcbO+ApTLuOtsiNVzXxJJasmx/1hWiETMlw6A3
         ZRBcCQ6+f4XI0fql2xtlQM1XTvBi9/FynssssB3VCOmYRGFB4yvtNBl+YfoEzvDOFf3Z
         nxbYtf8pMYSIDsGrkZmfWpYJcFD2do0b3OyAAEaJb8EuPaStj87B0q99Ai8nz9aPX4gq
         KstQzTL4+TeqnfIfLBM8PdbVL5PmVuIvGBZNAdHQ5c1EAPDfqdHq+pi5rbLwnl9BoA5V
         6OKjRTaoL3u9CQJ83sBJfT7iNtgctP43HdwqUWiNfvjKxt2d30bVLoLrE28tgQ5btQko
         IPpg==
X-Forwarded-Encrypted: i=1; AJvYcCVwqBvOvZGEWhb96Ao0IRB2iTXMo1x24TRiD03lnrCsnnC5OW9mCHYSX3ob0A1EZ5+vW3WHQLiU7HVpS0DSnUFN@lists.infradead.org
X-Gm-Message-State: AOJu0YyBuRdegCxArx4mwhO9IPWS4CcB82oC/Ojq3Tjb4QX4jWbmecXe
	5djHydkNtlfYMUYQZqzI/qWFQDbkjMV8CEP/vyz8FOnR9RIDyrsZdh98tD77BA9TKTqeG3T6KQ0
	Lfj1bS6rn2nYdz1AL7D6FDU2Vp5aLBbG49+so9bKLr+2eESWbgmvoitph/1DaGDzIgfg3nzgUtO
	NE
X-Gm-Gg: ASbGncvM7cxuTK5rvqhYA9kd3i7UZFiT+xU76L3WZONbMNS9QCki6CzOUpqNtbCDBQw
	8So/m0JZYj264TXeT2ZGgME0JW8hLl3Lv3wVUFlxD+2TRxebf1Np0va1S6NMnEtB9/2dsxD1l3B
	bFg39vd0eyNZbbrBVj3v0tWmu6sVOfYDSbVL3bBReMque0xNVNjs2PVZbSEsSXwnKXEk77N6Zc2
	Xl2+KLqh4HKlmbGdsjdQcRbTJ/CUGkkQoGtFVnL0zA0t2tHi6fe6hlhQOFNikF9Hwr1IXGti/Av
	xiUykq6uduxiKb2lY+peP1i9dMYdF+9wgpluGDXoHBhfVyPgNbz3JBzQpoCOnBMvpYw99Ise5FN
	xThhlTYyf3GT7QweWN0/pC/nZWCwPfvYEkElzIiE/Z7wh+biHqNWyH+khP+buLA53/RA=
X-Received: by 2002:a5d:5d0c:0:b0:3b5:e2ca:1c2 with SMTP id ffacd0b85a97d-3b8f41595c0mr1938064f8f.2.1754475169363;
        Wed, 06 Aug 2025 03:12:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMTciqXottdcIXxB+Q4n4Az73fuhye2kzUIBiQJuGVEgLhsIdk2Fj8My1CS4lJuGy9WxthHg==
X-Received: by 2002:a5d:5d0c:0:b0:3b5:e2ca:1c2 with SMTP id ffacd0b85a97d-3b8f41595c0mr1938017f8f.2.1754475168846;
        Wed, 06 Aug 2025 03:12:48 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f35:8a00:42f7:2657:34cc:a51f? (p200300d82f358a0042f7265734cca51f.dip0.t-ipconnect.de. [2003:d8:2f35:8a00:42f7:2657:34cc:a51f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e5d0b1afsm38474915e9.26.2025.08.06.03.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 03:12:48 -0700 (PDT)
Message-ID: <e7a52474-784f-4c7b-b4b5-d8dba30ddd75@redhat.com>
Date: Wed, 6 Aug 2025 12:12:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] mm: Optimize mprotect() by PTE batching
To: Dev Jain <dev.jain@arm.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, willy@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
 anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com,
 ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
 quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
 yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 hughd@google.com, yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250718090244.21092-1-dev.jain@arm.com>
 <20250718090244.21092-7-dev.jain@arm.com>
 <7567c594-7588-49e0-8b09-2a591181b24d@redhat.com>
 <9552ddff-d778-4934-9349-37c7237cbb78@lucifer.local>
 <54ee1971-d91a-4fe6-90b8-16212c8568d1@redhat.com>
 <0d52d680-f3d3-454f-8c12-602f650469ab@arm.com>
 <9cbe9c6a-0013-4239-9347-bf5d43021fe3@lucifer.local>
 <1b3d4799-2a57-4f16-973b-82fc7b438862@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <1b3d4799-2a57-4f16-973b-82fc7b438862@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RHu9tcoPa_diJVFq26d9-_wUjejTHoN_AxBvFzvAnt8_1754475169
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_031253_064556_5012CB71 
X-CRM114-Status: GOOD (  21.58  )
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

On 06.08.25 12:04, Dev Jain wrote:
> 
> On 06/08/25 3:20 pm, Lorenzo Stoakes wrote:
>> On Wed, Aug 06, 2025 at 03:07:49PM +0530, Dev Jain wrote:
>>>>> You mean in _this_ PTE of the batch right? As we're invoking these
>>>>> on each part
>>>>> of the PTE table.
>>>>>
>>>>> I mean I guess we can simply do:
>>>>>
>>>>>      struct page *first_page = pte_page(ptent);
>>>>>
>>>>> Right?
>>>> Yes, but we should forward the result from vm_normal_page(), which does
>>>> exactly that for you, and increment the page accordingly as required,
>>>> just like with the pte we are processing.
>>> Makes sense, so I guess I will have to change the signature of
>>> prot_numa_skip()
>>>
>>> to pass a double ptr to a page instead of folio and derive the folio in the
>>> caller,
>>>
>>> and pass down both the folio and the page to
>>> set_write_prot_commit_flush_ptes.
>> I already don't love how we psas the folio back from there for very dubious
>> benefit. I really hate the idea of having a struct **page parameter...
>>
>> I wonder if we should just have a quick fixup for hotfix, and refine this more
>> later?
>>
>> I foresee some debate otherwise...
> 
> Yup I would personally prefer that. Although if you would like to see the churn, here
> it is (based on mm-hotfixes-unstable, untested):
> 
> ---
> mm/mprotect.c | 27 ++++++++++++++++-----------
> 1 file changed, 16 insertions(+), 11 deletions(-)
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index 78bded7acf79..0735870e89ab 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -120,9 +120,10 @@ static int mprotect_folio_pte_batch(struct folio 
> *folio, pte_t *ptep,
> static bool prot_numa_skip(struct vm_area_struct *vma, unsigned long addr,
> pte_t oldpte, pte_t *pte, int target_node,
> - struct folio **foliop)
> + struct page **pagep)
> {
> struct folio *folio = NULL;
> + struct page *page = NULL;
> bool ret = true;
> bool toptier;
> int nid;
> @@ -131,7 +132,9 @@ static bool prot_numa_skip(struct vm_area_struct 
> *vma, unsigned long addr,
> if (pte_protnone(oldpte))
> goto skip;
> - folio = vm_normal_folio(vma, addr, oldpte);
> + page = vm_normal_page(vma, addr, oldpte);
> + if (page)
> + folio = page_folio(page);

See the draft I just send, where we move that vm_normal_page() into the 
caller.


-- 
Cheers,

David / dhildenb


