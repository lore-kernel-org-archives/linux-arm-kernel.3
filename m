Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2D2E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 23:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8nQmkHAbwxQl1T/Kw4A2hwy2MJmGRj9oZcS+awgb4Gk=; b=BmjnEUuvMZIH8GTLJGKCxmvlfx
	+3AXod2BiHD2OjL/aa/J8aCE/bBnNKzamTNAuRcW36h/1HpU/dss/WAoxgoPCqbm5tnpnnTANjye2
	+GaoVrbgaOhORLQ1+A2lqYjt/4f/RKUinYwZ/BQkVOSg28GUFbsaRfRIEA5Z2w6hi4KEc34ha2z03
	rKaimXchy2bi1rAQxNIZqHYv4+MTw/Ks5e/izFjs/YLaxUn+7s4vNyp9ScHbPRISpfUqGeEbSYINb
	cEDHPIX0p0JSCWkKjeFl/eUtlHgpS6P7BG1I2Jq7RfEPL6Rn7g/9A8uEMvACOdAIqMKuIP+gfcNH/
	6BUl5d3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKmvJ-00000009WZr-1A53;
	Mon, 09 Dec 2024 23:12:17 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKmuF-00000009WF1-06Zj;
	Mon, 09 Dec 2024 23:11:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8nQmkHAbwxQl1T/Kw4A2hwy2MJmGRj9oZcS+awgb4Gk=; b=m9Vpyjm4A7yCco/EItYeeAYaBS
	KNTUOD7wzwb6HUqPN8C/2AVPT18GyP06DkxOt/V4hhWl7kZKiisskvX5HKb4BIF3LQ5+xsTrhpryu
	PCLSQ4EM93PKTPHOOldWRUygZsfyMf8AdaDM+UB9aaq+J0NiMh5Rbs7v91H5RVMPuH1+gFGJdQ467
	/z4iVammCFdMWBoMhmdfBkox6wcX75y2wTGLHZW77DVJkUN0gJ3Gy8lQr728WZXpbL9DE3IJz3RSB
	A7RrSyfxHyhs03+ZOwpyCO0eRtZoCReirZ4tc7N/3G62NDMC7ypcgp7BxMJ0c5HBK5/vWjenA0sgx
	LpcU6AUg==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tKmtc-0005Ev-0o; Tue, 10 Dec 2024 00:10:32 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quentin.schulz@cherry.de
Subject: [PATCH v4 0/3] drm/rockchip: Add driver for the new DSI2 controller
Date: Tue, 10 Dec 2024 00:10:18 +0100
Message-ID: <20241209231021.2180582-1-heiko@sntech.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_151111_078737_C4E4DD4F 
X-CRM114-Status: GOOD (  16.09  )
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

This series adds a bridge and glue driver for the DSI2 controller found
in the rk3588 soc from Rockchip, that is based on a Synopsis IP block.

As the manual states:
The Display Serial Interface 2 (DSI-2) is part of a group of communication
protocols defined by the MIPI Alliance. The MIPI DSI-2 Host Controller is
a digital core that implements all protocol functions defined in the
MIPI DSI-2 Specification.


While the driver structure is very similar to the previous DSI controller,
the programming model of the core is quite different, with a completely
new register set.

Another notable difference is that the phy interface is variable now too
in its width and some other settings.

changes in v4:
- Update binding example to use phy-type argument
- Update commit description to use correctly spelled Synopsys
- use devm_pm_runtime_enable()
- drop pclk+sys_clk handling from the Rockchip glue-driver
  (the bridge does that for us already)

changes in v3:
- remove double-empty line in bridge part (Neil)
- add bitfield.h to both bridge and glue for FIELD_PROP
  (reported by kernel test robot)
- add Neil's Reviewed-by to bridge part
- add Rob's Reviewed-by to binding

changes in v2:
- clean up includes (Diederik)
- fix Kconfig description (Diederik)
- constant naming (Diederik)
- binding fixes (paths, sorting, labels) (Rob)
- move to use regmap
- drop custom UPDATE macro and use FIELD_PREP instead
- use dev_err instead of DRM_DEV_ERROR

Heiko Stuebner (3):
  drm/bridge/synopsys: Add MIPI DSI2 host controller bridge
  dt-bindings: display: rockchip: Add schema for RK3588 DW DSI2
    controller
  drm/rockchip: Add MIPI DSI2 glue driver for RK3588

 .../rockchip/rockchip,rk3588-mipi-dsi2.yaml   |  120 ++
 drivers/gpu/drm/bridge/synopsys/Kconfig       |    6 +
 drivers/gpu/drm/bridge/synopsys/Makefile      |    1 +
 .../gpu/drm/bridge/synopsys/dw-mipi-dsi2.c    | 1030 +++++++++++++++++
 drivers/gpu/drm/rockchip/Kconfig              |   10 +
 drivers/gpu/drm/rockchip/Makefile             |    1 +
 .../gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c  |  487 ++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |    2 +
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h   |    1 +
 include/drm/bridge/dw_mipi_dsi2.h             |   95 ++
 10 files changed, 1753 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-mipi-dsi2.yaml
 create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
 create mode 100644 drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
 create mode 100644 include/drm/bridge/dw_mipi_dsi2.h

-- 
2.45.2


