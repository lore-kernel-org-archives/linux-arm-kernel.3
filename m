Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD1CC35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 08:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=raeSZ2hiIddXsOAs17+aEypVNCamlDqV6zC8M8stgwI=; b=as9rDmuw84fnegdLSRXDhvdtqf
	2tpEp5UCG4CxBlVL6UQqonbFraUFfzO3LjHRbVGo6xU3p7l+cOod67h5iH3onvKp8YmPb0kjBRd9m
	xas6Rcy4Nf/p2Bt90C92q++bop4QO3uV0Vb/Qvj+vB5EjTKYyl8dcxlTjsxtVib2p5ZfQwLCRCkZW
	ZQjbA7SL2wYFvPOMSxOKDSYdP2P0pA81pBVknVpOgDwRUHy8T4TdXGQH0pEKrO2gX5jYgDXMjjJid
	iTLc2yMDm6+JP5zxJjipfKIRkTDTid4C0KDkNWREuIBAvpaHduOrFukOYoFP4qwSBwLTasKAqktsq
	IEim9OpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuoyB-00000008NOc-2VRZ;
	Wed, 19 Mar 2025 08:40:11 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuovg-00000008N2k-0Wr4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 08:37:37 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-225e3002dffso74152655ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 01:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1742373455; x=1742978255; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=raeSZ2hiIddXsOAs17+aEypVNCamlDqV6zC8M8stgwI=;
        b=hsMWGYkMXGQ1chhWiSGMJnjlFn4i7CCosDzJypnCYddyWEyX/5QvugVo+rnIR4ozvj
         k38yLkmMQikXrdPwGBB52z2hZOD86dDRAWNEn/GqlpbqQFIP6o+fXMI4BM4e/HOwfOAr
         FNW70OmcfVgVBhSOtBC8TuOa5CRXLslRY7kkUgwbzjAsstVMCtKR77wMIw7h8hbLZ7n8
         MtvrgjJ7LwzldmgziCIQBbKz/JtYFWtjSYTdMwt/14MlbjIpTG8cXKs1OJsgjHpNX49W
         uyfLDn6tA6WkTbfvX33dplQM2I0AtBsSnRoUfxq29IqyshBYMOmDFBUzzNHYFpJVAAvG
         jyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742373455; x=1742978255;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=raeSZ2hiIddXsOAs17+aEypVNCamlDqV6zC8M8stgwI=;
        b=LuHCKjZUoIYohIgA9z7rTJYOIdnyKL/DhNc/ilNFMyWSO0M7RoTEcVmRIGPUF8nHm2
         hlgxWEvzsuO7StinJwcFx+ajpweclrRrPaA2BLCfjEvdPIUQNbqEOX5eZqhyICHVGzSy
         yUjGArmrAGDYWumEP4H87LEX+RGZr45AnapWqaDRqqSYbpEW7mUfq52vuBV3uzec/teT
         /Mz1NpGfA43I5vhc1kt8gN9tKgdcijXlZ83+Z25ADFQYzFHhoakp9p39uhytaC6t/KbE
         GW0SC+FASa8do9XussqVEG5Q9WuTNGkT9iCFwPSWJ+F+WzS8OJPMb2ZweMK4Nofxdimy
         /DWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiFbi1/VwvJI85lT37+OUjzsCodmXCUK4MN2Yuj2bcv6IzG9YhCxSqh1LSltRQzptvfkf+4XYBC4r9igfGRPS6@lists.infradead.org
X-Gm-Message-State: AOJu0YxEIAWdBC5ONZ2vSvBmJIn7Dp0BPNWdXMmI8nJrfLi53R5l+MU1
	vamHPgcjc+8MehPtHiiAwkNKfy2wbZgKURXLtbnXNxR7YTgrJ36CDX02KflrsE4eSIVvTX9DVgc
	6gFY=
X-Gm-Gg: ASbGncuWU5vsaZanzrVFe41rPQUL03VXhHSv0E2qQQg5xg/Hlw1eCDi5i53KFQj5jSn
	t78wA6ghycyWx1olvkOr8ztsSN0cI8nbsmpc/RDzgvPMidFsuTwhw83G+c4zcMuNmQc+KVGodoM
	AW5LMjojwPs1iyqkUJPR5Nxtw79/4NczTR2dTKUhrWfWH849eHLsECwtvFWfloCcDR5FyzYrrja
	DxEL4LE4iqsgAHp6Zwtp8z5oRlBTYkZZWlI27ZD8aaIg5wl1IN1OTQTWMve/UNlisk315DFuYDb
	Jq2SmFFPTNhXAUAPR3q5T6bcJjdgucTA58pPpQrIhkX9KJ1II4fFwoQB+A==
X-Google-Smtp-Source: AGHT+IH+6dxptjQXlSRUDSGGL2iyvluJRGz6CBIsQSY3dGou7+NO/3MdKJprSYoKWQkhnn/vTt9hvQ==
X-Received: by 2002:a05:6a00:1701:b0:736:5dae:6b0d with SMTP id d2e1a72fcca58-7376d5fedddmr2863987b3a.10.1742373455094;
        Wed, 19 Mar 2025 01:37:35 -0700 (PDT)
Received: from [157.82.207.107] ([157.82.207.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737116b114asm11031715b3a.164.2025.03.19.01.37.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 01:37:33 -0700 (PDT)
Message-ID: <e8324d9d-3756-41cf-a102-28572e302368@daynix.com>
Date: Wed, 19 Mar 2025 17:37:29 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] KVM: arm64: PMU: Use multiple host PMUs
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 devel@daynix.com
References: <20250319-hybrid-v1-1-4d1ada10e705@daynix.com>
 <Z9pze3J2_zrTk_yC@linux.dev>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <Z9pze3J2_zrTk_yC@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_013736_466127_A8099BC5 
X-CRM114-Status: GOOD (  38.39  )
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

On 2025/03/19 16:34, Oliver Upton wrote:
> Hi Akihiko,
> 
> On Wed, Mar 19, 2025 at 03:33:46PM +0900, Akihiko Odaki wrote:
>> Problem
>> -------
>>
>> arch/arm64/kvm/pmu-emul.c used to have a comment saying the follows:
>>> The observant among you will notice that the supported_cpus
>>> mask does not get updated for the default PMU even though it
>>> is quite possible the selected instance supports only a
>>> subset of cores in the system. This is intentional, and
>>> upholds the preexisting behavior on heterogeneous systems
>>> where vCPUs can be scheduled on any core but the guest
>>> counters could stop working.
>>
>> Despite the reference manual says counters may not continuously
>> incrementing, Windows is not robust enough to handle stopped PMCCNTR_EL0
>> and crashes with a division-by-zero error and it also crashes when the
>> PMU is not present.
>>
>> To avoid such a problem, the userspace should pin the vCPU threads to
>> pCPUs supported by one host PMU when initializing the vCPUs or specify
>> the host PMU to use with KVM_ARM_VCPU_PMU_V3_SET_PMU after the
>> initialization. However, QEMU/libvirt can pin vCPU threads only after the
>> vCPUs are initialized. It also limits the pCPUs the guest can use even
>> for VMMs that support proper pinning.
>>
>> Solution
>> --------
>>
>> Ideally, Windows should fix the division-by-zero error and QEMU/libvirt
>> should support pinning better, but neither of them are going to happen
>> anytime soon.
>>
>> To allow running Windows on QEMU/libvirt or with heterogeneous cores,
>> combine all host PMUs necessary to cover the cores vCPUs can run and
>> keep PMCCNTR_EL0 working.
 > > I'm extremely uneasy about making this a generalized solution. PMUs are
> deeply tied to the microarchitecture of a particular implementation, and
> that isn't something we can abstract away from the guest in KVM.
> 
> For example, you could have an event ID that counts on only a subset of
> cores, or better yet an event that counts something completely different
> depending on where a vCPU lands.> > I do appreciate the issue that you're trying to solve.
> 
> The good news though is that the fixed PMU cycle counter is the only
> thing guaranteed to be present in any PMUv3 implementation. Since
> that's the only counter Windows actually needs, perhaps we could
> special-case this in KVM.
> 
> I have the following (completely untested) patch, do you want to give it
> a try? There's still going to be observable differences between PMUs
> (e.g. CPU frequency) but at least it should get things booting.

I don't think it will work, unfortunately. perf_init_event() binds a 
perf event to a particular PMU so the event will stop working when the 
thread migrates away.

It should also be the reason why the perf program creates an event for 
each PMU. tools/perf/Documentation/intel-hybrid.txt has more descriptions.

Allowing to enable more than one counter and/or an event type other than 
the cycle counter is not the goal. Enabling another event type may 
result in a garbage value, but I don't think it's worse than the current 
situation where the count stays zero; please tell me if I miss something.

There is still room for improvement. Returning a garbage value may not 
be worse than returning zero, but counters and event types not supported 
by some cores shouldn't be advertised as available in the first place. 
More concretely:

- The vCPU should be limited to run only on cores covered by PMUs when 
KVM_ARM_VCPU_PMU_V3 is set.
- PMCR_EL0.N advertised to the guest should be the minimum of ones of 
host PMUs.
- PMCEID0_EL0 and PMCEID1_EL0 advertised to the guest should be the 
result of the AND operations of ones of host PMUs.

Special-casing the cycle counter may make sense if we are going to fix 
the advertised values of PMCR_EL0.N, PMCEID0_EL0, and PMCEID1_EL0. 
PMCR_EL0.N as we can simply return zero for these registers. We can also 
prevent enabling a counter that returns zero or a garbage value.

Do you think it's worth fixing these registers? If so, I'll do that by 
special-casing the cycle counter.

Regards,
Akihiko Odaki

> 
> Thanks,
> Oliver
> 
> ---
> diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
> index a1bc10d7116a..913a7bab50b5 100644
> --- a/arch/arm64/kvm/pmu-emul.c
> +++ b/arch/arm64/kvm/pmu-emul.c
> @@ -724,14 +724,21 @@ static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc)
>   		return;
>   
>   	memset(&attr, 0, sizeof(struct perf_event_attr));
> -	attr.type = arm_pmu->pmu.type;
> +
> +	if (pmc->idx == ARMV8_PMU_CYCLE_IDX) {
> +		attr.type = PERF_TYPE_HARDWARE;
> +		attr.config = PERF_COUNT_HW_CPU_CYCLES;
> +	} else {
> +		attr.type = arm_pmu->pmu.type;
> +		attr.config = eventsel;
> +	}
> +
>   	attr.size = sizeof(attr);
>   	attr.pinned = 1;
>   	attr.disabled = !kvm_pmu_counter_is_enabled(pmc);
>   	attr.exclude_user = !kvm_pmc_counts_at_el0(pmc);
>   	attr.exclude_hv = 1; /* Don't count EL2 events */
>   	attr.exclude_host = 1; /* Don't count host events */
> -	attr.config = eventsel;
>   
>   	/*
>   	 * Filter events at EL1 (i.e. vEL2) when in a hyp context based on the


