Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D41FD26D6F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 16:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Av9QrHeVLN0xEzdviPuqhkrVJd267kJMrNhHLNRrzA=; b=llgjRUxXSlHtbHVlTYk2qNXIX4
	ZuJZPFRBt8MTKnQ3FDKfGlE1Boi3bfinLAUuw2ShGcwRmeRzoXN0pzT8oyZmSbiNZ6yu8II+8Cw7q
	oY+833JUJt/fgNQanJGzeCNs3wn/CQKdW+SVw8/wv6l6Rm9iV7ztG32IQNHd2OK+KCJXZcJTOZ+vW
	hDXCd7xCOnMKjqF0PTNlUB+w2vepESMwSkn88LZ/4FpPD8Bj05KbzbLTQA3gwRdYuYUsD4oDJlHxh
	wmpCQC/ueAvHIahOq9hx85d+kQjKdXu5siRFJJoQ8FJfwknBRljDC5MCwuw+FaJp4tVaI3NvkKcpK
	Jl5iVPCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFMs-00000002cYE-1ImK;
	Fri, 09 Jan 2026 16:29:42 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFMq-00000002cXB-3Tpg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 16:29:42 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso47703435e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 08:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767976179; x=1768580979; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Av9QrHeVLN0xEzdviPuqhkrVJd267kJMrNhHLNRrzA=;
        b=McxkSqAqdC5zQpwahUKltaL9Vmi3iplQ1TMue0rgBdMoGxwrjfjyHpYninj7pru839
         JY3vNAZh/Ieyr3Mhe+bbkmzS1u1LBtXK7PH4RmfwkhxqwOcxeBIhwVtma1qi6XUARxvr
         +ejB0vWSc7QIsOwy6iApQy932ObYh7Wqgv/LBaJ1VMgQS9aUa4VGww+/ziUYoVT/DukI
         aDU+kUnrW6hc1MFzgqA/ivs80ALlzllXt4VYUh1SkNcR7i6Li/+bAdoW42t2m14m5CuY
         iMGui0wsbSOTkgJj+8GyH5tHzC/O4aeLHP7RYuO5dJq+5vVnZD7w1ZVaeuozs4/NiXvD
         3A2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767976179; x=1768580979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Av9QrHeVLN0xEzdviPuqhkrVJd267kJMrNhHLNRrzA=;
        b=le4lpr0VHgM79SsXH7oQVlxd9AvReresQH2C45xEfC2XikL77EArT0n0ybPWA4omQ6
         9uNr6znLiugT5W2keHw5naTLhBCBw1Gc7Z5C67YT76A77WuwWx1OhtDAC+5h6O2c1qLJ
         Ao5FKEw56HAwfvjSJWSDsoC9iKNXtwYw6p3ypLxPcn36iTROKMkLzkVWsORzQ0Z0Bxmw
         h/WDeax6+zbKxCSdYEYERQtLqrzgMbUGERvvSXhOCmSl6Om0+8ih22OzZBG+x0OuVK2I
         mA5YyY1Nesmu6q9V8w0Iu64wytzW7rWYBmkOfmZ10N+gBuzb1hN7AebbWWUM/7dHQGi0
         HWhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTpRgWZLlgY2GhkYR6e7oTq7+YIiCUbhEhUHfurdcG5KfgXDuuPfBT/ZvGA9UeOUr6jZWfyWRA+uiID2zHRBC+@lists.infradead.org
X-Gm-Message-State: AOJu0YxCg+lRGijji2nxMYRQr6cvMlww9bxkEemuLq5CxwnOIVIrkElU
	F5TB8AjwXcDs5Y1+SSzRDcoZekRQhoHjnum5soSRxnCM9auVyNG+pIq/1T2UpYB6XMQ=
X-Gm-Gg: AY/fxX7ufg8jE4ORrnPQBkF8WwCeUYcwU4LEGr0Jt/FAbHByeyapCRbqMdFH9+rKfEG
	9SLZ9tEzY+UNwX81L3u74z7t3BIF3qNp0P4jr4TfKeJvVKSiPGjRUj2brXmg+ZP/Hjp2OcrZRzd
	zDUodonyUHwXUA+xd467LUpWNr6ZSVPpypbcjUQciBTiV77PgmjB49XReo4LUHi0PSITTpzw7tu
	tq6NJ6O3HpL6Cjn+ruOhdRMILrVtsdpqKQ3EVC5lH4kmJrw33sdFomste+Pz9m2drkCqaanpxTJ
	4VbE2u2xUcTNJG6UMLEvbN2xC2xIBfNKeg6+v3kMm7F2pZErhWpAEbk+BXhXkneDEculP0VSUhV
	tOGXgyJjs5/0q4w4Yhd59NvtQpIYNbXX7YcYOVioliebQ9f43yGVpWxs4MHQhPS6rPPdZHaLqbk
	emyvTNQ8+Onzph9Wsj
X-Google-Smtp-Source: AGHT+IHlxXBTc8kcCppX7neDfDLqk6DNHOUQ5JMaSuR5ew7p0+7D3jKYSaHYHZVPW0MOT9coV8wMow==
X-Received: by 2002:a05:600c:3b28:b0:471:13fa:1b84 with SMTP id 5b1f17b1804b1-47d84b1868amr120818095e9.12.1767976178721;
        Fri, 09 Jan 2026 08:29:38 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f703a8csm213675025e9.13.2026.01.09.08.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 08:29:38 -0800 (PST)
Message-ID: <f7d73dc3-aa4a-4c32-aabb-21a61a2f773f@linaro.org>
Date: Fri, 9 Jan 2026 16:29:37 +0000
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
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251114160717.163230-20-alexandru.elisei@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_082940_932565_4FEBB1FD 
X-CRM114-Status: GOOD (  26.32  )
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



On 14/11/2025 4:07 pm, Alexandru Elisei wrote:
> PMBIDR_EL1 and PMSIDR_EL1 are read-only registers that describe the SPE
> implementation. Trap reads to allow KVM to control how SPE is described to
> a virtual machine. In particular, this is needed to:
> 
> - Advertise the maximum buffer size set by userspace in
>    PMBIDR_EL1.MaxBuffSize.
> - Hide in PMSIDR_EL1, if necessary, the presence of FEAT_SPE_FDS and
>    FEAT_SPE_FnE, both of which add new registers which are already
>    trapped via the FGU mechanism.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>   arch/arm64/include/asm/kvm_spe.h |  4 +-
>   arch/arm64/kvm/config.c          | 13 ++++-
>   arch/arm64/kvm/spe.c             | 82 +++++++++++++++++++++++++++++++-
>   arch/arm64/kvm/sys_regs.c        | 13 +++--
>   4 files changed, 103 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_spe.h b/arch/arm64/include/asm/kvm_spe.h
> index 3506d8c4c661..47b94794cc5f 100644
> --- a/arch/arm64/include/asm/kvm_spe.h
> +++ b/arch/arm64/include/asm/kvm_spe.h
> @@ -40,7 +40,7 @@ int kvm_spe_get_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
>   int kvm_spe_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
>   
>   bool kvm_spe_write_sysreg(struct kvm_vcpu *vcpu, int reg, u64 val);
> -u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg);
> +u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg, u32 encoding);
>   #else
>   struct kvm_spe {
>   };
> @@ -78,7 +78,7 @@ static inline bool kvm_spe_write_sysreg(struct kvm_vcpu *vcpu, int reg, u64 val)
>   {
>   	return true;
>   }
> -static inline u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg)
> +static inline u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg, u32 encoding)
>   {
>   	return 0;
>   }
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index 24bb3f36e9d5..ed6b167b7aa8 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -6,6 +6,7 @@
>   
>   #include <linux/kvm_host.h>
>   #include <asm/kvm_emulate.h>
> +#include <asm/kvm_spe.h>
>   #include <asm/kvm_nested.h>
>   #include <asm/sysreg.h>
>   
> @@ -1489,6 +1490,16 @@ static void __compute_hfgwtr(struct kvm_vcpu *vcpu)
>   		*vcpu_fgt(vcpu, HFGWTR_EL2) |= HFGWTR_EL2_TCR_EL1;
>   }
>   
> +static void __compute_hdfgrtr(struct kvm_vcpu *vcpu)
> +{
> +	__compute_fgt(vcpu, HDFGRTR_EL2);
> +
> +	if (vcpu_has_spe(vcpu)) {
> +		*vcpu_fgt(vcpu, HDFGRTR_EL2) |= HDFGRTR_EL2_PMBIDR_EL1;
> +		*vcpu_fgt(vcpu, HDFGRTR_EL2) |= HDFGRTR_EL2_PMSIDR_EL1;
> +	}
> +}
> +
>   static void __compute_hdfgwtr(struct kvm_vcpu *vcpu)
>   {
>   	__compute_fgt(vcpu, HDFGWTR_EL2);
> @@ -1505,7 +1516,7 @@ void kvm_vcpu_load_fgt(struct kvm_vcpu *vcpu)
>   	__compute_fgt(vcpu, HFGRTR_EL2);
>   	__compute_hfgwtr(vcpu);
>   	__compute_fgt(vcpu, HFGITR_EL2);
> -	__compute_fgt(vcpu, HDFGRTR_EL2);
> +	__compute_hdfgrtr(vcpu);
>   	__compute_hdfgwtr(vcpu);
>   	__compute_fgt(vcpu, HAFGRTR_EL2);
>   
> diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
> index 5b3dc622cf82..92eb46276c71 100644
> --- a/arch/arm64/kvm/spe.c
> +++ b/arch/arm64/kvm/spe.c
> @@ -22,10 +22,16 @@ struct arm_spu_entry {
>   	struct arm_spe_pmu *arm_spu;
>   };
>   
> +static u64 max_buffer_size_to_pmbidr_el1(u64 size);
> +
>   void kvm_host_spe_init(struct arm_spe_pmu *arm_spu)
>   {
>   	struct arm_spu_entry *entry;
>   
> +	/* PMBIDR_EL1 cannot be trapped without FEAT_FGT. */
> +	if (!cpus_have_final_cap(ARM64_HAS_FGT))
> +		return;
> +

Isn't this only required if you want to report a different PMBIDR value? 
If the value in hardware is already what you want to give to guests then 
it's not strictly required. Maybe it's something we can do as an 
addition later to make it usable in more places.

>   	/* TODO: pKVM and nVHE support */
>   	if (is_protected_kvm_enabled() || !has_vhe())
>   		return;
> @@ -86,9 +92,81 @@ bool kvm_spe_write_sysreg(struct kvm_vcpu *vcpu, int reg, u64 val)
>   	return true;
>   }
>   
> -u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg)
> +static bool kvm_spe_has_feat_spe_fds(struct kvm *kvm)
> +{
> +	struct arm_spe_pmu *spe_pmu = kvm->arch.kvm_spe.arm_spu;
> +
> +	return kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMSVer, V1P4) &&
> +	       FIELD_GET(PMSIDR_EL1_FDS, spe_pmu->pmsidr_el1);
> +}
> +
> +static bool kvm_spe_has_feat_spe_fne(struct kvm *kvm)
> +{
> +	struct arm_spe_pmu *spe_pmu = kvm->arch.kvm_spe.arm_spu;
> +
> +	return kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMSVer, V1P2) &&
> +	       FIELD_GET(PMSIDR_EL1_FnE, spe_pmu->pmsidr_el1);
> +}
> +
> +static u64 kvm_spe_get_pmsidr_el1(struct kvm_vcpu *vcpu)
>   {
> -	return __vcpu_sys_reg(vcpu, reg);
> +	struct kvm *kvm = vcpu->kvm;
> +	u64 pmsidr = kvm->arch.kvm_spe.arm_spu->pmsidr_el1;
> +
> +	/* Filter out known RES0 bits. */
> +	pmsidr &= ~GENMASK_ULL(63, 33);
> +
> +	if (!kvm_spe_has_feat_spe_fne(kvm))
> +		pmsidr &= ~PMSIDR_EL1_FnE;
> +
> +	if (!kvm_spe_has_feat_spe_fds(kvm))
> +		pmsidr &= ~PMSIDR_EL1_FDS;
> +
> +	return pmsidr;
> +}
> +
> +static u64 kvm_spe_get_pmbidr_el1(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm *kvm = vcpu->kvm;
> +	struct kvm_spe *kvm_spe = &kvm->arch.kvm_spe;
> +	u64 max_buffer_size = kvm_spe->max_buffer_size;
> +	u64 pmbidr_el1 = kvm_spe->arm_spu->pmbidr_el1;
> +
> +	/* Filter out known RES0 bits. */
> +	pmbidr_el1 &= ~(GENMASK_ULL(63, 48) | GENMASK_ULL(31, 12));
> +
> +	if (!kvm_has_feat(kvm, ID_AA64DFR2_EL1, SPE_nVM, IMP)) {
> +		pmbidr_el1 &= ~PMBIDR_EL1_AddrMode;
> +		pmbidr_el1 |= PMBIDR_EL1_AddrMode_VM_ONLY;
> +	}
> +
> +	pmbidr_el1 &= ~PMBIDR_EL1_MaxBuffSize;
> +	pmbidr_el1 |= max_buffer_size_to_pmbidr_el1(max_buffer_size);
> +
> +	return pmbidr_el1;
> +}
> +
> +u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg, u32 encoding)
> +{
> +	u64 val = 0;
> +
> +	switch (encoding) {
> +	case SYS_PMBIDR_EL1:
> +		val = kvm_spe_get_pmbidr_el1(vcpu);
> +		break;
> +	case SYS_PMSIDR_EL1:
> +		val = kvm_spe_get_pmsidr_el1(vcpu);
> +		break;
> +	case SYS_PMBLIMITR_EL1:
> +	case SYS_PMBPTR_EL1:
> +	case SYS_PMBSR_EL1:
> +		val = __vcpu_sys_reg(vcpu, reg);
> +		break;
> +	default:
> +		WARN_ON_ONCE(1);
> +	}
> +
> +	return val;
>   }
>   
>   static u64 max_buffer_size_to_pmbidr_el1(u64 size)
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 5eeea229b46e..db86d1dcd148 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -1386,13 +1386,18 @@ static unsigned int spe_visibility(const struct kvm_vcpu *vcpu,
>   static bool access_spe_reg(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
>   			   const struct sys_reg_desc *r)
>   {
> +	u32 encoding = reg_to_encoding(r);
>   	u64 val = p->regval;
>   	int reg = r->reg;
>   
> -	if (p->is_write)
> +	if (p->is_write) {
> +		if (WARN_ON_ONCE(encoding == SYS_PMBIDR_EL1 ||
> +				 encoding == SYS_PMSIDR_EL1))
> +			return write_to_read_only(vcpu, p, r);
>   		return kvm_spe_write_sysreg(vcpu, reg, val);
> +	}
>   
> -	p->regval = kvm_spe_read_sysreg(vcpu, reg);
> +	p->regval = kvm_spe_read_sysreg(vcpu, reg, encoding);
>   	return true;
>   }
>   
> @@ -3360,12 +3365,12 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>   	{ SPE_UNTRAPPED_REG(PMSFCR_EL1) },
>   	{ SPE_UNTRAPPED_REG(PMSEVFR_EL1) },
>   	{ SPE_UNTRAPPED_REG(PMSLATFR_EL1) },
> -	{ SYS_DESC(SYS_PMSIDR_EL1), .access = undef_access },
> +	{ SYS_DESC(SYS_PMSIDR_EL1), .access = access_spe_reg, .visibility = spe_visibility },
>   	{ SPE_TRAPPED_REG(PMBLIMITR_EL1) },
>   	{ SPE_TRAPPED_REG(PMBPTR_EL1) },
>   	{ SPE_TRAPPED_REG(PMBSR_EL1) },
>   	{ SPE_UNTRAPPED_REG(PMSDSFR_EL1) },
> -	{ SYS_DESC(SYS_PMBIDR_EL1), .access = undef_access },
> +	{ SYS_DESC(SYS_PMBIDR_EL1), .access = access_spe_reg, .visibility = spe_visibility },
>   
>   	{ PMU_SYS_REG(PMINTENSET_EL1),
>   	  .access = access_pminten, .reg = PMINTENSET_EL1,


