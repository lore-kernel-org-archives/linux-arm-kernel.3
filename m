Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8D0106ACF1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 22:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=SmkGviBwoE6ujafdNpWKA+3+jPQC/zPRTGdWWZWDMA0=; b=K9VIUSRBy9+ge3
	pqLZ1MUl/9Z9Z9a2QUvblNsOJmvKbJSa5gc6hbrk9MQf6zM/BJl0YjIU4kUEm0ZOpoVtQMVvcjGSn
	YgM4CuaBugTHGMPEHA1sA9eox4MqSemiOxTz4AHLi6lUwnRMdgqGrkk06at0HqNLKAbTYY975Qyw/
	2/M8SNxnK/YeXzUylLfuCoTeCk25ZPPf6xWBPyi1xd4cWx4cblVW4kzVtEfBBwZlmHVb+8l1GQekO
	OKSYdj6awTnr/FR4cShqpgyZfHLCkoza/+wufSAb8/rhaYDV+jBFLE1BlP4n+rmlfriXiWxubpPhh
	2cx8bCQfSK43Pn6cgnCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ofC-0000000Ff4P-27O5;
	Thu, 12 Mar 2026 22:37:54 +0000
Received: from mail-oa1-x4a.google.com ([2001:4860:4864:20::4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0of9-0000000Ff2c-1Gfp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 22:37:53 +0000
Received: by mail-oa1-x4a.google.com with SMTP id 586e51a60fabf-4171d16aad4so13520749fac.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 15:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773355069; x=1773959869; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SmkGviBwoE6ujafdNpWKA+3+jPQC/zPRTGdWWZWDMA0=;
        b=f67syYUbGc5B/MVtdPewiwNgYIix/FHjMAL8wxSfWh4VrB9FyOya/jLriYcuCi4Z+k
         0Z6It5iwglKXGqeQqvEArR5yRSkVJW584BPA1HgxnwH5tBCV1sTUJqt8Jh+lgUsEDE1l
         8V57/SUkVecJzZvkSL1W1EVxyw2eKtnYxFRuXfBVR1go1CBiWs7dRoqkTPO4oGJKmm74
         Ev2IsS6zxSSlnuQL/5wiSAy4PUUv6DTQINGztz5UjGeP2eC7Qjn12DXvSP8jEFfiFTRu
         CG1I7q3qfKkpbVmIwdZXqw14ZjsQUulyqOqG1zuBSMDIFipdZaUBW8SsrOFKI5Wij9mU
         YK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773355069; x=1773959869;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SmkGviBwoE6ujafdNpWKA+3+jPQC/zPRTGdWWZWDMA0=;
        b=EnSAiSWXTChy1TP1Kv81lwH768f/5yWwT459OlTD/bidS5yyV7tC986i9NSrA1yw8b
         jR0t/6izVuzyCTarmTQkmiw2FJgDaQ/LVeC6L4ZXEFRpv+4ZIcbyt8iMyfNW9lhdXCXX
         VH+3qQUJS+hsILzTby++xhPbntsTmxDEQZa0lQtLqvNhBwiTFvoz8/D2z38k+/+cvWO4
         2brg5+83StgwxfU8/5vISMZ3C/fOOCDo4KVNag1AEXXJqtQgbpZ4sVP1cWZSnAuTNm+R
         R6yyrgRDLg666b32TahT4gsg3U8QKzOl2fnqK5uao8qryruMUSYmuXOaykJej68BZN2E
         UUyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnHWOKY7XTcjHVb6/RjNgPaGB8Ldl9tbaATNkRFJJ+pYx5dDUEznCQQOdnxnKP2L6abOsf0RaZGD7YP3qcchkR@lists.infradead.org
X-Gm-Message-State: AOJu0YzWqvRHn3uih/0wXSxltKLTYYnZ5/096YNVTcVtDVV5IxoZwm4z
	EYZHjfa4XK5Re6o0P0765E2kytlylO0Sko10boZdG7fe67Lf4u149RI17DSJsp+FT7TdADvYR7v
	sAQGR8kjut/8bk8mTqhbFiiXC7A==
X-Received: from ilmt3.prod.google.com ([2002:a05:6e02:103:b0:4f6:f377:166a])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:4df3:b0:677:48f4:3c66 with SMTP id 006d021491bc7-67bdaa927d6mr720368eaf.67.1773355068888;
 Thu, 12 Mar 2026 15:37:48 -0700 (PDT)
Date: Thu, 12 Mar 2026 22:37:47 +0000
In-Reply-To: <47592c2d-2b12-4d28-ae5d-9d2f68ec7186@linaro.org> (message from
 James Clark on Wed, 11 Mar 2026 11:59:31 +0000)
Mime-Version: 1.0
Message-ID: <gsnteclooero.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v6 04/19] perf: arm_pmuv3: Introduce method to partition
 the PMU
From: Colton Lewis <coltonlewis@google.com>
To: James Clark <james.clark@linaro.org>
Cc: kvm@vger.kernel.org, alexandru.elisei@arm.com, pbonzini@redhat.com, 
	corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_153752_021240_CF184F45 
X-CRM114-Status: GOOD (  33.46  )
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

> On 09/02/2026 10:13 pm, Colton Lewis wrote:
>> For PMUv3, the register field MDCR_EL2.HPMN partitiones the PMU
>> counters into two ranges where counters 0..HPMN-1 are accessible by
>> EL1 and, if allowed, EL0 while counters HPMN..N are only accessible by
>> EL2.

>> Create module parameter reserved_host_counters to reserve a number of
>> counters for the host. This number is set at boot because the perf
>> subsystem assumes the number of counters will not change after the PMU
>> is probed.

>> Introduce the function armv8pmu_partition() to modify the PMU driver's
>> cntr_mask of available counters to exclude the counters being reserved
>> for the guest and record reserved_guest_counters as the maximum
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
>>    drivers/perf/arm_pmuv3.c           | 78 +++++++++++++++++++++++++++++-
>>    include/kvm/arm_pmu.h              |  8 +++
>>    include/linux/perf/arm_pmu.h       |  1 +
>>    7 files changed, 117 insertions(+), 3 deletions(-)
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
>> index 8d3b832cd633a..798c93678e97c 100644
>> --- a/drivers/perf/arm_pmuv3.c
>> +++ b/drivers/perf/arm_pmuv3.c
>> @@ -42,6 +42,13 @@
>>    #define ARMV8_THUNDER_PERFCTR_L1I_CACHE_PREF_ACCESS		0xEC
>>    #define ARMV8_THUNDER_PERFCTR_L1I_CACHE_PREF_MISS		0xED

>> +static int reserved_host_counters __read_mostly = -1;
>> +int armv8pmu_max_guest_counters = -1;
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
>>    	return !!(pmovsr & ARMV8_PMU_OVERFLOWED_MASK);
>> @@ -1309,6 +1321,61 @@ struct armv8pmu_probe_info {
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

> Hi Colton,

> Couple of minor nits. But this error return value isn't used by the  
> caller.

Fair point. I don't think the caller can do anything with it, so I'll
make the function void (if it still exists in the same form with the
dynamic reservation approach)

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
>> +	armv8pmu_max_guest_counters = hpmn;

> And this could be more like 'bool armv8pmu_partitioned'. PMUs will have
> different numbers of counters so it's a bit misleading to have one
> global, and the actual value isn't used either.

I can do that.

>> +
>> +	bitmap_clear(pmu->cntr_mask, 0, hpmn);
>> +	bitmap_set(pmu->cntr_mask, hpmn, host_counters);
>> +	clear_bit(ARMV8_PMU_CYCLE_IDX, pmu->cntr_mask);
>> +
>> +	if (pmuv3_has_icntr())
>> +		clear_bit(ARMV8_PMU_INSTR_IDX, pmu->cntr_mask);
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
>> @@ -1323,10 +1390,10 @@ static void __armv8pmu_probe_pmu(void *info)

>>    	cpu_pmu->pmuver = pmuver;
>>    	probe->present = true;
>> +	cpu_pmu->max_guest_counters = -1;

>>    	/* Read the nb of CNTx counters supported from PMNC */
>> -	bitmap_set(cpu_pmu->cntr_mask,
>> -		   0, FIELD_GET(ARMV8_PMU_PMCR_N, armv8pmu_pmcr_read()));
>> +	bitmap_set(cpu_pmu->cntr_mask, 0, armv8pmu_pmcr_n_read());

>>    	/* Add the CPU cycles counter */
>>    	set_bit(ARMV8_PMU_CYCLE_IDX, cpu_pmu->cntr_mask);
>> @@ -1335,6 +1402,13 @@ static void __armv8pmu_probe_pmu(void *info)
>>    	if (pmuv3_has_icntr())
>>    		set_bit(ARMV8_PMU_INSTR_IDX, cpu_pmu->cntr_mask);

>> +	if (reserved_host_counters >= 0) {
>> +		if (has_host_pmu_partition_support())
>> +			armv8pmu_partition(cpu_pmu, reserved_host_counters);
>> +		else
>> +			pr_err("PMU partition is not supported");
>> +	}
>> +
>>    	pmceid[0] = pmceid_raw[0] = read_pmceid0();
>>    	pmceid[1] = pmceid_raw[1] = read_pmceid1();

>> diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
>> index 24a471cf59d56..e7172db1e897d 100644
>> --- a/include/kvm/arm_pmu.h
>> +++ b/include/kvm/arm_pmu.h
>> @@ -47,7 +47,10 @@ struct arm_pmu_entry {
>>    	struct arm_pmu *arm_pmu;
>>    };

>> +extern int armv8pmu_max_guest_counters;
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
>> index 52b37f7bdbf9e..1bee8c6eba46b 100644
>> --- a/include/linux/perf/arm_pmu.h
>> +++ b/include/linux/perf/arm_pmu.h
>> @@ -129,6 +129,7 @@ struct arm_pmu {

>>    	/* Only to be used by ACPI probing code */
>>    	unsigned long acpi_cpuid;
>> +	int		max_guest_counters;
>>    };

>>    #define to_arm_pmu(p) (container_of(p, struct arm_pmu, pmu))

