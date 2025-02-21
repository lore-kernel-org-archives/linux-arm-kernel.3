Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDDDC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 10:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PCWLQJXIRaGa+NaKBUA5lVma2HK+tvmrsuX2eAKzx3I=; b=ufD5HLRpmXYZieacPcMyL/p68B
	tLDDWp7yf4YhRXmtjlaaVx23ZLBLT2tNlS5OdbG43sisVL69di6/oq6O6YS0jDIWlfQ1oMeLm26FY
	/e+s3zrrSzlQh1Wl+U7RAqF+RKm+xzVi0CsQzLnrRnnykd6igqpKOVd8fLO7y90BdZDe9CpXa382x
	8h/cQvm9sjCd4VSYqMo0OzHilzPpXIsOzCxAAdGbbOTRo2qfLN3jIXdd0WOEMsbWNjUspBZD+3wtB
	6xR0BNYNcCXg/gKOY+H6azfJ2aI24XU8Vx26owPzmEiGEX/eV7jPjhfJAJtDylsQR0tsWYq9Q+eIJ
	1RdzBxlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQ67-0000000591M-0eOE;
	Fri, 21 Feb 2025 10:17:31 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPk2-0000000527j-1cld
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 09:54:43 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5debbced002so3551348a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 01:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740131681; x=1740736481; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PCWLQJXIRaGa+NaKBUA5lVma2HK+tvmrsuX2eAKzx3I=;
        b=mcNbOYrKFC+yBZ3Hs8dv8vfJmliX84Lf7thX9QlP+/r5u1qyiuKSl5AjYt8NyjbyG+
         JfzTbHfMoZ0nifTEwDxqXXF2yCAPg0H1rGjvgZS4kNQIFH1KEacAu/29np0CNcx0bPWg
         VJuqPEKWw+xHQmFySTyXl10Hops3HsazYiHOQw4elq+kEgN5JMsA8ZWdghuPpy9Wh7i6
         LHDvtBxr+WKCFvJzxtXoiOIf+k/kq0Ee/8/JTMK2UpeSB5alirXZQX4UCgRVnpHxftHr
         DVAAcY1S5ag2fzcLwDRlyczfaCNLbNQ53etoIGeXaDOb4PplMXX4O0E3YTQCv8n9EOR9
         8lYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740131681; x=1740736481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PCWLQJXIRaGa+NaKBUA5lVma2HK+tvmrsuX2eAKzx3I=;
        b=c427RyOOf8P/oNy93MLYFJiqr7m5kXKquwMt0eK4ou9J78nKj7OxtnQPqQWFshdVQJ
         afzOJ1hKq0zbuPJYFMZ4J/ClVFr5WhLFkAIwQWVPGMwD333U8gqPACfg1sGF/w6BNmfP
         cS9rMRefZxfmkOFsyiKtHvSjTwb2TcbPUzqpSxDeJm4SrK+9nhbcMJSGsMo2omA4Pmnq
         KylOtAUzBi4tTzN7QKjAP1DoFaSFcASbatrKs7raJT1SqA3179B0mhQCPO1xbv2apwDB
         t/QEpaWudjqk4Ga8NrRmbywWtaIs6ZWOwnm0DGebpMrLvBt9vuJqMhot+JDkws9mk5Rv
         OUaw==
X-Forwarded-Encrypted: i=1; AJvYcCU2jSUrI78+Ch5RRRXbSupH47QVYaCV2RHVp4qWeEeXsz70Fh8EawkpgLdZBNsNGvxLubItjD+PI/Gp1YdMEOrx@lists.infradead.org
X-Gm-Message-State: AOJu0YxWVIIWIZQ8gjZ11VhS+aSq2/ay0odw2sb3sMtoQhwCsPPt9jgp
	463dzciepEC+mk8ATK5EgkEWHRgrdYJzsMjtb0AOrYXBioHvvFMvklZQzINpFi8uRQ/qJyQ9TQv
	8BH8ShRU2C1JICknU9BwLFD+VhtlurK/Cufw=
X-Gm-Gg: ASbGnctCloxRWOwHteUbVwIkMQh3sosl9ZZPb3DEaJfsXApsH3412ifSa+J/CTN6ej6
	wXq67CKJ1f0Me3/Xc/soGoUDAyRSdgE4nBsyv0C3ZMTPvsGJEtaIk3zUSWWEUCt9XLrAt0rdW5u
	u2SJTa2rs=
X-Google-Smtp-Source: AGHT+IERzieE0HXpOGPr2oPq6V5HcGC9rINMOoagVFBANbqyTomsPjFp0m4XiausshWj0LORrEm4V/CktVu+ZQyj1Kw=
X-Received: by 2002:a05:6402:90b:b0:5e0:6e6c:e2b5 with SMTP id
 4fb4d7f45d1cf-5e0a1261230mr6369087a12.9.1740131680329; Fri, 21 Feb 2025
 01:54:40 -0800 (PST)
MIME-Version: 1.0
References: <20250118102207.9339-1-simons.philippe@gmail.com>
 <20250118102207.9339-3-simons.philippe@gmail.com> <3229934.fEcJ0Lxnt5@jernej-laptop>
In-Reply-To: <3229934.fEcJ0Lxnt5@jernej-laptop>
From: Philippe Simons <simons.philippe@gmail.com>
Date: Fri, 21 Feb 2025 10:54:27 +0100
X-Gm-Features: AWEUYZlqXqdJfwgEwnpCfDSpt4wrYNSKsocDQVRpSu4fjABOQ7YP3MhnhFElf50
Message-ID: <CADomA4_yMUS_S-YDrQdSKmZrDMwPeakkJBix-r08UFQejTYYcw@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] arm64: dts: allwinner: h700: Enable USB OTG
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_015442_422547_F1F203B0 
X-CRM114-Status: GOOD (  19.32  )
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

On Thu, Feb 20, 2025 at 9:38=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne sobota, 18. januar 2025 ob 11:22:06 Srednjeevropski standardni =C4=8D=
as je Philippe Simons napisal(a):
> > RG35XX have a GPIO controlled regulator for phy0 vbus, add it.
> > Enable HCI0s controllers and otg for dr_mode.
> > Add phy0 properties to descrive id_det, external vbus, and internal vbu=
s
> >
> > Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
>
> This could work without previous two patches, right?

While this correctly describes the board, it currently doesn't works
as expected.
HCIs will enable the 5v on PHY and will never disable it.
Resulting in a blown regulator on the board if plugged with another host.
I managed to get this working by removing the PHY ref from the HCI,
but this is wrong.

>
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> Best regards,
> Jernej
>
> > ---
> >  .../sun50i-h700-anbernic-rg35xx-2024.dts      | 25 +++++++++++++++++--
> >  1 file changed, 23 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-=
2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.d=
ts
> > index 80ccab7b5..5a6ae42de 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dt=
s
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dt=
s
> > @@ -175,6 +175,16 @@ reg_vcc5v: regulator-vcc5v { /* USB-C power input =
*/
> >               regulator-min-microvolt =3D <5000000>;
> >               regulator-max-microvolt =3D <5000000>;
> >       };
> > +
> > +     reg_usb0_vbus: regulator-usb0-vbus {
> > +             compatible =3D "regulator-fixed";
> > +             enable-active-high;
> > +             gpio =3D <&pio 8 16 GPIO_ACTIVE_HIGH>; /* PI16 */
> > +             regulator-min-microvolt =3D <5000000>;
> > +             regulator-max-microvolt =3D <5000000>;
> > +             regulator-name =3D "usb0-vbus";
> > +             vin-supply =3D <&reg_boost>;
> > +     };
> >  };
> >
> >  &cpu0 {
> > @@ -337,12 +347,23 @@ &uart0 {
> >       status =3D "okay";
> >  };
> >
> > -/* the AXP717 has USB type-C role switch functionality, not yet descri=
bed by the binding */
> > +/* the AXP717 has USB type-C role switch functionality */
> >  &usbotg {
> > -     dr_mode =3D "peripheral";   /* USB type-C receptable */
> > +     dr_mode =3D "otg";   /* USB type-C receptable */
> > +     status =3D "okay";
> > +};
> > +
> > +&ehci0 {
> > +     status =3D "okay";
> > +};
> > +
> > +&ohci0 {
> >       status =3D "okay";
> >  };
> >
> >  &usbphy {
> > +     usb0_id_det-gpios =3D <&pio 8 4 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>=
; /* PI4 */
> > +     usb0_vbus_power-supply =3D <&usb_power>;
> > +     usb0_vbus-supply =3D <&reg_usb0_vbus>;
> >       status =3D "okay";
> >  };
> >
>
>
>
>

