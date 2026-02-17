Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB53E6817A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 12:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aOe3kSGGnfmWMYMCFtCCbPJWh6hysTa5iqIZJm9rsGE=; b=LVbyWcbB3NkxSvsWHuWlTH0Xjv
	YjTS+RUXi7a5jTXkiIbqqXXNuFIXM1LaKDhx9u3klOkeZkMjPLg2pCsTnnPRO27uR4bKf3sSNKho+
	8GaIcQHjzrDEahGF0o08g2DL65pbGPwE/BsUGkFOib2ApeoMYdj19Lg5E/tb8jab25R1krt4/MXD/
	Wo9aQcvYKgkkokTnVfS9Krlar5ojnVH9yHqRzDeQFhbncVozCiSlxP2VrvtK105YkBAAb4S08EQvr
	YmeKEk171GpUmirBP6CZwflmHmTFuOjPJWFrj1CXah+8XGJT6UDuA3nNUQgbWRByajV0EDmmZ+SWQ
	PToQHBlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsK3x-00000008C8T-2Ilr;
	Tue, 17 Feb 2026 12:20:21 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsK3u-00000008C84-2ouD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 12:20:20 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48374014a77so36195055e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 04:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771330816; x=1771935616; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aOe3kSGGnfmWMYMCFtCCbPJWh6hysTa5iqIZJm9rsGE=;
        b=O3NQF7NAccihm/klKrPOQV9IOU6hW49+iYrszClqj69ohYwdpPLXVd/rltUlTl8jf+
         5gqa9Y6Y/0Rl4klzomENLV7Avs8jf0NPnJg9Jji9f+v2bzeaieLPmpdW1+hIiDrmBKrx
         kfjgezoNEMdrfXj+6knE+4t/y9VP3u5+1JCRPfFeJ4h3vhwK4FgBhzKbY5WCnjXjlvJ1
         3BreCNV0kwQ7hasKiFE9bC1MbnEQVNW+EKZzbtx0O1RT+sPu/6Clg0NeoMVB904BeB4F
         JHtLzPr/t35u7tbNZuBqi0uWRIO5xhLutcZK3f99pibAIt3rZwj+IOJ/Iornj5Yt8Nbi
         YpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771330816; x=1771935616;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aOe3kSGGnfmWMYMCFtCCbPJWh6hysTa5iqIZJm9rsGE=;
        b=IAAehqs+kwqfM/V278wfFslPNi6qcyBqDTTiy9CVpssApXkrEbrGNHQNqiRSgp4kHm
         QC4I46OW513UJ2eGdG6CcwmMxhGHhnyB/W7vIDMPIukzRri4ABuQR6B4WJTbKVZEtmLI
         3FLtcUCLhp60eYzrVOKqrHEb0pt1+bxR/kr4vZxYPY8zp7i3Q5N88Jfup1oAINIiunKv
         DbAh6V1ggkpMFxX7Q/NKUs94KSnlo2cOK44oH3BrjeI7oNvfRoqYa/2uE2xZhWPQtKo3
         x4JV0hbT3eoOlg2gVZSZNq4+cnGNiFAAYWbnxWM/5mu1q6Us5UOlEEqu7j2SMVrTdFav
         m/6g==
X-Forwarded-Encrypted: i=1; AJvYcCURSU4s6CGalfErCG7SLgHjGaeGOjPgF85h/De2kauchVSQqG4k9YG7iMcb26X3ubVt5ija0hHMja4UbKC27xsI@lists.infradead.org
X-Gm-Message-State: AOJu0YznSzDNG+9Lp1NVWD21pGFLTqroELp9D7kHFmzjmmnPeIHVBKIl
	i6zb7FHAL6vsR57ABCGgg8RcDwaV/wpsNWzdnS0sswyMDHggIwGdHbRAHl0r6vYL7Nc9pNcNEHz
	yvvw4ee0=
X-Gm-Gg: AZuq6aJsGLNSQxp34W1cXb/b9FhRCACPUNPh35/RdMSZkEnNWBR5d9xz/lHTisHmkdY
	bQdlOvBlC5TAJ59o5Yj26jNwwPUrixkkLksXTVex+f7B9c01K1fKbVe5VBI6GjrCNBootUpScMc
	pZuAMJXlw9667kZHGOzJ1m4xqqRAuBvwPl42wmAJD3OauNl3CuE1mhjsi8/wI0B4OBwGE4JDXDB
	j5XJu8PGTDtHNOw84qoh1z+5B342gKDOQgDLwHGYP/ZLAnX5Oqxfo9eRTiH2wvuzcoFfSvTA9Bk
	Rcr/d+RVM/pCXHHFtoN0s2nLgJ8TcqKyCzwKcWpKY4NJd+xPUfJSt2HrRiwpTVnG5tTaRU7iNI0
	jM8J22VVCV42ygsztUAPbr7z995qVaxP1MA8tJrEIxA+wEKFrzf2zXzoD6eDJLvyv7oaoOPWK/G
	LjfYdFiZiJrR1+mJHhwP2dF3mWJ3Wc
X-Received: by 2002:a05:600c:6211:b0:477:93f7:bbc5 with SMTP id 5b1f17b1804b1-48373a09741mr246802455e9.10.1771330816424;
        Tue, 17 Feb 2026 04:20:16 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dd0deeasm468949755e9.12.2026.02.17.04.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 04:20:15 -0800 (PST)
Message-ID: <cda4e111-29cc-481c-aee2-811f4178f54b@linaro.org>
Date: Tue, 17 Feb 2026 12:20:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: Disable TRBE Trace Buffer Unit when running
 in guest context
To: Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, mark.rutland@arm.com,
 linux-arm-kernel@lists.infradead.org, Oliver Upton <oupton@kernel.org>,
 Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Fuad Tabba <tabba@google.com>
References: <20260216130959.19317-1-will@kernel.org>
 <86a4x8bw38.wl-maz@kernel.org> <aZNUqONyOUVd0opW@willie-the-truck>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aZNUqONyOUVd0opW@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_042018_785834_C14C5699 
X-CRM114-Status: GOOD (  36.37  )
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



On 16/02/2026 5:32 pm, Will Deacon wrote:
> On Mon, Feb 16, 2026 at 02:29:31PM +0000, Marc Zyngier wrote:
>> On Mon, 16 Feb 2026 13:09:59 +0000,
>> Will Deacon <will@kernel.org> wrote:
>>>
>>> The nVHE world-switch code relies on zeroing TRFCR_EL1 to disable trace
>>> generation in guest context when self-hosted TRBE is in use by the host.
>>>
>>> Per D3.2.1 ("Controls to prohibit trace at Exception levels"), clearing
>>> TRFCR_EL1 means that trace generation is prohibited at EL1 and EL0 but
>>> per R_YCHKJ the Trace Buffer Unit will still be enabled if
>>> TRBLIMITR_EL1.E is set. R_SJFRQ goes on to state that, when enabled, the
>>> Trace Buffer Unit can perform address translation for the "owning
>>> exception level" even when it is out of context.
>>
>> Great. So TRBE violates all the principles that we hold true in the
>> architecture. Does SPE suffer from the same level of brokenness?
>>
>>> Consequently, we can end up in a state where TRBE performs speculative
>>> page-table walks for a host VA/IPA in guest/hypervisor context depending
>>> on the value of MDCR_EL2.E2TB, which changes over world-switch. The
>>> result appears to be a heady mixture of data corruption and hardware
>>> lockups.
>>>
>>> Extend the TRBE world-switch code to clear TRBLIMITR_EL1.E after
>>> draining the buffer, restoring the register on return to the host.
>>>
>>> Cc: Marc Zyngier <maz@kernel.org>
>>> Cc: Oliver Upton <oupton@kernel.org>
>>> Cc: James Clark <james.clark@linaro.org>
>>> Cc: Leo Yan <leo.yan@arm.com>
>>> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
>>> Cc: Fuad Tabba <tabba@google.com>
>>> Fixes: a1319260bf62 ("arm64: KVM: Enable access to TRBE support for host")
>>> Signed-off-by: Will Deacon <will@kernel.org>
>>> ---
>>>
>>> NOTE: This is *untested* as I don't have a TRBE-capable device that can
>>> run upstream but I noticed this by inspection when triaging occasional
>>> hardware lockups on systems using a 6.12-based kernel with TRBE running
>>> at the same time as a vCPU is loaded. This code has changed quite a bit
>>> over time, so stable backports are not entirely straightforward.
>>> Hopefully James/Leo/Suzuki can help us test if folks agree with the
>>> general approach taken here.
>>>
>>>   arch/arm64/include/asm/kvm_host.h  |  1 +
>>>   arch/arm64/kvm/hyp/nvhe/debug-sr.c | 36 ++++++++++++++++++++++--------
>>>   2 files changed, 28 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
>>> index ac7f970c7883..a932cf043b83 100644
>>> --- a/arch/arm64/include/asm/kvm_host.h
>>> +++ b/arch/arm64/include/asm/kvm_host.h
>>> @@ -746,6 +746,7 @@ struct kvm_host_data {
>>>   		u64 pmscr_el1;
>>>   		/* Self-hosted trace */
>>>   		u64 trfcr_el1;
>>> +		u64 trblimitr_el1;
>>>   		/* Values of trap registers for the host before guest entry. */
>>>   		u64 mdcr_el2;
>>>   		u64 brbcr_el1;
>>> diff --git a/arch/arm64/kvm/hyp/nvhe/debug-sr.c b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
>>> index 2a1c0f49792b..fd389a26bc59 100644
>>> --- a/arch/arm64/kvm/hyp/nvhe/debug-sr.c
>>> +++ b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
>>> @@ -57,12 +57,27 @@ static void __trace_do_switch(u64 *saved_trfcr, u64 new_trfcr)
>>>   	write_sysreg_el1(new_trfcr, SYS_TRFCR);
>>>   }
>>>   
>>> -static bool __trace_needs_drain(void)
>>> +static void __trace_drain_and_disable(void)
>>>   {
>>> -	if (is_protected_kvm_enabled() && host_data_test_flag(HAS_TRBE))
>>> -		return read_sysreg_s(SYS_TRBLIMITR_EL1) & TRBLIMITR_EL1_E;
>>> +	u64 *trblimitr_el1 = host_data_ptr(host_debug_state.trblimitr_el1);
>>>   
>>> -	return host_data_test_flag(TRBE_ENABLED);
>>> +	*trblimitr_el1 = 0;
>>> +
>>> +	if (is_protected_kvm_enabled()) {
>>> +		if (!host_data_test_flag(HAS_TRBE))
>>> +			return;
>>> +	} else {
>>> +		if (!host_data_test_flag(TRBE_ENABLED))
>>> +			return;
>>> +	}
>>> +
>>> +	*trblimitr_el1 = read_sysreg_s(SYS_TRBLIMITR_EL1);
>>> +	if (*trblimitr_el1 & TRBLIMITR_EL1_E) {
>>> +		isb();
>>> +		tsb_csync();
>>> +		write_sysreg_s(0, SYS_TRBLIMITR_EL1);
>>> +		isb();
>>> +	}
>>
>> Doesn't this mean we should be able to get rid of most of the TRFCR
>> messing about that litters the entry/exit code and leave that to VHE
>> only?
> 
> I'm not sure we can get rid of an awful lot: if the host is using TRBE,
> then we still need to stop trace generation, drain the buffer and
> disable the buffer. Or are you thinking of some other TRFCR accesses?
> 
> Looking at the TRBE driver, I _think_ the idea is that the trace
> hardware can generate trace to ETM/Coresight instead of memory in some
> cases and so you can enable it at boot time or via sysfs and then
> profile the whole machine, presumably using an expensive external box +
> cable or via some other coresight "sink" component. But I'm really
> guessing based on the driver; James and Leo will know for sure.

Exactly, there are other sink types. For example ETF has SRAM or ETR 
uses physical addresses.

> 
> I've tried (and failed) to reconcile the above with what is written in
> the Arm ARM regarding self-hosted trace with TRBE.
> 
>> And even then, I'm tempted to simply get rid of any sort of
>> guest-only tracing, given that TRBE is not capable of representing
>> exceptions that are synthesised by the host, making it the resulting
>> traces useless.
> 
> I think that effectively means reverting the series merged from here:
> 
> https://lore.kernel.org/all/20250106142446.628923-1-james.clark@linaro.org/
> 
> but then we still need to clear TRBLIMITR_EL1.E.
> 
> Will

Removing that series would actually have the effect of turning guest 
trace on in nVHE for non-TRBE sinks. The reason for implementing the 
filtering was to turn guest trace off because a user didn't want to see it.


