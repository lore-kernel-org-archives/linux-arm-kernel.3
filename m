Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D5DC3DA4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 12:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vgwx1Wi1bjtud8Ity9kexboyQtg7d6Zl3hDxQTxL41s=; b=K7MdMf70xg3p459kL+IYNhNvsu
	zpWxlBLpanI3Aye62ENkYs3lnGOFO9Mr5sRYmBKU2nQ5iBqiVNtqUsd+0dkSW/9pQ1B5QUl9uPcOR
	Ta+RRlfGbsh0cC6ippQQTLIofN4gUIdTcyLhU6p0iKwjiaXrp8IsWZ9nX95SN6sMN5IabBRMD8S1U
	4wCvLYYyW0W+qT0cS5pG278m0a6n5xd4KJBDApJEmhV1uuHbMKDdMLrohOvDm0VvRR/XVFQvSeGfT
	WFqaQGnSO5ppngZcHJuPuTuPAj46oBxzzBsZ+5QDvxuxFWGrO+RaTbg0V8MdnF/BilqfGV2Tr2WCT
	CCE2lqJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB3Z-0000000Ezw9-3NpK;
	Wed, 14 May 2025 12:17:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7qt-0000000EZeW-3vRp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 08:52:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A2D4B43923;
	Wed, 14 May 2025 08:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4064C4CEE9;
	Wed, 14 May 2025 08:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747212755;
	bh=dFrSsSDv6HrvySvJEPFuOaEYOApN+I+8GqE8ME7PSIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OQLWfLPIgAtN/UINC5qfLYZscirwfpKFmXpNlYP7OLGGeO1nsbs5mVonYezcTz8n/
	 15mSHUKRfo5nM76Ok2O6QGJA+CWEli8QdoEUGm7alBbMGpSrS3nC3G7AamHe863njJ
	 9drZ+71BFpEqI2cbAnT5IG+1q4Axbq52J5/TVG9Me9tzMWkJoK0XhHBhZ3UALB41kd
	 J4Euc7d62Y+sVWkxH0XO2EK1oYNK6VL6mKAj+XTKxJhk2hodNz423ypmUIYyHcDIPf
	 1ThHtUTOdr4u1dVYX5DIa3SIhSsqX/pPQEK6ew8+OFXVA9Lehcx2/EuZsfq9UW33Z7
	 4+FaY1vAH01RQ==
Date: Wed, 14 May 2025 10:52:31 +0200
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
Message-ID: <aCRZzwW0w8oVWLUp@finisterre.sirena.org.uk>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
 <20250430-bcm59054-v8-4-e4cf638169a4@gmail.com>
 <20250509140957.GD2492385@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Gq8+2GgzFjfqwkiK"
Content-Disposition: inline
In-Reply-To: <20250509140957.GD2492385@google.com>
X-Cookie: Well begun is half done.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_015236_001903_9D13D409 
X-CRM114-Status: GOOD (  14.44  )
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


--Gq8+2GgzFjfqwkiK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 09, 2025 at 03:09:57PM +0100, Lee Jones wrote:
> On Wed, 30 Apr 2025, Artur Weber wrote:

> > ---
> >  drivers/mfd/bcm590xx.c       | 12 +++++++++++-
> >  include/linux/mfd/bcm590xx.h |  7 +++++++
> >  2 files changed, 18 insertions(+), 1 deletion(-)

> I can't merge this until Mark has provided the Regulator Acks.

Could you be more explicit what you're looking for here, the diffstat is
entirely MFD?

--Gq8+2GgzFjfqwkiK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgkWc4ACgkQJNaLcl1U
h9DoJgf9HRWiZlDu8zMbaXMf3cFnPAmtyMLpsYum8wbNl8UYDQPsaKNxBdsGvoEQ
EF4H43BjGG8lu8v/LBXIUcfCbIYPfMIsts0806x9W+fops51dqsS01kW38FW6KYB
6sYN74rPwEuUWFuLIe9GeFymNrFr57By7LbMOPYiiuJSk4AKolbu5lOqAAmr8n5O
f55jGKXEB9TEykCvjxWgM8df4Lo54DvGvGjxLDVi3iZDRzBh5l58/oHWg0imQFI4
VQcjXJmQXQkPSHUY7WBjvEWU1mFlwh9PLR9JX95A1XdVYfiN7kXDELZWtqOIIEeu
pJUbUA83LtHBigPKZOC5Jvl6ziMqSA==
=VFDd
-----END PGP SIGNATURE-----

--Gq8+2GgzFjfqwkiK--

