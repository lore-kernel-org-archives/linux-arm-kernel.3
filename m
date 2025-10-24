Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26036CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 15:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zvtebLkkuQCoQo0QjrHJUw9NfExlupM4hl8VmlJ0P1U=; b=qmXemVjxE5fJBVDJWzcw7Ahtj/
	IXruXkXbSV1JbpUkGnHUvFovOECZDoWKGQNBBjpX8BHelZnI4lMZOob9FbLXnLvlOqvdOA85QTNeK
	PAU31UHJD7+T7RNCuVo+8krZFjPQWwCrJqfRmx9BnGLGAil2l0Ldq5j8OehCb12AZXV9myoqawCyG
	GCH5JUHNAyf+Bvxmcs1Coeyzw/ltXzqqM/Xb9VV7Wkp7seRSbSuEz6jBk0k0Fspv9PUtiVg+NhNJd
	WgNagOOlO6LFjWVpS8z0wVoCBhnL3PbVJhDHatxZp4fYsuAQeLm4qihq1bwDqbwd1QgqieEoA5/P+
	thVjDolA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCK08-00000009qQ4-0rgl;
	Fri, 24 Oct 2025 15:46:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCK07-00000009qPo-25rV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 15:46:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8590A61DFB;
	Fri, 24 Oct 2025 15:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E90DC4CEF5;
	Fri, 24 Oct 2025 15:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761320806;
	bh=zvtebLkkuQCoQo0QjrHJUw9NfExlupM4hl8VmlJ0P1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FED6PRF0FA8+nlr/HlLEfF43LNsWs0QIg8r/QjIBGhoIAyWihajGtMu0JKKWtHxH+
	 e4l7iiKcQU+oZMoYTX6dCA5qpzH5rEQKZdCBstaCvvkbC8me+bU1z/V6p0Rczkme19
	 /EG1ohoCeUdv/6oTg1PqcAa/0QLo/m9IEM79oa975Go0Nnozw7KyQCSGgobvUrTI0Y
	 0Fia0LJIiS7mtkKd0S+zwSwXFcuHQ7AQ0J4Mj/IwldDvhmC8HuHKx3Rd8m/rzwTWmS
	 cU5yDaAzGhK9wzlOnfIFNWiR7JtgMor9H36djMVo8ZGVJeyxJ9y5D/9t7+AhqhhjZY
	 0coJmUKg1gQDw==
Date: Fri, 24 Oct 2025 16:46:43 +0100
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
Subject: Re: [PATCH v2 09/10] ASoC: wsa883x: drop
 GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO lookup
Message-ID: <aPufYwKl9tO-CpYA@finisterre.sirena.org.uk>
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-9-d34aa1fbdf06@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZBvVvXfbmyXlx32a"
Content-Disposition: inline
In-Reply-To: <20251022-gpio-shared-v2-9-d34aa1fbdf06@linaro.org>
X-Cookie: If in doubt, mumble.
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


--ZBvVvXfbmyXlx32a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 03:10:48PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> This driver is only used on Qualcomm platforms which now select
> HAVE_SHARED_GPIOS so this flag can be dropped.

Acked-by: Mark Brown <broonie@kernel.org>

--ZBvVvXfbmyXlx32a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj7n2IACgkQJNaLcl1U
h9D+zAf/bHPneBO59HMxvTqSA7qwe5d18hYIFoClJQyzpVYO40IIpgW7KGAMyuSJ
ZN1w2OW/c17eYWwNHthbQsypcLB2T0myY672FEjYBtli0WV2DInFSDYi+lTu4oEF
0dMt2bGGyXwEWZDwqrM2BNcGPd/4hdQMOnmTntTKz6zDvh33yMozXDdFJegd3x+e
x4y0BpGe1AOPFOTjqg823dFa4EY8i1BWOEj77aR4YmFtAad83mxxxZtB2PwfYDhd
fs3g4W4JTr+6zGsi9KvGsyN9Dzl7uU72wOJZphF4YJe/WW+Ngmy927zfloUeLrth
EGmRsRYyBdElapMKBv9y1Il+ub7mcQ==
=zYnL
-----END PGP SIGNATURE-----

--ZBvVvXfbmyXlx32a--

