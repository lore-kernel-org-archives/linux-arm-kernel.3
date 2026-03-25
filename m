Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3DFFEC11B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 10:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCm3S6rNd1thUNihZopkQSj0ND6N6dRRv/ivblQ7Nfw=; b=S1jPRmhf5lG9u4Dcz+Fthgo3OY
	Q8LCAuugUCoh+ANHbFwd58uQ8oiD03S5C2WLitVr0FG6BpCbIH4zBc5sFANKpac5q0CiuUQVMAb5T
	FCJVRxVi7V/NcbrSDmI/Ne5d8aVd2EYpPSAvRfOVHJhvz1leV8pQ6QY6cdLZ77/IIJsvhUjDqEhio
	+KVVjwv44Tk2egUhOkR4mVt9Qen87Ox0h19QtV3p5iHdl9PFYcEB+ikETM5to+R3Xmy7UEZv4iEus
	fb3UGDbLxVVas8GxxPmMaBzSMb1z9sINQ05DJUee9TbhoAFn8HTfEEuNJkejSfAgTnr/AN71J0Wux
	QcQINEtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LY0-00000003A02-0Q0B;
	Wed, 25 Mar 2026 10:33:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LXz-000000039zo-203M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 10:33:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E3BA8600AC;
	Wed, 25 Mar 2026 10:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5572C4CEF7;
	Wed, 25 Mar 2026 10:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774434790;
	bh=EqAJ4JmzVDIM8zuNvQXcQbmW19GyMId6pMXxIqxpfPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b0vFr6RCuA8SyrW80P9JDA/OV32R/8VshRwGmUxJp0BzyCU4rEpWrHzUcYlZp0Cbi
	 nP+gTTTJZ4jvVYBy5ivfFcbIeI4lHt4+Mu/JzpmkJJ4Uf68p+YexgmwQ6hJeS7CzGG
	 LO9164vJNabH3EN4duTgCy2mGAhUrmdDG/4fL8GrulupzULULm7tx+LSaezhD4EwxH
	 trHyW+NacA9/i/6S9zpYWFm50cgfobbJLOfPj8/yknWgmmeref4cUDvSuGFL8hvbGw
	 lTv4gWgOy62lXD7gm9ZRYoDOGAoUMOtT/wX32RlfGAKtvLlB5hIN21kntD/8DfE6ie
	 uqJTO7YEnq5cw==
Date: Wed, 25 Mar 2026 10:33:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Peter Rosin <peda@axentia.se>,
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
Subject: Re: [PATCH v3 3/7] pinctrl: pinctrl-generic: add
 __pinctrl_generic_pins_function_dt_node_to_map()
Message-ID: <20260325-riding-browbeat-293b47f43d82@spud>
References: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com>
 <20260311-pinctrl-mux-v3-3-236b1c17bf9b@nxp.com>
 <CAD++jL=U2xNMMHk_LyH8CX+YpC5EGPVRasM11yesXSH4XLhqYw@mail.gmail.com>
 <absvZ5wzAwpbjHf1@lizhi-Precision-Tower-5810>
 <CAD++jLkp1CFcLccmLP0BWQSBKkruGCPT71dMeuyu3JY1N4T50g@mail.gmail.com>
 <ab1Rpf2zS8Bn1-HV@lizhi-Precision-Tower-5810>
 <acLxCnz3qYfAC3iB@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rph5EFAPA81jsNAV"
Content-Disposition: inline
In-Reply-To: <acLxCnz3qYfAC3iB@lizhi-Precision-Tower-5810>
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


--rph5EFAPA81jsNAV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 04:16:10PM -0400, Frank Li wrote:
> On Fri, Mar 20, 2026 at 09:54:45AM -0400, Frank Li wrote:
> > On Fri, Mar 20, 2026 at 02:27:21PM +0100, Linus Walleij wrote:
> > > On Thu, Mar 19, 2026 at 12:04=E2=80=AFAM Frank Li <Frank.li@nxp.com> =
wrote:
> > > > On Mon, Mar 16, 2026 at 10:37:28AM +0100, Linus Walleij wrote:
> > >
> > > > > That said: in this case you're just adding a parameter, just add
> > > > > the parameter and change all of the in-tree users to pass false
> > > > > or whatever you need, these is just one (1) in-tree user anyway.
> > > >
> > > > pinctrl_generic_pins_function_dt_node_to_map() directly feed to
> > > > .dt_node_to_map() callback, add parameter will impact too much.
> > >
> > > Why do you say that. It already has many parameters, one more
> > > or less doesn't matter. It's not like this call is performance-critic=
al.
> > > Just change the users.
> >
> > In only user drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c,
> > 	.dt_node_to_map =3D pinctrl_generic_pins_function_dt_node_to_map;
> >
> > pinctrl_generic_pins_function_dt_node_to_map() need match .dt_node_to_m=
ap()'s
> > declear.
> >
> > So it can't direct add two parameters in pinctrl_generic_pins_function_=
dt_node_to_map()
> > Need simple wrap function, which other in pinctrl-mpfs-mssio.c or in
> > pinconf.h.
> >
> > If add two parameter in .dt_node_to_map(), need change all functions, w=
hich
> > .dt_node_to_map =3D xxx_to_map(). and OF core part.
>=20
> Linus Walleij:
> 	Is my explain clear enough? I am preparing respin it?
>=20
> 	is okay use wrap function
> 	pinctrl_generic_pins_function_dt_node_to_map_ext()?

I don't understand this patch. The function is called
pinctrl_generic_pins_function_dt_node_to_map(). You have no pins.
You're adding a parameter to make a function with *pins* in its name not
use pins. The new function doesn't use pins but has pins in the name.
At the very least function names should not be misleading.

I was going to suggest pulling out the relevant portions and creating
some helpers that could be used by multiple different-but-similar
functions, but I don't actually even think that there's much in common.
Most damningly I think, you don't actually read either the functions or
pins properties at all and neither are permitted by your binding.
So turns out you use neither pins or functions...

You don't actually have any of these properties which runs counter to the
goal of the function, which is parsing. With this in mind, it feels to me
like you're trying way too hard to make use of a generic function when the
right thing to do is probably just have an entirely custom function.
Maybe that's a custom implementation in your driver, or a new function
here, but I think writing that will highlight just how little of the
code would be shared between the existing function and what your
use-case needs: no pin configuration stuff, no reading of the devicetree
other than the node names and no dealing with the label pointing to the
"wrong" place.

I recently bought a spacemit k1 board to go and write a sister function
to pinctrl_generic_pins_function_dt_node_to_map() that deals with pins
and groups (because that's a pretty common pattern).
I would be calling that pinctrl_generic_pinmux_dt_node_to_map(),
because it that's the property it deals with. I have honestly got no
idea what to call one for this situation since you don't have any of the
properties in pinmux-node.yaml. Maybe that's a sign.

Cheers,
Conor.

--rph5EFAPA81jsNAV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacO54QAKCRB4tDGHoIJi
0pMgAP9oMmCGeSjt4dlxPST9iaYHHdHPq/OLqZAXovZzPIwdvwEA88h6G/MIAJvB
OdYLGz82KLktiumTetrkiU2kvIDRlQY=
=fORh
-----END PGP SIGNATURE-----

--rph5EFAPA81jsNAV--

