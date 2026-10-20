Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7420E60A3818
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 03:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=stoAkn6g;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=ejSv5eT7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dt0N3ix0wAIYmAU9lbiuaFzpuHythTIbWJzQ9DvOTyA=; b=stoAkn6g8BSxYox2w3k5jRl/iF
	ydoHmT0AKzXqg5inxKqyCZrhvII5eWufQrXYQxIOjcURcOJPfJY/R9101rHvm+ZoBelnMtia2nH12
	9/9Xf5VyznNPdrg+K8aUjqz3qlNWUZjWyF2VWCSfOK6PLSiO7f3xPfILLZvRbXbKulrGzPyNGqC6X
	M6q0YTnqMZL3Xmbx87wkRNuXMeRcYxpiaWrk+daCrqo6dv9PXOxE22aN4I4aiUp5wuLAkBRp36xHK
	ELySejMIKS1XmCBOEqFD9lii4EaWE0ghaMbAYmPc9WGKuvOssq92xuWdlq63GV7b2FOvZGnB8yTHW
	Kum4HMvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ0EH-00000008lDd-37sq;
	Tue, 20 Oct 2026 03:09:33 +0000
Received: from mail-m60204.netease.com ([210.79.60.204])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ0EE-00000008lCh-00wo;
	Tue, 20 Oct 2026 03:09:32 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 51a4cee65;
	Tue, 20 Oct 2026 11:09:25 +0800 (GMT+08:00)
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
Subject: [PATCH v3 0/6] Add eDP support for RK3568
Date: Tue, 20 Oct 2026 11:09:10 +0800
Message-Id: <20261020030916.3223833-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa15749028c03a8kunmfd20f05334c72b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaHh8aVksaTRlKTEsaTE8dHlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=ejSv5eT7K0+24gI8HbGP05HopX6koZdp+6lHCq0dDME2HQCRxnv9QB5FmRNP2hIjezD8oVsbDOrRGzT4gNj5j6MI2uKSOExLWPjL1Ie3b+8U3ARCtv1AzVSIQc0mnv+kwxxfMstgCL5uzVWb11nYY3Co41IV/QaKnbVLwQNt+4I=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=dt0N3ix0wAIYmAU9lbiuaFzpuHythTIbWJzQ9DvOTyA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_200931_063553_B71147D2 
X-CRM114-Status: GOOD (  13.90  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
 .../phy/rockchip/phy-rockchip-naneng-edp.c    | 453 ++++++++++++++++++
 include/drm/bridge/analogix_dp.h              |   2 +
 10 files changed, 629 insertions(+), 2 deletions(-)
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

Changes in v3:
- Restore the PHY related changes which were missing in v2 for
  unexpected reasons.

-- 
2.34.1


