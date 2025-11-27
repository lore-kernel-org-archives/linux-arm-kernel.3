Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A5DD11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 09:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L9S1rZGl/rz9YmM+17xHKDLknXmtbmaZyBYHTmnGq6Y=; b=4IByhlRba2k/a5RDgLmlGd43nn
	09GPtfn2l0YCTmlXA3R3v116Ufs8Rd6xLfx2f1HmT2G+9ONBW0z+AHbyAJRBRFt1w1oYorQ4x56O+
	aOUwvZ/vmVb4hSpY/hnVB4CeQQNJErgr+wHZx5XVoSd1K6CFGs3LfWgUqG2L2aRxT2vkSlCyifPzw
	3dwUPOucVac3j9K+qHenbDWLVSmCXs6pY9iW8S/gSz4lpds3GmBQeuie+rxChC0TiOyDufji1FeGQ
	hOVsanarGpE3RZZXoF9nYUtJlCtgU3i80f7d2F90UGeiFjz9B6SnS2wRTbzxRDWgrlAiG6ngzBRQF
	RMNhhnnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYRs-0000000GJXq-0EN4;
	Thu, 27 Nov 2025 09:38:00 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYRp-0000000GJXM-1RKp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 09:37:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 28AF11A1DA3;
	Thu, 27 Nov 2025 09:37:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EDAD46068C;
	Thu, 27 Nov 2025 09:37:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E220102F260E;
	Thu, 27 Nov 2025 10:37:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764236273; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=L9S1rZGl/rz9YmM+17xHKDLknXmtbmaZyBYHTmnGq6Y=;
	b=As4k8cuN5pEobUrrB5p5aNhgjO75O4U+DBpJNotM5YUCxyK0GtFJZ4JzIIWdJEmCQ1PyX/
	Zp2y39HKpUoIchvF1tSu70/0a7GUdW8jtFoCOJNREtHW0x67OZXfM+cmUnVhUDoW+rzwlC
	qA3sX7z9yr4imuwTY/i/4M5dA+fAYPVgaYzJzurRGjpRcFIVx4qAz+9eFYTyryyHqHe8WU
	3vfBu/b8T96rzP4XrywexXFog2TH/83l4GEfzOouJQwTwk+0dhnDraNMm76UttUoAVNmUH
	dGQhhUfrG12gVjO74EWiTalQrmTEZa0iPtjz0M+O1hZCvSLkDvAseQCzeLQenw==
Date: Thu, 27 Nov 2025 10:37:45 +0100
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
 Schneider-Pargmann <msp@baylibre.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Louis Chauvet <louis.chauvet@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miguel Gazquez
 <miguel.gazquez@bootlin.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 02/21] dt-bindings: display: tilcdc: Add fifo-threshold
 property
Message-ID: <20251127103745.7c5d55e6@kmaincent-XPS-13-7390>
In-Reply-To: <20251127-subtle-prophetic-corgi-68aab1@kuoka>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
	<20251126-feature_tilcdc-v1-2-49b9ef2e3aa0@bootlin.com>
	<20251127-subtle-prophetic-corgi-68aab1@kuoka>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_013757_557889_A1168AFF 
X-CRM114-Status: GOOD (  25.20  )
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

On Thu, 27 Nov 2025 09:22:56 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Wed, Nov 26, 2025 at 06:35:44PM +0100, Kory Maincent (TI.com) wrote:
> > Add the fifo-threshold property to control the DMA FIFO threshold level,
> > which specifies the number of words that must be loaded before the DMA
> > FIFO becomes ready.
> >=20
> > This property is needed to support the da850-evm board configuration
> > which requires a non-default FIFO threshold value. Currently, this value
> > is specified through the deprecated ti,tilcdc,panel binding. Adding this
> > property to the tilcdc binding allows for proper configuration while
> > migrating away from the non-standard panel binding.
> >=20
> > The default value is 8 words, with valid values being powers of 2 from
> > 8 to 512.
> >=20
> > Related commit: 55da73fa7a68c ("ARM: dts: davinci: da850-evm: Increase
> > fifo threshold") =20
>=20
> Please use syntax pointed out by checkpatch. The checkpatch error (not
> even a warning) is there for reason, so we can apply filter/grep
> easily.
>=20
> >=20
> > Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> > ---
> >  Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml | 7 +++++=
++
> >  1 file changed, 7 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.ya=
ml
> > b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml index
> > 34ac1fd04d5c6..bf6d506e25e17 100644 ---
> > a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml +++
> > b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml @@ -46,6
> > +46,13 @@ properties: The maximum pixel clock that can be supported by =
the
> > lcd controller in KHz.
> > =20
> > +  fifo-threshold: =20
>=20
> Why this is not deducible from the compatible? Feels like a specific SoC
> issue.

This is indeed deductible from the compatible as ti,da850-tilcdc is only us=
e in
the related devicetree. Thanks for the pointer this will avoid adding a new=
 dt
parameter.

>=20
> Anyway, missing vendor prefix
>=20
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [8, 16, 32, 64, 128, 256, 512]
> > +    description:
> > +      Number of words loaded before the DMA fifo becomes ready. The de=
fault
> > +      value is 8. =20
>=20
> missing default and drop free form text in description.
>=20
> > +
> >    blue-and-red-wiring:
> >      enum: [straight, crossed]
> >      description:
> >=20
> > --=20
> > 2.43.0
> >  =20



--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

