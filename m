Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250E1606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 07:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gfsm7NBi;
	dkim=pass (1024-bit key, unprotected) header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=vUBet9So
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pZgjT+oGEQ5K4V8MyzWimB+k4UA7CFJooI9DXyiZa2E=; b=gfsm7NBiZxQzmshRlAER2eimMf
	yPqr7QadkShqQTQrklQYl4tLj0YiUR7XWxnJ7o0doo3lpvkfqylMMoLmDgQPN1PR5QcPcgv/n9SKy
	Sf2xT2w9YKgOuka+szDKxdn98C/4YYPm6W0Iz3/wqwjuJcrcEW/YtLc5/9GY+CEdtowyIENp+EfHO
	kw5ibRvyUibzpCNWMi1CROHargPmTkk4x64/vre+WVTCVNqYDXjmeVnuF6HdXKIzsv3xz/p26Xs4O
	uBimqfHYTIWjSVGFy7Q6K5JTZL9DQyq/0sUR3Q6Zzlt/VF8o5w4OufY/r/oVL/x7wJDlVmFEOpE34
	70HOYz0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ4IC-00000009265-1uYw;
	Tue, 20 Oct 2026 07:29:52 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ4I4-0000000922k-42es;
	Tue, 20 Oct 2026 07:29:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1792481318;
	bh=pZgjT+oGEQ5K4V8MyzWimB+k4UA7CFJooI9DXyiZa2E=;
	h=From:To:Subject:Date:Message-Id;
	b=vUBet9SowMU58pIAs5Bnq0NBzCzas6qyFybdjJ5bmb6ZL4XF2h+BexdSeruNr8IyF
	 7sDIjsvaVlmUJiRgguwRODyLOZZwCgQPtaH0pX+FqmtInWU+qDAHOgJrQsoTDHEzYx
	 lvVKiAZs7JzjX9mC+wv/GwOgzxGR4Ii/MWiAbZ3g=
X-QQ-mid: zesmtpsz4t1792481315ta7e4ccdc
X-QQ-Originating-IP: BaQu2KOZZmPISr3BKq2G0ONYeW3roXRaqXQcRqdiHvM=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 20 Oct 2026 15:28:32 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1917325487105428466
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
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH v8 0/7] drm/bridge: Implement generic USB Type-C DP HPD bridge
Date: Tue, 20 Oct 2026 15:28:09 +0800
Message-Id: <20261020072816.180-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M4afFXlZrPyBiC6UULLsbTLemqI7xA+KM1Re9xYGYf9JEeNWHMb/QAGP
	BpOt68sFuuMP06UgY67XD3KvGH9EjQ1MacU4HdSH6EXLLHOsD49+OfVfvXyysBF5sJtqn+f
	4QaPG/3KC1uhWsh6XQiNlEzz0US4EZC67lS8pdA/6liA6g/KDPTao3IQ6q6v9TTBkbEMQDz
	5JJJRvjzXeWmV0pUnGxvJ01BJX8QYyGGbR6IeCcrc2ltslGoF4eC7/qY4YD3/VobIGPIX2N
	qF0orrnWjgi9nQhii9qUp8mTwXsijFOqeo1u7xWtLCz/ZJJQOTac4JFx2fMbRn+3nWngh7+
	XbbUFFjBrjmF+KSPDDQgQ0r9M64JuG9by73Rf7rsOr4xCohQ+7lxef5ayfMWap1lTF5le64
	L6/ESF5RL2ZUuTlUscvkeS4F5hn+xSPJWT2tBekOaM0MEsYbJz3pbZQn87qXTRuK6ANX72t
	rMX4J0i89/8xCvbxmiZ9httn+B5VCwVIVoDeKdNSmXjWUyDdQ7vqc8KS/XdmVOpnYyQE/w6
	aKx5YhXRTyrU+3P2YEjfG3wFq8Bsv1wbb1jkXlXPjmH/6TFYvVjDwxJXeHNW5CUs0+MBbEg
	+Kromx3KIDqIXhGF1LR74VSX+rYGIOVnkx7lkyQYaNiGns5BeKOx0r/nMJx53bJBp2u2mzR
	6BTJam3q4ptELzod87Jqo0ULo0G9abGIQvQxbCvgOJU3sBAheVLzlC3u1oo7RxEG82BPmeW
	oSCYzPSh65ozwZSFNpcZyVA2EF59bQRDupBQ75ZV5SAlfOYVFbwkIzMB05ZYzxk6w/z9R1g
	FTUWVdGMkddEc2l+NuLMOS0HroSFKWetKMG4InDDxKoyH5kR7WjKKFz9cjB8JNqr6nywJnL
	CR2/YwGoNLaCE19zAAbv166TSeFSGIS++hec6R4iHoLETSI8GjI6fmc1969pKpcB2fZN9rw
	5JIuyIiIbsTREydTLSMDD8KoLM97NkyhBY0AIrPiVnbDxHOgW12o0eMiccq1n2KIB2tRA+l
	xgt78zQ4F9HZlKMcnN
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_002945_525581_E1ABC451 
X-CRM114-Status: GOOD (  11.84  )
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
X-Archived-By: <archiver.kernel.org>

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
Patch 1 adds new API to check whether a DisplayPort HPD bridge has
	already been registered (Sebastian).
Patch 2 adds generic USB Type-C DP HPD bridge (Dmitry, Heikki).
Patch 3 adds module soft depend for USB Type-C DP HPD bridge(Sebastian).
Patch 4 adds new API drm_aux_bridge_register_from_node() (Neil).
Patch 5 adds DRM AUX bridge support for RK3399 USBDP PHY (Neil).
Patch 6 drops CDN-DP's extcon dependency when Type-C is present (Dmitry).
Patch 7 adds multiple bridges to support PHY port selection (Dmitry, Luca).

Changes in v8:
- Link to v7: https://lore.kernel.org/all/20260828084737.565-1-kernel@airkyi.com/
- Send missing HPD event to userspace in cdn_dp_pd_event_work() (sashiko).

Changes in v7:
- Link to v6: https://lore.kernel.org/all/20260804070730.68-1-kernel@airkyi.com/
- Fix extcon HPD detection by checking lanes in cdn_dp_connected_port() (sashiko).
- Bound endpoint count by PHY ports to avoid overflow and uninitialized reads (sashiko).
- Use drm_bridge_clear_and_put() to clear next_bridge_list pointers (sashiko).
- Clear EDID cache pointers after free in unbind() (sashiko).

Changes in v6:
- Link to v5: https://lore.kernel.org/all/20260730013349.51-1-kernel@airkyi.com/
- Avoid duplicate registration of the same DisplayPort HPD bridge.

Changes in v5:
- Link to v4: https://lore.kernel.org/all/20260727064408.101-1-kernel@airkyi.com/
- Add module soft depend for USB Type-C DP HPD bridge.

Changes in v4:
- Link to v3: https://lore.kernel.org/all/20260717072323.96-1-kernel@airkyi.com/
- Scan the entire typec_bus and attempt to register the hpd bridge,
  so as not to miss devices that were already added during initialization.

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

Chaoyi Chen (7):
  drm/bridge: aux-hpd-bridge: Add drm_dev_has_dp_hpd_bridge()
  drm/bridge: Implement generic USB Type-C DP HPD bridge
  drm/display: Add soft depend for aux-hpd-typec-dp-bridge module
  drm/bridge: aux: Add drm_aux_bridge_register_from_node()
  phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
  drm/rockchip: cdn-dp: Support handle lane info without extcon
  drm/rockchip: cdn-dp: Add multiple bridges to support PHY port
    selection

 drivers/gpu/drm/bridge/Kconfig                |  10 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/aux-bridge.c           |  26 +-
 drivers/gpu/drm/bridge/aux-hpd-bridge.c       |  42 +-
 .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  |  67 ++++
 .../gpu/drm/display/drm_display_helper_mod.c  |   1 +
 drivers/gpu/drm/rockchip/Kconfig              |   1 +
 drivers/gpu/drm/rockchip/cdn-dp-core.c        | 369 +++++++++++++++---
 drivers/gpu/drm/rockchip/cdn-dp-core.h        |  19 +-
 drivers/phy/rockchip/Kconfig                  |   2 +
 drivers/phy/rockchip/phy-rockchip-typec.c     |  13 +-
 include/drm/bridge/aux-bridge.h               |  12 +
 12 files changed, 491 insertions(+), 72 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c

-- 
2.53.0


