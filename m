Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6534C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 18:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zSYTzLzA4I8JDg4pBsPS0ZO1xAUoaORmUFU9cepMeAE=; b=BOmjdz4IzEVVaq0o/ZfBnm8EMO
	WxotWf52J1E3n7XEhOJ+exd/DzECXKGym9syQzBtFjeWaho5HltUQDft3KswOkUsoPStB8yJxceAH
	asscerf5GH/8npoG64GATwUhHG9rAOTlJOhxcGfaUal9+aFFUjsD5l1wrpykpOQTYLXnKEGIlkrg4
	bQj/UPz2K8sCDzq8QJyN58FVu2QKOWlTpBYaWzJxwGtkNRmcEGIkCyXmZKWIgo8roYrhLOb9xPjV2
	lYNSDKrUpwcdwlNMAk7ng1Iz4ry9Cewe0R5TbBgx4zfj8uKuHlu5BwnQuo+jC4snxup9GctysSqT2
	hSk6rJWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCN8y-0000000D7cY-1ZYR;
	Tue, 06 May 2025 18:35:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJN3-0000000CKxy-30EC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 14:34:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746542048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zSYTzLzA4I8JDg4pBsPS0ZO1xAUoaORmUFU9cepMeAE=;
	b=Ia69dSt008n8RYfVGfkicPAHCzoK95SENX1X3UiSHoGr42wz8aJRMzfsRmZ/03hmkek/u9
	lyyuMoo6aAE+TteJNczGn3sAXsf2OyUkL5w5ZteD/dBgjv4O1AbsaMgjLxEFQm7IXjaZb8
	xCoY8nH5m5gNYeUCXYwmsYPQ/SN6fOU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-j30PuolvMB-oJSVgIFwtlQ-1; Tue, 06 May 2025 10:34:07 -0400
X-MC-Unique: j30PuolvMB-oJSVgIFwtlQ-1
X-Mimecast-MFC-AGG-ID: j30PuolvMB-oJSVgIFwtlQ_1746542046
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a07a867a4dso2815469f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 07:34:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746542046; x=1747146846;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zSYTzLzA4I8JDg4pBsPS0ZO1xAUoaORmUFU9cepMeAE=;
        b=lz4ArP2ZEyWykAU5vi1UpcVggxLzZdj/3O+I9etFUJNnMzdE9OKxhVqCcGhgcxD6j5
         +iAxF58LfwVp8r/amU465BN1TW/aJgHKLHCqV1eRVZwW1tPhFUN53q7MUTHQcrkXb08S
         9RLI0h9wT0rlgjZ2RgiwEDGjLbjx88VSonbQak2+JSJXdz1b3efOf7T/9Bm/8k1S45If
         5J1ko1gX7WZgDKNDJXQygMmSSydxcOaRnAnlEZanONJU41shNlPurnS7Oz0sm77Sg2Yx
         +UM72i1Jn85/+uu0AfE5oW/0EShku2kjuwlVfUyYVtl1h/5j/1QcuCLghw0iT+iO23T/
         3g+g==
X-Forwarded-Encrypted: i=1; AJvYcCXyiXAsKEqEzPIAxXkarOmXRpbhmZHAnCZachozdHPGo41R0CrZAB6fxM0BPvvQWTH6xaA+BeDN+rVwVJre24SB@lists.infradead.org
X-Gm-Message-State: AOJu0YyKw1DWqMoIDNB6dt/zXCzMDasJHXxnCj8luT2Xt7uAZNRwcGa3
	Cdl80yzxqOEvr0/1pZ9Ue67+YVjqVgdZLWBKzZMz9nuw8BTf9MHhdHOFtNjnXFyaGAa3/08ty7X
	fO6e8Hv4osG0g4zsK+0mHPs2lz+j3NhpDLb/GGnratOLp905IjXYWiwy4Vwqd49C1OaHwoOah
X-Gm-Gg: ASbGncu372SA2TszJr5Ui3ZYWEyIz3vSgq30S4YyGdFREzO97/Fp4Ap6xAELKXTCaL/
	+hBnfUGc3gefsmnGvbHKYWU3d9CDBfaQHAgplPs/ghud+Yk7e5wf+u267uwh/fBmBnh0HiBp2aZ
	7MHe7zzkMQAw3N3WHHFcm+CDGk8aKUWShmGSH5D79jxJU2D4FPN5rNmGVGVh1Yf2Z25oqGFlUqE
	0qV7Xl1RP7sXCeAtVnTSW410iDSRDN+Z02V6wL1B03nW+10AQtW399sjIZI3fmzK3uIqKp+PbiJ
	PUhOE03TuBwU9l6+1kNqjlM8gg3/Ai/TNXaiE3o5I1TJJhR83mo=
X-Received: by 2002:a05:6000:2204:b0:39c:268e:ae04 with SMTP id ffacd0b85a97d-3a09fd0d09dmr8962668f8f.0.1746542046354;
        Tue, 06 May 2025 07:34:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUJh5j9TVIQWsrv8+lQopvkfyv6q0sW1QF6jcjHqVsYskzyqmZ/uFzWwuXJfP4bPKTDBUOGA==
X-Received: by 2002:a05:6000:2204:b0:39c:268e:ae04 with SMTP id ffacd0b85a97d-3a09fd0d09dmr8962630f8f.0.1746542045945;
        Tue, 06 May 2025 07:34:05 -0700 (PDT)
Received: from ?IPV6:2a01:599:915:8911:b13f:d972:e237:7fe2? ([2a01:599:915:8911:b13f:d972:e237:7fe2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a286b9sm170753685e9.28.2025.05.06.07.34.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 07:34:05 -0700 (PDT)
Message-ID: <faff1a33-28e6-4fd9-9276-fb901192f17a@redhat.com>
Date: Tue, 6 May 2025 16:34:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] mm: Batch around can_change_pte_writable()
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, namit@vmware.com, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-7-dev.jain@arm.com>
 <25dcf969-e479-4d4a-a95c-0e83706af99e@redhat.com>
 <9a770aec-a020-4199-a53e-eddda657999d@redhat.com>
 <0857761c-bb4c-4ea5-a96a-90d555673527@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <0857761c-bb4c-4ea5-a96a-90d555673527@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Fno3jpukJD2ygn6_qs9lw5xGf7slZhHbfwbKnyGNpMI_1746542046
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_073409_826294_025B9F94 
X-CRM114-Status: GOOD (  17.80  )
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

On 06.05.25 11:16, Dev Jain wrote:
> 
> 
> On 29/04/25 2:57 pm, David Hildenbrand wrote:
>> On 29.04.25 11:19, David Hildenbrand wrote:
>>>
>>>>     #include "internal.h"
>>>> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned
>>>> long addr,
>>>> -                 pte_t pte)
>>>> +bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned
>>>> long addr,
>>>> +                  pte_t pte, struct folio *folio, unsigned int nr)
>>>>     {
>>>>         struct page *page;
>>>> @@ -67,8 +67,9 @@ bool can_change_pte_writable(struct vm_area_struct
>>>> *vma, unsigned long addr,
>>>>              * write-fault handler similarly would map them writable
>>>> without
>>>>              * any additional checks while holding the PT lock.
>>>>              */
>>>> -        page = vm_normal_page(vma, addr, pte);
>>>> -        return page && PageAnon(page) && PageAnonExclusive(page);
>>>> +        if (!folio)
>>>> +            folio = vm_normal_folio(vma, addr, pte);
>>>> +        return folio_test_anon(folio) && !
>>>> folio_maybe_mapped_shared(folio);
>>>
>>> Oh no, now I spot it. That is horribly wrong.
>>>
>>> Please understand first what you are doing.
>>
>> Also, would expect that the cow.c selftest would catch that:
>>
>> "vmsplice() + unmap in child with mprotect() optimization"
>>
>> After fork() we have a R/O PTE in the parent. Our child then uses
>> vmsplice() and unmaps the R/O PTE, meaning it is only left mapped by the
>> parent.
>>
>> ret = mprotect(mem, size, PROT_READ);
>> ret |= mprotect(mem, size, PROT_READ|PROT_WRITE);
>>
>> should turn the PTE writable, although it shouldn't.
>>
>> If that test case does not detect the issue you're introducing, we
>> should look into adding a test case that detects it.
>>
> 
> Hi David, I am afraid I don't understand my mistake :( PageAnon(page)
> boils down to folio_test_anon(folio). Next we want to determine whether
> the page underlying a PTE is mapped exclusively or not.

No. :)

There is your mistake.

We need to know if this folio page is *exclusive* not if the folio is 
*mapped exclusively*.

I know, it's confusing, but that's an important distinction.

You really have to test all PAE bits. I recently sent a mail on how we 
could remove PAE and encode it in the PTE value itself (W || (!W 
+dirty)), which would mean that we could batch more easily. For the time 
being, we have to stick with what we have.

-- 
Cheers,

David / dhildenb


