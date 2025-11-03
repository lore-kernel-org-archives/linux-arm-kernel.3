Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9146DCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BtJIApzR/ypDFDwewvSsH7n60xyLgZASA9+u6fTmTYc=; b=i2VRJ2IQliht7JWqgxuCnGd2re
	QhmwMKpqYwaWJ5vVRVd2qPG3sQe9mP9UtVEcOc3l8fx/My4z5a0bwJq5yMsZIf6WBY6HA3PaH94tI
	gly7zJCfLPTRweUAWTZ4Fk09Y4iUqEutH8kCVzIWpItIEAHUszs1iUU2EOFOciXZR1rrllT+ieeLy
	q65SPXpgmAOTLhBxbZxNsFCs202/1k1QjCz2DhcnmveIMR8GJEktBUA+NT39myEcHPvNZfLqqRfxo
	iD/LnmolFsOkpkMdARzPOpjdUTLbCJA0FcjM+D/xpX/B23qw+vehbymEkA5mTvZoNykCUMhXUc2IP
	e+WDLatA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxqp-0000000ALMB-18k2;
	Mon, 03 Nov 2025 16:56:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxqW-0000000AKjA-3mAU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:55:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A286240A17;
	Mon,  3 Nov 2025 16:55:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E28A1C116C6;
	Mon,  3 Nov 2025 16:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762188955;
	bh=norwYxHA6VI/ySU0ex5Ew7OW1FQwMlwu39WjPcjgOKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZPmPZfN0yXQ5Ndyhd1mm6d5YyvVQn+2NS84I1P7cyPdxS80PfY2ZucI9nnhbgf4WY
	 s7T0hQkmYh3BvC31fK7wOMt5xVzp7z74BHWa8QiGuneY+AjDKqKSdLT2+rUSqfiIRO
	 dq+CUk9yAJPAVVOoWmGfXhaovQn/CvtO/zMXNg05HM/YIbPUs0MlUvc8htSP7z6LHt
	 MfQNRhhp20WhSWzc6Igwle5mi2X3jI4fgZVoTroQvMzbrqdD1j07JdGxQgKVOnVbrm
	 vd3TNzlzeFyZKWqiC0BIaRsKVR8HfiPDkfKQworpdeGvoSegLcGOaqT5hTJ1SqTz0O
	 PrtNV6DhYV2Ww==
Date: Mon, 3 Nov 2025 16:55:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Andy Lutomirski <luto@kernel.org>,
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
Message-ID: <aQjemPIbHMplGD4N@finisterre.sirena.org.uk>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
 <20251014-vdso-sparc64-generic-2-v4-23-e0607bf49dea@linutronix.de>
 <aQjJNmwniQwwjeBR@finisterre.sirena.org.uk>
 <87bjljw1ra.ffs@tglx>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xyY1KyZQ9jhQldRu"
Content-Disposition: inline
In-Reply-To: <87bjljw1ra.ffs@tglx>
X-Cookie: If in doubt, mumble.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_085557_117553_0E6EAAFD 
X-CRM114-Status: GOOD (  17.00  )
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


--xyY1KyZQ9jhQldRu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 03, 2025 at 04:54:01PM +0100, Thomas Gleixner wrote:
> On Mon, Nov 03 2025 at 15:24, Mark Brown wrote:

> > which isn't super instructive.  Not all platforms seem to be affected,
> > I've seen this on at least the Arm FVP, Orion O6 and Libretech Renegade
> > Elite.  The diagnostics aren't very clear here but given that I'm seeing
> > the same issue and bisect result on multiple platforms it seemed worth
> > mentioning.  Some platforms do seem fine.

> Can you try

>     git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/vdso

> which is rc1 based and only contains the VDSO changes. That might give
> us a better hint.

Yeah, hopefully - my infrastructure is pretty swamped ATM and I'm in an
internal conference.  I did kick something off earlier on this specific
commit which should be equivalent information but it'll be tomorrow
before I can get a full picture.

--xyY1KyZQ9jhQldRu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkI3pcACgkQJNaLcl1U
h9BpwAf9G2OE1wGg3D/F2WCmsKiRzqX8EJTZWpdThdfvEP9vbPytmPqRt4LoPk9E
cKlt3SaJFVZbyfx2YTDOqcC/FaQr5gdVRVsLuiKavYpVHanTEb/HCx2BvROuDvE2
Ssx3Em7R+eHCyonl/unY/EOt7PP4hUtDizXKblf1rb5I/tM9ADlHYpQSTKF2Poxr
/gIn6gPy89C+hD2rrkQJZWraOVcbciUGJVMWtMKRm96l0pPwdHchsimXnrYq6AId
exk8ECk4hjsPpcarTzTqvJr+UCDMFpF99qq7GWDrkeifMqQqrvR5RY2kcsdyNGMw
3ssV8/Eg6XLVg7GU0FL9k76qaqD7kA==
=et8+
-----END PGP SIGNATURE-----

--xyY1KyZQ9jhQldRu--

