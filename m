Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF235C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 07:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RG0d/rWWwG5EWi14PZmG5qQITNqAdcjhf3I0KoA9dFs=; b=b3bA/roxQuTOSH5Jcy30pCI0mU
	5z8/PIItmJKATuUR/B1Ijw1ts5LDNIskSEKj9wTuOsx2bGjrYbCYLfok55yu/hgqxQFxfC2hHVCNo
	b3PtLqH/GCq+9xPnqOGBWowpY8twxrLi1I1Q5KbJU7vymQfSJY54VrWPKkoTpbzJZ5Ol8BiW+ucXk
	9boGZD7xGwIm+hoWO1zVU+/7OytnEUfcphQEu+sl2Xtw3+t30HMsZQu/t+dI6PXWaQ1pwHQsnKzLb
	BUUEsYc/vrpVOtWX/UeifEN73S+Lg/da8MH1/HJHGoyngIlICYAjUAwuhDbfHn1u6VpO86OK6HrGX
	rlVuwmtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8YNz-00000001CLJ-1WGB;
	Mon, 21 Sep 2026 07:24:23 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8YNn-00000001CEV-1oL0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 07:24:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C05BA1A0E7C;
	Mon, 21 Sep 2026 07:24:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7AB9F60339;
	Mon, 21 Sep 2026 07:24:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1BA8610328F4D;
	Mon, 21 Sep 2026 09:23:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789975447; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RG0d/rWWwG5EWi14PZmG5qQITNqAdcjhf3I0KoA9dFs=;
	b=CF4oYu2f2Fb/6/P7G2edz+XGRaxwUM5y+QalfFftYc0K9ACk3pKG19v1Um+gp+onLXLOAJ
	XIWebq+ZnBsUGIWQ/NZNNkbdrZLZrg9SmIbGwpb8GFep47g3S359CAIOawHvPUMBfq002u
	5YsxQvNUoAdJlltQ+8pJAMoO9OeuxcUunDnEDL25IhJ6iIvH4yM+gdd0dcHzAnw7Kf6JMb
	wffUF0B8jCFMuYKQjMW1VJ8wgJntfoU7V5WjeW6JE1H9DxBVy0+KgqXljo4rgC0CUOy6tI
	vl2QvKL5UETgKy276ScNoF4LORkAjcvyc021rRxRFh4Sb/93oVLYRy/9WfDKZg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 09:23:55 +0200
Message-Id: <DLKTC338JONX.CQ6L7JYQ4UDD@bootlin.com>
Subject: Re: [PATCH v11 14/74] drm/bridge: Fix unlocked list access in
 drm_bridge_attach()
Cc: <kernel@collabora.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-rockchip@lists.infradead.org>,
 <linux-fbdev@vger.kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Chen-Yu Tsai" <wens@kernel.org>,
 "Samuel Holland" <samuel@sholland.org>, =?utf-8?q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, "Raspberry Pi Kernel Maintenance"
 <kernel-list@raspberrypi.com>, "Raphael Gallais-Pou"
 <rgallaispou@gmail.com>, "Sandy Huang" <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "Andy Yan"
 <andy.yan@rock-chips.com>, "Algea Cao" <algea.cao@rock-chips.com>, "Daniel
 Stone" <daniels@collabora.com>, "Liu Ying" <victor.liu@nxp.com>, "Phong LE"
 <ple@baylibre.com>, "Helge Deller" <deller@gmx.de>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
 <20260901-dw-hdmi-qp-scramb-v11-14-bc12954a0688@collabora.com>
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-14-bc12954a0688@collabora.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_002411_636759_B1435120 
X-CRM114-Status: UNSURE (   9.59  )
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

On Tue Sep 1, 2026 at 8:50 PM CEST, Cristian Ciocaltea wrote:
> drm_bridge_attach() inspects bridge->list to warn about bridges being
> attached without a previous drm_bridge_add() call, but it does so
> without holding bridge_lock.
>
> The list head can be concurrently written by drm_bridge_add(),
> drm_bridge_remove() and __drm_bridge_free() while they operate on
> neighbouring entries of bridge_list or bridge_lingering_list, all of
> them under bridge_lock.  Hence the unlocked read is a data race, even
> though it is unlikely to change the outcome of list_empty() in practice.
>
> Perform the check with bridge_lock held.
>
> Fixes: 76f1a9711b83 ("drm/bridge: add warning for bridges attached withou=
t being added")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

