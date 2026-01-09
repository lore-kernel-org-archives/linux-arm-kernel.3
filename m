Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7ADD26D7B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 18:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fus9hklj3G1seHxQuK5bfg4xK6ZEq5azhzXVMqskmqY=; b=NLJfaATFWOnMPyfHRqZfIYFIEI
	5OL+hIc1W8/fZhxqdm4OLdFgC+/HU1hBOifCXmKuxPiDbdm3bV6evp4wF09/0vCfBjYReg31nOvFt
	gm9aWGlFeem2h0DlA0K7G6Q64mT+vh/I4HA2dSKbdHNHWo2OJzIIi5loj5Cl7zvgxtfBLYvxQKnL/
	3EQ0i42se+3wnpxpaslLsoL0/NswJlrkjCrr13Q3/ax3FRFsVSfY7B0qsC3b47qrZV4LT6Ipn+4Zt
	/MmmC9Jw1Pki7xxBuFx5yDXaiQVRfelgdJ7oECDJOoO++XUa7ljR+ShxJE9ZJ94+fREsYswlu+LZ+
	HA21PUtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGot-00000002ro9-2bv4;
	Fri, 09 Jan 2026 18:02:43 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGos-00000002rnl-06gj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 18:02:43 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4ee147baf7bso38131cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 10:02:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767981760; cv=none;
        d=google.com; s=arc-20240605;
        b=Y42RE3F0S9qUQRdULCjmlkwbjA/KS8nfbE4qU5tzi7VDBkqUtMGy7SqmZSIl1gWFIx
         EPZUZ25bEyDpm/QRJTsA6MVhSTeWAaRBGmOnKmllgn7HNfXV415rnle5L/HFmgeH0Umr
         r1qKqeK98obeNKldukVF+19chW3Z3TXtW5VmNYY9TSIUrgbXGOFM5Xazg7iJ35dKHddj
         y0fJ9OPQncShyeI3l23sJNfEvEKSzPCC0Q2GOaSwFpT3Z0mbnZMvYRZSVtwVrNYrZZh4
         HMkhMk8nbnt2EbxqzPRzhtDrnx+F/j2CDSFAOtZtnDZ+LrEHRXqzVw6Gn9wc4p24X0FD
         OutQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fus9hklj3G1seHxQuK5bfg4xK6ZEq5azhzXVMqskmqY=;
        fh=8bHI2VOWoNhI6ETMB7/avcnES7tPFrggaea1gkYPkMk=;
        b=SdlgRDGbGgVlV6TvX5JSso+LDOpAS6+Bxig0BWWAl1cOV7ayLKjttJa31eOYTVTpkU
         jlrjWNnRx2hszGOCJXvBI8YPCQ9XfsRxAWc5zKlsziaXHFR/yFSgoRzT+yjuwTfNEDaN
         tKvgboExCPNQcPGvQhLD5CphXZXLI70nQf7vb0ZM7d1OkCLHNgBuhopcWJkc+dKu8wxG
         K3xzesRpUWizs55YPkZd+vo/BRBukh288CkEkYsx3s5bwkwwM4K05ovHkG3WiPtYzEis
         Tq/3WkNjv9bZidDJmVSN3h3c6fRqZWRBWwNBK3kTmx2kSCwJ10cUtN4v4E/0kpNtm+0M
         6Z2g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767981760; x=1768586560; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fus9hklj3G1seHxQuK5bfg4xK6ZEq5azhzXVMqskmqY=;
        b=vhrhVe1mzqXpX21yS3XmVzSf/IlaZJ5l+laJPC5DoXjgUPDcK2YpaCHU5CgQ7nix8c
         9no0EMAyEXly40jRsI20mnjDoS4TKg44mf+cYvsn35Xk9dGPF5YpPdWukvQcXzvaoPM9
         +ln0BUv0/sUKHmEa1MF85yKTbIvNMEAXtyC79kmKjYDkgSq+fVfMrjqn15Vz4OhQmL/g
         3E4j4Lr6BjA5InHCsi4zXHd2MzoqPjSANklboqiQeos7/R3gXiS07S1zzJ63KdkHAiAU
         cOysnxnCojIfRy5DnWGzyiEVM4lM5o9RTkJQXVNSZIELhCT6sWLc+R8dVIDw5fU1yLnZ
         VMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767981760; x=1768586560;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fus9hklj3G1seHxQuK5bfg4xK6ZEq5azhzXVMqskmqY=;
        b=oWur0PzDC72lz2vvj1GZ503gN+yj7RWpWG9+9Qr8Aljqv2AQbzTJAZfsI+wESk7Dbv
         Eo4tk2Be6lK+dF3KGIYcf+LNEy8AzXq7FQ6ym3OgBhdPJ0TEx+6JwV/TR8vlj7sJY1Cj
         p9/VyMJzN7CMrmkHJP/Xzj1uAZa6OPlWEU2EFGXNQHkDMWcpxHfjOBsneVfkl9fQB3AE
         Kj9LbusNY+Erl6/vmXrt6r87HMH2Q/n+VFIEbq93KXCAjAFoCfrC4jwVu1AZI7dwcIdt
         a5MlC88Y/V5Tfo0O7WiJnU4qStR6oHTe7q1LIzhHxJwDFE5cXq4XipdmFGdex3bZPdD1
         NsgA==
X-Forwarded-Encrypted: i=1; AJvYcCWrtmw6fz/VlCor7hmPrN2GttIcVjiKG5OZeGTSNTZ/gfxs+hPaot8S2z0q0y10YuNSvVFM+PyL1bGsibJtfgZT@lists.infradead.org
X-Gm-Message-State: AOJu0YwMJEnR0Q4ekFzLghBAa0YIhXZvTYB4hrgcz4WG0nJhKQ5UFRAr
	kfCQYHq9odBc+zmcmtaO6NZjhf8vpoMHxdrr+jncFK9DR49MVE51IDd1eCWUpLeUopR1ITzaBOg
	7xSBrp4Q28DKzo2aK4bIv1TBi3EtC+7SCBot/8cKt
X-Gm-Gg: AY/fxX680a1EN/4VkX0OpBn0rCshZs+Dm476S0Ii5JdQoBS+DUZthgWxZwWZQ9NfXB0
	YDtA8CbSun+tnuwdfbQtuczvxoekjDuu6nYN6FFExr3Nxh3SGOPxlMyLStahOFMKGblp+/R7p0m
	IhVLMRbaeSBUApoZY5sCI4lucMs7WsKAxVWxE8Dvr9+RtOGAbVe/Ad4NGiZF7dezdzBaCbFpLUA
	iSpBcKKL93SQyhEQXr8XLZGhYJG83Z4hKQcn1E2UUwrdEj52wmBPk4vBZaE2BgbHwN5FBK8
X-Received: by 2002:a05:622a:1187:b0:4e5:8707:d31 with SMTP id
 d75a77b69052e-5011856b0f5mr522651cf.7.1767981759778; Fri, 09 Jan 2026
 10:02:39 -0800 (PST)
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-17-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-17-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 9 Jan 2026 18:01:00 +0000
X-Gm-Features: AZwV_QiYol_KQciMdPiGzXkA1B5EfVQnDlekgBd_EKl4LUMtbj0GKBGclxvm6Ig
Message-ID: <CA+EHjTxaL7YwztugxyhS--948WUQ5BkME-P1cmrHvvJqEGEEBA@mail.gmail.com>
Subject: Re: [PATCH v9 17/30] KVM: arm64: Support SME identification registers
 for guests
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
X-CRM114-CacheID: sfid-20260109_100242_132350_D960DC0A 
X-CRM114-Status: GOOD (  43.45  )
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

.



On Tue, 23 Dec 2025 at 01:22, Mark Brown <broonie@kernel.org> wrote:
>
> The primary register for identifying SME is ID_AA64PFR1_EL1.SME.  This
> is hidden from guests unless SME is enabled by the VMM.
> When it is visible it is writable and can be used to control the
> availability of SME2.
>
> There is also a new register ID_AA64SMFR0_EL1 which we make writable,
> forcing it to all bits 0 if SME is disabled.  This includes the field
> SMEver giving the SME version, userspace is responsible for ensuring
> the value is consistent with ID_AA64PFR1_EL1.SME.  It also includes
> FA64, a separately enableable extension which provides the full FPSIMD
> and SVE instruction set including FFR in streaming mode.  Userspace can
> control the availability of FA64 by writing to this field.  The other
> features enumerated there only add new instructions, there are no
> architectural controls for these.
>
> There is a further identification register SMIDR_EL1 which provides a
> basic description of the SME microarchitecture, in a manner similar to
> MIDR_EL1 for the PE.  It also describes support for priority management
> and a basic affinity description for shared SME units, plus some RES0
> space.  We do not support priority management for guests so this is
> hidden from guests, along with any new fields.
>
> As for MIDR_EL1 and REVIDR_EL1 we expose the implementer and revision
> information to guests with the raw value from the CPU we are running on,
> this may present issues for asymmetric systems or for migration as it
> does for the existing registers.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_host.h          |  3 +++
>  arch/arm64/kvm/config.c                    |  8 +-----
>  arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 11 ++++++++
>  arch/arm64/kvm/hyp/nvhe/pkvm.c             |  4 ++-
>  arch/arm64/kvm/sys_regs.c                  | 40 +++++++++++++++++++++++++++---
>  5 files changed, 54 insertions(+), 12 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 825b74f752d6..fead6988f47c 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -400,6 +400,7 @@ struct kvm_arch {
>         u64 revidr_el1;
>         u64 aidr_el1;
>         u64 ctr_el0;
> +       u64 smidr_el1;
>
>         /* Masks for VNCR-backed and general EL2 sysregs */
>         struct kvm_sysreg_masks *sysreg_masks;
> @@ -1543,6 +1544,8 @@ static inline u64 *__vm_id_reg(struct kvm_arch *ka, u32 reg)
>                 return &ka->revidr_el1;
>         case SYS_AIDR_EL1:
>                 return &ka->aidr_el1;
> +       case SYS_SMIDR_EL1:
> +               return &ka->smidr_el1;
>         default:
>                 WARN_ON_ONCE(1);
>                 return NULL;
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index 24bb3f36e9d5..7e26991b2df1 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -274,14 +274,8 @@ static bool feat_anerr(struct kvm *kvm)
>
>  static bool feat_sme_smps(struct kvm *kvm)
>  {
> -       /*
> -        * Revists this if KVM ever supports SME -- this really should
> -        * look at the guest's view of SMIDR_EL1. Funnily enough, this
> -        * is not captured in the JSON file, but only as a note in the
> -        * ARM ARM.
> -        */
>         return (kvm_has_feat(kvm, FEAT_SME) &&
> -               (read_sysreg_s(SYS_SMIDR_EL1) & SMIDR_EL1_SMPS));
> +               (kvm_read_vm_id_reg(kvm, SYS_SMIDR_EL1) & SMIDR_EL1_SMPS));
>  }
>
>  static bool feat_spe_fds(struct kvm *kvm)
> diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> index 8c3b3d6df99f..d921db152119 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> @@ -125,6 +125,17 @@ static inline u64 ctxt_midr_el1(struct kvm_cpu_context *ctxt)
>         return kvm_read_vm_id_reg(kvm, SYS_MIDR_EL1);
>  }
>
> +static inline u64 ctxt_smidr_el1(struct kvm_cpu_context *ctxt)
> +{
> +       struct kvm *kvm = kern_hyp_va(ctxt_to_vcpu(ctxt)->kvm);
> +
> +       if (!(ctxt_is_guest(ctxt) &&
> +             test_bit(KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS, &kvm->arch.flags)))
> +               return read_sysreg_s(SYS_SMIDR_EL1);
> +
> +       return kvm_read_vm_id_reg(kvm, SYS_SMIDR_EL1);
> +}

AFAIKT, this isn't used anywhere in this series. Dead code from a
previous iteration?

> +
>  static inline void __sysreg_save_common_state(struct kvm_cpu_context *ctxt)
>  {
>         *ctxt_mdscr_el1(ctxt)   = read_sysreg(mdscr_el1);
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index f4ec6695a6a5..b656449dff69 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -351,8 +351,10 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
>                             host_kvm->arch.vcpu_features,
>                             KVM_VCPU_MAX_FEATURES);
>
> -               if (test_bit(KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS, &host_arch_flags))
> +               if (test_bit(KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS, &host_arch_flags)) {
>                         hyp_vm->kvm.arch.midr_el1 = host_kvm->arch.midr_el1;
> +                       hyp_vm->kvm.arch.smidr_el1 = host_kvm->arch.smidr_el1;
> +               }
>
>                 return;
>         }
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 7e550f045f4d..a7ab02822023 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -1893,6 +1893,10 @@ static unsigned int id_visibility(const struct kvm_vcpu *vcpu,
>                 if (!vcpu_has_sve(vcpu))
>                         return REG_RAZ;
>                 break;
> +       case SYS_ID_AA64SMFR0_EL1:
> +               if (!vcpu_has_sme(vcpu))
> +                       return REG_RAZ;
> +               break;
>         }
>
>         return 0;
> @@ -1920,10 +1924,25 @@ static unsigned int raz_visibility(const struct kvm_vcpu *vcpu,
>
>  /* cpufeature ID register access trap handlers */
>
> +static bool hidden_id_reg(struct kvm_vcpu *vcpu,
> +                         struct sys_reg_params *p,
> +                         const struct sys_reg_desc *r)
> +{
> +       switch (reg_to_encoding(r)) {
> +       case SYS_SMIDR_EL1:
> +               return !vcpu_has_sme(vcpu);
> +       default:
> +               return false;
> +       }
> +}
> +
>  static bool access_id_reg(struct kvm_vcpu *vcpu,
>                           struct sys_reg_params *p,
>                           const struct sys_reg_desc *r)
>  {
> +       if (hidden_id_reg(vcpu, p, r))
> +               return bad_trap(vcpu, p, r, "write to hidden ID register");
> +

The code in this file confuses me at times, that said, the
hidden_id_reg() check is added to access_id_reg(). However, SMIDR_EL1
is defined using IMPLEMENTATION_ID, which routes to
access_imp_id_reg(). This means the visibility check is bypassed for
SMIDR_EL1, and a guest without SME can still read the register.

>         if (p->is_write)
>                 return write_to_read_only(vcpu, p, r);
>
> @@ -2012,7 +2031,9 @@ static u64 sanitise_id_aa64pfr1_el1(const struct kvm_vcpu *vcpu, u64 val)
>               SYS_FIELD_GET(ID_AA64PFR0_EL1, RAS, pfr0) == ID_AA64PFR0_EL1_RAS_IMP))
>                 val &= ~ID_AA64PFR1_EL1_RAS_frac;
>
> -       val &= ~ID_AA64PFR1_EL1_SME;
> +       if (!kvm_has_sme(vcpu->kvm))
> +               val &= ~ID_AA64PFR1_EL1_SME;
> +
>         val &= ~ID_AA64PFR1_EL1_RNDR_trap;
>         val &= ~ID_AA64PFR1_EL1_NMI;
>         val &= ~ID_AA64PFR1_EL1_GCS;
> @@ -3038,6 +3059,9 @@ static bool access_imp_id_reg(struct kvm_vcpu *vcpu,
>         case SYS_AIDR_EL1:
>                 p->regval = read_sysreg(aidr_el1);
>                 break;
> +       case SYS_SMIDR_EL1:
> +               p->regval = read_sysreg_s(SYS_SMIDR_EL1);
> +               break;

In access_imp_id_reg(), we are returning the raw hardware value for
SYS_SMIDR_EL1. Since this register is not automatically sanitized by
the ID register infra, shouldn't we apply r->val here? Without this,
the bits we intended to hide leak to the guest.

I think this should apply to this function as a whole. For now, the
other two REVIDR_EL1 and AIDR_EL1 have a mask that covers the whole
register (so doing that preserves that behavior), but if we add more
registers similar to SMIDR_EL1, they also need to be sanitised.


>         default:
>                 WARN_ON_ONCE(1);
>         }
> @@ -3048,12 +3072,15 @@ static bool access_imp_id_reg(struct kvm_vcpu *vcpu,
>  static u64 __ro_after_init boot_cpu_midr_val;
>  static u64 __ro_after_init boot_cpu_revidr_val;
>  static u64 __ro_after_init boot_cpu_aidr_val;
> +static u64 __ro_after_init boot_cpu_smidr_val;
>
>  static void init_imp_id_regs(void)
>  {
>         boot_cpu_midr_val = read_sysreg(midr_el1);
>         boot_cpu_revidr_val = read_sysreg(revidr_el1);
>         boot_cpu_aidr_val = read_sysreg(aidr_el1);
> +       if (system_supports_sme())
> +               boot_cpu_smidr_val = read_sysreg_s(SYS_SMIDR_EL1);
>  }
>
>  static u64 reset_imp_id_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
> @@ -3065,6 +3092,8 @@ static u64 reset_imp_id_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
>                 return boot_cpu_revidr_val;
>         case SYS_AIDR_EL1:
>                 return boot_cpu_aidr_val;
> +       case SYS_SMIDR_EL1:
> +               return boot_cpu_smidr_val;

Similarly, this should probably return boot_cpu_smidr_val & r->val.
Otherwise, the internal feat_sme_smps() check will report the feature
as present for the guest if the host supports it, creating an
inconsistency between KVM's internal view and the guest-visible ID
register.

Cheers,
/fuad



>         default:
>                 KVM_BUG_ON(1, vcpu->kvm);
>                 return 0;
> @@ -3229,7 +3258,6 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>                                        ID_AA64PFR1_EL1_MTE_frac |
>                                        ID_AA64PFR1_EL1_NMI |
>                                        ID_AA64PFR1_EL1_RNDR_trap |
> -                                      ID_AA64PFR1_EL1_SME |
>                                        ID_AA64PFR1_EL1_RES0 |
>                                        ID_AA64PFR1_EL1_MPAM_frac |
>                                        ID_AA64PFR1_EL1_MTE)),
> @@ -3239,7 +3267,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>                     ID_AA64PFR2_EL1_MTESTOREONLY),
>         ID_UNALLOCATED(4,3),
>         ID_WRITABLE(ID_AA64ZFR0_EL1, ~ID_AA64ZFR0_EL1_RES0),
> -       ID_HIDDEN(ID_AA64SMFR0_EL1),
> +       ID_WRITABLE(ID_AA64SMFR0_EL1, ~ID_AA64SMFR0_EL1_RES0),
>         ID_UNALLOCATED(4,6),
>         ID_WRITABLE(ID_AA64FPFR0_EL1, ~ID_AA64FPFR0_EL1_RES0),
>
> @@ -3446,7 +3474,11 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>         { SYS_DESC(SYS_CLIDR_EL1), access_clidr, reset_clidr, CLIDR_EL1,
>           .set_user = set_clidr, .val = ~CLIDR_EL1_RES0 },
>         { SYS_DESC(SYS_CCSIDR2_EL1), undef_access },
> -       { SYS_DESC(SYS_SMIDR_EL1), undef_access },
> +       IMPLEMENTATION_ID(SMIDR_EL1, (SMIDR_EL1_NSMC | SMIDR_EL1_HIP |
> +                                     SMIDR_EL1_AFFINITY2 |
> +                                     SMIDR_EL1_IMPLEMENTER |
> +                                     SMIDR_EL1_REVISION | SMIDR_EL1_SH |
> +                                     SMIDR_EL1_AFFINITY)),
>         IMPLEMENTATION_ID(AIDR_EL1, GENMASK_ULL(63, 0)),
>         { SYS_DESC(SYS_CSSELR_EL1), access_csselr, reset_unknown, CSSELR_EL1 },
>         ID_FILTERED(CTR_EL0, ctr_el0,
>
> --
> 2.47.3
>

