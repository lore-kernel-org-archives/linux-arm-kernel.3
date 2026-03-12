Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518F0106ACEE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 22:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=OmFUz1YB2HW5cy4NJX5lfbdXHnPjDlIYv+BsMbwLiSY=; b=A6IKtkfHybzCkX
	T6SZyNyZDgJcPTbRBXodgd6XteLeyOjXIhZPvyI9iMRgbl6viWNUsCFCyo1G7yn6y7n2xKzlTQr8q
	etTBrdr+uOuUhXOuNAl6nFLz9u1RUrh2V6QAhFSxDL+cVwrZfbdpzboO5OurPkXPvF6KxYdLNxDCh
	2DVHwsA17mDSvkkFjeTkTX17a5LYEwK0MhiuiY+jsUrtkYCpk9Aqs3+0RjV5QPaq3GRTUf/1ENdWT
	zhBaJ+LTDbYH1axxGnm7itYDiBI70MPHFTlnfZADXE/VBgKldWJzT9k0BCMiYJmbpD30PVOzdKKzb
	UMnVzZpqiSIjv0CgvCOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0oHq-0000000FbZ0-1X2v;
	Thu, 12 Mar 2026 22:13:46 +0000
Received: from mail-oa1-x49.google.com ([2001:4860:4864:20::49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0oHn-0000000FbY9-140Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 22:13:44 +0000
Received: by mail-oa1-x49.google.com with SMTP id 586e51a60fabf-4170823763cso12563229fac.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 15:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773353622; x=1773958422; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OmFUz1YB2HW5cy4NJX5lfbdXHnPjDlIYv+BsMbwLiSY=;
        b=KMZXVMaX2oXs+Xt0Sr4oL++6xscWbUhF9xnchnNjl24smJAX20VmIuEaOob6kmSVpn
         pj4kXWaeLDIMSpxWYv+Zj/1o8jrwwWHy/Y3Bzzv6/VyjMGKdgC7KQcfYDq5sPzNAgOV8
         eaYjwo8vk80Wx3LzUaf6oo5D7yRZoE73VdYaU+2sHohCS5EGOUyhrMYusDogOuMs5+Zv
         /cPU6gshcuYZMe62jkyQbn6pfXzNs6iZKonvohjUr4t3LnLJZrVoiFHl2lGr5uSYrcrv
         K7V2Qgm02wQ8XDEi2fZIfW5LhyfsDDDq1L4DfwFAR0i/6cubT3ZGBO8klmcNrQgq1KJn
         J/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773353622; x=1773958422;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OmFUz1YB2HW5cy4NJX5lfbdXHnPjDlIYv+BsMbwLiSY=;
        b=QLiyeMtqWQCE3GUtdDS9WXDGOCd/JxxZUz0yKQcdA30sgdy72FRsa8U1H6/7jmebB7
         xoee/+KT78zxe2BtpzTIYlp6A1i3H/wO7SHZ5XW5WMgRaO/uvHajbmxFZov6lLLy8CD4
         KRCNYplm9j0M0kd6L8zmZd1IZoRrovXivyP3Yff5vnERRSMViMgUzRwpMgfvx8Lok9td
         vFCSGbOcrYAJIkVs597sgNOjdcreAK2wjYP30xRNiX4s02qHIIDZG49fhPVHxTKwAmyW
         Igek3+BOXP8y/Xx+LVvXeiPb7ywIECc0R9dlhXORvcrHC7epbnMjZN5s058kSjtnsS0M
         eTfg==
X-Forwarded-Encrypted: i=1; AJvYcCU1IavvHKjlyD+SCHWiWR2yRi3mI8Z4qelNCc6ukEZ+l3Auft9GOd2gGYPzhUv+/fwQ5ryic1vU1h1HUAzlUsPS@lists.infradead.org
X-Gm-Message-State: AOJu0Ywcdfbk0xioz3HEMEqj+9AHSRcqD+iTZjUa+PpyuO/HK/5GrqTV
	fMKkakhFnA++4bSxSxkamkHRBCjdFmBmH6+eRSs/sgmow4h0K4izVtD/HFcNz9icY8BHNlDFRWp
	NBbe16RU5riSWZ48Iehb/Xb6w0Q==
X-Received: from oacsd12.prod.google.com ([2002:a05:6871:5e8c:b0:417:8286:3260])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6871:d211:b0:409:bd2b:91a3 with SMTP id 586e51a60fabf-417b939f2d9mr605460fac.32.1773353621508;
 Thu, 12 Mar 2026 15:13:41 -0700 (PDT)
Date: Thu, 12 Mar 2026 22:13:40 +0000
In-Reply-To: <819fa670-f6f6-4251-a528-6d8264451b9f@linaro.org> (message from
 James Clark on Thu, 5 Mar 2026 10:16:34 +0000)
Mime-Version: 1.0
Message-ID: <gsntms0cofvv.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v6 16/19] KVM: arm64: Add vCPU device attr to partition
 the PMU
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_151343_313314_29A176F9 
X-CRM114-Status: GOOD (  30.50  )
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

Thanks James for the review.

James Clark <james.clark@linaro.org> writes:

> On 09/02/2026 10:14 pm, Colton Lewis wrote:
>> Add a new PMU device attr to enable the partitioned PMU for a given
>> VM. This capability can be set when the PMU is initially configured
>> before the vCPU starts running and is allowed where PMUv3 and VHE are
>> supported and the host driver was configured with
>> arm_pmuv3.reserved_host_counters.

>> The enabled capability is tracked by the new flag
>> KVM_ARCH_FLAG_PARTITIONED_PMU_ENABLED.

> Typo, should be: KVM_ARCH_FLAG_PARTITION_PMU_ENABLED. Or maybe the
> #define should be fixed.

Stale commit message. I will fix.


> I couldn't see if this was discussed before, but what's the reason to
> not use the guest partition by default and make this flag control
> reverting back to use the non passed through PMU?

> Seems like if you already have to enable it by creating a partition on
> the host, then you more than likely want your guests to use it. And it's
> lower overhead so it's "better". Right now it's two things that you have
> to set at the same time to do one thing.

> Or does having to set it on the host go away with the dynamic approach
> here [1]?

Yes, the plan is to have it go away on the host with a dynamic approach.


> [1]: https://lore.kernel.org/kvmarm/aWjlfl85vSd6sMwT@willie-the-truck/


>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> ---
>>    arch/arm64/include/asm/kvm_host.h |  2 ++
>>    arch/arm64/include/uapi/asm/kvm.h |  2 ++
>>    arch/arm64/kvm/pmu-direct.c       | 35 ++++++++++++++++++++++++++++---
>>    arch/arm64/kvm/pmu.c              | 14 +++++++++++++
>>    include/kvm/arm_pmu.h             |  9 ++++++++
>>    5 files changed, 59 insertions(+), 3 deletions(-)

>> diff --git a/arch/arm64/include/asm/kvm_host.h  
>> b/arch/arm64/include/asm/kvm_host.h
>> index 41577ede0254f..f0b0a5edc7252 100644
>> --- a/arch/arm64/include/asm/kvm_host.h
>> +++ b/arch/arm64/include/asm/kvm_host.h
>> @@ -353,6 +353,8 @@ struct kvm_arch {
>>    #define KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS		10
>>    	/* Unhandled SEAs are taken to userspace */
>>    #define KVM_ARCH_FLAG_EXIT_SEA				11
>> +	/* Partitioned PMU Enabled */
>> +#define KVM_ARCH_FLAG_PARTITION_PMU_ENABLED		12
>>    	unsigned long flags;

>>    	/* VM-wide vCPU feature set */
>> diff --git a/arch/arm64/include/uapi/asm/kvm.h  
>> b/arch/arm64/include/uapi/asm/kvm.h
>> index a792a599b9d68..3e0b7619f781d 100644
>> --- a/arch/arm64/include/uapi/asm/kvm.h
>> +++ b/arch/arm64/include/uapi/asm/kvm.h
>> @@ -436,6 +436,8 @@ enum {
>>    #define   KVM_ARM_VCPU_PMU_V3_FILTER		2
>>    #define   KVM_ARM_VCPU_PMU_V3_SET_PMU		3
>>    #define   KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS	4
>> +#define   KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION	5
>> +
>>    #define KVM_ARM_VCPU_TIMER_CTRL		1
>>    #define   KVM_ARM_VCPU_TIMER_IRQ_VTIMER		0
>>    #define   KVM_ARM_VCPU_TIMER_IRQ_PTIMER		1
>> diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
>> index 6ebb59d2aa0e7..1dbf50b8891f6 100644
>> --- a/arch/arm64/kvm/pmu-direct.c
>> +++ b/arch/arm64/kvm/pmu-direct.c
>> @@ -44,8 +44,8 @@ bool kvm_pmu_is_partitioned(struct arm_pmu *pmu)
>>    }

>>    /**
>> - * kvm_vcpu_pmu_is_partitioned() - Determine if given VCPU has a  
>> partitioned PMU
>> - * @vcpu: Pointer to kvm_vcpu struct
>> + * kvm_pmu_is_partitioned() - Determine if given VCPU has a partitioned  
>> PMU
>> + * @kvm: Pointer to kvm_vcpu struct
>>     *
>>     * Determine if given VCPU has a partitioned PMU by extracting that
>>     * field and passing it to :c:func:`kvm_pmu_is_partitioned`
>> @@ -55,7 +55,36 @@ bool kvm_pmu_is_partitioned(struct arm_pmu *pmu)
>>    bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu)
>>    {
>>    	return kvm_pmu_is_partitioned(vcpu->kvm->arch.arm_pmu) &&
>> -		false;
>> +		test_bit(KVM_ARCH_FLAG_PARTITION_PMU_ENABLED, &vcpu->kvm->arch.flags);
>> +}
>> +
>> +/**
>> + * has_kvm_pmu_partition_support() - If we can enable/disable partition
>> + *
>> + * Return: true if allowed, false otherwise.
>> + */
>> +bool has_kvm_pmu_partition_support(void)
>> +{
>> +	return has_host_pmu_partition_support() &&
>> +		kvm_supports_guest_pmuv3() &&
>> +		armv8pmu_max_guest_counters > -1;
>> +}
>> +
>> +/**
>> + * kvm_pmu_partition_enable() - Enable/disable partition flag
>> + * @kvm: Pointer to vcpu
>> + * @enable: Whether to enable or disable
>> + *
>> + * If we want to enable the partition, the guest is free to grab
>> + * hardware by accessing PMU registers. Otherwise, the host maintains
>> + * control.
>> + */
>> +void kvm_pmu_partition_enable(struct kvm *kvm, bool enable)
>> +{
>> +	if (enable)
>> +		set_bit(KVM_ARCH_FLAG_PARTITION_PMU_ENABLED, &kvm->arch.flags);
>> +	else
>> +		clear_bit(KVM_ARCH_FLAG_PARTITION_PMU_ENABLED, &kvm->arch.flags);
>>    }

>>    /**
>> diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
>> index 72d5b7cb3d93e..cdf51f24fdaf3 100644
>> --- a/arch/arm64/kvm/pmu.c
>> +++ b/arch/arm64/kvm/pmu.c
>> @@ -759,6 +759,19 @@ int kvm_arm_pmu_v3_set_attr(struct kvm_vcpu *vcpu,  
>> struct kvm_device_attr *attr)

>>    		return kvm_arm_pmu_v3_set_nr_counters(vcpu, n);
>>    	}
>> +	case KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION: {
>> +		unsigned int __user *uaddr = (unsigned int __user *)(long)attr->addr;
>> +		bool enable;
>> +
>> +		if (get_user(enable, uaddr))
>> +			return -EFAULT;
>> +
>> +		if (!has_kvm_pmu_partition_support())
>> +			return -EPERM;
>> +
>> +		kvm_pmu_partition_enable(kvm, enable);
>> +		return 0;
>> +	}
>>    	case KVM_ARM_VCPU_PMU_V3_INIT:
>>    		return kvm_arm_pmu_v3_init(vcpu);
>>    	}
>> @@ -798,6 +811,7 @@ int kvm_arm_pmu_v3_has_attr(struct kvm_vcpu *vcpu,  
>> struct kvm_device_attr *attr)
>>    	case KVM_ARM_VCPU_PMU_V3_FILTER:
>>    	case KVM_ARM_VCPU_PMU_V3_SET_PMU:
>>    	case KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS:
>> +	case KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION:
>>    		if (kvm_vcpu_has_pmu(vcpu))
>>    			return 0;
>>    	}
>> diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
>> index 93586691a2790..ff898370fa63f 100644
>> --- a/include/kvm/arm_pmu.h
>> +++ b/include/kvm/arm_pmu.h
>> @@ -109,6 +109,8 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu);
>>    void kvm_pmu_put(struct kvm_vcpu *vcpu);

>>    void kvm_pmu_set_physical_access(struct kvm_vcpu *vcpu);
>> +bool has_kvm_pmu_partition_support(void);
>> +void kvm_pmu_partition_enable(struct kvm *kvm, bool enable);

>>    #if !defined(__KVM_NVHE_HYPERVISOR__)
>>    bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu);
>> @@ -311,6 +313,13 @@ static inline void  
>> kvm_pmu_host_counters_enable(void) {}
>>    static inline void kvm_pmu_host_counters_disable(void) {}
>>    static inline void kvm_pmu_handle_guest_irq(struct arm_pmu *pmu, u64  
>> pmovsr) {}

>> +static inline bool has_kvm_pmu_partition_support(void)
>> +{
>> +	return false;
>> +}
>> +
>> +static inline void kvm_pmu_partition_enable(struct kvm *kvm, bool  
>> enable) {}
>> +
>>    #endif

>>    #endif

