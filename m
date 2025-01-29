Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9F3C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 12:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZtvWH9HC9OXDQ65y8F2rGn9Z9fITteRdJfb1FXGtdWU=; b=JoL3XmiCnNnuQZZdfpTdHy6Ctr
	LqRGffq+4KU/knEC/CAz3OJtN1TEKDB1nihk+lpDx8116YJtApEa2EDJmfEW6vm0T53HxZIxiuyrF
	W3m1PT46GpUCBhf3yB9XesPZDLatYkFpVDM5jXoVFXnQuBNeaS+8gH2zQz325juRW9hOZo0WbSd94
	bgA60eRaVVYt25O2SJWNhv/I/Tu7VEAV8zzsL4Ds6kqbKJltJrzrBwnisi64O4Mg5r5a3/ryDmTiP
	I+QqeKrQiBX5JnBsvewTm/nH9AE7NpTtwUy3m7ESgPXzgcZK1zS1XjBbX8Libk+/bJQ08bmJrjSXa
	bE6SHsGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td73n-00000006vJP-09pU;
	Wed, 29 Jan 2025 12:20:47 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td72S-00000006vGi-21NU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 12:19:26 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so68922755e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 04:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738153163; x=1738757963; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtvWH9HC9OXDQ65y8F2rGn9Z9fITteRdJfb1FXGtdWU=;
        b=xKzabBlu2yVPYYPymu0Obf2CzTly7mXUFd6gIdqrOMiP1sVjmfoVlXmyQHqx0UpHXc
         Ewhex+o73Ty5EKa5k0o23n9q0zNH5BS8GNJiW4T7IntQKwN9SqyUHgXtKOAl08vvg3Lc
         CkD+NQ1npZY1I2QkZXDm5RNx/0TITOKv31ov6+75oBrb8bb5PeELgefoUgfvPpROMRUt
         rx8HiZj9z8iV6GfvE8s9m9GR7ttfHEbBOrKNNcinEDpyWhyamAkdGWyuejHnfobkJ3tH
         WiSvx/anBeqxQKElpEyg9SRW91NNOlCKnuvECiB2XqmXdrCxeU4+amP80K9pn2owdsy5
         4/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738153163; x=1738757963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtvWH9HC9OXDQ65y8F2rGn9Z9fITteRdJfb1FXGtdWU=;
        b=s3hk6tJtW/4aeXjuSKRjRoRSSn+2iYltdRH9VFanbwwDW50z3L2c+nnsGKanUgRkTc
         ciPUorQa/LBZ1teNiQxMVa++3xoFmkttKaxdGHrMnPsXgw2OqpKzgcX9S8Q6W15yfW98
         pHN/OdbuSoh6D9/T8YL8pkD7U+BYgueGPMJJP7Rv2O12QGpYKzd088GEfhvunks0o42v
         NUST9a9WD4nL61y/9megvK6WxXv2M3fUM8WPZzhDsD+1b5gUVzSVdX0voCay2QJrCmJG
         6HjRcKM81OKVqVYqtUsbZJq2TR4r1FowmSfrdqGqTPHEs89B4iL4xV7ZYuJSkc7v2QOg
         cGeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFpfhXdveKx63OI0Sx023klY93R9rSy0lXaTIBl7/pt+62RpmMgxaKWIkQCPURvKYrkV80kSA9kgOGIad7sbBr@lists.infradead.org
X-Gm-Message-State: AOJu0YyPxS4JcKSV/nqdvfDdtbpOiX+UWUoOsubL8GohXP3F9UYQvdof
	lGm3FlBIFGrRQgAPVCjASuUZ2amQiZ4Y/anKScSBcRNhqjAGVHGKgE5V7RRObGQ=
X-Gm-Gg: ASbGncsI/8gIoXiGj3epEIfsQ6t1QdUbI6FWTvyDun/V0Gfum61pXWPtw+XavoFM0Sp
	RrOtYwcHIFTesTU6L8tuDDxup6paVwoO4UYtJf7r5qI6dyVvg5P0XHXoZWHos540wxPkVZAfp3l
	MPOwmpQHoNr4vaYDLrGLsAmlFh7fX4s6DjBCrj9TaAZu644kqk0ySUNXmRUFu2E326KHxcmZ6Fa
	nww+uAEHbhHGMpfVY/zdJ5tk3WUktbwjPu9n3jC8D6pftaxBJcGvob+BpEfFWLokD17CTU0Bh46
	7h0ZrzdT+fUJZ6GyIKSC
X-Google-Smtp-Source: AGHT+IGzeAyPLZ8WQK55a3c3lcJIJbPq40PvGcUxEiWYC63E3vM5o2mCyMTe5m/vY93V44472PKnng==
X-Received: by 2002:a05:600c:1c1e:b0:432:7c08:d0ff with SMTP id 5b1f17b1804b1-438dc40b8e6mr23385775e9.23.1738153162909;
        Wed, 29 Jan 2025 04:19:22 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1885besm16640570f8f.49.2025.01.29.04.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 04:19:22 -0800 (PST)
Date: Wed, 29 Jan 2025 13:19:20 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RESEND PATCH] ARM: dts: socfpga: Add basic support for
 Terrasic's de10-nano
Message-ID: <kxdipj2oktcyivl7o7mtyyacqm437jm7dpjihi7e7hcrmll6xb@5dywwnt5wpz5>
References: <20250128172917.4565-2-u.kleine-koenig@baylibre.com>
 <fa163bab-1461-479d-b149-4e018935ac57@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="74nv2pfs7afedfib"
Content-Disposition: inline
In-Reply-To: <fa163bab-1461-479d-b149-4e018935ac57@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_041924_789111_4F27476D 
X-CRM114-Status: GOOD (  32.34  )
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


--74nv2pfs7afedfib
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RESEND PATCH] ARM: dts: socfpga: Add basic support for
 Terrasic's de10-nano
MIME-Version: 1.0

Hello Krzysztof,

On Wed, Jan 29, 2025 at 10:27:22AM +0100, Krzysztof Kozlowski wrote:
> On 28/01/2025 18:29, Uwe Kleine-K=F6nig wrote:
> > This dts is enough to make the board boot to Linux with the rootfs on
> > a micro SD card.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> > ---
> > diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.=
dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dts
> > new file mode 100644
> > index 000000000000..d1f23a57a94d
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dts
> > @@ -0,0 +1,90 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright (C) 2017, Intel Corporation
> > + *
> > + * based on socfpga_cyclone5_de0_nano_soc.dts
> > + */
> > +/dts-v1/;
> > +
> > +#include "socfpga_cyclone5.dtsi"
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +/ {
> > +	model =3D "Terasic DE10-Nano";
> > +	compatible =3D "altr,socfpga-cyclone5", "altr,socfpga";
>=20
> Incorrect compatible. It's not cyclone5 board. cyclone5 is the SoC.

OK, adding "terasic,de10-nano".

> There is no altr,socfpga

What does that mean?
`git grep \"altr,socfpga\" linus/master:arch/arm/boot` gives me 15
matches from other boards with socfpga SoCs. If you give me a bit more
verbose description for the problem you're pointing out here, I can work
on that.

> This wasn't ever tested with bindings.

I tried

	dt-validate -m -u Documentation/devicetree/bindings -p ~/work/kbuild/arm/D=
ocumentation/devicetree/bindings/processed-schema.json ~/work/kbuild/arm/ar=
ch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb

which emitted a bunch of warnings and after processing some of them I
gave up because they were all triggered by the soc.dtsi file. I started
another try comparing the output for "my" socfpga_cyclone5_de10nano.dts
with one for a file that only has the includes and the machine
compatible. (Which generates 124 lines and 123 lines respectively.)

I'll work on the diff between the two for the next revision. Or would
you recommend a different approach?

> > +	chosen {
> > +		stdout-path =3D "serial0:115200n8";
> > +	};
> > +
> > +	memory@0 {
> > +		/* 1 GiB */
> > +		device_type =3D "memory";
> > +		reg =3D <0x0 0x40000000>;
> > +	};
> > +
> > +	soc {
> > +		fpga_axi: axi_h2f_lw_bridge@ff200000 {
>=20
> Follow DTS coding style. You just sent us something from downstream.

Indeed this is from downstream. Looking at the matching dt-validate
output I guess just "axi@ff200000" would be appropriate?!

> > +			compatible =3D "simple-bus";
> > +			reg =3D <0xff200000 0x00200000>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <1>;
>=20
> ranges would be after reg, but they are pointless here, no?

I thought it's "compatible", "reg" at the start, "status" at the end and
the rest in-between in alphabetic order. What is the right ordering?

> Where is the child?

I intend to add children using dt-overlays. I have a prototype here, but
that's still to embarrassing to show.

> > +			ranges =3D <0x00000000 0xff200000 0x00200000>;
> > +		};
> > +	};
> > +};
> > +
> > [...]
> > +&i2c0 {
> > +	clock-frequency =3D <100000>;
> > +	status =3D "okay";
> > +
> > +	accelerometer@53 {
> > +		compatible =3D "adi,adxl34x";
>=20
> There is no such compatible and nothing in changelog refers to missing
> bindings. Always provide link in the changelog to your bindings which
> were not yet accepted.

Oops, indeed. Will make this "adi,adxl345" for the next revision.

Best regards and thanks for your feedback,
Uwe

--74nv2pfs7afedfib
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmeaHMUACgkQj4D7WH0S
/k4neQgAhA5FLBYQHlx07nMFPjvos5FLp0wia0tuofrfRhOPWcZJZtOaLfsRezcU
QADPwe2v3s4cBpIq4jluxRi1dSHWuBgDRDcxkPIgb8I67nrqWW4AuiyrhA9ZitMz
l+DM8xGCLfq+N4vjWMzxdmemllF8GDPqo46+fcbF5mYz+zWpgNGEK1th1pJle/BM
IEZZduRSP/UoekI8MOOdIx5q5qRVut/NSPl7qfdfKgMpYiee9/EDnS/QcCWySNrt
v0gZuB/4oCWILu6eqknUjqVhHPJ/a83FseoBRk4ixbLpwo5N7U5s1Fi2XDm2FUS2
yLLTigcLZUU0s0/z6k/Lz+ziDqfspQ==
=nlqC
-----END PGP SIGNATURE-----

--74nv2pfs7afedfib--

