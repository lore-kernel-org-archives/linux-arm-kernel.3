Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15E8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 11:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TtGOdqwY0KuojvV8YYw/HtNgBXr2vYI0UMqzFnUtGbE=; b=ZRf9Od5R3Txn98hOeCZep8YWbT
	K8DV6OOvfQksI64XRiDYRRbM4DnGM21Gm7jLNXFEcvTfUATG81WoiBorGT6aQTz/2bbNxZIkT9oi4
	qoL4F9b4vrW4Gyq5KrIKVCryA2XB87WRRevjjOveOYqwxa9ozWzzyzMwi43oWuUiRI8nmddkXygqr
	4o391ZLNgnqNt6wFCJjO59RhwX1brTwOhQJy5TUBZiPc76HUfvH9rVI3aXexpCBCxk1+0vlCzyrY2
	wrt7mOUlKWqY5Rq/sfCS6NvMWyRvsRdfnbpuYobsFx9F8RFw8gxtAAvLCrwJGUbck45WcO0bDP3jB
	eQOY6tZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnAg-00000002F3g-3uJw;
	Thu, 09 Jul 2026 11:44:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnAg-00000002F3K-0KCA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 11:44:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4990F6001A;
	Thu,  9 Jul 2026 11:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D991B1F000E9;
	Thu,  9 Jul 2026 11:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783597441;
	bh=TtGOdqwY0KuojvV8YYw/HtNgBXr2vYI0UMqzFnUtGbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YJr3Esz2DICzZk5KDvEXQNvo6ASxPM9Zw2D5kGxAoIyEbtolY+mldGhVCsFrLzFfA
	 g8LomLwuURqx6wdNvGaCqnDIaGLqUVV64fhcC0yFwhuaOso0dAonQakqoQdeZGszFN
	 R8WllypdDbwT/dpUkSzz/DTlR2lt0HknEfqgyAhmvcOE4UdR6YfFfofZlbLsB6C5DZ
	 8QDeEDHlzatbnLGQWMi/H7g9AgF1S0zVO09lKDFD9bOE4MU5Qch9B/4wOn2hFgtCvx
	 zIvaVa0Tjp3GCz4ygWegRppEcRf5BCRwQrD0JE2j+vlOtTgjdEG7CXia5Kw28tk6nq
	 QSvIgmP8uUj5g==
Date: Thu, 9 Jul 2026 12:43:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v11 00/29] KVM: arm64: Implement support for SME
Message-ID: <eef020cf-68d8-42f2-9303-292068c839a2@sirena.org.uk>
References: <20260709-kvm-arm64-sme-v11-0-32799f66db9d@kernel.org>
 <CA+EHjTyAxBx4jhGq-Gme5hPi1ZyDAkL2CP_U22ykkQemD1dUhg@mail.gmail.com>
 <ak-Fyvzpj9SkF75j@J2N7QTR9R3>
 <CA+EHjTydGzbgi9FwWQaFjuRNqUFC_HeOfHggZAHhPL4FfLYBog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lZsf7WESsK5u0OW0"
Content-Disposition: inline
In-Reply-To: <CA+EHjTydGzbgi9FwWQaFjuRNqUFC_HeOfHggZAHhPL4FfLYBog@mail.gmail.com>
X-Cookie: MS-DOS must die!
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


--lZsf7WESsK5u0OW0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 09, 2026 at 12:31:45PM +0100, Fuad Tabba wrote:

> Thanks, I have 7.2-rc2, but `git show
> 4c45e14df2f4e77982ad70d6d8e3fe750edd4c37` gives me `fatal: bad object
> 4c45e14df2f4e77982ad70d6d8e3fe750edd4c37` . The SHA for rc2 is
> 8cdeaa50eae8dad34885515f62559ee83e7e8dda (which is what shows in the
> link above, not sure what ID is, which is the part that matches your
> SHA.

Which version of git are you using there?  I'd expect that anywhere in
the git UI that takes a commitish (like git show) would do the right
thing when given either a tag name or the hash for the tag, it certianly
seems to for me with 2.47.3.  I'd have thought it more likely that
you've not fetched the tag and therefore don't have the object.

--lZsf7WESsK5u0OW0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpPiXkACgkQJNaLcl1U
h9CmrQf/e6LMFzC4cy2DvRx3al+SDYi/cTU553QQ/IWhh4rA+PABr4GBmfuVgCcL
4Dp/Le4V6hRNPKhBNVBKJdugKbKOypc5lildh4HuXeCxwOHLUxm/4/xDNE29bAD3
gwyQ40mmVrWG5G983wOiXJTBnz/4j1LQ3O7zzO68HYwbgu9We+PrD1HLDTQhfyMo
BcRSm/9HCrOklBJFf5VILalR79AvLDgI0ProCmvrRrKk5sZz98Nqumo7nLqN/vra
OycGQBsvmHnnkNGH/cpEKTEPGUJWsHmWYdzwoZecuDe+eJpX0yD9bSLGtomtXSou
dRHplDX80nR4V4HlwCiravHQDsPHgA==
=iYLX
-----END PGP SIGNATURE-----

--lZsf7WESsK5u0OW0--

