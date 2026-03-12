Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0413B106ACF1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 22:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Ze4zxD1+bgXLnmCcgE7F5EkAVz6+P8Y6KbhF09qoxxs=; b=G0buFilv5cJ31y
	gR/otYvfsTh8w7LTJRFM+FCsQ64rOt4QsmHdiJdWbqL8ei/4ORF7DWppBfybTb8x/jawJut9lDwyi
	+8HHcMyPePETaQ6+QUieaTVw7TdnLi3BLcH/iot5UcvvQlffJnkfM6hcV4FpkjNPOANCybZQiFScg
	XQwhfcRWLLxOOPD2722cUFcbZpGAzI1Ui8RtQpES6QDEJdXt3DJ/ir0SqlaLMHan4lDgpJ+hlrg3u
	LGWtpZQCP6yRTpaESH3LJfKmZevQefK00UxWYH3so+taSwUiv0x0ochCgWTtCamAOLtoycSsGUmns
	DwYW6D/BS51yE+Q1XHJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ogq-0000000FfVU-11BB;
	Thu, 12 Mar 2026 22:39:36 +0000
Received: from mail-oa1-x4a.google.com ([2001:4860:4864:20::4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ogn-0000000FfUW-0tAJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 22:39:34 +0000
Received: by mail-oa1-x4a.google.com with SMTP id 586e51a60fabf-415e1e9aa5dso14171001fac.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 15:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773355172; x=1773959972; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ze4zxD1+bgXLnmCcgE7F5EkAVz6+P8Y6KbhF09qoxxs=;
        b=hcFkpjiC90oTyR3gF+heS895tsBloVFv+RM2tad0S/w1EbFAXXYA1k9xe5ZtCOcqHc
         HeZjS5mKoR4de2ddMvzhzfEbHtS5hOL7RDqm9oWdM871Xr+YcKeYAfcwXmMtJnMYSuUi
         zNj8cEWNBzKj7DfbydFzlr7xLNQRfFwYFsuU1h5TE+bv4QIiRJE473oR+/CwoizNdPld
         NddPBWMe34pguDWiKDJckj5KGF1csNeEafvOgYPUCbzebUG3Y+Cse5G8IhHJl0dxQVcS
         5ouC8BJ+CBfqcAPQd6EAfzthrD03OE1VEXvhOj3mZ9dBiXQeUKx3VOMA9OYDXbfYpavA
         TyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773355172; x=1773959972;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ze4zxD1+bgXLnmCcgE7F5EkAVz6+P8Y6KbhF09qoxxs=;
        b=luNUa764kX8yZv0MCQtSmeyXPKFK7eM73wOpWhRRxlJtBnu9dS3kBH+GjcpATZAWag
         f6nCQPGrQG759YbOP7apfUCcLmmn4uIy3oTzXmCUdwVRXvNB38PxXqlb8ODuUkoKlBYG
         mUWw1A+vwehLtHufh4UVEe1H9Mx3gW08JAkXJ8LJNNYJHrXKelFpcHGXFmqjge0jXgWL
         gqHkHWTLz09QcBE1Xv2ZxaLQxR3xnGQDAwaJbKnVATvDYO5EJqDZep0jjklfpiAHLL80
         Yp7rNlC/2bsCC4+GCRIimOQcjvU9u1Ut8wWMqjJ0ym/1pubfHxpZyN51xbDKt+Xmf1hE
         1pfg==
X-Forwarded-Encrypted: i=1; AJvYcCWwdGzCS8qWvlMcssTEJG/REOVcCMs2JwklbrgrwI59oCINKZ+cTf4xqIF6d+aFeQLRHRVLSPWkiVVkZP+iARh7@lists.infradead.org
X-Gm-Message-State: AOJu0YyJK5LVF1L9/PDLcoVZY3dbVBjWwXTQHelH5EyaXKInN+NX34jO
	44UfXKyKSxVo8l5twiTpVpWTwLqb9QtSZTRJ8c23glICXDMZuvkMlCSHrXBSPdstTR66wm2lPmv
	LWIBLa0J1MBMZ/rcqg6wnuVlWvQ==
X-Received: from iobdo19.prod.google.com ([2002:a05:6602:4613:b0:95a:608d:8cf8])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:210b:b0:674:911:98fa with SMTP id 006d021491bc7-67bdaa85b4dmr742343eaf.64.1773355171523;
 Thu, 12 Mar 2026 15:39:31 -0700 (PDT)
Date: Thu, 12 Mar 2026 22:39:30 +0000
In-Reply-To: <68a93eb5-24df-4b73-bd1e-798dc32b7e86@linaro.org> (message from
 James Clark on Wed, 11 Mar 2026 12:01:26 +0000)
Mime-Version: 1.0
Message-ID: <gsntbjgsoeot.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v6 11/19] KVM: arm64: Context swap Partitioned PMU guest registers
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
X-CRM114-CacheID: sfid-20260312_153933_259122_7B6CD8E6 
X-CRM114-Status: GOOD (  22.79  )
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
>>    arch/arm64/kvm/arm.c        |   2 +
>>    arch/arm64/kvm/pmu-direct.c | 123 ++++++++++++++++++++++++++++++++++++
>>    include/kvm/arm_pmu.h       |   4 ++
>>    3 files changed, 129 insertions(+)

>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>> index 620a465248d1b..adbe79264c032 100644
>> --- a/arch/arm64/kvm/arm.c
>> +++ b/arch/arm64/kvm/arm.c
>> @@ -635,6 +635,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int  
>> cpu)
>>    		kvm_vcpu_load_vhe(vcpu);
>>    	kvm_arch_vcpu_load_fp(vcpu);
>>    	kvm_vcpu_pmu_restore_guest(vcpu);
>> +	kvm_pmu_load(vcpu);
>>    	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
>>    		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);

>> @@ -676,6 +677,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>>    	kvm_timer_vcpu_put(vcpu);
>>    	kvm_vgic_put(vcpu);
>>    	kvm_vcpu_pmu_restore_host(vcpu);
>> +	kvm_pmu_put(vcpu);
>>    	if (vcpu_has_nv(vcpu))
>>    		kvm_vcpu_put_hw_mmu(vcpu);
>>    	kvm_arm_vmid_clear_active();
>> diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
>> index f2e6b1eea8bd6..b07b521543478 100644
>> --- a/arch/arm64/kvm/pmu-direct.c
>> +++ b/arch/arm64/kvm/pmu-direct.c
>> @@ -9,6 +9,7 @@
>>    #include <linux/perf/arm_pmuv3.h>

>>    #include <asm/arm_pmuv3.h>
>> +#include <asm/kvm_emulate.h>

>>    /**
>>     * has_host_pmu_partition_support() - Determine if partitioning is  
>> possible
>> @@ -163,3 +164,125 @@ u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)

>>    	return *host_data_ptr(nr_event_counters);
>>    }
>> +
>> +/**
>> + * kvm_pmu_load() - Load untrapped PMU registers
>> + * @vcpu: Pointer to struct kvm_vcpu
>> + *
>> + * Load all untrapped PMU registers from the VCPU into the PCPU. Mask
>> + * to only bits belonging to guest-reserved counters and leave
>> + * host-reserved counters alone in bitmask registers.
>> + */
>> +void kvm_pmu_load(struct kvm_vcpu *vcpu)
>> +{
>> +	struct arm_pmu *pmu;
>> +	unsigned long guest_counters;
>> +	u64 mask;
>> +	u8 i;
>> +	u64 val;
>> +
>> +	/*
>> +	 * If we aren't guest-owned then we know the guest isn't using
>> +	 * the PMU anyway, so no need to bother with the swap.
>> +	 */
>> +	if (!kvm_vcpu_pmu_is_partitioned(vcpu))
>> +		return;
>> +
>> +	preempt_disable();
>> +
>> +	pmu = vcpu->kvm->arch.arm_pmu;
>> +	guest_counters = kvm_pmu_guest_counter_mask(pmu);
>> +
>> +	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
>> +		val = __vcpu_sys_reg(vcpu, PMEVCNTR0_EL0 + i);
>> +
>> +		write_sysreg(i, pmselr_el0);
>> +		write_sysreg(val, pmxevcntr_el0);

> This needs to have a special case for ARMV8_PMU_CYCLE_IDX because you
> can't use pmxevcntr_el0 to read or write PMCCNTR_EL0:

> D24.5.22:

>     SEL 0b11111      Select the cycle counter, PMCCNTR_EL0:

>                      MRS and MSR of PMXEVCNTR_EL0 are CONSTRAINED
>                      UNPREDICTABLE.

> There are 3 separate instances of the same thing in the patches. I was
> getting undefined instruction errors on my Radxa O6 board until they
> were all fixed.

Looks like it. I had a special case on a previous iteration but someone
suggested I could get rid of it by iterating the mask.

I missed that the cycle counter was CONSTRAINED UNPREDICTABLE.

