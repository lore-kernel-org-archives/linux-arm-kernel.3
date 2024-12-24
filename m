Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8D8E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 01:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nOF8DK/NkDs2L91eWGo0OJRjfjJdjQA+q8dHhp2WoGY=; b=h+uE2qnN9AqdffmW0B/+E0iUcY
	6PD6PF0w5h6a0xdGwWThtZ3EB3707gwVNUgtP7tnNZyPpuqhcD1KsATzuXZ4yk+DjdTeJunPDVqVz
	1xWOzEHbeJN6F6pR14qtuheQAUhs2Cc60yB6+9LX+nsheka+HVy84B53sOe1zyvVfygwO9qtntY3Q
	Ilxx0rxMTc2/xp0hiuGrqcxbyHs+BaIgXr4gi8KwMHswOejK+d0qIMKhIebU/d0+W/5qQ0N8l98nh
	h8tMdABWu3nc4S8qhcbwH3gDtxoSwm8sTWZ5dDjMjEQWkQvKKRS8yOy0994MwFSmCkD/kM8u6E5kl
	yB9YmgIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPthh-0000000B0HX-37gz;
	Tue, 24 Dec 2024 01:27:21 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPtgW-0000000B0Co-2yXe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 01:26:10 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5401b7f7141so4241940e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 17:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735003567; x=1735608367; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nOF8DK/NkDs2L91eWGo0OJRjfjJdjQA+q8dHhp2WoGY=;
        b=JNVhoAkwrgEwK4SAi6PKkK7uDsgmiYtveAcOymS5jZDdVE8mtSj0trpacvwvzM0T/7
         CoLXlPPNF0O5xK7lMmx9yGw0k7H0jTN9yd2svOgrQoBp/oIBXTx5rzBySW+EOkuN/6C/
         qIHfyUWd3fGU45leU48N3puEbCbOKFYKmz8z4MNTW+gm9SjkKIMlh3jPqIk/u7sSqXNc
         RkvErjyrrpkUMFBLGPEK0MHt4FZm3MFUi1YjF/rqhwci/N1SaUDzRKpp9VT93tjbfcb8
         nZ+JYyIF3FpEo6/KmYMGUnmnwdU3IiyJs06VlMxeDm2WfjGxvZDxq81/hlFmVnjmDUQs
         jwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735003567; x=1735608367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOF8DK/NkDs2L91eWGo0OJRjfjJdjQA+q8dHhp2WoGY=;
        b=AgsjtvH3KfShvYOIPuLq+/lmu3S0oTQz0kFVv9wo12sxGbgf6KSi3r4rORZWdWEfdq
         EBc+31+64PnxbK/GNQZglC7eFATOR1dpamfOJ1P8SvJM8jMMbhUTRVVxjiDmP1iQ5+48
         DFiO8sE0C0iqEli5rJxHEGE94i7FVvWx7ju1Fedm8lGzJE5deaq9FtCeO0IQfjQd3zlD
         hvNpoVPX5Zi++ggUcMQLn/uIouhhFrbdyCEuqTOHwQu6PnuS1blLsgI/OqvICp3XXMpd
         zjeSvoL+1fL4J78xdQKDe+UZZqN49Cx6LdNOY9LphfE02jWYe8nY3HKGH41RtUpsh75M
         irMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLUYc5d8uZ1LCthdLxFWfjgXDZqkHAAqVilJK5KEw78O83yLKcfUy5UdMyn5xeW5cJi2f2x0uspyUvhpCEEY7m@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb6JMXH9iyX9b+uSQugLSwev6oW9JsknCY4p7e7L7rVBjNIWwj
	eoyS7x8sioei83j/XkhLcQia0PzgmebzVeHMVmqkQ2cQPtEqNe7Vv/y9I/DwzwU=
X-Gm-Gg: ASbGncvb0tkVkCHuX1IQE91z8VLd//ISHsSFrTxBzcxL8aqLX2e48OFcr5IpYrhzzlW
	GJnzRgzf4RcPnVJ7G3XhevLQrbOWl3BMuCZE/gt/j0PgLUThdT/3rmVnIeBKg7LZjgyGfVvFJ4O
	rZcKpbDAWpDJuG6OGB+Hg3+N64KB7qStjscA9EygxEG6g7YQp5S65Vb+UQ2Udjqw2QdLfwBaPFR
	77Hb7ZyyZeh0COrxMzvvMfyVQTAn3c8vg2K+nXia5TnoEsM5c9beTB1SBbe8aOeh+8r/jX5l9KF
	omJ5lSEhe0KvhgBCdeWwSebJIr6B2ojYOMHh
X-Google-Smtp-Source: AGHT+IFhha2IAymEp/0LSPoMPL8Vz0jJeIdZsjQiJTabJykmywUV1yX1xHj6Mzyxbed2Ac1pnbLlDA==
X-Received: by 2002:a05:6512:239b:b0:53e:44a4:34e0 with SMTP id 2adb3069b0e04-5422953306amr5601701e87.16.1735003566780;
        Mon, 23 Dec 2024 17:26:06 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832089sm1462892e87.268.2024.12.23.17.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 17:26:05 -0800 (PST)
Date: Tue, 24 Dec 2024 03:26:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, 
	Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Liu Ying <victor.liu@nxp.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Robert Foss <rfoss@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] drm/lcdif: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag
 to drm_bridge_attach
Message-ID: <6fildsf62t6mj4wg7fqq5m7biuvp7lums5n3wszqyl5f4wfdxl@2ij3i2bhse32>
References: <20241224004439.239880-1-marex@denx.de>
 <20241224004439.239880-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224004439.239880-2-marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_172608_767547_D7731F4B 
X-CRM114-Status: GOOD (  18.53  )
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

On Tue, Dec 24, 2024 at 01:42:48AM +0100, Marek Vasut wrote:
> Commit a25b988ff83f ("drm/bridge: Extend bridge API to disable connector creation")
> added DRM_BRIDGE_ATTACH_NO_CONNECTOR bridge flag and all bridges handle
> this flag in some way since then.
> Newly added bridge drivers must no longer contain the connector creation and
> will fail probing if this flag isn't set.
> 
> In order to be able to connect to those newly added bridges as well,
> make use of drm_bridge_connector API and have the connector initialized
> by the display controller.
> 
> Based on 2e87bf389e13 ("drm/rockchip: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to drm_bridge_attach")
> 
> This makes LT9611 work with i.MX8M Plus.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/gpu/drm/mxsfb/Kconfig     |  1 +
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 23 ++++++++++++++++++++++-
>  2 files changed, 23 insertions(+), 1 deletion(-)

Also please note the series at [1]. Since that time we got ycbcr420
handled properly, but handling the HDR should require DRM_BRIDGE_OP_HDMI
at least.

[1] https://lore.kernel.org/dri-devel/20241018064813.2750016-1-victor.liu@nxp.com/

-- 
With best wishes
Dmitry

