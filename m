Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF866CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 03:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0VqaJrtmlGnmqJFHB+QPAdum1A1l6aJG7RH2ObH9Yk=; b=x41v/s9vmpXPZseptELGxc/JAo
	qJ1bXwIoKG7QR3Rki2qUnIqEdku0tLOdAWXpCql3QJXb4tBJnYuxAdj1AOXCoO8aC/m1hL6mjFyZj
	kG3WT5M9u6Eewmr/JnaQ8fS2ioVk94wy8hOq+zwmpyAV1/2x7MdeHULBJZJJP30JhxUpBciiWGv8r
	7PSZRVZuJEMZWTFmNO6GjVtSqGKNkT4Hid4CuJbW66iBFQ9q77VIHEX3snTIVFe1F1fPXA3j6n5Re
	4hWxXpuP6n+QbWD0iKyLQYI3Qlst1wJrzwlTq/XjIddoxo9kaVdzH9ySyg+9O9aIf4eQLZ/vGPBqi
	I8Wc4s+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO5Gr-00000009zsm-18kQ;
	Sat, 16 May 2026 03:00:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO5Gp-00000009zsH-0NwR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 03:00:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 421BD41959;
	Sat, 16 May 2026 03:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8A96C2BCB7;
	Sat, 16 May 2026 03:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778900454;
	bh=HFLpP0j57Gst4fAbdNsreMBu/SwQoUZ1kgnq8j+IcOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hdDsscDNmeL62JgZyX0rtWcMD1xBb532z/HpVKZ3REYKXl0dI7OmYkmV+8w80da/L
	 nPxcPUHwo66Tz0PZA/aT+42eq+c9w4cWxf0QGrXWVIp2FEPEImCZzaZe9RPNaaCUUe
	 PUq2sE9bemEPg0sYSMexZ9LrSUgSWOqI9aeGvHy4xhedERQ9NGh8mEhoQPgIajVcGh
	 9doQzUTQmaV7EPD2+wksEaD8CGmBeJ/OIKLYG++RhjfryFDv2nhLdiFQwmqJmMlHu6
	 NxTAMq9e/sszeYTHyoQMucCOBu0qlAnf/lICxYtypNj8DaMg60dftIZ4buaYiI2wfJ
	 Ti8BBQNTYEW6g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id B913E1AC5A48; Sat, 16 May 2026 04:00:50 +0100 (BST)
Date: Sat, 16 May 2026 12:00:50 +0900
From: Mark Brown <broonie@kernel.org>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ASoC: stm: stm32_i2s: Use guard() for spin locks
Message-ID: <agfd4gvQ_m3Zt8GP@sirena.co.uk>
References: <20260513104329.81592-1-phucduc.bui@gmail.com>
 <20260513104329.81592-3-phucduc.bui@gmail.com>
 <agUknFcDIfwrOCld@sirena.co.uk>
 <CAABR9nHfXi5G4+sVnLbWWJctQHkWASTzTwiV424bO6BXZDqX+Q@mail.gmail.com>
 <agZ92TVjcYpEv_eH@sirena.co.uk>
 <CAABR9nHR13e3d46_Z7Q8ZkjQzKbkcPs2Er4sAvq6G1EEj-xoXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Wb7h2GZXqtWpMj3T"
Content-Disposition: inline
In-Reply-To: <CAABR9nHR13e3d46_Z7Q8ZkjQzKbkcPs2Er4sAvq6G1EEj-xoXw@mail.gmail.com>
X-Cookie: Truckers welcome.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_200055_157424_CA789FA0 
X-CRM114-Status: GOOD (  14.76  )
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


--Wb7h2GZXqtWpMj3T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 15, 2026 at 11:48:55AM +0700, Bui Duc Phuc wrote:

> From a maintainer perspective, is there generally interest in gradually
> converging these drivers toward more modern/common PM patterns,
> or is preserving existing hardware-specific sequencing usually preferred
> unless there is a concrete issue to solve?

There are likely to be different considerations for different drivers,
on some systems the power savings from managing the clocks may not be
meaingful or we may need the clocks for register access.  In general
it's nicer to actively manage the clocks but it's not super urgent to do
so from a framework point of view, it's more a how much work the people
working on the individual drivers want to do and if there's a use case
for specific hardware.

--Wb7h2GZXqtWpMj3T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoH3eEACgkQJNaLcl1U
h9CWHAf/dTTHqWbJspq/0Qx6ffNRKEylxcdLqo4FSGl/tNx3HRkaSdyCNp1MGOW/
JBoLRDGCg6Zzt9LCEnQVLDIui/dyYHlgeHyPUsRNMoW0CIGvkiv8LAYfBb3fqenB
wDzwLZIlYwjuO/GmD4upv0XA+rT/YdNHmL2ENMmKDD9e4k8aI4V6kOHhc2ZXpV3f
VomzNihV82+hNOs9885tQOnf3haJwwAPG9yuUqJA9M4a3jdm7WEk6tc8+N7rtltR
4Satj7kr/K6bUtWJDRZ+Z5Nbpr9meCN5PSD+qZt3hWhiVAaQK4w9hKKhS+1oxWAR
/c6vmVHrbIq7x8SebQcdDs/oHp4ijA==
=76w0
-----END PGP SIGNATURE-----

--Wb7h2GZXqtWpMj3T--

