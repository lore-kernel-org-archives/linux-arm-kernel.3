Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A6BCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 07:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vUs9PR5MkDE2TnuVElj67uBgDlTWsKMlCHyA7Lz2m9s=; b=3YutVbqHhWr78HeUSl388TPUID
	U7t9/s9CdgHb+RqeffaJnuJHKDTCjtaFQFEfuapJU97zkgn19o+gz5tHxapS/EhubUmUvxXBkUPrc
	hOTwiD9JPa50gLi6lXu0UhoAEauNqCBRBXgO8YDQAga17BuZ93JAzkEHYe5g+cJiS0bzdeIo8TRxf
	+a2/4CSVKo+59tudt0EHffOdqBuNHLR1Ltfy9AsjsBo4kfRK5qMKpr0i8Jl8vqrCo0tE35ZPaeWhp
	VH5/JG/mmEIq5puz85KrVK64yNVaKdJgsYvXL2RrNsx2GTOFUJGZOjPYIe79A1k7r2CN+E5Gto6d7
	Pv/Qtg+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE0P0-000000002I5-42yC;
	Wed, 29 Oct 2025 07:15:26 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE0Ow-000000002AK-2OZ6;
	Wed, 29 Oct 2025 07:15:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1761722087;
	bh=vUs9PR5MkDE2TnuVElj67uBgDlTWsKMlCHyA7Lz2m9s=;
	h=From:To:Subject:Date:Message-Id;
	b=YG0AUP52HbPjERGqi6nMhygpUAEh3/O5yinerUKTztg/x94Fr8mviOSjtagDq+ON8
	 MMnKQ/aiqCdHhrBbvv9jF1b9+xj+81jDaj0h0hIhV7pxplFgrDIHh1eT3cAsCFc5x/
	 6mpsWBinD3l/V/+JH35DUZGprTRospvpKA4hizjE=
X-QQ-mid: zesmtpsz6t1761722083t694185fa
X-QQ-Originating-IP: 5iuWasjHrqOKTZt0yGG1gdnMzF9J085MTFN9CJrLEEA=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Oct 2025 15:14:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18349792753202563132
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
Subject: [PATCH v8 00/10] Add Type-C DP support for RK3399 EVB IND board
Date: Wed, 29 Oct 2025 15:14:25 +0800
Message-Id: <20251029071435.88-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: M0/UNHhZ6hMGyYMrPCp2SIx207KrtDNRYw8VCj411KagG5pk6HKwg+Cq
	hrP6t+q2ctk7ETtpobDQDRnPeqab7dZVCAkhABmBHo7yI895TsLT7YgFfJT2DViqMtCGDa2
	bN75iiJDv6m4NQZyPWHZitSRNnV+UPxSu34j7vmxCXSRPeJ+zJtJghrAVajvqnCEpCFnevp
	ngwN/AnNYm4+BpDKXygz/b2sCW1K5n4cO/U5kmlVNwkUTJl9qbsSWblmefRHvMacpklLy6d
	Q5bGYlKj6PXbYKiQbXH8s5GajN9jx7+v28nX4SF/0aCIaAfbbuM2u5n4MNFFXpqGceYEr6p
	2KZleVtD9lEM1G34rijRMT8C88rPHLwBycI8DihmsH/IwTZ/XAEYsonZbtrLykSOUzsb9to
	BrUtNG65kSYgNigsb2s1Da2EBauceNiHFUWmLF+lgUA53qfsnp7txXYEEQxtACJm2Xa9x2h
	pfr4eAOFXaJ6+hhQj9iapDR0w537b9HazQ98BugMzcRJpFqyGB+nd31uEB/IIgN52ArAhTY
	NcV/MJ0n210GQ17h0jMfCFHw1nuQ1zuHv6hX0z1zlAPfM3hTDqf9iZGaacz0CV5uaoRciSm
	LHwfkRrqtxvFVYTgg/Of2wozOpItxa4A621c2OaLdx7xght+0qYL49BgvJ8elTqW0CSVsOx
	HStmUkSalCfO3zBnuEksA56JH/E+my+DgRsWd4cJSLXGycs1qI0xKFw4uWHsm3fXDU/Tu1M
	UX7bLtGmXCnX7Ir/m8RlLJVcqmO0eiaL9BASIrzS+40kXpAWU7EU3J/sDWQx9Ig3dpkMTsh
	S9ARCqL0ErRJgbq094XCEAVpfr7ZqSQG8Lw0e8EdOERWzHvYet1R1aU14l2herMzuVMtwK7
	WcKXY/F6KLii9/EN+4IRqYJCgZIhEfE6RfwBrBl0ZsXw+wXMm4Xmn0AS278VonROmbM14Ge
	26a2r5q0j3gx6EB0lwqPfPDMfZ/j9QFYFm+3s0skdfTVpT3+npy8FVJoG
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_001523_120529_030BDC0C 
X-CRM114-Status: GOOD (  23.72  )
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
Patch4 add new Type-C mode switch for RK3399 USBDP phy binding.
Patch5 add typec_mux and typec_switch for RK3399 USBDP PHY.
Patch6 add DRM AUX bridge support for RK3399 USBDP PHY.
Patch7 drops CDN-DP's extcon dependency when Type-C is present.
Patch8 add multiple bridges to support PHY port selection.
Patch9 add missing dp_out port for RK3399 CDN-DP.
Patch10 add Type-C DP support for RK3399 EVB IND board.

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

Chaoyi Chen (10):
  usb: typec: Add notifier functions
  usb: typec: Export all typec device types
  drm/bridge: Implement generic USB Type-C DP HPD bridge
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
 .../boot/dts/rockchip/rk3399-evb-ind.dts      | 146 ++++++
 drivers/gpu/drm/bridge/Kconfig                |   5 +-
 drivers/gpu/drm/bridge/Makefile               |   8 +-
 drivers/gpu/drm/bridge/aux-hpd-bridge.c       |  23 +-
 drivers/gpu/drm/bridge/aux-hpd-bridge.h       |  13 +
 .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  |  47 ++
 drivers/gpu/drm/rockchip/cdn-dp-core.c        | 354 ++++++++++++---
 drivers/gpu/drm/rockchip/cdn-dp-core.h        |  24 +-
 drivers/phy/rockchip/Kconfig                  |   3 +
 drivers/phy/rockchip/phy-rockchip-typec.c     | 420 +++++++++++++++++-
 drivers/usb/typec/Makefile                    |   2 +-
 drivers/usb/typec/bus.h                       |   2 +
 drivers/usb/typec/class.c                     |   7 +
 drivers/usb/typec/class.h                     |  10 -
 drivers/usb/typec/notify.c                    |  24 +
 include/linux/usb/typec.h                     |  10 +
 include/linux/usb/typec_notify.h              |  16 +
 19 files changed, 1034 insertions(+), 96 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-bridge.h
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
 create mode 100644 drivers/usb/typec/notify.c
 create mode 100644 include/linux/usb/typec_notify.h

-- 
2.49.0


