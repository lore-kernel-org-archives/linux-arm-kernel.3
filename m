Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A33CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 13:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ROB3wlEWOzXAJwBh1qm1R6lseFVqsndr6PEwvgYDBYU=; b=c4Ro8UJNUMPfaSaQpH8c4C2lqt
	GM7Ux34zGykqu4bspdYP4SgRaAOCgxVXORh3mku70L5+9gV0+EbzbOPFliE7WOAo68oAtY2sxDeql
	vMkf5+uC5y6Et/JxVnnJzt4jq6YZCsKjyz2reoujNiRApLJ/fyfEEL0kfGegiBfWMWA8oFCv8C9al
	BQDQg3pQ2BQDn0UxJEf976Cy4K2qW1HWkiaOXSFZTnXByPgpkk3G2qBygyBAfk7x/PNLw0pGdlZ1M
	0/T4hQxMbK2idoXTHsGyN60zGt4dqViYYjDJxD84cOEa0PIzcb0ezL98HrN6aneM9m8XnDUidoywX
	jvMWHdig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v67a0-000000023El-3DZL;
	Tue, 07 Oct 2025 13:18:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v67a0-000000023Ef-0A6o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 13:18:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 53976614A5;
	Tue,  7 Oct 2025 13:18:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0654C4CEF1;
	Tue,  7 Oct 2025 13:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759843091;
	bh=ROB3wlEWOzXAJwBh1qm1R6lseFVqsndr6PEwvgYDBYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u/OPe73Yuq+jYwS/iZhhQZMiPxNGXAkDbDfIouyky571NFqTqJSkk9IhCRB9s/Ntu
	 U+l7EgZNGiFtvrWn9PdJoN40o10zPvgl5MlBmtIsvvbNI/qI6hEpkyGaVli6AfcKlR
	 OAdTydJl+rEyYRa2YMrd6mVstlbhVxkQ/857uFGby+IIoHcsCTBRaD101Mpoo8D51o
	 hIxqCC+EodZ10aCeIPQCElFA74nuyD7+SXLgUCpP8Q52KYSL4qhbDZ2qrILE2JyRwi
	 3n7HaYZweb6M9CgaWiOgxaplPRgJVhG4bWp2qKTWPt6FlfIKD9Ssv56c4h9iypq/dj
	 OnphxE7Wb4o3w==
Date: Tue, 7 Oct 2025 14:18:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
Message-ID: <a9a4f33f-b6c5-4c25-8321-7b08a2afb8a0@sirena.org.uk>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <0b402bba-0399-4f93-873e-890a78570ff7@kernel.org>
 <CAMRc=MfwEHGV-HZQURR3JNg1HatAeWO17qbRmkWUXTSBWj5jSg@mail.gmail.com>
 <80347dcf-419b-489e-9b0e-d901fbacc71a@kernel.org>
 <CAMRc=McaZV=tUkzDGMYxXqkuEYw_KasKcv8QGdjw709UYZuGhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+soYglqC22/n5wEt"
Content-Disposition: inline
In-Reply-To: <CAMRc=McaZV=tUkzDGMYxXqkuEYw_KasKcv8QGdjw709UYZuGhg@mail.gmail.com>
X-Cookie: Teachers have class.
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


--+soYglqC22/n5wEt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 07, 2025 at 03:13:29PM +0200, Bartosz Golaszewski wrote:
> On Mon, Oct 6, 2025 at 11:55=E2=80=AFPM Srinivas Kandagatla <srini@kernel=
=2Eorg> wrote:

> > Yes, these codec drivers are due to be moved to use reset-gpios.

=2E..

> anything. And what about shared pins other than reset? 'dc-gpios' for
> display, other 'powerdown' instances, 'enable-gpios', all kinds of
> uncommon names like: `dlg,cs`, `wlf,ldo2ena`, `speaker-enable`,
> `maxim,enable`? It's not likely we will create a separate abstraction

Many of which, crucially, don't actually reset the device.

--+soYglqC22/n5wEt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjlEwkACgkQJNaLcl1U
h9CCzQf7Bncfs5WXAs3r5vAGgmMUJo/gZu8vwflStoT02OjudlAyN52XX/Ddf3z5
QXLXvR2X8rQdiG44lFaOVpNKFPMwEaBSOPqnfw6xC6iaC0r00qkfq1wnmCluy8Uc
GH8fRxQaZSl25laa2GBST1WJsH912QI3fWlhqEtgUl5/zY2VnVz/QNdFFS1TwL0+
SE6hw0hdTJL8UJSFQumw7FohV7A80u+3V3Xs3rvOJKnaOFEPLfOQdWw9/TZi0UuE
q1lPaj7gmq1VEgxDdPSIHzzZv3fSQQCtP+1MTi+oQ8LMxElcnPOny0c4stKH0P9T
bNI4srPGEXT8UtZkh8pXTJMNrRKmMA==
=2iBf
-----END PGP SIGNATURE-----

--+soYglqC22/n5wEt--

