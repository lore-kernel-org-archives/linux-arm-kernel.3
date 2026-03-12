Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D34106ACF1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 22:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=BOQPFUygErdEhR+VhLQ8d5SqWsIL2z8SybdB1Lqp5qg=; b=UEOiKj46ya44A+
	Fb1w2ttqUH0u8zuzhzzu8d09TJ2B6W/Ea99taAeP/IwtLMN840kZS2rAIHBfD1m25bhvEOq/Y6FDA
	/Oh7T9zv0HPNHIXB9SNkRoEz66uf1h+liPh5kYeZPLOPvo19gAq20wGl9ID/z55H900GI2TAqz9dY
	ccQc0QAAhYdnGvISldw1SCvTn9RBLPk2ydqRBzGlY5BNa5RIkS/g5imMLHhUcbsrUmnjs6Sm3P9Hg
	VVSrZ4Xa8wP0je3+x3Rism0TCUKhQcdLRSOqJD+jhsSOt1K/FV5wOPZp4mNuT9gyKBXc+3QZENG54
	l3c5kmGcVIqUZ7uZA8Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0of3-0000000Ff0x-2oCb;
	Thu, 12 Mar 2026 22:37:45 +0000
Received: from mail-oo1-xc49.google.com ([2607:f8b0:4864:20::c49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0of0-0000000Ff0H-434Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 22:37:44 +0000
Received: by mail-oo1-xc49.google.com with SMTP id 006d021491bc7-67bca522419so6589931eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 15:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773355061; x=1773959861; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BOQPFUygErdEhR+VhLQ8d5SqWsIL2z8SybdB1Lqp5qg=;
        b=kL29DiBS321wgcrvoovSbdQhtsaO9beV7XMydbq3Sk0IyIHyJMbtJX0b6ut7fxNSWx
         E+Y5a9NToVRFbpyD3wj1lj/tjmU1AjVqySuXBka1yIUIO4TsK0Alq/jcvx3TcmgtI9bV
         3Q4ATP4wus2VPtqHNrrmiIoYToRa3FyTNJnNVKlAl5Q9SrR3BIP+nZYARn+fQLI698Jq
         88NeyubUtKS28CZnHWz4bBOxeuhktIpfgdnlW7lOVZvak3sxW2IEsHe52AQKd3E5h+hq
         MD6wahOxfs1o7JOuqHUNqHaJ9NXdQ0baf/rWH0W3Ib/37qcDkrnFBHwvE+FiVs4KbcrC
         m5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773355061; x=1773959861;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BOQPFUygErdEhR+VhLQ8d5SqWsIL2z8SybdB1Lqp5qg=;
        b=GfEuBvpIBrV9N1GTquaDmHxfPk0qt9Skp2aoqEBo3+CM04haSwda+13PswuM3EI/K2
         BmrLqxJsFXkwl/N0hECUgt39IG+uBC6/m7noQ8qUJW9LTJu9bmHY1JEXkpHg2E62gSb0
         +jbYCXLLgJyHh4vBCNwTAv5FAwS1s8/lWiDUBSY2gqACNrmkqKI7R+ZO6Na2aCSk+GV2
         qMI7G98NHCWFr1JaUmd2Ye1fgLQGiVj0bvmuD+mSBf2SjnN+fkpVx7Odlt4SryFnaDOp
         e9DXOEer2639dfaMvhEC8QEf/H8Jbv7j8Jd+HcpQjExfU+8/EG4NveZSWPZFTj/mYdzF
         +OvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhmm2uILtk/nuz/z69MwyUE5LghnENKKvNu+Yblja29lGRyHxI4zwAmNIpRSmsoSsrg+wcmMftxSkIvAX8jsnE@lists.infradead.org
X-Gm-Message-State: AOJu0YxgFr0CMUDqEykcRapQ3Ptimj850GUWoMCEjHq+C1tWbphwLz/Z
	mwbewA5BMk4ViaUEJDg2YY5UXO1Yumt9WEbPwMqQMDcdoU9IVz5Kc+IvIG7kFum0ccezmBbGmkD
	XG+127jE962yWz6lAwVLjqZI+aw==
X-Received: from iobif40.prod.google.com ([2002:a05:6602:1e28:b0:960:f5a:2cea])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:228b:b0:662:f8bd:fc9 with SMTP id 006d021491bc7-67bdaa2ddeamr684027eaf.41.1773355061163;
 Thu, 12 Mar 2026 15:37:41 -0700 (PDT)
Date: Thu, 12 Mar 2026 22:37:40 +0000
In-Reply-To: <a75924dd-0fa7-4574-837c-1778366195a6@linaro.org> (message from
 James Clark on Wed, 11 Mar 2026 17:45:55 +0000)
Mime-Version: 1.0
Message-ID: <gsntfr64oerv.fsf@coltonlewis-kvm.c.googlers.com>
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
X-CRM114-CacheID: sfid-20260312_153743_022367_D8907212 
X-CRM114-Status: GOOD (  31.13  )
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
>> +
>> +	bitmap_clear(pmu->cntr_mask, 0, hpmn);
>> +	bitmap_set(pmu->cntr_mask, hpmn, host_counters);
>> +	clear_bit(ARMV8_PMU_CYCLE_IDX, pmu->cntr_mask);
>> +
>> +	if (pmuv3_has_icntr())
>> +		clear_bit(ARMV8_PMU_INSTR_IDX, pmu->cntr_mask);

> We take the fixed instruction counter away from the host here but then
> guest never gets it because AA64DFR1 is RAZ. Probably doesn't need to be
> a blocker to expose the instruction counter, but worth noting that using
> this feature results in losing a counter completely.

> There's a comment above kvm_pmu_guest_counter_mask() that suggests the
> instruction counter is available for guests, which is why I was looking
> here. I think "Compute the bitmask that selects the guest-reserved
> counters ... These are the counters in 0..HPMN and the cycle and
> instruction counters." shouldn't include "instruction counters".

Good point. Early iterations intended to expose the instruction counter
to guests but that was dropped. I will drop it here too.

