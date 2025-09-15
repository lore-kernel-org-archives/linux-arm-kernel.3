Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41AAECAC598
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 09:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QjDp9+S6caQxymZ1DUHVl4G0U+8ktS+41K6iSuzgAeI=; b=41om5rPaDq+SynofoawEuz6gPH
	rnU9vWhypsOZjnh8+bNLxwgmODDhlJXfLg5Ek2VGvw7TFOV/hUVsYwN0X1NRwx4CwCR2PzJ33PyGQ
	JTK6QvRo8KMf+YCxQ7VvdkbWmTW6YfLLJoz+x0vyPhRd5RP0pW+4l1BvwukhFV+/FFLrB/Rq1zR5q
	H6ypURwcX1B7aDx2Or3FtL1gw6E8Ly9w3BhvSxnbvJBjP9Ap8E/urDyWVvOZ7Xr6GsQO12rsr55pv
	UcI5wabxpo3G+/ZWk6loArU26B0w4mmOETA8b1Kv8AdA+jw0I+cwE/QIwJw0JiK5zlE+Hx7gzU8ep
	RAaLAfeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5TZ-00000003T4o-1fIB;
	Mon, 15 Sep 2025 09:26:21 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5TW-00000003T4G-2mI9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 09:26:19 +0000
Received: from thinkpad.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 00F396DF;
	Mon, 15 Sep 2025 11:24:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757928300;
	bh=RXgOH1ZqN+gAwFqxR0p6/Oe1YMnjPq6e68rQXfXoDnE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=I0prLoYlTTjxBdwfZo5Tp3rWZuXItvjUYWsgz9fzNvEoalSnLOHaex8wBgRPHgCkl
	 DJagsPt9DzAqfHFfJo+mYQioIDJ+5lHp60N1hr1/v/XYoxYvermjdp9voDLTF/+7d8
	 YuxZxAI15KoC8mKZUrhhT2fTlXl5k6MgmYgQD+0Y=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aLhgNP0UMAj3Cpzi@lizhi-Precision-Tower-5810>
References: <20250903102243.1563527-1-isaac.scott@ideasonboard.com> <20250903102243.1563527-4-isaac.scott@ideasonboard.com> <aLhgNP0UMAj3Cpzi@lizhi-Precision-Tower-5810>
Subject: Re: [PATCH v2 3/3] media: imx-mipi-csis: Get number of active lanes via mbus_config
From: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: laurent.pinchart@ideasonboard.com, rmfrfs@gmail.com, martink@posteo.de, kernel@puri.sm, mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-media@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hverkuil@kernel.org, nicolas.dufresne@collabora.com, sakari.ailus@linux.intel.com, tomi.valkeinen@ideasonboard.com, jonas@kwiboo.se, dan.scally+renesas@ideasonboard.com, m.szyprowski@samsung.com, mehdi.djait@linux.intel.com, niklas.soderlund+renesas@ragnatech.se
To: Frank Li <Frank.li@nxp.com>
Date: Mon, 15 Sep 2025 10:26:15 +0100
Message-ID: <175792837500.11401.10747878334767148751@isaac-ThinkPad-T16-Gen-2>
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_022618_839079_DFE4533A 
X-CRM114-Status: GOOD (  20.55  )
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

Hi Frank,

Thank you for the review!

Quoting Frank Li (2025-09-03 16:35:16)
> On Wed, Sep 03, 2025 at 11:22:42AM +0100, Isaac Scott wrote:
> > The number of lanes actively used by a MIPI CSI transmitter may differ
> > from that which is defined in device tree. As such, call on
> > v4l2_get_active_data_lanes to check if the driver reports a
>=20
> function need (), v4l2_get_active_data_lanes()
>=20
> > differing number of lanes to device tree, and use that number of active
> > lanes.
> >
> > If the number of active data lanes is invalid, or the op is not
> > supported, it will use the number of lanes defined in device tree.
>=20
> remove "it will" to keep simple.

Thanks, I'll change this in v3.

>=20
> Frank

Best wishes,

Isaac

> >
> > Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> > ---
> >  drivers/media/platform/nxp/imx-mipi-csis.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media=
/platform/nxp/imx-mipi-csis.c
> > index fc89325f2f94..985be511bcd0 100644
> > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > @@ -967,6 +967,9 @@ static int mipi_csis_s_stream(struct v4l2_subdev *s=
d, int enable)
> >       format =3D v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
> >       csis_fmt =3D find_csis_format(format->code);
> >
> > +     csis->bus.num_data_lanes =3D v4l2_get_active_data_lanes(csis->sou=
rce.pad,
> > +                                                           csis->max_d=
ata_lanes);
> > +
> >       ret =3D mipi_csis_calculate_params(csis, csis_fmt);
> >       if (ret < 0)
> >               goto err_unlock;
> > --
> > 2.43.0
> >

