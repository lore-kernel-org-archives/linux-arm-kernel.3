Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2F3CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 17:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i5AuHa12lkUBfYhiINFlt22UCH0oA/1yHIWHNN85vbE=; b=3uJSApF2SjaaJbMkoia1ljv+AH
	6Yw0ZCZJtYULHpGaXo4YXzfNDHvkUp4qOtGu2mghGfR1GY4ZdTalbORzWtzCFsHvwX6E84V/oMXz2
	cbWiDujFnhudB1Pk33p4NAC59bJXfE9fKd3YxNWppVkYPMBi8JXs1fRxoVMdWqApeI2ZuG5bej67B
	qEl+hlDI5JW96mdY8d/TMIVMUMhaYLm4ZypoGoWlRNX6+HOLehCVIlKb6xWPnJRB7fkJz84TuOBQ1
	Cc4ITXzOc0oUpQELyPU/4V6PYZ03qJVV+tnoB7Hv/ExYE1eew47o3plYpyjIfvwLbOeoAy8B+y6Gg
	05WKrYqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZtvm-000000006MC-2aWz;
	Wed, 17 Jun 2026 17:20:02 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZtvj-000000006LN-3lyd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 17:20:01 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-5177d1ff061so14071cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 10:19:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781716798; cv=none;
        d=google.com; s=arc-20260327;
        b=nYyFdEWlH7pjnOfe9SCCoXxsmH7p3h+tO+TgnPBsr9fRlZAkgBLKTlnDvXdJijb0AD
         oMG2zyNbgVw15SGsUNgI1y0O9a+Gx+6LDqGmf7DcWnOcZK0sZE/bPLwNCESLdl/J5D34
         FzgmpEQwWRLiMt0YHyGqbxPnLcKa6LEUCwrDJ078rk0ruHfu7bZnhy/Gh/uO98EbxdRH
         zxAXn9QfARACUl3XpTMDE2b5sm7SEcPa1e6iHSDyAAfWRWx4ZeF3TXGPuTylQiFTDYaG
         jH7Q9xfL41vdY606z2poVC/2HRrgnrvLDpGjM0cTELfBE53Xufx7spm6coZETYfoJ7/u
         EJdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=i5AuHa12lkUBfYhiINFlt22UCH0oA/1yHIWHNN85vbE=;
        fh=lyz0EiYnUkRFZDGlzXUOkwE/mR+OY5o4FCVpWVKDdf8=;
        b=IsKPYuEi+0Z6Tf6ocDrrKqM6OvHx4+jkizRTmKoWGJutjIj8sa4PtPP9pHkrA6+o91
         1zo3CC+raw44JB4wRpmuGla1R2Glss2T/H8QOIFoTQqDTCmkkkZ7oJ3eVIR7RKMm3hAX
         8zmfvk1aZvOIcv8g+PpcKG2zOEbiaZ2Op2uagX23Qitje1rWOs/O3fBLViuwq5HRJup+
         v1CHVQ9oOEJhIJWLjBPQ7iXvgF+WgsijcTsI8/kVfeAHjec6wWjWey4QpmnbMR5CTVkK
         4CaDogGan0Gs55+4jDmEfpC+zclMGu2fzFv/ANgBsUUsNd3cPTuyTcoDBtV3Kq/s1Zn/
         r2Rw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781716798; x=1782321598; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i5AuHa12lkUBfYhiINFlt22UCH0oA/1yHIWHNN85vbE=;
        b=Difm51oyLkZaoLTPxvC1W2Zm/a/Bum7Mg0aBl3Bw+Aek9F6tAJyv3oFNepALzFyvar
         G2OFDWObdY0xD96YOw4cV23hGyPzyJ1c0m7r8CjG+JLKbcy/o+nva9z4egrg4vXxJdMg
         Zxp02MV9mb6gOUX//wDaiE/BeaOdAwkzLi8L3F66DQVZfAJl+L1SZ6pURv7H4diBNseH
         jwJP4w3ltkHT7hvUmtDvVkKWDgahuX4/OEuyKVffXgaGuMaBA2ALm8cXawiuXF+Zl6z8
         QPshYJtMfzAQU1eVBa+S0+csURk/dM00ZglGzxhlttBwu4DiQxeUgSp53q/RBbFuL4IC
         H7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781716798; x=1782321598;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i5AuHa12lkUBfYhiINFlt22UCH0oA/1yHIWHNN85vbE=;
        b=BFWi3yC5wpEzcdYWNJtfCC4XMrKi8tRN5muCJlbsVFdQ2pOL9VbH7x8jO6zhw3a910
         +AlstbpG09sZBGfH/8lVLaHn0l/0OU/wasrgSiUc4YNJOqBkq9AUD6lePJVoyfOnE88h
         kcmBmOnRzUw/KoOESCV6dnYdD0UEhIS2Tni3E4Qiuxyh85r/Eb/SPpI+VNjWJU41as9x
         /lJrqKWVAviwFnbEMv4krxenMyg9CfkOYonHihhoSYlN2iB26x7lLKQtWo8iCa/BqIIw
         2KYXtSoQy5veFTbtMR0u7KNrcHFyZQhxbYxgTFC0VffTrl+/mmeOZTpQVN2VhcK8mWpG
         G/FA==
X-Forwarded-Encrypted: i=1; AFNElJ8CbPxs8WChRhBB+T0Mb+7mbHIVo+J+2M2YMYXtp2thpOFfZir7i2rsdO/voY19KV4VooGEfYMiDhIZV1tQ3hCg@lists.infradead.org
X-Gm-Message-State: AOJu0YzVg692us6NpisYoHxwmeqMkNH1tPqHImhokDLP6dm8vFaZHigE
	iA/OwICEFsJMWq2yAMal7X7mj/h6+FXaqdLGfM/j0FKC8VOE6ErpQC7sveS3LBnmVfaSsgVOMQ/
	bBpgcBy0W10NGxv+48zI8BTzxVnIZuMYUTox6iOwl
X-Gm-Gg: Acq92OFMujVsSebWw8NoQPDOZfOLylbchqGP6eB0DYR0HZ4HG94FIb5jGo0xv0QosvU
	KB+cI5g1rxAjMQHBqVx2/6sKCjQflQEHVT64JDoO6yYlCQTMRckDxpmh+hWIj1/1iBskO/on8XD
	ZY/PdmoKUJx6zUa0B541Q0LqKTbhL1xVJVZNauAkLcAbONGsYI9OY5WspIEamPdgI7eliz1ustZ
	GnXqxVpxJ+LYZ1sqs1kzQwhcKVjTEmp+OYzYURlMzf/13ncDTblfL1FJ0BniZkFWnxhTsuSNQ==
X-Received: by 2002:a05:622a:5a12:b0:516:4f62:85eb with SMTP id
 d75a77b69052e-519c661aee8mr160121cf.22.1781716797721; Wed, 17 Jun 2026
 10:19:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260617144907.2972095-1-tabba@google.com> <86se6lru7w.wl-maz@kernel.org>
In-Reply-To: <86se6lru7w.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 17 Jun 2026 18:19:20 +0100
X-Gm-Features: AVVi8CekeI_lGuSPPCeiswsqcvt1h5ISzFMhZQqw1f94ExrSVGJodvqXM6iSYrs
Message-ID: <CA+EHjTyv107RDF_MG1AtqqpJsiRbFx=xbrp12TgSu_N8dS55oA@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: nv: Fix PSTATE construction on illegal
 exception return
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Jintack Lim <jintack.lim@linaro.org>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_101959_979850_0381664E 
X-CRM114-Status: GOOD (  34.23  )
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

On Wed, 17 Jun 2026 at 17:45, Marc Zyngier <maz@kernel.org> wrote:
>
> On Wed, 17 Jun 2026 15:49:07 +0100,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > kvm_check_illegal_exception_return() sourced the flags {N,Z,C,V} and
> > masks {D,A,I,F} of the resulting PSTATE from the current PSTATE, but
> > R_VWJHB takes them from the SPSR being returned to and leaves
> > PSTATE.{EL,SP,nRW} (and EXLOCK when FEAT_GCS) unchanged. PAN, ALLINT
> > and PM were not applied at all.
> >
> > Build the PSTATE by taking those fields from the SPSR while preserving
> > EL, SP, nRW and EXLOCK from the current PSTATE, then set IL.
> >
> > Fixes: 47f3a2fc765a ("KVM: arm64: nv: Support virtual EL2 exceptions")
> > Suggested-by: Marc Zyngier <maz@kernel.org>
> > Link: https://lore.kernel.org/all/86wlvxs5r0.wl-maz@kernel.org/
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> > This is a modified version of Marc's suggested diff [1]. That diff applied
> > a single mask to the incoming SPSR, which also takes PSTATE.{EL,SP,nRW}
> > (and EXLOCK) from the SPSR. The ARM ARM leaves those fields unchanged on an
> > illegal exception return. This path is reached precisely because SPSR.M is
> > illegal (EL3, M[1]=1, AArch32, EL1 under TGE), so this version preserves
> > EL/SP/nRW/EXLOCK from the current PSTATE and takes only the flags, masks
> > and PAN/ALLINT/PM from the SPSR.
> >
> > [1] https://lore.kernel.org/all/86wlvxs5r0.wl-maz@kernel.org/
> > ---
> >  arch/arm64/kvm/emulate-nested.c | 33 +++++++++++++++++++++++----------
> >  1 file changed, 23 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
> > index dba7ced74ca5..ace2b40cf875 100644
> > --- a/arch/arm64/kvm/emulate-nested.c
> > +++ b/arch/arm64/kvm/emulate-nested.c
> > @@ -2738,17 +2738,30 @@ static u64 kvm_check_illegal_exception_return(struct kvm_vcpu *vcpu, u64 spsr)
> >           (spsr & PSR_MODE32_BIT) ||
> >           (vcpu_el2_tge_is_set(vcpu) && (mode == PSR_MODE_EL1t ||
> >                                          mode == PSR_MODE_EL1h))) {
> > -             /*
> > -              * The guest is playing with our nerves. Preserve EL, SP,
> > -              * masks, flags from the existing PSTATE, and set IL.
> > -              * The HW will then generate an Illegal State Exception
> > -              * immediately after ERET.
> > -              */
> > -             spsr = *vcpu_cpsr(vcpu);
> > +             u64 cpsr = *vcpu_cpsr(vcpu);
> > +             u64 mask;
> >
> > -             spsr &= (PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT |
> > -                      PSR_N_BIT | PSR_Z_BIT | PSR_C_BIT | PSR_V_BIT |
> > -                      PSR_MODE_MASK | PSR_MODE32_BIT);
> > +             /*
> > +              * On an illegal exception return, PSTATE.{EL,SP,nRW} and,
> > +              * if FEAT_GCS, PSTATE.EXLOCK are unchanged, while the flags
> > +              * and masks are taken from the SPSR (R_VWJHB). Set IL so the
> > +              * HW generates an Illegal State Exception right after ERET.
> > +              */
> > +             mask = PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT |
> > +                    PSR_N_BIT | PSR_Z_BIT | PSR_C_BIT | PSR_V_BIT;
> > +
> > +             if (kvm_has_feat(vcpu->kvm, ID_AA64MMFR1_EL1, PAN, IMP))
> > +                     mask |= PSR_PAN_BIT;
> > +             if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, NMI, IMP))
> > +                     mask |= ALLINT_ALLINT;
> > +             /* FEAT_SPE_EXC and FEAT_TRBE_EXC also gate PSTATE.PM one day... */
> > +             if (kvm_has_feat(vcpu->kvm, ID_AA64DFR1_EL1, EBEP, IMP))
> > +                     mask |= BIT_ULL(32);    /* PSTATE.PM */
> > +
> > +             spsr &= mask;
> > +             spsr |= cpsr & (PSR_MODE_MASK | PSR_MODE32_BIT);
> > +             if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, GCS, IMP))
> > +                     spsr |= cpsr & BIT_ULL(34);     /* PSTATE.EXLOCK */
> >               spsr |= PSR_IL_BIT;
> >       }
>
> While I'm happy that you caught the bugs I left for you to address,
> the overall structure is a bit inconsistent. I'd like to have:
>
> - a mask of the bits we preserve from SPSR, and apply that to SPSR
>   itself
>
> - a mask of the bits we preserve from PSTATE, and transfer them to
>   SPSR
>
> - the comment at the top to describe this in that particular order.
>
> With that, I reworked your patch as follows:
>
> diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
> index bb335fa16f7cc..243e5e26f7018 100644
> --- a/arch/arm64/kvm/emulate-nested.c
> +++ b/arch/arm64/kvm/emulate-nested.c
> @@ -2746,14 +2746,14 @@ static u64 kvm_check_illegal_exception_return(struct kvm_vcpu *vcpu, u64 spsr)
>             (spsr & PSR_MODE32_BIT) ||
>             (vcpu_el2_tge_is_set(vcpu) && (mode == PSR_MODE_EL1t ||
>                                            mode == PSR_MODE_EL1h))) {
> -               u64 cpsr = *vcpu_cpsr(vcpu);
>                 u64 mask;
>
>                 /*
> -                * On an illegal exception return, PSTATE.{EL,SP,nRW} and,
> -                * if FEAT_GCS, PSTATE.EXLOCK are unchanged, while the flags
> -                * and masks are taken from the SPSR (R_VWJHB). Set IL so the
> -                * HW generates an Illegal State Exception right after ERET.
> +                * On an illegal exception return, the flags and masks are
> +                * taken from the SPSR while PSTATE.{EL,SP,nRW} and, if
> +                * FEAT_GCS, PSTATE.EXLOCK are unchanged (R_VWJHB). Set IL
> +                * so the HW generates an Illegal State Exception right
> +                * after ERET.
>                  */
>                 mask = PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT |
>                        PSR_N_BIT | PSR_Z_BIT | PSR_C_BIT | PSR_V_BIT;
> @@ -2767,9 +2767,12 @@ static u64 kvm_check_illegal_exception_return(struct kvm_vcpu *vcpu, u64 spsr)
>                         mask |= BIT_ULL(32);    /* PSTATE.PM */
>
>                 spsr &= mask;
> -               spsr |= cpsr & (PSR_MODE_MASK | PSR_MODE32_BIT);
> +
> +               mask = PSR_MODE_MASK | PSR_MODE32_BIT;
>                 if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, GCS, IMP))
> -                       spsr |= cpsr & BIT_ULL(34);     /* PSTATE.EXLOCK */
> +                       mask |= BIT_ULL(34);    /* PSTATE.EXLOCK */
> +
> +               spsr |= *vcpu_cpsr(vcpu) & mask;
>                 spsr |= PSR_IL_BIT;
>         }
>
> Does that work for you?

Yes, that's cleaner, thanks. The two-mask form (take from SPSR, then
preserve from PSTATE) reads better than my interleaved version.

Would you like me to send a v2 (which would be identical to the above?
:) ), or would you fold it in?

Cheers,
/fuad

>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

