Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1E8EDB7CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 08:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ni1GpEkzBA8hxVe1vN/TYEYrwptMW2ioUM8vhtKR/vs=; b=3svb27W0wVXDlTRSw7GdILaE+2
	9lVO3Og8UmJN3P/NLcRvODfvLS4ujsByyzl6SigHIFjFNEkREPQPVwIehRQOIIb6hMtTy0q48nN4I
	z7k9zutrCR29hephc0Xpt+f/eS7xceklOBSqy1vCsFYhTsdndDc/QqQCbV9R92HUcO0dtzGS7FYIh
	BXbbNo3y4PVtqdPLPXSkLktyBM6LvQKKB1F8rT1xa21lTWM2RJri7nUiSfOOmzkFwncFnTCcW/sSm
	9nbnOTDoa+O8LSgepSMemjFoQreDZvql0/BNo8IyQZA4z+bn9NTU71/kALprP+pQ1Jw4fEXhOaKZ8
	keNQc/CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1nX-000000069gP-2EC4;
	Tue, 07 Apr 2026 08:28:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1nW-000000069gE-36wo
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 07 Apr 2026 08:28:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ni1GpEkzBA8hxVe1vN/TYEYrwptMW2ioUM8vhtKR/vs=; b=rKaNOnknomsqW6pNoz7eTpJNjm
	Z55eqPPyEN6gsWLNiiBSbfDr4mJbikl5JT6J95W4kuSa3jPXuV6GiLjH28A9S2duwYrqlrlMybmOF
	vaYIzmDMTvzJ2DwnamIkddyjsgqr6bb4oJkh9qzanstcD9ZC2vWZrdI/zfUZwbBlz7OU+dGeKAwf1
	Wy5v/MlMJET6lpbUgFZw19vdcyK5e0lQGpoexPiV+KUSfugsJl/x+KFpMmZTrp5SboZ+IF0WuXMcB
	pS+qf8rUQOO1l3JahVfBz/dqqWKY8U7sXt7/6pdgFGq5DaxHskmwRTitb1mRutAyfLrMN1zsUllaw
	Lle/UL0w==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1nT-00000007qJ4-3aea
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 08:28:33 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1wA1nN-00086o-Og; Tue, 07 Apr 2026 10:28:25 +0200
Message-ID: <d6bbf0c23dc5cf0c6ab0375fb1d2d3f6b4579737.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] drm: lcdif: Wait for vblank before disabling DMA
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
Date: Tue, 07 Apr 2026 10:28:22 +0200
In-Reply-To: <20260402183351.3281123-3-paulk@sys-base.io>
References: <20260402183351.3281123-1-paulk@sys-base.io>
	 <20260402183351.3281123-3-paulk@sys-base.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_092831_997743_FD583DF0 
X-CRM114-Status: GOOD (  21.80  )
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

Am Donnerstag, dem 02.04.2026 um 20:33 +0200 schrieb Paul Kocialkowski:
> It is necessary to wait for the full frame to finish streaming
> through the DMA engine before we can safely disable it by removing
> the DISP_PARA_DISP_ON bit. Disabling it in-flight can leave the
> hardware confused and unable to resume streaming for the next frame.
>=20
> This causes the FIFO underrun and empty status bits to be set and
> a single solid color to be shown on the display, coming from one of
> the pixels of the previous frame. The issue occurs sporadically when
> a new mode is set, which triggers the crtc disable and enable paths.
>=20
> Setting the shadow load bit and waiting for it to be cleared by the
> DMA engine allows waiting for completion.
>=20
> The NXP BSP driver addresses this issue with a hardcoded 25 ms sleep.
>=20
> Fixes: 9db35bb349a0 ("drm: lcdif: Add support for i.MX8MP LCDIF variant")
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> Co-developed-by: Lucas Stach <l.stach@pengutronix.de>

Looks good to me. Since the co-developed tag requires a sign-off from
me, I'll add that instead of a review tag. And you might want to move
your sign-off down, as you are the one submitting the patch.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

> ---
>  drivers/gpu/drm/mxsfb/lcdif_kms.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lc=
dif_kms.c
> index a00c4f6d63f4..0d04a0028671 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -375,14 +375,23 @@ static void lcdif_disable_controller(struct lcdif_d=
rm_private *lcdif)
>  	int ret;
> =20
>  	reg =3D readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +	/* Disable the layer for DMA. */
>  	reg &=3D ~CTRLDESCL0_5_EN;
> +	/*
> +	 * It is necessary to wait for the full frame to finish streaming
> +	 * through the DMA engine before we can safely disable it by removing
> +	 * the DISP_PARA_DISP_ON bit. Disabling it in-flight can leave the
> +	 * hardware confused and unable to resume streaming for the next frame.
> +	 */
> +	reg |=3D CTRLDESCL0_5_SHADOW_LOAD_EN;
>  	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
> =20
> +	/* Wait for the frame to finish or timeout after 50 ms. */
>  	ret =3D readl_poll_timeout(lcdif->base + LCDC_V8_CTRLDESCL0_5,
> -				 reg, !(reg & CTRLDESCL0_5_EN),
> -				 0, 36000);	/* Wait ~2 frame times max */
> +				 reg, !(reg & CTRLDESCL0_5_SHADOW_LOAD_EN),
> +				 200, 50000);
>  	if (ret)
> -		drm_err(lcdif->drm, "Failed to disable controller!\n");
> +		drm_err(lcdif->drm, "Timed out waiting for final vblank!\n");
> =20
>  	reg =3D readl(lcdif->base + LCDC_V8_DISP_PARA);
>  	reg &=3D ~DISP_PARA_DISP_ON;


