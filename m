Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E455DF33A79
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 14:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJOEhKeUqI/M2HsTElLEzgI9onsrGDvECDa56GzYQ6k=; b=ru0z2tOTpCAjktU+4a3ZPXvT5s
	EFEsVKTPM7Vq8h0HoxRLKAUmSjFaXKafKnzC//lWjVA6/tRpAynKw3cmOqWDI1RLCf5fFgVa6SwiY
	RJVsgLHmRUKR+vFslsjehcAXV/fSwDqdiASdli7Yh88dHk11HU0kSmfDgnjSSQdEdosM1eVkN/vew
	LJ3CQ3EPGJsdb5CmjiMv2bredgNC725Zii+rVLpp4id8Y+IwfuiFeEfxboMT8hegd5IjhT686Guv1
	dYihATp0R7LiPxZC7ILTA3NkrgY9FoDcj+LWOnGKD9IldBR979vN4uzSqL72JJdy/Khwj6Ys0wIV+
	D/ZkCMuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9yb-000000023oJ-0Pje;
	Thu, 05 Mar 2026 14:46:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9yZ-000000023ml-1f5V;
	Thu, 05 Mar 2026 14:46:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AF6386184F;
	Thu,  5 Mar 2026 14:46:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D781BC116C6;
	Thu,  5 Mar 2026 14:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772722014;
	bh=+vyyNXwbVKSALuloOGJ/u3XQdbK2QU/tneBRUrk0GPg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=Dtp4EoErGT5rmyC8XF590dGA+1fJwq3ailHWMacH5ErbUV+V1olQJF0gWKHFogu0X
	 BS6BWuhIKpEF8bh0LvV+cqOW1xT56JIqFWU6kgMkxpYrJtZIQj2zJYo4NETaHbFvir
	 H7q8e8sCROgU5De7vFaYkHpe5SBoFyZ2kXGiubH8BVWWjpCVMn6WZJrSdmBblj+JfY
	 3QJLSw282cXQGFqC9c4Yqoj8DvGpn3osMVMUdJULiALh0LhbcxoeHYNUDGXthpqT1t
	 2lJZ8L1MpOzPvXV2y/6wfRJ35EnJ/sfrhKG+Tixtl7ZwK3UmPTVA9jsaF/w6p9Xr0B
	 jpKoTIypQBWrw==
Message-ID: <0d4b2eb4691010abf43dcafb96b3694e@kernel.org>
Date: Thu, 05 Mar 2026 14:46:51 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v10 06/22] drm/display: hdmi-state-helper: Act on color
 format DRM property
In-Reply-To: <20260305-color-format-v10-6-a58c68a11868@collabora.com>
References: <20260305-color-format-v10-6-a58c68a11868@collabora.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, "Alex
 Deucher" <alexander.deucher@amd.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Andy
 Yan" <andy.yan@rock-chips.com>, =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Harry
 Wentland" <harry.wentland@amd.com>, =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Corbet" <corbet@lwn.net>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Leo
 Li" <sunpeng.li@amd.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Robert Foss" <rfoss@kernel.org>, "Rodrigo
 Siqueira" <siqueira@igalia.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>, "Sandy
 Huang" <hjc@rock-chips.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shuah
 Khan" <skhan@linuxfoundation.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Tvrtko Ursulin" <tursulin@ursulin.net>
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

On Thu, 5 Mar 2026 15:19:32 +0100, Nicolas Frattaroli wrote:
> With the introduction of the "color format" DRM property, which allows
> userspace to request a specific color format, the HDMI state helper
> should implement this.
> 
> Implement it by translating the requested drm_connector_color_format to
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

