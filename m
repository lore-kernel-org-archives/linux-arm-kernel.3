Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8073DC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 10:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnlssmYuhIn+vcCNx5MG2qEpYo19Mi6vK6bTbOK52kg=; b=ZzbRVemy0Cpt40kKa2I9pYpTjh
	9NP5fIIllPQ/O8Eu8mIDrIVY/t2kcwdxD72sX+9PXNBON+HRpR5MjBX/cB0CHYygyAm3XjcED+5Dn
	mrdIrZ0cWqPQO88oBIhPsa9BgCHkGf6Xbxdd4MSAiC90A9DuiTqXkGWxeRUOZsa4L6CqVQLXBbd9w
	8Q5Lc7Z0w601iGibr6STt1XKh31J0yd7neuFcx+RR+TdcfE7Hj6e3nR3CewCqfHBF41HxljqHXSJn
	iZlqLagSDNlnjp11EqE/A+Cf4L+2txUK/Vq0XgBWzK1YjaDHtdHxxrV1T2FbkV9M/iC/vWfbUdDhF
	FUh55vVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiW5a-0000000Aa2w-1LxK;
	Thu, 13 Feb 2025 10:04:58 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiW3d-0000000AZnh-47dj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 10:02:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Unls
	smYuhIn+vcCNx5MG2qEpYo19Mi6vK6bTbOK52kg=; b=lJ3Ixv9PpDUPZy+veSDx
	ziTRqgIsOzwTnHddIoiDBXPFEseEJoG1keRyAs9yKz58AyHx+dto1xstv6SsJBlD
	cHh0saavR8n2B+kcgw2b0pnrG2gzY/ztdM/09hWnqBLizcPgmLQUbecXC5SKKpDU
	0lBVwBH+NU21FsEcURx5TU51xG56lNRQ4cYcGyd1Zj7giHXpsot/m1SaWaseV37U
	rZSXdttsmML8+ouc7rvSRfjF8fBgpYLVdnGE27n8N1qseFjWwd81RvoT8HYywvDD
	wJePDoyrx4FO03lPiva4MOrX0sVKdZbaUOFD7RS0GpCP7NkQznf4wpdyC7ZIKbZU
	0g==
Received: (qmail 1823272 invoked from network); 13 Feb 2025 11:02:55 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Feb 2025 11:02:55 +0100
X-UD-Smtp-Session: l3s3148p1@JVB1KQMusMxehh99
Date: Thu, 13 Feb 2025 11:02:55 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Adamski <krzysztof.adamski@nokia.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Roese <sr@denx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH v1 1/8] i2c: Introduce i2c_10bit_addr_from_msg()
Message-ID: <Z63DT_XdzEWrP4eR@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Adamski <krzysztof.adamski@nokia.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Roese <sr@denx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
References: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
 <20250212163359.2407327-2-andriy.shevchenko@linux.intel.com>
 <CAMuHMdW1wxQ0cddeE72D+Sii4HkT4bJfeTWX4-8FfHiFr+=3DA@mail.gmail.com>
 <Z6zwqbzd5evG0H2z@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="knIGSBLjShPS7lvY"
Content-Disposition: inline
In-Reply-To: <Z6zwqbzd5evG0H2z@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_020258_303268_F0B62CBD 
X-CRM114-Status: UNSURE (   7.42  )
X-CRM114-Notice: Please train this message.
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


--knIGSBLjShPS7lvY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Just a generic comment: please don't spend too much energy on 10-bit
support. I have never seen it used in the wild. It seems more like an
academic excercise.


--knIGSBLjShPS7lvY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmetw0sACgkQFA3kzBSg
Kba7ew/+Kqcp2Fze4DeH75uP2OB/QbNpx80sb7qHDvTBoOdL9TX6daJGbx9NejYD
4cXfgTJtWcAuiwn1QkGFPTMUqUzpc/0KOK3GC6OAGvm5ey4/HDXKzBiue8zKbiOa
da195dsvzjs7f9kMARVNMzzqXYr3NZXcLAZDPlR2ifCiFGVnK3xYkUPACWjZEWzI
fy15U37jiPuCE/3TSHBc+1/q8p2T/vQ2h0AApKD8NgpsnORqYx5oeXMf/ztjI+RM
vfzNPKvxb6Y2ppaPZWx6teAZfCA52Bn2twzmbwQBpsRdR8s8lUp00IO9aX/xZGQi
zCVMD74Kz7B0lvmAvJHv/23vHofoRiZmIATiL0zl6u2wm1zlzsTv0zFk0PVqBLGZ
ZZ3DEOORzPNpfx/csYx9U1J0L1OIoqgc+/y2FnfQIIXmTOvnwHNJb9AD5pTr7b1u
YjfwprDAc9yJI/ps63zcYwioTc6CjTENNLeHwTSFgmjdvPn2KJTLNiG5GHB8zY5T
QrOPvOGOI2hLs6LbWrCxQnRcrItIsjAV8ClxwlTRIllAXeqMZAc+2W6KhmukwsOs
Uin3nyrmWNw1vx50tN/mJ+BeN7A5Kh9vhwLp1+40Auz5CUErrJtyfuPV8kNzH8wz
5zooWxoWZMwZ2x2SFgTy1iVtPJZ9m0ytQi6P+Yv6Xu8uqDgy+Q0=
=+YyW
-----END PGP SIGNATURE-----

--knIGSBLjShPS7lvY--

