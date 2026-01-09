Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1501D26D6E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 16:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S7VtbjVgRK26yiEqOOgv/l78iDPH0hDYbqMKU+cHyxE=; b=hLv0JykHUKVQ3c5ffd08JRvYG3
	jJjOJQ7QGrxHIvqCFhkYOxQL4RIFgYvm/j//jjQOGbTa5LihP7ZBgnnCZ3iwkXTlxedBT/idJ1t4e
	E3RlX+pnsGQ+We0Vn9ZGKVOuZ3xhIIa04lQpKpjQcInRnaurbIZFgB8OCtijPQG0HUzuRJekCv8ZS
	SRerbhnRHJHeAuHpuk1B3bCVh30iTV8GuI00axqbbInTHzxs0Vo4HcArbU/UQm835FZXKbKXTIMls
	A7shkNFJTdhcMvBrQAlBMWOIkqgnqxWZ//ebCdGPXdQ8MCWOz/Fw7NEHz10ru8uLP19+2CTIYiRKZ
	kC7WlUkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEuy-00000002YAL-2o1R;
	Fri, 09 Jan 2026 16:00:52 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEuv-00000002Y9r-1NQ4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 16:00:51 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4ee243b98caso356541cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 08:00:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767974448; cv=none;
        d=google.com; s=arc-20240605;
        b=JUpq1wMTqdchXFz7jzp4NKQuNlMdNtfLI9R5uutbyqpI1gw1t/HINL1hroSRFxhE/j
         tivySPhczrCYB0d2SrQ79PPa9zKMIzdYz4wBSoVnkpngjdT22V1t4dotHvc0vrG6NMrm
         BlHVhTwS1GlhTjvW3jgsF7YrRq9nVuMi6rAstJ49KDz7DgOE72X2ktrlQLh9buNtk5+9
         i+6qcqUqQRijAr/7ZVsFojICSBj4iNf4UB9fdtQp41oSo+BaCX7n/nV2VOT4NO4q2g3b
         K/spq8nrrXRqRjPTbAzw+ByWIsAKH7W1ClAG3RfaHA8W5veO6w6aDa3veTfAD1eQDFQc
         EBcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S7VtbjVgRK26yiEqOOgv/l78iDPH0hDYbqMKU+cHyxE=;
        fh=mx2fRU4HqMkN9bRairsGWC5LX/9XI7agdrFXsnkctqU=;
        b=jFGcwR6DBOjy/J4mdf2NgLOh1qQ4Iqyb3QLt4t/lF7SmvUR8ie6+Ilnvo+yVkC8Kj/
         YlFRWDHcvJ5WqdgMnPeoBbFJwM3xeSBSw65W/pravgsuLj5/gjpd3IXnw5rgwlUV8E1d
         vAPOQTiskgf9ydGArQmpDujautwJY7X4/S8IPWnLgTGLm/TGw20+VymAGAUcBeS+AKx+
         bJUv3yee7t6TcM3vrLfqPW7puoDOizRynbhZcpOz3yglYwveN6XyM5qNOYdiJKCFLcm8
         Bpvt5US4CvSzKtMX5cU7HO1vTEDmSTXPQR+Ds764Va0njMdl9Ev7YY6UdW4Re4rgxwZq
         GZ7A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767974448; x=1768579248; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S7VtbjVgRK26yiEqOOgv/l78iDPH0hDYbqMKU+cHyxE=;
        b=g2F+r8usQGUCqesjYDpfX5hSoavUgMiF2prD7MpOXvn13qOSM8A39RucI/SRUwl9ky
         JAxXxV2V66+lYRsaiO/5FoDFTLVofAS7dlHI/N30rmrgaGLlIYZoUtOAeTulh637bRk7
         B9valOFwa6To4B1FC9ofvuD5GXdPDFY09KtoIXi+dcmymXRzTjDbw4+3fXs1ZvUaCWld
         WmEI6VI+3F+OUzGYHeU811M+2INP00fBwOPdG+trHgiqTsaDGd9piSz1j3/+G5aRytoE
         PxmIGuI5d+iIP0OQhj2k5bioSu572MU0QszI9c5FzZRLDkLrTtaMlR7gnq7X9Lo25+I9
         F/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767974448; x=1768579248;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7VtbjVgRK26yiEqOOgv/l78iDPH0hDYbqMKU+cHyxE=;
        b=Vwy4Hnvgy68W1Qi+0czU+pZwF5j7bcGLD1SRRxBQHMyhIsnR06HIEl/De3pqmeDx61
         vLvAyvPjyMZEkz+MkxFiE1dWnANOhDu7psN4d/ScQ6RcHKwmVSPDF6/7a0V8B589RIzc
         UEjBKqixQuwpdL5ghThhqumWQ8xXRqkJ54OlMzChrNc6HnSsMyMYZlf3lKNjUiAspFz6
         D4q6hdfkd4ySCxXnS3UJ1AKLLS2hhlMIDpdAPDNpk3DzGpgS4EeThmWV7tiL3K6OFEKN
         m8dAoKOCSTGPiY0D42auf9/kSWnxeWzfLxruzBZfTcglJ8I5nQe3jN9TkS/gagEkLgC7
         KFTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeaJlEaGiXwHOyzCyuG8rc+WD9ApTIHwArQlMY13gcBeqCTnKxcLfTfBf6RRQTFyHyAXUgjDN9opOM99DInamB@lists.infradead.org
X-Gm-Message-State: AOJu0YziHUEFJRB6wn+FLzw4NAQUHw5Dq9032zg51sUuPniOqFFH9zgz
	gkPfGCTWbPsp3fSqnwV1LrKLPtizkfvSKZ/kzLru+aQxGRBrwCs2Cpw1qkf5y7u0oQFcs5NH0ud
	WXUbhqYcF8/MGnG+MlDMJfzaZ7Cirg2ZuvYj82gse
X-Gm-Gg: AY/fxX5oDbyWij5QYllQ1RnzpPUNDFwLAbpnvni9liLfTSsEB0tW6cn4CWEygHouBot
	ei+idFat5DfRZyFqz3X+GCb3VTt8DQh6u3ilf1EtFMHZ1BRl8wdczNgdr0Awf2LQa5fHEAraGjr
	AwcbbUaOP7pmfIBXxQBpHmS2uT+s3ZQLhR/Y4K31hrbx6XGZa/NBccA03zxfzxWFFyd2Uz7AHIM
	k1rgs8rBn2ajMar7Y6ImaIErVBpr/gImKyyaeZaCpoKwUeISQ6LmVPK4djaiEqK2QsJzyu4
X-Received: by 2002:ac8:5fc5:0:b0:4b7:9a9e:833f with SMTP id
 d75a77b69052e-4ffcb1e49dbmr10419571cf.7.1767974445761; Fri, 09 Jan 2026
 08:00:45 -0800 (PST)
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-14-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-14-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 9 Jan 2026 15:59:00 +0000
X-Gm-Features: AZwV_QjAJH2K5qg87J2uUGDkra1sJbu4XzFdX96_aa60XR7lg7WJ3FZ7haLvZNk
Message-ID: <CA+EHjTw-6-BFcr60+tgDzOE-OfcetD7yQtbNMkqr7BgiMXfeJA@mail.gmail.com>
Subject: Re: [PATCH v9 14/30] KVM: arm64: Implement SME vector length configuration
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
X-CRM114-CacheID: sfid-20260109_080049_465692_DCAF891A 
X-CRM114-Status: GOOD (  37.63  )
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
> SME implements a vector length which architecturally looks very similar
> to that for SVE, configured in a very similar manner.  This controls the
> vector length used for the ZA matrix register, and for the SVE vector
> and predicate registers when in streaming mode.  The only substantial
> difference is that unlike SVE the architecture does not guarantee that
> any particular vector length will be implemented.
>
> Configuration for SME vector lengths is done using a virtual register as
> for SVE, hook up the implementation for the virtual register.  Since we
> do not yet have support for any of the new SME registers stub register
> access functions are provided that only allow VL configuration.  These
> will be extended as the SME specific registers, as for SVE.
>
> Since vq_available() is currently only defined for CONFIG_SVE add a stub
> for builds where that is disabled.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/include/asm/fpsimd.h   |  1 +
>  arch/arm64/include/asm/kvm_host.h | 24 ++++++++++--
>  arch/arm64/include/uapi/asm/kvm.h |  9 +++++
>  arch/arm64/kvm/guest.c            | 82 +++++++++++++++++++++++++++++++--------
>  4 files changed, 96 insertions(+), 20 deletions(-)
>
> diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
> index 146c1af55e22..8b0840bd7e14 100644
> --- a/arch/arm64/include/asm/fpsimd.h
> +++ b/arch/arm64/include/asm/fpsimd.h
> @@ -340,6 +340,7 @@ static inline int sve_max_vl(void)
>         return -EINVAL;
>  }
>
> +static inline bool vq_available(enum vec_type type, unsigned int vq) { return false; }
>  static inline bool sve_vq_available(unsigned int vq) { return false; }
>
>  static inline void sve_user_disable(void) { BUILD_BUG(); }
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 3a3330b2a6a9..b41700df3ce9 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -810,8 +810,15 @@ struct kvm_vcpu_arch {
>          * low 128 bits of the SVE Z registers.  When the core
>          * floating point code saves the register state of a task it
>          * records which view it saved in fp_type.
> +        *
> +        * If SME support is also present then it provides an
> +        * alternative view of the SVE registers accessed as for the Z
> +        * registers when PSTATE.SM is 1, plus an additional set of
> +        * SME specific state in the matrix register ZA and LUT
> +        * register ZT0.
>          */
>         void *sve_state;
> +       void *sme_state;
>         enum fp_type fp_type;
>         unsigned int max_vl[ARM64_VEC_MAX];
>
> @@ -1098,14 +1105,23 @@ struct kvm_vcpu_arch {
>
>  #define vcpu_gp_regs(v)                (&(v)->arch.ctxt.regs)
>
> -/* Pointer to the vcpu's SVE FFR for sve_{save,load}_state() */
> -#define vcpu_sve_pffr(vcpu) (kern_hyp_va((vcpu)->arch.sve_state) +     \
> -                            sve_ffr_offset((vcpu)->arch.max_vl[ARM64_VEC_SVE]))
> -
>  #define vcpu_vec_max_vq(vcpu, type) sve_vq_from_vl((vcpu)->arch.max_vl[type])
>
>  #define vcpu_sve_max_vq(vcpu)  vcpu_vec_max_vq(vcpu, ARM64_VEC_SVE)
> +#define vcpu_sme_max_vq(vcpu)  vcpu_vec_max_vq(vcpu, ARM64_VEC_SME)
> +
> +#define vcpu_sve_max_vl(vcpu)  ((vcpu)->arch.max_vl[ARM64_VEC_SVE])
> +#define vcpu_sme_max_vl(vcpu)  ((vcpu)->arch.max_vl[ARM64_VEC_SME])
>
> +#define vcpu_max_vl(vcpu) max(vcpu_sve_max_vl(vcpu), vcpu_sme_max_vl(vcpu))
> +#define vcpu_max_vq(vcpu) sve_vq_from_vl(vcpu_max_vl(vcpu))
> +
> +#define vcpu_cur_sve_vl(vcpu) (vcpu_in_streaming_mode(vcpu) ? \
> +                              vcpu_sme_max_vl(vcpu) : vcpu_sve_max_vl(vcpu))

nit: This isn't really the current VL, but the current max VL. That
said, I don't think 'cur_max` is a better name. Maybe a comment or
something?

> +/* Pointer to the vcpu's SVE FFR for sve_{save,load}_state() */
> +#define vcpu_sve_pffr(vcpu) (kern_hyp_va((vcpu)->arch.sve_state) +     \
> +                            sve_ffr_offset(vcpu_cur_sve_vl(vcpu)))
>
>  #define vcpu_sve_zcr_elx(vcpu)                                         \
>         (unlikely(is_hyp_ctxt(vcpu)) ? ZCR_EL2 : ZCR_EL1)
> diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
> index c67564f02981..498a49a61487 100644
> --- a/arch/arm64/include/uapi/asm/kvm.h
> +++ b/arch/arm64/include/uapi/asm/kvm.h
> @@ -354,6 +354,15 @@ struct kvm_arm_counter_offset {
>  #define KVM_ARM64_SVE_VLS_WORDS        \
>         ((KVM_ARM64_SVE_VQ_MAX - KVM_ARM64_SVE_VQ_MIN) / 64 + 1)
>
> +/* SME registers */
> +#define KVM_REG_ARM64_SME              (0x17 << KVM_REG_ARM_COPROC_SHIFT)
> +
> +/* Vector lengths pseudo-register: */
> +#define KVM_REG_ARM64_SME_VLS          (KVM_REG_ARM64 | KVM_REG_ARM64_SME | \
> +                                        KVM_REG_SIZE_U512 | 0xfffe)
> +#define KVM_ARM64_SME_VLS_WORDS        \
> +       ((KVM_ARM64_SVE_VQ_MAX - KVM_ARM64_SVE_VQ_MIN) / 64 + 1)
> +
>  /* Bitmap feature firmware registers */
>  #define KVM_REG_ARM_FW_FEAT_BMAP               (0x0016 << KVM_REG_ARM_COPROC_SHIFT)
>  #define KVM_REG_ARM_FW_FEAT_BMAP_REG(r)                (KVM_REG_ARM64 | KVM_REG_SIZE_U64 | \
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index 456ef61b6ed5..2a1fdcb0ec49 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -310,22 +310,20 @@ static int set_core_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>  #define vq_mask(vq) ((u64)1 << ((vq) - SVE_VQ_MIN) % 64)
>  #define vq_present(vqs, vq) (!!((vqs)[vq_word(vq)] & vq_mask(vq)))
>
> -static int get_sve_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
> +static int get_vec_vls(enum vec_type vec_type, struct kvm_vcpu *vcpu,
> +                     const struct kvm_one_reg *reg)
>  {
>         unsigned int max_vq, vq;
>         u64 vqs[KVM_ARM64_SVE_VLS_WORDS];
>
> -       if (!vcpu_has_sve(vcpu))
> -               return -ENOENT;
> -
> -       if (WARN_ON(!sve_vl_valid(vcpu->arch.max_vl[ARM64_VEC_SVE])))
> +       if (WARN_ON(!sve_vl_valid(vcpu->arch.max_vl[vec_type])))
>                 return -EINVAL;
>
>         memset(vqs, 0, sizeof(vqs));
>
> -       max_vq = vcpu_sve_max_vq(vcpu);
> +       max_vq = vcpu_vec_max_vq(vcpu, vec_type);
>         for (vq = SVE_VQ_MIN; vq <= max_vq; ++vq)
> -               if (sve_vq_available(vq))
> +               if (vq_available(vec_type, vq))
>                         vqs[vq_word(vq)] |= vq_mask(vq);
>
>         if (copy_to_user((void __user *)reg->addr, vqs, sizeof(vqs)))
> @@ -334,40 +332,41 @@ static int get_sve_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>         return 0;
>  }
>
> -static int set_sve_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
> +static int set_vec_vls(enum vec_type vec_type, struct kvm_vcpu *vcpu,
> +                      const struct kvm_one_reg *reg)
>  {
>         unsigned int max_vq, vq;
>         u64 vqs[KVM_ARM64_SVE_VLS_WORDS];
>
> -       if (!vcpu_has_sve(vcpu))
> -               return -ENOENT;
> -
>         if (kvm_arm_vcpu_vec_finalized(vcpu))
>                 return -EPERM; /* too late! */
>
> -       if (WARN_ON(vcpu->arch.sve_state))
> +       if (WARN_ON(!sve_vl_valid(vcpu->arch.max_vl[vec_type])))
>                 return -EINVAL;
>
>         if (copy_from_user(vqs, (const void __user *)reg->addr, sizeof(vqs)))
>                 return -EFAULT;
>
> +       if (WARN_ON(vcpu->arch.sve_state || vcpu->arch.sme_state))
> +               return -EINVAL;
> +

Can this ever happen? kvm_arm_vcpu_vec_finalized() is checked above,
and vcpu->arch.{sve,sme}_state are only assigned in
kvm_vcpu_finalize_vec() immediately before setting the finalized flag.

Cheers,
/fuad



>         max_vq = 0;
>         for (vq = SVE_VQ_MIN; vq <= SVE_VQ_MAX; ++vq)
>                 if (vq_present(vqs, vq))
>                         max_vq = vq;
>
> -       if (max_vq > sve_vq_from_vl(kvm_max_vl[ARM64_VEC_SVE]))
> +       if (max_vq > sve_vq_from_vl(kvm_max_vl[vec_type]))
>                 return -EINVAL;
>
>         /*
>          * Vector lengths supported by the host can't currently be
>          * hidden from the guest individually: instead we can only set a
> -        * maximum via ZCR_EL2.LEN.  So, make sure the available vector
> +        * maximum via xCR_EL2.LEN.  So, make sure the available vector
>          * lengths match the set requested exactly up to the requested
>          * maximum:
>          */
>         for (vq = SVE_VQ_MIN; vq <= max_vq; ++vq)
> -               if (vq_present(vqs, vq) != sve_vq_available(vq))
> +               if (vq_present(vqs, vq) != vq_available(vec_type, vq))
>                         return -EINVAL;
>
>         /* Can't run with no vector lengths at all: */
> @@ -375,11 +374,27 @@ static int set_sve_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>                 return -EINVAL;
>
>         /* vcpu->arch.sve_state will be alloc'd by kvm_vcpu_finalize_sve() */
> -       vcpu->arch.max_vl[ARM64_VEC_SVE] = sve_vl_from_vq(max_vq);
> +       vcpu->arch.max_vl[vec_type] = sve_vl_from_vq(max_vq);
>
>         return 0;
>  }
>
> +static int get_sve_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
> +{
> +       if (!vcpu_has_sve(vcpu))
> +               return -ENOENT;
> +
> +       return get_vec_vls(ARM64_VEC_SVE, vcpu, reg);
> +}
> +
> +static int set_sve_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
> +{
> +       if (!vcpu_has_sve(vcpu))
> +               return -ENOENT;
> +
> +       return set_vec_vls(ARM64_VEC_SVE, vcpu, reg);
> +}
> +
>  #define SVE_REG_SLICE_SHIFT    0
>  #define SVE_REG_SLICE_BITS     5
>  #define SVE_REG_ID_SHIFT       (SVE_REG_SLICE_SHIFT + SVE_REG_SLICE_BITS)
> @@ -533,6 +548,39 @@ static int set_sve_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>         return 0;
>  }
>
> +static int get_sme_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
> +{
> +       if (!vcpu_has_sme(vcpu))
> +               return -ENOENT;
> +
> +       return get_vec_vls(ARM64_VEC_SME, vcpu, reg);
> +}
> +
> +static int set_sme_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
> +{
> +       if (!vcpu_has_sme(vcpu))
> +               return -ENOENT;
> +
> +       return set_vec_vls(ARM64_VEC_SME, vcpu, reg);
> +}
> +
> +static int get_sme_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
> +{
> +       /* Handle the KVM_REG_ARM64_SME_VLS pseudo-reg as a special case: */
> +       if (reg->id == KVM_REG_ARM64_SME_VLS)
> +               return get_sme_vls(vcpu, reg);
> +
> +       return -EINVAL;
> +}
> +
> +static int set_sme_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
> +{
> +       /* Handle the KVM_REG_ARM64_SME_VLS pseudo-reg as a special case: */
> +       if (reg->id == KVM_REG_ARM64_SME_VLS)
> +               return set_sme_vls(vcpu, reg);
> +
> +       return -EINVAL;
> +}
>  int kvm_arch_vcpu_ioctl_get_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs)
>  {
>         return -EINVAL;
> @@ -711,6 +759,7 @@ int kvm_arm_get_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>         case KVM_REG_ARM_FW_FEAT_BMAP:
>                 return kvm_arm_get_fw_reg(vcpu, reg);
>         case KVM_REG_ARM64_SVE: return get_sve_reg(vcpu, reg);
> +       case KVM_REG_ARM64_SME: return get_sme_reg(vcpu, reg);
>         }
>
>         return kvm_arm_sys_reg_get_reg(vcpu, reg);
> @@ -728,6 +777,7 @@ int kvm_arm_set_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>         case KVM_REG_ARM_FW_FEAT_BMAP:
>                 return kvm_arm_set_fw_reg(vcpu, reg);
>         case KVM_REG_ARM64_SVE: return set_sve_reg(vcpu, reg);
> +       case KVM_REG_ARM64_SME: return set_sme_reg(vcpu, reg);
>         }
>
>         return kvm_arm_sys_reg_set_reg(vcpu, reg);
>
> --
> 2.47.3
>

