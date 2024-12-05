Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F38E77171
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 07:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gyamlqHI1fumzoheugLJdZAdLQLKXUTMBwxcQkBbITI=; b=jxBer3NEjvB34ADCr/SdolUAal
	u1Rx921ipIE+UT7qDy48CdtLBnw0hhg/J0E0mS9BT9H9oM1SHN0Spr727zPKif4iITa+BpQQmhj7V
	cmVA+9CctIew5u+pvxF2NirH7bJ9gg+H1pHs32kqRuAtwZn6W3xFSbbT0vkCSk4fWZp8UIARR51jS
	zVbDMmscdDv+DwsLG0TuqfxQcf+ZmafIq6xlZZrrNglM5WZyjlBVJ3vPd4xdQs2k0f3aPV1Ecwa+Z
	tvEFSuryougJl0b1Tn78+wM1gKGk4y+sBL/u7EjLuRTRY9VPWBAhYriGqIYCKoXeVOjwe4doOB5vN
	i5qhS8xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6Gg-0000000F00M-0yAw;
	Thu, 05 Dec 2024 07:27:22 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6FZ-0000000Ezfd-13Hr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 07:26:14 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5d123ac1c3cso609668a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 23:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733383571; x=1733988371; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gyamlqHI1fumzoheugLJdZAdLQLKXUTMBwxcQkBbITI=;
        b=Hv+Evss7R/SaxNwCarjhigeCUx2F+RdCvBHmNt9TUVfwF59gA5iAz7VbjYIyfFB1TQ
         iIP5n5leMMBhrEd5t/eYRuDPnz537i3kt2cNpilGxJbdaRC1ZCfd5owvadM4gr//FAzX
         l1EYmwG/Oo1gyEMnq6s5uaF6mWD8pDfLIcnrlnWUHg7LElor1aObX8OuQFdQof54wWa4
         Ag/2uJ9Lsnq2VR+1oc1A5quvT5O9K5Py4vxelWwrcOu8wo3g94e7U1PEQyNdp3LCWBVe
         DepbmGYCkthrslR+HvfBmxYoS3RW9Q+iST87WiZYjFEfH3VloU1wmwP63bGnlWSGXeTs
         BJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733383571; x=1733988371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gyamlqHI1fumzoheugLJdZAdLQLKXUTMBwxcQkBbITI=;
        b=bkMV2wU8JZDsmi2x25CTzG/Sad9KYzF4SI5sd7AY9i9/KG0JoSSpL2kh5uBNAu3GnV
         vCLL+5v2YcXSKHso26UcrFgq2wfe0+tfDSQ8tmtdImLI5ltLpekfQUzTyPEWCQPLl9gE
         9E4cJ34ElIaiWBiwI5PtD2k1f2d8h+dyqOZ0Ax51/JO7zlkSBNdfxGUq1XSJr2XL3CgV
         laFyUeCaFNQJv7/6xF8IZrsWdvvqkmMgOhl4Yk6Tdk7EBXkRYBoB8CICldd9gBx4hmy+
         VYnzJa5OqFi8UzO0z8ythNWxCIKve+2dbgs9bIWmTLJFJRg5Cystfy3xTGfr/cgtyM3a
         SFFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyc7A46t4P7uw3+NPWimz79XWJiLlZx/EXItmGwrurVTqeaeaCP6CowHRIJV+skS7m+LnFD83cNIQclG8dCovX@lists.infradead.org
X-Gm-Message-State: AOJu0YxaZukhFQT2tHrEEz3r+f0uWN08sW8xPlskT/aHHQ+9jc3/mx+R
	yeL9O9/tLSjwFaC4Q1xp4EjEn/lFAZh0+H2AYTM/dks+VI9cOxsmhR8LqaYVv/4r3mZR04xpFg0
	+ladXgq7ZKzibEGdA+UjnT3Mlqi4=
X-Gm-Gg: ASbGnctI8hayO/CeS+9KBL4+4soO51SGPiGLKuJq7BT7OjYATNXQH1I377Vp6frMMOz
	ZiS8qercoH+ASYqFmSt6thX589khYtscESIp6
X-Google-Smtp-Source: AGHT+IEjjB6Yn5ERQ4OSD0aCIa1Del//AgoR//24wAIvdKXXlyvcU8djUAx+OKR/4R6Km+pIAmIVry+Wods3NVO2neI=
X-Received: by 2002:a05:6402:42c8:b0:5d0:ceec:deec with SMTP id
 4fb4d7f45d1cf-5d10cb55abdmr8598789a12.13.1733383570763; Wed, 04 Dec 2024
 23:26:10 -0800 (PST)
MIME-Version: 1.0
References: <20241203203824.23306-1-simons.philippe@gmail.com> <CAGb2v67Uv3SVQSqox85qt_05aVvX0oCynNRoaN9BA1Nha3eo8w@mail.gmail.com>
In-Reply-To: <CAGb2v67Uv3SVQSqox85qt_05aVvX0oCynNRoaN9BA1Nha3eo8w@mail.gmail.com>
From: Philippe Simons <simons.philippe@gmail.com>
Date: Thu, 5 Dec 2024 08:26:00 +0100
Message-ID: <CADomA482XLFNySkjujoPmPCnCrKn+RcppW=SqRqcA2WLMe-mNw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: h616: rg35xx add missing regulator-ramp-delay
To: wens@csie.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_232613_286458_017E546C 
X-CRM114-Status: GOOD (  21.76  )
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

Ok I can do that, but the driver (axp20x-regulator.c) is using macros
 to generate these regulator_desc structs.

So I have two options, create a new macro with the ramp_delay, or
modify the existing macro, using 0 for the regulators I don't know about.

Philippe

On Thu, Dec 5, 2024 at 5:16=E2=80=AFAM Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Wed, Dec 4, 2024 at 4:38=E2=80=AFAM Philippe Simons
> <simons.philippe@gmail.com> wrote:
> >
> > AXP datasheet says that ramp delay is 15.625 us/step,
> > which is 10mV in our case.
>
> (CC-ing Mark for knowledge on regulators)
>
> If this is the property of the PMIC, it probably belongs in the driver,
> in "regulator_desc.ramp_delay".
>
> The "regulator-ramp-delay" in the DT can be used to override this
> if the board has excessive ramp delay due to other design reasons.
>
>
> ChenYu
>
> > add missing regulator-ramp-delay to dcdc regulators accordingly
> >
> > Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
> > ---
> >  .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts    | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-=
2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.d=
ts
> > index 80ccab7b5..b6e76a804 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dt=
s
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dt=
s
> > @@ -238,6 +238,7 @@ reg_dcdc1: dcdc1 {
> >                                 regulator-always-on;
> >                                 regulator-min-microvolt =3D <900000>;
> >                                 regulator-max-microvolt =3D <1160000>;
> > +                               regulator-ramp-delay =3D <640>;
> >                                 regulator-name =3D "vdd-cpu";
> >                         };
> >
> > @@ -245,6 +246,7 @@ reg_dcdc2: dcdc2 {
> >                                 regulator-always-on;
> >                                 regulator-min-microvolt =3D <940000>;
> >                                 regulator-max-microvolt =3D <940000>;
> > +                               regulator-ramp-delay =3D <640>;
> >                                 regulator-name =3D "vdd-gpu-sys";
> >                         };
> >
> > @@ -252,6 +254,7 @@ reg_dcdc3: dcdc3 {
> >                                 regulator-always-on;
> >                                 regulator-min-microvolt =3D <1100000>;
> >                                 regulator-max-microvolt =3D <1100000>;
> > +                               regulator-ramp-delay =3D <640>;
> >                                 regulator-name =3D "vdd-dram";
> >                         };
> >
> > --
> > 2.47.1
> >

