Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7063E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 03:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rUCWRvoR1sxRJW3v0+Hu9l9AL/ZRjPragwtHsxtbGkA=; b=wFSCeBAFrp/oU7r8ENHS1JnbT/
	48q71T+Eb0ICODmnkH9taq92Qc5TTjxmbqkX32/A+YcvCLCh6CzAspTbufMmJNtdBdVFPtP3B9oX6
	Bx0T5Qak0/VLy7n8c50bkyfnca2SNxBbDZnsXLOhhBbd6et6f1rkjOyyQvbVrjLUbEQmmMMRkxDxL
	MebI0QAUfgJjuuco7l42DW+9zvtc727F+ENDie24pRT75pD3x6ww4AwovBDHK+QIzTZapH7FF37XT
	sOzC5gFSWsDQ1KZ/oqsMv/QreVB/C0ZYiUysiq6YKa6dCnpM/HuU0B+1ldAGT+PLYJQSLPAwP0GVu
	RG9f2riw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN1Zm-00000008toW-25MR;
	Mon, 16 Dec 2024 03:15:18 +0000
Received: from mail-m12744.qiye.163.com ([115.236.127.44])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN1XZ-00000008tCO-3lPR;
	Mon, 16 Dec 2024 03:13:04 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5cf798e4;
	Mon, 16 Dec 2024 11:12:49 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rfoss@kernel.org,
	vkoul@kernel.org,
	sebastian.reichel@collabora.com,
	cristian.ciocaltea@collabora.com,
	l.stach@pengutronix.de,
	andy.yan@rock-chips.com,
	hjc@rock-chips.com,
	algea.cao@rock-chips.com,
	kever.yang@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v2 00/11] Add eDP support for RK3588
Date: Mon, 16 Dec 2024 11:12:14 +0800
Message-Id: <20241216031225.3746-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkpIQlYZTh0aT0pNTU9KTx5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a93cd74447103a3kunm5cf798e4
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MjY6KCo*ETIOOiE3IkkuOkJC
	EDgKCz5VSlVKTEhPSEpDTExLQklCVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFIS0hPNwY+
DKIM-Signature: a=rsa-sha256;
	b=ZhzC6qHGZugNVUqcivPYv1YqhzbM3UCNRCCZsz4iWDUnQg5Kts3lzwPuEzxroF5EBXOlp8Zv7WdpQFcRiFlt5Wm0JVN2EVDvLyjohIAI6Fpr/lJyqcLeUN9pOwkIGunY1rel+58GqOZg472n84C7hXumEyd8fX3uNGD0N/T2MSk=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=rUCWRvoR1sxRJW3v0+Hu9l9AL/ZRjPragwtHsxtbGkA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_191302_460342_D2D70BA6 
X-CRM114-Status: GOOD (  10.66  )
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
RK3588S EVB1 board, and HDMI 1080P/4K display also has been verified
on RK3588 EVB1 board.

Patch 1~3 are the RK3588 eDP support of Rockchip analogix_dp driver.
Patch 4   is the eDP mode support of samsung hdptx phy driver.
Patch 5~6 are the Rk3588 eDP support of Aanalogix DP driver. Add phy
          interfaces is to configure the HDMI/eDP TX Combo PHY.
Patch 7~8 are the renaming of hdptxphy node. It is not only used by
          HDMI display but also for the eDP display.
Patch 9   is the addition of RK3588 eDP0 node.
Patch 10  is to enable the eDP0 display on RK3588S EVB1 board.
Patch 11  is to add the eDP1 related nodes for RK3588 SoC.

Damon Ding (11):
  drm/rockchip: analogix_dp: Use formalized struct definition for grf
    field
  dt-bindings: display: rockchip: analogix-dp: Add support for RK3588
  drm/rockchip: analogix_dp: Add support for RK3588
  phy: phy-rockchip-samsung-hdptx: Add support for eDP mode
  drm/bridge: analogix_dp: add support for RK3588
  drm/bridge: analogix_dp: Add support for phy configuration.
  dt-bindings: display: rockchip: Fix label name of hdptxphy for RK3588
    HDMI TX Controller
  arm64: dts: rockchip: Fix label name of hdptxphy for RK3588
  arm64: dts: rockchip: Add eDP0 node for RK3588
  arm64: dts: rockchip: Enable eDP0 display on RK3588S EVB1 board
  arm64: dts: rockchip: Add nodes related to eDP1 for RK3588

 .../rockchip/rockchip,analogix-dp.yaml        |   1 +
 .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml  |   2 +-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  33 +-
 .../dts/rockchip/rk3588-coolpi-cm5-evb.dts    |   2 +-
 .../rockchip/rk3588-coolpi-cm5-genbook.dts    |   2 +-
 .../boot/dts/rockchip/rk3588-evb1-v10.dts     |   2 +-
 .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |  55 +
 .../rk3588-friendlyelec-cm3588-nas.dts        |   2 +-
 .../arm64/boot/dts/rockchip/rk3588-jaguar.dts |   2 +-
 .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   |   2 +-
 .../dts/rockchip/rk3588-orangepi-5-plus.dts   |   2 +-
 .../boot/dts/rockchip/rk3588-rock-5b.dts      |   2 +-
 .../boot/dts/rockchip/rk3588-tiger-haikou.dts |   2 +-
 .../boot/dts/rockchip/rk3588s-coolpi-4b.dts   |   2 +-
 .../boot/dts/rockchip/rk3588s-evb1-v10.dts    |  50 +
 .../dts/rockchip/rk3588s-indiedroid-nova.dts  |   2 +-
 .../boot/dts/rockchip/rk3588s-nanopi-r6.dtsi  |   2 +-
 .../boot/dts/rockchip/rk3588s-odroid-m2.dts   |   2 +-
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi |   2 +-
 .../boot/dts/rockchip/rk3588s-rock-5a.dts     |   2 +-
 .../boot/dts/rockchip/rk3588s-rock-5c.dts     |   2 +-
 .../drm/bridge/analogix/analogix_dp_core.c    |   5 +
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c |  56 ++
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 149 ++-
 .../phy/rockchip/phy-rockchip-samsung-hdptx.c | 937 +++++++++++++++++-
 include/drm/bridge/analogix_dp.h              |   3 +-
 26 files changed, 1223 insertions(+), 100 deletions(-)

-- 
2.34.1


