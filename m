Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C72C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 09:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/kuTwPejHRqu+8NmvADdeaHFJn2mKfy3blTsFsj7rvo=; b=s/w6fOaUbN1UAu54ESIT/hh5RG
	W6/tOh6LfVx7ZIcAZEK5LRaFMxwlOkVyuC8p4/bHfEirdMP1V6+H8LLy9a+SxKI8nO+Bv6mCLEAcH
	MgKsvxYGKZbrq1enZO165EgtKVeO8qnViPJsd57k3lTPPUYZSuqSlJlrpthmaIv/0jekdeDUzhTvS
	fuKVR63acRTscdWXpmHZzxnT8nNic6jgDFLb9mOpt75HEVqopGB3ZEEvmWlLFgGBpfBSqBhgwrQJd
	EstQNe8mmuU5t5fIBl11luogg1YUsMkzgaQ7HXOPJllfDM33c2xjMmUbGC8nvU/A8u59ZnmACuNH6
	G9s3eTBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFVDQ-00000000DFo-1cSU;
	Thu, 15 May 2025 09:49:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUyG-00000000AiE-3spi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 09:33:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 07224614B3;
	Thu, 15 May 2025 09:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0F04C4CEE7;
	Thu, 15 May 2025 09:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747301623;
	bh=U+tPnOpL3m607kNEaHvTgUEJzEiFqUT9VJpj4Anya/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UXNjgnWA+H9nCoRF2qGohiFrM+9FMPSMyzLbuKMGzSIut6SneQ5AYUcvMaR4mY8zs
	 5rZ2AQ0wyVGpNGFJXsr1fU4zR+9Uzk66i7NnFVaQlkhcQaXpo67AMgy/qYLD628N0f
	 faFIQ9MSqNnmIyNl2evCqzqXt9Cx69CBb+nnunbzBgUGY2wu4gDEYlKPFCElm+ZzUF
	 oI0ZEebDwChS2GbD3vAcnmmT5D/eugikStnnPtMeePAKnCR5P+RTAK6fWefc5ukQ28
	 r/ilLS4EEcMC6h9BU9inlZuFI2WrvRWCrPtFi1hDuFnefN8qxXICkIoQUMdd4YRTaZ
	 pExzq0Nm0S3/g==
Date: Thu, 15 May 2025 11:33:39 +0200
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Artur Weber <aweber.kernel@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v8 4/9] mfd: bcm590xx: Add support for multiple device
 types + BCM59054 compatible
Message-ID: <aCW0822BVpfKV2NL@finisterre.sirena.org.uk>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
 <20250430-bcm59054-v8-4-e4cf638169a4@gmail.com>
 <20250509140957.GD2492385@google.com>
 <aCRZzwW0w8oVWLUp@finisterre.sirena.org.uk>
 <20250515071357.GD2936510@google.com>
 <aCWfre2-n_PSuhxR@finisterre.sirena.org.uk>
 <20250515092000.GF2936510@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ejBQO6RFNOdfKSiv"
Content-Disposition: inline
In-Reply-To: <20250515092000.GF2936510@google.com>
X-Cookie: Well begun is half done.
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


--ejBQO6RFNOdfKSiv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 15, 2025 at 10:20:00AM +0100, Lee Jones wrote:
> On Thu, 15 May 2025, Mark Brown wrote:

> > Well, you choose 3 - I do think it'd be a lot easier to go with option
> > 2, or with applying the rest to your tree as acks come in.  There seemed
> > to still be a reasonable amount of discussion on the MFD bits (eg,
> > there's some formatting comments still) so I was expecting this series
> > to churn some more and was waiting for a resend.

> Yes, I expected to apply v9 with your Ack.

OK, that's about where I was expecting - at least one more respin before
the MFD bits are stable.

> I can go with 2 in this case.  Applying in dribs-and-drabs as Acks come
> in would be sub-optimal and would likely end up in a mess.

Well, then just going a head and applying them on a branch with a tag
seems easier than delaying then.

--ejBQO6RFNOdfKSiv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgltPIACgkQJNaLcl1U
h9DkqQf/REpQxgWVfq8b7aQzalvyecOuF4kgL/JR9uyKEG8EDkwpLRnT/+yxJmCX
Dkw4A53gNv/cD2E1UWI2AYs6i4/rUScPzGsjtiUV5AUoDJ91LB2uxgHiSk/xFpck
x6A37s+FfJYLx9Gmq8cfwVrl103CH7er2kqiadxUL0db4mPXvq/g1EPk2XmuP/Lz
/dkbZtw92fLqWkofr/kiGGoKV9TKa0vlcVmunnaF1Pm14oN+cpTU3aAT58Ogi6Vn
1AuIHpgbH1fae6uL52xialrE8H3PVQF0KkkxyMPrSj+mSL17DDN3jDCXoz6Ypw2Y
eJFtfBiL5D0nmaE7Z2CtBkgLq3LMow==
=U5xD
-----END PGP SIGNATURE-----

--ejBQO6RFNOdfKSiv--

