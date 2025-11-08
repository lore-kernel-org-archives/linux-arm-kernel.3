Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA46ECCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 20:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z1mUJqgslv16M+tfXM8XyUEotZBdEAoMyYYZaLsYGsc=; b=woz+BR7eVE1BpsAJ9tk3ZWe0j3
	62fUMvw5TlVExFH2E2wiMfNI9mD9tlQkUQ5LvBFhARqX8FR5LhkZOka5t9NBTydd+fDJfOMGxABsk
	CnivFHbwgSktVK/1l3jj/ZQQTSf6bbyWJS5y0n55hcuQ0FBY4Oek0ovW+ZG8EwFxQq9e8HI4xJB4x
	Y5u5uhriZ0sP+O2W/gQQnAehJnvAYFFGzCFF8B98wqEYO1uZyTUvPZeopAqfurr0hsg6B7Dly/jrg
	Z7NQR/wQ6L+gVSffcoP1GkZBCeL9YJ3b5HuirQbgJ2MP5/4ifdsmJ802ndYj2hRacswAGlo9JQrSh
	kK9yUVbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHp9M-00000003QaD-1tRo;
	Sat, 08 Nov 2025 20:03:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHp9K-00000003QZp-1OE8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 20:03:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F52543C09;
	Sat,  8 Nov 2025 20:03:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97DD7C19422;
	Sat,  8 Nov 2025 20:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762632180;
	bh=mZx3reTRacDiFfpeRs79kIi23F+uPMRdn0mb7yCb4lA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lNKbxfnKqppFyjDbgVviqAKjzuqyrl142Vll5JtXbXhMZx9ScsfOQGWSjhVrVnTF/
	 W46Amq2iHTbMWiCV73eSF5dNnu4nOzVILXSQ0LwZNmPAfs5De8lf7RP8n0+ocYLUNm
	 Y0VB9/W4SBQYKN1XLrr7dsoUZ4XsZynyKqAhxqqge6RicKHf/c+V+JYIipWSV0NVV8
	 Lheh82/DHzO8neWxDIm+NArCVP+u2Y2PHaLtEcwgjDMqVCKMgomUWZB9H7QUMJRnik
	 NCFaIIMPr9Rrq/TqyVfDXSRrfIjwbI19FqZ5vVSIzcx/P5X6qOHcwJMWBACW0al3Fw
	 9iOlOfua0KiDQ==
Date: Sat, 8 Nov 2025 20:02:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, arnd@arndb.de
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-cxl@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org,
	linux-mm@kvack.org, Dan Williams <dan.j.williams@intel.com>,
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
Subject: Re: [PATCH v5 0/6]  Cache coherency management subsystem
Message-ID: <20251108-spearmint-contend-aa3dd8a0220e@spud>
References: <20251031111709.1783347-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BnXojPaReIke2Qi9"
Content-Disposition: inline
In-Reply-To: <20251031111709.1783347-1-Jonathan.Cameron@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_120302_450379_82B0B8FD 
X-CRM114-Status: GOOD (  19.89  )
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


--BnXojPaReIke2Qi9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Arnd,

On Fri, Oct 31, 2025 at 11:17:03AM +0000, Jonathan Cameron wrote:
> Support system level interfaces for cache maintenance as found on some
> ARM64 systems. It is expected that systems using other CPU architectures
> (such as RiscV) that support CXL memory and allow for native OS flows
> will also use this. This is needed for correct functionality during
> various forms of memory hotplug (e.g. CXL). Typical hardware has MMIO
> interface found via ACPI DSDT. A system will often contain multiple
> hardware instances.
>=20
> Includes parameter changes to cpu_cache_invalidate_memregion() but no
> functional changes for architectures that already support this call.
>=20
> How to merge?
> - Current suggestion would be via Conor's drivers/cache tree which routes
>   through the SoC tree.

I was gonna put this in linux-next, but I'm not really sure that Arnd
was satisfied with the discussion on the previous version about
suitability of the directory: https://lore.kernel.org/all/20251028114348.00=
0006ed@huawei.com/

Arnd, did that response satisfy you, or nah?

Cheers,
Conor.

>   *  Andrew Morton has expressed he is fine with the MM related changes
>      going via another appropriate tree.
>   *  CXL maintainers expressed that they don't consider it appropriate
>      to go through theit tree.
>   *  The tiny touching of Arm specific code has an ack from Catalin.

--BnXojPaReIke2Qi9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQ+h7AAKCRB4tDGHoIJi
0mbmAPoDNoN5c++N+FdbOde62VPsuE/nQLuJqXMbpVYRgssj5gD9HgGSIr/5NCGC
GU4C//DABkFlJ0fo45ADpizmnDu8JQ8=
=3UFm
-----END PGP SIGNATURE-----

--BnXojPaReIke2Qi9--

