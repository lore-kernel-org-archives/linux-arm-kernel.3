Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41560FF60EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 09:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+mOwPlEWznJsdsX+QILK9dyH3ZzIBD1Bu1/ULWjoDWQ=; b=3dmohMnqHMfnf3SDVZbasYN3rv
	q7Z2s9DifQrpZp2QQmV9GxGIdamSx86HcdA5H3YUap96HIX6c9l9PfipURiXKhXBr0CaFt6SLyCX2
	MYV4+BI02RUCJCOJZw1TpLMfde/omgoUo79+ei+7A3mrSgfhiZtXzGTePtJrHrosNPYSjrX4adF6c
	MWUPGQfYY8XlBTxg9z1oA3y+zxrhovQvK4b7F8/MChFNdWjwWOKfIZeJT4l1NUt6XwvR6qkDadSou
	UltVv2/oCzJGRH9gtmRZ0OVuH7e2UQapryCyi+75YMkapBIwoV/5de54Hc7XZM4LYh5HRo/L4M0r/
	H1IjY1QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7V6W-0000000CenK-1rhH;
	Tue, 31 Mar 2026 09:09:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7V6V-0000000CenA-2Lqg
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 31 Mar 2026 09:09:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+mOwPlEWznJsdsX+QILK9dyH3ZzIBD1Bu1/ULWjoDWQ=; b=NUDJcK1p2KOsbFEeCeoMKGbt/6
	+0KonEavIWRjrtBPmnWEzmtX9nSj0lPQbCh5yIhUQq4tPGVW3mhCTxHlL4KorEN8DYFeFba5ljW7q
	cvVzb6Kc4S8OgmmIK6mz8Z9nXoOaC/Jicu4TgxcnQ20YS+pfkQqroUPj28Hr7WfpWvTO++CxOz8/O
	NiACNdXXDrmYHrAwSL3/jNCzqOrioyWAhNlppI5nE0O3Vs7agLlNfd/IKPXR7iz50gfoGmNNhzaGL
	pc4Sg2/Omvbw3Pesr6HgzQsJbzzUiZ6Rb2qWMX9jxE5N6Sz0dEJK8q3YYUR1JR63YYpKm2Ixog7bH
	Lu89Nq9w==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7V6Q-0000000FUmC-3HHE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 09:09:42 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1w7V6O-0004Pv-N3; Tue, 31 Mar 2026 11:09:36 +0200
Message-ID: <f5b628f50def756da356184ff6febb11cc9aaa68.camel@pengutronix.de>
Subject: Re: [PATCH 2/3] drm: lcdif: Use dedicated set/clr registers for
 polarity/edge
From: Lucas Stach <l.stach@pengutronix.de>
To: Paul Kocialkowski <paulk@sys-base.io>, dri-devel@lists.freedesktop.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
 Krzysztof =?UTF-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>, Marco Felsch
 <m.felsch@pengutronix.de>, Liu Ying <victor.liu@nxp.com>
Date: Tue, 31 Mar 2026 11:09:35 +0200
In-Reply-To: <20260330224619.2620782-3-paulk@sys-base.io>
References: <20260330224619.2620782-1-paulk@sys-base.io>
	 <20260330224619.2620782-3-paulk@sys-base.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_100939_978916_BCCE7A1C 
X-CRM114-Status: GOOD (  17.94  )
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

Hi Paul,

Am Dienstag, dem 31.03.2026 um 00:46 +0200 schrieb Paul Kocialkowski:
> The lcdif v3 hardware comes with dedicated registers to set and clear
> polarity bits in the CTRL register. It is unclear if there is a
> difference with writing to the CTRL register directly.
>=20
> Follow the NXP BSP reference by using these registers, in case there is
> a subtle difference caused by using them.
>=20
I don't really like that patch, as it blows up what is currently a
single register access to three separate ones. If there is no clear
benefit (as in it has been shown to fix any issue), I would prefer this
code to stay as-is.

Regards,
Lucas

> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  drivers/gpu/drm/mxsfb/lcdif_kms.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lc=
dif_kms.c
> index a00c4f6d63f4..1aac354041c7 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -296,18 +296,27 @@ static void lcdif_set_formats(struct lcdif_drm_priv=
ate *lcdif,
>  static void lcdif_set_mode(struct lcdif_drm_private *lcdif, u32 bus_flag=
s)
>  {
>  	struct drm_display_mode *m =3D &lcdif->crtc.state->adjusted_mode;
> -	u32 ctrl =3D 0;
> +	u32 ctrl;
> =20
>  	if (m->flags & DRM_MODE_FLAG_NHSYNC)
> -		ctrl |=3D CTRL_INV_HS;
> +		writel(CTRL_INV_HS, lcdif->base + LCDC_V8_CTRL + REG_SET);
> +	else
> +		writel(CTRL_INV_HS, lcdif->base + LCDC_V8_CTRL + REG_CLR);
> +
>  	if (m->flags & DRM_MODE_FLAG_NVSYNC)
> -		ctrl |=3D CTRL_INV_VS;
> +		writel(CTRL_INV_VS, lcdif->base + LCDC_V8_CTRL + REG_SET);
> +	else
> +		writel(CTRL_INV_VS, lcdif->base + LCDC_V8_CTRL + REG_CLR);
> +
>  	if (bus_flags & DRM_BUS_FLAG_DE_LOW)
> -		ctrl |=3D CTRL_INV_DE;
> -	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
> -		ctrl |=3D CTRL_INV_PXCK;
> +		writel(CTRL_INV_DE, lcdif->base + LCDC_V8_CTRL + REG_SET);
> +	else
> +		writel(CTRL_INV_DE, lcdif->base + LCDC_V8_CTRL + REG_CLR);
> =20
> -	writel(ctrl, lcdif->base + LCDC_V8_CTRL);
> +	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
> +		writel(CTRL_INV_PXCK, lcdif->base + LCDC_V8_CTRL + REG_SET);
> +	else
> +		writel(CTRL_INV_PXCK, lcdif->base + LCDC_V8_CTRL + REG_CLR);
> =20
>  	writel(DISP_SIZE_DELTA_Y(m->vdisplay) |
>  	       DISP_SIZE_DELTA_X(m->hdisplay),


