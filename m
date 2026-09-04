Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8805C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 11:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1VaT5+aXzWBXQgC6wes+OIeCAuAyOdJThyWuzoyTF8=; b=VVAAwIvZ4MSxd4d5Xw7ZpbcU27
	fC182KHOXlSj5CI3EdL9fimViRWEpJe8ONeZVi6eeOvZs5sL0F7A2smwPU4vN8ZlKywll/rZxaTYF
	nENu6lxukx6dZEc1S5ADhLKvqxEf/GWWBezsNendSwrFmx8PQJu67R/KXFPLUxJ1MaP0mRXU/vqN3
	xuGA7VAGT/CZnsU6iAD+n0zuEcoj3qx0Q9HlIwZubO28h5dRF6UtQtf1rBJb/u/q4iHIGMrOP0GD3
	SIO0ZJlNkCd0ZThUP66PhPxajdAZMrSa9B7cCg5cpZa8j0bpialp8wUBn20jT48XV/9q9CGmw3dQM
	xwn/IHbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SP8-00000001v8e-3Dgc;
	Fri, 04 Sep 2026 11:48:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SP7-00000001v8L-46Pu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 11:48:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 45C4240960;
	Fri,  4 Sep 2026 11:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA31B1F00A3D;
	Fri,  4 Sep 2026 11:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788522499;
	bh=A1VaT5+aXzWBXQgC6wes+OIeCAuAyOdJThyWuzoyTF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=makckEP6C1X127q5TRByv4U/kpILjwglUJ+wls9bOOO/m89DNV5ieDVtfu/6Z+wPN
	 KWil+ybFOki5BVgTXl0Q7IFbAQo9RaFVPxhjeDy1yKn11h+QZJPNTGG//sQrLUj25d
	 ngY2rwFi9p/vKlEaSNA9LulT2ptLL8ny71NBiWSUBESO4j2ycFm7WQ2gxzZ0hH4ZHF
	 3NpBEOMQkEhoC3NuDe7GkR2nZEg7VAdFqa56wCmRIB3Cj53Yo/j55pYqaMfnUDvHvp
	 vumFDq1haDgzZ90NgoixFGyi51EPMDVtriCYHBotJ7KKvEA5iJx5YuibPKGU1Zggx5
	 AULXjOlUdrcJA==
Date: Fri, 4 Sep 2026 12:48:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] KVM: arm64: Enable S1PIE for nVHE and hVHE
Message-ID: <05f1e2f4-173a-4226-8c98-1452c20f0a47@sirena.org.uk>
References: <20260904-kvm-arm64-nvhe-pie-v1-0-29d59f245e6c@kernel.org>
 <20260904-kvm-arm64-nvhe-pie-v1-2-29d59f245e6c@kernel.org>
 <86pkyt4gvt.wl-maz@kernel.org>
 <eb788ad5-5bb3-4767-87b8-d35d9e3ab220@sirena.org.uk>
 <apqrky27mJmUV9UA@willie-the-truck>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="613BWDzmRI5OPN/B"
Content-Disposition: inline
In-Reply-To: <apqrky27mJmUV9UA@willie-the-truck>
X-Cookie: A is for Apple.
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


--613BWDzmRI5OPN/B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 04, 2026 at 12:29:23PM +0100, Will Deacon wrote:
> On Fri, Sep 04, 2026 at 11:33:24AM +0100, Mark Brown wrote:

> > What about pKVM, my understanding was that that is very much an ongoing
> > concern and uses the nVHE hypervisor?  My expectation was that this
> > would only ever get used in hVHE configurations when people enable pKVM
> > on modern hardware, actual nVHE mode was mostly just carried along with
> > that.

> pKVM uses hVHE wherever it can nowadays, so I'm fine with only supporting
> S1PIE on hVHE and VHE configurations if that's easier to maintain. We
> just need to make sure that the failure mode for nVHE results in the
> feature being gracefully disabled, rather than e.g. crashing or quietly
> doing the wrong thing.

I figure that if we're supporting hVHE it will end up less complicated
to also enable nVHE, it reduces the potential for having bad or missing
fallback paths for features downstream of S1POE.  It's not like it's a
huge extra bit of code and it seems likely to save hassle down the line.

--613BWDzmRI5OPN/B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqar/0ACgkQJNaLcl1U
h9Crnwf/c7v+uIVW4kufu3SqAqgdSA5F256Do+SueGtzPJunOMlwl/K6F7UUd7nt
EjqfQDbL0r4iYdVmq7StbJMAt9RabzT7cjpMaSnZOdAVImR/B2SGis4Ba+OvmB4e
A44UPMLk33sd/23J4/8cDbH1AGNudVd2BtdHiZvUHL2ILDjngBqKa9iZz6GQJe+J
+ZqrTvoh4Ngu2OQzYXuqXYO5jIZ92Kxs3kITwpLO6YGFQNfJRXWiW63+TZ0nbXdN
KhiJcWvI5WZvaNDjYWPTVGL6tFCGeQEoYAYydx9mdCHAlnwFibT64lK8ZcW6DWoM
mJkE7YyvAxqF0FgonEBB7drvSloOTQ==
=jUX3
-----END PGP SIGNATURE-----

--613BWDzmRI5OPN/B--

