Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE15ECD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 16:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=mkKg2AH9OzqTbzmtz3KJKgeEvCZA8Yl8G/ANzbR9O64=; b=aZiMhntbXNmsXz
	tAT8MFJVJ8QkwuFJdIi6fHMdGbEYtzwjSuZ5YTMuEVkY14A7sUjdo1jkbSdezwv8U4+Q3v1PD/k0X
	3sLR0CWPtAQ/0tkX/kmoEVeVPGHQ5g5b/pjRYBbgHk8zJpf+BtPvTcTxAhWqDeCRGCmESRBPkiRYX
	tmNU8WDIIGkBFppd9rTsPBraJOOoUiqezqMnaLboN0OigYuNLaZdKviHjsq+tCJaaZj/KMJiaMrjr
	zFlmVhUCrLEry2uoMD0cOsbamgtkBsy6L9JulM0wvUr9riQ2WwIepBFr5RGPhcZ4rp1YPwvPJrFy2
	0TPGvPm9KYytw48FiGsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCD6-00000003AxO-1MFw;
	Wed, 13 May 2026 16:13:24 +0000
Received: from mail-oo1-xc4a.google.com ([2607:f8b0:4864:20::c4a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCD3-00000003Awa-2aK6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 16:13:22 +0000
Received: by mail-oo1-xc4a.google.com with SMTP id 006d021491bc7-696307c7ee0so7549101eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 09:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778688800; x=1779293600; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mkKg2AH9OzqTbzmtz3KJKgeEvCZA8Yl8G/ANzbR9O64=;
        b=NErMRmX9ng2ncOfoY+/EDdrfmRUChzWMoD8RF+Y6STWrgWj91NuXVNBjuk/8EObqjR
         vS8dE1N8xeGkwKvZZDCrZxGAkdYhsl1IP+FfOqudnsHjlZiWoHsnhyHgd86G+B4GjcHi
         FuGiGZL4DPwUMfMlV3eCKl0TIHTsG2pQGhKI/PTVZsQ+mqrorRImHQVpk4Fo1YiQZ6Nd
         /UkY11OCqst6OarzqKi5u5IU85Bgueuctq/5qobfXvdMtvEDAJrWAvKXGb0pZfrgz8pM
         Axuzo5+SEpwyuc1I+2HRWTH9tHJ9JHbvifUEEkcms5mIGAtrI7Wrr+10g5K9VTM/nGhG
         xFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778688800; x=1779293600;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mkKg2AH9OzqTbzmtz3KJKgeEvCZA8Yl8G/ANzbR9O64=;
        b=U/+0kURfdc8G2yrXM+lnL5h7UbWhtwdjgk8oTzVusIUb4lw7cYslnaiJoIm2BXnknp
         NHvWfZG0cmEfx3M8HilhLCesEjhvwALmoSqRQ7OcZMy6Z0+G2UVcuvt1s/r38Ss07MfX
         J+pHlRrgU24h8wDZxO/ywgD30O0jPVpfk+G7tTMfqOX5BevBoGlxdkPHbM5lKtBgj+ol
         NT1OlI7Fjh09Om593RCpbg7GvQ5RHlKptilXiYBk6fM0m2EIkY6Oqxm0MMNoRqqGZNHu
         mofae/55flmDsAnQIDlF4RfWuA3A7q3pmCmrPR8sM19OkwgfoV12s7eev3hq/aWGYZra
         dnpw==
X-Forwarded-Encrypted: i=1; AFNElJ9AJwn+rXIN2lF8rQWmvYKvfbm1hF6otSASZxZweaU7MIr+jDn/KO+f+IlJft64FMd+ni4f5pPqmBYJ1RT0AVcS@lists.infradead.org
X-Gm-Message-State: AOJu0YyoPP11G/s4oJN1OLO2/4/AZpeK/Shko3qna9Q38QNp6AscsAsU
	CZzJu4xX8Rfc0x0w0Hz5KkduWbO9yS0TD05Yzm2RqZymFOz3pDuqIkTYMii5blTFRlYRBAhUIGF
	hwDRmGVLtzvhUUwqhZSNnmS9S+A==
X-Received: from ioro2.prod.google.com ([2002:a05:6602:2982:b0:96b:5f81:a45f])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:1525:b0:696:17a7:498c with SMTP id 006d021491bc7-69b78dd26b8mr2142761eaf.30.1778688799667;
 Wed, 13 May 2026 09:13:19 -0700 (PDT)
Date: Wed, 13 May 2026 16:13:18 +0000
In-Reply-To: <485b8846-13d7-4d31-abf1-686d2516f772@linaro.org> (message from
 James Clark on Mon, 11 May 2026 15:51:39 +0100)
Mime-Version: 1.0
Message-ID: <gsnt5x4rcmox.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v7 06/20] perf: arm_pmuv3: Add method to partition the PMU
From: Colton Lewis <coltonlewis@google.com>
To: James Clark <james.clark@linaro.org>
Cc: alexandru.elisei@arm.com, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_091321_673827_E9AC204E 
X-CRM114-Status: GOOD (  29.73  )
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

James Clark <james.clark@linaro.org> writes:

> On 04/05/2026 10:17 pm, Colton Lewis wrote:
>> For PMUv3, the register field MDCR_EL2.HPMN partitiones the PMU
>> counters into two ranges where counters 0..HPMN-1 are accessible by
>> EL1 and, if allowed, EL0 while counters HPMN..N are only accessible by
>> EL2.

>> Create a module parameter reserved_host_counters to reserve a number
>> of counters for the host. Counters not reserved for the host may be
>> used by a guest VM when the PMU is partitioned.

>> Add the function armv8pmu_partition() to check the validity of the
>> reservation and record a partition has happened and the maximum
>> allowable value for HPMN.

>> Due to the difficulty this feature would create for the driver running
>> in nVHE mode, partitioning is only allowed in VHE mode. In order to
>> support a partitioning on nVHE we'd need to explicitly disable guest
>> counters on every exit and reset HPMN to place all counters in the
>> first range.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> ---
>>    arch/arm/include/asm/arm_pmuv3.h   |  4 ++
>>    arch/arm64/include/asm/arm_pmuv3.h |  5 ++
>>    arch/arm64/kvm/Makefile            |  2 +-
>>    arch/arm64/kvm/pmu-direct.c        | 22 +++++++++
>>    drivers/perf/arm_pmuv3.c           | 77 ++++++++++++++++++++++++++++--
>>    include/kvm/arm_pmu.h              |  8 ++++
>>    include/linux/perf/arm_pmu.h       |  2 +
>>    7 files changed, 115 insertions(+), 5 deletions(-)
>>    create mode 100644 arch/arm64/kvm/pmu-direct.c

>> diff --git a/arch/arm/include/asm/arm_pmuv3.h  
>> b/arch/arm/include/asm/arm_pmuv3.h
>> index 2ec0e5e83fc98..154503f054886 100644
>> --- a/arch/arm/include/asm/arm_pmuv3.h
>> +++ b/arch/arm/include/asm/arm_pmuv3.h
>> @@ -221,6 +221,10 @@ static inline bool kvm_pmu_counter_deferred(struct  
>> perf_event_attr *attr)
>>    	return false;
>>    }

>> +static inline bool has_host_pmu_partition_support(void)
>> +{
>> +	return false;
>> +}
>>    static inline bool kvm_set_pmuserenr(u64 val)
>>    {
>>    	return false;
>> diff --git a/arch/arm64/include/asm/arm_pmuv3.h  
>> b/arch/arm64/include/asm/arm_pmuv3.h
>> index cf2b2212e00a2..27c4d6d47da31 100644
>> --- a/arch/arm64/include/asm/arm_pmuv3.h
>> +++ b/arch/arm64/include/asm/arm_pmuv3.h
>> @@ -171,6 +171,11 @@ static inline bool pmuv3_implemented(int pmuver)
>>    		 pmuver == ID_AA64DFR0_EL1_PMUVer_NI);
>>    }

>> +static inline bool is_pmuv3p1(int pmuver)
>> +{
>> +	return pmuver >= ID_AA64DFR0_EL1_PMUVer_V3P1;
>> +}
>> +
>>    static inline bool is_pmuv3p4(int pmuver)
>>    {
>>    	return pmuver >= ID_AA64DFR0_EL1_PMUVer_V3P4;
>> diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
>> index 3ebc0570345cc..baf0f296c0e53 100644
>> --- a/arch/arm64/kvm/Makefile
>> +++ b/arch/arm64/kvm/Makefile
>> @@ -26,7 +26,7 @@ kvm-y += arm.o mmu.o mmio.o psci.o hypercalls.o  
>> pvtime.o \
>>    	 vgic/vgic-its.o vgic/vgic-debug.o vgic/vgic-v3-nested.o \
>>    	 vgic/vgic-v5.o

>> -kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu.o
>> +kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu-direct.o pmu.o
>>    kvm-$(CONFIG_ARM64_PTR_AUTH)  += pauth.o
>>    kvm-$(CONFIG_PTDUMP_STAGE2_DEBUGFS) += ptdump.o

>> diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
>> new file mode 100644
>> index 0000000000000..74e40e4915416
>> --- /dev/null
>> +++ b/arch/arm64/kvm/pmu-direct.c
>> @@ -0,0 +1,22 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2025 Google LLC
>> + * Author: Colton Lewis <coltonlewis@google.com>
>> + */
>> +
>> +#include <linux/kvm_host.h>
>> +
>> +#include <asm/arm_pmuv3.h>
>> +
>> +/**
>> + * has_host_pmu_partition_support() - Determine if partitioning is  
>> possible
>> + *
>> + * Partitioning is only supported in VHE mode with PMUv3
>> + *
>> + * Return: True if partitioning is possible, false otherwise
>> + */
>> +bool has_host_pmu_partition_support(void)
>> +{
>> +	return has_vhe() &&
>> +		system_supports_pmuv3();
>> +}
>> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
>> index 7ff3139dda893..6e447227d801f 100644
>> --- a/drivers/perf/arm_pmuv3.c
>> +++ b/drivers/perf/arm_pmuv3.c
>> @@ -42,6 +42,13 @@
>>    #define ARMV8_THUNDER_PERFCTR_L1I_CACHE_PREF_ACCESS		0xEC
>>    #define ARMV8_THUNDER_PERFCTR_L1I_CACHE_PREF_MISS		0xED

>> +static int reserved_host_counters __read_mostly = -1;
>> +bool armv8pmu_is_partitioned;
>> +
>> +module_param(reserved_host_counters, int, 0);
>> +MODULE_PARM_DESC(reserved_host_counters,
>> +		 "PMU Partition: -1 = No partition; +N = Reserve N counters for the  
>> host");
>> +
>>    /*
>>     * ARMv8 Architectural defined events, not all of these may
>>     * be supported on any given implementation. Unsupported events will
>> @@ -532,6 +539,11 @@ static void armv8pmu_pmcr_write(u64 val)
>>    	write_pmcr(val);
>>    }

>> +static u64 armv8pmu_pmcr_n_read(void)
>> +{
>> +	return FIELD_GET(ARMV8_PMU_PMCR_N, armv8pmu_pmcr_read());
>> +}
>> +
>>    static int armv8pmu_has_overflowed(u64 pmovsr)
>>    {
>>    	return !!(pmovsr & ARMV8_PMU_CNT_MASK_ALL);
>> @@ -1312,6 +1324,54 @@ struct armv8pmu_probe_info {
>>    	bool present;
>>    };

>> +/**
>> + * armv8pmu_reservation_is_valid() - Determine if reservation is allowed
>> + * @host_counters: Number of host counters to reserve
>> + *
>> + * Determine if the number of host counters in the argument is an
>> + * allowed reservation, 0 to NR_COUNTERS inclusive.
>> + *
>> + * Return: True if reservation allowed, false otherwise
>> + */
>> +static bool armv8pmu_reservation_is_valid(int host_counters)
>> +{
>> +	return host_counters >= 0 &&
>> +		host_counters <= armv8pmu_pmcr_n_read();
>> +}
>> +
>> +/**
>> + * armv8pmu_partition() - Partition the PMU
>> + * @pmu: Pointer to pmu being partitioned
>> + * @host_counters: Number of host counters to reserve
>> + *
>> + * Partition the given PMU by taking a number of host counters to
>> + * reserve and, if it is a valid reservation, recording the
>> + * corresponding HPMN value in the max_guest_counters field of the PMU  
>> and
>> + * clearing the guest-reserved counters from the counter mask.
>> + *
>> + * Return: 0 on success, -ERROR otherwise
>> + */
>> +static int armv8pmu_partition(struct arm_pmu *pmu, int host_counters)
>> +{
>> +	u8 nr_counters;
>> +	u8 hpmn;
>> +
>> +	if (!armv8pmu_reservation_is_valid(host_counters)) {
>> +		pr_err("PMU partition reservation of %d host counters is not valid",  
>> host_counters);
>> +		return -EINVAL;
>> +	}
>> +
>> +	nr_counters = armv8pmu_pmcr_n_read();
>> +	hpmn = nr_counters - host_counters;
>> +
>> +	pmu->max_guest_counters = hpmn;
>> +	armv8pmu_is_partitioned = true;
>> +
>> +	pr_info("Partitioned PMU with %d host counters -> %u guest counters",  
>> host_counters, hpmn);
>> +
>> +	return 0;
>> +}
>> +
>>    static void __armv8pmu_probe_pmu(void *info)
>>    {
>>    	struct armv8pmu_probe_info *probe = info;
>> @@ -1326,17 +1386,26 @@ static void __armv8pmu_probe_pmu(void *info)

>>    	cpu_pmu->pmuver = pmuver;
>>    	probe->present = true;
>> +	cpu_pmu->max_guest_counters = -1;

>>    	/* Read the nb of CNTx counters supported from PMNC */
>> -	bitmap_set(cpu_pmu->cntr_mask,
>> -		   0, FIELD_GET(ARMV8_PMU_PMCR_N, armv8pmu_pmcr_read()));
>> +	bitmap_set(cpu_pmu->hw_cntr_mask, 0, armv8pmu_pmcr_n_read());

>>    	/* Add the CPU cycles counter */
>> -	set_bit(ARMV8_PMU_CYCLE_IDX, cpu_pmu->cntr_mask);
>> +	set_bit(ARMV8_PMU_CYCLE_IDX, cpu_pmu->hw_cntr_mask);

>>    	/* Add the CPU instructions counter */
>>    	if (pmuv3_has_icntr())
>> -		set_bit(ARMV8_PMU_INSTR_IDX, cpu_pmu->cntr_mask);
>> +		set_bit(ARMV8_PMU_INSTR_IDX, cpu_pmu->hw_cntr_mask);
>> +
>> +	bitmap_copy(cpu_pmu->cntr_mask, cpu_pmu->hw_cntr_mask,  
>> ARMPMU_MAX_HWEVENTS);
>> +
>> +	if (reserved_host_counters >= 0) {
>> +		if (has_host_pmu_partition_support())
>> +			armv8pmu_partition(cpu_pmu, reserved_host_counters);
>> +		else
>> +			pr_err("PMU partition is not supported");
>> +	}

>>    	pmceid[0] = pmceid_raw[0] = read_pmceid0();
>>    	pmceid[1] = pmceid_raw[1] = read_pmceid1();
>> diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
>> index 24a471cf59d56..95f404cdcb2df 100644
>> --- a/include/kvm/arm_pmu.h
>> +++ b/include/kvm/arm_pmu.h
>> @@ -47,7 +47,10 @@ struct arm_pmu_entry {
>>    	struct arm_pmu *arm_pmu;
>>    };

>> +extern bool armv8pmu_is_partitioned;
>> +
>>    bool kvm_supports_guest_pmuv3(void);
>> +bool has_host_pmu_partition_support(void);
>>    #define kvm_arm_pmu_irq_initialized(v)	((v)->arch.pmu.irq_num >=  
>> VGIC_NR_SGIS)
>>    u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu, u64 select_idx);
>>    void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu, u64 select_idx,  
>> u64 val);
>> @@ -117,6 +120,11 @@ static inline bool kvm_supports_guest_pmuv3(void)
>>    	return false;
>>    }

>> +static inline bool has_host_pmu_partition_support(void)
>> +{
>> +	return false;
>> +}
>> +
>>    #define kvm_arm_pmu_irq_initialized(v)	(false)
>>    static inline u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu,
>>    					    u64 select_idx)
>> diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
>> index 52b37f7bdbf9e..f7b000bb3eca8 100644
>> --- a/include/linux/perf/arm_pmu.h
>> +++ b/include/linux/perf/arm_pmu.h
>> @@ -109,6 +109,7 @@ struct arm_pmu {
>>    	 */
>>    	int		(*map_pmuv3_event)(unsigned int eventsel);
>>    	DECLARE_BITMAP(cntr_mask, ARMPMU_MAX_HWEVENTS);
>> +	DECLARE_BITMAP(hw_cntr_mask, ARMPMU_MAX_HWEVENTS);

> I think this needs a comment or a clearer name. Both cntr_mask and
> hw_cntr_mask are used in KVM and the PMU driver and it's not immediately
> obvious what the difference is.

I will clarify this. The goal was for hw_cntr_mask to be the unmodified
reference point to restore cntr_mask later.

