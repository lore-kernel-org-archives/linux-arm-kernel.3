Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A63CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 13:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azAivItrY49K4UEWYLYRHt/ABH+lv/uzEUAK+JesQvU=; b=s5M9uSOlwLePsXvwNveSgfxxCh
	5T03rRe9UjkJcvQ9hJWUn2Xmc2eroqCyn8takc51pjnncUqXO/kRi+dIjfsO0i82vqhJ/wgPPsF9g
	2NAWMXbG/VVuocy5pnxBUcLVImOibU6TEFJ6qeWJKhaX8TdsRDLqnLbQUhV43AZ+ueX6Gv2dIJb1C
	Qj0eBw8mZBNekQgar2pCQPdwpatGv0sb43DyGSQ0J7WHJDavqP2dOHtgSbhwRQ1SXFo4kRTXXbWsW
	neFAEiN3va+POs4cp7JGuZQkWrAvwCBhcdpqxoPeMRE61EnVLfE7C1nMFUIkD/0cv0sQVg8JlRlTd
	hZjFsenQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGH6W-0000000Bszc-0cCd;
	Tue, 04 Nov 2025 13:29:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGH6V-0000000BszJ-0mq9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 13:29:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D5D9601EE;
	Tue,  4 Nov 2025 13:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A062C116C6;
	Tue,  4 Nov 2025 13:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762262981;
	bh=azAivItrY49K4UEWYLYRHt/ABH+lv/uzEUAK+JesQvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F7Hjr3XXl0wQ6S3iFdZF1fsWAaniWWYVjMUMFOIJoxwxwG7Pdt5Q0uoBuKT25gqwg
	 lEz+KP3L9DEWhfwLtWQyANZbT349w+tMTDOFwZKz33/HLWZtWtJ6dR2iveJMA4OzRX
	 erIpsHPp7L5Mb1SU6CLwmjZR8Jcdzc4vfBaVHd5T5hzMrsk3QEdctGHJa6D8Mjc0c6
	 5LLMlS9wnVeGjT7cisTQFuxpFn/c3zVixGIreOkBM+QBI8NyzYNm8+6L8x0GlqVCk4
	 h09XYJA7Qt/yd9XY2mSb9HhEa2mV76Vaia8dMabqnpGlCecthwd/NVPosoImOzatBm
	 3ebOICKClbf8w==
Date: Tue, 4 Nov 2025 13:29:38 +0000
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
Message-ID: <aQn_wgG6bLhDL0xJ@finisterre.sirena.org.uk>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
 <20251014-vdso-sparc64-generic-2-v4-23-e0607bf49dea@linutronix.de>
 <aQjJNmwniQwwjeBR@finisterre.sirena.org.uk>
 <CGME20251104084442eucas1p2af1bd88393f4d6a532df1cd41f32a287@eucas1p2.samsung.com>
 <e7f05748-a11c-47eb-b1fa-cdc9dc6d05e0@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+bUc+8DkjVNeTm22"
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


--+bUc+8DkjVNeTm22
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 04, 2025 at 09:44:38AM +0100, Marek Szyprowski wrote:

> I got almost the same result while bisecting on ARM 32bit Exynos-based=20
> boards, so the issue with this patchset is not fully ARM64 specific. For=
=20
> some reasons it also doesn't affect all systems though. It is even=20
> worse, because it affected only a subset of boards, but different for=20
> each tested commit. The observed failure looks exactly the same:

I'm also seeing other architectures affected looking at -next, I see the
Avenger96 (32 bit Arm) and VisionFive 2 (RISC-V) with bisects coming out
on the merge of the branch or on

# first bad commit: [10d91dac2ea5ddf04e647cf862430d1051adb839] vdso/datasto=
re: Allocate data pages dynamically

It looks like the uniprocessor boards I've got (at91sam9g20ek,
BeagleBone Black) are running fine.

--+bUc+8DkjVNeTm22
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkJ/8EACgkQJNaLcl1U
h9CpkAf6A+69+z2QXStQyH9xpQ9GPBEq+tDAXKjipsigRts9dJxv2bGY1a5Dh8au
FBJQ/jhD8D2X6RlQHTv40vs6tG60GIngt24OmI3FasOGwxXhtwBcLaS0aHHlYUUt
qLVORv6xfBq3F6/wDzQ1aIDlPTIy400fD/eCJUwI083H1txPvzlYMm12cIWIiJ8u
bT8xDPGVKJtPEbLohQkWfoI6tPvxoDxzOGziUwQMi4XK8U2/4cEhIPve/Aa9GbpF
+ZCmks9cF4bslJWUjVPor98/kGlIRc722fvvOaukvYQv8rrS79j7XNfo78Bw/d3g
b6y91B0A7gLZU52AavqrMnJTlHXHQQ==
=LyBm
-----END PGP SIGNATURE-----

--+bUc+8DkjVNeTm22--

