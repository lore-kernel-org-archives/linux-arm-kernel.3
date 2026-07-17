Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8817FC44515
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 07:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2tr1C24m6438i96kG1sAxMeU7KitaPRaCcPLLdcWwQ8=; b=Dr7PvVJyX8n605cKR2XsjqQkRd
	GhhmFK5BLDjbqpU9MIUQmDTA1FtR12QWAOxu2Flu5vpulTlR5uTlIKQKntVX9ewXt2CSadblS1izW
	1kE4uV8qvDrXHnxrWDiDgoUIGaYzXsaacO1nAneryGy2eVDdIi7k6qYKda9O/JLKx9Jbq2tCeg9/K
	Hz4zcZfC0m1XV8Zv7o9kZ87X8nXiFXQiTKRsBL9E+Bs8pwdZJEtkQkPXOM6AyWTI6TNZKRsEWTyrP
	ifjsyJxW7JtXOaCrIsHb0bfJDU/ojOz9QRqC3apYg13NSMjJukVMaP1VfblkF+h0Guj7oSUHUrMxa
	ew+b3FFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcw2-00000001QK7-3BDV;
	Fri, 17 Jul 2026 07:24:38 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcvo-00000001Q6O-3PXM;
	Fri, 17 Jul 2026 07:24:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1784273012;
	bh=2tr1C24m6438i96kG1sAxMeU7KitaPRaCcPLLdcWwQ8=;
	h=From:To:Subject:Date:Message-Id;
	b=C+Pr/GhPjJBPbdJ2LD3baHMmTOp8Snt5aNFwKXNkeFMyZavQ3cu2vg7IoT34UQwFS
	 S9SbxJ7NhfgCqIlXJt/SidJ+43W+BjUb8WW74w2LjyQiuyaRXdmFtyHMu62UKDZywp
	 5tec//Zf5la1I5pXiopcSwpQJBrvZXfccIMJd0g0=
X-QQ-mid: esmtpsz21t1784273010t618e8b28
X-QQ-Originating-IP: vY/0NsjWxg2DNZvyWYpAsBikB9jLNme2YFNb+89ui+E=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 17 Jul 2026 15:23:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9790818574636150360
From: Chaoyi Chen <kernel@airkyi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Vinod Koul <vkoul@kernel.org>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v3 0/5] drm/bridge: Implement generic USB Type-C DP HPD bridge
Date: Fri, 17 Jul 2026 15:23:18 +0800
Message-Id: <20260717072323.96-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MsgkoYRPt7igYy2hXHJMQr9XNB7AMnTF+J8Uakx1P15+TZ4rfo6ax2dP
	VQgk6Ov8P+/kK3maaqIuXrYlWXsgMtt+GQcd8Prk6DO9s2wtxiOWvRaLmbVanH0koI0W2PS
	p/LmtwK4hZQN0HDiv2BtNSu55LVOx06zGu7VFZNJ7kr93xC9U474mZ/fW/MnRFW8d8aluMn
	t4TBfcBNSehMCc5/1RTTKnVGWHTMaD5swWSCJQycgd6CNThvfu9I3hfo7aZc16/CqnAG9SU
	AdqT8csSu1RRS7HeznUy88Nll3whAgM8lSrFwJzzIQSdTABiXPZsNEc8NGfPkxlh+pctboL
	efW6qlS0/dg/Q9Qo3TQIz/rvDeANDN/fe+EutGe5WK9C3vcucwHk+fETJnkkxTczc5s9NE6
	/2X6fd5mml7KZsGM8WW3dXymilfJeoci+5ME7rK/2FRyEFmgqmCTdSNzoUkWp6X399D8hFp
	eieTPqfK8VbtSxnHrVKSnvD9TvEbY/DJnRw4MJuBuaQZMtUkEf6bS6GZhvYuEFOlVGp1YOG
	qq8+B9bLPzci7wSH80h7VsP5KXGL6O1z5vr/ZOguRbbSDC0jtxuRPmlN8UPyHgwWCiXqFxx
	o78UN3oJtuof/X6hpdFbIVl4LVqtlv8EF4O2kTIeomBsAtB+4tT6vyNIRngmBZU/Fd++PCJ
	h7VmATaGfilz2YZi0Dc8xfa+orXVpnAVWDS5LfkYuqEydTYP9M/9ce6MNgbo32FsifE0ST1
	aLeidD0612J9CG40qc9pxMBkLQyHURIht15ijiiyckE2sdhsohlsfH3tomaRlPtzTRJIIEP
	JLcI7KXPmwZQ7nAQ+/OnXahLdEfAqD/r/mruwE/0mfANTYYjIUt+fjGEaA5hUceK95Avu4j
	aV5JsktlMBidLwYNgiobsOVv8eQizw9ftm+v/xvGChj3B/R/lm6RLctBv9tM38x+19xvh19
	MLlI6bpdV2HVoYM7OQNC7vkdJPIEc7dFmX7VDT/XZi08G67wbZZ3OskPEPPDvLC9YwA3pLL
	9rm+K2GQ==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_002425_357077_39C3FE10 
X-CRM114-Status: GOOD (  10.82  )
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

Changes in v3:
- Link to v2: https://lore.kernel.org/all/20260608070805.88-1-kernel@airkyi.com/
  (Sorry, I forgot to add the "v2" title, so it looks like v1.)
- Remove now-redundant call to drm_connector_attach_encoder()
- Rebase to v7.2-rc2

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
2.53.0


