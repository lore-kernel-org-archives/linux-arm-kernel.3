Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD95CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 14:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dnd1bX0pr3hK6Ikbbvz/Jke+2CcjZleJZglgA4t1wTM=; b=TnM+tJQLgrKDlXm2FdEc0VF/PO
	Sj6ZFUt8kgXzQbyE6E3AtiU/BfDq/4B03Ua3CdB7kNlWq20EX2Z0GquGa9sCNXAUn8CXl8A/9K4UN
	SxnfymGwxbCaU1imwE/q17DZ4XMjr0RD0InI7KEzNGYcodeCKnXWiyRggwjCfHXEySXLRCmJAldHL
	Gn2OxGUY0/+d/wDsi0azbvLBNif+7m7Li6cTW6jLmAc/mb6z7pCnvKwhLrYlCSJeVfTK3YNqb29zZ
	jrLkuA4iCLkmT47tRRJ1Rdetgtpn1kLLQoBfQTKw3Kf+ppQ9PyzSSUdPN1gn6diAZHWA1r+JE8di7
	ttxas/3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnnS-0000000Gy7E-1gWz;
	Tue, 12 May 2026 14:09:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnnP-0000000Gy4z-2Ye4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 14:09:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 787D9165C;
	Tue, 12 May 2026 07:09:07 -0700 (PDT)
Received: from [10.57.33.240] (unknown [10.57.33.240])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 079253F836;
	Tue, 12 May 2026 07:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778594952; bh=FabVZhOZB1uonc8YK0s1vwGU1P3Po5fM+FR8VPSJIAU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IGD1VT8NvuVMDyZ+D8KoPMKISbi0exI1QYq7+sh2n18jN1Q88kOhYfTML+RbTs4rE
	 u1P3tY1/4+Q7QFYHh8+dm0Nvxw1YugVAja850MLudwPIam80fEd+gpLjb9L9X1158K
	 0hGoa283rG1u8luQHzHoKY21rh3i3tFQJiK/f6hg=
Message-ID: <506bf1b9-dfc4-4717-b26b-835c331d23c4@arm.com>
Date: Tue, 12 May 2026 16:09:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: smccc: Fix Arm SMCCC SOC_ID name call
To: Paul Benoit <paul@os.amperecomputing.com>,
 Sudeep Holla <sudeep.holla@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250902172053.304911-1-andre.przywara@arm.com>
 <20250903-great-savvy-bloodhound-38c1ca@sudeepholla>
 <20250903-loutish-orangutan-of-experience-3dcfda@sudeepholla>
 <cc8000c0-e457-4bfc-94de-aeeddacab23b@os.amperecomputing.com>
 <20250904-powerful-futuristic-tench-bcebd4@sudeepholla>
 <c0bcef12-6837-414a-960c-da3cf3948308@arm.com>
 <c72b6d61-d532-48f0-add0-4f44051b4ae9@os.amperecomputing.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <c72b6d61-d532-48f0-add0-4f44051b4ae9@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_070915_861580_02881F5C 
X-CRM114-Status: GOOD (  41.41  )
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

Hi Paul,

many thanks for the answer, and apologies for the delay (was on holidays).

On 5/1/26 22:14, Paul Benoit wrote:
> On 4/30/2026 10:59 AM, Andre Przywara wrote:
>> [You don't often get email from andre.przywara@arm.com. Learn why this 
>> is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Hi Paul,
>>
>> is there any update on this?
>> One more thought below ...
>>
> 
> Hi Andre,
> 
> Using the incorrect SMC32 vs. the correct SMC64 interface, for SOC_ID
> Name, was addressed by Ampere firmware some months back.
> 
> In addition to recent firmware now responding to a SMC64 CC SOC_ID Name
> request, it will continue to respond to an incorrect/broken SMC32
> request and return the SOC_ID Name string packed in 64-bit registers.
> This will allow Linux kernels 6.15+, incorrectly using SMC32 to get the
> SOC_ID Name, to continue to work with new Ampere firmware versions.

OK, many thanks for the information, that seems to be a good solution.

> In other words, unless any other vendors also implemented SOC_ID Name as
> SMC32 in their firmware, I think we can let the Ampere firmware handle
> the SMC32 vs. SMC64 mix-up and keep the handling of it out of the Linux
> kernel.

But I think availability of the machines predates the "some month back" 
period you mention above?
So it would only work if users would update the firmware?

> It should now be safe to make the SMC32->SMC64 SOC_ID Name change in
> Linux.

So I wonder if would still need a quirk for AmpereOne. I guess we can't 
query the TF-A build version easily, and a DMI quirk probably doesn't 
work either, judging by the dmidecode output of one machine I looked at.
So I was wondering if we should employ the following algorithm:

	- do call with 64-bit FID
	- if (ret == -1) && (soc_id == jep106:0a16:0004)
		- try 32-bit FID

Would that work? That checks for the SoC, not the firmware version, but 
seems way easier to implement and would cover all cases.

Thoughts?

Cheers,
Andre

> 
> 
>> On 9/4/25 16:29, Sudeep Holla wrote:
>>> On Wed, Sep 03, 2025 at 05:38:44PM -0400, Paul Benoit wrote:
>>>> On 9/3/2025 10:49 AM, Sudeep Holla wrote:
>>>>> On Wed, Sep 03, 2025 at 03:23:58PM +0100, Sudeep Holla wrote:
>>>>>> On Tue, Sep 02, 2025 at 06:20:53PM +0100, Andre Przywara wrote:
>>>>>>> Commit 5f9c23abc477 ("firmware: smccc: Support optional Arm SMCCC 
>>>>>>> SOC_ID
>>>>>>> name") introduced the SOC_ID name string call, which reports a human
>>>>>>> readable string describing the SoC, as returned by firmware.
>>>>>>> The SMCCC spec v1.6 describes this feature as AArch64 only, since 
>>>>>>> we rely
>>>>>>> on 8 characters to be transmitted per register. Consequently the 
>>>>>>> SMCCC
>>>>>>> call must use the AArch64 calling convention, which requires bit 
>>>>>>> 30 of
>>>>>>> the FID to be set. The spec is a bit confusing here, since it 
>>>>>>> mentions
>>>>>>> that in the parameter description ("2: SoC name (optionally 
>>>>>>> implemented for
>>>>>>> SMC64 calls, ..."), but still prints the FID explicitly as 
>>>>>>> 0x80000002.
>>>>>>> But as this FID is using the SMC32 calling convention (correct 
>>>>>>> for the
>>>>>>> other two calls), it will not match what mainline TF-A is 
>>>>>>> expecting, so
>>>>>>> any call would return NOT_SUPPORTED.
>>>>>>>
>>>>>>
>>>>>> Good catch and I must admit I completely missed it inspite of 
>>>>>> discussing
>>>>>> 32b vs 64b FID around the same time this was introduced.
>>>>>>
>>>>>>> Add a 64-bit version of the ARCH_SOC_ID FID macro, and use that 
>>>>>>> for the
>>>>>>> SoC name version of the call.
>>>>>>>
>>>>>>> Fixes: 5f9c23abc477 ("firmware: smccc: Support optional Arm SMCCC 
>>>>>>> SOC_ID name")
>>>>>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>>>>>> ---
>>>>>>> Hi,
>>>>>>>
>>>>>>> as somewhat expected, this now fails on an Ampere machine, which
>>>>>>> reported a string in /sys/devices/soc0/machine before, but is now 
>>>>>>> missing
>>>>>>> this file.
>>>>>>> Any idea what's the best way to handle this? Let the code try the 
>>>>>>> 32-bit
>>>>>>> FID, when the 64-bit one fails? Or handle this as some kind of 
>>>>>>> erratum?
>>>>>>>
>>>>>>
>>>>>> Not sure about it yet. Erratum seems good option so that we can avoid
>>>>>> others getting it wrong too as they might just run the kernel and 
>>>>>> be happy
>>>>>> if the machine sysfs shows up as we decided to do fallback to 32b 
>>>>>> FID.
>>>>>>
>>>>>> I will start a discussion to get the spec updated and pushed out 
>>>>>> and see
>>>>>> how that goes.
>>>>>>
>>>>>> The change itself looks good and happy to get it merged once we know
>>>>>> what is the best approach(erratum vs fallback).
>>>>>>
>>>>>
>>>>> Looking at the SMCCC spec(DEN0028 v1.6 G Edition) ->
>>>>> Section 7.4.6 Implementation responsibilities
>>>>>
>>>>> If implemented, the firmware:
>>>>> ...
>>>>> • must not implement SoC_ID_type == 2 for SMC32.
>>>>> • can optionally implement SoC_ID_type == 2 for SMC64 (Function ID 
>>>>> 0xC000_0002),
>>>>> ...
>>>>>
>>>>> So Ampere is not spec conformant here and hence I prefer to handle 
>>>>> it as
>>>>> erratum. Hopefully we can use SOC_ID version and revision to keep 
>>>>> the scope
>>>>> of erratum confined to smallest set of platforms.
>>>>>
>>>>> Paul,
>>>>>
>>>>> Thoughts ?
>>>>>
>>>>
>>>> Am I correctly understanding that, if the SMC64 SOC_ID Name call fails,
>>>> rather than an unconditional fallback to the SMC32 call, the SMC32
>>>> fallback would only be occurring under the proposed erratum?
>>>>
>>>
>>> Correct, if we have unconditional fallback to the SMC32 call, then there
>>> is a chance that this issue gets carried into newer Ampere systems as 
>>> f/w
>>> gets copied as well as other vendors will also not notice the issue if
>>> they make similar mistake as the kernel silent makes a SMC32 call.
>>>
>>> We do need details of  the SoC revision and version for which we need to
>>> apply this workaround/erratum.
>>
>> So this looks more like a firmware erratum than a SoC specific one,
>> right? So I wonder if any SoC specific IDs are really appropriate here.
>> Is there some firmware version we can read via DMI or so to identify
>> affected systems?
>> Or shall we use a probably much easier SoC or even MIDR check anyway,
>> since it's just a fallback? As in: try smc64, if that fails and if it's
>> a core that ever shipped with that affected firmware, try smc32? I think
>> there is not much harm in trying those FIDs, so we just limit the scope
>> to Ampere cores - even though that's technically not the right method by
>> the book?
>>
>> Cheers,
>> Andre
>>
>>
>>
>>>
>>>> I brought this issue up at a weekly team meeting today, and I'll 
>>>> also be
>>>> communicating with the Ampere Computing firmware team regarding this
>>>> issue.
>>>
>>> Thanks!
>>>
>>
> 


