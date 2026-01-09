Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8227D26D6B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 15:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U8I+9Z/SzReDIbFo3xnWDAd13nvsAbuR5scsRwJQ9D4=; b=eoWwYupsgmcr4HXEB00Flw4gfN
	uq0OMt0jYLxJvuBNQn+q3vPsqbVOeU3YDY4Bl7F9zodrD7gGB/T/AKyZR4cOs2ElvJiiWRkyVv6h7
	uBC4GkWMujdGKOzjHjtrRNaFcXaiEoTkyUBYRuvYRw7hbVgo/v4qvWyEzTNRaFiRNwd4DZpPEslAT
	MW7VgzfkcWZnmsTbzX3Yl9TnQD/EUi7X4rItjPMsxHMYA5clbp+PKXhgwFwJxEyUoiUpMJuCqruTh
	vnxcQFDj3HwY5GWdMTEggMjayM/YvwNJi603jsBXDNjFTJxfXbdIKzUuSch/UQx6KFHEv6sWHCRev
	HQcjDyGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEqZ-00000002XT9-29pd;
	Fri, 09 Jan 2026 15:56:19 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEqW-00000002XSf-2mn1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 15:56:17 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4ee243b98caso353681cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 07:56:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767974174; cv=none;
        d=google.com; s=arc-20240605;
        b=K3VFlxCoh6yjQYEyZwN5kCHyD5pBPwVW6Ytgu9idufOrJxcqx5lwuwyTZElSwZIkuJ
         46c7UazAxPSUdJDxntttLNofAfsu6ct8H+WS//2bVLEFL9v/Qsc8plqm/5Nu4+KfPEo3
         JiYGSHgpK88RKfCV+P/9Q+ETgG8E5J7bX0RMKKK8NPvahnCQ4fZSG4lOSCdbVmEO7tJP
         ATqpPyTE/C+SlNLtYWhuMIhZaxEfZwNUPMxIJALvF/Q+Q6TKRkzi4Ec94sc2yOp6JTNM
         +m/y+GFOBcK0Ot/FLl/iHa27UyXVl0i6+ZDxyNGcBTqUez7GdfhLLeaniffg1fQrR02e
         MjHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=U8I+9Z/SzReDIbFo3xnWDAd13nvsAbuR5scsRwJQ9D4=;
        fh=VugsNzCVK75kOfveyz3M3JWn6zdMO2mX/DUZp/IgDII=;
        b=UE6c+7GA7t9lYdWmZcGgoBTu/xFKT2Hj6muoNlEgHGXgu8jckP+TmhKQuBDVewMnlA
         jsx+FSIgpoD0Mqig5wrDhJWXzwSfDl7AxElsYC9pHC3AEat8HTuAqr/t9t01bGZSr+Vv
         A84KXlh7CDxve64AFf64iKAdWVseSWrOaV7uEv05sZ+gXcQgbQJyNTBNaIP+glMBa6vq
         BddA9jLb+kbE8SBjgOX4MTJEcb2mA1ByRizSR/g7Uuxnv6tvygYbH9c98IoJOlU3oGQ6
         0dIe7QMgq0LwxJDcPfy0Ec1uxrb/FKqUHANEKecjP06i3t0OZNGq8xStuS9kX6GX23NH
         hOeA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767974174; x=1768578974; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U8I+9Z/SzReDIbFo3xnWDAd13nvsAbuR5scsRwJQ9D4=;
        b=eVS4yaeTc5JQvQVqOKm3bRiKA6HKogaezxJ6RqCOlqDH4TWZxgDTmLmYedBiqjCCck
         7ga4mH9HuvQ24Y5tOw2+OPMEXaxF7Vp0pTK1g78bi+avv/cz8nZ7LSExheYONvXSIUwb
         DBEBmtk7KqMC5DoTU2j6TQHv4osKho3jHTnLnhkdiVe8FtrRA9jaBagd44vCrVWIJRa5
         dfhF0krNmt+hDBcV3c7OkOs/exWCbFhU8B7RP5xaYgxc19Fr1P7OCvrstN2YP1o4Hubh
         EfVZLW8LoNBPfS/fycMs4O43PJEkHUSrBlhsVcsU39zwEoP9j5aQWFATcLPR4uQUpWV1
         1aNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767974174; x=1768578974;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8I+9Z/SzReDIbFo3xnWDAd13nvsAbuR5scsRwJQ9D4=;
        b=X4+qmzACd0XeyC6rf4lu77t3GhXmO2DdVeO/Hh3U3HkRV6BLnHUAZDPrj00XdX7fr9
         S+ootYetbc0k94tqtSfMJBuZ4wskJTpTk9NAay6exz/IXEL4pZCwQyYeESIcSE5ZZvjV
         MzBxSqdTUM+gFNSIGpmn7I7TmCIYFIpKOdjx5pzcncalnNHJNUqsfsWTSoGsNGBVAYBW
         TKkO6JNvuyFQNzVtolcZGOLBzzbHkP9NpI1ZIhGxBEuqzk0XFDsOsguV+YWzITFfBR5Q
         NYP6ptajCJBrC30oD3PIwXkyIAqgUODOa8TyBEaccb0vGtmGZ5jYa3a33dleBYui7kjN
         ox3w==
X-Forwarded-Encrypted: i=1; AJvYcCUu8gS6DOIE7qaDCSxATj/k9SXGBaVtThIfJM9Mt8z4hUHrRmI0cpomj7WsHfEuGbQejGdKvaYTnnYkXCGI5VpB@lists.infradead.org
X-Gm-Message-State: AOJu0YyHt1L8F9B6ChHJ81c0GM3+S6eMADRolhFqOdHxmiZ2FlQKU/Rk
	64sgxvLFQarw7uVzigApxFb5JlMCSbWk9omaIE+sMN12xh2KnrZIze90ArwcQEq8coEqMmuHigq
	BCJ/m1M9Mx+Voayv7yMISYjJ0isyU69WZJShunuC2
X-Gm-Gg: AY/fxX6RK9UUFW3iKAd25c0P1a7S5Ir8cgyPLZ7UUJ1y4R4VQVubz/FhaJS4hJhjBIt
	7adA60lSuZIm9ypBwbVE/bnwJWFWtOo4+hPejaeqZGjdWzqyQTuGsV3WX6M1HN2ngajkuoScJZY
	SqML8Vo2/saKaDvZ4LHEqPk2s1bfG/UU1xLexs5IAcG6/7L37hR+uc9x8UT/HMAAVCqiOu8VjJH
	yrm8FnaWR7sHk80i4oVMzxknpYv1Mm2pnI8BENVFXQjva3jnr62pZ1554SenIgJZkPWhPT5
X-Received: by 2002:a05:622a:206:b0:4ff:a96a:90fc with SMTP id
 d75a77b69052e-4ffca10c9e7mr11956941cf.0.1767974173794; Fri, 09 Jan 2026
 07:56:13 -0800 (PST)
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-11-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-11-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 9 Jan 2026 15:55:36 +0000
X-Gm-Features: AZwV_Qjl7-V6jtqPJiWFE-pNSysqHN43mjzymjYZ55x2bRwN0FRgaHUdOP2UPAs
Message-ID: <CA+EHjTznZj94NFVQGG8Bi0=kkQUMYA0omdGS++83jwLj-CDRNQ@mail.gmail.com>
Subject: Re: [PATCH v9 11/30] KVM: arm64: Define internal features for SME
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>, 
	Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_075616_750720_1997BB62 
X-CRM114-Status: GOOD (  21.38  )
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

Hi Mark,

On Tue, 23 Dec 2025 at 01:22, Mark Brown <broonie@kernel.org> wrote:
>
> In order to simplify interdependencies in the rest of the series define
> the feature detection for SME and it's subfeatures.  Due to the need for

nit: it's -> its

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad



> vector length configuration we define a flag for SME like for SVE.  We
> also have two subfeatures which add architectural state, FA64 and SME2,
> which are configured via the normal ID register scheme.
>
> Also provide helpers which check if the vCPU is in streaming mode or has
> ZA enabled.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>


> ---
>  arch/arm64/include/asm/kvm_host.h | 35 ++++++++++++++++++++++++++++++++++-
>  arch/arm64/kvm/sys_regs.c         |  2 +-
>  2 files changed, 35 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 0f3d26467bf0..0816180dc551 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -353,6 +353,8 @@ struct kvm_arch {
>  #define KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS             10
>         /* Unhandled SEAs are taken to userspace */
>  #define KVM_ARCH_FLAG_EXIT_SEA                         11
> +       /* SME exposed to guest */
> +#define KVM_ARCH_FLAG_GUEST_HAS_SME                    12
>         unsigned long flags;
>
>         /* VM-wide vCPU feature set */
> @@ -1062,7 +1064,16 @@ struct kvm_vcpu_arch {
>  #define vcpu_has_sve(vcpu)     kvm_has_sve((vcpu)->kvm)
>  #endif
>
> -#define vcpu_has_vec(vcpu) vcpu_has_sve(vcpu)
> +#define kvm_has_sme(kvm)       (system_supports_sme() &&               \
> +                                test_bit(KVM_ARCH_FLAG_GUEST_HAS_SME, &(kvm)->arch.flags))
> +
> +#ifdef __KVM_NVHE_HYPERVISOR__
> +#define vcpu_has_sme(vcpu)     kvm_has_sme(kern_hyp_va((vcpu)->kvm))
> +#else
> +#define vcpu_has_sme(vcpu)     kvm_has_sme((vcpu)->kvm)
> +#endif
> +
> +#define vcpu_has_vec(vcpu) (vcpu_has_sve(vcpu) || vcpu_has_sme(vcpu))
>
>  #ifdef CONFIG_ARM64_PTR_AUTH
>  #define vcpu_has_ptrauth(vcpu)                                         \
> @@ -1602,6 +1613,28 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
>  #define kvm_has_sctlr2(k)                              \
>         (kvm_has_feat((k), ID_AA64MMFR3_EL1, SCTLRX, IMP))
>
> +#define kvm_has_fa64(k)                                        \
> +       (system_supports_fa64() &&                      \
> +        kvm_has_feat((k), ID_AA64SMFR0_EL1, FA64, IMP))
> +
> +#define kvm_has_sme2(k)                                        \
> +       (system_supports_sme2() &&                      \
> +        kvm_has_feat((k), ID_AA64PFR1_EL1, SME, SME2))
> +
> +#ifdef __KVM_NVHE_HYPERVISOR__
> +#define vcpu_has_sme2(vcpu)    kvm_has_sme2(kern_hyp_va((vcpu)->kvm))
> +#define vcpu_has_fa64(vcpu)    kvm_has_fa64(kern_hyp_va((vcpu)->kvm))
> +#else
> +#define vcpu_has_sme2(vcpu)    kvm_has_sme2((vcpu)->kvm)
> +#define vcpu_has_fa64(vcpu)    kvm_has_fa64((vcpu)->kvm)
> +#endif
> +
> +#define vcpu_in_streaming_mode(vcpu) \
> +       (__vcpu_sys_reg(vcpu, SVCR) & SVCR_SM_MASK)
> +
> +#define vcpu_za_enabled(vcpu) \
> +       (__vcpu_sys_reg(vcpu, SVCR) & SVCR_ZA_MASK)
> +
>  static inline bool kvm_arch_has_irq_bypass(void)
>  {
>         return true;
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index c8fd7c6a12a1..3576e69468db 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -1945,7 +1945,7 @@ static unsigned int sve_visibility(const struct kvm_vcpu *vcpu,
>  static unsigned int sme_visibility(const struct kvm_vcpu *vcpu,
>                                    const struct sys_reg_desc *rd)
>  {
> -       if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, SME, IMP))
> +       if (vcpu_has_sme(vcpu))
>                 return 0;
>
>         return REG_HIDDEN;
>
> --
> 2.47.3
>

