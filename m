Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF73EC5516F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 04:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vG9tROAw0z8rbg2qYSkm3leK+7lk633kVXdOhlAGKdI=; b=e0txih3OkskKnRn3eku+z90TWX
	t6FjtyWWTplc6pmkOxS4/EXJqTuUBVFKx/Rh2rSqZ/jm7jjY1wM/+lC23+L/0F+xnCeEXxdQk1fk5
	ej0oNhiL5g4JMqpdr/5ZjxXrZCagByfloxOonY/X1cwwr4HOryPcRJkjdG8A8B24FjJGxrJUrem2q
	iDsTp2Bkx2EqfynxDhs0o/gP4ZdOz8l7V16BmMoVzTjin71s61BVQdb/t2ngYutrwA9GydGFWiYov
	3g4O8fxLtV33iglDeOmQKrn1PbG01lDGfgmyx3HBvxcXxV4de3i3gvGY1dmYMFMZsHf2OtkcQejo8
	8TH3damA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqk9f-0000000GIzD-2V0B;
	Mon, 03 Aug 2026 04:19:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqk9c-0000000GIy6-3PmR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 04:19:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49150143D;
	Sun,  2 Aug 2026 21:19:49 -0700 (PDT)
Received: from [10.163.134.188] (unknown [10.163.134.188])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 765663F632;
	Sun,  2 Aug 2026 21:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785730793; bh=am1kmDa9klxMcftBn5wQAjzb7HUsZgJkRhSPJ+KX0eg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bmneqHGhD8VM1pX4IvdlLOgbfUuS+3v/qTzWsvUAshIELNillzdR/IzJnW6goJHPG
	 6YVafigCN7Vo4Pm/5+aLox/F0hjjsnVZfD58xvQDY7taY4+ntHw/84VyR5OPXYSSzU
	 sL92dgRnZu3A9MJV3VhVSAsZBTq46KLm7HjbruaA=
Message-ID: <e035b2a8-9e32-4d5f-ba37-f3622e621c3f@arm.com>
Date: Mon, 3 Aug 2026 09:49:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] arm64: cpufeature: Detect BBML3 based on
 ID_AA64MMFR2_EL1.BBM
To: Linu Cherian <linu.cherian@arm.com>, Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Gavin Shan <gshan@redhat.com>
References: <20260723044034.2983651-1-linu.cherian@arm.com>
 <20260723044034.2983651-7-linu.cherian@arm.com> <amy7kPXnaPHmWMwc@google.com>
 <anAQYj0ZJkrjZSn2@a079125.arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <anAQYj0ZJkrjZSn2@a079125.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_211956_906188_49D7F003 
X-CRM114-Status: GOOD (  16.95  )
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



On 03/08/26 9:22 AM, Linu Cherian wrote:
> Hi Will,
> 
> On Fri, Jul 31, 2026 at 04:13:20PM +0100, Will Deacon wrote:
>> On Thu, Jul 23, 2026 at 10:10:33AM +0530, Linu Cherian wrote:
>>> Add ID_AA64MMFR2_EL1.BBM based BBML3 feature detection in
>>> cpu_supports_bbml3() so that cpus with the feature would
>>> not have to be added into MIDR based supports_bbml3_list.
>>>
>>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>>> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
>>> Signed-off-by: Linu Cherian <linu.cherian@arm.com>
>>> ---
>>>  arch/arm64/kernel/cpufeature.c | 17 +++++++++--------
>>>  1 file changed, 9 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>>> index 896bafdb00b1..dbd7d187520c 100644
>>> --- a/arch/arm64/kernel/cpufeature.c
>>> +++ b/arch/arm64/kernel/cpufeature.c
>>> @@ -2133,6 +2133,12 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
>>>  
>>>  bool cpu_supports_bbml3(void)
>>>  {
>>> +	u64 mmfr2;
>>> +
>>> +	mmfr2 = __read_sysreg_by_encoding(SYS_ID_AA64MMFR2_EL1);
>>> +	if (SYS_FIELD_GET(ID_AA64MMFR2_EL1, BBM, mmfr2) >= ID_AA64MMFR2_EL1_BBM_3)
>>> +		return true;
>>
>> This is a bit of a nit, but I think it would be more consistent to use
>> has_cpuid_feature() here instead of __read_sysreg_by_encoding(), similarly
>> to how we handle kpti in unmap_kernel_at_el0() (which also has both an
>> ID register field and a list of MIDRs).
> 
> force_pte_mapping required by map_mem(during early boot) needs
> cpu_supports_bbml3 check and cpu features/capabilities are not 
> initialized by that time. Should i add a comment there to clarify this ?
Right - that would be useful here while also providing some
context why has_cpuid_feature() could not have been used.

