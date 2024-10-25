Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DBCD0BB56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 15:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XpTWE9VFta5DLt/rrH5kkLgWbylzFjGFRg1FtfRFRr0=; b=0zvjNZz0w1Ukn9
	Lj//dntXtZeXWUyM7rHYR2EQOwFWUo97CbKfKp0ICmgdrlugPtS4SjYnxc522kmM4Uy5WYNzb0cqh
	ktCsNE5EU7ciJEq5COcdP/iqW5s9zOp6e0oFwnzNyUH1iC6FF6pfPu52n/z7oCctCwv++KlChL8fD
	N5sevYtUCxviGWDAD9C+DTS3m3Oi3Wno14m94Bur1WHJAzu6E+3e3QbML81efaN3CYerCqfodSlNa
	NCFCiFS7FLy0dvNa6i6RqI63arwoE96+0ozI+rkPddeb1G/cJ6Hk3x54tNWoRMoIiF8/keRZEjRTV
	5mG3oFPP0VJ5UUZ9fVhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4MAU-00000004EMI-3PZ8;
	Fri, 25 Oct 2024 15:24:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LnF-000000047ee-0LQ8
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Oct 2024 15:00:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description;
	bh=XpTWE9VFta5DLt/rrH5kkLgWbylzFjGFRg1FtfRFRr0=; b=I4U6tndr/aPDTatbMdpc1CdXmW
	x2RLkKGIGndobqTQvmU4rv80aasSCVTTYnGwRPBD0SMfkX5+Fcw2r+utj2O0KfgqUaCp7vu6mnL8o
	ub0dHHjUXn87KSERmFP5InqhpPjncGvTenpOcsiowtkidoLNmadCeCIljKnOOSDj1DzrOf1iw46Va
	67zmd9bm7aTtZBzwhroOoLFvrOvhdmccMx5uXZNBgHiOeNveWsp9SDoxJj3bMiA6iLRmqZhDzFflw
	nI0s2JGx/GQQ/fRrSWPjhyubTaR+rO3P72uUbLKbyYiQ816If1OqvPrv6KwkPFyyy0DyQiJDe5BC9
	ylI6AbAw==;
Received: from mail-lf1-f50.google.com ([209.85.167.50])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LnB-00000008xPX-1S0H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 14:59:59 +0000
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539fb49c64aso3832288e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 07:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868393; x=1730473193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XpTWE9VFta5DLt/rrH5kkLgWbylzFjGFRg1FtfRFRr0=;
        b=aYKjxE8BpaLICVLgc5+WjNHdFCKWNHuKdjnOAnt5hWKPDKY+64fDrCf8AXyMU3aSKB
         hLkIJs0bp5mPZxRC+euBwGxrv0wjkzkigSMdunAuHMEIXlX3yLkNFsCSrxHITy0GwTxM
         njZCHjK+slnwzbpu8WJef0kgTsyZYlfVvvZ9BGI4uEtQAvrKIazAJj/MyydQtldfHgTu
         5fkAi0+e4RZgJyDKKtqfpZBeKlyMrauihvksGa4B9o+sfnP3VBBil3UZtMPR1uq7j3Nh
         EpubUAwVdlhNEjLdeaS/9g7VWqeyZfcbMvPgQo4VrTHfTM9pFJkO4JI0TXhdDiJek+Nj
         VEhg==
X-Forwarded-Encrypted: i=1; AJvYcCVBaYvr5XO7oZDu5VhxUyQ3IvJ8mnBM5hTTyt4PwEh/ysxWTEaZC+yf2feBSTBZDXujHqkAvMfhTyaNCjndu+RT@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt5204XXyBPl9oAbKdDWrl7RcBFdvsMScUhCXuryYgDezyjsRE
	DLDwgJeRAf6GHMY04C1H5JbXnZPmZNr1LtYe+lBcrKhiyPzKIUZVqYhgW7lHogU=
X-Google-Smtp-Source: AGHT+IGGE512Irn7sGf/ILgoU36jiH3EA426RkeYyW4W1AfQIQACAZx7j1hopAu6Gmhanju0IIqbhQ==
X-Received: by 2002:a05:6512:4013:b0:533:c9d:a01f with SMTP id 2adb3069b0e04-53b1a315bb0mr9642660e87.4.1729868393058;
        Fri, 25 Oct 2024 07:59:53 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c9199sm210882e87.220.2024.10.25.07.59.52
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 07:59:52 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso33897431fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 07:59:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUpvdsmzBVHupD7B3PxmkJ0cz38djsaxyk4I3Ph02tBEuLqmNBJ/hBp69Cz9RNte4nak6yN9ilhYpJFl7sCYJyw@lists.infradead.org
X-Received: by 2002:a2e:b2c7:0:b0:2fb:36df:3b4 with SMTP id
 38308e7fff4ca-2fc9d37ff0emr66846331fa.34.1729868392584; Fri, 25 Oct 2024
 07:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20241023075917.186835-1-ryan@testtoast.com> <20241023075917.186835-2-ryan@testtoast.com>
 <CAEKpxB=BQ1GvzdVCYKyr_Q1eCfcYYEz1L_RqzEVBBgNu8jDfwA@mail.gmail.com>
In-Reply-To: <CAEKpxB=BQ1GvzdVCYKyr_Q1eCfcYYEz1L_RqzEVBBgNu8jDfwA@mail.gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 25 Oct 2024 22:59:39 +0800
X-Gmail-Original-Message-ID: <CAGb2v658LYR_4v0G6dKz7OwD_F=hRCJkiGfqwLzAnkFzCe2Hdw@mail.gmail.com>
Message-ID: <CAGb2v658LYR_4v0G6dKz7OwD_F=hRCJkiGfqwLzAnkFzCe2Hdw@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] clk: sunxi-ng: h616: Add sigma-delta modulation
 settings for audio PLL
To: Code Kipper <codekipper@gmail.com>
Cc: Ryan Walklin <ryan@testtoast.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Chris Morgan <macroalpha82@gmail.com>, Philippe Simons <simons.philippe@gmail.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_155957_544384_92FDF0CA 
X-CRM114-Status: GOOD (  39.50  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Oct 25, 2024 at 9:20=E2=80=AFPM Code Kipper <codekipper@gmail.com> =
wrote:
>
> On Wed, 23 Oct 2024 at 09:59, Ryan Walklin <ryan@testtoast.com> wrote:
> >
> > Allwinner has previously released a H616 audio driver which also
> > provides sigma-delta modulation for the audio PLL clocks. This approach
> > is used in other Allwinner SoCs, including the H3 and A64.
> >
> > The manual-provided clock values are:
> > PLL_AUDIO(hs) =3D 24 MHz*N/M1
> > PLL_AUDIO(4X) =3D 24 MHz*N/M0/M1/P
> > PLL_AUDIO(2X) =3D 24 MHz*N/M0/M1/P/2
> > PLL_AUDIO(1X) =3D 24 MHz*N/M0/M1/P/4
> >
> > A fixed post-divider of 2 is used to account for a M0 divider of
> > 2, which cannot be modelled by the existing macros and ccu_nm struct.
> >
> > Add SDM to the H616 clock control unit driver.
> >
> > Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> >
> > ---
> > Changelog v1..v2:
> > - Add fixed_post_div to high-speed audio clock to correct M0 value to 1=
 (ie divide by 2) based on manual
> > - Correct PLL_AUDIO_(4/2/1)X clocks to manual-provided values
> > - Add/correct inline comments for the above.
> > - add CCU_FEATURE_FIXED_POSTDIV to pll_audio_hs_clk.common.features
> >
> > Changelog v2..v3:
> > - Update comments and commit message to more accurately reflect SDM cha=
nges and rationale
> > ---
> >  drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 46 +++++++++++++++++---------
> >  1 file changed, 30 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi=
-ng/ccu-sun50i-h616.c
> > index 6c7623d4c59ea..05727fa1ee46e 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> > @@ -215,20 +215,30 @@ static struct ccu_nkmp pll_de_clk =3D {
> >         },
> >  };
> >
> > -/*
> > - * TODO: Determine SDM settings for the audio PLL. The manual suggests
> > - * PLL_FACTOR_N=3D16, PLL_POST_DIV_P=3D2, OUTPUT_DIV=3D2, pattern=3D0x=
e000c49b
> > - * for 24.576 MHz, and PLL_FACTOR_N=3D22, PLL_POST_DIV_P=3D3, OUTPUT_D=
IV=3D2,
> > - * pattern=3D0xe001288c for 22.5792 MHz.
> > - * This clashes with our fixed PLL_POST_DIV_P.
> > +/*
> > + * Sigma-delta modulation settings table obtained from the vendor SDK =
driver.
> > + * There are additional M0 and M1 divider bits not modelled here, so f=
orced to
> > + * fixed values in the probe routine. Sigma-delta modulation allows pr=
oviding a
> > + * fractional-N divider in the PLL, to help reaching those specific
> > + * frequencies with less error.
> >   */
> > +static struct ccu_sdm_setting pll_audio_sdm_table[] =3D {
> > +       { .rate =3D 90316800, .pattern =3D 0xc001288d, .m =3D 3, .n =3D=
 22 },
> > +       { .rate =3D 98304000, .pattern =3D 0xc001eb85, .m =3D 5, .n =3D=
 40 },
> > +};
> > +
> >  #define SUN50I_H616_PLL_AUDIO_REG      0x078
> >  static struct ccu_nm pll_audio_hs_clk =3D {
> >         .enable         =3D BIT(31),
> >         .lock           =3D BIT(28),
> >         .n              =3D _SUNXI_CCU_MULT_MIN(8, 8, 12),
> > -       .m              =3D _SUNXI_CCU_DIV(1, 1), /* input divider */
> > +       .m              =3D _SUNXI_CCU_DIV(16, 6),
> > +       .sdm            =3D _SUNXI_CCU_SDM(pll_audio_sdm_table,
> > +                                        BIT(24), 0x178, BIT(31)),
> > +       .fixed_post_div =3D 2,
> >         .common         =3D {
> > +               .features       =3D CCU_FEATURE_FIXED_POSTDIV |
> > +                                 CCU_FEATURE_SIGMA_DELTA_MOD,
> >                 .reg            =3D 0x078,
> >                 .hw.init        =3D CLK_HW_INIT("pll-audio-hs", "osc24M=
",
> >                                               &ccu_nm_ops,
> > @@ -701,18 +711,20 @@ static const struct clk_hw *clk_parent_pll_audio[=
] =3D {
> >  };
> >
> >  /*
> > - * The divider of pll-audio is fixed to 24 for now, so 24576000 and 22=
579200
> > - * rates can be set exactly in conjunction with sigma-delta modulation=
.
> > + * The PLL_AUDIO_4X clock defaults to 24.5714 MHz according to the man=
ual, with
> > + * a final divider of 1. The 2X and 1X clocks use 2 and 4 respectively=
. The 1x
> > + * clock is set to either 24576000 or 22579200 for 48Khz and 44.1Khz (=
and
> > + * multiples).
> >   */
> >  static CLK_FIXED_FACTOR_HWS(pll_audio_1x_clk, "pll-audio-1x",
> >                             clk_parent_pll_audio,
> > -                           96, 1, CLK_SET_RATE_PARENT);
> > +                           4, 1, CLK_SET_RATE_PARENT);
> >  static CLK_FIXED_FACTOR_HWS(pll_audio_2x_clk, "pll-audio-2x",
> >                             clk_parent_pll_audio,
> > -                           48, 1, CLK_SET_RATE_PARENT);
> > +                           2, 1, CLK_SET_RATE_PARENT);
> >  static CLK_FIXED_FACTOR_HWS(pll_audio_4x_clk, "pll-audio-4x",
> >                             clk_parent_pll_audio,
> > -                           24, 1, CLK_SET_RATE_PARENT);
> > +                           1, 1, CLK_SET_RATE_PARENT);
> >
> >  static const struct clk_hw *pll_periph0_parents[] =3D {
> >         &pll_periph0_clk.common.hw
> > @@ -1162,12 +1174,14 @@ static int sun50i_h616_ccu_probe(struct platfor=
m_device *pdev)
> >         }
> >
> >         /*
> > -        * Force the post-divider of pll-audio to 12 and the output div=
ider
> > -        * of it to 2, so 24576000 and 22579200 rates can be set exactl=
y.
> > +        * Set the output-divider for the pll-audio clocks (M0) to 2 an=
d the
> > +        * input divider (M1) to 1 as recommended by the manual when us=
ing
> > +        * SDM.
> >          */
> >         val =3D readl(reg + SUN50I_H616_PLL_AUDIO_REG);
> > -       val &=3D ~(GENMASK(21, 16) | BIT(0));
> > -       writel(val | (11 << 16) | BIT(0), reg + SUN50I_H616_PLL_AUDIO_R=
EG);
> > +       val &=3D ~BIT(1);
> > +       val |=3D BIT(0);
> > +       writel(val, reg + SUN50I_H616_PLL_AUDIO_REG);
> >
> >         /*
> >          * First clock parent (osc32K) is unusable for CEC. But since t=
here
> Hi Ryan,
> I noticed some white-space issues when cherry-picking this change from
> your repo.
> scripts/checkpatch.pl
> 0001-clk-sunxi-ng-h616-Add-sigma-delta-modulation-setting.patch
> ERROR: trailing whitespace
> #51: FILE: drivers/clk/sunxi-ng/ccu-sun50i-h616.c:218:
> +/* $
>
> ERROR: trailing whitespace
> #74: FILE: drivers/clk/sunxi-ng/ccu-sun50i-h616.c:240:
> +^I^I.features^I=3D CCU_FEATURE_FIXED_POSTDIV | $
>
> ERROR: trailing whitespace
> #85: FILE: drivers/clk/sunxi-ng/ccu-sun50i-h616.c:698:
> + * The PLL_AUDIO_4X clock defaults to 24.5714 MHz according to the
> manual, with $
>
> ERROR: trailing whitespace
> #86: FILE: drivers/clk/sunxi-ng/ccu-sun50i-h616.c:699:
> + * a final divider of 1. The 2X and 1X clocks use 2 and 4
> respectively. The 1x $
>
> ERROR: trailing whitespace
> #87: FILE: drivers/clk/sunxi-ng/ccu-sun50i-h616.c:700:
> + * clock is set to either 24576000 or 22579200 for 48Khz and 44.1Khz (an=
d $
>
> ERROR: trailing whitespace
> #112: FILE: drivers/clk/sunxi-ng/ccu-sun50i-h616.c:1152:
> +^I * input divider (M1) to 1 as recommended by the manual when using $
>
> ERROR: trailing whitespace
> #113: FILE: drivers/clk/sunxi-ng/ccu-sun50i-h616.c:1153:
> +^I * SDM. $
>
> total: 7 errors, 0 warnings, 80 lines checked
>
> NOTE: For some of the reported defects, checkpatch may be able to
>       mechanically convert to the typical style using --fix or --fix-inpl=
ace.
>
> NOTE: Whitespace errors detected.
>       You may wish to use scripts/cleanpatch or scripts/cleanfile

I fixed up all the whitespace errors when applying.

ChenYu

> but that didn't stop it from singing beautifully!,
>
> Tested-by: Marcus Cooper <codekipper@gmail.com>
> BR,
> CK
> > --
> > 2.47.0
> >
> >

