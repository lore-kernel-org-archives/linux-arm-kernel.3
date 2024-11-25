Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2F3D58D5D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 15:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3o//Lu3fWmlMgcsFVQWA/djmZOMPgOZzmS0G9hxrPVo=; b=HWnqh6B7+qVdpDgJyF3WMwbYlZ
	moWocnsVMGRDHjFA2WAh/vggL8M7FeAkER2erxz0ds1f2usyEqckHIsvE4tjJ/DI3kNnZZBD4UvC3
	9y5pWKxHaS46QSSJa/OYbZihQCBhj+GjNBX59rZbBI3jSZn2b7yOw0B7+jpuctNyqaqwX57/c/A8a
	OOntUlXqzUG5iYpPOKKuS3w3O0XdsDT8DYimlP381aW6XHJr7E47ikR+IsIbLO+4MSTCS21YiOwJW
	Co/GifrBCR9q9q/565sij4gCSFpGVgU0JTjOIJX3wQcVSGa2fr1FH2n97j91RmDxV+FUAzC7Imx1j
	PW2aqUHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFb4P-00000008UvB-2S40;
	Mon, 25 Nov 2024 15:32:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFb0O-00000008U1D-2U3f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 15:28:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AFD72A4168B;
	Mon, 25 Nov 2024 15:26:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D468AC4CECE;
	Mon, 25 Nov 2024 15:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732548483;
	bh=3o//Lu3fWmlMgcsFVQWA/djmZOMPgOZzmS0G9hxrPVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Da0pwaU1v/VXYIKR9vpfEmCRz+MZBboI4cZHvPssv6DeCpPNrfpNflLEh/TIP6XK8
	 dCVMdbnsRji6BpFiuTodqUZna90xkkPoSYDION5+ZSTaEpqWG9bCcbmYSppNH/jjQX
	 IU7taAut171vJ9zJyX6k0DNa3B+4kCDuI4/Ed5nOFLeHI4Tn1QOZi7/LbHpI8O69wW
	 6Mo4gm6o7vubm8WH2MzDMmSm7WOmiLhPspw+uXYQRdH3ZxADM/tYgonjq4uF+HjO6p
	 fHbfCEaTX9qFxOHsiXc6GNLdk/tbhyZslH17z4vRbw04w0XxcgwJE6bWNmI86S3Rz7
	 xaHW63CTTkyfw==
Date: Mon, 25 Nov 2024 16:28:00 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Hector Martin <marcan@marcan.st>
Cc: Sasha Finkelstein <fnkl.kernel@gmail.com>, neil.armstrong@linaro.org, 
	Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Janne Grunau <j@jannau.net>
Subject: Re: [PATCH 2/5] gpu: drm: adp: Add Apple Display Pipe driver
Message-ID: <20241125-gabby-furry-rooster-cf28a9@houat>
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-2-3191d8e6e49a@gmail.com>
 <10d0aa88-de2e-4856-a137-301519e58b2d@linaro.org>
 <CAMT+MTRWZWj=3AP7wyooXr49-W4vcm0ZbAoqPyEuNkQBMOaJfw@mail.gmail.com>
 <cc71021e-b53d-4eda-bad8-abb4df13575f@marcan.st>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="3u5p24fwfin4nvod"
Content-Disposition: inline
In-Reply-To: <cc71021e-b53d-4eda-bad8-abb4df13575f@marcan.st>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_072804_757014_EC91D6D9 
X-CRM114-Status: GOOD (  22.55  )
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


--3u5p24fwfin4nvod
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/5] gpu: drm: adp: Add Apple Display Pipe driver
MIME-Version: 1.0

On Mon, Nov 25, 2024 at 11:24:25PM +0900, Hector Martin wrote:
>=20
>=20
> On 2024/11/25 20:24, Sasha Finkelstein wrote:
> > On Mon, 25 Nov 2024 at 09:50, Neil Armstrong <neil.armstrong@linaro.org=
> wrote:
> >>
> >> So this controller only supports a single mode ???????
> >>
> > Most likely. On all devices it is connected to a single built-in displa=
y.
>=20
> More specifically, the controller obviously supports multiple modes but
> it is pre-initialized by the bootloader for the single hardwired
> display's only mode. So as far as the driver is concerned, there is a
> single possible mode, and there's no point in trying to be more generic
> if there is no hardware that would use that.

It's not only about being generic, it's also about fitting nicely in the
usual abstractions. You could also always register a single panel, with
a single timing set, and the driver would never see anything else. And
still fall within the usual pattern.

> In general, it is not possible/practical to be generic for reverse
> engineered hardware with no specs documenting how to drive it
> generically. You just can't know how to implement the options that are
> never used in practice. I spent a lot of time on exceptions to this
> rule for the GPIO and SPI controllers, and that's not going to happen
> for more complex hardware like MIPI DSI.

How is GPIO or SPI even remotely related to that discussion? We are
different maintainers, with different concerns, and different things to
care about.

Also, "My way or the highway" is never a great discussion opener.

Maxime

--3u5p24fwfin4nvod
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0SXegAKCRAnX84Zoj2+
dtRuAYDEMVFA/3C+t/k4bboWPpqx9fX0T++UXMqT1mD2/3yaz7RX4i1fL4wkiniM
1/z1cnsBgJZJteTKP8wCeZmNA0nGQU5iRaW1WQwbcQQZO2JZnHgV423VVrkt03Bq
ZMUX47opzA==
=EgqE
-----END PGP SIGNATURE-----

--3u5p24fwfin4nvod--

