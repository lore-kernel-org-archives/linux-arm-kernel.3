Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C31C624DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 19:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqz8/SjMZZzy7B2gdCWcCdfuHRhXx1ToG0cZIkRfkss=; b=HmoMJrFitwxgnzVWWoM/3HEUPJ
	hHtiYR7NL6MGMclAtN3II2UTVkg2jOp1W/pCf5RGmqChiktBoflneIKsa/adtEevSEQXY+X6HpeHH
	AUQtUs1E2pGgQCOPmlAcZB3nAolimQ5Am+UTmJZQbQQF+vg/BxZ5SGH6VGFSalRZ4LCEdRzvTKku3
	olV84y3Sb9Sps/g7v+HZhqMet3SEtwK31sjozore0PLsiGGB0vS38gC81rAxU5mgm9nDvrEgz4kec
	+8q0axpWVKLLJl8CXJ72oFZVN4d3I3kr9RIrg4yZx91gwh0vGiC3PfDY+kQTJeSbWkMoFaioXHShi
	gcMbtNOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2D8J-00000000TvN-3TF1;
	Thu, 03 Sep 2026 19:29:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2D8I-00000000TvH-2dDX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 19:29:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7EF7F417F0;
	Thu,  3 Sep 2026 19:29:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E8F11F000E9;
	Thu,  3 Sep 2026 19:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788463797;
	bh=hqz8/SjMZZzy7B2gdCWcCdfuHRhXx1ToG0cZIkRfkss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VAFDPd5eM1O+RCQ7MZv/mJBq+17lAqBhBzMKain6EgUe5MW/vScuu+pCld47Xtfuz
	 mnVsCDoCVylCTjgwx0fmqmIDRlI08uQjxEXe31/r8M0GrISP29WJR/mQXs0nsGvZdV
	 AQ6fHa4LiBf2Dh2s3PjKPfwlfGXivpiG4HthJgkkwRjlsEXdEEeYHcHWmmZAchKKSt
	 5SL0hBpQsPGBix/lCV0/s6TazK2T82al9g4fE8aQYDBH26+39Gl790B1MEupc+JF8i
	 GKBEjGKwYc3Hk1jtirc4uulukf/1HMBC841Dsn1LYbza3RSlgrDE1uYRNyPY/Ic7UZ
	 e6nKPMqGZKeSg==
Date: Thu, 3 Sep 2026 20:29:51 +0100
From: Mark Brown <broonie@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
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
Subject: Re: [PATCH v20 02/14] KVM: arm64: Fix FGT mapping for
 HFGITR_EL2.nGCSEPP
Message-ID: <6e5e3995-b67d-4962-aa05-49a727780bf4@sirena.org.uk>
References: <20260901-arm64-gcs-v20-0-f31750bdfadb@kernel.org>
 <20260901-arm64-gcs-v20-2-f31750bdfadb@kernel.org>
 <apmcDT8YTjS6eXE0@gremlin>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GuKfjbABZoEkZnsG"
Content-Disposition: inline
In-Reply-To: <apmcDT8YTjS6eXE0@gremlin>
X-Cookie: One picture is worth 128K words.
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


--GuKfjbABZoEkZnsG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 03, 2026 at 05:23:38PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Tue, Sep 01, 2026 at 10:47:00PM +0100, Mark Brown wrote:

> > -	SR_FGT(OP_GCSPOPX, 		HFGITR, nGCSEPP, 0),
> > +	SR_FGT(OP_GCSPOPCX, 		HFGITR, nGCSEPP, 0),

> Yikes, yeah I see from the doc I referenced in 1/14 that that's the wrong
> instruction ([0]).

> I guess this wasn't visible before in any case because 9/14 is required to
> actually enable this in practice?

Yes, it should be academic without guest GCS support.

--GuKfjbABZoEkZnsG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqZyq4ACgkQJNaLcl1U
h9CMbwf/bDjK65GOecop0V/w4MHNGpqHlxYTlwIZNgHvx4flf7+6kidJrMKC1ylk
TSF9ZQ2L13zwoQhjTdGpHqVVRAkkbmwcq90/gNRctaw4ZPOt30xqQFtShSilRCxL
Mr2IIiDDnyDm/49zvAU9utR35OxFNdcZiGcmIrGuvZ0kp0XTyunnFS9uav0W1Yzq
2kx9DKutX18CB87B27+Q97ysuuWrZqKPQDXaYHwwJEiOZwoDHomkjaEAVhQF3Rii
bAT5gofK71RJJPsheQ5b39GIdW5WauzKiz622pvwg3kYccda8Axazb3FH6CzpQgS
pA7n6DAXLLnkqH0Yj6NStIwJrUL3Nw==
=dXbQ
-----END PGP SIGNATURE-----

--GuKfjbABZoEkZnsG--

