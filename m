Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271C6E9D41C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 17:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P3MrnCs1mFSo9vMjfSxlpBvWlbjVu/tvF5AAqfjtUHw=; b=tzDlkKZvPtDkAZAzUJZjH8Wd5B
	fdjSKnFbICXgMnkeHCV5Qt8jbBdl2oVPyfnhZncVcftTHEEJoftYksnzAoRMq11IDAMxUoAV3eLpf
	Kz/7cUVYOEtt36CY0XGxurPxNnKgGxXGKaQHOlBwgwtRfA0ibXxNdU9Tf3YJkRiST8ZQ9iT/cXdue
	PP28NUkxQwPcaIaJp8xPR2u1aSkpeMycLCWxyK7jhnC2fzLxak3pVXnYjfHiK1lu9k5O4nIYgimUD
	M+to8n5Yzivq2J8mY5/5Bbp6Y9vIvCsaf14FwHwPj6QpOkHUg88e35Fzo2qbodly+3YFHZ+cG4/PG
	u2dXNaYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngMw-00000008pYH-2Nzk;
	Wed, 04 Feb 2026 17:08:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngMt-00000008pXh-2Vda;
	Wed, 04 Feb 2026 17:08:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 56D9D4427E;
	Wed,  4 Feb 2026 17:08:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0FD3C4CEF7;
	Wed,  4 Feb 2026 17:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770224922;
	bh=D3EyukiCSM+h7n8SYlN3muS0qp32YNJ6NPicl4K9wfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YvPpYvUhbMXqrXVDizdhytqcStlYc/UFe2mnGVdczZvS4vNk6mcG7CTV4WDCkEyiS
	 cOOBGoH+o5v01y+cIqz2JLiTYMsTITxk1j0zUBXqF+y1lvzYW/NA+KkqMx/6jFSwKg
	 UKpTV1m5JW7gynZaTucoYep6sxMVdFmaktOTUJ4FuC7Wsa5QX4dBBHyL+ZSsxzKuka
	 Aq6QAH/xxUaZFlaLSmoWxb3rx+wxmrTVDujkS48ElUEgm4SRZJW8CRYzOhX+529gMJ
	 py40PR5JQH44Bb62fHGbR6YguZF4oesqc14eBl3FGKQ6LprFRNFurU+ZfdiBj7+HA+
	 t97CYK7FTIi1Q==
Date: Wed, 4 Feb 2026 17:08:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC] pinctrl: pinconf-generic: move ..dt_node_to_map_pinmux()
 to amlogic-am4 driver
Message-ID: <20260204-claim-chemist-5dbaeabf8b8e@spud>
References: <20260203-craftsman-battered-3491ff68f462@spud>
 <CAD++jLn8WOobPaoSrMLitFgFZc_6CH9BQbRy_Gdqq3BLhDXWQg@mail.gmail.com>
 <aYL9zgEyCarrluvP@black.igk.intel.com>
 <20260204-crawlers-nacho-d7c9021cdb6f@spud>
 <aYNWMndBWxxoPABG@smile.fi.intel.com>
 <aYNXFdxZiO2TMwSy@smile.fi.intel.com>
 <20260204-credit-precinct-5424c122a79f@spud>
 <aYNw-k1q_vuP-4DZ@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5/IQz1J+r/WX5zO5"
Content-Disposition: inline
In-Reply-To: <aYNw-k1q_vuP-4DZ@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_090843_675589_BB3D5D42 
X-CRM114-Status: GOOD (  10.09  )
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


--5/IQz1J+r/WX5zO5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 04, 2026 at 06:16:58PM +0200, Andy Shevchenko wrote:
>=20
> TL;DR: My point that double dots is confusing and non-standard way to ref=
er to
> something which is cut. If not full, ideally it can use triple dots follo=
wed by
> underscore
>=20
>   pinconf-generic: move ..._dt_node_to_map_pinmux() to amlogic-am4 driver

This looks good to me. Linus, want a resend or will you adapt it
yourself?

--5/IQz1J+r/WX5zO5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYN9FQAKCRB4tDGHoIJi
0jCDAP9ghQGLq3UEtyqJ3Uy4dfQsMrMGDgMLmeR42TdMuGWY+gD/UQQXM3MG48NG
YCNfSE4PhthTFEv2fQTF6PByzZmD0Ac=
=IB54
-----END PGP SIGNATURE-----

--5/IQz1J+r/WX5zO5--

