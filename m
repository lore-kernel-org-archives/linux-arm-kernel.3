Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F58CCF2E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 10:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=617Ri5C4UzxIoL/xXhlNBV+ngcvt66tB3mFH89EiNfY=; b=PS/SHfWT/rpYlG0asBaW3Q+BZQ
	x+uyrH2/B3zf2ieT5e30MxA0ThpRs1Cy5Pzjj8oFi9FkpqrZsrp8y2HYbu7Y2boW7/UVQkrZ+bH8E
	2ofvaNoyJ3tf+dJKFD4+Echk/PKC27Nwu19cBoqgXQE3HKfrw/VjHah/Oa5tRDNxfBaespEn821g0
	E40PctFpLXr9puuj/IXcoqtbpoWbtOTa0b1Tng4lc/6FLQ1Pf4WTq5ljp9Q3JVZBjZCl4z2bAYJKb
	6bhIOq/FcpymmLPIycmxPqTLcub/5BjNc0H6BB6A6DzgXDKs9SlLekkfYnAbOrtI5pOna5s5N9R7A
	XQ4IxHKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkc9-00000007Bua-1d5H;
	Mon, 19 Oct 2026 10:29:09 +0000
Received: from mail-m822136245.xmail.ntesmail.com ([8.221.36.245])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkbq-00000007Bci-12eJ;
	Mon, 19 Oct 2026 10:28:53 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 518d3dd84;
	Mon, 19 Oct 2026 18:28:41 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dave Jones <s.dave.jones@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v2 0/6] Add eDP support for RK3568
Date: Mon, 19 Oct 2026 18:28:18 +0800
Message-Id: <20261019102824.3157044-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa153b4d21803a8kunme348c01b2f6c0b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCT0JIVktOGBhMGkweSh9JS1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=NeVTMvm6b/1u8YkojplkAi/G3NWF11vZKYvAIj6kJDzvLm06em+sn2BDCG2b2RHd0ubXpphbNOAScPy+tuvi8AGPpPemSwm2Unn4it0YiB5Uc4KBh0x2JAuSvSXCNhnmjXhyHSSGo5n6cAXn0H2HDPo1REq+kEwK1w9jmpy5Vs0=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=617Ri5C4UzxIoL/xXhlNBV+ngcvt66tB3mFH89EiNfY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_032851_279861_A835BF42 
X-CRM114-Status: GOOD (  14.23  )
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

PATCH 1 is to document the "rockchip,rk3568-edp" compatible in the
        Rockchip Analogix DP binding.
PATCH 2 is to add the binding for the RK3568 eDP PHY with NaNeng IP block.
PATCH 3 is to add the RK3568 support for the Analogix DP bridge driver.
PATCH 4 is to add the driver for the Rockchip eDP Transmitter PHY with
        NaNeng IP block.
PATCH 5 is to add the RK3568 support for the Rockchip Analogix DP driver.
PATCH 6 is to add the eDP controller and eDP PHY nodes for the RK3568
        SoCs.

Tested on RK3568 EVB1 baord with LG eDP panel LP079QX1-SP0V.

&edp {
  avdd-0v9-supply = <&vdda0v9_image>;
  avdd-1v8-supply = <&vcca1v8_image>;
  force-hpd;
  status = "okay";

  aux-bus {
    panel {
      compatible = "edp-panel";
      backlight = <&backlight>;
      power-supply = <&vcc3v3_lcd0_n>;
      no-hpd;

      port {
        panel_in_edp: endpoint {
          remote-endpoint = <&edp_out_panel>;
        };
      };
    };
  };
};

&edp_in {
  edp_in_vp0: endpoint {
    remote-endpoint = <&vp0_out_edp>;
  };
};

&edp_out {
  edp_out_panel: endpoint {
    remote-endpoint = <&panel_in_edp>;
  };
};

&edp_phy {
  status = "okay";
};

&vp0 {
  vp0_out_edp: endpoint@ROCKCHIP_VOP2_EP_EDP0 {
    reg = <ROCKCHIP_VOP2_EP_EDP0>;
    remote-endpoint = <&edp_in_vp0>;
  };
};

Damon Ding (6):
  dt-bindings: display: rockchip: analogix-dp: Add support for RK3568
  dt-bindings: phy: Add rockchip,rk3568-edp-phy
  drm/bridge: analogix_dp: Add support for RK3568
  phy: rockchip: Add support for Naneng eDP phy
  drm/rockchip: analogix_dp: Add support for RK3568
  arm64: dts: rockchip: rk356x: Add eDP controller and phy nodes

 .../rockchip/rockchip,analogix-dp.yaml        |  25 +-
 .../bindings/phy/rockchip,rk3568-edp-phy.yaml |  59 +++
 .../devicetree/bindings/soc/rockchip/grf.yaml |  15 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi |  41 ++
 .../drm/bridge/analogix/analogix_dp_core.c    |   1 +
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  24 +-
 drivers/phy/rockchip/Kconfig                  |  10 +
 drivers/phy/rockchip/Makefile                 |   1 +
 .../phy/rockchip/phy-rockchip-naneng-edp.c    | 435 ++++++++++++++++++
 include/drm/bridge/analogix_dp.h              |   2 +
 10 files changed, 611 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
 create mode 100644 drivers/phy/rockchip/phy-rockchip-naneng-edp.c

---

Changes in v2:
- Apply the lane-dependent TX configurations in set_lanes() instead of
  set_rate(), and store the lane count for set_voltages(), since the
  Analogix DP core issues separate phy_configure() calls and the lane
  count is only valid in the set_lanes/set_voltages calls.(Sashiko)
- Initialize val to zero in rockchip_edp_phy_enabled() to avoid using
  an uninitialized variable when regmap_read() fails.(Sashiko)
- Fail the probe when the chip data requires GRF configurations while
  the "rockchip,grf" property is missing.(Sashiko)
- Rebase onto latest drm-misc-next tree.

-- 
2.34.1


