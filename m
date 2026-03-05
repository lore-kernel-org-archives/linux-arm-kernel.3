Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CBFF30928
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5rwWGFQhdrZCpbbLr/E+X4NwG6E0LyDnEZBwSFjBRo=; b=ZoxMUfGYn6GfJ0vpRLBm61Qfhg
	WCrosxkc7PvDCwi+ISHInikaRGXgRqveq6oNAUiPpykJHmBM8TtkK/KKRXCyEBdCg5HlaVOzUwcjT
	t4WcSrYm/6/JcRR/GRjRpjFbgEW+mz7q6kBn3ZyiSj91mjPwutKoyNJi2PYVKzqto+dIeBeUe8peZ
	N2afxUvUwmc8iPFPGoe/ZtAJRauHdIDvMOsrOHD38Jr1QwyARewru6az9yIqAi3RVux3RKTmoxzB9
	rIpZKJGuHvFaeYnQgwgpbT9mBqCeZ14/DLdV+z7JyEHVHZMtFqkuCNFpXY83gWVOaw5AD1jkFbjMk
	2juvCONA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5l4-00000001XTy-2W1P;
	Thu, 05 Mar 2026 10:16:42 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5l1-00000001XTZ-1xWK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:16:40 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b9359c0ec47so853748266b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 02:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772705797; x=1773310597; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e5rwWGFQhdrZCpbbLr/E+X4NwG6E0LyDnEZBwSFjBRo=;
        b=xZKhZs1oUbiLRnSFH4kU33/v7H3baNuOLnIxNgc1N7wkxRoLUaQSUqjWEpS9Zl5H+Q
         LC74ootNDh9MFvUErTruSk05E96TrKjPE3SEd8Jt5AsOrKM5L3vaWZ2uwKJ655ppbojv
         MGF7x6Xh/VZyDXBVBsd7Tl+KJAtuUm2iOm6a4DjcrI6AC9eCA/Y+yxEubR+O7vXxSZnP
         SMT59ovsc9vMmFdPnHODfVMnwavGLcXc7gzRctP9QDoElFxdVRyIPp7WyA9054fYWbmp
         nNA5eXlAvGaidInye+7GdBaGpY3oghWZyUse1bhfgpFlQbTtSEfQC9mMsVjGt0nt+vOR
         6Dpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772705797; x=1773310597;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e5rwWGFQhdrZCpbbLr/E+X4NwG6E0LyDnEZBwSFjBRo=;
        b=pv6Qc6eACbWl1fFnCCE8h6XoOZIAMRJl2cWWQa+KTSf2BEpcFLzPeGNE5DO4XWFy/Q
         rnxWd7SDgB1DdxdO+rPInzVJu9piGFnV3PiNHyZ373roO1vfyCcZz5BV0+ZJsbnd74tL
         DPwhPcu+6D2uSwSpSU0g5Ar6x9GnJ6hxFawBD4izkzEug4v8K+9xref9VfEQhxTsST7E
         2fd7rU7bnmX1G3/eo3n8ALMYec5KvAr0zEGlVgS81ehvhsmzeQydfH/wWvY/3FHfexAX
         9xmRx/nCj4Pom6jVRJnxygghd4xhrsD0rM05GQhvL2sV7L0vW5W2GsUdLTA4PyeM9jVr
         jZRA==
X-Forwarded-Encrypted: i=1; AJvYcCUhGPwZX2EFlbbYyd8+fe4KsN8nTtYls4fXPz5bHHywReAsRUalUUj/EtbsnItrkBDCdGv4y5Hb5uMIcmA6vqxG@lists.infradead.org
X-Gm-Message-State: AOJu0YwsOHi67rYHlg8Unyt7OCZvmzlgUHdub4X8VyCxM4aeJlrv8dkR
	SpkSPo8Bjq6V6Uk5Uihag/GeYQ2+3G/Oc1V8P6B3fOnEqdgv6Gx08jy78RHQN80C4D4=
X-Gm-Gg: ATEYQzzxntmt2kjW3e2qlLgBtPEWT9otQP23qYW5jKrx6iMq4hI/lm3onTE0VX4VW25
	2o4eo4NJpnToH+hOekw7pT4fey5ZENZgsCtXfhf3/EgWYL3j68Q1AYYAVaxXZSeaCI/ig6OZ6Jn
	2SAOMCYQFALZMygK348uV93Q/Oo0ndYCqBvwc3kyYD6InlMIKmj9zP+t/n66o3jwJl3VMjVc0fQ
	iK7a9wS11PWsiN9/4Lrpw7bSMcJgH6a9cvuRJSW63gBpqw0BsLUTYfz+OZXns9RRSwwUc0/fcG+
	fiAPulnX8mmB5SXUfe9EtsoJwb+Pek+QAyeLZfPBPdB3dk08qjarxruLuRgYJCkzmtM9BOpZj1c
	1RmqULl96G9/xvGMjAjF8/AgGgGK7CmQb5EVUApDzvc6CwctU/SnrzGEeJZe3x4DdpkQJ0RZ+3b
	M4LxT+RMhzYoyISR2I0KYfKOlwfuGh
X-Received: by 2002:a17:907:7b98:b0:b73:544d:b963 with SMTP id a640c23a62f3a-b93f11530ddmr332218266b.13.1772705796619;
        Thu, 05 Mar 2026 02:16:36 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ac7371esm883072366b.24.2026.03.05.02.16.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 02:16:36 -0800 (PST)
Message-ID: <819fa670-f6f6-4251-a528-6d8264451b9f@linaro.org>
Date: Thu, 5 Mar 2026 10:16:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 16/19] KVM: arm64: Add vCPU device attr to partition
 the PMU
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
References: <20260209221414.2169465-1-coltonlewis@google.com>
 <20260209221414.2169465-17-coltonlewis@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260209221414.2169465-17-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_021639_589994_9DCB4A59 
X-CRM114-Status: GOOD (  33.55  )
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
> Add a new PMU device attr to enable the partitioned PMU for a given
> VM. This capability can be set when the PMU is initially configured
> before the vCPU starts running and is allowed where PMUv3 and VHE are
> supported and the host driver was configured with
> arm_pmuv3.reserved_host_counters.
> 
> The enabled capability is tracked by the new flag
> KVM_ARCH_FLAG_PARTITIONED_PMU_ENABLED.

Typo, should be: KVM_ARCH_FLAG_PARTITION_PMU_ENABLED. Or maybe the 
#define should be fixed.

I couldn't see if this was discussed before, but what's the reason to 
not use the guest partition by default and make this flag control 
reverting back to use the non passed through PMU?

Seems like if you already have to enable it by creating a partition on 
the host, then you more than likely want your guests to use it. And it's 
lower overhead so it's "better". Right now it's two things that you have 
to set at the same time to do one thing.

Or does having to set it on the host go away with the dynamic approach 
here [1]?

[1]: https://lore.kernel.org/kvmarm/aWjlfl85vSd6sMwT@willie-the-truck/

> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>   arch/arm64/include/asm/kvm_host.h |  2 ++
>   arch/arm64/include/uapi/asm/kvm.h |  2 ++
>   arch/arm64/kvm/pmu-direct.c       | 35 ++++++++++++++++++++++++++++---
>   arch/arm64/kvm/pmu.c              | 14 +++++++++++++
>   include/kvm/arm_pmu.h             |  9 ++++++++
>   5 files changed, 59 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 41577ede0254f..f0b0a5edc7252 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -353,6 +353,8 @@ struct kvm_arch {
>   #define KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS		10
>   	/* Unhandled SEAs are taken to userspace */
>   #define KVM_ARCH_FLAG_EXIT_SEA				11
> +	/* Partitioned PMU Enabled */
> +#define KVM_ARCH_FLAG_PARTITION_PMU_ENABLED		12
>   	unsigned long flags;
>   
>   	/* VM-wide vCPU feature set */
> diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
> index a792a599b9d68..3e0b7619f781d 100644
> --- a/arch/arm64/include/uapi/asm/kvm.h
> +++ b/arch/arm64/include/uapi/asm/kvm.h
> @@ -436,6 +436,8 @@ enum {
>   #define   KVM_ARM_VCPU_PMU_V3_FILTER		2
>   #define   KVM_ARM_VCPU_PMU_V3_SET_PMU		3
>   #define   KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS	4
> +#define   KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION	5
> +
>   #define KVM_ARM_VCPU_TIMER_CTRL		1
>   #define   KVM_ARM_VCPU_TIMER_IRQ_VTIMER		0
>   #define   KVM_ARM_VCPU_TIMER_IRQ_PTIMER		1
> diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
> index 6ebb59d2aa0e7..1dbf50b8891f6 100644
> --- a/arch/arm64/kvm/pmu-direct.c
> +++ b/arch/arm64/kvm/pmu-direct.c
> @@ -44,8 +44,8 @@ bool kvm_pmu_is_partitioned(struct arm_pmu *pmu)
>   }
>   
>   /**
> - * kvm_vcpu_pmu_is_partitioned() - Determine if given VCPU has a partitioned PMU
> - * @vcpu: Pointer to kvm_vcpu struct
> + * kvm_pmu_is_partitioned() - Determine if given VCPU has a partitioned PMU
> + * @kvm: Pointer to kvm_vcpu struct
>    *
>    * Determine if given VCPU has a partitioned PMU by extracting that
>    * field and passing it to :c:func:`kvm_pmu_is_partitioned`
> @@ -55,7 +55,36 @@ bool kvm_pmu_is_partitioned(struct arm_pmu *pmu)
>   bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu)
>   {
>   	return kvm_pmu_is_partitioned(vcpu->kvm->arch.arm_pmu) &&
> -		false;
> +		test_bit(KVM_ARCH_FLAG_PARTITION_PMU_ENABLED, &vcpu->kvm->arch.flags);
> +}
> +
> +/**
> + * has_kvm_pmu_partition_support() - If we can enable/disable partition
> + *
> + * Return: true if allowed, false otherwise.
> + */
> +bool has_kvm_pmu_partition_support(void)
> +{
> +	return has_host_pmu_partition_support() &&
> +		kvm_supports_guest_pmuv3() &&
> +		armv8pmu_max_guest_counters > -1;
> +}
> +
> +/**
> + * kvm_pmu_partition_enable() - Enable/disable partition flag
> + * @kvm: Pointer to vcpu
> + * @enable: Whether to enable or disable
> + *
> + * If we want to enable the partition, the guest is free to grab
> + * hardware by accessing PMU registers. Otherwise, the host maintains
> + * control.
> + */
> +void kvm_pmu_partition_enable(struct kvm *kvm, bool enable)
> +{
> +	if (enable)
> +		set_bit(KVM_ARCH_FLAG_PARTITION_PMU_ENABLED, &kvm->arch.flags);
> +	else
> +		clear_bit(KVM_ARCH_FLAG_PARTITION_PMU_ENABLED, &kvm->arch.flags);
>   }
>   
>   /**
> diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
> index 72d5b7cb3d93e..cdf51f24fdaf3 100644
> --- a/arch/arm64/kvm/pmu.c
> +++ b/arch/arm64/kvm/pmu.c
> @@ -759,6 +759,19 @@ int kvm_arm_pmu_v3_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
>   
>   		return kvm_arm_pmu_v3_set_nr_counters(vcpu, n);
>   	}
> +	case KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION: {
> +		unsigned int __user *uaddr = (unsigned int __user *)(long)attr->addr;
> +		bool enable;
> +
> +		if (get_user(enable, uaddr))
> +			return -EFAULT;
> +
> +		if (!has_kvm_pmu_partition_support())
> +			return -EPERM;
> +
> +		kvm_pmu_partition_enable(kvm, enable);
> +		return 0;
> +	}
>   	case KVM_ARM_VCPU_PMU_V3_INIT:
>   		return kvm_arm_pmu_v3_init(vcpu);
>   	}
> @@ -798,6 +811,7 @@ int kvm_arm_pmu_v3_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
>   	case KVM_ARM_VCPU_PMU_V3_FILTER:
>   	case KVM_ARM_VCPU_PMU_V3_SET_PMU:
>   	case KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS:
> +	case KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION:
>   		if (kvm_vcpu_has_pmu(vcpu))
>   			return 0;
>   	}
> diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
> index 93586691a2790..ff898370fa63f 100644
> --- a/include/kvm/arm_pmu.h
> +++ b/include/kvm/arm_pmu.h
> @@ -109,6 +109,8 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu);
>   void kvm_pmu_put(struct kvm_vcpu *vcpu);
>   
>   void kvm_pmu_set_physical_access(struct kvm_vcpu *vcpu);
> +bool has_kvm_pmu_partition_support(void);
> +void kvm_pmu_partition_enable(struct kvm *kvm, bool enable);
>   
>   #if !defined(__KVM_NVHE_HYPERVISOR__)
>   bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu);
> @@ -311,6 +313,13 @@ static inline void kvm_pmu_host_counters_enable(void) {}
>   static inline void kvm_pmu_host_counters_disable(void) {}
>   static inline void kvm_pmu_handle_guest_irq(struct arm_pmu *pmu, u64 pmovsr) {}
>   
> +static inline bool has_kvm_pmu_partition_support(void)
> +{
> +	return false;
> +}
> +
> +static inline void kvm_pmu_partition_enable(struct kvm *kvm, bool enable) {}
> +
>   #endif
>   
>   #endif


