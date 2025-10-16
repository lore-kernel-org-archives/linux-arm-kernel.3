Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF099CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 02:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BEBhnIFYQE1pkIVJ1uy2FZ5QokSZYpQQ/FLfYRbFosQ=; b=Ljqw25WWiS3LPHOlFUNmMo2JMs
	iVT5+GXCFk8zKY+05GuHD6APx0l1q5dFY5i+Iw4tUfPvvzZO4qWpOzEK+3xtoR1JrGrCzW2Zbn4gh
	XGNd7rpLlsexnEADdiHLgYuc9HOPIy6sr7/K0g9mWpoFmjV5QjKeBnTrxGyfqua2tD144QsaVeWr5
	Q4u+8nr3iUzU8BRGw82J6ICqDAo7+AJ4vjpqjj8eHOM5u76YLq9lp/nX82nPKxZK0MF4ovfkdToX/
	K2NbjO9Jr3ZPLQYkfV5mych8GvQjtr9FboRWvzfao5i5NU4znCMEKX1hQcyysCAmjFHflMIzkegeO
	bDqgPgtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Djm-00000003H3L-2z6R;
	Thu, 16 Oct 2025 02:29:06 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Djg-00000003Gn2-3TJP;
	Thu, 16 Oct 2025 02:29:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1760581681;
	bh=BEBhnIFYQE1pkIVJ1uy2FZ5QokSZYpQQ/FLfYRbFosQ=;
	h=From:To:Subject:Date:Message-Id;
	b=bQsi1HqhedQTJhaaOWuFC3vwdMD0D2QwFUXiLIkmkueBWmZF+kMa/9XMyGaGBgg8l
	 JQhdJ2Isl64YFvdbHbRFoKy6A3fZtz7PnP4s7U1/Im779OZDX4RuC32VsfGr0INttA
	 wEFdn6ZBjSR8MJ+IiM/+jiPM1O+yYwe9z+9UGSqg=
X-QQ-mid: zesmtpgz1t1760581678t7a5fc67b
X-QQ-Originating-IP: OdSgz/RY05V2laSRNQnpB7+nE2yChLO2QesvXncio9c=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 16 Oct 2025 10:27:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16860135895729998045
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
Subject: [PATCH v6 0/8] Add Type-C DP support for RK3399 EVB IND board
Date: Thu, 16 Oct 2025 10:27:33 +0800
Message-Id: <20251016022741.91-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NPR7uEA6bBhoJp6Ayu/NBxpL+gPiyjv6wZBQ0tmopTdm92vp7L2/d0wE
	LGEOhizqbbVI+N6EAZkFBriLUvQLK7MUBO6vz6Jc3YUVEM3TXO0GTcerP2vgx0nCB/doHy/
	Vr5PQdruLB8WaiR774i7A5Iw+y8mxjiObNs3KTFifcmbSe3N3PAGUJaz0D+k0sLUEeEIv4X
	BbVCTaKjLfcFH3fchHaqL6K5s+l5escD6H8RuTrVjtHl+THeWNggEw6K1myNlYKV5X8rxu8
	MBCOrQpKTeCTXJA5TIElxzW+N8/SeKzoUnUf3citeJLhYLCKbgv1yBeQel62gProle1e2Uu
	hbJ/NbtG9S3UzGz7j3kqjoCfX8woqk44thkSr4/Oyc1W5ortZNqAQzeRgK0imXAJAzRm94o
	/BlHDZZTEco/IG72UFZswXofhGn6kzkYJDCWC14tH+7lgUu5yjANc0Lh/j0VFhDxy4awAFu
	CxUZw4bzjBWbKZ/jgS7Z5d58Othix+ncESL0E95/jdkqnlCBNNC4wOOWOmRH9iCSm3+Il+a
	WaHmpobZRYU7GonLDR3nnAS/KrqTskUNnLfz6pVnaTapJ//UMSY5NpYhBn3hTy6vK6V4hBh
	dfAwoeSAnJPtYP7kfgEQEKDf8RS+SDqE+TZ724Sigyk041k5oU18OT+I/ijD0E1Fhs22w2t
	BNbASC5XM2Q/Zg+KceDt0Ns0v1p2aXUTHU1Mm+Idrg6RVNBxvehaCw//Fkgg3drCBbwpUDb
	K8uDhkOchfF2+kPFRARpsHIk1IVMXkxkyJtTyLJJZFR1hU+1ed7NfzYnucrH6J8Tj6U98R3
	oVE2AV5ejyKjjPIag/Jf4KJlKzYRi4mqbSar99t2bEj9HdrYEpTc/RPZia7ZQMxaAFsWA4b
	lFwRNG4dNdITZUygVexKLWW2eCGYLScbbg/GIHpcovaJL4pMLbYFrIRvzQcatOc9EwFn9GD
	rk3P4ynD8bb3GKkPFBUIsF77kBXJSwpnGA5dSMV0wTJ7NggWTge6qYnS+4NcViGuaWPjS4J
	ajCrEZ+w==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_192901_286247_E5A89D0C 
X-CRM114-Status: GOOD (  19.57  )
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
 drivers/gpu/drm/rockchip/cdn-dp-core.c        | 354 ++++++++++++---
 drivers/gpu/drm/rockchip/cdn-dp-core.h        |  24 +-
 drivers/phy/rockchip/Kconfig                  |   3 +
 drivers/phy/rockchip/phy-rockchip-typec.c     | 420 +++++++++++++++++-
 drivers/usb/typec/Kconfig                     |   2 +
 drivers/usb/typec/class.c                     |  26 ++
 include/linux/usb/typec_altmode.h             |   2 +
 10 files changed, 911 insertions(+), 82 deletions(-)

-- 
2.49.0


