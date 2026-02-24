Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA91F4BB6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 17:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fr6PXqh43rmaB19FBZ+nHVsSPe6Olfd2Oztn92uhHI=; b=BLwoHPkGPIe9YOf3WFEuef06xf
	0SIVyKks3GDESx/7/iU0Fr4xJNI/1Z9XU0VnsVnkElaTHRgakeII+6HF7jTtkUuvn3Nv4+QU9q0vq
	kpXnBTIPE4JFCnhGkoXdS8ZlB8RoSJhmjZoiqi4VulFEa+YZFViErfgLyxipwqI9vtAOY3htppBsp
	JgI1CMd+RJg3A7EXj/X8PebXGX8afohz1MKO6Ji04BkdvDHFCkA/evcykpKk/C2irD2fjGCw7LrWX
	N3K9JQiMztLaR1nnSE7lv9EBpvxTgcBLP36NSi67t90dfyiLobyFYE5wm1q4N5HMyjnaXQjKSzTJF
	MfVkJEqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwfu-00000002Wzj-0ldp;
	Tue, 24 Feb 2026 17:58:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwfk-00000002Wns-2Jsy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 17:58:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F3DB161336;
	Tue, 24 Feb 2026 17:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A54A9C2BC9E;
	Tue, 24 Feb 2026 17:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771955891;
	bh=8MqGwWFIxb4Lml38KorT8a4lyqWubshzajnY4LCZvbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SljPjdE4CMINN2eG8ECkcgTLd9wdfONF4II4FfWPdze7eOiBo5UZevZcOBmyGR6RA
	 MA+2bxKnUyTD8BMcEp6X0Xj4qLtfZdFaJ1fHQyH6j88BjsirpTnTn8JLGtCvkfbxm3
	 tcm13GW4BhcU/x2zTZOJw/9XC/wZVIV5PR0Bg7DoERBxjmyarzirPiwuE40r2AC8dx
	 9IDn0lfX4UT3TvJiutYDIsubDLDjsQJAm7X4/WkQisOrI09rUWmQehiL8NOjYHzZ1U
	 H4bv4cKSecMRf57O1Pyp8ZNGZpX+Dv2Aj9c1a+qhPQOs7FkEaxFNOqkxoRVTgtGZom
	 J2PI2ONXpNLEw==
Date: Tue, 24 Feb 2026 17:58:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>
Subject: Re: [PATCH 2/4] dt-bindings: mmc: fsl-imx-esdhc: add S32N79 support
Message-ID: <20260224-remote-deliverer-958fcaba8bfa@spud>
References: <20260224111533.3194883-1-ciprianmarian.costea@oss.nxp.com>
 <20260224111533.3194883-3-ciprianmarian.costea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jmI0Gm51aFR3a6xs"
Content-Disposition: inline
In-Reply-To: <20260224111533.3194883-3-ciprianmarian.costea@oss.nxp.com>
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


--jmI0Gm51aFR3a6xs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 12:15:31PM +0100, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>=20
> Add compatible string "nxp,s32n79-usdhc" for the uSDHC controller found in
> NXP S32N79 series automotive SoCs.
>=20
> The controller is compatible with the existing i.MX uSDHC controllers.
>=20
> Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml b/D=
ocumentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> index b98a84f93277..014b049baeb6 100644
> --- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> @@ -35,6 +35,7 @@ properties:
>            - fsl,imx8mm-usdhc
>            - fsl,imxrt1050-usdhc
>            - nxp,s32g2-usdhc
> +          - nxp,s32n79-usdhc

Ditto here, no driver change?

>        - items:
>            - const: fsl,imx50-esdhc
>            - const: fsl,imx53-esdhc
> --=20
> 2.43.0
>=20

--jmI0Gm51aFR3a6xs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZ3mrQAKCRB4tDGHoIJi
0qfqAQDI6LlvQVGHvIQUweme/W0XRbJVBLfwH9uELrcWstO43gEA64VdLMQApYzA
lr2KKEuvi2uLGyjfek++zN+gjJ12XQw=
=Az6c
-----END PGP SIGNATURE-----

--jmI0Gm51aFR3a6xs--

