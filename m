Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BB9C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 08:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=znF6IF91Kjh9fOW1blnmEZLQNQBHGQn5QAy7B3RNZ1o=; b=nGQwIt2EFabeJXRF5ynAPVg7H0
	Vn22Tn5n6uvVGp1dCzHYFRayygn2iBGQVEhuBoMWSrunNB+RKbbEgsIAKnIX9N1Gx5EErqntUW1g2
	T3HuToB6iEhoaGK1cR2OE4Id4jyZRGJofxVphcJUxWw2GTTfpHT4DlbOs8LXI/+RlV4mhdO2B5aCp
	nZqt2MxTVDP3/QesHOzlongazkbGYwIeX93ykFwMohUFoKfst7fKlu79PmsVKkfL6GnTOG4tV08Fm
	4LaeYi43wMTqJzCHdxLUSZGPtH9kZnsYiV2A7rB9pZBZGOE96uHQy1uxwuk6lAguQDQQ9ha45fVRQ
	m8fo5MIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujZXE-0000000Edqr-2z5a;
	Wed, 06 Aug 2025 08:30:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujZMa-0000000EcX8-45vD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 08:19:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754468348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=znF6IF91Kjh9fOW1blnmEZLQNQBHGQn5QAy7B3RNZ1o=;
	b=eNeGzRi3idP6u3rOalXcbgOoDxl4mOfjxlwP/yl8D0kf81Fqy5curit5ela/fX0k7/F3tI
	8F0+DR/rPmjpkT7aq2+subdfAv6ql6E4ZO9Z9foMZz54i5vwgtZ8aiYSkLRhwfkRLp5qFi
	ZpsSJssgrhzZjn/L6LI9XdsrnR+wOW8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-0_WAcJY4OYO3MbpUWYArsw-1; Wed, 06 Aug 2025 04:19:06 -0400
X-MC-Unique: 0_WAcJY4OYO3MbpUWYArsw-1
X-Mimecast-MFC-AGG-ID: 0_WAcJY4OYO3MbpUWYArsw_1754468345
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-459d5f50a07so16700555e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 01:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754468345; x=1755073145;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=znF6IF91Kjh9fOW1blnmEZLQNQBHGQn5QAy7B3RNZ1o=;
        b=lmpkKSbmsKc+QGCTZ18N/1UlP+DSQ7DtgBqIrJBkn5vNfO3XhUZZzbxyFwEUP3EMRy
         xff6pSoCP+L7sv6RIWWGSXA/Z/gHnYLQqJmmNn/CpMHk69QJjiaUtOiGeb3YyJVZePB2
         +JfbbVIE9NoXK+mDcSNExUOOqb8ri4i081CF8pq6E69Y7s9sqZFY+dg6UNujTzN/+HQf
         /3eHeXuF5hQSlHbEa3UR0xj57lMm8nT5Kl5QM1QcTaWioNryHUk2ltulPCIKwwcYbPG2
         BX4p53sZhWj/g3EJpsXgcnwufprHYB4qV+owlNnbGExU/d6dfo1GIW5+e6peT59LUZ0U
         5U9g==
X-Forwarded-Encrypted: i=1; AJvYcCWew9DuonM+HuuW2WnuSvfehO/cRwIHrd85esUKuYg2pD74TGN017p3juX2Sh9Gw2l/ygs3GqK7JrYxeXL2j3FF@lists.infradead.org
X-Gm-Message-State: AOJu0YwAoWreLAmC6rZBHEk8uWzDr0F6W4keGL5m3JsaJs2huc/fvNQp
	H8jHYgxPAoZHvo3APjQRQp+8pq+zRl7gCj25Z4OQ3R5fkvBHa0X+K6zqfRi4TVCFbCAIxOx2sxO
	6X0CMyUTXH2baPTrJbYMYDIEkFpjI+nHwgp4XU/z5HPVvxfwnw0YoNTnTm8I1O+HcY+W9X5tmZN
	iA
X-Gm-Gg: ASbGnctOJqajCdXAa5OIqThopPGFWGMcBAfK+yi7CcuKIm6H7uLgWb1MYw3YaceD2cM
	Xi24M/otCzqY+Db7Dt//sU5zNhDUyK67ejA9lhgIOphPVF8yHZ+9YYI5hxYD7FCVJlv6SWnNccB
	Rs5ZsgVH1P+IcpA+sfv+Oo2AuJBjZ/OOYB3njJFkIcjhVKUijPhYH59eMNK8Ev65h/HHO1kXFr+
	Xaa5buosglo94OoC2fXocZKu12mWgiSGZ5fKRhoQWYtAbNYqcDkD3FBKHIJa6z8xqmJWMSMXGnk
	93kQqCksYGFgYOSRMbRTKcGVPES1tll8J14pXmmk4VL8ZHaCmLg53KcaaFkMyjssGFQJSi8xBg/
	ZxY7FQdcvLQr+2pB24Roab86oD2Zab+/sc3wsGKsYwuDGHIp/3sNF0ctRa/Zfjw==
X-Received: by 2002:a05:600c:35c6:b0:453:5c30:a1fd with SMTP id 5b1f17b1804b1-459e7087704mr18138905e9.8.1754468345079;
        Wed, 06 Aug 2025 01:19:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgROVHMEZgh0TP3BOKWjmCZln6savk2PzpCHP5awcCjYqYMP2QVJ3P1DIDcRnVzvlbVHqAlA==
X-Received: by 2002:a05:600c:35c6:b0:453:5c30:a1fd with SMTP id 5b1f17b1804b1-459e7087704mr18138545e9.8.1754468344556;
        Wed, 06 Aug 2025 01:19:04 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1e:2200:30f4:30:4011:370e? (p200300d82f1e220030f400304011370e.dip0.t-ipconnect.de. [2003:d8:2f1e:2200:30f4:30:4011:370e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458953cfd10sm300498035e9.21.2025.08.06.01.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 01:19:04 -0700 (PDT)
Message-ID: <2d213b5c-555e-4a4c-92bc-58ca8480ca64@redhat.com>
Date: Wed, 6 Aug 2025 10:19:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] mm: Optimize mprotect() by PTE batching
To: Will Deacon <will@kernel.org>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org,
 ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250718090244.21092-1-dev.jain@arm.com>
 <20250718090244.21092-7-dev.jain@arm.com>
 <7567c594-7588-49e0-8b09-2a591181b24d@redhat.com>
 <aJMPOTripINrafxh@willie-the-truck>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <aJMPOTripINrafxh@willie-the-truck>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2s1EitVuL5uO2IkVt931blZCi4nBWaxuKWPlKzDsdA0_1754468345
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_011909_097314_0CA7AAA4 
X-CRM114-Status: GOOD (  27.82  )
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

On 06.08.25 10:15, Will Deacon wrote:
> On Wed, Aug 06, 2025 at 10:08:33AM +0200, David Hildenbrand wrote:
>> On 18.07.25 11:02, Dev Jain wrote:
>>> Use folio_pte_batch to batch process a large folio. Note that, PTE
>>> batching here will save a few function calls, and this strategy in certain
>>> cases (not this one) batches atomic operations in general, so we have
>>> a performance win for all arches. This patch paves the way for patch 7
>>> which will help us elide the TLBI per contig block on arm64.
>>>
>>> The correctness of this patch lies on the correctness of setting the
>>> new ptes based upon information only from the first pte of the batch
>>> (which may also have accumulated a/d bits via modify_prot_start_ptes()).
>>>
>>> Observe that the flag combination we pass to mprotect_folio_pte_batch()
>>> guarantees that the batch is uniform w.r.t the soft-dirty bit and the
>>> writable bit. Therefore, the only bits which may differ are the a/d bits.
>>> So we only need to worry about code which is concerned about the a/d bits
>>> of the PTEs.
>>>
>>> Setting extra a/d bits on the new ptes where previously they were not set,
>>> is fine - setting access bit when it was not set is not an incorrectness
>>> problem but will only possibly delay the reclaim of the page mapped by
>>> the pte (which is in fact intended because the kernel just operated on this
>>> region via mprotect()!). Setting dirty bit when it was not set is again
>>> not an incorrectness problem but will only possibly force an unnecessary
>>> writeback.
>>>
>>> So now we need to reason whether something can go wrong via
>>> can_change_pte_writable(). The pte_protnone, pte_needs_soft_dirty_wp,
>>> and userfaultfd_pte_wp cases are solved due to uniformity in the
>>> corresponding bits guaranteed by the flag combination. The ptes all
>>> belong to the same VMA (since callers guarantee that [start, end) will
>>> lie within the VMA) therefore the conditional based on the VMA is also
>>> safe to batch around.
>>>
>>> Since the dirty bit on the PTE really is just an indication that the folio
>>> got written to - even if the PTE is not actually dirty but one of the PTEs
>>> in the batch is, the wp-fault optimization can be made. Therefore, it is
>>> safe to batch around pte_dirty() in can_change_shared_pte_writable()
>>> (in fact this is better since without batching, it may happen that
>>> some ptes aren't changed to writable just because they are not dirty,
>>> even though the other ptes mapping the same large folio are dirty).
>>>
>>> To batch around the PageAnonExclusive case, we must check the corresponding
>>> condition for every single page. Therefore, from the large folio batch,
>>> we process sub batches of ptes mapping pages with the same
>>> PageAnonExclusive condition, and process that sub batch, then determine
>>> and process the next sub batch, and so on. Note that this does not cause
>>> any extra overhead; if suppose the size of the folio batch is 512, then
>>> the sub batch processing in total will take 512 iterations, which is the
>>> same as what we would have done before.
>>>
>>> For pte_needs_flush():
>>>
>>> ppc does not care about the a/d bits.
>>>
>>> For x86, PAGE_SAVED_DIRTY is ignored. We will flush only when a/d bits
>>> get cleared; since we can only have extra a/d bits due to batching,
>>> we will only have an extra flush, not a case where we elide a flush due
>>> to batching when we shouldn't have.
>>>
>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>
>>
>> I wanted to review this, but looks like it's already upstream and I suspect
>> it's buggy (see the upstream report I cc'ed you on)
> 
> Please excuse my laziness, but do you have a link to the report?

I was lazy :)

https://lkml.kernel.org/r/68930511.050a0220.7f033.003a.GAE@google.com

> I've
> been looking at some oddities on arm64 coming back from some of the CI
> systems and was heading in the direction of a recent mm regression
> judging by the first-known-bad-build in linux-next.
> 
> https://lore.kernel.org/r/CA+G9fYumD2MGjECCv0wx2V_96_FKNtFQpT63qVNrrCmomoPYVQ@mail.gmail.com

Hm, mprotect seems to be involved. So it might or might not correlate.

-- 
Cheers,

David / dhildenb


