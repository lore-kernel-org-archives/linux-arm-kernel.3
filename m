Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0ABAD12694
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 10:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jNcvfrXTM72K7iRCwTM8Vuwyzk1BAcytFwMTCwmI/Pk=; b=uSPT/dhmZ8EsVm7JdZtxPZPB/r
	ye0DoAzi9p9lJY8qZ+n3te92wZXglzcURVScaA7QNW7Zq93yK/y4Y5DiZYTRfJHpeaYm+dePzCaQ2
	KcA8l7FPRQw/L/rgiNsLtaaLE9tvWh5J1pIf/EWRACf6oau7xRTEGeJteGyY9n5sddHMfUMKFIVYQ
	gHMa14uhXZv7VctZTBRa7we4QQ7+xT1j+4PoY2eYoWfGUHezxpgqnQC9bUzSV5KpBtTBC1cjHl7Py
	m4HllffRopbvfa5lwONbM6uezUDJVoCRpdZWh1kXIr/M4p6c4nUlZ7skiXsQxoG0MYXwo4fstEq+4
	/0PV4+sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQkR0-00000006T7B-0k6h;
	Wed, 03 Dec 2025 10:50:10 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQkQw-00000006T6e-3yoC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 10:50:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BA471C13576;
	Wed,  3 Dec 2025 10:49:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0978E60706;
	Wed,  3 Dec 2025 10:49:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C027F1192038B;
	Wed,  3 Dec 2025 11:49:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764758990; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jNcvfrXTM72K7iRCwTM8Vuwyzk1BAcytFwMTCwmI/Pk=;
	b=hllfMgf41LGgmDZYl6QO0NRnJvOIjfX+mNuzo8QgpQrEwrB2A9KO7/RJj4AkUzIupWHYNo
	HYi2+VvYwCGLecBXkEz5IpHt+1LIiNYfZoQAj3dOMjHAqJZLeLyYP03afGA1cUx16BPTvT
	AoklCt8caGs70sUepUyJ7gXYLyqzpd10VWdlQt2VQD2nA+SZxWUvXtfPIxYcK7FrLOpAyY
	mTNLpu8sWcbP/i75ydb4xq3uHDZT4NmOpWoJvYhAHBubayfqzDjsuKk17wVUCIQr3UK3sB
	h2egsWZfnjQk9mniMD93fhWbXcE8XtKwTeVXG6pUicN31mOMt+Penxk8XcfPCQ==
Date: Wed, 3 Dec 2025 11:49:41 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Swamil Jain <s-jain1@ti.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Russell
 King <linux@armlinux.org.uk>, "Bartosz Golaszewski" <brgl@bgdev.pl>, Tony
 Lindgren <tony@atomide.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, Markus
 Schneider-Pargmann <msp@baylibre.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Louis Chauvet <louis.chauvet@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miguel Gazquez
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
Subject: Re: [PATCH 00/21] Clean and update tilcdc driver to support
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Message-ID: <20251203114941.1fafd9dd@kmaincent-XPS-13-7390>
In-Reply-To: <7b8e22d1-a872-4ea0-8fce-4323d2bf81ff@ti.com>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
	<7b8e22d1-a872-4ea0-8fce-4323d2bf81ff@ti.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_025007_173949_B806B380 
X-CRM114-Status: GOOD (  29.95  )
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

On Tue, 2 Dec 2025 17:55:15 +0530
Swamil Jain <s-jain1@ti.com> wrote:

> Hi Kory,
> Thanks for the series.
>=20
> On 11/26/25 23:05, Kory Maincent (TI.com) wrote:
> > The starting point for this work was adding support for the HDMI cape:
> > https://www.seeedstudio.com/Seeed-Studio-BeagleBone-Green-HDMI-Cape.html
> > This will be sent in a later series.
> >=20
> > Initially, Miguel proposed modifying the ite-it66121 bridge to support
> > the legacy behavior without the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag:
> > https://lore.kernel.org/lkml/20250909-it66121-fix-v1-1-bc79ca83df17@boo=
tlin.com/
> > This patch was NAK'd as we don't want to add more legacy code. Maxime
> > requested that the tilcdc driver be updated to use
> > DRM_BRIDGE_ATTACH_NO_CONNECTOR instead.
> >=20
> > While working on this update, I discovered that the tilcdc driver
> > contained significant amounts of legacy code that needed cleaning.
> > Since this driver was developed alongside the tda998x driver for
> > several AM335x boards, the tda998x driver also required cleanup and
> > support for the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.
> >=20
> > This series is based on the tilcdc fix sent to mainline:
> > https://lore.kernel.org/lkml/20251125090546.137193-1-kory.maincent@boot=
lin.com/
> >=20
> > Patch 1-7: Convert tilcdc binding to YAML and remove the ti,tilcdc,panel
> > 	   sub-binding and driver
> > Patch 8-16: Clean up tilcdc driver
> > Patch 17-19: Clean up tda998x driver
> > Patch 20: Add DRM_BRIDGE_ATTACH_NO_CONNECTOR support to tda998x
> > Patch 21: Add DRM_BRIDGE_ATTACH_NO_CONNECTOR support to tilcdc
> >=20
> > Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> > ---
> > Kory Maincent (TI.com) (21):
> >        dt-bindings: display: tilcdc: Convert to DT schema
> >        dt-bindings: display: tilcdc: Add fifo-threshold property
> >        drm/tilcdc: Remove simulate_vesa_sync flag
> >        drm/tilcdc: Add support for DRM bus flags and simplify panel con=
fig
> >        ARM: dts: omap: Bind panel to panel-dpi instead of ti,tilcdc,pan=
el
> > driver dt-bindings: display: tilcdc: Remove panel binding
> >        drm/tilcdc: Remove tilcdc panel driver
> >        drm/tilcdc: Remove component framework support
> >        drm/tilcdc: Remove tilcdc_panel_info structure
> >        drm/tilcdc: Remove redundant #endif/#ifdef in debugfs code
> >        drm/tilcdc: Remove unused encoder and connector tracking arrays
> >        drm/tilcdc: Rename external_encoder and external_connector to
> > encoder and connector drm/tilcdc: Rename tilcdc_external to tilcdc_enco=
der
> >        drm/tilcdc: Remove the useless module list support
> >        drm/tilcdc: Modernize driver initialization and cleanup paths
> >        drm/tilcdc: Remove the use of drm_device private_data
> >        drm/bridge: tda998x: Remove component support
> >        drm/bridge: tda998x: Move tda998x_create/destroy into probe and
> > remove drm/bridge: tda998x: Remove useless tda998x_connector_destroy wr=
apper
> >        drm/bridge: tda998x: Add support for DRM_BRIDGE_ATTACH_NO_CONNEC=
TOR
> >        drm/tilcdc: Add support for DRM_BRIDGE_ATTACH_NO_CONNECTOR
> >=20
> >   .../devicetree/bindings/display/tilcdc/panel.txt   |  66 ---
> >   .../devicetree/bindings/display/tilcdc/tilcdc.txt  |  82 ----
> >   .../devicetree/bindings/display/tilcdc/tilcdc.yaml | 103 +++++
> >   arch/arm/boot/dts/ti/davinci/da850-evm.dts         |  26 +-
> >   arch/arm/boot/dts/ti/omap/am335x-guardian.dts      |  25 +-
> >   arch/arm/boot/dts/ti/omap/am335x-pdu001.dts        |  21 +-
> >   arch/arm/boot/dts/ti/omap/am335x-pepper.dts        |  22 +-
> >   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dts      |  25 +-
> >   arch/arm/boot/dts/ti/omap/am335x-sl50.dts          |  25 +-
> >   drivers/gpu/drm/bridge/tda998x_drv.c               | 251 ++++++------
> >   drivers/gpu/drm/tilcdc/Makefile                    |   3 +-
> >   drivers/gpu/drm/tilcdc/tilcdc_crtc.c               | 117 ++----
> >   drivers/gpu/drm/tilcdc/tilcdc_drv.c                | 456
> > +++++++-------------- drivers/gpu/drm/tilcdc/tilcdc_drv.h              =
  |
> > 88 +--- drivers/gpu/drm/tilcdc/tilcdc_encoder.c            |  93 +++++
> >   .../tilcdc/{tilcdc_external.h =3D> tilcdc_encoder.h} |   5 +-
> >   drivers/gpu/drm/tilcdc/tilcdc_external.c           | 179 --------
> >   drivers/gpu/drm/tilcdc/tilcdc_panel.c              | 408
> > ------------------ drivers/gpu/drm/tilcdc/tilcdc_panel.h              |=
  15
> > - drivers/gpu/drm/tilcdc/tilcdc_plane.c              |   2 +-
> >   drivers/gpu/drm/tilcdc/tilcdc_regs.h               |   8 +-
> >   21 files changed, 589 insertions(+), 1431 deletions(-)
> > ---
> > base-commit: 670bacfc7579bdd79a3069cfb5ab60a6a7923003 =20
>=20
> I was trying to test the patches, unable to find the base-commit, are
> you using drm-misc-next?

It is based on the tilcdc fix as explained in the cover letter.
https://lore.kernel.org/lkml/20251125090546.137193-1-kory.maincent@bootlin.=
com/
Therefore you won't be able to find this base commit hash.=20

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

