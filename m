Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91D2C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 10:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lLXPPK6HZnhjRu30hi0LrwQfdstf2dQNmG/Lde/uOWM=; b=E5KNI7hAdJCyRTO8XSTyyOhGI/
	M4MXBhteU1lCXE2euLp+hNIKmEi7Yu7UQLXsfgQ9rhCcnhqaTFAmNrQD3PzLahQIn0VQ60MXFJagQ
	ufPg/r1XtSblH0fcqTal/Y1DcfcHf2rtNGFHutGxxC+gjJ7NOLWNePVHP0rHbf7Xz8cxNNR43HGZc
	H82LBI6RYb/6YdwGyzb8a21o+ldx106GxTZzsTEKrWgbFFenw/UXt8RnThRG1eRt5WLATczIWTwea
	6Eab8OR1h0fGA49v/j1YhUMCak+lZEQUZUo+7xilDgS8DREnV072V3SboLqFHYYNrz+VGwRAXChMx
	9992nCxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trabh-00000002I4x-3jtq;
	Mon, 10 Mar 2025 10:43:37 +0000
Received: from mail-m49244.qiye.163.com ([45.254.49.244])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1traa0-00000002HdW-1BhV;
	Mon, 10 Mar 2025 10:41:54 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id dc1881fc;
	Mon, 10 Mar 2025 18:41:46 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: andy.yan@rock-chips.com,
	hjc@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
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
Subject: [PATCH v8 00/13] Add eDP support for RK3588
Date: Mon, 10 Mar 2025 18:41:01 +0800
Message-Id: <20250310104114.2608063-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkhLQlYfQ0hLGUpDH01JSENWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEtLTE
	5VSktLVUtZBg++
X-HM-Tid: 0a957fa57bc003a3kunmdc1881fc
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OU06HRw6GjICCCMfSjoYPT4e
	NzhPFDJVSlVKTE9KTUtISEtDTEtLVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJSU5JNwY+
DKIM-Signature: a=rsa-sha256;
	b=Ne1sjB72m8GlZHHq8D0kOPJ82+bx3HtiAzX0u7DXfYBwIzSyLB/KggtBK3YnavILVsalpf7wTM9KpH5lrVbwsuaJrhExWhUYOstp1YQI84ftUKLh5Resssmpk2cnHJd+enAMs2I5yGT+qXEjBOeSbT0CQ3onhcGjOX3NhhbSUtQ=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=lLXPPK6HZnhjRu30hi0LrwQfdstf2dQNmG/Lde/uOWM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_034152_825108_DBD66259 
X-CRM114-Status: UNSURE (   9.47  )
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
https://patchwork.kernel.org/project/linux-rockchip/list/?series=936932

These patchs have been tested with a 1536x2048p60 eDP panel on
RK3588S EVB1 board, and HDMI 1080P/4K display also has been verified
on RK3588 EVB1 board. Furthermore, the eDP display has been rechecked
on RK3399 sapphire excavator board.

Patch 1~3   are preparations for the RK3588 eDP support on both Analogix
            side.
Patch 4~8   are to support to get panel from the DP AUX bus.
Patch 9~11  are the RK3588 Analogix DP driver support.
Patch 12    is the addition of RK3588 eDP0 node.
Patch 13    is to enable the eDP0 display on RK3588S EVB1 board.

Damon Ding (13):
  drm/bridge: analogix_dp: Add irq flag IRQF_NO_AUTOEN instead of
    calling disable_irq()
  drm/bridge: analogix_dp: Remove CONFIG_PM related check in
    analogix_dp_bind()/analogix_dp_unbind()
  drm/bridge: analogix_dp: Add support for phy configuration.
  dt-bindings: display: rockchip: analogix-dp: Add support to get panel
    from the DP AUX bus
  drm/bridge: analogix_dp: Support to get &analogix_dp_device.plat_data
    and &analogix_dp_device.aux
  drm/bridge: analogix_dp: Add support to get panel from the DP AUX bus
  drm/bridge: analogix_dp: Add support for
    &drm_dp_aux.wait_hpd_asserted()
  drm/rockchip: analogix_dp: Add support to get panel from the DP AUX
    bus
  dt-bindings: display: rockchip: analogix-dp: Add support for RK3588
  drm/bridge: analogix_dp: Add support for RK3588
  drm/rockchip: analogix_dp: Add support for RK3588
  arm64: dts: rockchip: Add eDP0 node for RK3588
  arm64: dts: rockchip: Enable eDP0 display on RK3588S EVB1 board

 .../rockchip/rockchip,analogix-dp.yaml        |  25 ++++-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  28 +++++
 .../boot/dts/rockchip/rk3588s-evb1-v10.dts    |  55 ++++++++++
 .../drm/bridge/analogix/analogix_dp_core.c    |  85 +++++++++------
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c |  52 +++++++++
 drivers/gpu/drm/rockchip/Kconfig              |   1 +
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 103 ++++++++++++++++--
 include/drm/bridge/analogix_dp.h              |   7 +-
 8 files changed, 310 insertions(+), 46 deletions(-)

-- 
2.34.1


