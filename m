Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FF4CD8C8E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 07:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c8bAbxQipQScLcXxmIAXdGHi58J7IG7meuZVe7IO+SA=; b=X9TLfM4o/CMbyQzDbTKeMH9cRd
	j5kqnUBLO80b0zHPGMr3kKVi4MnR2XMT8bYbS+4IXBho+rynyXcKBFXZVtw/n00lZDd16awS2zROa
	nyu3cOJEZE5VhjOy51oYGGkifj3yhN4NMCO0hkVPcKJSoWjzozC7d2Ud5uTtfwR7aeEHj8ttVAX7/
	HmJOhEwkF5phXOzQQWu/b14GO3ibOZiIeFSw1RTCot8rNvqQXvHLmqEwj43SGZut17sZIe/VJ4ZGF
	Yh+e2MzcRxoYyv8x29F5vbSgu6AUZHGgpH3VUa7m0CF4/H9RmuiWiHbVe7CC6LYibqXJEtIRUA+qW
	vtvT2/Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWU7N-00000002xH5-18W1;
	Mon, 08 Jun 2026 07:09:53 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWU7I-00000002x5k-45JS;
	Mon, 08 Jun 2026 07:09:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1780902496;
	bh=c8bAbxQipQScLcXxmIAXdGHi58J7IG7meuZVe7IO+SA=;
	h=From:To:Subject:Date:Message-Id;
	b=mDK6YMdpRY7m9SRtJHypLdlzY+VhKt5fQVhT7unz3PJHjc4NFBxceSGSFKAS4Qrg/
	 dJ/NYREd0JCx9c+w+8umwEIlGtTWiLO6MdkkEDAodP7OlEMTBS36vxJcybY1qPhjgA
	 Q6b2HaOmmcHhUF8u382DCglH3EFL7Ku2Pl3sMfi8=
X-QQ-mid: esmtpsz10t1780902493tf527980e
X-QQ-Originating-IP: xBVLmXb3lGPeq0AFgUf7H3AOXSDXzX2o6/6guapiblY=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 08 Jun 2026 15:08:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7290291170136112092
From: Chaoyi Chen <kernel@airkyi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
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
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH 0/5] drm/bridge: Implement generic USB Type-C DP HPD bridge
Date: Mon,  8 Jun 2026 15:08:00 +0800
Message-Id: <20260608070805.88-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NE9Hhheu2x9vYVHE9T0teSdVzas5yRHi8T9ZnaC45SfQWTZ6NujyCRkU
	NMCQglqAw15r06skp2D1kgxJlNhqDE0rfWLQWohDQ448RzxNIOVc3ovO+2GqMO/hDwx41uu
	WO4+gOYn2XuwW8D2pp95W2LgYedI/c6UMIQDuSOpDVrEchX6pUQiYMVPP4H9pT6YoU2utdw
	kUG5LUWDpQSD3FzgiGcWN/KUDFLiVIKTMjADvuKLE4FpBg0qHHlvbdLGYFdC/DnIrgliHT6
	DrbtU1HDbqaVF+uGZn0gBk4RKfKW6lSuHmGN9Oa9iSd3TfB+XKqM3On9Hbn1Auma9z1zydu
	ZSXPD4zWYI/74H7ePoLptoxQZjggxFKg8ZC50o3+3paxfWJUN2iTYAx+ZNj6T6JxYTxoHOx
	MmCo+6BtTR7hw38gLbvjGoeyILj/jdys59QdBwG7flwP0pGjYBGuKLs2zHnFPYCe3d66rDu
	6qndCcLTZagkBIO975s8auyY0cpYEvJQkNmzTtwoy/XYsVzb5h17LABHfRTgMMKe7L212Fq
	zOdJuTc2q98kml+N80Q4FygPpScdqSG2/k+SvJ3UlmIO6QFtnoQNffytu5ATLlNPTkBHN9R
	adEI6VqBiuHIfq3lxGnoQT5gCeuVmcYVzIpKTuJUtt126+Hffe/774z4GwO4In14l7D1pIr
	E/jy3YJRLFUOUQzVds+OZ3utYjTOcKYe73DdS4Behp2c4MZoHC/ropxaASrz/HooR48H1mo
	JQ5syMzO7DX8hpRel0gdpwqPr6Kc28sb5w/xlA5YXHqTC91dxcbVErf7Vtx13kN4vOB+uOD
	0336yvRpQHW+nc+VH42eECR/wGlAhWRN/uvCDhVKQ6QnsYzz8+WikK/IzkV5FkYs3ygjRne
	MJTGBK493ppMMkqhq7N2LqUV/qcQtptzohcEanopYDon4zGgLBe51HkZ8ogg7L8C3DAwpHL
	wV6OAKOjgEiEKiI+j9LX6MAmUEJFeWrHXU2tNFu1RWLJghPKxuSIxlX1nB5fNJYicEW6NMe
	ygOaPJbTWrOAJqnKFYmoT+slUsg1Y=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_000949_825137_26972342 
X-CRM114-Status: GOOD (  11.49  )
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

This series is split from the v15 "Add Type-C DP support for RK3399 EVB
IND board" series [1]. It focuses on the DRM bridge and Rockchip
platform CDN-DP controller changes.

[1] https://lore.kernel.org/all/20260304094152.92-1-kernel@airkyi.com/

====
1. Generic Type-C DP HPD bridge

Currently, several USB-C controller drivers register their own DP HPD
bridge via aux-hpd-bridge.c, each duplicating the same logic. For
devicetree based platforms, the USB-C controller may vary across boards,
and not every USB-C controller driver implements this feature. Patch 1
implements a generic DP HPD bridge that monitors Type-C bus events and
automatically creates an HPD bridge when a Type-C port device with DP
SVID is registered.

2. Multiple bridge model for CDN-DP

The RK3399 has two USB/DP combo PHY and one CDN-DP controller. Patch 5
introduces a multi-bridge model where each PHY port gets a separate
encoder and bridge, allowing flexible selection of the output PHY port.
This is based on the DRM AUX HPD bridge rather than extcon.

====
Patch 1 adds generic USB Type-C DP HPD bridge (Dmitry, Heikki).
Patch 2 adds new API drm_aux_bridge_register_from_node() (Neil).
Patch 3 adds DRM AUX bridge support for RK3399 USBDP PHY (Neil).
Patch 4 drops CDN-DP's extcon dependency when Type-C is present (Dmitry).
Patch 5 adds multiple bridges to support PHY port selection (Dmitry, Luca).

Changes in v2:
- Link to v1: https://lore.kernel.org/all/20260521032854.103-1-kernel@airkyi.com/
- Add copyright text.
- Remove useless goto.
- Fix incorrect function names in the documentation comments.
- Fix the check logic for dp->active_port (0 is valid).
- Fix the uninitialized prev_port.
- Remove duplicate logic from cdn_dp_switch_port().
- Fix the prototype of cdn_dp_bridge_hpd_notify().
- Properly release connector->fwnode.
- Properly release next_bridge.

Chaoyi Chen (5):
  drm/bridge: Implement generic USB Type-C DP HPD bridge
  drm/bridge: aux: Add drm_aux_bridge_register_from_node()
  phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
  drm/rockchip: cdn-dp: Support handle lane info without extcon
  drm/rockchip: cdn-dp: Add multiple bridges to support PHY port
    selection

 drivers/gpu/drm/bridge/Kconfig                |  10 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/aux-bridge.c           |  26 +-
 .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  |  54 +++
 drivers/gpu/drm/rockchip/Kconfig              |   1 +
 drivers/gpu/drm/rockchip/cdn-dp-core.c        | 358 ++++++++++++++----
 drivers/gpu/drm/rockchip/cdn-dp-core.h        |  18 +-
 drivers/phy/rockchip/Kconfig                  |   2 +
 drivers/phy/rockchip/phy-rockchip-typec.c     |  13 +-
 include/drm/bridge/aux-bridge.h               |   6 +
 10 files changed, 418 insertions(+), 71 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c

-- 
2.54.0


