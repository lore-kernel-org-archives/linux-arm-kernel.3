Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37036C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 10:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZOtGlJHl7pysCsWvdDm+kjLTw4XFJasuxqQA3N5P+s=; b=NzQk5Ef0+vCeb153YMSVLXDZu1
	BXGXEtTI1guTgj69qoGtwwJVFM0e5qeFAoTdE6YpCQZKXvCAvbCnt+k1bMo4NM+/coiCe0IbLwvcE
	gydW8SaG1iYmkCODv2J0onpCQO4u6Ks8jj8n8T/o150rcilaUf2Y42wY24pgTZxomqs+RK5EHiWut
	pLNMIEdzrh0jZQD7j/3kNwO5hBdDZlxQyqxLD/3obV4g3SVp8QTeG2v4jRqoE5wIm5s/wmrKhqQ/D
	bUOLKcIxblS12wQTYBOaVBa+KGUqNl8/TxbKd5ZbvGhGuihEMIbjslu/s5xKBw9ysN8dYq0NmasJX
	Sz4pSg2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6MN-0000000EHvs-3rL7;
	Fri, 27 Jun 2025 10:31:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV65i-0000000EE0J-2AiH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 10:13:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751019233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KZOtGlJHl7pysCsWvdDm+kjLTw4XFJasuxqQA3N5P+s=;
	b=Asff2ubKYQeLUjxUQeQWddG4hq+ZBzdbyfz3bKIAfL1nOS13PoJJXnTBQDC0/pl9+cQ8ih
	XeWtpFzGW6H+k7jDUjAhJYBXV0AOrm+eegDV60CAdWAmG/0yw6YFcRrytf1i8GLFVNFoSg
	jL64zqcTT7ZvMw0s+O6yFyKTzUs1x7A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-piJhvFP_MMe0Iew8s21EFA-1; Fri, 27 Jun 2025 06:13:52 -0400
X-MC-Unique: piJhvFP_MMe0Iew8s21EFA-1
X-Mimecast-MFC-AGG-ID: piJhvFP_MMe0Iew8s21EFA_1751019231
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4532514dee8so13312125e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 03:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751019231; x=1751624031;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KZOtGlJHl7pysCsWvdDm+kjLTw4XFJasuxqQA3N5P+s=;
        b=XE+S7aakGQLbwdCaLQV2wFuRAXT5Y/1J3YGA0VLRvHdhFpQZo3KtehByzja4bHFy+h
         DRwkZY0m7DhejYhGCR0Dqj+ndTMVDg+Ta8w7McbTqliYQRwX4bB87DWdZTIXRbR1uu1D
         QU1Grp98NEnqX26HUWMZUA1ifAaZRu14YW8i/rMKxXK8bhvYWnNwLPrPmGE+hO11htBn
         nyoqdMYnbQRbQ/ggGZBFMosfMajbrMymS6nf8kY1RQquLRbQ38M8ysGbMW5pqit0MSP1
         7HmBmP6ZgwCn70E/gECDACLEN8VLdmpvyzrkHXvluBA6FGZAkzWRNBlg3ATfov572IaS
         haXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbJktVl1yOFueXgxx8OBm20grKjnN9CQm4yvZ+LHZevabBaKw5DbFHYyhWxaTKtlk/owxO9Jnens+5t/c+pwNo@lists.infradead.org
X-Gm-Message-State: AOJu0YxQiGawo6QfzWy2qzk54zSyTHnVyZw2HRsEA46Tiy3xOWDtUYml
	L3pdsYluwxcXbZ41XdDGGIQc+o0BBOPWR7dcA21ffvrXmeNVAHbC6PDnNwf4UW/8bG6+fVQMAIG
	GyAAI3CfphqHTuqaAOruayj0ZrkgiYpA2EYokb34BaL6LSzWPqeoHAD7b5iltjzh9KS3qBM/CFS
	Bk
X-Gm-Gg: ASbGncubDwlimCgIt++YUU35XRK7+PaW7sMKqAmTlYva9MoxOZdmmHlD9jAoUZQmwPq
	buUHeF4DmCQ1i8g4EuLyZY+ULtBOlLidc9edOV9H4fPxMGRpjayOTHP+P1qdT+SirzDZppScuoT
	HUetCHjt6xTz8zGdlHEAoCRbhGTTo6YpOqlFCdI9XWXyt9Twe9cmJ/Q9GEsPm0CKPjtSS4uzng8
	3E45BZm4S6NUpcc7bCvNtm2HrtN4eNHuk4zqPnRFWKIAJr8ScoczXqXu6LdBz+1LOeFk+kA1rQ2
	y28ys0RnB6FteM6T/lL02+Wqxuaig4WpjB/5QRUKWZkEU7srBKK3FGzEYcegRd0frqlKGsAsqab
	vFDvAvL9E/grmuMK8UGf6jzCWBCCoX6U79WuwvFh8inpsb9NW3g==
X-Received: by 2002:a05:600c:8708:b0:44b:eb56:1d45 with SMTP id 5b1f17b1804b1-4538ee2e912mr29848215e9.15.1751019230702;
        Fri, 27 Jun 2025 03:13:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoFr5pJO+kYCvYJKu8sYkytHU0j+qo27L0z7AMqLyXeJU0yjZd3M142HS3OwbrgII1pTrdBw==
X-Received: by 2002:a05:600c:8708:b0:44b:eb56:1d45 with SMTP id 5b1f17b1804b1-4538ee2e912mr29847855e9.15.1751019230246;
        Fri, 27 Jun 2025 03:13:50 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2d:5d00:f1a3:2f30:6575:9425? (p200300d82f2d5d00f1a32f3065759425.dip0.t-ipconnect.de. [2003:d8:2f2d:5d00:f1a3:2f30:6575:9425])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e59659sm2258050f8f.77.2025.06.27.03.13.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 03:13:49 -0700 (PDT)
Message-ID: <609409c7-91a8-4898-ab29-fa00eb36df02@redhat.com>
Date: Fri, 27 Jun 2025 12:13:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] mm/rmap: fix potential out-of-bounds page table
 access during batched unmap
To: Barry Song <21cnbao@gmail.com>, Lance Yang <lance.yang@linux.dev>
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
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CAGsJ_4xX+kW1msaXpEPqX7aQ-GYG9QVMo+JYBc18BfLCs8eFyA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HHZd812cdqN-FPvBf1y6hn7ew0XvdMpeZZO21DRuRS4_1751019231
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_031354_634729_70289786 
X-CRM114-Status: GOOD (  21.03  )
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

On 27.06.25 09:36, Barry Song wrote:
> On Fri, Jun 27, 2025 at 7:15 PM Lance Yang <lance.yang@linux.dev> wrote:
>>
>>
>>
>> On 2025/6/27 14:55, Barry Song wrote:
>>> On Fri, Jun 27, 2025 at 6:52 PM Barry Song <21cnbao@gmail.com> wrote:
>>>>
>>>> On Fri, Jun 27, 2025 at 6:23 PM Lance Yang <ioworker0@gmail.com> wrote:
>>>>>
>>>>> From: Lance Yang <lance.yang@linux.dev>
>>>>>
>>>>> As pointed out by David[1], the batched unmap logic in try_to_unmap_one()
>>>>> can read past the end of a PTE table if a large folio is mapped starting at
>>>>> the last entry of that table. It would be quite rare in practice, as
>>>>> MADV_FREE typically splits the large folio ;)
>>>>>
>>>>> So let's fix the potential out-of-bounds read by refactoring the logic into
>>>>> a new helper, folio_unmap_pte_batch().
>>>>>
>>>>> The new helper now correctly calculates the safe number of pages to scan by
>>>>> limiting the operation to the boundaries of the current VMA and the PTE
>>>>> table.
>>>>>
>>>>> In addition, the "all-or-nothing" batching restriction is removed to
>>>>> support partial batches. The reference counting is also cleaned up to use
>>>>> folio_put_refs().
>>>>>
>>>>> [1] https://lore.kernel.org/linux-mm/a694398c-9f03-4737-81b9-7e49c857fcbe@redhat.com
>>>>>
>>>>
>>>> What about ?
>>>>
>>>> As pointed out by David[1], the batched unmap logic in try_to_unmap_one()
>>>> may read past the end of a PTE table when a large folio spans across two PMDs,
>>>> particularly after being remapped with mremap(). This patch fixes the
>>>> potential out-of-bounds access by capping the batch at vm_end and the PMD
>>>> boundary.
>>>>
>>>> It also refactors the logic into a new helper, folio_unmap_pte_batch(),
>>>> which supports batching between 1 and folio_nr_pages. This improves code
>>>> clarity. Note that such cases are rare in practice, as MADV_FREE typically
>>>> splits large folios.
>>>
>>> Sorry, I meant that MADV_FREE typically splits large folios if the specified
>>> range doesn't cover the entire folio.
>>
>> Hmm... I got it wrong as well :( It's the partial coverage that triggers
>> the split.
>>
>> how about this revised version:
>>
>> As pointed out by David[1], the batched unmap logic in try_to_unmap_one()
>> may read past the end of a PTE table when a large folio spans across two
>> PMDs, particularly after being remapped with mremap(). This patch fixes
>> the potential out-of-bounds access by capping the batch at vm_end and the
>> PMD boundary.
>>
>> It also refactors the logic into a new helper, folio_unmap_pte_batch(),
>> which supports batching between 1 and folio_nr_pages. This improves code
>> clarity. Note that such boundary-straddling cases are rare in practice, as
>> MADV_FREE will typically split a large folio if the advice range does not
>> cover the entire folio.
> 
> I assume the out-of-bounds access must be fixed, even though it is very
> unlikely. It might occur after a large folio is marked with MADV_FREE and
> then remapped to an unaligned address, potentially crossing two PTE tables.

Right. If it can be triggered from userspace, it doesn't matter how 
likely/common/whatever it is. It must be fixed.

> 
> A batch size between 2 and nr_pages - 1 is practically rare, as we typically
> split large folios when MADV_FREE does not cover the entire folio range.
> Cases where a batch of size 2 or nr_pages - 1 occurs may only happen if a
> large folio is partially unmapped after being marked MADV_FREE, which is
> quite an unusual pattern in userspace.

I think the point is rather "Simplify the code by not special-casing for 
completely mapped folios, there is no real reason why we cannot batch 
ranges that don't cover the complete folio.".

-- 
Cheers,

David / dhildenb


