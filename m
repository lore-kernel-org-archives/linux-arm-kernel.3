Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8C9FF60EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 09:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yBa55x+eDkLPYmvcV3HzSQlWcdr6NjMybrjZK6jkWt8=; b=qC5aKN0hQ0MNG5Jnou1Xo+/KJZ
	ZQj+8afW2s2pJe2ZxpLnIupNJodYnw/ztHtvCfuwnm9TZ0MjMq+GSOVPV5NzrkdeYrhxjagvkzXd9
	7BV5r3nIaO+aBNLETju+mXZyqQvrN53rGV/91M8a5CtHJ5kX2PQkjsYKj1kVfVwyN+iwgwD2jvxnX
	zIMfDVJPmltu3xLZWS1nYRtwEBzorCU11hIiX/aT1tD1qgJXpEuIBjjzI2WIJ9E9ro0CpD8hh8oeE
	bFMLfF2XJCzgY8PGb9hFw/x9AnhpN8xNgMXnNINKnAyIr9hZZwNF2SKVPiFDfdxANkB+llF5fek3U
	UiyV+EOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7VAo-0000000CfO0-2eMI;
	Tue, 31 Mar 2026 09:14:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7VAm-0000000CfN0-3mee
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 31 Mar 2026 09:14:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yBa55x+eDkLPYmvcV3HzSQlWcdr6NjMybrjZK6jkWt8=; b=FgbBZzzGBJZe+hkQRXbvzWM4ZW
	c0+1cSZELZWCToGSHxVWpOoXo0SeaDp5vvpyCfF928f8CmgqutSHs6xCgAElM7SaBn827X7O4m5lP
	T52NU+3oEvMR5B5Ge8WqguL596M7mARCeTwGz36idR7HprqBSTFoi8sOlB+F0YixOBHJWhVmoLXkE
	nH8lRqjSunuCKleod83wbCWMUdtgluHgVKktZ3Q4ufPJFgK9lho7zD5FN2HdDarI3kFNkIi9hIaug
	U1zRGhjluXsdwdIThzcv32dLKEQ/zY1HAiUVcKeAfBEtE+XtQJVbaFm6i+3YOye5XPwn4Qvdi0MiF
	B9J4uJoQ==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7VAj-0000000FVKa-3fK0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 09:14:07 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1w7VAh-0004po-K9; Tue, 31 Mar 2026 11:14:03 +0200
Message-ID: <3305c7ec621987a30043f274b2705f739bddd497.camel@pengutronix.de>
Subject: Re: [PATCH 3/3] drm: lcdif: Wait for vblank before disabling DMA
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
Date: Tue, 31 Mar 2026 11:14:01 +0200
In-Reply-To: <20260330224619.2620782-4-paulk@sys-base.io>
References: <20260330224619.2620782-1-paulk@sys-base.io>
	 <20260330224619.2620782-4-paulk@sys-base.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_101406_077724_26D6AAAF 
X-CRM114-Status: GOOD (  22.09  )
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

Am Dienstag, dem 31.03.2026 um 00:46 +0200 schrieb Paul Kocialkowski:
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
> ---
>  drivers/gpu/drm/mxsfb/lcdif_kms.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lc=
dif_kms.c
> index 1aac354041c7..7dce7f48d938 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -393,6 +393,22 @@ static void lcdif_disable_controller(struct lcdif_dr=
m_private *lcdif)
>  	if (ret)
>  		drm_err(lcdif->drm, "Failed to disable controller!\n");
> =20
You can drop this no-op poll above...

> +	/*
> +	 * It is necessary to wait for the full frame to finish streaming
> +	 * through the DMA engine before we can safely disable it by removing
> +	 * the DISP_PARA_DISP_ON bit. Disabling it in-flight can leave the
> +	 * hardware confused and unable to resume streaming for the next frame.
> +	 */
> +	reg =3D readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +	reg |=3D CTRLDESCL0_5_SHADOW_LOAD_EN;
> +	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +
.. then setting the shadow load enable bit can be merged with the
access clearing the DMA enable bit.

> +	ret =3D readl_poll_timeout(lcdif->base + LCDC_V8_CTRLDESCL0_5,
> +				 reg, !(reg & CTRLDESCL0_5_SHADOW_LOAD_EN),
> +				 0, 36000);	/* Wait ~2 frame times max */

I know this is just a copy from the existing poll, but I don't think
the busy looping makes a lot of sense. I guess relaxing the poll by a
100us or even 200us wait between checks wouldn't hurt.

> +	if (ret)
> +		drm_err(lcdif->drm, "Failed to disable controller!\n");
> +
>  	reg =3D readl(lcdif->base + LCDC_V8_DISP_PARA);
>  	reg &=3D ~DISP_PARA_DISP_ON;
>  	writel(reg, lcdif->base + LCDC_V8_DISP_PARA);


