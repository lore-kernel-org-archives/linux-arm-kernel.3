Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24256CDB481
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 13:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PWlmJ3AjgAQ2KwtYYm4dQAFpI1/acxUE7N9AR5/HyRk=; b=AAlsl9hqSN0DtxkcCWHNP5Ekk6
	cDD02CKlWZnSlnp2zvyfgnpdEngrx9XAP1SvZdltDWp88l0t18U7geAwlIvDVxc10AxMcFIQ3mEf0
	+lRspRNXP66pVGgtB9rn92vDCLgTE/8sD6PdQcM88fjJt1VnRjWtK4plgfaM5TlTLcPdiFpDrGzYT
	wCrl4k/lkbzcsyFRtTnaAgXub193BtvxpkQVM1CL5cvwHb1bWr688SekpYdY/oNXLjLAnNIjEUdQK
	KgmZAIFTDn5VVfUOJrAQK2GfIDiUHMULd9c1I1ShVSd7NX4z0nLjK2RTU2Nk1eMq4S3BI5rGmmSFn
	ku38j7KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNye-00000007qxM-3OLe;
	Wed, 24 Jun 2026 13:49:16 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNyc-00000007qvu-2YoS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 13:49:16 +0000
Date: Wed, 24 Jun 2026 15:49:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782308950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PWlmJ3AjgAQ2KwtYYm4dQAFpI1/acxUE7N9AR5/HyRk=;
	b=NU/fd+HbLdNNDHUgWUioiBEHwPr2IT8tpqh9ffhzVUHw40d3Bu9f8yDdZ68YtpqOGfK8ma
	x72bPJp7Bz+ncZknGeXRrTaEsvYGEGD/eNKOJJBWh3VmdJwLpI+Yppbq/H9lGyQ63xJ3GG
	IQPElvH/CYcwrMyde68ymEi12Yi0FV3V1bEEYs11m5vexKNs2MIBCVDPJivtumiaJTBX7c
	st3kWaPgMbcquuzZmMDCsIo+4Au0smqnSuu48aOch1pu7zkKWFMaF+c9TpiDwTAVqYaxcG
	j0N67WLZrarvNHlBp5lS10L/egyzs2+9B6gsBvN+bISDNqlQKnezJrTdQyQYYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782308950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PWlmJ3AjgAQ2KwtYYm4dQAFpI1/acxUE7N9AR5/HyRk=;
	b=Pihjrs8nNq/ioaSvLpyWo7F9SHAPB2bAOqWKH4VR4+9xBRubKSJERr4Y5725DzDBhkhRQL
	rYzkoeMfSzha2aDw==
From: Javier Fernandez Pastrana <javier.pastrana@linutronix.de>
To: "Carlos Song (OSS)" <carlos.song@oss.nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Carlos Song
 <carlos.song@nxp.com>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: Re: [PATCH] spi: imx: reconfigure for PIO when DMA cannot be
 started
Message-ID: <20260624154905.3d465e47@mail.linutronix.de>
In-Reply-To: <AM0PR04MB68027B9C426D7CD42E256B92E8ED2@AM0PR04MB6802.eurprd04.prod.outlook.com>
References: <20260623153240.57185-1-javier.pastrana@linutronix.de>
	<AM0PR04MB68027B9C426D7CD42E256B92E8ED2@AM0PR04MB6802.eurprd04.prod.outlook.com>
Organization: Linutronix GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_064914_792268_B64B394F 
X-CRM114-Status: GOOD (  28.97  )
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

Hi Carlos,

On Wed, 24 Jun 2026 09:22:02 +0000
"Carlos Song (OSS)" <carlos.song@oss.nxp.com> wrote:

> > -----Original Message-----
> > From: Javier Fernandez Pastrana <javier.pastrana@linutronix.de>
> > Sent: Tuesday, June 23, 2026 11:33 PM
> > To: Mark Brown <broonie@kernel.org>; Frank Li <frank.li@nxp.com>;
> > Sascha Hauer <s.hauer@pengutronix.de>; Pengutronix Kernel Team
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Carlos
> > Song <carlos.song@nxp.com>; linux-spi@vger.kernel.org;
> > imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org;
> > linux-kernel@vger.kernel.org Cc: javier.pastrana@linutronix.de;
> > stable@vger.kernel.org Subject: [PATCH] spi: imx: reconfigure for
> > PIO when DMA cannot be started
> >=20
> > [You don't often get email from javier.pastrana@linutronix.de.
> > Learn why this is important at
> > https://aka.ms/LearnAboutSenderIdentification ]
> >=20
> > When spi_imx_can_dma() selects DMA, the ECSPI is configured for DMA:
> > spi_imx_setupxfer() sets CTRL.SMC and clears dynamic_burst, and
> > spi_imx_dma_transfer() programs the dynamic-burst BURST_LENGTH and
> > the SDMA watermarks.
> >=20
> > If the DMA descriptor cannot be prepared
> > (dmaengine_prep_slave_single() returns NULL), the transfer is
> > failed with SPI_TRANS_FAIL_NO_START and falls back to PIO. The
> > dynamic-burst DMA path uses its own bounce buffers instead of the
> > SPI core's mapping, so xfer->{tx,rx}_sg_mapped are not set and the
> > core's DMA->PIO retry is skipped; the driver falls back to PIO
> > internally. But none of the DMA-mode configuration is undone, so
> > the PIO transfer runs with CTRL.SMC set, the wrong burst length and
> > dynamic_burst cleared, and the transferred data is corrupted.
> >=20
> > This is easily hit on i.MX8MP boards that describe ECSPI DMA in the
> > device tree but run SDMA on ROM firmware (no external
> > sdma-imx7d.bin): every ECSPI DMA prepare fails. An Infineon SLB9670
> > TPM on ECSPI1 then returns shifted TPM2_GetCapability data, is
> > flagged "field failure mode", /dev/tpmrm0 is never created.
> >=20
> > Mark the controller PIO-only (controller->fallback) and re-run
> > spi_imx_setupxfer() before falling back, so the ECSPI is
> > reconfigured exactly like a normal PIO transfer.
> >=20
> > Fixes: faa8e404ad8e ("spi: imx: support dynamic burst length for
> > ECSPI DMA mode")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Javier Fernandez Pastrana
> > <javier.pastrana@linutronix.de> ---
> >  drivers/spi/spi-imx.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c index
> > 480d1e8b281f..64c78bd79d7d 100644
> > --- a/drivers/spi/spi-imx.c
> > +++ b/drivers/spi/spi-imx.c
> > @@ -2153,6 +2153,8 @@ static int spi_imx_transfer_one(struct
> > spi_controller *controller,
> >                 ret =3D spi_imx_dma_transfer(spi_imx, transfer);
> >                 if (transfer->error & SPI_TRANS_FAIL_NO_START) {
> >                         spi_imx->usedma =3D false;
> > +                       controller->fallback =3D true;
> > +                       spi_imx_setupxfer(spi, transfer); =20
>=20
> Hi, Javier
>=20
> Thank you very much for fixing this issue!
>=20
> You can remove this line also: spi_imx->usedma =3D false;
> Because spi_imx_setupxfer() will recheck spi_imx_can_dma() and return
> false because controller->fallback =3D true;
>=20
> How do you think about it?

Good catch. You're right, spi_imx_setupxfer() rechecks
spi_imx_can_dma(), so spi_imx->usedma =3D false is redundant.

I'll remove it in v2.

Thanks for reviewing!

>=20
> Carlos Song
>=20
> >                         if (spi_imx->target_mode)
> >                                 return
> > spi_imx_pio_transfer_target(spi, transfer);
> >                         else
> > --
> > 2.47.3
> >  =20
>=20


Javier

--=20
Javier Fernandez Pastrana
Linutronix GmbH | Bahnhofstra=C3=9Fe 3 | D-88690 Uhldingen-M=C3=BChlhofen
Phone: +49 7556 25 999 32; Fax.: +49 7556 25 999 99

Hinweise zum Datenschutz finden Sie hier (Informations on data privacy
can be found here): https://linutronix.de/legal/data-protection.php

Linutronix GmbH | Firmensitz (Registered Office): Uhldingen-M=C3=BChlhofen |
Registergericht (Registration Court): Amtsgericht Freiburg i.Br., HRB700
806 | Gesch=C3=A4ftsf=C3=BChrer (Managing Directors): Heinz Egger, Thomas
Gleixner, Sharon Heck, Yulia Beck, Tiffany Silva

