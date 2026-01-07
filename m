Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FAED0D16D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 19:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UL7Yi7Pvtp9vnv6DWf8Vlg3AdoCOpm+T6/ZVSqpBols=; b=1hJtck1rR3rmlS0AYsZMuo0W7w
	7oWrt73UM+HVMCmrmM1ygyWKizLN/L2lzzdunc4sYg3sBL1Xa65ge/2X35cgQ9hVcIWkD1QFUdVv4
	TlmDFu8FOV+uJYFyGhwzcTwX+DpF+zWwqxy0isKl8QtWS3gQztmLS8vNL7BX0jzFk7zCdxXqz3OUe
	fovwyELwuVUrhQ6txZF0vYf4clNGzl7DxCrQazuEsZvXsd1vRWVUqNKYpzObZrTdU3WBW58dKxQfS
	vDcAnNRV+aGdp/23M+8Lq9t5kJaIJt3PUTm5X8LpBVMXfooZdArLewERMDeKDouHNQDNV1p9gkcUV
	I0pYsAjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZAJ-0000000FXP0-0x5X;
	Wed, 07 Jan 2026 19:25:55 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZAC-0000000FXNK-3DhW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 19:25:54 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4ee147baf7bso575891cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 11:25:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767813947; cv=none;
        d=google.com; s=arc-20240605;
        b=QcOrrosxRUf5Zo69nTOvRdiZFgBDEkxQjN8ROJXjUumTbGDi2x0LDUS+vhVinqYZ2A
         AjvvD50JT3nusFC3nNDTDRcPXcNZyaQ3WC/TOWLx/fPY5DM3Gqq/KtAJDisN4KXsh6Ox
         385t1kW5VWs7RVlAdf5ZyTWRqIOCNECIJ3ReAV4Ry7Wx7Nu41gLfB1oZ91EcW/ig+4Uc
         9B3tdJLPKWDc0bPOhBCXQBKtUSdOBlnHMfM7GpXOkPv1wHnhN/7OP55t8Wa59qKmULZA
         FarAzjs0xXqs0RvGfiJBrbNsMfogQU2HXjUbcv4gIgib55wZrovQqHtQSJOWOfnyi2zE
         FuFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UL7Yi7Pvtp9vnv6DWf8Vlg3AdoCOpm+T6/ZVSqpBols=;
        fh=BoEDAGt3zY1bnrSbFfhFx5CNVjfcrlKJs8JhjvA4nJs=;
        b=M3orfEi9sScrZcje5eznMhTwPbTjJlmPCq4GA+WAOqdwL9s/0WOZHkVT9U8h2sXZIw
         VJjGHG8z9mVuW5hYRAHPi0dMLq1VNqNyWiJjwWI+VIRfjJVBf9lIvRINJXYSFFLmqxnj
         zNwfVx/GuIlkfrVY3Cr6ujO85teVD43bwZfa4DEQHRsxOGC1r/h0cd7oToyi7sCnTrDs
         zy8QIlJc+ExV8rJUL1CCliYP+0wWzLctR+5vBlQA0UlRUbQdsN2mQ4m1/eUX1lypJ/iP
         VW5ZXWsJX05gJzo9JIfvkH1Ul0myELFrGZlTIH/jj37qGSYY/lUHBApRwAuWV0uL3A3g
         ve3A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767813947; x=1768418747; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UL7Yi7Pvtp9vnv6DWf8Vlg3AdoCOpm+T6/ZVSqpBols=;
        b=DTSJymLTI0vBm4pQY8i44YRNXf9AymkbwDgrAIVfaJ/ygcqJhAQ/uW0oud6wP9Snl5
         6ssBKDdn/FiYyBlmk9D+GZH0j5AXZ09OHP+xvjWWb0yaA5bgqvrBvcElbOyCc67rl90Y
         TZhDy4iTvbdlS6ScOElun/wHubwQv+9fj1Vq/GauAn3zrd8oRXrZQXxVZiUZyr5qO3v+
         AvpO7gt0NF5DetgzydKmOzx+Nag01oW53Y19GmjRmj1/AuV/5Mz2H+DjRg0UMlQ7GUoH
         +fOhk9fRJJU4JZb6C+1GZjiCkYbXzFFJ3yR98q1VkWdYl+xKgAXG63Xso8xAHCMUkDkA
         62WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767813947; x=1768418747;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UL7Yi7Pvtp9vnv6DWf8Vlg3AdoCOpm+T6/ZVSqpBols=;
        b=dJQH/5EFQDMMzGI30zr9T4P31wbS9PLAthW+5p/ut489VLfBVR6YZVSmO6BqfcQ82A
         X78qBt0JPmUQmAR3Kh/D/UKLRphrMoxingormXZ/lVvWTUlD7jeFID3ckq17bfB7UgNG
         Zj+pwe+s2QGcRCWa+bX/LIPdLobeGykm6gNFfARdVah46VhBh6V6Mvthe4AYtypzMXjq
         vpCcggQiOKysv8J9MpsF/blwCzpCxnr1eQTCb12zUgwIDtj2O7tv/QlGwvuTVIJ1wYX7
         Bj+7HsBC5KrZgzP5nTYnp0tA1P5T+vHT4SvSz2hIo6/j8igleuTFeUs4oFGUXvCA6f8l
         wsYA==
X-Forwarded-Encrypted: i=1; AJvYcCVerUP11Zb/ymiFuyqQE8WZ2+/mRdjZ2fJJiPf51oOkEj4RpGLdnzagNFmvPLRfqIbukSFc98IEuLLGcD7aoW4a@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq0Wby4a22G+d/flXsjjpBYnjqPavS1aWiqnz5mQst+9CwMovH
	JsyK6YW2Je5tav2cb13qVrprhCk3E/cT7sE6VPhD5uQITHl6E0DFu13evKsDN0ZcCGE8ZCt9S/w
	BuygwABD0vGdwOfZOqMatyEggphJt2SMEvQCBtQXv
X-Gm-Gg: AY/fxX43xAr+5KdM/Gt/M6H2E2QK4eneWaui6qvfYynurm2lQGVtTQ+nCLvbHTtVR8H
	gzYXeMF3z9kJF79X4IXoLItcgobrX/jcPsRG6b80iyghUeqyuVACrrOuj4tSzr7VCww+KbNIFNi
	16gyoLfiOxjvXbGwzQ0WNhzrfLDiSYkTr3nl2hZT++Fl9ywhiq6YPOKAwgFgqLUL+g9z9JSBYTK
	RQ22H/3dituD6gytad/knlmq8zXPhFki4CkkRNvE+t36ipkhLxJGpld08vhrGjSz/YFB8fDxB9S
	p3pFNxo=
X-Received: by 2002:ac8:5755:0:b0:4f1:a61a:1e8 with SMTP id
 d75a77b69052e-4ffb3e21616mr16125611cf.10.1767813946629; Wed, 07 Jan 2026
 11:25:46 -0800 (PST)
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-3-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-3-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 7 Jan 2026 19:25:09 +0000
X-Gm-Features: AQt7F2qG7tZNiD_FEqhIhHEVb7oMgUHIgaIXPRg8ASWrsWZrjE8qelJTJPBe6w8
Message-ID: <CA+EHjTyZg=WH4GmAXzmNroAPVtRUM=LMvNWc38S4_Oh7UQi78w@mail.gmail.com>
Subject: Re: [PATCH v9 03/30] arm64/fpsimd: Decide to save ZT0 and streaming
 mode FFR at bind time
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
X-CRM114-CacheID: sfid-20260107_112548_821075_00383365 
X-CRM114-Status: GOOD (  29.02  )
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

On Tue, 23 Dec 2025 at 01:21, Mark Brown <broonie@kernel.org> wrote:
>
> Some parts of the SME state are optional, enabled by additional features
> on top of the base FEAT_SME and controlled with enable bits in SMCR_ELx. We
> unconditionally enable these for the host but for KVM we will allow the
> feature set exposed to guests to be restricted by the VMM. These are the
> FFR register (FEAT_SME_FA64) and ZT0 (FEAT_SME2).
>
> We defer saving of guest floating point state for non-protected guests to
> the host kernel. We also want to avoid having to reconfigure the guest
> floating point state if nothing used the floating point state while running
> the host. If the guest was running with the optional features disabled then
> traps will be enabled for them so the host kernel will need to skip
> accessing that state when saving state for the guest.
>
> Support this by moving the decision about saving this state to the point
> where we bind floating point state to the CPU, adding a new variable to
> the cpu_fp_state which uses the enable bits in SMCR_ELx to flag which
> features are enabled.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


> ---
>  arch/arm64/include/asm/fpsimd.h |  1 +
>  arch/arm64/kernel/fpsimd.c      | 10 ++++++++--
>  arch/arm64/kvm/fpsimd.c         |  1 +
>  3 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
> index ece65061dea0..146c1af55e22 100644
> --- a/arch/arm64/include/asm/fpsimd.h
> +++ b/arch/arm64/include/asm/fpsimd.h
> @@ -87,6 +87,7 @@ struct cpu_fp_state {
>         void *sme_state;
>         u64 *svcr;
>         u64 *fpmr;
> +       u64 sme_features;
>         unsigned int sve_vl;
>         unsigned int sme_vl;
>         enum fp_type *fp_type;
> diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
> index be4499ff6498..887fce177c92 100644
> --- a/arch/arm64/kernel/fpsimd.c
> +++ b/arch/arm64/kernel/fpsimd.c
> @@ -490,12 +490,12 @@ static void fpsimd_save_user_state(void)
>
>                 if (*svcr & SVCR_ZA_MASK)
>                         sme_save_state(last->sme_state,
> -                                      system_supports_sme2());
> +                                      last->sme_features & SMCR_ELx_EZT0);
>
>                 /* If we are in streaming mode override regular SVE. */
>                 if (*svcr & SVCR_SM_MASK) {
>                         save_sve_regs = true;
> -                       save_ffr = system_supports_fa64();
> +                       save_ffr = last->sme_features & SMCR_ELx_FA64;
>                         vl = last->sme_vl;
>                 }
>         }
> @@ -1671,6 +1671,12 @@ static void fpsimd_bind_task_to_cpu(void)
>         last->to_save = FP_STATE_CURRENT;
>         current->thread.fpsimd_cpu = smp_processor_id();
>
> +       last->sme_features = 0;
> +       if (system_supports_fa64())
> +               last->sme_features |= SMCR_ELx_FA64;
> +       if (system_supports_sme2())
> +               last->sme_features |= SMCR_ELx_EZT0;
> +
>         /*
>          * Toggle SVE and SME trapping for userspace if needed, these
>          * are serialsied by ret_to_user().
> diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
> index 15e17aca1dec..9158353d8be3 100644
> --- a/arch/arm64/kvm/fpsimd.c
> +++ b/arch/arm64/kvm/fpsimd.c
> @@ -80,6 +80,7 @@ void kvm_arch_vcpu_ctxsync_fp(struct kvm_vcpu *vcpu)
>                 fp_state.svcr = __ctxt_sys_reg(&vcpu->arch.ctxt, SVCR);
>                 fp_state.fpmr = __ctxt_sys_reg(&vcpu->arch.ctxt, FPMR);
>                 fp_state.fp_type = &vcpu->arch.fp_type;
> +               fp_state.sme_features = 0;
>
>                 if (vcpu_has_sve(vcpu))
>                         fp_state.to_save = FP_STATE_SVE;
>
> --
> 2.47.3
>

