Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A97CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 14:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6uflrulgEFIn9x44XDb2ne6l2kjOQ5bKLrwMyk01QUg=; b=bCbNzgvflod6nZ/avrsdX8YtcE
	yw2P6ZER90Zo7Zfnfm8Z8jxbYYp1AWKns8aIYoDRUeduqaSKTQesD9rmrLMfgMA82DjwaAStkHUJw
	9SuLzad3UNt84AdJ4LTuQ+3eeJYTno40ZoMVU4FeIGEYMcs+3/T/H5a0SdISG6dM6uTzLtuAcnBCC
	s7M+9BCSjOJBkNOs3BYfFe31maE7dED7byDnrzyGikC4L0S1KgfSnE8VZdqIknhrQbvGx4xtS/XAa
	4Ob3+3WX8PuDN2EzwruODOkZopj9roBAJbZrgCcdO3cOFk9gsmYIpPtSGyMZDiW3g1b7lkuUQR0JX
	RfD1MeYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRx2-0000000Dx9P-1b1R;
	Mon, 11 May 2026 14:49:44 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRwz-0000000Dx8c-0Yiw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 14:49:42 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-44509921fbcso2225241f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 07:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778510979; x=1779115779; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6uflrulgEFIn9x44XDb2ne6l2kjOQ5bKLrwMyk01QUg=;
        b=gEfZOLhV7egPfOEMRasgasKIKapFhS6ycpA1T2SO+XXN3BOipcrI6T2R2WoEbnhbzq
         TOxVZNKJo5aKgy00yUJWD3u7eHxXiccmR8sa6S5a9fPiWXogazAgUMV2f8HeEvxaISyi
         ialg5fioZRHasqWRjjGLp65gZIVXpROmK4p0fAgv51oi8A67so8UTt2yfanuCAO8zPHO
         /ZwyFNxHWqpAo+LZpYBJc8mbkQxjDoh/o7746BASAs/2EWnS1ewmGAkajapD+8p1n0IQ
         qlgzu3d3qlZVVerkvulrpqDEBT5Sf+KHyAwnJU1G8uuC1FvsTZq1qAFVRw9PZQLfv79Q
         5h5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510979; x=1779115779;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6uflrulgEFIn9x44XDb2ne6l2kjOQ5bKLrwMyk01QUg=;
        b=WzAFALh+/r9tW9VmOhsfBbjETnd1/3H9tOKF2jAcghdOQlp8MpKRTIdxPgc414C7Av
         p//7k7klZTML8bOGqMdkARw8fpyeNbT5xVYU5LtF9YJZYN44GWj1prYDzemyUng8lUkJ
         fgrldFGRnNnARJMFlWCChxQoAOmYuVQr+lGUGoNrZLg761+s13ALlmSWIb2+QPz/Nwsu
         toMJlmERSoKF0QdBuWA4zpvigMhSo8LiIEVNWq97qujyikup6TbbK+//XeH+FKOQPIyw
         azUiGGMRYB+7OhliErkMBxOl6QeOauukp3WNlcyfNOv78u9uzVccvLsglhITc9KQVB/S
         R5Yg==
X-Forwarded-Encrypted: i=1; AFNElJ9PPSONblNmR0HA+AQHTyOY6NBAzIMXpPKzDEP0vzzJ5nB4KpNFIqCzBy6uFcCmMIFxCEyaonjyHta855U593r/@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8oaXoFQgoYbYft9ckRxG04nSL/JbVBeYLlDrgRk/Rmzg/YYro
	qNy0cRt5/xlXbqXj5p4GUIjZi/BkpuplUXaMyoyLwzPQWs5kLWFVEkkDP3J3Ah0owgQ=
X-Gm-Gg: Acq92OETVEyvVoMRFiVOBa1tGh1aihoNVCg9yM9EvoMSuQWGk1U31mLY/9E0ytYVwp3
	rNpt6S3ecCSW0r89/oSGCPb71UhfzrI2Mp0732Ojj0JSGSk8GPv0nOjNLqMNsHv7j2vHYpA2tVB
	vt7asyutOHVsFtE7ULx4S89yTUSpFwIXoMr6Rp9OOMvDqA+WrhrONhX8B52anTCU4rRTNP63yzI
	bDIUsLbFdHxJ4F5ZJARU/Wi7KTaHEN/Te8IzVRIrctqXw130Mjlugp8mkaN6aPevljmcSaDU4af
	y6S9gxT9qm6TADDPfXzTSn1MiYJCgpBmgK5DQKHgTBYHOwDAnhOyNKQR2OMt6+rOC7ddG2dcn1k
	nZCVziluIBpyOfJ9FslZ0cE/fh+TaiJnwNEjsWso+V8b3F2gID9d8NPqtVHt6+evxqYbEgf/+kl
	r8TGNi2hPI1SbS8Kngd7l1SmnJcX0N1Mi/7e2nssgcKt8uHQ/BUw==
X-Received: by 2002:a05:600c:33a9:b0:487:2439:b7c8 with SMTP id 5b1f17b1804b1-48e51e0bb9amr250632005e9.1.1778510979404;
        Mon, 11 May 2026 07:49:39 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e5516sm293146665e9.7.2026.05.11.07.49.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 07:49:38 -0700 (PDT)
Message-ID: <ad02327b-01b6-4ed9-b9bb-e2c6ed4b2890@linaro.org>
Date: Mon, 11 May 2026 15:49:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/20] KVM: arm64: Context swap Partitioned PMU guest
 registers
To: Colton Lewis <coltonlewis@google.com>
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
 linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kvm@vger.kernel.org
References: <20260504211813.1804997-1-coltonlewis@google.com>
 <20260504211813.1804997-11-coltonlewis@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260504211813.1804997-11-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_074941_206319_A9CFF707 
X-CRM114-Status: GOOD (  24.72  )
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



On 04/05/2026 10:18 pm, Colton Lewis wrote:
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
>   arch/arm64/kvm/pmu-direct.c      | 169 +++++++++++++++++++++++++++++++
>   include/kvm/arm_pmu.h            |  16 +++
>   4 files changed, 191 insertions(+)
> 
> diff --git a/arch/arm/include/asm/arm_pmuv3.h b/arch/arm/include/asm/arm_pmuv3.h
> index 42d62aa48d0a6..eebc89bdab7a1 100644
> --- a/arch/arm/include/asm/arm_pmuv3.h
> +++ b/arch/arm/include/asm/arm_pmuv3.h
> @@ -235,6 +235,10 @@ static inline bool kvm_pmu_is_partitioned(struct arm_pmu *pmu)
>   {
>   	return false;
>   }
> +static inline u64 kvm_pmu_host_counter_mask(struct arm_pmu *pmu)
> +{
> +	return ~0;
> +}
>   
>   /* PMU Version in DFR Register */
>   #define ARMV8_PMU_DFR_VER_NI        0
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 410ffd41fd73a..a942f2bc13fc4 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -680,6 +680,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>   		kvm_vcpu_load_vhe(vcpu);
>   	kvm_arch_vcpu_load_fp(vcpu);
>   	kvm_vcpu_pmu_restore_guest(vcpu);
> +	kvm_pmu_load(vcpu);
>   	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
>   		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
>   
> @@ -721,6 +722,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>   	kvm_timer_vcpu_put(vcpu);
>   	kvm_vgic_put(vcpu);
>   	kvm_vcpu_pmu_restore_host(vcpu);
> +	kvm_pmu_put(vcpu);
>   	if (vcpu_has_nv(vcpu))
>   		kvm_vcpu_put_hw_mmu(vcpu);
>   	kvm_arm_vmid_clear_active();
> diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
> index 63ac72910e4b5..360d022d918d5 100644
> --- a/arch/arm64/kvm/pmu-direct.c
> +++ b/arch/arm64/kvm/pmu-direct.c
> @@ -9,6 +9,7 @@
>   #include <linux/perf/arm_pmuv3.h>
>   
>   #include <asm/arm_pmuv3.h>
> +#include <asm/kvm_emulate.h>
>   
>   /**
>    * has_host_pmu_partition_support() - Determine if partitioning is possible
> @@ -98,3 +99,171 @@ u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)
>   
>   	return *host_data_ptr(nr_event_counters);
>   }
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
> +	if (kvm_pmu_is_partitioned(pmu))
> +		return GENMASK(nr_counters - 1, pmu->max_guest_counters);
> +
> +	return ARMV8_PMU_CNT_MASK_ALL;
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
> +	if (kvm_pmu_is_partitioned(pmu))
> +		return ARMV8_PMU_CNT_MASK_C | GENMASK(pmu->max_guest_counters - 1, 0);
> +
> +	return 0;
> +}

Minor nit: slightly inconsistent use of types. Returns a u64 but doesn't 
use GENMASK_ULL and is also usually saved into a long when it's called.


