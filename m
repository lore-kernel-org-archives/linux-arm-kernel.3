Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AC6C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 08:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=owN4Uvb9g/wwDNXDyBtx8Lfi2w2RRbPY42uBD7u7orc=; b=Mt4YyDt09+tUBB3S+43xKIRNcb
	2hSM6bvOe8jYLOJ6EB5NFrjz8lxo/J8+CTaQtvExPBHSXaVHHrssx21/bk8Bf1bGLHhg//InbsluP
	Hynr6HDslx0O+cGNqsCQ246WajdWumC5yVoled0MuDCX7cFFg3qLyXptajcJjMDt+s5Lz3xboqWA+
	lweA1F5VeFypWRb7Kjo9NKsrttXvD0wiDVtzN/4Acr2XB8HnTYJUBYzWAaqsXuux1lmRAiaGSRGbt
	yjYoxINxDHUBs0i+wxJNdh9FuBbN7fALnshu84Bk79uv0S4h62Ru3GaD6Lz6r4E1yUPLcAVIMeZC6
	wZJovXYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmTjr-0000000CgCe-15tz;
	Mon, 24 Feb 2025 08:22:55 +0000
Received: from mail-m19731112.qiye.163.com ([220.197.31.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmTbF-0000000Ce3s-0lPa;
	Mon, 24 Feb 2025 08:14:03 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id bfd28778;
	Mon, 24 Feb 2025 16:13:54 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: andy.yan@rock-chips.com,
	hjc@rock-chips.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	dmitry.baryshkov@linaro.org,
	dianders@chromium.org,
	sebastian.reichel@collabora.com,
	cristian.ciocaltea@collabora.com,
	boris.brezillon@collabora.com,
	l.stach@pengutronix.de,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v7 00/15] Add eDP support for RK3588
Date: Mon, 24 Feb 2025 16:13:10 +0800
Message-Id: <20250224081325.96724-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU0dHlZMHkNPGkpNGUpKQktWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a95370514af03a3kunmbfd28778
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ORA6Mhw5FTIXHRMWGDwtETBR
	HhgaCglVSlVKTE9LSENPQ0hNTEtNVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJT09JNwY+
DKIM-Signature: a=rsa-sha256;
	b=Hvi2x/xIm/hiJkL1YeZk7qEBq3qJjxVlm2s6qU+dKNb18pWP/cGH9a5fsw9coIF3IfFeTc+WQar86Ck13J06Xxs4jMdIKCRZLr4OwZFiKqE+FlXEQtgetapjDUaWEuT57H/dLzU8SKZom/UTyokevARgSmIC+6Geh1sjoWmJq5s=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=owN4Uvb9g/wwDNXDyBtx8Lfi2w2RRbPY42uBD7u7orc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_001401_709134_BDC26C08 
X-CRM114-Status: UNSURE (   9.36  )
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

Picked from:
https://patchwork.kernel.org/project/linux-rockchip/list/?series=927765

These patchs have been tested with a 1536x2048p60 eDP panel on
RK3588S EVB1 board, and HDMI 1080P/4K display also has been verified
on RK3588 EVB1 board. Furthermore, the eDP display has been rechecked
on RK3399 sapphire excavator board.

Patch 1~6   are preparations for the RK3588 eDP support on both Analogix
            side and Rockchip side.
Patch 7~10  are to support to get panel from the DP AUX bus.
Patch 11~13 are the RK3588 Analogix DP driver support.
Patch 14    is the addition of RK3588 eDP0 node.
Patch 15    is to enable the eDP0 display on RK3588S EVB1 board.

Damon Ding (15):
  drm/rockchip: analogix_dp: Use formalized struct definition for grf
    field
  drm/rockchip: analogix_dp: Expand device data to support multiple edp
    display
  drm/bridge: analogix_dp: Add irq flag IRQF_NO_AUTOEN instead of
    calling disable_irq()
  drm/bridge: analogix_dp: Remove the unnecessary calls to
    clk_disable_unprepare() during probing
  drm/bridge: analogix_dp: Remove CONFIG_PM related check in
    analogix_dp_bind()/analogix_dp_unbind()
  drm/bridge: analogix_dp: Add support for phy configuration.
  dt-bindings: display: rockchip: analogix-dp: Add support to get panel
    from the DP AUX bus
  drm/bridge: analogix_dp: Support to get &analogix_dp_device.plat_data
    and &analogix_dp_device.aux
  drm/bridge: analogix_dp: Add support to get panel from the DP AUX bus
  drm/rockchip: analogix_dp: Add support to get panel from the DP AUX
    bus
  dt-bindings: display: rockchip: analogix-dp: Add support for RK3588
  drm/bridge: analogix_dp: Add support for RK3588
  drm/rockchip: analogix_dp: Add support for RK3588
  arm64: dts: rockchip: Add eDP0 node for RK3588
  arm64: dts: rockchip: Enable eDP0 display on RK3588S EVB1 board

 .../rockchip/rockchip,analogix-dp.yaml        |  25 ++-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  28 +++
 .../boot/dts/rockchip/rk3588s-evb1-v10.dts    |  55 +++++
 .../drm/bridge/analogix/analogix_dp_core.c    |  99 +++++----
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c |  52 +++++
 drivers/gpu/drm/rockchip/Kconfig              |   1 +
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 206 ++++++++++++++----
 include/drm/bridge/analogix_dp.h              |   7 +-
 8 files changed, 380 insertions(+), 93 deletions(-)

-- 
2.34.1


