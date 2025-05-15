Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83201C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 08:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vGScZsO6r1hfc8Q2MlMDQQ72aLVQSIQQSAdD4p2qzcI=; b=k2jvzK5kMD3B4jswBBZOBFDC66
	o/vYeK4h/GMsILKnKp8gMA/qN94307O2RDUozRLgeBXzbDHdpBbP6VoguODpOPrvQ4rVUoHi/aW72
	dmMkVvNWAHaWB0YO8Ze/6Ykm2JB79aFw5VYQMV9U2n8M0Qqa/3M8f9EgHPCoFMZ6nc2hUZR9EUUs+
	pcbgRxlHcPk717z5I9AuY90FUNEpy24H5cv+2PDYNG/HcjQVNNIb+ahkhBj1vyyRofpYs4j+ULBiS
	UdsOWDeIjV1rrXcQ54ojjL6gRBR1AOrhgj4B0i4NQYr/rvP4ee7LXB5P0ZT7qsOCjb1eV4ifUNLD2
	y4k4GrOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFURH-000000004P4-1T98;
	Thu, 15 May 2025 08:59:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUDJ-0000000024j-1Bcb
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 May 2025 08:45:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vGScZsO6r1hfc8Q2MlMDQQ72aLVQSIQQSAdD4p2qzcI=; b=Fta5E8m0XsCwBl1jEKt/mNC2XA
	eWZFXVxNyOFMzHrIcAzAKFzQmEI5ZuDooNRDCPW0Gt2BSwV0MvuU9mCMTSTqUArskzb4jYAFBUTuJ
	VJb9gZvkttSPRMkp1QNvTibjrdNZuxrSoSE2zu17PSMySwlhwlK+Y9udvjWxM4yTkvC78wKNVWocd
	9pQxa0uAYg1okR4/uNFiU+oVriPGVkMObPyi4ICZ0UJ9+DYitKnUjzv975GNwBhcd5WUaZXzRzf3s
	Wh8htJ3B10EpaMK3G2KokiRxOouB2ylajkSEjrITS0sumYl6CZ5J8oDN8lVHC7MMZEfaZGxEQbMos
	R4VezK4w==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFUDG-0000000HPSu-1fhN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 08:45:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4150A5C05FD;
	Thu, 15 May 2025 08:42:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76B22C4CEE7;
	Thu, 15 May 2025 08:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747298707;
	bh=SEgT+ObynvSN+V3bQsdKbGCKxjclg4N/cQwSPBeFXNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RFv3CN6RVuD3ZWfspaJ6Nbe4PN+U/ZhA10RKSVE21YGj3E/0I5Jv+9TR+YVUdUAUC
	 xSEGqo2J3PayIZLfGF8jIfq7LB7VJdgOiqVy6NJ2ldnAfkv/xnBg+ArFnTXJwOcLNS
	 MNyJCtcDvhnQPfAmcNz445xrxRJh7yLA1h04kLSrJiLGVrPGr6Lav4jdjyp2VBPPW+
	 G2RXqtm06alizQnWHnBxVs5TbuS2Qu/DW1jXqf7siUs0v87yyel8qVtAjpzrpwHeAQ
	 Paz449iCB4bMwoSkIdjz3DW3ooWQJtwpsbdN0nKkE4Cy4/3qVDNyViE1wjRSv7YeEs
	 tgX+yGPozcc4A==
Date: Thu, 15 May 2025 10:45:02 +0200
From: Mark Brown <broonie@kernel.org>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Vinod Koul <vkoul@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: Re: [PATCH v6 0/2] Add `devm_dma_request_chan()` to simplify probe
 path in atmel-quadspi.c
Message-ID: <aCWpjplhAXUvr9fj@finisterre.sirena.org.uk>
References: <20250515083132.255410-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/tGn05cm9PgSmYgZ"
Content-Disposition: inline
In-Reply-To: <20250515083132.255410-1-csokas.bence@prolan.hu>
X-Cookie: Well begun is half done.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_094510_682612_12016686 
X-CRM114-Status: GOOD (  15.75  )
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


--/tGn05cm9PgSmYgZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 10:31:28AM +0200, Bence Cs=F3k=E1s wrote:

> Change in v4:
> * split PM imbalance fix (now merged) and DMA cleanup (this series)
> Change in v6:
> * rebase to spi/for-next, see note below:
>=20
> There is currently no difference in drivers/dma/dmaengine.c between it and
> dma/next [1], therefore PATCH 1/2 should be safe for Vinod to apply. But
> this way PATCH 2/2 is trivial to apply. I didn't want to pull the whole
> linux-next tree, but if any ofyou run into problems, let me know, and I'll
> rebase the series on it instead.

I can't tell what the plan is here, or what the status is for the first
patch (since I'm not CCed).  The second patch depends on a new API
introduced in the first patch so it can't be merged independently.

--/tGn05cm9PgSmYgZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmglqY0ACgkQJNaLcl1U
h9DFVQf/RG3qVgLW9iXPcAUZnHYKemB71ZgR+Yrj0yChBw9ccK7Ns8JmX1XBzjJ6
KHRzwnny3bbg2tsX5/n66nch3/Xfl98SRYHNnmeQQsKDAuehwMGDnCr7i5QNNzJ3
m0H0qoCgYrjoye1vqrIWHqzYnU8lhZS5ywzOKZfzS8UXs+I+6ZIc/u2AzSMg7f+f
YEaKmv2tch11ks57fRmyI9cqVu1nSBUrEHbn+/wxsleBaed2LURNQz0pO1547z+V
P6Y8zAxD4wGLQvSIPlU8+/b58zLeZmhIBf3eBKFNk2pXAHI3GpBmr68i9YbmrRGz
tH3l2/oUsumQn6krkGQ42z0TOmIddQ==
=HOSf
-----END PGP SIGNATURE-----

--/tGn05cm9PgSmYgZ--

