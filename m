Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3B5D232E8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 07:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O7pzVTj6X0AEeV6swURMFMUKvFmICmffgzcekptf2P0=; b=EaISX1U3KDsFIE
	HNZLSe+/2jHjhAz372OUZORb937PoQbqyyT9BdkQpXiJpOW97aRUt2+ZJdAj+N73egcKCkVwjKZF2
	LlkRz9fzlR6sPN41QKeD2Aw4UfJKefm9HaaF5372XjrBu5RNqGfmErMC0PUn7hSCElh3t7c4JVvrp
	yVCES+CHPqsoVsDwvLReKfKIkhHLqKMyJZjOwTGe8+eHhhELRAlw+JB1laz3uhTInLnYpkOb8Hk0D
	ZfoEOsA9xHlpXCvEQACaIdKpn0tsGARp6rcN6HQdv9v6HynTUagbtd4oRiXprjHBkPQW7TOECO8md
	3OXm2shqzHq1VqUGuQxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve6yP-00000001j8W-3sIO;
	Fri, 09 Jan 2026 07:31:54 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve6yL-00000001j6t-0uRG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 07:31:52 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6F9CBC1F6CE;
	Fri,  9 Jan 2026 07:31:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7FBB160734;
	Fri,  9 Jan 2026 07:31:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BBFBB103C87E8;
	Fri,  9 Jan 2026 08:31:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767943904; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=O7pzVTj6X0AEeV6swURMFMUKvFmICmffgzcekptf2P0=;
	b=vWenyqBDDH8G1zzaYpSa7Rrze6ECMjD08JHWjpuC9NeezlEl8GKQMyr6uPHyJ76o824+As
	FzzSYtLMwGVmuDgeTPxQJZIBN3mcgSo0Dw8aZDq+ZttsrbUSBUbfg6No6g4dYbTqJlDXih
	yApcnzSTeppghscMgDHf9Gilzo986LSZTDNL/xzNXktqAEgwu4xxtY+Jgz5qpqQODQrFO5
	0XzZ/QGa7eWoVQ1vzkldtn1FjCbEgbyw4OzRYFRBc8z0zlhmVlar3Sx4S1FejR7tNj8Z9f
	1TBajImkXcBSK8bmcYOmNiinYrljqkaT42IXL8yGHmjBIjUfGYcuTP6vr4QVhA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v2 00/12] drm/bridge: convert users of
 of_drm_find_bridge(), part 2
Date: Fri, 09 Jan 2026 08:31:31 +0100
Message-Id: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANOuYGkC/5WOzQ6CMBAGX4X0bE27xIKefA9DSP+ATZBiW4iG8
 O4WNPHsceZLdnYhwXq0gVyyhXg7Y0A3JIBDRnQnh9ZSNIkJMDhxgJwaf6fKo0mL7HunaWvjOMX
 N166pGxxM/d2BctBCKa1EeRYknRy9bfC5527Vh719TKkaf7LDEJ1/7S/NfLNbXTDOiv/qM6eMQ
 pmbQinJBJdX5VzscThqdyfVuq5vAxQV6/8AAAA=
X-Change-ID: 20251223-drm-bridge-alloc-getput-drm_of_find_bridge-2-12c6bbcb6896
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Philippe Cornu <philippe.cornu@st.com>, benjamin.gaignard@linaro.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_233150_089155_A2E16EE0 
X-CRM114-Status: GOOD (  12.76  )
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

This series converts all DRM bridge drivers (*) from the now deprecated
of_drm_find_bridge() to its replacement of_drm_find_and_get_bridge() which
allows correct bridge refcounting. It also converts per-driver
"next_bridge" pointers to the unified drm_bridge::next_bridge which puts
the reference automatically on bridge deallocation.

This is part of the work to support hotplug of DRM bridges. The grand plan
was discussed in [0].

Here's the work breakdown (➜ marks the current series):

 1. ➜ add refcounting to DRM bridges struct drm_bridge,
      based on devm_drm_bridge_alloc()
    A. ✔ add new alloc API and refcounting (v6.16)
    B. ✔ convert all bridge drivers to new API (v6.17)
    C. ✔ kunit tests (v6.17)
    D. ✔ add get/put to drm_bridge_add/remove() + attach/detach()
         and warn on old allocation pattern (v6.17)
    E. ➜ add get/put on drm_bridge accessors
       1. ✔ drm_bridge_chain_get_first_bridge(), add cleanup action (v6.18)
       2. ✔ drm_bridge_get_prev_bridge() (v6.18)
       3. ✔ drm_bridge_get_next_bridge() (v6.19)
       4. ✔ drm_for_each_bridge_in_chain() (v6.19)
       5. ✔ drm_bridge_connector_init (v6.19)
       6. … protect encoder bridge chain with a mutex
       7. ➜ of_drm_find_bridge
          a. ✔… add of_drm_get_bridge(), convert basic direct users
	        (v6.20?, one driver still pending)
	  b. ➜ convert direct of_drm_get_bridge() users, part 2
	  c. … convert direct of_drm_get_bridge() users, part 3
	  d.   convert direct of_drm_get_bridge() users, part 4
	  e.   convert bridge-only drm_of_find_panel_or_bridge() users
       8. drm_of_find_panel_or_bridge, *_of_get_bridge
       9. ✔ enforce drm_bridge_add before drm_bridge_attach (v6.19)
    F. ✔ debugfs improvements
       1. ✔ add top-level 'bridges' file (v6.16)
       2. ✔ show refcount and list lingering bridges (v6.19)
 2. … handle gracefully atomic updates during bridge removal
    A. ✔ Add drm_dev_enter/exit() to protect device resources (v6.20?)
    B. … protect private_obj removal from list
 3. … DSI host-device driver interaction
 4. ✔ removing the need for the "always-disconnected" connector
 5. finish the hotplug bridge work, moving code to the core and potentially
    removing the hotplug-bridge itself (this needs to be clarified as
    points 1-3 are developed)

[0] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/#t

This work is a continuation of the work to correctly handle bridge
refcounting for existing of_drm_find_bridge(). The ground work is in:

  - commit 293a8fd7721a ("drm/bridge: add of_drm_find_and_get_bridge()")
  - commit 9da0e06abda8 ("drm/bridge: deprecate of_drm_find_bridge()")
  - commit 3fdeae134ba9 ("drm/bridge: add next_bridge pointer to struct drm_bridge")

The whole conversion is split in multiple series to make the review process
a bit smoother. Parts 3 and 4 are converting non-bridge drivers (mostly
encoders).

(*) One bridge driver (synopsys/dw-hdmi) is converted in another series,
    together with its (non-bridge) users. Additionally this series converts
    drm_of_panel_bridge_remove() which is a special case, and has a bugfix
    for it too.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v2:
- Fix bug in samsung-dsim code, patch 10;
  update patch 12 on top of those changes
- Fix in imx8qxp-ldb code, patch 9
- Link to v1: https://lore.kernel.org/r/20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com

---
Luca Ceresoli (12):
      drm: of: drm_of_panel_bridge_remove(): fix device_node leak
      drm: of: drm_of_panel_bridge_remove(): convert to of_drm_find_and_get_bridge()
      drm/bridge: sii902x: convert to of_drm_find_and_get_bridge()
      drm/bridge: thc63lvd1024: convert to of_drm_find_and_get_bridge()
      drm/bridge: tfp410: convert to of_drm_find_and_get_bridge()
      drm/bridge: tpd12s015: convert to of_drm_find_and_get_bridge()
      drm/bridge: lt8912b: convert to of_drm_find_and_get_bridge()
      drm/bridge: imx8mp-hdmi-pvi: convert to of_drm_find_and_get_bridge()
      drm/bridge: imx8qxp-ldb: convert to of_drm_find_and_get_bridge()
      drm/bridge: samsung-dsim: samsung_dsim_host_attach: use a temporary variable for the next bridge
      drm/bridge: samsung-dsim: samsung_dsim_host_attach: don't use the bridge pointer as an error indicator
      drm/bridge: samsung-dsim: samsung_dsim_host_attach: convert to of_drm_find_and_get_bridge()

 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c | 15 ++++++-----
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c     | 12 ++++++++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c     | 31 +++++++++++------------
 drivers/gpu/drm/bridge/samsung-dsim.c        | 37 +++++++++++++++++++---------
 drivers/gpu/drm/bridge/sii902x.c             |  7 +++---
 drivers/gpu/drm/bridge/thc63lvd1024.c        |  7 +++---
 drivers/gpu/drm/bridge/ti-tfp410.c           | 27 ++++++++++----------
 drivers/gpu/drm/bridge/ti-tpd12s015.c        |  8 +++---
 include/drm/bridge/samsung-dsim.h            |  1 -
 include/drm/drm_of.h                         |  6 ++++-
 10 files changed, 86 insertions(+), 65 deletions(-)
---
base-commit: 814b88f91b121246b35be9c519b537041fe3d178
change-id: 20251223-drm-bridge-alloc-getput-drm_of_find_bridge-2-12c6bbcb6896

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


