Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B34C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 09:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6r6FK2ldE1DBGZWHW8Lq4ye4RQylsVurmE4OZ7oMsQ0=; b=UNLWXSN/6/GXM4mWlJBm3pu6GT
	f8SAZztYqL2DHe1p286M2F8v44Hyihqf5G7CykciVJu1Y79K4CX88OJDrIBHsicjCRgY2yBYZaj5w
	Veo05enB7wXYsFdD4l9C/Xlz03qUpX761acH5GqyAxc37KIyGsyWKEID7FglQ5cjC96fxKhevdrow
	omioeAk5XeLl6UBuJ4+psjNK7Sg33Avg+0sVzry0BnPLAHgq3dr9BDPgRxTYBOh408Khv4I3Qe8KQ
	85z5YsHKv4TCJpDgjt6bGJsBZd4KnrMHA1ifq1n2BnG3nuLqrqo73dFxDSRkdt2wmj7+nNky7efqZ
	m8LfZgLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sVy-00000008gdB-1yPp;
	Tue, 08 Sep 2026 09:53:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sVw-00000008gcF-3TRG;
	Tue, 08 Sep 2026 09:53:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0035E601DB;
	Tue,  8 Sep 2026 09:53:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF4A91F00A3A;
	Tue,  8 Sep 2026 09:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788861194;
	bh=6r6FK2ldE1DBGZWHW8Lq4ye4RQylsVurmE4OZ7oMsQ0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=OQbJYS0rq9/0PwrUixs0rFOKNvMTlvZZCW23RMMNGRHPBMRueu9MZhAuDL4efqHe0
	 hqrHWz0AajIufXy7KYlkHMH5brbbMvpOpDjPGPu/PPLhODkAFDiwh1WaGDhX3+MBhO
	 6s3MJuwY78ik25i6qfF+dEcyA3Bly9+gQfA30IfypvbRfTWly3Fx7x964behRnKRUj
	 1V1lscDB/WzhbkUoqcJGXqegCCXQ2M7sO7q3E+1wOnSgLtF2DVIgw6Uvp0uaX3Rh6M
	 /Txn44sovOu2LlPxavCj5WqAashE/DLsXsRqXSSIrtv/mgRFC7NWY2ceAyoNzA7v+G
	 IdqC8b2NwgYVw==
Message-ID: <b906ecb04f597dcc08e7343588d14015@kernel.org>
Date: Tue, 08 Sep 2026 09:53:11 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v11 25/74] drm/display: bridge_connector: Switch to
 .force_ctx() connector helper
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-25-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-25-bc12954a0688@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, "Algea
 Cao" <algea.cao@rock-chips.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Andy
 Yan" <andy.yan@rock-chips.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Daniel
 Stone" <daniels@collabora.com>, "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Helge Deller" <deller@gmx.de>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu Ying" <victor.liu@nxp.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Phong LE" <ple@baylibre.com>, "Raphael
 Gallais-Pou" <rgallaispou@gmail.com>, "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Sandy
 Huang" <hjc@rock-chips.com>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Tue, 1 Sep 2026 21:50:49 +0300, Cristian Ciocaltea wrote:
> Turn drm_bridge_connector_force() into a .force_ctx() implementation and
> hand the acquire context over to
> drm_atomic_helper_connector_hdmi_force_ctx(), so that the HDMI connector
> framework can reset the CRTC to recover the SCDC state when the sink
> reconnects while the display pipeline is active.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

