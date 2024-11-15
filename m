Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A97D6DDEC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 09:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZSduSpw6Gs8k/0VwrNK4EQsaE6HAEWDhJjg1+iiQFrU=; b=cEfsK1T82Va46F9aIsjBIcJB8v
	NK+ySl6r9tiAsgE5hwpMf6qXOd018GJ11iBhRTNCgBSP1Tc8XtsedGB/ubJx7xYLTyp/+do+wc402
	lcYs4MeCdhC2PTmv9RoDJ8do0ICe81Fpbu5MLEhiqsS2AG0Fqu/3Sf0nX/vFn4hm2+R0yZYoSZ2bo
	2EHsiAHOalS+/bX0gLvRSRFGAzBDv4LUCf19zt0E5Ycy7cHwMKm6kyawBh9ov9A5rcdBXf/Pt7SPg
	gEE02AR4UXNWX+Noa+iSaoC6mSrwmY/mzzpmyRbU97WO8q8e7B+KfpoaOWAOuNIHY1C/oL5+M7ESi
	P9Odz3wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBsDH-000000027ez-2xdm;
	Fri, 15 Nov 2024 09:01:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBsC2-000000027Jv-2zdD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 09:00:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4DE6B5C5C57
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 08:59:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C621C4CECF
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 09:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731661241;
	bh=ep6e6vrM90+sANFQNBPsBH/0puLJC8rHexalC7iAPdk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=g8db1pBccH96DxqOHKfc2GWxOPNR7o2mN9YY+T59BAxt1TwyNKOr48DtTjyEif4Q7
	 FVYSU084mEIJQyyRLgv7i1VZ9nVCCiKg7BYDPssj4M5omGZvrMRjmg0bEYHfVNHr1b
	 J7VwOQ+PkWEDWKn763/e/l6iAQRbUOn+nVhS+o2/yIcYc31q1b/hiAum8bLetOGOGc
	 67e9kLWGznHq+ghh8hORihpKixZdnPVGySZ7pK/cGJtMpcary0eaJBrECEjArhsKhh
	 lAxLUU9qabRAi+yktNp62IdbPsVBzTuxmLX7ej4MLBkDndcEgpRFPyAfx6dDKdXmCQ
	 JHArw365ycE5A==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb4fa17044so16394421fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 01:00:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX+b4KvhBq/XZZXEJ2FCpv+XjrHiW8W5CWLnG43yZ9AP1l3gq20UWr6OrarJjvIGenzQKQLWFG1WD26HSnFjgbk@lists.infradead.org
X-Gm-Message-State: AOJu0YznwVzOsuB/iwIyqAMkgnRdCYdoSV2Ud4m8nnibgkI+zWkosA2b
	QyCbHcwVLYtVN5s/FfF0KFY228ZXgq7WTqQSczleARKk6uX2XY37EM6u+tJf4ASAsopKWBGjQXS
	H9sRpCHWxZISnEL6nI48TmQRDuN4=
X-Google-Smtp-Source: AGHT+IE0QJBljUkm8oRmVb4pgis/ZjWPlu7BiybmSlxSYB+SiOgXWAJnKXSwfSr9IRUZHqmg2tA8/0dnJAWqKj//OnU=
X-Received: by 2002:a2e:a9a8:0:b0:2fb:6110:c5cb with SMTP id
 38308e7fff4ca-2ff6070e6c1mr10431401fa.34.1731661239537; Fri, 15 Nov 2024
 01:00:39 -0800 (PST)
MIME-Version: 1.0
References: <20241111083544.1845845-8-ardb+git@google.com> <20241111083544.1845845-10-ardb+git@google.com>
 <ea124997-8dee-457c-bef1-d5d829c84da3@arm.com>
In-Reply-To: <ea124997-8dee-457c-bef1-d5d829c84da3@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 15 Nov 2024 10:00:27 +0100
X-Gmail-Original-Message-ID: <CAMj1kXF1kYaiJmQXdvfSzGmgO78cechpm-JC=n3yGhRBXQF6nw@mail.gmail.com>
Message-ID: <CAMj1kXF1kYaiJmQXdvfSzGmgO78cechpm-JC=n3yGhRBXQF6nw@mail.gmail.com>
Subject: Re: [PATCH 2/6] arm64/mm: Override PARange for !LPA2 and use it consistently
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Kees Cook <keescook@chromium.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_010042_853276_CE629B8D 
X-CRM114-Status: GOOD (  42.26  )
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

Hi Anshuman,

On Fri, 15 Nov 2024 at 07:05, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> On 11/11/24 14:05, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > When FEAT_LPA{,2} are not implemented, the ID_AA64MMFR0_EL1.PARange and
> > TCR.IPS values corresponding with 52-bit physical addressing are
> > reserved.
> >
> > Setting the TCR.IPS field to 0b110 (52-bit physical addressing) has side
> > effects, such as how the TTBRn_ELx.BADDR fields are interpreted, and so
> > it is important that disabling FEAT_LPA2 (by overriding the
> > ID_AA64MMFR0.TGran fields) also presents a PARange field consistent with
> > that.
> >
> > So limit the field to 48 bits unless LPA2 is enabled, and update
> > existing references to use the override consistently.
> >
> > Fixes: 352b0395b505 ("arm64: Enable 52-bit virtual addressing for 4k and 16k granule configs")
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  arch/arm64/include/asm/assembler.h    | 5 +++++
> >  arch/arm64/kernel/cpufeature.c        | 2 +-
> >  arch/arm64/kernel/pi/idreg-override.c | 9 +++++++++
> >  arch/arm64/kernel/pi/map_kernel.c     | 6 ++++++
> >  arch/arm64/mm/init.c                  | 2 +-
> >  5 files changed, 22 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
> > index 3d8d534a7a77..ad63457a05c5 100644
> > --- a/arch/arm64/include/asm/assembler.h
> > +++ b/arch/arm64/include/asm/assembler.h
> > @@ -343,6 +343,11 @@ alternative_cb_end
> >       // Narrow PARange to fit the PS field in TCR_ELx
> >       ubfx    \tmp0, \tmp0, #ID_AA64MMFR0_EL1_PARANGE_SHIFT, #3
> >       mov     \tmp1, #ID_AA64MMFR0_EL1_PARANGE_MAX
> > +#ifdef CONFIG_ARM64_LPA2
> > +alternative_if_not ARM64_HAS_VA52
> > +     mov     \tmp1, #ID_AA64MMFR0_EL1_PARANGE_48
> > +alternative_else_nop_endif
> > +#endif
>
> I guess this will only take effect after cpu features have been finalized
> but will not be applicable for __cpu_setup() during primary and secondary
> cpu bring up during boot.
>

It is the other way around, actually. This limit will always be
applied on primary boot, which is why IPS is updated again in
set_ttbr0_for_lpa2() [below]. Before booting the secondaries (or other
subsequent invocations of this code, e.g., in the resume path), this
MOV will be NOPed out if LPA2 support is enabled.


> >       cmp     \tmp0, \tmp1
> >       csel    \tmp0, \tmp1, \tmp0, hi
> >       bfi     \tcr, \tmp0, \pos, #3
> > diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> > index 37e4c02e0272..6f5137040ff6 100644
> > --- a/arch/arm64/kernel/cpufeature.c
> > +++ b/arch/arm64/kernel/cpufeature.c
> > @@ -3399,7 +3399,7 @@ static void verify_hyp_capabilities(void)
> >               return;
> >
> >       safe_mmfr1 = read_sanitised_ftr_reg(SYS_ID_AA64MMFR1_EL1);
> > -     mmfr0 = read_cpuid(ID_AA64MMFR0_EL1);
> > +     mmfr0 = read_sanitised_ftr_reg(SYS_ID_AA64MMFR0_EL1);
>
> Small nit, should be renamed as safe_mmfr0 to be consistent with safe_mmfr1 ?
>

safe_mmfr1 exists because there is also mmfr1 in the same scope. No
such distinction exists for mmfr0, so I opted for keeping the name.

> >       mmfr1 = read_cpuid(ID_AA64MMFR1_EL1);
> >
> >       /* Verify VMID bits */
> > diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
> > index 22159251eb3a..c6b185b885f7 100644
> > --- a/arch/arm64/kernel/pi/idreg-override.c
> > +++ b/arch/arm64/kernel/pi/idreg-override.c
> > @@ -83,6 +83,15 @@ static bool __init mmfr2_varange_filter(u64 val)
> >               id_aa64mmfr0_override.val |=
> >                       (ID_AA64MMFR0_EL1_TGRAN_LPA2 - 1) << ID_AA64MMFR0_EL1_TGRAN_SHIFT;
> >               id_aa64mmfr0_override.mask |= 0xfU << ID_AA64MMFR0_EL1_TGRAN_SHIFT;
> > +
> > +             /*
> > +              * Override PARange to 48 bits - the override will just be
> > +              * ignored if the actual PARange is smaller, but this is
> > +              * unlikely to be the case for LPA2 capable silicon.
> > +              */
> > +             id_aa64mmfr0_override.val |=
> > +                     ID_AA64MMFR0_EL1_PARANGE_48 << ID_AA64MMFR0_EL1_PARANGE_SHIFT;
> > +             id_aa64mmfr0_override.mask |= 0xfU << ID_AA64MMFR0_EL1_PARANGE_SHIFT;
> Could these be used instead ?
>
> SYS_FIELD_PREP_ENUM(ID_AA64MMFR0_EL1, PARANGE, 48)
> ID_AA64MMFR0_EL1_PARANGE_MASK ?
>

Yes, but 2 lines before, there is another occurrence of this idiom,
and I did not want to deviate from that.

We could update both, or update the other one first in a separate
patch, I suppose.


>
> >       }
> >  #endif
> >       return true;
> > diff --git a/arch/arm64/kernel/pi/map_kernel.c b/arch/arm64/kernel/pi/map_kernel.c
> > index f374a3e5a5fe..e57b043f324b 100644
> > --- a/arch/arm64/kernel/pi/map_kernel.c
> > +++ b/arch/arm64/kernel/pi/map_kernel.c
> > @@ -136,6 +136,12 @@ static void noinline __section(".idmap.text") set_ttbr0_for_lpa2(u64 ttbr)
> >  {
> >       u64 sctlr = read_sysreg(sctlr_el1);
> >       u64 tcr = read_sysreg(tcr_el1) | TCR_DS;
> > +     u64 mmfr0 = read_sysreg(id_aa64mmfr0_el1);
> > +     u64 parange = cpuid_feature_extract_unsigned_field(mmfr0,
> > +                                                        ID_AA64MMFR0_EL1_PARANGE_SHIFT);
> > +
> > +     tcr &= ~TCR_IPS_MASK;
>
> Could there be a different IPS value in TCR ? OR is this just a normal
> clean up instead.
>

As explained above, TCR.IPS will be capped at 48 bits up to this point.

> > +     tcr |= parange << TCR_IPS_SHIFT;
>
> Wondering if FIELD_PREP() could be used here.
>

AIUI we'd end up with

tcr &= ~TCR_IPS_MASK;
tcr |= FIELD_PREP(TCR_IPS_MASK, parange);

Is that really so much better?


> >
> >       asm("   msr     sctlr_el1, %0           ;"
> >           "   isb                             ;"
> > diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> > index d21f67d67cf5..4db9887b2aef 100644
> > --- a/arch/arm64/mm/init.c
> > +++ b/arch/arm64/mm/init.c
> > @@ -280,7 +280,7 @@ void __init arm64_memblock_init(void)
> >
> >       if (IS_ENABLED(CONFIG_RANDOMIZE_BASE)) {
> >               extern u16 memstart_offset_seed;
> > -             u64 mmfr0 = read_cpuid(ID_AA64MMFR0_EL1);
> > +             u64 mmfr0 = read_sanitised_ftr_reg(SYS_ID_AA64MMFR0_EL1);
>
> Could this have a comment explaining the need for sanitized value ?
>

Sure. Actually, it shouldn't make any difference here (unless we allow
PARange to be narrowed even further, which might make sense if we care
about enabling randomization of the linear map on systems where
PARange is much larger than the size of the physical address space
that is actually populated). However, for consistency, it is better to
avoid the 52-bit PARange if LPA2 is disabled.


> >               int parange = cpuid_feature_extract_unsigned_field(
> >                                       mmfr0, ID_AA64MMFR0_EL1_PARANGE_SHIFT);
> >               s64 range = linear_region_size -
>
> Otherwise LGTM.

Thanks!

