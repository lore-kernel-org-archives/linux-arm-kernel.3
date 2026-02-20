Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001CCC55190
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 11:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RFp5DfGIm5rTdSxaBfSzcrJypBa2V3M4F1JeGuwI7jo=; b=cmdeWTXwwufpPW1SpUhPWWqbGo
	AKTABzBY30H/s6FYgiJzSCnwhjyJy0iIUlzbTmJ6d2W+fyv7ycNJxz3wMRWWR04XhvhuG3KarR7MZ
	2O2Cj0MZTdpGM7nXRhkLZTriaLTCA+EFCTl3dM5IonznnUh7o+NFWvoPqj7LX8UnJRF5V58wEYYzb
	UsLVZ9/amVvsiECp0qJM6esf27yRoewX028qTaxZV1kNbTjTzjX7NueJ3J4k8q+wvhLFkfM52eHXE
	J0Tg/8YhGLBWBLZOOFqlv+f2771Z+vTNhxozwnPcZ8fOcxF54L75Ulfe5BVH5tS6YB+3nhBkJNw+z
	zLBQa42g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtOLM-0000000EJb8-1Gf6;
	Fri, 20 Feb 2026 11:06:44 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtOLJ-0000000EJYn-22iU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 11:06:42 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-506a355aedfso434231cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Feb 2026 03:06:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771585600; cv=none;
        d=google.com; s=arc-20240605;
        b=iWJtY9hOvRaw+mYR0OQdlaT64b9VNhxX/SEnKJPBNufvV0bDNZR+arMA202WzUHWcN
         TmARsRZj+3HQ/Vqpi6wJWd3lb0bm2DS+pzTez8udPz011DV+aglGwLksp/hpdhV+xvnx
         JzO7JUvzgLTEsJ4knIZPgb4V2v08ZuZQLiU490GiWbaIkZMxHla5UbzqvL9pBJfCy0kd
         WuaCgbHh3Zeoe23sDgx7B+r8+OYu7NJ0WzdAyZF/PvGuMJ0cUhIvj4m0KlBWmiJ8FIws
         4LOWwKzVgIpfEtKlkWiFhAvssSYfVzFvYxTO6XbZX3A5bJmPIY80dRlnPP8QMWsD+6Ig
         qjiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RFp5DfGIm5rTdSxaBfSzcrJypBa2V3M4F1JeGuwI7jo=;
        fh=VFXcUrr3kGurp0SuF0YJGl5pPwUAd9HYetUbgSB3cYw=;
        b=cq7OLFVlvIh/TN312Jy6228eC0uDQs2jVqq8yeEH4boU6fW4p7wyrdImmTGKR0RlAX
         /esm5tgHnddUkF+VNgc3b/Rsoy/AIlpDAQb5yEucmDARyBo/RiMfTPzjws3qDWFJP2TP
         MvFtD1apIkDpByfU7IIF3hKyfCV0vg0AXZUMTZs8PGIQtSLhSJzFCLTkHGrmwNh2l6F/
         EVUbaxfwYV7SRm+0s1fAAWL1DBrbg8ZjXwEQksf9wJ7RxgXSJ8wQmMY/pMAghoTAgZBL
         00wUZNaagIBasD8DuA0vzVHcweuoU+zP1DQltJWym5yplVi/2NjUb/AtqxYjlBttiON7
         eKJg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771585600; x=1772190400; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RFp5DfGIm5rTdSxaBfSzcrJypBa2V3M4F1JeGuwI7jo=;
        b=WUez3brLaVARwZMYalp4z4Rpc+nPSWltGDyASrZPn8qrlYa2Z250CHsJyQ97Cf/FJG
         I3tH9Oz4NGA5OMNlAeTFYRfEGwYkEaXofBbxtmfhy/MV/Sj6abn5rqr/DBWCLB+DnLDt
         YZGDMxMzPl45nvfqjnIWhTVTzLP02kX5zdg2q1L6ohZsBiEa2KK7IyOLrlYbWkQ3WDr9
         WTbMuCh8vpRxIaB0FMFjTtpmxPLOilMRaq5Gu+VGk33dNBg3qDwBvpo2T3v9SceK6+LI
         cv6PTxS/IOVXlDAelN3gzwojo0LhJzzOqZehO19zRcBqyQ+mbiKWVslAPo4RyYjXc7mO
         HGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771585600; x=1772190400;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFp5DfGIm5rTdSxaBfSzcrJypBa2V3M4F1JeGuwI7jo=;
        b=lVKxZC/UeMte3mLUUKAtcp8lWkko0/kXF16mdxh1oGMiPCUO/vjJRqmEquNuQ1T1A1
         0EKzjLI8nGJ7VsTVuKyRIDCuowo1PAO2kvzUAjBPpgfaQA2F/kxHXqTGarsYSepZ+486
         CDKLeN9nM+brlDywRZZuKZXerkNNZ/HRu1yxogHsQNwgpCBjMcRIB0wl/a1UJLcsHnZQ
         mWlbqrS3a9HixVdv7lEbEIcgeMMd2+uaU2ErCZlKGQgd8l1hVUje2hWG2lB7cQTteAg2
         e+6uG4w9kUMikAVLCs+woPH1YHZoQ8Zr0tr91ZAA0HB6CLz2mwxBvAB7gq/rj/fdpAaw
         diQw==
X-Gm-Message-State: AOJu0YxNsPGaz2GfksWlhKWeDfx6YPlWQAWyTloiRvzmVSlCpA4z1nKf
	r+FabUIKNT/RwuMkAbBhw23EntM9DQcpkmD95KgDiBsvnr+po2xkU+Ear9aD3rldRSJMr/yudC2
	YAH1k0UBYo/solrC3OwgPySNPzb6BQ9r2EPxjUaeE
X-Gm-Gg: AZuq6aJZRDyT5HWgnUa02vI+LZYlVXsxXBdanVrABu19moXDASDa69tklOqM/1n8YLz
	AADDZ7oTYZjJyjzfWBn3JPWyCaOCOan1YrG4z7hXZoMV9L+vZpVlXetmCsa9KTAfV0jmtopE4Ri
	mZ0l9pTs8DRndMZIJf8pesm1+czD80AMtlF351B/VLVl10yTyzBof4a+BqJ0KOJ+QPcpkOjhply
	d/GATjurVv2j56vOHEvyOgd4oHKechtPV2OoFsaLUGAKhrbde9oHPdsShNsWqvfuXUIZ4kYp9hv
	Cnavhfsz
X-Received: by 2002:a05:622a:138b:b0:4ff:cb75:2a22 with SMTP id
 d75a77b69052e-506fc3e0c41mr7730581cf.3.1771585599550; Fri, 20 Feb 2026
 03:06:39 -0800 (PST)
MIME-Version: 1.0
References: <20260219195533.2455736-1-maz@kernel.org> <20260219195533.2455736-2-maz@kernel.org>
 <CA+EHjTzVRq3r-7UR-MJYvv-Aw4kHQDHEmwtqY9is-fRDm-J06A@mail.gmail.com> <86v7frafpx.wl-maz@kernel.org>
In-Reply-To: <86v7frafpx.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 20 Feb 2026 11:06:03 +0000
X-Gm-Features: AaiRm53GNWjxaOs-wYxPbiX3btlEdWrInHpONxoYyYWhEw30R7kUbfS5nY5TfDA
Message-ID: <CA+EHjTzj9wEm7oBKBXF8sYpK60FYeLOJwEapxDiO1HxK5e6Y6g@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260220_030641_579763_1E8D13D8 
X-CRM114-Status: GOOD (  52.43  )
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

On Fri, 20 Feb 2026 at 10:09, Marc Zyngier <maz@kernel.org> wrote:
>
> Hey Fuad,
>
> Thanks for taking a look.
>
> On Fri, 20 Feb 2026 08:36:04 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > Hi Marc,
> >
> > On Thu, 19 Feb 2026 at 19:55, Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > We currently make support for some features such as Pointer Auth,
> > > SVE or S1POE a compile time decision.
> > >
> > > However, while we hide that feature from userspace when such support
> > > is disabled, we still leave the value provided by the HW visible to
> > > the rest of the kernel, including KVM.
> > >
> > > This has the potential to result in ugly state leakage, as half of
> > > the kernel knows about the feature, and the other doesn't.
> > >
> > > Short of completely banning such compilation options and restore
> > > universal knowledge, introduce the possibility to fully remove such
> > > knowledge from the sanitised id registers.
> > >
> > > This has more or less the same effect as the idreg override that
> > > a user can pass on the command-line, only defined at build-time.
> > >
> > > For that purpose, we provide a new macro (FTR_CONFIG()) that defines
> > > the behaviour of a feature, both when enabled and disabled.
> > >
> > > At this stage, nothing is making use of this anti-feature.
> > >
> > > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > > ---
> > >  arch/arm64/include/asm/cpufeature.h | 15 ++++++++++-----
> > >  arch/arm64/kernel/cpufeature.c      | 21 ++++++++++++++++-----
> > >  2 files changed, 26 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> > > index 4de51f8d92cba..2731ea13c2c86 100644
> > > --- a/arch/arm64/include/asm/cpufeature.h
> > > +++ b/arch/arm64/include/asm/cpufeature.h
> > > @@ -53,15 +53,20 @@ enum ftr_type {
> > >  #define FTR_SIGNED     true    /* Value should be treated as signed */
> > >  #define FTR_UNSIGNED   false   /* Value should be treated as unsigned */
> > >
> > > -#define FTR_VISIBLE    true    /* Feature visible to the user space */
> > > -#define FTR_HIDDEN     false   /* Feature is hidden from the user */
> > > +enum ftr_visibility {
> > > +       FTR_HIDDEN,             /* Feature hidden from the user */
> > > +       FTR_ALL_HIDDEN,         /* Feature hidden from kernel, user and KVM */
> > > +       FTR_VISIBLE,            /* Feature visible to all observers */
> > > +};
> > > +
> > > +#define FTR_CONFIG(c, e, d)                            \
> > > +       (IS_ENABLED(c) ? FTR_ ## e : FTR_ ## d)
> > >
> > > -#define FTR_VISIBLE_IF_IS_ENABLED(config)              \
> > > -       (IS_ENABLED(config) ? FTR_VISIBLE : FTR_HIDDEN)
> > > +#define FTR_VISIBLE_IF_IS_ENABLED(c)   FTR_CONFIG(c, VISIBLE, HIDDEN)
> > >
> > >  struct arm64_ftr_bits {
> > >         bool            sign;   /* Value is signed ? */
> > > -       bool            visible;
> > > +       enum ftr_visibility visibility;
> > >         bool            strict; /* CPU Sanity check: strict matching required ? */
> > >         enum ftr_type   type;
> > >         u8              shift;
> >
> > This introduces bloat. Should you group the bools together and the
> > enums together?
>
> That should be possible as long as everybody ends up using the
> __ARM64_FTR_BITS macro. On the other hand, I could reduce the width of
> the enum to something more appropriate and keep the current layout.
>
> With the current changes, this looks like this:
>
> struct arm64_ftr_bits {
>         bool                       sign;                 /*     0     1 */
>
>         /* XXX 3 bytes hole, try to pack */
>
>         enum ftr_visibility        visibility;           /*     4     4 */
>         bool                       strict;               /*     8     1 */
>
>         /* XXX 3 bytes hole, try to pack */
>
>         enum ftr_type              type;                 /*    12     4 */
>         u8                         shift;                /*    16     1 */
>         u8                         width;                /*    17     1 */
>
>         /* XXX 6 bytes hole, try to pack */
>
>         s64                        safe_val;             /*    24     8 */
>
>         /* size: 32, cachelines: 1, members: 7 */
>         /* sum members: 20, holes: 3, sum holes: 12 */
>         /* last cacheline: 32 bytes */
> };
>
> which is 8 bytes larger than the upstream version. But if I do this:
>
> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> index adaae3060851c..d8accc9c94fab 100644
> --- a/arch/arm64/include/asm/cpufeature.h
> +++ b/arch/arm64/include/asm/cpufeature.h
> @@ -64,9 +64,9 @@ enum ftr_visibility {
>
>  struct arm64_ftr_bits {
>         bool            sign;   /* Value is signed ? */
> -       enum ftr_visibility visibility;
> +       enum ftr_visibility visibility:8;
>         bool            strict; /* CPU Sanity check: strict matching required ? */
> -       enum ftr_type   type;
> +       enum ftr_type   type:8;
>         u8              shift;
>         u8              width;
>         s64             safe_val; /* safe value for FTR_EXACT features */
>
> I end up with the following layout:
>
> struct arm64_ftr_bits {
>         bool                       sign;                 /*     0     1 */
>
>         /* Bitfield combined with previous fields */
>
>         enum ftr_visibility        visibility:8;         /*     0: 8  4 */
>
>         /* Bitfield combined with next fields */
>
>         bool                       strict;               /*     2     1 */
>
>         /* Bitfield combined with previous fields */
>
>         enum ftr_type              type:8;               /*     0:24  4 */
>         u8                         shift;                /*     4     1 */
>         u8                         width;                /*     5     1 */
>
>         /* XXX 2 bytes hole, try to pack */
>
>         s64                        safe_val;             /*     8     8 */
>
>         /* size: 16, cachelines: 1, members: 7 */
>         /* sum members: 12, holes: 1, sum holes: 2 */
>         /* sum bitfield members: 16 bits (2 bytes) */
>         /* last cacheline: 16 bytes */
> };
>
> which is 8 bytes *smaller* than the upstream version, without
> reordering. WDYT?

Using 8-bit bitfields for the enums shrinks the footprint from 24 to
16 bytes while preserving the structure's semantic readability. I like
this approach.

>
> >
> > > diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> > > index c840a93b9ef95..b34a39967d111 100644
> > > --- a/arch/arm64/kernel/cpufeature.c
> > > +++ b/arch/arm64/kernel/cpufeature.c
> > > @@ -192,7 +192,7 @@ void dump_cpu_features(void)
> > >  #define __ARM64_FTR_BITS(SIGNED, VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE_VAL) \
> > >         {                                               \
> > >                 .sign = SIGNED,                         \
> > > -               .visible = VISIBLE,                     \
> > > +               .visibility = VISIBLE,                  \
> > >                 .strict = STRICT,                       \
> > >                 .type = TYPE,                           \
> > >                 .shift = SHIFT,                         \
> > > @@ -1057,17 +1057,28 @@ static void init_cpu_ftr_reg(u32 sys_reg, u64 new)
> > >                                 ftrp->shift);
> > >                 }
> > >
> > > -               val = arm64_ftr_set_value(ftrp, val, ftr_new);
> > > -
> > >                 valid_mask |= ftr_mask;
> > >                 if (!ftrp->strict)
> >
> > Should FTR_ALL_HIDDEN also be removed from strict_mask? i.e.
> >
> > -                 if (!ftrp->strict)
> > +                 if (!ftrp->strict || || ftrp->visibility == FTR_ALL_HIDDEN)
> >
> > (or under the ALL_HIDDEN case below).
>
> If we run on a system that has diverging features, we probably want to
> know irrespective of the feature being enabled. After all, the
> integration is out of spec, and conveying that information is
> important, just in case the diverging feature affects behaviour in
> funny ways...

I see. If the kernel is booted on broken/asymmetric hardware, we still
want to warn the user about the underlying violation, even if we are
pretending the feature doesn't exist for our own purposes. Leaving it
in the strict_mask is the correct approach to retain that diagnostic
capability.

> >
> >
> > >                         strict_mask &= ~ftr_mask;
> > > -               if (ftrp->visible)
> > > +
> > > +               switch (ftrp->visibility) {
> > > +               case FTR_VISIBLE:
> > > +                       val = arm64_ftr_set_value(ftrp, val, ftr_new);
> > >                         user_mask |= ftr_mask;
> > > -               else
> > > +                       break;
> > > +               case FTR_ALL_HIDDEN:
> > > +                       val = arm64_ftr_set_value(ftrp, val, ftrp->safe_val);
> > > +                       reg->user_val = arm64_ftr_set_value(ftrp,
> > > +                                                           reg->user_val,
> > > +                                                           ftrp->safe_val);
> >
> > Should we also take the safe value in update_cpu_ftr_reg() for FTR_ALL_HIDDEN?
>
> I would expect arm64_ftr_safe_value() to do the right thing at that
> stage, given that we have primed the boot CPU with the safe value, and
> that we rely on that bootstrap to make the registers converge towards
> something safe. This is also what happens for the command-line override.
>
> Or have you spotted a case where this go wrong?

I think so... What if a future FTR_ALL_HIDDEN feature is defined as
FTR_HIGHER_SAFE? Wouldn't that cause problems on secondary CPUs?
init_cpu_ftr_reg() primes sys_val with safe_val on the boot CPU,
update_cpu_ftr_reg() on secondary CPUs compares the hardware value
(ftr_new) against safe_val (ftr_cur). For FTR_HIGHER_SAFE,
arm64_ftr_safe_value() returns max(ftr_new, safe_val). Since the
hardware value is higher, update_cpu_ftr_reg() overwrites sys_val with
the hardware value, resurrecting the hidden feature globally.

The features in this patch are FTR_LOWER_SAFE or FTR_EXACT (which
happen to sink to safe_val), which is why it's not a problem with
these current features.

Cheers,
/fuad

> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

