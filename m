Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F6BC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 11:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MocR616+VqlYQgKAO9looh+5bl/oUxpGHWgrj7ut1gY=; b=hqvl+2mre39miqkrQiz6f/Kcfi
	JkGF2ikK7GBvNTdBqBSa4zuE03XGIguBEA5lrstWVeo/zmO4Um5FJLHh7Kuzku0cAsy+BDeK/QJKQ
	79uSf4QvOSEHYWI1lgpiaVMrvHYRmvV3uJCZKB4WLnZ8z7sbJAEK33jT6k5YR422z7rPwSUdvNm5I
	he0KWAM4P/AzNP7cisuYnuSPKjaai1s1+o+C3fO8HKOvsZUrkJXk1OkFeRo1Qhu7udzbsCnjdYLr3
	ey/F9ZmwdxPI+lIxarFg4WQpW8J89U/JWTgRm8VrXcfAM4sb3j0nZYsIlKWJVyGMRiV5lywySoiqr
	0thk0pgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u50jX-00000009Jhf-3RIg;
	Wed, 16 Apr 2025 11:15:11 +0000
Received: from mail-ua1-f50.google.com ([209.85.222.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u50hg-00000009JSf-0dXy;
	Wed, 16 Apr 2025 11:13:17 +0000
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-873a2ba6f7cso2519598241.3;
        Wed, 16 Apr 2025 04:13:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744801992; x=1745406792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MocR616+VqlYQgKAO9looh+5bl/oUxpGHWgrj7ut1gY=;
        b=mVLb2lf2w4rU6mpKsgS96b5qRJmcd+tUa9nU1n4JcWfmIjYPSEd0qYfxpiu8wc2ayX
         UU+1WM2T6fZbSLyRyZJG4IT8apnojZbBPTH7dY0BB/aRJO3sykf4QqdXZMO0hIwFJ0J7
         F0gvJjspFrwcPcicUkNctChiudRquoU3bGEn+8QdynDdv1fQiJBmWucE3EaJzsZzMhlC
         ZiypAbu+e9+CloSMJsSfgKKivjllyA4buG9SWSZzWVfLDFLeeFPM4mjoVJZY5fGexyd6
         eDz9V1WFDK+SjuZKN28P/kCW2rgtpwwt00E7BpVB9gN6GcMUXKJ86qyvLhWEbWUnuG5y
         70DA==
X-Forwarded-Encrypted: i=1; AJvYcCUYf70LnZnj60xHtkWWDnSaS4oe/Vu+DWvxfs2jIfu8p/RPt7uYM+spI8pxSbu5s2ozZzGAzr5b6oNPeTfcFxg=@lists.infradead.org, AJvYcCXo/EJE1UvIgksNb293YwiWEjerGvz1egkXBlRbjCn+HR60e7jvOkb6+TL7LOWU2En2ct6gasnY3A2kSpm9zAGF@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1T/5SbEujfxPoJJir/OmnhGiIGMIGmPDPgRQXoLI8TRIHFUdU
	KknKjpDP0NqPA6jTJjzl8iwZ48LIxUdD7TzRQrXcS6tYEdC4JHV4YCWn3j8w
X-Gm-Gg: ASbGncufPC0JyEC+HPvAlXH9hTVUeNucOwrkBfqm0CCc8UI1BgNHtCo+Am8Lyg56gBh
	WSNWJ70aYTDoKyrq+szm95A9IxaW2+QjvjUKK3fFMEVXKmODUCw2UeBnyl3/dzYNIbPUbfSWzWm
	j/D+GXzzFbz9ktBNRII7XXff7GVvS/5ziIqcmolSJGN+TsXNulr90qnWTnHeu9y92kRyD2+TuGS
	8vuka3J7zF4x/E4YeJiz+/EPjc2elh3Bgql8EK7ojK1sY+/KxpMAqbDf/DguyQLbrmaZjSNP/BJ
	SC2xA4a+v8fe3BkcfZpq3U5scGVKRf+jqKsiM21XcUMjYWVdDJ/1Cq9YrcRlO40Ie8hL2Axl6pw
	oISk=
X-Google-Smtp-Source: AGHT+IE58K1Yf1PJTZo/0tMXFtdGPqqowIiLIrcrGqkyn29glLmVPnXVShLan7FrgRbRyPIcwm8ZZw==
X-Received: by 2002:a05:6102:5c19:b0:4b2:c391:7d16 with SMTP id ada2fe7eead31-4cb591e5fbfmr369456137.7.1744801991841;
        Wed, 16 Apr 2025 04:13:11 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c9c98edc91sm3025623137.29.2025.04.16.04.13.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 04:13:11 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-873a2ba6f7cso2519579241.3;
        Wed, 16 Apr 2025 04:13:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUCpWt493H3qI779/1OoVgFTRL4ZluQrV5b5wa2a354jb3lHtYqEVvYoq7gEmRteWyslmEpmwueJVYP2XV3Z4LC@lists.infradead.org, AJvYcCWpyE9/CbclvU64hxoydXd4zHrF9HF4oIoc/1wGVhxWrMypzbPvlXNLgkdIHLak5J/lyTuR/+CuqH8xAdyQsHE=@lists.infradead.org
X-Received: by 2002:a05:6102:2991:b0:4c3:9b0:9e6b with SMTP id
 ada2fe7eead31-4cb591e784bmr414553137.10.1744801990755; Wed, 16 Apr 2025
 04:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
 <20250109-enable-rtc-v3-3-f003e8144419@baylibre.com> <erttkpna2hzg7zuddzlocaou2wqcwmgcxfhldwdt55yleie6dm@nfg374fv66fq>
In-Reply-To: <erttkpna2hzg7zuddzlocaou2wqcwmgcxfhldwdt55yleie6dm@nfg374fv66fq>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Apr 2025 13:12:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX3u97MtDiPuJgFtO5YTRuLeDHgs4tx7004CScLO11WkQ@mail.gmail.com>
X-Gm-Features: ATxdqUHjMszLt95drNgnUajxAYkWqRme3b0HzHSYcdCgcByHGIiSYzx7n6CDpNY
Message-ID: <CAMuHMdX3u97MtDiPuJgFtO5YTRuLeDHgs4tx7004CScLO11WkQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] rtc: Fix the RTC time comparison issues adding cast
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>, Eddie Huang <eddie.huang@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_041316_213249_55E739CE 
X-CRM114-Status: GOOD (  36.59  )
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

Hi Uwe,

On Tue, 15 Apr 2025 at 00:30, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
> On Fri, Apr 11, 2025 at 02:35:56PM +0200, Alexandre Mergnat wrote:
> > The RTC subsystem was experiencing comparison issues between signed and
> > unsigned time values. When comparing time64_t variables (signed) with
> > potentially unsigned range values, incorrect results could occur leadin=
g
> > to runtime errors.
> >
> > Adds explicit type casts to time64_t for critical RTC time comparisons
> > in both class.c and interface.c files. The changes ensure proper
> > handling of negative time values during range validation and offset
> > calculations, particularly when dealing with timestamps before 1970.
> >
> > The previous implementation might incorrectly interpret negative values
> > as extremely large positive values, causing unexpected behavior in the
> > RTC hardware abstraction logic.
> >
> > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> > ---
> >  drivers/rtc/class.c     | 6 +++---
> >  drivers/rtc/interface.c | 8 ++++----
> >  2 files changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
> > index e31fa0ad127e9..1ee3f609f92ea 100644
> > --- a/drivers/rtc/class.c
> > +++ b/drivers/rtc/class.c
> > @@ -282,7 +282,7 @@ static void rtc_device_get_offset(struct rtc_device=
 *rtc)
> >        * then we can not expand the RTC range by adding or subtracting =
one
> >        * offset.
> >        */
> > -     if (rtc->range_min =3D=3D rtc->range_max)
> > +     if (rtc->range_min =3D=3D (time64_t)rtc->range_max)
> >               return;
>
> For which values of range_min and range_max does this change result in a
> different semantic?
>
> Trying to answer that question myself I wrote two functions:
>
>         #include <stdint.h>
>
>         int compare_unsigned(uint64_t a, int64_t b)
>         {
>                 return a =3D=3D b;
>         }
>
>         int compare_signed(uint64_t a, int64_t b)
>         {
>                 return (int64_t)a =3D=3D b;
>         }
>
> When I compile this (with gcc -Os) the assembly for both functions is
> the same (tested for x86_64 and arm32).
>
> >       ret =3D device_property_read_u32(rtc->dev.parent, "start-year",
> > @@ -299,7 +299,7 @@ static void rtc_device_get_offset(struct rtc_device=
 *rtc)
> >       if (!rtc->set_start_time)
> >               return;
> >
> > -     range_secs =3D rtc->range_max - rtc->range_min + 1;
> > +     range_secs =3D (time64_t)rtc->range_max - rtc->range_min + 1;
>
> In the case where no overflow (or underflow) happens, the result is the
> same, isn't it? If there is an overflow, the unsigned variant is
> probably the better choice because overflow for signed variables is
> undefined behaviour (UB).
>
> Respective demo program looks as follows:
>
>         #include <stdint.h>
>
>         int test_unsigned(uint64_t a)
>         {
>                 return a + 3 > a;
>         }
>
>         int test_signed(int64_t a)
>         {
>                 return a + 3 > a;
>         }
>
> Using again `gcc -Os`, the signed variant is compiled to a function that
> returns true unconditionally while the unsigned one implements the
> expected semantic.

Hence that is why the kernel is compiled with -fwrapv...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

