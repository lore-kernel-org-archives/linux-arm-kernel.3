Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039BAC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ES0AMk0wkXmaqMy9pIGghKd77rIPki0K7cABoa+Z/Lw=; b=0YmQRWB6r7SfKV9oc2eSrBnUtM
	/dhYY1YFzLQfuqyoMlzHOGbWlkPhoLztcqyzKYLWhRTF+kMP7qDWqwFt44JQZZfbNORh2YmOboSE7
	Zi7v/ZW0xMK4HVe5dWCdjXWeiPIN96sTxh/O68wJxujb5IcEChH40Qvqk+MAZTCuKE2CoQxOONUOB
	aIN7EAL+dy7+dm87zlDkvCsHLFdqw2NYZrlmu2XrjRXY8LY/P8FY2/w6ueZBhGfCQ6mWnqxd27riQ
	m4/btqZ+SKzgnP6vImG6xutv3NiH7wNUWt/0BjVxdSIGOeF48HJ1gH0Sd23ZvapoKubpkpfADcVwv
	LmUULHzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPntr-0000000EODF-3WPG;
	Thu, 12 Jun 2025 19:47:48 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPn41-0000000E9fO-0Tb3;
	Thu, 12 Jun 2025 18:54:14 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 0D12D1C00B7; Thu, 12 Jun 2025 20:54:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1749754448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ES0AMk0wkXmaqMy9pIGghKd77rIPki0K7cABoa+Z/Lw=;
	b=bEFAWNrqxiDB3hTLYkNNin93KGymmobI30NxboUjySkMZZbQ1tDkw60ZqsrwZWSPzNXRLT
	19enMfhHWWz0Q5ewQBDGlyH0l4C9Yl59JXD+rK7DCySYJz3mn+lT8d5y3fwG56k5w4oziS
	988hpv7ySCcn9jbXEUW0jKpc8UQ+ntg=
Date: Thu, 12 Jun 2025 20:54:07 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: David Lechner <dlechner@baylibre.com>,
	linux-rockchip@lists.infradead.org,
	Michael Hennerich <michael.hennerich@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>,
	Leonard =?iso-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>,
	kernel@pengutronix.de, Oleksij Rempel <o.rempel@pengutronix.de>,
	Roan van Dijk <roan@protonic.nl>,
	Tomasz Duszynski <tomasz.duszynski@octakon.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Mudit Sharma <muditsharma.info@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	=?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
	Andreas Klinger <ak@it-klinger.de>,
	Petre Rodan <petre.rodan@subdimension.ro>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 00/28] iio: zero init stack with { } instead of memset()
Message-ID: <aEsiTy++yKGe1p9W@duo.ucw.cz>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
 <aEqbQPvz0FsLXt0Z@duo.ucw.cz>
 <2243943.irdbgypaU6@workhorse>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qHcR0wTfGJLS0CPf"
Content-Disposition: inline
In-Reply-To: <2243943.irdbgypaU6@workhorse>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_115413_613160_985251F2 
X-CRM114-Status: GOOD (  20.30  )
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


--qHcR0wTfGJLS0CPf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi1

> I thought I'd chime in as someone uninvolved because this seemed
> interesting.
>=20
> On Thursday, 12 June 2025 11:17:52 Central European Summer Time Pavel Mac=
hek wrote:
> > Hi!
> >=20
> > > Jonathan mentioned recently that he would like to get away from using
> > > memset() to zero-initialize stack memory in the IIO subsystem. And we
> > > have it on good authority that initializing a struct or array with =
=3D { }
> > > is the preferred way to do this in the kernel [1]. So here is a series
> > > to take care of that.
> >=20
> > 1) Is it worth the churn?
> >=20
> > 2) Will this fail to initialize padding with some obscure compiler?
>=20
> as of right now, the only two C compilers that are supported are
> GCC >=3D 8.1, and Clang >=3D 13.0.1. If anyone even manages to get the
> kernel

Well... I'm pretty sure parts of this would make it into -stable as a
dependency, or because AUTOSEL decides it is a bugfix. So..

GNU C                  4.9              gcc --version
Clang/LLVM (optional)  10.0.1           clang --version

:-).

Best regards,
									Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--qHcR0wTfGJLS0CPf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaEsiTwAKCRAw5/Bqldv6
8rWCAJ9iuK1SPCz8Iqmtg2YYJA3QcN1ZcQCcCDOYZeP9LCuc6TXu3fDJPaQEqxk=
=IRlm
-----END PGP SIGNATURE-----

--qHcR0wTfGJLS0CPf--

