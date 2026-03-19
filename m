Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CB3108E1E5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 10:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RuwWMPlmv4RvekbGox9rM/lnWkYXlDqjkEi6DyWCV64=; b=qPV05NtwiK/u6JUmjquj0j55J/
	BndId2b1fhuA/RDdiwfsDUNvtAY+N45TZcUVqsd3t6elSk2Umxkpo1pc9QeyRNHSUWp/BUT+XCr0m
	rv/yKqWxFLDEqtKkBf1J0GeKg0wsqCYQO+ZSjyRyK2uuiSMg9C0CKzTd3NSmus9KWq3D0C4eEqfov
	A66RcK3qyG3ZxgQ5l6UElXICwT1+DZ02w5FfwZsoWaTHIhp9XZU/aPegdFfzk8kNrFiGVNpYd70gh
	5Zqecnm0Iec5h6ytNdaDfoh6lOpTlmw6g+RYT4zVfpyiJGJlX2uuCKfve+FPDOibCODNSviaccUvR
	XNmM267g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Ao1-0000000AQwk-2sli;
	Thu, 19 Mar 2026 10:40:45 +0000
Received: from mail-m49217.qiye.163.com ([45.254.49.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Anx-0000000AQv8-2pMq;
	Thu, 19 Mar 2026 10:40:44 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3790344a2;
	Thu, 19 Mar 2026 18:40:33 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
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
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	nicolas.frattaroli@collabora.com,
	alchark@gmail.com,
	cristian.ciocaltea@collabora.com,
	sebastian.reichel@collabora.com,
	kever.yang@rock-chips.com,
	heiko.stuebner@cherry.de,
	tomeu@tomeuvizoso.net,
	amadeus@jmu.edu.cn,
	michael.riesch@collabora.com,
	didi.debian@cknow.org,
	dmitry.baryshkov@oss.qualcomm.com,
	luca.ceresoli@bootlin.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v2 0/9] Add eDP support for RK3576
Date: Thu, 19 Mar 2026 18:40:22 +0800
Message-Id: <20260319104031.1986946-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d05aec56903a3kunm32a99f093bee32
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU9IGlYdSB4aSExLS00aQh5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=aRUK+Y7jWp8HXcSnwpXCG6ZnOj5BfhrZHbM83KDxft9xtxWzlnpeOYI2wslX2sABPQqxa92W1i33x9GmS5k+d95qVpkiespjbitrStCMY9MdtqziS5mneXQ7RYRUyq4pTJpwKDcJ3dmIaWEEaBRLnV6fWTklnXk8boPRI4G5QrA=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=RuwWMPlmv4RvekbGox9rM/lnWkYXlDqjkEi6DyWCV64=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_034042_069289_B57CF04C 
X-CRM114-Status: UNSURE (   8.69  )
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

These patchs have been tested with a 1536x2048p60 eDP panel on
RK3576 EVB1 board (hardware modified specially).

Patch 1~4 are to add missing clock "hclk" for RK3588 eDP nodes.
Patch 5~6 are to add the RK3576 eDP node.
Patch 7~9 are to support the RK3576 Analogix DP controller.

Damon Ding (9):
  dt-bindings: display: rockchip: analogix-dp: Expand clock-names "hclk"
    for the third clock
  arm64: dts: rockchip: Add missing clock "hclk" for RK3588 eDP0 nodes.
  arm64: dts: rockchip: Add missing clock "hclk" for RK3588 eDP1 nodes.
  drm/rockchip: analogix_dp: Enable clock "hclk" for RK3588
  dt-bindings: display: rockchip: analogix-dp: Add support for RK3576
  arm64: dts: rockchip: Add eDP node for RK3576
  drm/bridge: analogix_dp: Rename and simplify is_rockchip()
  drm/bridge: analogix_dp: Add support for RK3576
  drm/rockchip: analogix_dp: Add support for RK3576

 .../rockchip/rockchip,analogix-dp.yaml        |  6 +++-
 arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 28 +++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  4 +--
 .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |  4 +--
 .../drm/bridge/analogix/analogix_dp_core.c    |  3 +-
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 18 ++++++------
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 15 ++++++++++
 include/drm/bridge/analogix_dp.h              | 13 +++++++--
 8 files changed, 74 insertions(+), 17 deletions(-)

-- 
2.34.1


