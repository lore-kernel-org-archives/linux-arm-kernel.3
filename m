Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A5010AB802
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 18:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WD0AeOTQLa5ExLj+/LeYzJh06gq7dlhQ4RqtQv5vT8=; b=abwqMYFqnkjvPYGICyQPjbKkUC
	6nkbXAhMQCGsD4j9VY9XKtvBQsspi8pNWEU1Hurn9VUvdW5jEq0N9RMjdDLrqegUnyqJNjKFoVUI5
	WeTtA+5lbVrjKnYwDTf/x9JrrCYWjaaWu0PWwByvFcWKs4N8UAPrXHC9/DC0x5RelU8iuuwBH5XMa
	v736hthdQGqdrbMrAGPZqXJk94INl6v9ojb97R9uodihe7dQcwBj2cEciV8HpwzkCfK5JsoigwrlM
	nH5oj8Guam8PXdqw5x4726KRMTZvVb1f7gMk3SmAOM9Nue0j9bS9WpPTA1eRei/yBBx/IQkiNEl5D
	n02NpE8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5prJ-000000064Sk-21e8;
	Thu, 26 Mar 2026 18:55:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5prH-000000064SF-1FLZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 18:55:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 76BA644593;
	Thu, 26 Mar 2026 18:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68955C2BCB4;
	Thu, 26 Mar 2026 18:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774551306;
	bh=/20vy7mkXZdNsQUe9UU7hz+oDH36c9Dx6GRPFYTupu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VdEC1pp0gNuXrBleDHGi/gcvUBCDBIRB7OlugjHpLC5cdgWnYZuhfDDURLhczn4le
	 ufIVCPnmARX9SBN+2CC7Vy9VZ0PolpAYbGmBmdXqHi+b8m35KdZ6H38zeK4MlpauSK
	 rmnt0YKKQAlWSkIOFlPCTOVT1rQGqQlr4wzUxq5sXKGCrvvvy1XjHAqVq0cNM7rFeZ
	 jGLDkfjN/TWS9KxnDeVaWtNEkPzdnyAvnJ9BusHhZo7Vj5hu5KBc0OVdxHII/jYLhJ
	 IWhE0gr8XZ0iAJxd77bDTRASl+rlILfbuDg/vIa19wdBcaMZjoLMcXF91i1i1zgWWf
	 gHf88kUB6DrJQ==
Date: Thu, 26 Mar 2026 18:55:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Haibo Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH v4 3/7] pinctrl: extract pinctrl_generic_to_map() from
 pinctrl_generic_pins_function_dt_node_to_map()
Message-ID: <20260326-poncho-expanse-d30a9eded8e2@spud>
References: <20260325-pinctrl-mux-v4-0-043c2c82e623@nxp.com>
 <20260325-pinctrl-mux-v4-3-043c2c82e623@nxp.com>
 <20260326-concur-eel-3e0b3d91e00a@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bdrvhubYCtkQ5gtU"
Content-Disposition: inline
In-Reply-To: <20260326-concur-eel-3e0b3d91e00a@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_115507_391064_857186B8 
X-CRM114-Status: GOOD (  26.21  )
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


--bdrvhubYCtkQ5gtU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 06:52:12PM +0000, Conor Dooley wrote:
> On Wed, Mar 25, 2026 at 07:04:12PM -0400, Frank Li wrote:
>=20
> > diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pinctr=
l-generic.c
> > index efb39c6a670331775855efdc8566102b5c6202ef..20a216ae63e91b69985ea4c=
fcd0b57103c6ca950 100644
> > --- a/drivers/pinctrl/pinctrl-generic.c
> > +++ b/drivers/pinctrl/pinctrl-generic.c
> > @@ -17,29 +17,18 @@
> >  #include "pinctrl-utils.h"
> >  #include "pinmux.h"
> > =20
> > -static int pinctrl_generic_pins_function_dt_subnode_to_map(struct pinc=
trl_dev *pctldev,
>=20
> > +int
> > +pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node=
 *parent,
>=20
> Can you drop this stylistic change please? The=20

Whoops, cut myself off. To be clear, what I am asking for is to keep the
"int" etc on the same line as the function name. This function is new,
but you did it for the existing function too and the comparison is here.

>=20
> > +		       struct device_node *np, struct pinctrl_map **maps,
> > +		       unsigned int *num_maps, unsigned int *num_reserved_maps,
> > +		       const char **group_names, unsigned int ngroups,
> > +		       const char **functions, unsigned int *pins)
> >  {
> >  	struct device *dev =3D pctldev->dev;
> > -	const char **functions;
> > +	int npins, ret, reserve =3D 1;
> > +	unsigned int num_configs;
> >  	const char *group_name;
> >  	unsigned long *configs;
> > -	unsigned int num_configs, pin, *pins;
> > -	int npins, ret, reserve =3D 1;
> > -
> > -	npins =3D of_property_count_u32_elems(np, "pins");
> > -
> > -	if (npins < 1) {
> > -		dev_err(dev, "invalid pinctrl group %pOFn.%pOFn %d\n",
> > -			parent, np, npins);
> > -		return npins;
> > -	}
> > =20
> >  	group_name =3D devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn", parent,=
 np);
> >  	if (!group_name)
> > @@ -51,22 +40,6 @@ static int pinctrl_generic_pins_function_dt_subnode_=
to_map(struct pinctrl_dev *p
> >  	if (!pins)
> >  		return -ENOMEM;
>=20
> This looks suspect. You've left the pins allocation behind:
> 	pins =3D devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
> 	if (!pins)
> 		return -ENOMEM;
> but pinctrl_generic_pins_function_dt_subnode_to_map() has already
> populated this array before calling the function.
>=20
> Also, this should probably be
> Suggested-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Cheers,
> Conor.
>=20
> > =20
> > -	functions =3D devm_kcalloc(dev, npins, sizeof(*functions), GFP_KERNEL=
);
> > -	if (!functions)
> > -		return -ENOMEM;
> > -
> > -	for (int i =3D 0; i < npins; i++) {
> > -		ret =3D of_property_read_u32_index(np, "pins", i, &pin);
> > -		if (ret)
> > -			return ret;
> > -
> > -		pins[i] =3D pin;
> > -
> > -		ret =3D of_property_read_string(np, "function", &functions[i]);
> > -		if (ret)
> > -			return ret;
> > -	}
> > -
> >  	ret =3D pinctrl_utils_reserve_map(pctldev, maps, num_reserved_maps, n=
um_maps, reserve);
> >  	if (ret)
> >  		return ret;
> > @@ -103,6 +76,54 @@ static int pinctrl_generic_pins_function_dt_subnode=
_to_map(struct pinctrl_dev *p
> >  	return 0;
> >  };
> > =20
> > +static int
> > +pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctrl_dev *pc=
tldev,
> > +						struct device_node *parent,
> > +						struct device_node *np,
> > +						struct pinctrl_map **maps,
> > +						unsigned int *num_maps,
> > +						unsigned int *num_reserved_maps,
> > +						const char **group_names,
> > +						unsigned int ngroups)
> > +{
> > +	struct device *dev =3D pctldev->dev;
> > +	unsigned int pin, *pins;
> > +	const char **functions;
> > +	int npins, ret;
> > +
> > +	npins =3D of_property_count_u32_elems(np, "pins");
> > +
> > +	if (npins < 1) {
> > +		dev_err(dev, "invalid pinctrl group %pOFn.%pOFn %d\n",
> > +			parent, np, npins);
> > +		return npins;
> > +	}
> > +
> > +	pins =3D devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
> > +	if (!pins)
> > +		return -ENOMEM;
> > +
> > +	functions =3D devm_kcalloc(dev, npins, sizeof(*functions), GFP_KERNEL=
);
> > +	if (!functions)
> > +		return -ENOMEM;
> > +
> > +	for (int i =3D 0; i < npins; i++) {
> > +		ret =3D of_property_read_u32_index(np, "pins", i, &pin);
> > +		if (ret)
> > +			return ret;
> > +
> > +		pins[i] =3D pin;
> > +
> > +		ret =3D of_property_read_string(np, "function", &functions[i]);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return pinctrl_generic_to_map(pctldev, parent, np, maps, num_maps,
> > +				      num_reserved_maps, group_names, ngroups,
> > +				      functions, pins);
> > +}
> > +
> >  /*
> >   * For platforms that do not define groups or functions in the driver,=
 but
> >   * instead use the devicetree to describe them. This function will, un=
like
> >=20
> > --=20
> > 2.43.0
> >=20



--bdrvhubYCtkQ5gtU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacWBBQAKCRB4tDGHoIJi
0g0VAQDhYVisZEV26nl2hUahv0HDUAfeNj10VyO6jOb4tFJkqQD9GVos7vS63Q9O
c1ZR6hyLIo8RH4ETmjEnkrFbYXEzag4=
=hRAx
-----END PGP SIGNATURE-----

--bdrvhubYCtkQ5gtU--

