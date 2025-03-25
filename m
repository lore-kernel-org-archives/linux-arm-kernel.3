Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AE4C3600E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 13:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BlO6BNtBl1gk8zG3pRpzJ3qRY4omgmymjs/5E1n8HjU=; b=P3ke5x9UAAzic3D4cGOz2WWIDI
	ETk0MCFOn4OwwwpGLdHJ5dTInoJR1eO5JyNlsXSPp+XMe1jyWkVQjv4GOvQAd4bZ29jlYQL8t//dL
	pg4FKm/9joLHcATDus3h9sA8tQK2hX0CmYtk+Zkyea/XC8LNCxIuIDvM7LmGNvHx3FtSwb02n7Ly0
	Fsg+oNCPUdEb2jGXUuvxRSs15TNDfJSvrdaNLl51LAGgmV0LUCTR94a8FoMWmgPr1BooBJGuwS1X+
	1zr2c8mkG0uetvzopu658s5CCCXCK1ZJ7m+b2qy190sSZea2+zPfu/YXMLFeVtCwFBPHMoLwX6L/h
	rv2/4h0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3w4-00000005xcd-1owt;
	Tue, 25 Mar 2025 13:03:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3Zg-00000005sV4-3hS0
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Mar 2025 12:40:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BlO6BNtBl1gk8zG3pRpzJ3qRY4omgmymjs/5E1n8HjU=; b=FgsoNLpJNuoKAFZ/4wkrjtQjn2
	s+YRkive/IzOGRsJpLX8+R+MU4EE2CWgVB6mFciP1gcVaE3nJZ/u5bP+uV+cy9b9L5FDTrt7Fk3eB
	eBOBPyh75r9CoAwsEFKEzywciHieuUzH5xeo+kCESbnsGLRor3OpToqWNbuijy4jyMbv4XbUigZN3
	tvbFKZzluRvP1DzG4zg+Cr+UVLPXtL+u4unwi6Gl8FMlDYYqvv6pEHYtt86UyfQ+8Zh3NHju/PDKm
	hOC5p1qt2gLJd+XcL9VeFlCGggAuqXmVzdOioS2J0vgynsCnNJcRi5eJoUWflUk1CkAbDJ+511Re6
	MHW4/c6w==;
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx3Zd-00000005PyQ-2iJL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 12:40:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F7EB10382F1B;
	Tue, 25 Mar 2025 13:39:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742906395; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=BlO6BNtBl1gk8zG3pRpzJ3qRY4omgmymjs/5E1n8HjU=;
	b=Ph2VMeNVjojq7TyvN7jh1Xvncyxwlz6NpBlppHNo9w5Iu/1wa4qn5QR39AYjxqjTAPqwxR
	TXeReWMOVxrLOSSlLiltJ2Wjjk18iMnCgzrRsVo1dHiPnSUCuiQMi9ACYt+WPA3/Fiyxtw
	n9Tj4We6m0IQSaocMpO8/8CbewGDOxAHdmHmQ01rfWsS3KFbnTDUJWFJz2JlxQ19Ualrew
	WRWDujnxrIt04pmWVl4zQWTf5IcXPwXu2uitdwbv7i7Bz2FqdYYnyuJSqHikLpGQTp5zub
	mFnyW726zYKT9VIcjgCpTN8yRITpCo620DY8AGB8iiOhG6lu66/pX0AXMfDzfQ==
Date: Tue, 25 Mar 2025 13:39:49 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Paolo Abeni <pabeni@redhat.com>, Jakub
 Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 davem@davemloft.net, Andrew Lunn <andrew+netdev@lunn.ch>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Richard
 Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org, Maxime
 Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH 2/5] dt-bindings: net: Add MTIP L2 switch description
 (fec,mtip-switch.yaml)
Message-ID: <20250325133949.7782a8a5@wsk>
In-Reply-To: <bf6d066c-f0dd-471a-bb61-9132476b515a@kernel.org>
References: <20250325115736.1732721-1-lukma@denx.de>
	<20250325115736.1732721-3-lukma@denx.de>
	<2bf73cc2-c79a-4a06-9c5f-174e3b846f1d@kernel.org>
	<20250325131507.692804cd@wsk>
	<bf6d066c-f0dd-471a-bb61-9132476b515a@kernel.org>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dA91ybGkb__gwOvzVaQYG_K";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_124005_890381_C29AEB2F 
X-CRM114-Status: GOOD (  34.77  )
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

--Sig_/dA91ybGkb__gwOvzVaQYG_K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

> On 25/03/2025 13:15, Lukasz Majewski wrote:
> > Hi Krzysztof,
> >  =20
> >> On 25/03/2025 12:57, Lukasz Majewski wrote: =20
> >>> This patch provides description of the MTIP L2 switch available in
> >>> some NXP's SOCs - imx287, vf610.
> >>>
> >>> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> >>> ---
> >>>  .../bindings/net/fec,mtip-switch.yaml         | 160
> >>> ++++++++++++++++++   =20
> >>
> >> Use compatible as filename. =20
> >=20
> > I've followed the fsl,fec.yaml as an example. This file has
> > description for all the device tree sources from fec_main.c =20
>=20
>=20
> That's a 14 year old binding, so clear antipattern.

For some reason it is still there...

>=20
> >=20
> > I've considered adding the full name - e.g.
> > fec,imx287-mtip-switch.yaml but this driver could (and probably
> > will) be extended to vf610. =20
>=20
> Unless you add vf610 now, this should follow the compatible name.

Ok.

>=20
> >=20
> > So what is the advised way to go?
> >  =20
> >> =20
> >>>  1 file changed, 160 insertions(+)
> >>>  create mode 100644
> >>> Documentation/devicetree/bindings/net/fec,mtip-switch.yaml
> >>>
> >>> diff --git
> >>> a/Documentation/devicetree/bindings/net/fec,mtip-switch.yaml
> >>> b/Documentation/devicetree/bindings/net/fec,mtip-switch.yaml new
> >>> file mode 100644 index 000000000000..cd85385e0f79 --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/net/fec,mtip-switch.yaml
> >>> @@ -0,0 +1,160 @@
> >>> +# SPDX-License-Identifier: GPL-2.0-only
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/net/fsl,mtip-switch.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Freescale MTIP Level 2 (L2) switch
> >>> +
> >>> +maintainers:
> >>> +  - Lukasz Majewski <lukma@denx.de>
> >>> +   =20
> >>
> >> description? =20
> >=20
> > Ok.
> >  =20
> >> =20
> >>> +allOf:
> >>> +  - $ref: ethernet-controller.yaml#
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    oneOf:   =20
> >>
> >> Drop, you have only one variant. =20
> >=20
> > Ok, for imx287 this can be dropped, and then extended with vf610.
> >  =20
> >> =20
> >>> +      - enum:
> >>> +	  - imx287-mtip-switch   =20
> >>
> >> This wasn't tested. Except whitespace errors, above compatible does
> >> not have format of compatible. Please look at other NXP bindings.
> >>
> >> Missing blank line.
> >> =20
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  interrupts:
> >>> +    maxItems: 3   =20
> >>
> >> Need to list items instead.
> >> =20
> >>> +
> >>> +  clocks:
> >>> +    maxItems: 4
> >>> +    description:
> >>> +      The "ipg", for MAC ipg_clk_s, ipg_clk_mac_s that are for
> >>> register accessing.
> >>> +      The "ahb", for MAC ipg_clk, ipg_clk_mac that are bus clock.
> >>> +      The "ptp"(option), for IEEE1588 timer clock that requires
> >>> the clock.
> >>> +      The "enet_out"(option), output clock for external device,
> >>> like supply clock
> >>> +      for PHY. The clock is required if PHY clock source from
> >>> SOC.=20
> >>
> >> Same problems. This binding does not look at all as any other
> >> binding. I finish review here, but the code has similar trivial
> >> issues all the way, including incorrect indentation. Start from
> >> well reviewed existing binding or example-schema. =20
> >=20
> > As I've stated above - this code is reduced copy of fsl,fec.yaml...
> > =20
>=20
> Don't take the worst, old code with all the anti-patterns we point out
> on each review, as an example.
>=20
> Take the most recent, well reviewed binding as an example. Or
> example-schema.

Ok.

>=20
> Best regards,
> Krzysztof


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/dA91ybGkb__gwOvzVaQYG_K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmfipBUACgkQAR8vZIA0
zr3d0wf/bxDkHq2CXcGN5WbTK8hga817FnMv0+WxVnrO7+RB2b0lrOdZaTXXcwb6
KM0DjW6hv1ZV/tY9uU1hNCnw3dYxia9dKKts3Xy7doPol9M31NkM9HUYpZ2gZPtR
Db9R7nCqrNZmh2h3jqbVB1lZBpR4B9mFilCVs6+3hMn3y5bQWu6hRNvq5K+oSc9D
d//uIGq7euZXpaAXxujJyYGQDEuJdmVf9lzktP6g9PCt/Tk799ulW7qe0RWcjfYl
E48J4AzVxR1rCs2gJqAsxN/cKsCsuLmerC057YamM8NKVuqa30xmt7UTPFjJ89wb
KjeIiOpkE56KfTAlW8new9bOhBT09A==
=AANv
-----END PGP SIGNATURE-----

--Sig_/dA91ybGkb__gwOvzVaQYG_K--

