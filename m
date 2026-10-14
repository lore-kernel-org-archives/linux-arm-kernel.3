Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FDACC6B2C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 11:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WODyRHZCqpCFnY9ULeQ8aRVFdb2QnTT9smgYMgrQ/5o=; b=y44iRAS7ussAjeLqh85HDvt4HO
	yjWWNvjTsszp3NZ7nPTZJFtIp5y8isFgwi/P4lXI7nRh5OOweUje6/dTdJ6d7Z/hwcoSXO2RHE45U
	uTyTGJIfvRiEOLPCGaFF3kfycwD06nqfBAT7/k+f02Gd+sIAKIqP0Sdw6OdGI2QFAHCskqqO8Kazd
	GTTMA0i6uYxCvBwQLGEjwn9Te8TlmveHOpPTy87Uz1JQESF7caxCI1+r1AmSjkEG6fQ03BSuZJeui
	JRqFARbYLoFjRDEyqqOfqUgSKSSP0wscHSbL9OL2kfw5ENeVZNJETUeb69zA4nBvA2pga+L2/zpWz
	OunHyRBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwkf-0000000FH3b-37YY;
	Wed, 14 Oct 2026 11:02:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwka-0000000FH1N-0YBn
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 11:02:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WODyRHZCqpCFnY9ULeQ8aRVFdb2QnTT9smgYMgrQ/5o=; b=RRB0Z/V3hZ994Dc/4rjp5gEAWu
	xLLCNmsWXUqttLSiq8y+F1BneHZEDf9ONpluBngendV5mZVI+k1HB90Mvu/MNTXHFnAfGZ9JSiLMb
	T19PtlpQKdZykvJy5kCXJbE15Ltc5sB4zAKgnvXgTeoBCxr4C9mC62U3lQ5Izk4MYmDariI3p0H+q
	rWNn+RFS3dvN99qLVHvp5+lt+w3vV5YgCBqBdaa2vKIvI8TyEHqxIR04kVvLCcK95Zs+Z8Pfex6Uo
	6ZrQiZINPrKb/R6dO1Sb9LQX6fpI7CD1EnZGilCOdrmjVRCsIrVojecJ9wldUg2aqU2VconlTObzd
	oC9d6ujQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGwkW-0000000Gezz-3fv0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 11:02:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BFC671595;
	Wed, 14 Oct 2026 04:02:14 -0700 (PDT)
Received: from [10.164.19.62] (unknown [10.164.19.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 414993F673;
	Wed, 14 Oct 2026 04:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791975738; bh=oVNV5iMCm9Xg6NFTetIT77HNSLPF87+/20UvMr4ytKk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vvDFoElSzHAL7njvysTrWnNvK1GtCywEfeK9mwdUkPdlWjR25Zq/BQyZmqDvwvbw0
	 oeBbCutseoX+rcvFkBPEzdhk+v6NZrmCyMCI0/P+IW3Q2JPebR+H9x8kouSJavsQt2
	 hjGpBZtDcC3NjE+ByOKTUqA0EcsIv1XDwSL+o5lw=
Message-ID: <dd2cc3df-f8be-4263-9c33-cbf0f3343dbf@arm.com>
Date: Wed, 14 Oct 2026 16:32:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: restrict transparent contpte mappings to valid
 PTEs
To: Lance Yang <lance.yang@linux.dev>, Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: catalin.marinas@arm.com, will@kernel.org, ryan.roberts@arm.com,
 baolin.wang@linux.alibaba.com, mark.rutland@arm.com,
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261013093600.54995-1-zhaogongyi@bytedance.com>
 <20261013153953.77575-1-lance.yang@linux.dev>
 <516828fb-558d-4a20-9532-51f50d6ba042@bytedance.com>
 <0bbbe312-47a4-4eeb-8299-1f20daf4e949@arm.com>
 <44aba42f-0355-4643-826f-0c7abec4499c@linux.dev>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <44aba42f-0355-4643-826f-0c7abec4499c@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_120221_337339_6B38DC86 
X-CRM114-Status: GOOD (  14.84  )
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



On 14/10/26 4:15 pm, Lance Yang wrote:
> 
> 
> On 2026/10/14 18:03, Dev Jain wrote:
>>
>>
>> On 14/10/26 12:01 pm, Zhao Gongyi wrote:
>>> On 10/13/26 11:39 PM, Lance Yang wrote:
>>>>>
>>>>> +    /*
>>>>> +     * Keep the producer-side invariant documented in pgtable.h true even
>>>>> +     * if a direct caller passes an invalid descriptor with PTE_CONT set.
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
>>>> rather add a VM_WARN_ON() to catch that. Silently clearing the bit would
>>>> hide a caller bug :)
>>>>
>>>
>>> Hi Lance,
>>>
>>> Thanks for taking a look.
>>>
>>> Yes, you are right. The public set_ptes() wrapper already strips PTE_CONT
>>> before calling contpte_set_ptes(), so the pte_mknoncont() in the invalid
>>> path is unnecessary for the current in-tree path.
>>>
>>> The issue I was trying to avoid is not that the incoming pte already has
>>> PTE_CONT set, but that contpte_set_ptes() rebuilds the pte from pfn/prot
>>> and then adds PTE_CONT again based on alignment. For an invalid descriptor,
>>> that transparent contiguous encoding should be skipped entirely.
>>>
>>> So your suggested shape makes sense to me. I will change this to return
>>> through __set_ptes() directly for invalid descriptors, and add a warning
>>> for any unexpected direct caller that passes an invalid PTE with PTE_CONT
>>> set, e.g.:
>>>
>>>     if (!mm_is_user(mm) || !pte_valid(pte)) {
>>>         VM_WARN_ON_ONCE(!pte_valid(pte) && pte_cont(pte));
>>
>> set_ptes does pte_mknoncont(), so the warning will *never* fire I think?
> 
> YES. Just a sanity check to catch a future direct caller passing
> a !pte_valid PTE with PTE_CONT set, rather than silently clearing
> the bit :)

Ah okay you said "future direct caller". I got confused since if the only
caller is set_ptes() then the warning is useless by construction.


> 
> Cheers, Lance
> 
>>
>>>         return __set_ptes(mm, addr, ptep, pte, nr);
>>>     }
>>>
>>> That keeps the fix focused on not creating new invalid contpte entries,
>>> while still catching a bad direct caller instead of silently sanitizing it.
>>>
>>> Thanks,
>>> Zhao
>>
> 


