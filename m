Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199D7CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 21:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5v3JRmduY4uSzLf2Pqm6596Of3Jc6oNa3Sp1BFVrPsc=; b=DqUqUZc0Zt9RPH5IcBHL3/ajT7
	goE2kSJg7KR+qt4rqjZm0GkzsBbfD7ZN3jEwTJ4OKtQeShfAzF4FuXftP817X/HMPCuohrcUchEjd
	RXLp378diutK8jfYV0whyhn9b7hgOCZzSmHYeIHab6BG65kFA6gCZPze2VACnkbwzkNeRaidAjyMV
	ka6Fcs68/tqzaCrCpypz7+uWvTgqA3ILYRXG6wsqgvohyCNBFMmDbmohM+7YqoW0iKjQcfXDyky9n
	TYAJx4Nm5bh6E4hhUB/MYcowjJgDoUiiStpn5EVyHaO/XenQBzYEKspLfIP0SBeaI0cgbAzpC/kQf
	pEIhtr4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBg7K-00000004JiI-491I;
	Wed, 22 Oct 2025 21:11:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBg7H-00000004JhF-18CM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 21:11:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D1FDB4024E;
	Wed, 22 Oct 2025 21:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 578E7C4CEE7;
	Wed, 22 Oct 2025 21:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761167478;
	bh=5v3JRmduY4uSzLf2Pqm6596Of3Jc6oNa3Sp1BFVrPsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WB/NSEOYaZfqO71RaPt4ZWYdN0blDNxWfW5ICS4fnS9/Stg8tNvDA58HxOwxxfAop
	 6hilG6zy+ngXSW5OHpCRTxNenF9Bk2EaGFRCumPTjrRK/bVON+bnvy/p0jMxSCxSLz
	 Mp+CQpC8F2aarMsxM/M65yF0VX2LxhP4WqDUOqiQqQxpBBwSLDBsOAGAEp/+f54G0J
	 5gfATau19beB423OmBeJDw9m3Jlk4q89eSCMKQ4jChXPVDrj46xZpnq4bMGDdW6jjZ
	 TIcUJFiK3RcYlJnhG+XHlTjtlGrXivlL71exLBuObtDML9tzLkoDNFK+ey2dSEnLdw
	 wIQpY+RrFrnDw==
Date: Wed, 22 Oct 2025 22:11:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-cxl@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org,
	linux-mm@kvack.org, Dan Williams <dan.j.williams@intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>, james.morse@arm.com,
	Will Deacon <will@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
	linuxarm@huawei.com, Yushan Wang <wangyushan12@huawei.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, Andy Lutomirski <luto@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>
Subject: Re: [PATCH v4 3/6] lib: Support
 ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
Message-ID: <20251022-tried-alright-752fa98ff086@spud>
References: <20251022113349.1711388-1-Jonathan.Cameron@huawei.com>
 <20251022113349.1711388-4-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Vn2cL8c0hs3HiHri"
Content-Disposition: inline
In-Reply-To: <20251022113349.1711388-4-Jonathan.Cameron@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_141131_342047_BB8CB684 
X-CRM114-Status: GOOD (  22.59  )
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


--Vn2cL8c0hs3HiHri
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 12:33:46PM +0100, Jonathan Cameron wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
>=20
> ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION provides the mechanism for
> invalidating certain memory regions in a cache-incoherent manner. Current=
ly
> this is used by NVDIMM and CXL memory drivers in cases where it is
> necessary to flush all data from caches by physical address range.
>=20
> In some architectures these operations are supported by system components
> that may become available only later in boot as they are either present
> on a discoverable bus, or via a firmware description of an MMIO interface
> (e.g. ACPI DSDT). Provide a framework to handle this case.
>=20
> Architectures can opt in for this support via
> CONFIG_GENERIC_CPU_CACHE_MAINTENANCE
>=20
> Add a registration framework. Each driver provides an ops structure and
> the first op is Write Back and Invalidate by PA Range. The driver may
> over invalidate.
>=20
> An optional completion check operation is also provided. If present
> that should be called to ensure that the action has finished.
>=20
> When multiple agents are present in the system each should register with
> this framework and the core code will issue the invalidate to all of them
> before checking for completion on each. This is done to avoid need for
> filtering in the core code which can become complex when interleave,
> potentially across different cache coherency hardware is going on, so it
> is easier to tell everyone and let those who don't care do nothing.
>=20
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> Co-developed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

I'm fine with this stuff. I do wonder though, have you actually
encountered systems with the multiple "agents" or is that something
theoretical?

--Vn2cL8c0hs3HiHri
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPlIcAAKCRB4tDGHoIJi
0ilcAQCnVKkCAStY/FbYOAkfI+W/JVlX+Y1Vm+WSmJKzsDcbvwD/WDlSH0CF9gAy
unvtdkqI/cCeZqx8cis9fpSarDvOjQY=
=Xs5l
-----END PGP SIGNATURE-----

--Vn2cL8c0hs3HiHri--

