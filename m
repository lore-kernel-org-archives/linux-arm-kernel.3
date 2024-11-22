Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6A9D75E2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 11:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5gH9zDSzaih4pOGopejO7qtA5hzriiM7ueX3uOK70w=; b=uy4DJXI2wtDGG31TUn7UNpx3wq
	PjAx57oQ42PBrNUmqu7Xh2es5J9dl72AeL+VB4Ksc4ZjPQi72sCRq/VMFdz8CAKks48yuh5n7BGqY
	fWUT/k9GiZWc9rbyrEh8BB1keaUEtSRD2/BIbvI4jqfcve2X95DCXFj6KQHNeR3JNzzJ3S5gDidlG
	Zm8wtUczbT2O4ekmN4KHUrGbJmScvADUbBqvVPHX/rNdi2eAUda8CvM6/51bIGmM4ThFLvgij3ona
	q8d6b0+ZWroNd4XTtU8KkLsakM4ZneWuxYM2DGQyruvFN4j0Qan1ToVPMgheP6UmQ0x3R3FdN9wco
	A4iA1Wlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tERlo-00000002MVK-1m4U;
	Fri, 22 Nov 2024 11:24:16 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tERkn-00000002MI8-2x5a;
	Fri, 22 Nov 2024 11:23:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732274594; x=1763810594;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=GJHZMDI2iJk8tkr/3YVQpA8tfSP7IWp9w/OqAk1Hxik=;
  b=SNwVswVS8ELltXxLW+GcfhyIU1AJwu1vMiC7+bedffpsvCmVvN0EcQBu
   fZ/DtAUu+f6OQXTq5rTdVfAuz77/nUy9XwhkII/QMz4KsvPmM/cj9+H72
   jQCQAMFq+XS6u/rxlMpCjeC7PvWEJG+/2iVUIBLX0IKyPSTH7o9XxNG2H
   VYYHf0D2kKPg41W/X81XAC2yJZZIntKm31d4t4qdqtytuivnOWDALv7C8
   MXXBxJ4Jd9SbLtOc3Xtj17kdJth/4gFN9EsnkEPjY+hOq0NMn03Y2FHeg
   3tseGZJk9zXtwTOQgnUqDXaPUpZc0iboSTcU132+SFWuwVCYUphX6QqY8
   w==;
X-CSE-ConnectionGUID: 8khXGulmQhqLmp3FNetw7g==
X-CSE-MsgGUID: si0wVRYoQ9+5m57tRz70ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="43074367"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="43074367"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 03:23:12 -0800
X-CSE-ConnectionGUID: 6Krw7KkLR6GVn5UaKuPNZg==
X-CSE-MsgGUID: jti2QNpMQ/SNkFZUHXuDdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="90532328"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.157])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 03:23:00 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Phong LE <ple@baylibre.com>, Inki Dae
 <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King
 <linux@armlinux.org.uk>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?=
 <heiko@sntech.de>, Andy
 Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 3/7] drm/connector: implement generic HDMI codec helpers
In-Reply-To: <20241122-drm-bridge-hdmi-connector-v4-3-b4d69d6e3bd9@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241122-drm-bridge-hdmi-connector-v4-0-b4d69d6e3bd9@linaro.org>
 <20241122-drm-bridge-hdmi-connector-v4-3-b4d69d6e3bd9@linaro.org>
Date: Fri, 22 Nov 2024 13:22:53 +0200
Message-ID: <87ed33zf5e.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_032313_790394_38174011 
X-CRM114-Status: UNSURE (   9.73  )
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

On Fri, 22 Nov 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index b2b6a8e49dda46f1cb3b048ef7b28356dd3aaa4e..8ed58e482fac4662b659276e8bc17690e1fdb9b7 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -280,4 +280,9 @@ void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
>  				const struct drm_framebuffer *fb);
>  void drm_framebuffer_debugfs_init(struct drm_device *dev);
>  
> +/* drm_connector_hdmi_codec.c */
> +
> +int drm_connector_hdmi_codec_init(struct drm_connector *connector);
> +void drm_connector_hdmi_codec_cleanup(struct drm_connector *connector);
> +
>  #endif /* __DRM_INTERNAL_H__ */

Better fit in drm_crtc_internal.h or drm_crtc_helper_internal.h?

Maybe we could use an internal header inside display/. Or just 1:1
drm_foo_internal.h for every drm_foo.c to keep things simple and have
fewer interdependencies.

BR,
Jani.

-- 
Jani Nikula, Intel

