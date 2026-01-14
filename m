Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DFCD38FEF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 17:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=coPAkiz6ujPpgLfd+yc/7+bTn1ZsoI0u0cVZPbi1idE=; b=UDi3hsp2hS7cqLEehWmwJQ9irt
	jy+RMhyQlYuBnGLbJOU8qncPoMCovaGc/GTMDQ1pNd5cPKPHFt6LkZOdFPgvm1cYpuabWEPlBxsb5
	UwA2YimxUbpPHaF2gJVTtNzEExiCGPc4jdzYGrDFMj0leXXIddQ3hvLU2pKyyxCCYy7xroA4wJy46
	+Rn8TnON6fFl6HE1zSa4nb6ghHVuis/Bl+FSGmgnOR7Zsjd1Eu3UrOVn/8zPUtxAiCIvEg7tLTrAz
	VjcC3Zx8k/263m1sdwoAN6XcxM3PPPutKB2X0VB/Px2jSYxXN4WSBVrekwTGT659H8zxjG4MHAyJX
	+MAQAQdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4LG-0000000A2jW-0RtZ;
	Wed, 14 Jan 2026 17:07:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4LE-0000000A2jA-3BXF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 17:07:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C00E6000A;
	Wed, 14 Jan 2026 17:07:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE6DFC4CEF7;
	Wed, 14 Jan 2026 17:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768410451;
	bh=MGElqEXwoRbt8mMzLI9gWMm6tx51R4BHJkiacnjgofs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vEolMwCHO3gyuvdGmOE3O9pKCM5M8SbSniKQidIWzOSx0PpTJ7Hj4ZwnGYFesCRZ3
	 nUL/jdfJLelH5D0whFKOjdwr35MISlOXKDOa6Lbi19ptoggFUpvSTGZlhxy8wcydSe
	 2ru/TkW9rbl9o0etsJta6Ukc466KaXjOjS0EZlRUsIFFI5uicpeVB9DXRy+PEASF5k
	 BFWehX7gdc0YEru5parDTnCckbHf4EXKG0ybaCo62t3jvZVfDovR7/4iu9t8FWPKOS
	 0BvNX/YWefxE1P6ozppwQ4KuBl43vg9R78UIaOZkuSwgv6K/q5DHyUyj8B/+g5oMax
	 iic2DLJRvz0ug==
Date: Wed, 14 Jan 2026 17:07:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v9 22/30] KVM: arm64: Expose SME specific state to
 userspace
Message-ID: <1b5493ed-2d44-47e2-916b-3a5052e3b88f@sirena.org.uk>
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
 <20251223-kvm-arm64-sme-v9-22-8be3867cb883@kernel.org>
 <CA+EHjTwMy1crsZLqfy8_Y56NFPJZ7vGyN-egc433GhxB_n=7aA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wWm1d/lEDlGXNOgF"
Content-Disposition: inline
In-Reply-To: <CA+EHjTwMy1crsZLqfy8_Y56NFPJZ7vGyN-egc433GhxB_n=7aA@mail.gmail.com>
X-Cookie: Absence makes the heart grow frantic.
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


--wWm1d/lEDlGXNOgF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 13, 2026 at 02:06:53PM +0000, Fuad Tabba wrote:
> On Tue, 23 Dec 2025 at 01:23, Mark Brown <broonie@kernel.org> wrote:

> > +static int sme_reg_to_region(struct vec_state_reg_region *region,
> > +                            struct kvm_vcpu *vcpu,
> > +                            const struct kvm_one_reg *reg)
> > +{

> > +       reg_num = (reg->id & SVE_REG_ID_MASK) >> SVE_REG_ID_SHIFT;

> You use array_index_nospec() below for koffset, but it might be worth
> using it for intermediate values, such as this one.

This is following the existing pattern for the SVE registers, I'm
trusting the logic there.

> > +       sme_state_size = vcpu_sme_state_size(vcpu);

> Is it worth caching this value and storing it in arch, since the state
> size doesn't change after finalization?

It feels marginal, and we've not been caching it for SVE all this time.
Most of the time we use the value we're doing so as part of a fairly
expensive operation so it seems like a reasonable choice.

--wWm1d/lEDlGXNOgF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlnzUwACgkQJNaLcl1U
h9Cvrgf7BgTXha0CzEi5j4VgVBXcclvOZGymP1dBDz6D4Y8U/TMKH/bpOQcIjws/
lkQGHPmKpBCHKgkE9ZCJu5oOQqQdCjFh9pHQQZwJM1QMRg/P/cwzO+CoyMsIkb1A
4o2x/8WgiXF4LRsm4hmHRDR51VYSsH+Pg2dVgpSdiyIG1xi02AzthMF9vY0/fEiE
GHKptYCfpxgy14m/Ns0VKGfgNXAXH6reAeVqWVo5BQ0K9a5M1pFAIoLyaKFulRTR
0jgqosqFLXemYeGJ99w1TFrJRO3bltyiVULxBQBDupshqNvIwApsbjn92T0Qh8ir
VwMGpz89Lk6CAe/3AHGVTw/0GgAFBw==
=h+Uy
-----END PGP SIGNATURE-----

--wWm1d/lEDlGXNOgF--

