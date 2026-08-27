Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9C4C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ebaBF7Wm57jhnHCdB2Tivrcc0WgePRhWe4w6HflJXUY=; b=XgCKUKtYt/6Nx+lVqQoutWb8He
	jQhl/YM6ii6+8ZK9DWS7LUK7sdpbgWeWLa1eLfMD1XfUlhB6x3Io7zd2Kk0fKXD/mZFayKe7LbtXN
	k9REvAuMOGKcOTJqnpQUpXVNK56ZvfnsByESHDX4Qd0fstrYAdiYW7GoMCzK88AKi/I2nkAUpmjeF
	haLCxRjEAPLMPiYA5q8MQHVJZhcAW1+73/6/c5xEZl+ovmUmjpWD5eMFsmSjGsWp490e1hObGIz1y
	QmTHk3wnvIhk2Mv6545R1MbgC5DyDpD7lYJj+Ovjxuy4APGCIGR+7XodbmZAUxjzJYM0DtMC2WxBF
	h/7jirlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcxy-00000004LYT-257b;
	Thu, 27 Aug 2026 16:28:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcxw-00000004LYG-3w3A;
	Thu, 27 Aug 2026 16:28:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E7794170E;
	Thu, 27 Aug 2026 16:28:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AA701F000E9;
	Thu, 27 Aug 2026 16:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787848115;
	bh=ebaBF7Wm57jhnHCdB2Tivrcc0WgePRhWe4w6HflJXUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=il8vsbVOCFUwes1trTtQUc+VPgHBNT8pQgbTC8TYPhIAsGILGCdk6BFKvKtouFF7w
	 0PPcJVg5Gtfpy5/z5OLyJm4e0mv6CKzd2VaBzIKnLXQSKgpgHrlFsfjGPqNFaiCQeH
	 uSVFdJ3k4Gk1OrESYOEx9lMTr5pPWqfhVFZd5dqCM2lB9C2vumY5EEuFN71EkbxGsI
	 samfySvYLnoD4SGk5eCruJsS7oPPKnK/AB1On85pcTaP/Wgw4pb8ZU0I9NBG+9Q6Nl
	 rf2zi7gzoJFdt2h8BnzEIFE8xLX9AhTb03u2FhNY+FTmul/19RTVJOTl22NmuMKNVp
	 i28zpeufjzvOw==
Date: Thu, 27 Aug 2026 17:28:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 2/4] ASoC: mediatek: mt8183: Fix APLL enable error
 handling
Message-ID: <98b11d2d-8157-4c1b-8562-42ff11cdff60@sirena.org.uk>
References: <20260821122928.41343-1-phucduc.bui@gmail.com>
 <20260821122928.41343-3-phucduc.bui@gmail.com>
 <47c14ad6-0311-467b-907c-517ff5044438@intel.com>
 <CAABR9nHyDL8=EiSi+_GBpHM0xLZraH8az+HRXQWudG=1hLZ7qQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0wMx2L5PNJE4zS3t"
Content-Disposition: inline
In-Reply-To: <CAABR9nHyDL8=EiSi+_GBpHM0xLZraH8az+HRXQWudG=1hLZ7qQ@mail.gmail.com>
X-Cookie: Alimony is the high cost of leaving.
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


--0wMx2L5PNJE4zS3t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 27, 2026 at 02:58:04PM +0700, Bui Duc Phuc wrote:

> To be honest, after looking at the code for other MediaTek SoCs, I found quite
> a few logic issues and inconsistent clock handling. This, along with
> the git log history,
> makes me wonder whether these code paths were ever properly tested on
> real hardware.
> Therefore, I have stopped at mt8186 for now.

There's a lot of code there with shaky error handling; probably the
default case works but things blow up relatively easily on error.

--0wMx2L5PNJE4zS3t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqQZa0ACgkQJNaLcl1U
h9DUGwf+MCKXjmklPUUS4YqdH7aXXG4NE645E1C5lIakFBlUZ2EMKk7d0PfJyYJ8
1k50GnIm/Ud5wuZAvf5TWmKCRxtOHlOO3mK46E6jgJDVSEYu8D5G5hJGUoPuZDEF
A/V6u4gDYz+UbUiuNEGgcUJAAxcAY0n5vQzDvrZgv+PKaxGdOlTL5j1BzZtX+UlD
IDiuE6SkNZQ6MiSeAU/zyw5RLZES6NX3qliToDQnWYNcyWKUl8fdgVkAJWD75jAo
85rJGgqvAPd6kQg3qTf43+PgBovSgwE/oZg1EEyUZrEQpZ2r79S/cFZHfpFz/TV+
DRCLEIOXjwDCmSO5jYZOQXTCLRg4YA==
=UBIx
-----END PGP SIGNATURE-----

--0wMx2L5PNJE4zS3t--

