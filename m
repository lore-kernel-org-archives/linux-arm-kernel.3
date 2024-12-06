Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7812AE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 14:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lXAYhpdfsf+gOIdq60uXPUI1h1U4aSY+52/5Tzkwy3o=; b=g3rNpU906xGhUdj6Yg7ZNxKMe8
	nc88PWfxLVw4nN+GSpQeUDIE9GegNubEU1DlF9/HV/WaD6gRSDeNTismL8y5FbJGpzOtA92jxYsde
	Uc8xmSbKNX1dDWp0tii82+yJzTzCj901O1tXoHIVRxheLHOwzl6QID7ABbvG1De+518KotOu2cd8O
	Fy7Qy0ckZg3BON6mUHhFrYmQFaHkPwnCHQxaFwSGThs6tPyXbFPkYAlVhAuRxlDQ7vatXx434kSN2
	/yozcJnBPxkyQpl+O4twPeqSoguOTG8vBcsUMrByvq19rZ0rzebJ/SV8EV3DjcDBteSpLOxZTvvV3
	uJKHi84g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJZS2-00000001saf-0teu;
	Fri, 06 Dec 2024 14:37:02 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJZQk-00000001sM0-21hc;
	Fri, 06 Dec 2024 14:35:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lXAYhpdfsf+gOIdq60uXPUI1h1U4aSY+52/5Tzkwy3o=; b=zGqZu5nmmiMR40kS1ag20bkZPn
	34/WeQB+p3pPf5pLsBw3pnqEJbt/Oo/WuvhzsETmFIx3NcWETcipC+hKsTXGu93XASq00fG7IiRhY
	ugoku54YtHBQCHd2dIrEF8RZto8uUUd2BPnAXualbTHQyzVf/HDdnXKEVNswMpIhJlD2+8YJWA/ZR
	w2AR0CD0BSddg0M0kJN9aiTdyRi/PwU/fPifztlnuqZVfCvzMjPIi26kxT2H2TsWf1LAD9tDN28/1
	0Kl1t9kLx7MQzvLaV4zLiQkE/kJ9RIFCW6VuRaphGb3r2RZvay3zfzCXbuZXcCfwy8zIPWpCN5DDT
	U5xMwHLA==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tJZQW-00011Y-Hy; Fri, 06 Dec 2024 15:35:28 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 rfoss@kernel.org, vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v1 00/10] Add eDP support for RK3588
Date: Fri, 06 Dec 2024 15:35:27 +0100
Message-ID: <5939852.zQ0Gbyo6oJ@diego>
In-Reply-To: <20241127075157.856029-1-damon.ding@rock-chips.com>
References: <20241127075157.856029-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_063542_512710_42E029EC 
X-CRM114-Status: GOOD (  19.68  )
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

Hi Daemon,

Am Mittwoch, 27. November 2024, 08:51:47 CET schrieb Damon Ding:
> These patchs have been tested with a 1536x2048p60 eDP panel on
> RK3588S EVB1 board, and HDMI 1080P/4K display also has been verified
> on RK3588 EVB1 board.
> 
> Patch 1~3 are the RK3588 eDP support of Rockchip analogix_dp driver.
> Patch 4   is the eDP mode support of samsung hdptx phy driver.
> Patch 5~6 are the Rk3588 eDP support of Aanalogix DP driver. Add phy
>           interfaces is to configure the HDMI/eDP TX Combo PHY.
> Patch 7~8 are the renaming of hdptxphy node. It is not only used by
>           HDMI display but also for the eDP display.
> Patch 9   is the addition of RK3588 eDP0 node.
> Patch 10  is to enable the eDP0 display on RK3588S EVB1 board.

Could you maybe also bring over functionality for real bridge-handling?
That way we'd have support for things like the dp-connector bridge.

In the 6.1 vendor-tree I've found commits
94e598190128 ("drm/rockchip: analogix_dp: Add support for external bridge")
437e0a901b14 ("drm/bridge: analogix_dp: Support split mode for bridge chain")

needing a bit of cleanup of course, but that would get rid of the driver
not handling the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag too.

With a bit of streamlining, we could maybe even get rid of the panel-part
completely, similar to how the dw-dsi controllers do it [0]


Thanks
Heiko

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c#n335
devm_drm_of_get_bridge() combines drm_of_find_panel_or_bridge()
with devm_drm_panel_bridge_add(), so indepent of it being either a
panel or other bridge, the driver below only needs to handle bridges.

> Damon Ding (10):
>   drm/rockchip: analogix_dp: Use formalized struct definition for grf
>     field
>   dt-bindings: display: rockchip: analogix-dp: Add support for RK3588
>   drm/rockchip: analogix_dp: Add support for RK3588
>   phy: phy-rockchip-samsung-hdptx: Add support for eDP mode
>   drm/bridge: analogix_dp: add support for RK3588
>   drm/bridge: analogix_dp: Add support for phy configuration.
>   dt-bindings: display: rockchip: Fix label name of hdptxphy for RK3588
>     HDMI TX Controller
>   arm64: dts: rockchip: Fix label name of hdptxphy for RK3588
>   arm64: dts: rockchip: Add eDP0 node for RK3588
>   arch64: dts: rockchip: Enable eDP0 display on RK3588S EVB1 board
> 
>  .../rockchip/rockchip,analogix-dp.yaml        |   1 +
>  .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml  |   2 +-
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  33 +-
>  .../dts/rockchip/rk3588-coolpi-cm5-evb.dts    |   2 +-
>  .../rockchip/rk3588-coolpi-cm5-genbook.dts    |   2 +-
>  .../boot/dts/rockchip/rk3588-evb1-v10.dts     |   2 +-
>  .../rk3588-friendlyelec-cm3588-nas.dts        |   2 +-
>  .../arm64/boot/dts/rockchip/rk3588-jaguar.dts |   2 +-
>  .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   |   2 +-
>  .../dts/rockchip/rk3588-orangepi-5-plus.dts   |   2 +-
>  .../boot/dts/rockchip/rk3588-rock-5b.dts      |   2 +-
>  .../boot/dts/rockchip/rk3588-tiger-haikou.dts |   2 +-
>  .../boot/dts/rockchip/rk3588s-coolpi-4b.dts   |   2 +-
>  .../boot/dts/rockchip/rk3588s-evb1-v10.dts    |  84 ++
>  .../dts/rockchip/rk3588s-indiedroid-nova.dts  |   2 +-
>  .../boot/dts/rockchip/rk3588s-nanopi-r6.dtsi  |   2 +-
>  .../boot/dts/rockchip/rk3588s-odroid-m2.dts   |   2 +-
>  .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi |   2 +-
>  .../boot/dts/rockchip/rk3588s-rock-5a.dts     |   2 +-
>  .../boot/dts/rockchip/rk3588s-rock-5c.dts     |   2 +-
>  .../drm/bridge/analogix/analogix_dp_core.c    |   8 +-
>  .../drm/bridge/analogix/analogix_dp_core.h    |   2 +
>  .../gpu/drm/bridge/analogix/analogix_dp_reg.c |  90 ++
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 112 ++-
>  .../phy/rockchip/phy-rockchip-samsung-hdptx.c | 936 +++++++++++++++++-
>  include/drm/bridge/analogix_dp.h              |   3 +-
>  26 files changed, 1206 insertions(+), 97 deletions(-)
> 
> 





