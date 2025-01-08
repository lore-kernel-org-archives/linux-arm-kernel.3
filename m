Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C073AE77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 09:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GSpAS96v39Vsr19bddnrz+ttBG5FohS67Nj+N6Ke34Y=; b=o+xQyFIPSQs6dGPaFlCbRvi25h
	Ax5KPlAviGeIcoGSMVTlKUnzgP4nKNsJ72F9to/AbVpbDfGPt4nkd2xaMWeGXFNUxTnh9w//+waYv
	KSLfoJsP7IazusZ5r5EnpARH4yxLHqQpg76yueLwnSPsupchzNQE9JKHgBsEC63tYq59M0Tdl9366
	Zo37rGPdwNOTX5GEt2tlUqNSxAXR+Pd4xS3dB1U9dEg7H+cVcBxBEpeZ2Zm7iDG6KY3DDsy/3DBj6
	GkOmp44WptUS8PNNNcC9yfSiTmv8NbpsYo31yNgE9tM7GYC5Si8La3ICq0m03TS97BJNYEFIaRUeW
	Vj+mR9OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSc8-00000007qer-39AF;
	Wed, 08 Jan 2025 09:44:36 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSXB-00000007pQF-06Fv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 09:39:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736329169; x=1767865169;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GSpAS96v39Vsr19bddnrz+ttBG5FohS67Nj+N6Ke34Y=;
  b=Uo2fHpDum6KTakd2sZGe4zdJa9cpQYntCJiIeLg2UsCyajNiPysht5Hw
   jvp1eiSmYP/CHMpz+tvXQ9qBXC00O383NZgSLl1EISKQyVZoJsVoXiQ3X
   XcO1n1z4vTclkVONqtvakMo795ly80GDsSRGp74EBrTZLWN4/TZ8ZqgbX
   2iUXTWr33WS2zh6DsVv9L5eaPl3JmSBAJiOVJIfLVPZIH3eoWwvwjmvki
   ObJDr3ScXAloB71BGiT0uZRQdR3NbffCzk0w6Q4NWkflGQ7anQf0HeGRi
   XMz6d/t4WVkLM3FF+CIhGx2zqrkFniyZWHIenIjZIzyPZbPlef3dUshsM
   A==;
X-CSE-ConnectionGUID: 6BfWS01oQP67s0pmEt3N/A==
X-CSE-MsgGUID: SO3dbBWwSmmoacV6464GnA==
X-IronPort-AV: E=Sophos;i="6.12,297,1728943200"; 
   d="scan'208";a="40915941"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Jan 2025 10:39:27 +0100
X-CheckPoint: {677E47CF-E-3C670366-E45AD810}
X-MAIL-CPID: B179332E72A9F6A992BFFF3D3F87A11B_4
X-Control-Analysis: str=0001.0A682F21.677E47CF.005B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C69C16609D;
	Wed,  8 Jan 2025 10:39:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736329162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GSpAS96v39Vsr19bddnrz+ttBG5FohS67Nj+N6Ke34Y=;
	b=VGzw3KZ0q4zDlplgI3hXyXggwUT7OCimKWYnjXsTfb+GrPEBTxFppC0nXDBqne7dAHTVmh
	F+BR7rKmt8OSSVReQCzlrAz2m9DEQ4S8f6/k8YnEsnRvB79umifWKzbRnJDmDE6yUHEOAk
	1DBpPzaFH+wAAZQcf/3SfR+vO/s/WSpWURJfjG8GWzHw6D9Yg1bk3HUj+IYTKGh6HHf3HK
	NjnbHJbMmrT3j5zSQ1pmLM62Ofv9cInaVD5d1SGOehHhnJJ7ez+EiNpymg4zLinIMveOVB
	zbadwSZ+Ft2XAh3B5K2UuoB2HqQWDwmcna0yEF/VA76m/bCy4sW6NScSkCR9YQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] drm/bridge: imx-ldb-helper: Use dev_err_probe
Date: Wed, 08 Jan 2025 10:39:19 +0100
Message-ID: <3553991.QJadu78ljV@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <af600eff-88ea-498b-9cbc-2c441f47d7fa@nxp.com>
References: <20250107143900.988567-1-alexander.stein@ew.tq-group.com> <20250107143900.988567-4-alexander.stein@ew.tq-group.com> <af600eff-88ea-498b-9cbc-2c441f47d7fa@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_013929_366670_2565CB20 
X-CRM114-Status: GOOD (  17.24  )
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

Am Mittwoch, 8. Januar 2025, 04:37:55 CET schrieb Liu Ying:
> On 01/07/2025, Alexander Stein wrote:
> > This simplifies the code and gives additional information upon deferral.
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  drivers/gpu/drm/bridge/imx/imx-ldb-helper.c | 13 ++++---------
> >  1 file changed, 4 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c b/drivers/gpu/=
drm/bridge/imx/imx-ldb-helper.c
> > index 9b5bebbe357dd..2c9b862af74af 100644
> > --- a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
> > +++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
> > @@ -167,7 +167,7 @@ int ldb_find_next_bridge_helper(struct ldb *ldb)
> >  {
> >  	struct device *dev =3D ldb->dev;
> >  	struct ldb_channel *ldb_ch;
> > -	int ret, i;
> > +	int i;
> > =20
> >  	for (i =3D 0; i < MAX_LDB_CHAN_NUM; i++) {
> >  		ldb_ch =3D ldb->channel[i];
> > @@ -177,14 +177,9 @@ int ldb_find_next_bridge_helper(struct ldb *ldb)
> > =20
> >  		ldb_ch->next_bridge =3D devm_drm_of_get_bridge(dev, ldb_ch->np,
> >  							     1, 0);
> > -		if (IS_ERR(ldb_ch->next_bridge)) {
> > -			ret =3D PTR_ERR(ldb_ch->next_bridge);
> > -			if (ret !=3D -EPROBE_DEFER)
> > -				DRM_DEV_ERROR(dev,
> > -					      "failed to get next bridge: %d\n",
> > -					      ret);
> > -			return ret;
> > -		}
> > +		if (IS_ERR(ldb_ch->next_bridge))
> > +			return dev_err_probe(dev, PTR_ERR(ldb_ch->next_bridge),
> > +					     "failed to find next bridge\n");
>=20
> Nit: s/find/get/, since "get" was used.

Thanks, you are right here. Adjusted.

> >  	}
> > =20
> >  	return 0;
>=20
> ldb_init_helper() may return -EPROBE_DEFER too, so it needs to be changed.

Thanks for spotting. Added dev_err_probe there as well.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



