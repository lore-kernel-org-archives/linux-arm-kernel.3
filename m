Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D076CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 09:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ByQ6/5pKHP8MQj/YBuiBtBApZpE+BRhKSooauRrD8M0=; b=YuQ5ffm+RsjNFf04SJ6oy1NgXn
	fn8hM3BACLZ1QxZQ9ACtSNWs8CpmyeF68XF1E/fZfG0u6OxrvRjjHkZfqGgiSLubJgR7cnk02MKP/
	SR72h8nxwfYgSCorLCx+9kCUxoh3qdqmtPmLEq1JElpKbDkJzDIWqHOxNtkDNpCoAP1wNESj6rMGz
	vZWuuDXd1fmK1qZW1ItC09hLS0sYjk1nvIvmhZndvkIdMBGhWtkPskTwZX7/lEZvbb8dQFdTOuZnK
	5AfFrRB4GZS2crwWiQltJZUZwYj56C4HRf8aVz6VabjeVAOwc/RlHSNBbKLW+8b41OJyEwDH8HJzc
	H4l6W7Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSWF-00000007pBJ-0N26;
	Wed, 08 Jan 2025 09:38:31 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSUS-00000007oNn-1XwD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 09:36:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736329000; x=1767865000;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ByQ6/5pKHP8MQj/YBuiBtBApZpE+BRhKSooauRrD8M0=;
  b=b+7yGn3Jmh6ua82NM8QBvFK7J3AVP2h3ugh6r/OCLjx/UUbB1arRpzxY
   n2ubdsro01dsXRYt6gzI3aNhcAE1alXbc1O+QstnwpDGMs0YcUJOWAZHE
   uV8WgvXVyDVaNPvWwLKex7e1sON1I+Cr6g5r1tsQZDeO9CFujnJS6IkU7
   8+/TPTDJZnTxbH7HFnm/RlnEHdyZAF3c0AUPRZObFxMv0bPGgVfyak+Bf
   OXuIjzWdi/YZk6DkIen04azC8TSGIZwJVatxyJmAfz03bd1UYrccMzdXy
   5vRkJGk4Fq676vtSr1AXdr9qjYWP8RAgjIlTMD7zGGH/cnYfxtACd1cvg
   w==;
X-CSE-ConnectionGUID: lBMLYARPRLWZT5KwbkWfUg==
X-CSE-MsgGUID: Zd4zm9GtRyqHqZSqH3f2CQ==
X-IronPort-AV: E=Sophos;i="6.12,297,1728943200"; 
   d="scan'208";a="40915819"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Jan 2025 10:36:34 +0100
X-CheckPoint: {677E4722-2-3C670366-E45AD810}
X-MAIL-CPID: A643DC748E8B87B427C9C77EF9A89612_4
X-Control-Analysis: str=0001.0A682F20.677E4722.00EF,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 37A1B165CAE;
	Wed,  8 Jan 2025 10:36:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736328989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ByQ6/5pKHP8MQj/YBuiBtBApZpE+BRhKSooauRrD8M0=;
	b=U+KzuCHEcTYSgV86jGNGaa/mv07FsZ9PohRUU45OuleOyyJbt4plTlOs9OC5h7EZa6pfs3
	xlVysXyvSKiMOCJ4e9ke95vO13cPqh1HfgX8vWkZ2jAN2EB0MoIxNTAf4wbKa6PejaL/EW
	jar7uQZDyqpbdVuuUaEDl6oJFRZzUGbz27SSfYKXF1+RuuRrslFncfWHLEIPOW6btF7WcO
	XVACAELq3PbfNTlzg7AzZcgnLm7d1xi7Kdf+ERCCssq4TaNZvPf0DdIRe288BQfroOV9ZF
	uQB8SZfm+4qUhh1bs+Y2Sw358tBuiNhsWy+yyN8ZLOay3berwGebv/Qlx8V9RA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] drm/bridge: imx8qxp-pxl2dpi: Use dev_err_probe
Date: Wed, 08 Jan 2025 10:36:24 +0100
Message-ID: <1842588.VLH7GnMWUR@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <add11437-4fa8-489a-9cde-9c08cfd71db3@nxp.com>
References: <20250107143900.988567-1-alexander.stein@ew.tq-group.com> <20250107143900.988567-2-alexander.stein@ew.tq-group.com> <add11437-4fa8-489a-9cde-9c08cfd71db3@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_013640_908851_E8F974F4 
X-CRM114-Status: GOOD (  17.26  )
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

Hi,

Am Mittwoch, 8. Januar 2025, 04:22:19 CET schrieb Liu Ying:
> On 01/07/2025, Alexander Stein wrote:
> > This simplifies the code and gives additional information upon deferral.
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 26 ++++++--------------
> >  1 file changed, 7 insertions(+), 19 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu=
/drm/bridge/imx/imx8qxp-pxl2dpi.c
> > index 65cf3a6c8ec69..038eaff889bb7 100644
> > --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
> > +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
> > @@ -398,20 +398,12 @@ static int imx8qxp_pxl2dpi_bridge_probe(struct pl=
atform_device *pdev)
> >  		return -ENOMEM;
> > =20
> >  	p2d->regmap =3D syscon_node_to_regmap(np->parent);
> > -	if (IS_ERR(p2d->regmap)) {
> > -		ret =3D PTR_ERR(p2d->regmap);
> > -		if (ret !=3D -EPROBE_DEFER)
> > -			DRM_DEV_ERROR(dev, "failed to get regmap: %d\n", ret);
> > -		return ret;
> > -	}
> > +	if (IS_ERR(p2d->regmap))
> > +		return dev_err_probe(dev, ret, "failed to get regmap\n");
>=20
> s/ret/PTR_ERR(p2d->regmap)/

Thanks for the catch.

> > =20
> >  	ret =3D imx_scu_get_handle(&p2d->ipc_handle);
> > -	if (ret) {
> > -		if (ret !=3D -EPROBE_DEFER)
> > -			DRM_DEV_ERROR(dev, "failed to get SCU ipc handle: %d\n",
> > -				      ret);
> > -		return ret;
> > -	}
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to get SCU ipc handle\n");
> > =20
> >  	p2d->dev =3D dev;
> > =20
> > @@ -422,13 +414,9 @@ static int imx8qxp_pxl2dpi_bridge_probe(struct pla=
tform_device *pdev)
> >  	}
> > =20
> >  	p2d->next_bridge =3D imx8qxp_pxl2dpi_find_next_bridge(p2d);
> > -	if (IS_ERR(p2d->next_bridge)) {
> > -		ret =3D PTR_ERR(p2d->next_bridge);
> > -		if (ret !=3D -EPROBE_DEFER)
> > -			DRM_DEV_ERROR(dev, "failed to find next bridge: %d\n",
> > -				      ret);
> > -		return ret;
> > -	}
> > +	if (IS_ERR(p2d->next_bridge))
> > +		return dev_err_probe(dev, PTR_ERR(p2d->next_bridge),
> > +				     "failed to find next bridge\n");
> > =20
> >  	ret =3D imx8qxp_pxl2dpi_set_pixel_link_sel(p2d);
> >  	if (ret)
>=20
> imx8qxp_pxl2dpi_parse_dt_companion() may return -EPROBE_DEFER too, so it =
needs
> to be changed.

True, I added a dev_err_probe to that function when companion bridge cannot
be found.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



