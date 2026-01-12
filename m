Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BE5CF45C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 19:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CI3Qkkbb89cv5bbaE9HcvbYXyBW2GfCAOd3nwRVqS/M=; b=YYjgrQsvow4SAst7qEjRktQ35g
	z1Gwq1lMhYbN+bfOjwEtS6/m4L/1nBTV7ASiOtohhvc+Fiodfd5Xrqw23a5mjmr9SA0XFtnBQY4o3
	yJMDUlu26NR0JuyekV10wUcqqEAZ0K1FSZmFsg1VlSmLs7/uowZoSXo3wNwMEfrOE8Q3XC1vsZgK+
	AS1tUx9UmWl+DTsIRoBR+XiMbAgnI9yzgvJ7BzuqbrFmlFJR6EvQI/JzuejbhO7uzCda/TlZzWLWm
	pYuz5pClNXFSoq71QyzhsUmmyRlur3o0m4xK+8fbnO1V9QmdWUIDbCwu+iJCTQLA+CY4KubzAkuwT
	rCmiEv9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNI6-00000005xd3-2qoH;
	Mon, 12 Jan 2026 19:09:26 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNI3-00000005xce-2Fz8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 19:09:24 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4ee147baf7bso30121cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 11:09:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768244962; cv=none;
        d=google.com; s=arc-20240605;
        b=kqWUkXSwxfrgtY0P6IYgK4+NR9Jlldft8sLWEPgE0kA8CBqZ/8tMEyCxtRA9VxSod9
         IelOmHf3WtS6UfhMZNAQ++AljHXG57KrKs/6kasFkTGSG6sdJFvz7zQzCDufR8SK2IXb
         NofZyduqxl3DfGvyYhhuBupFTKepkoFtzxVmO/houE4RURoqkk6IQmScM1QJPukA36Q5
         e1f4X0qFqJUEj5fe4tu7qBKWjfFLtm1POpYqPJOUO+SBl9JAx/fKN6l8e7jOC5NbMjrq
         fDeqadi6KB6fv7vTmKSzGuqWHlHv/3iZNfyAWQYwm1uCU7DnpWg0uBzycpoZJbCw8SDd
         jyqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CI3Qkkbb89cv5bbaE9HcvbYXyBW2GfCAOd3nwRVqS/M=;
        fh=fdUQnbMFZ2lHADbR4i0ChK2GvFFT/cQJUyQO4tx5rZc=;
        b=KR8QldAX4ADUe7u5QTnwRqlYnmA70ME/vlOemNvDRCRZU8yu7PS1ISGPn4Mun3UhId
         MRNvqcq4qAfXlE3Zl8R5fyqDN8U+oaPZ+kkL+qnkEoeYFcin/ZjG6lhgBsl6cOwHW4gt
         ZdHoKzR3xIr+d6Nr+BCGS0fK4oMyb3PACQJLru2lhNWughu8jUd6obpiM6TFsF3UcmvE
         Dvkd5NTl4m9GQgWX9gaWI4tADQCTcuRO+J8i9PB9mihfd5rg9yJ/KaIzF44TqPmq01GU
         4IW77ajLTZ94IzrxtalT9PmZzE1CpoQitIe3MgWAqpZo1CvqU9NZfmEQ2Bx82xXKbN0B
         sWFg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768244962; x=1768849762; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CI3Qkkbb89cv5bbaE9HcvbYXyBW2GfCAOd3nwRVqS/M=;
        b=nhIR8BPBdx8D8pCw4eXhpTHsUIM07wNIMVivTRjn5zDxoPudz4ejTQH2oTyMxbatlu
         IWuzS2q28g/xZ8IKaHbF2wAK3aS0VgPn69MpHoJAalmjfdi8vqn9R2UzqWcUJrcxkZzL
         +mMlhnOmAqSzSgmg5ZOqVkQkuIdZ99HH3lRSOlFvvPzsgaeosy7LEbEtck9rZiBdV6VN
         6ReefBZRyP+JpKKZ1mB5e4PsSfX0hFE1Np+M4YgJihzAstvI+OtrsfsJF8qAbZIFIri/
         jo8HCl3F01Bj27JxIt/k3LqxdEvqx3/QeU4Yki1nRD3zS7I8067YJ8oXfz1G44LeJX7/
         Tujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768244962; x=1768849762;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CI3Qkkbb89cv5bbaE9HcvbYXyBW2GfCAOd3nwRVqS/M=;
        b=St8uD7ohIZZN2MrH2xJyLS91jMyzkZmPLKNGRPfunLKmQafFRgw91IsYaAhNO0GeGI
         wNFJ4bq2/Ofwpf3uFxxq6uJEyTlqpvtwPUcnnqjtZSVvfN4U2Ypsz26eUAoN0DwWnoMg
         RCPj9zxLnxYyWgRj9C8+gKacozcDnUQFnWVcmXICg2R6bEi+++1oZn0CMP6tRJScaBD9
         49I7wnpn8CpO3zACqOwQu2JwR9gBQRdVbZ+W9U8tsSlT+zIDrcq0btqNuI21LqzbRo9G
         xKl/QSOLxDdTwVkR0G1qdxzx+H44qAJ18EGIZtsPfoq4DNSiqbHsBbVzZr+NVL81+wl1
         AAag==
X-Forwarded-Encrypted: i=1; AJvYcCXW2pdccHvXIjTFMH/Ww3SrVY+nX9t0lvBfKg59o5YBNi6x+AgReWrXHlMcDjE+GZwudvnA9wvxMpfq6TumUOI9@lists.infradead.org
X-Gm-Message-State: AOJu0YzsaqNgTCq7sPq56m+cQKrKKhZW0LHmpFcpuZ/LsQA21portIAB
	L2XBB5wDqlmIIr4Fp2O0mA8eonrZ0qwDcx+CCyqx/276+e0TsbHufsuV5UWyMzNlt/h7ymZ8LIQ
	A5/sKkBVyjRqaNGb2yy2ao/ntXIEaAfPp3gQAIxPx
X-Gm-Gg: AY/fxX7Prgu0Ft3zzdOQPxpE6EgctwvjiM5jPEzc89nLntkTZ0xTQx5ffgrzPS9bBvR
	LNhbXOvPak27ggxxusUURILNLbUgJIxjJXljpjEEE++GnyINktHvUc8v6177ulV5wvC1hhId043
	9HdIt05DJCtr79f5y+H4PyKDgqNxpHEosTC2UDbeVrKpnHNKysd3noVm1fo16TG6cegSh15VIFh
	riPckf+C8lHsVdvxbHyhQDCNXAvKqI/fWNX2+qmNrXcyktFHw9HCGTWYxxavSFCo2cJRVSY
X-Received: by 2002:ac8:5d42:0:b0:4f1:9c6e:cf1c with SMTP id
 d75a77b69052e-5013a41792cmr752671cf.17.1768244961509; Mon, 12 Jan 2026
 11:09:21 -0800 (PST)
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-21-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-21-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 12 Jan 2026 19:08:00 +0000
X-Gm-Features: AZwV_Qjgu-sXQZIHm3TAlOW62aUWk-t7wcra038ZJt2_3BJ_d28PSVA3xv4zVCM
Message-ID: <CA+EHjTz4vDFdhbZMz6mNacdzSJLFfVbQKMGmSo=Vt9bSB4ho0Q@mail.gmail.com>
Subject: Re: [PATCH v9 21/30] KVM: arm64: Flush register state on writes to
 SVCR.SM and SVCR.ZA
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
X-CRM114-CacheID: sfid-20260112_110923_632756_1E470A2E 
X-CRM114-Status: GOOD (  28.34  )
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
> Writes to the physical SVCR.SM and SVCR.ZA change the state of PSTATE.SM
> and PSTATE.ZA, causing other floating point state to reset. Emulate this
> behaviour for writes done via the KVM userspace ABI.
>
> Setting PSTATE.ZA to 1 causes ZA and ZT0 to be reset to 0, these are stored
> in sme_state. Setting PSTATE.ZA to 0 causes ZA and ZT0 to become inaccesible
> so no reset is needed.

nit: inaccesible -> inaccessible

>
> Any change in PSTATE.SM causes the V, Z, P, FFR and FPMR registers to be
> reset to 0 and FPSR to be reset to 0x800009f.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_host.h | 24 ++++++++++++++++++++++++
>  arch/arm64/kvm/sys_regs.c         | 29 ++++++++++++++++++++++++++++-
>  2 files changed, 52 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 44595a789a97..bd7a9a4efbc3 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1147,6 +1147,30 @@ struct kvm_vcpu_arch {
>
>  #define vcpu_sve_state_size(vcpu) sve_state_size_from_vl((vcpu)->arch.max_vl[ARM64_VEC_SVE])
>
> +#define vcpu_sme_state(vcpu) (kern_hyp_va((vcpu)->arch.sme_state))
> +
> +#define sme_state_size_from_vl(vl, sme2) ({                            \
> +       size_t __size_ret;                                              \
> +       unsigned int __vq;                                              \
> +                                                                       \
> +       if (WARN_ON(!sve_vl_valid(vl))) {                               \
> +               __size_ret = 0;                                         \
> +       } else {                                                        \
> +               __vq = sve_vq_from_vl(vl);                              \
> +               __size_ret = ZA_SIG_REGS_SIZE(__vq);                    \
> +               if (sme2)                                               \
> +                       __size_ret += ZT_SIG_REG_SIZE;                  \
> +       }                                                               \
> +                                                                       \
> +       __size_ret;                                                     \
> +})
> +
> +#define vcpu_sme_state_size(vcpu) ({                                   \
> +       unsigned long __vl;                                             \
> +       __vl = (vcpu)->arch.max_vl[ARM64_VEC_SME];                      \
> +       sme_state_size_from_vl(__vl, vcpu_has_sme2(vcpu));              \
> +})
> +
>  /*
>   * Only use __vcpu_sys_reg/ctxt_sys_reg if you know you want the
>   * memory backed version of a register, and not the one most recently
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 51f175bbe8d1..4ecfcb0af24c 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -927,6 +927,33 @@ static unsigned int hidden_visibility(const struct kvm_vcpu *vcpu,
>         return REG_HIDDEN;
>  }
>
> +static int set_svcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
> +                   u64 val)
> +{
> +       u64 old = __vcpu_sys_reg(vcpu, rd->reg);
> +
> +       if (val & SVCR_RES0)
> +               return -EINVAL;
> +
> +       if ((val & SVCR_ZA) && !(old & SVCR_ZA) && vcpu->arch.sme_state)
> +               memset(vcpu->arch.sme_state, 0, vcpu_sme_state_size(vcpu));
> +
> +       if ((val & SVCR_SM) != (old & SVCR_SM)) {
> +               memset(vcpu->arch.ctxt.fp_regs.vregs, 0,
> +                      sizeof(vcpu->arch.ctxt.fp_regs.vregs));
> +
> +               if (vcpu->arch.sve_state)
> +                       memset(vcpu->arch.sve_state, 0,
> +                              vcpu_sve_state_size(vcpu));

If sve_state isn't allocated, this means that we've gotten here before
finalization. Is it better to return an error rather than silently
skipping this?

> +
> +               __vcpu_assign_sys_reg(vcpu, FPMR, 0);
> +               vcpu->arch.ctxt.fp_regs.fpsr = 0x800009f;

This matches the Arm Arm, but can we use a define or construct it,
rather than using a magic number?

Cheers,
/fuad


> +       }
> +
> +       __vcpu_assign_sys_reg(vcpu, rd->reg, val);
> +       return 0;
> +}
> +
>  static unsigned int pmu_visibility(const struct kvm_vcpu *vcpu,
>                                    const struct sys_reg_desc *r)
>  {
> @@ -3512,7 +3539,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>                     CTR_EL0_DminLine_MASK |
>                     CTR_EL0_L1Ip_MASK |
>                     CTR_EL0_IminLine_MASK),
> -       { SYS_DESC(SYS_SVCR), undef_access, reset_val, SVCR, 0, .visibility = sme_visibility  },
> +       { SYS_DESC(SYS_SVCR), undef_access, reset_val, SVCR, 0, .visibility = sme_visibility, .set_user = set_svcr },
>         { SYS_DESC(SYS_FPMR), undef_access, reset_val, FPMR, 0, .visibility = fp8_visibility },
>
>         { PMU_SYS_REG(PMCR_EL0), .access = access_pmcr, .reset = reset_pmcr,
>
> --
> 2.47.3
>

