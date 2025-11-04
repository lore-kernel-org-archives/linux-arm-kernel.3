Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5E1CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 16:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g9b8dgRqX4uL2BHQtqvlqSlczFEDIsrr/9vjvvQGP/s=; b=3x7Jt2Na0927pJ3LSmBS2Ln2y4
	arAhU2/Yco5Z+sYp5cJJOTpZz+UeUnyMBdKCFeRPyNXGbAKgENIQlctrIm3LT9BhzMyNMQRSE3saL
	rxyzsR58pa5bjf/SboIz3unsYvowEVRe2IlXNoefnDB4eEF288x1fLUwKi3F9QIue1b3xzFUsr6Jm
	CT2StvFKBepP0tOdk5pLqgcwyUmRZ2Udmcta+2lGTjaLaL2NHF4e9mywSt0Q6uB+tf2LGQ6i6TQ/l
	0MtHARGrsU6K33RY9MKCEOJskOhIFX21FMRwVqND23PymJwQd5ZmBQ6L+TVJSZRePmgmFxCM3TOk/
	5BDu044g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJn8-0000000CBFf-2MpE;
	Tue, 04 Nov 2025 16:21:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJn7-0000000CBFX-2WzY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 16:21:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 793D86020D;
	Tue,  4 Nov 2025 16:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA99BC4CEF8;
	Tue,  4 Nov 2025 16:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762273312;
	bh=ZgapEV2f6UOkVKQ4Tm3UO+ujY8mCniaMXHTUMRbX7qU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XERX5aBHazdMMA+oEnGRxw1zsSiVD03zD1/OvFrITxNP8TY8EKGHO897kQpHZcTC4
	 AjOz22hE45sDXPt8Me6tOdmAhG+A6sT8FL6AjX6iYO6ZcS6KadkQT0rMkbJmui1OF/
	 y4pOsmta37VrO7TikjmFAe6yJr0DOXYwKDoT/9gVY3btW9L5vhKbX9306CCCv2kmMU
	 q0Xm6Z0TQ7+VPuX7Bj+EZ5H6rPQRzeur3ohk90yIJvxkO3YG03g9YEM8mYNDLcUFlG
	 PnlmletPsDgf5n3+Go+pKne9UEK4e4ygPuzYRVo35SlZ1BzC2w6vuQ8zAxKAJKLqqA
	 KeZdQ7RUrsN6Q==
Date: Tue, 4 Nov 2025 16:21:49 +0000
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
Message-ID: <aQooHZ5p4DNhwbar@finisterre.sirena.org.uk>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
 <20251014-vdso-sparc64-generic-2-v4-23-e0607bf49dea@linutronix.de>
 <aQjJNmwniQwwjeBR@finisterre.sirena.org.uk>
 <CGME20251104084442eucas1p2af1bd88393f4d6a532df1cd41f32a287@eucas1p2.samsung.com>
 <e7f05748-a11c-47eb-b1fa-cdc9dc6d05e0@samsung.com>
 <aQn8G9r2OWv_yEQp@finisterre.sirena.org.uk>
 <20251104162009-8cffa62d-e95b-466b-9a27-c51b0f5257cd@linutronix.de>
 <aQogAfbrP9rTPLvI@finisterre.sirena.org.uk>
 <20251104170215-3600e71c-1573-43aa-ad1d-8d02af9bbbf4@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vgxhQqUhFOf4jqrE"
Content-Disposition: inline
In-Reply-To: <20251104170215-3600e71c-1573-43aa-ad1d-8d02af9bbbf4@linutronix.de>
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


--vgxhQqUhFOf4jqrE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 04, 2025 at 05:03:28PM +0100, Thomas Wei=DFschuh wrote:
> On Tue, Nov 04, 2025 at 03:47:13PM +0000, Mark Brown wrote:

> > I can let you submit LAVA jobs to my lab (there's an API, a web
> > interface for (re)submitting jobs and a CLI tool for shoving jobs in) if
> > that works?  That's how my own access to it works unless I go pull
> > boards out.  You should be able to resubmit existing jobs, it downloads
> > test binaries over HTTP.

> Sounds good.

OK, folllowing up off-list for that.

--vgxhQqUhFOf4jqrE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkKKBwACgkQJNaLcl1U
h9BB+Qf9EauYOf7gmQuIlmWkRFyAe3nL6GnUvplpFK7JQgCAmEpS6FK/StPLVbZL
WwU/hE4esPcUwdBtU2pbY2fHKOHlAE3CNPiiEYfjkd51GcYtFX5b0Lw1PDB72Kgo
ZFvKRrKRgkb3Mn3f7Dl2XoapM8m7YR/tRtJNCBk+SesiIQ0HfL5V4ExsYO+L5c7s
wegS0czcQsWbwDBTsPWl3QJF+HPkq28QUpznRvaUwKfj7Pe5PJTpEQy9OZQf7u4r
e8p94FrmEto2SEMlh98mHi5iZcmCBPvOtFtCrv8NmzDi7olabfnoQ+ECOnFB2+Cy
tm2fLJofnR2UpxNKmXwxdF0pK8VkPw==
=HhMt
-----END PGP SIGNATURE-----

--vgxhQqUhFOf4jqrE--

