Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8566DCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 16:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wqi2Qhq3MouIFt/EJ2cgZO+V0H5RQH70Oj6/kcDM0M=; b=hvEktZngF1wxrg8pqcPeXJqIxl
	8xWVI6O5sSjZetQC9CxQjVTPUJUAZZdiSqBqD7Z4wEkI4HcyElbVtBXahe24Ao9lrA6Y9JXrlOONj
	BDTkf6AYrY9s1Pl2eOE1zkSBuYseXBCTIVxu7ct3MU1YDqmpd91iagzz5DWPJxFx0BfATqOFw3NuD
	ziWpFnb8WgjRVaZ+3W/BLubo/fah96oDjFqvYsUaL7Y3EXpmYLnRrwb6to/kfOwJDJMXnGMHvnhWg
	3I7Jg+1UGpDtBQDZhAhI71X5KXvuQQazXlv9ADuUtqTob2cHRNjmZz5HMaaMvUREDjR30NqQ8i07f
	YaXEs2uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMsw-000000029t6-2O89;
	Tue, 19 May 2026 16:01:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMsu-000000029rz-19Tb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 16:01:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FBAF1E7D;
	Tue, 19 May 2026 09:01:23 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C2573F632;
	Tue, 19 May 2026 09:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779206488; bh=l3k6l8tzEhU7aoN40wF1AjQQ4RQ8MwaIM0lRFABoyMU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B/3qVKhlZa/1n+owfIC+0x684FNqBADZ/dMvfdLEri1b+VSltivN1nq3LCCK8DDdR
	 48EgkuSPddQu+TDvfRsbSdxD7ni9nMiG9R0GBPCdKypfwevQmvflKlv79We8i0I1x/
	 P3+4+VkWyzYJq4JQnrUaUQtqSTfx9ni2KsgCLzP0=
Message-ID: <f154f937-0b6a-4266-9073-977f25d00758@arm.com>
Date: Tue, 19 May 2026 18:01:25 +0200
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
 <506bf1b9-dfc4-4717-b26b-835c331d23c4@arm.com>
 <2ec94be2-19f9-46c5-a2ad-78711ddfeef8@os.amperecomputing.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <2ec94be2-19f9-46c5-a2ad-78711ddfeef8@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_090132_583281_03EC13EF 
X-CRM114-Status: GOOD (  45.33  )
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

Hi Paul, Sudeep,

On 5/18/26 23:14, Paul Benoit wrote:
> On 5/12/2026 10:09 AM, Andre Przywara wrote:
>> Hi Paul,
>>
>> many thanks for the answer, and apologies for the delay (was on 
>> holidays).
>>
>> On 5/1/26 22:14, Paul Benoit wrote:
>>> On 4/30/2026 10:59 AM, Andre Przywara wrote:
>>>> [You don't often get email from andre.przywara@arm.com. Learn why 
>>>> this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>>
>>>> Hi Paul,
>>>>
>>>> is there any update on this?
>>>> One more thought below ...
>>>>
>>>
>>> Hi Andre,
>>>
>>> Using the incorrect SMC32 vs. the correct SMC64 interface, for SOC_ID
>>> Name, was addressed by Ampere firmware some months back.
>>>
>>> In addition to recent firmware now responding to a SMC64 CC SOC_ID Name
>>> request, it will continue to respond to an incorrect/broken SMC32
>>> request and return the SOC_ID Name string packed in 64-bit registers.
>>> This will allow Linux kernels 6.15+, incorrectly using SMC32 to get the
>>> SOC_ID Name, to continue to work with new Ampere firmware versions.
>>
>> OK, many thanks for the information, that seems to be a good solution.
>>
>>> In other words, unless any other vendors also implemented SOC_ID Name as
>>> SMC32 in their firmware, I think we can let the Ampere firmware handle
>>> the SMC32 vs. SMC64 mix-up and keep the handling of it out of the Linux
>>> kernel.
>>
>> But I think availability of the machines predates the "some month 
>> back" period you mention above?
>> So it would only work if users would update the firmware?
> 
> Correct.  I had already discussed that case with colleagues at Ampere,
> and, rather than having quirk/errata handling in the Linux kernel, we
> are ok with requiring that systems, with older firmware, be updated
> before running future Linux kernels.  That shouldn't pose a big risk/
> problem as I'm not yet aware of anything besides some of my lscpu
> experiments that use the newish SMC CC SOC_ID Name.

Fair enough, it's indeed not breaking the world if the SOC_ID name call 
doesn't work. And given that most other platforms would be broken, given 
this bug, I guess there are not many people out there relying on it yet.

Sudeep, do you agree to just ignore that case? So the original patch 
would be good to go, I think? Let me know if you need anything from me 
still then.

>>> It should now be safe to make the SMC32->SMC64 SOC_ID Name change in
>>> Linux.
>>
>> So I wonder if would still need a quirk for AmpereOne. I guess we 
>> can't query the TF-A build version easily, and a DMI quirk probably 
>> doesn't work either, judging by the dmidecode output of one machine I 
>> looked at.
>> So I was wondering if we should employ the following algorithm:
>>
>>      - do call with 64-bit FID
>>      - if (ret == -1) && (soc_id == jep106:0a16:0004)
>>          - try 32-bit FID
>>
>> Would that work? That checks for the SoC, not the firmware version, 
>> but seems way easier to implement and would cover all cases.
>>
>> Thoughts?
> 
> If it is deemed necessary to have the SMC32 quirk/fallback handling in
> the Linux kernel, then, yes, it would look something like the above.
> That is the correct soc_id value that you would want for the check.

Thanks for the confirmation! I had this coded up, and tested on the FVP, 
by tweaking TF-A to emulate the Ampere firmware behaviour. But if we 
don't need it, even better.

Cheers,
Andre

>>
>> Cheers,
>> Andre
>>
>>>
>>>
>>>> On 9/4/25 16:29, Sudeep Holla wrote:
>>>>> On Wed, Sep 03, 2025 at 05:38:44PM -0400, Paul Benoit wrote:
>>>>>> On 9/3/2025 10:49 AM, Sudeep Holla wrote:
>>>>>>> On Wed, Sep 03, 2025 at 03:23:58PM +0100, Sudeep Holla wrote:
>>>>>>>> On Tue, Sep 02, 2025 at 06:20:53PM +0100, Andre Przywara wrote:
>>>>>>>>> Commit 5f9c23abc477 ("firmware: smccc: Support optional Arm 
>>>>>>>>> SMCCC SOC_ID
>>>>>>>>> name") introduced the SOC_ID name string call, which reports a 
>>>>>>>>> human
>>>>>>>>> readable string describing the SoC, as returned by firmware.
>>>>>>>>> The SMCCC spec v1.6 describes this feature as AArch64 only, 
>>>>>>>>> since we rely
>>>>>>>>> on 8 characters to be transmitted per register. Consequently 
>>>>>>>>> the SMCCC
>>>>>>>>> call must use the AArch64 calling convention, which requires 
>>>>>>>>> bit 30 of
>>>>>>>>> the FID to be set. The spec is a bit confusing here, since it 
>>>>>>>>> mentions
>>>>>>>>> that in the parameter description ("2: SoC name (optionally 
>>>>>>>>> implemented for
>>>>>>>>> SMC64 calls, ..."), but still prints the FID explicitly as 
>>>>>>>>> 0x80000002.
>>>>>>>>> But as this FID is using the SMC32 calling convention (correct 
>>>>>>>>> for the
>>>>>>>>> other two calls), it will not match what mainline TF-A is 
>>>>>>>>> expecting, so
>>>>>>>>> any call would return NOT_SUPPORTED.
>>>>>>>>>
>>>>>>>>
>>>>>>>> Good catch and I must admit I completely missed it inspite of 
>>>>>>>> discussing
>>>>>>>> 32b vs 64b FID around the same time this was introduced.
>>>>>>>>
>>>>>>>>> Add a 64-bit version of the ARCH_SOC_ID FID macro, and use that 
>>>>>>>>> for the
>>>>>>>>> SoC name version of the call.
>>>>>>>>>
>>>>>>>>> Fixes: 5f9c23abc477 ("firmware: smccc: Support optional Arm 
>>>>>>>>> SMCCC SOC_ID name")
>>>>>>>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>>>>>>>> ---
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> as somewhat expected, this now fails on an Ampere machine, which
>>>>>>>>> reported a string in /sys/devices/soc0/machine before, but is 
>>>>>>>>> now missing
>>>>>>>>> this file.
>>>>>>>>> Any idea what's the best way to handle this? Let the code try 
>>>>>>>>> the 32-bit
>>>>>>>>> FID, when the 64-bit one fails? Or handle this as some kind of 
>>>>>>>>> erratum?
>>>>>>>>>
>>>>>>>>
>>>>>>>> Not sure about it yet. Erratum seems good option so that we can 
>>>>>>>> avoid
>>>>>>>> others getting it wrong too as they might just run the kernel 
>>>>>>>> and be happy
>>>>>>>> if the machine sysfs shows up as we decided to do fallback to 
>>>>>>>> 32b FID.
>>>>>>>>
>>>>>>>> I will start a discussion to get the spec updated and pushed out 
>>>>>>>> and see
>>>>>>>> how that goes.
>>>>>>>>
>>>>>>>> The change itself looks good and happy to get it merged once we 
>>>>>>>> know
>>>>>>>> what is the best approach(erratum vs fallback).
>>>>>>>>
>>>>>>>
>>>>>>> Looking at the SMCCC spec(DEN0028 v1.6 G Edition) ->
>>>>>>> Section 7.4.6 Implementation responsibilities
>>>>>>>
>>>>>>> If implemented, the firmware:
>>>>>>> ...
>>>>>>> • must not implement SoC_ID_type == 2 for SMC32.
>>>>>>> • can optionally implement SoC_ID_type == 2 for SMC64 (Function 
>>>>>>> ID 0xC000_0002),
>>>>>>> ...
>>>>>>>
>>>>>>> So Ampere is not spec conformant here and hence I prefer to 
>>>>>>> handle it as
>>>>>>> erratum. Hopefully we can use SOC_ID version and revision to keep 
>>>>>>> the scope
>>>>>>> of erratum confined to smallest set of platforms.
>>>>>>>
>>>>>>> Paul,
>>>>>>>
>>>>>>> Thoughts ?
>>>>>>>
>>>>>>
>>>>>> Am I correctly understanding that, if the SMC64 SOC_ID Name call 
>>>>>> fails,
>>>>>> rather than an unconditional fallback to the SMC32 call, the SMC32
>>>>>> fallback would only be occurring under the proposed erratum?
>>>>>>
>>>>>
>>>>> Correct, if we have unconditional fallback to the SMC32 call, then 
>>>>> there
>>>>> is a chance that this issue gets carried into newer Ampere systems 
>>>>> as f/w
>>>>> gets copied as well as other vendors will also not notice the issue if
>>>>> they make similar mistake as the kernel silent makes a SMC32 call.
>>>>>
>>>>> We do need details of  the SoC revision and version for which we 
>>>>> need to
>>>>> apply this workaround/erratum.
>>>>
>>>> So this looks more like a firmware erratum than a SoC specific one,
>>>> right? So I wonder if any SoC specific IDs are really appropriate here.
>>>> Is there some firmware version we can read via DMI or so to identify
>>>> affected systems?
>>>> Or shall we use a probably much easier SoC or even MIDR check anyway,
>>>> since it's just a fallback? As in: try smc64, if that fails and if it's
>>>> a core that ever shipped with that affected firmware, try smc32? I 
>>>> think
>>>> there is not much harm in trying those FIDs, so we just limit the scope
>>>> to Ampere cores - even though that's technically not the right 
>>>> method by
>>>> the book?
>>>>
>>>> Cheers,
>>>> Andre
>>>>
>>>>
>>>>
>>>>>
>>>>>> I brought this issue up at a weekly team meeting today, and I'll 
>>>>>> also be
>>>>>> communicating with the Ampere Computing firmware team regarding this
>>>>>> issue.
>>>>>
>>>>> Thanks!
>>>>>
>>>>
>>>
>>
> 


