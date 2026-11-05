Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CF2606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 17:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KmskKvDj;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fm8MOX0s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CPGOJ2OzZCLwqROp1NUYVMqMRDVCWw4oJpH7cZZh6Mc=; b=KmskKvDjn23Z0vhNK19wix7KwR
	9zTSHtq27o9dI1buXPob11mcb1BbazIE8VG+d+aKBY0h/uxWEKkxp0pzXHA64EifqG7L17LSQOZLP
	xEs/SxZCxqOJN6NFTynh98KwulPwZdZQ80H2Cs+Tbg91kjMV8r1mCQgxA7y0VrjdaSuQhWRl0ZW6k
	BOGZKlLPgbhg7e84sfPRBq8XkKo5hVj3LDBLL5Nu2B2wqoe6Cnp05iy+q6aswpIGO/XlD0xkXNMPg
	O3dehsSHD1VSnZesb9UR1pwuWNpnCpUzyrDkB8+wy1Dl0z95YAFizgLyaMKwxOAlgYJHUi/mlTPb5
	LrlHHdYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP17x-00000009sXG-3g9e;
	Thu, 05 Nov 2026 17:19:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP17t-00000009sUB-1AlY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 17:19:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 90A09601AC;
	Thu,  5 Nov 2026 17:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAD341F00919;
	Thu,  5 Nov 2026 17:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793899188;
	bh=CPGOJ2OzZCLwqROp1NUYVMqMRDVCWw4oJpH7cZZh6Mc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fm8MOX0sI7hx/5Q8eXTpbcaxm1ZPilJM2ZIeMhZeQAdXDVWkXNMqcJJyD4f9vYdu4
	 WloDAfIcSWr4+1iuC6TI4ORMdbm1RCDI8Zi1clVvdoVenUuW6DH5K5mr3UkTuPDJ01
	 6xQTESmMA9JMlteO9RXIt8MboKOgZAljnyadisT1/uPpV/YQ/9ejdQxtJ9KA8T7VvM
	 1PkDQ8lfiYteDS9CrYiF2lOq8ib8Ab2Y7VFC8Qw9ZCt/HviQv09gNYHxHGxO58nr9I
	 blzYTdqTlJMrsFedyk3mHtCpxkqdblKM/bKsWKxeqoHoNN80MdkOxUwg/LApCh72Na
	 /pwytX29neYlQ==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 9F837279AD71; Thu, 05 Nov 2026 17:19:30 +0000 (GMT)
Date: Thu, 5 Nov 2026 17:19:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, mfd@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC
 regulators
Message-ID: <ad9ec396-aab1-4950-8ea6-dd72d8938464@sirena.org.uk>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
 <20261104181429.GE1650678@google.com>
 <ad02069b0cdede7ae191e4a3df57f33a@gmail.com>
 <20261105085321.GG1650678@google.com>
 <85817548-28f8-45ed-987d-a4996c2bc4ce@app.fastmail.com>
 <auy4Qbxg-pW_X37E@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w7cXv/WC+DmTcwM4"
Content-Disposition: inline
In-Reply-To: <auy4Qbxg-pW_X37E@google.com>
X-Cookie: Whoever dies with the most toys wins.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--w7cXv/WC+DmTcwM4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 05, 2026 at 09:12:38AM -0800, Dmitry Torokhov wrote:
> On Thu, Nov 05, 2026 at 02:43:17PM +0100, Arnd Bergmann wrote:

> > As far as I understand the situation, wm831x was used on the
> > reference board (Samsung smdk6410, removed in 2019) in addition
> > to crag6410 but never anywhere else upstream. The question
> > then is whether we'll ever see a DT conversion of crag6410.
> > This would require finding someone willing to actually do
> > the work, and coming up with a way to handle the autodetection
> > in mach-crag6410-module.c so the correct spi/i2c codec
> > child devices are probed.

> So I guess the question then: do we need to keep this board at all? Or
> it is time for it to go the way of the dodo? And then we could drop some
> more drivers as well.

I don't really have a great replacement for it.

> My goal for the series was to move along legacy gpio API conversions, as
> well as move away from the GPIO lookup tables (ideally I want them gone
> now that we have software nodes supporting describing GPIOs).

It is a bit hard to get enthused about software nodes :/

--w7cXv/WC+DmTcwM4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCauy6ngAKCRAv73Ows9A4
iTKhAPwI2ULhK3tpsErRZO3ELlTybyWNIgeB8iu2NvTH+QIwIwEA8R3w7L7qubU2
NiYBEc511xJMvFHpPgyePVyrG/nPgws=
=pKD9
-----END PGP SIGNATURE-----

--w7cXv/WC+DmTcwM4--

