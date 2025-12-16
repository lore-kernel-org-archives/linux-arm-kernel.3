Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B33D609B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 15:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6bpYrpdLa1BV6o5WcuoYN/S5eTO5xCy/135Fpy8l8VQ=; b=A2xAVzoIohlnE7U+MQKRlUwYTq
	QGyg/P2Et1TlCcjImEf0H8vf9F8ojNKKF6nTFFFkSeTZDcI7TzQmkYa8p75j7AOsWVIHmPT237oqG
	63odbQBYlZcsOEoXr7kxLsoAfVZhiQuw55SQTnpEBXs2AwFDsjfhsXF51vgq2EheWVHVTogiAsp6X
	5sItESUhtwt1+GkxIyZM/mX39CiqjT3hrLvfuLo/FbtJigHN1xKPqMCmV0OBSGyzY/jACCwLKZXl5
	bvFxB/fvWpO4Mvo1BPrlP9fJufZfDi8M+qPcQz30g4JmP9zo5gE83i1HtKsRKfCBR9QyUB9vw1ULm
	undzD8Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVXLO-00000005TsM-02hb;
	Tue, 16 Dec 2025 15:52:10 +0000
Received: from mx-relay102-hz1.antispameurope.com ([94.100.133.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVXLK-00000005Tra-1Faq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 15:52:09 +0000
ARC-Authentication-Results: i=1; mx-gate102-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=6bpYrpdLa1BV6o5WcuoYN/S5eTO5xCy/135Fpy8l8VQ=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765900311;
 b=ZKeBCWXkpVldNFaJsaSUkh8nrOk7jY8Jb/kdXNJlNm29PkeYObx3F8+LMbdjVCfFrWPdJZZf
 cXPVkfeSgFUEY2993plWs7nMN2PqJYyoHXbY05OjJpEYIMBx8XAi5Mey/fnn11sH7FpaqhGCvOe
 5hRen5AGtvgE7XyOE7KfeUfQTMa1bh+xUxTdk3iFimBW8bPpOd0ZCRLx+v/oYV4K5JUA3QdfdJX
 JALH4mcMw+aB/J5ajbqSJQPQ/CPE2V7QNLv8VpnwMdRi0SpKYO7i4OP+XAFZtdfM27KojwcIjBH
 sMIsiTexpYnAvl3TUElYemqWwVeANcPJunJS6PTM5GDdw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765900311;
 b=SPKMPCG4+husZ7c+vw6k7dgm8FkTW7ITO7rVnjiiM+FxSHRDVNsPDEuCTzaDGKqFgmL41MV9
 Imu3FMJi1RfDjb4jMetbXs8L2YhybjQFHr911RpjvyHmdBDyMJFuOPba9FIqDDvx/sJAVkYTcNI
 HDNYfmgO22hsklUgyFLPritB84hgIjL6YEUzcp91SodZsSZZBFtS4WTP5nWgjmPIcLBd48Fa7pp
 nE8kQqtMkh6tmhFXiGhHiivi2Ld7HKpj9JdZf979axfgbLWfPB7pGQZxhsG2PGZjEapS8RBLMX4
 SeSRb41UpfthVUbeld1LWo6L7TnpOJKvNN21bzRyIMoMw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay102-hz1.antispameurope.com;
 Tue, 16 Dec 2025 16:51:51 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id AFB67A4071D;
	Tue, 16 Dec 2025 16:51:38 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Martin Kepplinger-Novakovic <martink@posteo.de>,
 Purism Kernel Team <kernel@puri.sm>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] media: nxp: use dev_err_probe() to simplify code
Date: Tue, 16 Dec 2025 16:51:38 +0100
Message-ID: <5692334.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <aUF9wPzPaGD1nmM2@lizhi-Precision-Tower-5810>
References: <20251215-cam_cleanup-v3-0-a61995068f38@nxp.com>
 <13428800.O9o76ZdvQC@steina-w> <aUF9wPzPaGD1nmM2@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5328991.LvFx2qVVIh";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay102-hz1.antispameurope.com with 4dW1d73G2Vz16W4
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: ceddf39c8a353a802996f9c91063b891
X-cloud-security: scantime:1.849
DKIM-Signature: a=rsa-sha256;
 bh=6bpYrpdLa1BV6o5WcuoYN/S5eTO5xCy/135Fpy8l8VQ=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765900311; v=1;
 b=NOn1KYRw9BqwuA+4NldbLW4KBBiipzLlqRmli5mPiT3tGIzWPxuQyhzCmWK81TqkIlZTjQa2
 5D3sFH+e2sk5LDJxlWQxuviAHw3upzGTEOsnvDrj7QGEdgWic0XZSy3EnrqwmA7fN54iZ33RRyW
 87UGZRDV6R0OvSV7r/n5nvy4JMCiGJH5EOtTqYsZDNFPaHTFsb5dAao4n55QLqTxVKfw8tgemmP
 vRY0XY2HqYYf956RMk5A146OjgvVDaaFuzdTzt45NL5BiHYJZ4BVnKzXV+6aFD7tW+eGzxeXOeI
 ZNKiuvEcAQ/qERFCx3xVQ2LNe2ANmc9qxU+KJBM/cbYEg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_075206_588448_C9E3BC95 
X-CRM114-Status: GOOD (  34.78  )
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

--nextPart5328991.LvFx2qVVIh
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Date: Tue, 16 Dec 2025 16:51:38 +0100
Message-ID: <5692334.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <aUF9wPzPaGD1nmM2@lizhi-Precision-Tower-5810>
MIME-Version: 1.0

Am Dienstag, 16. Dezember 2025, 16:41:52 CET schrieb Frank Li:
> On Tue, Dec 16, 2025 at 03:50:17PM +0100, Alexander Stein wrote:
> > Hi Frank,
> >
> > Am Dienstag, 16. Dezember 2025, 15:46:00 CET schrieb Frank Li:
> > > On Tue, Dec 16, 2025 at 08:34:18AM +0100, Alexander Stein wrote:
> > > > Hi,
> > > >
> > > > Am Montag, 15. Dezember 2025, 23:49:53 CET schrieb Frank Li:
> > > > > Use dev_err_probe() to simplify the code. Drop the explicit error=
 message
> > > > > after returning from imx8mq_mipi_csi_parse_dt(), as the error is =
already
> > > > > reported by this helper.
> > > > >
> > > > > No functional change.
> > > > >
> > > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > > ---
> > > > > change in v2:
> > > > > - add  Laurent Pinchart review tags
> > > > > - wrap error message to new line
> > > > > - remove error code print in dev_err_probe();
> > > > > - drop error messaage at imx8mq_mipi_csi_parse_dt()
> > > > > ---
> > > > >  drivers/media/platform/nxp/imx-mipi-csis.c    |  6 ++---
> > > > >  drivers/media/platform/nxp/imx7-media-csi.c   | 14 ++++--------
> > > > >  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 33 ++++++++++++-=
=2D-------------
> > > > >  3 files changed, 21 insertions(+), 32 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers=
/media/platform/nxp/imx-mipi-csis.c
> > > > > index 088b2945aee33731c565f049dd17721356300b84..ce93d868746f002c2=
2e2f86b1e0aa84ec1a76061 100644
> > > > > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > > > > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > > > > @@ -1547,10 +1547,8 @@ static int mipi_csis_probe(struct platform=
_device *pdev)
> > > > >  	/* Now that the hardware is initialized, request the interrupt.=
 */
> > > > >  	ret =3D devm_request_irq(dev, irq, mipi_csis_irq_handler, 0,
> > > > >  			       dev_name(dev), csis);
> > > > > -	if (ret) {
> > > > > -		dev_err(dev, "Interrupt request failed\n");
> > > > > -		return ret;
> > > > > -	}
> > > > > +	if (ret)
> > > > > +		return dev_err_probe(dev, ret, "Interrupt request failed\n");
> > > > >
> > > > >  	/* Initialize and register the subdev. */
> > > > >  	ret =3D mipi_csis_subdev_init(csis);
> > > > > diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/driver=
s/media/platform/nxp/imx7-media-csi.c
> > > > > index 933a5f39f9f4c9b43ca8d2a1819d0145981266e6..7ddc7ba06e3d4e007=
013821f67d783898a15461f 100644
> > > > > --- a/drivers/media/platform/nxp/imx7-media-csi.c
> > > > > +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> > > > > @@ -2218,11 +2218,9 @@ static int imx7_csi_probe(struct platform_=
device *pdev)
> > > > >
> > > > >  	/* Acquire resources and install interrupt handler. */
> > > > >  	csi->mclk =3D devm_clk_get(&pdev->dev, "mclk");
> > > > > -	if (IS_ERR(csi->mclk)) {
> > > > > -		ret =3D PTR_ERR(csi->mclk);
> > > > > -		dev_err(dev, "Failed to get mclk: %d", ret);
> > > > > -		return ret;
> > > > > -	}
> > > > > +	if (IS_ERR(csi->mclk))
> > > > > +		return dev_err_probe(dev, PTR_ERR(csi->mclk),
> > > > > +				     "Failed to get mclk\n");
> > > > >
> > > > >  	csi->irq =3D platform_get_irq(pdev, 0);
> > > > >  	if (csi->irq < 0)
> > > > > @@ -2236,10 +2234,8 @@ static int imx7_csi_probe(struct platform_=
device *pdev)
> > > > >
> > > > >  	ret =3D devm_request_irq(dev, csi->irq, imx7_csi_irq_handler, 0=
, "csi",
> > > > >  			       (void *)csi);
> > > > > -	if (ret < 0) {
> > > > > -		dev_err(dev, "Request CSI IRQ failed.\n");
> > > > > -		return ret;
> > > > > -	}
> > > > > +	if (ret < 0)
> > > > > +		return dev_err_probe(dev, ret, "Request CSI IRQ failed.\n");
> > > > >
> > > > >  	/* Initialize all the media device infrastructure. */
> > > > >  	ret =3D imx7_csi_media_init(csi);
> > > > > diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/driv=
ers/media/platform/nxp/imx8mq-mipi-csi2.c
> > > > > index 0851f4a9ae52d3096f454da643cfdc5017e000b1..a007c582b4d91660a=
97910a6a0d53c9b6fcd73e9 100644
> > > > > --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > > > > +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > > > > @@ -951,10 +951,9 @@ static int imx8mq_mipi_csi_parse_dt(struct c=
si_state *state)
> > > > >  	int ret =3D 0;
> > > > >
> > > > >  	state->rst =3D devm_reset_control_array_get_exclusive(dev);
> > > > > -	if (IS_ERR(state->rst)) {
> > > > > -		dev_err(dev, "Failed to get reset: %pe\n", state->rst);
> > > > > -		return PTR_ERR(state->rst);
> > > > > -	}
> > > > > +	if (IS_ERR(state->rst))
> > > > > +		return dev_err_probe(dev, PTR_ERR(state->rst),
> > > > > +				     "Failed to get reset\n");
> > > > >
> > > > >  	if (state->pdata->use_reg_csr) {
> > > > >  		const struct regmap_config regmap_config =3D {
> > > > > @@ -977,24 +976,22 @@ static int imx8mq_mipi_csi_parse_dt(struct =
csi_state *state)
> > > > >
> > > > >  	ret =3D of_property_read_u32_array(np, "fsl,mipi-phy-gpr", out_=
val,
> > > > >  					 ARRAY_SIZE(out_val));
> > > > > -	if (ret) {
> > > > > -		dev_err(dev, "no fsl,mipi-phy-gpr property found: %d\n", ret);
> > > > > -		return ret;
> > > > > -	}
> > > > > +	if (ret)
> > > > > +		return dev_err_probe(dev, ret, "no %s property found\n",
> > > > > +				    "fsl,mipi-phy-gpr");
> > > >
> > > > Do you really need to pass the (fixed) property name as an argument=
? Why
> > > > not move into the const string directly? I would also rephrase it a=
 bit:
> > > > "property fsl,mipi-phy-gpr not found"
> > >
> > > Laurent Pinchart provide comments at previous version. The same
> > > "fsl,mipi-phy-gpr" share one entry at RO region. slice save RO region
> > > space.
> > >
> > > https://lore.kernel.org/imx/20251119043307.GH17526@pendragon.ideasonb=
oard.com/
> >
> > "assuming it's worth it". Do you have any numbers? I doubt there is a
> > significant benefit, but I don't have strong opinion here.
>=20
> Yes, only few byte. But no worth to argue this. Laurent Pinchart, who pick
> patches.

Agreed.

>=20
> > But the grammar should still be improved.
>=20
> Okay, will update it.

Thanks

Best regards
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/
--nextPart5328991.LvFx2qVVIh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmlBgAoACgkQaS+g2M0Z
/iX//gf+LtS33Qw18u2HwxSsJ7cUH4+Wm7d0R4DwbhMp7PG2AOID6bU0gq5fnDCT
zKRKE+ex3uY7AmJa4GUj8wl+zLqGoedz5hT59N7FC36dKCElvkxehSQpEy/Ci9xv
5HJ8OSNnXyXSjrDLrkdfGv0vq01whLw1c4IXLf7wzas6vyLR9DN0dQejxvCaJE1/
UzaCjnZFl/VXFB82rqVFlcl2h9bDMJfl2bJxeCKds4L/UJrWr8eVdej47n1O05hJ
x/uXTLbnb+TJUuR3M1VkdfEphzSSdIgO5KK9Wgiy39YZwrlLMhjIYL6GsrGkt/r5
w1t4tDhtQ/nHni5X/XLYFr4dBXlo8A==
=G4dM
-----END PGP SIGNATURE-----

--nextPart5328991.LvFx2qVVIh--




