Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C463606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 14:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ev2DzLt+;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qhno8iJx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QzOeMyW9XoRvbL1S4yq9b+nOF7kq8iH2OCoxesNStc0=; b=ev2DzLt+b24js1ViM/35kEWL7f
	I98fQgDhejc+3MRANpOzR6cRpcrJAT5mnyL2gTdMim1J2fK8xkhbKG35XP9k+GYWFbNAIdtyThPw/
	XIIKC4TQu+cGyYavnOZMx9Y0eXrQsOfkyEBS/RB1XG5CQIcJa87dZxlfOAt4XWA8rOCyDfC03vIKv
	4rD94xphJ6qhAdTnwd+F8IazlbEFpLjDN3aevcKVSBZ9x+3lZvt+NjCNfxTqj8S2y/Wie0AYPDbAk
	nCNvAGxG+rG8uM3jHTWXmmJF6dG8vIklnJdEFtNCqEk90uL90+RHq3/mwGHlSdx18n6UAWVveSD5r
	FAKBePHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKbW-0000000CbOI-3OnZ;
	Fri, 06 Nov 2026 14:07:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKbV-0000000CbNx-1tDT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 14:07:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A4EC36020F;
	Fri,  6 Nov 2026 14:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E7731F0089F;
	Fri,  6 Nov 2026 14:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974060;
	bh=QzOeMyW9XoRvbL1S4yq9b+nOF7kq8iH2OCoxesNStc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qhno8iJxw2PadLSFZky+/AlnZ7Q017lTPrVDL4fbT2GTUeVao5XPwtcZB2VCgWfhc
	 MBRRIYCwqMu0/IoTN09+hRzXBRaUw0UBz2V1T2wx96q9sfp9jGAZLOYLr8FiIM+2mz
	 nasuwKznXigrY+jESlC7T7o4DgaVeyn7W/PMPbucwWG+8T6ipieOurAtwQIq+Qgos7
	 6VqhUgNCRHeWo65aKfH1OozZK64et5f+BNt5//V53/V8MlRLSoJrI8t3T6/wrhSvfk
	 ETcY8XsjE8FnJCoSaY2A8IHQGbEJRNMxDnbsrIvzDJQ7Jmyt/Iq7LpNXLDWEIczxNH
	 /pRtG8PiDOhLA==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id C8ED22808F5E; Fri, 06 Nov 2026 14:07:31 +0000 (GMT)
Date: Fri, 6 Nov 2026 14:07:31 +0000
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
Message-ID: <c159ace7-17b8-46ae-9551-d0eec6e051be@sirena.org.uk>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
 <20261104181429.GE1650678@google.com>
 <ad02069b0cdede7ae191e4a3df57f33a@gmail.com>
 <20261105085321.GG1650678@google.com>
 <85817548-28f8-45ed-987d-a4996c2bc4ce@app.fastmail.com>
 <auy4Qbxg-pW_X37E@google.com>
 <ad9ec396-aab1-4950-8ea6-dd72d8938464@sirena.org.uk>
 <auzFQkIPZScADEeb@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ThW1+an2rN+EXP3+"
Content-Disposition: inline
In-Reply-To: <auzFQkIPZScADEeb@google.com>
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


--ThW1+an2rN+EXP3+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 05, 2026 at 10:07:06AM -0800, Dmitry Torokhov wrote:

> Hopefully you do not need to pay too much attention to them as they are
> hidden in the legacy board code.

Which does get reduced error checking and questionable readability
benefits :/

> The benefit is that using them makes the driver exercise the same code
> paths as it would on DT system (unless you insist that the driver is
> very special and should only use of_* API) and allows dropping support
> for bespoke platform data (in most cases).

IIRC all those drivers handle DT by parsing it into a platform data
struct or just don't have DT bindings anyway, and it's worth being aware
that ACPI has some rather different ideas about how audio should look to
DT.

--ThW1+an2rN+EXP3+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCau3fIwAKCRAv73Ows9A4
ifRsAP4tUq7tN/TDsRfXjjcTur1dwpJtgrTdWOmPwnkeVlQY3gD/QkqMpRqix/0Z
tBrIqRL9sg0hSaLIScndH+eFnbaH1g4=
=t+xL
-----END PGP SIGNATURE-----

--ThW1+an2rN+EXP3+--

