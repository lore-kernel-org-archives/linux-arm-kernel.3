Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E730D690FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 11:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kCOIQgnUZkO/jqB9Ex+fr3L9VJum5V2GDNk+XPGMgrg=; b=KyFK8Z3pI6uiizAv4DdwvKLXbr
	tIRfYh6PwJChB4YGmdPE3nFYKhKNTcSm5vNcN+RLKNVXsp6ybXBFeWGWG5qWm658J5mIIkWDK6TMX
	0tSLiY+lwWekRZWXisAFbvfJmshI/lTuZ9Md/jtqIYMxQGgFSKPIELcwZ58A6HOafLP+nkHDS/NxC
	st+1U/GR5tFarP0WqNwTZmQt+D8kZzw9adEE5kQkMs1/H/fshq+5LB76RrRnG1+PF6IHNY4Loffyy
	mK5cYNjwGhcHb/eEIuo5NIKzjiZBfFSROG2zdMW1EAxy/k/twHjH34jjH98Ji6O+/WpPlNJvUm+Ia
	ukFbbQ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGcoz-0000000FN4S-446l;
	Thu, 28 Nov 2024 11:36:33 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGco0-0000000FMzA-1IZc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 11:35:34 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4349fd77b33so6314585e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 03:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732793730; x=1733398530; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kCOIQgnUZkO/jqB9Ex+fr3L9VJum5V2GDNk+XPGMgrg=;
        b=Dgiej63pUJOvF0HhqDrZM/S34qpbtPz/TaXdyiY1vZ4LxJwrTD9+8WpCvZBg629JdA
         WtL62KNlZuOiNmiCu6VFc+Ldc2IUmxTTksyd0Jn4hmqbu1Km5GxjwuPl0J23LLONOvNG
         LBCCDpyIRcoDPLlbzAg7/IAQcCDedg3mHabCTvy2bnsTH/LnQ+vxau1xrjOjgNZF0g4M
         LevlyGz7woq6uKFQlBGqeCcA+BQoJ8vvj3zKSwe3EE2qVQ/CiTbuiJIVxXNScKZ2fBwm
         IY8cRc50Mlj6T1faXiD98QikuoHZiteKPdDBH1gW0Wm6Ryk1s0NigkqS0V1uRzWyG5b4
         2wEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732793730; x=1733398530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCOIQgnUZkO/jqB9Ex+fr3L9VJum5V2GDNk+XPGMgrg=;
        b=qga8UrSG8+R2P8Kij+dEgDXa9gv4oWJQjK/WXDCOAqSX+dB3sBGyczi/mAA5bwIkpJ
         PldhTZyXwHKWnDKpMP5QmMZpLy8zUlKs50uKIA6hhBO8F/fAUO17RY28Gx2vKWlmSUfx
         5pQ80qWAKhxNXYp85WpouoUAd4Ba6mutH3kOzaIAidz6VoZcPxubXHwZ4xYziodGuqXg
         znPfCH0xeDRVgsGPRKC6RXeQ+VMXBcZ6lszF5Auv2bACEBs509A0TdqWjI29Z46kModn
         zJAVx9i1bODCtVGBascYd/10/i+n8LsOWvFru/mO98qcTzxBNi2aK43o9AwqrLB0uR0Y
         pR7w==
X-Forwarded-Encrypted: i=1; AJvYcCWUav89BDKtxiuAcXgMk7ILuki1oiBbbqZm4KlSLNmpln1LOQr6eOZWqEh10/RJJRk43o5eg3qaLlXwFReb4X4E@lists.infradead.org
X-Gm-Message-State: AOJu0YwnLYHeq5xsm1hQC4w00QF4xrftRcho3nU7FKmxXI7VHKIoDrOm
	X7n+HsV9A4yFfaK9vudd/bmcIc4o5hbBuWelRl7Ki0eW6SVq7EmizMtKvcFMPZM=
X-Gm-Gg: ASbGncvySzO214I7w+GD/weytNabTSiPihyV4cr+RmbwTThn2RVmA5Y5/6aSmWuYU63
	EFHgbNpU7RW7+OW1SCUPh6Jp5pV3d04u0Phz1cnw3PFE+6CufH4c1xVYCLv3EoJSgokhHSlkySd
	HoKjKjcJgc7qlEKyDyEfZcYrccnNh4M2SySSIcQzGUvaee8Dp8W6QC7QDlgimMxWFAFq6ELbmWj
	P/iruwz+TqCDIg6TeV8Z0xeC+EnHE8VaLV7kKDRIlz+fXNqoX7SOAY=
X-Google-Smtp-Source: AGHT+IG/QGzHxGJz0klm9sFCiR3LVKh0jcQoJ6xPyeZV35wmMo8bYcQe6yA7O0WiSbRm+oZHxykDMw==
X-Received: by 2002:a05:600c:1c81:b0:434:9936:c828 with SMTP id 5b1f17b1804b1-434a9dc3db3mr63654675e9.12.1732793730439;
        Thu, 28 Nov 2024 03:35:30 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7e5b9csm50520155e9.43.2024.11.28.03.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 03:35:29 -0800 (PST)
Date: Thu, 28 Nov 2024 12:35:27 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh@kernel.org>, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Thierry Reding <thierry.reding@gmail.com>, 
	"open list:PWM SUBSYSTEM" <linux-pwm@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, justin.chen@broadcom.com, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pwm: brcm,bcm7038: Document the
 'open-drain' property
Message-ID: <7hdopmy4owoletyq274c2hzxtm7xuxaejakwlas477ax2tfzcu@yrbcxxup5krz>
References: <20241012025603.1644451-1-florian.fainelli@broadcom.com>
 <20241012025603.1644451-2-florian.fainelli@broadcom.com>
 <20241015163200.GA1220909-robh@kernel.org>
 <252b6f39-3b06-43b7-b227-1c29c1c12bd5@gmail.com>
 <7aok7zs7whxfg3bhv7koxfxq6qhgv34b7kg3mh526z2cf7e23l@ffbsxqdqjis3>
 <c623075c-fd80-4312-90ba-4f8a3c3f56f9@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pdxu4r3m4vrnf4px"
Content-Disposition: inline
In-Reply-To: <c623075c-fd80-4312-90ba-4f8a3c3f56f9@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_033532_617389_C036E6E3 
X-CRM114-Status: GOOD (  32.82  )
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


--pdxu4r3m4vrnf4px
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] dt-bindings: pwm: brcm,bcm7038: Document the
 'open-drain' property
MIME-Version: 1.0

Hello Florian,

[adding Linus and linux-gpio to Cc:]

On Tue, Oct 29, 2024 at 09:03:57AM -0700, Florian Fainelli wrote:
> On 10/29/24 03:44, Uwe Kleine-K=F6nig wrote:
> > On Tue, Oct 15, 2024 at 10:07:10AM -0700, Florian Fainelli wrote:
> > > On 10/15/24 09:32, Rob Herring wrote:
> > > > Another thing to consider is for any PWM controller with more than
> > > > 1 output, you might want this to be per output and therefore should=
 be
> > > > a flag in the cells.
> > >=20
> > > Yes, that is a good point, this controller has two channels, so it se=
ems
> > > like increasing the #pwm-cells might be the way to go.
> >=20
> > So the idea is something like:
> >=20
> > diff --git a/include/dt-bindings/pwm/pwm.h b/include/dt-bindings/pwm/pw=
m.h
> > index ab9a077e3c7d..d18b006a7399 100644
> > --- a/include/dt-bindings/pwm/pwm.h
> > +++ b/include/dt-bindings/pwm/pwm.h
> > @@ -11,5 +11,6 @@
> >   #define _DT_BINDINGS_PWM_PWM_H
> >   #define PWM_POLARITY_INVERTED			(1 << 0)
> > +#define PWM_OUTPUT_OPEN_DRAIN			(1 << 1)
> >   #endif
> >=20
> > and then add support for that to the core and drivers? There is some
> > intersection with pinctrl (depending on hardware). I wonder if
> > abstracting this somehow using the typical pinctrl properties would be a
> > saner option??
>=20
> But what if the pin is not managed by a pinctrl provider?

Then create one? If that's the PWM itself that is the pinctrl device it
would look as follows:

	pwm@f0408000 {
		compatible =3D "brcm,bcm7038-pwm";
		pinctrl-0 =3D <&pwm_pins>;
		reg =3D <0xf0408000 0x28>;
		#pwm-cells =3D <2>;
		#pinctrl-cells =3D <0>;
		clocks =3D <&upg_fixed>;
	=09
		pinctrl {
			pwm_pins: pwm-pins {
				pins =3D "A", "B";
				drive-open-drain;
			};
		};
	};

Maybe this is difficult if there is a pinctrl that configures the output
as "PWM" and then there is that additional register in the PWM IP to
make this pin open drain? One could just use

	pinctrl-0 =3D <&pwm_pins>, <&system_pinctrl_pwm>;

then. Not entirely sure this is overengineered, but the dt
representation would be nice (IMHO). Thoughts?

> I have started
> going the route of implementing the PWM_OUTPUT_OPEN_DRAIN bit as an
> additional specifier in the #pwm-cells, but I am not sure to what extent
> this should be allowed to be changed at runtime.

I would not expect that the open-drainness needs to change at runtime.

Best regards
Uwe

--pdxu4r3m4vrnf4px
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdIVXwACgkQj4D7WH0S
/k6l6wgAgyzQfpcTmTaXfhmcQgO0kIruIbqxl2BdNvTxhqNU/I5oBRJJuMYj1SUe
9pnH4y0xPYoJvxdl4eWLPeciRP7AUPs/Q1zNpNiPUl74qBx3AvtNZC/7qnpZyxCQ
oRfEvy2HXuKjl55nzB6Luj/iKD6hMjoK2jB0w/zz61YAELUzm2j3i3HItQbFZ06W
2DIrXEybGNkNmru7ii2Wy3Yg0EsOxZucprF1DwUHAoCNMW8hOX3uWm2y6gEugeoe
vPE9Wfh2WspzKNDeNHqi/P02u+YBqzEmEd5gJCqHvgCFxr0DTJnpItxTJ0FP6kot
LkRkktFKEOszoHombSsUnCUz8Gj99Q==
=hSKz
-----END PGP SIGNATURE-----

--pdxu4r3m4vrnf4px--

