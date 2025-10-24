Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EB3CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 15:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9PHQQmN7U58dEYd/jGpL7q3Dd+5cmWnn8PKw2g9U1rE=; b=Jrxc9wqX4mPncHpePqxMZU5qBe
	sRk/tGl02ol835zdKJGfU7uWgHeMTEvyaqg8xUxmkk5Dwz9SEm0o4L06b0joGrrXJAu3thbmRwjh4
	+U5djc6HEkI/LzfVJ4YSoF69sVaWGEzO6UKhgJqi5Q+8pND/dDWTGHxhptUwPAQrqyNgbhYyBzXWr
	npPaW2n4O5BXxu4YZM71lESJXY04JTS2YunNJ5DEThJKE2BqfDQLatuA8pTIH5IfKxwcnC/ocjBJe
	MDgjt74Qstwi4wb2l9wfmefwF3m3IDqycOnVdgjQorXcIkmOeLedw1jW5JnlbW5FUR3Z8JqLjJOXn
	Nx0Cu6fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCJzm-00000009qMj-2IHi;
	Fri, 24 Oct 2025 15:46:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCJzj-00000009qMP-3LJq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 15:46:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 17598461DC;
	Fri, 24 Oct 2025 15:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45F18C4CEF1;
	Fri, 24 Oct 2025 15:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761320782;
	bh=9PHQQmN7U58dEYd/jGpL7q3Dd+5cmWnn8PKw2g9U1rE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MKRl59ZM8rvoik8ee2+FejsEO+8k2Pws6sZbZJr3HGruy4UjMw41/4LjEEaTlAZdZ
	 2eYiUbjTZaC5lG3bVsFWss/d75BmaJRrEc2cxa0JfrHKJAK+dXzB73AGN6GRkrYRhJ
	 eGcfcCCYwaC57ghc6HookvgrtC+jZF35r70CBLf3kvLcg5vx77KspeXbW/k5Alz8JS
	 bpUIWd+d4T+CBs1nd2DClhQNuP9MG5OHfR74Ozy2Of2Fl49kJrMrtEHffrnxWVyfqU
	 6AbtxMu0tElxF4Op0ohB5nlsSYTM3xDSrn0S83C6eDdFcVAnVxBzgZRRqF59rmINZs
	 uRU9qJZc/Wy2w==
Date: Fri, 24 Oct 2025 16:46:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>,
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
	Will Deacon <will@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 08/10] ASoC: wsa881x: drop
 GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO lookup
Message-ID: <aPufSoALA--iJeVn@finisterre.sirena.org.uk>
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-8-d34aa1fbdf06@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wsyROlqG9veSnDyd"
Content-Disposition: inline
In-Reply-To: <20251022-gpio-shared-v2-8-d34aa1fbdf06@linaro.org>
X-Cookie: If in doubt, mumble.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_084623_876541_6B3A21D3 
X-CRM114-Status: GOOD (  11.18  )
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


--wsyROlqG9veSnDyd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 03:10:47PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> This driver is only used on Qualcomm platforms which now select
> HAVE_SHARED_GPIOS so this flag can be dropped.

Acked-by: Mark Brown <broonie@kernel.org>

--wsyROlqG9veSnDyd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj7n0kACgkQJNaLcl1U
h9A69wf/QahGbiw/YMV7UmAmFOQctvV/QPY8gXkwyoIILpibLbN8jzinWqQcLI4Y
de3G0ouRnd6psYaxcoqdvmoSgcFRvdM3NH8egptFL4ZcJgKcrgLfh5Xv7oxXLTTe
SSW6pYCv1+7tTttECErVE9y3UlTCj4iBgWeOkyUcidGg3iWSWDRXQMEhTD0CbxRx
vHHHv4MincZyu88gM3aqZP001FrXnlAk3mh5tZ/qDntF6x+7EdBfTeZDs05SxXhM
RwatgXTeynPOhxRrK05leI9bTXzkv5OOcNXU5Zt9AKhP4XvPHIBQp85TKA4fbvAT
nUmf4H4/9/7OUkguARLdScin2yPciA==
=5Wuo
-----END PGP SIGNATURE-----

--wsyROlqG9veSnDyd--

