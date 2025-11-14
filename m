Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4810CE7B06
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 12:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fJlsB4J2zx7QXsXQmzFa/boQF6nqSXqjf+sMH02hV3M=; b=zTF5SBAC97kIH4CyWWJ7Ju1NrR
	vskb1t2mzmhTn1HK/d7fNo0qIeALbYFgJdQYCOTPTAzpGzPXaNxy1fE7NerP6PKHDlgq95muUmilt
	iF9/AMosudygsbTRDHe43CARP11/DfJr3GIBqaN82TTCb/Xajy+Nz3XOLiz5XtpfdJFMyT84kjdy7
	l5hg+4AGcITtvTc76T3R2TNtGKdJQ7td27cXLhUi02GFiyuMWMpNd2qA4mc0tDMO2EFy8QM6hFWBX
	LxjWJKEd1Oxx+jEqC36cEYOk2MbF0fGNB1sFnPqm/tVJ1mJ3V/w/4OqY4MNvQFZlwSTjwU+8lv8eM
	3J+t9+sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJtIL-0000000CDLK-3x9u;
	Fri, 14 Nov 2025 12:52:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJtII-0000000CDKy-3IwG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 12:52:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 28E67438B4;
	Fri, 14 Nov 2025 12:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14DAC4CEFB;
	Fri, 14 Nov 2025 12:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763124770;
	bh=6VphuKq2Z604/Y/bm30jdFUeDgNsvqjJPARDxw7M1cQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QIDx9yASFfZiqhuxTYbuMYVdvwU6dUNnk/MSujK+ASdclnRPOUZbNTQuCis2Ilc1P
	 hrXneM9cQ8B4FIDoDxqrePxMR2KL+KI5xN9nKFyK/5DfnH3SbitdhzIZx1jqQyqSSQ
	 7q/APRxayxN0XdeHDdi5MxaJzyk1DmFr+EGTv39iIikknUvi1fu0TTW3yeOotU1fRU
	 /fAvtaId9qE2Avp/ifpfgmcISSPp7lm7aOGeXjR7MHTz3y5on6lVYGFmPBs1LpNijB
	 yuJXap7kcbkF97Raabtgb+KCs6nVrnt+Uund+fDtKIgdLu7WA1qJDJ+pjxrxdv95pc
	 t0QKHjPHozJ1Q==
Date: Fri, 14 Nov 2025 12:52:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: arnd@arndb.de, Catalin Marinas <catalin.marinas@arm.com>,
	linux-cxl@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	Dan Williams <dan.j.williams@intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Drew Fustini <fustini@kernel.org>,
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
Subject: Re: [PATCH v5 0/6]  Cache coherency management subsystem
Message-ID: <20251114-juror-stiffness-046b47b8d9f7@spud>
References: <20251031111709.1783347-1-Jonathan.Cameron@huawei.com>
 <20251108-spearmint-contend-aa3dd8a0220e@spud>
 <20251114124958.00006a85@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yeJqfqlYgNstOKbS"
Content-Disposition: inline
In-Reply-To: <20251114124958.00006a85@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_045250_886090_1950B25E 
X-CRM114-Status: GOOD (  26.47  )
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


--yeJqfqlYgNstOKbS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 12:49:58PM +0000, Jonathan Cameron wrote:
> On Sat, 8 Nov 2025 20:02:52 +0000
> Conor Dooley <conor@kernel.org> wrote:
>=20
> > Arnd,
> >=20
> > On Fri, Oct 31, 2025 at 11:17:03AM +0000, Jonathan Cameron wrote:
> > > Support system level interfaces for cache maintenance as found on some
> > > ARM64 systems. It is expected that systems using other CPU architectu=
res
> > > (such as RiscV) that support CXL memory and allow for native OS flows
> > > will also use this. This is needed for correct functionality during
> > > various forms of memory hotplug (e.g. CXL). Typical hardware has MMIO
> > > interface found via ACPI DSDT. A system will often contain multiple
> > > hardware instances.
> > >=20
> > > Includes parameter changes to cpu_cache_invalidate_memregion() but no
> > > functional changes for architectures that already support this call.
> > >=20
> > > How to merge?
> > > - Current suggestion would be via Conor's drivers/cache tree which ro=
utes
> > >   through the SoC tree. =20
> >=20
> > I was gonna put this in linux-next, but I'm not really sure that Arnd
> > was satisfied with the discussion on the previous version about
> > suitability of the directory: https://lore.kernel.org/all/2025102811434=
8.000006ed@huawei.com/
> >=20
> > Arnd, did that response satisfy you, or nah?
>=20
> Seems Arnd is busy.  Conor, if you are happy doing so, maybe push it to a=
 tree
> linux-next picks up, but hold off on the pull request until Arnd has had =
a chance
> to reply?

Yeah, I did step one of that last night and will put it in linux-next
=66rom Monday. Ultimately the PR goes to Arnd, so he can judge it there
anyway.

--yeJqfqlYgNstOKbS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRcmGgAKCRB4tDGHoIJi
0onVAQD2iKKx0IizfAkg+H6zlKCEwvYhA65Pv6UxxL4osqTj/wD/fpvXj1YHfiHx
eyDCpQIW29m6pDBP18HBv4dusvusNww=
=yFYx
-----END PGP SIGNATURE-----

--yeJqfqlYgNstOKbS--

