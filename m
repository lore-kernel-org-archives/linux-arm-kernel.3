Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F503C9EC7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 11:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YWii3J6C1NMQBmfiw8z1OVB/aGlQS9lfRhCmvYhOn4I=; b=2jyTPgsiNqrtQVu2liy/By2ia5
	3uAgkeUAo6z5hIK0T2a06cte0KfSLXRPaaWayLcUE6VWuf2P6c+sWdJph0qdjwPpdYSwMHHjHSKaT
	VBej/kfNewUnIdukf8ShdVDeCeW7B8YKCZmqZXjIIATl8+Bi3LQXjOgZ81P40ou6RmnJ9XuHKTecj
	vHQnOPCkiHrrEFIH9TKPjXSlP9bVTuAJJd6svbBdFSgV9R1fEgZwjkAxvwS/IvDrIXUd5Tz+SyCoc
	obibYd+HNqEOJXepTKYANe3PoBxLCiirBaerIoPzSBPk3gJ1iyrCsegcAA2b33ttWVlIYXGG6krTZ
	olxMYOFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGUt-00000005HuA-0mML;
	Mon, 12 Jan 2026 11:54:11 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGUr-00000005Htk-11yn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 11:54:10 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa4so4689402f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 03:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768218847; x=1768823647; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YWii3J6C1NMQBmfiw8z1OVB/aGlQS9lfRhCmvYhOn4I=;
        b=bPqDaTdWXZYmydsxPUX/Xcf95Ml8W92mhMhjcrHobOGdKnzEDOLrNRiV+FoLVxWsIu
         vWWfXq3ibmzQG1d8XtM6x9fVQPJbWgLH+/MKbqtktbtuHLiUFfivxOoMkrOWu0uSQ6gY
         FVPiO63Lu/LPu0s8aC4jQEGdf2begIoTw04l4/z1SQVZBwhF8FUGr6mi9NZybrD5aKCW
         OnD23KwBVE/NW6/frC183s4jKjYJGVzY2odxVoy5dS0bF8hk6tjdJH+2mFD3Bap4rvT/
         FrKpeSVClAi9eZ/YO+HqhI2tpnQjCxX+h9m/ddyokcXftNEdAOImkqQxhVzaLFLL+01t
         4bxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768218847; x=1768823647;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YWii3J6C1NMQBmfiw8z1OVB/aGlQS9lfRhCmvYhOn4I=;
        b=c3mOi03jx1PUPRQNyfPz8keYKH/W7ahlY1hIXyDPka4ix9fR4ViCUMtzaZbQr3rpr5
         r/g9Oo7d02w23MpaPqOxt47Qz6sKUvfclB70MTx11UipLugXYrUFtj3JAXYccIO/nFa/
         IrsL79pS6+Jmq3tdQqldUldILtJ8JObaN693u9JWKSVJOgNSApbkaEsMezhqq8DbYVSA
         JorNcMBFUnZwADU6uZxMxNiQ95KBZC9kc+PmKOS1PhnFfln5sGb4STdWbcN0EypxbZIe
         y4C67BAVCqOTwkx3My/CXoC554gbdpQHwvbpdmn2I5kk9bVRo/LYcSqA1X4/BElssqHZ
         DRDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+c5cMQyf+DdHBOaWKUBmBOOg3fQDYtxJXAkOr9Tf+KBrtUW9Zq6JfGuPBI0E/M3TQ6WMbnRXTs9MZV+tQeQBc@lists.infradead.org
X-Gm-Message-State: AOJu0YwmeIOkYZ70mafXPn3RxQjQrO+iTNz7UcpZOaDdO7n1nlfNZabS
	eszA5eZMOcid1QhjF8zKN2NLDh94Yd6nazXLZuuyN9LCCIKScoL79M7PuoKiuCW2w1o=
X-Gm-Gg: AY/fxX5eNmcM6IRgTg5Pn+86PLlrFc9krBRTLXPfYtajPDVo1fFtLrMO6c9m2vJRes1
	CuWlEiUQPEv+b6SywWH1IHOf9cm+VecIGoJi1oHF8K0iKdZIRS8nQ++uEMN2no50Lm0Id0+9MFc
	bB9+jTvkMit78c/hFHitvv8UUb9ClzTjfIGUUYmBkDURAqd+pJwe7wZtqib74Np65PpssCMWSx4
	ehrI1WO2zmRo0LltpjkrHTYPKMC9ajbbJtsLmT5wYtm88mw8cK+Lf4IFhVTx0yW3uA3vrpNAJvp
	iuKQUI6mWmca2x5lUPrhlQRgyjCkfA8qiUx8vK5nRXJvj7k0Flz6JIu+EpigoZJAkOu6JrXoTo1
	KdGVjm2tfSAKH5VaCWvVQ1X6xxf5yjeAPXXWmYyjjIYvL81AX83mLZHCythkgA/SeEZIJ4uNvCT
	GRhVgb4QceA8RBumpq
X-Google-Smtp-Source: AGHT+IEsjn+zK0lCbsdK1N0GQkVVBrmVbqGLvj60sSFEXUeA30O5MzdZ36mYjp8mtJBulQAHIaZUdA==
X-Received: by 2002:a5d:6a8c:0:b0:432:dd71:8f2c with SMTP id ffacd0b85a97d-432dd71908bmr8978495f8f.10.1768218847107;
        Mon, 12 Jan 2026 03:54:07 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df9c5sm39252935f8f.22.2026.01.12.03.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 03:54:06 -0800 (PST)
Message-ID: <adacaff6-c6c7-47a5-993a-29f006fe1b86@linaro.org>
Date: Mon, 12 Jan 2026 11:54:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6 19/35] KVM: arm64: Trap PMBIDR_EL1 and PMSIDR_EL1
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: mark.rutland@arm.com, james.morse@arm.com, maz@kernel.org,
 oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
 <20251114160717.163230-20-alexandru.elisei@arm.com>
 <f7d73dc3-aa4a-4c32-aabb-21a61a2f773f@linaro.org> <aWTa76KXpIwzPh4k@raptor>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aWTa76KXpIwzPh4k@raptor>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_035409_342887_0EC201B7 
X-CRM114-Status: GOOD (  26.12  )
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



On 12/01/2026 11:28 am, Alexandru Elisei wrote:
> Hi James,
> 
> On Fri, Jan 09, 2026 at 04:29:37PM +0000, James Clark wrote:
>>
>>
>> On 14/11/2025 4:07 pm, Alexandru Elisei wrote:
>>> PMBIDR_EL1 and PMSIDR_EL1 are read-only registers that describe the SPE
>>> implementation. Trap reads to allow KVM to control how SPE is described to
>>> a virtual machine. In particular, this is needed to:
>>>
>>> - Advertise the maximum buffer size set by userspace in
>>>     PMBIDR_EL1.MaxBuffSize.
>>> - Hide in PMSIDR_EL1, if necessary, the presence of FEAT_SPE_FDS and
>>>     FEAT_SPE_FnE, both of which add new registers which are already
>>>     trapped via the FGU mechanism.
>>>
>>> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
>>> ---
>>>    arch/arm64/include/asm/kvm_spe.h |  4 +-
>>>    arch/arm64/kvm/config.c          | 13 ++++-
>>>    arch/arm64/kvm/spe.c             | 82 +++++++++++++++++++++++++++++++-
>>>    arch/arm64/kvm/sys_regs.c        | 13 +++--
>>>    4 files changed, 103 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/arch/arm64/include/asm/kvm_spe.h b/arch/arm64/include/asm/kvm_spe.h
>>> index 3506d8c4c661..47b94794cc5f 100644
>>> --- a/arch/arm64/include/asm/kvm_spe.h
>>> +++ b/arch/arm64/include/asm/kvm_spe.h
>>> @@ -40,7 +40,7 @@ int kvm_spe_get_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
>>>    int kvm_spe_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
>>>    bool kvm_spe_write_sysreg(struct kvm_vcpu *vcpu, int reg, u64 val);
>>> -u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg);
>>> +u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg, u32 encoding);
>>>    #else
>>>    struct kvm_spe {
>>>    };
>>> @@ -78,7 +78,7 @@ static inline bool kvm_spe_write_sysreg(struct kvm_vcpu *vcpu, int reg, u64 val)
>>>    {
>>>    	return true;
>>>    }
>>> -static inline u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg)
>>> +static inline u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg, u32 encoding)
>>>    {
>>>    	return 0;
>>>    }
>>> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
>>> index 24bb3f36e9d5..ed6b167b7aa8 100644
>>> --- a/arch/arm64/kvm/config.c
>>> +++ b/arch/arm64/kvm/config.c
>>> @@ -6,6 +6,7 @@
>>>    #include <linux/kvm_host.h>
>>>    #include <asm/kvm_emulate.h>
>>> +#include <asm/kvm_spe.h>
>>>    #include <asm/kvm_nested.h>
>>>    #include <asm/sysreg.h>
>>> @@ -1489,6 +1490,16 @@ static void __compute_hfgwtr(struct kvm_vcpu *vcpu)
>>>    		*vcpu_fgt(vcpu, HFGWTR_EL2) |= HFGWTR_EL2_TCR_EL1;
>>>    }
>>> +static void __compute_hdfgrtr(struct kvm_vcpu *vcpu)
>>> +{
>>> +	__compute_fgt(vcpu, HDFGRTR_EL2);
>>> +
>>> +	if (vcpu_has_spe(vcpu)) {
>>> +		*vcpu_fgt(vcpu, HDFGRTR_EL2) |= HDFGRTR_EL2_PMBIDR_EL1;
>>> +		*vcpu_fgt(vcpu, HDFGRTR_EL2) |= HDFGRTR_EL2_PMSIDR_EL1;
>>> +	}
>>> +}
>>> +
>>>    static void __compute_hdfgwtr(struct kvm_vcpu *vcpu)
>>>    {
>>>    	__compute_fgt(vcpu, HDFGWTR_EL2);
>>> @@ -1505,7 +1516,7 @@ void kvm_vcpu_load_fgt(struct kvm_vcpu *vcpu)
>>>    	__compute_fgt(vcpu, HFGRTR_EL2);
>>>    	__compute_hfgwtr(vcpu);
>>>    	__compute_fgt(vcpu, HFGITR_EL2);
>>> -	__compute_fgt(vcpu, HDFGRTR_EL2);
>>> +	__compute_hdfgrtr(vcpu);
>>>    	__compute_hdfgwtr(vcpu);
>>>    	__compute_fgt(vcpu, HAFGRTR_EL2);
>>> diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
>>> index 5b3dc622cf82..92eb46276c71 100644
>>> --- a/arch/arm64/kvm/spe.c
>>> +++ b/arch/arm64/kvm/spe.c
>>> @@ -22,10 +22,16 @@ struct arm_spu_entry {
>>>    	struct arm_spe_pmu *arm_spu;
>>>    };
>>> +static u64 max_buffer_size_to_pmbidr_el1(u64 size);
>>> +
>>>    void kvm_host_spe_init(struct arm_spe_pmu *arm_spu)
>>>    {
>>>    	struct arm_spu_entry *entry;
>>> +	/* PMBIDR_EL1 cannot be trapped without FEAT_FGT. */
>>> +	if (!cpus_have_final_cap(ARM64_HAS_FGT))
>>> +		return;
>>> +
>>
>> Isn't this only required if you want to report a different PMBIDR value? If
>> the value in hardware is already what you want to give to guests then it's
>> not strictly required. Maybe it's something we can do as an addition later
>> to make it usable in more places.
> 
> The maximum buffer size is advertised in PMBIDR_EL1.
> 
> Thanks,
> Alex
> 

I know, but 0 "unlimited" is a valid value, and that's what's already in 
PMBIDR. You only need to trap if the value doesn't match what's already 
there.

You can also "probe" the maximum buffer size without this by attempting 
to set the limit pointer and looking at the buffer management error code.

The first thing I did when I went to use this was comment this out 
because my hardware doesn't support FGT. But the rest of it works fine 
without, maybe other people could benefit in the future too.

>>
>>>    	/* TODO: pKVM and nVHE support */
>>>    	if (is_protected_kvm_enabled() || !has_vhe())
>>>    		return;
>>> @@ -86,9 +92,81 @@ bool kvm_spe_write_sysreg(struct kvm_vcpu *vcpu, int reg, u64 val)
>>>    	return true;
>>>    }
>>> -u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg)
>>> +static bool kvm_spe_has_feat_spe_fds(struct kvm *kvm)
>>> +{
>>> +	struct arm_spe_pmu *spe_pmu = kvm->arch.kvm_spe.arm_spu;
>>> +
>>> +	return kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMSVer, V1P4) &&
>>> +	       FIELD_GET(PMSIDR_EL1_FDS, spe_pmu->pmsidr_el1);
>>> +}
>>> +
>>> +static bool kvm_spe_has_feat_spe_fne(struct kvm *kvm)
>>> +{
>>> +	struct arm_spe_pmu *spe_pmu = kvm->arch.kvm_spe.arm_spu;
>>> +
>>> +	return kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMSVer, V1P2) &&
>>> +	       FIELD_GET(PMSIDR_EL1_FnE, spe_pmu->pmsidr_el1);
>>> +}
>>> +
>>> +static u64 kvm_spe_get_pmsidr_el1(struct kvm_vcpu *vcpu)
>>>    {
>>> -	return __vcpu_sys_reg(vcpu, reg);
>>> +	struct kvm *kvm = vcpu->kvm;
>>> +	u64 pmsidr = kvm->arch.kvm_spe.arm_spu->pmsidr_el1;
>>> +
>>> +	/* Filter out known RES0 bits. */
>>> +	pmsidr &= ~GENMASK_ULL(63, 33);
>>> +
>>> +	if (!kvm_spe_has_feat_spe_fne(kvm))
>>> +		pmsidr &= ~PMSIDR_EL1_FnE;
>>> +
>>> +	if (!kvm_spe_has_feat_spe_fds(kvm))
>>> +		pmsidr &= ~PMSIDR_EL1_FDS;
>>> +
>>> +	return pmsidr;
>>> +}
>>> +
>>> +static u64 kvm_spe_get_pmbidr_el1(struct kvm_vcpu *vcpu)
>>> +{
>>> +	struct kvm *kvm = vcpu->kvm;
>>> +	struct kvm_spe *kvm_spe = &kvm->arch.kvm_spe;
>>> +	u64 max_buffer_size = kvm_spe->max_buffer_size;
>>> +	u64 pmbidr_el1 = kvm_spe->arm_spu->pmbidr_el1;
>>> +
>>> +	/* Filter out known RES0 bits. */
>>> +	pmbidr_el1 &= ~(GENMASK_ULL(63, 48) | GENMASK_ULL(31, 12));
>>> +
>>> +	if (!kvm_has_feat(kvm, ID_AA64DFR2_EL1, SPE_nVM, IMP)) {
>>> +		pmbidr_el1 &= ~PMBIDR_EL1_AddrMode;
>>> +		pmbidr_el1 |= PMBIDR_EL1_AddrMode_VM_ONLY;
>>> +	}
>>> +
>>> +	pmbidr_el1 &= ~PMBIDR_EL1_MaxBuffSize;
>>> +	pmbidr_el1 |= max_buffer_size_to_pmbidr_el1(max_buffer_size);
>>> +
>>> +	return pmbidr_el1;
>>> +}
>>> +
>>> +u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg, u32 encoding)
>>> +{
>>> +	u64 val = 0;
>>> +
>>> +	switch (encoding) {
>>> +	case SYS_PMBIDR_EL1:
>>> +		val = kvm_spe_get_pmbidr_el1(vcpu);
>>> +		break;
>>> +	case SYS_PMSIDR_EL1:
>>> +		val = kvm_spe_get_pmsidr_el1(vcpu);
>>> +		break;
>>> +	case SYS_PMBLIMITR_EL1:
>>> +	case SYS_PMBPTR_EL1:
>>> +	case SYS_PMBSR_EL1:
>>> +		val = __vcpu_sys_reg(vcpu, reg);
>>> +		break;
>>> +	default:
>>> +		WARN_ON_ONCE(1);
>>> +	}
>>> +
>>> +	return val;
>>>    }
>>>    static u64 max_buffer_size_to_pmbidr_el1(u64 size)
>>> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>>> index 5eeea229b46e..db86d1dcd148 100644
>>> --- a/arch/arm64/kvm/sys_regs.c
>>> +++ b/arch/arm64/kvm/sys_regs.c
>>> @@ -1386,13 +1386,18 @@ static unsigned int spe_visibility(const struct kvm_vcpu *vcpu,
>>>    static bool access_spe_reg(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
>>>    			   const struct sys_reg_desc *r)
>>>    {
>>> +	u32 encoding = reg_to_encoding(r);
>>>    	u64 val = p->regval;
>>>    	int reg = r->reg;
>>> -	if (p->is_write)
>>> +	if (p->is_write) {
>>> +		if (WARN_ON_ONCE(encoding == SYS_PMBIDR_EL1 ||
>>> +				 encoding == SYS_PMSIDR_EL1))
>>> +			return write_to_read_only(vcpu, p, r);
>>>    		return kvm_spe_write_sysreg(vcpu, reg, val);
>>> +	}
>>> -	p->regval = kvm_spe_read_sysreg(vcpu, reg);
>>> +	p->regval = kvm_spe_read_sysreg(vcpu, reg, encoding);
>>>    	return true;
>>>    }
>>> @@ -3360,12 +3365,12 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>>>    	{ SPE_UNTRAPPED_REG(PMSFCR_EL1) },
>>>    	{ SPE_UNTRAPPED_REG(PMSEVFR_EL1) },
>>>    	{ SPE_UNTRAPPED_REG(PMSLATFR_EL1) },
>>> -	{ SYS_DESC(SYS_PMSIDR_EL1), .access = undef_access },
>>> +	{ SYS_DESC(SYS_PMSIDR_EL1), .access = access_spe_reg, .visibility = spe_visibility },
>>>    	{ SPE_TRAPPED_REG(PMBLIMITR_EL1) },
>>>    	{ SPE_TRAPPED_REG(PMBPTR_EL1) },
>>>    	{ SPE_TRAPPED_REG(PMBSR_EL1) },
>>>    	{ SPE_UNTRAPPED_REG(PMSDSFR_EL1) },
>>> -	{ SYS_DESC(SYS_PMBIDR_EL1), .access = undef_access },
>>> +	{ SYS_DESC(SYS_PMBIDR_EL1), .access = access_spe_reg, .visibility = spe_visibility },
>>>    	{ PMU_SYS_REG(PMINTENSET_EL1),
>>>    	  .access = access_pminten, .reg = PMINTENSET_EL1,
>>


