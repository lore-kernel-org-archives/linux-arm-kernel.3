Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DCBC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 17:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWpQhfcMYiannUA+rJ5gOh1mNCZnzLMoO5gh2F8JmmM=; b=w7KucP9/QmTlaY1HM2zyQ2f5Gh
	iXUWAr60AwCkWOqGop0TyNB5nnwV8LOkPsO4NRBTK9PyyxKd2sTXvwZSedLwU8XchSPzY00MYelFo
	3Xso32MPBdu6zl1SZPhqcXngVPZBfeL2ZrAc61hTpZuYow6dR31p7JHgGh8zKmu8HxqE2qMhhnyCK
	wHQs4/Wr1QZpFsbuBhMt8f9ro9L6LnU/62f4iqA8wLVk6Z59yxzx+GGXkHbfc87mz55uiJZfHKzE+
	/EyfX+37LOAgLv5IAIjXeXS2L24n1oz6PauUXWa5mw572GyH08LP3sCVigIFVusa2SglcQE0eKmtB
	8aqYKN8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCeg-0000000FNS3-0C8t;
	Fri, 27 Jun 2025 17:14:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBKX-0000000FAL2-1xDf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 15:49:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751039372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MWpQhfcMYiannUA+rJ5gOh1mNCZnzLMoO5gh2F8JmmM=;
	b=Ks12FopddPTRcdU2AwAfRFcaV0SQ/E2NyChkUDzihFceB4RbVDklPM4LRg2i9nVfdDLbGs
	pa0Vf8Rr3OSQXktuZ3IU/wf2dCUM7rnOeVXEyouurnJoQezx5Oc0O6qU4Bei+rLzWZIl3o
	3obVRGCHNa5MlzZ3z5LXL0PgSW8SGVs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-aV2wNZMMNqSIUrEF_gRV0g-1; Fri, 27 Jun 2025 11:49:31 -0400
X-MC-Unique: aV2wNZMMNqSIUrEF_gRV0g-1
X-Mimecast-MFC-AGG-ID: aV2wNZMMNqSIUrEF_gRV0g_1751039370
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4530c186394so173985e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 08:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751039370; x=1751644170;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MWpQhfcMYiannUA+rJ5gOh1mNCZnzLMoO5gh2F8JmmM=;
        b=IQ8F0S6hKzk2yPmoUMSPF6VnQxEQvSTYhIuVuatcetlA/UA30/TGhj5fK947i49cdi
         GnP8Q4vFqF/HF0v5IphI1Qsjjsv4SweO1NU4dMx1a/NvFjOZOyx4gTRP9OKfsNEdq/KF
         Rw0dYv2Uyi048kGHz2l2T9DnNFldOh0UnDx2RaREd2ZdPdgDZo2TnkI4kDJnhEXrugHq
         +LQ7yNSlMDtZN1pWIR54x0CwHLz72CHR5R1jlqm8A+nnp8RN1vDd+wsvJ3bTKgng34sn
         Xc41thZv9sNZwLmTJ8YcLaLyPTRFeEUctD8rQYpMhgWZft11Gvml+uS/8uzwRvRLXeEr
         g3uA==
X-Forwarded-Encrypted: i=1; AJvYcCWEdeVF8vh9KC75KHtfG0l4C+bP2+zxtT65WV693h2IDAbw00xx761ChfLdLMa1rmYAz8HYsZCVop0I1mAmORgv@lists.infradead.org
X-Gm-Message-State: AOJu0YzzJS0mbOXrSskJ0j12RIXFkCHLJVKehYzvGhk1VrDbB4m4On7i
	hW/2iVe1Q/Mr9Y6yTmXtono0Cy3BCrejRCo9sn59j4NcRpgcVGQDPcmzjL8GwqdKjvIt7qagTGD
	ZBUGi02wEJMTq5gvSjz1ARZiL7mlrJkU6plxbeP8Pfl053M8HEDDPx9yzHCbm4aWvutcPXXEeM6
	t9
X-Gm-Gg: ASbGnctMNlLwTM1R+sHS1oSeCIngoHw/kdVA1aCPG4HRk8GlUi0ZwMwcNfFzbkxx4eU
	FuwDme6oWgEEdywLs/0bw+xJ5dzxlcqsx1HxMBbdpy19H2kUNk8N8sCqpt80ruQh8jE3UgQzjam
	l3EroTC8dd4K7wPUZ+xUMTNgPSTLDMad0krAD1+paY5FSC/ae0OhBmg8/IvqAKi5v0l924Ipar7
	5RRE24AABp9vEIZXks97TzbL6yOgDcjfNI2JiGL9fJxbg1avPYxLmgcfeNZRUWGzFF+FeYaw1YJ
	C2fygyAp+vIrBXdL/e8q9/fKCubUF5Q4+wWdsfBgaJJWA4KEPhh6Sib2WZnqnMnayB5wHbMegTU
	+R3qmoBPIKOd6frey18ALw2lnSxDBIKRrYNfh0Crfw4x94gldAg==
X-Received: by 2002:a05:600c:4e8b:b0:453:8a63:b484 with SMTP id 5b1f17b1804b1-4538ee75d5emr46069195e9.30.1751039369697;
        Fri, 27 Jun 2025 08:49:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf34PqbJ8qzLhvpscXunFC56wXeCg2MQwLGMyj61jFGMywYScq+JOuap9GUf8ACPcIqst2ow==
X-Received: by 2002:a05:600c:4e8b:b0:453:8a63:b484 with SMTP id 5b1f17b1804b1-4538ee75d5emr46068935e9.30.1751039369204;
        Fri, 27 Jun 2025 08:49:29 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2d:5d00:f1a3:2f30:6575:9425? (p200300d82f2d5d00f1a32f3065759425.dip0.t-ipconnect.de. [2003:d8:2f2d:5d00:f1a3:2f30:6575:9425])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453923a22fbsm13811675e9.34.2025.06.27.08.49.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:49:28 -0700 (PDT)
Message-ID: <790e550f-3d6e-4eb2-be3c-a5feaaac1ce0@redhat.com>
Date: Fri, 27 Jun 2025 17:49:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] mm/rmap: fix potential out-of-bounds page table
 access during batched unmap
To: Lance Yang <lance.yang@linux.dev>, Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com,
 chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org,
 huang.ying.caritas@gmail.com, zhengtangquan@oppo.com, riel@surriel.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, harry.yoo@oracle.com,
 mingzhe.yang@ly.com, stable@vger.kernel.org, Lance Yang <ioworker0@gmail.com>
References: <20250627062319.84936-1-lance.yang@linux.dev>
 <CAGsJ_4xQW3O=-VoC7aTCiwU4NZnK0tNsG1faAUgLvf4aZSm8Eg@mail.gmail.com>
 <CAGsJ_4z+DU-FhNk9vkS-epdxgUMjrCvh31ZBwoAs98uWnbTK-A@mail.gmail.com>
 <1d39b66e-4009-4143-a8fa-5d876bc1f7e7@linux.dev>
 <CAGsJ_4xX+kW1msaXpEPqX7aQ-GYG9QVMo+JYBc18BfLCs8eFyA@mail.gmail.com>
 <609409c7-91a8-4898-ab29-fa00eb36df02@redhat.com>
 <530101b3-34d2-49bb-9a12-c7036b0c0a69@linux.dev>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <530101b3-34d2-49bb-9a12-c7036b0c0a69@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6xU7MZgldslAJVGP1y1eN24GznmWJr7mCWV5wpW5NT4_1751039370
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_084933_579756_430B9F18 
X-CRM114-Status: GOOD (  26.61  )
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

On 27.06.25 17:29, Lance Yang wrote:
> 
> 
> On 2025/6/27 18:13, David Hildenbrand wrote:
>> On 27.06.25 09:36, Barry Song wrote:
>>> On Fri, Jun 27, 2025 at 7:15 PM Lance Yang <lance.yang@linux.dev> wrote:
>>>>
>>>>
>>>>
>>>> On 2025/6/27 14:55, Barry Song wrote:
>>>>> On Fri, Jun 27, 2025 at 6:52 PM Barry Song <21cnbao@gmail.com> wrote:
>>>>>>
>>>>>> On Fri, Jun 27, 2025 at 6:23 PM Lance Yang <ioworker0@gmail.com>
>>>>>> wrote:
>>>>>>>
>>>>>>> From: Lance Yang <lance.yang@linux.dev>
>>>>>>>
>>>>>>> As pointed out by David[1], the batched unmap logic in
>>>>>>> try_to_unmap_one()
>>>>>>> can read past the end of a PTE table if a large folio is mapped
>>>>>>> starting at
>>>>>>> the last entry of that table. It would be quite rare in practice, as
>>>>>>> MADV_FREE typically splits the large folio ;)
>>>>>>>
>>>>>>> So let's fix the potential out-of-bounds read by refactoring the
>>>>>>> logic into
>>>>>>> a new helper, folio_unmap_pte_batch().
>>>>>>>
>>>>>>> The new helper now correctly calculates the safe number of pages
>>>>>>> to scan by
>>>>>>> limiting the operation to the boundaries of the current VMA and
>>>>>>> the PTE
>>>>>>> table.
>>>>>>>
>>>>>>> In addition, the "all-or-nothing" batching restriction is removed to
>>>>>>> support partial batches. The reference counting is also cleaned up
>>>>>>> to use
>>>>>>> folio_put_refs().
>>>>>>>
>>>>>>> [1] https://lore.kernel.org/linux-mm/
>>>>>>> a694398c-9f03-4737-81b9-7e49c857fcbe@redhat.com
>>>>>>>
>>>>>>
>>>>>> What about ?
>>>>>>
>>>>>> As pointed out by David[1], the batched unmap logic in
>>>>>> try_to_unmap_one()
>>>>>> may read past the end of a PTE table when a large folio spans
>>>>>> across two PMDs,
>>>>>> particularly after being remapped with mremap(). This patch fixes the
>>>>>> potential out-of-bounds access by capping the batch at vm_end and
>>>>>> the PMD
>>>>>> boundary.
>>>>>>
>>>>>> It also refactors the logic into a new helper,
>>>>>> folio_unmap_pte_batch(),
>>>>>> which supports batching between 1 and folio_nr_pages. This improves
>>>>>> code
>>>>>> clarity. Note that such cases are rare in practice, as MADV_FREE
>>>>>> typically
>>>>>> splits large folios.
>>>>>
>>>>> Sorry, I meant that MADV_FREE typically splits large folios if the
>>>>> specified
>>>>> range doesn't cover the entire folio.
>>>>
>>>> Hmm... I got it wrong as well :( It's the partial coverage that triggers
>>>> the split.
>>>>
>>>> how about this revised version:
>>>>
>>>> As pointed out by David[1], the batched unmap logic in
>>>> try_to_unmap_one()
>>>> may read past the end of a PTE table when a large folio spans across two
>>>> PMDs, particularly after being remapped with mremap(). This patch fixes
>>>> the potential out-of-bounds access by capping the batch at vm_end and
>>>> the
>>>> PMD boundary.
>>>>
>>>> It also refactors the logic into a new helper, folio_unmap_pte_batch(),
>>>> which supports batching between 1 and folio_nr_pages. This improves code
>>>> clarity. Note that such boundary-straddling cases are rare in
>>>> practice, as
>>>> MADV_FREE will typically split a large folio if the advice range does
>>>> not
>>>> cover the entire folio.
>>>
>>> I assume the out-of-bounds access must be fixed, even though it is very
>>> unlikely. It might occur after a large folio is marked with MADV_FREE and
>>> then remapped to an unaligned address, potentially crossing two PTE
>>> tables.
>>
>> Right. If it can be triggered from userspace, it doesn't matter how
>> likely/common/whatever it is. It must be fixed.
> 
> Agreed. It must be fixed regardless of how rare the scenario is ;)
> 
>>
>>>
>>> A batch size between 2 and nr_pages - 1 is practically rare, as we
>>> typically
>>> split large folios when MADV_FREE does not cover the entire folio range.
>>> Cases where a batch of size 2 or nr_pages - 1 occurs may only happen if a
>>> large folio is partially unmapped after being marked MADV_FREE, which is
>>> quite an unusual pattern in userspace.
>>
>> I think the point is rather "Simplify the code by not special-casing for
>> completely mapped folios, there is no real reason why we cannot batch
>> ranges that don't cover the complete folio.".
> 
> Yeah. That makes the code cleaner and more generic, as there is no
> strong reason to special-case for fully mapped folios ;)
> 
> Based on that, I think we're on the same page now. I'd like to post
> the following commit message for the next version:
> 
> ```
> As pointed out by David[1], the batched unmap logic in try_to_unmap_one()
> may read past the end of a PTE table when a large folio's PTE mappings
> are not fully contained within a single page table.
> 
> While this scenario might be rare, an issue triggerable from userspace must
> be fixed regardless of its likelihood. This patch fixes the out-of-bounds
> access by refactoring the logic into a new helper, folio_unmap_pte_batch().
> 
> The new helper correctly calculates the safe batch size by capping the
> scan at both the VMA and PMD boundaries. To simplify the code, it also
> supports partial batching (i.e., any number of pages from 1 up to the
> calculated safe maximum), as there is no strong reason to special-case
> for fully mapped folios.
> ```
> 
> So, wdyt?

Sounds good to me.

-- 
Cheers,

David / dhildenb


