Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82E0CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 21:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3tZSe6EjWvLL4etfciKqeLMj4yhwYHePqQZXrAv+es=; b=gn3xVd5Xpnac63NssuKr4YI+XZ
	qyGRjOV9yVShMt4jQQIntywe4aDpD2IU5Tp2qT+vvqqK+6l06mvXVdOdKr+I67P/lSC8ABvpIVl2W
	2FCUB7PBz+nHMwGEelg+0CEC5/bbfv/rFHBqQciQUmmsYkESeXSJH3uLJ+wJi0bev5cKeAA3LNJcb
	bGZO/HoFxLdtAo7jmSJmGUzLTLfvOxp3mPY4m3IkRahnqlDq5BFxg8U4wBLmIfRL//CHuoxNMQM0m
	mgS5iEqiwPGFy48aKaYrlFXBSJKO/VIaPOhCIbAzf6uS7E2WTn/BK/HlQmnHXTe9odcvXqzVTDuwF
	YD0C0kUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCO8U-0000000AFVh-1lZL;
	Thu, 01 Oct 2026 21:16:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCO8Q-0000000AFVB-0r0P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 21:16:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4CFCD602C4;
	Thu,  1 Oct 2026 21:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924FB1F000FF;
	Thu,  1 Oct 2026 21:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790889368;
	bh=j3tZSe6EjWvLL4etfciKqeLMj4yhwYHePqQZXrAv+es=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P+jof2y/i9vG8bCW/VDqxjV0fYlsPcFcvV28SPkTi5EJkbAwebXlyhwbk/MQ368pc
	 rdm8EYPgjhCtlAZJs+7OoyURvkpvTWYf0ZfXp/jnS9jZ3s4Y2Fewt00mMzHcQ5VguI
	 7RvKWaUmQzXZBW/5JrzHPjcFhjVnANeuN260qA5Go4yg3zxY7w7j0IDgr3mgnUOO6Y
	 GnY7M1Z7c17LDioDVv3RS0hpTYkR1+Neb4KRV4RwLnQqDDjnU29kwFjoJjx76cK42i
	 7CDncrEAwGN+7bD0jTKHlNIdDigTs+QFArBhFGJjTbFUmE3GpONC/CHQarPyJYhOO8
	 mcUX60w2LtQKg==
Date: Thu, 1 Oct 2026 22:16:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: longzhao@ambarella.com, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>,
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 04/15] dt-bindings: gpio: pl061: add Ambarella CV75
 variant
Message-ID: <20261001-snuggle-flying-e7180d4ac1e8@spud>
References: <20261001-cv75-v5-v9-0-486cc289a4b8@ambarella.com>
 <20261001-cv75-v5-v9-4-486cc289a4b8@ambarella.com>
 <20261001-attempt-savior-5d4a0eed4320@spud>
 <CAD++jL=tsETOFvC-AdethTdrGtet5neVanj3KyyB4EtEOpJ_Gg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1WD25rPQ8gIjRFJm"
Content-Disposition: inline
In-Reply-To: <CAD++jL=tsETOFvC-AdethTdrGtet5neVanj3KyyB4EtEOpJ_Gg@mail.gmail.com>
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

--1WD25rPQ8gIjRFJm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2026 at 09:36:50PM +0200, Linus Walleij wrote:
> On Thu, Oct 1, 2026 at 9:23=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
> > On Thu, Oct 01, 2026 at 08:40:53PM +0800, Long Zhao via B4 Relay wrote:
> > > From: Long Zhao <longzhao@ambarella.com>
> > >
> > > The CV75 GPIO banks sit on the AMBA PrimeCell bus but are not
> > > register-compatible with the ARM PL061. Each bank is 32-bit and 32
> > > lines, with extra mask/enable registers, so arm,pl061 must not be used
> > > as a fallback compatible.
> >
> > What has this got in common with the pl061 beyond using the PrimeCell
> > bus? Current reason for putting them together is a bit tenuous to me.
>=20
> It was determined in early review that this is very clearly a modified
> PL061 block. The basic registers are even named the same.
> https://lore.kernel.org/linux-arm-kernel/CAD++jLk0LoOJk=3DTXin42AL3_z_7eV=
VkvMnYr1S8090C6A_B+dQ@mail.gmail.com/

Right. I think that'd be good to have in the commit message, because as
an outsider reading this it sounds like it could well be an entirely
different device.

With that explanation,
Acked-by: Conor Dooley <conor.dooley@microchip.com>
but as things stand,
pw-bot: changes-requested

Thanks,
Conor.

>=20
> PL061 is different and quirky and could not use gpio-mmio, while
> with these changes to gpio-regmap it can handle its pecularities
> and use a library which is a good thing on its own.
>=20
> Yours,
> Linus Walleij

--1WD25rPQ8gIjRFJm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar7NkQAKCRB4tDGHoIJi
0iH7AQC+o17BgBwJe3k2EAZcRXfzE2tgNWgAPkP28V9wBeNGDwD/UAU1TinKSygv
MtUtKTvPb1iV01w1PpMHV1VZJCr5NA8=
=TwJs
-----END PGP SIGNATURE-----

--1WD25rPQ8gIjRFJm--

