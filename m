Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B990106703C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 14:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLD4oFW0N84FTSmWx5ntsoxLfj62Uc+/bcYXLFwb2jo=; b=XaNPDr/KSpOby1sF32edHnrNpA
	h03/awmfl9G4hBTO9tmFvx/SINhJQAX8x/zX78Kjz0My4vp3KPEME7311WZWrAC3Qqr6v+J6lnXyI
	2hEhYIXmYm2cuiAD1pFLfTYRKXMKXb1+9JUcAjZBh44gSM+CBOJxoX5iz+nw3sOrumhye2l2mGOY2
	2NhlioFEmThPBWdznaTiNyMXAx3UZYQj+I6sETNJJIhvz8EUa++uqg/38ym7AYWE+mfJMT1uP87e9
	A7V41yHtXmQD8LRuHMA75+QXtUPOfTPWIUK+RA7MAPlUnOjHItaJRZ5g9deKgLOirzTCT9QsGt63t
	YdfH/nbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hNl-0000000EFxj-1HDU;
	Thu, 12 Mar 2026 14:51:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hNh-0000000EFwT-0cnt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 14:51:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7406F165C;
	Thu, 12 Mar 2026 07:51:13 -0700 (PDT)
Received: from [10.57.59.155] (unknown [10.57.59.155])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5ECD23F7BD;
	Thu, 12 Mar 2026 07:51:18 -0700 (PDT)
Message-ID: <8f72b0f2-d517-4ac6-a593-3b654ac6344d@arm.com>
Date: Thu, 12 Mar 2026 14:51:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QUESTION] ARM DSU PMU: 32-bit counter assumption and handling of
 64-bit event counters
To: Will Deacon <will@kernel.org>, "feng.zhou" <realsummitzhou@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com
References: <20260206035138.1377-1-realsummitzhou@gmail.com>
 <abLNm2gs8qszYVWK@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <abLNm2gs8qszYVWK@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_075122_432821_735E61EF 
X-CRM114-Status: GOOD (  17.70  )
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

On 2026-03-12 2:28 pm, Will Deacon wrote:
> [+Robin and Suzuki]
> 
> On Fri, Feb 06, 2026 at 11:51:38AM +0800, feng.zhou wrote:
>> Hi Will and Mark,
>>
>> I have a question regarding the ARM DSU PMU driver implementation in
>> drivers/perf/arm_dsu_pmu.c, specifically about the counter width
>> assumptions.
>>
>> Current Implementation:
>> ======================
>> The driver currently assumes all event counters are 32-bit wide, with
>> only the cycle counter being 64-bit (lines 69-71):
>>
>> /* All event counters are 32bit, with a 64bit Cycle counter */
>> #define DSU_PMU_COUNTER_WIDTH(idx)	\
>> 	(((idx) == DSU_PMU_IDX_CYCLE_COUNTER) ? 64 : 32)
>>
>> This assumption is used throughout the code for handling counter
>> overflow and calculating deltas (e.g., line 344 in dsu_pmu_event_update).
>>
>> Issue Observed:
>> ===============
>> I've encountered overflow issues when using perf tools on newer ARM CPUs
>> where the event counters appear to be 64-bit rather than 32-bit. The
>> current implementation causes incorrect event counting and potential data
>> loss due to premature overflow handling based on the 32-bit mask.
> 
> I suspect either the hardware or the architecture have evolved since the
> driver was initially written, possibly in a non-backwards-compatible way
> which is why you see problems.
> 
>> Questions:
>> ==========
>> 1. Is the 32-bit event counter assumption based on the ARMv8 PMU
>>     specification or DSU-specific hardware documentation?
>>
>> 2. Are there known ARM CPU implementations where DSU event counters
>>     exceed 32 bits? If so, how should the driver handle this variation?
>>
>> 3. Would it be appropriate to detect the actual counter width at runtime
>>     (similar to how num_counters is probed in dsu_pmu_probe_pmu), or
>>     should this be handled through device tree / ACPI properties?
>>
>> 4. Should there be a mechanism to query the hardware for the actual
>>     counter width to ensure compatibility with future implementations?
>>
>> Thank you for your time and any insights you can provide.
> 
> Suzuki and Robin should be able to help with these...

Yup, indeed newer DSUs subtly evolved, and the patches are already in 
7.0-rc ;)

Cheers,
Robin.

