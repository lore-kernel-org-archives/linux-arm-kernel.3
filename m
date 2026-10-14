Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0D8CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 06:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Mime-Version:From:
	In-Reply-To:Message-Id:Date:Subject:To:Cc:Content-Transfer-Encoding:
	References:Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1JmrvG8Wxu6YtXiksiU23e1HswNsSn5IxgMS7VCL0AQ=; b=NhwRheIEudFyqUbk0hb3IgrOGy
	ixWAODKJk16Zy4YNXvZveglw/XSrUFcmbIp/FU/Nnl2SeoTYK+BX/A+zm47kvoyUYQo43EJGL/Q5x
	6y7uyvxff92HifXJu86rcEpFANFxumK7gnD6Hs7bQKmudduZUJqU5AEiq1PmQxsG2j2JQ01jaGIP7
	oJhZfRJ2YBjPjiQgjr9YkeeO6OMCXBXYoXZaa7Erksarmo3UqHP6Isjqy1XVKhYLpXO85p71Nbkkw
	ts4k87F5jR5BaCX1yV8UQXwn/Y/OHDqmf5PTWAdqUtjYHyW7i9yMaUy2fDL06XeMumb8c1DbEP4ii
	VJ6hlZ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsXg-0000000Ec6I-1lzA;
	Wed, 14 Oct 2026 06:32:48 +0000
Received: from va-1-112.ptr.blmpb.com ([209.127.230.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsXa-0000000Ec5W-1A3S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 06:32:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791959549; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=1JmrvG8Wxu6YtXiksiU23e1HswNsSn5IxgMS7VCL0AQ=;
 b=iTcsN+byvXNYl6hTEYFqWX8+lbU4twF9xpYtGiOH6InWYmZLRqwfNMRVz2t9bQimc7k9wT
 TjkrOpTjyMYV0WQRL/7JsX086c7rmWh8yDTyg1tRrw0GVt6pd9X069YGiieE/+AVvmY96/
 4YNt0N5ny7Cc8RSMUwpZOnIruFiZmL+/w6ugOS785/hv32r11tWTr5tmln3UEk0x9vY/el
 cBbhbF99VxUyecqIeirKDMSNlEH8Cm/L/vWN6pOg3KjscQLrt0n9yj3NWAl0GpC7H1jDrc
 +QeZlz//gprlBGa91xMSxHvpPReT7tsIW/XlcFZSW18OJhIHtFWsnCQr/jTOtA==
Content-Type: text/plain; charset=UTF-8
References: <20261013093600.54995-1-zhaogongyi@bytedance.com> <20261013153953.77575-1-lance.yang@linux.dev>
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
Content-Transfer-Encoding: 7bit
User-Agent: Mozilla Thunderbird
Cc: <catalin.marinas@arm.com>, <will@kernel.org>, <ryan.roberts@arm.com>, 
	<dev.jain@arm.com>, <baolin.wang@linux.alibaba.com>, 
	<mark.rutland@arm.com>, <akpm@linux-foundation.org>, <david@kernel.org>, 
	<ljs@kernel.org>, <liam@infradead.org>, <vbabka@kernel.org>, 
	<rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>, 
	<linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>, 
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
X-Lms-Return-Path: <lba+26acf21fb+10c094+lists.infradead.org+zhaogongyi@bytedance.com>
To: "Lance Yang" <lance.yang@linux.dev>
Subject: Re: [PATCH] arm64/mm: restrict transparent contpte mappings to valid PTEs
Date: Wed, 14 Oct 2026 14:31:59 +0800
Message-Id: <516828fb-558d-4a20-9532-51f50d6ba042@bytedance.com>
In-Reply-To: <20261013153953.77575-1-lance.yang@linux.dev>
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_233242_560982_530AA9C2 
X-CRM114-Status: GOOD (  12.94  )
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

On 10/13/26 11:39 PM, Lance Yang wrote:
>>
>> +	/*
>> +	 * Keep the producer-side invariant documented in pgtable.h true even
>> +	 * if a direct caller passes an invalid descriptor with PTE_CONT set.
>> +	 */
>> +	if (!pte_valid(pte))
>> +		return __set_ptes(mm, addr, ptep, pte_mknoncont(pte), nr);
> 
> set_ptes() is the only in-tree caller, and it already clears PTE_CONT
> before we get here ... no? Why not fold !pte_valid(pte) into the
> !mm_is_user(mm) check below and return __set_ptes() directly?
> 
> 	if (!mm_is_user(mm) || !pte_valid(pte))
> 		return __set_ptes(mm, addr, ptep, pte, nr);
> 
> If a direct caller does pass a !pte_valid PTE with PTE_CONT set, I'd
> rather add a VM_WARN_ON() to catch that. Silently clearing the bit would
> hide a caller bug :)
> 

Hi Lance,

Thanks for taking a look.

Yes, you are right. The public set_ptes() wrapper already strips PTE_CONT
before calling contpte_set_ptes(), so the pte_mknoncont() in the invalid
path is unnecessary for the current in-tree path.

The issue I was trying to avoid is not that the incoming pte already has
PTE_CONT set, but that contpte_set_ptes() rebuilds the pte from pfn/prot
and then adds PTE_CONT again based on alignment. For an invalid descriptor,
that transparent contiguous encoding should be skipped entirely.

So your suggested shape makes sense to me. I will change this to return
through __set_ptes() directly for invalid descriptors, and add a warning
for any unexpected direct caller that passes an invalid PTE with PTE_CONT
set, e.g.:

	if (!mm_is_user(mm) || !pte_valid(pte)) {
		VM_WARN_ON_ONCE(!pte_valid(pte) && pte_cont(pte));
		return __set_ptes(mm, addr, ptep, pte, nr);
	}

That keeps the fix focused on not creating new invalid contpte entries,
while still catching a bad direct caller instead of silently sanitizing it.

Thanks,
Zhao

