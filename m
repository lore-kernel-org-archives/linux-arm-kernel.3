Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A261BD41D49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 14:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CXKK+XMOV+BG1j0Dmg65GZuKWhjmotSC6I9z/HN+0TE=; b=nniPlduK56jVL+TaVoNZdQctL5
	umawtBWp6Wm9B9ZlniK1JebdPfQe928gI/1bdlVpPWNz81q1Z1M9mCl3SDY+rg2RdcE2U/zmBvBzr
	UOJIOWfLibhqoF16tCbh4gx/AUBavWnP6NlGSZzK3rKYyTAwaAjroMPwtNmoxHAcf6b2oF5lYLKDG
	gP49t4H3URzsxm46JdLttJimBu9tCw5CoSjZU5o0jmoZY+0fwR9VyF/DCgDtBYxc7eYaHfKFV3u54
	2UhmNBpLiHwb+BO8ze2ReT0piNgbaecgkEaX9bXMDe9Ke/fOOPN5SnrNANFPd78uql7Q5ZOjNErHn
	mAy0ZvbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vThgr-0000000Gj4q-18qc;
	Thu, 11 Dec 2025 14:30:45 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vThgo-0000000Gj4H-2Bkw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 14:30:43 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4ee243b98caso378911cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 06:30:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765463441; cv=none;
        d=google.com; s=arc-20240605;
        b=jvdOW+tq7I4tZaybYd0M4X/oc+BnesZLe1ngl41WfMVNXxuIzeAcxQV9Xr2dozc3AV
         OWIABLVEvwdCbEICtcSxsjKbG2ZhIDURfbbCnkO6Uun4aFPM+rxGCnoYcDQ6eA40GdXx
         OhyN0pdbWFeYs4HyDbWrLhgq1+TTyunPiHJgX3PnaKcwyMxharbZC6mwYQK0NnHSm0Xd
         cp1K5A0KN0nQOqK2fWObnYb8zOUfBakA/7lAsyUjygCFHC/S4cHd0R6Rik4J4IMkDU5h
         R9UpFHz8Qg5AlnIDs78Gib9lD0/kl+ge3kl9Mw3nYVyIJnAugeXligQj4pklcL9JlBMG
         NGjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CXKK+XMOV+BG1j0Dmg65GZuKWhjmotSC6I9z/HN+0TE=;
        fh=o8/HtV2cqAevsUCK1Ob/BUk51MEYxa3mcnR/9ZKRZec=;
        b=dPrZHXH8S+WDEoJ+/XUVrkeGz0VHhgKSd/7N91FxFar0C+zVduRf0lxzAW2RNZRlUo
         0dbAvXk08vL4UcFdsNvfrzbmk3Tk3Z0+zTa5+ycYKxFGByD5ftRrtMjjTq4Xr9HlaNl7
         qdN70MtaR+TP8hdp0kFD2zG4d2XqBE7LBuNH6+cUAV0haORyKkiK6m54yxp0a+/OzA0N
         LaP0VAUNXD/9qaNuhQmHphfxjtttHAmhYCwDl+0JE2FkOnZtFneaTB29OynrR+n9IKwz
         Ypc9/beZqYGC0NsScZChlQ/ZN8CYgajPS+3xsK8VwS7doGw9blht9HKner2KVKl2aA1/
         EPtg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765463441; x=1766068241; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CXKK+XMOV+BG1j0Dmg65GZuKWhjmotSC6I9z/HN+0TE=;
        b=V91y8gYTU23VwB46hS+cjQ4JdrnMYOQFEvxwU4Q/suXjtdy3CIgxAwQwGnzAjMFgAN
         VJvbu9zaR3vus4V/Ae+ad7A4AJpjS0Y7FP+lq5Hj0/rRAt1yLpY3UtImKztewei8TT8C
         XFD4e8E3DjgF+iiNn5UrAvkr1Ls+droEqfap7u5dacA3D90ttq/JgO4dZzkKAyke8zyc
         BlkIjlg6fjiGDfGuO3nETj5BkjMe4OkiUm/bajgdiVdzH7mqMS7oiwzxljJQXs0tv7A3
         t+tEAiVM13WCrGgphod/KmPDI8UY77iETyEjhhvzYxIebMV1Q98I4jyVWjqY3QD1BZp0
         6MNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765463441; x=1766068241;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXKK+XMOV+BG1j0Dmg65GZuKWhjmotSC6I9z/HN+0TE=;
        b=tfaN6n7GDwUwc4M2Gilb1MXykEVcoisM+h/afTGAowjkKOwQAU3LdN0RNLsOWRs9VC
         Ks52O7Iy2jlE0kyF7rSVX8vcQlhcBq3VrADAl1IgAzSpDTjPEs8PkbBcOx+uqW7Z9ZSF
         WNX2gIByNTk0ruON5JzUSOmwfjetOAOF8utpZuZ3A2E9aHxhc/VGmt7GkjN/K2cVeV2h
         +uAJXB1F9qLzWYZ+4EIPF/Vm9d8CsliOpa0EpBpjFBSuNobtJ1r2QAdh/ehqF+r5ArPB
         qMWc7CU9YerybNi+aOM6p395Q6xqapYgBn3FpdbTBET28To4pr50MkNCsyI8hauvmw+N
         FABg==
X-Forwarded-Encrypted: i=1; AJvYcCVHHi80HREgIgQSWamvyE6yBOAxFL0nLTYPAGvXmYgx/9iqzMmf+bXEYO5SBwWZnS2vd64ANYZDoGPYeLv54xdO@lists.infradead.org
X-Gm-Message-State: AOJu0YymvSZqgATjbwsTtU/mBm83pT7U5gs3Ti6DgRoP5n9GAdW8dkzl
	8fn4FZbOVIIZ7EqldsRDK8l+LwXJTQqXT9xVIjvEdME6KR1pWTC8iUdHh/ivc3Ox71pdABHoDxt
	vgN5f9K/UNXTYtMhdBDebLJGTiyliSESb+C/rfcvA
X-Gm-Gg: AY/fxX5iAnKqGv4rVHwnTCFI/WhwzlMv77Odp5ZTycZ8O27dxmgUSfiLax7eZgKlY8T
	+YxTffIYrr/n+HZo9AomHBjHGcU8rAwY+R53XGKIGRUD+AcSKF6RFsvJV7iM94TwFDQVDBdMhjT
	+Tn3SgQwowf0CbLZxitGknpLJ65CsMyjGNSPKEF3BIpFWDZKacsLLokhQRSTld9INOVyqtUMqzI
	ZhmF3QhsiOJN2SkO2nu7qQ+BpbOui4kmSmA0BHo3h5tOzZ5hPht8pG4gjRx/YhxKc4etDQJ
X-Google-Smtp-Source: AGHT+IHOTRmzXfJZ1LxuUaQCR8PjN6XcJs7sQ/sZlzHzbcwman+GYjtDsYLbkyW9r2wgCAu14xGlJhBPAApNgAZIVaM=
X-Received: by 2002:a05:622a:a:b0:4ed:ff77:1a87 with SMTP id
 d75a77b69052e-4f1bee1ac37mr9103321cf.19.1765463440630; Thu, 11 Dec 2025
 06:30:40 -0800 (PST)
MIME-Version: 1.0
References: <20251210173024.561160-1-maz@kernel.org> <20251210173024.561160-5-maz@kernel.org>
In-Reply-To: <20251210173024.561160-5-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 11 Dec 2025 14:30:03 +0000
X-Gm-Features: AQt7F2pDHRhtoAmbiPDRAiv1SfNZGM-FeRtbrSAxL2i7eJPuZsyFVaRGyD0DPvo
Message-ID: <CA+EHjTy2=NjAOwG32_Aj2akEDS8yo92nTMmd_rkUPABDAAcdAA@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] KVM: arm64: Account for RES1 bits in
 DECLARE_FEAT_MAP() and co
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Sascha Bischoff <Sascha.Bischoff@arm.com>, Quentin Perret <qperret@google.com>, 
	Sebastian Ene <sebastianene@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_063042_589275_30AC1B60 
X-CRM114-Status: GOOD (  30.11  )
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

On Wed, 10 Dec 2025 at 17:30, Marc Zyngier <maz@kernel.org> wrote:
>
> None of the registers we manage in the feature dependency infrastructure
> so far has any RES1 bit. This is about to change, as VTCR_EL2 has
> its bit 31 being RES1.
>
> In order to not fail the consistency checks by not describing a bit,
> add RES1 bits to the set of immutable bits. This requires some extra
> surgery for the FGT handling, as we now need to track RES1 bits there
> as well.
>
> There are no RES1 FGT bits *yet*. Watch this space.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>


Reviewed-by: Fuad Tabba <tabba@google.com>

/fuad

> ---
>  arch/arm64/include/asm/kvm_host.h |  1 +
>  arch/arm64/kvm/config.c           | 25 +++++++-------
>  arch/arm64/kvm/emulate-nested.c   | 55 +++++++++++++++++--------------
>  3 files changed, 45 insertions(+), 36 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index ac7f970c78830..b552a1e03848c 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -638,6 +638,7 @@ struct fgt_masks {
>         u64             mask;
>         u64             nmask;
>         u64             res0;
> +       u64             res1;
>  };
>
>  extern struct fgt_masks hfgrtr_masks;
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index 24bb3f36e9d59..3845b188551b6 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -16,14 +16,14 @@
>   */
>  struct reg_bits_to_feat_map {
>         union {
> -               u64     bits;
> -               u64     *res0p;
> +               u64              bits;
> +               struct fgt_masks *masks;
>         };
>
>  #define        NEVER_FGU       BIT(0)  /* Can trap, but never UNDEF */
>  #define        CALL_FUNC       BIT(1)  /* Needs to evaluate tons of crap */
>  #define        FIXED_VALUE     BIT(2)  /* RAZ/WI or RAO/WI in KVM */
> -#define        RES0_POINTER    BIT(3)  /* Pointer to RES0 value instead of bits */
> +#define        MASKS_POINTER   BIT(3)  /* Pointer to fgt_masks struct instead of bits */
>
>         unsigned long   flags;
>
> @@ -92,8 +92,8 @@ struct reg_feat_map_desc {
>  #define NEEDS_FEAT_FIXED(m, ...)                       \
>         __NEEDS_FEAT_FLAG(m, FIXED_VALUE, bits, __VA_ARGS__, 0)
>
> -#define NEEDS_FEAT_RES0(p, ...)                                \
> -       __NEEDS_FEAT_FLAG(p, RES0_POINTER, res0p, __VA_ARGS__)
> +#define NEEDS_FEAT_MASKS(p, ...)                               \
> +       __NEEDS_FEAT_FLAG(p, MASKS_POINTER, masks, __VA_ARGS__)
>
>  /*
>   * Declare the dependency between a set of bits and a set of features,
> @@ -109,19 +109,20 @@ struct reg_feat_map_desc {
>  #define DECLARE_FEAT_MAP(n, r, m, f)                                   \
>         struct reg_feat_map_desc n = {                                  \
>                 .name                   = #r,                           \
> -               .feat_map               = NEEDS_FEAT(~r##_RES0, f),     \
> +               .feat_map               = NEEDS_FEAT(~(r##_RES0 |       \
> +                                                      r##_RES1), f),   \
>                 .bit_feat_map           = m,                            \
>                 .bit_feat_map_sz        = ARRAY_SIZE(m),                \
>         }
>
>  /*
>   * Specialised version of the above for FGT registers that have their
> - * RES0 masks described as struct fgt_masks.
> + * RESx masks described as struct fgt_masks.
>   */
>  #define DECLARE_FEAT_MAP_FGT(n, msk, m, f)                             \
>         struct reg_feat_map_desc n = {                                  \
>                 .name                   = #msk,                         \
> -               .feat_map               = NEEDS_FEAT_RES0(&msk.res0, f),\
> +               .feat_map               = NEEDS_FEAT_MASKS(&msk, f),    \
>                 .bit_feat_map           = m,                            \
>                 .bit_feat_map_sz        = ARRAY_SIZE(m),                \
>         }
> @@ -1168,21 +1169,21 @@ static const DECLARE_FEAT_MAP(mdcr_el2_desc, MDCR_EL2,
>                               mdcr_el2_feat_map, FEAT_AA64EL2);
>
>  static void __init check_feat_map(const struct reg_bits_to_feat_map *map,
> -                                 int map_size, u64 res0, const char *str)
> +                                 int map_size, u64 resx, const char *str)
>  {
>         u64 mask = 0;
>
>         for (int i = 0; i < map_size; i++)
>                 mask |= map[i].bits;
>
> -       if (mask != ~res0)
> +       if (mask != ~resx)
>                 kvm_err("Undefined %s behaviour, bits %016llx\n",
> -                       str, mask ^ ~res0);
> +                       str, mask ^ ~resx);
>  }
>
>  static u64 reg_feat_map_bits(const struct reg_bits_to_feat_map *map)
>  {
> -       return map->flags & RES0_POINTER ? ~(*map->res0p) : map->bits;
> +       return map->flags & MASKS_POINTER ? (map->masks->mask | map->masks->nmask) : map->bits;
>  }
>
>  static void __init check_reg_desc(const struct reg_feat_map_desc *r)
> diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
> index 834f13fb1fb7d..75d49f83342a5 100644
> --- a/arch/arm64/kvm/emulate-nested.c
> +++ b/arch/arm64/kvm/emulate-nested.c
> @@ -2105,23 +2105,24 @@ static u32 encoding_next(u32 encoding)
>  }
>
>  #define FGT_MASKS(__n, __m)                                            \
> -       struct fgt_masks __n = { .str = #__m, .res0 = __m, }
> -
> -FGT_MASKS(hfgrtr_masks, HFGRTR_EL2_RES0);
> -FGT_MASKS(hfgwtr_masks, HFGWTR_EL2_RES0);
> -FGT_MASKS(hfgitr_masks, HFGITR_EL2_RES0);
> -FGT_MASKS(hdfgrtr_masks, HDFGRTR_EL2_RES0);
> -FGT_MASKS(hdfgwtr_masks, HDFGWTR_EL2_RES0);
> -FGT_MASKS(hafgrtr_masks, HAFGRTR_EL2_RES0);
> -FGT_MASKS(hfgrtr2_masks, HFGRTR2_EL2_RES0);
> -FGT_MASKS(hfgwtr2_masks, HFGWTR2_EL2_RES0);
> -FGT_MASKS(hfgitr2_masks, HFGITR2_EL2_RES0);
> -FGT_MASKS(hdfgrtr2_masks, HDFGRTR2_EL2_RES0);
> -FGT_MASKS(hdfgwtr2_masks, HDFGWTR2_EL2_RES0);
> +       struct fgt_masks __n = { .str = #__m, .res0 = __m ## _RES0, .res1 = __m ## _RES1 }
> +
> +FGT_MASKS(hfgrtr_masks, HFGRTR_EL2);
> +FGT_MASKS(hfgwtr_masks, HFGWTR_EL2);
> +FGT_MASKS(hfgitr_masks, HFGITR_EL2);
> +FGT_MASKS(hdfgrtr_masks, HDFGRTR_EL2);
> +FGT_MASKS(hdfgwtr_masks, HDFGWTR_EL2);
> +FGT_MASKS(hafgrtr_masks, HAFGRTR_EL2);
> +FGT_MASKS(hfgrtr2_masks, HFGRTR2_EL2);
> +FGT_MASKS(hfgwtr2_masks, HFGWTR2_EL2);
> +FGT_MASKS(hfgitr2_masks, HFGITR2_EL2);
> +FGT_MASKS(hdfgrtr2_masks, HDFGRTR2_EL2);
> +FGT_MASKS(hdfgwtr2_masks, HDFGWTR2_EL2);
>
>  static __init bool aggregate_fgt(union trap_config tc)
>  {
>         struct fgt_masks *rmasks, *wmasks;
> +       u64 rresx, wresx;
>
>         switch (tc.fgt) {
>         case HFGRTR_GROUP:
> @@ -2154,24 +2155,27 @@ static __init bool aggregate_fgt(union trap_config tc)
>                 break;
>         }
>
> +       rresx = rmasks->res0 | rmasks->res1;
> +       if (wmasks)
> +               wresx = wmasks->res0 | wmasks->res1;
> +
>         /*
>          * A bit can be reserved in either the R or W register, but
>          * not both.
>          */
> -       if ((BIT(tc.bit) & rmasks->res0) &&
> -           (!wmasks || (BIT(tc.bit) & wmasks->res0)))
> +       if ((BIT(tc.bit) & rresx) && (!wmasks || (BIT(tc.bit) & wresx)))
>                 return false;
>
>         if (tc.pol)
> -               rmasks->mask |= BIT(tc.bit) & ~rmasks->res0;
> +               rmasks->mask |= BIT(tc.bit) & ~rresx;
>         else
> -               rmasks->nmask |= BIT(tc.bit) & ~rmasks->res0;
> +               rmasks->nmask |= BIT(tc.bit) & ~rresx;
>
>         if (wmasks) {
>                 if (tc.pol)
> -                       wmasks->mask |= BIT(tc.bit) & ~wmasks->res0;
> +                       wmasks->mask |= BIT(tc.bit) & ~wresx;
>                 else
> -                       wmasks->nmask |= BIT(tc.bit) & ~wmasks->res0;
> +                       wmasks->nmask |= BIT(tc.bit) & ~wresx;
>         }
>
>         return true;
> @@ -2180,7 +2184,6 @@ static __init bool aggregate_fgt(union trap_config tc)
>  static __init int check_fgt_masks(struct fgt_masks *masks)
>  {
>         unsigned long duplicate = masks->mask & masks->nmask;
> -       u64 res0 = masks->res0;
>         int ret = 0;
>
>         if (duplicate) {
> @@ -2194,10 +2197,14 @@ static __init int check_fgt_masks(struct fgt_masks *masks)
>                 ret = -EINVAL;
>         }
>
> -       masks->res0 = ~(masks->mask | masks->nmask);
> -       if (masks->res0 != res0)
> -               kvm_info("Implicit %s = %016llx, expecting %016llx\n",
> -                        masks->str, masks->res0, res0);
> +       if ((masks->res0 | masks->res1 | masks->mask | masks->nmask) != GENMASK(63, 0) ||
> +           (masks->res0 & masks->res1)  || (masks->res0 & masks->mask) ||
> +           (masks->res0 & masks->nmask) || (masks->res1 & masks->mask)  ||
> +           (masks->res1 & masks->nmask) || (masks->mask & masks->nmask)) {
> +               kvm_info("Inconsistent masks for %s (%016llx, %016llx, %016llx, %016llx)\n",
> +                        masks->str, masks->res0, masks->res1, masks->mask, masks->nmask);
> +               masks->res0 = ~(masks->res1 | masks->mask | masks->nmask);
> +       }
>
>         return ret;
>  }
> --
> 2.47.3
>

