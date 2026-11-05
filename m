Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09F2606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 17:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SO56B6uQ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hklgjc9y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Q9qJYBBmJvYXKz1jTBDOlyf8279fQWwPXbEhMcq5ZRE=; b=SO56B6uQiPdgg6Kj+moh6H/HC+
	gpOFW93xynyjEJaWNzNighKz1sqPfomBtC4pw8SueMjRQBsEufJ7QKK6OhjWeAFqwZfSluoJvyE03
	zzbPfefo2yp25XZLoaZhD8u4kOrx8nx6UcDiIIbmliP+AH6R4pxoOpslPPCudmaeFKXdTpe5z5/Fl
	JC6TD72OkVASVGr389IR6GgveTKnBsUsDaVXuPYxmN3k6ZCrOdXk8YkYrGbs69O9EweUiud24EG7d
	qOD+F7gYBiJx/ULPmWh3Qq5oceWbkjTgkJBaud50bLHws79tlEUn8Z4/raoRtorP3AEqhji6FzBkf
	jFrgm0Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1Lj-00000009wy4-0iGc;
	Thu, 05 Nov 2026 17:34:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1Lh-00000009wx8-0aym
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 17:34:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DE39B41A77;
	Thu,  5 Nov 2026 17:34:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68CBE1F00A17;
	Thu,  5 Nov 2026 17:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793900044;
	bh=Q9qJYBBmJvYXKz1jTBDOlyf8279fQWwPXbEhMcq5ZRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hklgjc9yKbVHbXwhxNheNrMRromFbFE8o+kWzaCciYdydwmAs+EjfASDtg+BdnJ+R
	 KwkY7JbslWuxhW9ef81lK9SFInG+sTlYm2zVVCOzX8sqqj4gPRU88iXbQrkG2Tfdzz
	 QUDgEkQ/hW2ilbrSYeC6CqUEuxUf6c/InGeYVFlKFh2ZG3/+rSU0QpIVz0m78EmriA
	 oQt9laJjAKvBTv1sEdbgHbl/bWF6TFeINi9trXJL6h59kjOe2E2UkBL8tLiYCR2c0b
	 tv4/6beMUBzHswEC7LYJiFlJ8WiZmO84jzvdRMEYng52bhQhA2pMRHnJm2OpaWH4Pb
	 feLtdCSfWnVGg==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id A94E827B4539; Thu, 05 Nov 2026 17:33:58 +0000 (GMT)
Date: Thu, 5 Nov 2026 17:33:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>,
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
Message-ID: <9d8d687e-ddd9-43e5-a86c-21b3f69b192a@sirena.org.uk>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
 <20261104181429.GE1650678@google.com>
 <ad02069b0cdede7ae191e4a3df57f33a@gmail.com>
 <20261105085321.GG1650678@google.com>
 <85817548-28f8-45ed-987d-a4996c2bc4ce@app.fastmail.com>
 <auy4Qbxg-pW_X37E@google.com>
 <9fa9add9-6bba-4cd9-9f15-d6ca222a1a23@app.fastmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CzdxKJMb0nUm/3bH"
Content-Disposition: inline
In-Reply-To: <9fa9add9-6bba-4cd9-9f15-d6ca222a1a23@app.fastmail.com>
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


--CzdxKJMb0nUm/3bH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 05, 2026 at 06:24:48PM +0100, Arnd Bergmann wrote:

>  - wm0010, wm1250-ev1, wm5100, wm8996 and wm9081 have no other
>    upstream users besides this board and no DT support, so arguably
>    these are probably obsolete and could also be removed.

> I assume Charles can comment on how important the testing still
> is for the codec above, or if there is other hardware that could
> be used for testing the arizona and wm8994 drivers in case the
> other ones are in fact as obsolete as they appear.

The Arizona platform did pretty well, though there are other devices
based on it that did better and wm5100 in particular probably isn't
super urgent.  The wm1250-ev1 allows simulating baseband audio on
Cragganmore which is helpful.

--CzdxKJMb0nUm/3bH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCauy+BgAKCRAv73Ows9A4
iUmxAQDIR0F2e4J3wYF4A8ktRa7PAERASmtSMXoVMPxaeHCC6gD9GloeLlhBCzwT
FYpZGR8CNgaOct4A7Q8OjR5ikiEifww=
=Q+b/
-----END PGP SIGNATURE-----

--CzdxKJMb0nUm/3bH--

