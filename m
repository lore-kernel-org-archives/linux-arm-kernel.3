Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24154CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 20:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=amyp0bQQLpeK8dKZTAb4WHpNFpX9yDj0u1UHnTXihyk=; b=B2OVsAY9Gb6CuC5iBufB4qrNpK
	4VMQyR1K5EPNBAUy7oie2TUIwQFhpBctBCTVgMyBj6X2iv/SEgi+8i0y01ytzNQFBBLzmTaRW4rVH
	GnlYNJqZj94Mol9uKbcQkWnrTKamEaRYrbB26xJhH16r/e8jUN6JagzpqEJ9quziBuXKxRrSu8tAu
	qh1flgFlBLfnLBGnY8bGuwwuO5vOo75BadkXM5NypkwkPtGsKeMTGu9ImNDTf/YxGHF3Kd/GmgqLq
	LQMtcd93YNNOYt+ZzV4BtkrOakAA+MtLgiiCM/X2tRHUja9oCvtwH9Z0D+zpi+DEPcc0wbwPLVJhd
	KwiVX36Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBfkF-00000004HjB-1zyd;
	Wed, 22 Oct 2025 20:47:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBfkC-00000004Hi6-2E42
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 20:47:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D513A4533F;
	Wed, 22 Oct 2025 20:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F71BC4CEE7;
	Wed, 22 Oct 2025 20:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761166047;
	bh=e4wpAeuwnWxwPsv6xR22bTAFdrGhHjpoATj1khsZ/3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eMDWLrfV+vZznUoPf7CPswB3dBThpbX2cO+2bWvkQ50o2TCrvoCdE1Cd8xXrUFRoi
	 4RQOPMKhr+0tnSOK+DiKcMtj1oDkCTxPA4mHmnI44BotWVAjb9ldTnLMyTQjyS1Glb
	 ijl24xdpzSdzrCZEKhn++IHDQPpZbUdTkCvlJsrAxJb/YRqToadM7K56X3TBjl4HEM
	 Kyj7DofAye5roHM4RI4hcbcHBS9HAWzaMufkLYbmgqUo5c4mw2HV49+ecHPYhV766I
	 BEuFIsEhcM7FbKPeKnO/YdST5KXQbtfPvLsfWmyESS1GnxaOKoG42xaOoXjHPKwp4J
	 2Yalv6aXeJwRQ==
Date: Wed, 22 Oct 2025 21:47:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-cxl@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	Dan Williams <dan.j.williams@intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>, james.morse@arm.com,
	Will Deacon <will@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
	linuxarm@huawei.com, Yushan Wang <wangyushan12@huawei.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, Andy Lutomirski <luto@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>
Subject: Re: [PATCH v4 0/6] Cache coherency management subsystem
Message-ID: <20251022-harsh-juggling-2d4778b0649e@spud>
References: <20251022113349.1711388-1-Jonathan.Cameron@huawei.com>
 <20251022122241.d2aa0d7864f67112aa7691bf@linux-foundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S6HWZzkHmuKfgcDz"
Content-Disposition: inline
In-Reply-To: <20251022122241.d2aa0d7864f67112aa7691bf@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_134740_621748_4A15FFC2 
X-CRM114-Status: GOOD (  25.83  )
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


--S6HWZzkHmuKfgcDz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 12:22:41PM -0700, Andrew Morton wrote:
> On Wed, 22 Oct 2025 12:33:43 +0100 Jonathan Cameron <Jonathan.Cameron@hua=
wei.com> wrote:
>=20
> > Support system level interfaces for cache maintenance as found on some
> > ARM64 systems. This is needed for correct functionality during various
> > forms of memory hotplug (e.g. CXL). Typical hardware has MMIO interface
> > found via ACPI DSDT.
> >=20
> > Includes parameter changes to cpu_cache_invalidate_memregion() but no
> > functional changes for architectures that already support this call.
>=20
> I see additions to lib/ so presumably there is an expectation that
> other architectures might use this.
>=20
> Please expand on this.  Any particular architectures in mind?  Any
> words of wisdom which maintainers of those architectures might benefit
> from?

It seems fairly probable that we're gonna end up with riscv systems
where drivers are being used for both this and the existing non-standard
cache ops stuff.

> > How to merge?  When this is ready to proceed (so subject to review
> > feedback on this version), I'm not sure what the best route into the
> > kernel is. Conor could take the lot via his tree for drivers/cache but
> > the generic changes perhaps suggest it might be better if Andrew
> > handles this?  Any merge conflicts in drivers/cache will be trivial
> > build file stuff. Or maybe even take it throug one of the affected
> > trees such as CXL.
>=20
> Let's not split the series up.  Either CXL or COnor's tree is fine my
> me.

CXL is fine by me, greater volume there probably by orders of magnitude.

--S6HWZzkHmuKfgcDz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPlC2QAKCRB4tDGHoIJi
0tdvAQDJHGwCvxYrXGJs6nPPk7w5pV6+UajlzpKhldIVtCgm2QD/XrQK+qDLbAJA
ymsJdZLdZoCSVVQ542yRJc4RjGzDnA8=
=4U3B
-----END PGP SIGNATURE-----

--S6HWZzkHmuKfgcDz--

