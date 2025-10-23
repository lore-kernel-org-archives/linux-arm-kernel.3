Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF05CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 08:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2kXj8aGC44EIUcbiGIpbSl2QJL0LMRnenYznRKbBC4=; b=xHHuGOk5nzTeSmXZdf9GqSYkaR
	C+ouJpp0cldoaFSnvMcmZ1HasKRJ6O4FHvNm6fnJQkDI6KKA3wt+wRaaM5I9A8ZsUoh2mdM8muznp
	PdPZkQwXPjHr2CSMNgmtXUUs4u/dwUfDI5pLYaQOptaBLd6SwBfdoHdqii3uqtCOC4LpeDktToz0G
	Rdj2QcquFnfHLKlc2JeUiMegqgJRxCb2I1sPZXHhhFjj9eJ7KPrLt1O75miuNtCZVmWddzBj9fe7m
	vDfrnnSFxs/b0ZQR9IzICl71EQXE5YTgLi3aBW1FLeWNrMte1U7zUiLsTB6nNe2za99nk/PcgYuAw
	bFo1MgtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqx5-00000005amK-0E6u;
	Thu, 23 Oct 2025 08:45:43 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqx2-00000005alZ-3MPo;
	Thu, 23 Oct 2025 08:45:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761209141; x=1792745141;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mska27xKT3EyztX10JDYKLSZS1LLb/NIROqYMNvXfP4=;
  b=fx/E6O7DwTsa7kkOQKUHkKZYcmfeyB4u9tqVRoLZUSFdokAb+RvsjAfA
   n1UPtnQ82PLf2WFeKyqKFpMfC0uYrjzZkMfMPY8UTRRePMadUzEbWsdUK
   bPX2YDV009lXLLT1Fdyxwzpmci/5ikoiezi/P4l7lEOBu6rvKhuXx1YC8
   ZNaH5Ta1vlvUygboqFZY8z2Clgiq3OylYm43AHtEbLPmJN5OAAhEx641K
   kk0MD4FFqkv2RVLNhMJ+l92NjDx2DMbCfpkz4Wh++uGJSThLXWyWiG8tG
   vO6Muf6mrIpUx+Pcdh+Yh1D5doDU0T86EqAEzJgljZniSjU1rNIsnX68h
   Q==;
X-CSE-ConnectionGUID: YlgD533LTeic30tncBzGyg==
X-CSE-MsgGUID: PFq+OF2HSK+uOUBgkHMXHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63276404"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63276404"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 01:45:40 -0700
X-CSE-ConnectionGUID: Ucc0EPCqSiCBkTSZJ6NNCw==
X-CSE-MsgGUID: M6DulzDDRF26JDQ0xCqgcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="183995303"
Received: from bkammerd-mobl.amr.corp.intel.com (HELO kuha.fi.intel.com) ([10.124.221.165])
  by orviesa007.jf.intel.com with SMTP; 23 Oct 2025 01:45:30 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 23 Oct 2025 11:45:29 +0300
Date: Thu, 23 Oct 2025 11:45:28 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 2/9] drm/bridge: Implement generic USB Type-C DP HPD
 bridge
Message-ID: <aPnrKFWTvpuRTyhI@kuha.fi.intel.com>
References: <20251023033009.90-1-kernel@airkyi.com>
 <20251023033009.90-3-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023033009.90-3-kernel@airkyi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_014540_875361_F257F666 
X-CRM114-Status: GOOD (  22.21  )
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

On Thu, Oct 23, 2025 at 11:30:02AM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Several USB-C controller drivers have already implemented the DP HPD
> bridge function provided by aux-hpd-bridge.c, but there are still
> some USB-C controller driver that have not yet implemented it.
> 
> This patch implements a generic DP HPD bridge based on aux-hpd-bridge.c,
> so that other USB-C controller drivers don't need to implement it again.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig                | 11 ++++
>  drivers/gpu/drm/bridge/Makefile               |  1 +
>  .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  | 51 +++++++++++++++++++
>  3 files changed, 63 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index b9e0ca85226a..9f31540d3ad8 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -33,6 +33,17 @@ config DRM_AUX_HPD_BRIDGE
>  menu "Display Interface Bridges"
>  	depends on DRM && DRM_BRIDGE
>  
> +config DRM_AUX_TYPEC_DP_HPD_BRIDGE
> +	tristate "TypeC DP HPD bridge"
> +	depends on DRM_BRIDGE && OF && TYPEC
> +	select DRM_AUX_HPD_BRIDGE
> +	help
> +	  Simple USB Type-C DP bridge that terminates the bridge chain and
> +	  provides HPD support.
> +
> +	  If the USB-C controller driver has not implemented this and you need
> +	  the DP HPD support, say "Y" or "m" here.

You don't need to depend on DRM_BRIDGE separately, but do you really
need a separate module for this in the first place?

>  config DRM_CHIPONE_ICN6211
>  	tristate "Chipone ICN6211 MIPI-DSI/RGB Converter bridge"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 245e8a27e3fc..e91736829167 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_DRM_AUX_BRIDGE) += aux-bridge.o
>  obj-$(CONFIG_DRM_AUX_HPD_BRIDGE) += aux-hpd-bridge.o
> +obj-$(CONFIG_DRM_AUX_TYPEC_DP_HPD_BRIDGE) += aux-hpd-typec-dp-bridge.o

Instead, why not just make that a part of aux-hpd-bridge
conditionally:

ifneq ($(CONFIG_TYPEC),)
        aux-hpd-bridge-y        += aux-hpd-typec-dp-bridge.o
endif


thanks,

-- 
heikki

