Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE90DCCD19E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 22:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8hp4rymi/w615rS86fSx8eu95VzsthQfrxaFKltfQSA=; b=x5Oqn8xUpfXwQ/G9OtS9ZQiCul
	XsvwAQeveyGqID7tX/cX/YjHwou9s4NB7XBCXE8nI81zLrEzEOBHOBmt0+gzJZRpkNALqk3zxLxuW
	BiXxwdXKGcwZdywYXkujyCatnErg68Ww2ZiVzF74pcBNh9G2C6IkGiqCYjRB3/XHRe358+EhbSp/y
	Fg0UuCGvSa0YFwcHquGGKpEPzr0MwVjTSKSthRLnr9h0FR6IPEV1yC+dNmBweQDM7Yf0+6r+9zxjK
	LEK61dZnU2nqh1IkhT0/qmLSoikdMvyJue7lID/Yi1K7xxWilbecHmJfpI4Tu0mLb8k6j7LyEPvsZ
	DLwLNZVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ARE-000000032xr-0BAH;
	Wed, 15 Oct 2025 22:57:44 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ARB-000000032wt-050S;
	Wed, 15 Oct 2025 22:57:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1760569050; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GUB2FVD69r/C01TsJxSij78wbWAgk4fStSZLc+yMKt9QZnxEXzfsrQiBxTuHERQstCf7itkNtro0ijH0FFENa1LcaIJnw/RQ8gvh3tM4nklpRji2BI2uCQsvNSQKCCEWidgthRQ/xMJAfYgBj0bctYil9ihVt1X8zjc5YwY2el8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1760569050; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8hp4rymi/w615rS86fSx8eu95VzsthQfrxaFKltfQSA=; 
	b=F6efgJMTyhdEKP5OOmHpd08VBn461J90YfwLnoLuDMI80vhNMk2/pQ8WzwPubMXgvyS9nNMi7IW2JeXo8t11OpYVcwLnxxaeS/own8po3F/+ozBfzJco3u9qNBM0EwuK6cdqgiIoXQPnhmozdSH9ANVI4Hw/jwvv2gk3XrCnTR0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760569050;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=8hp4rymi/w615rS86fSx8eu95VzsthQfrxaFKltfQSA=;
	b=fUy67HWtPlTYQoadjcOVmkQ3gCyUYgPxPJzhOm7QiXAQbNxwAdcmRwaaLmK6aCSS
	UrHsTOYABL5QjHW7JHcHCgUDJDfdvz+mmvRScevB3Kl4cMBL1owRCSrAmJa5At6YvnG
	IN+P4Pe7l0Oh8dx296uW7EtAATDDPldJhrVTEs00=
Received: by mx.zohomail.com with SMTPS id 1760569047390251.2858506578142;
	Wed, 15 Oct 2025 15:57:27 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 7A320184DBC; Thu, 16 Oct 2025 00:57:15 +0200 (CEST)
Date: Thu, 16 Oct 2025 00:57:15 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, mturquette@baylibre.com, 
	sboyd@kernel.org, zhangqing@rock-chips.com, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] clk: rockchip: rk3588: Don't change PLL rates when
 setting dclk_vop2_src
Message-ID: <eumxn7lvp34si2gik33hcavcrsstqqoxixiznjbertxars7zcx@xsycorjhj3id>
References: <20251008133135.3745785-1-heiko@sntech.de>
 <6677ebf9-50bd-4df0-806c-9698f2256a8d@cherry.de>
 <2749454.BddDVKsqQX@diego>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fwgcdh6ni2fyyeru"
Content-Disposition: inline
In-Reply-To: <2749454.BddDVKsqQX@diego>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.3/260.518.91
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_155741_087364_D89D15E5 
X-CRM114-Status: GOOD (  23.86  )
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


--fwgcdh6ni2fyyeru
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: rockchip: rk3588: Don't change PLL rates when
 setting dclk_vop2_src
MIME-Version: 1.0

Hi,

On Wed, Oct 15, 2025 at 03:27:12PM +0200, Heiko St=FCbner wrote:
> Am Mittwoch, 15. Oktober 2025, 14:58:46 Mitteleurop=E4ische Sommerzeit sc=
hrieb Quentin Schulz:
> > Hi Heiko,
> >=20
> > On 10/8/25 3:31 PM, Heiko Stuebner wrote:
> > > dclk_vop2_src currently has CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REP=
ARENT
> > > flags set, which is vastly different than dclk_vop0_src or dclk_vop1_=
src,
> > > which have none of those.
> > >=20
> > > With these flags in dclk_vop2_src, actually setting the clock then re=
sults
> > > in a lot of other peripherals breaking, because setting the rate resu=
lts
> > > in the PLL source getting changed:
> > >=20
> > > [   14.898718] clk_core_set_rate_nolock: setting rate for dclk_vop2 t=
o 152840000
> > > [   15.155017] clk_change_rate: setting rate for pll_gpll to 16800000=
00
> > > [ clk adjusting every gpll user ]
> > >=20
> > > This includes possibly the other vops, i2s, spdif and even the uarts.
> > > Among other possible things, this breaks the uart console on a board
> > > I use. Sometimes it recovers later on, but there will be a big block
> >=20
> > I can reproduce on the same board as yours and this fixes the issue=20
> > indeed (note I can only reproduce for now when display the modetest=20
> > pattern, otherwise after boot the console seems fine to me).
>=20
> I boot into a Debian rootfs with fbcon on my system, and the serial
> console produces garbled output when the vop adjusts the clock
>=20
> Sometimes it recovers after a bit, but other times it doesn't
>=20
> > Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> > Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger w/D=
P carrierboard

I'm pretty sure I've seen this while playing with USB-C DP AltMode
on Rock 5B. So far I had no time to investigate further.

What I'm missing in the commit message is the impact on VOP. Also
it might be a good idea to have Andy in Cc, so I've added him.

Greetings,

-- Sebastian

--fwgcdh6ni2fyyeru
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmjwJsgACgkQ2O7X88g7
+pq1kg//XaEftjAulYritpGVJ9ktfx9Y37CPdTrs+MBY0C3e9t9e0jf9WPWkREY3
Dc/cX8SmQzSsVqvEfS06mxZwZ1d8Gz/4Q/XrqwKZZusoFz/gvKzOSMqd6knBBMKc
9U2zLzjgXmzg4BSH/mVhp1gDEk++djQzknyzb6giTwft4Mgdo7q6Ft1OUoxtfOuc
q5X+gS/QHLkehiu4eQMc02QQqa+abOYZhcZsRmH1rxDmYLoCfuADqWrTrS1RbtwG
Ln8n9/0XCxzQZG8a28IndGwkm5jVr74TldJdT16Z2UKaIT3c96sSL7ot7dE7pd5t
WP05P6HqQCiEpqKmlOEpGBsmwUmpThN3QmNVzKSsjUuyXwkcZNHp2MT6RzmiDUzn
HGuXTIl84Bj/fO7/67VEbvstO6sUDC74Wkri34I6QRoXBmlWRE9aijsB6arOqgC5
i106vm3KrV5auXKX4qRylzW+v8BIvxCFd2rXLCnUOZXSw4MXFyFwxlq0R8bPPVNj
GmpsIBC4QA60H4SPr7v2G1tua7TWurLa+lPiyZW0zqImbqZopzzNG3+/HgfnoXg7
SvNI3LYzN1hnY64brkZeLpc41ckQEg9nxRHrr6uP16N7HI65n8Bw6Bt478p1NFMs
zcgTuKGwzO2xSvNRMT2N+iflMikysLHQ8zqssgGFtbMur0vgPvM=
=+w2d
-----END PGP SIGNATURE-----

--fwgcdh6ni2fyyeru--

