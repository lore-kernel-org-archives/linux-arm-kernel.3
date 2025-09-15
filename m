Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 279B9CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 09:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRD55G5i6CDzKNfyID53MiJuZZkkbeBVDHeQLps2SSE=; b=KPRrAmQU9BXigxUMMM1RBT9xLw
	X7ZhKGygnELivwZw7aITHu9UX0guPy7l66EUXOpYcD5bbc/VkSc9EMX1OWy5+Vuv6RhyEG23MRGIj
	yTa1zrl6K32k/tR/QuwM+hopNXhjXB6uclPkliwwVYVrxSdepClctE3NTgFbFJhuerSWX0LSQWZPJ
	d1RcORVbQtY3kk0SlKW46VwTcm6wPeA2fQ/viVVBQhcDfQgzc6vYMMuhY332e4ZQE2DPENRhZTESf
	kOzxnKyf8LrH2BrsfvUDJlM0nz210lZZCSbFy6qtmaOImKiDhmCOWmn/7PRPRNrH5GpdY3FtA57W1
	IjSQ0itA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5VM-00000003TOn-2Ou4;
	Mon, 15 Sep 2025 09:28:12 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5VK-00000003TOL-0NXa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 09:28:11 +0000
Received: from thinkpad.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1ACA76DF;
	Mon, 15 Sep 2025 11:26:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757928411;
	bh=ig9pnFV5Dffbtj//ovQm7EUb5gnxPa3r3vIlgcADr78=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=SJBhiQjRQwwdrf/m53fDFdEAhwTMcF6ydRgT2aAJrWv7I/EEb/4aIQi/TEq3dTG1H
	 PlsG5BMP4vEJSRWvoOLKMSIOEg3BgV1nfJmw39IFksEZawT8OaT63roL4Ac0XtWEvw
	 8g1TIQ4eBsHMhwtWAibihYd5bKfP04beAcmwBn9k=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aLlRgRBztMEicEgM@kekkonen.localdomain>
References: <20250903102243.1563527-1-isaac.scott@ideasonboard.com> <20250903102243.1563527-2-isaac.scott@ideasonboard.com> <aLlRgRBztMEicEgM@kekkonen.localdomain>
Subject: Re: [PATCH v2 1/3] media: v4l: Add helper to get number of active lanes via a pad
From: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: laurent.pinchart@ideasonboard.com, rmfrfs@gmail.com, martink@posteo.de, kernel@puri.sm, mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-media@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hverkuil@kernel.org, nicolas.dufresne@collabora.com, tomi.valkeinen@ideasonboard.com, jonas@kwiboo.se, dan.scally+renesas@ideasonboard.com, m.szyprowski@samsung.com, mehdi.djait@linux.intel.com, niklas.soderlund+renesas@ragnatech.se
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Mon, 15 Sep 2025 10:28:05 +0100
Message-ID: <175792848509.11401.3410245547555092168@isaac-ThinkPad-T16-Gen-2>
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_022810_267236_FF33AFF2 
X-CRM114-Status: GOOD (  27.61  )
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

Hi Sakari,

Thank you for the review!

Quoting Sakari Ailus (2025-09-04 09:44:49)
> Hi Isaac,
>=20
> Thanks for the update.
>=20
> On Wed, Sep 03, 2025 at 11:22:40AM +0100, Isaac Scott wrote:
> > Sometimes, users will not use all of the MIPI CSI 2 lanes available when
> > connecting to the MIPI CSI receiver of their device. Add a helper
> > function that checks the mbus_config for the device driver to allow
> > users to define the number of active data lanes through the
> > get_mbus_config op.
> >=20
> > If the driver does not implement this op, fall back to using the number
> > of data lanes specified in device tree.
> >=20
> > Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-common.c | 25 +++++++++++++++++++++++++
> >  include/media/v4l2-common.h           |  1 +
> >  2 files changed, 26 insertions(+)
> >=20
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2=
-core/v4l2-common.c
> > index 6e585bc76367..8683107b3704 100644
> > --- a/drivers/media/v4l2-core/v4l2-common.c
> > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > @@ -571,6 +571,31 @@ s64 __v4l2_get_link_freq_pad(struct media_pad *pad=
, unsigned int mul,
> >       return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> >  }
> >  EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
> > +
> > +unsigned int v4l2_get_active_data_lanes(const struct media_pad *pad, u=
nsigned int dt_lanes)
>=20
> This line would benefit from being wrapped.

OK, I'll wrap it in v3.

>=20
> > +{
> > +     struct v4l2_mbus_config mbus_config =3D {};
> > +     struct v4l2_subdev *sd;
> > +     unsigned int lanes;
> > +     int ret;
> > +
> > +     sd =3D media_entity_to_v4l2_subdev(pad->entity);
> > +     ret =3D v4l2_subdev_call(sd, pad, get_mbus_config, pad->index,
> > +                            &mbus_config);
> > +     if (ret < 0 && ret !=3D -ENOIOCTLCMD)
> > +             return ret;
> > +
> > +     if (!mbus_config.bus.mipi_csi2.num_data_lanes)
> > +             return dt_lanes;
> > +
> > +     lanes =3D mbus_config.bus.mipi_csi2.num_data_lanes;
> > +
> > +     if (lanes < 0 || lanes > dt_lanes)
>=20
> lanes is unsigned int so no need to check for less than 0.
>=20
> I might just not use a local variable for this, up to you.
>=20
> > +             return -EINVAL;
> > +
> > +     return lanes;
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_get_active_data_lanes);
> >  #endif /* CONFIG_MEDIA_CONTROLLER */
> > =20
> >  /*
> > diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> > index 0a43f56578bc..3f8937260c76 100644
> > --- a/include/media/v4l2-common.h
> > +++ b/include/media/v4l2-common.h
> > @@ -584,6 +584,7 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mpla=
ne *pixfmt, u32 pixelformat,
> >       (pad, mul, div)
> >  s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> >                            unsigned int div);
>=20
> Some kernel-doc documentation would be nice.

Ah, of course, I'll include it in v3.

>=20
> > +unsigned int v4l2_get_active_data_lanes(const struct media_pad *pad, u=
nsigned int dt_lanes);
>=20
> Please wrap this, too.

Will do!

>=20
> >  #else
> >  #define v4l2_get_link_freq(handler, mul, div)                \
> >       __v4l2_get_link_freq_ctrl(handler, mul, div)
>=20
> --=20
> Kind regards,
>=20
> Sakari Ailus

Best wishes,

Isaac

