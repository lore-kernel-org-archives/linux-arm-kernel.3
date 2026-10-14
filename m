Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841E8CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 10:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7zp5Iv5p1o76A3rCfOrm7kS93kiCxrngn4b8u1wFuQ=; b=df0xlkU8q469yHpNnUq9LP58ML
	gBYgZG37K/8myrvGq9HjNU7eYX7kXUYK1NBSJZyb7vkA8PO5bdrSbYv//aLOtU2mYDgxAgY8eRXc3
	v0OmcTqRdGR5B8YFmm0voDLgVaRufU8Zf+TqvUv3gBUmWqnmtaXIHtICCpcDcWooF4Y7f91ej353w
	aHm+OM49SGZY25ET5LEqxu+Z188iPCRk4i7Yiydvem+D0zgDzu5HB1sdUJ7WnpWOkNqDACmZy0Y6Q
	DRmdt8SqvwCTeERrR/NZFJElFXyVgPI0tbohCuBWxvExSQpMBFERSHcCPCh9r2sEpriIIOt5TLi5J
	/9jw+lSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvpu-0000000F9wH-1MRI;
	Wed, 14 Oct 2026 10:03:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvpr-0000000F9vf-3MYg
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 10:03:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=I7zp5Iv5p1o76A3rCfOrm7kS93kiCxrngn4b8u1wFuQ=; b=nMDCujURqyzBNa+YdMUDDq1fNA
	lK1HtUjIZSV2ev0PNCh4IkoA4ecdgV0j/xgFtJajXUn3+NsQeqWzXbq4mZ8N/ccWOw8bz7BQbDFpv
	38CQFPXYKmRpXiHKTp/wVKZ4PtOGumyCKww5y3aUehClnQrl7Rb6nMsjISq+LAEcQHDo1/LLz2Kj7
	PCwdk081vM5nQ5qA2XT1IS9dMC6+eZAb0Uzvzt5I09b2dkUeV5HdGeMRzbxW33tHJ83PSUd2w1c8F
	iGvMFyMiGHGWRGHE3Mq1IqqvvJ8sITgv92KEkdkmu+kDqx4F3aBkM4/LCA+dhQieFpP3SP34xNjKK
	ZJcA3Ojg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGvpn-0000000Gc44-3A1b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 10:03:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE654153B;
	Wed, 14 Oct 2026 03:03:38 -0700 (PDT)
Received: from [10.164.19.62] (unknown [10.164.19.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CD293F673;
	Wed, 14 Oct 2026 03:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791972222; bh=eb+1OnhCrwcLrcQXmju+ZI4BR5IYqvlaJ9YM0fXSEG0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZzZ3EuQ2qjlvO7W7V1MYgf1owieL7IFjWffRoEL3LS4XoiUrOOsBiva2N3xoTaB3m
	 ktyfzIBiW8F5zFoFUKnSoDcMAPPosaXEIG0VceWlD1JAPEHVIGBTHR8uURhM7gloEu
	 EMDBhP4TLCF+Xc0McZABfw9o0Mr/DTa6Ivxb4efE=
Message-ID: <0bbbe312-47a4-4eeb-8299-1f20daf4e949@arm.com>
Date: Wed, 14 Oct 2026 15:33:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: restrict transparent contpte mappings to valid
 PTEs
To: Zhao Gongyi <zhaogongyi@bytedance.com>, Lance Yang <lance.yang@linux.dev>
Cc: catalin.marinas@arm.com, will@kernel.org, ryan.roberts@arm.com,
 baolin.wang@linux.alibaba.com, mark.rutland@arm.com,
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261013093600.54995-1-zhaogongyi@bytedance.com>
 <20261013153953.77575-1-lance.yang@linux.dev>
 <516828fb-558d-4a20-9532-51f50d6ba042@bytedance.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <516828fb-558d-4a20-9532-51f50d6ba042@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_110344_063484_3D5351B6 
X-CRM114-Status: GOOD (  19.54  )
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



On 14/10/26 12:01 pm, Zhao Gongyi wrote:
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
> 
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

set_ptes does pte_mknoncont(), so the warning will *never* fire I think?


> 		return __set_ptes(mm, addr, ptep, pte, nr);
> 	}
> 
> That keeps the fix focused on not creating new invalid contpte entries,
> while still catching a bad direct caller instead of silently sanitizing it.
> 
> Thanks,
> Zhao


