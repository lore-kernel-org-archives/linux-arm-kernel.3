Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EE8CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 13:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvN082Tgo45NxAv9qOCzujCY0L4Wp+Q7wkeySWpj1K0=; b=4UdMit4vSWjQpAMbAIFwwBEbjE
	E6edOF5ewTGNR5imeX7/z3rlRMCP4ewKa7l0acqqWI0yH7wdFipMEAgMA8O6k4I4BFSWIzFVUa7oW
	Gt9HX5JGAafJBgZAcioQF896i5uIbvhlMEz4ytsUaXUg7PhOoq5FdYLx9GkCI+V+XjcEx9AA8UI6G
	utlSbDoVWJHVzMECQ0o8uH3h2MMyai4hpSLii5wR8BYvp5NmCJDqRNDWe2Cc56sCLskK6uC5vQeJv
	nmoKeDayO15u8dLq/mO1QeVaEw6nXhk8eWrIHxVA20ZKVpAXzFhLBpbgYw/Hmqvf54xVcV8pNjmFP
	e0NKpc7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0DO-0000000FcA1-1ZNA;
	Thu, 06 Nov 2025 13:39:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0DM-0000000Fc9m-2423
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 13:39:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E232F60236;
	Thu,  6 Nov 2025 13:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06FADC4CEF7;
	Thu,  6 Nov 2025 13:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762436387;
	bh=lvN082Tgo45NxAv9qOCzujCY0L4Wp+Q7wkeySWpj1K0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pj9jE7yoInr9BCWfLJ0Y8+K6jrgVmgkwml63N4WoByHVsIr4RWQ7jaDOc81VdNYJ8
	 iTSCutwFS0KKGPYd8MgmLbSZozfDICTrA/EwOxswYw32R5r2FcMvYuyqLSnKlg09GK
	 ZGqwqyOq5eWuvrCT8KWgRiq/B2qmCmSO815iikAweI9cxudRZAg/pcDZnnUrPzQRrs
	 cN2lwF4mGeI/cbxWZtf3kduZfEEOnF+HlI1wbjFN0rVAlsEKu9W/Nk6ryO+lT+57Vi
	 zzU+PGx4Sd+6r49nkGvK51PgNHObALx0PSlYhCn8Qq3ZiZYk2NFEy6IKxYmHxQusBf
	 Wc8wnQM0TuucA==
Date: Thu, 6 Nov 2025 13:39:44 +0000
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
	linux-s390@vger.kernel.org, Aishwarya.TCV@arm.com,
	Ryan.Roberts@arm.com
Subject: Re: [PATCH v4 23/35] vdso/datastore: Map pages through struct page
Message-ID: <aQylIPCo1sEnJF4F@finisterre.sirena.org.uk>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
 <20251014-vdso-sparc64-generic-2-v4-23-e0607bf49dea@linutronix.de>
 <aQjJNmwniQwwjeBR@finisterre.sirena.org.uk>
 <CGME20251104084442eucas1p2af1bd88393f4d6a532df1cd41f32a287@eucas1p2.samsung.com>
 <e7f05748-a11c-47eb-b1fa-cdc9dc6d05e0@samsung.com>
 <aQyig5TNkw2YJm19@finisterre.sirena.org.uk>
 <20251106142956-d6251eba-c696-4a2f-a3e3-af461530d932@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EYbPhjGrYVw8SR92"
Content-Disposition: inline
In-Reply-To: <20251106142956-d6251eba-c696-4a2f-a3e3-af461530d932@linutronix.de>
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


--EYbPhjGrYVw8SR92
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 06, 2025 at 02:32:56PM +0100, Thomas Wei=DFschuh wrote:
> On Thu, Nov 06, 2025 at 01:28:35PM +0000, Mark Brown wrote:

> > Given that this issue is very disruptive to userspace it's causing us to
> > miss huge amounts of test coverage for -next, would it be possible to
> > drop these patches until we resolve the issue?

> This issue and the observed panics should be fixed in v5 of the series:
> https://lore.kernel.org/lkml/20251106-vdso-sparc64-generic-2-v5-0-97ff2b6=
542f7@linutronix.de/

> I'll ping tglx directly.

Ah, fantastic - I wasn't aware of the new version.

--EYbPhjGrYVw8SR92
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkMpSAACgkQJNaLcl1U
h9ApqAf8DFWNLEwpnWuEpnrOTVfL+iVYzK6YSgBge+QboC8tTBNFnMnnQ5Ht92aC
QaU0hO+PO0XJiyMXzjXfT5JgDO8ovlQIUShX3kjD7MF/MuSGdEAbRUEzoFj4d170
GN1BVZ8iAysXN0NytDNcZImpsxwVva2BtBFzYouhWlcDg2eRPWhzd6tvmJY3b0ZI
qn9eJOHvYiqh6I4jaF/7mI11G/JYp3x3738trx8FMvZxgxL6y0O0MQ8lETGJTaao
EwYoM4wyzL8dDJ0r4bYy7pGAiIKFQXpASY1pInXJQ/NVO4fcAC7E47S0u5odZz1h
lhDgGOw14KG8UFp0J4rBQQRfSWDhCA==
=oxel
-----END PGP SIGNATURE-----

--EYbPhjGrYVw8SR92--

