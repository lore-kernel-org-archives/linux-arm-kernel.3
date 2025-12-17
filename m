Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41ACAD65C63
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 23:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=aRTGpXalCpTw9EJ3jwwqmWQTyjHYa0HLkPGjExiFjCQ=; b=5Aunu2l15bz5QO
	ObB6rkyPlnDLEi68yHchO/AuxH6solLO8lcs6YAZa3CFnQOQX3jocgsF5clYxvlN6S6Km4XcFdEUm
	2nC8U5dftBHpbVDkiuz8XBzpsNNNJhuaEEohIVJvq/sL9hU6GF+OIxl+qHp9b7m1gNYMA0ZVBNnvn
	JlG7YwejGz72hG1UrB8hVqMyrR+6LEHQvQnmdPVC6U0+6PpHGpyS0NpR9kzWkQ8IRzhep7Fq+R0t7
	WCMApyKWeE6pQ8JPSj/kT/mNzGqEy6nUmqhsp7wXLjs5lVZMfljmjjyYLYC8KiQ20Nd3V/76bBgeN
	/vC12a+t2tlVubKyXrLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW0Yc-00000007VQI-33ow;
	Wed, 17 Dec 2025 23:03:46 +0000
Received: from mail-ot1-x349.google.com ([2607:f8b0:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW0Ya-00000007VPq-0pD4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 23:03:45 +0000
Received: by mail-ot1-x349.google.com with SMTP id 46e09a7af769-7c75b4d04acso12790965a34.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 15:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766012622; x=1766617422; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aRTGpXalCpTw9EJ3jwwqmWQTyjHYa0HLkPGjExiFjCQ=;
        b=Yg7FXhsqLx2a+tb8SDUbVLlKQZCdQtdoLML8vQuvP5CEwLM2nXG8IRTBWd4fwEyoO5
         jBcWTbj1hiE5sMIBVjsfexyNFo9/998zyyP0kRMlsuPIr91ciH+ogukNf7Nf0hQ4VAHB
         yVHV85VHqjhG1nq+u9FbWeTcPsLRzeOc/npbSn904WPW4ZwWkp2iL2G2lZ+FXSjxlvD3
         pkL6ctqbnNSWL63LqZ5WNPnqf72da6iXBWFShByNxazqSw1WgB0dmLajZrVfADVWTGlZ
         ROwkir9fErKThcEfVFOGiyN1WSOuRsWWV0cTgK0ShUfjhlns7bTdLJyrcFatlpnxkWvJ
         A1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766012622; x=1766617422;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aRTGpXalCpTw9EJ3jwwqmWQTyjHYa0HLkPGjExiFjCQ=;
        b=wdlrgn3ybilmCH9mhP50iOI3rIvl6jDwcDLgKBwoR6reabMKo/Wq4VkGg5sJV0VO2/
         0a/sWfF5XO4fJXKPIkxaigsxs2ikDhStlXy+8Zvk7UZhlXhit7wdkP+s8AR2qZLrHBSf
         N3iDTsDfaF3AY3trgdEnwBxOeT+Fjq4QwLX9vYEoPDQEbOcrTE4El5FOiMJtG4bsCyq3
         uYBxAXW6k+YR1wGM4glS+ucMf696TlxdTnnvLwiDKxrIEk7PyEDw0hWsFxehsucVfxpl
         hiMSlXfuhlE8zU1gPFyrNVXZ3nbIuMNXohfFNAr069qunaZ6KCs9VPIP3/qoNP9Eaa1x
         OZgA==
X-Forwarded-Encrypted: i=1; AJvYcCX3EKjzWUhaPk5Cp9Htkk2Jyp1+cExGCQcOQlggezhMFZy4y2A2ZPSwkSzTe7A7qMDbolpXOui0J0NpPRVXHcIa@lists.infradead.org
X-Gm-Message-State: AOJu0YwhEsdAdmoL9bKxUb5ybM6m3XJkCuKKlH22i7Lo+KVUA2rPcv1u
	63l2Wcp8n/V3R5Bsuqn6IL6IUqvGM6iFc/E8PR9ciRqwsS6OXJccYEjpJ1fTxW4dV/OdaeZ7BjX
	l4lIS3UhDd1AYxFOjiRKFzYnXHw==
X-Google-Smtp-Source: AGHT+IFQs5k1bWdHtz7tc4/8DEUyRxbCe8MSuSfyN2BvguDIeAIIerMywbvjRsitUO6G8RkTOEE+yjjKcwPQBwUtTA==
X-Received: from jaii7.prod.google.com ([2002:a05:6638:4007:b0:5c6:3249:f8ff])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:2915:b0:659:9a49:8fb7 with SMTP id 006d021491bc7-65b452574dfmr8508202eaf.48.1766012622152;
 Wed, 17 Dec 2025 15:03:42 -0800 (PST)
Date: Wed, 17 Dec 2025 23:03:41 +0000
In-Reply-To: <aUH7oC41XaEMsXf_@kernel.org> (message from Oliver Upton on Tue,
 16 Dec 2025 16:38:56 -0800)
Mime-Version: 1.0
Message-ID: <gsnt34583e42.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v5 14/24] KVM: arm64: Write fast path PMU register handlers
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oupton@kernel.org>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_150344_287123_B0AB127E 
X-CRM114-Status: GOOD (  22.97  )
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

Oliver Upton <oupton@kernel.org> writes:

> On Tue, Dec 09, 2025 at 08:51:11PM +0000, Colton Lewis wrote:
>> diff --git a/arch/arm64/include/asm/arm_pmuv3.h  
>> b/arch/arm64/include/asm/arm_pmuv3.h
>> index 3e25c0313263c..41ec6730ebc62 100644
>> --- a/arch/arm64/include/asm/arm_pmuv3.h
>> +++ b/arch/arm64/include/asm/arm_pmuv3.h
>> @@ -39,6 +39,16 @@ static inline unsigned long read_pmevtypern(int n)
>>   	return 0;
>>   }

>> +static inline void write_pmxevcntr(u64 val)
>> +{
>> +	write_sysreg(val, pmxevcntr_el0);
>> +}
>> +
>> +static inline u64 read_pmxevcntr(void)
>> +{
>> +	return read_sysreg(pmxevcntr_el0);
>> +}
>> +
>>   static inline unsigned long read_pmmir(void)
>>   {
>>   	return read_cpuid(PMMIR_EL1);
>> @@ -105,21 +115,41 @@ static inline void write_pmcntenset(u64 val)
>>   	write_sysreg(val, pmcntenset_el0);
>>   }

>> +static inline u64 read_pmcntenset(void)
>> +{
>> +	return read_sysreg(pmcntenset_el0);
>> +}
>> +
>>   static inline void write_pmcntenclr(u64 val)
>>   {
>>   	write_sysreg(val, pmcntenclr_el0);
>>   }

>> +static inline u64 read_pmcntenclr(void)
>> +{
>> +	return read_sysreg(pmcntenclr_el0);
>> +}
>> +
>>   static inline void write_pmintenset(u64 val)
>>   {
>>   	write_sysreg(val, pmintenset_el1);
>>   }

>> +static inline u64 read_pmintenset(void)
>> +{
>> +	return read_sysreg(pmintenset_el1);
>> +}
>> +
>>   static inline void write_pmintenclr(u64 val)
>>   {
>>   	write_sysreg(val, pmintenclr_el1);
>>   }

>> +static inline u64 read_pmintenclr(void)
>> +{
>> +	return read_sysreg(pmintenclr_el1);
>> +}
>> +
>>   static inline void write_pmccfiltr(u64 val)
>>   {
>>   	write_sysreg(val, pmccfiltr_el0);
>> @@ -160,11 +190,16 @@ static inline u64 read_pmovsclr(void)
>>   	return read_sysreg(pmovsclr_el0);
>>   }

>> -static inline void write_pmuserenr(u32 val)
>> +static inline void write_pmuserenr(u64 val)
>>   {
>>   	write_sysreg(val, pmuserenr_el0);
>>   }

>> +static inline u64 read_pmuserenr(void)
>> +{
>> +	return read_sysreg(pmuserenr_el0);
>> +}
>> +
>>   static inline void write_pmuacr(u64 val)
>>   {
>>   	write_sysreg_s(val, SYS_PMUACR_EL1);

> I wouldn't bother with adding accessors to the PMUv3 driver header, this
> gets a bit confusing when the 32-bit counterpart lacks matching  
> definitions.
> Additionally, the part of KVM you're modifying is very much an
> "internal" part meant to run in a not-quite-kernel context.

> Considering this, I'd prefer KVM directly accessed the PMU registers to
> avoid the possibility of taking some instrumented codepath in the
> future.

Will do.

>> +	if (!kvm_vcpu_pmu_is_partitioned(vcpu)
>> +	    || pmu_access_el0_disabled(vcpu))

> Always put operators on the preceding line for line continuations.

> Also, don't call pmu_access_el0_disabled() from here. It can potentially
> do a full emulated exception entry even though the vCPU is in an
> extremely inconsistent state (i.e. haven't returned to kernel context
> yet). Isn't the current value for PMUSERENR_EL0 on the CPU instead of in
> the vCPU's saved context anyway?

> The fast-path accessors really need to be *just* accessors, reading
> state from the CPU in the unfortunate situation that a TPM trap has been
> forced upon us.

Understood.

>> +	case SYS_PMXEVCNTR_EL0:
>> +		idx = FIELD_GET(PMSELR_EL0_SEL, read_pmselr());
>> +
>> +		if (pmu_access_event_counter_el0_disabled(vcpu))
>> +			return false;
>> +
>> +		if (!pmu_counter_idx_valid(vcpu, idx))
>> +			return false;
>> +
>> +		ret = handle_pmu_reg(vcpu, &p, PMEVCNTR0_EL0 + idx, rt, val,
>> +				     &read_pmxevcntr, &write_pmxevcntr);
>> +		break;

> It is a bit odd to handle the muxing for finding the in-memory value yet
> using the selector-based register for hardware.

Agreed

>> +	case SYS_PMEVCNTRn_EL0(0) ... SYS_PMEVCNTRn_EL0(30):
>> +		idx = ((p.CRm & 3) << 3) | (p.Op2 & 7);
>> +
>> +		if (pmu_access_event_counter_el0_disabled(vcpu))
>> +			return false;
>> +
>> +		if (!pmu_counter_idx_valid(vcpu, idx))
>> +			return false;
>> +
>> +		if (p.is_write) {
>> +			write_pmevcntrn(idx, val);
>> +			__vcpu_assign_sys_reg(vcpu, PMEVCNTR0_EL0 + idx, val);
>> +		} else {
>> +			vcpu_set_reg(vcpu, rt, read_pmevcntrn(idx));
>> +		}
>> +
>> +		ret = true;
>> +		break;

> Can't both of these cases share a helper once you've worked out the
> index? Same for PMEVTYPERn_EL0.

Agreed

>> +	default:
>> +		ret = false;
>> +	}
>> +
>> +	if (ret)
>> +		__kvm_skip_instr(vcpu);
>> +
>> +	return ret;
>> +}
>> +
>>   static inline bool kvm_hyp_handle_sysreg(struct kvm_vcpu *vcpu, u64  
>> *exit_code)
>>   {
>>   	if (cpus_have_final_cap(ARM64_WORKAROUND_CAVIUM_TX2_219_TVM) &&
>> @@ -785,6 +983,9 @@ static inline bool kvm_hyp_handle_sysreg(struct  
>> kvm_vcpu *vcpu, u64 *exit_code)
>>   	if (kvm_handle_cntxct(vcpu))
>>   		return true;

>> +	if (kvm_hyp_handle_pmu_regs(vcpu))
>> +		return true;
>> +

> Since the whole partitioned PMU feature is constrained to VHE-only you
> should call this from kvm_hyp_handle_sysreg_vhe().

Will do.

>> +
>> +bool check_pmu_access_disabled(struct kvm_vcpu *vcpu, u64 flags)
>> +{
>> +	u64 reg = __vcpu_sys_reg(vcpu, PMUSERENR_EL0);
>> +	bool enabled = (reg & flags) || vcpu_mode_priv(vcpu);
>> +
>> +	if (!enabled)
>> +		kvm_inject_undefined(vcpu);
>> +
>> +	return !enabled;
>> +}
>> +
>> +bool pmu_access_el0_disabled(struct kvm_vcpu *vcpu)
>> +{
>> +	return check_pmu_access_disabled(vcpu, ARMV8_PMU_USERENR_EN);
>> +}
>> +
>> +bool pmu_counter_idx_valid(struct kvm_vcpu *vcpu, u64 idx)
>> +{
>> +	u64 pmcr, val;
>> +
>> +	pmcr = kvm_vcpu_read_pmcr(vcpu);
>> +	val = FIELD_GET(ARMV8_PMU_PMCR_N, pmcr);
>> +	if (idx >= val && idx != ARMV8_PMU_CYCLE_IDX) {
>> +		kvm_inject_undefined(vcpu);
>> +		return false;
>> +	}
>> +
>> +	return true;
>> +}
>> +
>> +bool pmu_access_cycle_counter_el0_disabled(struct kvm_vcpu *vcpu)
>> +{
>> +	return check_pmu_access_disabled(vcpu, ARMV8_PMU_USERENR_CR |  
>> ARMV8_PMU_USERENR_EN);
>> +}
>> +
>> +bool pmu_access_event_counter_el0_disabled(struct kvm_vcpu *vcpu)
>> +{
>> +	return check_pmu_access_disabled(vcpu, ARMV8_PMU_USERENR_ER |  
>> ARMV8_PMU_USERENR_EN);
>> +}

> Refactorings need to happen in a separate patch.

Will do

> Thanks,
> Oliver

