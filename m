Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945DAD10395
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 08:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=If5OVL3w57dykoZXY7vkVztIVOk+zqcN1xcprqVY7ZA=; b=tKghDxEvMhmc5dU5zxszjLTHnY
	PGBCGPgH+SAeqNAji8kUDEQvWMAVNCufsQcgEH3xT7uCnIUSZ+AffSXINrqHIDb75xGZxDukVQpnD
	erACEi4eB4mVCFlxt6CbD1V5/1QAcvA/Bdf7a2lmqh3hYNTTvLKuqf0pZ4ODQppjwzk4Vyl2Pm4hp
	hSwx3oKw8h2sWCW/LqLq8cCaEiOQFth3tIEa9NLJvrMUdXG5+lXtf7COznbuwvGs5AEbFB3q2EfjB
	ecJzk2L7plnWlaTWAGAELY/K5tES4NiSWD+tYKcFU4PoLJrR7Rqc4tmBlIqXNu2wdMP85EwtIbrW6
	/54dtQxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOB95-0000000EdWi-0ejr;
	Wed, 26 Nov 2025 08:45:03 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOB8z-0000000EdSz-1HMH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 08:44:58 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vOB8w-0006Ex-UC; Wed, 26 Nov 2025 09:44:54 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vOB8w-002ZUP-24;
	Wed, 26 Nov 2025 09:44:54 +0100
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 4BBEA4A87B2;
	Wed, 26 Nov 2025 08:44:54 +0000 (UTC)
Date: Wed, 26 Nov 2025 09:44:53 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Carlos Song <carlos.song@nxp.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>, Frank Li <frank.li@nxp.com>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: RE: [EXT] Re: [PATCH 5/6] spi: imx: support dynamic burst length
 for ECSPI DMA mode
Message-ID: <20251126-aloof-stalwart-worm-343112-mkl@pengutronix.de>
References: <20251125100618.2159770-1-carlos.song@nxp.com>
 <20251125100618.2159770-6-carlos.song@nxp.com>
 <20251126-invisible-almond-bee-86a27d-mkl@pengutronix.de>
 <VI2PR04MB1114788C5ADCB9D42399D12C1E8DEA@VI2PR04MB11147.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lpjpsnbozts7gelo"
Content-Disposition: inline
In-Reply-To: <VI2PR04MB1114788C5ADCB9D42399D12C1E8DEA@VI2PR04MB11147.eurprd04.prod.outlook.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_004457_394685_11AAB7CA 
X-CRM114-Status: GOOD (  20.36  )
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


--lpjpsnbozts7gelo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: RE: [EXT] Re: [PATCH 5/6] spi: imx: support dynamic burst length
 for ECSPI DMA mode
MIME-Version: 1.0

On 26.11.2025 08:34:18, Carlos Song wrote:
> > On 25.11.2025 18:06:17, Carlos Song wrote:
> > > +static int spi_imx_dma_transfer(struct spi_imx_data *spi_imx,
> > > +				struct spi_transfer *transfer)
> > > +{
> > > +	bool word_delay =3D transfer->word_delay.value !=3D 0;
> > > +	int ret;
> > > +	int i;
> > > +
> > > +	ret =3D spi_imx_dma_data_prepare(spi_imx, transfer, word_delay);
> > > +	if (ret < 0) {
> > > +		transfer->error |=3D SPI_TRANS_FAIL_NO_START;
> > > +		dev_err(spi_imx->dev, "DMA data prepare fail\n");
> > > +		goto fallback_pio;
> > > +	}
> > > +
> > > +	spi_imx->rx_offset =3D 0;
> > > +
> > > +	/* Each dma_package performs a separate DMA transfer once */
> > > +	for (i =3D 0; i < spi_imx->dma_package_num; i++) {
> > > +		ret =3D spi_imx_dma_map(spi_imx, &spi_imx->dma_data[i]);
> > > +		if (ret < 0) {
> > > +			transfer->error |=3D SPI_TRANS_FAIL_NO_START;
> >
> > What about:
> >
> > if (i =3D=3D 0)
> >         transfer->error |=3D SPI_TRANS_FAIL_NO_START;
> >
> > instead of removing the later?
>
> 	for (i =3D 0; i < spi_imx->dma_package_num; i++) {
> 		ret =3D spi_imx_dma_map(spi_imx, &spi_imx->dma_data[i]);
> 		if (ret < 0) {
> 			if (I =3D=3D 0)
                            ^ i
> 				transfer->error |=3D SPI_TRANS_FAIL_NO_START;
> 			dev_err(spi_imx->dev, "DMA map fail\n");
> 			break;
> 		}
> ...
> -	/* If no any dma package data is transferred, fallback to PIO mode tran=
sfer */
> -	if ((transfer->error & SPI_TRANS_FAIL_NO_START) && i !=3D 0)
> -		transfer->error &=3D !SPI_TRANS_FAIL_NO_START;
>
> 	return ret;
>
> Just like this? I accept this. I can fix this in V2

Yes, with the fixed typo.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--lpjpsnbozts7gelo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmkmvgIACgkQDHRl3/mQ
kZzAvAgArvXzrutjT/izZ7sdLJgRn2brxxdTsRIw5MxG8cSN6QHYKhE4ADZ8ZU0I
UHPcxx5UbhoxLC/nEnzjYS4l48XGBq66gxtkTBSff01akyulQeAHT9FeS97f2hIE
lNH+SUqzeMtm94s1FysvscYnaYJgR7X/Gl7zT9/Nx6abM2gLL9NdqWEmFg1jfKdp
nGqJlcW13MIjrQHwG4Cf8oa4Yc6K6iPfv5HaryQ/V43mnlpUtmZ2WkbDxlak5zTe
X0ORcy/w2DeRjzXkvdlBV31kUZCpZbjJn6ZhPTXR+VpRDzUzurD5JJfmOmt3kBXp
Aig2qZuQQ5x71CbySJajSzNmYJvqQw==
=eUsF
-----END PGP SIGNATURE-----

--lpjpsnbozts7gelo--

