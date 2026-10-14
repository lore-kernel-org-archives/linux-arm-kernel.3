Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48110CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 06:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyOVQO2Ag1zGISI6pO5VoA/zNNqmIYt5vkvpyI+5aQ4=; b=Lj+XVSaVZgMmvct58+70CKlT1y
	v1Hnjb3K3cqaJpA18rkhS83vohhMl9uS8D2qtBpKxBfMIqKPMO0V33pFKPOy1LkWqq+qUYAtUtaoe
	OnREsNfVVkSCgYpG9A3rCYOHhXM+uXmO5R6Gm7k2uRrBosB9+esmAQmUg0Kx79LD515Pg15zDIMOv
	ZGtxRkamYXuD6VD2c0LIhg9ZZRE00HuIrZz4LjZAi1X2QCcUB70jGjqnjb1ogdKERk4qTAs43+jj+
	6Vh+siphKpRJpyKrSROmVvO2OSqYeIdBW/fad+MeoVwdoq/1LA7oHvPxaPxJgP7HokQrJ7akLp0RZ
	x7AqbK/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsl7-0000000EeSg-2Um6;
	Wed, 14 Oct 2026 06:46:41 +0000
Received: from out-187.mta0.migadu.com ([2001:41d0:1004:224b::bb] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsl2-0000000EePo-2aFF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 06:46:41 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=JLmTAoue8gGf1ERWgAb5UXzBAVBda1/ywkl4q8ms6rw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791960394; v=1; x=1792565194;
 b=XduXr+NWEQc2k1ced2e4wi+9s8WN76WAicldStKItAcufoJI3wVXZKFuaTRVUBF7ND96HqvN
 R0eN5dIVH8BZYV8hJprCPN82Jcgo77XC6FmBjysbkspL0JlH5jDAJN1pNq1vsLzkIQt/NFOchYo
 W3JiTblzWUaZR9iCpLyqRV+0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b9d4fb5be1186799;
	Wed, 14 Oct 2026 06:46:34 +0000
X-Mizu-Trace-ID: b9d4fb5be1186799
X-Migadu-Flow: FLOW_OUT
Message-ID: <f111bec5-6148-4649-8805-79a250f6e736@linux.dev>
Date: Wed, 14 Oct 2026 14:46:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: restrict transparent contpte mappings to valid
 PTEs
Content-Language: en-US
To: Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: catalin.marinas@arm.com, will@kernel.org, ryan.roberts@arm.com,
 dev.jain@arm.com, baolin.wang@linux.alibaba.com, mark.rutland@arm.com,
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261013093600.54995-1-zhaogongyi@bytedance.com>
 <20261013153953.77575-1-lance.yang@linux.dev>
 <516828fb-558d-4a20-9532-51f50d6ba042@bytedance.com>
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <516828fb-558d-4a20-9532-51f50d6ba042@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_234636_796790_F07BECA6 
X-CRM114-Status: GOOD (  17.39  )
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



On 2026/10/14 14:31, Zhao Gongyi wrote:
> On 10/13/26 11:39 PM, Lance Yang wrote:
>>>
>>> +	/*
>>> +	 * Keep the producer-side invariant documented in pgtable.h true even
>>> +	 * if a direct caller passes an invalid descriptor with PTE_CONT set.
>>> +	 */
>>> +	if (!pte_valid(pte))
>>> +		return __set_ptes(mm, addr, ptep, pte_mknoncont(pte), nr);
>>
>> set_ptes() is the only in-tree caller, and it already clears PTE_CONT
>> before we get here ... no? Why not fold !pte_valid(pte) into the
>> !mm_is_user(mm) check below and return __set_ptes() directly?
>>
>> 	if (!mm_is_user(mm) || !pte_valid(pte))
>> 		return __set_ptes(mm, addr, ptep, pte, nr);
>>
>> If a direct caller does pass a !pte_valid PTE with PTE_CONT set, I'd
>> rather add a VM_WARN_ON() to catch that. Silently clearing the bit would
>> hide a caller bug :)
>>
> 
> Hi Lance,
> 
> Thanks for taking a look.

Cheers!

> Yes, you are right. The public set_ptes() wrapper already strips PTE_CONT
> before calling contpte_set_ptes(), so the pte_mknoncont() in the invalid
> path is unnecessary for the current in-tree path.
> 
> The issue I was trying to avoid is not that the incoming pte already has
> PTE_CONT set, but that contpte_set_ptes() rebuilds the pte from pfn/prot
> and then adds PTE_CONT again based on alignment. For an invalid descriptor,
> that transparent contiguous encoding should be skipped entirely.
> 
> So your suggested shape makes sense to me. I will change this to return
> through __set_ptes() directly for invalid descriptors, and add a warning
> for any unexpected direct caller that passes an invalid PTE with PTE_CONT
> set, e.g.:
> 
> 	if (!mm_is_user(mm) || !pte_valid(pte)) {
> 		VM_WARN_ON_ONCE(!pte_valid(pte) && pte_cont(pte));
> 		return __set_ptes(mm, addr, ptep, pte, nr);
> 	}
> 
> That keeps the fix focused on not creating new invalid contpte entries,
> while still catching a bad direct caller instead of silently sanitizing it.

Thanks for the quick fix! Nothing jumped out at me :)

With that:

Tested-by: Lance Yang <lance.yang@linux.dev>

