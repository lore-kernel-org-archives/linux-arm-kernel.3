Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0540C56201
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 15:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1/6eSd9O2TiB54fazCUnv3/4wHam8gBubDcUImrnEg=; b=DB9WXsnDxEPFY7KIQYuM8s5DZO
	GdijlXkZ8JNdrwV0a2cWqHuO7U0v2mwX7JX4MgUfnFEiuAD/enH36+2NzpnAJFlaoP2oI1kW7GRtL
	w91prlngHXyRrhe3t3N0SYmcQn5chq8IGnl1Xk62WHSa4Bna577DfJDP12yIeBHFd5vto0d0kP0QR
	pVb0MWAnFR97KfDFP6+eR/aZiXaivfrUAJydjVa842vCo81+nlqnvTEUqo7iyN81sEKhWaQ05Ffvx
	kVwSKQ+pkefj8dTlx9vki3FO/Axfm+9DGR/uXJdnYyETdDFXN14m70FKybqshlLtMj5RiP/amOKSv
	kFi9LJqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtSZC-0000000F3Tb-3EKF;
	Fri, 20 Feb 2026 15:37:18 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtSZ9-0000000F3Sh-42PY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 15:37:17 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-5069a785ed2so499491cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Feb 2026 07:37:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771601835; cv=none;
        d=google.com; s=arc-20240605;
        b=KLC3RpMO9FSNzlkayhDujx0U+XVTace4yoHg2EPE25kT3sZbe1FvOSNhxE+xWlbU0p
         meZPy2Gk/HGhrs2ak+4kaov+qyY5gmJoT0ozbqmRgIViZOAcKrNDweB72tQBTnV2Msy+
         PWmB4KoPPl6B4IUSaAfE4oLrBBtFkr9O8mAkwuSxYU3AJT30P+/7L1bpEEc4R5u/vk7P
         tk/8ITD4QKUWChhvlpOeUn4VZheTsaKGDlUa2QUa/IP5c1GusJSWBT0OWCdCfVvQrUjc
         Qux2jZ8dAMA8EM34QbdJslg3iL0rfGF6qWbeIKFhEdCydoxEfJJ4uU+EJ/YmsNeZlFcl
         XSjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J1/6eSd9O2TiB54fazCUnv3/4wHam8gBubDcUImrnEg=;
        fh=VFXcUrr3kGurp0SuF0YJGl5pPwUAd9HYetUbgSB3cYw=;
        b=GccEN7wgrWDYj2dSckzSJPuJWOQZBvaDE9yTatCgDGhiSXrc3mHV4bi0GCS7M1l99k
         W316lzd3xctfFod5muw4226bfIMCbYXWT0tV+nt6PUF2I2MTckwDb+fAXkRpOcjGp/3k
         B19qOvlYuj6mFpy2gX4hnoqknbJv2NraxVOg5DQqLCQyoOdXI9T7rGjD8Mgpy0lg/Ebz
         cHCwGRPLdNGG4w2sgUFFiqeEgyWODpiMMPbima3X9o/zKQ7OiGRFnVuTZPO8kT56Zswt
         xgznwYu5xPqQdziFZXsB8dQCcmXJWofdNYKOksCRk7t6zH/wZT1Y4w8pzkgtOuB5da8E
         8xfQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771601835; x=1772206635; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J1/6eSd9O2TiB54fazCUnv3/4wHam8gBubDcUImrnEg=;
        b=eojtT0QWc1k9J39P1xSDJqf7pu6EzEtOeEk2k3kaVkmF6H+0EDSa6jmDPs4cIvsn1S
         vSDqCPVpB+yyAW6bhK7MAAjSoTrRR+yEWnlVRnOmZwzsRyvdfYebdsULrTizKqSkezHP
         igTG2j6W+P3qlhAmZl8tICDX9iZUzmOJogdT0HSb12yDp3SRMhvv4GyDdHOamXPAUx9j
         8wbHXdb1O9jz6+xx57NRAm1ZEX8l0+hqNfQ+1e2ngxqL2dFx9NrozNsu6wNmH0RPKrOM
         otitb3Fp6DVB9Ycy9tKsq7vX2XMSVqgxuwDzsExInfxMqzZNuJGhEzveB7Rz4/88zX1q
         m3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771601835; x=1772206635;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1/6eSd9O2TiB54fazCUnv3/4wHam8gBubDcUImrnEg=;
        b=SrnN16fInK2bjayx+6UB4c+pIL3GBrxrwHxyZKj/7M4pOV95dWdSUadpZr2V5ohgku
         0kr203gCMbmRsHvAgDhomnk7mxFJoGXG3Cq/86NkFaCUVL4ETcG6/d/7fXWkrIuVTaU8
         2qjfPWCQXFJM0wpyerGpIq22Y1nGNVsOc4l7Iyv3gVHJmKQCKYqRR2lR+4IjBC+H+PbO
         VKWX6LUzR24YGRK2zrq0IladUZ7wsHeMKSmVi9i/YeS1F5jF2Yr7r1xNxK6OpmRNq2uG
         rJP5P8eJwd8Agm9p/5bL0I725JIeZE2bx2kkVzShNtRx5bkW0xvGjlbgem6rBjjqyChk
         J3xg==
X-Gm-Message-State: AOJu0Yywk0KU46jeVHmXNb38gL8JILgOmwbHPbLmsEqfKFNfCmCeipb0
	DZk0IovrV3TGh+cWRRzz7R6DurrwudW62GlYNvE9RZovZJN3Nf3eIP9OaqJYX4odNhPY5LI0CYU
	kntVl58JsJGJV+hdJbUDn7JAY5bCRb+8w0ltAKe4m
X-Gm-Gg: AZuq6aK3wNhXtU0UTn/OJnwBOYmfOc94jjTXtXs5bqYgqjQrSTIGPYLRfNVjWYa+lud
	u5hD1V+XVaASDcxwM+p495TvV/5v9ULCgijGnTvH/YyCxkTAIBpz4vwoEepSPsWEul50zF2sXcN
	XSmdOBgCLtmxnY48NFfoWvPjqnaCOJvwGcEch+/U+h1dPRF9RZdWk1qLA7R1K+2bv34MQ0cX8ty
	Q3OLiCXXpJHhkEuxG142S3ZZmkVP1zJoPEjQOy9bHdQpP6XMT5q3RScMFox7rj+fYScpFhyKhpU
	p5g9GEHO
X-Received: by 2002:ac8:7dc9:0:b0:4ff:cb25:998b with SMTP id
 d75a77b69052e-506fb460d90mr12763151cf.12.1771601834241; Fri, 20 Feb 2026
 07:37:14 -0800 (PST)
MIME-Version: 1.0
References: <20260219195533.2455736-1-maz@kernel.org> <20260219195533.2455736-2-maz@kernel.org>
 <CA+EHjTzVRq3r-7UR-MJYvv-Aw4kHQDHEmwtqY9is-fRDm-J06A@mail.gmail.com>
 <86v7frafpx.wl-maz@kernel.org> <CA+EHjTzj9wEm7oBKBXF8sYpK60FYeLOJwEapxDiO1HxK5e6Y6g@mail.gmail.com>
 <86tsvba2nc.wl-maz@kernel.org>
In-Reply-To: <86tsvba2nc.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 20 Feb 2026 15:36:37 +0000
X-Gm-Features: AaiRm51t-AEADLr9nyHpAp9_H4zOdIaeHbP0gvJbqYqGMNKiq_N-HiLcrQzzmes
Message-ID: <CA+EHjTyiHALTEgA7tuqQZ2ZLW3_vFdTU=vUb7+vn1T4OoMjgsw@mail.gmail.com>
Subject: Re: [PATCH 1/9] arm64: Add logic to fully remove features from
 sanitised id registers
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_073716_018228_70DA8AB4 
X-CRM114-Status: GOOD (  39.00  )
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

Hi Marc,

On Fri, 20 Feb 2026 at 14:52, Marc Zyngier <maz@kernel.org> wrote:
>
> On Fri, 20 Feb 2026 11:06:03 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > > > > +               switch (ftrp->visibility) {
> > > > > +               case FTR_VISIBLE:
> > > > > +                       val = arm64_ftr_set_value(ftrp, val, ftr_new);
> > > > >                         user_mask |= ftr_mask;
> > > > > -               else
> > > > > +                       break;
> > > > > +               case FTR_ALL_HIDDEN:
> > > > > +                       val = arm64_ftr_set_value(ftrp, val, ftrp->safe_val);
> > > > > +                       reg->user_val = arm64_ftr_set_value(ftrp,
> > > > > +                                                           reg->user_val,
> > > > > +                                                           ftrp->safe_val);
> > > >
> > > > Should we also take the safe value in update_cpu_ftr_reg() for FTR_ALL_HIDDEN?
> > >
> > > I would expect arm64_ftr_safe_value() to do the right thing at that
> > > stage, given that we have primed the boot CPU with the safe value, and
> > > that we rely on that bootstrap to make the registers converge towards
> > > something safe. This is also what happens for the command-line override.
> > >
> > > Or have you spotted a case where this go wrong?
> >
> > I think so... What if a future FTR_ALL_HIDDEN feature is defined as
> > FTR_HIGHER_SAFE? Wouldn't that cause problems on secondary CPUs?
> > init_cpu_ftr_reg() primes sys_val with safe_val on the boot CPU,
> > update_cpu_ftr_reg() on secondary CPUs compares the hardware value
> > (ftr_new) against safe_val (ftr_cur). For FTR_HIGHER_SAFE,
> > arm64_ftr_safe_value() returns max(ftr_new, safe_val). Since the
> > hardware value is higher, update_cpu_ftr_reg() overwrites sys_val with
> > the hardware value, resurrecting the hidden feature globally.
>
> Huh, that's an interesting observation.
>
> SpecSEI is the only case we currently deal with that is
> HIGHER_SAFE. But look at what this feature describes: bloody
> speculative SErrors! Not taking this into account could be really
> deadly, and the kernel really ought to know about it.

I didn't think that much about it, but I guess features designated as
FTR_HIGHER_SAFE (like SpecSEI) usually represent hardware errata or
critical mitigations. So we should not be hiding them at all.

> >
> > The features in this patch are FTR_LOWER_SAFE or FTR_EXACT (which
> > happen to sink to safe_val), which is why it's not a problem with
> > these current features.
>
> My conclusion is that it is simply not safe to make such feature
> conditional in any way. Note that's also the case of for an override:
> look at how we will refuse to downgrade a value in init_cpu_ftr_reg():
>
>                 if ((ftr_mask & reg->override->mask) == ftr_mask) {
>                         s64 tmp = arm64_ftr_safe_value(ftrp, ftr_ovr, ftr_new);
>                         char *str = NULL;
>
>                         if (ftr_ovr != tmp) {
>                                 /* Unsafe, remove the override */
>                                 reg->override->mask &= ~ftr_mask;
>                                 reg->override->val &= ~ftr_mask;
>                                 tmp = ftr_ovr;
>                                 str = "ignoring override";
>                 [...]
>
> I think we must prevent this downgrade the same way, meaning that
> ALL_HIDDEN and FTR_HIGHER are mutually exclusive.
>
> How about that:
>
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index d58931e63a0b6..2cae00b4b0c5f 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -1067,7 +1067,14 @@ static void init_cpu_ftr_reg(u32 sys_reg, u64 new)
>                         user_mask |= ftr_mask;
>                         break;
>                 case FTR_ALL_HIDDEN:
> -                       val = arm64_ftr_set_value(ftrp, val, ftrp->safe_val);
> +                       /*
> +                        * ALL_HIDDEN and HIGHER_SAFE are incompatible.
> +                        * Only hide from userspace, and log the oddity.
> +                        */
> +                       if (WARN_ON(ftrp->type == FTR_HIGHER_SAFE))
> +                               val = arm64_ftr_set_value(ftrp, val, ftr_new);
> +                       else
> +                               val = arm64_ftr_set_value(ftrp, val, ftrp->safe_val);
>                         reg->user_val = arm64_ftr_set_value(ftrp,
>                                                             reg->user_val,
>                                                             ftrp->safe_val);
>

Yes, I think WARN_ON() here is the right call.

That said, I still think you should explicitly short-circuit
update_cpu_ftr_reg() for FTR_ALL_HIDDEN features, in addition to the
WARN_ON(). Relying on arm64_ftr_safe_value() to naturally preserve the
safe_val during secondary CPU boot seems mathematically fragile.

Take MTE_frac as an example. It uses S_ARM64_FTR_BITS and
FTR_LOWER_SAFE with a safe_val of 0. If it were marked FTR_ALL_HIDDEN,
init_cpu_ftr_reg() would prime sys_val with 0. But if a secondary CPU
boots and reports -1 (NI), arm64_ftr_safe_value() will execute min(-1,
0) and return -1. update_cpu_ftr_reg() will then overwrite the primed
safe_val (0) with -1. The "hidden" state established by the boot CPU
is gone, and the feature's hardware state is now exposed globally.

Note that MTE is currently ALL_HIDDEN when configured out, so it's not
totally inconceivable that someone decides to make MTE_frac ALL_HIDDEN
as well. Explicitly short-circuiting for FTR_ALL_HIDDEN features in
update_cpu_ftr_reg() seems to be the safer bet here.

Cheers,
/fuad

>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

