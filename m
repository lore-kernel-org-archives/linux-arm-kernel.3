Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33684CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 07:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z4KnRYZbP+JppkyB6UHdCEixFKEe8lfBspS/MMvjMwc=; b=pWtdv8YGLztofjWgbAfqXZQ6KA
	MJ3M9qXBk1HZi7rtDEjjtgm2RoIEugIrJYgiZ4M0ADphjELKOxTaOk+gWRdFykKz6xioMydXPHMQG
	/RQea7ETmH4g6qtUhD8K4+NSCoS76Jk44Rc2CQbLxAAWAwqsiqeYkjwy66UuOTuBCtay6ETQW5TkC
	rsUGcaT/LQqWBNXx5WXZivoXITDcMhBhlOOnXoOPCcvt4gPl6f/erI2palG4Kvq4qILZ+jBQNk/cV
	d0J3B9AZRNF+aPblSbiAAz1xnm1ZKGx/sVjZAujISiPe0LjAEyMjilktWIJ74z+lEmtXznKeVfVEo
	ze/qjVCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPFHY-00000000ZbZ-0fYn;
	Tue, 19 May 2026 07:54:28 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPFHV-00000000ZZv-0pz7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 07:54:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 611834E42CF0;
	Tue, 19 May 2026 07:54:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22CBE606E9;
	Tue, 19 May 2026 07:54:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E4A1711AF8B49;
	Tue, 19 May 2026 09:54:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779177258; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Z4KnRYZbP+JppkyB6UHdCEixFKEe8lfBspS/MMvjMwc=;
	b=DTGxDZanSusl2R3sUqE3bN+Ehf8q0haUVgOYOc4Gk1igIrFedIqbwNaCBSCQEhBOnD9Moz
	lt1L717qNYWu/BANBxN6i3b+/HdJlRHHvO9/zCE77Tl1W0vxOlf6Dt00bbku9mewWw+EmT
	Z66UPE4QUFyBVeBnfklE+Oa+zTGJZwjfF4hMAlu+UgNievdl5lMgncjj0tZdTdCr8cIYZ/
	FOi9GSIO0j/8nS1rjU4zeRZUud7Gm+s737qGJ9zxda4GQcc/TnM1FKD8ISVMK9BWxmiASE
	GFnNEnGfgSeb7LUV5YAtKvDtkqzlgSrbvvswG8aKFJsyVCqXXfrg4YYS3fAamQ==
Message-ID: <1b19a798-bc7d-4f51-9e32-ac4b05b30648@bootlin.com>
Date: Mon, 18 May 2026 10:52:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/11] drm/hisilicon/kirin: switch to
 of_drm_get_bridge_by_endpoint()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, John Stultz <jstultz@google.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
References: <20260511-drm-bridge-alloc-getput-panel_or_bridge-v6-0-f61c9e498b3f@bootlin.com>
 <20260511-drm-bridge-alloc-getput-panel_or_bridge-v6-4-f61c9e498b3f@bootlin.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260511-drm-bridge-alloc-getput-panel_or_bridge-v6-4-f61c9e498b3f@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_005425_379387_0E2E1EAA 
X-CRM114-Status: GOOD (  16.79  )
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



On 5/11/26 18:40, Luca Ceresoli wrote:
> This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
> @panel parameter, thus using a reduced feature set of that function.
> Replace this call with the simpler of_drm_get_bridge_by_endpoint().
> 
> Since of_drm_get_bridge_by_endpoint() increases the refcount of the
> returned bridge, ensure it is put on removal. Here the bridge pointer is
> only stored in a temporary variable, so a cleanup action is enough.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
> index e80debdc4176..ab3cd309505a 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
> @@ -778,17 +778,16 @@ static int dsi_host_init(struct device *dev, struct dw_dsi *dsi)
>   static int dsi_bridge_init(struct drm_device *dev, struct dw_dsi *dsi)
>   {
>   	struct drm_encoder *encoder = &dsi->encoder;
> -	struct drm_bridge *bridge;
> +	struct drm_bridge *bridge __free(drm_bridge_put) = NULL;
>   	struct device_node *np = dsi->dev->of_node;
> -	int ret;
>   
>   	/*
>   	 * Get the endpoint node. In our case, dsi has one output port1
>   	 * to which the external HDMI bridge is connected.
>   	 */
> -	ret = drm_of_find_panel_or_bridge(np, 1, 0, NULL, &bridge);
> -	if (ret)
> -		return ret;
> +	bridge = of_drm_get_bridge_by_endpoint(np, 1, 0);
> +	if (IS_ERR(bridge))
> +		return PTR_ERR(bridge);
>   
>   	/* associate the bridge to dsi encoder */
>   	return drm_bridge_attach(encoder, bridge, NULL, 0);
> 


