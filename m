Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A028E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 15:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AgBPklrLo9zLa7PaL3jWmpBZe2lh5uWiDaogyqfD9y0=; b=xjubgVOt8zGjk7ggCyGQuVkPqk
	R+J3031j5rak+PcDAK8nGfD6Cuv429+Aw8+LzQvdecGVV4gspX5RdUxM6zq8Q6xEa6MdL8fDqHbFB
	bJfEpyTVCNmIpps5WVcbtPIAwfmd7buX8FNHbbyA6EBQbuX7kKyBzRkKHguhTDBQFg7AIfa9hwjxQ
	GGrWJtngliFMNNK8fLvIx5ygh40rtOr+vZjWuJWWqMydTiI895abbzauxjFUkoAXg7xPtBGVtiSny
	lguS7TKFaODhwOdj4XlWvSSVaASAavXTt2/UZiFPZPkLIl+RJgwVI+NmavyglfkEYH8YulXf9qofP
	7AUm1wLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZEd-0000000Du2U-3Z3n;
	Tue, 17 Dec 2024 15:11:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZDX-0000000Dtpq-1tbI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 15:10:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D3F45A419E5;
	Tue, 17 Dec 2024 15:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A822FC4CED3;
	Tue, 17 Dec 2024 15:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734448234;
	bh=ks+Jrej2tEqHYg73tSV5p376J4HoYDZUNHAtN+M5N9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ey09IHrbr7Yeo/hHbNyOC1q8L2tFrcqYO6xRTNl0WBPcHSFEfq4JHrdHVZKjYSlI3
	 wf7PGFRu/34ToHvYjeTTTp4RxEGjSGIyuWD6vY5FbTqHdgqbfAuUWyYabU2ACW6Ekz
	 f1MErYPfWkPGztFitNV+RarkjaCEWLBh+id+sa6V+nCi15iKg0m10fZjpIY8uPp8WA
	 nnIslgDQftF2bzymJw7lxBAM/N7y7yieXwGsOmBFKRCyqr0WnGknBuSYGBsj7t1wRv
	 hTkvwmUBWpknSuYqPLSDkRL9tsBvjN/y2QBTyZKfTOnNd7H7NcAp8dtcaFkrsmNjO6
	 sY8Yrdk9ivDcw==
Date: Tue, 17 Dec 2024 15:10:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Fix set_id_regs selftest for ASIDBITS
 becoming unwritable
Message-ID: <b13b14df-00ee-4bee-8f65-d2cb7a9bfa6b@sirena.org.uk>
References: <20241216-kvm-arm64-fix-set-id-asidbits-v1-1-8b105b888fc3@kernel.org>
 <875xnisocy.wl-maz@kernel.org>
 <53b40aa8-f51c-4c4e-a4ad-e6a9512e5197@sirena.org.uk>
 <86v7viqusg.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z4QihPqeM7ahcPAw"
Content-Disposition: inline
In-Reply-To: <86v7viqusg.wl-maz@kernel.org>
X-Cookie: The sum of the Universe is zero.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_071035_557914_C2B4905B 
X-CRM114-Status: GOOD (  16.03  )
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


--Z4QihPqeM7ahcPAw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 17, 2024 at 01:54:39PM +0000, Marc Zyngier wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > The selftests are shipped as part of the kernel source and frequently
> > used for testing the kernel, it's all one source base and we want to
> > ensure that for example the test fix gets backported if the relevant
> > kernel patch does.

> That's not what Fixes: describes. If you want to invent a new tag that
> expresses a dependency, do that. Don't use these tags to misrepresent
> what the patches does.

No, this isn't a new use - a Fixes: tag indicates that the referenced
commit introduced the problem being fixed and that is exactly what's
going on here.  Like I say the selftests are not a completely separate
project, they are a part of the same source release as the rest of the
kernel and it is helpful to track information like this.

--Z4QihPqeM7ahcPAw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdhlGMACgkQJNaLcl1U
h9BuXAf/dx2R8YpYX3/jMtIRY2yeLN7a+p7w0DV7dBaLXFEcPUxaS9GC2Qv71kJS
XgZe44QxPXpIWnNMnlPWO+TsfX/Y9KLoXfiHQa7PLc4jegXgSE9t1cCd4DO//iqN
sPerZxeVN5K6flV6SRIjmwY+67zE+0m3aituAPK/6GKjr/Jr1GTCbr46LVPWaWr6
+Se2L+CiAPJIiYV+h1K0IPwjSkTChZAt/Ve43bKZY+3jcVbYx4unuWrSsyNGPjSD
Xg9+XnQfdvRoSTwaipg4T+I1+CYf29gzyze7fUZ61d1YHEnNQoMXSGlnDEEcyBFf
/OJ9bIk+wiiKn/luwRZn5hT33yU33g==
=qHT9
-----END PGP SIGNATURE-----

--Z4QihPqeM7ahcPAw--

