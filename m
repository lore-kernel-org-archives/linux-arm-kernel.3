Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2EDC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 14:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exBH9+0EKJsJU5vfoNtnKHgSzJ0TgqGbPxyoWRS+XAk=; b=ERLKWDHOvo+aKR6lln8UajZh86
	BfnL8j/IFBLlHdmJ8rj/sZgxAY7PRLtHX4K2EphxN3ALKgwWJxnMtLiinA0lIPhQ1KyYfu7ZqDRFS
	tDjYPyLnVxhgVxULKU2czVkYXTgHHv50yOnu1ne7QzWh8rnt6MKop3aWSL3pnfEJHH0pvClbojQl9
	QMVYmSG0gt6RPXtX0cXnA7E248T/sRa+Jf2WSbVkZPycmTorYP6dPgnB1BpzKo5ibrqTim0Q+DQks
	kna265aLffvuNqlFXR17GfpMTRVXjJyFTCCdwoe52dexTF0750B7VXyF6rrkYjU04dCJb5axBEcx6
	0JJP9UTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twjBx-00000003RaF-40F7;
	Mon, 24 Mar 2025 14:54:17 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twjAE-00000003RMK-3nuy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 14:52:32 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so36224525e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 07:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742827949; x=1743432749; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=exBH9+0EKJsJU5vfoNtnKHgSzJ0TgqGbPxyoWRS+XAk=;
        b=IYwhhtSlm9dWj8Vg6rGyoaT9Y64lPozSyAAqeaK8ddB3t0iDV7fg66OZ0WUa9xc396
         S65M2uWgwif8t/jtz6MFsYfrQFdzBigmnS10mAYbqI14M9D/mkIu5i1cxpe0FMTI44yu
         9IHdyOeYkTXD1GT2Z+bOlJ+cyFlQF2ZfmgIDwlDtQCgEYOZ+Pvle8c96gfefMVdrHx77
         a83IHf7j4fMQzWEZ6AA1c64Bbs7fW6KVPv3kwwM7Z+M7K1cI4kQxbu0WrGJyqbcBIsUq
         7BjgZzrqC+b9tFzNIL2V8fLW9jgRNOYJTU/qjQLSsB/i591r5ONd7dgOlCjs3oef7Jsc
         V/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742827949; x=1743432749;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=exBH9+0EKJsJU5vfoNtnKHgSzJ0TgqGbPxyoWRS+XAk=;
        b=olEcmKeWZt7TFr6J2hFUAchMiWJqf+bIprabEW6WwiHNTF35/VN4Fcg8NJkfaMGT6D
         afkWQIhzQ6W1npaX1h0d2CZipaSG7RnkiKMm+TIaMnfwcVKpDQcrphfAzzeRRTtkkV90
         l1KXzdTQb0kdU1M7SPxwHvEHj6mkatKDWsYLXlN/RJmiIL2O+3ZO84VLw/w/TLAWxnhO
         nZ3V1Mi2yOxWj8APUnjtXJ2fcs3U2bC3inKrpUkH7ymOeJYq1HUBY0LzY+qUYM21BVay
         WRkSQ/7gGAZgIPNcE4m30zG3B7fn9FOlanUg/E2X3S2HObdXWJ9AGXVSP1AUanw4G+Fe
         N6pQ==
X-Forwarded-Encrypted: i=1; AJvYcCX49qpNFus8MyNwhmJv4SjKpmoFeC2KrJv3B5Pa8JdwVsfgJBlcobjfdWc4ZrgE/ldxUcuLYtj3cpUMNsjoveca@lists.infradead.org
X-Gm-Message-State: AOJu0YzKBErDUzo26l+Ak1Pa5AxMYUPWBrlRa/yDazEkxOmAhtNJHVfq
	R9WrlXTthpqVBnDl61/sSUSc5R4JrlqAfXHOThkCuP+02AX7NFbO42X670WtDrM=
X-Gm-Gg: ASbGncv/wss22C7QvudoTLecS6XJ8GLtPhwPTwwBPcEM7a/MD+dQncuX3fGHz3LZg5L
	HCJWTViZF+PPm4XIOkfKgcxbh6vIywLWHjsymYrJIs+bEwim9HOIqwE8tkgx3Z3xmZJLJKVligd
	G3b2F0wfAhf849dlSAwNjajj0V1rVmObnCzE3uz5JYrBWQxSxAj8YHqXJ5EowEE0LFa68DP9ehE
	xrtBNyBniawfQRbGPYpmCcKxkFK9nQDPUDRZ/NmjCySwzAM3n3pb7C8VCiGSKI+QF3mHH6w/7Ms
	uryR/mf1bRB1xDpF9C5OuWQMhscgIKubkrVJ2egSZUaFTbFrLqW5QQ==
X-Google-Smtp-Source: AGHT+IFTBMeJe4wjjtoaON7OuOYX1jtnqozAP2nBEU07iBzqR9DmsR32rxUII8xRcaN91P8qiaEz3g==
X-Received: by 2002:a5d:5f96:0:b0:391:fcc:9ee8 with SMTP id ffacd0b85a97d-3997f912529mr11083564f8f.23.1742827948855;
        Mon, 24 Mar 2025 07:52:28 -0700 (PDT)
Received: from [192.168.1.247] ([145.224.90.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9957c3sm11448421f8f.18.2025.03.24.07.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 07:52:28 -0700 (PDT)
Message-ID: <8450a182-5c62-4546-ab91-5d39eb252254@linaro.org>
Date: Mon, 24 Mar 2025 14:52:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 7/8] perf: arm_pmuv3: Keep out of guest counter
 partition
To: Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20250213180317.3205285-1-coltonlewis@google.com>
 <20250213180317.3205285-8-coltonlewis@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250213180317.3205285-8-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_075230_972763_E4C0975A 
X-CRM114-Status: GOOD (  27.33  )
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



On 13/02/2025 6:03 pm, Colton Lewis wrote:
> If the PMU is partitioned, keep the driver out of the guest counter
> partition and only use the host counter partition. Partitioning is
> defined by the MDCR_EL2.HPMN register field and saved in
> cpu_pmu->hpmn. The range 0..HPMN-1 is accessible by EL1 and EL0 while
> HPMN..PMCR.N is reserved for EL2.
> 
> Define some macros that take HPMN as an argument and construct
> mutually exclusive bitmaps for testing which partition a particular
> counter is in. Note that despite their different position in the
> bitmap, the cycle and instruction counters are always in the guest
> partition.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>   arch/arm/include/asm/arm_pmuv3.h |  2 +
>   arch/arm64/include/asm/kvm_pmu.h |  5 +++
>   arch/arm64/kvm/pmu-part.c        | 16 +++++++
>   drivers/perf/arm_pmuv3.c         | 73 +++++++++++++++++++++++++++-----
>   include/linux/perf/arm_pmuv3.h   |  8 ++++
>   5 files changed, 94 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm/include/asm/arm_pmuv3.h b/arch/arm/include/asm/arm_pmuv3.h
> index 2ec0e5e83fc9..dadd4ddf51af 100644
> --- a/arch/arm/include/asm/arm_pmuv3.h
> +++ b/arch/arm/include/asm/arm_pmuv3.h
> @@ -227,6 +227,8 @@ static inline bool kvm_set_pmuserenr(u64 val)
>   }
>   
>   static inline void kvm_vcpu_pmu_resync_el0(void) {}
> +static inline void kvm_pmu_host_counters_enable(void) {}
> +static inline void kvm_pmu_host_counters_disable(void) {}
>   
>   /* PMU Version in DFR Register */
>   #define ARMV8_PMU_DFR_VER_NI        0
> diff --git a/arch/arm64/include/asm/kvm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
> index 174b7f376d95..8f25754fde47 100644
> --- a/arch/arm64/include/asm/kvm_pmu.h
> +++ b/arch/arm64/include/asm/kvm_pmu.h
> @@ -25,6 +25,8 @@ void kvm_host_pmu_init(struct arm_pmu *pmu);
>   u8 kvm_pmu_get_reserved_counters(void);
>   u8 kvm_pmu_hpmn(u8 nr_counters);
>   void kvm_pmu_partition(struct arm_pmu *pmu);
> +void kvm_pmu_host_counters_enable(void);
> +void kvm_pmu_host_counters_disable(void);
>   
>   #else
>   
> @@ -37,6 +39,9 @@ static inline bool kvm_set_pmuserenr(u64 val)
>   static inline void kvm_vcpu_pmu_resync_el0(void) {}
>   static inline void kvm_host_pmu_init(struct arm_pmu *pmu) {}
>   
> +static inline void kvm_pmu_host_counters_enable(void) {}
> +static inline void kvm_pmu_host_counters_disable(void) {}
> +
>   #endif
>   
>   #endif
> diff --git a/arch/arm64/kvm/pmu-part.c b/arch/arm64/kvm/pmu-part.c
> index e74fecc67e37..51da65c678f9 100644
> --- a/arch/arm64/kvm/pmu-part.c
> +++ b/arch/arm64/kvm/pmu-part.c
> @@ -45,3 +45,19 @@ void kvm_pmu_partition(struct arm_pmu *pmu)
>   		pmu->partitioned = false;
>   	}
>   }
> +
> +void kvm_pmu_host_counters_enable(void)
> +{
> +	u64 mdcr = read_sysreg(mdcr_el2);
> +
> +	mdcr |= MDCR_EL2_HPME;
> +	write_sysreg(mdcr, mdcr_el2);
> +}
> +
> +void kvm_pmu_host_counters_disable(void)
> +{
> +	u64 mdcr = read_sysreg(mdcr_el2);
> +
> +	mdcr &= ~MDCR_EL2_HPME;
> +	write_sysreg(mdcr, mdcr_el2);
> +}
> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
> index 0e360feb3432..442dcff56d5b 100644
> --- a/drivers/perf/arm_pmuv3.c
> +++ b/drivers/perf/arm_pmuv3.c
> @@ -730,15 +730,19 @@ static void armv8pmu_disable_event_irq(struct perf_event *event)
>   	armv8pmu_disable_intens(BIT(event->hw.idx));
>   }
>   
> -static u64 armv8pmu_getreset_flags(void)
> +static u64 armv8pmu_getreset_flags(struct arm_pmu *cpu_pmu)
>   {
>   	u64 value;
>   
>   	/* Read */
>   	value = read_pmovsclr();
>   
> +	if (cpu_pmu->partitioned)
> +		value &= ARMV8_PMU_HOST_CNT_PART(cpu_pmu->hpmn);
> +	else
> +		value &= ARMV8_PMU_OVERFLOWED_MASK;
> +
>   	/* Write to clear flags */
> -	value &= ARMV8_PMU_OVERFLOWED_MASK;
>   	write_pmovsclr(value);
>   
>   	return value;
> @@ -765,6 +769,18 @@ static void armv8pmu_disable_user_access(void)
>   	update_pmuserenr(0);
>   }
>   
> +static bool armv8pmu_is_guest_part(struct arm_pmu *cpu_pmu, u8 idx)
> +{
> +	return cpu_pmu->partitioned &&
> +		(BIT(idx) & ARMV8_PMU_GUEST_CNT_PART(cpu_pmu->hpmn));
> +}
> +
> +static bool armv8pmu_is_host_part(struct arm_pmu *cpu_pmu, u8 idx)
> +{
> +	return !cpu_pmu->partitioned ||
> +		(BIT(idx) & ARMV8_PMU_HOST_CNT_PART(cpu_pmu->hpmn));
> +}
> +
>   static void armv8pmu_enable_user_access(struct arm_pmu *cpu_pmu)
>   {
>   	int i;
> @@ -773,6 +789,8 @@ static void armv8pmu_enable_user_access(struct arm_pmu *cpu_pmu)
>   	if (is_pmuv3p9(cpu_pmu->pmuver)) {
>   		u64 mask = 0;
>   		for_each_set_bit(i, cpuc->used_mask, ARMPMU_MAX_HWEVENTS) {
> +			if (armv8pmu_is_guest_part(cpu_pmu, i))
> +				continue;

Hi Colton,

Is it possible to keep the guest bits out of used_mask and cntr_mask in 
the first place? Then all these loops don't need to have the logic for 
is_guest_part()/is_host_part().

That leads me to wonder about updating the printout:

  hw perfevents: enabled with armv8_pmuv3_0 PMU driver, 7 (0,8000003f)
    counters available

It might be a bit confusing if that doesn't quite reflect reality anymore.

Thanks
James


