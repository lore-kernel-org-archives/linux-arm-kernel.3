Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDF6C44532
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 14:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=doxlar0h1i/Mc/eyGBx3FgbrfxAmZ8ASm3b2ucZdj4Y=; b=VT4bdGJRiANSNf7s0+AiaJO4Wn
	i0Eskl3mdmzH+yhYHuRlFGSjRbNyHvIRlind3wAXMMxgG7HxfGMbJ+8yMLb9fs6p7aUKwujq2lRpn
	v3uDMnAIX+324nWj00AqX7U4g6BhZl+voQeEnRk9PcieNB5NnUES6bs5x8oOSNoj2hKG5bvx20MCL
	+nobPbDrJU1qcoJ+bLxQFS2BLTx0HC9LunuS3AiBz7aXLjEc29RcEZk1kDVR8WFVWQQPenM8gszKI
	xM8ikgyRm6ojKinkivqYx7ZywTQnem6zhuaxSzPvCemqqdwDk5G3w7JnB6X2OYs7735ARCMoTP0hJ
	HpdOCVkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBJZ-00000009dTt-38p4;
	Tue, 21 Jul 2026 14:19:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBJX-00000009dTP-3Cpu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 14:19:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1FF246001A;
	Tue, 21 Jul 2026 14:19:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC091F00A3A;
	Tue, 21 Jul 2026 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784643558;
	bh=doxlar0h1i/Mc/eyGBx3FgbrfxAmZ8ASm3b2ucZdj4Y=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=G7GRxw8WUXfAFYdaeTm340OKqVwsM3pgjKqi658oBzEJArpgcXW9knXwU8T25VR4a
	 F3cZe2hY5XwAd3TmJYfMgYC8dWlY6xPppV0vrcZ5DtsvCBggKMkHm3kApoC+9Y6Rai
	 /OteLMOyfX3s1ssPqCk9tXZTmHluhuinWGYC6hbzYOGyXb+F6KrcJBDniwNikbKUvt
	 VqFjji77T49zcZNP6armTeUrSlgk75f7nxgvBae1ADT3rjzHV6ZQmNcer8a++tJ3Y5
	 afDoLmwZQ5DzCuuG0sSsyQo02eOfhtAsRJZIgmisxac4ZtOZzS6zo7B7bCoI729Nn+
	 fDcuPhWEFPnGA==
Message-ID: <351720a5ab7640ef0239448b1f7965c4@kernel.org>
Date: Tue, 21 Jul 2026 14:19:16 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v7 4/5] drm/debugfs: Move HDMI debugfs registration to
 state helper
In-Reply-To: <20260721-scdc-link-health-v7-4-92df1b6ad5fc@collabora.com>
References: <20260721-scdc-link-health-v7-4-92df1b6ad5fc@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Daniel
 Stone" <daniel@fooishbar.org>, "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, "Hans Verkuil" <hverkuil+cisco@kernel.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Simona
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

On Tue, 21 Jul 2026 10:59:00 +0200, Nicolas Frattaroli wrote:
> The HDMI debugfs files are only useful for connectors that already make
> use of the HDMI state helpers. In addition, relying on HDMI-specific
> functions in drm_debugfs.c can lead to circular linking problems later
> down the line.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

