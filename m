Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1821610AB803
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 18:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DMUwH/7HM5vjdiD4l5mo0zKMSRCg64DcLBaPX37IEzk=; b=VgXZrqrQkNEnftJINHUaZcmzXX
	XHaR2erud8gT/Ke54vJouhiUQFKPOcl769eSDy6Xg1c2N4t6jB0d79AFBhYrX+fp2VZs7IiBk1sDA
	kow5YvpkrYFCcgQV3KK20tHkQCycb9Mm765/IMfwF5kUtffjb3QS2EK68nCfGD5BuoPUijBA8IlFf
	z/D6CIF2FU0CCYHlEpj0WPXX8Ai/uToMmyOCL1l2kQX2NVaiAifIp15BY/DRV6GwAaWvb/oi5M8fz
	T7XyZZpjCX3QatEuygcksUae0c2ZfVubY20a3f98Pm3pzB1fb7kD1fB10dO7d/MTOGMWwEaYqDPcF
	12M7FcpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5poa-000000064GA-1rMX;
	Thu, 26 Mar 2026 18:52:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5poY-000000064G2-2xAb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 18:52:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C2B93600C4;
	Thu, 26 Mar 2026 18:52:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74927C116C6;
	Thu, 26 Mar 2026 18:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774551137;
	bh=VNXRVsOXSPqRmo90Maw0zfm+3Cl0xIUMi6ALG5fc/T4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mD2EGztzJwOMwmjMBBlexpOPDOJjGtCbOTI4TJFVp93FI7AWsJrFw4H3xkerSj0lS
	 SPFQvchH0Kdrp2xXPhGyj/qGwygoyKPZS4T5/qWeIZl/U9hOf5VxMxtm6Oo4G2aMom
	 sBv7lSqM15DT5STWHxBElBnMym2VkgJTLOKz5HLl1mSHcU0lkIhUXmuEE7XbMMeZR5
	 OuUkV9qmsB2C+8mz4yT8MUm1YHMMh8o9svhSXlPXitARJI+NjzTnR5jv5FXJxqAPda
	 9O4tEnUJ4dA3ZmV9ktdkeBNOjsufXbIOTixHDFR65mMyRprUTYrEo+3E29SH1BtuhG
	 FXui7pvqt/b+w==
Date: Thu, 26 Mar 2026 18:52:12 +0000
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
Message-ID: <20260326-concur-eel-3e0b3d91e00a@spud>
References: <20260325-pinctrl-mux-v4-0-043c2c82e623@nxp.com>
 <20260325-pinctrl-mux-v4-3-043c2c82e623@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I2XqJTKcL3uBkzNs"
Content-Disposition: inline
In-Reply-To: <20260325-pinctrl-mux-v4-3-043c2c82e623@nxp.com>
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


--I2XqJTKcL3uBkzNs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 07:04:12PM -0400, Frank Li wrote:

> diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pinctrl-=
generic.c
> index efb39c6a670331775855efdc8566102b5c6202ef..20a216ae63e91b69985ea4cfc=
d0b57103c6ca950 100644
> --- a/drivers/pinctrl/pinctrl-generic.c
> +++ b/drivers/pinctrl/pinctrl-generic.c
> @@ -17,29 +17,18 @@
>  #include "pinctrl-utils.h"
>  #include "pinmux.h"
> =20
> -static int pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctr=
l_dev *pctldev,

> +int
> +pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *=
parent,

Can you drop this stylistic change please? The=20

> +		       struct device_node *np, struct pinctrl_map **maps,
> +		       unsigned int *num_maps, unsigned int *num_reserved_maps,
> +		       const char **group_names, unsigned int ngroups,
> +		       const char **functions, unsigned int *pins)
>  {
>  	struct device *dev =3D pctldev->dev;
> -	const char **functions;
> +	int npins, ret, reserve =3D 1;
> +	unsigned int num_configs;
>  	const char *group_name;
>  	unsigned long *configs;
> -	unsigned int num_configs, pin, *pins;
> -	int npins, ret, reserve =3D 1;
> -
> -	npins =3D of_property_count_u32_elems(np, "pins");
> -
> -	if (npins < 1) {
> -		dev_err(dev, "invalid pinctrl group %pOFn.%pOFn %d\n",
> -			parent, np, npins);
> -		return npins;
> -	}
> =20
>  	group_name =3D devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn", parent, n=
p);
>  	if (!group_name)
> @@ -51,22 +40,6 @@ static int pinctrl_generic_pins_function_dt_subnode_to=
_map(struct pinctrl_dev *p
>  	if (!pins)
>  		return -ENOMEM;

This looks suspect. You've left the pins allocation behind:
	pins =3D devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
	if (!pins)
		return -ENOMEM;
but pinctrl_generic_pins_function_dt_subnode_to_map() has already
populated this array before calling the function.

Also, this should probably be
Suggested-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> =20
> -	functions =3D devm_kcalloc(dev, npins, sizeof(*functions), GFP_KERNEL);
> -	if (!functions)
> -		return -ENOMEM;
> -
> -	for (int i =3D 0; i < npins; i++) {
> -		ret =3D of_property_read_u32_index(np, "pins", i, &pin);
> -		if (ret)
> -			return ret;
> -
> -		pins[i] =3D pin;
> -
> -		ret =3D of_property_read_string(np, "function", &functions[i]);
> -		if (ret)
> -			return ret;
> -	}
> -
>  	ret =3D pinctrl_utils_reserve_map(pctldev, maps, num_reserved_maps, num=
_maps, reserve);
>  	if (ret)
>  		return ret;
> @@ -103,6 +76,54 @@ static int pinctrl_generic_pins_function_dt_subnode_t=
o_map(struct pinctrl_dev *p
>  	return 0;
>  };
> =20
> +static int
> +pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctrl_dev *pctl=
dev,
> +						struct device_node *parent,
> +						struct device_node *np,
> +						struct pinctrl_map **maps,
> +						unsigned int *num_maps,
> +						unsigned int *num_reserved_maps,
> +						const char **group_names,
> +						unsigned int ngroups)
> +{
> +	struct device *dev =3D pctldev->dev;
> +	unsigned int pin, *pins;
> +	const char **functions;
> +	int npins, ret;
> +
> +	npins =3D of_property_count_u32_elems(np, "pins");
> +
> +	if (npins < 1) {
> +		dev_err(dev, "invalid pinctrl group %pOFn.%pOFn %d\n",
> +			parent, np, npins);
> +		return npins;
> +	}
> +
> +	pins =3D devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
> +	if (!pins)
> +		return -ENOMEM;
> +
> +	functions =3D devm_kcalloc(dev, npins, sizeof(*functions), GFP_KERNEL);
> +	if (!functions)
> +		return -ENOMEM;
> +
> +	for (int i =3D 0; i < npins; i++) {
> +		ret =3D of_property_read_u32_index(np, "pins", i, &pin);
> +		if (ret)
> +			return ret;
> +
> +		pins[i] =3D pin;
> +
> +		ret =3D of_property_read_string(np, "function", &functions[i]);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return pinctrl_generic_to_map(pctldev, parent, np, maps, num_maps,
> +				      num_reserved_maps, group_names, ngroups,
> +				      functions, pins);
> +}
> +
>  /*
>   * For platforms that do not define groups or functions in the driver, b=
ut
>   * instead use the devicetree to describe them. This function will, unli=
ke
>=20
> --=20
> 2.43.0
>=20

--I2XqJTKcL3uBkzNs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacWAXAAKCRB4tDGHoIJi
0gVHAQDfxULI+wAZi6l1tVBV4f3rPYD63HNANlsr0XGHGgq7PgEA2KSyL1Qer0lB
VYui8o9yBdAvEuLpvQD75JWyxskeUw4=
=64t6
-----END PGP SIGNATURE-----

--I2XqJTKcL3uBkzNs--

