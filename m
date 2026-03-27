Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B8D10F285F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 17:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RHZHdVnR0zTaqYIhv9So/eydh5PbYVOHPjWh8NR18EY=; b=qBix2++p5wcv19VqeeA9OgyFAr
	Zjb6nE8atb+VNRl6EjDjS49zG2vK4CrnseqyBM+BOJFpWYPhA6cb/jJWvFg3IwKu/9I9sTao6GUH8
	IgzNdjGgIDemc2yX8+xac+Zj1xJogOfHnUU5ZogeUFzbBoqfloFk8KobBXoEFAMsV2h7KnOLC9JTd
	p5lTpBssKp9dI8OfcCFyPR1hdJcp9Lnhpql0W6BMys2IOQwCaIPUWL8udMdD13IeEO8kcUZJDXOpe
	VVaPb+UKmrMOODuMOrlobOXw+gShPDrVqGCb4pmzCXS1pn29iaLDzXfvatARQqR+qDqdKOKvZxTF4
	SfV13sxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Alo-00000007q0k-2aXs;
	Fri, 27 Mar 2026 17:14:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Aln-00000007q0a-0AZN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 17:14:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7984D60054;
	Fri, 27 Mar 2026 17:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C6CC19423;
	Fri, 27 Mar 2026 17:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774631690;
	bh=K/gLTO9BZCY9CeZMqLSveaXc5Cq+EEiHtsmhIau0ADg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rCuOyAx6bXbHXajLcXofBRMQm35IYQDU9GeYsBogWpYwfCnUYTJGXt6+v35nSrrFU
	 HDjf1ex5dYyzsq2AwhQ/rczEJKB1+MiuHBuuwFyobz+Qrigx5CBetrKN5GmM+8cK80
	 AMAxXa5dOY9UyC+k5KAyq51evGL4yEBKw18x4jizpmhP+HVUAucCbE+gmlR22q3Bg5
	 B3/p5bZ5Iuevgf14+hn3YzMtB/AHWZ3kjQ36VzlujXJ1GI8kATRd5+qFqAAj9w2dmE
	 7Z4fXodO3VRjXOm37LKcvTfCqx2wVeuLpDgNjb9FqNDFln/3CV+uJJPC6wWhPwT8iT
	 6cbQo9gfPsAww==
Date: Fri, 27 Mar 2026 17:14:44 +0000
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
Message-ID: <20260327-cymbal-reliant-30f1e7e0cfcb@spud>
References: <20260325-pinctrl-mux-v4-0-043c2c82e623@nxp.com>
 <20260325-pinctrl-mux-v4-3-043c2c82e623@nxp.com>
 <20260327-overdrawn-stretch-2311ec39aa58@spud>
 <aca2UquiW9lFikhR@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pAa+sME3mtw+rhIt"
Content-Disposition: inline
In-Reply-To: <aca2UquiW9lFikhR@lizhi-Precision-Tower-5810>
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


--pAa+sME3mtw+rhIt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 12:54:42PM -0400, Frank Li wrote:
> On Fri, Mar 27, 2026 at 12:09:32AM +0000, Conor Dooley wrote:
> > On Wed, Mar 25, 2026 at 07:04:12PM -0400, Frank Li wrote:
> > > Refactor pinctrl_generic_pins_function_dt_subnode_to_map() by separat=
ing DT
> > > parsing logic from map creation. Introduce a new helper
> > > pinctrl_generic_to_map() to handle mapping to kernel data structures,=
 while
> > > keeping DT property parsing in the subnode function.
> > >
> > > Improve code structure and enables easier reuse for platforms using
> > > different DT properties (e.g. pinmux) without modifying the
> > > dt_node_to_map-style callback API. Avoid unnecessary coupling to
> > > pinctrl_generic_pins_function_dt_node_to_map(), which provides
> > > functionality not needed when the phandle target is unambiguous.
> > >
> > > Maximize code reuse and provide a cleaner extension point for future
> > > pinctrl drivers.
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > change in v4
> > > - new patch
> > > ---
> > >  drivers/pinctrl/pinconf.h         | 18 ++++++++
> > >  drivers/pinctrl/pinctrl-generic.c | 91 ++++++++++++++++++++++++-----=
----------
> > >  2 files changed, 74 insertions(+), 35 deletions(-)
> > >
> > > diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
> > > index 2880adef476e68950ffdd540ea42cdee6a16ec27..ffdabddb9660324ed8886=
a2e8dcacff7e1c6c529 100644
> > > --- a/drivers/pinctrl/pinconf.h
> > > +++ b/drivers/pinctrl/pinconf.h
> > > @@ -166,6 +166,13 @@ int pinctrl_generic_pins_function_dt_node_to_map=
(struct pinctrl_dev *pctldev,
> > >  						 struct device_node *np,
> > >  						 struct pinctrl_map **maps,
> > >  						 unsigned int *num_maps);
> > > +
> > > +int
> > > +pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_no=
de *parent,
> > > +		       struct device_node *np, struct pinctrl_map **maps,
> > > +		       unsigned int *num_maps, unsigned int *num_reserved_maps,
> > > +		       const char **group_name, unsigned int ngroups,
> > > +		       const char **functions, unsigned int *pins);
> > >  #else
> > >  static inline int
> > >  pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pct=
ldev,
> > > @@ -175,4 +182,15 @@ pinctrl_generic_pins_function_dt_node_to_map(str=
uct pinctrl_dev *pctldev,
> > >  {
> > >  	return -ENOTSUPP;
> > >  }
> > > +
> > > +static inline int
> > > +pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_no=
de *parent,
> > > +		       struct device_node *np, struct pinctrl_map **maps,
> > > +		       unsigned int *num_maps, unsigned int *num_reserved_maps,
> > > +		       const char **group_name, unsigned int ngroups,
> > > +		       const char **functions, unsigned int *pins,
> > > +		       void *function_data)
> > > +{
> > > +	return -ENOTSUPP;
> > > +}
> > >  #endif
> > > diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pinc=
trl-generic.c
> > > index efb39c6a670331775855efdc8566102b5c6202ef..20a216ae63e91b69985ea=
4cfcd0b57103c6ca950 100644
> > > --- a/drivers/pinctrl/pinctrl-generic.c
> > > +++ b/drivers/pinctrl/pinctrl-generic.c
> > > @@ -17,29 +17,18 @@
> > >  #include "pinctrl-utils.h"
> > >  #include "pinmux.h"
> > >
> > > -static int pinctrl_generic_pins_function_dt_subnode_to_map(struct pi=
nctrl_dev *pctldev,
> > > -							   struct device_node *parent,
> > > -							   struct device_node *np,
> > > -							   struct pinctrl_map **maps,
> > > -							   unsigned int *num_maps,
> > > -							   unsigned int *num_reserved_maps,
> > > -							   const char **group_names,
> > > -							   unsigned int ngroups)
> > > +int
> > > +pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_no=
de *parent,
> > > +		       struct device_node *np, struct pinctrl_map **maps,
> > > +		       unsigned int *num_maps, unsigned int *num_reserved_maps,
> > > +		       const char **group_names, unsigned int ngroups,
> > > +		       const char **functions, unsigned int *pins)
> >
> > npins needs to be an argument to this function also, otherwise
> > pinctrl_generic_add_group() uses it uninitialised...
>=20
> Is this one the root cause of then broken?

No, this is not the cause of the breakage. I can't believe I still have
to say that. Go read the code and you'll see why that allocation thing
is problematic.

> I am not sure why compiler have not report waring for it.

It did, that's how I found it. Used uninitialised warnings are normally
=66rom clang, so your toolchain might not have seen it. clangd integration
with my editor is how I saw it.

--pAa+sME3mtw+rhIt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaca7AQAKCRB4tDGHoIJi
0tJOAP47mkwupF69iSRR/PJaWWFW6GDxmNFaLiYahpyjU+NVeQEAnZdw+Qj9g9Ik
qNJvKTLF5rcBtj5CBnTu6h/gxd9oXQk=
=B990
-----END PGP SIGNATURE-----

--pAa+sME3mtw+rhIt--

