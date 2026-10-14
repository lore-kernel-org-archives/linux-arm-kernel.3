Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA78CCC6B1F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 09:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rVBZSWzhmTgsQbjaqm+RNdeGA3BriAh5gCRFbByzJ/o=; b=DxWMXJI6bMJiH0cAliWoOIVJ/P
	+wzvVwE7TSCBU/h8e0SbKsft6drwuSPNSwGjAUek/L1yeShcWU4mJRVsqvLxZtRsc2NwgMHDBMu8+
	EidL8U+FH94pvwbxYoY+0LFuNBoqV/YnT41fSd1h+lEuA64k1guwq2lPhy6ZOGcwqn9ob6P+Vdf+Y
	/lLsCSL8XpU3TKP8Ko9i6cNwnRENZ29JALCz4MH8V2J7AqPmtF+pmDEtY1REhMUCytVyA781gBbMt
	jPlMXGxohczyiZkGtz3wBcyIe12iPH6xcElwQ+f44jW2zK6QmsLoyICfztaC29eW/PjkbLjBDIHL7
	06x4tpjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvDs-0000000F1Qz-0cHz;
	Wed, 14 Oct 2026 09:24:32 +0000
Received: from out-114.mta1.migadu.com ([2001:41d0:203:375::72] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvDo-0000000F1Pj-0U5u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 09:24:30 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=9Rp6gok1+Kio/TSq1E9OFvpUWzUtlcEW1k6DFeMPFSc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791969866; v=1; x=1792574666;
 b=QsAt5ZEclRMMg12FhNOY82qAWJ43LLKUyGzqS4fUrOpY2hevdQaeubEMXxB/gT+X9a/DMywM
 ImjsyePcYO+M+dJNxL4/8ba7gQIOVXkPxbO15BPSuiMJ4vDSUkx8SSKT5S7XHUuMmGnLe/V8kZJ
 eydlowQxz6sJpXiH1mKOqIkY=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f4836833ee7be581;
	Wed, 14 Oct 2026 09:24:25 +0000
X-Mizu-Trace-ID: f4836833ee7be581
X-Migadu-Flow: FLOW_OUT
Message-ID: <cb63eec0-4c39-49cb-89c7-15639f51a710@linux.dev>
Date: Wed, 14 Oct 2026 17:24:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: restrict transparent contpte mappings to valid
 PTEs
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: catalin.marinas@arm.com, will@kernel.org, ryan.roberts@arm.com,
 dev.jain@arm.com, mark.rutland@arm.com, akpm@linux-foundation.org,
 david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261013093600.54995-1-zhaogongyi@bytedance.com>
 <20261013153953.77575-1-lance.yang@linux.dev>
 <516828fb-558d-4a20-9532-51f50d6ba042@bytedance.com>
 <f111bec5-6148-4649-8805-79a250f6e736@linux.dev>
 <a6feb3f1-c08d-4d54-a38b-55fafcfec7b8@linux.alibaba.com>
Content-Language: en-US
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <a6feb3f1-c08d-4d54-a38b-55fafcfec7b8@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_022428_303869_C176CD81 
X-CRM114-Status: GOOD (  14.60  )
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



On 2026/10/14 16:38, Baolin Wang wrote:
> 
> 
> On 10/14/26 2:46 PM, Lance Yang wrote:
>>
>>
>> On 2026/10/14 14:31, Zhao Gongyi wrote:
>>> On 10/13/26 11:39 PM, Lance Yang wrote:
>>>>>
>>>>> +    /*
>>>>> +     * Keep the producer-side invariant documented in pgtable.h 
>>>>> true even
>>>>> +     * if a direct caller passes an invalid descriptor with 
>>>>> PTE_CONT set.
>>>>> +     */
>>>>> +    if (!pte_valid(pte))
>>>>> +        return __set_ptes(mm, addr, ptep, pte_mknoncont(pte), nr);
>>>>
>>>> set_ptes() is the only in-tree caller, and it already clears PTE_CONT
>>>> before we get here ... no? Why not fold !pte_valid(pte) into the
>>>> !mm_is_user(mm) check below and return __set_ptes() directly?
>>>>
>>>>     if (!mm_is_user(mm) || !pte_valid(pte))
>>>>         return __set_ptes(mm, addr, ptep, pte, nr);
>>>>
>>>> If a direct caller does pass a !pte_valid PTE with PTE_CONT set, I'd
>>>> rather add a VM_WARN_ON() to catch that. Silently clearing the bit 
>>>> would
>>>> hide a caller bug :)
>>>>
>>>
>>> Hi Lance,
>>>
>>> Thanks for taking a look.
>>
>> Cheers!
>>
>>> Yes, you are right. The public set_ptes() wrapper already strips 
>>> PTE_CONT
>>> before calling contpte_set_ptes(), so the pte_mknoncont() in the invalid
>>> path is unnecessary for the current in-tree path.
>>>
>>> The issue I was trying to avoid is not that the incoming pte already has
>>> PTE_CONT set, but that contpte_set_ptes() rebuilds the pte from pfn/prot
>>> and then adds PTE_CONT again based on alignment. For an invalid 
>>> descriptor,
>>> that transparent contiguous encoding should be skipped entirely.
>>>
>>> So your suggested shape makes sense to me. I will change this to return
>>> through __set_ptes() directly for invalid descriptors, and add a warning
>>> for any unexpected direct caller that passes an invalid PTE with 
>>> PTE_CONT
>>> set, e.g.:
>>>
>>>     if (!mm_is_user(mm) || !pte_valid(pte)) {
>>>         VM_WARN_ON_ONCE(!pte_valid(pte) && pte_cont(pte));
> 
> mprotect() can trigger the warning here when setting PAGE_NONE for a 
> batch of PTEs?

Nope. set_ptes() clears PTE_CONT before calling contpte_set_ptes().
PAGE_NONE makes !pte_valid(pte) true, but pte_cont(pte) is false,
so the warning won't fire :)

>>>         return __set_ptes(mm, addr, ptep, pte, nr);
> 
> I am trying to convince myself that the 'nr' passed in is always 
> CONT_PTE_SIZE aligned, but it seems OK.

Still nope :)

IIRC, any partially covered contpte block should already be unfolded
by the time we get here ...

We're just installing PTEs without PTE_CONT into cleared entries,
so nr doesn't need to be aligned to CONT_PTES.

Cheers, Lance

