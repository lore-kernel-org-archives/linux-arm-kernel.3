Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DDD9E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 19:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twx0FLbb3T5Lb3mgB+87mvoITrvWy4TxRduWwFlsp4E=; b=JAuTa0fJ7kprZNGuWkTYLXEMZv
	Joy5tdKyMFpGLbsX3bL3xh33UMJ5DPvCRgmZJtCcoApWM2F3yeVklWoFOt/wK28QfjRPrOLW2r6m0
	/P7PUvZtC/AkqtHXoamG6wZwJSfGNBFcqR9l7OJo1X2ZMCANlH9FEOE1ntTgVgWNd2oQvsB+eC1eU
	IofzaWF0cfS8DWKZr5hCSNzs7cxau4BMS4eKrerUlHSFuhmOINABQ/k5h3SnJfTpwNBZwgdJZ2aRq
	zkv7Oq1DVeUFfh0PamGyR+T+Djr43kylHHaZ+tk0F9KVwUvEWigWjuwqmGr8YmXgnPl1sI2VNQ9Lo
	/RiOeYiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdAH-0000000EceW-1wAv;
	Tue, 17 Dec 2024 19:23:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNd9B-0000000EcU6-2bJq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 19:22:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D00D85C276A;
	Tue, 17 Dec 2024 19:21:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA13AC4CED3;
	Tue, 17 Dec 2024 19:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734463340;
	bh=9mNOA8/WNTIvajmOpeIQjXIZVIGGtLZcsx8KEPpiCsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mkIXFDJTUssl2V6+nik/zcYBEbniOgN/ejXZqXsaBUKkIvtLGg7iodsVtHUa/YG3s
	 nsl0kmRA+DSsYmywJOLN7ICCvJyViwS4NTU4Khb/irkzeUFmkH4akAP3jaTZ4JIejC
	 Ox1Ae5Z8TInNWC2AaaEeD8W3kmnGqufIutlmKwetK1DTmxe2aKWKvc7N77GtDdAVYy
	 BYc+ptatgw07i6sWU8iRM/NjUhFD/VDGOXNtlVdUUNorPB+RzA7spd48cWjK8QcOai
	 LpGanlHJs+xA7jSyL3JhHYgG8o00dRivzklmG8u/kWoUUGJ25352nDKFxEVy8bK3Ev
	 LZA6SlPeY6tLg==
Date: Tue, 17 Dec 2024 19:22:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Fix set_id_regs selftest for ASIDBITS
 becoming unwritable
Message-ID: <9b657364-140b-482d-82fe-01c59711e764@sirena.org.uk>
References: <20241216-kvm-arm64-fix-set-id-asidbits-v1-1-8b105b888fc3@kernel.org>
 <875xnisocy.wl-maz@kernel.org>
 <53b40aa8-f51c-4c4e-a4ad-e6a9512e5197@sirena.org.uk>
 <86v7viqusg.wl-maz@kernel.org>
 <b13b14df-00ee-4bee-8f65-d2cb7a9bfa6b@sirena.org.uk>
 <Z2G8TFw4wg7bnwzB@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KSSckS5oYWmHvwuz"
Content-Disposition: inline
In-Reply-To: <Z2G8TFw4wg7bnwzB@linux.dev>
X-Cookie: The sum of the Universe is zero.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_112221_759203_421A9E62 
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


--KSSckS5oYWmHvwuz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 17, 2024 at 10:00:44AM -0800, Oliver Upton wrote:
> On Tue, Dec 17, 2024 at 03:10:28PM +0000, Mark Brown wrote:

> > No, this isn't a new use - a Fixes: tag indicates that the referenced
> > commit introduced the problem being fixed and that is exactly what's
> > going on here.  Like I say the selftests are not a completely separate
> > project, they are a part of the same source release as the rest of the
> > kernel and it is helpful to track information like this.

> A Fixes tag suggests a bug in the referenced commit, which isn't the
> case here.

> I agree that having some relation between the two is useful for
> determining the scope of a backport, but conveniently in this case the
> test failure was introduced in 6.13.

While the patch introducing the test failure was introduced in -rc3 it
was tagged as a fix for d5a32b60dc18 ("KVM: arm64: Allow userspace to
change ID_AA64MMFR{0-2}_EL1") which was in v6.7 so I'm expecting to see
it being backported to relevant stable kernels, which will in turn cause
testsuite failures in those stable kernels if this change doesn't go
back with it.  Hopefully they'll find it from the commit message.

I would say there's a case that leaving the tests broken is a bug, it's
certainly some kind of problem.  Obviously we're sometimes a bit relaxed
on that within a series, though it's fortunately relatively rare.

--KSSckS5oYWmHvwuz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdhz2YACgkQJNaLcl1U
h9CZ+Qf8CgogvpmIGkRfSWc1vGgw0N6bTzH396O9wr/88wFUL7jPGP1DKTMW4Bdw
K6lOtGL59M2SLDObeGZqQSShw7sQPOewW54CNZlyj0GIZzkz/ezfRG/+Jzb3Y33h
VNgyLvJ5g6twjzKTfDbo0TXFgAiBk5+wO8igobH7DWZlXEWaWku9w6fmoZhFkF4T
f4ne4D+3iSg0iihgcjth8ReHrIuGZ6Cx6vw9LwjCmFwBuJlRQxmDKeJKktEUKFrk
n2IGbzOiiq0ZPl2zNLX0fRYIFwP/+E7yyIwhtWbKJootYl5DAyJzJtDIFhP5tEBI
rxqQc5m7WTdNbZEedU0trXAx7uPrSA==
=V2CE
-----END PGP SIGNATURE-----

--KSSckS5oYWmHvwuz--

