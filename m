Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAF2E81A5D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 17:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+oXvLu6ZxeLpNomhtAAJKPtZu9MTBOvr2xjkuHRf3g=; b=EbfuPFbPVVa2isFIOL5z5ZqxLN
	0llDgR1cHBpK3p5U6r0ygjZ8L7G1KBqk9z0MzCxybjrFuUMNz2bwQl/x/VI4BfqJHjO+Ic917qYTR
	la4HQds2XjaHY9IvPQnww9gt5UphQ6p1074dEVksKHIX55HxQHEsy9ZV/QZ9qb6EE+qBtF+HynRNl
	GslGgl3NyOtrwd63G8xiNenZz+5a3tbJqPpLEFzsxVxLlZ8hMGv1aVJH+zwqY2ayN8iTbv7siEroU
	8dmjKEW3ZA9B805ErFpj4HoFBEQnlo/Uzy6sA8V1szfNBdK4dSm6NbZSmy7qns4SG2yrN+svEkA6l
	+AoDJLig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs2pP-000000077Lr-1Azh;
	Mon, 16 Feb 2026 17:56:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs2pL-000000077Lf-2Uef
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 17:56:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E2226012B;
	Mon, 16 Feb 2026 17:56:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5217FC116C6;
	Mon, 16 Feb 2026 17:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771264566;
	bh=ERCGwbyY1bFkmKGwHWKrXtrTgLjADaBxpidUngYJSQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Juskkyu4PhMtJRRrALXCQX062tnKt975IgYSRtZJX6mPz9cwEb8yGVTgDKrOSaYnm
	 dI5oLYwoH+qOQJM8LukRHoSRGk6fz5j0Vd87XSZt+/QhL3JJ68RqhR1BBcx4sS/uBr
	 080Cgf/ved1qRwSv/m+ZyRURyjeO0l9FQ3oaWTmWTq2tis6g9cVePXO//6hHA8XHzw
	 aCCLTigZaq8AxfHKwrA+FxQXL1bbYkyUPgdr2cx3n3IMviy10ky+SxLCW6ebSzmfN7
	 gWLP83d/4C3y1eBHc3Pp6tWceCwxLJ0SlFS6v16tb8hSKwM3a3marUNP6hvDgWLJwC
	 0nqw01++FjbAA==
Date: Mon, 16 Feb 2026 17:55:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Fuad Tabba <tabba@google.com>, Mark Rutland <mark.rutland@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v9 10/30] KVM: arm64: Document the KVM ABI for SME
Message-ID: <831bae38-3d8c-4846-b23e-464d70e94a5b@sirena.org.uk>
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
 <20251223-kvm-arm64-sme-v9-10-8be3867cb883@kernel.org>
 <CAFEAcA-nhHdwuQODmT4-dBCEuiut-jbHsCGVYByoMF77-UWbCg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u9ZyI9Npf85AkB75"
Content-Disposition: inline
In-Reply-To: <CAFEAcA-nhHdwuQODmT4-dBCEuiut-jbHsCGVYByoMF77-UWbCg@mail.gmail.com>
X-Cookie: Beware the one behind you.
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


--u9ZyI9Npf85AkB75
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 09, 2026 at 03:18:43PM +0000, Peter Maydell wrote:
> On Tue, 23 Dec 2025 at 01:22, Mark Brown <broonie@kernel.org> wrote:

> A late reply, but I just noticed that the cover letter says:

> > Userspace access to ZA and (if configured) ZT0 is always available, they
> > will be zeroed when the guest runs if disabled in SVCR and the value
> > read will be zero if the guest stops with them disabled. This mirrors
> > the behaviour of the architecture, enabling access causes ZA and ZT0 to
> > be zeroed, while allowing access to SVCR, ZA and ZT0 to be performed in
> > any order.

> but the doc patch itself says:

> > +Access to the ZA and ZT0 registers is only available if SVCR.ZA is set
> > +to 1.

> Which one is the intention here ?

I guess the second if we're going with the approach of making everything
depend on the state of SVCR, it's less pressing to do so than with
SVCR.SM but it'd be consistent.  I'll update, thanks for spotting this.

--u9ZyI9Npf85AkB75
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmTWi4ACgkQJNaLcl1U
h9Co1gf/coUE4P4tuYn1rKP9lPsMEHvcfhSgIjltgex97NMRomE8Pls4cxLzQ43P
WgNP+OmJtv1S3MECmR5aGn68bapqqQhEvHefBIAEiklWX96VRYvx8xkMzBq+9XYN
pTvbPUuNghFiABfakJcYwkdmIdfe2WehVPxHQt4rXCgZTv02aRzhtxxo2dh8k4PQ
NuoG0BpSFW9oDLllEm6je8EkUxjWiwnAoMSYIRouopHI3/LapX+crbLqJZiEEg5s
kHKTgA+w6Ysm3tzmLRsIMkv02cb3xXi81Q/C99R9VcVtiiBJ6dDRBUcPkvLDT7u1
ajwfzwv1+T6Kfp4y+Q9FFrSe9dmsLQ==
=7KFU
-----END PGP SIGNATURE-----

--u9ZyI9Npf85AkB75--

