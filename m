Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885F6606A335
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 11:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QLgd79Lt;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HifvEE0L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rTSm4m0YE9cOhTEt8W9/Vkw9tzJ9/0MuQoBec6owO/8=; b=QLgd79Ltzpt22bCjpU1IPJ5F+m
	DY7oTYWLFMtQRp2hBdIp1pVhSL4Oi5+LuTe5mYg+SPuaWX0ptEsmVUycXOECSsFSuMroLEmyrW0pw
	iLJintdZvb5UbpotwcdKM9ZmObJNBtOgLtqRtKuw3xCWYdfSIPW5CPcM0fM4mZo0pB19L55GGb3G9
	wdrONRjkWJHpGqIr3Bl2oatNgPA0ZFsN4squRoeuMlV09BH+6j7yyBcNwIZYv5I/wLos8ugmvbiCD
	QmNhEVbhdGhT5D/YfsesXy92C3KaOTsBAJfzqBZiquTKbgXE7Z9OkkGDHmrEDQTeBoEl5hJVV2ADl
	VV9hBEJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIW2-0000000CDvm-2AyJ;
	Fri, 06 Nov 2026 11:53:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIVx-0000000CDt3-3p31
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 11:53:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A7A0642DB6;
	Fri,  6 Nov 2026 11:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5146A1F0089F;
	Fri,  6 Nov 2026 11:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793966029;
	bh=rTSm4m0YE9cOhTEt8W9/Vkw9tzJ9/0MuQoBec6owO/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HifvEE0LMMeU67Ovf1WhYf7dYmkS0z4/qTxDUMOrS4AEs7uNnsEWqWvkNUHiNAB+m
	 1CbOcAQmz68rOtj5ETQmfINwWDzB7+POgZWT/2rpOvB0EiVYJtroX6zLq4GekCAKiv
	 Izy+4iP4Ibcr2Ems8GW0XYQwRZyTvnvOL0sp8gzaf5g391bzE60Oq/e+m3TkDQo1nW
	 /TD41TsJTOP/eNvq3ediQlDbEMZ/aXviSygVvLyl/DJXcewSu2pmk8iRdYUhTgFYAi
	 ec26t+0ji1cDLr7xukpUXUE8FpaNXQrO9bzF8FGouQ26sf8PmhcEidEeGTzWQYtd5f
	 LDpbJT8EWFQKw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id C72A127E907A; Fri, 06 Nov 2026 11:53:44 +0000 (GMT)
Date: Fri, 6 Nov 2026 11:53:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, mfd@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC
 regulators
Message-ID: <356c5681-137f-40d3-88f0-b321ac1c092a@sirena.org.uk>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
 <20261104181429.GE1650678@google.com>
 <ad02069b0cdede7ae191e4a3df57f33a@gmail.com>
 <20261105085321.GG1650678@google.com>
 <85817548-28f8-45ed-987d-a4996c2bc4ce@app.fastmail.com>
 <auy4Qbxg-pW_X37E@google.com>
 <9fa9add9-6bba-4cd9-9f15-d6ca222a1a23@app.fastmail.com>
 <au2kBlSsypdsdQve@opensource.cirrus.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F3w/WJqkylAFYNc8"
Content-Disposition: inline
In-Reply-To: <au2kBlSsypdsdQve@opensource.cirrus.com>
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


--F3w/WJqkylAFYNc8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 06, 2026 at 09:55:18AM +0000, Charles Keepax wrote:
> On Thu, Nov 05, 2026 at 06:24:48PM +0100, Arnd Bergmann wrote:

> > I assume Charles can comment on how important the testing still
> > is for the codec above, or if there is other hardware that could
> > be used for testing the arizona and wm8994 drivers in case the
> > other ones are in fact as obsolete as they appear.

> Without wanting to put words into Mark's mouth (please do shout
> at me if I am off course here), I assume his use of Cragganmore
> is less about testing specific parts and more about it being a
> very flexible complex audio system with good debug, allowing
> testing parts of the core frameworks that would be hard to hit
> with off the shelf hardware.

Yes, exactly - especially relatively exotic configurations targeted at
mobile phones.  Even when those appear on obtainable boards they're
rarely wired up in a way that exposes all the functionality.  I'm not
so interested in the specific parts as I am in what they can provide in
terms of testing generic code.

--F3w/WJqkylAFYNc8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCau2/yAAKCRAv73Ows9A4
iRfRAP9nkL6GVcpRmfrpN7j6mExyCDTb/Sqd2UOTl+QNdMpBIwD7BoAX7/1bumaU
DNdoPGJp9b9Jq7qCcHIBIw+32vKWuAw=
=TBrU
-----END PGP SIGNATURE-----

--F3w/WJqkylAFYNc8--

