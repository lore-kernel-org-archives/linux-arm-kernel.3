Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A635BD1039D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 12:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N5mzWfo5KNa9nnp6luGwvYF574/ZPzGNo8SIJNsNcXo=; b=ZJRTK/DjDXrhiAlT5Snpt2+eMY
	negZvW0Dr+OVhx8CHJjd3rtYW6kXg/JP84PlmPEf4tmYACaPjzcSfFUbhGKMDWZFPBVHq6pULANEK
	ckylRSFQyzQgErYUsIT33gG5v34WvCCfeTooT9qurX7x1DErdhT5/5Wt4rKo8wgOMoob3wh2uWPzC
	KtbrgNkFy6Vtpt19C2FzWgO8dYI7qOw+s66JFIQQzV4gd4TF4XFmra/5MlyJClV4lImL+8A6azSuw
	9KOT1nucQn+INvAVb0d6eNfF1+d8vGiM6mMdgECIBroLBxW0l23W2BAn62njmtExMkUW2OkXj2XxV
	XB4o12QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOEky-0000000EzLU-2Dwe;
	Wed, 26 Nov 2025 12:36:24 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOEkv-0000000EzKp-1IJo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 12:36:22 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vOEkq-0001Oz-VR; Wed, 26 Nov 2025 13:36:16 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vOEkq-002bom-1f;
	Wed, 26 Nov 2025 13:36:16 +0100
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 2C7BB4A8C0F;
	Wed, 26 Nov 2025 12:36:16 +0000 (UTC)
Date: Wed, 26 Nov 2025 13:36:14 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Carlos Song <carlos.song@nxp.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>, Frank Li <frank.li@nxp.com>, 
	"hawnguo@kernel.org" <hawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Subject: Re: [PATCH 5/6] spi: imx: support dynamic burst length for ECSPI DMA
 mode
Message-ID: <20251126-refined-fluorescent-kestrel-7d3f9e-mkl@pengutronix.de>
References: <20251125100618.2159770-1-carlos.song@nxp.com>
 <20251125100618.2159770-6-carlos.song@nxp.com>
 <20251125-impartial-porcupine-of-courtesy-841990-mkl@pengutronix.de>
 <VI2PR04MB11147F814915ECCB6AE36F0F9E8DEA@VI2PR04MB11147.eurprd04.prod.outlook.com>
 <20251126-colorful-finch-of-joviality-aee641-mkl@pengutronix.de>
 <VI2PR04MB111471DB8E08CC180DA90589FE8DEA@VI2PR04MB11147.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v3dhlxhj7lfehoeh"
Content-Disposition: inline
In-Reply-To: <VI2PR04MB111471DB8E08CC180DA90589FE8DEA@VI2PR04MB11147.eurprd04.prod.outlook.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_043621_390023_2025346D 
X-CRM114-Status: GOOD (  19.67  )
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


--v3dhlxhj7lfehoeh
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 5/6] spi: imx: support dynamic burst length for ECSPI DMA
 mode
MIME-Version: 1.0

On 26.11.2025 11:17:41, Carlos Song wrote:
>
>
> > -----Original Message-----
> > From: Marc Kleine-Budde <mkl@pengutronix.de>
> > Sent: Wednesday, November 26, 2025 4:31 PM
> > To: Carlos Song <carlos.song@nxp.com>
> > Cc: broonie@kernel.org; Frank Li <frank.li@nxp.com>; hawnguo@kernel.org;
> > s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com;
> > imx@lists.linux.dev; linux-kernel@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; linux-spi@vger.kernel.org
> > Subject: [EXT] Re: [PATCH 5/6] spi: imx: support dynamic burst length f=
or ECSPI
> > DMA mode
> >
> > On 26.11.2025 07:42:36, Carlos Song wrote:
> >
> > [...]
> > > For example len is 512 *3 + 511. So first transfer using BURST_LENGTH
> > > =3D 512 bytes(auto update 3 times), DMA transfer len =3D 512 *3, seco=
nd
> > > package BURST_LENGTH =3D 511 bytes, DMA transfer len =3D 511.(If here=
 we
> > > use 512 bytes as BURST_LENGTH, SPI will shift out/in extra bits, it
> > > previous isn't acceptable!)
> >
> > What happens if you keep the Burst Length at 512 and only transfer 511 =
bytes
> > with the DMA engine?
> >
>
> Sorry for missing one question:
> BURST_LENGTH =3D 511, ECSPI will shift out 511 bytes in bus.
> BURST_LENGTH =3D 512, ECSPI will shift out the last one word all bit in 3=
2 bits FIFO.
> So ECSPI will shift out 512 bytes include 8-bits zero bytes in bus.

Why was the tail transfer not needed before your patch?

Is because you configure buswidth to DMA_SLAVE_BUSWIDTH_4_BYTES
unconditionally on !word_delay mode. What happens if you always use
DMA_SLAVE_BUSWIDTH_1_BYTES?

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--v3dhlxhj7lfehoeh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmkm9DsACgkQDHRl3/mQ
kZzLeAf4x9KacHJB4mEXTgSoVSrEvq9dfS/QCpmR/IjYApnCNJr8vGzuOAWzUx7B
Ai4MPATpacgHBcz5yrfmRDHHF55ygBQinKGRVakPkr+PO/eCWEDEtDY/307Yxhq1
109CMD3F1KIkRsf1hxhXFudso+ih3tx/e9340vLDmqwBNncgP4b0mxFWSa4wTP9i
9lTPWuXgL0iqhjGCtJ0vWqlAFTinlkyFsFoR+ioRlHuQkHdA9fk9ZSiBIfUitvj6
Ohj8xEJWOpsw7V2IBnadgEuRNMinv5Oc/96uNGypO0dcGe6U75qvNMVSNFvUpV+s
wu1/rmFwRntH6LSQMyI/h3Bmv8P0
=oY1/
-----END PGP SIGNATURE-----

--v3dhlxhj7lfehoeh--

