Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9B4D3F071
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 14:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h8/roDMuAI3mjNMk79AAC8/rqNfFUvWo6eWVQC2sG7Y=; b=P8gUKHQgJbCAPHQAq9Xi8v4S7V
	A5osjUJfwudNpKAGyFS/lI/09b6gEtqchyZq/TJwUjR3gIM950ZkWKCt7e8vd8wPXltGqf5XqKjmo
	sAv+tF0ojSnCt/3Q/j4gBk9pXu2f8yoSRnXjOGELorikRB36BxMPy+/PUjLndpw0Yvr/gI1CN7X/5
	5TTSq2cDq/gP0FR3g7TYHq8j+3+x4v3uYfeUYop+AMckJogbEiPOysNiaX0gB43qjwsTdIozFa/i/
	QncemHA0PgiUK4nMPBuS/sxCQ1yEIR5z9axcWFkVwwLtV99JPBuhmj6FhZK3Y27651ZtkIFhMpBqs
	c4SGPYow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6iT-0000000GC1p-2vlX;
	Wed, 28 Jan 2026 14:40:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6iR-0000000GC1P-3Hvc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 14:40:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C9E3860054;
	Wed, 28 Jan 2026 14:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E38B3C4CEF1;
	Wed, 28 Jan 2026 14:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769611218;
	bh=+V397SMOrDC+3Vm5YyGZsLbYiiKsHSTZGmiMS9Hv5tk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BNz+YEYxF1GK7BXs8jSLwQ6tQ1HibxFjFu/ueuSYEh0cgIPWocxBbZ0x4z0TQ5xte
	 JO52DEOQXcciYMuwwFFc5XG0YEhkL2a1Gf6tnfNmcCobrK56aUBPl713yuPlGzHPta
	 7BB4SbDoMZO6Kj40fS1ukucf5blFXggRNCkyOBNie/PyTqZ3cQ19pSE/DR8YoRVShf
	 CmlgqFIzj1+HWFWRfjFT6r9yRu4eLDzLqH5/HwtxBSdmkjn/g+dD9/zJ22qACfndqg
	 Wra50E8Hd0h+sEpJDBLDKpmKXbg+ZlA0cuXyCjErhhv3jk4q3AFx+j95GYRgUj0RqO
	 rU3XBBRi8hK2g==
Date: Wed, 28 Jan 2026 14:40:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Michal Simek <michal.simek@amd.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, info@mocean-labs.com,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/7] dt-bindings: i2c: xiic: make clocks optional
Message-ID: <20260128-uncivil-precut-84f8e37b7f2c@spud>
References: <20260127-i2c-xiic-v6-0-e82e2f6f657c@nexthop.ai>
 <20260127-i2c-xiic-v6-1-e82e2f6f657c@nexthop.ai>
 <20260128-remarkable-airborne-chihuahua-a1a16c@quoll>
 <66c7435c-a936-413e-a016-c860d448c971@amd.com>
 <fc00f8cf-b566-4694-82fe-76010d2f7c78@lunn.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aCmLzXhnGY6FeQEX"
Content-Disposition: inline
In-Reply-To: <fc00f8cf-b566-4694-82fe-76010d2f7c78@lunn.ch>
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


--aCmLzXhnGY6FeQEX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 03:34:02PM +0100, Andrew Lunn wrote:
> On Wed, Jan 28, 2026 at 12:21:41PM +0100, Michal Simek wrote:
> >=20
> >=20
> > On 1/28/26 11:37, Krzysztof Kozlowski wrote:
> > > On Tue, Jan 27, 2026 at 09:03:55PM +0000, Abdurrahman Hussain wrote:
> > > > The xiic driver is designed to operate without explicit clock confi=
guration
> > >=20
> > > And if you change this in the driver, then you change bindings?
> > >=20
> > > You miss here explanation based on hardware - how does the hardware w=
ork
> > > if nothing ticks it clocks?
> >=20
> > Hardware obviously have clock input which needs to be connected. Withou=
t it
> > it won't work.
>=20
> Should ACPI potential limitations be making the DT description less
> accurate?

We absolutely should not be cocking up bindings because ACPI requires
less complete descriptions.

> Would it not be better that the driver has an DT binding and an ACPI
> binding? Where there are common properties, common functions can be
> used to retrieve them. However, if ACPI lacks usable clocks, use the
> of_ method to get the clock from DT, and skip it for ACPI.
>=20
>     Andrew
>=20
>=20

--aCmLzXhnGY6FeQEX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXofygAKCRB4tDGHoIJi
0kiCAQDNKNbaUn79Xc6x4BQryiWSp2li7RJKHh5XJCPManEc3QD+JINgu6NOEuXs
KJEnNeT2aVLtmcNMS0KMi6CR6HkRUgg=
=YpjJ
-----END PGP SIGNATURE-----

--aCmLzXhnGY6FeQEX--

