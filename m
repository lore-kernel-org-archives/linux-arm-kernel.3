Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A76D10F38
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 12:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xLa97cJ3CblokdgyeIhfUqOeYp/BzLJFatFz+vFkZ4k=; b=xzaqfN+udXeOwDaVDrTj8gTSzm
	xlW8pml+F9o/bM+o0vFvuI9lZuJWpfSg3cRs8xZ1sAGz8JN3R8nNw/FkgXT12gHgQSX7jRNYoUkH7
	MJ0pcEu1E62Qxn4OEwCfLqwFv72oPIR/D5O6Jxb3kUXyOFTO3azr5gPtWmwYqgianhotJ3sJWrI/s
	WCZi+TUq64O/DIzDrO6G2n1WYkBpBzs31qMfKjjVy4wQDj0RoHmx3Po8oQlDsBSrtK5tRmslTZjHl
	TWvgdN1X/Ong72LPqTzmbDfISP1mWkcJHb1fW8O2NSTrMbnjyYQFHLxxHaAr4/jYj5snx514mzliL
	M7hrQ5SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOF0W-0000000F17L-05F7;
	Wed, 26 Nov 2025 12:52:28 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOF0R-0000000F16V-1yOf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 12:52:26 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vOF0P-0003KP-5V; Wed, 26 Nov 2025 13:52:21 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vOF0O-002bsV-2Q;
	Wed, 26 Nov 2025 13:52:20 +0100
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 6B7F14A8C49;
	Wed, 26 Nov 2025 12:52:20 +0000 (UTC)
Date: Wed, 26 Nov 2025 13:52:20 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Carlos Song <carlos.song@nxp.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>, Frank Li <frank.li@nxp.com>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: RE: [EXT] Re: [PATCH 5/6] spi: imx: support dynamic burst length
 for ECSPI DMA mode
Message-ID: <20251126-glistening-rampant-dragon-4ec9d3-mkl@pengutronix.de>
References: <20251125100618.2159770-1-carlos.song@nxp.com>
 <20251125100618.2159770-6-carlos.song@nxp.com>
 <20251126-loyal-lobster-of-virtuosity-0aa824-mkl@pengutronix.de>
 <VI2PR04MB111470B46C3B7B6AF66B69D07E8DEA@VI2PR04MB11147.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o5sidt4qwxpc2qbb"
Content-Disposition: inline
In-Reply-To: <VI2PR04MB111470B46C3B7B6AF66B69D07E8DEA@VI2PR04MB11147.eurprd04.prod.outlook.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_045223_559320_F593FE75 
X-CRM114-Status: GOOD (  22.98  )
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


--o5sidt4qwxpc2qbb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: RE: [EXT] Re: [PATCH 5/6] spi: imx: support dynamic burst length
 for ECSPI DMA mode
MIME-Version: 1.0

On 26.11.2025 12:29:35, Carlos Song wrote:
> > On 25.11.2025 18:06:17, Carlos Song wrote:
> > >  static int spi_imx_pio_transfer(struct spi_device *spi,
> > >  				struct spi_transfer *transfer)
> > >  {
> > > @@ -1780,9 +2112,14 @@ static int spi_imx_transfer_one(struct
> > spi_controller *controller,
> > >  	 * transfer, the SPI transfer has already been mapped, so we
> > >  	 * have to do the DMA transfer here.
> > >  	 */
> > > -	if (spi_imx->usedma)
> > > -		return spi_imx_dma_transfer(spi_imx, transfer);
> > > -
> > > +	if (spi_imx->usedma) {
> > > +		ret =3D spi_imx_dma_transfer(spi_imx, transfer);
> > > +		if (transfer->error & SPI_TRANS_FAIL_NO_START) {
> > > +			spi_imx->usedma =3D false;
> > > +			return spi_imx_pio_transfer(spi, transfer);
> > > +		}
> > > +		return ret;
> > > +	}
> >
> > Why do you do this? AFAICS the framework already does this for you see:
> > spi_transfer_one_message().
> >
> Hi,
>
> In frame work:
> 				if ((xfer->tx_sg_mapped || xfer->rx_sg_mapped) &&
> 				    (xfer->error & SPI_TRANS_FAIL_NO_START)) {
> 					__spi_unmap_msg(ctlr, msg);
> 					ctlr->fallback =3D true;
> 					xfer->error &=3D ~SPI_TRANS_FAIL_NO_START;
> 					goto fallback_pio;
> 				}
>
> It only will help do this for "framework finished DMA map case". But DMA =
dynamic burst feature is mapped in driver.
> So this condition never meet: (xfer->tx_sg_mapped || xfer->rx_sg_mapped) =
I think..

=2E..and you remove "controller->can_dma" this deserves some comments in
the commit message. That you fool the framework, that you cannot do DMA,
and do all the mapping on your own.

If you can make it work with DMA_SLAVE_BUSWIDTH_1_BYTES then you can use
controller->prepare_message and controller->unprepare_message to do the
byte swapping. These functions are called before and after the DMA sync.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--o5sidt4qwxpc2qbb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmkm+AEACgkQDHRl3/mQ
kZz2aAf+NfQMom5cSlCV1sp4geNMQsYmqG4QERaSHYNr/okdJJwdai4uuxAdpfA6
R1bnr+JPDx2fFHsixxpkJkWtiLo0RE4uNAARa63gWSVKHLFRjN2hXYmHR1uoDyy5
cYVMTcIdNn2DvheQ6eVfzN3LZI67RyiYL3sfwnjuHwsORJhghMpj14hqoR2dJeCB
kdDMm71JUrfDfEa4VHMCRFokKLi3A1KBKlImfvTq60UREvHsG+Z2aGxCxyjEldhj
zEC1Lw6eCED/bZf+VroSpoDGjvpbMQbRMviVPfqxOy8obbxiwjxezBwqCzswi0X/
2cuNSWCvVtynRv4wdL6WdK7JDO+csg==
=w9CB
-----END PGP SIGNATURE-----

--o5sidt4qwxpc2qbb--

