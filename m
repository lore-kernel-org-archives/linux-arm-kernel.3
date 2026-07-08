Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF02C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 17:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i7IPmNgvS9mOLFEChWl8INVOYxpfS2/NOpNSeCStxpc=; b=w4vVWsZe+qkSCINdVyZyBaQmg8
	XugDtGbNHgBFmq1/SUv5XQ4UU+RrlJVxjfShcUr9uYzie/Cp42T352PpW1SwggcxgCCJjn6rJ9Kkd
	2MZHIseQwSSKQr+Xci0UxB174thOwQa6NtsYxI3Lq2jQ3NUQMjClGqUSk/xIrmbg9aK0BJvnhONmi
	FnLyl9H4YaJ1pGYyiGdOHB4S0YXOL7qU1yKRhPGC0JbDTcGUX4Px4qam0eWvwf9/1e229eYT+gbJz
	/p8F1Uq/oK5eMZ9aQFZmIvF4INFDbbYSIHIwHTERx/956CslLxHh9VA2nr97ekGuFdqWGzxqYXst5
	uFS612zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVz4-000000005d5-0EB5;
	Wed, 08 Jul 2026 17:22:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVz3-000000005cX-02BW;
	Wed, 08 Jul 2026 17:22:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0F8BC6001A;
	Wed,  8 Jul 2026 17:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE661F000E9;
	Wed,  8 Jul 2026 17:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783531371;
	bh=i7IPmNgvS9mOLFEChWl8INVOYxpfS2/NOpNSeCStxpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h++1O9ENPah2e3Ku13KPLHp893MhKU+YG8XBJT1RVVBjXvzCfjcXEShyIaRP6wggM
	 R9Tr7x6BoME33r+edVBHNsW3iFZAU+BrJ8UDv8g8hrqAw8HZQAdEvFj0N+fWmty2G+
	 M4Nv4QRACaZCYMWM+UYIKV8KamYtpI3JoV4roGDa2v8eVfXJCl7qP2r96ezkYmEgI5
	 UyO70ToZ6P5z5EQdwoGQNG2mU8XG/gN3bbiQU1+rYCn4NPzYIoEuJ60PybSp6WAdRH
	 I8cVW8wA0Dt0MhQaRIMOavPaPWqZisxasJq6Jb3QhJu5kI6i8U7g5qAHRYgB7O6jJq
	 VHruDas3phubw==
Date: Wed, 8 Jul 2026 18:22:43 +0100
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Takashi Iwai <tiwai@suse.com>, Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com, Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 00/27] ASoC: codecs: Use guard() for mutex & spin
 locks - part 2
Message-ID: <c9f7eaac-9bf7-408a-a4a6-56f3ec6177a6@sirena.org.uk>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PgruSEpo43eVP3iy"
Content-Disposition: inline
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
X-Cookie: The other line moves faster.
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


--PgruSEpo43eVP3iy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 08, 2026 at 09:17:07PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>=20
> Hi all,
>=20
> This series converts mutex and spinlock handling in ASoC codec drivers
> to use the guard() and scoped_guard() helpers.

This doesn't apply against current code, please check and resend.

--PgruSEpo43eVP3iy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpOh2IACgkQJNaLcl1U
h9AHoQgAhXWcuJJkJInaKgPMlux4hFBIjfDxewy++xXi2dE4XZFZF9qSXoZ7tP64
OjmBor4HySFyF0TcRcavMwLenxRl4hNX4GheO004Y93pxBC/tWufADjMLYCDHE9h
BjFlvQyoP5A3VovCCADSNqMcDCBqgcgz1KC0NpwTyTXzgGgOtCsT38do2/WKBH+q
G5DJvrjY2TZpzcIqvF9VMqxiQqUCXMEFFz29fsjP+4J2lhRjxMb3fIJeRsdhw3yT
nbNBZooFgQiKUwh2YpA9Mip214LxN9UEvd5HkehzudvMfMIxwUyKE/Io5gKKsCNo
lq7PXPnBIfRaMWCJUDCq632/gxKqSw==
=rQ7N
-----END PGP SIGNATURE-----

--PgruSEpo43eVP3iy--

