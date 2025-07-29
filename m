Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCA1C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 09:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h5rOQQlCm3mMG1zR9ipfzak+qf4Y9/HK8RHmvv8tYyI=; b=4a8pZiZLd2zkUlXOSkirOAAYsz
	Yf783/B4HEWVwYQIRVmDjyL5huHB9Rn4bK9etJAV81MTPmcgkqR36UUvtZF4ZW1gBzWz/sfiXOYV+
	NTtxITKDtxWjnezXDcgjf71w5S356rVozHttOO3Kze03b8EZe2oNNyUlcT2QCJPpAYqSVLKb5czO/
	3VIDYTFyR77t5Io9REQl7cMcaWfSElTYVCGh++o9bb2gfyMk8DU/1LADpnOdL2GGTo80tiKupysyV
	TFVwl81DRMrHZRcePqkAEvC2gveZE7pNTJHIRk5O/xOC0F0/QMcUHH+DkxW3B4i7KDILwFf1NQ5YA
	2YgcLnDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uggL7-0000000GLMj-3DhB;
	Tue, 29 Jul 2025 09:09:41 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uggDa-0000000GK3C-2i3r;
	Tue, 29 Jul 2025 09:02:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1753779650;
	bh=h5rOQQlCm3mMG1zR9ipfzak+qf4Y9/HK8RHmvv8tYyI=;
	h=From:To:Subject:Date:Message-Id;
	b=YrxINFpO9QGsXio4NTQUA5Q4ZJ2rIss+asvNpBkbm7HP8Pt4Tc++fIrEmnno5TK+W
	 U9F1zztqgz3cEuPHYQ89QzqNvc4/OoIuDoiNnEjJvD2hf3GrzwVNwusxAmhnFQ4GpF
	 zfuJa0bVdPniDyTFQxtLm9CePg5SkHcTbnO16iZY=
X-QQ-mid: zesmtpgz1t1753779638t27222fab
X-QQ-Originating-IP: cz+4QRIh5zK5tw8iLI3ndpSJrAFLnEtHKaV7KhcHQcA=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 29 Jul 2025 17:00:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4146631262235089241
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Peter Robinson <pbrobinson@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/5] Add Type-C DP support for RK3399 EVB IND board
Date: Tue, 29 Jul 2025 17:00:27 +0800
Message-Id: <20250729090032.97-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: OFWsfmE1GYcukqBTA8F0z6RhPtcbV05bDsC8a3L2NSYv/R/gB53oq/xs
	IQ6IxMjOljbkhYOdFiuj+CVA+qqMKF55U/eFkCgENGwtCs9QtbTW1bQ+P2gM/+SZel/+D3V
	meyJgu3cU9FD9WI2h5fHudo66/yxGKczYijr0LbnXX/2et7DcMxXuyfd23Bea+zx0IB/hU9
	i7AQQsXBOlAQhDkIqUVoz9ZOjam+PNb1JIXFwBRk08iVZ5VFgtEUmQcgoI1dXiORetXDGnr
	XUBPVgOL/VJCFJ/rLia8F0i9vLxO50iYisFQyJSztTC7py0/DWQSgwpnLu6syJBipJEw7ka
	uFU6dBICBz85BdNVAJIkx9V8nBPAUznAqPp+1mNsYFtUtj5Iy6v/qw4PMPCl7YRXWo7wtIC
	0jMwZAm32N06DcOtezxBTCDW/h1tlTgWK2eNrw9bAsXDUQajloZ4/HGuCiuPpDdj/D18YXH
	TpOEikxQItuwaNxUB4KkTi4jID2YIn0XdV+ID7E6CIryWVIsvtCPH095ODl+5S/KYbFN74Q
	IH1HPdu/3PX/UI6jIrDhI4w3xlkHokAEBWfnpOeJ87SPcxP96ZNOJJuCoUUNe9LS617Yein
	sVLg9pWK7L+rLcFMsY/W/v8SV7fqGL8mDNy7JeCsgTRIPgddcL6WNjo/nLnRPL6492dxahT
	wGaiRpYPI8Y18VyO5W4CJuYy1jTO3iiHAxePBmdnHTQUX4F44Xcm+662pF3jhDoyWyR5drx
	cz0nC7/NGi3ftGreN6oMSsbIcurtNLhH3vK8iE8fbt09Xn7yA+HYZUJjyZ5Mxzng9HRWt0I
	EhYxAlDKoJrAt/xADwmP+zNIf3BgoQhMl1SBTbcG9wdajBKcnPgHtQcv/Y25itzqHQBMjW8
	f1xejgJi9WTvK7m/aPqKoUOpnRl0Q+LHFf5wo6tpD1d8zlmAgP8Y4mwItuXsHbfK8j5OapR
	aI3wayh4AHNOQHhZEtUc9q9BLYDOKhtu/BvfaoYh2b2Lxpb7mUafUtOs8
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_020155_342386_81701B8A 
X-CRM114-Status: GOOD (  13.82  )
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
1. Altmode switching and orientation switching for USBDP PHY

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
2. DP HPD event notify

The RK3399 has two USB/DP combo PHY and one CDN-DP controller. And
the CDN-DP can be switched to output to one of the PHYs.

USB/DP PHY0 ---+
               | <----> CDN-DP controller
USB/DP PHY1 ---+

BTW, one of the important things to do is to implement extcon-like
notifications. I found include/drm/bridge/aux-bridge.h , but if the
aux-bridge is used, the bridge chain would look like this:

PHY0 aux-bridge ---+
                   | ----> CDN-DP bridge
PHY1 aux-bridge ---+

Oh, CDN-DP bridge has two previous aux-bridge!

Now, I try to use drm_connector_oob_hotplug_event() to notify HPD
state between PHY and CDN-DP controller.

Patch1 add new Type-C mode switch for RK3399 USBDP phy binding.
Patch2 add typec_mux and typec_switch for RK3399 USBDP PHY.
Patch3 drops CDN-DP's extcon dependency when Type-C is present.
Patch4 add missing dp_out port for RK3399 CDN-DP.
Patch5 add Type-C DP support for RK3399 EVB IND board.

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

Chaoyi Chen (5):
  dt-bindings: phy: rockchip: rk3399-typec-phy: Support mode-switch
  phy: rockchip: phy-rockchip-typec: Add typec_mux/typec_switch support
  drm/rockchip: cdn-dp: Support handle lane info and HPD without extcon
  arm64: dts: rockchip: Add missing dp_out port for RK3399 CDN-DP
  arm64: dts: rockchip: rk3399-evb-ind: Add support for DisplayPort

 .../phy/rockchip,rk3399-typec-phy.yaml        |   6 +
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi |  12 +-
 .../boot/dts/rockchip/rk3399-evb-ind.dts      | 146 +++++++
 drivers/gpu/drm/rockchip/cdn-dp-core.c        |  37 +-
 drivers/phy/rockchip/phy-rockchip-typec.c     | 403 +++++++++++++++++-
 5 files changed, 579 insertions(+), 25 deletions(-)

-- 
2.49.0


