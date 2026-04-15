Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6916FF43854
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 16:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYzXL7EXoBSE9Cg9BXgwRZ578kNkDROKHQt5UtCGWPM=; b=GdebtTGFNVxE9wKrfsXickKU9w
	CQedi1xR8FT4+WYH2EQkmQX40xKnlWO0c3jNBpTMtGLOWLHCEiiOYo/QDpKpdAIfU3A7lBd+xNL4F
	qgjUdXtbl7A7VWFKWT4AB6j3SUc4OfkA8mIhlO9x9kd2xYyWIh+8s2tJPMcacqhVyKflbg2NNi9pQ
	xzTJWSfN3H/ntvqGtjINOz7GnhhG84L3FXuJ1Ec8A2yTJ/7ffsSPstmuMRK3xTS4Mx6KipCHUC/ma
	rXOXIo755EZ5FCooz6bWezZjadWf4lj/ujOeOcz50u1zy2AerPXI7IhjNZGKvdpqEbRNM9Dkc7YWU
	fUMX3ikw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD34u-00000001NMt-3tm3;
	Wed, 15 Apr 2026 16:27:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD34t-00000001NMg-0lU2;
	Wed, 15 Apr 2026 16:26:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B58960120;
	Wed, 15 Apr 2026 16:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE0EC19424;
	Wed, 15 Apr 2026 16:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776270418;
	bh=BYzXL7EXoBSE9Cg9BXgwRZ578kNkDROKHQt5UtCGWPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cTfiGFWLlja7r4I9jgst2Mfoe+hTtPuDgENPqB2H7bsUqs7c9wInsoWgHHK+VXIyw
	 9sNQSu/oDcUL/3K+VOOHXwHHg4Da7hXMdk/ugiuxn13E4n74RNtYduMwXDjwbkIwob
	 t0zC5pRJwgWCi/Sq6WZu8zTKSLY04hX7jpeltbrDbviMQ47rBnlzwu3vCxbTSbr4o6
	 NfezuBc+ULH8qG9yJ4KJVGee1rDRPAnnzXeLtz0lOtOGTg7OfFOAUxvVNBNcxxHKsl
	 d+QY7Uey58GE6Hy1zpiWGy0DU/sEOuvQwzC0OPCGCDWBFrlji6GLkiLcCKPGW+Xmjr
	 P8KqpWpeN1Twg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 6258D1AC57F4; Wed, 15 Apr 2026 17:26:55 +0100 (BST)
Date: Wed, 15 Apr 2026 17:26:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Valerio Setti <vsetti@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC v2 02/11] ASoC: meson: aiu-encoder-i2s: use gx_iface
 and gx_stream structures
Message-ID: <ad-8T6DBOlZsqugY@sirena.co.uk>
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
 <20260411-audin-rfc-v2-2-4c8a6ec5fcab@baylibre.com>
 <58d1df89-7c97-4e2f-af15-93d1f7bce5a7@sirena.org.uk>
 <1jy0ios3f9.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SGdE9JS1qidC2+vp"
Content-Disposition: inline
In-Reply-To: <1jy0ios3f9.fsf@starbuckisacylon.baylibre.com>
X-Cookie: Victory uber allies!
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


--SGdE9JS1qidC2+vp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 15, 2026 at 04:28:58PM +0200, Jerome Brunet wrote:

> Valerio maybe you could keep function above just to set the rate, but
> enabling the clocks through a DAPM supply widget ? This is kind of what
> the AXG is doing.

> what do you think ?

FWIW this seems like a sensible plan to me.

--SGdE9JS1qidC2+vp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnfvE4ACgkQJNaLcl1U
h9Albwf8C0uE0EV4cFI4KJmG+Ojdhsq1MoR+wvBa2cUsXsaFOISw5Ifsm0FVdTMr
ughkOmRGGsuvL+VIk74psmVagEFIYB3VkFVaZAlocG3/W6WZ8cc23BdvvFZL65Ks
iCRE0QGEVyfNgfHIw2QLB1zeY4YJtvC/3SVWIF1dJo3gYiU/X/ElcKvReL/1sQ/Q
VGhMgICik63g3aNAtMWh9k2OUy6CeHjQABUW0NV73Mgfmp3pF+TjOi/kz1j+Q/sD
blJmyTc+TGvApNRwwthc5/Y9ibmzbMXFMZOSc6ZOohsIH6oOzyj/j1yI5lbSM8eR
M5NWn6fI0JrxBUlLFquYldpMyWeqOw==
=9wNW
-----END PGP SIGNATURE-----

--SGdE9JS1qidC2+vp--

