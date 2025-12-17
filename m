Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9075DD65C4F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 14:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fzuwhM6lbndckRqp5riuGOoINfb0fnQbjhJBQ4T2P2Y=; b=jbmmyIYXwP4NUA1yUY+pVL4AqJ
	lqOmcHe5NAuM9gRZPulyeukd1CSVAyERxLhzhkFLLz0Sn2ELiw/BWItvzr/VyZcb5vhWfrUNihLWV
	qlisbLr1ScoGdrZRv4mLnGmzNGdVE5udDx7vQ50i8oWydadOjPyEQfBDvpD9eRK+zmToFXzgMf6jF
	MEcC62ywDJN9gL7LPJbm926wSnco1FHtJ+53lkoXiepkZW9Gr3ew6O1gPqB+vqbCwWwlGmhNT2dUB
	EZljAWdHzcxmPrtNmXWYBuBLpbLvS5HSrjdmlizAKTtwRIXMZonm/unSaJ0FQPqDkrUlUYxXtfwpc
	tvmpHD1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVsOq-00000006uxi-0Wvw;
	Wed, 17 Dec 2025 14:21:08 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVsOn-00000006uwD-1C7D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 14:21:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E9DC9C1A59E;
	Wed, 17 Dec 2025 14:20:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7856B6072F;
	Wed, 17 Dec 2025 14:20:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2AD0C102F0AE7;
	Wed, 17 Dec 2025 15:20:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765981256; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fzuwhM6lbndckRqp5riuGOoINfb0fnQbjhJBQ4T2P2Y=;
	b=uo/EpFVW114mOVRPBJ6qYD906sPlDPXN6KS04EyTCQk5y1TX+kbG/JzkDeugkXJ2ezYT8I
	oxd6n6GjqVr7w5osstXPY1iHWlwu9tdSbCRbaQI9oU54oVAsYQD8nOzUchcVzDMn3q/O36
	3iWM9AGXAJELmC0B3cYuHKVKoIfTVAs3ZPby1bZ4lLuvsxnOgNhGbzgChpU7CV2x1wrP6+
	rkufEsTngy2GmQKMyl2Ea7odZkZqV8Eyrzn8PCApU94zRhA2LhHiGg1Rhahcp/YOWZu1Rh
	DyaVdBflWfKg9JDLDyhcnxQgGy63jUuATOVpWltDbPwZXWFNXSZfuvojxc5LyA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:20:49 +0100
Message-Id: <DF0K3U9DB08N.2LEUCUUQ7FN0L@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 04/20] drm/tilcdc: Add support for DRM bus flags and
 simplify panel config
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, "Jyri Sarha"
 <jyri.sarha@iki.fi>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Russell King"
 <linux@armlinux.org.uk>, "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony
 Lindgren" <tony@atomide.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>
X-Mailer: aerc 0.20.1
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
 <20251211-feature_tilcdc-v2-4-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-4-f48bac3cd33e@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_062105_553255_F01912E9 
X-CRM114-Status: UNSURE (   9.10  )
X-CRM114-Notice: Please train this message.
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

On Thu Dec 11, 2025 at 5:38 PM CET, Kory Maincent (TI.com) wrote:
> Migrate CRTC mode configuration to use standard DRM bus flags in
> preparation for removing the tilcdc_panel driver and its custom
> tilcdc_panel_info structure.
>
> Add support for DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE and
> DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE flags to control pixel clock and sync
> signal edge polarity, while maintaining backward compatibility with the
> existing tilcdc panel info structure.
>
> Simplify several hardware parameters by setting them to fixed defaults
> based on common usage across existing device trees:
> - DMA burst size: 16 (previously configurable via switch statement)
> - AC bias frequency: 255 (previously panel-specific)
> - FIFO DMA request delay: 128 (previously panel-specific)
>
> These parameters show no variation in real-world usage, so hardcoding
> them simplifies the driver without losing functionality.
>
> Preserve FIFO threshold configurability by detecting the SoC type, as
> this parameter varies between AM33xx (8) and DA850 (16) platforms.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

