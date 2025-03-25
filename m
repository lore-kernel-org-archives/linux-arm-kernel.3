Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC98C36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 19:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=nH4P9eJG9ixX5QbX8zMqKoULuBPy5l5wVy3PBOk0b0g=; b=VjJueU/sFmUuGz
	gdSfDpsX4ToMdFd2d05JJVw94Q1WMYYK0xfKtBlMgyMHN5AYuKGVXO0yYuHpwWsEfmyjCMoi2lg2v
	GzfXd+akjM98Ket0V3eUwgpeGIIf21YI8nd7mgkG0JubUbdCUCCyg4sYe9dp1EQpMfD6g/QujzXFK
	QAz3KoQ2hjSgJM1RHWBiybaEoAnZ7zPZAnoULxxR4UXkO1vMObsTT+NjVy2XmvPRDjVsbSkjgy+ng
	0WZjq2s9+o/y7bLn7xFO+AxlK24ElSDNKdAgswv97jRC+TMvDsY+/peiGYwFTsavzVPQkZYR94cIp
	Bzt4xrz3dfiy/v5JxnSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx9j8-00000006psf-06l6;
	Tue, 25 Mar 2025 19:14:18 +0000
Received: from mail-il1-x14a.google.com ([2607:f8b0:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx9OC-00000006m1v-3FqT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 18:52:41 +0000
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-3d438be189bso59665065ab.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 11:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742928759; x=1743533559; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nH4P9eJG9ixX5QbX8zMqKoULuBPy5l5wVy3PBOk0b0g=;
        b=yByRv4MTpjihe2gDYnqOfCjwUMFPooz3sqMJe/92oqJgJmfn40NXhNDQxYU2MecVfc
         VivzQW3jOxTP67X/ZkqV0EOTicn1TgqruTAQd48YG3W5+POwzSVC9+9i0AWfE9sGp6sy
         DgHW17xdoMvD2g8z0yXAr5VEEgute6ZCnmwtSo+rsnqd/KKL18djpey4igLZVuPBQtu3
         V1Van/5VmbHrj0hbzvkwxlWf49Nuh73Jyxe0N+4i/+jsxa3UnGrmTRHjBtOFo6J/f/3q
         HqVRGX4U9zelcGQhVzHY4dBetZTiWAJy46nfAToHjAwcedXsblFZos6t+Pox/hj9S54k
         dazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742928759; x=1743533559;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nH4P9eJG9ixX5QbX8zMqKoULuBPy5l5wVy3PBOk0b0g=;
        b=vMhiNq29vY7eaBXKTSd/Ll+HScj8sksZsDMJCs1Um6nC01ZKDQKlXbXrlfknS629+4
         Q1w41yrohJaBRyWMHEmI2yHrf0YjoJcHC7ZjX6f1eqGHK5iovqV8IDbZ+ak9eICE0wpS
         FZXz+8Hr/nDObHDSLthnVe597H8wTGbPknaxB1VHMdXbfZBSwxB33TQNgbKIgn0tgMFt
         Exr5AMs0NzRjcSkQO3raxs4WvkCGfADXdqjLKggMWGrM2qTpEadh691KPO9vZ67+eC78
         XenWz7UiDfnRmjp2GoJP1Pez4qTfqT8ujVBQh/oMEPylOvJym3nKwe4mTUi07PJzUDdQ
         b1sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHFRgElnSzMhPd7kCek3CkHupVgtKVdz3b/LbyrTLU8LldpHBD1D8pRXlnB2r7NgFbFo6hkG3hy5FyeoEd5M+3@lists.infradead.org
X-Gm-Message-State: AOJu0YxdRCCP+puPzdS0Pn9MOV/TUrUTKWsW5rzorlWr6ZpaYd/lx9Uo
	VxwT4VQy0IOBvthoGnhO2HGt9w34tq1t6W/r3Y7GE5XsWRZreLTYgjccihwHtEzdsVHc3FsRQL4
	UR92RnzsxTbe1aaGfA0W5JQ==
X-Google-Smtp-Source: AGHT+IFihTn29mkx1GCcsdzB1BWaATm719zstIXb77dxFcanWyTVCgHo5XFcuAcWL7Ck6Mq9GEViCbd4LSLj7nsAJQ==
X-Received: from ilbcp4.prod.google.com ([2002:a05:6e02:3984:b0:3d2:ad2f:c829])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:3d86:b0:3d0:443d:a5c3 with SMTP id e9e14a558f8ab-3d5960c1226mr193021365ab.3.1742928759319;
 Tue, 25 Mar 2025 11:52:39 -0700 (PDT)
Date: Tue, 25 Mar 2025 18:52:38 +0000
In-Reply-To: <8450a182-5c62-4546-ab91-5d39eb252254@linaro.org> (message from
 James Clark on Mon, 24 Mar 2025 14:52:26 +0000)
Mime-Version: 1.0
Message-ID: <gsnty0wtlz7t.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [RFC PATCH v3 7/8] perf: arm_pmuv3: Keep out of guest counter partition
From: Colton Lewis <coltonlewis@google.com>
To: James Clark <james.clark@linaro.org>
Cc: kvm@vger.kernel.org, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com, 
	pbonzini@redhat.com, shuah@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_115240_815499_44CB466B 
X-CRM114-Status: GOOD (  24.11  )
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

> On 13/02/2025 6:03 pm, Colton Lewis wrote:
>> If the PMU is partitioned, keep the driver out of the guest counter
>> partition and only use the host counter partition. Partitioning is
>> defined by the MDCR_EL2.HPMN register field and saved in
>> cpu_pmu->hpmn. The range 0..HPMN-1 is accessible by EL1 and EL0 while
>> HPMN..PMCR.N is reserved for EL2.

>> Define some macros that take HPMN as an argument and construct
>> mutually exclusive bitmaps for testing which partition a particular
>> counter is in. Note that despite their different position in the
>> bitmap, the cycle and instruction counters are always in the guest
>> partition.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> ---
>>    arch/arm/include/asm/arm_pmuv3.h |  2 +
>>    arch/arm64/include/asm/kvm_pmu.h |  5 +++
>>    arch/arm64/kvm/pmu-part.c        | 16 +++++++
>>    drivers/perf/arm_pmuv3.c         | 73 +++++++++++++++++++++++++++-----
>>    include/linux/perf/arm_pmuv3.h   |  8 ++++
>>    5 files changed, 94 insertions(+), 10 deletions(-)

>> diff --git a/arch/arm/include/asm/arm_pmuv3.h  
>> b/arch/arm/include/asm/arm_pmuv3.h
>> index 2ec0e5e83fc9..dadd4ddf51af 100644
>> --- a/arch/arm/include/asm/arm_pmuv3.h
>> +++ b/arch/arm/include/asm/arm_pmuv3.h
>> @@ -227,6 +227,8 @@ static inline bool kvm_set_pmuserenr(u64 val)
>>    }

>>    static inline void kvm_vcpu_pmu_resync_el0(void) {}
>> +static inline void kvm_pmu_host_counters_enable(void) {}
>> +static inline void kvm_pmu_host_counters_disable(void) {}

>>    /* PMU Version in DFR Register */
>>    #define ARMV8_PMU_DFR_VER_NI        0
>> diff --git a/arch/arm64/include/asm/kvm_pmu.h  
>> b/arch/arm64/include/asm/kvm_pmu.h
>> index 174b7f376d95..8f25754fde47 100644
>> --- a/arch/arm64/include/asm/kvm_pmu.h
>> +++ b/arch/arm64/include/asm/kvm_pmu.h
>> @@ -25,6 +25,8 @@ void kvm_host_pmu_init(struct arm_pmu *pmu);
>>    u8 kvm_pmu_get_reserved_counters(void);
>>    u8 kvm_pmu_hpmn(u8 nr_counters);
>>    void kvm_pmu_partition(struct arm_pmu *pmu);
>> +void kvm_pmu_host_counters_enable(void);
>> +void kvm_pmu_host_counters_disable(void);

>>    #else

>> @@ -37,6 +39,9 @@ static inline bool kvm_set_pmuserenr(u64 val)
>>    static inline void kvm_vcpu_pmu_resync_el0(void) {}
>>    static inline void kvm_host_pmu_init(struct arm_pmu *pmu) {}

>> +static inline void kvm_pmu_host_counters_enable(void) {}
>> +static inline void kvm_pmu_host_counters_disable(void) {}
>> +
>>    #endif

>>    #endif
>> diff --git a/arch/arm64/kvm/pmu-part.c b/arch/arm64/kvm/pmu-part.c
>> index e74fecc67e37..51da65c678f9 100644
>> --- a/arch/arm64/kvm/pmu-part.c
>> +++ b/arch/arm64/kvm/pmu-part.c
>> @@ -45,3 +45,19 @@ void kvm_pmu_partition(struct arm_pmu *pmu)
>>    		pmu->partitioned = false;
>>    	}
>>    }
>> +
>> +void kvm_pmu_host_counters_enable(void)
>> +{
>> +	u64 mdcr = read_sysreg(mdcr_el2);
>> +
>> +	mdcr |= MDCR_EL2_HPME;
>> +	write_sysreg(mdcr, mdcr_el2);
>> +}
>> +
>> +void kvm_pmu_host_counters_disable(void)
>> +{
>> +	u64 mdcr = read_sysreg(mdcr_el2);
>> +
>> +	mdcr &= ~MDCR_EL2_HPME;
>> +	write_sysreg(mdcr, mdcr_el2);
>> +}
>> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
>> index 0e360feb3432..442dcff56d5b 100644
>> --- a/drivers/perf/arm_pmuv3.c
>> +++ b/drivers/perf/arm_pmuv3.c
>> @@ -730,15 +730,19 @@ static void armv8pmu_disable_event_irq(struct  
>> perf_event *event)
>>    	armv8pmu_disable_intens(BIT(event->hw.idx));
>>    }

>> -static u64 armv8pmu_getreset_flags(void)
>> +static u64 armv8pmu_getreset_flags(struct arm_pmu *cpu_pmu)
>>    {
>>    	u64 value;

>>    	/* Read */
>>    	value = read_pmovsclr();

>> +	if (cpu_pmu->partitioned)
>> +		value &= ARMV8_PMU_HOST_CNT_PART(cpu_pmu->hpmn);
>> +	else
>> +		value &= ARMV8_PMU_OVERFLOWED_MASK;
>> +
>>    	/* Write to clear flags */
>> -	value &= ARMV8_PMU_OVERFLOWED_MASK;
>>    	write_pmovsclr(value);

>>    	return value;
>> @@ -765,6 +769,18 @@ static void armv8pmu_disable_user_access(void)
>>    	update_pmuserenr(0);
>>    }

>> +static bool armv8pmu_is_guest_part(struct arm_pmu *cpu_pmu, u8 idx)
>> +{
>> +	return cpu_pmu->partitioned &&
>> +		(BIT(idx) & ARMV8_PMU_GUEST_CNT_PART(cpu_pmu->hpmn));
>> +}
>> +
>> +static bool armv8pmu_is_host_part(struct arm_pmu *cpu_pmu, u8 idx)
>> +{
>> +	return !cpu_pmu->partitioned ||
>> +		(BIT(idx) & ARMV8_PMU_HOST_CNT_PART(cpu_pmu->hpmn));
>> +}
>> +
>>    static void armv8pmu_enable_user_access(struct arm_pmu *cpu_pmu)
>>    {
>>    	int i;
>> @@ -773,6 +789,8 @@ static void armv8pmu_enable_user_access(struct  
>> arm_pmu *cpu_pmu)
>>    	if (is_pmuv3p9(cpu_pmu->pmuver)) {
>>    		u64 mask = 0;
>>    		for_each_set_bit(i, cpuc->used_mask, ARMPMU_MAX_HWEVENTS) {
>> +			if (armv8pmu_is_guest_part(cpu_pmu, i))
>> +				continue;

> Hi Colton,

> Is it possible to keep the guest bits out of used_mask and cntr_mask in
> the first place? Then all these loops don't need to have the logic for
> is_guest_part()/is_host_part().

It should be possible.

> That leads me to wonder about updating the printout:

>    hw perfevents: enabled with armv8_pmuv3_0 PMU driver, 7 (0,8000003f)
>      counters available

> It might be a bit confusing if that doesn't quite reflect reality anymore.

Good point.

