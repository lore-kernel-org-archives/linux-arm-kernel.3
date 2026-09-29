Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8C5CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 21:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2KEhu3d6YlE+Nz+gmiCdg+VCYUQv+IGjS0LzMmdH5hA=; b=e5+WlSdhp5xRUVLbQwag058Sgx
	2UrqpcaxLUjSh2ZEjXTYphz9dUCmAcmY7Z5V3QXPKt3qlpKymDsAyofdcaM/J+j4h3jKpRd84W842
	Tnc5gcAczM01hK5N37xOLrec1/HVSUbNFMBksccQg+1PWshHDho6fzjEtjg8h7FATLb2JqDcQ6CYp
	uwfhB3cidBthSuJItnPDg72lm+bO4XGopDpQl4MYboOenrIA1DDQ7syMRhLgM1x3agqxTt9L6Dyx5
	iVo0oAY6QNeKbBC7t71EoiekclGBnvS5fqcHv+m3XfxURh6Aajl7T+VLCWxMTq9NHXQc5mXAIqCK8
	HC7zu+aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBfcK-00000004cto-0zX1;
	Tue, 29 Sep 2026 21:44:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBfcI-00000004ctU-2Ksm;
	Tue, 29 Sep 2026 21:44:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0185343530;
	Tue, 29 Sep 2026 21:44:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 412391F00893;
	Tue, 29 Sep 2026 21:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790718241;
	bh=2KEhu3d6YlE+Nz+gmiCdg+VCYUQv+IGjS0LzMmdH5hA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CI9qf0yYXGBU6Acr89YrQCW2sfMzQPY5FRReCxQ6HiZpV0Is0a7X0YskUC6BzoAZR
	 73iAv/If+qQ/na/F0HbvLGU8KHAVP/W6qhjiPVRrgL2vta2SaztgmKk6jiQnZJWPo1
	 SKYh/RI3cebBr0iu1ObM/SDFCQU+T/gCK5HiavC3AAvBNWVI/+5SZHAk6OW9jUA4SG
	 rovd+fCbD8cafHQpx81eQQaS0CbFQsX0LwGd9XxvJcngQbvxcHoKJ/TlW72GL0IHVe
	 5ncObZntWs/frWOLdn5GX096bC/ZK341dhC40QgS5PVU0s/z8PKzH0uyG15mDQCXSc
	 ib/H/Gw9SAt/A==
Date: Tue, 29 Sep 2026 22:43:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Vladimir Oltean <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
	Haibo Chen <haibo.chen@nxp.com>, Linus Walleij <linusw@kernel.org>,
	"open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:FREESCALE DSPI DRIVER" <imx@lists.linux.dev>,
	vkoul@kernel.org
Subject: Re: [PATCH 2/2] spi: use dmaengine_get_dma_device() instead of
 chan->device->dev
Message-ID: <a9a4fc5a-df79-47f7-b963-217439e0b020@sirena.org.uk>
References: <20260929155445.3311133-1-Frank.Li@oss.nxp.com>
 <20260929155445.3311133-2-Frank.Li@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vrrxCsum5yX0Juyp"
Content-Disposition: inline
In-Reply-To: <20260929155445.3311133-2-Frank.Li@oss.nxp.com>
X-Cookie: 1 bulls, 3 cows.
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


--vrrxCsum5yX0Juyp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 11:54:43AM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
>=20
> Replace direct dma_chan::device::dev access with the proper
> dmaengine_get_dma_device() for consumer API

> @@ -1174,16 +1177,15 @@ static int bcm2835_spi_setup_dma(struct spi_contr=
oller *ctlr,
>  				 struct bcm2835_spi *bs,
>  				 struct bcm2835_spidev *target)
>  {
> +	struct device *rx_dev =3D dmaengine_get_dma_device(ctlr->dma_rx);
>  	int ret;
> =20
>  	if (!ctlr->dma_rx)
>  		return 0;
> =20

This moves the use of dma_rx after the NULL check.  Possibly
dmaengine_get_dma_device() will do the right thing but still there's
more updates needed.

> @@ -766,21 +769,21 @@ static int dspi_request_dma(struct fsl_dspi *dspi, =
phys_addr_t phy_addr)
>  static void dspi_release_dma(struct fsl_dspi *dspi)
>  {
>  	struct fsl_dspi_dma *dma =3D dspi->dma;
> +	struct device *tx_dev =3D dmaengine_get_dma_device(dma->chan_tx);
> +	struct device *rx_dev =3D dmaengine_get_dma_device(dma->chan_rx);
> =20
>  	if (!dma)
>  		return;

Similar issue here, though things are a bit more involved.

--vrrxCsum5yX0Juyp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq8MRoACgkQJNaLcl1U
h9Cfqgf/XWp6benseGwKwZKeuaOsw1cBguwAfqDmvyDi7aHwm11SxEjrkzcrIm2x
P0g7TifMKYaCXW5j0wZEdS4bDoMzROZoh7TSc8fuWGvL9ATJqgcR/rfCjuqM46no
wO84cvU5xrXc8rK0mG99NXFqmWZE8dYzKMnTwC1aMyid3OVl/aY62R/lwHY/ouOq
jJ5Yr7oCUxSHvpe6U2BpfaP6uAbN+KFFnCBeziNzgNgGTFvf+GnamKxlF+RwgyU5
QgtaYx99v37Jkl7Ecu6F8xV4vsyPMffWhQLn5vL9BovFT/mQ9i7ol5bbNMj/SiV0
Ede1lApphqMCEsoAVYigi0mIUpfoGA==
=Qy7q
-----END PGP SIGNATURE-----

--vrrxCsum5yX0Juyp--

