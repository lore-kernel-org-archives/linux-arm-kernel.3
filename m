Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D86CF64A9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 02:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8whR5sKJdFqA8EgbJnlpTIAUgUhQVdkkQC0jNUakz0E=; b=jB4gifhuRWj7iNrqcn7NHtrM2z
	iRKROXoPhW8sWh+N/6de0iDuRrTbs+hhlJdIsMsZHG86LHVFfl2xLc+8ak6w5YPw38SvFTpdrBywZ
	rT35HALRyxOWIKP7JA9Mes6tLTiDsv1vLvySzPr6ImgOR9LdFN5Nbyo6eJt/si3YWRLdIV6Vh+wrR
	U7eldhilUNWYu5iFYWLxv1dzoqCf7i+0efzwF6zVLwf9TgCZxA7aPHaAN6qDwlFoiv+kOu6EPVq/E
	OpWQFwc7LH4QDni+xT2PFIhs/7BGfsu9Rfsz/eYPtgz4YmBgf5OMZ6ZDcDOrVb0bdnVCnVi5EIQVw
	htuwkiNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLuLq-00000005yMV-0AcZ;
	Thu, 20 Nov 2025 02:24:50 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLuLj-00000005yHD-07Wt;
	Thu, 20 Nov 2025 02:24:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1763605434;
	bh=8whR5sKJdFqA8EgbJnlpTIAUgUhQVdkkQC0jNUakz0E=;
	h=From:To:Subject:Date:Message-Id;
	b=V9MR1huuZ43uQzqj4USrzzHXlSsmhWWiwfHGA4q2MoE+TEuGYGC4V9+TNFCEWe/1y
	 C1vo+EAH2zp2DHq3icFlpgDNhfNvhJFsjb/toHZ+Bj6tV2vVug14BzQPIN//TFZJuB
	 QvVcM8I0Ry4BHeGsOobROAx+DkZ3hqkcz61yeymI=
X-QQ-mid: zesmtpsz5t1763605431t46a61901
X-QQ-Originating-IP: KXodkNr6zx56ppLyo5Cpu4iIqzeqZIgbxI/lActdX30=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 20 Nov 2025 10:23:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6026418181417225123
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Peter Chen <hzpeterchen@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v10 00/11] Add Type-C DP support for RK3399 EVB IND board
Date: Thu, 20 Nov 2025 10:23:32 +0800
Message-Id: <20251120022343.250-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MfJtHqZtrd+O7RGoLinECHIC8dG4IdLdCfWDsUQtXDzkYDME3/D6J71C
	ZnZfdBVIRGnexeeG3Jngi3HEhD0n9wbq1qx0tQfz2X7RKu251irUdeJ+QViYhsIcStjvpGW
	yqZG93T0H6qk5SFbJMHXPIYkASxXvPDigX40E2njtRaC2m5p23xcnDAYtuxvixC486MCtjT
	BWVf5w1NIXIDXLgx949XCqYQGo9GoMp26ITOsr1xw0qbuo3IgZW2G7HzjGRzP5XxUJ98oYU
	6rS+AheMHDrjIRqgT0sXc8Zp0Xziwx6jMWp41mbqZWM1H5wjfnfoCP9nORlLXYMa+8yHcaj
	lFoU0cA0Y74XE0I06SKvlC0tETZO8ft7rrAuedmSgPE8IjavxWkr80wLGWQB7stvoZnizkY
	KsxZV6A1FkLwNKCoYdZNBNikIbvw8uw1eJ+2+wNwJbWnhpSZGypx1b8Tl1DqG7tHmbbsBuD
	hQSq8jtlueD52HU6BFKHJd4pmeqJ4PQwp1YFfG9wXgbs1S5omGmrjKVHqI8QhC7FagDKeIb
	xhzOq6XjOfJQ0g9COhphSpi+nrPbPr9cGvwyX2mgWxpJS69CvcibltAGKyP59aTyAoq/OUk
	O1hvFy6bgtq0VipgYvopwvWu+oC+GE9oPmVYMXTNzyacWIBJ3Yy+k0YQD7v3tKOpdApIdT1
	7sdohjxXismPlhLiJ4mN/Xpr/jOKCXok8+pot0/IufmrPZ+05ZfeyI+9Bi9+EhbFdxftaDT
	Q6Fgv2ftA305o8q474pPZ3Fs/wHPJGCgzC4rpg7rR+hz+nP8uXoDefA1m5VbeZaJo7d6hLl
	YDOlSPRH2Z5T6UBd1y0Lgs2986mgLkVOFe6b+olfGPUjZKEVVyRzEAnTcQ5/xh69y1DCVMg
	LGrsuC7fEwUwDfc6RZeDy04FHbWBN8IBZygPSPRapjmiHE0Ak3FVRJFqzJJSV46fin/SgVe
	9FcfCuq3vfeJS/1Jtcrch7bmnU1tLgbuHde0B1YEG6AbiBPdXEwxsqgym
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_182443_565957_98111D88 
X-CRM114-Status: GOOD (  23.19  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

This series focuses on adding Type-C DP support for USBDP PHY and DP
driver. The USBDP PHY and DP will perceive the changes in cable status
based on the USB PD and Type-C state machines provided by TCPM. Before
this, the USBDP PHY and DP controller of RK3399 sensed cable state
changes through extcon, and devices such as the RK3399 Gru-Chromebook
rely on them. This series should not break them.

====
1. DisplayPort HPD status notify

Before v7, I implemented a variety of DP HPD status notify. However,
they all had various problems and it was difficult to become a generic
solution.

Under the guidance of Heikki and Dmitry, a decoupled notification
method between the TypeC and DRM subsystems was introduced in v7.
First, a notification is sent when TypeC registers a new altmode.
Then, a generic DP AUX HPD bridge is implemented on the DRM side.

That makes it redundant for each Type-C controller driver to implement
a similar DP AUX HPD bridge in embedded scenarios.

====
2. Altmode switching and orientation switching for USBDP PHY

For USB Type-C interfaces, an external Type-C controller chip assists
by detecting cable attachment, determining plug orientation, and
reporting USB PD message. The USB/DP combo PHY supports software
configurable pin mapping and DisplayPort lane assignment. Based on
these message, the combo PHY can perform both altmode switching and
orientation switching via software.

The RK3399 EVB IND board has a Type-C interface DisplayPort. It use
fusb302 chip as Type-C controller. The connection diagram is shown below:

fusb302 chip +---> USB2.0 PHY ----> DWC3 USB controller
             |
             +---> USB/DP PHY0 +--> CDN-DP controller
                               |
                               +--> DWC3 USB controller

====
3. Multiple bridge model for RK3399 CDN-DP

The RK3399 has two USB/DP combo PHY and one CDN-DP controller. And
the CDN-DP can be switched to output to one of the PHYs.

USB/DP PHY0 ---+
               | <----> CDN-DP controller
USB/DP PHY1 ---+

In previous versions, if both PHY ports were connected to DP,
the CDN-DP driver would select the first PHY port for output.

On Dmitry's suggestion, we introduced a multi-bridge model to support
flexible selection of the output PHY port. For each PHY port, a
separate encoder and bridge are registered.

The change is based on the DRM AUX HPD bridge, rather than the
extcon approach. This requires the DT to correctly describe the
connections between the first bridge in bridge chain and DP
controller. And Once the first bridge is obtained, we can get the
last bridge corresponding to the USB-C connector, and then set the
DRM connector's fwnode to the corresponding one to enable HPD
notification.

====
Patch1 add notifier functions for Type-C core.
Patch2 export all Type-C device types for identification.
Patch3 add generic USB Type-C DP HPD bridge.
Patch4 add new API drm_aux_bridge_register_from_node().
Patch5 add new Type-C mode switch for RK3399 USBDP phy binding.
Patch6 add typec_mux and typec_switch for RK3399 USBDP PHY.
Patch7 add DRM AUX bridge support for RK3399 USBDP PHY.
Patch8 drops CDN-DP's extcon dependency when Type-C is present.
Patch9 add multiple bridges to support PHY port selection.
Patch10 add missing dp_out port for RK3399 CDN-DP.
Patch11 add Type-C DP support for RK3399 EVB IND board.

Changes in v10:
- Link to V9: https://lore.kernel.org/all/20251111105040.94-1-kernel@airkyi.com/
- Notify TYPEC_ALTMODE_UNREGISTERED when altmode removed. 
- Add drm_aux_bridge_register_from_node().
- Fix refcount usage of drm_bridge.

Changes in v9:
- Link to V8: https://lore.kernel.org/all/20251029071435.88-1-kernel@airkyi.com/
- Remove the exposed DRM_AUX_HPD_BRIDGE option, and select
DRM_AUX_HPD_TYPEC_BRIDGE when it is available.
- Add usb role switch for Type-C.
- Remove USB2 PHY in Type-C connection.
- ...

Changes in v8:
- Link to V7: https://lore.kernel.org/all/20251023033009.90-1-kernel@airkyi.com/
- Export all typec device types for identification.
- Merge generic DP HPD bridge into one module.
- Fix coding style.

Changes in v7:
- Link to V6: https://lore.kernel.org/all/20251016022741.91-1-kernel@airkyi.com/
- Add notifier functions for Type-C core.
- Add generic USB Type-C DP HPD bridge.

Changes in v6:
- Link to V5: https://lore.kernel.org/all/20251011033233.97-1-kernel@airkyi.com/
- Fix depend in Kconfig.
- Check DP svid in tcphy_typec_mux_set().
- Remove mode setting in tcphy_orien_sw_set().
- Rename some variable names.
- Attach the DP bridge to the next bridge.

Changes in v5:
- Link to V4: https://lore.kernel.org/all/20250922012039.323-1-kernel@airkyi.com/
- Remove the calls related to `drm_aux_hpd_bridge_notify()`.
- Place the helper functions in the same compilation unit.
- Add more comments about parent device.
- Add DRM AUX bridge support for RK3399 USBDP PHY
- By parsing the HPD bridge chain, set the connector's of_node to the
of_node corresponding to the USB-C connector.
- Return EDID cache when other port is already enabled.

Changes in v4:
- Link to V3: https://lore.kernel.org/all/20250729090032.97-1-kernel@airkyi.com/
- Add default HPD device for DisplayPort altmode.
- Introduce multiple bridges for CDN-DP.
- ...

Changes in v3:
- Link to V2: https://lore.kernel.org/all/20250718062619.99-1-kernel@airkyi.com/
- Add more descriptions to clarify the role of the PHY in switching.
- Fix wrong vdo value.
- Fix port node in usb-c-connector.

Changes in v2:
- Link to V1: https://lore.kernel.org/all/20250715112456.101-1-kernel@airkyi.com/
- Reuse dp-port/usb3-port in rk3399-typec-phy binding.
- Fix compile error when CONFIG_TYPEC is not enabled.
- Notify DP HPD state by USB/DP PHY.
- Ignore duplicate HPD events.
- Add endpoint to link DP PHY and DP controller.
- Fix devicetree coding style.


Chaoyi Chen (11):
  usb: typec: Add notifier functions
  usb: typec: Export all typec device types
  drm/bridge: Implement generic USB Type-C DP HPD bridge
  drm/bridge: aux: Add drm_aux_bridge_register_from_node()
  dt-bindings: phy: rockchip: rk3399-typec-phy: Support mode-switch
  phy: rockchip: phy-rockchip-typec: Add typec_mux/typec_switch support
  phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
  drm/rockchip: cdn-dp: Support handle lane info without extcon
  drm/rockchip: cdn-dp: Add multiple bridges to support PHY port
    selection
  arm64: dts: rockchip: Add missing dp_out port for RK3399 CDN-DP
  arm64: dts: rockchip: rk3399-evb-ind: Add support for DisplayPort

 .../phy/rockchip,rk3399-typec-phy.yaml        |   6 +
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi |  10 +-
 .../boot/dts/rockchip/rk3399-evb-ind.dts      | 147 +++++++
 drivers/gpu/drm/bridge/Kconfig                |  10 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/aux-bridge.c           |  24 +-
 .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  |  50 +++
 drivers/gpu/drm/rockchip/Kconfig              |   1 +
 drivers/gpu/drm/rockchip/cdn-dp-core.c        | 350 +++++++++++++---
 drivers/gpu/drm/rockchip/cdn-dp-core.h        |  18 +-
 drivers/phy/rockchip/Kconfig                  |   3 +
 drivers/phy/rockchip/phy-rockchip-typec.c     | 373 +++++++++++++++++-
 drivers/usb/typec/Makefile                    |   2 +-
 drivers/usb/typec/bus.h                       |   2 +
 drivers/usb/typec/class.c                     |   7 +
 drivers/usb/typec/class.h                     |  10 -
 drivers/usb/typec/notify.c                    |  23 ++
 include/drm/bridge/aux-bridge.h               |   6 +
 include/linux/usb/typec.h                     |  10 +
 include/linux/usb/typec_altmode.h             |   9 +
 20 files changed, 967 insertions(+), 95 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
 create mode 100644 drivers/usb/typec/notify.c

-- 
2.51.1


