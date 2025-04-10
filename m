Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8718AC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 01:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jPMbdDQCy877Twejqn2c7U/+9GGeSPvDHf2gAJVOtu4=; b=pdnWzbPXs9O0pbYzLgayvBKwO0
	178ML/wKHf4Ge2mswUvdbv4fS6kAZPp4PiyQNT0mBLOUkMgC+uAaOu7+m8ywmhsfDzW6UnWB97BSY
	fe6HAxM2xz31ALEdxZD24L8QcGTx5ldmEGMT2oaGfCVC0mEkxw10fc/r08AkgtvT/DTYky2CFJxBy
	w7qCLDROA8N1s10AIhRDvJx3Q3VQBBCZ5uE/6y8ulK2fVBdQwaR3MFRhbnrrU/cfDRH3miXqpOguT
	4sZlhr/2L2oe03v5SweZ/MW5n8vggtgEcXaTJAVvu15GjH/X73hRPUtRNWe1YqyGdojEL5auTW8U5
	5qP6gnpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gHj-00000008sO2-3S2z;
	Thu, 10 Apr 2025 01:00:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gFv-00000008s48-47gn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 00:59:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744246735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jPMbdDQCy877Twejqn2c7U/+9GGeSPvDHf2gAJVOtu4=;
	b=ACnPQ/Y5A8Lhf+fkgV9CeLvjFGqJnoeQs4ZZsmNpIEgNu+p7Dt2LPxhCq3cU9llHZVNlAA
	rpzGDuDK3T6O3o5g/Yt2HnNTVXyY+DFAy0e61EFcmtidpUFJux4KsPmPgM9c8Rc2rnFD04
	mmDOuXQMHNF4mUvNSI4AfIJB+wwDpKs=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-9E8SmvaCP8aAEGnRBNy8iA-1; Wed, 09 Apr 2025 20:58:53 -0400
X-MC-Unique: 9E8SmvaCP8aAEGnRBNy8iA-1
X-Mimecast-MFC-AGG-ID: 9E8SmvaCP8aAEGnRBNy8iA_1744246733
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-225ab228a37so2223345ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 17:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246732; x=1744851532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jPMbdDQCy877Twejqn2c7U/+9GGeSPvDHf2gAJVOtu4=;
        b=K1wIvL6EQ1pi3V70SnDGybSEVPFLy1/sWAM3iSfv9E+QFihfw2qRjhz3HUgwhNdDqI
         sm3vsLjkeMrVyBaeHY3FF7YqNY7r/vVNch5ZHCWkADLok9Oz4nGhWHi5Zzet+thrAB42
         GfmVLnGuLWoKWw35nvBUgL2QPvgCs74anzz0NVpg/zQwTtVkuqo+g9suMGMheE5dfM/f
         lDvzkupxe6msGuAaAT2pNBTAgQV6OxTLmhpFhHNZakifWZnK669TS21JMrhvvqNALqbP
         tXC/sffyMNOeZFK0ItuqGTUSSnWoYgrpkuKWeTgCkUgeqbobi8nXgz1S7zmG5DJiV1cO
         738g==
X-Forwarded-Encrypted: i=1; AJvYcCXZv4w27yMVxktenFijTuCZKe6WQukNg6ODmtPdrsovFssOCHMnsRdO614UEKSt5QiX0qZL1okJMyX15c17rg2p@lists.infradead.org
X-Gm-Message-State: AOJu0Yya4IOok2BknxiKxs7Vr0znd+X3ZAo2LKm//g1WJfWrZfNxzwZz
	QMmxEK28heqQXwgPE5TtaZUnYeKmmVbKqBm/xx0WjILLVBROqWzRyJOSOyw6SpkGH6jmeyhFUVC
	3xsPNQlQux3f4UiZ8+r9yobaCV8/oMAqA3M4Hfrka7v1Kl4o/yzUhK7WDY2V6dPf4bkfsXmAM
X-Gm-Gg: ASbGnctZXWzW32LzE7eDpXvoZSykqNZ7ubMMGK4A5aDEXY58d6RLf8gYp0E/fgAuxxJ
	HyGqQwxLOxgnMsr35h/ShRSNN4IWG5MwC0EAN5KNI7EMtt0HOxQM4/nTElBAavN8ViKvw6WVEOY
	fIS5d18FdRxul6/6paBWJRMrPBcZ4Y67aJvkbTrXyzLY/arrVLbkhlFPOeSd+dVZDpzHaW2HKIz
	OJtrtZGy5drrMANi+1qboiE/58xlqtBwYzdu552ghxlyH3CS/hRDAlXbdt1ja4661SRMr9hkx/Y
	Vb5XhpL4fB8Z
X-Received: by 2002:a17:902:f60b:b0:227:e980:919d with SMTP id d9443c01a7336-22b42c2d722mr13182235ad.47.1744246732597;
        Wed, 09 Apr 2025 17:58:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IER3K6q+KgZNHdXcPwt0+rY/1N6mq4yTEK+NRxfJiUeeJBOWfelPSBqxXdcgQCSVYvoNet3jw==
X-Received: by 2002:a17:902:f60b:b0:227:e980:919d with SMTP id d9443c01a7336-22b42c2d722mr13182115ad.47.1744246732259;
        Wed, 09 Apr 2025 17:58:52 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccbf2bsm18663945ad.245.2025.04.09.17.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 17:58:51 -0700 (PDT)
Message-ID: <3a9c1db1-7598-4f71-be62-f6005e3fec72@redhat.com>
Date: Thu, 10 Apr 2025 10:58:46 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] mm/contpte: Optimize loop to reduce redundant
 operations
To: Xavier <xavier_qy@163.com>
Cc: dev.jain@arm.com, akpm@linux-foundation.org, baohua@kernel.org,
 ryan.roberts@arm.com, catalin.marinas@arm.com, ioworker0@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 will@kernel.org
References: <027cc666-a562-46fa-bca5-1122ea00ec0e@arm.com>
 <20250408085809.2217618-1-xavier_qy@163.com>
 <20250408085809.2217618-2-xavier_qy@163.com>
 <34a4bf01-6324-482b-a011-32974d68e02f@redhat.com>
 <711cf430.b25d.1961b1a1b0e.Coremail.xavier_qy@163.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <711cf430.b25d.1961b1a1b0e.Coremail.xavier_qy@163.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tEuNwiJCxoYuWRDoNNQuhQhR0XzS1aLeVByJbRMhLMQ_1744246733
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_175900_112901_894F05F6 
X-CRM114-Status: GOOD (  35.77  )
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

Hi Xavier,

On 4/10/25 1:10 AM, Xavier wrote:
> 
> Thank you for carefully reviewing this patch and raising your questions.
> I'll try to explain and answer them below.
> 

Not a problem :)

> 
> At 2025-04-09 12:09:48, "Gavin Shan" <gshan@redhat.com> wrote:
>> Hi Xavier,
>>
>> On 4/8/25 6:58 PM, Xavier wrote:
>>> This commit optimizes the contpte_ptep_get function by adding early
>>>    termination logic. It checks if the dirty and young bits of orig_pte
>>>    are already set and skips redundant bit-setting operations during
>>>    the loop. This reduces unnecessary iterations and improves performance.
>>>
>>> Signed-off-by: Xavier <xavier_qy@163.com>
>>> ---
>>>    arch/arm64/mm/contpte.c | 22 ++++++++++++++++++++--
>>>    1 file changed, 20 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
>>> index bcac4f55f9c1..034d153d7d19 100644
>>> --- a/arch/arm64/mm/contpte.c
>>> +++ b/arch/arm64/mm/contpte.c
>>> @@ -152,6 +152,18 @@ void __contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
>>>    }
>>>    EXPORT_SYMBOL_GPL(__contpte_try_unfold);
>>>    
>>
>> I'm wandering how it can work. More details are given below.
>>
>>> +#define CHECK_CONTPTE_FLAG(start, ptep, orig_pte, flag) \
>>> +	do { \
>>> +		int _start = start; \
>>> +		pte_t *_ptep = ptep; \
>>> +		while (_start++ < CONT_PTES) { \
>>> +			if (pte_##flag(__ptep_get(_ptep++))) { \
>>> +				orig_pte = pte_mk##flag(orig_pte); \
>>> +				break; \
>>> +			} \
>>> +		} \
>>> +	} while (0)
>>> +

nit: the variable _start and _ptep can be dropped since the caller is going to
bail after CHECK_CONTPTE_FLAG(). However, I'm wandering it's going to introduce
burden to contpte_ptep_get() for its readability, much more complex than I
thought.

>>
>> CONT_PTES is 16 with the assumption of 4KB base page size. CHECK_CONTPTE_FLAG()
>> collects the flag for ptep[start, CONT_PTES].
>>
>>>    pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>>>    {
>>>    	/*
>>> @@ -169,11 +181,17 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>>>    	for (i = 0; i < CONT_PTES; i++, ptep++) {
>>>    		pte = __ptep_get(ptep);
>>>    
>>> -		if (pte_dirty(pte))
>>> +		if (pte_dirty(pte)) {
>>>    			orig_pte = pte_mkdirty(orig_pte);
>>> +			CHECK_CONTPTE_FLAG(i, ptep, orig_pte, young);
>>> +			break;
>>> +		}
>>>    
>>> -		if (pte_young(pte))
>>> +		if (pte_young(pte)) {
>>>    			orig_pte = pte_mkyoung(orig_pte);
>>> +			CHECK_CONTPTE_FLAG(i, ptep, orig_pte, dirty);
>>> +			break;
>>> +		}
>>>    	}
>>>    
>>>    	return orig_pte;
>>
>> There are two issues as I can see: (1) The loop stops on any dirty or young flag. Another
>> flag can be missed when one flag is seen. For example, when ptep[0] has both dirty/young
>> flag, only the dirty flag is collected. (2) CHECK_CONTPTE_FLAG() iterates ptep[i, CONT_PTES],
>> conflicting to the outer loop, which iterates ptep[0, CONT_PTES].
> 
> No flags will be missed. The outer loop is used to check for the first flag,
> which could be either the dirty or young flag.
> Once this flag (let's assume it's the dirty flag) is found in the i-th PTE,
> the dirty flag of orig_pte will be set, and the code will immediately enter
> the inner loop, namely CHECK_CONTPTE_FLAG. This inner loop will continue
> to check only for the young flag starting from the i-th position, and we needn't
> concern about the dirty flag anymore.
> If CHECK_CONTPTE_FLAG finds the young flag in the j-th PTE, the young flag
> of orig_pte will be set. At this point, both the young and dirty flags of
> orig_pte have been set, and there's no need for further loop judgments, so
> the both the inner and outer loops can be exited directly. This approach
> reduces unnecessary repeated traversals and judgments.
> 

Thanks for the explanation. I missed that the subsequent young bit is collected
on pte_dirty(). Similarly, the subsequent dirty bit is collected on pte_young().
Now I can see all (dirty | young) bits are collected with a lost.

>>
>> Besides, I also doubt how much performance can be gained by bailing early on (dirty | young).
>> However, it's avoided to cross the L1D cache line boundary if possible. With 4KB base page
>> size, 128 bytes are needed for ptep[CONT_PTES], equal to two cache lines. If we can bail
>> early with luck, we don't have to step into another cache line. Note that extra checks needs
>> more CPU cycles.
> 
> Compared to the previous function, this code doesn't add any extra checks.
> Even in the worst-case scenario, where neither a dirty nor a young flag is
> found among the 16 PTEs, the number of checks is the same as in the original
> function. If any flag is found earlier, the optimized patch will reduce the
> number of subsequent checks for that flag compared to the original code.
> 

There are 32 checks in the original code (assuming we have 4kb base page size
and CONT_PTES == 16) and the number of checks is fixed. With your patch applied,
the number becomes 32 + (number from CHECK_CONTPTE_FLAG) if all PTEs have
pte_dirty() and none of them has pte_young(), if I don't miss anything here.


> I'm not sure if my explanation is clear. If you have any further questions,
> feel free to communicate with me again.
> 

Thanks for the explanation, helped me to understand how all (dirty|young) bits
are collected without a lost.

Thanks,
Gavin


