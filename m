Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C317CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 11:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VO8foP5H4Ue/tAyEyJtS1OR2a2W/sOXrHOqpxaP+dII=; b=zXaZrskJByrfTwQlesbXzV3rqz
	iIi2CDlwenFB+yHbrkWBX82Gdw9Wa30olXKFMvubMp5j+b7EYm8DTAqaC2wtFu9QI763J7vk3WOe9
	T6JP1J7vYWcdP9XREEbjl6+lHDH+lHM8cJak3MsDPbYQhAbQVWWbPaXnJ2LWrbVkFpuOyyiqqGcsY
	6Iru+2Cc25b1Odl0VhcvTWORsYOJo6PWVV8WOw4gqlLFrNBj9oBZa26n0hAWM9pU7dKmjYnJ/nWcB
	4JnPiz/Ub/DoNcXqQ6/6KqBXoD1TYTUHxYjrf2/WIoTCiQjS3T87z+oJ74Veaww0S+Yg1Fb7DZLc2
	/mVwwAcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1kSC-00000008eim-2BsS;
	Thu, 25 Sep 2025 11:48:04 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1kS8-00000008ef7-3gdU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 11:48:03 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250925114757euoutp02c623ff34d88c3a16728d3b92a98084db~ohBRbEG-z1129711297euoutp02s
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 11:47:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250925114757euoutp02c623ff34d88c3a16728d3b92a98084db~ohBRbEG-z1129711297euoutp02s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758800877;
	bh=VO8foP5H4Ue/tAyEyJtS1OR2a2W/sOXrHOqpxaP+dII=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=SRzPHQsYIpb94X4QWwQnypT60QLIs3LABHBgpPU6U+n+nJs5ug+56/MTP7OdLzH3O
	 OMpYDFav8JCC6JX9hVPSs/ZwF/C8cg5AGP1N8Klmlt2OJ7EjPuOdJc6kETl+XP+BKS
	 +Qk7CK09EqyusWIMdlERhYDvD+ae2Mv8H4qKK/vE=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250925114756eucas1p2fb0d86888580decc59de7ca0e68b7953~ohBQ90IKZ2841528415eucas1p26;
	Thu, 25 Sep 2025 11:47:56 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250925114755eusmtip2d6fe84522c4c068a21975601caabe8dd~ohBPJeL_P1686816868eusmtip2k;
	Thu, 25 Sep 2025 11:47:54 +0000 (GMT)
Message-ID: <6c7cdef8-f912-4147-a4a2-641070a478e8@samsung.com>
Date: Thu, 25 Sep 2025 13:47:52 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH RFC 2/2] drm/bridge: samsung-dsim: move clk setup to
 enable
To: Jan Remmet <j.remmet@phytec.de>, Andrzej Hajda
	<andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
	Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Jagan Teki
	<jagan@amarulasolutions.com>, Aradhya Bhatia <a-bhatia1@ti.com>, Aradhya
	Bhatia <aradhya.bhatia@linux.dev>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, Dmitry
	Baryshkov <lumag@kernel.org>, Alexander Sverdlin
	<alexander.sverdlin@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
	upstream@lists.phytec.de
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250925-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-2-94f9f775ee62@phytec.de>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250925114756eucas1p2fb0d86888580decc59de7ca0e68b7953
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250925113632eucas1p2c49ddb268d3e4e9d3ae226b87bd89c03
X-EPHeader: CA
X-CMS-RootMailID: 20250925113632eucas1p2c49ddb268d3e4e9d3ae226b87bd89c03
References: <20250925-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-0-94f9f775ee62@phytec.de>
	<CGME20250925113632eucas1p2c49ddb268d3e4e9d3ae226b87bd89c03@eucas1p2.samsung.com>
	<20250925-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-2-94f9f775ee62@phytec.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_044801_515141_9367EA94 
X-CRM114-Status: GOOD (  18.13  )
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

On 25.09.2025 13:35, Jan Remmet wrote:
> Move the samsung_dsim_init and so samsung_dsim_enable_clock to
> samsung_dsim_atomic_enable.
>
> The base clocks may not be ready when pre_enable is called.
>
> commit c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable
> and post-disable") points out that pre_enable hook definition says that
> "The display pipe (i.e. clocks and timing signals) feeding this bridge
> will not yet be running when this callback is called".
>
> Signed-off-by: Jan Remmet <j.remmet@phytec.de>

Isn't this similar to this 
patch https://lore.kernel.org/all/20250619-samsung-dsim-fix-v1-1-6b5de68fb115@ideasonboard.com/ 
?


> ---
>   drivers/gpu/drm/bridge/samsung-dsim.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index b5dd71f6a99057d98cf15090f6081d0460836ec5..53ce3228586ac0f6abfa252b7c15d9eba459c96c 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1460,6 +1460,14 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
>   	}
>   
>   	dsi->state |= DSIM_STATE_ENABLED;
> +}
> +
> +static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
> +				       struct drm_atomic_state *state)
> +{
> +	pr_debug("%s called from %pS\n", __func__, __builtin_return_address(0));
> +	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
> +	int ret;
>   
>   	/*
>   	 * For Exynos-DSIM the downstream bridge, or panel are expecting
> @@ -1470,12 +1478,6 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
>   		if (ret)
>   			return;
>   	}
> -}
> -
> -static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
> -				       struct drm_atomic_state *state)
> -{
> -	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
>   
>   	samsung_dsim_set_display_mode(dsi);
>   	samsung_dsim_set_display_enable(dsi, true);
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


