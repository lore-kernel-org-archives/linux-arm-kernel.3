Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41001C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 01:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zg5HXGTrlhhiTOPA2jjHZNaufpDMA8T3jdH8ZIjofCM=; b=bDfX4ie6/kHHIEDIigsU8EySnj
	Tr562a+Tp7zujz2bBm7VCjG5D6ZTlHTu55rtRpJNKZif6fQnE9rDf+klWtQgGV7obNTqf1hniuU+5
	Fpe6zb4unISSsVjxDFX044gK3wPwc8POXz6WrTFMlrEECOR9y4sU1thJsytopEdYCVqXG/szw/gDt
	0/IGNsRJ+Y/fxOb8S9G75y8scICS18aqNzEGqmskFgywX1q9c+5EkRq0sYQUMy22SdxrmRs37TjDB
	4gsnlL19LMyp780GRD7uDREIyL+lK615mQDJ8St29eKN3KHpMGmwZfbXbLStCLH2sTrtRw7XAcq+y
	ykjEP7LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDZ3C-00000005GFg-1YKW;
	Sat, 10 May 2025 01:30:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDYsV-00000005FSL-2odJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 01:19:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C21195C7109;
	Sat, 10 May 2025 01:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 679F1C4CEE4;
	Sat, 10 May 2025 01:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746839986;
	bh=zg5HXGTrlhhiTOPA2jjHZNaufpDMA8T3jdH8ZIjofCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NumnG3YkxGfCRVCRqFGOxTVTNokveYQU3KGb+ew7fW3U9W8knAl9YOvv9vQAQKUcE
	 wc0l7IkUC2x5IJzv1rXo5TzKv4GA+tUyXIT2UkFBX8NZJgUSOFFdV8liH4mdDdT1iR
	 g2nLt+KTnipcSshGEND00NS4Z/cbqznavW3ubfAL0l9csA4lYTQbrPF+okif5Sr+n8
	 UUGHxSNwN3XM+EA26Odbm0Np9FDL6Fo6BwXtnSdhpv+tp+679oL8CYC2z1VLtC0FY4
	 hNP1k1Ij1blLOrpyGohdWcJQlscEJ8FLHKZ1k3UYsgxpSbNNf0tOr2aBamujglQqT3
	 B88t6ewQtaPlg==
Date: Sat, 10 May 2025 10:19:44 +0900
From: Mark Brown <broonie@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, larisa.grigore@nxp.com,
	arnd@linaro.org, andrei.stefanescu@nxp.com,
	dan.carpenter@linaro.org, linux-spi@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Subject: Re: [PATCH 11/14] spi: spi-fsl-dspi: Halt the module after a new
 message transfer
Message-ID: <aB6psNq3F-bsAA3e@finisterre.sirena.org.uk>
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
 <20250509-james-nxp-spi-v1-11-32bfcd2fea11@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W8tovzokLkW8kDL3"
Content-Disposition: inline
In-Reply-To: <20250509-james-nxp-spi-v1-11-32bfcd2fea11@linaro.org>
X-Cookie: Well begun is half done.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_181947_747896_3C4646E4 
X-CRM114-Status: GOOD (  14.17  )
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


--W8tovzokLkW8kDL3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 09, 2025 at 12:05:58PM +0100, James Clark wrote:
> From: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
>=20
> The XSPI mode implementation in this driver still uses the EOQ flag to
> signal the last word in a transmission and deassert the PCS signal.
> However, at speeds lower than ~200kHZ, the PCS signal seems to remain
> asserted even when SR[EOQF] =3D 1 indicates the end of a transmission.
> This is a problem for target devices which require the deassertation of
> the PCS signal between transfers.

This also looks like it might be a fix?

--W8tovzokLkW8kDL3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgeqa8ACgkQJNaLcl1U
h9AOTQf/dvvH6zQ9y3ahPtoaRH796SUktbVlwo17kK32GIACKMksAuQXPZd+9n7b
4FxeO+I3OfdJYftlsCGwhls/p18ok4/vHQ/wFzvMlt3zMXx0IM6e4UyB9rEqnuVy
YqERHCwORZvPcv3bFj7vRmkmzxGRuygjl9Wo02e7LEEztSJNelk1PVruHYUiRkih
5Tj739mOIqhPsf7zIhSnliDUDGcfEiFTJo9Hai3Jx6z3Wj6oTy4hYyq2g/G5g1pi
g5EgAwO0st8dJKenYZf109W094rXshtEywMUZd1DkB2+Nf7JaPCqZUbm1IAsAX9L
vLwgHrh6qCnJk1VYCOiW/qs30XD5+w==
=zCVN
-----END PGP SIGNATURE-----

--W8tovzokLkW8kDL3--

