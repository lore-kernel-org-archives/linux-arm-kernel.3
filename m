Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3416C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 14:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I2X51PbVx/BFVJ6LA8OK813ZCDWpSmXg2JC3L04Zccg=; b=I5ewwidTmbjxaJ1jTCc8bY7/tm
	CRDrAWNQ/q5XaKcTPQvMAPUh38XMjJv42RUX2NXQ0EzgAb2ssDumJjH9Pn43qmXmTIAJJ8SEbVP1A
	Wayr55vpRZy3k9z9Tt8BzMbMeQAuzcFFCga++ocjTg/xy6vi0uMunXZD1jNpTZXicG2yNL+7oFoZa
	1YBRbccULga/oJ8Fr7KXJhtULAOWTrWHk9YOP+iAwGlSK/LVv5hf9OjZjEia2pmSkc18SwPIwJi1W
	6JcKXbazWQ3TK8CdIKEu30W260nFs+Ou8NOy7TiIZ1wTyMMhYHflLs5kyY8kZCcbdaJ4GPJd3GGTX
	e2RngzwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl5xv-00000004A7Y-1Z2d;
	Sat, 18 Jul 2026 14:24:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl5xt-00000004A78-3TaZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 14:24:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4272560018;
	Sat, 18 Jul 2026 14:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09EA71F000E9;
	Sat, 18 Jul 2026 14:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784384667;
	bh=I2X51PbVx/BFVJ6LA8OK813ZCDWpSmXg2JC3L04Zccg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MLbiH6aGlQARFRsEAlT96uAdWJuJ+GS0r6dW7tDq1vw6FAFXkn0jdnMzF3AgpUKTs
	 +jY/68c6WOZtDdG6v3RSGn1VEqqhvfNDvYgbdvnW0ItgrxgClhpUYrjCfqzhx2Wk8T
	 PsaW2+yf4C/qclVWDG8cd3lBFNE3hwxF997q66ouMDo2TCZRS0XkpVwAET+7Z1FVRX
	 AWnVu1p5q7vPD3g0zeInT4+2dB6E/lCWsg2PKFAshPiucSqc80AzCCT2AnvKBIV4E6
	 Gg2LwnlWCl+d1kBWuzdVbbpb0JBj7FjwJcUbmGnPWb1eeSkOEF4tAVFEXVyKK2TNBZ
	 RSMst6SU7+/Bg==
Date: Sat, 18 Jul 2026 15:24:20 +0100
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
Subject: Re: [PATCH v12 02/29] arm64/fpsimd: Update FA64 and ZT0 enables when
 loading SME state
Message-ID: <43f21c65-c5ba-44a3-9741-548390df369b@sirena.org.uk>
References: <20260709-kvm-arm64-sme-v12-0-d0301d79ef58@kernel.org>
 <20260709-kvm-arm64-sme-v12-2-d0301d79ef58@kernel.org>
 <ali39DG6qie7XTuD@J2N7QTR9R3.cambridge.arm.com>
 <15a9ae14-395d-472a-a5be-9e46524fb493@sirena.org.uk>
 <3c76650f-ddda-47ae-a676-86016d8e39a6@sirena.org.uk>
 <CA+EHjTw9rGvQyev-4i7zkO5bPPZKGYn858485dCs8iHmCi0t3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D59yeImOKcklFS0z"
Content-Disposition: inline
In-Reply-To: <CA+EHjTw9rGvQyev-4i7zkO5bPPZKGYn858485dCs8iHmCi0t3w@mail.gmail.com>
X-Cookie: Do not pick the flowers.
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


--D59yeImOKcklFS0z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 18, 2026 at 02:30:04PM +0100, Fuad Tabba wrote:
> On Sat, 18 Jul 2026 at 01:35, Mark Brown <broonie@kernel.org> wrote:

> > Actually I remembered: while SCMR_EL1.LEN is self synchronising the
> > "without the need for explict synchronization" wording is not present
> > for SMCR_EL1.{FA64,EZT0} and this is no longer explicitly just an update
> > of LEN.  It's possible I'm being overly paranoid here, I'll leave the
> > isb() and add a comment for the next version.

> I went through the ARM ARM (DDI 0487 M.c) on this and I don't think
> you're being overly paranoid, I believe the isb() is needed here.

Thanks for double checking so thoroughly.

> And task_fpsimd_load() does make indirect reads of both fields before
> the next context synchronization event: sme_load_state() executes LDR
> ZT0, whose execution at EL1 is trapped when SMCR_EL1.EZT0 is 0, and
> when PSTATE.SM is set sve_load_state() executes WRFFR, which is
> "illegal when executed in Streaming SVE mode, unless FEAT_SME_FA64 is
> implemented and enabled" (from the WRFFR description). The MSR SVCR in
> between doesn't provide the synchronization, since SVCR's
> self-synchronisation wording covers reads of its own SM and ZA fields
> only.

Yeah.  We should be able to optimise this:

 - If there is no change we don't need the isb().
 - If only EZT0 changes and we load state where ZA is disabled then we
   won't try to access ZT0.
 - If only FA64 changes and we load state where streaming mode is
   disabled then we won't try to access streaming mode FFR.

I've gone and implemented the first which will suppress the isb() for
current host kernel SME usage, the second two are starting to get more
fiddly than seems sensible to do right now.

--D59yeImOKcklFS0z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpbjJMACgkQJNaLcl1U
h9Aa2wf+MFnftbhCaUZX6WuBgJ/1JcYOGHYcvRPNQIAJbA+FOcoEoAhxy9zmXj4E
Lj0HbydOLUFDNPTHJkNwKiBFX1bMmV6G4zai0jO0hNEdSrINc3XsQIvPZ05V/wnf
P/22rDBegxR4h6onZCxuJybhd7tHT7HEzr/PSHT+7jq4UjUwNwFUafSkF1a4Wo+i
OXEs6TU0LE4WFCXXKAZQDXNwT4uZcNtcFz+zXupnqRMWaaYyXY1h4PNvm7gl4UMK
nizzA8eTfz10eI2NXtoYUDakxs+r3DKc1PF5a1WQaII9na/Ta1YymODmNqjNOSJv
PmJ5ahScZWWJKbSaPYCK0A9YyOGYKw==
=11bz
-----END PGP SIGNATURE-----

--D59yeImOKcklFS0z--

