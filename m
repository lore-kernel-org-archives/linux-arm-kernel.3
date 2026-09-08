Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F38C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 13:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0c6VVgpgr8QRvVK0L3AA+Ya2VGnRG3C/SeaIoCEOEIw=; b=xX0qinxPVZehlxYQlB8usWKFGa
	m654dlJENIDZQn7++xvUY+On8bOARg8QfJN3SfgJZ6udHj3gatKf0+ATvUyMQ0QtZ25zipLkATL81
	t3AHREtLd+uUs5SYwmgwO3UyJE2J8qawgPVS+b1TEUzX0XKYlg8Thve6/b3SpYDH35rxiooiCC6FK
	qyo/aKkMB/MJff2DqenFMuCouTx8D9K0GJ92s6nCZpgCIegRaJnjlDpr16O5EDYbwKypj4g4B6Ld3
	fE90Vs+WI4KC8SchMEPvRseZDLqo3gW7/0WrPtN532U5hZ3wpsiaijlM7Tuz8YNKaWcnvjC42n1MV
	RG9CL+nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vVI-000000095el-3ip5;
	Tue, 08 Sep 2026 13:04:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vVH-000000095eU-3Ozf;
	Tue, 08 Sep 2026 13:04:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DD5E2601DB;
	Tue,  8 Sep 2026 13:04:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA4F21F00A3A;
	Tue,  8 Sep 2026 13:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788872686;
	bh=0c6VVgpgr8QRvVK0L3AA+Ya2VGnRG3C/SeaIoCEOEIw=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=GME5OEfmBM3W0vV/lVcz+5iVnZEC5ckUSFlvI8uKcFRfnIi/d7yvCw33IdTcWPrOG
	 +ODsMzky9dGz8w1QvGQ90Rjxbc6478UAnrg7p0yiOWzjOSF7WU7wxuE4NUxRanh3EY
	 J5K091ChOVt841MVIvPiboxtyhgRplOqOOGj15aUxNb1vbrf5IZl/UbnwkrW5qD87Q
	 Ov23nnRh40+Y3J/7ubOvVyg/lyu1P7SFBrsi4Q6EDRPLYoKu2jm4Xv30Yk+DFrdsJn
	 XkOmt3S3WSQ7t2wPuUTZli7yc041+BiDeff9S74+zS6fP2gdhUrypH5nX4llhwjzd3
	 3Dk7FHiMKatdw==
Message-ID: <0ec40db90bd0d2ece46b185deb3c8eca@kernel.org>
Date: Tue, 08 Sep 2026 13:04:43 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v11 45/74] drm/vc4: hdmi: Propagate -EDEADLK to the top
 level
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-45-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-45-bc12954a0688@collabora.com>
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

On Tue, 1 Sep 2026 21:51:09 +0300, Cristian Ciocaltea wrote:
> drm_connector_helper_funcs.detect_ctx() is expected to propagate
> -EDEADLK so that context owners, e.g. drm_helper_probe_detect_ctx(), can
> perform the required backoff and retry.
> 
> vc4_hdmi_handle_hotplug() instead runs its own retry loop and calls
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

