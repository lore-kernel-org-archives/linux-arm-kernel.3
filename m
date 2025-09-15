Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7CCCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 17:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BEkg5ZOTlpzsvFY5DbNT4Jwhec7856jtODtT7bjm3uM=; b=THoF93IgeVqFec/wc2OiXH20c0
	2FWz/WeSQRDVRc14J61zEFNuMfYOd7PoiYaNckCDwSav3dAJs2tHqB2IK0bZ8bxsKEa2pf8IM2Ev1
	t2GrmExPZPTj6KHN9DqSr66a/6YrTF0mappdNGGoEHftgciJ0q3PgP2yDqSlqK/zYlm9EfyP2fwyG
	PQqxvLhCp0vQejA5i7JNNsOz4+VMNGhFMKD/5Uxs6esMgWzPafMsP5M+/DI4lFQUY7prrpbwaNtYn
	i6LBm6gzo496SN6j5Ln6YnxkFy82bzvSVF+Lp/aMN5hNUIC/ZsZ/NCO+/L4xoUQE+aBIRRF0BHh9I
	b2abJ5ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyDDZ-00000005Jmp-1tmd;
	Mon, 15 Sep 2025 17:42:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyDDX-00000005Jm9-2BKc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 17:42:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 32B004414A;
	Mon, 15 Sep 2025 17:42:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E31C5C4CEF1;
	Mon, 15 Sep 2025 17:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757958139;
	bh=aw645FYpcIgv1xv5JOjhC68jGTuVCheL0PeqBkGn8T0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BdNs3eU9Ibb3rqEjn99slfNLCuysWu0j4QlxnPYvRBQcH/UkYXfs+6+RzXxtrRpj2
	 9A2npp8ujANUcqJc7BXtIXWonIbijujgPpV3IcHI9EnMxZHq558mx9oVWKdNZRz2i1
	 cH37vrkBjcB8H/JFv/FTW7kaPAAm0wfyUgPzXDB2UVTlK/3uQLzWtTPkQxY2X17EcP
	 4B2YEo3fygLfh9J9Py5lbw/NSkwveincEz8e0d9Kql0z8V2MmlViB+MA87SrRd1SgN
	 iCbNk8we58zU1/73l94HtjlMKDtTZ2gn1ECYhTO5U1Lnnl73xGLxa+0DeJBJ8s1ilG
	 zdbe3NljiT6lA==
Date: Mon, 15 Sep 2025 18:42:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v2 4/6] dt-bindings: touchscreen: fsl,imx6ul-tsc: support
 glitch thresold
Message-ID: <20250915-tinker-music-03cff49a41a7@spud>
References: <20250914171608.1050401-1-dario.binacchi@amarulasolutions.com>
 <20250914171608.1050401-5-dario.binacchi@amarulasolutions.com>
 <aMgjAjfydIbYexkE@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5WVm9q/T8EFhrjz+"
Content-Disposition: inline
In-Reply-To: <aMgjAjfydIbYexkE@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_104219_605522_B766240C 
X-CRM114-Status: GOOD (  27.90  )
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


--5WVm9q/T8EFhrjz+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 15, 2025 at 10:30:26AM -0400, Frank Li wrote:
> On Sun, Sep 14, 2025 at 07:16:01PM +0200, Dario Binacchi wrote:
> > Support the touchscreen-glitch-threshold-ns property. Unlike the
> > generic description in touchscreen.yaml, this controller maps the
> > provided value to one of four discrete thresholds internally.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> >
> > (no changes since v1)
> >
> >  .../input/touchscreen/fsl,imx6ul-tsc.yaml         | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,im=
x6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx=
6ul-tsc.yaml
> > index 678756ad0f92..310af56a0be6 100644
> > --- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-ts=
c.yaml
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-ts=
c.yaml
> > @@ -62,6 +62,21 @@ properties:
> >      description: Number of data samples which are averaged for each re=
ad.
> >      enum: [ 1, 4, 8, 16, 32 ]
> >
> > +  touchscreen-glitch-threshold-ns:
> > +    description: |
> > +      Unlike the generic property defined in touchscreen.yaml, this
> > +      controller does not allow arbitrary values. Internally the value=
 is
> > +      converted to IPG clock cycles and mapped to one of four discrete
> > +      thresholds exposed by the TSC_DEBUG_MODE2 register:
> > +
> > +        0: 8191 IPG cycles
> > +        1: 4095 IPG cycles
> > +        2: 2047 IPG cycles
> > +        3: 1023 IPG cycles
>=20
> you should use ns
>    enum:
>       - 1023
>       - 2047
>       - 4095
>       - 8191
>=20
> you can limit only 4 values, but unit have to ns. your driver map it to
> register value.

Looking at the driver change, I think Dario is already doing that. The
text here is just talking about how the controller doesn't support
anything other than these 4 glitch threshold and mapping must be done in
some way.

> > +
> > +      Any value provided in device tree is converted to cycles and rou=
nded
> > +      up to the next supported threshold, or to 8191 if above 4095.

This seems to be the implementation details of one particular driver,
and does not belong in a binding.

> > +
> >  required:
> >    - compatible
> >    - reg
> > --
> > 2.43.0
> >

--5WVm9q/T8EFhrjz+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMhP9QAKCRB4tDGHoIJi
0jn8AQD4ElZB882NLhy+6XIYaVM87iHwDmWdzF0PSDinfdbr6wEA2V/HYhULBlLi
X6+Ft7GtGeYClYENgBEey6E3f1BaFww=
=9tCB
-----END PGP SIGNATURE-----

--5WVm9q/T8EFhrjz+--

