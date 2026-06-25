Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC508CDB47C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 02:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/zm2kniPPjTjNt80SmWWzw+TJTE/nuVESpcdWWyR90A=; b=heaqNUJ8LACYlk4FDHgkY4ZyEh
	IfR2u/pMDbpQuuhtvbMBR8mg/G/WVJ2f+HOilOd1Nb3qr6RqiveGrM4qCFl1ezG9eshSypkt1VEP5
	FM4SfuM3naQGXTGfDIPq0OkoG9LO1BtP+uFLkiUF0snX+RI4ACTh6k5aoVCEHZEF5y/QzGdwPGTuj
	SlLvfHC56g4+VwG1vFm6wzuo6PG0kuM8Dee+3cflx/Cty4QfbfIB5/ZAFmx2G+7isbgkf98Ka/VIV
	gK3huMajrM/KGZSsg4lZv6dDYKyZOibVQSPBK4KyuHG3BcIuOB8ba9izC/3CautKcCZPty71Gh1v6
	EmgRN1Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcZqu-00000008ZUa-2WGO;
	Thu, 25 Jun 2026 02:30:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcZqr-00000008ZTd-2RvP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 02:30:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 719C72309;
	Wed, 24 Jun 2026 19:29:52 -0700 (PDT)
Received: from [10.164.18.48] (J09HK2D2RT.blr.arm.com [10.164.18.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE6E53F836;
	Wed, 24 Jun 2026 19:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782354597; bh=H4FgjilvRhDxaejSOs5jXTlNlpdPoqb31yfgAlihuI8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=giYOnuqRdTISFy6hmWYZAGBzFNiE301udlj9j8E36XojIMm1id4IDbBt0Pz8fXMi+
	 lPks3QTwKXnd2PcNe+ZX+ft3eOkI9Mz0BwsIm2M8pVZLdSWoEim1eegI/oZYlyKXCU
	 8EfgGf/tcUo4PnBel4ckzDZ78lcKhuSctPtNojKI=
Message-ID: <b51f82ed-aa54-4c67-bcef-e59acd10c789@arm.com>
Date: Thu, 25 Jun 2026 07:59:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.1 337/522] arm64/mm: Enable batched TLB flush in
 unmap_hotplug_range()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, Ben Hutchings <ben@decadent.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>, patches@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sasha Levin <sashal@kernel.org>, stable <stable@vger.kernel.org>,
 mark.rutland@arm.com
References: <20260616145125.307082728@linuxfoundation.org>
 <20260616145141.584613180@linuxfoundation.org>
 <b0d5836032ce3135bfc473f6bff791306d086925.camel@decadent.org.uk>
 <ajqXWqiAol6Shdd6@willie-the-truck>
 <d2a633c8-496e-48e1-bfa0-a0fc75bd0a08@arm.com>
 <2026062451-bluff-coherent-672d@gregkh>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <2026062451-bluff-coherent-672d@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_193001_916027_B4BD0115 
X-CRM114-Status: GOOD (  21.83  )
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



On 24/06/26 9:59 PM, Greg Kroah-Hartman wrote:
> On Wed, Jun 24, 2026 at 04:05:01PM +0100, Ryan Roberts wrote:
>> On 23/06/2026 15:25, Will Deacon wrote:
>>> On Sun, Jun 21, 2026 at 05:02:27PM +0200, Ben Hutchings wrote:
>>>> On Tue, 2026-06-16 at 20:28 +0530, Greg Kroah-Hartman wrote:
>>>>> 6.1-stable review patch.  If anyone has any objections, please let me know.
>>>>>
>>>>> ------------------
>>>>>
>>>>> From: Anshuman Khandual <anshuman.khandual@arm.com>
>>>>>
>>>>> [ Upstream commit 48478b9f791376b4b89018d7afdfd06865498f65 ]
>>>> [...]
>>>>> @@ -949,15 +953,14 @@ static void unmap_hotplug_pmd_range(pud_
>>>>>  		WARN_ON(!pmd_present(pmd));
>>>>>  		if (pmd_sect(pmd)) {
>>>>>  			pmd_clear(pmdp);
>>>>> -
>>>>> -			/*
>>>>> -			 * One TLBI should be sufficient here as the PMD_SIZE
>>>>> -			 * range is mapped with a single block entry.
>>>>> -			 */
>>>>> -			flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>>>>> -			if (free_mapped)
>>>>> +			if (free_mapped) {
>>>>> +				/* CONT blocks are not supported in the vmemmap */
>>>>> +				WARN_ON(pmd_cont(pmd));
>>>>> +				flush_tlb_kernel_range(addr, addr + PMD_SIZE);
>>>>
>>>> It wasn't clear to me from the commit message why this now adds PMD_SIZE
>>>> rather than PAGE_SIZE.  It seems like this change is fine for Linux
>>>> 6.13+ with a CPU that supports TLB range flushing, but otherwise results
>>>> in unnecessarily executing multiple TLB invalidations at intervals of
>>>> the base page size.
>>>
>>> Hmm, the commit message also makes very little sense to me and so I don't
>>> understand why this patch has us doing multiple TLB invalidations when
>>> we run into a !cont, block mapping at the PMD level. The old comment
>>> (which this patch removes) should still apply afaict.
>>>
>>> Anshuman, Ryan, any ideas what's going on here?
>>
>> I think this change was probably my fault; Given the API is called
>> flush_tlb_kernel_range() it seemed like an abuse/hack to pretend we are only
>> flushing the first PAGE_SIZE of the range. But as I understand it, even if the
>> HW shatters a block mapping into multiple TLB entries, all of the entries
>> relating to the block mapping will be invalidated if just one of them intersects
>> the TLBI range/address. So it should be safe to reapply this hack.
>>
>> Although ideally I think it would be better if this API took a stride argument;
>> then intent is clear.
>>
>> What's the best way to handle this? Submit a patch for mainline that reverts
>> this part, then get it backported to stable (implying this current patch will
>> have been applied to stable)?
> 
> yes, that's probably the best way.
Sure, will send out the change as suggested.

