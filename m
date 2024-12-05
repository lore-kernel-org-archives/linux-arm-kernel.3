Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7978BE77171
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 07:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=haUzoOdl3j5ZhKh6v9Mp+uyoSF/yENN0p8H5q1O4kPw=; b=t+50sVccFdepNH
	ni0Ku298+hb9kLT4BSJDqJk8bHDBAyqD7GTMGrMBQEfFNOg/W2JqcThVsZAAEpAzJn/fsZNHbNwKO
	0k8XZzbZjcH4llXMikXhV4AjQL6jzMdwqV0PjZiGQwYvuUavFilUqsYjRMCYBkJnsxxlocNtzsPn1
	bkuKnrmjB83TqpLAPY4RI6ig6WW9a0zlL/lkdXZFmApqTrKLxdkRjuZbU77P3nwNIWKGv9E8AuDKf
	kPXcrB5objIW4Nbi4PtDYYmEAQzNs36A7kCcx5bnJJKoQxsXfWg/EY4bJsTIFIOSZQuG5MBn22CJW
	wBUwDVFK9l9Nrt8uLAbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6Yh-0000000F4n0-42Fg;
	Thu, 05 Dec 2024 07:45:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6Sf-0000000F3Qq-18K3
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Dec 2024 07:39:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description;
	bh=haUzoOdl3j5ZhKh6v9Mp+uyoSF/yENN0p8H5q1O4kPw=; b=Z2uYjSHoBAL2dY5yX39EJHJgrW
	+ogrD1mzJ05oJyFnG1ExibwyozMW4hkwhuA4oE9eHTQewW2AOh8MsYCtetYJwFq6FzCD+v7Od0aRx
	IWdeO0AxJAIPkzRsqlSIE6/5+8j2sCcanPkaIiD9TQW6DHIh95k9WScIpi5qtORLuZZrtTxENkoXr
	J7cZ8/JBRMaE1Vtyw3662bGGnDqHwzGAejkkImSxXpTWMvdHQTraJFdr+IOxCQGB/WNg2LH0LCDlE
	Tyiekk6+bYvsStCovCQMy6k9l9Ta2KA8dQCBSoodcXYkPEYAE8P6O7/OXthEn4Tq5b2ORt5dLBknQ
	x2OLNPYw==;
Received: from mail-lf1-f44.google.com ([209.85.167.44])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6Sb-00000002n1B-2Tpg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 07:39:44 +0000
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53e274f149fso80457e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 23:39:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733384377; x=1733989177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=haUzoOdl3j5ZhKh6v9Mp+uyoSF/yENN0p8H5q1O4kPw=;
        b=VNBRrB0gn5UeVip+tPuxmYcjEx+O8bd/TJGKLAT+CkmbZQTS1Xiva87VZWItJQ7oAn
         q/Luw5DFodTnlNLo8frhqL8SLAHM1ttWF/GQiAAhtw/bWwVaSIxI5vpcsUPI/lGo0Pf3
         cfKB4MNfAjC+tZobDhV1/MjIwCS8GQw1ZcQvPF9jbH657zI/BJQRYaE8omwJu0+cMDH/
         rwUHBw5+SUf4L61xMuoY71WVC4wbZ8eVhrdJK+B480Z/DGsFSrkbqyL2fGURpDx7++OR
         0LNt4cjPPMPFFBQBsDtQI09psoFm/IoP3Bkk4O1Ttk+eWS2J0nWQqpfAIcAmO8jbpbIk
         wnlA==
X-Forwarded-Encrypted: i=1; AJvYcCXF/ujSuA0Y4RgsSZHxtvNCZoLDFpfhNNSX76bhmCAncLgLMxdOXVCdnWIAEFQROTLc5JArYHC7qc3YlAazeM1v@lists.infradead.org
X-Gm-Message-State: AOJu0YyUJ4KAgoR1SeEBQkZvWplN0l1MvUw8YH/pN7PQQhLUWK405GE9
	k8JG35J2JlMIHTpe7ecnO+bHP3wxBlqaXtlV6YMhAQlXByPrE/V9udHA5mCB
X-Gm-Gg: ASbGncs1ph28FnrcRQ514XN4z/Sjgd+tg7tctVqlUR0zsngDi/SO6F4Hz15QBI+Qq1r
	RNvPu286maehKJ2CZIY2Xtt5mhm2hNRupUPXgXPOekvuroAzKqVDJkxSKn0LQqnR0zrzifT+cZb
	kQ53DHHe6clAiG44Q4uwFZWe/4LfXU/3lXUcZdFgvsr3LNOvDpXYFOQU4/1hSBkJgIvYY6JFxHf
	RnsYn8JikaTnhT9RaA4TALahjLoQasRUw79C+2TDcez38RjqmRsroF8pjk2Y1PrptQ08kDwDyhL
	oxY9MvY=
X-Google-Smtp-Source: AGHT+IFhynrsRCtoYhVWMI6N/PxO6/IiVz9GxwZUIPrzdO/c4cKLUBTLLgLneuMOkA7dR81NBKegyA==
X-Received: by 2002:a05:6512:e88:b0:53e:1c3e:25f with SMTP id 2adb3069b0e04-53e1c3e0546mr3593288e87.4.1733384377323;
        Wed, 04 Dec 2024 23:39:37 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e229ba553sm148482e87.138.2024.12.04.23.39.36
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 23:39:36 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3000b64fbe9so4815661fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 23:39:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWaWMvNYOUNZ+PegYvvM2fcy1KobIvOc80sH5D7Ci6SDgTqvs844rgoGpDT0r6muUHtpoStPjVDJG/p1OuIeq9p@lists.infradead.org
X-Received: by 2002:a2e:a907:0:b0:300:8ff:d93f with SMTP id
 38308e7fff4ca-30009c50cb0mr55293541fa.22.1733384376650; Wed, 04 Dec 2024
 23:39:36 -0800 (PST)
MIME-Version: 1.0
References: <20241203203824.23306-1-simons.philippe@gmail.com>
 <CAGb2v67Uv3SVQSqox85qt_05aVvX0oCynNRoaN9BA1Nha3eo8w@mail.gmail.com> <CADomA482XLFNySkjujoPmPCnCrKn+RcppW=SqRqcA2WLMe-mNw@mail.gmail.com>
In-Reply-To: <CADomA482XLFNySkjujoPmPCnCrKn+RcppW=SqRqcA2WLMe-mNw@mail.gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 5 Dec 2024 15:39:24 +0800
X-Gmail-Original-Message-ID: <CAGb2v64YFcEhTYVzTJWTvw7CZ3XF08e7+1jiTg25HN6C1Ny+Jg@mail.gmail.com>
Message-ID: <CAGb2v64YFcEhTYVzTJWTvw7CZ3XF08e7+1jiTg25HN6C1Ny+Jg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: h616: rg35xx add missing regulator-ramp-delay
To: Philippe Simons <simons.philippe@gmail.com>
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
X-CRM114-CacheID: sfid-20241205_073941_744406_BC6D859C 
X-CRM114-Status: GOOD (  25.07  )
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

On Thu, Dec 5, 2024 at 3:26=E2=80=AFPM Philippe Simons
<simons.philippe@gmail.com> wrote:

Please reply inline.

> Ok I can do that, but the driver (axp20x-regulator.c) is using macros
>  to generate these regulator_desc structs.
>
> So I have two options, create a new macro with the ramp_delay, or
> modify the existing macro, using 0 for the regulators I don't know about.

You can add a new macro with the extra ramp_delay argument, and modify
the existing macro to expand to that with ramp_delay =3D 0.

ChenYu

> Philippe
>
> On Thu, Dec 5, 2024 at 5:16=E2=80=AFAM Chen-Yu Tsai <wens@csie.org> wrote=
:
> >
> > On Wed, Dec 4, 2024 at 4:38=E2=80=AFAM Philippe Simons
> > <simons.philippe@gmail.com> wrote:
> > >
> > > AXP datasheet says that ramp delay is 15.625 us/step,
> > > which is 10mV in our case.
> >
> > (CC-ing Mark for knowledge on regulators)
> >
> > If this is the property of the PMIC, it probably belongs in the driver,
> > in "regulator_desc.ramp_delay".
> >
> > The "regulator-ramp-delay" in the DT can be used to override this
> > if the board has excessive ramp delay due to other design reasons.
> >
> >
> > ChenYu
> >
> > > add missing regulator-ramp-delay to dcdc regulators accordingly
> > >
> > > Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
> > > ---
> > >  .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts    | 3 +=
++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35x=
x-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024=
.dts
> > > index 80ccab7b5..b6e76a804 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.=
dts
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.=
dts
> > > @@ -238,6 +238,7 @@ reg_dcdc1: dcdc1 {
> > >                                 regulator-always-on;
> > >                                 regulator-min-microvolt =3D <900000>;
> > >                                 regulator-max-microvolt =3D <1160000>=
;
> > > +                               regulator-ramp-delay =3D <640>;
> > >                                 regulator-name =3D "vdd-cpu";
> > >                         };
> > >
> > > @@ -245,6 +246,7 @@ reg_dcdc2: dcdc2 {
> > >                                 regulator-always-on;
> > >                                 regulator-min-microvolt =3D <940000>;
> > >                                 regulator-max-microvolt =3D <940000>;
> > > +                               regulator-ramp-delay =3D <640>;
> > >                                 regulator-name =3D "vdd-gpu-sys";
> > >                         };
> > >
> > > @@ -252,6 +254,7 @@ reg_dcdc3: dcdc3 {
> > >                                 regulator-always-on;
> > >                                 regulator-min-microvolt =3D <1100000>=
;
> > >                                 regulator-max-microvolt =3D <1100000>=
;
> > > +                               regulator-ramp-delay =3D <640>;
> > >                                 regulator-name =3D "vdd-dram";
> > >                         };
> > >
> > > --
> > > 2.47.1
> > >

