Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B9FC71159
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 06:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mP3rfVTvjiF0YkymLEmrVC+TQ5ybYJ7PmT9RABY0fTg=; b=Dh5nsdbAUDuAjLwX/CQRWSzYZn
	K/sZJJ185Hl9xE5bXzqa8fqMCVa84184FOddoOinmjZVKSd5mbOAGGznL6MbncBc2HvgCopCVLZ65
	FouE5I7kAowSGbE1eJK9uiw5Ns12k8VjHWdeF1DfXk1Ax8cXRj9QfjYRXAQ/lGSyIjePG+CGS+DQM
	L5nN48dJGVc/ohtU6QqXTUiqwzqYU9OoAsNjLOARl2TmHXssqaduHL51mO3msRTVDCJ6x70ZzPsKu
	M4OMruDD49LQ351oG4sVEQJwjkWTvkDG52M2vp9pPMgr82ItIRz4A1+IbkRS4rXo4Xwowehpk7S2w
	ybynGA7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS9B3-0000000CDzD-14Zm;
	Thu, 19 Jun 2025 06:55:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS8wD-0000000CB0k-1c1c;
	Thu, 19 Jun 2025 06:39:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=mP3rfVTvjiF0YkymLEmrVC+TQ5ybYJ7PmT9RABY0fTg=; b=afcI5yWK7MYykshNhZBZohJOE9
	6IU2c4dM1QoJTHvC96R9ziRG4Yd374X2aospgSRGhE8WY+pHie8VWPWTsmFRapiBS4iRs2Ce/ZotU
	7w61jPa9ZYLTZyUk2n4oHTxMai754NNPWcCk1iydzKZa840xcQSVrTE9deQzq0d/8HdzAa5MOj+C0
	5LL6d9pd8QbwIE85rbpFayoKHQEARiSlPQY9OpWBPaJrC5ICdFDl4C6UJAevhWfBdpiTpY7OJCxVK
	seRzwPWA4MvlPP4pjVpBULaLI+r7rTumvjRplaGXZp9LtsOPoIicSGk5V33lSbvzfm4FiVKyWXQnk
	ZTZicZ+w==;
Received: from m16.mail.163.com ([117.135.210.4])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS8w9-00000004Meu-0gR2;
	Thu, 19 Jun 2025 06:39:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=mP
	3rfVTvjiF0YkymLEmrVC+TQ5ybYJ7PmT9RABY0fTg=; b=ceT9E0+yRf59qZKrZ8
	dxm9E4PWncVI6INfagJfzSSUNGAu2jY9agdRwICL31be3vyuYTEsiPHI0fh9oqt1
	1texdnfvB7wMMhgbKysG9tuPuOV9Yv7cMvLhB2P0rozBdrPaklSXJw2ReErOR9Ru
	A3uTtm8rScX1kslv32R+0TobQ=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD312OGsFNoUtqyAQ--.3973S2;
	Thu, 19 Jun 2025 14:39:06 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: hjc@rock-chips.com,
	mripard@kernel.org,
	naoki@radxa.com,
	stephen@radxa.com,
	cristian.ciocaltea@collabora.com,
	neil.armstrong@linaro.org,
	Laurent.pinchart@ideasonboard.com,
	yubing.zhang@rock-chips.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v4 0/9] Add support for RK3588 DisplayPort Controller
Date: Thu, 19 Jun 2025 14:38:46 +0800
Message-ID: <20250619063900.700491-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD312OGsFNoUtqyAQ--.3973S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZrWUZrWxJr4rJrW8AF17Awb_yoWrGw4Upa
	1UAry5JrWUWFWaqrs7CF1kCrsav3ZrtayrKws3J342va42kFyUAwnxCFsxXr9rWF17AFW2
	krnxXryxCFW7XF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j4wZcUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0glxXmhTsFoGowAAsA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_073949_799204_D639054D 
X-CRM114-Status: GOOD (  14.42  )
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

From: Andy Yan <andy.yan@rock-chips.com>


There are two DW DPTX based DisplayPort Controller on rk3588 which
are compliant with the DisplayPort Specification Version 1.4 with
the following features:

* DisplayPort 1.4a
* Main Link: 1/2/4 lanes
* Main Link Support 1.62Gbps, 2.7Gbps, 5.4Gbps and 8.1Gbps
* AUX channel 1Mbps
* Single Stream Transport(SST)
* Multistream Transport (MST)
* Type-C support (alternate mode)
* HDCP 2.2, HDCP 1.3
* Supports up to 8/10 bits per color component
* Supports RBG, YCbCr4:4:4, YCbCr4:2:2, YCbCr4:2:0
* Pixel clock up to 594MHz
* I2S, SPDIF audio interface

The current version of this patch series only supports basic display outputs.
I conducted tests with DP0 in 1080p and 4K@60 YCbCr4:2:0 modes; the ALT/Type-C
mode was tested on Rock 5B, DP1 was tested on Rock 5 ITX by Stephen and Piotr.

HDCP and audio features remain unimplemented.

For RK3588, it's only support SST, while in the upcoming RK3576, it can support
MST output.


Changes in v4:
- Drop unnecessary header files
- Switch to devm_drm_bridge_alloc
- Drop unused function
- Add platform_set_drvdata
- Link to v3: https://lore.kernel.org/linux-rockchip/20250403033748.245007-1-andyshrk@163.com/

Changes in v3:
- Rebase on drm-misc-next
- Switch to common helpers to power up/down dp link
- Only pass parameters to phy that should be set
- First introduced in this version.
- First introduced in this version.
- Add RA620 into bridge chain.
- Link to v2: https://lore.kernel.org/linux-rockchip/20250312104214.525242-1-andyshrk@163.com/

Changes in v2:
- Fix a character encoding issue
- Fix compile error when build as module
- Add phy init
- Only use one dw_dp_link_train_set
- inline dw_dp_phy_update_vs_emph
- Use dp_sdp
- Check return value of drm_modeset_lock
- Merge code in atomic_pre_enable/mode_fixup to atomic_check
- Return NULL if can't find a supported output format
- Fix max_link_rate from plat_data
- no include uapi path
- switch to drmm_encoder_init
- Sort in alphabetical order
- Link to V1: https://lore.kernel.org/linux-rockchip/20250223113036.74252-1-andyshrk@163.com/

Andy Yan (9):
  dt-bindings: display: rockchip: Add schema for RK3588 DPTX Controller
  drm/bridge: synopsys: Add DW DPTX Controller support library
  drm/rockchip: Add RK3588 DPTX output support
  dt-bindings: display: simple-bridge: Add ra620 compatible
  drm/birdge: simple-bridge: Add support for radxa ra620
  arm64: dts: rockchip: Add DP0 for rk3588
  arm64: dts: rockchip: Add DP1 for rk3588
  arm64: dts: rockchip: Enable DisplayPort for rk3588s Cool Pi 4B
  arm64: dts: rockchip: Enable DP2HDMI for ROCK 5 ITX

 .../display/bridge/simple-bridge.yaml         |    1 +
 .../display/rockchip/rockchip,dw-dp.yaml      |  150 ++
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |   30 +
 .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |   30 +
 .../boot/dts/rockchip/rk3588-rock-5-itx.dts   |   59 +
 .../boot/dts/rockchip/rk3588s-coolpi-4b.dts   |   37 +
 drivers/gpu/drm/bridge/simple-bridge.c        |    5 +
 drivers/gpu/drm/bridge/synopsys/Kconfig       |    7 +
 drivers/gpu/drm/bridge/synopsys/Makefile      |    1 +
 drivers/gpu/drm/bridge/synopsys/dw-dp.c       | 2052 +++++++++++++++++
 drivers/gpu/drm/rockchip/Kconfig              |    9 +
 drivers/gpu/drm/rockchip/Makefile             |    1 +
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c     |  150 ++
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |    1 +
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h   |    1 +
 include/drm/bridge/dw_dp.h                    |   20 +
 16 files changed, 2554 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
 create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-dp.c
 create mode 100644 drivers/gpu/drm/rockchip/dw_dp-rockchip.c
 create mode 100644 include/drm/bridge/dw_dp.h

-- 
2.43.0


