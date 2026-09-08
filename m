Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139C2C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 13:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGTtaq+6H/MylUW1RWg3sjvRgbOJMdbhBr1FvgmlBNM=; b=nwJzdFbL6LeJXqnPtOTSwB3Iv5
	V9B31f5BFmaKoME5Z4DC/WYJBcKi1qUDUDPL58FQYebsHQnVJ57ZFcVOVeA6MsgqpNYvcRh6YU2mU
	rCl14K1JBWgruaGFVQJDTAL3KDskJSWNDMGZZ6V4zyF01kwY+p09SCela7Q/pdZxmfhpmFGD7LKVl
	uyq51Lc1fbhIP8kLMVVEd9/o5/GiIMrZgLXYYJSmOjoRV8+YWw02B249QigiiINWjPuqzhQVy4o/S
	kFJgBvyidOmyzuAYIkNcJII+K+vzx6caEqm9ruybqV39S1R/WEUabUf4oCzc3T5iVKfsLa385Qzan
	mus98tzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vVs-000000095oe-18GR;
	Tue, 08 Sep 2026 13:05:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vVm-000000095o7-3rJY;
	Tue, 08 Sep 2026 13:05:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 09CFB601F6;
	Tue,  8 Sep 2026 13:05:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 038CC1F00A3A;
	Tue,  8 Sep 2026 13:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788872717;
	bh=aGTtaq+6H/MylUW1RWg3sjvRgbOJMdbhBr1FvgmlBNM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=BaRrzSMAn8EfjT4wRWhWrmfDz3x8XeYQnqZBLLwgqh1oJ1Oc4pdvbE5XJoSjByxhY
	 2wvb+OFrl2a3PjTSpfVjroAfOBcmdBcjr2C/uLiDV6NXhYvHfwc3Ogfeu6T8HxwhVE
	 bgQkr067DWEIH4gYyjiZT6x5mozingz+yPwOfUlDIdVfasy+7VJBL9+qedyEzH2x2N
	 yhABRXMH7nDhhHoGKyOKtybXt6WT1qOJjcX95PUXYlIPpQ8ueJo3Brozfj2WA3T6E0
	 DylCu8/1RdTxJE85P/L4lVXfXnEJixtF20gT6+i25aXRiULJt0200kBuvjyVG0F3lK
	 TSpNFZUQvLO6w==
Message-ID: <0d05dad937047c8c8e18df7d5a92f89f@kernel.org>
Date: Tue, 08 Sep 2026 13:05:14 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v11 47/74] drm/vc4: hdmi: Convert to common HDMI 2.0
 scrambling infrastructure
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-47-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-47-bc12954a0688@collabora.com>
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

On Tue, 1 Sep 2026 21:51:11 +0300, Cristian Ciocaltea wrote:
> Replace driver local scrambling logic with the newly introduced common
> HDMI 2.0 scrambling support:
> 
> - Advertise source-side scrambling capability by setting supported HDMI
>   version based on the variant's max_pixel_clock.
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

