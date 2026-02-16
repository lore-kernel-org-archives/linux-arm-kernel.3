Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A663E81A25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 15:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ARVlRZLS2IZMmsfNeB9nzFj870EQPkmjLcXV/k5P/+U=; b=wjAVUmZlchm5LnozWxSNocEfD3
	mj/SUkS61NUSz/eirw4Kt4kT7iXGT0pA3tHCGi8sp4kKu72nT9l7QI4tQKijwj7YLDWI7L5bQZ4tQ
	2VUMJxkR0nI8l8/N+Nan/84i5+2dTRa9w7ohIDSCfX+i0xjV/g2OKt+Hrakf2jR+M+SoIU21QaquZ
	BSdZ418H3S4nTBDEu949LcWfjn17QlpSEFLeRYJ7INMXpskoedO7cl/I8o1j6mWKZ/jQk6AHqF7Sg
	VyLwfpaAk2SfQnamW4m+hmQhfgOmqqq1p8h/b0tbedM76k7hh49a/6qdDchTGgv7op8IRg9mObEzj
	dMT1esOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs0IT-00000006rMY-1Ulf;
	Mon, 16 Feb 2026 15:14:01 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs0IQ-00000006rM5-2oAP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 15:14:00 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-59e5ea93a1aso2733911e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 07:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771254836; x=1771859636; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ARVlRZLS2IZMmsfNeB9nzFj870EQPkmjLcXV/k5P/+U=;
        b=FfXJl9K+BlD2XyoOnoB1RQNGO7uuprpXI66qoCbU2KoicYMTQMyviCBSwZNPQGe+ae
         1GfP8zY7cz4L7wHcvLkgiSl3806p0EKJ3rdtF4g4SQCszapinn2jDG8AWB3FVakahXv+
         /+lMg0CvCZqkBjIZC1y986ANGNIbHfbAs+9OE3J15Gn43AGO7jpH66cYEK987lVA4a+A
         qGRNZWd3k99Bb2ntloHnQcWWk6NmB/SnhvWmOChTKROXLEERqBUupyYZa3iWBNMTkqnI
         aPD4DspviOK96WD2WBc8comatImZ+CB+55kz/9sv4pmmSLkggXD+ef1FSovQu55rR0kf
         zumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771254836; x=1771859636;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ARVlRZLS2IZMmsfNeB9nzFj870EQPkmjLcXV/k5P/+U=;
        b=qeCvMc/UWeHmOvNh+S8ITxFpyd9hU8CohHsvPOVnX3gLwrWi5iEaQD+s2VRV309Ghp
         jSSa0nr/6HaVihOrs+Q1BDZVMJoBnReO4yJXQ9tYhYqy3TdQN8s/W1wKwa5xVcE/RQi4
         D7AB8lwD4iMRSYHrXQexnaNDXa42Qr8VYIal4vMOWiZ1Ic3qt5m+v9RuZpLidsMN9UWr
         dM8JQCCEcl7Cz8K91rk13XmQ6QZYCzH0EV9EiHzVD8BmlE1etuDB6aB4jMcJnEcu7su/
         gyZZ1WO9uxISA+5tNnYp6DJVhFWzY338pZjAD/uZDgKHEOtTlcrn19yR7XnCl+9LChaL
         fFxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEF7Bu/O2Em5eMgTf0JKuK/N7swDtLl4CsJq+LKEcg55uMv/OT8L88A2fWdA3yS1sagrSxMGBQBE4DSbZYG1aJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzyxzwCujVoJ3ai6FSEg8GKt9HQEvisJnH6pAqaHx/0/ffH5PQ2
	eVlPGFCfod03khmE/de1Yh57kYkrs6vy+B4YUNYTm1pbbotdJ6H1YpFDulPNE6mh/oI=
X-Gm-Gg: AZuq6aJMaNYU4tpNKcz+djxW1gOoY2smwOON1qXRZZWWcvFAka/Wm8zxCLjKkx1tZ1I
	poHT15VmybA8iX/cOc1cXPSL3Zg5M27BRJb1n3oPa9BeTN4ohJ7FwpsBaf4uut02ToZ1W1uiEuj
	JjPFM3ZsfrxTUzHRk7f+LQG1k6M7TV/oQlJkFseCBEVTqT75G3TD96H8MDTVcKh4ZtoX17cDDWa
	KlG3lHVmbmxI2Eogp+9EkOmM+TjhvvReceGbWUFiu5o1oNhhot8SrT6CO2qHby4cBgLp28a4Qhi
	GKvor5bAqe1/UaRrbaZN7PxKPg366aMByERd4M0kWVyEF2pe8llhlzCXpgWj2B/jJogAynEPEWh
	BeN+ZwYt25y41hTmQFnoQcmGDKu/8o1bnqY8rw6Iqyu6m0caRdfqS1LVe+2NZx/3RzPTaormeaf
	25XRNHk+ftewJxJ7gCfGCmRAIYDMf3
X-Received: by 2002:a05:6512:15a6:b0:59e:4671:1020 with SMTP id 2adb3069b0e04-59f6d3883e5mr1888575e87.46.1771254836319;
        Mon, 16 Feb 2026 07:13:56 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38706906089sm29671031fa.31.2026.02.16.07.13.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 07:13:55 -0800 (PST)
Message-ID: <878e304e-4162-4981-8125-bd4f67ba9dd5@linaro.org>
Date: Mon, 16 Feb 2026 15:13:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: Disable TRBE Trace Buffer Unit when running
 in guest context
To: Will Deacon <will@kernel.org>, kvmarm@lists.linux.dev
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Fuad Tabba <tabba@google.com>
References: <20260216130959.19317-1-will@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260216130959.19317-1-will@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_071359_185475_979F5555 
X-CRM114-Status: GOOD (  31.05  )
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



On 16/02/2026 1:09 pm, Will Deacon wrote:
> The nVHE world-switch code relies on zeroing TRFCR_EL1 to disable trace
> generation in guest context when self-hosted TRBE is in use by the host.
> 
> Per D3.2.1 ("Controls to prohibit trace at Exception levels"), clearing
> TRFCR_EL1 means that trace generation is prohibited at EL1 and EL0 but
> per R_YCHKJ the Trace Buffer Unit will still be enabled if
> TRBLIMITR_EL1.E is set. R_SJFRQ goes on to state that, when enabled, the
> Trace Buffer Unit can perform address translation for the "owning
> exception level" even when it is out of context.
> 
> Consequently, we can end up in a state where TRBE performs speculative
> page-table walks for a host VA/IPA in guest/hypervisor context depending
> on the value of MDCR_EL2.E2TB, which changes over world-switch. The
> result appears to be a heady mixture of data corruption and hardware
> lockups.
> 
> Extend the TRBE world-switch code to clear TRBLIMITR_EL1.E after
> draining the buffer, restoring the register on return to the host.
> 
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oupton@kernel.org>
> Cc: James Clark <james.clark@linaro.org>
> Cc: Leo Yan <leo.yan@arm.com>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Fuad Tabba <tabba@google.com>
> Fixes: a1319260bf62 ("arm64: KVM: Enable access to TRBE support for host")
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
> 
> NOTE: This is *untested* as I don't have a TRBE-capable device that can
> run upstream but I noticed this by inspection when triaging occasional
> hardware lockups on systems using a 6.12-based kernel with TRBE running
> at the same time as a vCPU is loaded. This code has changed quite a bit
> over time, so stable backports are not entirely straightforward.
> Hopefully James/Leo/Suzuki can help us test if folks agree with the
> general approach taken here.
> 
>   arch/arm64/include/asm/kvm_host.h  |  1 +
>   arch/arm64/kvm/hyp/nvhe/debug-sr.c | 36 ++++++++++++++++++++++--------
>   2 files changed, 28 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index ac7f970c7883..a932cf043b83 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -746,6 +746,7 @@ struct kvm_host_data {
>   		u64 pmscr_el1;
>   		/* Self-hosted trace */
>   		u64 trfcr_el1;
> +		u64 trblimitr_el1;
>   		/* Values of trap registers for the host before guest entry. */
>   		u64 mdcr_el2;
>   		u64 brbcr_el1;
> diff --git a/arch/arm64/kvm/hyp/nvhe/debug-sr.c b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
> index 2a1c0f49792b..fd389a26bc59 100644
> --- a/arch/arm64/kvm/hyp/nvhe/debug-sr.c
> +++ b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
> @@ -57,12 +57,27 @@ static void __trace_do_switch(u64 *saved_trfcr, u64 new_trfcr)
>   	write_sysreg_el1(new_trfcr, SYS_TRFCR);
>   }
>   
> -static bool __trace_needs_drain(void)
> +static void __trace_drain_and_disable(void)
>   {
> -	if (is_protected_kvm_enabled() && host_data_test_flag(HAS_TRBE))
> -		return read_sysreg_s(SYS_TRBLIMITR_EL1) & TRBLIMITR_EL1_E;
> +	u64 *trblimitr_el1 = host_data_ptr(host_debug_state.trblimitr_el1);
>   
> -	return host_data_test_flag(TRBE_ENABLED);
> +	*trblimitr_el1 = 0;
> +
> +	if (is_protected_kvm_enabled()) {
> +		if (!host_data_test_flag(HAS_TRBE))
> +			return;
> +	} else {
> +		if (!host_data_test_flag(TRBE_ENABLED))
> +			return;
> +	}
> +
> +	*trblimitr_el1 = read_sysreg_s(SYS_TRBLIMITR_EL1);
> +	if (*trblimitr_el1 & TRBLIMITR_EL1_E) {
> +		isb();
> +		tsb_csync();
> +		write_sysreg_s(0, SYS_TRBLIMITR_EL1);
> +		isb();
> +	}
>   }
>   
>   static bool __trace_needs_switch(void)
> @@ -79,15 +94,18 @@ static void __trace_switch_to_guest(void)
>   
>   	__trace_do_switch(host_data_ptr(host_debug_state.trfcr_el1),
>   			  *host_data_ptr(trfcr_while_in_guest));
> -
> -	if (__trace_needs_drain()) {
> -		isb();
> -		tsb_csync();
> -	}
> +	__trace_drain_and_disable();
>   }
>   
>   static void __trace_switch_to_host(void)
>   {
> +	u64 trblimitr_el1 = *host_data_ptr(host_debug_state.trblimitr_el1);
> +
> +	if (trblimitr_el1 & TRBLIMITR_EL1_E) {
> +		write_sysreg_s(trblimitr_el1, SYS_TRBLIMITR_EL1);

Will this restore a stale value if you do kvm_enable_trbe() then later 
kvm_disable_trbe()? Looks like the read and save will be skipped unless
host_data_test_flag(TRBE_ENABLED) is true, so it will never save a 
disabled value.

kvm_disable_trbe() might need to clear host_debug_state.trblimitr_el1.

> +		isb();
> +	}
> +
>   	__trace_do_switch(host_data_ptr(trfcr_while_in_guest),
>   			  *host_data_ptr(host_debug_state.trfcr_el1));
>   }


