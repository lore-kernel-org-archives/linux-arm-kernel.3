Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2830DE9B261
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 12:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oY8qZjUN/o3XHq+7G9N7CNri4mxEWF8OjwqSWQF6UQw=; b=F9o2j6Z1yaA3yagn2UAiiNWD1+
	kZED904JegXtQ9XWee1hOgVcLDq6FCmuUwGSQGRbaCB1Iz/q3VOAlfl9uNjrL5vOC6a7f2S8hIKTL
	hU6cgKdBLqt6Khy1Wxt57v49uDJzhI0hwm6fOq19ce+NRfRBIgyI8JGAWzhRWd0XRREBGiJe1E9Rl
	k9/W5dX5jA3p2OA3daoVSONoEq7WDKKXaYtKFCC6zs85M90eZatNfrmjJmvqKcAmymvXQQ9GEIVV3
	icNe9HOHdszuR/IXlX59PtsRzBu192CHIPiLAwne5ebkZzmjxHqdd6MpgNA6X8c0P6TrhvrHwpi29
	xOi6XVLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuruj-000000025nQ-05AJ;
	Tue, 24 Feb 2026 12:53:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vurue-000000025ms-0O6n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 12:53:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79B39339;
	Tue, 24 Feb 2026 04:53:08 -0800 (PST)
Received: from [10.163.172.181] (unknown [10.163.172.181])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C37F3F62B;
	Tue, 24 Feb 2026 04:53:09 -0800 (PST)
Message-ID: <c3b996e5-1c2f-4dea-b25b-31d24bc9620f@arm.com>
Date: Tue, 24 Feb 2026 18:23:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V1 04/16] perf/events: Replace READ_ONCE() with standard
 pgtable accessors
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Linu Cherian <linu.cherian@arm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, linux-perf-users@vger.kernel.org
References: <20260224051153.3150613-1-anshuman.khandual@arm.com>
 <20260224051153.3150613-5-anshuman.khandual@arm.com>
 <aZ14lUwuA86aiOH-@J2N7QTR9R3>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <aZ14lUwuA86aiOH-@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_045316_176589_C0D0FC00 
X-CRM114-Status: GOOD (  20.93  )
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

On 24/02/26 3:38 PM, Mark Rutland wrote:
> On Tue, Feb 24, 2026 at 10:41:41AM +0530, Anshuman Khandual wrote:
>> Replace READ_ONCE() with standard page table accessors i.e pxdp_get() which
>> anyways default into READ_ONCE() in cases where platform do not override.
> 
> For each of the patches where you make this sort of change, please
> explain in the commit message *why* it is necessary to do this.

Sure will explain the intent better for these patches.

> > IIUC the entire point of this is that in subsequent patches, arm64 will
> need to use something other than READ_ONCE() for all pXX levels in order
> to support D128 translation tables.

Right.

> 
> Spelling that out in the commit message makes it much easier for
> reviewers to see what's going on, and to focus any discussion/questions,
> e.g. *why* won't READ_ONCE() work?

Got it.

> 
> Mark.
> 
>>
>> Cc: Peter Zijlstra <peterz@infradead.org>
>> Cc: Ingo Molnar <mingo@redhat.com>
>> Cc: Arnaldo Carvalho de Melo <acme@kernel.org>
>> Cc: Namhyung Kim <namhyung@kernel.org>
>> Cc: linux-perf-users@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>  kernel/events/core.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/kernel/events/core.c b/kernel/events/core.c
>> index ac70d68217b6..4ee151cd2c6d 100644
>> --- a/kernel/events/core.c
>> +++ b/kernel/events/core.c
>> @@ -8422,7 +8422,7 @@ static u64 perf_get_pgtable_size(struct mm_struct *mm, unsigned long addr)
>>  	pte_t *ptep, pte;
>>  
>>  	pgdp = pgd_offset(mm, addr);
>> -	pgd = READ_ONCE(*pgdp);
>> +	pgd = pgdp_get(pgdp);
>>  	if (pgd_none(pgd))
>>  		return 0;
>>  
>> @@ -8430,7 +8430,7 @@ static u64 perf_get_pgtable_size(struct mm_struct *mm, unsigned long addr)
>>  		return pgd_leaf_size(pgd);
>>  
>>  	p4dp = p4d_offset_lockless(pgdp, pgd, addr);
>> -	p4d = READ_ONCE(*p4dp);
>> +	p4d = p4dp_get(p4dp);
>>  	if (!p4d_present(p4d))
>>  		return 0;
>>  
>> @@ -8438,7 +8438,7 @@ static u64 perf_get_pgtable_size(struct mm_struct *mm, unsigned long addr)
>>  		return p4d_leaf_size(p4d);
>>  
>>  	pudp = pud_offset_lockless(p4dp, p4d, addr);
>> -	pud = READ_ONCE(*pudp);
>> +	pud = pudp_get(pudp);
>>  	if (!pud_present(pud))
>>  		return 0;
>>  
>> -- 
>> 2.43.0
>>


