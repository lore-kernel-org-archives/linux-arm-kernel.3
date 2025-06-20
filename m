Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE4AC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 16:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XvklUYDFwl5UGXL1Gm8oQZqPfot4W+sW1OgI6J/vQq8=; b=IiV8kFIo/QAACGPrYQ1ciH7kA6
	8oktbT+tfYL/5r4ji02JPI4+ZtywTh5HoqD3DRuP7ITcCrYno9WtxwKRiYc293HPt+0aLeHwXnDft
	9Uc0Mtq1IVL4sAWXb2t7QQa6a/9k5oDHY6ScjQGlYz3mDk4phRzlwUR2G7sZ+QWZLGUB45yzlkuH6
	x2704JnSSNZDvJyxER2+n2jy09T5VcUpOjxXlfXgo470hluhFkOh7QuXPGvEboMHfo9FyzapTpL82
	g2Ypuq3tvsBzAd0I/8tDC6zk5pX181J5KGO1hZUJRqZP+M5rRfDwoBlG6p9MBgc149MKH6G0EmN+p
	tKjF23Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSf04-0000000GBEs-24nW;
	Fri, 20 Jun 2025 16:54:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSeKJ-0000000G6Eh-0oCL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 16:10:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A26016F2;
	Fri, 20 Jun 2025 09:10:27 -0700 (PDT)
Received: from [10.1.30.146] (XHFQ2J9959.cambridge.arm.com [10.1.30.146])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 207873F58B;
	Fri, 20 Jun 2025 09:10:42 -0700 (PDT)
Message-ID: <7105112f-b0bb-4191-b3c9-93522162319c@arm.com>
Date: Fri, 20 Jun 2025 17:10:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/4] arm64/mm: Elide tlbi in contpte_convert() under
 BBML2
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>,
 =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>
Cc: yang@os.amperecomputing.com, will@kernel.org, jean-philippe@linaro.org,
 robin.murphy@arm.com, joro@8bytes.org, maz@kernel.org,
 oliver.upton@linux.dev, joey.gouly@arm.com, james.morse@arm.com,
 broonie@kernel.org, ardb@kernel.org, baohua@kernel.org,
 suzuki.poulose@arm.com, david@redhat.com, jgg@ziepe.ca, nicolinc@nvidia.com,
 jsnitsel@redhat.com, mshavit@google.com, kevin.tian@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev
References: <20250617095104.6772-1-miko.lenczewski@arm.com>
 <20250617095104.6772-5-miko.lenczewski@arm.com> <aFRlDSZ2PPnHixjc@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aFRlDSZ2PPnHixjc@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_091051_321553_318C59A1 
X-CRM114-Status: GOOD (  27.43  )
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

On 19/06/2025 20:29, Catalin Marinas wrote:
> On Tue, Jun 17, 2025 at 09:51:04AM +0000, Mikołaj Lenczewski wrote:
>> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
>> index bcac4f55f9c1..203357061d0a 100644
>> --- a/arch/arm64/mm/contpte.c
>> +++ b/arch/arm64/mm/contpte.c
>> @@ -68,7 +68,144 @@ static void contpte_convert(struct mm_struct *mm, unsigned long addr,
>>  			pte = pte_mkyoung(pte);
>>  	}
>>  
>> -	__flush_tlb_range(&vma, start_addr, addr, PAGE_SIZE, true, 3);
>> +	/*
>> +	 * On eliding the __tlb_flush_range() under BBML2+noabort:
>> +	 *
>> +	 * NOTE: Instead of using N=16 as the contiguous block length, we use
>> +	 *       N=4 for clarity.
>> +	 *
>> +	 * NOTE: 'n' and 'c' are used to denote the "contiguous bit" being
>> +	 *       unset and set, respectively.
>> +	 *
>> +	 * We worry about two cases where contiguous bit is used:
>> +	 *  - When folding N smaller non-contiguous ptes as 1 contiguous block.
>> +	 *  - When unfolding a contiguous block into N smaller non-contiguous ptes.
>> +	 *
>> +	 * Currently, the BBML0 folding case looks as follows:
>> +	 *
>> +	 *  0) Initial page-table layout:
>> +	 *
>> +	 *   +----+----+----+----+
>> +	 *   |RO,n|RO,n|RO,n|RW,n| <--- last page being set as RO
>> +	 *   +----+----+----+----+
>> +	 *
>> +	 *  1) Aggregate AF + dirty flags using __ptep_get_and_clear():
>> +	 *
>> +	 *   +----+----+----+----+
>> +	 *   |  0 |  0 |  0 |  0 |
>> +	 *   +----+----+----+----+
>> +	 *
>> +	 *  2) __flush_tlb_range():
>> +	 *
>> +	 *   |____ tlbi + dsb ____|
>> +	 *
>> +	 *  3) __set_ptes() to repaint contiguous block:
>> +	 *
>> +	 *   +----+----+----+----+
>> +	 *   |RO,c|RO,c|RO,c|RO,c|
>> +	 *   +----+----+----+----+
> 
> From the initial layout to point (3), we are also changing the
> permission. Given the rules you mentioned in the Arm ARM, I think that's
> safe (hardware seeing either the old or the new attributes). The
> FEAT_BBM description, however, only talks about change between larger
> and smaller blocks but no mention of also changing the attributes at the
> same time. Hopefully the microarchitects claiming certain CPUs don't
> generate conflict aborts understood what Linux does.
> 
>> +	 *
>> +	 *  4) The kernel will eventually __flush_tlb() for changed page:
>> +	 *
>> +	 *                  |____| <--- tlbi + dsb
> [...]
>> +	 * It is also important to note that at the end of the BBML2 folding
>> +	 * case, we are still left with potentially all N TLB entries still
>> +	 * cached (the N-1 non-contiguous ptes, and the single contiguous
>> +	 * block). However, over time, natural TLB pressure will cause the
>> +	 * non-contiguous pte TLB entries to be flushed, leaving only the
>> +	 * contiguous block TLB entry. This means that omitting the tlbi+dsb is
>> +	 * not only correct, but also keeps our eventual performance benefits.
> 
> Step 4 above implies some TLB flushing from the core code eventually.
> What is the situation mentioned in the paragraph above? Is it only until
> we get the TLB flushing from the core code?

I think the point that Miko is making here is that at some point between step 3
and 4, we could end up with up to any 3 of the original small entries as well as
the large entry in the TLB. Then the flush at step 4 will only remove the small
entry at the last entry and the large entry - i.e. it will only remove the
entries that overlap the region that the tlbi targets, and up to 3 of the small
entries may be left in the TLB after step 4. Our rationale here was that this is
safe due to BBML2 and it will naturally sort itself out over time with natural
eviction.

> 
> [...]
>> +	if (!system_supports_bbml2_noabort())
>> +		__flush_tlb_range(&vma, start_addr, addr, PAGE_SIZE, true, 3);
>>  
>>  	__set_ptes(mm, start_addr, start_ptep, pte, CONT_PTES);
> 
> Eliding the TLBI here is all good but looking at the overall set_ptes(),
> why do we bother with unfold+fold for BBML2? Can we not just change
> them in place without going through __ptep_get_and_clear()?

We need to collect the access and dirty bits so we can apply the aggregate
across all entries. We can only accurately collect the access and dirty bits if
we go via invalid, otherwise the HW could update after we have read the old
entry but before we have written the new entry.

Thanks,
Ryan


