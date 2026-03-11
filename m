Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8BF1062871
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 12:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=130nMfpxEVLAWE8mJauFzxZjoerVddIIHSIrMCUq+e8=; b=0edaKq8heJowXt6+dE/z+jzmF4
	jMn2jx/9/DQ+ZvAcJKapa6zle76HI7xjaeT71B5ycpekaIS4OOgz1hqFkLtwItd2cYLhb2y7uxhgr
	tFm8p/iCUm05Vh1m18PUd07y8VAASx0NoL0wNsd3U/Q5esPuc95KY82TWkNr/saWJ77dqZYZ8MoYe
	T/MLGm4t54o1XBZIBbSHv4vdv9HXbDVu2dsoBLEIbqb6y6LSEv3p5v/QjnVFFp6xU/cJEirMt5EP0
	bQOOhqrhNgFt6ntF6z4QnDRkApi2O7ZWCJQt0hTnCdK6Wr230AXVs3hrcI87wsh7qxkuaj5cr6vAE
	Unb3q/eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0IF6-0000000BWxC-2LkB;
	Wed, 11 Mar 2026 12:00:48 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0IF3-0000000BWwi-3Gcj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 12:00:46 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso115741665e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 05:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773230444; x=1773835244; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=130nMfpxEVLAWE8mJauFzxZjoerVddIIHSIrMCUq+e8=;
        b=wGgoxTiln98zHLoITD6RU8z8Hg6ZlknyrXIeGQ7rIhwzyGmUXYh/S4XhZA9baqPlPC
         yQY4IqODLkuKN3yyL0K4wYNv5f+hUo9AJkttKMfVXr2AGOkoAk16IwrbULgJLeg1Nyls
         lFNYPLPu4lQ1Z1XyUsrjnP84Lo21vCSPHiS2hy4CCF0ZJUiNi/eZ14xJuwgmN6V2YMNl
         qQiCXoXXZzaVOD0gRHe4isM9c4pSOD0P3ZyPtBzK2vTEzgJtMjBeW/8IOkM0g0qiVm6L
         BPSTCqmKm2/990arLuWvlTii5tf1OrLcGllxwIYZQfGisDpeFYY/udV08bW/eWGFx/XD
         kqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773230444; x=1773835244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=130nMfpxEVLAWE8mJauFzxZjoerVddIIHSIrMCUq+e8=;
        b=KeRAFDaqHbQN/2awW2XSzhM0BnJl0TKRNll430WXi5u87ibwtDBMkPjlrkTy5hBrT9
         tfqsQlAo1OnPhnxipuxRnc/jMYOV0FPBqZN/2qnfGftNprKsMrFjqquAwC2SQkUvcQ1T
         08aJMkTB2uj16uRZslvGQcxtudMCH9JQ+01HrkL2bs+q80V2ClRi7duU7tCY3u/kUl+h
         bilTGpNN+E/g+MNPJW0tdoUtpMqTEx9KYTLehBV1MHlC93hYWmDyB7dyGMIViAjjk1p8
         w9sNzTa0h8liCL2qbrX7cd6QE14qvusHuZD2iPqqcVptZ8nawyEFUFiYJwKe8J6aiQN9
         L+QQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPYVuVCMcsiKYvXfKZ2OjQgr7A8JDvrzun8amCLlH2YpBWVtpvOPFpZdR1+r6dBYUFu6MfUuZTJz3yUWC1gHTh@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy3NT9g+7jA32DBB4+YbuhpEiYAtbO9xbulyFxi5wQCyLPdCav
	1H1EhvNHS0hZPb4a0sNvdq91k398ZK49X2y5XKMKwRUutGVils4uWXfdtVfIhJF6lqw=
X-Gm-Gg: ATEYQzyvYTvkJdDdPL3hC2s2Uil6PLEyEarGvU+fBnH40OEkAafomNl+o5o7EhOJS8b
	W8nPn2L29TTywulcgwo7vN7Uwkr69+X3tdiaRviE2AAMjj2iUE1gCDI1yA/yWh7FNC6QOrD1ZDb
	hlRbOQXqRd4nv6RN6m/rL7EdgBpeUP6MclRuYoNiWukmBKRNit0EZzDknzASwD8k61dVJ3W0x9r
	O/Uq7Iv1h0q8zMGuQIwD4nAMECRDkQParnHgeOnEpy0THgjRRm9paiol6Ulw1f9ZMwdX//v3+8l
	VpwwbFnc02Rn+LBEpgiccP9FMjl3U/csxzzK8OAr0EQ6nB4VnNQMK88sgwIRuh/HHnIdf2coRNH
	Bg7PIVZesijViHt8Lf2Ou4I7LbZpXsXMsVMphkfyTG6sDH9rWDkhqaQ8AQ5SGH1G/iKF7UrtDhP
	bFvz/HkgZx1BN/u/zoUee+FhhobFPf
X-Received: by 2002:a05:600c:3b1c:b0:480:69b6:dfed with SMTP id 5b1f17b1804b1-4854b123903mr37819645e9.24.1773230443521;
        Wed, 11 Mar 2026 05:00:43 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d37fsm6957985f8f.6.2026.03.11.05.00.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 05:00:43 -0700 (PDT)
Message-ID: <1e97d367-ae01-4cd2-8005-f690e6d7f72d@linaro.org>
Date: Wed, 11 Mar 2026 12:00:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/19] perf: arm_pmuv3: Keep out of guest counter
 partition
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
 <20260209221414.2169465-7-coltonlewis@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260209221414.2169465-7-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_050045_862410_FC767733 
X-CRM114-Status: GOOD (  26.57  )
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
> If the PMU is partitioned, keep the driver out of the guest counter
> partition and only use the host counter partition.
> 
> Define some functions that determine whether the PMU is partitioned
> and construct mutually exclusive bitmaps for testing which partition a
> particular counter is in. Note that despite their separate position in
> the bitmap, the cycle and instruction counters are always in the guest
> partition.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>   arch/arm/include/asm/arm_pmuv3.h | 18 +++++++
>   arch/arm64/kvm/pmu-direct.c      | 86 ++++++++++++++++++++++++++++++++
>   drivers/perf/arm_pmuv3.c         | 40 +++++++++++++--
>   include/kvm/arm_pmu.h            | 24 +++++++++
>   4 files changed, 164 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/include/asm/arm_pmuv3.h b/arch/arm/include/asm/arm_pmuv3.h
> index 154503f054886..bed4dfa755681 100644
> --- a/arch/arm/include/asm/arm_pmuv3.h
> +++ b/arch/arm/include/asm/arm_pmuv3.h
> @@ -231,6 +231,24 @@ static inline bool kvm_set_pmuserenr(u64 val)
>   }
>   
>   static inline void kvm_vcpu_pmu_resync_el0(void) {}
> +static inline void kvm_pmu_host_counters_enable(void) {}
> +static inline void kvm_pmu_host_counters_disable(void) {}
> +
> +static inline bool kvm_pmu_is_partitioned(struct arm_pmu *pmu)
> +{
> +	return false;
> +}
> +
> +static inline u64 kvm_pmu_host_counter_mask(struct arm_pmu *pmu)
> +{
> +	return ~0;
> +}
> +
> +static inline u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu)
> +{
> +	return ~0;
> +}
> +
>   
>   /* PMU Version in DFR Register */
>   #define ARMV8_PMU_DFR_VER_NI        0
> diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
> index 74e40e4915416..05ac38ec3ea20 100644
> --- a/arch/arm64/kvm/pmu-direct.c
> +++ b/arch/arm64/kvm/pmu-direct.c
> @@ -5,6 +5,8 @@
>    */
>   
>   #include <linux/kvm_host.h>
> +#include <linux/perf/arm_pmu.h>
> +#include <linux/perf/arm_pmuv3.h>
>   
>   #include <asm/arm_pmuv3.h>
>   
> @@ -20,3 +22,87 @@ bool has_host_pmu_partition_support(void)
>   	return has_vhe() &&
>   		system_supports_pmuv3();
>   }
> +
> +/**
> + * kvm_pmu_is_partitioned() - Determine if given PMU is partitioned
> + * @pmu: Pointer to arm_pmu struct
> + *
> + * Determine if given PMU is partitioned by looking at hpmn field. The
> + * PMU is partitioned if this field is less than the number of
> + * counters in the system.
> + *
> + * Return: True if the PMU is partitioned, false otherwise
> + */
> +bool kvm_pmu_is_partitioned(struct arm_pmu *pmu)
> +{
> +	if (!pmu)
> +		return false;
> +
> +	return pmu->max_guest_counters >= 0 &&
> +		pmu->max_guest_counters <= *host_data_ptr(nr_event_counters);
> +}
> +
> +/**
> + * kvm_pmu_host_counter_mask() - Compute bitmask of host-reserved counters
> + * @pmu: Pointer to arm_pmu struct
> + *
> + * Compute the bitmask that selects the host-reserved counters in the
> + * {PMCNTEN,PMINTEN,PMOVS}{SET,CLR} registers. These are the counters
> + * in HPMN..N
> + *
> + * Return: Bitmask
> + */
> +u64 kvm_pmu_host_counter_mask(struct arm_pmu *pmu)
> +{
> +	u8 nr_counters = *host_data_ptr(nr_event_counters);
> +
> +	if (!kvm_pmu_is_partitioned(pmu))
> +		return ARMV8_PMU_CNT_MASK_ALL;
> +
> +	return GENMASK(nr_counters - 1, pmu->max_guest_counters);
> +}
> +
> +/**
> + * kvm_pmu_guest_counter_mask() - Compute bitmask of guest-reserved counters
> + * @pmu: Pointer to arm_pmu struct
> + *
> + * Compute the bitmask that selects the guest-reserved counters in the
> + * {PMCNTEN,PMINTEN,PMOVS}{SET,CLR} registers. These are the counters
> + * in 0..HPMN and the cycle and instruction counters.
> + *
> + * Return: Bitmask
> + */
> +u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu)
> +{
> +	return ARMV8_PMU_CNT_MASK_C & GENMASK(pmu->max_guest_counters - 1, 0);

This should be an | instead of an & otherwise it's always zero. None of 
the passed through counters count anything with it like this, although 
the cycle counter always worked even with this issue.

I'm not sure if the selftests that you added catch this? I didn't try 
running them but seems like checking for non zero counter values is a 
very easy thing to test.




