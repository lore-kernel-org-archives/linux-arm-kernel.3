Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC751106286D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 12:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WSs03vKecjzDF1VoMO+y/2LecDhgaBTeL52G3xYHcfk=; b=pAMAXTk1KcqO1NGmso1yUx9oQW
	th3KDvw/IqQcY76rrc8Ar+/dJb6PM44F+ih32sQgPEkNym/9QaOnBjVKXFB/SfrQdTkW3hQwkI5ge
	U/7BeF3212YoJMIxQaRlpR0LGrlBPMIHqD1nZ9yp/8HyzfnGjrXOGMHs/0R1pRKfeA+3CT9wkIRtj
	E+TyLlSJQS+5eBPaIs7MJhGHSyciPls5OABvVzwpJiL5YF2KYh8IlXzq9dbZMW8UNYBx2WZQiP/ON
	UtGRGeEIuxUIufkeFgA3f1Ov3NfuZgN+2iNz6K4rnzOZrN0SpMfwpPG7cZoJKf9s+ZsmShi4ivrwo
	6opoN7Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0IFn-0000000BX2L-3l4I;
	Wed, 11 Mar 2026 12:01:31 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0IFl-0000000BX1j-3Z7o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 12:01:31 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-662b5bf4b10so3942726a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 05:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773230488; x=1773835288; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WSs03vKecjzDF1VoMO+y/2LecDhgaBTeL52G3xYHcfk=;
        b=ysu4nYTL8ENxQoITNgl53+MorRcKlwT/b3PQ55xWji1QXy+axStbQDWSgAKHNywrDt
         95fmALH8q+Yv78hb6gup6hW70JLOBxJgNrAl/R6u0k7h3DcEsLdNMunn9an3x4TL4YmT
         4ueX39PPdw0r/vf+Y6FMWT7ZmmfcLfshdLY5BDriN0Tgycs6/Cj1DS8YPCgP7ezkZvyo
         GuFWKTM1MaOtIb2ipHIIJ15uyPem2G8OR4oAvmZsINU9LWJzCGZfq/hFfgrvK0TyHYxH
         pDlGN8yzbtZZ/I1EiTrQayIp23fqaavEgjhCr8hBRJc3pTjsr7UUG1ejM6mmLmmWjsfB
         4tyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773230488; x=1773835288;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WSs03vKecjzDF1VoMO+y/2LecDhgaBTeL52G3xYHcfk=;
        b=HiCpZM7FkbEWNWCFf0C9iAxz84nOsNYHPcaw5j3bK0uQoWV05C5fuqv1RW92VjOZzf
         KZbJbCERnTnZgoOJm1fjmwyutGRkmZC3QUlEEEwMaLKY+fhtKeMQTNGu6A0nQIQNjMKT
         tJNUvqQByBmt439mElpGpHmhS4zGeGGZT/uIaTcjhfd+r804IIM6GbYsV8//imm88wVT
         +CDq5VE/dSSbkDPtfJM4Dsi4AsjAuUQTVZkTD3cMOmalmRjWg9BX+Ui8m7dZFW2r+LL3
         BtMzqcu68NWkQr2NhGwFVA8t4iaVJW1WOBCWT3m7H7iSgUzAYyVXmt7x3jKeA9e/8bkv
         24dw==
X-Forwarded-Encrypted: i=1; AJvYcCWRqnmgGfzrcW8S640cUYSKvYD6BTS2xvY2zEkUkwM8+VJpDW4vdI2ewx0FIIshyHeKBs3IvSoLbbywWZ561RdE@lists.infradead.org
X-Gm-Message-State: AOJu0YxyBM+kluJDCkZRmeRKo/67teo4VEdosrgUmeFwuq/CWB5H0vuw
	MaQzOxgkbfEhwkM605c9/2WMGNqAwd21t5CWm97y07oPnpLPLcFlvVamvXzqSAr44m0=
X-Gm-Gg: ATEYQzzB4k0laeZlFUTHBMCpkqpWCTGEkS7Nta01bEJjOfKqEJOohWrDTrtyxO/rONO
	CP7Ko+G+xwpAE+yp/ZCHfl8BTZbIpjW7LPBWUGrCa20+Av8u4JbekeBKaRfBugyZYdFSnlIgg8U
	yUEZBPTZPhQ/uH5BE7A9qbaX9dhFxYELWZ+sRbDxVXtQuHNMx+k2VYBoE9zvDSi1TJFCrZdUBKT
	JMB8rzckNiLSbQqKyaJQooo25znHj94J0R03y1n94CMx+1Dudtjlc5ffH4w3tfeC3VX23RYk1Cn
	fG+jPr966v8b98Ehjh3xTQsklUH30fpyxzJeka8YbgZFBldzQO3sKuslqtJ2GndY1GBq598KONx
	zM0dn1zw+RizxuPlNgRhi/WMnWqTC/VpP7HjRQ/tLLR+PTQwBgrg//FtGazX2trwtI+1P+kixTy
	40zKwV4Na6gk08r/w/2Wu/Mu1VNzg0
X-Received: by 2002:a05:6402:3514:b0:662:bb58:602c with SMTP id 4fb4d7f45d1cf-66319ee3efdmr1270923a12.29.1773230487607;
        Wed, 11 Mar 2026 05:01:27 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6631503c903sm476518a12.20.2026.03.11.05.01.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 05:01:27 -0700 (PDT)
Message-ID: <68a93eb5-24df-4b73-bd1e-798dc32b7e86@linaro.org>
Date: Wed, 11 Mar 2026 12:01:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/19] KVM: arm64: Context swap Partitioned PMU guest
 registers
To: Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>,
 Shuah Khan <shuah@kernel.org>,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260209221414.2169465-1-coltonlewis@google.com>
 <20260209221414.2169465-12-coltonlewis@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260209221414.2169465-12-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_050129_920903_CD3C0D4B 
X-CRM114-Status: GOOD (  25.26  )
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



On 09/02/2026 10:14 pm, Colton Lewis wrote:
> Save and restore newly untrapped registers that can be directly
> accessed by the guest when the PMU is partitioned.
> 
> * PMEVCNTRn_EL0
> * PMCCNTR_EL0
> * PMSELR_EL0
> * PMCR_EL0
> * PMCNTEN_EL0
> * PMINTEN_EL1
> 
> If we know we are not partitioned (that is, using the emulated vPMU),
> then return immediately. A later patch will make this lazy so the
> context swaps don't happen unless the guest has accessed the PMU.
> 
> PMEVTYPER is handled in a following patch since we must apply the KVM
> event filter before writing values to hardware.
> 
> PMOVS guest counters are cleared to avoid the possibility of
> generating spurious interrupts when PMINTEN is written. This is fine
> because the virtual register for PMOVS is always the canonical value.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>   arch/arm64/kvm/arm.c        |   2 +
>   arch/arm64/kvm/pmu-direct.c | 123 ++++++++++++++++++++++++++++++++++++
>   include/kvm/arm_pmu.h       |   4 ++
>   3 files changed, 129 insertions(+)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 620a465248d1b..adbe79264c032 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -635,6 +635,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>   		kvm_vcpu_load_vhe(vcpu);
>   	kvm_arch_vcpu_load_fp(vcpu);
>   	kvm_vcpu_pmu_restore_guest(vcpu);
> +	kvm_pmu_load(vcpu);
>   	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
>   		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
>   
> @@ -676,6 +677,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>   	kvm_timer_vcpu_put(vcpu);
>   	kvm_vgic_put(vcpu);
>   	kvm_vcpu_pmu_restore_host(vcpu);
> +	kvm_pmu_put(vcpu);
>   	if (vcpu_has_nv(vcpu))
>   		kvm_vcpu_put_hw_mmu(vcpu);
>   	kvm_arm_vmid_clear_active();
> diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
> index f2e6b1eea8bd6..b07b521543478 100644
> --- a/arch/arm64/kvm/pmu-direct.c
> +++ b/arch/arm64/kvm/pmu-direct.c
> @@ -9,6 +9,7 @@
>   #include <linux/perf/arm_pmuv3.h>
>   
>   #include <asm/arm_pmuv3.h>
> +#include <asm/kvm_emulate.h>
>   
>   /**
>    * has_host_pmu_partition_support() - Determine if partitioning is possible
> @@ -163,3 +164,125 @@ u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)
>   
>   	return *host_data_ptr(nr_event_counters);
>   }
> +
> +/**
> + * kvm_pmu_load() - Load untrapped PMU registers
> + * @vcpu: Pointer to struct kvm_vcpu
> + *
> + * Load all untrapped PMU registers from the VCPU into the PCPU. Mask
> + * to only bits belonging to guest-reserved counters and leave
> + * host-reserved counters alone in bitmask registers.
> + */
> +void kvm_pmu_load(struct kvm_vcpu *vcpu)
> +{
> +	struct arm_pmu *pmu;
> +	unsigned long guest_counters;
> +	u64 mask;
> +	u8 i;
> +	u64 val;
> +
> +	/*
> +	 * If we aren't guest-owned then we know the guest isn't using
> +	 * the PMU anyway, so no need to bother with the swap.
> +	 */
> +	if (!kvm_vcpu_pmu_is_partitioned(vcpu))
> +		return;
> +
> +	preempt_disable();
> +
> +	pmu = vcpu->kvm->arch.arm_pmu;
> +	guest_counters = kvm_pmu_guest_counter_mask(pmu);
> +
> +	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
> +		val = __vcpu_sys_reg(vcpu, PMEVCNTR0_EL0 + i);
> +
> +		write_sysreg(i, pmselr_el0);
> +		write_sysreg(val, pmxevcntr_el0);

This needs to have a special case for ARMV8_PMU_CYCLE_IDX because you 
can't use pmxevcntr_el0 to read or write PMCCNTR_EL0:

D24.5.22:

   SEL 0b11111      Select the cycle counter, PMCCNTR_EL0:

                    MRS and MSR of PMXEVCNTR_EL0 are CONSTRAINED
                    UNPREDICTABLE.

There are 3 separate instances of the same thing in the patches. I was 
getting undefined instruction errors on my Radxa O6 board until they 
were all fixed.


