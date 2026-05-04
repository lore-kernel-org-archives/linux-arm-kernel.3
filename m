Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717BBCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 16:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EszjOY/2l/F2ZzlprvBpfq/tGJnSaTDI9ZdD9SfWrPc=; b=Cy/7G34L6rjNVtG8+U2kEsFKna
	Hc+pWJCxat1VAFnpVJeHRPKY/k0gmRKcsWfVQEKcd+0JP2RAK02ung947KhwFOiDKxwgwl2ouJhnE
	+sREIOV97+FU5jHkmdSMh52GW3BIAAXAMI7Ewo4W/cLpjkKgPgcJDqJLhdRLsmC7JrYHOHHoX45fX
	9mpU1rPhrAdvoOUumNvIKqPQgG8pQXEauqalty+ZR0QLiAALPtsoqFFLFKk8k3/Zr6awmzH5FKnmd
	lUOFrWJRtxPxH7dYjLvimxP4UO4kdDoxqdE6ELmhrvvSqC++tce3q5+5PJ3Xr/VGrOVhcwKWc+jRs
	Zl1CvUNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJwEw-0000000Dj80-3rgh;
	Mon, 04 May 2026 16:33:50 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJwEu-0000000Dj6r-2V50
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 16:33:49 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C3A09C;
	Mon,  4 May 2026 18:33:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777912424;
	bh=cfzmXBDD422Por2LycrwmL6gW7qKihpcCAhAXwjAaEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rUrAPYeyapt7U6A033SCkQly5hGUACZeILzTaCoo/zhWqAvQkZYig/KxXOks6nWNF
	 +mQmvYBFY1yLdCZtTJbujncTJg3f10lZ8BQDZeh+DS2omCGMjll8J4BZ43NXelpeqm
	 U3Hv9iUwLY8rJOcXjck2D40TI3gagvm3DdC9vo4A=
Date: Mon, 4 May 2026 19:33:45 +0300
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
Subject: Re: [PATCH v3 03/20] drm/atomic: Drop drm_private_obj.state
 assignment from create_state
Message-ID: <20260504163345.GH1344263@killaraus.ideasonboard.com>
References: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
 <20260424-drm-mode-config-init-v3-3-8b68d9db0d8b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260424-drm-mode-config-init-v3-3-8b68d9db0d8b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_093348_780793_EE13494F 
X-CRM114-Status: GOOD (  18.15  )
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

On Fri, Apr 24, 2026 at 12:18:43PM +0200, Maxime Ripard wrote:
> The initial intent of the atomic_create_state hook was to simply
> allocate a proper drm_private_state and return it, without any side
> effect.
> 
> However, __drm_atomic_helper_private_obj_create_state(), which most
> atomic_create_state implementations call, introduces a side effect by
> setting drm_private_obj.state to the newly allocated state.
> 
> This assignment defeats the purpose, but is also redundant since
> drm_atomic_private_obj_init(), the only call site for the
> atomic_create_state hook, will also set this pointer to the newly
> allocated state.
> 
> Drop the assignment in __drm_atomic_helper_private_obj_create_state().
> 
> Fixes: e7be39ed1716 ("drm/atomic-helper: Add private_obj atomic_create_state helper")
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index 76746ad4a1bb..875149494b00 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -729,12 +729,10 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_destroy_state);
>  void __drm_atomic_helper_private_obj_create_state(struct drm_private_obj *obj,
>  						  struct drm_private_state *state)
>  {
>  	if (state)
>  		state->obj = obj;
> -
> -	obj->state = state;
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_private_obj_create_state);
>  
>  /**
>   * __drm_atomic_helper_private_obj_duplicate_state - copy atomic private state
> 

-- 
Regards,

Laurent Pinchart

