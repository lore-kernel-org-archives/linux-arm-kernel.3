Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11ECA106ACF1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 22:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=IkDxS9fCpHHZ8XD7eD09vRf6IL+V4v6HCS03WBPRNsg=; b=17xwazUDG0ubZa
	bNyeCO3wkkyCG4oGswM7C1gLaTCjz5HDkrpuOUbjyLab+0j5E92pY3YfbKrdqV/fsa0X/Jtpc/9jo
	VMYwVViV9shL8SmsFugS8H9+FRCzY87F7hzM5n785aTc0o5whqJ89OshG/xv1rV57qXcz2xP4FD/e
	viL6RADVpaWtmUE6R38zhyeBPdM9TyBqVACOKySsFfJiFVyIHb79L5pXwbu8X/1k4X9aqXoXG+fOA
	hQPm5ZEemSTK+5uaHxEDrV8mXomcoL1VePmpYxw/A8twyOQVCuwBIArzayiE4GXeBZp9+lGo49Kr6
	F7Qz3yRD4Mos3sBALHvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ogP-0000000FfOu-3pcS;
	Thu, 12 Mar 2026 22:39:09 +0000
Received: from mail-oo1-xc49.google.com ([2607:f8b0:4864:20::c49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ogN-0000000FfNQ-0srh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 22:39:08 +0000
Received: by mail-oo1-xc49.google.com with SMTP id 006d021491bc7-67bb6081a0dso22541479eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 15:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773355146; x=1773959946; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IkDxS9fCpHHZ8XD7eD09vRf6IL+V4v6HCS03WBPRNsg=;
        b=PWbUNguPlcdW5InG3IuB04Kwr7+gQqkHSiCZamKXuvLW/Ki9Y+6zVbwU0ZE6iRb0vq
         uQCIh2laiuKNeL2W49MJNNa2QPKTPTdRccB57uzjQUion7YNETsx002HJA3msgJ/BHvR
         qp1cpVE+W4zwH9BXr2k4TXvOx7SQN8bhL4HUtVGQkCbD/Y7q80dvw8UgcxJR2f8NCb0j
         BxEpbBTVqf/cxr0LtBUelVG46pTIRMzKwhaXo8024t5Zhm0aIl4VqRiKhUJbBbZZnL7O
         MDOIBhCuaoqj6cRLUz5ZyEsZ2xXeztSK3EFPGeZe1FRCnzzG07DUYvGdyRO3Gj+Rtu8Z
         fpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773355146; x=1773959946;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IkDxS9fCpHHZ8XD7eD09vRf6IL+V4v6HCS03WBPRNsg=;
        b=NvHngUocOa9Bb/M6Z0YINLtW7yaSygtpHbKMxr7Y3zfOPXC7QN4NNbDsqmRPhkCWYK
         f6rH3QRHKdeJQ/ELt5BDxLRJGtcl4z10z6cvfcBZFXYxrLXxtiV6RZFxw7jpL8RqRlWs
         vkcB2aMkb5S8I23Q1N8drFK6thwKox7kiMl/neHK5+rQY2M1ofq76Lxa5Sm/ze3h54HZ
         NU39YvIt0gzF3N92FyG8m4brsniTYSEJTiByuAou9XgHb4Z/3ltAZr1uLrd8vV3sCvR6
         EhYEJss1VQwUf9tHfEkT7b/5MDzwUslImvIFwQcG4R4T5dTMRlb/URCAS32YcU+63dTZ
         ++AA==
X-Forwarded-Encrypted: i=1; AJvYcCW2/kvgnGnvck5fEuXVd8itwC4FWQYoJKqUF8ODxUXYdbGYTK04A71NxmXOtkpAOYb51DuT8oIHu8UAf/udcp/R@lists.infradead.org
X-Gm-Message-State: AOJu0YxjxXocc5SnZ3dEOaMpdd+mJtDVobGreDjjm4t4AndiIOnkXEYk
	YJjphgkC5ybwq1joEnvKC4HhKBLz9Pg7DodBYv8eCRmkaxvaPBWfpcLcnVAKSVNlctlFxvqadr7
	I+XQwPnwdt7Kk08DrxxOBLsZvSg==
X-Received: from iobii3.prod.google.com ([2002:a05:6602:6b83:b0:963:ff03:1c17])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:180c:b0:67b:bd0e:cd5f with SMTP id 006d021491bc7-67bda9c04femr795812eaf.26.1773355145728;
 Thu, 12 Mar 2026 15:39:05 -0700 (PDT)
Date: Thu, 12 Mar 2026 22:39:04 +0000
In-Reply-To: <1e97d367-ae01-4cd2-8005-f690e6d7f72d@linaro.org> (message from
 James Clark on Wed, 11 Mar 2026 12:00:42 +0000)
Mime-Version: 1.0
Message-ID: <gsntcy18oepj.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v6 06/19] perf: arm_pmuv3: Keep out of guest counter partition
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
X-CRM114-CacheID: sfid-20260312_153907_257504_4B8A0B49 
X-CRM114-Status: GOOD (  23.79  )
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

> On 09/02/2026 10:14 pm, Colton Lewis wrote:
>> If the PMU is partitioned, keep the driver out of the guest counter
>> partition and only use the host counter partition.

>> Define some functions that determine whether the PMU is partitioned
>> and construct mutually exclusive bitmaps for testing which partition a
>> particular counter is in. Note that despite their separate position in
>> the bitmap, the cycle and instruction counters are always in the guest
>> partition.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> ---
>>    arch/arm/include/asm/arm_pmuv3.h | 18 +++++++
>>    arch/arm64/kvm/pmu-direct.c      | 86 ++++++++++++++++++++++++++++++++
>>    drivers/perf/arm_pmuv3.c         | 40 +++++++++++++--
>>    include/kvm/arm_pmu.h            | 24 +++++++++
>>    4 files changed, 164 insertions(+), 4 deletions(-)

>> diff --git a/arch/arm/include/asm/arm_pmuv3.h  
>> b/arch/arm/include/asm/arm_pmuv3.h
>> index 154503f054886..bed4dfa755681 100644
>> --- a/arch/arm/include/asm/arm_pmuv3.h
>> +++ b/arch/arm/include/asm/arm_pmuv3.h
>> @@ -231,6 +231,24 @@ static inline bool kvm_set_pmuserenr(u64 val)
>>    }

>>    static inline void kvm_vcpu_pmu_resync_el0(void) {}
>> +static inline void kvm_pmu_host_counters_enable(void) {}
>> +static inline void kvm_pmu_host_counters_disable(void) {}
>> +
>> +static inline bool kvm_pmu_is_partitioned(struct arm_pmu *pmu)
>> +{
>> +	return false;
>> +}
>> +
>> +static inline u64 kvm_pmu_host_counter_mask(struct arm_pmu *pmu)
>> +{
>> +	return ~0;
>> +}
>> +
>> +static inline u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu)
>> +{
>> +	return ~0;
>> +}
>> +

>>    /* PMU Version in DFR Register */
>>    #define ARMV8_PMU_DFR_VER_NI        0
>> diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
>> index 74e40e4915416..05ac38ec3ea20 100644
>> --- a/arch/arm64/kvm/pmu-direct.c
>> +++ b/arch/arm64/kvm/pmu-direct.c
>> @@ -5,6 +5,8 @@
>>     */

>>    #include <linux/kvm_host.h>
>> +#include <linux/perf/arm_pmu.h>
>> +#include <linux/perf/arm_pmuv3.h>

>>    #include <asm/arm_pmuv3.h>

>> @@ -20,3 +22,87 @@ bool has_host_pmu_partition_support(void)
>>    	return has_vhe() &&
>>    		system_supports_pmuv3();
>>    }
>> +
>> +/**
>> + * kvm_pmu_is_partitioned() - Determine if given PMU is partitioned
>> + * @pmu: Pointer to arm_pmu struct
>> + *
>> + * Determine if given PMU is partitioned by looking at hpmn field. The
>> + * PMU is partitioned if this field is less than the number of
>> + * counters in the system.
>> + *
>> + * Return: True if the PMU is partitioned, false otherwise
>> + */
>> +bool kvm_pmu_is_partitioned(struct arm_pmu *pmu)
>> +{
>> +	if (!pmu)
>> +		return false;
>> +
>> +	return pmu->max_guest_counters >= 0 &&
>> +		pmu->max_guest_counters <= *host_data_ptr(nr_event_counters);
>> +}
>> +
>> +/**
>> + * kvm_pmu_host_counter_mask() - Compute bitmask of host-reserved  
>> counters
>> + * @pmu: Pointer to arm_pmu struct
>> + *
>> + * Compute the bitmask that selects the host-reserved counters in the
>> + * {PMCNTEN,PMINTEN,PMOVS}{SET,CLR} registers. These are the counters
>> + * in HPMN..N
>> + *
>> + * Return: Bitmask
>> + */
>> +u64 kvm_pmu_host_counter_mask(struct arm_pmu *pmu)
>> +{
>> +	u8 nr_counters = *host_data_ptr(nr_event_counters);
>> +
>> +	if (!kvm_pmu_is_partitioned(pmu))
>> +		return ARMV8_PMU_CNT_MASK_ALL;
>> +
>> +	return GENMASK(nr_counters - 1, pmu->max_guest_counters);
>> +}
>> +
>> +/**
>> + * kvm_pmu_guest_counter_mask() - Compute bitmask of guest-reserved  
>> counters
>> + * @pmu: Pointer to arm_pmu struct
>> + *
>> + * Compute the bitmask that selects the guest-reserved counters in the
>> + * {PMCNTEN,PMINTEN,PMOVS}{SET,CLR} registers. These are the counters
>> + * in 0..HPMN and the cycle and instruction counters.
>> + *
>> + * Return: Bitmask
>> + */
>> +u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu)
>> +{
>> +	return ARMV8_PMU_CNT_MASK_C & GENMASK(pmu->max_guest_counters - 1, 0);

> This should be an | instead of an & otherwise it's always zero. None of
> the passed through counters count anything with it like this, although
> the cycle counter always worked even with this issue.

> I'm not sure if the selftests that you added catch this? I didn't try
> running them but seems like checking for non zero counter values is a
> very easy thing to test.

I caught this myself and called it out here:

https://lore.kernel.org/kvmarm/gsntseaoogk7.fsf@coltonlewis-kvm.c.googlers.com/

The selftest didn't catch this, so you're right it's a good idea to check.

