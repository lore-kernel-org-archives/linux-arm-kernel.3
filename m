Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48BDD609CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 10:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCu4RjgL9sjTK1Y/mVpJR4JTwQ+AC5Kyvpq82ug2qT0=; b=nXXb+oAeFaKi1k+10A6vnHnnev
	PdaG2BRhTYc5/Vw1pDCngbouVkhsyroSCraTwe2BRvK2CiOuXsTawWBmN6BunkswJk1g1MFF1pxi7
	aVJKd4msk+yM3vlGGcS1Vczpch/SA/poeoZsKSHfzsQEM7/RZQIAtu4Wm1U4oPmir0122BTjS3IjE
	bW14cfxgGci+iUBCLaMzovLFzJB28u1NyI0FUyAoxpdY6tnu3n2poP6qGQ1YPA0aDNV+EmDpOf8mS
	k7DHMIiNWxYGYPk06mxj92FUWlElU1bIl6sdA5mFlvJzqM+iQD9GuaosM+TnFjkMpI8Zht8mhA93o
	W4x9dBKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGF6o-0000000CogY-2pLJ;
	Wed, 27 Nov 2024 10:17:22 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGExw-0000000Cn2g-31Tf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 10:08:13 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-53de92be287so3261661e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 02:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732702090; x=1733306890; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rCu4RjgL9sjTK1Y/mVpJR4JTwQ+AC5Kyvpq82ug2qT0=;
        b=wplWRfCThvNw8klrRKdjJ63qXOxHnkGUNAPLyDjZSKwmDRSrRsyarjumezLXkOa/Ah
         Zro5WVoAaltC98PAvFJZselHJUpNxi6lmDSMDRq+QAd8sLqOE9PMVyBEhmXTcQ/AeqLI
         cgeNB/NFsUhR1GmwCwSln9P9XASvDih1rE+DOmdT4XjEX9I9zHkFeeeiZzBdBuU2M43X
         Qup9XWDpjGVvd1t4FCPibi8Gp7r+KeAm47pMtEJr1HckR17zvkh3iq4eXT8cSOvs0kS+
         7Qe8es1tGLcGz7mYSzTtNQYjKf02t6oP/wdegTy+CNm6IEwzQFuMOdMQyWupW1DiWN3n
         rGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732702091; x=1733306891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rCu4RjgL9sjTK1Y/mVpJR4JTwQ+AC5Kyvpq82ug2qT0=;
        b=ePNzHwDGD+U33XTcin1w6ObDTnhcCbwMXH0sGHlBtscnEujb0x+c/2xcMPUwV2Bo17
         yVSNxThtBWeU+JmfRu4G80W+jj0aeocTpkv0Wl8HKe3Jk2cSAROTVMxC+QN7NlEl4kij
         EZiLMyLc17Ib1LhHASgiTtmmMpE03Jy3bofubXW0wIxSDa37KFN6av7weNdR+E0HgXR8
         OFk3nZ6f3JzwWSagyNHPCnoLTox1m0YrcJes4K6cbgfNBid2kuKS97pVhekX+oxOP409
         wvJAyurRbcgi82lkXzCxiQEb0ZAedhgHqc2w4nl0knGgo0YNQmOJHIeI8qtoR6eLB40l
         76nw==
X-Forwarded-Encrypted: i=1; AJvYcCWLGFcheAby+AMMXAEhkS4MH5GrCsu9rdKpzT2/I7y3tUrAiT0MmVdXAZhOy1YJ195eev7Kcd2DYKQAaU6IaYN7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2j3rGMjxSgAzsUiFSknrpNc6LL1zDFVp4yCJtej/gqu9TMo3X
	jUn79MhNUlHE3Y1FkOZeGdFeZ4YrNk7KcQvjnIIA8jN22OQkRsC8Bsc1vhTRDWs=
X-Gm-Gg: ASbGnctjHwcqbCAw6dAE205nJlfVkzwevJEJW733Trd8FejXuowfH9qkTgX01c5yO4h
	lNwHoZYgANdk0XbiMImVpp/V7rZT5n6iAKuZNKfwyiLyhBF4ogeIS6RyWTrLUrpvXimdliAuXMf
	P2+6SJYvpBnByJ6SfyKMHUScYogkRv1qLzCkaZNB8TQx6I7gnZ9ZLe7v0l+yzGSkghuCSEPR+A2
	Ywimm/xmpVdP0GEwhiKsgroidoDyS1lY+9Y5FnZXpLQ4denHXbaDNw/8Oi1
X-Google-Smtp-Source: AGHT+IGxq8BlPg4q00veCMjMl/I7UbvSpUijaUSLSmoOjASs//gstZCBp1O3F7Ag68LEG7c8y5MI+w==
X-Received: by 2002:a05:6512:1247:b0:53d:deb5:3376 with SMTP id 2adb3069b0e04-53df010b17bmr1794334e87.40.1732702090527;
        Wed, 27 Nov 2024 02:08:10 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.200])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50a9de1d0sm684549666b.0.2024.11.27.02.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 02:08:10 -0800 (PST)
Message-ID: <5daac1da-9196-4330-b604-5e2073d43f19@linaro.org>
Date: Wed, 27 Nov 2024 10:08:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/12] KVM: arm64: Swap TRFCR on guest switch
To: Oliver Upton <oliver.upton@linux.dev>
Cc: suzuki.poulose@arm.com, coresight@lists.linaro.org,
 kvmarm@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
 Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "Rob Herring (Arm)" <robh@kernel.org>, Shiqi Liu <shiqiliu@hust.edu.cn>,
 Fuad Tabba <tabba@google.com>, James Morse <james.morse@arm.com>,
 Mark Brown <broonie@kernel.org>, Raghavendra Rao Ananta
 <rananta@google.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241112103717.589952-1-james.clark@linaro.org>
 <20241112103717.589952-12-james.clark@linaro.org>
 <Zz4c5LmQnK2SD5HO@linux.dev>
 <5f2eb0fa-c7ca-4e25-b713-6a9bf3d355b9@linaro.org>
 <Z0X2BBBaDejFfATp@linux.dev>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <Z0X2BBBaDejFfATp@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_020812_764144_D0E47965 
X-CRM114-Status: GOOD (  38.38  )
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



On 26/11/2024 4:23 pm, Oliver Upton wrote:
> On Thu, Nov 21, 2024 at 12:50:10PM +0000, James Clark wrote:
>>
>>
>> On 20/11/2024 5:31 pm, Oliver Upton wrote:
>>> On Tue, Nov 12, 2024 at 10:37:10AM +0000, James Clark wrote:
>>>> +void kvm_set_trfcr(u64 host_trfcr, u64 guest_trfcr)
>>>> +{
>>>> +	if (kvm_arm_skip_trace_state())
>>>> +		return;
>>>> +
>>>> +	if (has_vhe())
>>>> +		write_sysreg_s(guest_trfcr, SYS_TRFCR_EL12);
>>>> +	else
>>>> +		if (host_trfcr != guest_trfcr) {
>>>> +			*host_data_ptr(host_debug_state.trfcr_el1) = guest_trfcr;
>>>
>>> Huh? That's going into host_debug_state, which is the dumping grounds
>>> for *host* context when entering a guest.
>>>
>>> Not sure why we'd stick a *guest* value in there...
>>>
>>
>> Only to save a 3rd storage place for trfcr when just the register and one
>> place is technically enough. But yes if it's more readable to have
>> guest_trfcr_el1 separately then that makes sense.
> 
> Yeah, since this is all per-cpu data at this point rather than per-vCPU,
> it isn't the end of the world to use a few extra bytes.
> 
>> That works, it would be nice to have it consistent and have it that way for
>> filtering, like kvm_set_guest_trace_filters(bool kernel, bool user). But I
>> suppose we can justify not doing it there because we're not really
>> interpreting the TRFCR value just writing it whole.
> 
> Agreed, the biggest thing I'd want to see in the exported interfaces
> like this is to have enable/disable helpers to tell KVM when a driver
> wants KVM to start/stop managing a piece of state while in a guest.
> 
> Then the hypervisor code can blindly save/restore some opaque values to
> whatever registers it needs to update.
> 
>>> What if trace is disabled in the guest or in the host? Do we need to
>>> synchronize when transitioning from an enabled -> disabled state like we
>>> do today?
>>>
>>
>> By synchronize do you mean the tsb_csync()? I can only see it being
>> necessary for the TRBE case because then writing to the buffer is fatal.
>> Without TRBE the trace sinks still work and the boundary of when exactly
>> tracing is disabled in the kernel isn't critical.
> 
> Ack, I had the blinders on that we cared only about TRBE here.
> 
>>> I took a stab at this, completely untested of course && punts on
>>> protected mode. But this is _generally_ how I'd like to see everything
>>> fit together.
>>>
>>
>> Would you expect to see the protected mode stuff ignored if I sent another
>> version more like yours below? Or was that just skipped to keep the example
>> shorter?
> 
> Skipped since I slapped this together in a hurry.
> 
>> I think I'm a bit uncertain on that one because removing HAS_TRBE means you
>> can't check if TRBE is enabled or not in protected mode and it will go wrong
>> if it is.
> 
> The protected mode hypervisor will need two bits of information.
> Detecting that the feature is present can be done in the kernel so long
> as the corresponding static key / cpucap is toggled before we drop
> privileges.
> 
> Whether or not it is programmable + enabled is a decision that must be
> made by observing hardware state from the hypervisor before entering a
> guest.
> 
> [...]
> 
>>> +void kvm_enable_trbe(u64 guest_trfcr)
>>> +{
>>> +	if (WARN_ON_ONCE(preemptible()))
>>> +		return;
>>> +
>>> +	if (has_vhe()) {
>>> +		write_sysreg_s(guest_trfcr, SYS_TRFCR_EL12);
>>> +		return;
>>> +	}
>>> +
>>> +	*host_data_ptr(guest_trfcr_el1) = guest_trfcr;
>>> +	host_data_set_flag(HOST_TRBE_ENABLED);
>>
>> FWIW TRBE and TRF are separate features, so this wouldn't do the filtering
>> correctly if TRBE wasn't in use, but I can split it out into
>> separate kvm_enable_trbe(void) and kvm_set_guest_filters(u64 guest_trfcr).
> 
> KVM manages the same piece of state (TRFCR_EL1) either way though right?
> 
> The expectation I had is that KVM is informed any time a trace session
> (TRBE or otherwise) is enabled/disabled on a CPU, likely with a TRFCR_EL1
> of 0 if guest mode is excluded.
> 
> The function names might need massaging, but I was hoping to have a
> single set of enable/disable knobs to cover all bases here.
> 

I sent another version, it did come out much simpler and still does all 
the same things as before.

I didn't manage to make a single enable/disable knob though. The thing 
is the filtering is set on the source side of the driver and trbe is a 
sink thing. I would have to couple them together and add knowledge of 
the sink type to the source to make it work.

That would then open up the possibility for anyone adding a new source 
to get the trbe bit wrong in the future. Having KVM override the filter 
setting when trbe is in use seems a lot safer and easier to understand.



