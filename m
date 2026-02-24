Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549C9E9B25B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 12:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jStwzl94e6w9RaNtwPvY25gm5RLmRTo7TsomKDClnlo=; b=3eK8V5DLgt1zDMtwY6rqcXdeLD
	H7/5mFD+QZnT1UdscnQnL1Kz0LGvBFzQ6ChSAqzy/CQ/IYWgfHRPwIipfTi+u33HBAQK6ff2bGFEk
	w0jAZpIMHUb4rdefjuuQPO/Pndhtojdx40XMOf39jzG8yEbQxP/3GZYMIrWmChIypjB/D0ykRKX/u
	b5IIae0b+futiVdd1cNOqlH4viKNEqRuCziGThw+oBFy9JGSXXMoUXNvE1PgTImii70jeGJQmvuC9
	Eq9hTXOm0na24Fes7HVZZdM7QsXkgJr5FlX20p6X/Yh852cy+aFx1hEcZMPGOS0xM82aNjfVF9DTV
	mR5H7akA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vurqp-000000025WB-3oSq;
	Tue, 24 Feb 2026 12:49:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vurqm-000000025Uh-2oU2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 12:49:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39386339;
	Tue, 24 Feb 2026 04:49:09 -0800 (PST)
Received: from [10.163.172.181] (unknown [10.163.172.181])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C3EB3F62B;
	Tue, 24 Feb 2026 04:49:09 -0800 (PST)
Message-ID: <9ef5f8e4-0cc5-404e-8287-ce43fcf5c139@arm.com>
Date: Tue, 24 Feb 2026 18:19:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V1 04/16] perf/events: Replace READ_ONCE() with standard
 pgtable accessors
To: Ryan Roberts <ryan.roberts@arm.com>, Peter Zijlstra
 <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Linu Cherian <linu.cherian@arm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, linux-perf-users@vger.kernel.org
References: <20260224051153.3150613-1-anshuman.khandual@arm.com>
 <20260224051153.3150613-5-anshuman.khandual@arm.com>
 <aZ14lUwuA86aiOH-@J2N7QTR9R3>
 <20260224104134.GW1395266@noisy.programming.kicks-ass.net>
 <6812706f-1ea3-416d-8ba1-da522238e040@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <6812706f-1ea3-416d-8ba1-da522238e040@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_044916_840701_7D950BBE 
X-CRM114-Status: GOOD (  25.90  )
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



On 24/02/26 4:52 PM, Ryan Roberts wrote:
> On 24/02/2026 10:41, Peter Zijlstra wrote:
>> On Tue, Feb 24, 2026 at 10:08:21AM +0000, Mark Rutland wrote:
>>> On Tue, Feb 24, 2026 at 10:41:41AM +0530, Anshuman Khandual wrote:
>>>> Replace READ_ONCE() with standard page table accessors i.e pxdp_get() which
>>>> anyways default into READ_ONCE() in cases where platform do not override.
>>>
>>> For each of the patches where you make this sort of change, please
>>> explain in the commit message *why* it is necessary to do this.
>>>
>>> IIUC the entire point of this is that in subsequent patches, arm64 will
>>> need to use something other than READ_ONCE() for all pXX levels in order
>>> to support D128 translation tables.
>>>
>>> Spelling that out in the commit message makes it much easier for
>>> reviewers to see what's going on, and to focus any discussion/questions,
>>> e.g. *why* won't READ_ONCE() work?
>>
>> That, and only being sent *one* patch, I have no clue what the rest of
>> them are doing. Didn't even get 0/n.
>>
>> I hate people sending me just one patch; just send the whole series
>> already.
> 
> Perhaps Anshuman can forward you the rest of the series, but FWIW, the cover
> letter is here:
> https://lore.kernel.org/all/20260224051153.3150613-1-anshuman.khandual@arm.com/

I have already forwarded the entire series to Peter.

> 
> High level summary is that we are adding support for 128 bit page tables on
> arm64. Existing places that use READ_ONCE() to read PTEs now require 128-bit
> single copy atomicity guarrantees, which READ_ONCE() doesn't allow (on arm64 at
> least) - it fails to compile if used on anything over 64 bit.
> 
> load pair/store pair (ldp/stp) are only single copy atomic if FEAT_LSE128 is
> supported (which is required if FEAT_D128 - 128 bit pgtables - is suported).
> Currently 128 bit pgtables is a compile time decision so we could have chosen to
> extend READ_ONCE()/WRITE_ONCE() to allow 128 bit for this configuration. But
> it's a general purpose API and we were concerned that other users might
> eventually creep in that expect 128 and then fail to compile in the other configs.
> 
> But worse, we are considering eventually making D128 a boot time option, at
> which point we'd have to make READ_ONCE() always allow 128 bit at compile time
> but then it might silently tear at runtime.
> 
> So our preference is to standardize on these existing helpers, which we can
> override in arm64 to give the 128 bit SCA guarrantee when we need it.

That summarizes the intent for this change - will update the commit message
as required. Thanks Ryan for such a detailed explanation. 

