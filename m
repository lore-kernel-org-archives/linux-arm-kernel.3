Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E758FFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 18:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JxJ7uz2NKEUad4NDNzwYHdXOMFyNu7eXZW+pJIBjTrE=; b=B6vf69+9uf2kHpRBt1Ga6rlKtq
	tUjFaqnX1o0AmAA7a5S6WEHAIO5M5MQ0JIe4kDVLXo7AeliNtzPgI+eZxSaeENDopIZSvGtNLp63S
	XNsMRN6UusZz1ORW/VkohVYFduvbrO13TpQSY6z5YHnnkxun7g2w7oAmM6mb0RMlq46nJuhWZcTtz
	BS4fHGtbCDmgGxuPPj7xgH6bhjj7uh95ZLj8gCLKIGRTkWDMJYPXH8YbLTM1ZBY7G3V/5v2cr074X
	oeoCThWqzpQr9DXJ42u50RDHuSr8iKN1Bt1K5EYXJgbfSel6Yo+fuQiso3ghsxfpnNMWqQXmN72lh
	++YwNtVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxcc-0000000Dvsh-1qHi;
	Mon, 04 May 2026 18:02:22 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxcZ-0000000Dvrr-46ql
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 18:02:21 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C62019C;
	Mon,  4 May 2026 20:02:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777917736;
	bh=7jbSAljiTPkKqJTgG1DeBRsKb/Ln1LpocLciBKuNSuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YnqgFdgFttmuLffMS5TgsyuM48yEk6z0WoekgzM5bIw4g9Ra0fU/7U45WjE+yVhSy
	 d6kAAxIvIcoDVvQBfJkBTFx3CVUaiSLn65JuM9fJ+Ygg2KptlJeif7Yy3cl/sq8Gw2
	 f8wz50w+ANWkaFoTopxUc54KjrvsE//tdjt5G6a8=
Date: Mon, 4 May 2026 21:02:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Simon Ser <contact@emersion.fr>,
	Harry Wentland <harry.wentland@amd.com>,
	Melissa Wen <mwen@igalia.com>,
	Sebastian Wick <sebastian.wick@redhat.com>,
	Alex Hung <alex.hung@amd.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 17/20] drm/drv: Switch skeleton to
 drm_mode_config_create_initial_state()
Message-ID: <20260504180216.GU1344263@killaraus.ideasonboard.com>
References: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
 <20260424-drm-mode-config-init-v3-17-8b68d9db0d8b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260424-drm-mode-config-init-v3-17-8b68d9db0d8b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_110220_193651_243F1C8B 
X-CRM114-Status: GOOD (  20.46  )
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

On Fri, Apr 24, 2026 at 12:18:57PM +0200, Maxime Ripard wrote:
> The driver skeleton currently recommends calling
> drm_mode_config_reset() at probe time to create the initial state.
> 
> Now that drm_mode_config_create_initial_state() exists to handle
> initial state allocation without hardware side effects, update the
> skeleton to recommend it instead.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 985c283cf59f..f537556b06a8 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -340,11 +340,13 @@ void drm_minor_release(struct drm_minor *minor)
>   *
>   *		// Further setup, display pipeline etc
>   *
>   *		platform_set_drvdata(pdev, drm);
>   *
> - *		drm_mode_config_reset(drm);
> + *		ret = drm_mode_config_create_initial_state(drm);
> + *		if (ret)
> + *			return ret;

There's one point I'm still not sure to understand properly. The
skeleton example (and the tidss driver, which you convert to the new API
in this series) both call drm_mode_config_helper_resume(). This in turn
calls drm_atomic_helper_resume(), and drm_mode_config_reset(). For
drivers that implement .atomic_create_state() instead of .reset() (such
as tidss, after its conversion in this series), drm_mode_config_reset()
will call the drm_mode_config_*_create_state() helpers, which allocate
and initialize a new state (through .atomic_create_state()), and store
that new state in the object's ->state field. Won't this leak the state
previously stored there ?

>   *
>   *		ret = drm_dev_register(drm);
>   *		if (ret)
>   *			return ret;
>   *

-- 
Regards,

Laurent Pinchart

