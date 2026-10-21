Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCDC60A3801
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 14:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rlGdytqs;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J3YF5IEx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UEVidBOtJkGIF4/dj6UUdp9Wd3YXp7nSAWdH8eAbb7E=; b=rlGdytqsVoVydvCY92kRncLQpO
	STM43EEq6xuAU8dkWPhaIlN81nK20vQVWQFaTPdjReLSdtalMsd1hf1RbQXQxiOXHFiwJY19rnQKx
	O8yR6nnExuehlJRLMDRy0gv4AB4KzONgtTtWuRVZRVLtRPgLLy980hl+6AUGZtrWHN0V1DlUC+o63
	3y4coET3JlGCrHPf0r9vL7wDRMvl2TwknSkQqIwW6kpwJ/mrUV69vOCIt++UmUFIg6/cApihyZS9h
	mkO/lQVbP4w56ToPCYKq9baL2gD6G/kG9XFYf/z4LIT+JL27+ARQH1zzNqF5A5m7ll6YyqD5LVkjm
	3595bl4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXAQ-0000000C4kf-1pjj;
	Wed, 21 Oct 2026 14:19:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXAO-0000000C4kL-35W5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 14:19:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 47D5A43982;
	Wed, 21 Oct 2026 14:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 091A11F000C4;
	Wed, 21 Oct 2026 14:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792592384;
	bh=UEVidBOtJkGIF4/dj6UUdp9Wd3YXp7nSAWdH8eAbb7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J3YF5IEx+f0xM3L6lGSedpqw1xZILeSBg9+qBCG3fPIh0Im2Qi3dVV9QwWk54g/Ow
	 f/fUNUXG/IWtyORuoTDz/YC8zut+S8kBe6l1nKAWd7K/7O2DnxERSzSwOIDxd2Ky3G
	 OUulGror7/GFlnXow42JXkVC36VdSWTiDalLfNb5CUi7HyDHauAuKmy49J+FBWi9g6
	 y4SJUN4A6JfdAQJTet1Qwm7VwdtzEGpW3oYwNZFsIzB7LhhUrderhVq4JJdV+kozwK
	 csXe7/1qYnBwKEZUDeAzIzzLb+VQ+mOYFntgFWrhkFs+ohgXlcTtqYfQ61laSvDyeI
	 36QCVCxA9FeNw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id D42661CB526D; Wed, 21 Oct 2026 15:19:41 +0100 (BST)
Date: Wed, 21 Oct 2026 15:19:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>, Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] KVM: arm64: Sanitise ID_AA64MMFR3_EL1.S1P[IO]E
Message-ID: <atjJ_WuM_6GuLkmI@sirena.org.uk>
References: <20261020064306.1542865-1-fuad.tabba@linux.dev>
 <ati3_lymW0zaBsSU@sirena.co.uk>
 <86mrs7ywsc.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="myDSwi2Ph81d1HS6"
Content-Disposition: inline
In-Reply-To: <86mrs7ywsc.wl-maz@kernel.org>
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


--myDSwi2Ph81d1HS6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 21, 2026 at 03:04:51PM +0100, Marc Zyngier wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > It would be nice to have it be more obvious to the VMM and/or it's users
> > that it messed up, as things stand features it thought it had set will
> > just silently vanish from the guest - they'd need to know that this is
> > something that might happen and check after finalization or similar.
> > That's probably more a documentation/education thing than anything for
> > the patch.

> The VMM is an integral part of implementing the architecture. If the
> VMM doesn't cooperate, that's its problem.

Absolutely, it's a bug if the VMM is doing this.  What I'm saying is
that it could be helpful if the bug was made visible, with the silent
fixup VMM bugs could easily lurk around for longer before someone
notices the problem than they might otherwise.

--myDSwi2Ph81d1HS6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatjJ+AAKCRAv73Ows9A4
iZeYAQDZSaktjduuIlbdaY9J9HfNbTXXohL5Mg9RtMggk2fZTwD/RWuP/83tS3ju
xCr8sa/Wa91fFPcj6epcub0Aat5XBAo=
=KMvg
-----END PGP SIGNATURE-----

--myDSwi2Ph81d1HS6--

