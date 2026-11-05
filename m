Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385F7606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dEih4QQN;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pmq2QLNL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=a10/FbOW/y79RbAy/XygKg3tgeEVwhAaxbtQwGYKBWY=; b=dEih4QQNza1sYgUL4OxilY9La+
	6nVaOwkhZsnFvit0rwjKNovbO7sCKwr3v5bHL0mHf8G+GB+XLsDAJKGPMZpgQuReitlU1XhHs0ZgD
	RF0wgvpnZM1x1mUy2LT/u5JGvzotJnjhSWqH/2u3PEbA+aQcOb+mrxWiCs6plBQPdGfrzujrWqaQv
	OjT6jZzBkXpylcEJIbaf43Gs9wxl/5O+X5194DjXPPvfSpX2c1HEdeVaCF8JiyCt4OU5/glfn/DcN
	QdwqUpjyNCILfu5faS6dThBa+Z12BOyoQr57HgxtjM+YMssQ1W1Ycpi+x0FlxGOAsBOxD40z0ai3e
	N7JWKXOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwjM-00000008zQY-24pD;
	Thu, 05 Nov 2026 12:38:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwjL-00000008zQL-1a7U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:38:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C7A0F414D2;
	Thu,  5 Nov 2026 12:38:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C2E71F000C1;
	Thu,  5 Nov 2026 12:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793882290;
	bh=a10/FbOW/y79RbAy/XygKg3tgeEVwhAaxbtQwGYKBWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pmq2QLNLeuRURVgjQY993DqQkbY+w/FjSomUkiVjZgUxdw1wmOqjZzMUnvb7bLQE6
	 NMuXI7aw3r/Ju7efwmdDRiS0FUIxqkWxnOhUVIVUs2sz78xqTElWbB20Pv3xqmhcIz
	 DbX+e2I7zAQTd7/zUy03J0db2AMDrRFFe/B+uuNL2HFeLKWhEN0LkLaecH7kiEQyb0
	 NrGhCFhukbAI8IlJrCi7wtTh6x5gafZaVCX036BxFwtw50rD5pMZG7c7s/aNOEpP8c
	 UWBlKyLdsS7ysn8tQIi2dolHfFuufhhgNMola+NwGT+eGv/KuuvvbSEOQg+TUd1yJt
	 f/h7bc89umAhg==
Date: Thu, 5 Nov 2026 13:38:08 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	"open list:MICROCHIP I2C DRIVER" <linux-i2c@vger.kernel.org>, 
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:FREESCALE IMX LPI2C DRIVER" <imx@lists.linux.dev>, 
	"open list:QUALCOMM I2C QCOM GENI DRIVER" <linux-arm-msm@vger.kernel.org>, 
	"open list:RENESAS R-CAR I2C DRIVERS" <linux-renesas-soc@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, vkoul@kernel.org
Subject: Re: [PATCH 1/1] i2c: use dmaengine_desc_set_callback()
Message-ID: <aux3ZxRCm13jQEsu@orome>
References: <20261102170004.3852546-1-Frank.Li@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4q2hqkiojuk23bqf"
Content-Disposition: inline
In-Reply-To: <20261102170004.3852546-1-Frank.Li@oss.nxp.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--4q2hqkiojuk23bqf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/1] i2c: use dmaengine_desc_set_callback()
MIME-Version: 1.0

On Mon, Nov 02, 2026 at 12:00:02PM -0500, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
>=20
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across various I2C bus drivers.
>=20
> No functional change intended. Prepare make to struct

"Prepare to make struct ..." perhaps? Also, I think it'd be good to
reference the commit that added the new dmaengine_desc_set_callback() so
people have more context for why you're changing this. It's not
immediately clear why this is helpful: "more readable" is very
subjective and the fact that you're not hiding the structure definition
somewhat weakens the argument of consistency because people can still
manually set the fields after this patch. Maybe the plan is to
eventually hide the structure altogether...

Still, seems like a worthwhile change to me and the patch looks correct,
so:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--4q2hqkiojuk23bqf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmrseLAACgkQ3SOs138+
s6FZphAAmucdhUvBQmv3U/+6XP2+d6xkC9p6HsudKLrBBXNu0Y+JAC+l6uMYJUly
psSWkmrEMSCs2ko5WioKs5lJYHFArBRxX9iaR/MyMJcUnsoWDyvGlV8raSECo80N
yuWJLfEgV7mslOQhZql8vUB1EsciH8R6MXmF28yH7zor3JGO7FT53UFRW0MZQVyr
7JFffELL2xRwLz0urC1jgJqQ8hofGPReXE72BCNQMbs9SSycE0IvCHBDpC5dKO4W
u3pqNzL8P6g4h1mO5JI55PG2lY81byjW3R4YpNL1LsaLD7I2mEc1RGVWEjTqGRA7
KpUAo3WDjGov6FD/mdctS4pIQCcKxOtmnpcTuJV5CUBw5DjsG+A9dgx02yWqYeIZ
3FDurUdKAsBC6+4oEeIoyp7f0eVjeZNk4OyQ0r+7pOq1IWGplMtt0QpOBzxDxeeX
776FiJaE7Lc5iQhzQwEV45MJ6Ja/DlW9zwqtWxXPEqndGDW+C1oF+1dOMcT4qUim
EXDPmlwQms5nbeCt0MEl4SlbT7uHZCkmJrjxl8dYcL3TUeb7lfm3ro0wIyqpu+sk
ltQYASJGNWWwe0rYjM6mOr0nQmPmVUms/BXsBSWeBej4z3IJ+RQCD0xcgpwLCHCL
SEDM73L/0RDcbzrzWrZU32LDBkG+UeVNlrya7AdQEBpZFnbCbng=
=9iU9
-----END PGP SIGNATURE-----

--4q2hqkiojuk23bqf--

