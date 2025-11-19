Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20507CF58C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 18:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ea1ayXHXALsT/3s7AXIiWnLbMSgCqeVe2mKRrK06CQ0=; b=Tej+xV5WPEDY/UHY2+aM3Y/rFL
	LPyuVbHoB/C4XzAS+jS1bE8Q0GmA0OokkjrxtEj+b7vDl9Fbla/rlWUtExNPuogavYzdi3/edIDJp
	WcAuEyaSSIkSqHosUWeXw0z8bTI+5YsQCF3Tn34GKrPqCjpNWitZQdbWfQ7KJ06RXV2aMKD2QDyGY
	pRDSVo5uW4oX6mh7sZM1+ZssmeSuSoAqKEAHNGOAho8RZK0FM3qE2/gpXxsySArsWcZ8VqEOCUON6
	PziCywoUNseLj4zZicDWq6Sn13GQmM5TVxD8IrGZXQrWiitf4O+f5/nxkC0ZyKuTuKo7/6t/Z0dAm
	3RPvfqDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLnAj-00000004iLw-0ypk;
	Wed, 19 Nov 2025 18:44:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLnAi-00000004iLp-06Nd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 18:44:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E87C60017;
	Wed, 19 Nov 2025 18:44:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81AF1C4CEF5;
	Wed, 19 Nov 2025 18:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763577890;
	bh=7AAXhdIN9XNuNFY637AtV3mAm4gPrrFNTZMcjXFYErg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mqvxYHbNym+xIqsVHSgdrQgyJOtvsXCayhPPiB6N/Xvv3p98UprOivIkAKOfo7tum
	 BjgCE9oANwa6vv9VBMkqKLdltF1qmWLo9ANzFpvr659h2LaYez6F3jA9FJz70tdeQJ
	 XBH/PBDaWttnGc0Z5GDo84/lH1A7gxjmFM6zL/jN3j/YzHtRzfSZWRomHTb7EvThz0
	 oyztU6NI7SNHvsvSFM1hoYk9u8MMmDnEjbIYoHsw3A6qAgfmxpMXoa/ELrr4/OO+CP
	 SOIt1uLy5+gHJzMJe41RZolswZO8i4mvTuFvAPolcdrlFh8/EX8RKHNQloElWsG/2L
	 gmQ3LNTVyCgLg==
Date: Wed, 19 Nov 2025 18:44:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-cxl@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	Dan Williams <dan.j.williams@intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Drew Fustini <fustini@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, james.morse@arm.com,
	Will Deacon <will@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
	linuxarm@huawei.com, Yushan Wang <wangyushan12@huawei.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, Andy Lutomirski <luto@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>
Subject: Re: [PATCH v6 3/7] lib: Support
 ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
Message-ID: <20251119-charging-gallon-bea196c3a547@spud>
References: <20251117104800.2041329-1-Jonathan.Cameron@huawei.com>
 <20251117104800.2041329-4-Jonathan.Cameron@huawei.com>
 <3bf1793a-2ffd-4017-b4bf-dc63f3a2a7c8@infradead.org>
 <20251117-definite-uncounted-7cc07a377a71@spud>
 <20251118093041.00000c9e@huawei.com>
 <2241d985-0e35-41e5-93b1-1e8d4e7a84bf@infradead.org>
 <20251119094255.00000020@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8uMCJ8lN+XFmaZ3P"
Content-Disposition: inline
In-Reply-To: <20251119094255.00000020@huawei.com>
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


--8uMCJ8lN+XFmaZ3P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 09:42:55AM +0000, Jonathan Cameron wrote:
> On Tue, 18 Nov 2025 17:18:31 -0800
> Randy Dunlap <rdunlap@infradead.org> wrote:
>=20
> > On 11/18/25 1:30 AM, Jonathan Cameron wrote:
> > > On Tue, 18 Nov 2025 00:13:07 +0000
> > > Conor Dooley <conor@kernel.org> wrote:
> > >  =20
> > >> On Mon, Nov 17, 2025 at 10:51:11AM -0800, Randy Dunlap wrote: =20
> > >>> Hi,
> > >>>
> > >>> On 11/17/25 2:47 AM, Jonathan Cameron wrote:   =20
> > >>>> diff --git a/lib/Kconfig b/lib/Kconfig
> > >>>> index e629449dd2a3..e11136d188ae 100644
> > >>>> --- a/lib/Kconfig
> > >>>> +++ b/lib/Kconfig
> > >>>> @@ -542,6 +542,10 @@ config MEMREGION
> > >>>>  config ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
> > >>>>  	bool
> > >>>> =20
> > >>>> +config GENERIC_CPU_CACHE_MAINTENANCE
> > >>>> +	bool
> > >>>> +	select ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
> > >>>> +
> > >>>>  config ARCH_HAS_MEMREMAP_COMPAT_ALIGN
> > >>>>  	bool   =20
> > >>>
> > >>> Architectures and/or platforms select ARCH_HAS_*.
> > >>>
> > >>> With this change above, it becomes the only entry in
> > >>> lib/Kconfig that does "select ARCH_HAS_anytning".
> > >>>
> > >>> so I think this is wrong, back*wards.   =20
> > >>
> > >> Maybe it is backwards, but I feel like this way is more logical. ARM=
64
> > >> has memregion invalidation only because this generic approach is
> > >> enabled, so the arch selects what it needs to get the support. =20
> > >=20
> > > Exactly this. Catalin requested this form in response to an earlier
> > > version where arm64 Kconfig just had both selects for pretty much that
> > > reason. This is expected to be used on a subset of architectures.
> > > It is similar to things like GENERIC_ARCH_NUMA in this respect (thoug=
h the
> > > arch_numa_init() etc in there are called only from other arch code
> > > so no ARCH_HAS_ symbols are associated with them).
> > >  =20
> > >> Alternatively, something like =20
> > >=20
> > > I'm fine with this solution if Randy prefers it. =20
> >=20
> > I do much prefer this alternative.
> >=20
> > > Thanks for your help with this. =20
> >=20
> > Thanks for listening.
>=20
> Conor,
>=20
> Given it is your proposed solution, I'm guessing you'll either spin a pat=
ch
> on top or squash it into original.  If you spin a patch for this.
>=20
> Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com>

New patch I think, since you say Catalin specifically asked for the
current setup.

>=20
> Thanks again!
>=20
> Jonathan
>=20
> >=20
> >=20
> > >> | diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > >> | index 5f7f63d24931..75b2507f7eb2 100644
> > >> | --- a/arch/arm64/Kconfig
> > >> | +++ b/arch/arm64/Kconfig
> > >> | @@ -21,6 +21,7 @@ config ARM64
> > >> |  	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
> > >> |  	select ARCH_HAS_CACHE_LINE_SIZE
> > >> |  	select ARCH_HAS_CC_PLATFORM
> > >> | +	select ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
> > >> |  	select ARCH_HAS_CURRENT_STACK_POINTER
> > >> |  	select ARCH_HAS_DEBUG_VIRTUAL
> > >> |  	select ARCH_HAS_DEBUG_VM_PGTABLE
> > >> | @@ -146,7 +147,6 @@ config ARM64
> > >> |  	select GENERIC_ARCH_TOPOLOGY
> > >> |  	select GENERIC_CLOCKEVENTS_BROADCAST
> > >> |  	select GENERIC_CPU_AUTOPROBE
> > >> | -	select GENERIC_CPU_CACHE_MAINTENANCE
> > >> |  	select GENERIC_CPU_DEVICES
> > >> |  	select GENERIC_CPU_VULNERABILITIES
> > >> |  	select GENERIC_EARLY_IOREMAP
> > >> | diff --git a/lib/Kconfig b/lib/Kconfig
> > >> | index 09aec4a1e13f..ac223e627bc5 100644
> > >> | --- a/lib/Kconfig
> > >> | +++ b/lib/Kconfig
> > >> | @@ -544,8 +544,9 @@ config ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
> > >> |  	bool
> > >> | =20
> > >> |  config GENERIC_CPU_CACHE_MAINTENANCE
> > >> | -	bool
> > >> | -	select ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
> > >> | +	def_bool y
> > >> | +	depends on ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
> > >> | +	depends on ARM64
> > >> | =20
> > >> |  config ARCH_HAS_MEMREMAP_COMPAT_ALIGN
> > >> |  	bool
> > >> implies (to me at least) that arm64 has memregion invalidation as an
> > >> architectural feature and that the GENERIC_CPU_CACHE_MAINTENANCE opt=
ion
> > >> is a just common cross-arch code, like generic entry etc, rather than
> > >> being the option gating the drivers that provide the feature in the
> > >> first place.
> > >>
> > >> I didn't really care which way it went, and was gonna post something=
 to
> > >> squash and avoid another revision, but I found the resultant Kconfig
> > >> setup to be make less sense to me than what came before. If the swit=
ched
> > >> around version is less likely to be problematic etc, then sure, but I
> > >> amn't convinced by switching it at a first glance. =20
> >=20
> >=20
>=20

--8uMCJ8lN+XFmaZ3P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaR4QGwAKCRB4tDGHoIJi
0jzVAP485em5r734PUQARl/Redcopl3WHKhio24hv69dhS+NiwEA4Tf9EI8upkHE
ZhRrHxrcKvSCFgpopKmIEp+fHS2OBwU=
=DQ0+
-----END PGP SIGNATURE-----

--8uMCJ8lN+XFmaZ3P--

