Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABFA0EF8FF0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 14:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S65+QOpEDDtGcLkv1l5kDyDDm+1HHGKbmX7NekvLsrU=; b=j8puVW639nEGNiumF/1CX0ixtN
	dcIMib03P9IJwRD7kPPTSHPB6SnHIhmaz1q5G0eyGBgeobpz3H0bqy74DELWfUHmFnn/BDOEvKcGT
	E+6Ds7zH1ik3CGCMSB6EdzN6EcJ+OY/exwFOc0j4mlYK1tAUyIFlwNiSDTsGNSlInxllxrF0UV+dD
	33vlb+COrtynRwM98lGttpeYFZFSfBdVlaSEOgIyIKW6hPTfUEDTy6O3FVJprttlNfalxl/XFTdnG
	kCPQF95RANQmSPu6Ra1SQAyMp2fsMRjrAD2ykXh/Mcgor7Ioaus1A7NlIr2RGVow9cL2IYVgEpzWu
	YYY8N/eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxnLj-0000000HPlb-0gNU;
	Wed, 04 Mar 2026 14:37:19 +0000
Received: from mx-relay164-hz1.antispameurope.com ([94.100.133.57])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxnLe-0000000HPlA-3XOk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 14:37:17 +0000
ARC-Authentication-Results: i=1; mx-gate164-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=S65+QOpEDDtGcLkv1l5kDyDDm+1HHGKbmX7NekvLsrU=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772635026;
 b=nZQfbqp6lwSfCe2M6G0Mdd7M3Ga20VXvWvhmI+XdyBHHuQgK4AHEJrYs8p4MxaetUJzhseBX
 W41TRTHPyJzEzg2c2Y/2RQ8H9TbvAG2rGrVGV2q6M1t05PZCnHPJXXilX2vLue0yw6C7d4LvPGx
 bBOgklChDJWmyj7qLrfg0xOohECyMCLySf5L3WolnouZlqniwGD7I8Zud6raW0FiKK8wXvQPJBO
 P89Wm3ZTaZ3x8LUM3MYXbseaCEkKkgda325bALlFvmjfl1a69sy9Sn3h+1wyU8+KX2UvzhAbQH+
 85ofNsdG0itANfGI94+C8x4J5r22SZ2ZAi/bUn01lrwfg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772635026;
 b=f3B0deHIEM3j4nfJFTblNCyfH5mgoUuhyaQVkoS8g4l6mEi0mtJfrn+YdbGLz7NC6KRLhLzB
 CGVnLokyzZX2e+fv7VQSG2ztMWY/7+w6DqNCYr5AjJIWBxzEpvhUlKDlwo0Po9Jsy7pQ97MXr6G
 8h69wH8QN5g2gSbKws5JrG58Yb14F2Q33YdNrx7KDJEfSf4ED+A7gcY7zKh+u3dloWhop0ZTDUK
 fM3+7astxyHtPW1OblksqePxY0XLD7CegypqEn9Gn0eC++Mi+UqMT+L3dsKRmSPBJCzrbtthARR
 fMAzbdD/LAtsN2o+Hde5p0zvl+1wxdX2ZTIcxptC+/PrA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay164-hz1.antispameurope.com;
 Wed, 04 Mar 2026 15:37:06 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id F2378A406A9;
	Wed,  4 Mar 2026 15:36:51 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>, Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-phy@lists.infradead.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RESEND 1/1] phy: freescale: imx8qm-hsio: provide regmap names
Date: Wed, 04 Mar 2026 15:36:51 +0100
Message-ID: <4790031.44csPzL39Z@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <aYygzojdO0QACdqX@lizhi-Precision-Tower-5810>
References: <20260211144949.1128122-1-alexander.stein@ew.tq-group.com>
 <aYygzojdO0QACdqX@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart10034661.T7Z3S40VBb";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay164-hz1.antispameurope.com with 4fQwGr4Cjjz3xc4N
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: cc7fdbe6e2458b426077c21ba7604f44
X-cloud-security: scantime:6.857
DKIM-Signature: a=rsa-sha256;
 bh=S65+QOpEDDtGcLkv1l5kDyDDm+1HHGKbmX7NekvLsrU=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772635025; v=1;
 b=QSO5a0c0SgohUb9dRmobsmpDh28wtyu/ZcuOFhMIrrJpwszcxtnfd/2uLHYP/+FtC9wTsjKw
 5rakiU4NIhTEu6iloggH53BoaEncxfqRk776YVN3hHutkkmjFA7l2HP6ZDm2MeGuEmlw24X7jmO
 1KXQFhvKWQCMfy4T/bYgEKCTo0xNwkQjXjbBuDlNfpDDvYqULopBDQkT1CHwb3neZTevT0tZay5
 pMpYA00R9BNi5Nkzb2Is9VEDXeFzars0gZHC2OC+2z2L6OR6e9MWMTWSNpwzWhQa3LXhEVEf1bR
 Lduafk1ssbHiJUbYRM8UKfiY7iSuP9t98K8gE46gUSnuA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_063715_024331_97E37174 
X-CRM114-Status: GOOD (  24.25  )
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

--nextPart10034661.T7Z3S40VBb
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>, Vinod Koul <vkoul@kernel.org>
Date: Wed, 04 Mar 2026 15:36:51 +0100
Message-ID: <4790031.44csPzL39Z@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <aYygzojdO0QACdqX@lizhi-Precision-Tower-5810>
MIME-Version: 1.0

Hi,

Am Mittwoch, 11. Februar 2026, 16:31:26 CET schrieb Frank Li:
> On Wed, Feb 11, 2026 at 03:49:48PM +0100, Alexander Stein wrote:
> > This driver uses multiple regmaps, which will causes name conflicts
> > in debugfs like:
> >   debugfs: '5f1a0000.phy' already exists in 'regmap'
> > Fix this by using a dedicated regmap config for each resource, each
> > having a dedicated regmap name.
> >
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

gentle ping. Any additional feedback?

Best regards,
Alexander

> > Same as the one sent in December but with an updated CC list.
> >
> >  drivers/phy/freescale/phy-fsl-imx8qm-hsio.c | 23 +++++++++++++++++----
> >  1 file changed, 19 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c b/drivers/phy/=
freescale/phy-fsl-imx8qm-hsio.c
> > index 279b8ac7822df..4ab45c9f53dff 100644
> > --- a/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
> > +++ b/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
> > @@ -107,7 +107,22 @@ static const char * const lan2_pcieb_clks[] =3D {"=
apb_pclk2", "pclk2", "ctl1_crr",
> >  static const char * const lan2_sata_clks[] =3D {"pclk2", "epcs_tx", "e=
pcs_rx",
> >  					      "phy1_crr", "misc_crr"};
> >
> > -static const struct regmap_config regmap_config =3D {
> > +static const struct regmap_config regmap_phy_config =3D {
> > +	.name =3D "phy",
> > +	.reg_bits =3D 32,
> > +	.val_bits =3D 32,
> > +	.reg_stride =3D 4,
> > +};
> > +
> > +static const struct regmap_config regmap_ctrl_config =3D {
> > +	.name =3D "ctrl",
> > +	.reg_bits =3D 32,
> > +	.val_bits =3D 32,
> > +	.reg_stride =3D 4,
> > +};
> > +
> > +static const struct regmap_config regmap_misc_config =3D {
> > +	.name =3D "misc",
> >  	.reg_bits =3D 32,
> >  	.val_bits =3D 32,
> >  	.reg_stride =3D 4,
> > @@ -562,19 +577,19 @@ static int imx_hsio_probe(struct platform_device =
*pdev)
> >  		return PTR_ERR(priv->base);
> >
> >  	off =3D devm_platform_ioremap_resource_byname(pdev, "phy");
> > -	priv->phy =3D devm_regmap_init_mmio(dev, off, &regmap_config);
> > +	priv->phy =3D devm_regmap_init_mmio(dev, off, &regmap_phy_config);
> >  	if (IS_ERR(priv->phy))
> >  		return dev_err_probe(dev, PTR_ERR(priv->phy),
> >  				     "unable to find phy csr registers\n");
> >
> >  	off =3D devm_platform_ioremap_resource_byname(pdev, "ctrl");
> > -	priv->ctrl =3D devm_regmap_init_mmio(dev, off, &regmap_config);
> > +	priv->ctrl =3D devm_regmap_init_mmio(dev, off, &regmap_ctrl_config);
> >  	if (IS_ERR(priv->ctrl))
> >  		return dev_err_probe(dev, PTR_ERR(priv->ctrl),
> >  				     "unable to find ctrl csr registers\n");
> >
> >  	off =3D devm_platform_ioremap_resource_byname(pdev, "misc");
> > -	priv->misc =3D devm_regmap_init_mmio(dev, off, &regmap_config);
> > +	priv->misc =3D devm_regmap_init_mmio(dev, off, &regmap_misc_config);
> >  	if (IS_ERR(priv->misc))
> >  		return dev_err_probe(dev, PTR_ERR(priv->misc),
> >  				     "unable to find misc csr registers\n");
> > --
> > 2.43.0
> >
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/
--nextPart10034661.T7Z3S40VBb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmmoQ4MACgkQaS+g2M0Z
/iXEwAf9GBONzrpx0QZxqc/tjXVVNBxtfFMIWIpmqhW2P3EqsUIygmNtmMcUnPel
7DAxvDtWy78DIFN+X25IKGbfsvNvtCwSk60RBJS/w5ZSIl3RrMUiaCjg73DKp615
E/4cBrbdhPzarLe4AbsYGqmOWh66JITuqA25STPr9TV3+n+fWLN8Yi4mBWO6159N
zGEORkXKrKIL9igOncF3N0twnqCBoD/PgKV98OABPY6gxEQRI6PiugImylCxDzNX
AzaAqwAdmRcgkpFemCGZ2VvCQmXgqmz8eHKr5cpBgQgob2n+MW2TPx2gTpsOopGz
XqbH935kCh8B2o+L29CoshVgIOpHEQ==
=XFgl
-----END PGP SIGNATURE-----

--nextPart10034661.T7Z3S40VBb--




