Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09030D2D10A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 14:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b091E81/2unB3PJIE3JLMImmryguifLfk5JsrT4l5/A=; b=w1/bOv7C6X0MeH3cGZHlRoTXhS
	CKq3jlDfdzUE8K6j1hVQ3SJQf5kDVO3lVrJp2q8lBX1MMwL+N5r+/QCOb4pyuiiyXEpKn+stOf4kF
	SuNAzLw0culYawKjLVjDfFLPEF4V9dFFpaqb11cShX1wLczgnaaQcqbLnBkwdXpwevQSEwl0YQCZo
	/rDKTG0LDwnysjmb9Ah54R2fzKkSE9SQD++3G3L4bdTSVtAqPpVET780TGqYnUbKehzO5FdmYfQNf
	kpIPucirUxUq00YjvDxsj0krQAzxHZbnqIEJGLOou0LfaqpQeYTXHSG6LxTMAjySmFBs9xX1z/Cr9
	3GpDwbNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffPP-00000007GB2-1TiZ;
	Tue, 13 Jan 2026 14:30:11 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffPM-00000007GAP-2nHx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 14:30:09 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4edb8d6e98aso424941cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 06:30:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768314607; cv=none;
        d=google.com; s=arc-20240605;
        b=F7GMaJEVc/KVthEpkL4yS4oYjPw+n3tIJaMoEO6yFUnOy0UuG+kdOBuuP59l/lKSb5
         vBH3NbhTxrjxa3xjCfhWD33q5Lsqp64xorqfDeJTIHggSYsnPn09ahjmLQGDub+WWgm/
         vVKCo5an544UKx7wLoBcGnwGsdg8c4hsURdcL7PSTALK7doHl5mJtficv2D4PP6dUYUT
         UJ9OopRL22wS5JXtamprdQKZFoo9dOna1MpP4ptBe3FzEhrffpMK+Tageivb3pAslofW
         mBJROCuwvwO4FQqdn8v3LinnKxSBm+B4VURNxKB9mKapjgdYzo8j/0NPKgDzBSz8tvHC
         j/mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=b091E81/2unB3PJIE3JLMImmryguifLfk5JsrT4l5/A=;
        fh=Y+ynGfKqQfkO/wPbhlepC5wxz3He4qiP0m28fzyHbq4=;
        b=Bw8Z3GTy3IqaxvbbgD12/jfzohTi2LDqj2wFriDaup5jj2MsYPzqC1mULk88X3LjOK
         nzr3ojfWqEmjVyY8ZkwMLI1WdZYUTSqWIl7FgEe2e5Q6VlgRsKonJ2WfwdeL6ZBL6Th5
         mJ1HDdticEkiirD7cy73Pm8IxA/uPm22Kx29J2CzZow0b7iWzzXoXkIBdPlKZ2ZMkw5V
         CoNXeQaYByzblHbLUnqoeNFNX7XAkLx7PVkwYi1ST/ORtJ4ope2MJlViaVRdJwJQbSzB
         6l80DbiTqT+LGLT8k6BLHNSwbPg0m3oHR4e8q5AI7iNHTrBKU5ZmYTp8TSZUqPeD9Q1i
         V1eA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768314607; x=1768919407; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b091E81/2unB3PJIE3JLMImmryguifLfk5JsrT4l5/A=;
        b=i2EaFRT0KTIbwKmlp5QfE7cU9f6j8I8AEtZJhdP/b5wZDHWgTvb8UipYWgVQPYCKxA
         +BaCUWBeuISPE/IWtQodJGH/LKBVx47it6Bflw0p1Gkoo2ggly8qNfbc02FxxOAzLPic
         Hse7aw9cejdtvjsZv1aAZzSMeFTZkt24GiXZ4XnmfvaDXBFAZtRpUwQQQQMR2bMzkjzH
         MlM+7a0Auw1euao0PQlBV8bbNmYCXMxtvp0xgzCfqyLViZgg4q9UgyOBpF5kYzZPU5sE
         CEdbImjEUNY/4fq/X/Jg7Tr2pMGVb2FA29gJEmHo28/PoxgCRJ9204Evu9kfGB6yHsOR
         4g7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768314607; x=1768919407;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b091E81/2unB3PJIE3JLMImmryguifLfk5JsrT4l5/A=;
        b=IB680W4DIhC4WhIgzpWCuuEdjoEFUJ63Kj7/Jm9e8opmipCDkvGOy7FcYrAVA3Ltlv
         +Lfz9GYzPnKpvQmgvgO2tg7yTDvd2Cg5nseNB32l5HWzYsaIA6eWfeQx0QX962WO0isf
         9CHnB5iUyiQGoypdwRsbeVxy9aTdk+gd5y6COuObkd527PlmuO9Ev+5iIzwMQvi1qoUW
         G/GyfRT1XUgAuRjYndiUkNp5/KGaNl0aTvDZXS6+PQ9iXdB+vboDd30hYjeqWghVXfJT
         M9f+IyqtkQx8zKlO0+/soGI+YTTw8ERb3t45EB4oJv7fC8PXkZy1WmtykEN8+3MRRiPS
         0lwA==
X-Forwarded-Encrypted: i=1; AJvYcCVH5iB/SPNjGpHD68XVOx1ku1a14n5o+gR04UI8C4B/IjEwtja/PG+r1oKPTKQjBJCVV7gz2GNZ8pfyFYoYO1/g@lists.infradead.org
X-Gm-Message-State: AOJu0YyI/EuYzBsYTnSKiwQHjiVk9Nl+9Q68qIxLNJe9vsSPEvMPCJAP
	d33X6veQq8TsEy1q5WWhUzboZ2Gom218Si2M0/vb2ei9LNV7Y8n1BJmuLfwXB12X/ES25Vj/5dU
	4w4sAz5p+TLqjRpGnzRGbnkA6gG1tPqzGPt8fITL5
X-Gm-Gg: AY/fxX6jg+9lMYlhPsj7YTggq7+xLQotnz4rwCp6lMSTZdQIrEeNYfc6VJZiIEN20z8
	yvMydpHSno8yxy46TKRl+VT3pXEG1l/XLyRxSWA03jZBfnqWGeKKaDctAtZB4fB/OYn4X4B9C/c
	PBhUKqXmCowUqsAQ8KfuVjZ1JxpVJHG6I8iSK3JeyPfpZk+kMd2226OUsaKsd+rITSvbq8gDWR3
	ajDX+ncQFYCFbUdMsH2Bq2MmB91VuIU+3Ay4DzzDFB/r+51IR5oPJ87Ngsb2aqY6t3Iaj9bEEPE
	ZO91V/0g28JducLkDcG6XS93Uw==
X-Received: by 2002:ac8:5ad4:0:b0:4f1:83e4:73be with SMTP id
 d75a77b69052e-5013b23e77amr10218591cf.15.1768314606872; Tue, 13 Jan 2026
 06:30:06 -0800 (PST)
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-24-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-24-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 13 Jan 2026 14:29:30 +0000
X-Gm-Features: AZwV_Qi1BQ7vCKiwPSasBf7ZnHIRAUGyzNDOshXruUEpESYhIak7mxGtl8xsYqo
Message-ID: <CA+EHjTyL5gFQ8osKHaXQHa6327-HBJ4wvn6G2isDY3og4tCBKw@mail.gmail.com>
Subject: Re: [PATCH v9 24/30] KVM: arm64: Handle SME exceptions
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
X-CRM114-CacheID: sfid-20260113_063008_772095_2027BFDB 
X-CRM114-Status: GOOD (  27.78  )
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

On Tue, 23 Dec 2025 at 01:23, Mark Brown <broonie@kernel.org> wrote:
>
> The access control for SME follows the same structure as for the base FP
> and SVE extensions, with control being via CPACR_ELx.SMEN and CPTR_EL2.TSM
> mirroring the equivalent FPSIMD and SVE controls in those registers. Add
> handling for these controls and exceptions mirroring the existing handling
> for FPSIMD and SVE.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad



> ---
>  arch/arm64/kvm/handle_exit.c            | 14 ++++++++++++++
>  arch/arm64/kvm/hyp/include/hyp/switch.h | 11 ++++++-----
>  arch/arm64/kvm/hyp/nvhe/switch.c        |  4 +++-
>  arch/arm64/kvm/hyp/vhe/switch.c         | 17 ++++++++++++-----
>  4 files changed, 35 insertions(+), 11 deletions(-)
>
> diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
> index cc7d5d1709cb..1e54d5d722e4 100644
> --- a/arch/arm64/kvm/handle_exit.c
> +++ b/arch/arm64/kvm/handle_exit.c
> @@ -237,6 +237,19 @@ static int handle_sve(struct kvm_vcpu *vcpu)
>         return 1;
>  }
>
> +/*
> + * Guest access to SME registers should be routed to this handler only
> + * when the system doesn't support SME.
> + */
> +static int handle_sme(struct kvm_vcpu *vcpu)
> +{
> +       if (guest_hyp_sme_traps_enabled(vcpu))
> +               return kvm_inject_nested_sync(vcpu, kvm_vcpu_get_esr(vcpu));
> +
> +       kvm_inject_undefined(vcpu);
> +       return 1;
> +}
> +
>  /*
>   * Two possibilities to handle a trapping ptrauth instruction:
>   *
> @@ -390,6 +403,7 @@ static exit_handle_fn arm_exit_handlers[] = {
>         [ESR_ELx_EC_SVC64]      = handle_svc,
>         [ESR_ELx_EC_SYS64]      = kvm_handle_sys_reg,
>         [ESR_ELx_EC_SVE]        = handle_sve,
> +       [ESR_ELx_EC_SME]        = handle_sme,
>         [ESR_ELx_EC_ERET]       = kvm_handle_eret,
>         [ESR_ELx_EC_IABT_LOW]   = kvm_handle_guest_abort,
>         [ESR_ELx_EC_DABT_LOW]   = kvm_handle_guest_abort,
> diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
> index 5bcc72ae48ff..ad88cc7bd5d3 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
> @@ -69,11 +69,8 @@ static inline void __activate_cptr_traps_nvhe(struct kvm_vcpu *vcpu)
>  {
>         u64 val = CPTR_NVHE_EL2_RES1 | CPTR_EL2_TAM | CPTR_EL2_TTA;
>
> -       /*
> -        * Always trap SME since it's not supported in KVM.
> -        * TSM is RES1 if SME isn't implemented.
> -        */
> -       val |= CPTR_EL2_TSM;
> +       if (!vcpu_has_sme(vcpu) || !guest_owns_fp_regs())
> +               val |= CPTR_EL2_TSM;
>
>         if (!vcpu_has_sve(vcpu) || !guest_owns_fp_regs())
>                 val |= CPTR_EL2_TZ;
> @@ -101,6 +98,8 @@ static inline void __activate_cptr_traps_vhe(struct kvm_vcpu *vcpu)
>                 val |= CPACR_EL1_FPEN;
>                 if (vcpu_has_sve(vcpu))
>                         val |= CPACR_EL1_ZEN;
> +               if (vcpu_has_sme(vcpu))
> +                       val |= CPACR_EL1_SMEN;
>         }
>
>         if (!vcpu_has_nv(vcpu))
> @@ -142,6 +141,8 @@ static inline void __activate_cptr_traps_vhe(struct kvm_vcpu *vcpu)
>                 val &= ~CPACR_EL1_FPEN;
>         if (!(SYS_FIELD_GET(CPACR_EL1, ZEN, cptr) & BIT(0)))
>                 val &= ~CPACR_EL1_ZEN;
> +       if (!(SYS_FIELD_GET(CPACR_EL1, SMEN, cptr) & BIT(0)))
> +               val &= ~CPACR_EL1_SMEN;
>
>         if (kvm_has_feat(vcpu->kvm, ID_AA64MMFR3_EL1, S2POE, IMP))
>                 val |= cptr & CPACR_EL1_E0POE;
> diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
> index d3b9ec8a7c28..b2cba7c92b0f 100644
> --- a/arch/arm64/kvm/hyp/nvhe/switch.c
> +++ b/arch/arm64/kvm/hyp/nvhe/switch.c
> @@ -181,6 +181,7 @@ static const exit_handler_fn hyp_exit_handlers[] = {
>         [ESR_ELx_EC_CP15_32]            = kvm_hyp_handle_cp15_32,
>         [ESR_ELx_EC_SYS64]              = kvm_hyp_handle_sysreg,
>         [ESR_ELx_EC_SVE]                = kvm_hyp_handle_fpsimd,
> +       [ESR_ELx_EC_SME]                = kvm_hyp_handle_fpsimd,
>         [ESR_ELx_EC_FP_ASIMD]           = kvm_hyp_handle_fpsimd,
>         [ESR_ELx_EC_IABT_LOW]           = kvm_hyp_handle_iabt_low,
>         [ESR_ELx_EC_DABT_LOW]           = kvm_hyp_handle_dabt_low,
> @@ -192,7 +193,8 @@ static const exit_handler_fn pvm_exit_handlers[] = {
>         [0 ... ESR_ELx_EC_MAX]          = NULL,
>         [ESR_ELx_EC_SYS64]              = kvm_handle_pvm_sys64,
>         [ESR_ELx_EC_SVE]                = kvm_handle_pvm_restricted,
> -       [ESR_ELx_EC_FP_ASIMD]           = kvm_hyp_handle_fpsimd,
> +       [ESR_ELx_EC_SME]                = kvm_handle_pvm_restricted,
> +       [ESR_ELx_EC_FP_ASIMD]           = kvm_handle_pvm_restricted,
>         [ESR_ELx_EC_IABT_LOW]           = kvm_hyp_handle_iabt_low,
>         [ESR_ELx_EC_DABT_LOW]           = kvm_hyp_handle_dabt_low,
>         [ESR_ELx_EC_WATCHPT_LOW]        = kvm_hyp_handle_watchpt_low,
> diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
> index 9984c492305a..8449004bc24e 100644
> --- a/arch/arm64/kvm/hyp/vhe/switch.c
> +++ b/arch/arm64/kvm/hyp/vhe/switch.c
> @@ -458,22 +458,28 @@ static bool kvm_hyp_handle_cpacr_el1(struct kvm_vcpu *vcpu, u64 *exit_code)
>         return true;
>  }
>
> -static bool kvm_hyp_handle_zcr_el2(struct kvm_vcpu *vcpu, u64 *exit_code)
> +static bool kvm_hyp_handle_vec_cr_el2(struct kvm_vcpu *vcpu, u64 *exit_code)
>  {
>         u32 sysreg = esr_sys64_to_sysreg(kvm_vcpu_get_esr(vcpu));
>
>         if (!vcpu_has_nv(vcpu))
>                 return false;
>
> -       if (sysreg != SYS_ZCR_EL2)
> +       switch (sysreg) {
> +       case SYS_ZCR_EL2:
> +       case SYS_SMCR_EL2:
> +               break;
> +       default:
>                 return false;
> +       }
>
>         if (guest_owns_fp_regs())
>                 return false;
>
>         /*
> -        * ZCR_EL2 traps are handled in the slow path, with the expectation
> -        * that the guest's FP context has already been loaded onto the CPU.
> +        * ZCR_EL2 and SMCR_EL2 traps are handled in the slow path,
> +        * with the expectation that the guest's FP context has
> +        * already been loaded onto the CPU.
>          *
>          * Load the guest's FP context and unconditionally forward to the
>          * slow path for handling (i.e. return false).
> @@ -493,7 +499,7 @@ static bool kvm_hyp_handle_sysreg_vhe(struct kvm_vcpu *vcpu, u64 *exit_code)
>         if (kvm_hyp_handle_cpacr_el1(vcpu, exit_code))
>                 return true;
>
> -       if (kvm_hyp_handle_zcr_el2(vcpu, exit_code))
> +       if (kvm_hyp_handle_vec_cr_el2(vcpu, exit_code))
>                 return true;
>
>         return kvm_hyp_handle_sysreg(vcpu, exit_code);
> @@ -522,6 +528,7 @@ static const exit_handler_fn hyp_exit_handlers[] = {
>         [0 ... ESR_ELx_EC_MAX]          = NULL,
>         [ESR_ELx_EC_CP15_32]            = kvm_hyp_handle_cp15_32,
>         [ESR_ELx_EC_SYS64]              = kvm_hyp_handle_sysreg_vhe,
> +       [ESR_ELx_EC_SME]                = kvm_hyp_handle_fpsimd,
>         [ESR_ELx_EC_SVE]                = kvm_hyp_handle_fpsimd,
>         [ESR_ELx_EC_FP_ASIMD]           = kvm_hyp_handle_fpsimd,
>         [ESR_ELx_EC_IABT_LOW]           = kvm_hyp_handle_iabt_low,
>
> --
> 2.47.3
>

