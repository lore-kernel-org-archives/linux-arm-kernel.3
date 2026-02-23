Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2DBEA4FAE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 11:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Br5siVwmXHkLMmqx3d4sgf29fX12Q6bdQRYt3PwHjas=; b=G3gh2yTHVPlhzC6Y3v7k1/JzUv
	VSau8spLcfON0T7SI23xPEwL4LIZ9Q76SSitmC+hN8UdrDBwt7syClmicxLPgih1iiq2/Nn8gYC2i
	xLrmezuhf9VlYrNYhVWAkIHMBevszvFvB7VFelw/+4IGhr/Mk86eAXcIS1C2Wiy7HXmB2Oi/0RWif
	ZvB2KDJHtzIbt4iy8GBEp59Lxqjt3yhsi8n2hSTek9hdkqWmUmEXCNj1VKlKpJt3eZbHwfwW21qLW
	yKCdRlIGw6CYHgTVzB8AsT7lz6wYASZJ+XJ1IQya4MgFwa3ei0WgIwt1Ykv3ButiFoIYZxoWPYwWX
	Lrcela/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuU96-00000000BOK-05EJ;
	Mon, 23 Feb 2026 11:30:36 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuU93-00000000BNr-1JZA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 11:30:34 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ab47d8b33cso23392895ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 03:30:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771846232; cv=none;
        d=google.com; s=arc-20240605;
        b=RJcpojwS0dBmGbjwMkssBPtSAi04SvLrdIzWgn4+mAoBJHLg78d32SKexPCEE90GRP
         LpIRJ+wsqk8GK8fB/DLe1gH6m488ZW+r0PWGpMoH3IJzKXu2Xn+kzGXWAaYrSPRimKrX
         eQqTeJEZrxOWogWM21XWZcubR4eew9AJO3/Kk1a1v3I9+wkR0ZZK0rW67S15XNeATGPp
         LNa8rXL0q/ZVqKdVSffJ2VXs3hsozuxKvpVXkjsq3Ww2AavvKJ4CmpTL6kdHbjUU6+r4
         WAjF8RxN0eHFkxNVPkOj+MsinlRLDzGVjSI+6mkYl5RVYrYTyJxJbD8bR7aTAVYlLLWp
         +jhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Br5siVwmXHkLMmqx3d4sgf29fX12Q6bdQRYt3PwHjas=;
        fh=Xf8wkCS80FEWk8qXezo8IcHoVSajvPfqHy7GJCQg2u4=;
        b=UPyXyNi9jth6LEcA4liIT8zYh7hA4099yarXARukKEdl9ozLt4txqZ5GyEN+Wy2Qbx
         9g5UyFmzakMHxcjo+Y0YHNrX7ZDZijOgpDFtD4klnwn9Vm2TFRVlSG9Bv85TLOdUmlMd
         3NKEOf2znWq6RrnQbp6IQUa0EEnHBS0f/8vT8jCr+t/cIOL3da9bxWqdAFjV4HoqWJNk
         Ndwo5EHmUbcqXVB7r0lZbX/cjv0xPWWt5cZExfU5eIVjdXgv90Kca3GbZUq217Uc/Avq
         9LEIpylaXGXS3pOyndAatUkT8mfZiirF5rx5fL0Ido3LyPPdDfgiOK1LtgvlaW1ewWhx
         +93w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771846232; x=1772451032; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Br5siVwmXHkLMmqx3d4sgf29fX12Q6bdQRYt3PwHjas=;
        b=YtMUuE3mYJ6Ecao2qkxXqMP8TTXsEno1pQ0GALiJJAS1L1wHDqejcDaYNcVS6B2zyh
         auG7MorXEAe1fyl9t0yR8YRPONIbhjlm0jp61eSKuEUQd9QmcAkBlVaY5+EHLWwnztYE
         aciBEcsgyi/VQASGRqy+9qt9RFQ9eYWfBz8f8k5xuc4ZP14oKCfcflKa9/DSnqTEOJ76
         WdcakLxoIKh6j86uWMrkf3I4TYjPPRu6Bf+mjS9LWCBeX6H3eBpc5MpSmLo2Wn9y8gOm
         r1pr0sVQXNKdc3s7xuFgB/MRFUl5cOuK/HeWCtLZ0T+QoQh6ICRfJOOATt66ThcTqqao
         ydmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771846232; x=1772451032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Br5siVwmXHkLMmqx3d4sgf29fX12Q6bdQRYt3PwHjas=;
        b=eBsAlOgm0GKs6exfwq62fbAtk3eZIost+CcLwO3OBteFZe8AQbRVPQs1nz32Vskk7u
         jNpzUdS6gDcQOVJNflRYGBRA5CBf/z22Z/Hg2dvhEjGcJdgaxgpX+xJ7tCIMapR8Vaa+
         uj50Uj8ng613G7fQjTVHAD/k5vj2cMHG0aY6vs/+Iq+S7g92JMKlNb36UfvjJVO2M7QN
         250P+6K2vzpKP8doDYUWjQhGrl8h2Ng77Ofx1YiA9bMnThElqHmJlK9QMI+HktPbq8pa
         AUZvV1BBSWqCk70TF+H5CKJfCcczcOPXt39JPR3gq3Pcm66hUsaM7fNdFhZISn5noIem
         WEyA==
X-Forwarded-Encrypted: i=1; AJvYcCVDi4KMa4jmyWcucdCHcMioIbxBIQwhr+MlV5MqoDOO/eCW1qOV3/dnD+Lg8OV+Au+sD2VLCIUEEurba5KVXoxd@lists.infradead.org
X-Gm-Message-State: AOJu0YwQms6qld2vTge875gkOQJSM/pmKQcd3Ukl652yS/b3wGDgt9DX
	ZtYNvHz651c9RzKRHPC4pbBUbMC4iyQtGoKjCn2wHlF57o2+lE5jOuTVEHR532nRVpf4PMZmiVj
	UwTh+eoXXHXvZ9gcjEmu/kOr3SC5UEQo=
X-Gm-Gg: ATEYQzx1R+m2imu7ss2j0ccVZFifunJPDksHza+tuWmu8O63+Hy/RnWKLcohlrTMggn
	lW7saMl7XuDsagea3qGcleRXlW0zjTGTIiNHx/Wloa2lkUaD5onwAxXhY65bsgJG9V9azISO4Ra
	s4AaDpGMBWZR14xDi+jpJ740Ca3qdzDe+cKm8PfpCRkePx9EPXHQe3S1tkXgFWIpKagvbGkuJNp
	JsHVD9cuZiefoz8SoKhi2ZVT7tEh8+fKXapszBJ0M25qrZaXmoQgO1HDwMt6OIy+rqy7UPiMXH7
	Yjzn2Jgky8F1J7ej4h8=
X-Received: by 2002:a17:902:d508:b0:2a7:95d0:d77d with SMTP id
 d9443c01a7336-2ad7453d949mr77681755ad.30.1771846232419; Mon, 23 Feb 2026
 03:30:32 -0800 (PST)
MIME-Version: 1.0
References: <20260130-yv5_revise_dts-v4-0-4d924455f3a7@gmail.com>
 <20260130-yv5_revise_dts-v4-5-4d924455f3a7@gmail.com> <73c63bc2f5eaae2c931a4ced1462024bd5a24237.camel@codeconstruct.com.au>
In-Reply-To: <73c63bc2f5eaae2c931a4ced1462024bd5a24237.camel@codeconstruct.com.au>
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Mon, 23 Feb 2026 19:30:21 +0800
X-Gm-Features: AaiRm525snvy4mZcI-Gd7f7l6WX-PGaNQoSq0zz-Wk8sNwF6B9itjJFnA30z6ik
Message-ID: <CABh9gBfuacGFHqSFT-fvE78bx7Q9vZGYzz=4frP2MTM0J0yNWA@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] ARM: dts: aspeed: yosemite5: Correct power monitor
 shunt resistor
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Amithash Prasasd <amithash@meta.com>, 
	Kevin Tung <Kevin.Tung@quantatw.com>, Ken Chen <Ken.Chen@quantatw.com>, 
	Leo Yang <Leo-Yang@quantatw.com>, Jackson Liu <Jackson.Liu@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_033033_432630_A4FBF89C 
X-CRM114-Status: GOOD (  27.40  )
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

On Mon, Feb 9, 2026 at 2:21=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Kevin,
>
> On Fri, 2026-01-30 at 16:20 +0800, Kevin Tung wrote:
> > The shunt resistor value defined in the DTS was incorrect and did not
> > reflect the resistor value populated on the board. As a result, power
> > and current readings derived from this value were inaccurate.
>
> Okay, but how did it come to be incorrect in the devicetree? Was the
> documentation wrong and so someone entered the wrong value? Was the
> documentation correct but there was a misunderstanding? Did the
> hardware design change and the devicetree is now just inappropriate for
> your needs?
>
> Essentially, what's preventing this from happening again?
>

Hi Andrew,

The root cause is a hardware design change, which made the previous
devicetree configuration is inappropriate for our needs.
I have updated the commit message to reflect this.

The changes have been confirmed by our power team, verifying that the
power readings now match the latest hardware design.

> >
> > This change
> >
>
> I'd rather you rephrase this to avoid using "This change ...".
> Hopefully the commit message always refers to its change.
>
> Generally, please write in the imperative mood (see [1])
>
> [1]: https://docs.kernel.org/process/submitting-patches.html#describe-you=
r-changes
>

Updated commit message to use imperative mood, thanks for the reference.

Kevin

> > updates the DTS to use the correct shunt resistor value
> > according to the hardware design, restoring accurate power and current
> > measurements.
> >
> > Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
> > ---
> >  arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 14 ++++++=
+-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts=
 b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> > index 84d3731b17f7c7c87338672bbcc859de2b89b722..524597a81365ef10cd03b67=
d35eeb88a965cbe0a 100644
> > --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> > @@ -415,7 +415,7 @@ power-sensor@42 {
> >       power-monitor@43 {
> >               compatible =3D "lltc,ltc4287";
> >               reg =3D <0x43>;
> > -             shunt-resistor-micro-ohms =3D <250>;
> > +             shunt-resistor-micro-ohms =3D <100>;
> >       };
> >
> >       power-sensor@44 {
> > @@ -461,25 +461,25 @@ eeprom@57 {
> >       power-monitor@58 {
> >               compatible =3D "renesas,isl28022";
> >               reg =3D <0x58>;
> > -             shunt-resistor-micro-ohms =3D <1000>;
> > +             shunt-resistor-micro-ohms =3D <10000>;
> >       };
> >
> >       power-monitor@59 {
> >               compatible =3D "renesas,isl28022";
> >               reg =3D <0x59>;
> > -             shunt-resistor-micro-ohms =3D <1000>;
> > +             shunt-resistor-micro-ohms =3D <10000>;
> >       };
> >
> >       power-monitor@5a {
> >               compatible =3D "renesas,isl28022";
> >               reg =3D <0x5a>;
> > -             shunt-resistor-micro-ohms =3D <1000>;
> > +             shunt-resistor-micro-ohms =3D <10000>;
> >       };
> >
> >       power-monitor@5b {
> >               compatible =3D "renesas,isl28022";
> >               reg =3D <0x5b>;
> > -             shunt-resistor-micro-ohms =3D <1000>;
> > +             shunt-resistor-micro-ohms =3D <10000>;
> >       };
> >
> >       psu@5c {
> > @@ -723,13 +723,13 @@ gpio-expander@21 {
> >       power-sensor@40 {
> >               compatible =3D "ti,ina230";
> >               reg =3D <0x40>;
> > -             shunt-resistor =3D <2000>;
> > +             shunt-resistor =3D <1000>;
> >       };
> >
> >       power-sensor@41 {
> >               compatible =3D "ti,ina230";
> >               reg =3D <0x41>;
> > -             shunt-resistor =3D <2000>;
> > +             shunt-resistor =3D <1000>;
> >       };
> >
> >       power-sensor@42 {
>
> The way the commit message is written suggests it was just one shunt
> resistor, but that's clearly not the case.
>
> Andrew

