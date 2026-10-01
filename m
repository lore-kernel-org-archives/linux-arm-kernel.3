Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8676ECA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SU7IEV8K31VentfUkgezeCnenvWoxswvOfrHYxEVQl0=; b=Q55xlWLwG5j1QuM5LhQ+28laxk
	0oB7l1wSoTq/vGfZV/VAHWV9jbtVnKqXvwBKa4gEkx+PE3ui4eC0LVaxcKMRk3JGxkvjMduV4wXfM
	iLWQHDFjpx5drYxCsFL28p7iJm27gquF16Y78byGBjCluFE4vDJwXzzjFygUzAjoOMEWHlVTMxWvM
	LOFETA+BwYfFzj982YZrNk2SceJdlhB5a6dDhOeJGEJBQOTOz8nz11epoGSemThHDZmbtHtnE6dPH
	Qk8VMGA4BIxZkCRkg4jjppXTLOCnMeCDG7HxX4fO570+8TjyupSj802bbP00Z8sP096by+8E4rUeJ
	NeevggDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCC49-000000088hG-47sO;
	Thu, 01 Oct 2026 08:22:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCC3i-000000087go-3hEk
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 01 Oct 2026 08:22:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SU7IEV8K31VentfUkgezeCnenvWoxswvOfrHYxEVQl0=; b=fyX8Ys7jZj0QMTt5EHdLiZz4VY
	mmIB8leNlDf/v8OxTxw0XQMHIFiUqp9eNbVTeSUHeG46Dfs7m/ltwjuXfWnrRxg6oy1tiCbzaUaXh
	2z5wpqYi3ril1w0wpEh1n3wrsucCbankGWr768ZI0cP1vQjLcbiAyX26ctCC+a/jASuNkA+pM1QWY
	t9SxVILxV/S0eNcFYA5Sj6NeMuRM7m8Tmur2dfF8hE5fhBi99sDvrvR9XRM8VUWgSkVsNAkfl3Tir
	l7muXexfgCo8/iDwvtros0qUdlZovfjly76KQjidDgrtjhxpgEIA4/g1lgH46rEv2db5mBJf/f8Wp
	cXnsA0fA==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCC3f-00000004iwu-3PL5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:22:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0DB2E4E410ED;
	Thu,  1 Oct 2026 08:22:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C2B5460341;
	Thu,  1 Oct 2026 08:22:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1420E103290C1;
	Thu,  1 Oct 2026 10:22:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790842943; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SU7IEV8K31VentfUkgezeCnenvWoxswvOfrHYxEVQl0=;
	b=nJMALIU1tbooMgeAGLRs2BwuEqkgLDYowj4ggQkgLnldsk/8YLuEjRzAHIXmOof/jZcEaQ
	T7J6diupyFGSakm03gCM8vIRmqJQE8EVFg3fJBWL+rKwWX4HV/Q5SXidLYHAMRuaFAvFsF
	vS8jLNOfhY8W4QTzpqQ97fB7F7Cg7WrqQdnU/b9MOqOClfczP4vyB1uSF/jDaJ7uCjeZhv
	xkGeQ0iOxAgcwpeg3re+PQLytVEtBpn5A+9lcpzMC/eu6xx8gDPokAPeFAAPeuEfSkI0La
	P/8dzBerMm0+UT9db8wgBWRxKLUmw1fphI9jrFFXbTzH3slUjdTvLfHAX5XHmw==
Message-ID: <accaa9f4ad05ef73071e5cfb5368fcbdd394d3ab.camel@bootlin.com>
Subject: Re: [PATCH v2 5/7] drm/vc4: dpi: stop using deprecated
 drmm_of_get_bridge()
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Frank Li	 <Frank.Li@nxp.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Icenowy Zheng	
 <zhengxingda@iscas.ac.cn>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart	 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Dave
 Stevenson <dave.stevenson@raspberrypi.com>,  =?ISO-8859-1?Q?Ma=EDra?= Canal
	 <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance	
 <kernel-list@raspberrypi.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@kernel.org>, Doug Anderson <dianders@chromium.org>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Thomas Petazzoni	 <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, 	imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Date: Thu, 01 Oct 2026 10:22:13 +0200
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v2-5-6da431d8f180@bootlin.com>
References: <20260929-drm-fix-of_get_bridge-build-regression-v2-0-6da431d8f180@bootlin.com>
	 <20260929-drm-fix-of_get_bridge-build-regression-v2-5-6da431d8f180@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_092228_105707_9EDDA145 
X-CRM114-Status: GOOD (  20.76  )
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

Hi Luca,

Le mardi 29 septembre 2026 =C3=A0 15:39 +0200, Luca Ceresoli a =C3=A9crit=
=C2=A0:
> drmm_of_get_bridge() is deprecated, switch to
> of_drm_get_bridge_by_endpoint(). As of_drm_get_bridge_by_endpoint() retur=
ns
> a refcounted bridge, ensure it is put.
>=20
> drm_panel.h becomes unused, drop the include.
>=20
> Also remove a comment that is now obvious: now panels are just bridges.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> =C2=A0drivers/gpu/drm/vc4/vc4_dpi.c | 9 ++-------
> =C2=A01 file changed, 2 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.=
c
> index 53f36626a50d..5060eb463704 100644
> --- a/drivers/gpu/drm/vc4/vc4_dpi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dpi.c
> @@ -16,7 +16,6 @@
> =C2=A0#include <drm/drm_drv.h>
> =C2=A0#include <drm/drm_edid.h>
> =C2=A0#include <drm/drm_of.h>
> -#include <drm/drm_panel.h>
> =C2=A0#include <drm/drm_print.h>
> =C2=A0#include <drm/drm_probe_helper.h>
> =C2=A0#include <drm/drm_simple_kms_helper.h>
> @@ -279,16 +278,12 @@ static const struct of_device_id vc4_dpi_dt_match[]=
 =3D {
> =C2=A0	{}
> =C2=A0};
> =C2=A0
> -/* Sets up the next link in the display chain, whether it's a panel or
> - * a bridge.
> - */

The first part of the comment is not wrong, I would keep "Sets up the next =
link
in the display chain".

> =C2=A0static int vc4_dpi_init_bridge(struct vc4_dpi *dpi)
> =C2=A0{
> -	struct drm_device *drm =3D dpi->encoder.base.dev;
> =C2=A0	struct device *dev =3D &dpi->pdev->dev;
> -	struct drm_bridge *bridge;
> =C2=A0
> -	bridge =3D drmm_of_get_bridge(drm, dev->of_node, 0, 0);
> +	struct drm_bridge *bridge __free(drm_bridge_put) =3D
> +		of_drm_get_bridge_by_endpoint(dev->of_node, 0, 0);
> =C2=A0	if (IS_ERR(bridge)) {
> =C2=A0		/* If nothing was connected in the DT, that's not an
> =C2=A0		 * error.

It could make sense to go the extra mile and just move that code back into =
the
caller function, I don't see much benefit in having it in a static function
here.

Cheers,
-Paul

