Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB02CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 15:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHnuIxkuusA/4wSFpFP+bEyWJpUG3LAtoVZgWvXCCFE=; b=KWh3qGfF+MGIjjPEpcuCWzO4/w
	ld607ccSJryB3UV983iY0KIuG5N+oqrMjfKDIvi9p9dgZgiWlcAQix6C+RWuoIx5ytCT91LVn1gAI
	F9wmU73iN3qRhlnlKrg740Xrf0UXS2i+zXhkkYlZJyqRD4Y377k+kE7i1G/3c+nVtd/iJxGFuIt0m
	UNOXKenfemGjx+l7bEV/a7vdVsX+nBLMQT8q83FW6Ez2Pml51nkFQeBVPHnXHh+G/qAJnK7z4zTBY
	le2XwUJpPoKwZKd4ovlRF+dEPjSmzBug6QnkPJ+XcKtuyJPqtbptNmC0/I7zoAyyoTPH75q5+6/mR
	MkbrP1WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wabYB-00000002jPH-3DeR;
	Fri, 19 Jun 2026 15:54:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wabY7-00000002jNy-1tuK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 15:54:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 707A627DC;
	Fri, 19 Jun 2026 08:54:22 -0700 (PDT)
Received: from [10.57.95.87] (unknown [10.57.95.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 058763F763;
	Fri, 19 Jun 2026 08:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781884467; bh=ScdVpAAEUlglKYhgblarj/aY1vlSzcXqZZn90JqHVRM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rR92kd0glh5jwf0W8S7Wqiqwjztn+fRhmKmRwPc3S+2HAgi1boPfF3AuGtiPFL1vX
	 uOMimRzA2/2zRo1kD9pc4PEivvcaAc6rkJYFahOhX1yleErXUOnHOwRpLaslbE3cSz
	 sBuDw7MRB76zlX9hagYVCosKb/Wmf3PfE0eTjlS8=
Message-ID: <b4e02fed-0f52-47ec-8e52-ad390c61bbcd@arm.com>
Date: Fri, 19 Jun 2026 16:54:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: tlbflush: Don't broadcast if mm was only active
 on local cpu
Content-Language: en-GB
To: Will Deacon <will@kernel.org>
Cc: Linu Cherian <linu.cherian@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Yang Shi <yang@os.amperecomputing.com>, Mark Rutland <mark.rutland@arm.com>,
 Huang Ying <ying.huang@linux.alibaba.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 shameerali.kolothum.thodi@huawei.com
References: <20260523134710.3827956-1-linu.cherian@arm.com>
 <ai6KzFgfMAxqplcr@willie-the-truck>
 <bfc8803d-b375-477e-bba7-806edaf86578@arm.com>
 <ajAPnahwTe1OHQDp@willie-the-truck>
 <4aa78619-5a79-4fd0-aaac-a990b8c3fd05@arm.com>
 <ajVhiCXYmbDq-qTi@willie-the-truck>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <ajVhiCXYmbDq-qTi@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_085431_662134_5469D1D3 
X-CRM114-Status: GOOD (  17.22  )
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

On 19/06/2026 16:34, Will Deacon wrote:
> On Mon, Jun 15, 2026 at 04:41:04PM +0100, Ryan Roberts wrote:
>> On 15/06/2026 15:43, Will Deacon wrote:
>>> On Mon, Jun 15, 2026 at 12:21:19PM +0100, Ryan Roberts wrote:
>>>>>> +	self = smp_processor_id();
>>>>>> +
>>>>>> +	/*
>>>>>> +	 * The load of mm->context.active_cpu must not be reordered before the
>>>>>> +	 * store to the pgtable that necessitated this flush. This ensures that
>>>>>> +	 * if the value read is our cpu id, then no other cpu can have seen the
>>>>>> +	 * old pgtable value and therefore does not need this old value to be
>>>>>> +	 * flushed from its tlb. But we don't want to upgrade the dsb(ishst),
>>>>>> +	 * needed to make the pgtable updates visible to the walker, to a
>>>>>> +	 * dsb(ish) by default. So speculatively load without a barrier and if
>>>>>> +	 * it indicates our cpu id, then upgrade the barrier and re-load.
>>>>>> +	 */
>>>>>> +	active = READ_ONCE(mm->context.active_cpu);
>>>>>> +	if (active == self) {
>>>>>> +		dsb(ish);
>>>>>> +		active = READ_ONCE(mm->context.active_cpu);
>>>>>> +	} else {
>>>>>> +		dsb(ishst);
>>>>>> +	}
>>>>>
>>>>> Why can't you just do:
>>>>>
>>>>> 	dsb(ishst);
>>>>> 	active = READ_ONCE(mm->context.active_cpu);
>>>>>
>>>>> ?
>>>>
>>>> Prior to this optimization, we always issued a dsb(ishst) here. Catalin
>>>> suggested the same simplification against the RFC. I believe Linu tried it but
>>>> saw regressions; Hopefully Linu can provide the details.
>>>
>>> I don't follow...
>>>
>>> The old code always did dsb(ishst). The proposed code here does either
>>> dsb(ish) or dsb(ishst). How can that possibly be faster?
>>
>> Ugh, sorry - I read your suggestion as unconditionally issuing a dsb(ish).
>>
>> Ignore my previous answer, and now I'll demonstrate my total lack of
>> understanding of barriers instead...
>>
>> As the comment says, "The load of mm->context.active_cpu must not be reordered
>> before the store to the pgtable that necessitated this flush". I thought that a
>> dsb(ishst) would only provide ordering between stores. Don't we need the
>> dsb(ish) to prevent the load from being reordered before the store?
> 
> dsb(ishst) orders prior stores -> everything later. That's why it works
> today for ordered a PTE write before a TLBI (which isn't a store).

Ahh, that simplifies things then!

> 
> Will


