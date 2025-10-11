Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0E7CCD18F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 03:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1ifJLk8873eX1hlHsp6hKpNT8S+IOtOqXiAmk6qv8rw=; b=QCup0q1NWvI1hL6KcvuQtOZR1C
	pCwwxQDTG9pofusptfKdaUouhc1Iof6/dHTJrEKi70U/YshJMOjYP41oGH8wSzXyQKNXEr5BAGlGk
	/S9LVre7ZSreuyzX8PrjwDZSfsLybHHu/mtysq070wu0O3adU/NehlN0oB78/OhjTS38PuaPS928t
	MVUGluti6s0ciOl4IwDcf1O073EHykRriUHfgl5aRmmzZUyDc0zglzfHbsNGK/lcNQpmaFTsTm8Ip
	axy+1sgdjeFfdEXaLPsVXitHb/0v6BlG6aFWAErXmFgAxqsYLehaA/OdykOSfmenas9Fielux+bmc
	RUAhCveQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7QMu-00000009k36-3Apb;
	Sat, 11 Oct 2025 03:34:04 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7QMo-00000009jo9-3qFl;
	Sat, 11 Oct 2025 03:34:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1760153566;
	bh=1ifJLk8873eX1hlHsp6hKpNT8S+IOtOqXiAmk6qv8rw=;
	h=From:To:Subject:Date:Message-Id;
	b=qlu57r/4kkb9HdKEBFndccNBvtZn2+um/TEpE77K+vDZzOXEbEy3qCHUhz3ILboEQ
	 lmgm0uut1txQIOfiCKgCJ1ky6Nc5mOq34q0vnuU7dsbsOumkoyE6nCkoC1ZELxrvqR
	 g0iVJ2TPzPWpuZlm4KkTnEMT9PTk2XOmdiaNmRoM=
X-QQ-mid: zesmtpgz4t1760153563t46dff691
X-QQ-Originating-IP: vSCtcccqW2noE7PwTMsxNxd6jA273YQLY2Nnsk4ppuI=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 11 Oct 2025 11:32:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11891270749055428238
From: Chaoyi Chen <kernel@airkyi.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/8] Add Type-C DP support for RK3399 EVB IND board
Date: Sat, 11 Oct 2025 11:32:25 +0800
Message-Id: <20251011033233.97-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MhFAoh6gmjppNgUGjKgw7K86FI28KNCryc0STrR/oTgVkI2AfYL2mBZ0
	t9Nrc9ZVK948mafusknaQtdBm5EXqF1mnMU7ax2RhKDot1H4BWoLT6QexAk3QoeSNSY6MDn
	RMV4Y6lfxJLAcajY6ow9B6gDBcH9YZXrX15vN82GyaUTGs+ztsypr3ur8hiUx15NgPF9kro
	XbIPEfDcaz/VP2LcWeIsClDvpQfTTT+ub+gpmcQw/MsQd1o4fHCGiBt+XPJn1/Z5pKl3eP+
	3ikhGtjYnVCFc9LE6Wsqk0FTcehYRXuTMFcDWUj1ptYPmopOYivB6P9weSws5sDR9i7Egmp
	AXHhEQG4WVumECyaUh6uhBz22diZE94g3pplVmwQjW9012UBgUNFtO6pdJxqXSXm1srCS6g
	XcYBy5rbOHYY3JFllCjhAyC0K45FxfvQI6wEkIE1Soxl4TCEcPjRVmtaQ93AH52IuS7m//s
	7cqy+3CzEQLqO8NMnoUx0LFrYR/pVfYzbLgNFNNPnhWXAWkB07UjniXbVp58oxKzSHxfM3b
	Wq4g87WnM3ajXFHfPN8GPTaRLfj/3OoFvUciDNxWx6VorGUCAQmAEgRTUhdZrUXn0USse1C
	E/fpsLr69U3u0wxRwr+Zx9ZQBWUL+oqEPJcagn/zgvKc/Ex6zfFKLkrZ8mhs7Hss/HUDz10
	zsc2oK7l+wnYleW+xw/KlKUyhc9tCsIVxepalh8lR5wEE8ll89GggKeCxpazY305FZPqW5B
	UcJQsH93I12lg2t6RVfx4IGy7wBnjLDt58NP5is++8esd5NyzxgTotY4QvLU2QXDPh4yBpn
	c+R8PrK3OWP47OEbnvZ3OpR4hvvdePYXpcJcp1SrVASqZ18ZAJbEB2zTGgss9cg55q1K1Me
	1nLQhzL1uHyVVZ+9V7InnO3jxMzcA8fnjegfl8gj2iR9KEr9dTKOmOLGYX/g8WkQnQLE2In
	l2YUdwPMv8awzvrNxGf+p1uDjbRRWnubKvpyMI/KNlC/raW6PywX+YZw8051e42EicjEK5I
	jgokr0sg==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_203359_579930_108E9E11 
X-CRM114-Status: GOOD (  18.97  )
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

Before v4, I implemented a variety of DP HPD status notify. However,
they all had various problems and it was difficult to become a common
solution.

Under Dmitry's guidance, I try to add default DRM AUX HPD device when
register DisplayPort altmode in patch 1. That makes it redundant for
each Type-C chip driver to implement a similar registration process
in embedded scenarios.

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
Patch1 add default HPD device when register Displayport altmode.
Patch2 add new Type-C mode switch for RK3399 USBDP phy binding.
Patch3 add typec_mux and typec_switch for RK3399 USBDP PHY.
Patch4 add DRM AUX bridge support for RK3399 USBDP PHY.
Patch5 drops CDN-DP's extcon dependency when Type-C is present.
Patch6 add multiple bridges to support PHY port selection. 
Patch7 add missing dp_out port for RK3399 CDN-DP.
Patch8 add Type-C DP support for RK3399 EVB IND board.

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

Chaoyi Chen (8):
  usb: typec: Add default HPD device when register DisplayPort altmode
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
 drivers/gpu/drm/rockchip/Kconfig              |   2 +
 drivers/gpu/drm/rockchip/cdn-dp-core.c        | 380 +++++++++++++---
 drivers/gpu/drm/rockchip/cdn-dp-core.h        |  24 +-
 drivers/phy/rockchip/phy-rockchip-typec.c     | 417 +++++++++++++++++-
 drivers/usb/typec/class.c                     |  26 ++
 include/linux/usb/typec_altmode.h             |   2 +
 9 files changed, 931 insertions(+), 82 deletions(-)

-- 
2.49.0


