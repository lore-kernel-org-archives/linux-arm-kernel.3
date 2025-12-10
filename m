Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184AFD3E76A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 18:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l98qOu+0/tY6Orese0IPL2xdfoJODXFr8iaKgobrYT0=; b=kYFWbSgBVYHZJge5zeVxw44U9m
	xNiczwQ6RPxAXIR9JDj+aKTjhQA2XRJglntpj2pN8LHZF9uKdkYza8XphBcarP7Pt5CzcL1xzqioz
	UFGQHuf+PXtcdSyfXPraHaIYbILt0QIDWJPqG9cxmTHAUw1j+EyvPUPhlvcfhy9rsPX1bjr4pr7x/
	3uk//F3xsUmC+ljzOStbRbdjZp4CzJbB/893O/buvAV4RDHcUExBwJS4HxAR9FcIPoz5TlLZ+Bapp
	XweukTl9apeSXx5ABaydGfGGQRaBIJuaJ3dEO8Ebxzg1ORuLMFOGtjA471J7d/EA0iCvtNRaIB80i
	nUnEkMog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTOhQ-0000000Fjck-0Hya;
	Wed, 10 Dec 2025 18:14:04 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTOhN-0000000FjcG-0R5x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 18:14:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CB48B1A20B2;
	Wed, 10 Dec 2025 18:13:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9D6E760714;
	Wed, 10 Dec 2025 18:13:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C3317103C8CB3;
	Wed, 10 Dec 2025 19:13:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765390437; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=l98qOu+0/tY6Orese0IPL2xdfoJODXFr8iaKgobrYT0=;
	b=fJ+jfCzl8+4tV/5a2fjeAI0hqo1ETpxNTPbTLeRkcWl+3hg9ddajcJlzgT3RjWWIkjbsTa
	T4tqLnnKAatCmuruKQGjuXAVE9e0LrCIxjrm8mXAd1/SuYg832ffC6HxVGAtXPRDd/1+Dq
	VQTVso6cfbjeA/+6fsZnkkjz3tkYOQmzYjF5t3T3fh8hmXnv7MjXuyAIsTFOWOQMQIB5ku
	H2CsRwiLKpWqq3oESdJoguxhOAmEondgANQOWNl573uWipCPUJSaPR3+WO/WniA9KT9Npo
	Kns/EKpwKZTEk9u5sMtXBkRNXC2t7+mtM73poDyR4SIxWIc8b1XHx0jiYdExuA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Dec 2025 19:13:53 +0100
Message-Id: <DEUQOGYVBYFL.39NLEZ2GBI2WT@bootlin.com>
Subject: Re: [PATCH 04/21] drm/tilcdc: Add support for DRM bus flags and
 simplify panel config
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Louis Chauvet"
 <louis.chauvet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
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
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
 <20251126-feature_tilcdc-v1-4-49b9ef2e3aa0@bootlin.com>
In-Reply-To: <20251126-feature_tilcdc-v1-4-49b9ef2e3aa0@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_101401_282015_2E0924BE 
X-CRM114-Status: GOOD (  11.87  )
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

On Wed Nov 26, 2025 at 6:35 PM CET, Kory Maincent (TI.com) wrote:
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
> Preserve FIFO threshold configurability by adding a new "fifo-threshold"
> device tree property at the display controller level, as this parameter
> varies across different display configurations in existing device trees.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Apart from the "fifo-threshold" property, which as discussed should instead
be inferred from the compatible, the patch looks good. I checked the values
which are being removed and they have all the same value in the code
defaults and all in-tree dts files.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

