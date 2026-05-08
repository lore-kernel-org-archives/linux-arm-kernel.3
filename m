Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256C0CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 15:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOQd0UMMFkRrNcFfS9FsyDJqwFkrX5CUEdPtG78I3bA=; b=p2YPJBGWRXRn/nURgYprHcQrL/
	l5puF02U+w40fuit1Gpq7xH22bDHVIknEuQcelBdQ55xGaYd3rrN+Mjyph+Qb21VvnX0UTE+3/K//
	3YERqFyBQJomgZUjeqyPAxS5nxh4esw2NHzfpn4UkFZ/x5pilxtgT/soUaU1hfdYWmvVs+25/8q0a
	KF2YzxHXLLdtW8Nb/J4zTMixtu6GUBZJvtrhKA6cgXFIdS5fh5SNIR1resWdHECcPcivImYfHxL7b
	xJFrYtVAL/w56mTxlwHuyuUYXfOSSEXyE7XyInkcSTHrLPHA3R4Y8AvKrOUSypx6ZAQZ/sfAQihjS
	scH7k4DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLMlp-00000006mCE-0s7q;
	Fri, 08 May 2026 15:05:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLMlm-00000006mBY-2AVn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 15:05:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F1349440D1;
	Fri,  8 May 2026 15:05:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F930C2BCB0;
	Fri,  8 May 2026 15:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778252736;
	bh=OOQd0UMMFkRrNcFfS9FsyDJqwFkrX5CUEdPtG78I3bA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dqgdNCrLdSouZfJ+cBochVg4l+EW0ZgYzTKTnY+8lfJwURJnvrQoDR8dHkAg1w6KY
	 AyN3Hf65eqfBRv8gYPmM+gf4ozqEjaUYro9FAepWWvAz64TouBzwx9KhCg4RFdGeRN
	 hYOLow1zMj2TpvMiIdWvfbxw0bRFvg9o5yu4of1acn9hFZJ/TlFM9i2KoLVdNmMrGZ
	 usVMoCcXMdt4NxHl//jzljbEF/G9cgYk+r4st0G8HfgLwv1UBW2EHS2yNu8bcvvook
	 rOhy9fKW2BU7RfhhfyVTJ2xmF7+s81zo0NSKJVwOgUO3TZpnXQMjp9bgD5LcReWfXf
	 +dJ2T/gaMu8jA==
Date: Fri, 8 May 2026 16:05:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: netdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Bartosz Golaszewski <brgl@kernel.org>,
	=?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Eric Dumazet <edumazet@google.com>, Felipe Balbi <balbi@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>, Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>, linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Christian Lamparter <chunkeey@gmail.com>
Subject: Re: [PATCH 1/3] [v5 net-next] dt-bindings: net: add
 st,stlc4560/p54spi binding
Message-ID: <20260508-matchless-easily-80421ce426fe@spud>
References: <20260507212451.3333185-1-arnd@kernel.org>
 <20260507212451.3333185-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="726aSvgIIJD5Swc6"
Content-Disposition: inline
In-Reply-To: <20260507212451.3333185-2-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_080538_576795_E87CC705 
X-CRM114-Status: GOOD (  15.41  )
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


--726aSvgIIJD5Swc6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 07, 2026 at 11:24:49PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The SPI version of Prism54 was sold under a couple of different
> names and supported by the Linux p54spi driver, but there was
> never a DT binding for it.
>=20
> Document the four known names of this device and the properties
> that are sufficient for its use on the Nokia N8x0 tablet.
>=20
> As I don't have this hardware or documentation for it, this is
> purely based on existing usage in the driver.
>=20
> Link: https://lore.kernel.org/all/e8dc9acb-6f85-e0a9-a145-d101ca6da201@gm=
ail.com/
> Acked-by: Christian Lamparter <chunkeey@gmail.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--726aSvgIIJD5Swc6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaf37uQAKCRB4tDGHoIJi
0oiDAP9VBMZj2YyfB3P9bwsTD4wv5yB5Cq6x3NFuws40Zkv4XgD/WBo5/f2CnmON
jgQaqwIoJVKNq6INibHJqFWUwarKLQ4=
=ikRz
-----END PGP SIGNATURE-----

--726aSvgIIJD5Swc6--

