Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C84D6554E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 11:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7rXJhv3+Qdp91MsCE8T/W/8GNjfbg1aKb91evT/R+gM=; b=OAjOgqxbtVQSsiFcu9U47eX+wd
	aqS/tp/VzhEhSsRYHy+gTHwNSIAOhoZCVn2LrIDwDwUceswK+dsE7hqTZoqOe02hNWU3FzwsIOcUj
	urkdbOKU7XJj4VP1cdPLifRHQhcJM4AOX3ekxGdNk3eWTxOfesg7S7z7xaFKwwiyjA9OQsdauwuJH
	LpqaAk3mVdDd1kv7DsFT4wZ0LGAWAZ1oJ24/KJDVsPaUH/H2ia/uGG8aMStjF4YQsKvPDFXOv6/YK
	zyajU+KrQ+U3tSx6jIfFPnadiU/ruC3+WK07A/UiQpzshzullYN3GeJEIw/3jNqd9zVJN/QtTIeOY
	+zZoMVZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVpaq-00000006hyo-1sYx;
	Wed, 17 Dec 2025 11:21:20 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVpal-00000006hxd-34Jg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 11:21:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A9562C1A596;
	Wed, 17 Dec 2025 11:20:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 239646072F;
	Wed, 17 Dec 2025 11:21:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 844CC119529B3;
	Wed, 17 Dec 2025 12:20:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765970466; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7rXJhv3+Qdp91MsCE8T/W/8GNjfbg1aKb91evT/R+gM=;
	b=qse9XG/9paLUuioJurweKejSg4mX4HikxkqxBeBa9ofGATh93137vpqHOYGYrCujih6tgU
	OxloSCrNU5QzvnBXefcA8mQXLr99qFipZ8cQUYE8iBwwdnSgLdmzcr1dVf7vvFX0ySrsQp
	eu5ERTNU3RED3iHjBz+pT0yi9+Zf6GjLcARYYnMwakEJSw4arShcw1FtC+EG7e4ubrAHWL
	CZA6uQhwaCH+OCWzu66mey9mLqD+IgJ7twR94o0eW+1/YgJyOj82sagjDnbdjfMdeiQhHD
	ex4Dkn432559Iq5uACTuel1E872z3EUTIxB67j0qUW3lrVUs81ORkyGB7oGs1A==
Date: Wed, 17 Dec 2025 12:20:54 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Russell
 King <linux@armlinux.org.uk>, Bartosz Golaszewski <brgl@bgdev.pl>, Tony
 Lindgren <tony@atomide.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Markus
 Schneider-Pargmann <msp@baylibre.com>, Bajjuri Praneeth <praneeth@ti.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Louis Chauvet
 <louis.chauvet@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Miguel Gazquez
 <miguel.gazquez@bootlin.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 01/20] dt-bindings: display: tilcdc: Convert to DT
 schema
Message-ID: <20251217122054.4682c6dd@kmaincent-XPS-13-7390>
In-Reply-To: <20251216-capable-eccentric-nightingale-b09037@quoll>
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
	<20251211-feature_tilcdc-v2-1-f48bac3cd33e@bootlin.com>
	<20251216-capable-eccentric-nightingale-b09037@quoll>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_032116_348484_C586317B 
X-CRM114-Status: GOOD (  15.96  )
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

On Tue, 16 Dec 2025 07:01:49 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Thu, Dec 11, 2025 at 05:38:45PM +0100, Kory Maincent (TI.com) wrote:
> > diff --git a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.ya=
ml
> > b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml new file
> > mode 100644 index 0000000000000..34ac1fd04d5c6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml =20
>=20
> Filename based on compatible, so for example ti,am33xx-tilcdc.yaml or
> worse case ti,tilcdc.yaml (see writing bindings and writing schema docs)

Oh indeed forgot that rule. Sorry.
=20
> > @@ -0,0 +1,96 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/tilcdc/tilcdc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: TI LCD Controller, found on AM335x, DA850, AM18x and OMAP-L138
> > +
> > +maintainers:
> > +  - Kory Maincent <kory.maincent@bootlin.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - ti,am33xx-tilcdc
> > +      - ti,da850-tilcdc
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +
> > +  ti,hwmods:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description:
> > +      Name of the hwmod associated to the LCDC
> > +
> > +  max-bandwidth: =20
>=20
> constraints? Is '1' valid? Is INT_MAX valid as well?

These maximums values are kind of software only check. See:
https://elixir.bootlin.com/linux/v6.18.1/source/drivers/gpu/drm/tilcdc/tilc=
dc_crtc.c#L846
but there are no mainline devicetree using it. We have to keep them because
they were present in the text binding.

I think we can still add a maximum constraint matching the tilcdc maximum
resolution value.

...

> Drop unused label. Generic node name, e.g. "display-controller" or
> "lcd-controller".

Ok, thank you for the review!

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

