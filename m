Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A1DE83833
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 20:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ngboZP6RIhPLTK4sHHipZMO6vB+HpttFiw7t3wOgM8g=; b=37jbJSAsBUM7qervLf4Ksk+yuk
	qlsd1th6+gzZ3ufwzirpkq/feXGE2QgvRn4mnZCUWhRdHpUzlpgEHpg/4M9BVZO4x99Jxc364c7Vc
	01hHrztNwaJgBGg6VZCR3ybqXwPg9CviQy5wDL+L/odQqvUEqkn+ihkbm++eoQlXFnKXIKbKRiSJ4
	VLoyTL7PR6ntTnLyFq+143eysM9XQkLufEKkAgC2FxTQAGlCvXF+LZVRkihST7p2dXLuf5pNyW8xo
	ZzLjLVSId/Q+3jz78JY8d9fg4z77c6kbDNOe72kkiUZxElIEDjZbMxdotLNm7kObfS5bOeL97iH22
	6yXyDCvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs5Kl-00000007GAc-3ShL;
	Mon, 16 Feb 2026 20:36:43 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs5Kg-00000007GA9-3C2d;
	Mon, 16 Feb 2026 20:36:38 +0000
Message-ID: <e80c212c-9220-4621-8b21-5ce382ed92e5@infradead.org>
Date: Mon, 16 Feb 2026 12:36:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 20/20] drm/bridge: Document bridge chain format
 selection
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-doc@vger.kernel.org
References: <20260216-color-format-v8-0-5722ce175dd5@collabora.com>
 <20260216-color-format-v8-20-5722ce175dd5@collabora.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260216-color-format-v8-20-5722ce175dd5@collabora.com>
Content-Type: text/plain; charset=UTF-8
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



On 2/16/26 5:01 AM, Nicolas Frattaroli wrote:
> The bridge chain format selection behaviour was, until now,
> undocumented. With the addition of the "color format" DRM property, it's
> not sufficiently complex enough that documentation is warranted,
> especially for driver authors trying to do the right thing.
> 
> Add a high-level overview of how the process is supposed to work, and
> mention what the display driver is supposed to do if it wants to make
> use of this functionality.
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  Documentation/gpu/drm-kms-helpers.rst |  6 ++++++
>  drivers/gpu/drm/drm_bridge.c          | 39 +++++++++++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
> index 781129f78b06..47c4f593cf9d 100644
> --- a/Documentation/gpu/drm-kms-helpers.rst
> +++ b/Documentation/gpu/drm-kms-helpers.rst
> @@ -181,6 +181,12 @@ Bridge Operations
>  .. kernel-doc:: drivers/gpu/drm/drm_bridge.c
>     :doc: bridge operations
>  
> +Bridge Chain Format Selection
> +-----------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_bridge.c
> +   :doc: bridge chain format selection
> +
>  Bridge Connector Helper
>  -----------------------
>  
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 36a5158f0554..93ef52c37e2c 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -198,6 +198,45 @@
>   * driver.
>   */
>  
> +/**
> + * DOC: bridge chain format selection
> + *
> + * A bridge chain, from display output processor to connector, may contain
> + * bridges capable of converting between bus formats on their inputs, and
> + * output formats on their outputs. For example, a bridge may be able to convert
> + * from RGB to YCbCr 4:4:4, and pass through YCbCr 4:2:0 as-is, but not convert
> + * from RGB to YCbCr 4:2:0. This means not all input formats map to all output
> + * formats.
> + *
> + * Further adding to this, a desired output color format, as specified with the
> + * "color format" DRM property, might not correspond to what the display driver
> + * should set at its output 1:1. The bridge chain it feeds into may only be able

Preferably put "1:1" after "might not correspond".

> + * to reach the desired output format, if a conversion from a different starting
> + * format is performed.
> + *
> + * To deal with this complexity, the recursive bridge chain bus format selection
> + * logic starts with the last bridge in the chain, usually the connector, and
> + * then recursively walks the chain of bridges backwards to the first bridge,
> + * trying to find a path.
> + *
> + * For a display driver to work in such a scenario, it should read the first
> + * bridge's bridge state to figure out which bus format the chain resolved to.
> + * If the first bridge's input format resolved to %MEDIA_BUS_FMT_FIXED, then its
> + * output format should be used.
> + *
> + * Special handling is done for HDMI as it relates to format selection. Instead
> + * of directly using the "color format" DRM property for bridge chains that end
> + * in HDMI bridges, the bridge chain format selection logic will trust the logic
> + * that set the HDMI output format. For the common HDMI state helper
> + * functionality, this means that %DRM_COLOR_FORMAT_ENUM_AUTO will allow
> + * fallbacks to YCBCr 4:2:0 if the bandwidth requirements would otherwise be too
> + * high but the mode and connector allow it.
> + *
> + * For bridge chains that do not end in an HDMI bridge,
> + * %DRM_COLOR_FORMAT_ENUM_AUTO will be satisfied with the first output format on
> + * the last bridge for which it can find a path back to the first bridge.
> + */
> +
>  /* Protect bridge_list and bridge_lingering_list */
>  static DEFINE_MUTEX(bridge_lock);
>  static LIST_HEAD(bridge_list);
> 

Thanks.
-- 
~Randy


