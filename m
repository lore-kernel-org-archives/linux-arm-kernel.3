Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039CDC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 04:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FD8jPvs02KS23S1dBkAfheuqo80D4A5rfCuAcGUoLwQ=; b=37VG6LeZAs/KNv
	5TbxgcjeMDbkjYWC0pHRD7ZLPXcBHvtOJcEyKsOPMWM3L07pRsek1m4Zw0mRPDLAEw8y5tn7e9ELD
	N+74wguEMRsH5qtoRssgPM2NAJwWIQJ9C/PlPgx5nbafsQeuWTfxthxcp6PZ2tgWHjvYPDZ5EU3cy
	jmHs21Y9dRQTJj3kRtsH3SRQYjFXwDbrtZ5ykM0XeF+02sF4FVFheO5OyDC3Um+CPMffRRpLT0uKv
	tCHMbuIneIn1Mv+HfZjOwSyc0al84tsgAWkYMk4zI1do4Gl2XxNKZnStSzso72v7xyGK2kjiChoPV
	6ArM8ev2Jktqlv2+GGfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8tlJ-00000002sYP-4BDS;
	Sun, 27 Apr 2025 04:37:05 +0000
Received: from mail-lj1-f176.google.com ([209.85.208.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8tjO-00000002sTn-1MCj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 04:35:07 +0000
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30effbfaf61so41180931fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Apr 2025 21:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745728503; x=1746333303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FD8jPvs02KS23S1dBkAfheuqo80D4A5rfCuAcGUoLwQ=;
        b=tTXX9mSZLIYy27JRXiPf6Vel5TkiXyzBkdiPLBXJHXZnV3yb8m6xM6cUOsFH+kmuDR
         BJ5zt5YQ6KkVWYFP4filbQy0bLbkvOc/dnnqAC5v/lZecS4k6EwmX6pINhfgbP3fzkBl
         HBSGfxXRa495n4XKfA2J5Ec2kDpQYqw/Muecby7RiyZC+HK8Pc4JdYD5vC2BKTzgMDfr
         2Tzm8gEX++cCvwh8ELuOolfZ8aRPOE32UXbvjeS6fjsdT1Q0Od3/p9PemB7iR+HDuVFv
         LJ78nkRMjiFcBoMH1f7LvZQMmtw5QbvD1rkAIByVeL9zRP2xN56N9XyztLdWwA26oygE
         aWVA==
X-Forwarded-Encrypted: i=1; AJvYcCU196kqhyNHtw9zgSmV8KY9bQ2UnaZIsNtTEqF6ugiltyc+ST+g/kW5Uro5U+OcbWxFNp0WZmk6Bu9fv7HHRN3a@lists.infradead.org
X-Gm-Message-State: AOJu0YzdowXHeHUscAOXCbsPlPObTTGN7jXoRN/M09pCp2DKPAT6zAmG
	5NJ8oUNEwtAXZxQ/tLuwpatX4H3OtoWEnIHXe7zzOzD6xUKQ/Cs0/6WARptH
X-Gm-Gg: ASbGnct0FDcfASGD6M+IFMS8H3SZks7mmlbMZ+rZ81rHrMCbfAZ/8pfsf7H0LuJH7cN
	FrySL6mcHGSWNs++9TgWfg2qc3a8XbT0v5J25ycP+heW9JqtY9vTsHoeRJofl1HoOOGEcgZNCBG
	GDYhRMu3cPcm+YBl9/HwqduFmIMfan1yA7My6nD+xABxTT7rXPTGETybdxWnPm888i8k6IzF4Sw
	mg9TIf4SSeeO/Njb1mxhTaSWD5/wS22eA9k8Cjcv3jmpXa9bmY45S5EyUDkUMrIAhW/qrrJczP3
	4dgyMAZZ/Uhbgi7D1oWcg4E75tOYzuSJWhndBbaN4vpYiwoj1nv7CBdnxIaT65nTy65XPw==
X-Google-Smtp-Source: AGHT+IG6O16WnOJG7R1T6pOuBABQrudBRQup1Lo/YPl1ZvqTJ0wZeenGzWSQfF8Xqv2ewxav52JCDQ==
X-Received: by 2002:a05:651c:3135:b0:30b:c9cb:47eb with SMTP id 38308e7fff4ca-3190135ea3fmr20463711fa.13.1745728502539;
        Sat, 26 Apr 2025 21:35:02 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b980fasm15462771fa.95.2025.04.26.21.35.00
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 21:35:02 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54b10956398so4127211e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Apr 2025 21:35:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWLDHRutk7seA+VxVbKUWo7DIg6ns/e+7EEuc9FQQaok9DJNLb8pgl3cRzc8eKh913O2So1kN05AD4/VSDGVnTE@lists.infradead.org
X-Received: by 2002:a05:6512:1096:b0:54d:6b7f:affa with SMTP id
 2adb3069b0e04-54e7d516bcdmr3513368e87.1.1745728500749; Sat, 26 Apr 2025
 21:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250425003422.3465-1-andre.przywara@arm.com> <CAGb2v66vr_X3cB1g-On9opGQ7a4j1ASQyi4G=fqY07safrjfFw@mail.gmail.com>
In-Reply-To: <CAGb2v66vr_X3cB1g-On9opGQ7a4j1ASQyi4G=fqY07safrjfFw@mail.gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 27 Apr 2025 12:34:48 +0800
X-Gmail-Original-Message-ID: <CAGb2v67=aENryhsQ6VBPwPXskMvMDZpzzeHz2LTUt-VDMTyzGQ@mail.gmail.com>
X-Gm-Features: ATxdqUGbV0LE1Cv48ezG9-bXflmbhyYsf2OHMWQhXg4lsefW6u7-yQG0ryqUMlE
Message-ID: <CAGb2v67=aENryhsQ6VBPwPXskMvMDZpzzeHz2LTUt-VDMTyzGQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a523: fix SD card detect pull resistor
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_213506_367521_E71AE64E 
X-CRM114-Status: GOOD (  27.19  )
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

On Fri, Apr 25, 2025 at 11:53=E2=80=AFAM Chen-Yu Tsai <wens@csie.org> wrote=
:
>
> On Fri, Apr 25, 2025 at 8:35=E2=80=AFAM Andre Przywara <andre.przywara@ar=
m.com> wrote:
> >
> > Trying to use the SD card on the Radxa board revealed that the card
> > detect wouldn't work as expected (insert not detected). Looking at the
> > schematic shows that the pull-up resistor is actually not populated
> > ("NC"), and the transistor just pulls the GPIO pin to GND, but it's
> > floating otherwise.
> > So using the pull-down flag is definitely wrong, we need the internal
> > pull up to get a reliable signal. The same is true for the Avaota board
> > (there is no transistor there, but it's floating in the same way). Ther=
e
> > is no schematic for the X96QPro+ board, but experiments show it's the
> > same behaviour.
> >
> > So change the GPIO flag for the card detect GPIO property to activate
> > the pull-up resistor for that pin.
> >
> > Fixes: 80e0fb4e491b ("arm64: dts: allwinner: a523: add Radxa A5E suppor=
t")
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> > Hi,
> >
> > please let me know if I should split this up into 3 patches, with prope=
r
> > Fixes: tags, or if you can maybe squash this into the original commits
> > still?
>
> I can squash them in if you prefer.

Fixes separated and squashed into the original patches.

ChenYu

> ChenYu
>
> > Cheers,
> > Andre
> >
> >  arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts | 2 +-
> >  arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts  | 2 +-
> >  arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts b/=
arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
> > index 03c9a9ef5adc2..2d2f3af91d05e 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
> > @@ -56,7 +56,7 @@ &ehci1 {
> >
> >  &mmc0 {
> >         vmmc-supply =3D <&reg_cldo3>;
> > -       cd-gpios =3D <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_DOWN)>; /* =
PF6 */
> > +       cd-gpios =3D <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF=
6 */
> >         bus-width =3D <4>;
> >         status =3D "okay";
> >  };
> > diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/a=
rch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> > index c0bce3f4fa925..59db103546f65 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> > @@ -56,7 +56,7 @@ &ehci1 {
> >
> >  &mmc0 {
> >         vmmc-supply =3D <&reg_vcc3v3>;
> > -       cd-gpios =3D <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_DOWN)>; /* =
PF6 */
> > +       cd-gpios =3D <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF=
6 */
> >         bus-width =3D <4>;
> >         disable-wp;
> >         status =3D "okay";
> > diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/=
arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> > index 85a546aecdbe1..dea2acc1849bb 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> > @@ -66,7 +66,7 @@ &ehci1 {
> >
> >  &mmc0 {
> >         vmmc-supply =3D <&reg_cldo3>;
> > -       cd-gpios =3D <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_DOWN)>; /* =
PF6 */
> > +       cd-gpios =3D <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF=
6 */
> >         bus-width =3D <4>;
> >         status =3D "okay";
> >  };
> >
> > base-commit: 1e5a69d67d1b3c55c9b0cd3933af1436b5d52aa1
> > --
> > 2.46.3
> >

