Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3902CCD5823
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 09:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=izEt2/WHjpbUY6bvrm2DFgvpbob63v2XG6b5/OiY5fc=; b=R9W55uBm/Lo/ZTnRUXwzCZW3By
	q4/EHa4DTmh7e34LKemboXsS2V7gOOKejWwU08sxAjl1mYbL4nNhTTzG8gXkS7LETpjwk3yIrM/XD
	KP31jWYdjBPI28D244bz+yJCsllKIeBRW+3mXxrcD+YlrlbW3ITs7eT2MI07u8hU3hL4uty3cjXhf
	w0epgRhbjNIhlF8jSP5eQCXRAO1mkgXX5FXyS7ed0b3BGHusrWKUXMqCIKbfpC1Rm7pI5joEFohFc
	hB5oXIpGTqg7O8QmgJ+Jbc91I7Hb4Xho9IuYWmrSlKi5sfBM6uotIqv+WVs684CO1IwP+Su58yIoY
	gV35tQrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQIB-0000000EcHW-27zH;
	Wed, 07 Jan 2026 09:57:27 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQI9-0000000EcF4-0b5V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 09:57:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B70CC1A26DC;
	Wed,  7 Jan 2026 09:57:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 88429606F8;
	Wed,  7 Jan 2026 09:57:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7BC0103C870F;
	Wed,  7 Jan 2026 10:57:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767779842; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=izEt2/WHjpbUY6bvrm2DFgvpbob63v2XG6b5/OiY5fc=;
	b=2UzXf6HcDzAgbztIJOykxawHaptLE25s9Qc4dGZepcyM+1O6as1FwDlGlxF8q1micYDkff
	7bEKF3deZbVQX/7P7NDrMGD1+0+65WOFYpO/i4BrS4U6YdUeRazLG35r8Hca7NKoi8wBJo
	40RXHmUlCEO7ELu9SUIhiGLhcKW9KkAwmNkBsG8Zguj4NHDwcZL2x0uNKK/GAqHBePss3u
	7cjdQxtDhsvYllsXWbFa9/E7jKJliP1IEV8j44ADSBZB51q+SVNvV0/99LDACYipr5vr5M
	vNZAhYLEw9FSdhyjtqWuG10meoqdFiOZsl7nL3SzPnKFxAf7AFpwrgzo2y6kDw==
Date: Wed, 7 Jan 2026 10:57:11 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Andrew Davis <afd@ti.com>
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
 Schneider-Pargmann <msp@baylibre.com>, Bajjuri Praneeth <praneeth@ti.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Louis Chauvet
 <louis.chauvet@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Miguel Gazquez
 <miguel.gazquez@bootlin.com>, Herve Codina <herve.codina@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-omap@vger.kernel.org>
Subject: Re: [PATCH v3 05/22] drm/tilcdc: Convert legacy panel binding via
 DT overlay at boot time
Message-ID: <20260107105711.695a9c12@kmaincent-XPS-13-7390>
In-Reply-To: <897ee11b-442c-4d09-95fa-f3cb9cec612b@ti.com>
References: <20260106-feature_tilcdc-v3-0-9bad0f742164@bootlin.com>
	<20260106-feature_tilcdc-v3-5-9bad0f742164@bootlin.com>
	<897ee11b-442c-4d09-95fa-f3cb9cec612b@ti.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_015725_323151_7DF09D07 
X-CRM114-Status: GOOD (  15.74  )
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

On Tue, 6 Jan 2026 13:38:37 -0600
Andrew Davis <afd@ti.com> wrote:

> On 1/6/26 11:42 AM, Kory Maincent (TI.com) wrote:
> > To maintain backward compatibility while removing the deprecated
> > tilcdc_panel driver, add a tilcdc_panel_legacy subdriver that converts
> > the legacy "ti,tilcdc,panel" devicetree binding to the standard
> > panel-dpi binding at early boot.

...

> > +	dtbo_start =3D __dtbo_tilcdc_panel_legacy_begin;
> > +	dtbo_size =3D __dtbo_tilcdc_panel_legacy_end -
> > +		    __dtbo_tilcdc_panel_legacy_begin;
> > +
> > +	ret =3D of_overlay_fdt_apply(dtbo_start, dtbo_size, &ovcs_id, NULL);
> > +	if (ret)
> > +		return ret; =20
>=20
> Looking over the users of `of_overlay_fdt_apply()` they all seem
> to start with a begin and end address, then have to convert to start
> and size. I wonder if this function should be converted to just take
> begin and end addresses instead.. (not a problem for this series, just
> thinking out loud).

Indeed, I think you are right.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

