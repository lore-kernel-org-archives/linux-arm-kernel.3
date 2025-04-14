Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DA9C369B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 14:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UAdCAcDDcbUAFaQhhiPijezFVFrbVIScJZbGC9BYzaw=; b=SNeWvY9EKH4B8O79wUz71SKh6F
	so03rU+TDyqbf8mQNHSBQJFLw5s8R7tAws//Z4I44Ehs2MILH5VnO1GvIawNc7ErLCD8KKbqrbXOH
	u8i9gUNUDOhf2Hp3uB1PCFOXOLNEDka5IoxvwuwfBJRbji8t5aIGZGnbcm/zo1cW0K9dQABysYEES
	7grmDZ/7PG0ZHI/AQ27byNrkdcoFmoMOuq7uJdo2vJvBGMSXaK0WZvPcV9ulVdIau91CyYYj7lf/Y
	7gPkBN+g8Zs+OeMAbiKziaUDUn0Kqe+M1MMoj93NzHEcOVhREHUSLu37sM0KOiTm3pQfQagHnp/In
	uaPQpLkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Knn-00000002Nbs-1GLq;
	Mon, 14 Apr 2025 14:28:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4KWA-00000002J8h-0WGV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 14:10:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6F3355C542F;
	Mon, 14 Apr 2025 14:08:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEAEAC4CEE2;
	Mon, 14 Apr 2025 14:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744639833;
	bh=UAdCAcDDcbUAFaQhhiPijezFVFrbVIScJZbGC9BYzaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RsE1fqnYQ0D/umEGmNaSWaZcYYZlpe8oJ4M9bNmQUXNC47OUyTTQ7DB18P+L6ECfU
	 BUOknsLyEtUAUxoXGJ8P/TLemQCIiv7oKKaL7iPzY3CrBKbeA/VaAUOTSQOnLviFpH
	 Z/1mOoDTt3raVyS/XYhqxZBV5YbWFQpPnBReB/ykzLWof49KucUxQCJ4tD5/dfiWkI
	 Wvqm1qlxJwJnHY5kRdOgzC9m2nEm6ThmVtaNH7tkkIPxgWfFZ59yHNhwe8jiGYfbmY
	 jrrMTJPPkCNVGmSDXakfvukg/6IL18z5IwrDVgDp6vHgvx+YVoswa+iJJC1RfYw/91
	 SVNFl3op8CVzw==
Date: Mon, 14 Apr 2025 15:10:27 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?B?Q3Pza+Fz?= Bence <csokas.bence@prolan.hu>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Varshini Rajendran <varshini.rajendran@microchip.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexander Dahl <ada@thorsis.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Pavel Machek <pavel@kernel.org>
Subject: Re: [PATCH v6 1/2] pm: runtime: Add new devm functions
Message-ID: <58e37046-f9fd-41cf-a5f5-f7cbb1eb97ab@sirena.org.uk>
References: <20250327195928.680771-2-csokas.bence@prolan.hu>
 <20250327195928.680771-3-csokas.bence@prolan.hu>
 <CAJZ5v0jmuzvo-xzGBDhGVBbY7svbrqEdi-SeJrx5BG=qtN6ZiQ@mail.gmail.com>
 <832eb5e3-7e2d-4ed2-8571-eca9fe129013@prolan.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nb4I0smoCForxcgo"
Content-Disposition: inline
In-Reply-To: <832eb5e3-7e2d-4ed2-8571-eca9fe129013@prolan.hu>
X-Cookie: Good day to avoid cops.  Crawl to work.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_071034_219554_F98E88D2 
X-CRM114-Status: GOOD (  14.61  )
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


--nb4I0smoCForxcgo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 03:56:47PM +0200, Cs=F3k=E1s Bence wrote:
> On 2025. 04. 09. 19:43, Rafael J. Wysocki wrote:

> > I can apply this one alone if you want me to do that, but I could also
> > apply the other patch in the series if it got an ACK from the driver
> > maintainer.

> I think you can apply it and then Mark can apply the SPI part to his tree.
> @broonie what do you think?

Please don't add random characters to my name.

I'd need a tag since the driver change isn't going to build without the
new API.

--nb4I0smoCForxcgo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmf9F1IACgkQJNaLcl1U
h9CVyQf+OoBLAj4WQr+H7BEg9lObLdNL4KRPrtCilkLER2n2jv1LKxR5AOVaM5s0
a5jKczyVXb543ZHBu2u2Mr3F2ofULa7INlrO88vcmVjI0QQgaKweqTO0Z6bL8atX
D0gRFG0/QKfQ/EscdGHTVDza0RH5LNDwzz7Jw3guBzw5lu1d7raDhXCmorKVzMAc
H1yoyUGhmLGv71cpmm3Y4vO3hvQZP4O50+8f83Ntf7A/TpByOrxd8RI6wtFndpJU
FJalHnIvuMSv1djWNklF0r2E41AheaCGCxGO3SlLffqjXbGh98QS7a3mG8yjMOCA
TR41WG7xTs+F7TjDT4E1tYyh/vdRjg==
=mnIx
-----END PGP SIGNATURE-----

--nb4I0smoCForxcgo--

