Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58560606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 18:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i3G5Lp19;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K/bQi/XI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NqxvWhfImuiV0m424YLs/XKP3wb9e3Zs3lV/mSqHkTs=; b=i3G5Lp19A37HflzJ03QU+nDSRF
	/VoPk58JId7oWnqGt4uM0/Sm+/GBMP3sKXulhfegPn0clNq7jUgYO00gQYAjTQvJs0coKtlt4ezVx
	xoBpyw+P1pN1K8n2pRm3jJgPZOs9/9XPGb3ZSvVl3xO1AGxOoZ8id5LlzmJNAM02Kb+jyE99xdSPe
	Xdqy4Zw3uUq9QXddrVFrtAtwwUM21AR8hWiBDlo9EBNfW8GrhfrthOPMTpzdL+toXWlgbqQ0WrKip
	DWo4nqD/TWtOg4o44TKy9eCPlR+nr2Bl2+setjrIg9OrCJEnd/p4LLLS8fp5Z5rkWCOkb2GSPrQ0a
	4gVEOk8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8ja-00000007mBi-1IAL;
	Wed, 28 Oct 2026 18:50:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8jL-00000007m8F-4AuL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 18:50:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 571FA4036B;
	Wed, 28 Oct 2026 18:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C0B01F01825;
	Wed, 28 Oct 2026 18:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793213434;
	bh=NqxvWhfImuiV0m424YLs/XKP3wb9e3Zs3lV/mSqHkTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K/bQi/XI3eblxnjs6nbzqM2s2DMe1OWO6Xybo9MvFqj/d43NQ6t9aFln0GyJoinSy
	 PiCaduFh7soohxZvnpGbEtWxfa8XXVkDH7EutgCnlV+axJ9/+hhWoA0ZN9qA9gMdw/
	 RhtPKQvNKtEVlilgJe6hUQMTTLOpI7Le2w+E8r5XzHgGUV4VUqv9IAmvp0LYYA6t2v
	 QfEjSIdXPG6wAKHmqqdQAkQ5dLiSEn1RfMkEMCy2JG/G6iPMPT6xNlHlJUkMB50pzU
	 dxM8lqKjm2O/xlBZln8cm/aNqc5UufyLWaxdn4DHD4tyVHH1vYDKqfvhZePsk0oyOt
	 siXt/xKaOGRAQ==
Date: Wed, 28 Oct 2026 18:50:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Tejun Heo <tj@kernel.org>, Andre Przywara <andre.przywara@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Lucas Wei <lucaswei@google.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Barry Song <baohua@kernel.org>, Oliver Upton <oupton@kernel.org>
Subject: Re: [PATCH 1/4] arm64: sysreg: generate TPIDR, SP and DAIF encodings
Message-ID: <df407060-cc8b-4a8a-88b5-1dc29f67fde7@sirena.org.uk>
References: <20261016164648.251258-1-ada.coupriediaz@arm.com>
 <20261016164648.251258-2-ada.coupriediaz@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DCffCqKutlnyDvjt"
Content-Disposition: inline
In-Reply-To: <20261016164648.251258-2-ada.coupriediaz@arm.com>
X-Cookie: Pushing 30 is exercise enough.
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--DCffCqKutlnyDvjt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 16, 2026 at 05:46:45PM +0100, Ada Couprie Diaz wrote:
> Introduce missing SYS_DAIF and SYS_SP_EL0 encodings in preparation
> for a future commit.
> While we are here, replace SYS_SP_EL{1,2} manual encodings with
> automatically generated ones.

Cross checked with DDI0601 2026-06:

Reviewed-by: Mark Brown <broonie@kernel.org>

--DCffCqKutlnyDvjt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmriQ/QACgkQJNaLcl1U
h9ATaAf/QLNM9Of/Ao3BK55WlSpsKabaRpGk4f0v1JIFP17eq6liEuhzRXB3KDpB
sifmifyEvu1OXKl9QdFuv5SSN7drGBJJzC7nTeRp0kvn1DaS4QJlMg+QzZs/Kkp2
Ldb6PYi+7ihq+h1k5iZDA0NZyRIhWKfqJxmZL3NKO/9jKfrJcaiiP9l20UZK57Cz
BKF4T06Pj7Oak6wlP7ZAEqSyy22RU5uJLqhfh/28GCY49JfX2VJF6G+aUjSLXPNd
CaXf92ozz/wP8HjH4ztIhGWjD3sXtvv7YmHC19t8uEwOcxP4W+6RQqFy9VhlBJYJ
JHg4ProE7v5SH+s1qRZPkeeMRKNCSg==
=cHK3
-----END PGP SIGNATURE-----

--DCffCqKutlnyDvjt--

