Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998EDC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 12:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AaGkFZpautOPtNIWBgWQGF7TfFJYejda7uBwkLDZ2zU=; b=RZ2EYA2UblZVdbl/CHQnGoa4zh
	f3ckifE2f3ZgrD/nJKNfzYnhjFmUjcr7WjfxAsRRJScD3F9xyK8UtYd/tMz7oXr9fPDrh7Q8deA2F
	xoNbHSREQO95IqXtyNiFJeLYxGNQag9eCDKsys5JSNQBJ/aC3EiOfFdoNph6pp3+rofu7J9Mrt6T5
	vwU5eFFjP0ToG9bzkVwkvd9pBaRFF24tQHLgnKiYeSUKg/jcbu1lT42VSv75yvcXA6TlmKeBG51qO
	wd83f7J0Nq4qRGGyWEKHXKZzi66oixPZYFCTLyxCZ/mc8/LgJu0UBQjyWcmVO7uw/AEyFVti6pwaj
	auTotK3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txmMv-0000000AwKP-1UJU;
	Thu, 27 Mar 2025 12:29:57 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txmLA-0000000AwC3-1EG2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 12:28:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=AaGk
	FZpautOPtNIWBgWQGF7TfFJYejda7uBwkLDZ2zU=; b=cQKVds6D4OuSoXyoO/dh
	Yocs56ryHH59lTHWPlamSchITa3MvdPq/qIRCIAfUp08h0k4mFAOcjDcqAaru7Ht
	n8uUY5kDqMXnpqnFrYazLcispEBbUxE2J5f/EnE1uSVFta+lQ1Oz8XkCUMkMwzuH
	uwwUPS+FMHRBCcQZB+N/rWRSk1sSe4kYn8jgzgpie42Tvi8eZy94GG+to1rWlmnD
	y/R4rf0lb6w1KdGlPdpQKvxyrUd4uf3EK0lqeptf4IquuqFAxKUKJzypu0l5d46g
	D6hC9bJfk6brv99nBxJsI1u2yq/SgK6X0eZ/GTQiq8CbkwCjoMhRNjKbiQ8KeHrR
	sw==
Received: (qmail 3987990 invoked from network); 27 Mar 2025 13:27:57 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Mar 2025 13:27:57 +0100
X-UD-Smtp-Session: l3s3148p1@lRR0FVIxZqsujnsv
Date: Thu, 27 Mar 2025 13:27:56 +0100
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
Message-ID: <Z-VETFWFT5NksD7J@ninjato>
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
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KizQkLAOEp/210C2"
Content-Disposition: inline
In-Reply-To: <41c6f512-47a5-4723-bbdc-64ed85ae8391@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_052809_209314_9E4A75AC 
X-CRM114-Status: GOOD (  10.94  )
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


--KizQkLAOEp/210C2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> So the pattern will keep growing and none of you will ever bother to fix
> it, because you have your patchset to throw over the wall.

I dare to say us Renesas people are not too bad at fixing stuff. In this
particular case, I don't see a wide consensus that the above stuff is
considered broken? Please point me to it if there is such. We are happy
to discuss.


--KizQkLAOEp/210C2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmflREgACgkQFA3kzBSg
KbZr/g//TelLcMOOIS9o8lq5TK9vmeyE5CGHg7W0oBugLs+o1YietMaOgMmPload
EIrIbMkKfNULW7EO2Or1V91Q9RmsjhlFBZKZ9B7n0VCogzfKe82UO4wzmqbVyta0
762BIRFYHnKMrH+YSNe5voWIBoy20Tf3vqGIuDdi/G7feHmkogAsJQ9klyU3QU/S
hDMgHtDa5amsVteTic6S55SnWy7VSk69q5JSM/BIjoYSxAdPRQI67pUOjDs4lCAk
NChC8OKZaASyPJgkbveu8C9OxSRaVHO+yvVVHkVISIVfXIGBDEEAZoChYtW8ABE0
wcIR7w1u0GulTnI8fdLOET1E+7bQYkxaY7cVTQs1yt5iqa5kBh5+fIAqLR8JEJEW
WHre3BNwkt4TPt4uGPublOrGwDpq5nnPztFBGJAilnersV9dvxOI0+ZMVcZ1LxAi
NcQHe/h+FF7RjAuq+Ho+/4jkQtX+3oJuUXjILIXOjat8JRyJNbD7GUf9BVtO8Oq+
MMWRVWmWUmQNGeb34TYjBt88b6HWvr/qUTi3dweFNJD3i2Sq6xEctt+sU0K214SL
BzES5xCL52LnyR886e1/Wx10E5ITl7Er7+hq4ct1wEHCQUA90xO248jbXgqsDjl+
oIgHCjTHUjt93rzQmKdBCrAouvvIqNi9GwI3K15H/3zmTEDOlZU=
=WWXu
-----END PGP SIGNATURE-----

--KizQkLAOEp/210C2--

