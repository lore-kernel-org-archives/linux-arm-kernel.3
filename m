Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83F3CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 14:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rks74Ok2xVDZRYVekwVF/tod1CxxsRBTTzdE/GlxP70=; b=np4ncOBcJ6URQj+6qLrOJ5War7
	MIhdJCK/0Aan7c2VXFETLi+WVreXcXfxPYKiU59zaFzLOk2wSCedFxFOApdlBKhydFjjtIr4dw6ld
	8EVHXBVLF262Unk/r0yUlPYRe8zicIdS/+Br3jHuWFZsDkNoXl1JaEslyzRLciYK5ya58l/9vSI0b
	nDsYJ0K6Gos7JcGfUZXBUlZrf++Qb3I2nPMJnLilImG13OocItIk+Kbs6eKvxDD6GaJdGV0uVLTgi
	XGRoMsDt4FeU/nLX3MfXVWlW/pkwOpghnOyCSdI0kFpARt4FgxDdc4KX7E3xqJJPsTglWmQHkeR10
	ZAE0usyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0ZL-0000000Fenx-0Xxm;
	Thu, 06 Nov 2025 14:02:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0ZI-0000000Fene-14jd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 14:02:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A86BE601B8;
	Thu,  6 Nov 2025 14:02:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2A90C4CEFB;
	Thu,  6 Nov 2025 14:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762437747;
	bh=rks74Ok2xVDZRYVekwVF/tod1CxxsRBTTzdE/GlxP70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ud+s8WUSocuprubvzUOn8VaTTNgP5pI8KL1QrPvB41zFUOTeVRqsg6VXanq7RjXrt
	 Xn+A/6fKrbkrAoSRxtE7sgs19ET/So8zm9IajCVZ4mSdbwTSULmFfhU5BAo+iF7nTD
	 ZMUcjlN+rjIbRkhA07YgsdHFpyV+ozJZ/xB4qYFYWSN+AChzURE/gwQXR5xm4ExRgC
	 f5IG/MS4uEHvmQ/Vp4534qX52O/yMhhPHpmXheOg/bpZX16ILqr8bdwixpllo89E9L
	 dh0F2VOHbeO7NnGAN2xsSfXTCxZCZ93t4sk6Si+GzjOjs2MhU+GK+MX4wmRD6Ijdjv
	 z3wqWVhwtQQaQ==
Date: Thu, 6 Nov 2025 14:02:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
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
	Shannon Nelson <sln@onemain.com>, linux-kernel@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-s390@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v5 00/34] sparc64: vdso: Switch to the generic vDSO
 library
Message-ID: <aQyqcH39IPLRWMt_@finisterre.sirena.org.uk>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4rnwqeK5vRaFw2+U"
Content-Disposition: inline
In-Reply-To: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
X-Cookie: Dyslexics have more fnu.
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


--4rnwqeK5vRaFw2+U
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 06, 2025 at 11:01:53AM +0100, Thomas Wei=DFschuh wrote:
> The generic vDSO provides a lot common functionality shared between
> different architectures. SPARC is the last architecture not using it,
> preventing some necessary code cleanup.
>=20
> Make use of the generic infrastructure.

> ---
> Changes in v5:
> - Merge the patches for 'struct page' mapping and dynamic allocation
> - Zero out newly-allocated data pages
> - Pick up review tags
> - Link to v4: https://lore.kernel.org/r/20251014-vdso-sparc64-generic-2-v=
4-0-e0607bf49dea@linutronix.de

I've validated that the zeroing fixes the issues we were seeing with
boot failures on a reasonable chunk of the arm64 platforms:

Tested-by: Mark Brown <broonie@kernel.org>

I didn't get to all of them but I'd expect the rest are also fine.

--4rnwqeK5vRaFw2+U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkMqnAACgkQJNaLcl1U
h9DdXQf/cqvSjdtV28SWYNX+UHnXmboyHxzenwcfa4zxbnrzgQ8feYntV6Ikfx7L
ovSme6EY9cGYwoDmmhIHSSVZ0iuMwgiSj/NLxYlzbayc8uJITnfMorXtyOkqn7eQ
9PngOIxdOAGels3s3oLIZfRg7pXKnfX176OvkFQi6I2gHaBHCpQbBq4o5qVqFo85
Yra3emkWyARoll2AJ3u/dPVaDlXP2H3z4fm9QzX/1aWFaGN5Ml43iLbTfuC6YPlA
/XTavzO9jIbi7l2J36K152BdwsgyOEHqQezDy5a/7bSQwA9cH7ok32svP1b5hpl1
DOGKdUeeQCo9BAzV2TfMQR9jwzkZSQ==
=zN3L
-----END PGP SIGNATURE-----

--4rnwqeK5vRaFw2+U--

