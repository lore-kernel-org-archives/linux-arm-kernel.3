Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09489CCFA07
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 15:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=05s7QhxdzIV4M0EltkhCWjxKsXoYwIMqoOafTsAgdTc=; b=gqw3+1KRqfqT6x+D1m+b4D72OO
	BycypO+TmJd9f773AvDzwzBFU1UwXT5R6expyNSvXoDDl3UQQUacXiSN5hGmjGP1325edwmFdlgao
	gxFz5spgpTb1Qk/+MPlcdHQrtiDErOl0ULyy+17vrCNdqgeBYkoEHm7Ge49g8tBaUpba28uBrbh1H
	D3Mj5OtG0BXY8dq9mYM3Z6Hkd1U0TVKmhd+zv1PW/1Htb20bVCEHqcmsqzfdhH9uglt29vf4TIw8Y
	3c3+SmEldOC+OTRU3RagLxdVZwk3OBiY7SQHornoyhSlFUff7bZTE24KpLav025p9FfDx8zxmUP8r
	8offFB6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJFg-0000000C7mg-0kJP;
	Tue, 04 Nov 2025 15:47:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJFd-0000000C7lx-3Q90
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 15:47:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 17BD6445DA;
	Tue,  4 Nov 2025 15:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EED2C116B1;
	Tue,  4 Nov 2025 15:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762271237;
	bh=sNvgLU2tT2QtYcE++dQwFqfrLanXeBmZ4oNa9dmXiuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mCdInrer7LepIuBSWSpwRE+lkhLMT9QMw++9YEMTJILBagvaoNxLr+E0o5iuw+6qh
	 4/wP2J/i3qQhy5Kft/3TosLdM1EgHmFfsDK6IfYfxoZle5eaUgdBPc4bBPcnGVDqCk
	 KDErSYxmCqyp6oXXW1VrnfahWBgE9m/+PVH+EPJIt9FQkfqsuURo3cJDCqE+O2eLBm
	 H5C/ACbilrOMnKgtI/iXeKepbvLqkq/7r0yYg60InC0JDZv2lD5lmhMJiKxwLDUaGU
	 HnvSWLKkLYbiR9jWLoMXivF840mjsxtbmnf6d5oYx+LvesdpChJDbGY8UJRR9UTUBV
	 x1K59OjL2V1Cw==
Date: Tue, 4 Nov 2025 15:47:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
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
Message-ID: <aQogAfbrP9rTPLvI@finisterre.sirena.org.uk>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
 <20251014-vdso-sparc64-generic-2-v4-23-e0607bf49dea@linutronix.de>
 <aQjJNmwniQwwjeBR@finisterre.sirena.org.uk>
 <CGME20251104084442eucas1p2af1bd88393f4d6a532df1cd41f32a287@eucas1p2.samsung.com>
 <e7f05748-a11c-47eb-b1fa-cdc9dc6d05e0@samsung.com>
 <aQn8G9r2OWv_yEQp@finisterre.sirena.org.uk>
 <20251104162009-8cffa62d-e95b-466b-9a27-c51b0f5257cd@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zVoWTguNpry6X+3h"
Content-Disposition: inline
In-Reply-To: <20251104162009-8cffa62d-e95b-466b-9a27-c51b0f5257cd@linutronix.de>
X-Cookie: If in doubt, mumble.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_074717_897723_499E300B 
X-CRM114-Status: GOOD (  18.46  )
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


--zVoWTguNpry6X+3h
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 04, 2025 at 04:43:34PM +0100, Thomas Wei=DFschuh wrote:
> On Tue, Nov 04, 2025 at 01:14:03PM +0000, Mark Brown wrote:

> > I've now got the results for this specific commit, it looks like every
> > single arm64 system is failing.  I didn't test any other architectures.

> Which one do you mean exactly with "this specific commit"?

> 6a011a228293 ("vdso/datastore: Map pages through struct page")
> 10d91dac2ea5 ("vdso/datastore: Allocate data pages dynamically")

The one in the thread being replied to here, the first.

> Any chance I could get remote access to one of your test machines?
> I don't have access to the exact machines and that should reduce the chan=
ce
> of chasing down dead ends.

I can let you submit LAVA jobs to my lab (there's an API, a web
interface for (re)submitting jobs and a CLI tool for shoving jobs in) if
that works?  That's how my own access to it works unless I go pull
boards out.  You should be able to resubmit existing jobs, it downloads
test binaries over HTTP.

--zVoWTguNpry6X+3h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkKIAEACgkQJNaLcl1U
h9BXnwf8DrtoASOmIwCcathDthMIkBxak4gjtFCMM9nl89xoYXw0PBVjwG05q9Ug
wRGz5y1/4Lw02ScLoNgGHwrQvg+j2UZaRq5bxFZ/sTsAIk/EGp6BPS0DkaQscGWH
lua2F7kyuqAm4W68+aHxBoFfT/Tmj/IrNYJkAV0t1PSLxWAXckiHTsa8wpUsW857
Dmv99n18VJcp32FYPy8Cdgxcdi86Uta8cpqOkA9IDA/ExbpWmveGN+IkJklF7zBA
YdW9Z9zvjZ6yfNP4/HgLCx5G41XKX2Ra0iNKEvdrKC9mp5x5Ra2ogMPYFFYZDhBx
mWcYg2iUelmLcPPYxVsizqjhauW2MA==
=RR8q
-----END PGP SIGNATURE-----

--zVoWTguNpry6X+3h--

