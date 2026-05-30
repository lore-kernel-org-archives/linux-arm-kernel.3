Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9A6CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 11:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=koc182XcypwgblVKdeSIgVWifpWgkzVIW/22VPMmUuU=; b=j1lvRLwMYoB3MflDHAygrdSLj6
	cqKyGOMHzGnVRR3EfY9SJ+9SLdU0qlK/UUXG6K9w0cTFDTroFU7B7jVk5tr/LohM2pAp6mFXKOk+P
	ZhwcrcGEZWAC+RK2w5fNy51K7UREpFRtGO6GSQ0oqGO+8u5NtuA8mUFu6aavJ7uwEa/NcLzVkGjta
	B217rGz798OMvsd//nRjXGmIPRMi5KtvoYOqzNhrLZ7ciYr2urkmX08Z61xWuXkd+0Yl5xlALZuSk
	7kGPKwy7yhVzCFlHSkjAF7IdyA1UYUk7yJxezmP5zNYZyM3cmCR49sI91MC0xpAd8QfxG9WNQqzS9
	JRhHj8LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTHt3-00000008gGo-2ADX;
	Sat, 30 May 2026 11:29:53 +0000
Received: from out-181.mta0.migadu.com ([91.218.175.181])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTHt0-00000008gFS-1Rrt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 11:29:51 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1780140576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=koc182XcypwgblVKdeSIgVWifpWgkzVIW/22VPMmUuU=;
	b=nlm0SqO6Ux6TBklBXdGkKJEhTao7Z3+0nn5LH1tPMJo2DQt4I9eDda93iXQAfl233TfX/d
	hVWX2IQs35puA2gA1D+ARI8hH3MFSvJTWxuDWIkzPNoXRwC2WQSFA0n4560+X/4h85nI18
	PlFueIwyicAQ9W0RcsNaMC6iOjqa4B+R8xq53ok9zyh3YSzgMjjXRPKVkcIj/YlOMnMCNk
	62MqCCklM3TifYLU/NQNTnxIEcqgHhtzw/q31/dqWjLUwmYgf+atmPv3EPhVgK7+S69xsl
	NzFuQRGJsPSyKkWOCtQMPioQOMJSLywovGfbdL+Kzuoe7gEWjhsuC3VKh31DOg==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 30 May 2026 13:29:18 +0200
Message-Id: <DIVZ5UVI8BNH.2KC7WUNECAMZS@cknow-tech.com>
Cc: <kernel@collabora.com>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/2] Rockchip DRM use-after-free & null-ptr-deref
 fixes
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>, "Sandy Huang"
 <hjc@rock-chips.com>, =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Andy Yan" <andy.yan@rock-chips.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>
References: <20260327-drm-rk-fixes-v3-0-fd2e6900c08c@collabora.com>
In-Reply-To: <20260327-drm-rk-fixes-v3-0-fd2e6900c08c@collabora.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_042950_533724_F8A5F8A3 
X-CRM114-Status: GOOD (  12.99  )
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

On Sat May 30, 2026 at 1:26 PM CEST, Cristian Ciocaltea wrote:
> The first three patches in the series are fixes for use-after-free &
> null-ptr-deref related issues found in dw_dp and inno-hdmi Rockchip DRM
> drivers.
>
> The following three patches provide a few minor improvements to dw_dp
> and dw_hdmi_qp, while the remaining two address use-after-free and
> memory allocation in DW DP core library.

What's the status of this patch set?

Cheers,
  Diederik

> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Changes in v3:
> - Dropped patches 1..6,8 already applied by Heiko
> - Reworked remaining patch "drm/bridge: synopsys: dw-dp: Unregister AUX
>   channel on bridge detach" into:
>   * drm/bridge: synopsys: dw-dp: Support unregistering the AUX channel
>   * drm/rockchip: dw_dp: Release core resources
> - Link to v2: https://lore.kernel.org/r/20260310-drm-rk-fixes-v2-0-645ecf=
b43f49@collabora.com
>
> Changes in v2:
> - Fixed conflicts while rebasing onto latest drm-misc-next
> - Added two more patches:
>   * drm/bridge: synopsys: dw-dp: Unregister AUX channel on bridge detach
>   * drm/bridge: synopsys: dw-dp: Drop useless memory allocation
> - Link to v1: https://lore.kernel.org/r/20260122-drm-rk-fixes-v1-0-3942f1=
85750e@collabora.com
>
> ---
> Cristian Ciocaltea (2):
>       drm/bridge: synopsys: dw-dp: Support unregistering the AUX channel
>       drm/rockchip: dw_dp: Release core resources
>
>  drivers/gpu/drm/bridge/synopsys/dw-dp.c   |  6 ++++++
>  drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 20 +++++++++++++++++---
>  include/drm/bridge/dw_dp.h                |  1 +
>  3 files changed, 24 insertions(+), 3 deletions(-)
> ---
> base-commit: 46c31e1604d121221167cb09380de8c7d53290b9
> change-id: 20260122-drm-rk-fixes-a7622c71553e


