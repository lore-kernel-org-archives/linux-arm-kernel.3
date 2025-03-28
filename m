Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFBBC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 11:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QO5L8F6Tv6G7jsBGSkmzV4B+MnJEKpypQ7BBXhNe5uo=; b=pW68Nl41W2JvTm1TcPljrCpu2S
	oOUsS4XoQIlU4XnADZTSvoVzREl2048WXvljX8NaKCbUCG4ZcC30P56lYVTFYq+PaQQkhZbcDcR9g
	CmZD9QtuSuClHiCdnFNrf1NzvPFB9dJhcuxk3uR7UKvHzfCKgHJl4t8KSQDGaF+N5B323MkmpBcOt
	qYSsHZZNAwNAowDBL/d7jZWxowkY+7MUT8ky/DPTXwRlIilBqBtNRq4fjRloAbtY9wM3RkNz3ASck
	/HmLU7oxSbT8TBy97+Sv2cqT1BftFeT8J7nsoLqyAwBUut1QzEYcfrfWvjZqH/nGINyP9sHfA99rL
	I8WTOKEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty82p-0000000DFKr-2tUX;
	Fri, 28 Mar 2025 11:38:39 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty814-0000000DFEd-3Abm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 11:36:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=QO5L
	8F6Tv6G7jsBGSkmzV4B+MnJEKpypQ7BBXhNe5uo=; b=BMvwXtjrsCO2KFxfDJQj
	RssVT0PKDnfrEWRxUThKN2A5e9tmgp14gHgIbXgzLpQa4sLafXKdFWGT3OgWNwAd
	YoCaa5HUgn4TrQ81GK96sGwiia2TCba53RH8wYqXhkr4A5HMjTlAm+DN87GW4ZKG
	P9Uye3Qd6jJTTfS0qnIlMO3cKq9qe/81rz/X8TjNP8uxRL5ox7HyLl3w46oCIyR9
	tIgss4JKiwHLUoxVe0Rh6Dh1qWLNWYNOgq8arHYHtT6qJxPuftkftONH1Xy4XUdZ
	mYIjCFKzz7iC2STfyvVvDYIdO4Yf4awtdQV93K5p9dqx77oraWQvbZlRuHZUoJtm
	Vw==
Received: (qmail 226379 invoked from network); 28 Mar 2025 12:36:44 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Mar 2025 12:36:44 +0100
X-UD-Smtp-Session: l3s3148p1@vogefGUx3T1tKjIj
Date: Fri, 28 Mar 2025 12:36:43 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 15/15] arm64: defconfig: Enable Renesas RZ/V2N SoC
Message-ID: <Z-aJy23ZyXq9lTrV@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250326143945.82142-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <41c6f512-47a5-4723-bbdc-64ed85ae8391@kernel.org>
 <Z-VETFWFT5NksD7J@ninjato>
 <6fa375d2-5ba8-4b2b-8a54-f28b3cbedcfb@kernel.org>
 <Z-WAZ_IlMBB3XbTN@ninjato>
 <de0f7848-1fe7-451f-b48b-e20fbf3d0c2b@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rbVViYxK8BFEIzsn"
Content-Disposition: inline
In-Reply-To: <de0f7848-1fe7-451f-b48b-e20fbf3d0c2b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_043651_662593_C158570A 
X-CRM114-Status: GOOD (  14.33  )
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


--rbVViYxK8BFEIzsn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Krzysztof,

> We do not speak about same things. I speak of review being ignored for
> multiple revisions in one patchset and then another patchset sending
> exactly the same pattern.

True, we are talking about two different things...

> Each of these contributors were not changing here anything, it's like
> not their job. It looks like this will never get fixed, because each
> person wants to just get their stuff merged, so let's ignore the
> reviewers comments.

... this is the technical part where you are correct. I am not arguing
against it and the issue is currently being worked on as I write this
mail.

Then, there is the communicative part which got me. A response like
"NAK, I am not applying this until you finally fix the issue. And I am
getting angry for being ignored the n-th time" is totally fine and clear
enough. We can escalate that internally. But generalizing Renesas and
ignoring that there are individual people there, trying to fix way more
issues than this particular one, is what I percieved from your responses
and what I considered above the line. And yes, I am aware that you are
also doing a hell of a job going through all these DT and binding
patches which I think are difficult to review.

For me, we are entering the space where we can leave it like this and
maybe discuss details over a drink at the next conference. You are
invited then!

Happy hacking,

   Wolfram


--rbVViYxK8BFEIzsn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfmiccACgkQFA3kzBSg
KbZDvQ/3XUkMk0S3lualMv9+xB2AAfnJrhcA40zPXXl0VsEhKi2c8C+VsIllpelq
mKMzoYZIki4mrXjJNSrEyQ/DqMTYeTlW2khVn+2qhGFZlAfbQh4zenvd+XkSGF/u
JuKaG+IO0lj/rxnodhEPpjgOVODZXj2UhAOWTAGvGLozTkxoOLhCEYbGfhjEwL4N
6f/G59wpFBYYhTUnYMMNqXZwZC71HZohhoY3hV8EBTKaZCcHV20S3DjEKxhJv0bu
APNVjQLYlUg2LP+fyzhGqx9cAy6f5cRz4929/assP5Ga819bVxyxt/LOS7H2nn3v
ma61v1RwaHwCjLx5xPvy+ZQS5FrtaljioWowZ7XNCytGvOtAxsRLQbcOZSc9kkqb
LNlPqsy8aqdIBoVzwflVAESfYEMyC9Rn2BlJM0hKp1JS6nHqxkwUjanBzRHrXgDw
Ya+b9vFJs0nImFcwYO3BbZwghcC4s0bs6ATdoUW7qfaeIWrwMb6JpZ05MejO6jIf
h3xaaDzsw3OeiEYvxV8K4b+Ogor2dKIisgga4jY4D9hR8c10tr5K+khz9DfvXXKg
zHD/o+2qIk4JRGwYUL/ZG94Et7tGbBn8OMEeTvvgKm2q8idTHkI3e1rowq2tkC9F
6bJ/F2IIBC7AJy+Gw2WVFwnlD2BLE/HtfixdAHvi9rE5Thnj5A==
=7p2i
-----END PGP SIGNATURE-----

--rbVViYxK8BFEIzsn--

