Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2C4C55AB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 11:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d++cm3zDVsP1AhhvUlfKtz1rPN4rkrCy4TnbVllN/NA=; b=h8H2CLiNdm86qanReb8gwRDsdA
	66oWwfzkOOS7ACwKh8GNL/6NQ6GIbAhtfDEL7MWvSc6aSeBhY+3B6XEFb9FevgDbr5BYkm6D73x4G
	tlUOyYA2Gqpudq9fH7l8eytdrwYsZtiJzO+Ng/O0ia73jZmvyr4aVK8jTGw6ZUa6ksj54UsvBmIPB
	6h5aGZ3saFzusje50bqUXMArN6WQbwiqeVofp3KMHuAOmP7/BKAraLzZb2fcvGrGk27NVT3ldCLaE
	9GVDoIz6dz0HBe9qDvJAmdvGvGRxcgkRSm82frez3i6Hz1tsoYNCIB0jX1zLz9/70+W6YAuFKynY5
	HNnhRaXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtOtm-0000000ESFb-3asZ;
	Fri, 20 Feb 2026 11:42:18 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtOtj-0000000ESFG-2y2Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 11:42:17 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4362507f396so2000908f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Feb 2026 03:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771587734; x=1772192534; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d++cm3zDVsP1AhhvUlfKtz1rPN4rkrCy4TnbVllN/NA=;
        b=b4jkr+pukEcdfHQkFA0vmyN03pKu1UMVZkVUsAuc4ctLyY3F3HDkeEbf0xJggCkuAG
         aQWhcDr6hTREVRnlpES6t9cBkZCWIwZAY2nClZEmcXRboyFeoAlNZvpSCjfK4gQ8bTRy
         AIeCH9CbDJ/H75XM0xqP9N1hQTL7n0FVsM25MlAGawU2ufJXOR+ClpeIWaUo81cTu0cn
         DgI6U8CevIgAkEmiVEILuDVsJqjJh++x97x4Q5JDBD8e6TThPmzX/KX8F2YD8IR/iUGn
         n9R3S4psE54AyWbtGZq+BvxMWF9aDno+xJwVephYbzb2nZKfs5QEokFy/ucBYFXodNF0
         GDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771587734; x=1772192534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d++cm3zDVsP1AhhvUlfKtz1rPN4rkrCy4TnbVllN/NA=;
        b=qxqZ0RWXO2sCqg0pH09yOhU2FCstJ/OVTIMFtmgcqeIlhXm7fGDcxQleXrK6BjnopD
         OYPs157mbIL/mJiSnOPuv+cd0D+01HVvBDFHPsIIGhFFPonatSlmJiRZsoKNKUkVEkSP
         ySW/igzWeJQJjmj4aaKwETY+xyejRnnaxlVAWk9dbxOZPDyVPwn+w/VnJ2sH8xcG/xqe
         yIlJ5ki7G/KDRqNRGoi3JsHgafhDhJKZM441V39mgJg3hpcGU10kU6cajTsshHKh10tB
         ZpXyQwIC+QQFsMliDID34EnHv/dJhKnWmwEjhNg/zD54oYQfeR4yihr30Lzyeid1YT4E
         Vr0w==
X-Forwarded-Encrypted: i=1; AJvYcCUiQansbXKGJYNa7e5RnW1EShL39BJ1V9phSVGoMx5o9WdgQZtp+xvb+zC1XIXGVCViZ/DFq7qPM36QjaTUWUu0@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2cKXg9ceOxlXp+dATrmzEQnVAWDBrmOPZkcZV6NlQ2cZ97fU0
	NSmXTm/mp1/vZJkaugWSY/WCX6bt0REnSsU92ev1XyBFXG6Oij0e8FPP3mmAeW+Q3rM=
X-Gm-Gg: AZuq6aI9OeZ++uRItNa9EJgaOT50u8ELGRwEd19MmvitMyQ3eWz7BsVnfSho3qogr0R
	MObelZHvL+5C94wDVYa8prKCOcL4rPQFKYuJLNWKzarC4RbFGrpyUHi+5OYxS2h+hNiVFYDK9CH
	QKTeGqlBBOCoSTY8vBEX1jDl0i/lWkU9rjfojg9FZUp5mXipnenJ7yqoGz9SsOCiLGZEE0D6+F9
	ik8ClVPhc4lRr6z2RSMlIEIg9UWhbiYVsIU6KWUi0aCNirUsoo80MSbyycdQcHni3PvOQ0MLCk6
	0cqkBNsvvUor014SPbEE3GQ4VMCFMrt7+kMXTsa/cRjWjczgl/D3YA9YmkGIvUsNauTVDrU1+D+
	ndDtvvygQ9xrNuoYl4CSGrONFUjpmXTzk2U85N2E2AhxmzV2Sq/0/d+GFrf/EQN2SmNxRrgWJHW
	yOdwgdDO3S4f/KFKfGmK0NUlGVkp9G
X-Received: by 2002:a5d:64e9:0:b0:432:5b81:483 with SMTP id ffacd0b85a97d-43958e0a920mr15216873f8f.24.1771587733424;
        Fri, 20 Feb 2026 03:42:13 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abe3b3sm62999985f8f.18.2026.02.20.03.42.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 03:42:13 -0800 (PST)
Message-ID: <22de3d44-b266-4ba3-af3a-67159c9742d1@linaro.org>
Date: Fri, 20 Feb 2026 11:42:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: Disable TRBE Trace Buffer Unit when running
 in guest context
To: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>, kvmarm@lists.linux.dev,
 mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 Oliver Upton <oupton@kernel.org>, Leo Yan <leo.yan@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Fuad Tabba <tabba@google.com>
References: <20260216130959.19317-1-will@kernel.org>
 <86a4x8bw38.wl-maz@kernel.org>
 <d2f6877a-534d-4862-a61c-fb3cb5b96618@linaro.org>
 <868qcsbsbd.wl-maz@kernel.org>
 <076e013a-b66d-4985-9709-734d7184ad72@linaro.org>
 <867bscbpmp.wl-maz@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <867bscbpmp.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_034215_819756_C275B800 
X-CRM114-Status: GOOD (  50.77  )
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



On 16/02/2026 4:49 pm, Marc Zyngier wrote:
> On Mon, 16 Feb 2026 16:10:14 +0000,
> James Clark <james.clark@linaro.org> wrote:
>>
>>
>>
>> On 16/02/2026 3:51 pm, Marc Zyngier wrote:
>>> On Mon, 16 Feb 2026 15:05:10 +0000,
>>> James Clark <james.clark@linaro.org> wrote:
>>>>
>>>>
>>>>
>>>> On 16/02/2026 2:29 pm, Marc Zyngier wrote:
>>>>> On Mon, 16 Feb 2026 13:09:59 +0000,
>>>>> Will Deacon <will@kernel.org> wrote:
>>>>>>
>>>>>> The nVHE world-switch code relies on zeroing TRFCR_EL1 to disable trace
>>>>>> generation in guest context when self-hosted TRBE is in use by the host.
>>>>>>
>>>>>> Per D3.2.1 ("Controls to prohibit trace at Exception levels"), clearing
>>>>>> TRFCR_EL1 means that trace generation is prohibited at EL1 and EL0 but
>>>>>> per R_YCHKJ the Trace Buffer Unit will still be enabled if
>>>>>> TRBLIMITR_EL1.E is set. R_SJFRQ goes on to state that, when enabled, the
>>>>>> Trace Buffer Unit can perform address translation for the "owning
>>>>>> exception level" even when it is out of context.
>>>>>
>>>>> Great. So TRBE violates all the principles that we hold true in the
>>>>> architecture. Does SPE suffer from the same level of brokenness?
>>>>>
>>>>>> Consequently, we can end up in a state where TRBE performs speculative
>>>>>> page-table walks for a host VA/IPA in guest/hypervisor context depending
>>>>>> on the value of MDCR_EL2.E2TB, which changes over world-switch. The
>>>>>> result appears to be a heady mixture of data corruption and hardware
>>>>>> lockups.
>>>>>>
>>>>>> Extend the TRBE world-switch code to clear TRBLIMITR_EL1.E after
>>>>>> draining the buffer, restoring the register on return to the host.
>>>>>>
>>>>>> Cc: Marc Zyngier <maz@kernel.org>
>>>>>> Cc: Oliver Upton <oupton@kernel.org>
>>>>>> Cc: James Clark <james.clark@linaro.org>
>>>>>> Cc: Leo Yan <leo.yan@arm.com>
>>>>>> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
>>>>>> Cc: Fuad Tabba <tabba@google.com>
>>>>>> Fixes: a1319260bf62 ("arm64: KVM: Enable access to TRBE support for host")
>>>>>> Signed-off-by: Will Deacon <will@kernel.org>
>>>>>> ---
>>>>>>
>>>>>> NOTE: This is *untested* as I don't have a TRBE-capable device that can
>>>>>> run upstream but I noticed this by inspection when triaging occasional
>>>>>> hardware lockups on systems using a 6.12-based kernel with TRBE running
>>>>>> at the same time as a vCPU is loaded. This code has changed quite a bit
>>>>>> over time, so stable backports are not entirely straightforward.
>>>>>> Hopefully James/Leo/Suzuki can help us test if folks agree with the
>>>>>> general approach taken here.
>>>>>>
>>>>>>     arch/arm64/include/asm/kvm_host.h  |  1 +
>>>>>>     arch/arm64/kvm/hyp/nvhe/debug-sr.c | 36 ++++++++++++++++++++++--------
>>>>>>     2 files changed, 28 insertions(+), 9 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
>>>>>> index ac7f970c7883..a932cf043b83 100644
>>>>>> --- a/arch/arm64/include/asm/kvm_host.h
>>>>>> +++ b/arch/arm64/include/asm/kvm_host.h
>>>>>> @@ -746,6 +746,7 @@ struct kvm_host_data {
>>>>>>     		u64 pmscr_el1;
>>>>>>     		/* Self-hosted trace */
>>>>>>     		u64 trfcr_el1;
>>>>>> +		u64 trblimitr_el1;
>>>>>>     		/* Values of trap registers for the host before guest entry. */
>>>>>>     		u64 mdcr_el2;
>>>>>>     		u64 brbcr_el1;
>>>>>> diff --git a/arch/arm64/kvm/hyp/nvhe/debug-sr.c b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
>>>>>> index 2a1c0f49792b..fd389a26bc59 100644
>>>>>> --- a/arch/arm64/kvm/hyp/nvhe/debug-sr.c
>>>>>> +++ b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
>>>>>> @@ -57,12 +57,27 @@ static void __trace_do_switch(u64 *saved_trfcr, u64 new_trfcr)
>>>>>>     	write_sysreg_el1(new_trfcr, SYS_TRFCR);
>>>>>>     }
>>>>>>     -static bool __trace_needs_drain(void)
>>>>>> +static void __trace_drain_and_disable(void)
>>>>>>     {
>>>>>> -	if (is_protected_kvm_enabled() && host_data_test_flag(HAS_TRBE))
>>>>>> -		return read_sysreg_s(SYS_TRBLIMITR_EL1) & TRBLIMITR_EL1_E;
>>>>>> +	u64 *trblimitr_el1 = host_data_ptr(host_debug_state.trblimitr_el1);
>>>>>>     -	return host_data_test_flag(TRBE_ENABLED);
>>>>>> +	*trblimitr_el1 = 0;
>>>>>> +
>>>>>> +	if (is_protected_kvm_enabled()) {
>>>>>> +		if (!host_data_test_flag(HAS_TRBE))
>>>>>> +			return;
>>>>>> +	} else {
>>>>>> +		if (!host_data_test_flag(TRBE_ENABLED))
>>>>>> +			return;
>>>>>> +	}
>>>>>> +
>>>>>> +	*trblimitr_el1 = read_sysreg_s(SYS_TRBLIMITR_EL1);
>>>>>> +	if (*trblimitr_el1 & TRBLIMITR_EL1_E) {
>>>>>> +		isb();
>>>>>> +		tsb_csync();
>>>>>> +		write_sysreg_s(0, SYS_TRBLIMITR_EL1);
>>>>>> +		isb();
>>>>
>>>> The TRBE driver might do an extra drain here as a workaround. Hard to
>>>> tell if it's actually required in this case (seems like probably not)
>>>> but it might be worth doing it anyway to avoid hitting the
>>>> issue. Especially if we add guest support later where some of the
>>>> affected registers might start being used.
>>>
>>> Just to set the expectations: guest TRBE support is not happening
>>> until the architecture is fixed. It cannot reliably give a trace that
>>> includes emulated exceptions, and until then, no TRBE for you.
>>>
>>>> See:
>>>>
>>>>       if (trbe_needs_drain_after_disable(cpudata))
>>>>           trbe_drain_buffer();
>>>>
>>>>
>>>>>> +	}
>>>>>
>>>>> Doesn't this mean we should be able to get rid of most of the TRFCR
>>>>> messing about that litters the entry/exit code and leave that to VHE
>>>>
>>>> Technically you could have ETMs that and are connected to sinks other
>>>> than TRBE. Unless you somehow switch off those sinks you still need to
>>>> do the TRFCR switching stuff.
>>>>
>>>>> only? And even then, I'm tempted to simply get rid of any sort of
>>>>> guest-only tracing, given that TRBE is not capable of representing
>>>>> exceptions that are synthesised by the host, making it the resulting
>>>>> traces useless.
>>>>
>>>> I haven't heard of anyone tracing a guest from the host, but until we
>>>> add support for guests to be able to trace themselves it's the only
>>>> way of doing it, so it could be useful.
>>>
>>> But that's *not* working. If you trace EL1 only, even with a VHE host,
>>> the result is not usable.
>>>
>>
>> Do you mean not working because of the missing exceptions? I did a bit
>> of testing before and the trace did seem somewhat usable to me. It had
>> EL1 and EL0 atoms in there.
> 
> Sure. Now try to look at what that means for NV, where all the
> EL1->EL2 exceptions are emulated, where all the EL2->EL1 exception
> returns are emulated.
> 
> What does it give you? A bag of nonsense.
> 
> Same thing for EL2->EL0, by the way, so you can't even correctly
> profile an EL0 program that performs a syscall, or that gets
> interrupted. And while without NV, these exceptions are rare, having a
> trace that is unreliable has the potential of being worse than no
> trace at all.

If there are issues with NV perhaps we can skip it for the initial trace 
virtualisation implementation? I'm not familiar with it but isn't NV 
still an experimental feature anyway? I can't imagine actual users who 
want to do tracing in guests would accept that they can't do tracing on 
a non-NV guest because there is something that doesn't work in NV.

Also do you have an example of these exceptions that you mean without NV 
so I can have a look? I have a hack that allows basic use of ETE/TRBE in 
VHE mode and did some recordings of syscalls and they end up looking ok 
in the decoded trace:

  $ perf record -e cs_etm/timestamp=0/u -C 0 perf bench syscall basic
  $ perf script

Results in:

bench_syscall_common+0xb4 => aaaaaffcafe0 getppid@plt+0x0
getppid@plt+0xc           => ffffa78980c0 getppid+0x0 (libc.so.6)
getppid+0x8 (libc.so.6)   =>           0 [unknown] ([unknown])
[unknown] ([unknown])     => ffffa78980cc getppid+0xc (libc.so.6)
getppid+0xc (libc.so.6)   => aaaab0076564 bench_syscall_common+0xb8
bench_syscall_common+0xb8 => aaaab00765d8 bench_syscall_common+0x12c

Which shows jumping from the bench function to getppid(), then doing the 
syscall into the kernel which is "0 [unknown]" because I recorded with 
/u. Then back to the bench loop again.

> 
> Until the architecture grows a way for KVM to inject the missing
> information into the trace, TRBE support for guest will stay out.
> 
>> All you need is the mmap records from the
>> guest which you can get by running Perf in the guest and it's possible
>> to decode it. Maybe it's not complete but I don't think all use cases
>> require complete trace. AutoFDO for example just needs lots of small
>> snippets of execution history.
> 
> I don't think it is OK to feed an FDO with traces that are known to be
> incomplete. Maybe that goes under the radar today, but my crystal ball
> is telling me things could be very different in the future, and I'm
> not going to take any bet.

The preset we added for AutoFDO 
(drivers/hwtracing/coresight/coresight-cfg-afdo.c) specifically turns 
tracing on and off to give small incomplete snippets distributed across 
the whole process but while reducing the total amount of trace. I think 
that is one way to do AutoFDO and the compiler can handle it. Anyway, 
AutoFDO is just one use case for trace, and an example that incomplete 
is better than nothing.

In addition to that, the way the ETR and TRBE buffers are currently used 
they're pretty bad at actually recording everything without gaps. 
Although in theory with TRBE it's possible record everything without 
dropping anything, it's still something Leo is working on.

> 
> Thanks,
> 
> 	M.
> 


