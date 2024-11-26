Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7115CD3B7CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 09:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RMkkAgjPqENLuUsVBvuq8uLGQTLUqgRglECbh0bbHJc=; b=VQBfCMxwbS49ZoE115V7Z8pK6q
	JHdNitvU0dn9rHa9SJT1pEZx9UHfrRlozgqexB0DsCeC50AFpiguJpifI2H0IZ4fPOeE7TmxRO1Gh
	uq26LPVBvGC9aImXIpVa39vu5DAGGqOIC0agozhqyt7S6ZNoiQsGqxUo7CQkru6w8gWj0qwZ0Qfrj
	jbkCmMR7HxA8LhQMkkRnKPX9+ydFBr/0nDpBKOrnJ2FpcoReLWw2l3+Nk2bVfkSOm1ArgPQERjwk/
	fmAOmSx9DLQ4jH+EXaTsM4BLDvE7W5Vcg/U7/X2XrCLl5RiiCPyS50fXunveDs3yVE3yj8QLLhO8o
	FfZys9rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFsAh-0000000ADC0-05uD;
	Tue, 26 Nov 2024 09:47:51 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFs5P-0000000AC7T-3Uej
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 09:42:25 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tFs58-00008u-Oh; Tue, 26 Nov 2024 10:42:06 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tFs52-000E6C-23;
	Tue, 26 Nov 2024 10:42:01 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id EE9F937D855;
	Tue, 26 Nov 2024 09:42:00 +0000 (UTC)
Date: Tue, 26 Nov 2024 10:42:00 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Akshay Bhat <akshay.bhat@timesys.com>, Chandrasekar Ramakrishnan <rcsekar@samsung.com>, 
	Chen-Yu Tsai <wens@csie.org>, "David S. Miller" <davem@davemloft.net>, 
	Dong Aisheng <b29396@freescale.com>, Fengguang Wu <fengguang.wu@intel.com>, 
	Gerhard Bertelsmann <info@gerhard-bertelsmann.de>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	"Ji-Ze Hong (Peter Hong)" <peter_hong@fintek.com.tw>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Marek Vasut <marex@denx.de>, Maxime Ripard <mripard@kernel.org>, 
	Oliver Hartkopp <oliver.hartkopp@volkswagen.de>, Samuel Holland <samuel@sholland.org>, 
	Sebastian Haas <haas@ems-wuensche.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Varka Bhadram <varkabhadram@gmail.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Wolfgang Grandegger <wg@grandegger.com>, linux-arm-kernel@lists.infradead.org, linux-can@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 00/12] Fix {rx,tx}_errors CAN statistics
Message-ID: <20241126-gigantic-intelligent-wallaby-2155eb-mkl@pengutronix.de>
References: <20241122221650.633981-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oinnd7mmrbpyaeoz"
Content-Disposition: inline
In-Reply-To: <20241122221650.633981-1-dario.binacchi@amarulasolutions.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_014223_869016_26B3E0EA 
X-CRM114-Status: GOOD (  13.30  )
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


--oinnd7mmrbpyaeoz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 00/12] Fix {rx,tx}_errors CAN statistics
MIME-Version: 1.0

On 22.11.2024 23:15:41, Dario Binacchi wrote:
> This series extends the patch 4d6d26537940 ("can: c_can: fix {rx,tx}_erro=
rs statistics"),
> already merged into the mainline, to other CAN devices that similarly do
> not correctly increment the error counters for reception/transmission.

I've re-phrased the commit messages of the earlier patches to imperative
language.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--oinnd7mmrbpyaeoz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmdFl+UACgkQKDiiPnot
vG/v6gf+PSVM1BCLp+8U3Ib5fPjv56qhSELaMQwnseETdpOhezRKYuUyLYp/qxhZ
zCEkFwcei3zNxlbepUdkP7ln/j05Cwavz1akIZ9arFAz7idBGqPQphF55JWJZggV
peQpmEX6YAVG2xYe/vTNgBE57FFXYtFcVADihq4UXeQfXh/C6Lm00phWt1JaHe9J
OKdrWp/U7qECbGA5Gh8G+tYbXQilDnrV0iAqdEg8wWAguflcgk3/W5f6KYFrDX9W
dEkcZb+r7bbu1FGx+E3IkyxSbAUvlj94KVak3VzPicJ9j2JQHCqbEM6I90+4Mby4
d/aiV9lt060AIJPrevBXqyNXaI38qA==
=xk6y
-----END PGP SIGNATURE-----

--oinnd7mmrbpyaeoz--

