Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4578C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 12:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CSM+xsLRR8t8oHg3+ns7VNMTZ2Y65IgzMEIbGy6i6sU=; b=kaZkvYVaBXC5G0GpCY80/8ocnU
	qKcQSFWzI9XiEj5BlBK2+0MPN/ZFicFeCYAlRLpTqlvoDJ864coJisQ6GbIcHoNdqvdlcPBiwXl/P
	ufAbvZxCVSgRJk9pH8LJCEmj0ZaJyA/3cwzeeT09QQ0U/shv3zoYDp9fnDDTFVvBV04DMmFRfHg+G
	UOCvbXqUO868qLbiRcqXUL5/H6dof/nyQoCZz9IRmwyZIpzyqeUVPP/w0t/x6X1xW6y5AM5kejWyi
	cakYhgXUhbFpw7gnwMsvXVekZHrb74NwgIFfZS1fN7QSiOzjrswYT+bS5EPvJxCjvt3mttEUu7+xF
	nyZGV7Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH00a-00000009Dfu-277Q;
	Mon, 19 May 2025 12:54:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzxH-00000009DEl-3Irl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 12:50:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747659054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CSM+xsLRR8t8oHg3+ns7VNMTZ2Y65IgzMEIbGy6i6sU=;
	b=MaMR9Np1tzfoMfVgWr429PXbdf2Rcu+Q2Fbi2VPZ3NRKiAXjzgSOP+cRB8+Du8PRAdzFHd
	EfLwDLSuU0zNIw1kLzsZN0ERQQQdeF1MtyAXylN/Uzi4D6fUVYN42mCHmrYKtezr+S7ydx
	U/SKz76mUvXKvG3LHXJIHN2mogy4/2c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-TC-oOyHWOF6D98zYw6iZ2A-1; Mon, 19 May 2025 08:50:53 -0400
X-MC-Unique: TC-oOyHWOF6D98zYw6iZ2A-1
X-Mimecast-MFC-AGG-ID: TC-oOyHWOF6D98zYw6iZ2A_1747659052
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a35c8a7fd9so1592286f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 05:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747659052; x=1748263852;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CSM+xsLRR8t8oHg3+ns7VNMTZ2Y65IgzMEIbGy6i6sU=;
        b=Opc7Mx1Ml9o5fiyaGQqorvLlVVP6kL53WqPZ7SaN37OxWRLKXAruTZI760iOOPqoy0
         whZ1Qoypf6PSUiak41r9qWoaAj13X/+IXZZDl0ENrCapnMhhu4Ro3Cg1/7kwCzc7vW4R
         slXOXtHkjW7M3wKiGCGuCfSmRQAo6WN7huy1/QyfiKNIyOc9RPM4aHxH8K/M0UiDD3hL
         CEvo63/vM30+vzfzY2F+aKjHyYRrsBuHCuF1ORNMMXvMr1eXXtGjyJVKwX1c0hw9DnCk
         S/NXEU5XdeMoupKQp9UHfSI9kSYivUWx4bIFFkyBZRzaX1qO60Gas+KsqGy6q2jRYGg/
         kBbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUg+Ixc4/hMrOJj394kM7IZtJJzIJYugAN6sDDVbSx1/JiuIpTEBIIjg4HG4htSOA7OXA5chDLMCVRzZoK0Zh7I@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1x9aEfAgRakpE+OzQzg9ZA/XZuMH4URcpv+VPfQMXWcZ4YPak
	pT8IewMDfZiMZpXcKHZPHqNv9NPlqQBEKr5QPRfoLzljGqkOfRi45Nsu9JnX5uE1qR894rWR2RA
	1fSD2xorXY7Skm4t0iG15E2sbalyUIVJruCk8MZW2NODuE07lFoF4PNKXBMGkKJPgc3RKbz+SLt
	cZ
X-Gm-Gg: ASbGncvoYgAQ/iHmGPuqwzmj6vmx4LlEOPDf2w/mWdH/qfluU72E24Jz7MsNvKDF75e
	a6OpKNIjLHB8bm1tViUzivp+uBET8jil7dq4um8kcZ21B43IF47sTQXZinh+EfViCqm10uvPaAP
	qgmFrrOIZ7QrMkP4b3ItgJuwScQzeFZDRx4MMaPFKgF2GnDM23FZ1nHngeeqNfcG9e1YUmY8QnP
	4Nqn5KBASuWOSddUOOMogbcuCOTk9lyo7zQFtPo7L7+/Lvt2FAYrlSGub+FSeIsflNoXu+X/dcf
	sFhYutBulawoqKtcnfxFOm2C92+1QwWhJWA9djq2dJ/hmETim0lFa6zQAiATEAubbCfhAx65b6A
	zHLHlvhC9RkYTYN1u0GNNO8MFH3zVANhSsUACr1w=
X-Received: by 2002:a5d:64cb:0:b0:3a3:695e:be9c with SMTP id ffacd0b85a97d-3a3695ebfecmr5721209f8f.29.1747659052236;
        Mon, 19 May 2025 05:50:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDotwhFaakwPRUdWq8AFa+Tq7ICG1tprHpjj+2pKF76FGQmddVoYAfDb3sBwBy0ov2mkSIpA==
X-Received: by 2002:a5d:64cb:0:b0:3a3:695e:be9c with SMTP id ffacd0b85a97d-3a3695ebfecmr5721188f8f.29.1747659051886;
        Mon, 19 May 2025 05:50:51 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3c:3a00:5662:26b3:3e5d:438e? (p200300d82f3c3a00566226b33e5d438e.dip0.t-ipconnect.de. [2003:d8:2f3c:3a00:5662:26b3:3e5d:438e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a36a83b63bsm6795831f8f.97.2025.05.19.05.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 05:50:51 -0700 (PDT)
Message-ID: <04c32758-af9b-492a-909a-ad1bc6c0777d@redhat.com>
Date: Mon, 19 May 2025 14:50:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: Restrict pagetable teardown to avoid false
 warning
To: Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 catalin.marinas@arm.com, will@kernel.org
Cc: anshuman.khandual@arm.com, mark.rutland@arm.com,
 yang@os.amperecomputing.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
References: <20250518095445.31044-1-dev.jain@arm.com>
 <5763d921-f8a8-4ca6-b5b5-ad96eb5cda11@arm.com>
 <7680e775-d277-45ea-9b6c-1f16b8b55a3f@redhat.com>
 <df7eb016-bea4-489d-aecb-1a47eb5e33b2@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <df7eb016-bea4-489d-aecb-1a47eb5e33b2@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bNApQvjLLe89heKyJHxs9f1eV3niCQOvJsNkgAUGm-c_1747659052
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_055055_896310_5B4AD4F4 
X-CRM114-Status: GOOD (  20.03  )
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

On 19.05.25 14:47, Ryan Roberts wrote:
> On 19/05/2025 13:16, David Hildenbrand wrote:
>> On 19.05.25 11:08, Ryan Roberts wrote:
>>> On 18/05/2025 10:54, Dev Jain wrote:
>>>> Commit 9c006972c3fe removes the pxd_present() checks because the caller
>>>
>>> nit: please use the standard format for describing commits: Commit 9c006972c3fe
>>> ("arm64: mmu: drop pXd_present() checks from pXd_free_pYd_table()")
>>>
>>>> checks pxd_present(). But, in case of vmap_try_huge_pud(), the caller only
>>>> checks pud_present(); pud_free_pmd_page() recurses on each pmd through
>>>> pmd_free_pte_page(), wherein the pmd may be none. Thus it is possible to
>>>> hit a warning in the latter, since pmd_none => !pmd_table(). Thus, add
>>>> a pmd_present() check in pud_free_pmd_page().
>>>>
>>>> This problem was found by code inspection.
>>>>
>>>> This patch is based on 6.15-rc6.
>>>
>>> nit: please remove this to below the "---", its not part of the commit log.
>>>
>>>>
>>>> Fixes: 9c006972c3fe (arm64: mmu: drop pXd_present() checks from
>>>> pXd_free_pYd_table())
>>>>
>>>
>>> nit: remove empty line; the tags should all be in a single block with no empty
>>> lines.
>>>
>>>> Cc: <stable@vger.kernel.org>
>>>> Reported-by: Ryan Roberts <ryan.roberts@arm.com>
>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>> ---
>>>> v1->v2:
>>>>    - Enforce check in caller
>>>>
>>>>    arch/arm64/mm/mmu.c | 3 ++-
>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>>> index ea6695d53fb9..5b1f4cd238ca 100644
>>>> --- a/arch/arm64/mm/mmu.c
>>>> +++ b/arch/arm64/mm/mmu.c
>>>> @@ -1286,7 +1286,8 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>>>>        next = addr;
>>>>        end = addr + PUD_SIZE;
>>>>        do {
>>>> -        pmd_free_pte_page(pmdp, next);
>>>> +        if (pmd_present(*pmdp))
>>>
>>> pmd_free_pte_page() is using READ_ONCE() to access the *pmdp to ensure it can't
>>> be torn. I suspect we don't technically need that in these functions because
>>> there can be no race with a writer.
>>
>> Yeah, if there is no proper locking in place the function would already
>> seriously mess up (double freeing etc).
> 
> Indeed; there is no locking, but this portion of the vmalloc VA space has been
> allocated to us exclusively, so we know there can be no one else racing.
> 
>>
>>> But the arm64 arch code always uses
>>> READ_ONCE() for dereferencing pgtable entries for safely. Perhaps we should be
>>> consistent here?
>>
>> mm/vmalloc.c:   if (pmd_present(*pmd) && !pmd_free_pte_page(pmd, addr))
> 
> Yes, I saw that. I know that we don't technically need READ_ONCE(). I'm just
> proposng that for arm64 code we should be consistent with what it already does.
> See Commit 20a004e7b017 ("arm64: mm: Use READ_ONCE/WRITE_ONCE when accessing
> page tables")

The more READ_ONCE() we add, the less the compiler can optimize (e.g., 
when inlining). Apparently, for no good reason in this page table 
handling code, because there cannot be concurrent changes that would 
turn it !present etc.

Anyhow, something for the arm maintainers to decide.

-- 
Cheers,

David / dhildenb


