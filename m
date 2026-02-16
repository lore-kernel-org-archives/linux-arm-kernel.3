Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B237AE81A3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 16:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p0os1I3D0nQneQNh6nW04sjPFr1Z4Anzp2eQ7qnvXCg=; b=iLkKthUzSlWe3EErm9YAVtprUE
	xMsTQdokIeDsY/B60WfDLFFXV/1etaEkpxzD6DN4fatbpZ9+gJyWt/3EtP85MYgqkTbeVTa8+9xS1
	1GMCjZjYWEV0l9zwo82TL1hLQOS4efsUnFTYiSzF1dYTH8SGj/TZtoFY7mROkrpRIVcRB5cU1k5vL
	A0w/H4NMuxdTbWmkUER/y5JY5LXY6Vgt/qQoN1gmOIahCoS2hVM0i0sgPwGpGeMIDIUoQG9s5OCN1
	znw7OFOL/cwPykYFvj2idTQmb50x5DsQTOkmu5DM19ccrhihDccJjjADiNCQSj49CYzpdKQ8PftF3
	DJ0IwuBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1Ay-00000006yck-0H36;
	Mon, 16 Feb 2026 16:10:20 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1Av-00000006yc8-3Mzd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 16:10:19 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-43770c94dfaso4053412f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 08:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771258216; x=1771863016; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p0os1I3D0nQneQNh6nW04sjPFr1Z4Anzp2eQ7qnvXCg=;
        b=hsSuySB9ajB+sGT1Kxe3ngR2TGbbuc4UmjIHV3wvMNvoNmyNatxEdsk23yaKU+pKRj
         eVE4H6lfLGBki0mtI+fmWIeoXlB3yFo+/DRU/XR5meHnOzEbioOI0vXoTFqRe2N0waMv
         kpIPkuYSybSp1hTG0V59LAYKXBVaOllHF1M2QPEtaCndxuVrkbyHIqMh7BXEm0v50uY/
         7xhWVEAeTHZLjzNvuBMRC7d4Jcd3e62Lb7fKOU/aBBm13glP6rkaioCwQhSmIcdZ6t5I
         khxyH1RCWPPNRlP+ibsrAUCjZoJO6arQVgIT1h4J0bdFugV6q/gJldzL1G7M89xzuNwG
         EUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771258216; x=1771863016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p0os1I3D0nQneQNh6nW04sjPFr1Z4Anzp2eQ7qnvXCg=;
        b=QKRqazIHzrmgaei+bIqxY6Wgo0/UafrXqPd2mmokqY7+J2C+Zx2LjXqQkM3uLTWzz3
         EEKeKd3f6mj+jYXjDy4gcqi/D687xFTXlaMV6xevfFDq88hKpnRkwBs4bXvt/dEH6cxI
         vlZo9f3kXNgpnx6C7cBmWKLFTBjqzI1DdgHhxz6KCp4Laf70UxtvcW7pA31+EWBtXUln
         LEpqTYkgI6oxd6coMA8Nn93OqK69nP/Ahvrzpdt+HvtUDP1SpPJ27RUEc8FzuOjiA2z3
         fa3BeCJJdbd45wG50eamt+Kp6H2GN1qzBN9Qx2IfbLgGh6z7umMPA5FcpCmCUB060gNr
         LCeg==
X-Forwarded-Encrypted: i=1; AJvYcCV2EqLoMnYgo1dnkiduMWvFY/1PocSGE2ue+sg1hY2/g/TD5fs0+hRk8qIRPssM6Nl/WOO1YozNYMUI8HOnT9Le@lists.infradead.org
X-Gm-Message-State: AOJu0YzEfh6TmMJMCvSJ0/IY8FqRkzMuMyuTcXiu6VFPFz4GikuFETj7
	xtOjoRASriaRXfQPhahd7lVQWr4xXM9qaDfDJ0qugrPZv6L8SQLKOEb0ODSgLlcdgUY=
X-Gm-Gg: AZuq6aJ2eMno9mkjr5CB7QP5CkWNxBMJLH+MdzSoRRytiHe/tAPz6wEGHK91RsarPPC
	7B/I64K/XUqmJvM5z1V7/Jr3CY7gKedMON8JIvfX2HsUUOXohpub15IedaQRkGH3DcwkjatRbSM
	uE4RmYucG0SVOor0ZbTagQDPn/d8MG8kNTNDX6fD/75AlTSTIhZWgiiIL73J80tk6Be1wQjY/Qv
	xJSe6MxS67W0NvdlS0COB/HDKWtaBDafK4YA77OkLhWww1tNSh3R8vnKOJpWgjT8MqBxgFt2ZXg
	79RceJBX2sGkcDXDl5jq68lVYpEwTY0XXgW0wfyURx3v2OYea9auKEqm8/g7s01ZvE9P/z4GXyx
	Xz3s+MQ0532qVbMtzDwOSGKL3m218wGHbkRr3bO6A78zsBVefGAOVBYdnlnBOfeLLy5GxWpR3WG
	EKgGj5mdTOPVsk57r2I2WbsvufLxdD31WmgWOlofw=
X-Received: by 2002:a05:6000:4383:b0:432:5b81:483 with SMTP id ffacd0b85a97d-437978dda3fmr20801082f8f.24.1771258215791;
        Mon, 16 Feb 2026 08:10:15 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5b4cdsm30760760f8f.8.2026.02.16.08.10.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 08:10:15 -0800 (PST)
Message-ID: <076e013a-b66d-4985-9709-734d7184ad72@linaro.org>
Date: Mon, 16 Feb 2026 16:10:14 +0000
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
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <868qcsbsbd.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_081017_901640_6160A776 
X-CRM114-Status: GOOD (  42.29  )
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



On 16/02/2026 3:51 pm, Marc Zyngier wrote:
> On Mon, 16 Feb 2026 15:05:10 +0000,
> James Clark <james.clark@linaro.org> wrote:
>>
>>
>>
>> On 16/02/2026 2:29 pm, Marc Zyngier wrote:
>>> On Mon, 16 Feb 2026 13:09:59 +0000,
>>> Will Deacon <will@kernel.org> wrote:
>>>>
>>>> The nVHE world-switch code relies on zeroing TRFCR_EL1 to disable trace
>>>> generation in guest context when self-hosted TRBE is in use by the host.
>>>>
>>>> Per D3.2.1 ("Controls to prohibit trace at Exception levels"), clearing
>>>> TRFCR_EL1 means that trace generation is prohibited at EL1 and EL0 but
>>>> per R_YCHKJ the Trace Buffer Unit will still be enabled if
>>>> TRBLIMITR_EL1.E is set. R_SJFRQ goes on to state that, when enabled, the
>>>> Trace Buffer Unit can perform address translation for the "owning
>>>> exception level" even when it is out of context.
>>>
>>> Great. So TRBE violates all the principles that we hold true in the
>>> architecture. Does SPE suffer from the same level of brokenness?
>>>
>>>> Consequently, we can end up in a state where TRBE performs speculative
>>>> page-table walks for a host VA/IPA in guest/hypervisor context depending
>>>> on the value of MDCR_EL2.E2TB, which changes over world-switch. The
>>>> result appears to be a heady mixture of data corruption and hardware
>>>> lockups.
>>>>
>>>> Extend the TRBE world-switch code to clear TRBLIMITR_EL1.E after
>>>> draining the buffer, restoring the register on return to the host.
>>>>
>>>> Cc: Marc Zyngier <maz@kernel.org>
>>>> Cc: Oliver Upton <oupton@kernel.org>
>>>> Cc: James Clark <james.clark@linaro.org>
>>>> Cc: Leo Yan <leo.yan@arm.com>
>>>> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
>>>> Cc: Fuad Tabba <tabba@google.com>
>>>> Fixes: a1319260bf62 ("arm64: KVM: Enable access to TRBE support for host")
>>>> Signed-off-by: Will Deacon <will@kernel.org>
>>>> ---
>>>>
>>>> NOTE: This is *untested* as I don't have a TRBE-capable device that can
>>>> run upstream but I noticed this by inspection when triaging occasional
>>>> hardware lockups on systems using a 6.12-based kernel with TRBE running
>>>> at the same time as a vCPU is loaded. This code has changed quite a bit
>>>> over time, so stable backports are not entirely straightforward.
>>>> Hopefully James/Leo/Suzuki can help us test if folks agree with the
>>>> general approach taken here.
>>>>
>>>>    arch/arm64/include/asm/kvm_host.h  |  1 +
>>>>    arch/arm64/kvm/hyp/nvhe/debug-sr.c | 36 ++++++++++++++++++++++--------
>>>>    2 files changed, 28 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
>>>> index ac7f970c7883..a932cf043b83 100644
>>>> --- a/arch/arm64/include/asm/kvm_host.h
>>>> +++ b/arch/arm64/include/asm/kvm_host.h
>>>> @@ -746,6 +746,7 @@ struct kvm_host_data {
>>>>    		u64 pmscr_el1;
>>>>    		/* Self-hosted trace */
>>>>    		u64 trfcr_el1;
>>>> +		u64 trblimitr_el1;
>>>>    		/* Values of trap registers for the host before guest entry. */
>>>>    		u64 mdcr_el2;
>>>>    		u64 brbcr_el1;
>>>> diff --git a/arch/arm64/kvm/hyp/nvhe/debug-sr.c b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
>>>> index 2a1c0f49792b..fd389a26bc59 100644
>>>> --- a/arch/arm64/kvm/hyp/nvhe/debug-sr.c
>>>> +++ b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
>>>> @@ -57,12 +57,27 @@ static void __trace_do_switch(u64 *saved_trfcr, u64 new_trfcr)
>>>>    	write_sysreg_el1(new_trfcr, SYS_TRFCR);
>>>>    }
>>>>    -static bool __trace_needs_drain(void)
>>>> +static void __trace_drain_and_disable(void)
>>>>    {
>>>> -	if (is_protected_kvm_enabled() && host_data_test_flag(HAS_TRBE))
>>>> -		return read_sysreg_s(SYS_TRBLIMITR_EL1) & TRBLIMITR_EL1_E;
>>>> +	u64 *trblimitr_el1 = host_data_ptr(host_debug_state.trblimitr_el1);
>>>>    -	return host_data_test_flag(TRBE_ENABLED);
>>>> +	*trblimitr_el1 = 0;
>>>> +
>>>> +	if (is_protected_kvm_enabled()) {
>>>> +		if (!host_data_test_flag(HAS_TRBE))
>>>> +			return;
>>>> +	} else {
>>>> +		if (!host_data_test_flag(TRBE_ENABLED))
>>>> +			return;
>>>> +	}
>>>> +
>>>> +	*trblimitr_el1 = read_sysreg_s(SYS_TRBLIMITR_EL1);
>>>> +	if (*trblimitr_el1 & TRBLIMITR_EL1_E) {
>>>> +		isb();
>>>> +		tsb_csync();
>>>> +		write_sysreg_s(0, SYS_TRBLIMITR_EL1);
>>>> +		isb();
>>
>> The TRBE driver might do an extra drain here as a workaround. Hard to
>> tell if it's actually required in this case (seems like probably not)
>> but it might be worth doing it anyway to avoid hitting the
>> issue. Especially if we add guest support later where some of the
>> affected registers might start being used.
> 
> Just to set the expectations: guest TRBE support is not happening
> until the architecture is fixed. It cannot reliably give a trace that
> includes emulated exceptions, and until then, no TRBE for you.
> 
>> See:
>>
>>      if (trbe_needs_drain_after_disable(cpudata))
>>          trbe_drain_buffer();
>>
>>
>>>> +	}
>>>
>>> Doesn't this mean we should be able to get rid of most of the TRFCR
>>> messing about that litters the entry/exit code and leave that to VHE
>>
>> Technically you could have ETMs that and are connected to sinks other
>> than TRBE. Unless you somehow switch off those sinks you still need to
>> do the TRFCR switching stuff.
>>
>>> only? And even then, I'm tempted to simply get rid of any sort of
>>> guest-only tracing, given that TRBE is not capable of representing
>>> exceptions that are synthesised by the host, making it the resulting
>>> traces useless.
>>
>> I haven't heard of anyone tracing a guest from the host, but until we
>> add support for guests to be able to trace themselves it's the only
>> way of doing it, so it could be useful.
> 
> But that's *not* working. If you trace EL1 only, even with a VHE host,
> the result is not usable.
> 

Do you mean not working because of the missing exceptions? I did a bit 
of testing before and the trace did seem somewhat usable to me. It had 
EL1 and EL0 atoms in there. All you need is the mmap records from the 
guest which you can get by running Perf in the guest and it's possible 
to decode it. Maybe it's not complete but I don't think all use cases 
require complete trace. AutoFDO for example just needs lots of small 
snippets of execution history.

>> Although all the messing
>> around with TRFCR before was from a request to disable guest trace
>> rather than enable it, as it was always on in nVHE.
> 
> I can't see how it could ever be "always on", unless you were happy to
> randomly corrupt memory?
> 

It was, and it was specifically the reason to add the TRFCR switching 
stuff. With a non-TRBE sink in nVHE mode.

VHE was always off and nVHE was always on. So we fixed both at the same 
time and made the include/exclude settings of the event respected 
wherever possible.

>>> I'm still trying to get my hands on a TRBE-enabled system that has
>>> some actual firmware tables (my O6 seems to have the HW, but no
>>> description of the required coresight infra).
>>
>> Leo has a guide, I haven't tried it myself yet but it should be
>> working. I'll send it to you.
> 
> Thanks. But why isn't that stuff publicly documented? Sight...
> 
> 	M.
> 


