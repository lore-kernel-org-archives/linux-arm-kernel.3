Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EA3E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 15:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4tNobL2w3YDV5FmQWdRawu4zLR/LCBXJI+k7s8uNxQY=; b=veeFqedC3kpW4kezbI/I5dV8SJ
	NhCjOGyGNtg0KybXpmBJsDl8louqNu2Vvb3R4sJ7ExCf1g4vsZ+44jLJ+r5zApTpZyOijKI7pE/hP
	d2v60GMexEbhHSFB3otWrdj2YOCarVoI4rM9W6tZwga4ml2jPQ0fWf3YzefhyuxIylzhJazG1Do3O
	vSwQvA/rmUSeODQLdRnYP9Ixk+dAM5OFrYfJh1j8ZxxxJfMWq76rJ+nijzrPAzX0Rk6vKcYls0S84
	snzm8TvNPEi62LYCYIuhhfUfVtkJe0G24+ULF11O+SxTVI+ki59q1EUmateUdxFJ+qErmoZk7t09a
	muFHSTZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrOg-0000000D18V-01Zs;
	Wed, 04 Dec 2024 15:34:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrMS-0000000D0iR-06FX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 15:32:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733326339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4tNobL2w3YDV5FmQWdRawu4zLR/LCBXJI+k7s8uNxQY=;
	b=jF1xmcKyRlc9on7P+YGsOW1xFmgNLPt36tSq59ojLZ6m+OmAuni6L4F4UiuJu32YF+0rcc
	pIQK22HPj+NTyaszfRttqW4alADQKy8FLpQmgyxbhRAw8F3bAQKqZCoqSWpnpYv39gmqIX
	RNmB9dxExegBUNdNYk2y/cNBdNBMn+Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-1XCus7AAOrWpTpmwVipzTg-1; Wed, 04 Dec 2024 10:32:16 -0500
X-MC-Unique: 1XCus7AAOrWpTpmwVipzTg-1
X-Mimecast-MFC-AGG-ID: 1XCus7AAOrWpTpmwVipzTg
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4349cbf726cso50968815e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 07:32:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733326335; x=1733931135;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tNobL2w3YDV5FmQWdRawu4zLR/LCBXJI+k7s8uNxQY=;
        b=MxvUt6LN2t6g0fYMx5tlU+1FO4PtRnqyAs2U74keGsA91c7JSIJZ05KfbLrgZQYDO9
         G5GufqJHn+YE0dniSQ8fRCpcpbPdjyS7zw+yKQ2TVc0rsiX9uigT8/GyuiZtrX6R0JWc
         Rm77shcDgtgnO5jtFmK9ouRiBrHwJzwfptxyoNaGoU+g06GsIXQVrq5FbYamvbOiQwf9
         neXmghVXxJQE0RTIgXYmfHLXJf3LlcvUTV6A6dG2x8Q87Gm5XBdwbD19p09jUyrah96P
         nNWLJWF1APSlI5+oEXx/D6zpjNyp8y4NElDMOcn7HacBq4EF06ldZEh7Op6/ngm2rkbz
         48iw==
X-Forwarded-Encrypted: i=1; AJvYcCVQFuCaeWXbcD3VLYwtAlkmBLsdHvV2HjV+FENIFcGYJEyhkk+qKzKLRKOoQfCLkWlYrE+l2fawCChUMuzojIW9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9i5S4HSvoyGhcV8yGtS+0YOBlnucZLW/ePZulazI5MCgN6HWS
	0IVfq4QnGJJ4f1+iXs8iZACZu5h8h9fIf9klNq5qkRmnIFl/mCaHOWSB34nxmpbu2FfZoZdHnq+
	B+gjyA3SAbO7avmr8C9O0NKM/KnQRgi3cKDfqszac3JpneKqdt1WKsTe4JVYPnllTiODiHdvVRC
	enBx6OmHc=
X-Gm-Gg: ASbGncvYV679To1FCrgWMDgJtqq5NOG++K4C/wWg9WP+dJx7+YKO1J8tU02s2VDI2G+
	m652cupt4oHj5XT0EPqdP54ts9g4o/skHye5ds2HVzxwxOHVcDUqXvVXftLNU+0qZBdvzNPZ+sQ
	L8t2Hsyn5Xjj+f+otMJLpnEHm2Hmr+Yw6xQ+YOKB3IwoQuJ8g48xujohhJLfE7xdY1jjtG6W7tU
	/N4SYj21oWK7+67ETTq1fq7ntFV/vD2qinRgacjJbLw/oVtzb4AqAzfTQQ8TCoFYcqoDbNeeK7k
	qQuERdIUikbCTcEX8crFw3cS7Qfgz0Mf5WnmlrjVpFMVrdE8VfSfKyDp+9aBQCJ5UqsN9cS8f8C
	N/Q==
X-Received: by 2002:a05:600c:4e8a:b0:426:616e:db8d with SMTP id 5b1f17b1804b1-434d09c8d82mr61721545e9.15.1733326335241;
        Wed, 04 Dec 2024 07:32:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEb7/0Sfl8AEFPFKZdAI4JhxClmqbLkNFOBfmT1SL1leeMTssIvuPjhUD7G7e7bs7BrWskvZg==
X-Received: by 2002:a05:600c:4e8a:b0:426:616e:db8d with SMTP id 5b1f17b1804b1-434d09c8d82mr61721225e9.15.1733326334818;
        Wed, 04 Dec 2024 07:32:14 -0800 (PST)
Received: from ?IPV6:2003:cb:c70b:e100:38d6:8aa1:11b0:a20a? (p200300cbc70be10038d68aa111b0a20a.dip0.t-ipconnect.de. [2003:cb:c70b:e100:38d6:8aa1:11b0:a20a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d5280497sm27738255e9.23.2024.12.04.07.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 07:32:13 -0800 (PST)
Message-ID: <4919faec-3e35-459f-a7d3-b5b3f188bd9c@redhat.com>
Date: Wed, 4 Dec 2024 16:32:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] arm64 updates for 6.13-rc1
To: Catalin Marinas <catalin.marinas@arm.com>,
 Yang Shi <yang@os.amperecomputing.com>
Cc: Sasha Levin <sashal@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon
 <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241118100623.2674026-1-catalin.marinas@arm.com>
 <Z0STR6VLt2MCalnY@sashalap> <Z0TLhc3uxa5RnK64@arm.com>
 <0c09425b-c8ba-4ed6-b429-0bce4e7d00e9@os.amperecomputing.com>
 <Z0dhc-DtVsvufv-E@arm.com>
 <dc5e8809-825f-4c38-b487-b16c7d516311@os.amperecomputing.com>
 <e6b3e6c7-193d-43c4-a8c6-6023458723dd@redhat.com>
 <6aec1d44-4a89-4acf-a16b-4493626b93bb@os.amperecomputing.com>
 <Z1B1VS8PayXsXDzl@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z1B1VS8PayXsXDzl@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XRIbe6f448NOk3hb1HBsK8V1vSfL3-i307XXYk71lJA_1733326335
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_073220_133850_FEACF690 
X-CRM114-Status: GOOD (  22.93  )
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

On 04.12.24 16:29, Catalin Marinas wrote:
> On Mon, Dec 02, 2024 at 08:22:57AM -0800, Yang Shi wrote:
>> On 11/28/24 1:56 AM, David Hildenbrand wrote:
>>> On 28.11.24 02:21, Yang Shi wrote:
>>>>>> diff --git a/arch/arm64/mm/copypage.c b/arch/arm64/mm/copypage.c
>>>>>> index 87b3f1a25535..ef303a2262c5 100644
>>>>>> --- a/arch/arm64/mm/copypage.c
>>>>>> +++ b/arch/arm64/mm/copypage.c
>>>>>> @@ -30,9 +30,9 @@ void copy_highpage(struct page *to, struct
>>>>>> page *from)
>>>>>>          if (!system_supports_mte())
>>>>>>              return;
>>>>>> -    if (folio_test_hugetlb(src) &&
>>>>>> -        folio_test_hugetlb_mte_tagged(src)) {
>>>>>> -        if (!folio_try_hugetlb_mte_tagging(dst))
>>>>>> +    if (folio_test_hugetlb(src)) {
>>>>>> +        if (!folio_test_hugetlb_mte_tagged(src) ||
>>>>>> +            !folio_try_hugetlb_mte_tagging(dst))
>>>>>>                  return;
>>>>>>              /*
>>>>> I wonder why we had a 'return' here originally rather than a
>>>>> WARN_ON_ONCE() as we do further down for the page case. Do you seen any
>>>>> issue with the hunk below? Destination should be a new folio and not
>>>>> tagged yet:
>>>>
>>>> Yes, I did see problem. Because we copy tags for all sub pages then set
>>>> folio mte tagged when copying the data for the first subpage. The
>>>> warning will be triggered when we copy the second subpage.
>>>
>>> It's rather weird, though. We're instructed to copy a single page, yet
>>> copy tags for all pages.
>>>
>>> This really only makes sense when called from folio_copy(), where we are
>>> guaranteed to copy all pages.
>>>
>>> I'm starting to wonder if we should be able to hook into / overload
>>> folio_copy() instead, to just handle the complete hugetlb copy ourselves
>>> in one shot, and assume that copy_highpage() will never be called for
>>> hugetlb pages (WARN and don't copy tags).
>>
>> Actually folio_copy() is just called by migration. Copy huge page in CoW is
>> more complicated and uses copy_user_highpage()->copy_highpage() instead of
>> folio_copy(). It may start the page copy from any subpage. For example, if
>> the CoW is triggered by accessing to the address in the middle of 2M. Kernel
>> may copy the second half first then the first half to guarantee the accessed
>> data in cache.
> 
> Still trying to understand the possible call paths here. If we get a
> write fault on a large folio, does the core code allocate a folio of the
> same size for CoW or it starts with smaller ones? wp_page_copy()
> allocates order 0 AFAICT, though if it was a pmd fault, it takes a
> different path in handle_mm_fault(). But we also have huge pages using
> contiguous ptes.
> 
> Unless the source and destinations folios are exactly the same size, it
> will break many assumptions in the code above. Going the other way
> around is also wrong, dst larger than src, we are not initialising the
> whole dst folio.
> 
> Maybe going back to per-page PG_mte_tagged flag rather than per-folio
> would keep things simple, less risk of wrong assumptions.

I think the magic bit here is that for hugetlb, we only get hugetlb 
folios of the same size, and no mixtures.

-- 
Cheers,

David / dhildenb


