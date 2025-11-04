Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC5DCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 13:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2HI4VzGx8Jft0k/SYGhKr/hloHThStj9yfHzVO+FIHs=; b=YCalroFH/VbejALdiChWgacXbV
	dkrnR6n+8u81pl1+lB/5c+bNnuewIcDrzI3JR2KroVc6uAySeBRONmwk7b4snIWnJ+wYpt5Lv292R
	qbQsJ0KmvQaUedgAGTU8hcVs+YZcs6NxHi4WlYEByfF0adHSdxjCjnv6Ov2t8NGBlCOyV7LoXC3V4
	PmlNiyj6KeX4JVNagXggjJ5SRa6rA/jpZYCRBhqZjv+236feao5bPoGPlW11LTG/hKp2RlVBG4trA
	VMpQK/Sk/hZhxTxVURnjb6RwUzooRXDk5tsa2/w7mbJ3QjAibD4aFeb5VrwMwZrWRIAm0fMM2KXE1
	ruIE8nuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGrR-0000000BrnV-14TJ;
	Tue, 04 Nov 2025 13:14:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGrP-0000000BrnE-37Yh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 13:14:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BDFA0601EC;
	Tue,  4 Nov 2025 13:14:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC57C116C6;
	Tue,  4 Nov 2025 13:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762262046;
	bh=TLHJRTKusGt1SWwlRj6IWh5YXbaorV2upXYBUOE5fxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AUh2v7+AGMG1M1KAwd9XVU0ZEEtc0idzYycFUQzUWn8Ne8ZLvkGSSY86BljMoFgdo
	 s1x1F0zLMZZorAwGBDtwzXG008ekfB2o6bSkbmQN/YZNa0Yb3NX/0Spx1pK5LSCKJX
	 tPsh/URzrvwZ4vKibGGiB2euAkENeKL+s3715RrKYE3esVh1YmYYRybpx7JSV58juE
	 JQZeNQaexG/UFiAJgR03lFTyYNyYI4eUvWniKFIwObKCl+z9ty1e1jSGqNI/L/sUlC
	 EWCrxCOXxDbQZzJGRUZPua9sRtBgCovGFpXYETDAkgeqp8F9+Y6erBbVv1roBV3Qhx
	 7aVbMCZamwO6w==
Date: Tue, 4 Nov 2025 13:14:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Nick Alcock <nick.alcock@oracle.com>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Shuah Khan <shuah@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Russell King <linux@armlinux.org.uk>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>,
	Shannon Nelson <sln@onemain.com>, linux-kernel@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-s390@vger.kernel.org, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v4 23/35] vdso/datastore: Map pages through struct page
Message-ID: <aQn8G9r2OWv_yEQp@finisterre.sirena.org.uk>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
 <20251014-vdso-sparc64-generic-2-v4-23-e0607bf49dea@linutronix.de>
 <aQjJNmwniQwwjeBR@finisterre.sirena.org.uk>
 <CGME20251104084442eucas1p2af1bd88393f4d6a532df1cd41f32a287@eucas1p2.samsung.com>
 <e7f05748-a11c-47eb-b1fa-cdc9dc6d05e0@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rRRcUhwA4JOwqNzp"
Content-Disposition: inline
In-Reply-To: <e7f05748-a11c-47eb-b1fa-cdc9dc6d05e0@samsung.com>
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


--rRRcUhwA4JOwqNzp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 04, 2025 at 09:44:38AM +0100, Marek Szyprowski wrote:
> On 03.11.2025 16:24, Mark Brown wrote:

> > We do have some other serious breakage affecting arm64 in -next which
> > are making it hard to get a clear picture of which platforms are
> > affected, at least the FVP and O6 are unaffected by those other issues
> > (due to using MTE on platforms that don't have it, those platforms do
> > have MTE).

> I got almost the same result while bisecting on ARM 32bit Exynos-based=20
> boards, so the issue with this patchset is not fully ARM64 specific. For=
=20
> some reasons it also doesn't affect all systems though. It is even=20
> worse, because it affected only a subset of boards, but different for=20
> each tested commit. The observed failure looks exactly the same:

I've now got the results for this specific commit, it looks like every
single arm64 system is failing.  I didn't test any other architectures.

> Then I've tested it on ARM64bit (RaspberrryPi3b+ board) and got the=20
> following panic on 6a011a228293 ("vdso/datastore: Map pages through=20
> struct page") commit:

I'm seeing the same thing on at least some of the systems - this is with
arm64 defconfig (I suspect that's what Marek is doing too).  For
example:

   https://lava.sirena.org.uk/scheduler/job/2039543#L1109

I didn't check every single failure.  Feeding one of the backtraces
through addr2line says:

/build/stage/linux/include/linux/page-flags.h:284 (discriminator 2)
/build/stage/linux/mm/mmap.c:1438
/build/stage/linux/mm/memory.c:5280
/build/stage/linux/mm/memory.c:5698
/build/stage/linux/mm/memory.c:6487
/build/stage/linux/arch/arm64/mm/fault.c:696
/build/stage/linux/arch/arm64/mm/fault.c:793
/build/stage/linux/arch/arm64/mm/fault.c:929 (discriminator 1)
/build/stage/linux/arch/arm64/include/asm/irqflags.h:55
/build/stage/linux/arch/arm64/kernel/entry-common.c:767
/build/stage/linux/arch/arm64/kernel/entry.S:596

(this is for this specific commit.)

--rRRcUhwA4JOwqNzp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkJ/BcACgkQJNaLcl1U
h9AuDwf/ZhCLlPLgluyDWUvdRnCQxJ2N1dGVAjMGRwZUyrTvO3LxFTQzkTL5nIcp
s6gUEfOujaroyD4CcDlNOBBu2V8JtVuzh/NuC5m2O9SbHiLyR2qay111fo14LogV
u/rKBgA0DjjCOsWmxyWcAB8abWnwgcTjN2YzIzoXh9RR+I/zmwjoOyUcTGGJpNzk
zT1lZjL5mXvMULyQVTH8fadw8kjyEt0TVMBb/kyMaX0KFWNc2g69WuSH9k72bHhk
CZp8Nzicv6Tna9Efz9IPio1+lVoEVK3up3fJJHRiorhknWDffaxf3D7VHLvZ5NmA
hQFWctpg74kN8ORA8oS1+bS5Ni2d/A==
=CgDl
-----END PGP SIGNATURE-----

--rRRcUhwA4JOwqNzp--

