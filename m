Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08151CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 14:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/paPCsOWHovYUaw58V1Wdls0f7JXAxMx7itURsvTst4=; b=I7pIdlemvq3LmZcm7KC6P0xPOe
	/BB1M7u4olmf4zpaepRBX+cwlejAZhASk7n8ugyfjvFkFAoPro8gda4JL5+qGRbhacflOr8PXeyqz
	rL5qsmNPBqpek7nXlyR8yRaSdMJ2xt1lvop1CAWttzpAcM0LDHjt+V28GmLloN0jAH1F3dFZADe9G
	NFxwF49VJCpTyIvUfhWtuNWbZGWzilNtJf2m6Etcm/tN5EprbKzQ7odUMSQl1YMlr0nI4qcMBSvYn
	Zna4WEZAW3kJHfdKc1O9H9NEL+xjEaVkaKzWXlO+9IWm45npkRqJxQ+KdspHpxxiTJ2xIq9NVkF6f
	/LSY2o8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBD2j-0000000HGWP-2cH7;
	Tue, 21 Oct 2025 14:08:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBD2h-0000000HGVj-0gCt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 14:08:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C82D404BE;
	Tue, 21 Oct 2025 14:08:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5FE2C4CEF1;
	Tue, 21 Oct 2025 14:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761055730;
	bh=6wiuS401xDdRYtvpYyrKEXyzFHQauHIZFmJ3uP/Anok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h9EoWC/mq7Q8GB3952OE3all4Y/oQD5FJazcpywTYBebX9RoedVedxpDNHS4PVCJB
	 clvxh71HKix+go+cCL2UzMsHzRMMZ8ruBpQT5N9lcglWN/kJN7EEWIY1SawDc/vy3o
	 VEaepM0CQ2LtsiW8Ij1TwZBblsp9XkcJQJ2+x5rfrSWun323p0OHBWApqr0f0X4D65
	 nRVaaS9OnWqUfefZN1x3dgzkoRCJkh33bjuP8nnXxDN1utdIlbi21X8qf6xPys6ote
	 HgFMOa390SZZ1ZUrb4qxdlFJIwD91zhb2ENSsirE6jUOlefx5ZFECqK9n6xSPOSLdy
	 +Xmkzd4fZE6oA==
Date: Tue, 21 Oct 2025 15:08:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Will Deacon <will@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
Message-ID: <0e1f3a1b-46ab-4eb5-ad05-70784f9b9103@sirena.org.uk>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <CAMRc=Me4Fh5pDOF8Z2XY4MG_DYqPRN+UJh_BzKvmULL96wciYw@mail.gmail.com>
 <81bda56c-f18b-4bd9-abf9-9da7c2251f42@sirena.org.uk>
 <CAMRc=MdOCHJEyPxN+-g71ux68=Mt_Q5P9611QO7Q8J9e8UJv_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="be2R75B6whIQ+eJQ"
Content-Disposition: inline
In-Reply-To: <CAMRc=MdOCHJEyPxN+-g71ux68=Mt_Q5P9611QO7Q8J9e8UJv_A@mail.gmail.com>
X-Cookie: Accordion, n.:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_070851_240570_AEB9F822 
X-CRM114-Status: GOOD (  15.89  )
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


--be2R75B6whIQ+eJQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 11:41:52AM +0200, Bartosz Golaszewski wrote:
> On Fri, Oct 17, 2025 at 7:32=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:

> > It really should be the actual physical state change that triggers the
> > event.

> I guess so, but this would require some non-trivial rework of the
> regulator core. We'd need some list of deferred notifications stored
> in memory for when the physical state actually changes.

I'm not sure I see the need for deferred notifications?  We'd need to go
round all the users whenever a physical change to the GPIO happens but
it's not clear what we'd need to store beyond the list of users?

--be2R75B6whIQ+eJQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj3k+oACgkQJNaLcl1U
h9BE1wf/fE5s96hdrurlAFqdd32+YZYJUqEYFJu5LZKnjuA1wTr1MHfqMigev/B6
b/Jr686Hrm/k7WS6R4q0VG8c660FzZ1zdSt/M3AoQXiQ24DcYxb8MbAexAKFbc6g
2UYm/hbZOIK49A5XX4XBSm+zUG7c6gII9SKcovXcNVb9N3mRnsiFmnOkyTkBnFJr
97coLg4GMr7Hh1YQLC1dAXjdfkyttrF0R5/JiVabTqQfyD27tYYedFbfSjChRVA8
Gw7oS3+X70V6zrG/w/9Pxq2R7ikYQSZoIt9BWSh7mGFcMVudZ/QlT1P1u9q0PpLP
avLCRl+U9JHws84L5zHfZKX0vHlk7w==
=8Lgz
-----END PGP SIGNATURE-----

--be2R75B6whIQ+eJQ--

