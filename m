Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE23C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 21:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6WzCje76QLUKJGbmYoeUe7d9zKFda9oGc8+kEK4a04=; b=RC8qOeG1gWp6cf/CgWKfP4y4Bt
	da5l8n4nnUeU82FU467l/8zD+ed6OGvMYdy3e2R+plGUY+ha9c7JDO2IJTZWbCNT+abgOLyK0JsOX
	i9GvxF8IaichwBlyTeBA6lGIjoOBy8uAr/3ngIpLoZIn4+nVLwEmhflDUNWJLBu5KQraNJExhYNzF
	T0P95VT37Pgu2hs/S+9sYLxCT209T7OWO+6zQh6JqZYIERrEE8rtZ+zszMi72nMZDEd8PSYe6C7sY
	WGud3V5G/MMmMF/GEAXluVAlEnwp0X/nfdr1jzBMUkih+bS7bJ/otnHUJLZOaIYn+9yqpKxcUiV8P
	PxPUoP6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpa4F-00000006KFW-2pqs;
	Tue, 04 Mar 2025 21:44:48 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpYuH-00000006BwF-2hdi;
	Tue, 04 Mar 2025 20:30:26 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1741120223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a6WzCje76QLUKJGbmYoeUe7d9zKFda9oGc8+kEK4a04=;
	b=jNP4ReSawiAxad9womJccr4tfSjzlhZUJA6DV3kWGJXSysytY4Z8oqIOu2KElbzgCtxThe
	Hb6obA+e0Qo/eYo2+zpV+mtx40sUxmEqUnAw4mQxJbez7q10pXKoybJIO9Uu2fYNmla3cE
	PDPzlUbH2X+2eWAHvki/b8nLITpLoAopv5K8ASny7u2n7w253EIR3hZZPTyz/t/zEY2hvK
	1h4mrF8gHB7qXOgkGIyyPIFUWoBghSgDu13Y9Jz18RqL63V6sJvR3FyqOKdUZrOXV6xRnT
	RG5VgCo8Voq1kDCl3iZs+gL4BxgzMADdzke5argxV/fGYQPeGQ58inZobpDDaQ==
Date: Tue, 04 Mar 2025 21:30:22 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, quentin.schulz@cherry.de, Heiko Stuebner
 <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v3 1/3] drm/rockchip: lvds: move pclk preparation in with
 clk_get
In-Reply-To: <20250304124418.111061-2-heiko@sntech.de>
References: <20250304124418.111061-1-heiko@sntech.de>
 <20250304124418.111061-2-heiko@sntech.de>
Message-ID: <041c5f0e2371817a27577bd0989b9dca@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_123025_837429_90F481FF 
X-CRM114-Status: UNSURE (   9.84  )
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

Hello Heiko,

On 2025-03-04 13:44, Heiko Stuebner wrote:
> diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c
> b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> index 385cf6881504..ecfae8d5da89 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> @@ -448,15 +448,13 @@ struct drm_encoder_helper_funcs
> px30_lvds_encoder_helper_funcs = {
>  static int rk3288_lvds_probe(struct platform_device *pdev,
>  			     struct rockchip_lvds *lvds)
>  {
> -	int ret;
> -
>  	lvds->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(lvds->regs))
>  		return PTR_ERR(lvds->regs);
> 
> -	lvds->pclk = devm_clk_get(lvds->dev, "pclk_lvds");
> +	lvds->pclk = devm_clk_get_prepared(lvds->dev, "pclk_lvds");
>  	if (IS_ERR(lvds->pclk)) {
> -		DRM_DEV_ERROR(lvds->dev, "could not get pclk_lvds\n");
> +		DRM_DEV_ERROR(lvds->dev, "could not get or prepare pclk_lvds\n");

I'm wondering why this patch isn't replacing deprecated DRM
logging macros with their preferred successors in a couple of
places, just like what the patch 2/3 from this series does?

