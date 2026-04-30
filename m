Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B30FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 15:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApFrUh5FarYdO6nt+MsSg/peQgwTG3GCtu81bz6PLmo=; b=3zIWh45z8L2iHPXG1tN3vZWu4q
	ZsRUWrGrBq7fez1uVmq3nbAF1pqossBT1OiBRjZsnJK89tZa7QRfOMn/mTzybr5R9VFRfywoRafch
	BlzO+4Elm4I9mHUffT/j2y2n9qVoHzXd+ljCBCOHf7aG9IKnq8yaEQnBNUIIjGjgGAvc5MI1jMqwZ
	TqWIqCkVmFh0h/u0K36AK6MmFqTP/9MDZv+VsCTQPhxhr2WcqpwlrqSXgtCBMC8ppxYfXI1i1h2EW
	hj6AIk0eWnEAP8g5BudkhjAHubQTmap0QaBAx+VINI3G7P+ceeYHrlUVaroKTg4ZgWrkOxq+6zd0j
	VlMVGuvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wISru-00000005bcV-3pXp;
	Thu, 30 Apr 2026 14:59:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wISrr-00000005bbi-2s1Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 14:59:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32B5932D1;
	Thu, 30 Apr 2026 07:59:46 -0700 (PDT)
Received: from [10.57.63.15] (unknown [10.57.63.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 912EA3F763;
	Thu, 30 Apr 2026 07:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777561191; bh=ayVxcgQfwwSkiYRHAklcSV8NIvlVXSWC568OxK1SurY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qpc/KyHQgKiUH936WweG6ncqtAgdygxMgTH4OdofPCpXXPGFbHkPZ9N8aBWpnkiuE
	 qoBwD+mzGGMPzAPGqOHTeR/jcZuCa5lmFVzDK5mN1xjOIfAQ+M83sif94kTwOtxOTn
	 0mAC0Bu9+FHXRd7ix234amEaj9+7jXZg5Fu/iDEg=
Message-ID: <c0bcef12-6837-414a-960c-da3cf3948308@arm.com>
Date: Thu, 30 Apr 2026 16:59:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: smccc: Fix Arm SMCCC SOC_ID name call
To: Sudeep Holla <sudeep.holla@arm.com>,
 Paul Benoit <paul@os.amperecomputing.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250902172053.304911-1-andre.przywara@arm.com>
 <20250903-great-savvy-bloodhound-38c1ca@sudeepholla>
 <20250903-loutish-orangutan-of-experience-3dcfda@sudeepholla>
 <cc8000c0-e457-4bfc-94de-aeeddacab23b@os.amperecomputing.com>
 <20250904-powerful-futuristic-tench-bcebd4@sudeepholla>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20250904-powerful-futuristic-tench-bcebd4@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_075955_890152_EEB0EB31 
X-CRM114-Status: GOOD (  30.60  )
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

is there any update on this?
One more thought below ...

On 9/4/25 16:29, Sudeep Holla wrote:
> On Wed, Sep 03, 2025 at 05:38:44PM -0400, Paul Benoit wrote:
>> On 9/3/2025 10:49 AM, Sudeep Holla wrote:
>>> On Wed, Sep 03, 2025 at 03:23:58PM +0100, Sudeep Holla wrote:
>>>> On Tue, Sep 02, 2025 at 06:20:53PM +0100, Andre Przywara wrote:
>>>>> Commit 5f9c23abc477 ("firmware: smccc: Support optional Arm SMCCC SOC_ID
>>>>> name") introduced the SOC_ID name string call, which reports a human
>>>>> readable string describing the SoC, as returned by firmware.
>>>>> The SMCCC spec v1.6 describes this feature as AArch64 only, since we rely
>>>>> on 8 characters to be transmitted per register. Consequently the SMCCC
>>>>> call must use the AArch64 calling convention, which requires bit 30 of
>>>>> the FID to be set. The spec is a bit confusing here, since it mentions
>>>>> that in the parameter description ("2: SoC name (optionally implemented for
>>>>> SMC64 calls, ..."), but still prints the FID explicitly as 0x80000002.
>>>>> But as this FID is using the SMC32 calling convention (correct for the
>>>>> other two calls), it will not match what mainline TF-A is expecting, so
>>>>> any call would return NOT_SUPPORTED.
>>>>>
>>>>
>>>> Good catch and I must admit I completely missed it inspite of discussing
>>>> 32b vs 64b FID around the same time this was introduced.
>>>>
>>>>> Add a 64-bit version of the ARCH_SOC_ID FID macro, and use that for the
>>>>> SoC name version of the call.
>>>>>
>>>>> Fixes: 5f9c23abc477 ("firmware: smccc: Support optional Arm SMCCC SOC_ID name")
>>>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>>>> ---
>>>>> Hi,
>>>>>
>>>>> as somewhat expected, this now fails on an Ampere machine, which
>>>>> reported a string in /sys/devices/soc0/machine before, but is now missing
>>>>> this file.
>>>>> Any idea what's the best way to handle this? Let the code try the 32-bit
>>>>> FID, when the 64-bit one fails? Or handle this as some kind of erratum?
>>>>>
>>>>
>>>> Not sure about it yet. Erratum seems good option so that we can avoid
>>>> others getting it wrong too as they might just run the kernel and be happy
>>>> if the machine sysfs shows up as we decided to do fallback to 32b FID.
>>>>
>>>> I will start a discussion to get the spec updated and pushed out and see
>>>> how that goes.
>>>>
>>>> The change itself looks good and happy to get it merged once we know
>>>> what is the best approach(erratum vs fallback).
>>>>
>>>
>>> Looking at the SMCCC spec(DEN0028 v1.6 G Edition) ->
>>> Section 7.4.6 Implementation responsibilities
>>>
>>> If implemented, the firmware:
>>> ...
>>> • must not implement SoC_ID_type == 2 for SMC32.
>>> • can optionally implement SoC_ID_type == 2 for SMC64 (Function ID 0xC000_0002),
>>> ...
>>>
>>> So Ampere is not spec conformant here and hence I prefer to handle it as
>>> erratum. Hopefully we can use SOC_ID version and revision to keep the scope
>>> of erratum confined to smallest set of platforms.
>>>
>>> Paul,
>>>
>>> Thoughts ?
>>>
>>
>> Am I correctly understanding that, if the SMC64 SOC_ID Name call fails,
>> rather than an unconditional fallback to the SMC32 call, the SMC32
>> fallback would only be occurring under the proposed erratum?
>>
> 
> Correct, if we have unconditional fallback to the SMC32 call, then there
> is a chance that this issue gets carried into newer Ampere systems as f/w
> gets copied as well as other vendors will also not notice the issue if
> they make similar mistake as the kernel silent makes a SMC32 call.
> 
> We do need details of  the SoC revision and version for which we need to
> apply this workaround/erratum.

So this looks more like a firmware erratum than a SoC specific one, 
right? So I wonder if any SoC specific IDs are really appropriate here. 
Is there some firmware version we can read via DMI or so to identify 
affected systems?
Or shall we use a probably much easier SoC or even MIDR check anyway, 
since it's just a fallback? As in: try smc64, if that fails and if it's 
a core that ever shipped with that affected firmware, try smc32? I think 
there is not much harm in trying those FIDs, so we just limit the scope 
to Ampere cores - even though that's technically not the right method by 
the book?

Cheers,
Andre



> 
>> I brought this issue up at a weekly team meeting today, and I'll also be
>> communicating with the Ampere Computing firmware team regarding this
>> issue.
> 
> Thanks!
> 


