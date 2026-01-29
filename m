Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C358D73E83
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 18:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JUdHyZNOq5E/k+pnx6vME/sDIS6E4tKtCMxQPQQlKyE=; b=HsHRZRb+xZDx8kRD0i5S3Zh1Zh
	xAAb1p6neL1jka34LP5VbdBWbkugxoP1SulxtC7jeNU+hCForvThBA2UuQfmUFxiRHOW5rIIBEIuE
	k/5q7PfRdV3WRTregO/DLSYN28OeldbW8DsQXinpIrphsAQyUXzRdoEsOKQPHbLR9yqv8L/Edf/Vo
	x6XX6xSrkppgflQFi/kaYQT+9MW7f6ameGBUYTglRRg7jZ0ESF8Ae3rdwYAz2oLbIlmj0YQHk44yB
	tjxDOK59Ku9Yg2HDKoZKgX/7vK4Ct6uTzkwW5lZnR7HhetW0AcrqCfsxOyxw0p1hEjkJFgb9Bq2Jz
	DbbN2n3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlX2E-00000000Wur-35bM;
	Thu, 29 Jan 2026 18:46:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlX2D-00000000Wul-2gY7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 18:46:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 628C260125;
	Thu, 29 Jan 2026 18:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52281C4CEF7;
	Thu, 29 Jan 2026 18:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769712388;
	bh=/XmRd677K7t4nA7lfrF7vsZ6+myUyYCrAjhaJX3oWyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bRB+hfczSZAnFS0bS27/N5bOqxNsJ50x9GCCuznWE/6tU06LEeBRX+qiMeCdfu0/A
	 1ew0Igg3KxiBoHN54GuF3J+ZVys7Myrb6bob/C20vsRzHS+WF+u2+6HsTMoXMgnwSU
	 Q+2QkgW76b7Bv3ywFleWWnkXIxISpcwCgKAEE8JWY3b/6KNy4HmPPoNlqWOgSAi1xQ
	 EP24wGoUW10v3N82bKQ8Zj45pcgrWT4h8GHeSFf7Mt7lYE51aX2UgBurjv2qCBWTeo
	 yVJSd2JcDVc36tvXANcw8R6TxoTTIxrm8LcwnJhB/D0rS7FuMJEr8rn2RXe05x5f38
	 n53L1W6ZCoJ4Q==
Date: Thu, 29 Jan 2026 18:46:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <michal.simek@amd.com>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH 2/2] ASoC: xilinx: xlnx_i2s: Discover parameters from
 registers
Message-ID: <06b3d7e0-27b5-433c-85db-23e4c5ef5472@sirena.org.uk>
References: <20260129172315.3871602-1-sean.anderson@linux.dev>
 <20260129172315.3871602-3-sean.anderson@linux.dev>
 <700e4e67-a2ed-4b37-a00b-303bbc5ee6cd@sirena.org.uk>
 <a95d7feb-4d94-4b25-be96-c7c367342c19@linux.dev>
 <a17602f1-537e-46e6-a85d-8a005a0443a2@sirena.org.uk>
 <21a738e6-6585-4479-b797-f8b17df91aed@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WDImneD7x8BAel2Y"
Content-Disposition: inline
In-Reply-To: <21a738e6-6585-4479-b797-f8b17df91aed@linux.dev>
X-Cookie: You have taken yourself too seriously.
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


--WDImneD7x8BAel2Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 01:17:45PM -0500, Sean Anderson wrote:
> On 1/29/26 13:09, Mark Brown wrote:

> >> - Driver authors tend to use them even when there are hardware registe=
rs
> >>   available with the same information, as Xilinx has not always been
> >>   consistent in adding such registers.

> > I'm not sure I follow your second point - driver authors tend to use
> > what? =20

> Authors look at the devicetree node and see something like=20

> and go "Ah, there are the properties I need." On some Xilinx cores this
> is the only way to discover certain properties, so people have gotten into
> the habit of using them even when these properties can be read from the
> device itself.

Oh.  If the properties are there it's reasonable and sensible to use
them, them being redundant is a concern when specifying the binding but
once things are there any discrepency should usually be resolved in
favour of the binding.

> >> I am not aware of any errata regarding incorrect generation of
> >> properties for this device or cases where the number of channels or bit
> >> depth was incorrect.

> > I'd still rather see the properties get used if present, worst case
> > they're redundant best case we avoid regressing a currently working
> > system.  The code is already there, it just needs tweaking to make parse
> > failures non-fatal.

> I would rather remove it for the code size reduction and simplication.

We're talking a couple of function calls with no error handling here,
I'm not sure anyone concerned about that kind of impact is running
Linux.

--WDImneD7x8BAel2Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml7qv4ACgkQJNaLcl1U
h9Azhgf6A4lkfV/w0cwxwJ8Tc2SF7oD3nQbUq5FokALWMy6Lb7rfb+mrG+AaDude
NSQoQZx9MiQNLpSLIhOuENxQq4kDwkC1iiqZ4cr4D0Z3Boo6TnqPewzvRMzXvY3D
qUhkTEcIazjnWrl3pQqzHzP2hXBOLCRqfwkSqSvsR6Dx21wj9MecbcQvvuQnz9+b
ch+mxvLDXvMuyT7oDBG7hY1xhotLrqV5YrHmFYt74XBN9d5K3X/nxFjbP9/xYKKZ
KjMgSDGfOzYkTPV5ffJazJMIXRneUpYSIEDJRferfRuTOnMnOfnHLIRod9q8i5+W
88SY2gx4BRO2+4nKz4+MRxOy3JgHKA==
=RKex
-----END PGP SIGNATURE-----

--WDImneD7x8BAel2Y--

