Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A5460A3834
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 15:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GQ6HYlwn;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mo7xzRhE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4kcXDJhEfENFHuyA+lYroTo7cmLFPG8UX1ID8jIbjAE=; b=GQ6HYlwnskrBVhrBOKUeCw+w+a
	aXWbgqEodW81NuOd0B3CtKi5LI6WYjUdJ/MWQjn3d5Q1KE+xFdKTyHpWh4/PNBUukRUgVDPFzD5s3
	JSSxivhT6VBrGGnzgCRl++50SZb67F85X3qoqnjt8iz8GCZ8r+1cA2LYUQhXvIEWRWHEuw4ZL3noH
	beAwGY7j+bC2byOtO3g4BEWxhrLTvKbArQvLifY+bDF6NJyWPRBCqvhFVOxFskEompl+63qWsaKM7
	dlG+dK1EMCv6gbK8b5ezX/BltK5oASlaChQB3ELQQN7F94b9Yn0M10S+6pPoL3OkczJuuCH0xFT7O
	InHUEflQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYUR-0000000CITh-1g7a;
	Wed, 21 Oct 2026 15:44:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYUQ-0000000CITN-03E5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 15:44:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E5A160210;
	Wed, 21 Oct 2026 15:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B49D11F000C1;
	Wed, 21 Oct 2026 15:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792597468;
	bh=4kcXDJhEfENFHuyA+lYroTo7cmLFPG8UX1ID8jIbjAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mo7xzRhEgPIbjPjOPjzFXzBcvgAiCuOyW6f2SHflaCGJu6mCMwAKU1OlP3dYvjw5y
	 HH69cHHF8gH1/Te1jqAcddWOpBFIhC0TNcN8ByBSDaZ1M76BZqur9sVejIM15JW5H5
	 EsAgq/Gp7juChmcyxYcJPj4YICO1or8l2c7j5d4k/o3TlBMBrBJcRSMgfxAgKGiAAl
	 gvBmzj6q6cMHVMAEJNfU/g2r8/SCu3ZxrjWzcxk/nY1J2J206ZSwf76cQgw90/1ujH
	 mFlax4+tAZ4/o79FkDQmci6XRBJpivOn3e0ooAbvvP/STS/ReSLqmG+EOujh4qrtfk
	 mYIpGhIScBaSQ==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id B7F9C1CEA6B9; Wed, 21 Oct 2026 16:44:26 +0100 (BST)
Date: Wed, 21 Oct 2026 16:44:26 +0100
From: Mark Brown <broonie@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leonardo Bras <leo.bras@arm.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v21 02/15] KVM: arm64: Refuse to start a guest with S1PIE
 or S1POE but not TCR2
Message-ID: <atjd2g25X3YUtOPY@sirena.org.uk>
References: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
 <20260930-arm64-gcs-v21-2-3556644cd927@kernel.org>
 <86fqyn2che.wl-maz@kernel.org>
 <as-f1JfUy38Xt9QA@gremlin>
 <ae24e80c-1b34-4827-9c93-e80b987e9cd7@sirena.org.uk>
 <atdebC62zPS1sQeR@gremlin>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XlGPDImXBOHBZN3B"
Content-Disposition: inline
In-Reply-To: <atdebC62zPS1sQeR@gremlin>
X-Cookie: Whoever dies with the most toys wins.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--XlGPDImXBOHBZN3B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 20, 2026 at 02:16:50PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Wed, Oct 14, 2026 at 06:48:37PM +0100, Mark Brown wrote:

> > TBH when I said in the commit log I was thinking of something more data
> > driven I was thinking more of having the dependencies expressed as pure
> > data, more like the way the test in set_id_regs is written.  This also
> > seems fine to me, the checks are similar.  It's just much more invasive.

> Indeed. Perhaps the config.c approach will make it easier to convert JSON
> -> code also?

I'm not sure how much of a difference it makes given that there's still
code for the actual dependency set.

--XlGPDImXBOHBZN3B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatjd2gAKCRAv73Ows9A4
iZlOAP4sLpPvccqJReB8Mwy526cPBNWAF6ETiDO4ErTN2k8z1AEAsIpkS9DcFELc
uBP7TL5YvgkbZg81LWuZNJGnIL2vMQU=
=g8kZ
-----END PGP SIGNATURE-----

--XlGPDImXBOHBZN3B--

