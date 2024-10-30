Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBA1D7497D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 08:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NG4VctwzWtyFMziB5v6rXOvLWf8t36kRzPRq+LR4Vj0=; b=VkcQkhLwLG++DkHzWkl+om+y9f
	zYO4UBlAJy2lUSqiStwn9+bTErwdEa9m1BaFuxs2dkdtSELGfn3QcGvMpbsjzrFfkc7+Ph4pkpgZh
	5n1KgOBzCytbGfL6OBJoHra6+o6IL5dpZcudJpLQNnvmW1lDTffEsJUtuZKg0TqWSGLAuNsMOWlQe
	DYo8GPx1dszlwvkgDR5DqyV1o6wcR7ZiglFi8/SXn5RulXxIx+w6uErisIxGuvGBvwgPCT+qJEdHG
	YVjZ+JwlVTBkb1QSnLYQY0+5m9We6E7bmxkWaL2y87gRYPazL/k3F7QXBAoyiEq/KZ4cX7Q9Xx0D9
	RrpT64uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t63pK-0000000HFPk-3lk5;
	Wed, 30 Oct 2024 08:13:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t63nf-0000000HFBO-1TEC;
	Wed, 30 Oct 2024 08:11:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9D1BDA43894;
	Wed, 30 Oct 2024 08:09:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9678BC4CEE5;
	Wed, 30 Oct 2024 08:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730275890;
	bh=8D0w9FIRPWyl2qa3PqA5hpbOpMX+liBfZJc9yUSbUpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VMxH+BbwTSKjy568knTV4h+K4UrEgT1DP4G+0dSxhh5uu6cPEENMrkp+KDzN7Znze
	 oFLRmCZ58RxhV3h2MJWf0EApSSldEum89y6gn1PXAFNrj4rYlmTjmKuE8bpMsRCC4L
	 0NTVGa27/G/gNNPWkkryVnssJh4vk17oM6q2CAdKypJIXVyjRN3O+eh8cujPenesAW
	 saIoT0Cu//rx4iImWt8ZU4Wb0nZM3yFp64kGB2K/Ut7n5M52hYPzO5s4bKHKGoMDOS
	 FpdtbS9qLq1GGkYbDk67olXCz+/JzUp9vkx9xOIKn6zYBRtbY9RlWQSdSKCHB2AB1x
	 JcvtRL2cfMj2Q==
Date: Wed, 30 Oct 2024 09:11:27 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>, linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
	benjamin.larsson@genexis.eu, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v9 0/6] Add mfd, pinctrl and pwm support to EN7581 SoC
Message-ID: <ZyHqLyycmaOVW4JZ@lore-desk>
References: <20241023-en7581-pinctrl-v9-0-afb0cbcab0ec@kernel.org>
 <CACRpkdaEQYBim8TuDCCw15QDUWhHC-VqhGq1Le7eOd76k56zwQ@mail.gmail.com>
 <t7i6lkx5oedjma6uauiygnvbgzixnsqmolmkse3j2qiy5znf7t@kfozote6mm2k>
 <6721e35f.050a0220.b8d65.2cd0@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="80BL33JVuIzeKKlY"
Content-Disposition: inline
In-Reply-To: <6721e35f.050a0220.b8d65.2cd0@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_011131_477871_0FF644E0 
X-CRM114-Status: GOOD (  21.18  )
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


--80BL33JVuIzeKKlY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Wed, Oct 30, 2024 at 08:34:01AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> > Hello Linus,
> >=20
> > On Tue, Oct 29, 2024 at 11:03:14PM +0100, Linus Walleij wrote:
> > > On Wed, Oct 23, 2024 at 1:21=E2=80=AFAM Lorenzo Bianconi <lorenzo@ker=
nel.org> wrote:
> > >=20
> > > > Introduce airoha-mfd driver in order to load pinctrl and pwm driver=
s for
> > > > EN7581 SoC. airoha-mfd is needed since both pinctrl and pwm drivers
> > > > needs to access the same memory block (gpio memory region) to confi=
gure
> > > > {gio,irq}_chip and pwm functionalities respectively, so model them =
as
> > > > childs of a parent mfd driver.
> > >=20
> > > OK someone has to merge this and I suggest that I merge patches 1-5
> > > (all bindings and the pinctrl driver) since the different bindings ha=
ve
> > > dependencies between them.
> >=20
> > Fine for me.
> >=20
> > > Then Uwe can merge patch 6/6 (the pwm driver).
> >=20
> > The pwm patch needs some more love, we can handle that separately then.
> >=20
>=20
> Thanks for the feedback, so I assume we will detach the DT and PWM
> driver from this driver and handle it separately.

Yep, discussing with Linus, he is fine to get patches {1/6-5/6} via
pinctrl tree while patch 6/6 can go via Uwe's one. It seems we are
good for patches {1/6-5/6} and I will fix patch 6/6 separately.

Regards,
Lorenzo

>=20
> --=20
> 	Ansuel

--80BL33JVuIzeKKlY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZyHqLwAKCRA6cBh0uS2t
rALVAP97S+IgH/EXv4BXt+XDVm2AJB0jwqZ2QJOs2532TijmZQEAqATti3LmR9d4
f7eWIZ3b+I/MAhW+9Ll8/L5m47UxOQg=
=Yh0L
-----END PGP SIGNATURE-----

--80BL33JVuIzeKKlY--

