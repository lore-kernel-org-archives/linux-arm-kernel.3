Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6544CD0D16D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 19:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTH8jQvV1D0VfzMEkRl+QRl2D3Hkny/yjDSwKTi/xLY=; b=K6NSPU/QXHQWllBT8gvLO3x+dh
	myPChD+7lkdyobOy1ZGHe6t5Qt9l+Ci+YrunW6ZtwTEB+aQkOcmVwC//itOHeE/OqiUmrIqP48GaG
	GUbtP8g3iKvSKWVMgkiLrluM+huOaadXedjz4YgmNEli/xJDOd5QSSY9zq411AR038XpsWu4+euKi
	tMkbJRbM2X+Dxaq0flKUIOg4/rhioWRCEOtL2AR/LWN+o8q3o3/7arE7iAMfMVQugEZm69Y1Xy+Hl
	TyYdcG7GplqYcfJ3ySPSeJs5UrMDjngao+Q3EE8kg+37lDLZq4v0mwl4E/oakVv0AE8W86IqXyDNf
	dhn/Z5PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZA8-0000000FXMN-3t7V;
	Wed, 07 Jan 2026 19:25:44 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZA6-0000000FXLo-3l7S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 19:25:44 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4ee243b98caso480821cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 11:25:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767813941; cv=none;
        d=google.com; s=arc-20240605;
        b=GuFTwdi+TXf0qObkcOl5bjqGvECPMfdy6ftqGYOagRp3armu4oUO5pBJRHjdWXTHBu
         NYAPav2Ys6D6pXofqnRW2PZzgbYWY9bpV7lh7D/oel9jKEghf4TOksBJiXdabiGGv/Dw
         TD1ZkVBIwcaha6DrU42zcbZakuW7HLX77t3A/+EJo3TaW4+Uwrz956N1v8Ggv32b1HPu
         H9JYLeEWWZoHsPczO68v/geKCLpShZxCTuGqme9gL7ZARX/jlqw7hhnlnkKl5w5p3kns
         OCsST59PpRv4xLyV0QmXK9/fYDKKlpCikeu98Pr18w/er5YCXmaSyu2m1bZ+eBTpEC95
         0KDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gTH8jQvV1D0VfzMEkRl+QRl2D3Hkny/yjDSwKTi/xLY=;
        fh=ZEk6/qgBGjxALUy7GiVZ4GWK6YA+uKTGY+Rf3TZ4vs0=;
        b=LeaWmYzyTpr60gwROO5xv7G531u2ORhQ6HOxNJ28Cwvy/Zuh6JTH63dimPp77ZrRs9
         N6E9SYEuSnAjGWosUSV+qQL1vF4F59xr6XBM3yL75lK4pOszy/sjEiJSc6jxI66FEZg7
         P3e4dYvgYpGIs+hI9glQFE59cTIJE6uzjgRqBAcMNSVR6vCxq/NXqrhevrVAmX1QzOcN
         5Xm2eL1FDXCOKKv+fuhxYAx5+w9u+IP23l1HU4meWqhK8kYGYsYPQuaOOcm5UfX6HHWc
         yZ7VrGftVE0hjaQNED7RPYGo1WnvpnhD1Y8M6d/aZ/aMNjTYBIWhwqipbvFJyAiaNWTw
         orVA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767813941; x=1768418741; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gTH8jQvV1D0VfzMEkRl+QRl2D3Hkny/yjDSwKTi/xLY=;
        b=F8EV4ZX1Ah1VpSLn8A3s0DWq2Y9b/7WTEfXV8myBcmp0r4EAtD1tzwHIrrXxo7iFA3
         05EqEFDKfWL3WtzhWP3QtKaVDMz+gFsCw39nRheZDHjVh4Y9kL4jtLpiQV6P0uJRDqHM
         ZtuVxhTh68j6X7Rs8QItbJ22m6BoJ1vHRbCVvE9advgBPvUDtmR9qkVrdS6wxKiq914s
         QNHBJMUnSio6G1wFXn134jhh13lbuMJfxU6e5uWF9QkmoAdhWE+HEQZsPBcfErJeXBYT
         yp3eEj5rufaF2LndnTM6F1vtSbwKZ1u3cKl85Qff2Z4jttKhZN6X1CWzLHsfehP9hUip
         pkqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767813941; x=1768418741;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTH8jQvV1D0VfzMEkRl+QRl2D3Hkny/yjDSwKTi/xLY=;
        b=Mga/DyGsdci2z1aPtijLtPZ1YcT8yFqueI5Ma2QhsU9SSy7i8JgjeXPKMbsZDU0+Zv
         WwlPwqkqEkXADlCryok25veQBAJUxlYIWoYLQBNWdJqrhp+hvdg0vCVwuWCb5a+Cvamu
         NonfcZW0SnhBr3aRYTT1kpiGh/FgywDy4j1i+Hcta9F20e1Kx8EwtoGsG5f7faB2f07x
         yXmOWQS+S+wcz19Wy2T4pAYNSf4WC8fAkv/Wi1GsymeUXda7YojBpmlIYbwebZtGSctU
         VEwbku6yzgZzluL7fgkSSBXq7lLseMEmnsAg7qLDbx9KnAp47tzbl0oF59DAodD4ycyY
         +xYg==
X-Forwarded-Encrypted: i=1; AJvYcCVX/neLvpcr/rjRYlDtsDEL46WmypoLQj1/5qq3yh3GQyW2ltMUc26VwTrxj5xCx3IiJgFIRujs55oIyyI9OrZt@lists.infradead.org
X-Gm-Message-State: AOJu0YzCGnPEqKvCWqCVqDxb3gumlz2Kn+IkTz8BtyXHWBh/ISgp0XD8
	YpHLYnWoh2BSxh3FMvSj8mwp0tdSV9BVM0qtfbBM5FfNH8EB71FLxaj+lXD8hJ/uYPh2nNepanz
	ItqfUuzGYORseIy6A+ojTH55bQRbXVtWVrxKe5o5x
X-Gm-Gg: AY/fxX5Znd2LWiWAZhkbNHl7FlubXzMJDncShNaQ508GECGuob56VuCkPi7nq6aUOKt
	ltB2Mm0khjKw9b2HoB+iLZEXEiTkMWagmwYcWLztMPnmMBz46yeJKQsiktDss5PGdeOqljH2EiQ
	4B+gDCCRYXwG5J+I406Vy4q3nQmYtOXJsjxi342JkHqbbYu0RwbxozcrsZ74LxupcTuUZqURSeV
	KOGtGVp8JYtBt52CsTsJsLvvTO9RXB5b20zSmCunjXUOp9DKHhKKCbQISVC2dotID5qoR8I
X-Received: by 2002:ac8:5e06:0:b0:4f3:5474:3cb9 with SMTP id
 d75a77b69052e-4ffb3e48178mr14758401cf.14.1767813940920; Wed, 07 Jan 2026
 11:25:40 -0800 (PST)
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-2-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-2-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 7 Jan 2026 19:25:04 +0000
X-Gm-Features: AQt7F2qijfqrn1SiSoVThoOMWciACqxsLrgyDpsjmJY9k2NsoSwPIOlWKacYC-Y
Message-ID: <CA+EHjTxdSnpFHkm6o85EtjQjAWemBfcv9Oq6omWyrrMdkOuuVA@mail.gmail.com>
Subject: Re: [PATCH v9 02/30] arm64/fpsimd: Update FA64 and ZT0 enables when
 loading SME state
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
X-CRM114-CacheID: sfid-20260107_112542_964892_570D9C91 
X-CRM114-Status: GOOD (  37.17  )
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

On Tue, 23 Dec 2025 at 01:21, Mark Brown <broonie@kernel.org> wrote:
>
> Currently we enable EL0 and EL1 access to FA64 and ZT0 at boot and leave
> them enabled throughout the runtime of the system. When we add KVM support
> we will need to make this configuration dynamic, these features may be
> disabled for some KVM guests. Since the host kernel saves the floating
> point state for non-protected guests and we wish to avoid KVM having to
> reload the floating point state needlessly on guest reentry let's move the
> configuration of these enables to the floating point state reload.
>
> We provide a helper which does the configuration as part of a
> read/modify/write operation along with the configuration of the task VL,
> then update the floating point state load and SME access trap to use it.
> We also remove the setting of the enable bits from the CPU feature
> identification and resume paths.  There will be a small overhead from
> setting the enables one at a time but this should be negligable in the

nit: negligible

> context of the state load or access trap.  In order to avoid compiler
> warnings due to unused variables in !CONFIG_ARM64_SME cases we avoid
> storing the vector length in temporary variables.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/include/asm/fpsimd.h | 14 ++++++++++++
>  arch/arm64/kernel/cpufeature.c  |  2 --
>  arch/arm64/kernel/fpsimd.c      | 47 +++++++++++------------------------------
>  3 files changed, 26 insertions(+), 37 deletions(-)
>
> diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
> index 1d2e33559bd5..ece65061dea0 100644
> --- a/arch/arm64/include/asm/fpsimd.h
> +++ b/arch/arm64/include/asm/fpsimd.h
> @@ -428,6 +428,18 @@ static inline size_t sme_state_size(struct task_struct const *task)
>         return __sme_state_size(task_get_sme_vl(task));
>  }
>
> +#define sme_cond_update_smcr(vl, fa64, zt0, reg)               \
> +       do {                                                    \
> +               u64 __old = read_sysreg_s((reg));               \
> +               u64 __new = vl;                                 \
> +               if (fa64)                       \
> +                       __new |= SMCR_ELx_FA64;                 \
> +               if (zt0)                                        \
> +                       __new |= SMCR_ELx_EZT0;                 \
> +               if (__old != __new)                             \
> +                       write_sysreg_s(__new, (reg));           \
> +       } while (0)
> +

Should we cap the VL based on SMCR_ELx_LEN_MASK (as we do in
sve_cond_update_zcr_vq())?

Should we also preserve the remaining old bits from SMCR_EL1, i.e.,
copy over the bits that aren't
SMCR_ELx_LEN_MASK|SMCR_ELx_FA64|SMCR_ELx_EZT0? For now they are RES0,
but that could change.

Cheers,
/fuad


>  #else
>
>  static inline void sme_user_disable(void) { BUILD_BUG(); }
> @@ -456,6 +468,8 @@ static inline size_t sme_state_size(struct task_struct const *task)
>         return 0;
>  }
>
> +#define sme_cond_update_smcr(val, fa64, zt0, reg) do { } while (0)
> +
>  #endif /* ! CONFIG_ARM64_SME */
>
>  /* For use by EFI runtime services calls only */
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index c840a93b9ef9..ca9e66cc62d8 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2965,7 +2965,6 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
>                 .type = ARM64_CPUCAP_SYSTEM_FEATURE,
>                 .capability = ARM64_SME_FA64,
>                 .matches = has_cpuid_feature,
> -               .cpu_enable = cpu_enable_fa64,
>                 ARM64_CPUID_FIELDS(ID_AA64SMFR0_EL1, FA64, IMP)
>         },
>         {
> @@ -2973,7 +2972,6 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
>                 .type = ARM64_CPUCAP_SYSTEM_FEATURE,
>                 .capability = ARM64_SME2,
>                 .matches = has_cpuid_feature,
> -               .cpu_enable = cpu_enable_sme2,
>                 ARM64_CPUID_FIELDS(ID_AA64PFR1_EL1, SME, SME2)
>         },
>  #endif /* CONFIG_ARM64_SME */
> diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
> index c154f72634e0..be4499ff6498 100644
> --- a/arch/arm64/kernel/fpsimd.c
> +++ b/arch/arm64/kernel/fpsimd.c
> @@ -405,11 +405,15 @@ static void task_fpsimd_load(void)
>
>         /* Restore SME, override SVE register configuration if needed */
>         if (system_supports_sme()) {
> -               unsigned long sme_vl = task_get_sme_vl(current);
> -
> -               /* Ensure VL is set up for restoring data */
> +               /*
> +                * Ensure VL is set up for restoring data.  KVM might
> +                * disable subfeatures so we reset them each time.
> +                */
>                 if (test_thread_flag(TIF_SME))
> -                       sme_set_vq(sve_vq_from_vl(sme_vl) - 1);
> +                       sme_cond_update_smcr(sve_vq_from_vl(task_get_sme_vl(current)) - 1,
> +                                            system_supports_fa64(),
> +                                            system_supports_sme2(),
> +                                            SYS_SMCR_EL1);
>
>                 write_sysreg_s(current->thread.svcr, SYS_SVCR);
>
> @@ -1250,26 +1254,6 @@ void cpu_enable_sme(const struct arm64_cpu_capabilities *__always_unused p)
>         isb();
>  }
>
> -void cpu_enable_sme2(const struct arm64_cpu_capabilities *__always_unused p)
> -{
> -       /* This must be enabled after SME */
> -       BUILD_BUG_ON(ARM64_SME2 <= ARM64_SME);
> -
> -       /* Allow use of ZT0 */
> -       write_sysreg_s(read_sysreg_s(SYS_SMCR_EL1) | SMCR_ELx_EZT0_MASK,
> -                      SYS_SMCR_EL1);
> -}
> -
> -void cpu_enable_fa64(const struct arm64_cpu_capabilities *__always_unused p)
> -{
> -       /* This must be enabled after SME */
> -       BUILD_BUG_ON(ARM64_SME_FA64 <= ARM64_SME);
> -
> -       /* Allow use of FA64 */
> -       write_sysreg_s(read_sysreg_s(SYS_SMCR_EL1) | SMCR_ELx_FA64_MASK,
> -                      SYS_SMCR_EL1);
> -}
> -
>  void __init sme_setup(void)
>  {
>         struct vl_info *info = &vl_info[ARM64_VEC_SME];
> @@ -1314,17 +1298,9 @@ void __init sme_setup(void)
>
>  void sme_suspend_exit(void)
>  {
> -       u64 smcr = 0;
> -
>         if (!system_supports_sme())
>                 return;
>
> -       if (system_supports_fa64())
> -               smcr |= SMCR_ELx_FA64;
> -       if (system_supports_sme2())
> -               smcr |= SMCR_ELx_EZT0;
> -
> -       write_sysreg_s(smcr, SYS_SMCR_EL1);
>         write_sysreg_s(0, SYS_SMPRI_EL1);
>  }
>
> @@ -1439,9 +1415,10 @@ void do_sme_acc(unsigned long esr, struct pt_regs *regs)
>                 WARN_ON(1);
>
>         if (!test_thread_flag(TIF_FOREIGN_FPSTATE)) {
> -               unsigned long vq_minus_one =
> -                       sve_vq_from_vl(task_get_sme_vl(current)) - 1;
> -               sme_set_vq(vq_minus_one);
> +               sme_cond_update_smcr(sve_vq_from_vl(task_get_sme_vl(current)) - 1,
> +                                    system_supports_fa64(),
> +                                    system_supports_sme2(),
> +                                    SYS_SMCR_EL1);
>
>                 fpsimd_bind_task_to_cpu();
>         } else {
>
> --
> 2.47.3
>

