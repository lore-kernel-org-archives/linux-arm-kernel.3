Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDA6CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 18:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1ZV9nZygGnfTY3gzTQ20v7qVV4L/qPQ7i1daiPe7xg=; b=vbEMugONLYhc3JuZTxg7ISIYno
	UuOML1e8fFgdjCm+TCzNlVqE4NrySKM4Ed98Hyttxc3nOUBAH+J4J+YtK5xtBMRNngwYjQ0+Mzzt/
	l6CTrolSEUilWb7KNJfvG5rIW5kev64qKTIhrkpn35lGqbuzgDLbVaEm9mz/8jGi8QNdwlkGKCpTW
	34noJcPJEn1vEzUJ0DdNHKREuuOrY2Fq6edANb/VIAqJb00twv3OijXnjQgP8pQEMfnzMPwjbeNgq
	SQZODAweV2Ux5tpu/UHYvrK2uRqH9E/mea3VHZsrpZAlWEKayyqK3jdJTgv8KLWL9CVYvjJITSU2F
	N+1PRIbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo4S3-00000008JcG-3YA3;
	Mon, 18 Aug 2025 18:19:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3ch-000000087z9-24gD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 17:26:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 78F5B601F5;
	Mon, 18 Aug 2025 17:26:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81BF1C4CEEB;
	Mon, 18 Aug 2025 17:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755537977;
	bh=DZrc/xQQUWAtQWUj/brEuNkoWNjVTqKwijAmut0IFhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GdcHkq8U2vePf1ul4rUZw+E1iugmay9QuWid9xt5WPfUUR+stb773TL5sstXPlObC
	 aOWFscgzDsgE/x5vJRAdiLmtyX2Se2whC9d8IpXeDWF3mWzk2ZGGgrWAj4AKS9wE9A
	 l50YL3pRSjGlT+UT/pM/pagzyQHw22HSccJiFtQYt3wf+pFYF+J5Z6GjUJKlH3TSpG
	 lW6I8xTTilElClsWnFIjUEdpI0Nz/IAAbrPNpSHSPudapN6iAFyC6tDODXf603C6O/
	 5TJ8bLA68mmF+ZFQWM/gZPx79lzRrnYXpddCcJD6LgP8mHvDpDvZ2o9gfb2/gNy5yS
	 pHlC7dFPRfjHA==
Date: Mon, 18 Aug 2025 18:26:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/5] soc: fsl: qe: Add support of IRQ in QE GPIO
Message-ID: <20250818-angelfish-jasmine-f48d257a4949@spud>
References: <cover.1755506608.git.christophe.leroy@csgroup.eu>
 <cddc5e900b84826614a63b8b29a048c09dd20853.1755506608.git.christophe.leroy@csgroup.eu>
 <20250818-tyke-pungent-20d9ffd47ecc@spud>
 <732b5fb6-ec38-43d9-b544-b27802a844ab@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="srp7PXp30YhJAiJF"
Content-Disposition: inline
In-Reply-To: <732b5fb6-ec38-43d9-b544-b27802a844ab@csgroup.eu>
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


--srp7PXp30YhJAiJF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 07:08:47PM +0200, Christophe Leroy wrote:
>=20
>=20
> Le 18/08/2025 =E0 19:03, Conor Dooley a =E9crit=A0:
> > On Mon, Aug 18, 2025 at 10:45:57AM +0200, Christophe Leroy wrote:
> > > In the QE, a few GPIOs are IRQ capable. Similarly to
> > > commit 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx
> > > GPIO"), add IRQ support to QE GPIO.
> > >=20
> > > Add property 'fsl,qe-gpio-irq-mask' similar to
> > > 'fsl,cpm1-gpio-irq-mask' that define which of the GPIOs have IRQs.
> > >=20
> > > Here is an exemple for port B of mpc8323 which has IRQs for
> > > GPIOs PB7, PB9, PB25 and PB27.
> > >=20
> > > 	qe_pio_b: gpio-controller@1418 {
> > > 		#gpio-cells =3D <2>;
> > > 		compatible =3D "fsl,mpc8323-qe-pario-bank";
> > > 		reg =3D <0x1418 0x18>;
> > > 		interrupts =3D <4 5 6 7>;
> > > 		fsl,qe-gpio-irq-mask =3D <0x01400050>;
> > > 		interrupt-parent =3D <&qepic>;
> > > 		gpio-controller;
> > > 	};
> > >=20
> > > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > > ---
> > > v2: Document fsl,qe-gpio-irq-mask
> > > ---
> > >   .../bindings/soc/fsl/cpm_qe/qe/par_io.txt     | 19 ++++++++++++++++=
++
> > >   drivers/soc/fsl/qe/gpio.c                     | 20 ++++++++++++++++=
+++
> > >   2 files changed, 39 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_=
io.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
> > > index 09b1b05fa677..9cd6e5ac2a7b 100644
> > > --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
> > > +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
> > > @@ -32,6 +32,15 @@ Required properties:
> > >     "fsl,mpc8323-qe-pario-bank".
> > >   - reg : offset to the register set and its length.
> > >   - gpio-controller : node to identify gpio controllers.
> > > +Optional properties:
> > > +- fsl,qe-gpio-irq-mask : For banks having interrupt capability this =
item tells
> > > +  which ports have an associated interrupt (ports are listed in the =
same order
> > > +  QE ports registers)
> > > +- interrupts : This property provides the list of interrupt for each=
 GPIO having
> > > +  one as described by the fsl,cpm1-gpio-irq-mask property. There sho=
uld be as
> > > +  many interrupts as number of ones in the mask property. The first =
interrupt in
> > > +  the list corresponds to the most significant bit of the mask.
> > > +- interrupt-parent : Parent for the above interrupt property.
> > >   Example:
> > >   	qe_pio_a: gpio-controller@1400 {
> > > @@ -42,6 +51,16 @@ Example:
> > >   		gpio-controller;
> > >   	  };
> > > +	qe_pio_b: gpio-controller@1418 {
> > > +		#gpio-cells =3D <2>;
> > > +		compatible =3D "fsl,mpc8323-qe-pario-bank";
> > > +		reg =3D <0x1418 0x18>;
> > > +		interrupts =3D <4 5 6 7>;
> > > +		fsl,qe-gpio-irq-mask =3D <0x01400050>;
> > > +		interrupt-parent =3D <&qepic>;
> > > +		gpio-controller;
> > > +	  };
> > > +
> > >   	qe_pio_e: gpio-controller@1460 {
> > >   		#gpio-cells =3D <2>;
> > >   		compatible =3D "fsl,mpc8360-qe-pario-bank",
> >=20
> > Why is there a binding change hiding in here alongside a driver one?
>=20
> I did the same way as commit 726bd223105c ("powerpc/8xx: Adding support of
> IRQ in MPC8xx GPIO")
>=20
> Should it be done differently ?

Yes, binding changes should not be in with driver changes. Surprised
that checkpatch didn't complain. That commit you mention seems to have
been like 10 years ago and without dt-binding maintainer review so not
the best thing to use as a basis.
Additionally, Rob may require you to covert to yaml to add new
properties, I forget if that is a requirement or not.

--srp7PXp30YhJAiJF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKNiNQAKCRB4tDGHoIJi
0qKaAP9vS6SisYRcuo6AMAuGe0ztZz+fC4G1/xIXwq8AALY87gD+LY0HpnxB3XP5
3lW31jMJdflZV5qlHjVzpy2H1FJmRQU=
=zKiO
-----END PGP SIGNATURE-----

--srp7PXp30YhJAiJF--

