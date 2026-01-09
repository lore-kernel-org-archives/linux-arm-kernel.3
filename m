Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376A5D26D67
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 15:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lO4kv7J4FSmcCFF5cavwgM24+IZ64AUylx9G5mDhyIM=; b=2/WYBGuBrwlLCAIiKELkPln7Np
	MHd6WMeQZFpmqX4+jjj3PzmRsj79oe5O1u671XAKpdlk6qBfm6zVcjROp2aIf/alBJ/Bxp28esjCs
	pjuOii9+SecNhnbXs7sj5f3aTXcTQLnGLk08ov2jE+FSQbHBk4jom6KBsKvqu5NfkWL0H7Y2orj4Y
	rHZapqisAfkLU3+f15o9z+Jg1OB6HPk/vcA1XQAFA1fdgV3BeGibqRYVuKCCOjcSnfajPDgYmST1s
	mSgyDMVT7Bwv6gXbTnEqn1tc38g34bKkTTAE3KWC0PEyIw9x1FvSrEONKmeToL6d6zLPsaZbFqmMv
	GGTJuhnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEql-00000002XX1-0YC2;
	Fri, 09 Jan 2026 15:56:31 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEqj-00000002XWC-0Eqe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 15:56:30 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4ee147baf7bso439761cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 07:56:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767974188; cv=none;
        d=google.com; s=arc-20240605;
        b=kt/AP9i8ZOaakgcY9322ghKigO2ELm7ZJ7fNTso8eoBARK6av1tnBGs8N8wFdK1fcM
         JugkI4R954ov1EkP5/uyputUN3h+Pb2No8Ry9TqUUW2M7H6vjbChptmfkfl5aADIkJJ/
         /e6a6pudj3ukW6QtHb+Pbulj1iiOr8ipur2/90R4vnAA/GaH/EshF8EVMBtrIREtwyXZ
         8XnbNMCNLno05qF/fdqg36HE2F43dF2I/Lgs/7vf2tJ1Ywtiwpdf28vfnM5wv+gMPvHV
         hndPHW/ZwA0yGHMuEQY389jNNH9M2IKAOKsPNYoMLEwHMrU+YXnWdabguJGcaqsXGbcu
         a8cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lO4kv7J4FSmcCFF5cavwgM24+IZ64AUylx9G5mDhyIM=;
        fh=LN+n2avLONec7fDYpn7VyJuJIVHjKAtfVW6aHF1wKhE=;
        b=Qjh6UywiCFeZhC3B0NzKAhCMkCTSL0NknQP73aISBdHvbPZkkI4qkduqKdl/VQ7miz
         paSrKqT6ZnWpzbloMwzP0+RkPn6H8VufKXlmg1CILaAAiqHRqREEt0WYdH1KsuZWEy8P
         ORMOiGXGsSHe2DGCx/1dOw62zkoH3okrK1BBQLGjJFvBNWjfFrpDWDlnjHTcmmkzOK50
         1gTewReEtmFSQNQkL4J/7zckz5ZYPX00a/nwrAdGIwajr/9PmEc3yvRpcvGlHNZTQ77u
         GIC92LnDea9vYPvEeScDYEPF8nYlZzpyE9BUh73Vijb0tZcxwcKO82DEqYBJN9gQ5Mo5
         E9fA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767974188; x=1768578988; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lO4kv7J4FSmcCFF5cavwgM24+IZ64AUylx9G5mDhyIM=;
        b=2T+Xc1uRDeLTg5CyzP+7Id83k6bA1ZMpcPm3RqTlbIz7uwRsBkFOknPpKPhwbrM8Fz
         5W9BI77Y5T6tmq97H4Io1PwvPJGUCA8Ovmy6VCYieZ4U/pWiG8DcGSPmPP+UCL/fybRZ
         Bo+T0OMcHZVvfp2p54N+896Rdnucqt9ICDysiVHO1yPQUYECGY+4fURNb0VSV1jsLsS/
         CEFwPBRVpU2zJb3PNpApK8jX5VtNYy18eb/6xEWDY/nTd3Gxa6b/GM22Dbc2FMGLqTWY
         M+1vVQ1UczXbSOyLUoog48Qj5475h4ZVeq8k5nnY/xLjDGo0YQRVPeaakWDVLIra2Tq/
         7hTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767974188; x=1768578988;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lO4kv7J4FSmcCFF5cavwgM24+IZ64AUylx9G5mDhyIM=;
        b=Urv9G8ux+h1oBe0oDPYCWH9Zf2XmqCy00QUkyQasiJLKd6Gz+7uW/OrkMtE+MJFsNg
         9/aQkquLJAd/G3Xi4N8VExSRmhGAOi/fHnLg/0cgSxQL/1ChQI5pSq3svt68dlQ600/G
         b3QeVYEOuKxn1E3z2OBkbbPMvO/m9kXcAN0yQBbVfd4BvVPwmLdIozZ286LiM8K2z8Qb
         5SoIaf6AVAsgA7URqGUTomE3a4lrTac1v9qtV8hq1XVBeNQ0nw0TXTLXkSTerV5Ma8PS
         u93BBYXXa7BqeaX20SfgUFLXuU4Pd9/FOiJdt3YAFHiNbEV4jRN5+UXo9Jf5l9F7hqsZ
         TYcw==
X-Forwarded-Encrypted: i=1; AJvYcCVqSaceS48t4K9MGIdUpIj1QlLgm8vFaT9SUDJbXKxNaPbRtjidP9pQyzygGoH1XAjHiTHYg8HUhz/ZTMY6szih@lists.infradead.org
X-Gm-Message-State: AOJu0Yyie9MdlAl0nTAaDSNBY25xIZt5pwJOmOEsOd2zTeh7w5iwYm83
	OZCm4b6vXib81rWu3xwA8ZZ0g6Zchml7PKwnwjaqtXW3ktO5Cf0idXXxrhTlFYKCjzJT1bx75b2
	8lf+FC7j05AFtJRgw5/O5vP5B8kTnNJ/tvycJkR/r
X-Gm-Gg: AY/fxX4XW2qZDhnKrUXNFH0UgJWXK4Q5OEEbEI6DbEcqSMlLCqRgeRvrXWSocom13hA
	CDgaqbQ2LbYEc1IrzZHlGC7Ig1WY6Mhlk0wsQ5WCK3b7ta/Gv5dLRkQv7gAZZLt/CdXfwbtNd9X
	jsO2B7N2a0VdWrvFpLeC+RGPC3prLjtjQJ3QbpDB7swwrp5kICtjxgOPSa+M6fPxMFLVbG0LJYw
	G8vLkFjWP9sHPz7c9PSkvkq5z0itENHEPR8ouWSHIUV55E9sradAsn/l8l+Ps0C77w8+WiT
X-Received: by 2002:ac8:5ac6:0:b0:4ff:bf96:db86 with SMTP id
 d75a77b69052e-4ffca3afdd2mr12092391cf.16.1767974187462; Fri, 09 Jan 2026
 07:56:27 -0800 (PST)
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-13-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-13-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 9 Jan 2026 15:55:50 +0000
X-Gm-Features: AZwV_QgHKSx9xrRlwCUXH9McoFdoQwQ7z-YH_ruv5puKBu-bPD_SzO17DT3QY2I
Message-ID: <CA+EHjTw8twejbO+0Adje0pmNJi7EDnRkcLRW5ZgiCwJ7nAna1Q@mail.gmail.com>
Subject: Re: [PATCH v9 13/30] KVM: arm64: Store vector lengths in an array
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
X-CRM114-CacheID: sfid-20260109_075629_174649_62CD4F83 
X-CRM114-Status: GOOD (  29.34  )
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

On Tue, 23 Dec 2025 at 01:22, Mark Brown <broonie@kernel.org> wrote:
>
> SME adds a second vector length configured in a very similar way to the
> SVE vector length, in order to facilitate future code sharing for SME
> refactor our storage of vector lengths to use an array like the host does.
> We do not yet take much advantage of this so the intermediate code is not
> as clean as might be.
>
> No functional change.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/include/asm/kvm_host.h       | 17 +++++++++++------
>  arch/arm64/include/asm/kvm_hyp.h        |  2 +-
>  arch/arm64/include/asm/kvm_pkvm.h       |  2 +-
>  arch/arm64/kvm/fpsimd.c                 |  2 +-
>  arch/arm64/kvm/guest.c                  |  6 +++---
>  arch/arm64/kvm/hyp/include/hyp/switch.h |  6 +++---
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c      |  6 +++---
>  arch/arm64/kvm/hyp/nvhe/pkvm.c          |  7 ++++---
>  arch/arm64/kvm/reset.c                  | 22 +++++++++++-----------
>  9 files changed, 38 insertions(+), 32 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 0816180dc551..3a3330b2a6a9 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -77,8 +77,10 @@ enum kvm_mode kvm_get_mode(void);
>  static inline enum kvm_mode kvm_get_mode(void) { return KVM_MODE_NONE; };
>  #endif
>
> -extern unsigned int __ro_after_init kvm_sve_max_vl;
> -extern unsigned int __ro_after_init kvm_host_sve_max_vl;
> +extern unsigned int __ro_after_init kvm_max_vl[ARM64_VEC_MAX];
> +extern unsigned int __ro_after_init kvm_host_max_vl[ARM64_VEC_MAX];
> +DECLARE_STATIC_KEY_FALSE(userspace_irqchip_in_use);

I think this slipped in here by mistake, i.e., userspace_irqchip_in_use.

With that removed:
Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


> +
>  int __init kvm_arm_init_sve(void);
>
>  u32 __attribute_const__ kvm_target_cpu(void);
> @@ -811,7 +813,7 @@ struct kvm_vcpu_arch {
>          */
>         void *sve_state;
>         enum fp_type fp_type;
> -       unsigned int sve_max_vl;
> +       unsigned int max_vl[ARM64_VEC_MAX];
>
>         /* Stage 2 paging state used by the hardware on next switch */
>         struct kvm_s2_mmu *hw_mmu;
> @@ -1098,9 +1100,12 @@ struct kvm_vcpu_arch {
>
>  /* Pointer to the vcpu's SVE FFR for sve_{save,load}_state() */
>  #define vcpu_sve_pffr(vcpu) (kern_hyp_va((vcpu)->arch.sve_state) +     \
> -                            sve_ffr_offset((vcpu)->arch.sve_max_vl))
> +                            sve_ffr_offset((vcpu)->arch.max_vl[ARM64_VEC_SVE]))
> +
> +#define vcpu_vec_max_vq(vcpu, type) sve_vq_from_vl((vcpu)->arch.max_vl[type])
> +
> +#define vcpu_sve_max_vq(vcpu)  vcpu_vec_max_vq(vcpu, ARM64_VEC_SVE)
>
> -#define vcpu_sve_max_vq(vcpu)  sve_vq_from_vl((vcpu)->arch.sve_max_vl)
>
>  #define vcpu_sve_zcr_elx(vcpu)                                         \
>         (unlikely(is_hyp_ctxt(vcpu)) ? ZCR_EL2 : ZCR_EL1)
> @@ -1119,7 +1124,7 @@ struct kvm_vcpu_arch {
>         __size_ret;                                                     \
>  })
>
> -#define vcpu_sve_state_size(vcpu) sve_state_size_from_vl((vcpu)->arch.sve_max_vl)
> +#define vcpu_sve_state_size(vcpu) sve_state_size_from_vl((vcpu)->arch.max_vl[ARM64_VEC_SVE])
>
>  /*
>   * Only use __vcpu_sys_reg/ctxt_sys_reg if you know you want the
> diff --git a/arch/arm64/include/asm/kvm_hyp.h b/arch/arm64/include/asm/kvm_hyp.h
> index 76ce2b94bd97..0317790dd3b7 100644
> --- a/arch/arm64/include/asm/kvm_hyp.h
> +++ b/arch/arm64/include/asm/kvm_hyp.h
> @@ -146,6 +146,6 @@ extern u64 kvm_nvhe_sym(id_aa64smfr0_el1_sys_val);
>
>  extern unsigned long kvm_nvhe_sym(__icache_flags);
>  extern unsigned int kvm_nvhe_sym(kvm_arm_vmid_bits);
> -extern unsigned int kvm_nvhe_sym(kvm_host_sve_max_vl);
> +extern unsigned int kvm_nvhe_sym(kvm_host_max_vl[ARM64_VEC_MAX]);
>
>  #endif /* __ARM64_KVM_HYP_H__ */
> diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> index 0aecd4ac5f45..0697c88f2210 100644
> --- a/arch/arm64/include/asm/kvm_pkvm.h
> +++ b/arch/arm64/include/asm/kvm_pkvm.h
> @@ -167,7 +167,7 @@ static inline size_t pkvm_host_sve_state_size(void)
>                 return 0;
>
>         return size_add(sizeof(struct cpu_sve_state),
> -                       SVE_SIG_REGS_SIZE(sve_vq_from_vl(kvm_host_sve_max_vl)));
> +                       SVE_SIG_REGS_SIZE(sve_vq_from_vl(kvm_host_max_vl[ARM64_VEC_SVE])));
>  }
>
>  struct pkvm_mapping {
> diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
> index 9158353d8be3..1f4fcc8b5554 100644
> --- a/arch/arm64/kvm/fpsimd.c
> +++ b/arch/arm64/kvm/fpsimd.c
> @@ -75,7 +75,7 @@ void kvm_arch_vcpu_ctxsync_fp(struct kvm_vcpu *vcpu)
>                  */
>                 fp_state.st = &vcpu->arch.ctxt.fp_regs;
>                 fp_state.sve_state = vcpu->arch.sve_state;
> -               fp_state.sve_vl = vcpu->arch.sve_max_vl;
> +               fp_state.sve_vl = vcpu->arch.max_vl[ARM64_VEC_SVE];
>                 fp_state.sme_state = NULL;
>                 fp_state.svcr = __ctxt_sys_reg(&vcpu->arch.ctxt, SVCR);
>                 fp_state.fpmr = __ctxt_sys_reg(&vcpu->arch.ctxt, FPMR);
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index 8c3405b5d7b1..456ef61b6ed5 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -318,7 +318,7 @@ static int get_sve_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>         if (!vcpu_has_sve(vcpu))
>                 return -ENOENT;
>
> -       if (WARN_ON(!sve_vl_valid(vcpu->arch.sve_max_vl)))
> +       if (WARN_ON(!sve_vl_valid(vcpu->arch.max_vl[ARM64_VEC_SVE])))
>                 return -EINVAL;
>
>         memset(vqs, 0, sizeof(vqs));
> @@ -356,7 +356,7 @@ static int set_sve_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>                 if (vq_present(vqs, vq))
>                         max_vq = vq;
>
> -       if (max_vq > sve_vq_from_vl(kvm_sve_max_vl))
> +       if (max_vq > sve_vq_from_vl(kvm_max_vl[ARM64_VEC_SVE]))
>                 return -EINVAL;
>
>         /*
> @@ -375,7 +375,7 @@ static int set_sve_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>                 return -EINVAL;
>
>         /* vcpu->arch.sve_state will be alloc'd by kvm_vcpu_finalize_sve() */
> -       vcpu->arch.sve_max_vl = sve_vl_from_vq(max_vq);
> +       vcpu->arch.max_vl[ARM64_VEC_SVE] = sve_vl_from_vq(max_vq);
>
>         return 0;
>  }
> diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
> index c5d5e5b86eaf..9ce53524d664 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
> @@ -458,8 +458,8 @@ static inline void __hyp_sve_save_host(void)
>         struct cpu_sve_state *sve_state = *host_data_ptr(sve_state);
>
>         sve_state->zcr_el1 = read_sysreg_el1(SYS_ZCR);
> -       write_sysreg_s(sve_vq_from_vl(kvm_host_sve_max_vl) - 1, SYS_ZCR_EL2);
> -       __sve_save_state(sve_state->sve_regs + sve_ffr_offset(kvm_host_sve_max_vl),
> +       write_sysreg_s(sve_vq_from_vl(kvm_host_max_vl[ARM64_VEC_SVE]) - 1, SYS_ZCR_EL2);
> +       __sve_save_state(sve_state->sve_regs + sve_ffr_offset(kvm_host_max_vl[ARM64_VEC_SVE]),
>                          &sve_state->fpsr,
>                          true);
>  }
> @@ -514,7 +514,7 @@ static inline void fpsimd_lazy_switch_to_host(struct kvm_vcpu *vcpu)
>                         zcr_el2 = vcpu_sve_max_vq(vcpu) - 1;
>                         write_sysreg_el2(zcr_el2, SYS_ZCR);
>                 } else {
> -                       zcr_el2 = sve_vq_from_vl(kvm_host_sve_max_vl) - 1;
> +                       zcr_el2 = sve_vq_from_vl(kvm_host_max_vl[ARM64_VEC_SVE]) - 1;
>                         write_sysreg_el2(zcr_el2, SYS_ZCR);
>
>                         zcr_el1 = vcpu_sve_max_vq(vcpu) - 1;
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index a7c689152f68..208e9042aca4 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -34,7 +34,7 @@ static void __hyp_sve_save_guest(struct kvm_vcpu *vcpu)
>          */
>         sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1, SYS_ZCR_EL2);
>         __sve_save_state(vcpu_sve_pffr(vcpu), &vcpu->arch.ctxt.fp_regs.fpsr, true);
> -       write_sysreg_s(sve_vq_from_vl(kvm_host_sve_max_vl) - 1, SYS_ZCR_EL2);
> +       write_sysreg_s(sve_vq_from_vl(kvm_host_max_vl[ARM64_VEC_SVE]) - 1, SYS_ZCR_EL2);
>  }
>
>  static void __hyp_sve_restore_host(void)
> @@ -50,8 +50,8 @@ static void __hyp_sve_restore_host(void)
>          * that was discovered, if we wish to use larger VLs this will
>          * need to be revisited.
>          */
> -       write_sysreg_s(sve_vq_from_vl(kvm_host_sve_max_vl) - 1, SYS_ZCR_EL2);
> -       __sve_restore_state(sve_state->sve_regs + sve_ffr_offset(kvm_host_sve_max_vl),
> +       write_sysreg_s(sve_vq_from_vl(kvm_host_max_vl[ARM64_VEC_SVE]) - 1, SYS_ZCR_EL2);
> +       __sve_restore_state(sve_state->sve_regs + sve_ffr_offset(kvm_host_max_vl[ARM64_VEC_SVE]),
>                             &sve_state->fpsr,
>                             true);
>         write_sysreg_el1(sve_state->zcr_el1, SYS_ZCR);
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index b402dcb7691e..f4ec6695a6a5 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -20,7 +20,7 @@ unsigned long __icache_flags;
>  /* Used by kvm_get_vttbr(). */
>  unsigned int kvm_arm_vmid_bits;
>
> -unsigned int kvm_host_sve_max_vl;
> +unsigned int kvm_host_max_vl[ARM64_VEC_MAX];
>
>  /*
>   * The currently loaded hyp vCPU for each physical CPU. Used in protected mode
> @@ -450,7 +450,8 @@ static int pkvm_vcpu_init_sve(struct pkvm_hyp_vcpu *hyp_vcpu, struct kvm_vcpu *h
>         }
>
>         /* Limit guest vector length to the maximum supported by the host. */
> -       sve_max_vl = min(READ_ONCE(host_vcpu->arch.sve_max_vl), kvm_host_sve_max_vl);
> +       sve_max_vl = min(READ_ONCE(host_vcpu->arch.max_vl[ARM64_VEC_SVE]),
> +                        kvm_host_max_vl[ARM64_VEC_SVE]);
>         sve_state_size = sve_state_size_from_vl(sve_max_vl);
>         sve_state = kern_hyp_va(READ_ONCE(host_vcpu->arch.sve_state));
>
> @@ -464,7 +465,7 @@ static int pkvm_vcpu_init_sve(struct pkvm_hyp_vcpu *hyp_vcpu, struct kvm_vcpu *h
>                 goto err;
>
>         vcpu->arch.sve_state = sve_state;
> -       vcpu->arch.sve_max_vl = sve_max_vl;
> +       vcpu->arch.max_vl[ARM64_VEC_SVE] = sve_max_vl;
>
>         return 0;
>  err:
> diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
> index f7c63e145d54..a8684a1346ec 100644
> --- a/arch/arm64/kvm/reset.c
> +++ b/arch/arm64/kvm/reset.c
> @@ -32,7 +32,7 @@
>
>  /* Maximum phys_shift supported for any VM on this host */
>  static u32 __ro_after_init kvm_ipa_limit;
> -unsigned int __ro_after_init kvm_host_sve_max_vl;
> +unsigned int __ro_after_init kvm_host_max_vl[ARM64_VEC_MAX];
>
>  /*
>   * ARMv8 Reset Values
> @@ -46,14 +46,14 @@ unsigned int __ro_after_init kvm_host_sve_max_vl;
>  #define VCPU_RESET_PSTATE_SVC  (PSR_AA32_MODE_SVC | PSR_AA32_A_BIT | \
>                                  PSR_AA32_I_BIT | PSR_AA32_F_BIT)
>
> -unsigned int __ro_after_init kvm_sve_max_vl;
> +unsigned int __ro_after_init kvm_max_vl[ARM64_VEC_MAX];
>
>  int __init kvm_arm_init_sve(void)
>  {
>         if (system_supports_sve()) {
> -               kvm_sve_max_vl = sve_max_virtualisable_vl();
> -               kvm_host_sve_max_vl = sve_max_vl();
> -               kvm_nvhe_sym(kvm_host_sve_max_vl) = kvm_host_sve_max_vl;
> +               kvm_max_vl[ARM64_VEC_SVE] = sve_max_virtualisable_vl();
> +               kvm_host_max_vl[ARM64_VEC_SVE] = sve_max_vl();
> +               kvm_nvhe_sym(kvm_host_max_vl[ARM64_VEC_SVE]) = kvm_host_max_vl[ARM64_VEC_SVE];
>
>                 /*
>                  * The get_sve_reg()/set_sve_reg() ioctl interface will need
> @@ -61,16 +61,16 @@ int __init kvm_arm_init_sve(void)
>                  * order to support vector lengths greater than
>                  * VL_ARCH_MAX:
>                  */
> -               if (WARN_ON(kvm_sve_max_vl > VL_ARCH_MAX))
> -                       kvm_sve_max_vl = VL_ARCH_MAX;
> +               if (WARN_ON(kvm_max_vl[ARM64_VEC_SVE] > VL_ARCH_MAX))
> +                       kvm_max_vl[ARM64_VEC_SVE] = VL_ARCH_MAX;
>
>                 /*
>                  * Don't even try to make use of vector lengths that
>                  * aren't available on all CPUs, for now:
>                  */
> -               if (kvm_sve_max_vl < sve_max_vl())
> +               if (kvm_max_vl[ARM64_VEC_SVE] < sve_max_vl())
>                         pr_warn("KVM: SVE vector length for guests limited to %u bytes\n",
> -                               kvm_sve_max_vl);
> +                               kvm_max_vl[ARM64_VEC_SVE]);
>         }
>
>         return 0;
> @@ -78,7 +78,7 @@ int __init kvm_arm_init_sve(void)
>
>  static void kvm_vcpu_enable_sve(struct kvm_vcpu *vcpu)
>  {
> -       vcpu->arch.sve_max_vl = kvm_sve_max_vl;
> +       vcpu->arch.max_vl[ARM64_VEC_SVE] = kvm_max_vl[ARM64_VEC_SVE];
>
>         /*
>          * Userspace can still customize the vector lengths by writing
> @@ -99,7 +99,7 @@ static int kvm_vcpu_finalize_vec(struct kvm_vcpu *vcpu)
>         size_t reg_sz;
>         int ret;
>
> -       vl = vcpu->arch.sve_max_vl;
> +       vl = vcpu->arch.max_vl[ARM64_VEC_SVE];
>
>         /*
>          * Responsibility for these properties is shared between
>
> --
> 2.47.3
>

