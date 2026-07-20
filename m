Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE48C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 16:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UMSpywKxqagrBACgJFmPd3iIfkAUv2kJob+ZiosLjg0=; b=oaE/wjudBIGfTpxOI/yeROHHOg
	0Dtf0N1FwFwvo/aJEB+DwpDBCd+K+rRXbYkl2cnbjCdSXykAl6Ii8UWxhOAULOozdFz3y/E/Q8/lV
	dY9/O0TJOkSPoEIXl9nz1FK9KdqVZY0VUsfHV/T27QxzYCO1ZHuK3uvw+YaO4tAB7sk677t4n58iP
	r5QcnWbZ9e/dZiPYS7c2IxuKoiUDAkKcykc05sAfksUAqdS3jbRcD6s+1X2NwUS5oWC1m2U8BiE9S
	OVY6JhqXLibreN7GPdB9imVwLeoATnyOJcbzrtYkrbNrn8M/nVKzZZPsjvBO1yoC5/BpnOoi3Y3nz
	SgmD0s5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlr8e-00000007QJm-3l74;
	Mon, 20 Jul 2026 16:46:44 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlr8b-00000007QHa-3ihe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 16:46:44 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4954df200ddso17671385e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 09:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784566000; x=1785170800; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UMSpywKxqagrBACgJFmPd3iIfkAUv2kJob+ZiosLjg0=;
        b=w8k3Oir3C2i1gGD1P6KT05jc+aH4B/VbVyehwZfKD6md3uI4qUWaiEMZlMveWLRNhC
         E94L+n6AfuMQHgUIxL5i4Tup8GPVXU1t7bGLweI4gMzbyAYYYEodMGpZJMeKQvZQeNS1
         +CcfJ0aepB/ms6BNZsEJ9VUR3koWdOyPBaSzb0Bbw1DRhpsfg07rREt4te+A916DxPc/
         oovN7heE0ia8fv02pSORl4UX6/h+O7D/qqwxYy4QMSHlJJP5yHIXMACjviaCfunO4Jds
         YxFPwumeH9pNaruqDYZZo8ppEUvXZcbh/m4ccqCLbL1A6SLzA46hVLx5QcyfTNyn1+jS
         CPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784566000; x=1785170800;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UMSpywKxqagrBACgJFmPd3iIfkAUv2kJob+ZiosLjg0=;
        b=OZfWNKupCPbJhc07KLQ5YGSeeBIiicxw7FFu9H1SgSSMVhXQ4kVzhMj0rjYfPnr1st
         aB77H+EK2My2u58deEOvyo/Mra/F7WFr9QKfmmxadKjri8f7wnBTxgl9qk82JdxE0a9k
         elSivAqDDlJUYhD9DfM/xD2GqCQYMEoyseGHztjoeFuCAFF625E7tKzeRmqjeW9CQzRn
         mqu061wlPPSqQdOyqea7KK2NSrRYOr/7+23i54B2bT+rCnpXR7xb8Ft+QqIGAYFOFT+F
         1t59hvN5ztS9IYImsdnuRD+9n6kae54hGYqGET1z5H83UtgaIEKw7/fEy0qR9YYxZrTj
         SwZw==
X-Forwarded-Encrypted: i=1; AHgh+Rq9nFSCkpd/HvJTQ9PSvapMMC4XatF7XNcGWxOXFdPepvtoAHdyOvrL4pm+2OOsyNzIkGfQEAqOzv6vj4IKynBr@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf67Ifdqs2c5rBcaIitD4l1j1sMWdnA/6DP2YAySnzWmJL1mQi
	Tpmuqq/o/hRSc7/8mkBndWrTcdmofn6rjzgBDXxVjLMHvKh32aO37mjUNhj7voTyk1Q=
X-Gm-Gg: AR+sD10UVHetauNA9GegfK6Duu9OL8v0iKhuOOjsrNWy33zSKvXcwxWCmoSu6tKxsLD
	18M49nzLYhtb+0uWM3YxO+llDh4nDAyRipOKMrF+51V0CFu/Qvh68YVG3+kpdaJ3EyptJtg4NNo
	et9BRHbJvmPeXXP5BrxQfjqaYqsudcT8Oxqe0LX/5nI70WOuCs6NjwoeOot31/bmYEzpbDC/tGw
	mS2TynDc4THnk2UPcM4IAvQB8U0Bskfb/z+XTDIMVYkG9wKpxhPR24QmZgRH1jztQpgmXmHjROQ
	oZLS3HGZECCrA0knHmIm1Ry5AmYFhkfQ5/EmGBVdItGpSgtFCLDGe1FpWBmu81L/LNR4Je3/37n
	q0KYCSBOcwoEX6G/P5s24x8W+FfH0V/Q4hsJtCpQRsl2F9B05933vxktD9Xki05Ei79/8Xj5Tnx
	2ThOoGWBg=
X-Received: by 2002:a05:6000:4310:b0:47d:ecaa:3f97 with SMTP id ffacd0b85a97d-47f6233db68mr17307845f8f.45.1784566000150;
        Mon, 20 Jul 2026 09:46:40 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e496afsm32530307f8f.1.2026.07.20.09.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 09:46:39 -0700 (PDT)
Message-ID: <3fc867c3-67a0-4fdd-b871-f2ba4d642f1f@linaro.org>
Date: Mon, 20 Jul 2026 17:46:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: James Clark <james.clark@linaro.org>
Subject: Re: [PATCH 11/21] KVM: arm64: Context swap Partitioned PMU guest
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
References: <20260612192909.1153907-1-coltonlewis@google.com>
 <20260612192909.1153907-12-coltonlewis@google.com>
Content-Language: en-US
In-Reply-To: <20260612192909.1153907-12-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_094641_955435_3BDA9E6B 
X-CRM114-Status: GOOD (  21.59  )
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



On 12/06/2026 20:28, Colton Lewis wrote:
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
>   arch/arm/include/asm/arm_pmuv3.h |   4 +
>   arch/arm64/kvm/arm.c             |   2 +
>   arch/arm64/kvm/pmu-direct.c      | 183 +++++++++++++++++++++++++++++++
>   include/kvm/arm_pmu.h            |  16 +++
>   4 files changed, 205 insertions(+)
> 

[...]

> +
> +/**
> + * kvm_pmu_put() - Put untrapped PMU registers
> + * @vcpu: Pointer to struct kvm_vcpu
> + *
> + * Put all untrapped PMU registers from the VCPU into the PCPU. Mask
> + * to only bits belonging to guest-reserved counters and leave
> + * host-reserved counters alone in bitmask registers.
> + */
> +void kvm_pmu_put(struct kvm_vcpu *vcpu)
> +{
> +	struct arm_pmu *pmu;
> +	unsigned long guest_counters;
> +	unsigned long flags;
> +	u64 mask;
> +	u8 i;
> +	u64 val;
> +
> +	/*
> +	 * If we aren't guest-owned then we know the guest is not
> +	 * accessing the PMU anyway, so no need to bother with the
> +	 * swap.
> +	 */
> +	if (!kvm_pmu_is_partitioned(vcpu->kvm))
> +		return;
> +
> +	preempt_disable();
> +
> +	pmu = vcpu->kvm->arch.arm_pmu;
> +	guest_counters = kvm_pmu_guest_counter_mask(pmu);
> +
> +	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
> +		if (i == ARMV8_PMU_CYCLE_IDX)
> +			val = read_pmccntr();
> +		else
> +			val = read_pmevcntrn(i);
> +
> +		__vcpu_assign_sys_reg(vcpu, PMEVCNTR0_EL0 + i, val);
> +	}
> +
> +	val = read_sysreg(pmselr_el0);
> +	__vcpu_assign_sys_reg(vcpu, PMSELR_EL0, val);
> +
> +	val = read_sysreg(pmcr_el0);
> +	__vcpu_assign_sys_reg(vcpu, PMCR_EL0, val);
> +
> +	/* Mask these to only save the guest relevant bits. */
> +	mask = kvm_pmu_guest_counter_mask(pmu);
> +
> +	val = read_sysreg(pmcntenset_el0);
> +	__vcpu_assign_sys_reg(vcpu, PMCNTENSET_EL0, val & mask);
> +
> +	val = read_sysreg(pmintenset_el1);
> +	__vcpu_assign_sys_reg(vcpu, PMINTENSET_EL1, val & mask);
> +
> +	/* Save pending guest hardware overflows. */
> +	local_irq_save(flags);
> +	val = read_sysreg(pmovsset_el0);
> +	__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, |=, val & mask);
> +	write_sysreg(val & mask, pmovsclr_el0);
> +	local_irq_restore(flags);
> +
> +	/* Stop guest counters and disable interrupts in hardware. */
> +	write_sysreg(mask, pmcntenclr_el0);
> +	write_sysreg(mask, pmintenclr_el1);
> +
> +	kvm_pmu_set_guest_counters(pmu, 0);

Hi Colton,

This function doesn't get added until "KVM: arm64: Apply dynamic guest 
counter reservations" a few commits later.

kvm_pmu_guest_counter_mask() is also used in a commit before it's added.


