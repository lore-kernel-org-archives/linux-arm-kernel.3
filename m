Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C054CD5BDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 08:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vnMFODbc+LljT7eUBEEQawLt47/OgLwD8JHdSRnnDAI=; b=s9kYmQBRVdKHE8FgH2bM3lZO0r
	dKQ/PRNG41WHxx4qP2+dZ7elkV8D4/a9rqX0WVSxmwXh4ggvMNj27rdM2xag0jm7ZP6ynB9ZDU7OA
	4K9rzT8xfnPHi4SecvT005mPovaTXAqwltAgh2ohTQk4s0N8v7zUe+dSWfFifaKgq6UyTjYe4kVT4
	XHEIPi9N/q9jDz5C/A18yVhr2pOndhutsrBhpkve9JUjGNiPOF4BZAflfLrvcG5lpiOdNyAWciTrp
	7Q6hKfR81e6KHf+3E2JhrGb7UdY34Cc9xzimWW10TRZbVrBSUt1x1KkcaWTX6ksD1URV/xfNSiro6
	qkUBFv4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9wz-00000003ZPS-1ZzV;
	Wed, 27 May 2026 08:49:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9ww-00000003ZOz-1Zc7;
	Wed, 27 May 2026 08:49:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3AE4843916;
	Wed, 27 May 2026 08:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BEDC1F000E9;
	Wed, 27 May 2026 08:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779871753;
	bh=vnMFODbc+LljT7eUBEEQawLt47/OgLwD8JHdSRnnDAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aS/Y3c/2krAHC8mOb1Mcxes6m5FDVlOQc6VRTrd4yb0jWg0E+fTAIr9V8KuSqacM9
	 SIbKkCn1wvlJlDFUj5AU0W7QFUSMx4r5jxxVIDwcmTK4z/7y4ySTtfMkftCqbjjQ/R
	 iw6WbgDW39eVcstSBGH1axuFDeW8urSBPHp7PEsHFNeQ4DS8kRG8UsGyG5+Vbzxlp1
	 1NHOkope50m9rEbE1J86KoQu0JBkgf8WCTF9fIc0fUbBpCcY6vApcQEIEUFpJRxlYZ
	 OSBSZxMHdKZTsy62UXtsvYlY+tmvCEULoPU9XtGMu8zXdEQf0IS+WN28HliJ/U7RQx
	 OhrLGfwNO4nQw==
Date: Wed, 27 May 2026 09:49:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	=?utf-8?B?0JrRg9C30L3QtdGG0L7QsiDQnNC40YXQsNC40Ls=?= <mai.kuznetsov.misha@gmail.com>,
	Charalampos Mitrodimas <charmitro@posteo.net>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 2/8] media: dt-bindings: add rockchip rk3588 vicap
Message-ID: <20260527-grimace-plausibly-c620ea58f197@spud>
References: <20260522-rk3588-vicap-v5-0-d1d1f5265c56@collabora.com>
 <20260522-rk3588-vicap-v5-2-d1d1f5265c56@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mp0q5jdAdl2wMqsR"
Content-Disposition: inline
In-Reply-To: <20260522-rk3588-vicap-v5-2-d1d1f5265c56@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_014914_438879_3DF9ABCD 
X-CRM114-Status: GOOD (  10.27  )
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


--mp0q5jdAdl2wMqsR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 11:23:08PM +0200, Michael Riesch wrote:
> Add documentation for the Rockchip RK3588 Video Capture (VICAP) unit. To
> that end, make the existing rockchip,rk3568-vicap documentation more
> general and introduce variant specific constraints.
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

Ah right I remember what Rob wanted changed now.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--mp0q5jdAdl2wMqsR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahawAgAKCRB4tDGHoIJi
0oypAQDd8ds975P1XLz5OPsVbwIIl4FFnLtrrNNKezd22scM1wEA0cwWA/v8lM9Y
tspAlrkx0Tv3bx0mhY4ZOay8xpcbbgY=
=8xBO
-----END PGP SIGNATURE-----

--mp0q5jdAdl2wMqsR--

