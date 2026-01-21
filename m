Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E915D26296
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 14:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJAdXppBbAOIvtuneW6gr8WXXxU/lyeSburTzUqxCrI=; b=HQVki/nCBoVwbdv/PHwsPhCiDH
	FDt7rrU/rX/WxxOzWWbFoRUu/i+UZvfyqaG9MW+HQHTdOFuvd5j9WV4wVieD27M7LRzHdm2DVOGDU
	rN3t7QDLpY1ZGPqphsokIYNtm5tu22ALiEo6dUUf51RBr7khJu9N078kAHzUiXgIsS2TEDa7qUtOn
	sHH4vGuulgrTc+hmx0FLnI+ET9nJPyTLMqsrfZjZc+IA66FipaSm1lUbLPUthFqD8IH1ipHjvmIAj
	1/HhUp7CgrWeX/XCYqWTAq7yOsOdXIMIuLTdz0dZ0ky/B+T5csgtaRVyoOB0Iq4IJGS7aG5IwZcYQ
	0+sHu+xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viYyQ-00000005ZiL-34H8;
	Wed, 21 Jan 2026 14:14:18 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viYyN-00000005Zh3-1sXi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 14:14:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 865D44E421C5;
	Wed, 21 Jan 2026 14:14:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 557D86070A;
	Wed, 21 Jan 2026 14:14:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D14E119B152E;
	Wed, 21 Jan 2026 15:13:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769004847; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jJAdXppBbAOIvtuneW6gr8WXXxU/lyeSburTzUqxCrI=;
	b=CbFfAUW26FQeqLMmADKrfn042P8OpRUkcoMywRGcVRQIj4RPFkNsJqohbnCTLqUNRPcShc
	xrAByGcR11i0cK/s3YHc5Id0v+RBcxzTg/Rt7noXa6pfUp47lVbD0Y73jbQPiBOw/LATgm
	xQe8+jFuvMqKhOWM9jw1aPohA9PcK3peRIsp4DawVDHQPorffVc0ZkOxet4OUwPBy1JVUw
	wwnSB9YHi5LBBUEgClaqJyJxhQuaJF15p+qRbGoXGchAJ7DfIcHdZWJMZWQHsYBbX8a/j+
	jZW5pEi7kHlrdkhP5aWWSwbBod6XxTP32pLCM25qscz8Pee2tDeokCbEFsSaBg==
Date: Wed, 21 Jan 2026 15:13:56 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
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
Subject: Re: [PATCH v4 05/25] drm/tilcdc: Convert legacy panel binding via
 DT overlay at boot time
Message-ID: <20260121151356.14d88273@bootlin.com>
In-Reply-To: <20260116-feature_tilcdc-v4-5-2c1c22143087@bootlin.com>
References: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
	<20260116-feature_tilcdc-v4-5-2c1c22143087@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_061415_665847_3DF14721 
X-CRM114-Status: GOOD (  16.40  )
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

Hi Kory,

On Fri, 16 Jan 2026 18:02:05 +0100
"Kory Maincent (TI.com)" <kory.maincent@bootlin.com> wrote:

> To maintain backward compatibility while removing the deprecated
> tilcdc_panel driver, add a tilcdc_panel_legacy subdriver that converts
> the legacy "ti,tilcdc,panel" devicetree binding to the standard
> panel-dpi binding at early boot.
> 
> The conversion uses an embedded device tree overlay that is applied and
> modified during subsys_initcall. The process:
> 
> - Apply embedded overlay to create a tilcdc-panel-dpi node with
>   port/endpoint connections to the LCDC
> - Copy all properties from the legacy panel node to the new
>   tilcdc-panel-dpi node
> - Copy display-timings from the legacy panel
> - Convert legacy panel-info properties (invert-pxl-clk, sync-edge) to
>   standard display timing properties (pixelclk-active, syncclk-active)
> - Disable the legacy panel by removing its compatible property to
>   prevent the deprecated driver from binding
> 
> The result is a standard tilcdc-panel-dpi node with proper endpoints and
> timing properties, allowing the DRM panel infrastructure to work with
> legacy devicetrees without modification.
> 
> Other legacy panel-info properties are not migrated as they consistently
> use default values across all mainline devicetrees and can be hardcoded
> in the tilcdc driver.
> 
> This feature is optional via CONFIG_DRM_TILCDC_PANEL_LEGACY and should
> only be enabled for systems with legacy devicetrees containing
> "ti,tilcdc,panel" nodes.
> 
> Suggested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Link: https://lore.kernel.org/all/1d9a9269-bfda-4d43-938b-2df6b82b9369@ideasonboard.com/
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> ---

Looks good to me.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

