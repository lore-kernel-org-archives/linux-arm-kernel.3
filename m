Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4E8CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 14:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQlnQCZTcQjCMg9gXM5j/h/j9QBEe/QKt7u0yZHQbQE=; b=gussVcAsYfG0B39maK60CvSW2G
	tPLlmNYZAaJSfWRaJ7d1yfvysJZcrgZqG6rF14m6BbNDfCYwz8a2iIU0Q/8sbhNoSTJjGHXVIV6rU
	P9IMlw21d/ODAbDx8Jpx+M06thvWbODMCMBYi8b0FVlM7guapFqVPts9pA0E7XuK7miBg3bZGjqdt
	1jB0iLp4tU4s2nuXsI9cRJ8Hf1PUNpZF4a+hJKhwhglvBGeOuD+uoMTiea3ipd8qyJbfYY/hCwWj1
	TIYL991M1NX9RLjnbkuzsbWo1RGYwNQK3Y5mnrq5PZZ8aFgt7tYi/ebQD78/BpNvBuIEGzTTJlOgY
	iEi4h5Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92bi-00000001v4V-1hpa;
	Wed, 15 Oct 2025 14:36:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92bf-00000001v3j-1OqQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 14:36:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 08EC644471;
	Wed, 15 Oct 2025 14:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5A66C4CEF8;
	Wed, 15 Oct 2025 14:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760538958;
	bh=CQlnQCZTcQjCMg9gXM5j/h/j9QBEe/QKt7u0yZHQbQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V1u6Wi/bA8yzs2VzytUSKwlOdJY627sho9aV934PlC9av+KzwXYa2BrrFU9y6Ptwo
	 J+TUilM0Y8GtatWIY8ATBQIDQwY9kOqNlj344/MlQSTKbJywS1GziAxbxbP9w61X+9
	 A3TSqCq6Yo5Tf/TYyPlYvL0pajqjSFWDamK27jsbDrPDxmEqidk9uRAslM99epdfbh
	 dERs70VvRyfwG7Lez+yG8I2jkm1DQgffLXYES6OtZBxrEGN9KBqYSIg0MKAAG1/igN
	 GjfCspVtrmiKyau0OERse5FwxKji55mnzZwUn3IZ5zfNdpuPYNhdc8/qQS79azJjVh
	 Pxjs2x59J2QEQ==
Date: Wed, 15 Oct 2025 15:35:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Valentin Caron <valentin.caron@foss.st.com>
Subject: Re: [PATCH v3 09/10] dt-bindings: pinctrl: stm32: Support I/O
 synchronization parameters
Message-ID: <20251015-headstand-impulse-95aa736e7633@spud>
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
 <20251014140451.1009969-10-antonio.borneo@foss.st.com>
 <20251014-affection-voltage-8b1764273a06@spud>
 <b4eca95eaa0e6f27fc07479d5eab2131d20eb270.camel@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RrT1Ouiw7gUB6N03"
Content-Disposition: inline
In-Reply-To: <b4eca95eaa0e6f27fc07479d5eab2131d20eb270.camel@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_073559_408424_65A69668 
X-CRM114-Status: GOOD (  15.04  )
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


--RrT1Ouiw7gUB6N03
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 02:56:56PM +0200, Antonio Borneo wrote:
> On Tue, 2025-10-14 at 19:10 +0100, Conor Dooley wrote:
> > On Tue, Oct 14, 2025 at 04:04:50PM +0200, Antonio Borneo wrote:

> >=20
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 st,io-sync:
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 description: |
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 IO synchronization through r=
e-sampling or inversion
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0: data or clock GPIO pass-t=
hrough
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1: clock GPIO inverted
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2: data GPIO re-sampled on c=
lock rising edge
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 3: data GPIO re-sampled on c=
lock falling edge
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4: data GPIO re-sampled on b=
oth clock edges
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 $ref: /schemas/types.yaml#/definit=
ions/uint32
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 enum: [0, 1, 2, 3, 4]
> >=20
> > I really don't like this kinds of properties that lead to "random"
> > numbers in devicetree. I'd much rather see a string list here.
>=20
> Agree!
> I just need to figure out some reasonably short but still meaningful
> string for them.

pass-through
inverted
rising-edge
falling-edge
both-edges

perhaps?

--RrT1Ouiw7gUB6N03
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaO+xRgAKCRB4tDGHoIJi
0lfAAP9Wmew99Hvt1yhCWck5hvyNjlO7jQxH+64gBF5XK6BLXgEAjBA58Y45RCl0
7cO7Pj2cMcMbSBMMf8uhGjNZlOnz5Qs=
=XBKe
-----END PGP SIGNATURE-----

--RrT1Ouiw7gUB6N03--

