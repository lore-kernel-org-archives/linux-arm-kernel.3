Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D653610AB82D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 00:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dhe/phj6nhYAGVqEl8iisg1Q2ajIFeMxbzoVVk57pNA=; b=wDMcC5qO7A87spMLC/XhbSIai9
	pN+cRiebKhgEKt6FySSoCZUxpk7WZpc/T0/Qk7MY2M6czmwreZr1ohCnGp1fu//NT39liCcx8V0PI
	ZvzEIGpRBwyne/7bucZLTBD4AjFTbGd93Bpd3W1Z3m4hFDhPymVGQe+aldU76KBasLnPmiMIfD/Dg
	pAM7vpa0PXxkM9jpnwZk/h3qidi2QQQcsA+xfi/zG4DzbFSI4lF+pytrQTVOVxEJz4DIMUZXl3dYE
	WQ+3ZCNnBFuBBCtYKuQQAGBHmqlxWM0VSvtd+fq0kT7a9o/pWtX4SPx+bBFpvG8pC6h4hDEX17VzT
	7DTBfiXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5uj2-00000006Q2a-0zlV;
	Fri, 27 Mar 2026 00:06:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5uj0-00000006Q2S-2Syi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 00:06:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8556160097;
	Fri, 27 Mar 2026 00:06:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43046C116C6;
	Fri, 27 Mar 2026 00:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774570012;
	bh=ImIPmx6AnEDb6/60dXKqr0SMF6qzc2/4ui0g+5wcem4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mLPv43BOud1czIw27DXQ3ERM9udF260XoPVxHF9ZsVaSyLYWOvzSbREpF1lS+rVKv
	 Z5ZeX6NUFu5okvgMOKRebWjk4TY8r3FcT51nyN7Zy1rWz4xt55JbnkP2E5K+izHTCJ
	 rgqqfxZCuxGS3BEGQ+mKWgzDX32VVoW/caqNfbvWDbtZRiaSmlVX3Ap1e/Eo0oXhX2
	 e2Pni65CdQ7bvJZYSBMzsUO1t0cEUu2Sc2veQwAu094GbUjrbx48AYJOgS7r2m1FTx
	 SSrH+trAwyFpNVRriXx8X2R42k5JJy6PqMkx90q2Bsp1UhOqyOX+z0bN1bP7XHlGrO
	 EReHcA13XWoqQ==
Date: Fri, 27 Mar 2026 00:06:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@nxp.com>
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
Message-ID: <20260327-caucus-lunchtime-9b732c1e74d1@spud>
References: <20260325-pinctrl-mux-v4-0-043c2c82e623@nxp.com>
 <20260325-pinctrl-mux-v4-3-043c2c82e623@nxp.com>
 <20260326-concur-eel-3e0b3d91e00a@spud>
 <20260326-poncho-expanse-d30a9eded8e2@spud>
 <acWNOhnBvA5l9NW3@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jz0AcoB0Nxtd0vkz"
Content-Disposition: inline
In-Reply-To: <acWNOhnBvA5l9NW3@lizhi-Precision-Tower-5810>
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


--jz0AcoB0Nxtd0vkz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 03:47:06PM -0400, Frank Li wrote:
> On Thu, Mar 26, 2026 at 06:55:01PM +0000, Conor Dooley wrote:
> > On Thu, Mar 26, 2026 at 06:52:12PM +0000, Conor Dooley wrote:
> > > On Wed, Mar 25, 2026 at 07:04:12PM -0400, Frank Li wrote:
> > >
> > > > diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pi=
nctrl-generic.c
> > > > index efb39c6a670331775855efdc8566102b5c6202ef..20a216ae63e91b69985=
ea4cfcd0b57103c6ca950 100644
> > > > --- a/drivers/pinctrl/pinctrl-generic.c
> > > > +++ b/drivers/pinctrl/pinctrl-generic.c
> > > > @@ -17,29 +17,18 @@
> > > >  #include "pinctrl-utils.h"
> > > >  #include "pinmux.h"
> > > >
> > > > -static int pinctrl_generic_pins_function_dt_subnode_to_map(struct =
pinctrl_dev *pctldev,
> > >
> > > > +int
> > > > +pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_=
node *parent,
> > >
> > > Can you drop this stylistic change please? The
> >
> > Whoops, cut myself off. To be clear, what I am asking for is to keep the
> > "int" etc on the same line as the function name. This function is new,
> > but you did it for the existing function too and the comparison is here.
> >
> > >
> > > > +		       struct device_node *np, struct pinctrl_map **maps,
> > > > +		       unsigned int *num_maps, unsigned int *num_reserved_maps,
> > > > +		       const char **group_names, unsigned int ngroups,
> > > > +		       const char **functions, unsigned int *pins)
> > > >  {
> > > >  	struct device *dev =3D pctldev->dev;
> > > > -	const char **functions;
> > > > +	int npins, ret, reserve =3D 1;
> > > > +	unsigned int num_configs;
> > > >  	const char *group_name;
> > > >  	unsigned long *configs;
> > > > -	unsigned int num_configs, pin, *pins;
> > > > -	int npins, ret, reserve =3D 1;
> > > > -
> > > > -	npins =3D of_property_count_u32_elems(np, "pins");
> > > > -
> > > > -	if (npins < 1) {
> > > > -		dev_err(dev, "invalid pinctrl group %pOFn.%pOFn %d\n",
> > > > -			parent, np, npins);
> > > > -		return npins;
> > > > -	}
> > > >
> > > >  	group_name =3D devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn", par=
ent, np);
> > > >  	if (!group_name)
> > > > @@ -51,22 +40,6 @@ static int pinctrl_generic_pins_function_dt_subn=
ode_to_map(struct pinctrl_dev *p
> > > >  	if (!pins)
> > > >  		return -ENOMEM;
> > >
> > > This looks suspect. You've left the pins allocation behind:
> > > 	pins =3D devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
> > > 	if (!pins)
> > > 		return -ENOMEM;
> > > but pinctrl_generic_pins_function_dt_subnode_to_map() has already
> > > populated this array before calling the function.
>=20
> what's means?

It means you broke my driver by not removing this allocation from
pinctrl_generic_to_map().

>=20
> pinctrl_generic_pins_function_dt_subnode_to_map()
> {
> 	pins =3D devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
> 	...
> 	pinctrl_generic_to_map();
> }
>=20
> pinctrl_generic_pins_function_dt_subnode_to_map() have not use this array.

I have no idea what this statement means.

>=20
> Frank
> > >
> > > Also, this should probably be
> > > Suggested-by: Conor Dooley <conor.dooley@microchip.com>
> > >
> > > Cheers,
> > > Conor.
> > >
> > > >
> > > > -	functions =3D devm_kcalloc(dev, npins, sizeof(*functions), GFP_KE=
RNEL);
> > > > -	if (!functions)
> > > > -		return -ENOMEM;
> > > > -
> > > > -	for (int i =3D 0; i < npins; i++) {
> > > > -		ret =3D of_property_read_u32_index(np, "pins", i, &pin);
> > > > -		if (ret)
> > > > -			return ret;
> > > > -
> > > > -		pins[i] =3D pin;
> > > > -
> > > > -		ret =3D of_property_read_string(np, "function", &functions[i]);
> > > > -		if (ret)
> > > > -			return ret;
> > > > -	}
> > > > -
> > > >  	ret =3D pinctrl_utils_reserve_map(pctldev, maps, num_reserved_map=
s, num_maps, reserve);
> > > >  	if (ret)
> > > >  		return ret;
> > > > @@ -103,6 +76,54 @@ static int pinctrl_generic_pins_function_dt_sub=
node_to_map(struct pinctrl_dev *p
> > > >  	return 0;
> > > >  };
> > > >
> > > > +static int
> > > > +pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctrl_dev=
 *pctldev,
> > > > +						struct device_node *parent,
> > > > +						struct device_node *np,
> > > > +						struct pinctrl_map **maps,
> > > > +						unsigned int *num_maps,
> > > > +						unsigned int *num_reserved_maps,
> > > > +						const char **group_names,
> > > > +						unsigned int ngroups)
> > > > +{
> > > > +	struct device *dev =3D pctldev->dev;
> > > > +	unsigned int pin, *pins;
> > > > +	const char **functions;
> > > > +	int npins, ret;
> > > > +
> > > > +	npins =3D of_property_count_u32_elems(np, "pins");
> > > > +
> > > > +	if (npins < 1) {
> > > > +		dev_err(dev, "invalid pinctrl group %pOFn.%pOFn %d\n",
> > > > +			parent, np, npins);
> > > > +		return npins;
> > > > +	}
> > > > +
> > > > +	pins =3D devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
> > > > +	if (!pins)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	functions =3D devm_kcalloc(dev, npins, sizeof(*functions), GFP_KE=
RNEL);
> > > > +	if (!functions)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	for (int i =3D 0; i < npins; i++) {
> > > > +		ret =3D of_property_read_u32_index(np, "pins", i, &pin);
> > > > +		if (ret)
> > > > +			return ret;
> > > > +
> > > > +		pins[i] =3D pin;
> > > > +
> > > > +		ret =3D of_property_read_string(np, "function", &functions[i]);
> > > > +		if (ret)
> > > > +			return ret;
> > > > +	}
> > > > +
> > > > +	return pinctrl_generic_to_map(pctldev, parent, np, maps, num_maps,
> > > > +				      num_reserved_maps, group_names, ngroups,
> > > > +				      functions, pins);
> > > > +}
> > > > +
> > > >  /*
> > > >   * For platforms that do not define groups or functions in the dri=
ver, but
> > > >   * instead use the devicetree to describe them. This function will=
, unlike
> > > >
> > > > --
> > > > 2.43.0
> > > >
> >
> >
>=20
>=20

--jz0AcoB0Nxtd0vkz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacXKFgAKCRB4tDGHoIJi
0mQlAQCCrpynWKye+JnQ3d79G381Pt3Rtj9h7zOyzY0DrZV22gD/f58jVm9SlzrG
YHkt07haqbZTweNomXGNWGl+D+tiNQw=
=EOzH
-----END PGP SIGNATURE-----

--jz0AcoB0Nxtd0vkz--

