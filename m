Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C037D609AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 07:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CcgRIo+XJmQI6DQwJ0KECoH/PzQlSX6iB9aios6JJS0=; b=hybK57o+3RU1Vsykbmp0zxCWyt
	0UI8HcTHv8LGPzJ8pc4LQuftnZP0P6LETBSFei+qtEI+ifdMr5nkA4nlLsb7UPeSMrAzvdRQCKXoY
	SCaqHkN9mkobKh5oVL2Uuveu0a5W3A5HoKVmYwHfe+tg3WK8X4eUMsADKdGxhUxQZ3CGIwZwVe/Ak
	YcKZ8nlewKRja5a3k28Z1qfqA7Tz2uTqaRkUWfwfrW8r+dXzdGDKH7Uwx8EvvSPqzaqAVVN1apRUm
	c6DowG6xcJP6TC9NruxQe/WerC7ljpt3CQpFdpOmMSWHl0dTydwIMp6nCo9EMd6ciNbkIiKjizPkH
	62L/zTuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGCs5-0000000CUbW-2U61;
	Wed, 27 Nov 2024 07:54:01 +0000
Received: from mail-m12799.qiye.163.com ([115.236.127.99])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGCr5-0000000CURi-3y64;
	Wed, 27 Nov 2024 07:53:01 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3f86cd6b;
	Wed, 27 Nov 2024 15:52:49 +0800 (GMT+08:00)
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
Subject: [PATCH v1 00/10] Add eDP support for RK3588
Date: Wed, 27 Nov 2024 15:51:47 +0800
Message-Id: <20241127075157.856029-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh5LQ1ZKGhoaQkkeSR5NTRpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a936c9bcbb803a3kunm3f86cd6b
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6M0k6Qxw6STIjCS9CLwJLTR0d
	SAkwCUhVSlVKTEhJTUJIQkxKTUhPVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJQkpPNwY+
DKIM-Signature: a=rsa-sha256;
	b=DrsNEaPaYgr1HW/MTl00CQnNBm8VDBvfgHCJv8Usqq45qIkkCQPPbJdAgVdC3OwVHMFyy6bTBM4aVqtVHhD8YzpqJQ7tbXqGdR9DlEt25/ZaoFudD2b33/lpP59HkUKUfcVZVA18V+IHcDnh2w65XXDbDcRbzT+I8cphm7wytjQ=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=CcgRIo+XJmQI6DQwJ0KECoH/PzQlSX6iB9aios6JJS0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_235300_501378_DB5189C9 
X-CRM114-Status: GOOD (  10.25  )
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

Damon Ding (10):
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
  arch64: dts: rockchip: Enable eDP0 display on RK3588S EVB1 board

 .../rockchip/rockchip,analogix-dp.yaml        |   1 +
 .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml  |   2 +-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  33 +-
 .../dts/rockchip/rk3588-coolpi-cm5-evb.dts    |   2 +-
 .../rockchip/rk3588-coolpi-cm5-genbook.dts    |   2 +-
 .../boot/dts/rockchip/rk3588-evb1-v10.dts     |   2 +-
 .../rk3588-friendlyelec-cm3588-nas.dts        |   2 +-
 .../arm64/boot/dts/rockchip/rk3588-jaguar.dts |   2 +-
 .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   |   2 +-
 .../dts/rockchip/rk3588-orangepi-5-plus.dts   |   2 +-
 .../boot/dts/rockchip/rk3588-rock-5b.dts      |   2 +-
 .../boot/dts/rockchip/rk3588-tiger-haikou.dts |   2 +-
 .../boot/dts/rockchip/rk3588s-coolpi-4b.dts   |   2 +-
 .../boot/dts/rockchip/rk3588s-evb1-v10.dts    |  84 ++
 .../dts/rockchip/rk3588s-indiedroid-nova.dts  |   2 +-
 .../boot/dts/rockchip/rk3588s-nanopi-r6.dtsi  |   2 +-
 .../boot/dts/rockchip/rk3588s-odroid-m2.dts   |   2 +-
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi |   2 +-
 .../boot/dts/rockchip/rk3588s-rock-5a.dts     |   2 +-
 .../boot/dts/rockchip/rk3588s-rock-5c.dts     |   2 +-
 .../drm/bridge/analogix/analogix_dp_core.c    |   8 +-
 .../drm/bridge/analogix/analogix_dp_core.h    |   2 +
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c |  90 ++
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 112 ++-
 .../phy/rockchip/phy-rockchip-samsung-hdptx.c | 936 +++++++++++++++++-
 include/drm/bridge/analogix_dp.h              |   3 +-
 26 files changed, 1206 insertions(+), 97 deletions(-)

-- 
2.34.1


