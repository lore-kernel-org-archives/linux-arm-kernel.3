Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505F7EA4E0E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 14:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G2tiCQAM7J3nKBvqatqhx2IcyXGt7NEO8HpnjOvw5gU=; b=tfQLTLt2+Cs+BMs8eWT0bZJYW+
	TgjeyJevx5p7CBacNVzxPlRPXcw2OuHdjdKscggaY1nNYcvlGg1Rn+PwySbUFQ3GduWP0wz60db6i
	dOCYiW16mKixu8hgupMFbrT4UcffmHUS4dyCfnG1RNQlurNz6OXOXOIg9Xn3JwrwWKe59RJd+/0Ic
	j8r1Dy3IR87hhXyh7EwWE77M1zV7SgZhh6CWwTK3kwlCc9ELDnKrID/XUyiwFvRg8uMA+9X36UCpZ
	lP9g904SuAhKMc9bEWtrlcnoFdAGM5epCF/6bWYvQYHBT0LMqe1WoC+dOUgLdkuFnZnWKU0xxuQJA
	U+zfBjPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4ii-0000000DH8A-46Lz;
	Mon, 02 Mar 2026 14:58:05 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4ig-0000000DH7g-0onE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 14:58:03 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-5033b64256dso1042601cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 06:58:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772463480; cv=none;
        d=google.com; s=arc-20240605;
        b=MOYI2pBr8COluD4csMddImB5Joe97g9wrWM3THzL+Sf0E4VwXe/LksERiT0qzk7+/p
         vBRGcjII96PMQgWiCMpllC0dYj1dwjgxMr7MEqxWIjjTA7wpPBmg1bdYFDAyQ0p/s2G8
         Mh+fVWGhc0mX7ksmiGTXJq8PSI/HyhMqklcutOWu2F93apClDlCosThDoQ2hOkTeNLQg
         aDyiAxGeXf8mcf9XBHBMiNkDxxufjDtN/l4kvI3UjcVtbb1uLKRIINRX0nJ1CL63pnVy
         wP5WxX35HxgK19aNkt2He5ZVxSS4bIdJmvWOp+XizLgb60C/Zx1IzHkscXUeuM9D3uNO
         ssFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=G2tiCQAM7J3nKBvqatqhx2IcyXGt7NEO8HpnjOvw5gU=;
        fh=VFXcUrr3kGurp0SuF0YJGl5pPwUAd9HYetUbgSB3cYw=;
        b=SbZkZpkrNo6W8gz+57LLHSH/XpEtfUtwdAKg2ISXiYlQMuh0cQAlHJq5J/4InNOLvj
         DO1u554d+sFDBJ1pssUW+mvbleEwDsD7tHIvxvM6rBVJ6IajJP9ujQu7J0Hvgm41AHZr
         lpOv/r7eZtR2m6xbhFRfvCcy3F1y6MuoLCqKfFX+oLXps17LQ4bK9sQ92Qp9xeDYYm3B
         QUS/03TfD9ExYEt4g2Hg3Y0SyMCGUHssqUDp/1n2ZeEhFjkQHhmnE6uv2L9tfDgysvpC
         xv4Sm/Q7aHOZ5+ymFcKztb82mYYEQHgaqpNZnwQUVhzG/WPqnCA5zEkRawWALPCYeB0q
         5T7Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772463480; x=1773068280; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G2tiCQAM7J3nKBvqatqhx2IcyXGt7NEO8HpnjOvw5gU=;
        b=rkt4xKUZf00xoD+e6TVbMXb3z0yY71O143TU7K1Cziz6oM+ep2AKFPkgbJmXa986LU
         fqUi3YwlU4Cp0BNXJrkAS1jBbfDEyQxg4dGEyYWNZyQPdFKx+rIKwIJ4O84CHImghSII
         ohVLZU8tyb9zmI2nVJtdu4zaNBAd+IOswnmwoq6GBWuC/F8iKNp8+DMVlNWF2OTuWjPm
         c3frQ02TPXxSJV6Ry7Q43AUIbULnWiYnWbmok9mEjPtP8H1mPZcB/Wr5PRwEdsFlvOnV
         K2nWrlDQZ15JJot7Ny/cUBchFYYcLeXMd1/KEGQc/FMh2tBAWYx050rW8L/CrfouMQdQ
         mDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772463480; x=1773068280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2tiCQAM7J3nKBvqatqhx2IcyXGt7NEO8HpnjOvw5gU=;
        b=g5PgfyaTg6b0yJTt2innthEb4G7XQZ5yiX1lBP7GOqMU635q5Vi9dbMQCHUT6gExTO
         GmJ22W6228owz7lRDTQOZ77aPuFujonRNf4+Qz0JZaBkJHNebKfvz1sz16sdWjjQ//l8
         A8O7xJ9UUOa0gClbKx/iddSw4mPUE0jP6xDpxOJggPjVSbdVw3UsrDLEAgR/ILOJoEEB
         trH1eMq1jWa/nm64pYtBIcIgDP4qVd1EkJ4vPinWYkhjFdyGvcA4xh4XSzdDSjOXH84e
         eIhoa/tbzO8lwu3QK6EfgKDwlHcTZjA9kPHQL9mUD3gSDzjgewjhcmJe5nFHuylbgdM1
         ybLA==
X-Gm-Message-State: AOJu0YzfOJ3AgMlthCu6I4/421EGhlCcCxslIX2tNqpzVNB8VwV5k1Qo
	DWkYw1iV3dbpQxrgdHf9unze6gXqMDLajtihd8pLN5r5nI/EJLIqMnZV06raSPuTXU8zPqRKZFv
	yRXwjQw+dpatuVJJd4Sfs1r0I8csAkmy/AwuiPqCt
X-Gm-Gg: ATEYQzx4THlAzdumwEaiQ4lXui0+TbMtbiqJkRc4EDGA08a09/drK9lmAc4+BAw8cuo
	3tEZIM8MWA4qcdGAtJPvy+IpKNSTF+wrQEj/vkRs/qkRXOVEUMgjlgUnC/Rd4jS2r+zbZblDGKd
	S+ywVJpio7866bpLt7KYu4xq8EhiOGprOnR7/1CE+EB2JeenyqJwVD3ujMotCWasRr3W+NIXCIa
	MepQXWZph8wEMmy4OjFU8f1cJYD2BcQyQer71hqj/g1xBelYgD6id5CMdzTizad25nUW21rmq08
	AtNLh+NV
X-Received: by 2002:ac8:5995:0:b0:4ff:cb72:7c03 with SMTP id
 d75a77b69052e-507617532dcmr21520541cf.3.1772463478513; Mon, 02 Mar 2026
 06:57:58 -0800 (PST)
MIME-Version: 1.0
References: <20260302115653.1517326-1-maz@kernel.org> <20260302115653.1517326-4-maz@kernel.org>
In-Reply-To: <20260302115653.1517326-4-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 2 Mar 2026 14:57:21 +0000
X-Gm-Features: AaiRm52cau_CBAybC8R8xab889bgpS_fXwwQzlJ-E-bLfbHFOruGTzIX5vD_ueY
Message-ID: <CA+EHjTxuZfiA77sckm=96x_0JoUpmqDUVrB9WX+TgomQjWyMkw@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] arm64: Add logic to fully remove features from
 sanitised id registers
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_065802_297029_97E40384 
X-CRM114-Status: GOOD (  35.36  )
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

On Mon, 2 Mar 2026 at 11:57, Marc Zyngier <maz@kernel.org> wrote:
>
> We currently make support for some features such as Pointer Auth,
> SVE or S1POE a compile time decision.
>
> However, while we hide that feature from userspace when such support
> is disabled, we still leave the value provided by the HW visible to
> the rest of the kernel, including KVM.
>
> This has the potential to result in ugly state leakage, as half of
> the kernel knows about the feature, and the other doesn't.
>
> Short of completely banning such compilation options and restore
> universal knowledge, introduce the possibility to fully remove such
> knowledge from the sanitised id registers.
>
> This has more or less the same effect as the idreg override that
> a user can pass on the command-line, only defined at build-time.
>
> For that purpose, we provide a new macro (FTR_CONFIG()) that defines
> the behaviour of a feature, both when enabled and disabled.
>
> At this stage, nothing is making use of this anti-feature.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/include/asm/cpufeature.h | 17 +++++++++------
>  arch/arm64/kernel/cpufeature.c      | 32 ++++++++++++++++++++++-------
>  2 files changed, 36 insertions(+), 13 deletions(-)
>
> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> index 4de51f8d92cba..e853a0ac7db38 100644
> --- a/arch/arm64/include/asm/cpufeature.h
> +++ b/arch/arm64/include/asm/cpufeature.h
> @@ -53,17 +53,22 @@ enum ftr_type {
>  #define FTR_SIGNED     true    /* Value should be treated as signed */
>  #define FTR_UNSIGNED   false   /* Value should be treated as unsigned */
>
> -#define FTR_VISIBLE    true    /* Feature visible to the user space */
> -#define FTR_HIDDEN     false   /* Feature is hidden from the user */
> +enum ftr_visibility {
> +       FTR_HIDDEN,             /* Feature hidden from the user */
> +       FTR_ALL_HIDDEN,         /* Feature hidden from kernel, user and KVM */
> +       FTR_VISIBLE,            /* Feature visible to all observers */
> +};
> +
> +#define FTR_CONFIG(c, e, d)                            \
> +       (IS_ENABLED(c) ? FTR_ ## e : FTR_ ## d)
>
> -#define FTR_VISIBLE_IF_IS_ENABLED(config)              \
> -       (IS_ENABLED(config) ? FTR_VISIBLE : FTR_HIDDEN)
> +#define FTR_VISIBLE_IF_IS_ENABLED(c)   FTR_CONFIG(c, VISIBLE, HIDDEN)
>
>  struct arm64_ftr_bits {
>         bool            sign;   /* Value is signed ? */
> -       bool            visible;
> +       enum ftr_visibility visibility:8;
>         bool            strict; /* CPU Sanity check: strict matching required ? */
> -       enum ftr_type   type;
> +       enum ftr_type   type:8;
>         u8              shift;
>         u8              width;
>         s64             safe_val; /* safe value for FTR_EXACT features */
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 102c5bac4d502..965dd2acf0640 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -192,7 +192,7 @@ void dump_cpu_features(void)
>  #define __ARM64_FTR_BITS(SIGNED, VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE_VAL) \
>         {                                               \
>                 .sign = SIGNED,                         \
> -               .visible = VISIBLE,                     \
> +               .visibility = VISIBLE,                  \
>                 .strict = STRICT,                       \
>                 .type = TYPE,                           \
>                 .shift = SHIFT,                         \
> @@ -1063,16 +1063,33 @@ static void init_cpu_ftr_reg(u32 sys_reg, u64 new)
>                                 ftrp->shift);
>                 }
>
> -               val = arm64_ftr_set_value(ftrp, val, ftr_new);
> -
>                 valid_mask |= ftr_mask;
>                 if (!ftrp->strict)
>                         strict_mask &= ~ftr_mask;
> -               if (ftrp->visible)
> +
> +               switch (ftrp->visibility) {
> +               case FTR_VISIBLE:
> +                       val = arm64_ftr_set_value(ftrp, val, ftr_new);
>                         user_mask |= ftr_mask;
> -               else
> +                       break;
> +               case FTR_ALL_HIDDEN:
> +                       /*
> +                        * ALL_HIDDEN and HIGHER_SAFE are incompatible.
> +                        * Only hide from userspace, and log the oddity.
> +                        */
> +                       if (WARN_ON(ftrp->type == FTR_HIGHER_SAFE))

What about FTR_HIGHER_OR_ZERO_SAFE? It's not actually being used for
any feature id register, only for CTR_EL0. Even there, it's a
(theoretical at this point) performance issue, not a correctness one,
as 0 assumes the largest possible size. I still think that it's safer
to include it here.

That said:

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad



> +                               val = arm64_ftr_set_value(ftrp, val, ftr_new);
> +                       else
> +                               val = arm64_ftr_set_safe_value(ftrp, val);
>                         reg->user_val = arm64_ftr_set_safe_value(ftrp,
>                                                                  reg->user_val);
> +                       break;
> +               case FTR_HIDDEN:
> +                       val = arm64_ftr_set_value(ftrp, val, ftr_new);
> +                       reg->user_val = arm64_ftr_set_safe_value(ftrp,
> +                                                                reg->user_val);
> +                       break;
> +               }
>         }
>
>         val &= valid_mask;
> @@ -1230,9 +1247,10 @@ static void update_cpu_ftr_reg(struct arm64_ftr_reg *reg, u64 new)
>
>                 /*
>                  * Don't alter the initial value that has been forced
> -                * by an override.
> +                * by an override or a disabled feature.
>                  */
> -               if ((reg->override->mask & arm64_ftr_mask(ftrp)) == arm64_ftr_mask(ftrp))
> +               if (ftrp->visibility == FTR_ALL_HIDDEN ||
> +                   (reg->override->mask & arm64_ftr_mask(ftrp)) == arm64_ftr_mask(ftrp))
>                         continue;
>
>                 if (ftr_cur == ftr_new)
> --
> 2.47.3
>

