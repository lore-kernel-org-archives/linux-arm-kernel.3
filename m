Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5EABD1D46C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 15:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fypOMiSP+xOXf5nJU3HVmGThmnIeMx0b0ufwVIjof3g=; b=hH4/s7vbxsgoZD
	1mcVR4n16CZUgrOAf2sbEIghQ43S4l341qAqZSBZ1nGL7Lz84G6GOlud0ZPSQPCpQS88N+yW/HFnD
	bYWUHVJwWsehcKxxWIA5OuklrXxFeUOANppVJOH4AomhdvUklVsPeuW7kd8sr27KmeTWvDsJ5+xg9
	30vTXQ9SHT2oa0fmyETfZaqwHrt2jzHwxnfBskCHWIUFHJf/cJm8jlv3S2toSdVAk4vq41KeQJfsQ
	7OmQM87ngQI8rkJz785+BwpAEgJ3eLNCh8Q9Uw8Fy/nBOLW5fO3oue0OJ2TeRbmXMkEGTbTmsRhH5
	kd/w4JO+VASSrrZ+YKIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrcX-0000000HSs5-08mV;
	Thu, 08 Jan 2026 15:08:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrcU-0000000HSrU-1z4H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 15:08:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A0DB04095F
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 Jan 2026 15:08:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80084C19423
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 Jan 2026 15:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767884893;
	bh=39Z9S4WdE/PvsD7g4HhaCFW2OPS03zLo06BGT58/Sdg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=G4s2YCTwalIIEOa5+zNpraynj/0tm4IP0B4nWh1B8yEFVsk2q/4Nwsv9udsyPMb/V
	 c2DO2apYh/CjwSMjCs/GFKynWKqfctOOJP6KTPot1qppd7LbMrXROq0hxcvzwvQYug
	 gbDa6i9pWATYUX1E67v6srC0L0rFGdb0qk2RXH+dPDqmYfqT2ULqYl2m7iJb8TvW22
	 0Iv4ktk6Y54LOfGHWKdahqYrTTBH9vq6aJnCj8p4vWkSJl+TSizIs5myGfq2YeVxMD
	 qU871L9PFs1zSFfmyBQZGNRSvkUNcOwVXUaUaOQ9oAi7VSMKLK5wPCr1O6DH+MZ5QT
	 kdU2zU/LkS7rw==
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-65d1a094185so1379441eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 07:08:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVk/wthJ4xfGrF36An+V8HAFBDDm3jXnd9gYZ0/K7/tVrveiQ4j3RDDoh+6FWPhvQ7SXxmPJ2aGDhPFTiqOH82y@lists.infradead.org
X-Gm-Message-State: AOJu0YzibX6VhDkmEdR+VjVDrJQkNCSVB44uXzcBViKrWirxLvKJxWyv
	a7Uqw6N/26y3e36zhS8WKBs0ndd2poNwuQwTOaIn1fn6xdOkjfsUguIozBp/Gq4JWa6UKFYxq8l
	axkrsj2F37hVLn7kFqbCH0sOQUesCf94=
X-Google-Smtp-Source: AGHT+IH/gnEZYqIaFUUN6qjbp6n1QUe5qlNXozvSo/LvWHOByHxaNwk2S8ODoFI4rDHWqv0owwBmLR26/u3UOEkO0ho=
X-Received: by 2002:a05:6820:6181:b0:65f:5d31:2965 with SMTP id
 006d021491bc7-65f5d313701mr1029748eaf.47.1767884892592; Thu, 08 Jan 2026
 07:08:12 -0800 (PST)
MIME-Version: 1.0
References: <20251225103616.3203473-1-wens@kernel.org> <20251225103616.3203473-5-wens@kernel.org>
 <13929653.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <13929653.uLZWGnKmhe@jernej-laptop>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 8 Jan 2026 23:07:52 +0800
X-Gmail-Original-Message-ID: <CAGb2v65LzhdXfX16HTgGbC7OYkuX=vqCzB65=BqD4i1SiCQeRw@mail.gmail.com>
X-Gm-Features: AQt7F2r3aAZUypwXBa9lAFiH8eexcqiOW8WUO-M-nGoH39uZtjTr8DirPSqIr98
Message-ID: <CAGb2v65LzhdXfX16HTgGbC7OYkuX=vqCzB65=BqD4i1SiCQeRw@mail.gmail.com>
Subject: Re: [PATCH 4/4] ARM: dts: allwinner: Replace status "failed" with "fail"
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Linus Walleij <linusw@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-gpio@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_070814_549534_C49D2225 
X-CRM114-Status: GOOD (  19.24  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Dec 26, 2025 at 2:49=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne =C4=8Detrtek, 25. december 2025 ob 11:36:15 Srednjeevropski standardn=
i =C4=8Das je Chen-Yu Tsai napisal(a):
> > The device tree bindings specify using "fail", not "failed".
> >
> > Fix up all the ones that are wrong.
>
> While patch indeed fixes the issue, I wonder if "fail" is proper value?
> According to specs, it means that device needs repair. What about just
> keep "disabled"?

"disabled" isn't right either, as that means its disconnected or not used.
These are definitely connected.

On the other hand we could fix these and describe the supplies for the
external as supplies for the pin banks? But I doubt anyone has these
devices around for testing.

ChenYu

> Best regards,
> Jernej
>
> >
> > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> > ---
> >  arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts | 2 +-
> >  arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts | 2 +-
> >  arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts      | 2 +-
> >  arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts         | 2 +-
> >  4 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts=
 b/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts
> > index 63e77c05bfda..f2413ba6a858 100644
> > --- a/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts
> > +++ b/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts
> > @@ -112,7 +112,7 @@ axp209: pmic@34 {
> >
> >  &i2c1 {
> >       /* pull-ups and devices require AXP209 LDO3 */
> > -     status =3D "failed";
> > +     status =3D "fail";
> >  };
> >
> >  &i2c2 {
> > diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts=
 b/arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts
> > index c32596947647..e0c7099015da 100644
> > --- a/arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts
> > +++ b/arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts
> > @@ -96,7 +96,7 @@ axp209: pmic@34 {
> >
> >  &i2c1 {
> >       /* pull-ups and devices require AXP209 LDO3 */
> > -     status =3D "failed";
> > +     status =3D "fail";
> >  };
> >
> >  &i2c2 {
> > diff --git a/arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts b/ar=
ch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts
> > index 5bce7a32651e..5dfd36e3a49d 100644
> > --- a/arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts
> > +++ b/arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts
> > @@ -170,7 +170,7 @@ hdmi_out_con: endpoint {
> >
> >  &i2c0 {
> >       /* pull-ups and devices require AXP221 DLDO3 */
> > -     status =3D "failed";
> > +     status =3D "fail";
> >  };
> >
> >  &i2c1 {
> > diff --git a/arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts b/arch/=
arm/boot/dts/allwinner/sun6i-a31s-primo81.dts
> > index b32b70ada7fd..fefd887fbc39 100644
> > --- a/arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts
> > +++ b/arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts
> > @@ -90,7 +90,7 @@ hdmi_out_con: endpoint {
> >
> >  &i2c0 {
> >       /* pull-ups and device VDDIO use AXP221 DLDO3 */
> > -     status =3D "failed";
> > +     status =3D "fail";
> >  };
> >
> >  &i2c1 {
> >
>
>
>
>
>

