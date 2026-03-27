Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C11410AB832
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 00:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+aU2FbqGuThpJ6rrxXisrQZ8poKWSBzLLT9BNtj96Ug=; b=FyE3lpJul71Ihuhx+ccj2jqeUn
	8Yr8jwicym84nKxGqtejAj3QeRazfe2nzXYsSU7fPqfURarFha22ggCGjRnUXJPu1S0e0j+1d2VD9
	SlrO0Hat44DJmJsluywvWnH4pF04/zUD+V3X7N+Y45L/KbiJD1M7xFZ79Xeh7XRJcZ+wutmREHD7C
	iDUvh+SLfZskX9xxdjAeraj1uQBsrnzPiUc1RD/vSkyMe6p9Z8W93i/SLRTbvtnXsZQijpTypgLCh
	e2ORtyEZ4h1SFUdyJ7twHhqwoBv/ko9Wn1B3Rv2WIDxF5BEwUXF0OanBw0KdbH4Tl4fTi9pZz1Fxg
	+FK4/B4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ulh-00000006QCR-3KOQ;
	Fri, 27 Mar 2026 00:09:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ulf-00000006QC7-1F9b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 00:09:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3015D43731;
	Fri, 27 Mar 2026 00:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18F9FC116C6;
	Fri, 27 Mar 2026 00:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774570178;
	bh=NtVvB17prGq/rDzcOx50gb9pEOvnlt8/PkVt1l9JhhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KeraVxzARUz+LslbYVVEWwNtQ8kjtC/ec4C5IcS1qFz6zNZVNuJ8FGsP/3DAccWAH
	 K8sC+4TETsPBWwjvjwWKAhi3N/VS9lMlhbmYViw9ITmWqkA4BrJz2MqOhWOs0xyiYm
	 BqNtMJ+t5kN52OxIKUj+4bX8lrZAdpJORWzgKMOsXnWLqwmy3FBTPG3TgH6zvdbd0D
	 jq9gx2jHQpAelGKveSrbpRtceuy5XdmjkiRGXPR0dX1nqM9u9hABoOdueZE3Ftn6Gc
	 35qXuepsprdiFFr1CA2NZOJFZ6Gdp8HbWF2Vdh9QU+p3vl7Q3maJFfOqGDRaT+GSjt
	 jG++FCABYBaHw==
Date: Fri, 27 Mar 2026 00:09:32 +0000
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
Message-ID: <20260327-overdrawn-stretch-2311ec39aa58@spud>
References: <20260325-pinctrl-mux-v4-0-043c2c82e623@nxp.com>
 <20260325-pinctrl-mux-v4-3-043c2c82e623@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o+mudXqwbMVi6APo"
Content-Disposition: inline
In-Reply-To: <20260325-pinctrl-mux-v4-3-043c2c82e623@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_170939_397327_59881886 
X-CRM114-Status: GOOD (  26.71  )
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


--o+mudXqwbMVi6APo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 07:04:12PM -0400, Frank Li wrote:
> Refactor pinctrl_generic_pins_function_dt_subnode_to_map() by separating =
DT
> parsing logic from map creation. Introduce a new helper
> pinctrl_generic_to_map() to handle mapping to kernel data structures, whi=
le
> keeping DT property parsing in the subnode function.
>=20
> Improve code structure and enables easier reuse for platforms using
> different DT properties (e.g. pinmux) without modifying the
> dt_node_to_map-style callback API. Avoid unnecessary coupling to
> pinctrl_generic_pins_function_dt_node_to_map(), which provides
> functionality not needed when the phandle target is unambiguous.
>=20
> Maximize code reuse and provide a cleaner extension point for future
> pinctrl drivers.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v4
> - new patch
> ---
>  drivers/pinctrl/pinconf.h         | 18 ++++++++
>  drivers/pinctrl/pinctrl-generic.c | 91 ++++++++++++++++++++++++---------=
------
>  2 files changed, 74 insertions(+), 35 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
> index 2880adef476e68950ffdd540ea42cdee6a16ec27..ffdabddb9660324ed8886a2e8=
dcacff7e1c6c529 100644
> --- a/drivers/pinctrl/pinconf.h
> +++ b/drivers/pinctrl/pinconf.h
> @@ -166,6 +166,13 @@ int pinctrl_generic_pins_function_dt_node_to_map(str=
uct pinctrl_dev *pctldev,
>  						 struct device_node *np,
>  						 struct pinctrl_map **maps,
>  						 unsigned int *num_maps);
> +
> +int
> +pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *=
parent,
> +		       struct device_node *np, struct pinctrl_map **maps,
> +		       unsigned int *num_maps, unsigned int *num_reserved_maps,
> +		       const char **group_name, unsigned int ngroups,
> +		       const char **functions, unsigned int *pins);
>  #else
>  static inline int
>  pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
> @@ -175,4 +182,15 @@ pinctrl_generic_pins_function_dt_node_to_map(struct =
pinctrl_dev *pctldev,
>  {
>  	return -ENOTSUPP;
>  }
> +
> +static inline int
> +pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *=
parent,
> +		       struct device_node *np, struct pinctrl_map **maps,
> +		       unsigned int *num_maps, unsigned int *num_reserved_maps,
> +		       const char **group_name, unsigned int ngroups,
> +		       const char **functions, unsigned int *pins,
> +		       void *function_data)
> +{
> +	return -ENOTSUPP;
> +}
>  #endif
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
> -							   struct device_node *parent,
> -							   struct device_node *np,
> -							   struct pinctrl_map **maps,
> -							   unsigned int *num_maps,
> -							   unsigned int *num_reserved_maps,
> -							   const char **group_names,
> -							   unsigned int ngroups)
> +int
> +pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *=
parent,
> +		       struct device_node *np, struct pinctrl_map **maps,
> +		       unsigned int *num_maps, unsigned int *num_reserved_maps,
> +		       const char **group_names, unsigned int ngroups,
> +		       const char **functions, unsigned int *pins)

npins needs to be an argument to this function also, otherwise
pinctrl_generic_add_group() uses it uninitialised...

>  {
>  	struct device *dev =3D pctldev->dev;
> -	const char **functions;
> +	int npins, ret, reserve =3D 1;

=2E..because you're declaring it here when it's something set by the dt
parsing code in pinctrl_generic_pins_function_dt_subnode_to_map()...

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

=2E..down here.

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

--o+mudXqwbMVi6APo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacXKvAAKCRB4tDGHoIJi
0thbAQDbxNyZa3GlTnX7r+sEYyk1llSXOcQQeaeFVeqx24IPsAD/XOAxZiDAnZEX
HkHTxIYqbuTa1cJPPkfDdnwGzmk12AI=
=vM4Z
-----END PGP SIGNATURE-----

--o+mudXqwbMVi6APo--

