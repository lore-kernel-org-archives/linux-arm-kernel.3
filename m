Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1000BC55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 07:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4uFCqu0p0pYyvP6VJhfQU8lFG2oyNVxdn8MamPTgQlc=; b=c9AhKx5QhETpLwM/s9SGS91xK6
	taKm1hHT+/BeW9C96lUBW1wAXAFHbBhK2mFaKmuyfL/81k/cTq1t8neEOzL7XycYVcZbO3RBlzrNa
	VEv9z0rh5UEHBZMy+hzFqhLWI/sBaO/QFd4FSobscvb7W5ScegxrHMyQT1EfOJiCUagcEFmNrL4mX
	r0ip5ePeB8LARfSB5Rg0ydjSt5xytIcRrK8rB+QgziNLQZw88tKi5s8D6XBt1xfsCqOmT9wGdA9Yp
	L2eerqBhMcLMqdUfK/z4CWvcq0Fv/HSTzS8e/2Px/hbsUanjn7YjMGvdML65ualrAec5AHwrFl4+u
	URV/ONCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9OO-00000001CNR-3YQT;
	Tue, 04 Aug 2026 07:16:52 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9OL-00000001CKm-3QdC;
	Tue, 04 Aug 2026 07:16:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1785827275;
	bh=4uFCqu0p0pYyvP6VJhfQU8lFG2oyNVxdn8MamPTgQlc=;
	h=From:To:Subject:Date:Message-Id;
	b=I0yjU1PQzTUl8uMGMjjlAeTNYSsoxhq3OYQvlMCkqg7Mv4vdAJbvI4R0rziKlLsJK
	 KHA2qCoY0BSMGETCBhpFt4Urrwu3EC+h9miUpSvaabJzZNq7Zqv1lSjT6WFKCg16dG
	 zES1BudM3cL4KSETfVcROmu56w+yXzBHXEtlBMsE=
X-QQ-mid: esmtpsz19t1785827273t108231cc
X-QQ-Originating-IP: oW8kOPLlM9qGybeiNyNpDJs4YNZHTBEyPC279s2oho8=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 04 Aug 2026 15:07:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 452998556394821966
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
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v6 0/7] drm/bridge: Implement generic USB Type-C DP HPD bridge
Date: Tue,  4 Aug 2026 15:07:23 +0800
Message-Id: <20260804070730.68-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MIAHdi1iQo+zITF9HdJdWmWK40lUOF17tqavC4zys0fyH8qejoS/pbwE
	np/Zkorx7NcvsgkAwb5bHRabFByV2VX9yWm/0twxyCSXgLPbWpfIq5LuNI+QEsGjzjg516n
	FIccSAknBx9KjOnLdzK2UUmrsR/SyjvxCY+HhfL/Ri4HMM+ApMUq0g3zIwzDjmnpHn7Smnw
	dh1Tqpu7w9UF7ItBGBPtMJNoMV5PKa3Ftmgr3hs+FRzs3FinZHlQQ7Cwq7KkvS39VeXVCDO
	wbHR6j2I5fqRaPJRrqYQhJKb2ZqWMboee3zd9f4sHMMI1lMcYIQxfTic53pCvtAfH/oQpVR
	F/Idp4k0TnmOKw03UnNnpKK+pNwy98JQTTbxLPMwilI4j64uSVwlspOuD5iJRzQDaEuRtk+
	cMWl8G2DS/TxY2zJkwk+w9Je851dGr7QuSOagHN3eyc4AQYR2FL5V+xnRkjBb6XDeNsOQ8q
	LARU+NSKV0Rm4q2YvlNObupzGZO8p+x/+zCRPKH+ehyLk0EZT2GV5hmpPW6Taw+1pawo7mm
	O4az+lEG36Y6IbTYjzQem2msIXKaaGhz+D42Y+ZHuBe+N77v85JYkpN11AVfv8MaQmbPRhK
	SowDgI6ead6vPCLMKxuTAwC5Vm8nQgfv6D8CpVjrgnsm10/fFbd8Y2adVlI+8iQ87h/UDts
	CmWJc4S+bjlW0Qtgf9/LZvYnZ8MddGghTmM1MGb5FbDEfawNce/9x+4qw1+SewdxU9nUFl9
	D9ISbxk4GUzqJfNcqP07cpXZ+cxnFh5lvghymUx4Z5wtGsb+IAAZ1uf85nUoXjSxal/TzEf
	znd9CteZYiYAtIktIwN1/tJMjXu+Vr2NwNR4Ecy0ihGtt0xn/TBGfURVSqTKXWVpJPSIC/D
	ygGK8YymklF0jRfh+LCS9s1JlRToUg3PZE8KHSSR7SMzGHe0qR4bUIZ0vNgjOYYUtQlKOfT
	lwLNTzt6SPPUQA1jWNh/QE+QmISHgvjWqe8AlkKRkEvrX2MvoIAYz2WZoJmq/pwvDpkOLtr
	cgcvq2+igQN6uQPH4DIceEWqKHYOWPqJK1GDRxG5JfURzVZPXo
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_001650_243219_03EC8E04 
X-CRM114-Status: GOOD (  11.84  )
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
Patch 1 adds new API to check whether a DisplayPort HPD bridge has
	already been registered(Sebastian).
Patch 2 adds generic USB Type-C DP HPD bridge (Dmitry, Heikki).
Patch 3 adds module soft depend for USB Type-C DP HPD bridge(Sebastian).
Patch 4 adds new API drm_aux_bridge_register_from_node() (Neil).
Patch 5 adds DRM AUX bridge support for RK3399 USBDP PHY (Neil).
Patch 6 drops CDN-DP's extcon dependency when Type-C is present (Dmitry).
Patch 7 adds multiple bridges to support PHY port selection (Dmitry, Luca).

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
 drivers/gpu/drm/rockchip/cdn-dp-core.c        | 358 ++++++++++++++----
 drivers/gpu/drm/rockchip/cdn-dp-core.h        |  18 +-
 drivers/phy/rockchip/Kconfig                  |   2 +
 drivers/phy/rockchip/phy-rockchip-typec.c     |  13 +-
 include/drm/bridge/aux-bridge.h               |  12 +
 12 files changed, 479 insertions(+), 72 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c

--
2.53.0


