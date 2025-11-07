Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E865ECCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 17:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SU/nMSRraQJhTFgoNF+VDyXjK5A12cvx6hU8FhwqOJ8=; b=q8vL6lq422zaF0vO4xmZfvsgdR
	w0cFrX5gd6J9CG2iWlgqutZZnItj3l9WrY3AYUhATg0w6CXZOlXZNr5+rwmnz4mi2zv+d7K5pHRcP
	+QgObVfscNqdyxb54r0V/lZkPo72DZEY3aoosSAmOeER0gSJdLqEYKSxvHii6SxhgU4U/5adonxFV
	QCPlgT95vmb4uKTVjbZNB6L/dbJfHNGd7Z6PYeI47/B65iWd+Lng9evKTCilXxczbCB9cOn4AIBrc
	SHohHR8z1w2YP5pCIUi92LRNBtCN9i4gH2EAfwLHIgJaZBe47ZDI2cfNhSWChA7nZ9Wot1aFAxWtT
	UbvL1VtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHQ30-00000000DCm-1mWp;
	Fri, 07 Nov 2025 17:14:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHQ2v-00000000DBb-4AaZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 17:14:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6353F42AA3;
	Fri,  7 Nov 2025 17:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A450C19423;
	Fri,  7 Nov 2025 17:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762535685;
	bh=iZ+FrXmrNg9m+vRphS3VtQYquQLEkFINHFmKNJIzHf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ch4WLeykxW0UEitLCeqR5iRGkb3N1IvMlWvvO2kVip+YATE5uJqoryTiLs1VKE1c4
	 fOC0t29HS+RHFklWe+3LyA7a2BxHfqj3W1RwbHeiDrm/5kyIwLpXQsc1sHJi+hz/L2
	 vMfcZjUHYTkie+9w5AnCxlBH3l9a/hJtW2aRHmw3f09supzpeDBGKKuebZ3AeNUO4n
	 bnTFhrXQcQZR6jKAAMjVav+lmBCLgNqK38earv+Fl7ngPVI5a4XpHWqO2bPI/E2p4y
	 Zr56knLQp23Wfz/chOhb1p5d7lCZnOBVSzohujEStOWZO2oZ92kNvv6n4lXkqFvMpi
	 DqPmX21yGYLLQ==
Date: Fri, 7 Nov 2025 17:14:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: maudspierings@gocontroll.com, Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/4] dt-bindings: backlight: Add max25014 supporty
Message-ID: <20251107-estimator-flap-158b1dc054af@spud>
References: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
 <20251107-max25014-v5-1-9a6aa57306bf@gocontroll.com>
 <aQ4RqNiGsngOWrV5@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s6RySbGPqQzAw7m8"
Content-Disposition: inline
In-Reply-To: <aQ4RqNiGsngOWrV5@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_091446_054825_6452821F 
X-CRM114-Status: GOOD (  15.68  )
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


--s6RySbGPqQzAw7m8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 07, 2025 at 10:35:04AM -0500, Frank Li wrote:
> On Fri, Nov 07, 2025 at 01:49:58PM +0100, Maud Spierings via B4 Relay wro=
te:
> > From: Maud Spierings <maudspierings@gocontroll.com>
> >
> > The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> > with integrated boost controller.
> >
> > Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>


> > +  led@0:
> > +    type: object
> > +    description: Properties for a string of connected LEDs.
> > +    $ref: common.yaml#
> > +
> > +    properties:
> > +      reg:
> > +        const: 0
>=20
> If reg is const 0, why need use led@0?

> > In the current implementation the control registers for channel 1,
> > control all channels. So only one led subnode with led-sources is
> > supported right now. If at some point the driver functionality is
> > expanded the bindings can be easily extended with it.

--s6RySbGPqQzAw7m8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQ4o/gAKCRB4tDGHoIJi
0jIvAQD0+hh9svmOHdU5hyVROE565agXP34VdWQ0eWMxVyOYNAD9GBNH6x0Xyw93
6zQVoS9McvIgls8VBa4UvQeukIIKJg4=
=JBJl
-----END PGP SIGNATURE-----

--s6RySbGPqQzAw7m8--

