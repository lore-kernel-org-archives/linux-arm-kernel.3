Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CA6CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 16:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8bPRaTt5n7ooT1zao42lu3u2on2Yz4d9p+AHGfrTD5k=; b=by8RL7yRxzZGBhuDEk24FQ7n9G
	8O4OW/+WuWPoQIP3XonXxGeIiaA0HNxFKEXOihOYAQI4iEVqxN57IK/to+P39IEY3RoroDLC72dQu
	QUjIbWL53es6ySqIxLt33ughlQWCNlsyfTOAQ7ioK0MkowCPXQzA+S8jj3Nx/IzKqwDRphtakSOqn
	3m3sHmMFajKWrSbXoo5dgossrxeRGzuolITjjOUVyEEfVZLq4b+dLS3fajp1GsOJhVsNG5W2euqn5
	JH3VC2sfP37xFbw50TaeEWzZ2q4fXHFmFsynEprSAgNHL1g97NtaCJlZyyIJWPaK+Lyt5te5gvKyg
	q4f/U5kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2hx-0000000FueQ-1XuB;
	Thu, 06 Nov 2025 16:19:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2ht-0000000Fudk-2TpA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 16:19:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A26A461909;
	Thu,  6 Nov 2025 16:19:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E994DC116C6;
	Thu,  6 Nov 2025 16:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762445968;
	bh=gYEqW7pTjmnipJi5Wy4m3ru4H5R578dICFIJMQfiHvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jH7Gu7G6EGNodkceKgA2+Z2PEYCdQ7YslEv7MyzElCwS1PB1oDz8vP0CvLy+Ll7tQ
	 kej53UyfleI6hjBGg3Yxr1fIBJ7B8cmzY3+4kBbQlPqpxT3bqRCtzW4vl3ruAaDVRQ
	 u/RJiajdxO7CVyDR89UVpdgf9TxOAiDBlM/Oh7eYz1aC9Uwl41FzGu7nq2zuPGyEcV
	 VRtRaxCC2Jc/QXASpoGyscEm1jUTuwVBxczqoyzIYUOatTr2pENBzuoAa/7shu4gMY
	 6yIqPorGBKVaTailUucZlpP9dkUlzhNvZ6o5ZNT8h4JIjkDfn5z0u3GyLJYMHCN8Sv
	 PbkgUEXN1B5rA==
Date: Thu, 6 Nov 2025 16:19:25 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com, Ryan Houdek <houdek.ryan@fex-emu.org>,
	Billy Laws <blaws05@gmail.com>
Subject: Re: [RFC PATCH 1/1] arch: arm64: Implement unaligned atomic emulation
Message-ID: <aQzKjZci6kgMTziA@finisterre.sirena.org.uk>
Mail-Followup-To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com, Ryan Houdek <houdek.ryan@fex-emu.org>,
	Billy Laws <blaws05@gmail.com>
References: <20251106160735.2638485-1-andrealmeid@igalia.com>
 <20251106160735.2638485-2-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XqQkjShh4NKVWX0c"
Content-Disposition: inline
In-Reply-To: <20251106160735.2638485-2-andrealmeid@igalia.com>
X-Cookie: If in doubt, mumble.
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


--XqQkjShh4NKVWX0c
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 06, 2025 at 01:07:35PM -0300, Andr=E9 Almeida wrote:

> +int set_unalign_atomic_ctl(unsigned int val)
> +{
> +	unsigned long valid_mask =3D PR_ARM64_UNALIGN_ATOMIC_EMULATE;
> +	if (val & ~valid_mask)
> +		return -EINVAL;
> +
> +	/*
> +	 * TODO: check if this is running in a ARM v8.1 or greater.
> +	 * Refuse otherwise.
> +	 */

The code should check for the specific feature you're relying on, not
the architecture level which isn't really a technically discoverable
thing, something like:

	if (!cpus_have_final_cap(ARM64_HAS_LDAPR))
		return -EINVAL;

--XqQkjShh4NKVWX0c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkMyokACgkQJNaLcl1U
h9BOhQf/VD+f+HyEnpIFksKgxLXU7d72NXlh1nSX4/yjfknSUrpBvaGlazKdJYEw
dzb4RIidHwSFc/5c0sQrNFj9TcvNAhsXtyl1XVBOhq5ciFalSQmH7U/inmfEdkqn
38OEgXR4iSDxuNntfTNbYNbwp8DGa6IYtTyyP7ijWr6//XeWcbv7MWWgtdDMhJvC
l+iTemYM671y/sCj1iOEUuuzXNGzdf4jpxZ5bQ2Zy/N7lAWeih6exHnbAo1LKTpM
MyZ2XjydJKneLttxX02ksw1xE0Wa2cxciSCZLiNMLhbIfuiAlguYRcF9vLmEn3tV
idJcKvq2oJTUs7Q7ehXcaSQ2TZwTRw==
=5Z1A
-----END PGP SIGNATURE-----

--XqQkjShh4NKVWX0c--

