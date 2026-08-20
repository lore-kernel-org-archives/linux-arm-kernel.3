Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EACC5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 11:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/c60mbhcS4U8Xf5+mb+pxutuXKJgTlFQK+FGzZ5Hvz4=; b=KLKswCyn+kwNz7hSgx1vgs+ZG4
	kwahBRSXGtHIyJjSvNvVfzRnBpqRPyv0gIyE8Pib37B2/ibo6xjrFdNcsSAFgttwJaQ06jVScPvv4
	+9kgalRi6ZTOFRBUeje9TBVp5Yvgt1JiPIT0Qfol+dR8Y6Z6+vPoykcEJUFQY0HbFu5irnF1QG9GM
	Fd90dgopu1mtCNVUu2QS2YsmsfJcXjrvse/6Y6WNolHc0+WRn9/gJY9S2zfTJtVZqTyxRyrv2oOeQ
	HdLz7oOx/v7uG2FYs7tO9dpMx3ytudbCVsOtbYkE989oC27fFyd3XcpLpv7mrYTcMswhcTrhHzO7c
	8IJzZbnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0tQ-0000000BRkN-3PFs;
	Thu, 20 Aug 2026 11:25:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0tP-0000000BRjr-0gqF;
	Thu, 20 Aug 2026 11:25:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 26F4241FA3;
	Thu, 20 Aug 2026 11:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D1351F00A3D;
	Thu, 20 Aug 2026 11:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787225106;
	bh=/c60mbhcS4U8Xf5+mb+pxutuXKJgTlFQK+FGzZ5Hvz4=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=W+DnkccLOEc6tIO8oUfiNSsEn7nL4BbZyzMM0gkpESvZTwqE1AzRr4jJ9Vvfm20bt
	 UH1bmjPw8cfFwxORVQu6WFahYiAr8MQHe344cSU09qUZPolOh4Qdsob7ugBXS/Jsa5
	 gfcYFcKDJnXwpit4NFiXKv/T2PIPkymFykvLDicUU6xcLB1Trpj++/Bksy6ettMbq3
	 sSg7lzOXdDDr2tLgJqq1iKWVmSzHw7DKokvmeAJX+qZmiDZwpteum98hTChkS7CteH
	 rz/d+ndoAtWjcImdNQeC5iy0Sv7cDF6zwx9xtOIeQVy/M0/v4D0RJBedhTLINhLCXR
	 E0ehyYHNLoXEw==
Message-ID: <b413cfa2a6229fe0883d1a3116d9e88c@kernel.org>
Date: Thu, 20 Aug 2026 11:25:04 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v10 44/69] drm/vc4: hdmi: Convert to
 drmm_connector_hdmi_init()
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-44-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-44-294364b2cf15@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, "Algea
 Cao" <algea.cao@rock-chips.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Andy
 Yan" <andy.yan@rock-chips.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Daniel
 Stone" <daniels@collabora.com>, "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu Ying" <victor.liu@nxp.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Phong LE" <ple@baylibre.com>, "Raspberry
 Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert Foss" <rfoss@kernel.org>, "Samuel
 Holland" <samuel@sholland.org>, "Sandy Huang" <hjc@rock-chips.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
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

On Fri, 31 Jul 2026 19:19:51 +0300, Cristian Ciocaltea wrote:
> Switch driver over to the new drmm_connector_hdmi_init() signature. The
> vendor, product, supported_formats and max_bpc values previously passed
> as arguments are now provided through struct drm_connector_hdmi_funcs,
> together with the new supported_hdmi_ver field.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

