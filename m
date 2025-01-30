Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B526C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 20:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GDjyYngW/V8rZ/9s/V2isOq01Zq2IRay1Y1ld6/4IKA=; b=gysFTIjEuKoG2gYn4pGQ73q8og
	uTX6+z/I3AbUjCL4Sq420ynyw8LwvAo8Lpd6K03N4loLdCFF3uNE5ADRDm9uPpMmN9M66h5EaZ3w+
	HSlJpV+a9FTpv8mjmYe39ysLb3HR9fIJoJ+oIxVhrlftOiRVvCi2fXNlPu34tiQG3E13wV+HvYPD6
	wGrl8oiAE3KPQQXvnhUrjLw62CTSMB5f3hBR2z5ok/5H1Eyx7I/ZNag5vlvRH7lN+r5dDkAcyKA3C
	DKzvvkrtwIg4fxxlNvPfJje3uaE/tOEkxPJ/wSDBWBEWaetCYlnUKAHj30Ymp95+uWVf7OLURX5PR
	pJljTCwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdbFv-00000009ZZ6-20SS;
	Thu, 30 Jan 2025 20:35:19 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdbEb-00000009ZNU-32S4;
	Thu, 30 Jan 2025 20:33:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GDjyYngW/V8rZ/9s/V2isOq01Zq2IRay1Y1ld6/4IKA=; b=wsGxR3WotEAaoIbMjuMGP44tEV
	h30tAbAt8BGPE+tBCGMkjfFLPpQbldEY68cX2M2Asp9fLBgbgU5FRpJQ0IDxBoGSMsTjqdq6oy5vU
	gfldPf0af8xcnoO7be0Feo+EMaKxOprioif7Jr0WAbtsfZYFw25CqABkFVU4vwvL8uzz+yCl9OqOr
	zMbEXrtT3trtJRQgoV/bJHlh2NZsZxyU5mb1VGJpi9MFs2e8tVeFGgzoXKAH47doMdvX1iSPRNVNy
	QlzQu7E2NRD0ycPV8L/1GWI1wJ1DJYJy//Bh+u1sT9IfuucEfyUo1O6J6MuHEmd0yFmmUFLAjEGHE
	YAJWXOOQ==;
Received: from i53875b5c.versanet.de ([83.135.91.92] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tdbEM-0001gn-Po; Thu, 30 Jan 2025 21:33:42 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 rfoss@kernel.org, vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 dmitry.baryshkov@linaro.org, andy.yan@rock-chips.com, hjc@rock-chips.com,
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v6 08/14] drm/rockchip: analogix_dp: Add support to get panel from
 the DP AUX bus
Date: Thu, 30 Jan 2025 21:33:41 +0100
Message-ID: <3340006.44csPzL39Z@diego>
In-Reply-To: <20250123100747.1841357-9-damon.ding@rock-chips.com>
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-9-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_123357_754481_956CF4D0 
X-CRM114-Status: GOOD (  16.62  )
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

Hi Damon,

Am Donnerstag, 23. Januar 2025, 11:07:41 MEZ schrieb Damon Ding:
> Move drm_of_find_panel_or_bridge() a little later and combine it with
> component_add() into a new function rockchip_dp_link_panel(). The function
> will serve as done_probing() callback of devm_of_dp_aux_populate_bus(),
> aiding to support for obtaining the eDP panel via the DP AUX bus.
> 
> If failed to get the panel from the DP AUX bus, it will then try the other
> way to get panel information through the platform bus.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---

> @@ -450,9 +461,17 @@ static int rockchip_dp_probe(struct platform_device *pdev)
>  	if (IS_ERR(dp->adp))
>  		return PTR_ERR(dp->adp);
>  
> -	ret = component_add(dev, &rockchip_dp_component_ops);
> -	if (ret)
> -		return ret;
> +	ret = devm_of_dp_aux_populate_bus(analogix_dp_get_aux(dp->adp), rockchip_dp_link_panel);

This causes an undefined-reference error, so you probably need something like:

diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index f9cbbb40b36f..fa946a809858 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -8,6 +8,7 @@ config DRM_ROCKCHIP
        select DRM_PANEL
        select VIDEOMODE_HELPERS
        select DRM_ANALOGIX_DP if ROCKCHIP_ANALOGIX_DP
+       select DRM_DISPLAY_DP_AUX_BUS if ROCKCHIP_ANALOGIX_DP
        select DRM_DW_HDMI if ROCKCHIP_DW_HDMI
        select DRM_DW_HDMI_QP if ROCKCHIP_DW_HDMI_QP
        select DRM_DW_MIPI_DSI if ROCKCHIP_DW_MIPI_DSI




