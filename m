Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985EE106286B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 11:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKwSqge0Bx3u+rCgVUQqBNe12brlVC96iC4+N0TtO+o=; b=n3pjHBkPdcDNSYdeSzWo6wXsTo
	SqYyOxeahESaPTtifbMBalZsxi+vw3aWd4C7p7fDpR0StV2eycmLRjF4+W9PVhMxMM9gxI/N0oCkx
	BYbVvzisu42RyyC/OTdiX2TC3IRUHdkuEdxoNhbRGDdIHn2WpEY9b1WgkBiCiz1xMh/JImbt9Aer9
	VrQdUvbacYMAmAhkp6tk7TMULiaQsCHxA5trzGWMulKDebykHqMFhGlZwkdlXmiaeZ1o/hotgO2Ok
	ALGyJomswuuAkL9OiN1Ta5ZRVEjLaqZ3M9FXYXcLF0itQEua4Fwr00f19AWwiZ/5beOP1BnU5pBFn
	JQ6lbI6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0IDz-0000000BWpi-0OfY;
	Wed, 11 Mar 2026 11:59:39 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0IDw-0000000BWpM-0y4m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 11:59:37 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6629fcc7460so3586682a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 04:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773230374; x=1773835174; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fKwSqge0Bx3u+rCgVUQqBNe12brlVC96iC4+N0TtO+o=;
        b=tMkRAGKpKzCSvvGYLHyHvozP8pfXChFP8bMoJindBcEQitM31WqugkepueVbi0oapC
         oZ3/zWm2to5UGRXysXzOxRsEnkWykD2WV7OBKgFQwjQ29zNngCm3cHVQ5BEsn9wsp+kd
         r/Lyz20mHnX3IFqVcfo/RoMrxsDI8pNAoJvD5Ksf/4R4na0WRelOISrcgGfasIphPjl+
         a8PGAdcxpA9RWaxIath/DCpQXlF47lY8sj+J07M6vLzOrNKZdwq86kKsikTIzLxJ/DSz
         fjoa8Z587VaLwUzfTCM/aEhUqkRy666TEEqtBISteneGCgVm/IbkdAY6HgraWwW6D3zq
         IpYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773230374; x=1773835174;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fKwSqge0Bx3u+rCgVUQqBNe12brlVC96iC4+N0TtO+o=;
        b=PGaEWT4KE03BRbAyYBGu1/69bDVY0fVPSB6xXOEK9w/UIj/LqFpEn3TnflIwmg6yp9
         Jxg31uS3ursDEXJe9jB5sLS0soGuStfYxknfjqeRP5y7rrHwYgEhZ1sijTgKFCJfD6ZX
         2uilDPSUYvoaJlfJ6HzPv4XDPj2sdJiTpM3XDE2u20xU0Y5USqVMVW1Jes2IPe7dtoDE
         2fR5koViIlNO4eVYw3IqD8NViP582/fd4er6smIWpvg1xNGs31Z+0R6jhQrESmWFZ0ME
         RFz28wvWGd4WzW6iWrC9Y6zpLSyV2e7fPR8zucBh7vVc64fPzbpEaqUhHxyzYe6KIcVX
         HrYA==
X-Forwarded-Encrypted: i=1; AJvYcCUrKtPtQ8oCo2LVQbYHD0pc624ZQ197VVZLtrA2OIDEt4fQq5tsc9h2MvzqtK2MGJpEs4vwjWELf8jWy8EdhQzY@lists.infradead.org
X-Gm-Message-State: AOJu0YzOtOoth2bJzYSqAS5P6XSfGK5Fk9At9Nq6nj+Lv9nKsbvOi+Tk
	m9P+3lSHNn9jtHJlhGvLTJemjj/eXwciWRgahkPw1w9D5+r7kgNDyDX8R3aVcJMBzGI=
X-Gm-Gg: ATEYQzz5JL0+qhzBFke/uSMlL1ubDDTAUWoj7TUQODLzDw03WjIaaqT/SPzj5k5DTn5
	73rwxEdxZoZA+a2hWOmEcmFKXjlCdQUGqfSZDP3psl2qHGQV3B4XXKHjqXYP3V9ABPp6Rd5BHtM
	VarP9TYoucZYimwQJi0MbK3NpiANcnR7evR52cRak4pbUuORjloq1pZYnkDFnlRcqbdK9SRsbE7
	cQNAlzAUFYeCGTQw/Hs2TfxjzhP3yN4ovjrEvZ8P1YH3c+QLuJxh94gf3+P0Y1ci7oaCE5x5oCv
	p1i12i4mUDfuSa3b36Eb1Y2jkGD+gGpjfYjwP9pNuF5DYpnano2uLOW4KyKjkCzdjUJhup50EVw
	Ra8rk/dg7ilpsL72wlD03npAVrr4Sd7DTxzqnrO1EGYQFNEY846YstqtBd1iFty7ywv5LwsrVkU
	o7Po4L+Fv9wB5orPGnicTgwIxONJxO
X-Received: by 2002:a05:6402:5206:b0:65f:aecc:4f24 with SMTP id 4fb4d7f45d1cf-66319ddcba6mr1131945a12.24.1773230373721;
        Wed, 11 Mar 2026 04:59:33 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66315320df2sm484743a12.24.2026.03.11.04.59.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 04:59:33 -0700 (PDT)
Message-ID: <47592c2d-2b12-4d28-ae5d-9d2f68ec7186@linaro.org>
Date: Wed, 11 Mar 2026 11:59:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: James Clark <james.clark@linaro.org>
Subject: Re: [PATCH v6 04/19] perf: arm_pmuv3: Introduce method to partition
 the PMU
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
 <20260209221414.2169465-5-coltonlewis@google.com>
Content-Language: en-US
In-Reply-To: <20260209221414.2169465-5-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_045936_351457_56552BE9 
X-CRM114-Status: GOOD (  40.23  )
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



On 09/02/2026 10:13 pm, Colton Lewis wrote:
> For PMUv3, the register field MDCR_EL2.HPMN partitiones the PMU
> counters into two ranges where counters 0..HPMN-1 are accessible by
> EL1 and, if allowed, EL0 while counters HPMN..N are only accessible by
> EL2.
> 
> Create module parameter reserved_host_counters to reserve a number of
> counters for the host. This number is set at boot because the perf
> subsystem assumes the number of counters will not change after the PMU
> is probed.
> 
> Introduce the function armv8pmu_partition() to modify the PMU driver's
> cntr_mask of available counters to exclude the counters being reserved
> for the guest and record reserved_guest_counters as the maximum
> allowable value for HPMN.
> 
> Due to the difficulty this feature would create for the driver running
> in nVHE mode, partitioning is only allowed in VHE mode. In order to
> support a partitioning on nVHE we'd need to explicitly disable guest
> counters on every exit and reset HPMN to place all counters in the
> first range.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>   arch/arm/include/asm/arm_pmuv3.h   |  4 ++
>   arch/arm64/include/asm/arm_pmuv3.h |  5 ++
>   arch/arm64/kvm/Makefile            |  2 +-
>   arch/arm64/kvm/pmu-direct.c        | 22 +++++++++
>   drivers/perf/arm_pmuv3.c           | 78 +++++++++++++++++++++++++++++-
>   include/kvm/arm_pmu.h              |  8 +++
>   include/linux/perf/arm_pmu.h       |  1 +
>   7 files changed, 117 insertions(+), 3 deletions(-)
>   create mode 100644 arch/arm64/kvm/pmu-direct.c
> 
> diff --git a/arch/arm/include/asm/arm_pmuv3.h b/arch/arm/include/asm/arm_pmuv3.h
> index 2ec0e5e83fc98..154503f054886 100644
> --- a/arch/arm/include/asm/arm_pmuv3.h
> +++ b/arch/arm/include/asm/arm_pmuv3.h
> @@ -221,6 +221,10 @@ static inline bool kvm_pmu_counter_deferred(struct perf_event_attr *attr)
>   	return false;
>   }
>   
> +static inline bool has_host_pmu_partition_support(void)
> +{
> +	return false;
> +}
>   static inline bool kvm_set_pmuserenr(u64 val)
>   {
>   	return false;
> diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
> index cf2b2212e00a2..27c4d6d47da31 100644
> --- a/arch/arm64/include/asm/arm_pmuv3.h
> +++ b/arch/arm64/include/asm/arm_pmuv3.h
> @@ -171,6 +171,11 @@ static inline bool pmuv3_implemented(int pmuver)
>   		 pmuver == ID_AA64DFR0_EL1_PMUVer_NI);
>   }
>   
> +static inline bool is_pmuv3p1(int pmuver)
> +{
> +	return pmuver >= ID_AA64DFR0_EL1_PMUVer_V3P1;
> +}
> +
>   static inline bool is_pmuv3p4(int pmuver)
>   {
>   	return pmuver >= ID_AA64DFR0_EL1_PMUVer_V3P4;
> diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
> index 3ebc0570345cc..baf0f296c0e53 100644
> --- a/arch/arm64/kvm/Makefile
> +++ b/arch/arm64/kvm/Makefile
> @@ -26,7 +26,7 @@ kvm-y += arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
>   	 vgic/vgic-its.o vgic/vgic-debug.o vgic/vgic-v3-nested.o \
>   	 vgic/vgic-v5.o
>   
> -kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu.o
> +kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu-direct.o pmu.o
>   kvm-$(CONFIG_ARM64_PTR_AUTH)  += pauth.o
>   kvm-$(CONFIG_PTDUMP_STAGE2_DEBUGFS) += ptdump.o
>   
> diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
> new file mode 100644
> index 0000000000000..74e40e4915416
> --- /dev/null
> +++ b/arch/arm64/kvm/pmu-direct.c
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2025 Google LLC
> + * Author: Colton Lewis <coltonlewis@google.com>
> + */
> +
> +#include <linux/kvm_host.h>
> +
> +#include <asm/arm_pmuv3.h>
> +
> +/**
> + * has_host_pmu_partition_support() - Determine if partitioning is possible
> + *
> + * Partitioning is only supported in VHE mode with PMUv3
> + *
> + * Return: True if partitioning is possible, false otherwise
> + */
> +bool has_host_pmu_partition_support(void)
> +{
> +	return has_vhe() &&
> +		system_supports_pmuv3();
> +}
> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
> index 8d3b832cd633a..798c93678e97c 100644
> --- a/drivers/perf/arm_pmuv3.c
> +++ b/drivers/perf/arm_pmuv3.c
> @@ -42,6 +42,13 @@
>   #define ARMV8_THUNDER_PERFCTR_L1I_CACHE_PREF_ACCESS		0xEC
>   #define ARMV8_THUNDER_PERFCTR_L1I_CACHE_PREF_MISS		0xED
>   
> +static int reserved_host_counters __read_mostly = -1;
> +int armv8pmu_max_guest_counters = -1;
> +
> +module_param(reserved_host_counters, int, 0);
> +MODULE_PARM_DESC(reserved_host_counters,
> +		 "PMU Partition: -1 = No partition; +N = Reserve N counters for the host");
> +
>   /*
>    * ARMv8 Architectural defined events, not all of these may
>    * be supported on any given implementation. Unsupported events will
> @@ -532,6 +539,11 @@ static void armv8pmu_pmcr_write(u64 val)
>   	write_pmcr(val);
>   }
>   
> +static u64 armv8pmu_pmcr_n_read(void)
> +{
> +	return FIELD_GET(ARMV8_PMU_PMCR_N, armv8pmu_pmcr_read());
> +}
> +
>   static int armv8pmu_has_overflowed(u64 pmovsr)
>   {
>   	return !!(pmovsr & ARMV8_PMU_OVERFLOWED_MASK);
> @@ -1309,6 +1321,61 @@ struct armv8pmu_probe_info {
>   	bool present;
>   };
>   
> +/**
> + * armv8pmu_reservation_is_valid() - Determine if reservation is allowed
> + * @host_counters: Number of host counters to reserve
> + *
> + * Determine if the number of host counters in the argument is an
> + * allowed reservation, 0 to NR_COUNTERS inclusive.
> + *
> + * Return: True if reservation allowed, false otherwise
> + */
> +static bool armv8pmu_reservation_is_valid(int host_counters)
> +{
> +	return host_counters >= 0 &&
> +		host_counters <= armv8pmu_pmcr_n_read();
> +}
> +
> +/**
> + * armv8pmu_partition() - Partition the PMU
> + * @pmu: Pointer to pmu being partitioned
> + * @host_counters: Number of host counters to reserve
> + *
> + * Partition the given PMU by taking a number of host counters to
> + * reserve and, if it is a valid reservation, recording the
> + * corresponding HPMN value in the max_guest_counters field of the PMU and
> + * clearing the guest-reserved counters from the counter mask.
> + *
> + * Return: 0 on success, -ERROR otherwise

Hi Colton,

Couple of minor nits. But this error return value isn't used by the caller.

> + */
> +static int armv8pmu_partition(struct arm_pmu *pmu, int host_counters)
> +{
> +	u8 nr_counters;
> +	u8 hpmn;
> +
> +	if (!armv8pmu_reservation_is_valid(host_counters)) {
> +		pr_err("PMU partition reservation of %d host counters is not valid", host_counters);
> +		return -EINVAL;
> +	}
> +
> +	nr_counters = armv8pmu_pmcr_n_read();
> +	hpmn = nr_counters - host_counters;
> +
> +	pmu->max_guest_counters = hpmn;
> +	armv8pmu_max_guest_counters = hpmn;

And this could be more like 'bool armv8pmu_partitioned'. PMUs will have 
different numbers of counters so it's a bit misleading to have one 
global, and the actual value isn't used either.

> +
> +	bitmap_clear(pmu->cntr_mask, 0, hpmn);
> +	bitmap_set(pmu->cntr_mask, hpmn, host_counters);
> +	clear_bit(ARMV8_PMU_CYCLE_IDX, pmu->cntr_mask);
> +
> +	if (pmuv3_has_icntr())
> +		clear_bit(ARMV8_PMU_INSTR_IDX, pmu->cntr_mask);
> +
> +	pr_info("Partitioned PMU with %d host counters -> %u guest counters", host_counters, hpmn);
> +
> +	return 0;
> +}
> +
>   static void __armv8pmu_probe_pmu(void *info)
>   {
>   	struct armv8pmu_probe_info *probe = info;
> @@ -1323,10 +1390,10 @@ static void __armv8pmu_probe_pmu(void *info)
>   
>   	cpu_pmu->pmuver = pmuver;
>   	probe->present = true;
> +	cpu_pmu->max_guest_counters = -1;
>   
>   	/* Read the nb of CNTx counters supported from PMNC */
> -	bitmap_set(cpu_pmu->cntr_mask,
> -		   0, FIELD_GET(ARMV8_PMU_PMCR_N, armv8pmu_pmcr_read()));
> +	bitmap_set(cpu_pmu->cntr_mask, 0, armv8pmu_pmcr_n_read());
>   
>   	/* Add the CPU cycles counter */
>   	set_bit(ARMV8_PMU_CYCLE_IDX, cpu_pmu->cntr_mask);
> @@ -1335,6 +1402,13 @@ static void __armv8pmu_probe_pmu(void *info)
>   	if (pmuv3_has_icntr())
>   		set_bit(ARMV8_PMU_INSTR_IDX, cpu_pmu->cntr_mask);
>   
> +	if (reserved_host_counters >= 0) {
> +		if (has_host_pmu_partition_support())
> +			armv8pmu_partition(cpu_pmu, reserved_host_counters);
> +		else
> +			pr_err("PMU partition is not supported");
> +	}
> +
>   	pmceid[0] = pmceid_raw[0] = read_pmceid0();
>   	pmceid[1] = pmceid_raw[1] = read_pmceid1();
>   
> diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
> index 24a471cf59d56..e7172db1e897d 100644
> --- a/include/kvm/arm_pmu.h
> +++ b/include/kvm/arm_pmu.h
> @@ -47,7 +47,10 @@ struct arm_pmu_entry {
>   	struct arm_pmu *arm_pmu;
>   };
>   
> +extern int armv8pmu_max_guest_counters;
> +
>   bool kvm_supports_guest_pmuv3(void);
> +bool has_host_pmu_partition_support(void);
>   #define kvm_arm_pmu_irq_initialized(v)	((v)->arch.pmu.irq_num >= VGIC_NR_SGIS)
>   u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu, u64 select_idx);
>   void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu, u64 select_idx, u64 val);
> @@ -117,6 +120,11 @@ static inline bool kvm_supports_guest_pmuv3(void)
>   	return false;
>   }
>   
> +static inline bool has_host_pmu_partition_support(void)
> +{
> +	return false;
> +}
> +
>   #define kvm_arm_pmu_irq_initialized(v)	(false)
>   static inline u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu,
>   					    u64 select_idx)
> diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
> index 52b37f7bdbf9e..1bee8c6eba46b 100644
> --- a/include/linux/perf/arm_pmu.h
> +++ b/include/linux/perf/arm_pmu.h
> @@ -129,6 +129,7 @@ struct arm_pmu {
>   
>   	/* Only to be used by ACPI probing code */
>   	unsigned long acpi_cpuid;
> +	int		max_guest_counters;
>   };
>   
>   #define to_arm_pmu(p) (container_of(p, struct arm_pmu, pmu))


