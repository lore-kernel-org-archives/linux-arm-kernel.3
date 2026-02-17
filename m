Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C9FE68149
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 09:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OlcXTAXHsnl/WtrFqR8o0BlGKwsZMnh0pz3tx1Nme4Q=; b=itv5R7Y06amNS+amv1xe+7rC2M
	W3V8/uXwcUo35XNRvQoKeCt4oZzJsKZHGv8KLUml0CcQ8Srzy41YLZTj1Dq9P9lkllUqmOhFetM5Q
	FNWqE9lklYWGnmgyrWq2kHiB+9AAT9fzTu5lGiim9zAZt6Y9104LzZUmEDn1gTon/9dc2UXdH9UIG
	rJAfuXAOOh+zr+KdJQrk79yQ3ajlcn/ekm008sZ6Bfx4AOt4aoMvs1Q+zHO2+Uc1IOXIiS3yI1HZS
	fyEr5pFtTU9/l/J6SiHu2Y8f+Aa/3JJiE91KUhfTw3gdiScgTvaE+4dKes6VMojJsfKzBwj+W2rz3
	640Dwagw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHDd-00000007vfu-0L2n;
	Tue, 17 Feb 2026 09:18:09 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHDa-00000007vfS-3XwG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 09:18:08 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-48372efa020so28171345e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 01:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771319885; x=1771924685; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OlcXTAXHsnl/WtrFqR8o0BlGKwsZMnh0pz3tx1Nme4Q=;
        b=uEDhlPTOSEwLvv++Nwi3OM5Y6h8MqLFfFcIAcLMeKguA4Aa5jWru31j3VByXPfDkiq
         m4gA2DFRZCtTwb58S3zq0EFe8F6ZMxDG3H8VUgUd9CSDlUtSkOXylmJgV1nCmYBq2vIo
         mgm0YpSBJAuKItKRto7g87nod74wYKFIacy7rFCb5bZNnblgld0lJLkFQv850bjqaywU
         X8oZvx4QzDsZMHcn5FN1tkiJTbLFEqz9D3c0rHld0ArSC5lbXVPKdP8QgxJeyUoBSSGa
         tI7T83oU/K64Rqa5Tv+F+EQuKH4Y1L/MNfO/SZV+iUZ7Z8fbVJb2j3650Su+bzFFK3vO
         99rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771319885; x=1771924685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OlcXTAXHsnl/WtrFqR8o0BlGKwsZMnh0pz3tx1Nme4Q=;
        b=WfaJLdUmxs7K+MiwDjHeM5b5mHcF++z3nildYtU4mum4pcZ8B8uLbAm1j/Li2DJ3gb
         8oOWtXsM7Ojsch4NtZ0jn31tNtWbQ0V+knzX5m+CT992kHchWU8M+T1vQZunDN7L/r+P
         8CTRNA9cBMg8s8yR1hM1GQpAdnTauuRQAbgNGbcC+Hdoz31wql9Ky9Z/FK5xVrmtAC1E
         v7jN+lD1jjHCDl+h0FaZHAEWPnnsnX0W1Rwhq0m3I5n5wPjJ6PtSdM6Pne2S1bS6wwXA
         Q7oP/TEmIbPWUj4GEjpzRDAVZD53rfI9BjD53rn9q9uKVyiLNCLpvIV2C1N6vmTXt4pT
         eDUw==
X-Forwarded-Encrypted: i=1; AJvYcCVwqrRT+/s4n/6dNFA02GEfG2YjEOSbyQ/wjJu+bLA9Hy572YZYRSFAohQPqW42rS/Sn87Oytc1GyaD6QvbYwDu@lists.infradead.org
X-Gm-Message-State: AOJu0YwPPvJfB32XGufThxKhcB+R6mcXxaPTgtPAVsHZsI24pNjf0mu0
	EbQu3gQy45lCXsrmlD8xg3hvstguEZ+fO66Wl4h82+4OhrhyiPZirH5qU+hSKMHwMcg=
X-Gm-Gg: AZuq6aJjIlZo6BiH0NXeZoTcl8mQjmsoNX5cdXpqN53rSkdJdhMz791SQQh5xeOUgDr
	4z68PD2HH5Zz32An55zfe5LLOYLKmNRrk2RMIynymDiCUOLSLMvi8XhFYwcneCCP3lFOK5fV3QC
	dMmgNclH7xVrxaFj5YrDKWfpfI88zB2usPc/8REMpnuCUM7wHMW3fdYYKIFmcaCNGc2oJnodgWg
	UzRbJsblLLny+cFBOXWr9HT46lkyLZyzDTbXrYlo+VMzJ79I9rgiKGlU3w4c4eol8JBkKRrqwOM
	V6TNR5jUoFH8gIMOUF3RND+k26T5WjJsklK6VSGw0HZXH0GkhciTIZycG3ZByBoSxog618bH0+W
	RVesUysXaoY+3grVq9iYlnSVTBtAwNQqQLJmKVGXrsKj5bdm1uK+WbXnWPX8a1eWgQVyh8rDafl
	dXkpHsF1hL0m3OzkW4I8RFiVMufjIT
X-Received: by 2002:a05:600c:46c9:b0:46e:4a13:e6c6 with SMTP id 5b1f17b1804b1-48379bfd71cmr160954025e9.19.1771319884602;
        Tue, 17 Feb 2026 01:18:04 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4836aa0847asm543941725e9.3.2026.02.17.01.18.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 01:18:04 -0800 (PST)
Message-ID: <e36150c7-9098-495a-b0f1-626b38c0c3d0@linaro.org>
Date: Tue, 17 Feb 2026 09:18:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: Disable TRBE Trace Buffer Unit when running
 in guest context
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, mark.rutland@arm.com,
 linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>, Leo Yan <leo.yan@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Fuad Tabba <tabba@google.com>
References: <20260216130959.19317-1-will@kernel.org>
 <878e304e-4162-4981-8125-bd4f67ba9dd5@linaro.org>
 <aZNOcv2XxTrrrEnU@willie-the-truck>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aZNOcv2XxTrrrEnU@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_011806_920831_0FEC3E5F 
X-CRM114-Status: GOOD (  27.51  )
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



On 16/02/2026 5:05 pm, Will Deacon wrote:
> On Mon, Feb 16, 2026 at 03:13:54PM +0000, James Clark wrote:
>>
>>
>> On 16/02/2026 1:09 pm, Will Deacon wrote:
>>> The nVHE world-switch code relies on zeroing TRFCR_EL1 to disable trace
>>> generation in guest context when self-hosted TRBE is in use by the host.
>>>
>>> Per D3.2.1 ("Controls to prohibit trace at Exception levels"), clearing
>>> TRFCR_EL1 means that trace generation is prohibited at EL1 and EL0 but
>>> per R_YCHKJ the Trace Buffer Unit will still be enabled if
>>> TRBLIMITR_EL1.E is set. R_SJFRQ goes on to state that, when enabled, the
>>> Trace Buffer Unit can perform address translation for the "owning
>>> exception level" even when it is out of context.
>>>
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
>>>    arch/arm64/include/asm/kvm_host.h  |  1 +
>>>    arch/arm64/kvm/hyp/nvhe/debug-sr.c | 36 ++++++++++++++++++++++--------
>>>    2 files changed, 28 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
>>> index ac7f970c7883..a932cf043b83 100644
>>> --- a/arch/arm64/include/asm/kvm_host.h
>>> +++ b/arch/arm64/include/asm/kvm_host.h
>>> @@ -746,6 +746,7 @@ struct kvm_host_data {
>>>    		u64 pmscr_el1;
>>>    		/* Self-hosted trace */
>>>    		u64 trfcr_el1;
>>> +		u64 trblimitr_el1;
>>>    		/* Values of trap registers for the host before guest entry. */
>>>    		u64 mdcr_el2;
>>>    		u64 brbcr_el1;
>>> diff --git a/arch/arm64/kvm/hyp/nvhe/debug-sr.c b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
>>> index 2a1c0f49792b..fd389a26bc59 100644
>>> --- a/arch/arm64/kvm/hyp/nvhe/debug-sr.c
>>> +++ b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
>>> @@ -57,12 +57,27 @@ static void __trace_do_switch(u64 *saved_trfcr, u64 new_trfcr)
>>>    	write_sysreg_el1(new_trfcr, SYS_TRFCR);
>>>    }
>>> -static bool __trace_needs_drain(void)
>>> +static void __trace_drain_and_disable(void)
>>>    {
>>> -	if (is_protected_kvm_enabled() && host_data_test_flag(HAS_TRBE))
>>> -		return read_sysreg_s(SYS_TRBLIMITR_EL1) & TRBLIMITR_EL1_E;
>>> +	u64 *trblimitr_el1 = host_data_ptr(host_debug_state.trblimitr_el1);
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
>>>    }
>>>    static bool __trace_needs_switch(void)
>>> @@ -79,15 +94,18 @@ static void __trace_switch_to_guest(void)
>>>    	__trace_do_switch(host_data_ptr(host_debug_state.trfcr_el1),
>>>    			  *host_data_ptr(trfcr_while_in_guest));
>>> -
>>> -	if (__trace_needs_drain()) {
>>> -		isb();
>>> -		tsb_csync();
>>> -	}
>>> +	__trace_drain_and_disable();
>>>    }
>>>    static void __trace_switch_to_host(void)
>>>    {
>>> +	u64 trblimitr_el1 = *host_data_ptr(host_debug_state.trblimitr_el1);
>>> +
>>> +	if (trblimitr_el1 & TRBLIMITR_EL1_E) {
>>> +		write_sysreg_s(trblimitr_el1, SYS_TRBLIMITR_EL1);
>>
>> Will this restore a stale value if you do kvm_enable_trbe() then later
>> kvm_disable_trbe()? Looks like the read and save will be skipped unless
>> host_data_test_flag(TRBE_ENABLED) is true, so it will never save a disabled
>> value.
> 
> __trace_drain_and_disable() sets the saved limit to 0 if TRBE_ENABLE is
> not set, so this shouldn't do anything in that case. Or did I
> misunderstand your scenario?
> 

No you're right. I saw the early return for !TRBE_ENABLED and thought 
things only happened after that. But the zeroing is before, so it's ok.

>> kvm_disable_trbe() might need to clear host_debug_state.trblimitr_el1.
> 
> pKVM can't rely on that thing being called, so the context switch still
> needs to be self-contained there.
> 
> Will


