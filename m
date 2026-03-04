Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52A1EB7EB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 09:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j4OO5LQjgQWJ6Ij+29Alv0i2FQ3hT0svegwm+PnfSjo=; b=QEMBqYyOWeQyb5OVcj7r/Znrjj
	OYFhs3vn9tfJY5+kqY03+i2MhV26K3dpmwaZBn0+VhozSuwSgsBSj8P6z9JK+X0cCxpgj2SsC9EIU
	sbNTOSu9GaIQr5pDZvEYsKSR3hE+LxoE6HsVvupytWpMxHil8dtwkcRTGXR1BYDoApe5AFtn/+aur
	q92QGgchgGNLuDXJS9ghkG8gPlPelhle81Z7iDkAzIztbj0+EF17nkuRvqIjFElYeumFFficVacfs
	dxR+i9Cyy4tmVBrLGjypqzsbYnp4CwlRKkEGa6XMnQrfoN1tUDW7rgry864OI3YdEUfBrPJmpEjRO
	XFQdyLKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxil9-0000000Gu7H-0NJa;
	Wed, 04 Mar 2026 09:43:15 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxil4-0000000Gu3o-37tC;
	Wed, 04 Mar 2026 09:43:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1772617330;
	bh=j4OO5LQjgQWJ6Ij+29Alv0i2FQ3hT0svegwm+PnfSjo=;
	h=From:To:Subject:Date:Message-Id;
	b=Qb6QLlC73kacwAuBU7U64oQ66rJJur2Gl9Reqi7aAJK6I0gdhIqPdEzdNDV/2gFt1
	 4WrsYsOfuWOxZqN30VCaaCMebBkO2H4dugtUSezekEbOeWzpljKWAyzCwDzklMU0Mi
	 Np74tgNFN3o9lOQ0iy69tBh2pk2lSFCRBE7qxX7A=
X-QQ-mid: esmtpsz11t1772617321tff97d081
X-QQ-Originating-IP: R7C0JUdMb9pzS4EvwpZxl9x1A2bwu9dy7Pvnz9pi9C0=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Mar 2026 17:41:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6917927153062181562
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
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>,
	Hugh Cole-Baker <sigmaris@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH v15 0/9] Add Type-C DP support for RK3399 EVB IND board
Date: Wed,  4 Mar 2026 17:41:43 +0800
Message-Id: <20260304094152.92-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NzSDQCFWCzVTZoZbU1VfX6gIxH3Lfpv2DZ7YgMNLK1r/o38Ej5nKK/RU
	pKsOCssCNhPxgmOf86/d7cW64Sxgetns38vACBANqAP/4AUTBWlu1BB0XB74jKKu5HSQluE
	JvuhEKda2QTQYZQ+btwRwrMzTlaqTxiOcxymu4xHYhPuW6JWlo+mqCkU4e+T61xSLBcKeOA
	uhyXrIZHunvMF3OuR/pNXWQnVQUw2zRILT1NexVjEwLhCUU/AK/4JNFdUhboEXhGdSbiJnX
	rG6tV9VBBHZAhHkMq+a3hxcLdBEvMSJpaUipU+m3vvT3ceiRHB/oWg/1WpEYITV3GL7S4AE
	jtcQjwRCD8w8xUpoQKIN0CwdBYH03SUAyANB1wMQOuWm9bipfx47PqCyi4egsrwe2+VsJFw
	z+sW0aD8437fYqJdyiN62FDR88o9ilhpY1tiRqmSUhKmvXn0EhdzzWd7m4AlxtQYQwXcB0N
	V1s0XLrd0trBbJYoh4ycO7PPKuMhXcN4GWEvBU7P7f44o8l23QsCQCbwLgED5goSqUipoUP
	WuvK4ROyi8QUB44SC8i9G2yQFtxLUCL1fGlU1zP5j6znS7OgIRSPJHIiN2d3eAlEoWaA9Zo
	LAMik9UvU0xeos/YrM/UjwWlOWCeTTCet6whYcyQqB/Eua0VAdpEcEfVUtDDLTMCjMOOmWY
	CmbRTkQ5I7CgvsU5DnFGz+sN1fBiJXDdRnlIz8MXirNyMAHZAz+z8tQp5JiUxiF7xcrPPXU
	86gJPGTLHIoR0cqg/wGNcf5G1lu3zpjqz8u+tpbIXqrjjwKZG55fHXr2nKeLP+eYJhDcPKI
	vnNGuVp2golM5rOEzjtkahmpxTspMj4c7LCzK+CTGEet8sivKp3BedMiPHGapCJB95fiPgx
	owUIVWAZrQ4AhAZxlJk2VfEmJ1KmSAu8HnBWb8DEuT20Xl4bqDkXhW/hdt19Op7Lam8rohM
	80vEfEATHH/FUN1CrwQvdjjQSF2RFLqoOn7CRqSL/0NpXwB0j9JpYPnlUAy2e9BGQheSW40
	vhnC0MmzYZJEm59LmnhoH1Bo5LJx0=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_014311_143857_20763145 
X-CRM114-Status: GOOD (  24.81  )
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

During v7-v10, we added a new notifier in typec to notify the altmode
device register event. With the help of Greg and Heikki, we implemented
the reuse of notifiers for the type bus itself in patch1 of v11.

The USB subsystem related parts have already been merged into the
usb-next branch in v13 [0][1]. Therefore, this series no longer includes
these patches starting from v14. Thanks to Greg and Heikki!

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=67ab45426215c7fdccb65aecd4cac15bbe4dfcbb
[1]: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=4dee13db29de6dd869af9b3827e1ff569644e838

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
Patch1 add generic USB Type-C DP HPD bridge (Dmitry, Heikki).
Patch2 add new API drm_aux_bridge_register_from_node() (Neil) .
Patch3 add new Type-C mode switch for RK3399 USBDP phy binding (Krzysztof).
Patch4 add typec_mux and typec_switch for RK3399 USBDP PHY.
Patch5 add DRM AUX bridge support for RK3399 USBDP PHY (Neil).
Patch6 drops CDN-DP's extcon dependency when Type-C is present (Dmitry).
Patch7 add multiple bridges to support PHY port selection (Dmitry, Luca).
Patch8 add missing dp_out port for RK3399 CDN-DP.
Patch9 add Type-C DP support for RK3399 EVB IND board (Diederik, Peter).

Changes in v15:
- Link to V14: https://lore.kernel.org/all/20260119073100.143-1-kernel@airkyi.com/
- Improve clarity by inlining drm_bridge_get() in assignment (Luca).

Changes in v14:
- Link to V13: https://lore.kernel.org/all/20251208015500.94-1-kernel@airkyi.com/
- Drop the patches for the USB Type-C subsusytem part, as they have
  already been merged into usb-next.

Changes in v13:
- Link to V12: https://lore.kernel.org/all/20251204063109.104-1-kernel@airkyi.com/
- Only register drm dp hpd bridge for typec port altmode device.

Changes in v12:
- Link to V11: https://lore.kernel.org/all/20251128020405.90-1-kernel@airkyi.com/
- Add missing Signed-off-by line.

Changes in v11:
- Link to V10: https://lore.kernel.org/all/20251120022343.250-1-kernel@airkyi.com/
- Switch to using typec bus notifiers.

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

Chaoyi Chen (9):
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
 .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  |  49 +++
 drivers/gpu/drm/rockchip/Kconfig              |   1 +
 drivers/gpu/drm/rockchip/cdn-dp-core.c        | 349 +++++++++++++---
 drivers/gpu/drm/rockchip/cdn-dp-core.h        |  18 +-
 drivers/phy/rockchip/Kconfig                  |   3 +
 drivers/phy/rockchip/phy-rockchip-typec.c     | 373 +++++++++++++++++-
 include/drm/bridge/aux-bridge.h               |   6 +
 13 files changed, 913 insertions(+), 84 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c

-- 
2.51.1


