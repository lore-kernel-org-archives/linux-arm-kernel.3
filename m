Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4B9CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 16:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=vOSSQNbTKfOf2TGLzCUkqwpB1cEjCNpCYDqaTZDjYhU=; b=RKk4H87Y41pKKU
	shHfqmJdHRjUub55iA92UmVXTpSCby9sOs9cjUMK2dnCQD+kXxP258nYSBjeOwYmOnWvtKEt+xwuM
	7oczEc8/Prtoz87Zb9hndb/aVnTGPZ5osmGnPhHLLcoI456ydjrn0xnqhlcvjX9BjwBjusQ0AWyt1
	U5NHYCAd1s2cetKxnd+RiYu7vUoU7/C4pyVXB989dNvprif+bmXqk4nL2PvcJrjELoV1ZFIR9joV3
	0lWfdYjk7Bfgv6n7xAmm8I4AeVXqFPXeRvdvb2w39qHjmPj5pRp31zDbqbfMA0y6rLaKLKJQ6qBAQ
	wrZrZX052XUka3xV4m9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCc6-00000003EYo-1cff;
	Wed, 13 May 2026 16:39:14 +0000
Received: from mail-oo1-xc49.google.com ([2607:f8b0:4864:20::c49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCc4-00000003EYN-2Ryf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 16:39:13 +0000
Received: by mail-oo1-xc49.google.com with SMTP id 006d021491bc7-69b4f753046so6984729eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 09:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778690351; x=1779295151; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vOSSQNbTKfOf2TGLzCUkqwpB1cEjCNpCYDqaTZDjYhU=;
        b=KCyZ1Tf7TitoSM9mG2XUgYsidhKKNRUQr9I05ssvs5crsjBPpU+C3497c/yDIU4mbz
         NH+hqPgnC7ApqZ6CPZSplaEY6PqEovJiOyb4bFcVgHy6Rr0vKRnoj6UZYIdTBb4q80zK
         l46YJrOXhO1quwWORFe1Oa+Fe/SwS8mO6IVXLT6ZRB5+x0jDDyg8M+gCk12U2VRMnCKS
         7EIf4ZSeYPSBXCaAGAnbob2B/mqhobhFPD0PH0ks1bgmrHCICqM9p77v8n0OJ9Zx8/Vr
         iONgGM+yjwWGIYTEUT4/HSFB8K1g4OpMud0rE1zwdMN6gjkK5ECh2k2eBQ637XwUz/tI
         Fyug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778690351; x=1779295151;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vOSSQNbTKfOf2TGLzCUkqwpB1cEjCNpCYDqaTZDjYhU=;
        b=Xgpl3BGJM4s1OCvEuqGUkEkj7wZUOP1VtyK+Xv0TV5mTgwIzQygbZMC7KNjl+xgGXF
         G0jnxXhqIRiWSgqiY4tWuZg9UO041RyzrEE7xKw5BmpMR0hgGjKG9O/IslocWh5A6QLR
         1siTaIEUabZJi78VSOs7AlhwK0yA8Dd1Bkv6SnsKbhLjHzEKhc2sMPPpzOjr4/jgUJFo
         wEQMv/FlYHtsSQAsPNXwI5SxB8RA4GKoM30cc6a4n8IL+lipsXxoKgO1sgAHl8IfrV65
         2y1DSC/rNdvEDxuGzmmhnSsVuccbRh1J7zEehusDIhsZnvnnuse5njo9tl1jE8jePwnC
         ryjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9lBkXfKPNGXLhwOA/1XvFvfSvTT0GInVBJU/liuqCg0UeopTNmxnKPZwGlAsWq31RPC6fb3fpLWgF5c9fqTO0w@lists.infradead.org
X-Gm-Message-State: AOJu0YwYPE7Crlt4l3AYyA+ZqsCIqIBBeom3x7bFbhk+s2ZIU/6g3nmm
	MsS6/9l2prOBvIYxRlFE4h0/C1MZCOqp9nDGsC8Aa7RbmONXYvTrsil3B2ULKcMzVRPznhU51qd
	YtEH8vD8Po1wWLOopFPhMJulEBQ==
X-Received: from jatn7.prod.google.com ([2002:a05:6638:2647:b0:5d1:d9e5:ccbd])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:4c02:b0:69b:56e5:cd6b with SMTP id 006d021491bc7-69b7a9d2905mr1848851eaf.11.1778690350606;
 Wed, 13 May 2026 09:39:10 -0700 (PDT)
Date: Wed, 13 May 2026 16:38:46 +0000
In-Reply-To: <ad02327b-01b6-4ed9-b9bb-e2c6ed4b2890@linaro.org> (message from
 James Clark on Mon, 11 May 2026 15:49:37 +0100)
Mime-Version: 1.0
Message-ID: <gsnt33zvclih.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v7 10/20] KVM: arm64: Context swap Partitioned PMU guest registers
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_093912_630203_E19EDF4C 
X-CRM114-Status: GOOD (  18.58  )
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

> On 04/05/2026 10:18 pm, Colton Lewis wrote:
>> Save and restore newly untrapped registers that can be directly
>> accessed by the guest when the PMU is partitioned.

>> * PMEVCNTRn_EL0
>> * PMCCNTR_EL0
>> * PMSELR_EL0
>> * PMCR_EL0
>> * PMCNTEN_EL0
>> * PMINTEN_EL1

>> If we know we are not partitioned (that is, using the emulated vPMU),
>> then return immediately. A later patch will make this lazy so the
>> context swaps don't happen unless the guest has accessed the PMU.

>> PMEVTYPER is handled in a following patch since we must apply the KVM
>> event filter before writing values to hardware.

>> PMOVS guest counters are cleared to avoid the possibility of
>> generating spurious interrupts when PMINTEN is written. This is fine
>> because the virtual register for PMOVS is always the canonical value.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> ---
>>    arch/arm/include/asm/arm_pmuv3.h |   4 +
>>    arch/arm64/kvm/arm.c             |   2 +
>>    arch/arm64/kvm/pmu-direct.c      | 169 +++++++++++++++++++++++++++++++
>>    include/kvm/arm_pmu.h            |  16 +++
>>    4 files changed, 191 insertions(+)

>> diff --git a/arch/arm/include/asm/arm_pmuv3.h  
>> b/arch/arm/include/asm/arm_pmuv3.h
>> index 42d62aa48d0a6..eebc89bdab7a1 100644
>> --- a/arch/arm/include/asm/arm_pmuv3.h
>> +++ b/arch/arm/include/asm/arm_pmuv3.h
>> @@ -235,6 +235,10 @@ static inline bool kvm_pmu_is_partitioned(struct  
>> arm_pmu *pmu)
>>    {
>>    	return false;
>>    }
>> +static inline u64 kvm_pmu_host_counter_mask(struct arm_pmu *pmu)
>> +{
>> +	return ~0;
>> +}

>>    /* PMU Version in DFR Register */
>>    #define ARMV8_PMU_DFR_VER_NI        0
>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>> index 410ffd41fd73a..a942f2bc13fc4 100644
>> --- a/arch/arm64/kvm/arm.c
>> +++ b/arch/arm64/kvm/arm.c
>> @@ -680,6 +680,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int  
>> cpu)
>>    		kvm_vcpu_load_vhe(vcpu);
>>    	kvm_arch_vcpu_load_fp(vcpu);
>>    	kvm_vcpu_pmu_restore_guest(vcpu);
>> +	kvm_pmu_load(vcpu);
>>    	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
>>    		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);

>> @@ -721,6 +722,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>>    	kvm_timer_vcpu_put(vcpu);
>>    	kvm_vgic_put(vcpu);
>>    	kvm_vcpu_pmu_restore_host(vcpu);
>> +	kvm_pmu_put(vcpu);
>>    	if (vcpu_has_nv(vcpu))
>>    		kvm_vcpu_put_hw_mmu(vcpu);
>>    	kvm_arm_vmid_clear_active();
>> diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
>> index 63ac72910e4b5..360d022d918d5 100644
>> --- a/arch/arm64/kvm/pmu-direct.c
>> +++ b/arch/arm64/kvm/pmu-direct.c
>> @@ -9,6 +9,7 @@
>>    #include <linux/perf/arm_pmuv3.h>

>>    #include <asm/arm_pmuv3.h>
>> +#include <asm/kvm_emulate.h>

>>    /**
>>     * has_host_pmu_partition_support() - Determine if partitioning is  
>> possible
>> @@ -98,3 +99,171 @@ u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)

>>    	return *host_data_ptr(nr_event_counters);
>>    }
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
>> +	if (kvm_pmu_is_partitioned(pmu))
>> +		return GENMASK(nr_counters - 1, pmu->max_guest_counters);
>> +
>> +	return ARMV8_PMU_CNT_MASK_ALL;
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
>> +	if (kvm_pmu_is_partitioned(pmu))
>> +		return ARMV8_PMU_CNT_MASK_C | GENMASK(pmu->max_guest_counters - 1, 0);
>> +
>> +	return 0;
>> +}

> Minor nit: slightly inconsistent use of types. Returns a u64 but doesn't
> use GENMASK_ULL and is also usually saved into a long when it's called.

Will fix

