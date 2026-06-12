Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB29CD98D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 13:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=taNgp4KGsZ3KiXZSZvUQMLkfqRwbGhzPbNLDn7Y5E3o=; b=aUXm/hRAGN4m0YY1qqiB0FBvq5
	9MlQ8YPphE4TB0CausIvG2O1xhVK+X+k67GxvxdQMJ/lHGqQjBqUCOxiXdRkPmPzbmOUHznB3u93x
	7Da8yOZdCIzpICnlvtzXh21Bryv9ulWZaXJjo8Iwi72VmRu3QisgZIm5+9RS7K45sGYSXbNsdBmcf
	8i5ZlDAOAwKNBk65zJ0aHduS/ux/yRE+K9Tl2ASNwUo1s2pQl0OWGAioBvYO1lZLpLXpDpA8sZzDZ
	ex48+jaHKtNt7YF1vVkX8be7cy/RBL+Vx1d4f9VbbJEu9nwQcUxYs37oPc8yb5dXzgWrc9ytFWUuB
	3tdD1IEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1ng-0000000Awfa-2ZOq;
	Fri, 12 Jun 2026 13:19:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1ne-0000000AwfA-0wh0;
	Fri, 12 Jun 2026 13:19:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 966A5403A2;
	Fri, 12 Jun 2026 13:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8BDB1F000E9;
	Fri, 12 Jun 2026 13:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781270393;
	bh=taNgp4KGsZ3KiXZSZvUQMLkfqRwbGhzPbNLDn7Y5E3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gRWaSvc697+zpk8A7FOUkBv+zrymR3irREfWIgwvAlNE/BxppA4V648OReKSQc8fp
	 J3R3YL8sEiSOnsEdKj6XwmuaOpQ6ta9vePgHXJBEmqcwbxjJYiHwGZu6b9QyRWTGUC
	 vAVXTrOmyt0akvDpkYpk4JJp9IhEemH2e4+/vwYU0vTWKnmj5OhS1YC5CLaruu+xqi
	 VKQKaRtjZUBcKE3N7wD28JcsM0zWdZowDDK1fYjLLRInkQDGK9nhOeP3civb+CAn2H
	 S3SAiAzenl7h12DoE1ntDoUH80lttvHmEVfh2ff4AtaQtsRn3yAm9VQTAenFSnxpoj
	 IeWk2wxbZjcLg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 2A3061AC58C5; Fri, 12 Jun 2026 14:19:40 +0100 (BST)
Date: Fri, 12 Jun 2026 14:19:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Valerio Setti <vsetti@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 2/4] ASoC: meson: aiu-encoder-i2s: prepare for
 multiple streams
Message-ID: <aiwHbBM8UAYRKnvO@sirena.co.uk>
References: <20260610-reshape-aiu-as-axg-v2-0-cac3663a8b51@baylibre.com>
 <20260610-reshape-aiu-as-axg-v2-2-cac3663a8b51@baylibre.com>
 <1jik7pebk7.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DTWiBsS0PG7p6gAP"
Content-Disposition: inline
In-Reply-To: <1jik7pebk7.fsf@starbuckisacylon.baylibre.com>
X-Cookie: Nice guys get sick.
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


--DTWiBsS0PG7p6gAP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 10:16:56AM +0200, Jerome Brunet wrote:
> On mer. 10 juin 2026 at 23:29, Valerio Setti <vsetti@baylibre.com> wrote:
>=20
> > aiu-encoder-i2s is going to be the interface that handles both playback
> > and capture, so this commit does all the required changes to prepare
> > for that since so far it only handled playback:
> > - probe/remove functions are added to allocate/free per stream data,
> >   respectively.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--DTWiBsS0PG7p6gAP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmosB2sACgkQJNaLcl1U
h9BePAf/YY4oU9BYnoYM1az7OlkzIVHobdSBXPdAMqYYrlPj/WIZuTEDI1cdo/22
hoqllO3JKTLGy44Zy5I1P7ijkgOEkx2mZeJ7AZYOgZPlIXPH6AKbscA/xYjzfYP4
2CwyerLXM7UAy8RJv2Kimqj24HF6mzVVgYRbghHGqDWnLSGWj6BQLSlgaUYhwIcM
xdrydiGGZz2vkC/HOmwFqpGSyk4XQAm3HFkW5OwsK3R6CmVSwcFxa2fhjcTw8CXc
3gcvi70GBGQi8+9nMiAyGmnqxT4aONevk4cF8sVxLOxH1Gg0hwgMmsllFORiBdap
sDGZbqCPoyuQ/1hjHLvs3sqbo32+3Q==
=PhOT
-----END PGP SIGNATURE-----

--DTWiBsS0PG7p6gAP--

