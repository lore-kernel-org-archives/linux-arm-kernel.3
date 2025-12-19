Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21213D74964
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 08:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQ15vqIj64VulmTvMX7gKagznPfyt4IeoJrE3JDAELA=; b=wMLMtKS/Ta48nRnwGTwRhks1l4
	AYJU59Ol92hKs5bgKnWLFpHzt4B+cc+AvFN4sI2UCVS/132LUbnq+/NVjTKW2OEpK5WorcmmMuvW1
	2oX9FLscauieLGt5hO+DWQulCsxZZpU84KTYMULgUPcPvN6TqoASkRi9tlILrlcMbyRWauhkYh+Yd
	iKSKqu3jMEGi8xHg/aAIMVhSTHONik1k7RSY8/EyQzU6H+7JA5trprE/w4MEXY61fWmXa/w8E+83k
	v5cUYszP2pnMCpj6FGQTiqc7li+FprZoHjvrsQjrVIGv1tisH+A40cih/BD6UCygLWugN/csy588A
	WUIHYq3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVyM-00000009sTJ-2ykb;
	Fri, 19 Dec 2025 08:36:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVyL-00000009sSw-0peo
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 19 Dec 2025 08:36:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZQ15vqIj64VulmTvMX7gKagznPfyt4IeoJrE3JDAELA=; b=eq10xA9R8MwR1HphBUO2prnujs
	2HBK2Diu0ufY5CFlivoh7Dxth+z4LHf/CpPBKOxIRosz4zxXbTHCw3g4lmksLqPeErNfYxmczIZAi
	HKXzpUWLAZSEbzZ3uyuS7TOC+z5Tv9aTEYwxYjTEWkRz5feRzc/lm2PdVI5M+6t6DHe6yhiGHyaeC
	LU0KVglHqoVMha0G6npoJJd/v3lOEGccqWBvIyFOkLRCkSq6vLx7X5HWgfitSK9U1/zRv+hVEI7vb
	HpPf53nYXl78XjcIMdNtr7QIoZAwtNh8Cp29OjxdkAhJPwTPkx4JSdu9pY+s3TTdWUxdZb5KqgFmp
	M/dbwkXg==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWV6p-0000000APS6-3w2g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 07:41:09 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2a0d0788adaso13646315ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 00:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766133380; x=1766738180; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQ15vqIj64VulmTvMX7gKagznPfyt4IeoJrE3JDAELA=;
        b=OUGdlIi08QfDybT+E1ANhiiZuJoeMuKWgYATsoyjwcqwVHjhsBbwPuF55ugMJEyMJr
         9gd/9HQWj8UqxCtEqtcgsDmAqlpq1fgMWOSG13MLWIVpCeWk8qLPYODKOCNZ7tfpYlB5
         D4speQYrN/lx4sYGRWvBVsp44WetK1qjxyJmahBqTKJbVWCYgFeSMXxdEjl3B+o5Lspa
         c5eoIE//KZDQ9ArSuq0ZYAjnjCxi6DX8kf8f6yaUEqqX21Ah5QsfXICofLFyNyGoegq6
         FNVlsOFmHqAbbXjUVeNt/+2AUsSekhcSVc065FX6G7/Go4Vp77CfB2LisepREd3/7zZH
         LuKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766133380; x=1766738180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZQ15vqIj64VulmTvMX7gKagznPfyt4IeoJrE3JDAELA=;
        b=t8AcnLfNGhI70ErT2qEE3E3rzvz8I9k/FyH41uNU4OMNviUGQEtbR1bEstwUwDeaDX
         SvTntp44Iz3MS4ZHhEZj7Ng79EmzzIo5IyywqR5ERy385rtzzhEBgwmcq3R18PZVOIaQ
         nqJiL+fAPC7oNxYmP3pR0uMrtyO8qdQ8p+zbBWKPP4Dsiq5RrB3qtXn28jTZyp8vy+89
         nBT3qSSw/OrNy9wvGcc5yxFSO49qlAjocH11lL2qA3VmONk6Q/Bnq5xS99Vxee7OYquw
         XWp9y6N7IKzyosYhDNugd8eusUSbO/Y9ySXUyZL13mLMC/phgRAaZF7ux7ssQiJ2C0Pk
         9bjw==
X-Forwarded-Encrypted: i=1; AJvYcCUzyZtUX2oy4dXKvjmGalfUUCXD4v78V/mq56/8hUdDzMMSFE4/FCnyRsurCsTIgEEPpQAdShxK9SDhhTT1EY+6@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv7iqqmM2pAkgKm2/fdkbqxCuKIilbC3OGEycjW25junG6JCyZ
	UzrvY10ODIGPyP3Ja63joJcAqUAwp1yyclhYOoeC/zno3IO2VIrC0DI05geMK8hEbxEIU2YB/YR
	Odu7BON6QctrMqW2QwY8HtERmBGT/hRo=
X-Gm-Gg: AY/fxX6EluhzHNxzp4PwfbE6cPp525TLz40E9ggfetSZkQe6SmU7zviblU/K0rS9VMa
	8CCxj9M4U5B/glzwMxkuNcR5isFnvp2oGjeZkdrNOxNaQh6GfxhkdojB1RKhh+yzlvUNdZD8imT
	T1JyUzGgE1TFKbTMdb2PnoR66PSs9sNnG4a65mMk++iOcLK+YHMCD190UWk5DrtCR8Om2h180VP
	FjyKr7BOO7/PidiqUeAO7NyjuJQvqET+02CH0GHYfSVdy1GTTzs0CpzvqE6TtG2NARSJO4z
X-Google-Smtp-Source: AGHT+IHoMetY0jMBrCjdGc88mFfxhQzBRDJteW86k7GC+pHgWJLGWEQWxMUQQCJ4cUxyjd7HhWR7FTDj+6JvEJptRWA=
X-Received: by 2002:a17:903:2a8b:b0:2a1:3cd8:d2dc with SMTP id
 d9443c01a7336-2a2f2b53f26mr20958725ad.57.1766133379728; Fri, 19 Dec 2025
 00:36:19 -0800 (PST)
MIME-Version: 1.0
References: <20251118-yv5_revise_dts-v1-0-fcd6b44b4497@gmail.com>
 <20251118-yv5_revise_dts-v1-2-fcd6b44b4497@gmail.com> <ad11cd30eddc1b7c496cc92eef129eb5c0f2d604.camel@codeconstruct.com.au>
In-Reply-To: <ad11cd30eddc1b7c496cc92eef129eb5c0f2d604.camel@codeconstruct.com.au>
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Fri, 19 Dec 2025 16:36:08 +0800
X-Gm-Features: AQt7F2r_PXl3skkkTv3B_wJpuSzrJrIzk8N8zRMoeuWF6kLBddZNyUa8Y0zFtL4
Message-ID: <CABh9gBeCU7Xr818AL2ud4SxFQ=D=4D9YwiDUu4HttWuOqO+7ag@mail.gmail.com>
Subject: Re: [PATCH 2/3] ARM: dts: aspeed: yosemite5: Update sensor configuration
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
	Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_074108_089767_D72DEFDB 
X-CRM114-Status: GOOD (  21.70  )
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

Hi Andrew,

Sure. I=E2=80=99ve added more detail in the v3 patch to clarify the hardwar=
e
revisions and the rationale behind this change.

Across Yosemite5 board variants, two different power monitor devices
(using different drivers) reuse the same I2C addresses 0x40 and 0x45
on bus 10. As the hardware evolved, newer board revisions replaced the
original devices with different ones at the same addresses.

Keeping these devices statically defined in the DTS can therefore
result in incorrect driver binding when running on newer hardware.
To avoid this, the 10-0040 and 10-0045 device nodes are removed from
the DTS, and the probe of the driver is instead handled in user space by
the OpenBMC Entity Manager based on the detected board configuration.

BR,
Kevin

On Mon, Nov 24, 2025 at 12:42=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Tue, 2025-11-18 at 18:53 +0800, Kevin Tung wrote:
> > Remove sensors 10-0040 and 10-0045 to align with the latest
> > hardware design changes.
>
> Can you please elaborate on this commit message? I'd like this
> description to be much more specific about revisions of the hardware
> design, and why you expect all instances of the previous design to
> suddenly stop existing.
>
> I can't imagine this is the only hardware change that occurred. What
> other changes are lurking?
>
> Andrew
>
> >
> > Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
> > ---
> >  arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 14 ------=
--------
> >  1 file changed, 14 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts=
 b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> > index 7991e9360847532cff9aad4ad4ed57d4c30668a0..45b8ac2e8c65a4f672e6457=
1631b7f6944f26213 100644
> > --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> > @@ -674,20 +674,6 @@ gpio-expander@22 {
> >                       "PWRGD_P3V3_AUX","ALERT_TEMP";
> >       };
> >
> > -     power-sensor@40 {
> > -             compatible =3D "ti,ina233";
> > -             reg =3D <0x40>;
> > -             shunt-resistor =3D <2000>;
> > -             ti,maximum-expected-current-microamp =3D <32768000>;
> > -     };
> > -
> > -     power-sensor@45 {
> > -             compatible =3D "ti,ina233";
> > -             reg =3D <0x45>;
> > -             shunt-resistor =3D <2000>;
> > -             ti,maximum-expected-current-microamp =3D <32768000>;
> > -     };
> > -
> >       adc@48 {
> >               compatible =3D "ti,ads7830";
> >               reg =3D <0x48>;

