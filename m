Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5F9D358F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 10:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zO6ULjWkwKOa6nt1pqPrr7dCq2tIVIRxD42Sn5fil18=; b=Dm2iR7Tz6URVdNI7xn39mN4tuH
	DpI2MmwY76JIoJPxdwNxfmUbSP/vb/C9OAkWzjLIpPUSx43Bs6OwSKA0R0DJRX7ABF9cK21wvf8xA
	4FR1EauZfybOkckz4zy6kEtCysASgDkr4/Duiz0vMjaQT8yIer+Wk9bm1p0XJ+EhwgrpdEVoq++H6
	REuV7mSqG/1ExMxAUZGxmrn/QT3rnEEzkqk9fnYzed3Z5qgR2aZdy8jH/cXb1UqxbZvyxDzkpa2Cu
	2GhjVDEDNhN1OhYUnKurGVFd6mbHl6iK4OC5uoHiObF9IjrEREeFCYB9sDWNA7+EV4EuRP8T4ZUO4
	ddzkrKIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlPJJ-0000000HaRF-0ccC;
	Thu, 29 Jan 2026 10:31:37 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlPJG-0000000HaQl-3lqj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 10:31:36 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-5014b5d8551so317301cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 02:31:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769682693; cv=none;
        d=google.com; s=arc-20240605;
        b=ezch71IGqI6iqZz3CbejmcNYCjJOzGP0/oshK75UBpC8E2sMUpBlUKfVqHV9oQMBHV
         ++j/Kp/GFk8tvusKrDYaJIiHc1UkGa6Jpn44q4r8Q4VM06EyZzHzse8ANOjXNdBIR7V4
         vkGIBnNTrMDMATjzZVEclrFhb879SsMMr+4JwXlzI49TyHxTbd9r2sabLq0qJFXjpYDb
         Lg9kPjtKAzBsMM1F2Ayg+3PDklMrvsggpl+yZuyqON0e/H9wWI8gj2ru8FtW07Tg3BD6
         TRVWeZvTYQbCPju2MfdxcaTYzlLVEVBoac+kqudeM+f5fymbOYI4C4VXTR9KTlTkhv1I
         COAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zO6ULjWkwKOa6nt1pqPrr7dCq2tIVIRxD42Sn5fil18=;
        fh=LWJ52IZgkXVFDYPfUJ3AWIUag93eZja5MlP+/p8GXz8=;
        b=ejrSURQpPlOhTnICNCAfwQzEq5Giux5xSdltbMmpZUdeAtkBuWBj5BDRfqfwur+JpC
         Btqbq52P4wqVdVA4q6QlG+4WZpVZCbuytezYiokKr9Y0g+Yrpo1KGI00b0aFjK2IIMk1
         xTuX+BTRMJzD4UDS8d4keHAPyax2OfOtNZAZdYo2nlwAypaX8TgNjfErqJdpfPdpwPph
         0dTvtobEsn/j3qwlKTzMvE4g1GdGebTMRI//x6E3+MHzuym2k346ePfLVCwPTIHHIW9e
         EU+DmPQkWqdFEVGuXHo0dCDgbOAGDqqGXy65m4Z0GOtiSzSewtlkAW55oOZWFjEcWC/O
         dfgA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769682693; x=1770287493; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zO6ULjWkwKOa6nt1pqPrr7dCq2tIVIRxD42Sn5fil18=;
        b=DmNulQYDPLSiodtCLgzAewbcsHP0B2dNPZ1chTSYA1YmHLp/EsX614KsRYjugaGhUp
         xm7oGN4uhqZRmXmAq1EOvEjAX47gngGArngQx9cR8i1gi3KmQlZWWsyTj7hTxZS+SdCN
         n0tnq87OhY5vbwG70pKmuJw4Iy3ipIWlCXl9w7+0w6jlmR5zJSsmjNrcmA90ex/WsNJZ
         Butl5JmioSjORKpeDNQS8fFcchUpKwklqq331nIhcTE8g8ajEpWO+9PmSim7nRKqxX5B
         NTi0z2POtjqJGrHaSUOAu8JazYfzbEJ3NirtU8j6hhfIeQ73zSN+BMrjINXxFWQkJ3C+
         VsZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769682693; x=1770287493;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zO6ULjWkwKOa6nt1pqPrr7dCq2tIVIRxD42Sn5fil18=;
        b=WIkcDlNJyoux5wrmjvAImjju5BUN9bYbCpBOuvxREYv4GVYZVv4ZHngWwXEt8MnJOz
         mClMUzWXEUjKhNebhkIph+ZgHfpFVqfdOSmdTb2gk0JBWcPCjqSMspvee7PDg25Rm2/D
         YaVxmMMKYFcPqZ4DzCngHRHddF2CZjJi3UiSLqgTApoE3iY9l/VYgWW8aGFS4ehQV7qm
         giuhyh6zQphXcYRDjGSe4tamjiL23r9Vl88RgViix8rlLV5u9N2tG59kI3Tz/x1EKbQD
         Az/xkVepZwxbcXAu+3mICbDEppQsVnZMRd1aQz5WALwrhjI3TpcsAUyq6K/tzYpSju8D
         nwPg==
X-Forwarded-Encrypted: i=1; AJvYcCWsvO6ZUJQqV7AKX+54r93dMTWraJuh/cB/2fYnoTHnuDeqJb8ubxs8EMSr8TIYpQCFsPVd6fxgh4l5tVJK7i5o@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ1EyXVgJe0A6lRMn3d9ax78v0tGtQJrhedBntKHlhOBJXsMXM
	i+BTyweVZYmn6RM72IlM4fLokBPmMeJnSajPTLtfcfskE6aTU9S4VBGD9ybGgPXynfhfufce4ek
	jh52qRxBG9MWpgi4f6AOTGnal+Lw9doO/1L6h2puD
X-Gm-Gg: AZuq6aJ8bIQJ7rzBv0Reeksy6A58ykYhAZVWV0ZjtedU0c8bXD3ToKy3A3KGy97UHj0
	RRCXGjHV77FqCVXKXMdv1pICc5jl2LmcU6zwZU84cSZ2D1Msuv7RK5XcSxkWPiubj9DEbJLYGg6
	23z7UfhFENVY+ii57IsWKbS1Bq9ohMqx4ZxJdkRohXLzX9UI6hvFAzOfppDTnKhz4q/FSqArsBb
	0Y4x/vk0//ycvQne/ozNBw/FvQ0AsGWuDlT+8RCyNxMy+BEj5/W21GZdiFF+9pVJ34MKMA/
X-Received: by 2002:ac8:7c47:0:b0:503:2d8f:4cd9 with SMTP id
 d75a77b69052e-503b67573e4mr10564691cf.16.1769682692446; Thu, 29 Jan 2026
 02:31:32 -0800 (PST)
MIME-Version: 1.0
References: <20260126121655.1641736-1-maz@kernel.org> <20260126121655.1641736-13-maz@kernel.org>
 <CA+EHjTzL6bNZ=sZoub3GY=VZ2bJ+4bFr4jkuiMMBCEqXuAkQPA@mail.gmail.com> <86bjicbu9f.wl-maz@kernel.org>
In-Reply-To: <86bjicbu9f.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 29 Jan 2026 10:30:56 +0000
X-Gm-Features: AZwV_QgqI3U9H1Cbj8nMPhTIPfiH9Gdegl3zrhuYCGMvoUDbuda-PJQ9wfvc9AI
Message-ID: <CA+EHjTwjTa6QbKONdSNKR2GP8L8qy2q8yF-eyomQBkamUykc+Q@mail.gmail.com>
Subject: Re: [PATCH 12/20] KVM: arm64: Add RESx_WHEN_E2Hx constraints as
 configuration flags
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_023134_962857_4BEFDFB3 
X-CRM114-Status: GOOD (  49.91  )
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

On Thu, 29 Jan 2026 at 10:14, Marc Zyngier <maz@kernel.org> wrote:
>
> Hey Fuad,
>
> On Wed, 28 Jan 2026 17:43:40 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > Hi Marc,
> >
> > On Mon, 26 Jan 2026 at 12:17, Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > "Thanks" to VHE, SCTLR_EL2 radically changes shape depending on the
> > > value of HCR_EL2.E2H, as a lot of the bits that didn't have much
> > > meaning with E2H=0 start impacting EL0 with E2H=1.
> > >
> > > This has a direct impact on the RESx behaviour of these bits, and
> > > we need a way to express them.
> > >
> > > For this purpose, introduce a set of 4 new constaints that, when
> > > the controlling feature is not present, force the RESx value to
> > > be either 0 or 1 depending on the value of E2H.
> > >
> > > This allows diverging RESx values depending on the value of E2H,
> > > something that is required by a bunch of SCTLR_EL2 bits.
> > >
> > > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > > ---
> > >  arch/arm64/kvm/config.c | 24 +++++++++++++++++++++---
> > >  1 file changed, 21 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> > > index 1990cebc77c66..7063fffc22799 100644
> > > --- a/arch/arm64/kvm/config.c
> > > +++ b/arch/arm64/kvm/config.c
> > > @@ -26,6 +26,10 @@ struct reg_bits_to_feat_map {
> > >  #define        MASKS_POINTER   BIT(3)  /* Pointer to fgt_masks struct instead of bits */
> > >  #define        AS_RES1         BIT(4)  /* RES1 when not supported */
> > >  #define        REQUIRES_E2H1   BIT(5)  /* Add HCR_EL2.E2H RES1 as a pre-condition */
> > > +#define        RES0_WHEN_E2H0  BIT(6)  /* RES0 when E2H=0 and not supported */
> > > +#define        RES0_WHEN_E2H1  BIT(7)  /* RES0 when E2H=1 and not supported */
> > > +#define        RES1_WHEN_E2H0  BIT(8)  /* RES1 when E2H=0 and not supported */
> > > +#define        RES1_WHEN_E2H1  BIT(9)  /* RES1 when E2H=1 and not supported */
> > >
> > >         unsigned long   flags;
> > >
> > > @@ -1298,10 +1302,24 @@ struct resx compute_resx_bits(struct kvm *kvm,
> > >                         match &= !e2h0;
> > >
> > >                 if (!match) {
> > > +                       u64 bits = reg_feat_map_bits(&map[i]);
> > > +
> > > +                       if (e2h0) {
> > > +                               if      (map[i].flags & RES1_WHEN_E2H0)
> > > +                                       resx.res1 |= bits;
> > > +                               else if (map[i].flags & RES0_WHEN_E2H0)
> > > +                                       resx.res0 |= bits;
> > > +                       } else {
> > > +                               if      (map[i].flags & RES1_WHEN_E2H1)
> > > +                                       resx.res1 |= bits;
> > > +                               else if (map[i].flags & RES0_WHEN_E2H1)
> > > +                                       resx.res0 |= bits;
> > > +                       }
> > > +
> > >                         if (map[i].flags & AS_RES1)
> > > -                               resx.res1 |= reg_feat_map_bits(&map[i]);
> > > -                       else
> > > -                               resx.res0 |= reg_feat_map_bits(&map[i]);
> > > +                               resx.res1 |= bits;
> > > +                       else if (!(resx.res1 & bits))
> > > +                               resx.res0 |= bits;
> >
> > The logic here feels a bit more complex than necessary, specifically
> > regarding the interaction between the E2H checks and the fallthrough
> > to AS_RES1.
> >
> > Although AS_RES1 and RES0_WHEN_E2H0 are mutually exclusive in
> > practice, the current structure technically permits a scenario where
> > both res0 and res1 get set if the flags are mixed (the e2h0 block sets
> > res0, and the AS_RES1 block falls through and sets res1). This cannot
> > be ruled out by looking at this function alone.
> >
> >   It might be cleaner (and safer) to determine the res1 first, and
> > then apply the masks. Something like:
> >
> > +                       bool is_res1 = false;
> > +
> > +                       if (map[i].flags & AS_RES1)
> > +                               is_res1 = true;
> > +                       else if (e2h0)
> > +                               is_res1 = (map[i].flags & RES1_WHEN_E2H0);
> > +                       else
> > +                               is_res1 = (map[i].flags & RES1_WHEN_E2H1);
> > ...
>
> I think you have just put your finger on something that escaped me so
> far. You are totally right that the code as written today is ugly, and
> the trick to work out that we need to account the bits as RES0 is
> awful.
>
> But it additionally outlines something else: since RES0 is an implicit
> property (we don't specify a flag for it), RES0_WHEN_E2Hx could also
> be implicit properties. I couldn't find an example where anything
> would break. This would also avoid the combination with AS_RES1 by
> construction.
>
> >
> > This also brings up a side point: given the visual similarity of these
> > flags, it is quite easy to make a typo and accidentally combine
> > incompatible flags (e.g., AS_RES1 | RESx_WHEN_E2Hx, or RES0_WHEN_E2H0
> > | RES1_WHEN_E2H0), would it be worth adding a check to warn on
> > obviously invalid combinations?
> >
> > Or maybe even redefining AS_RES1 to be
> > (RES1_WHEN_E2H1|RES1_WHEN_E2H0), which is what it is conceptually.
> > That could simplify this code even further:
> >
> > +                       if (e2h0)
> > +                               is_res1 = (map[i].flags & RES1_WHEN_E2H0);
> > +                       else
> > +                               is_res1 = (map[i].flags & RES1_WHEN_E2H1);
>
> While that would work, I think this is a step too far. Eventually, we
> should be able to sanitise things outside of NV, and RES1 should not
> depend on E2H at all in this case.
>
> I ended up with the following hack, completely untested (needs
> renumbering, and the rest of SCTLR_EL2 repainted). Let me know what
> you think.
>
> Thanks,
>
>         M.
>
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index 562513a4683e2..204e5aeda4d24 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -26,8 +26,6 @@ struct reg_bits_to_feat_map {
>  #define        MASKS_POINTER   BIT(3)  /* Pointer to fgt_masks struct instead of bits */
>  #define        AS_RES1         BIT(4)  /* RES1 when not supported */
>  #define        REQUIRES_E2H1   BIT(5)  /* Add HCR_EL2.E2H RES1 as a pre-condition */
> -#define        RES0_WHEN_E2H0  BIT(6)  /* RES0 when E2H=0 and not supported */
> -#define        RES0_WHEN_E2H1  BIT(7)  /* RES0 when E2H=1 and not supported */
>  #define        RES1_WHEN_E2H0  BIT(8)  /* RES1 when E2H=0 and not supported */
>  #define        RES1_WHEN_E2H1  BIT(9)  /* RES1 when E2H=1 and not supported */
>
> @@ -1375,22 +1373,15 @@ struct resx compute_resx_bits(struct kvm *kvm,
>
>                 if (!match) {
>                         u64 bits = reg_feat_map_bits(&map[i]);
> +                       bool res1;
>
> -                       if (e2h0) {
> -                               if      (map[i].flags & RES1_WHEN_E2H0)
> -                                       resx.res1 |= bits;
> -                               else if (map[i].flags & RES0_WHEN_E2H0)
> -                                       resx.res0 |= bits;
> -                       } else {
> -                               if      (map[i].flags & RES1_WHEN_E2H1)
> -                                       resx.res1 |= bits;
> -                               else if (map[i].flags & RES0_WHEN_E2H1)
> -                                       resx.res0 |= bits;
> -                       }
> -
> -                       if (map[i].flags & AS_RES1)
> +                       res1  = (map[i].flags & AS_RES1);
> +                       res1 |= e2h0 && (map[i].flags & RES1_WHEN_E2H0);
> +                       res1 |= !e2h0 && (map[i].flags & RES1_WHEN_E2H1);
> +
> +                       if (res1)
>                                 resx.res1 |= bits;
> -                       else if (!(resx.res1 & bits))
> +                       else
>                                 resx.res0 |= bits;
>                 }
>         }

LGTM. Treating RES0 as the implicit default simplifies the logic and
makes invalid combinations impossible by construction, which is what
we want, as well as being easier to read.

Thanks,
/fuad

>
> --
> Without deviation from the norm, progress is not possible.

