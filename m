Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D6BD1489D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 04:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9V02DW2g2G4PlWcr2RZd34+cGZ/eCYegzkwqMa89zM=; b=CJJJcfEeroEX4AhbE/KmGlmsXj
	fTDpx2ag/fioowEVhu1QOMX3RcyWA+VjjqReg7he25idXssUtF6OrF92jKaQ9fCyLyU53Q9TTPBHK
	eqRhH7MVq1Ji61FJ/7SDy00wIaoQL1TiJDfE3OO/Nycmht51U7umNDa6fBGc6Kxms1vXbQQOWkC3q
	/7nWcsU9PlZQ1jSR85eucueyP89uVMqrVV57qZKgGZauwNmDOiILdMxtJ967hQ4Hel5Mqbci+tg3h
	hpVNTn5pv3AiR9pj1KCmEEZr48BTvUG2fY1rh8WlC424G9bi7pexxGMQrEIt7FhPoKcEuyBIHF1Oe
	PUcYlDjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdhFs-0000000FtnY-0W64;
	Thu, 08 Jan 2026 04:04:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdhFp-0000000Ftn8-1Oav
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 04:04:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 558AA497;
	Wed,  7 Jan 2026 20:03:58 -0800 (PST)
Received: from [10.163.83.134] (unknown [10.163.83.134])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 591B73F694;
	Wed,  7 Jan 2026 20:04:03 -0800 (PST)
Message-ID: <4f2005ba-ff12-4ad9-bd4c-33cae87bdc78@arm.com>
Date: Thu, 8 Jan 2026 09:34:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Assert NR_BM_PUD_TABLES for bm_pud[]
To: Mark Rutland <mark.rutland@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20260107061606.3160088-1-anshuman.khandual@arm.com>
 <d3579c85-8cac-4e83-94a7-b6dcab72b7a1@arm.com>
 <32030401-06d3-40ad-a0b6-fbd366092f2b@arm.com> <aV4xUe0A4zMhPxU0@J2N7QTR9R3>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <aV4xUe0A4zMhPxU0@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_200409_424702_CC206ECE 
X-CRM114-Status: GOOD (  17.86  )
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



On 07/01/26 3:41 PM, Mark Rutland wrote:
> On Wed, Jan 07, 2026 at 02:37:51PM +0530, Anshuman Khandual wrote:
>>
>>
>> On 07/01/26 2:03 PM, Ryan Roberts wrote:
>>> On 07/01/2026 06:16, Anshuman Khandual wrote:
>>>> There is an implicit assumption about bm_pud[] being single entry PUD table
>>>> just like bp_pmd[] which is a single entry PMD table. Though only the later
>>>> gets asserted via NR_BM_PMD_TABLES. Hence let's add a similar check for PUD
>>>> table as well.
>>>>
>>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>>> Cc: Will Deacon <will@kernel.org>
>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>> Cc: linux-kernel@vger.kernel.org
>>>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>>>> ---
>>>>  arch/arm64/mm/fixmap.c | 3 +++
>>>>  1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
>>>> index c5c5425791da..e02594be8b8e 100644
>>>> --- a/arch/arm64/mm/fixmap.c
>>>> +++ b/arch/arm64/mm/fixmap.c
>>>> @@ -23,8 +23,11 @@ static_assert(FIXADDR_TOT_START > PCI_IO_END);
>>>>  	SPAN_NR_ENTRIES(FIXADDR_TOT_START, FIXADDR_TOP, PMD_SHIFT)
>>>>  #define NR_BM_PMD_TABLES \
>>>>  	SPAN_NR_ENTRIES(FIXADDR_TOT_START, FIXADDR_TOP, PUD_SHIFT)
>>>> +#define NR_BM_PUD_TABLES \
>>>> +	SPAN_NR_ENTRIES(FIXADDR_TOT_START, FIXADDR_TOP, P4D_SHIFT)
>>>>  
>>>>  static_assert(NR_BM_PMD_TABLES == 1);
>>>> +static_assert(NR_BM_PUD_TABLES == 1);
>>>
>>> But if there is only one PMD table, there must only be one PUD table (and one
>>> P4D table, and one PGD table) by definition. So I don't think this is checking
>>> anything that the existing PMD table check is not.
>>
>> Agreed but should not this check help tighten this code up given that bm_pud[]
>> array gets used for possible PUD entries ?
> 
> An assert isn't going to help with code generation, so this patch alone is not
> useful. When I last looked at actually ommiting the table in various
> configurations, it was more trouble than it was worth.
> 
> As Ryan said, we deliberately only added the assert for the PMD level,
> and it's sufficient as-is. That happened in commit:
> 
>   414c109bdf49 ("arm64: mm: always map fixmap at page granularity")
> 
> ... where the commit message said:
> 
>     Our VA layout means that the fixmap will always fall within a single PMD
>     table (and consequently, within a single PUD/P4D/PGD entry), which we
>     can verify at compile time with a static_assert(). With that assert a
>     number of runtime warnings become impossible, and are removed.
> 
> Please leave this as-is.

Alright, makes sense.

