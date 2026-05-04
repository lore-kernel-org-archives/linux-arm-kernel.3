Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF36CD3430
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 10:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LNXHjKbecVLNXCi3F/uO2gZdoR1K6SlYY6/tc07aOsM=; b=F5BIEpyFt7Ue6t
	os+9/RAdJykaYklDWalEsLuICup4baTyEGlG+RQDie8Axk6HRSUoY7ENiV29UBQitrfJgVr1FPQDd
	Ztb9LCHe4m9mZdTkXvKogbzDua2KWCj4k34BCuGgM4y9edBwzq5rBcFXcbPdc5+13hYTwDOujzXfb
	0GhAyrsAKFS3kX1PA13kmUMYZxsl+s728PiZKV9kqiO2pNb90St8tJtUXuCP5iigIxQruW98xyI8s
	XajwUkneH0eKdK+mydVF7moggv6IUDC6v6VPBFwsE1Pow8vZze8cis97kt4C692YqroTH7wcKDogi
	WFwRKe47MYwpjhXjGTYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqnm-0000000CxXy-2tqC;
	Mon, 04 May 2026 10:45:26 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqni-0000000CxXC-0GSh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 10:45:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 73A9B4E42BBC;
	Mon,  4 May 2026 10:45:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 44F0A5FD5F;
	Mon,  4 May 2026 10:45:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D2C1311AD268A;
	Mon,  4 May 2026 12:45:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777891517; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=LNXHjKbecVLNXCi3F/uO2gZdoR1K6SlYY6/tc07aOsM=;
	b=bxhnLLfVcGCWieMIIvjOltGpSz6JLPeiyNW5HL/z6dqyAqauN398d067tzUUnzwc8kAwuE
	3C2SAv1LuEnvLi0znC2jSsUhqKHwjBwSSf/QxSdfyjXQheojH2b5EWQR5sED8OmyB2JHc2
	cydVE26es5udZguSEi8sXhQ3VR1Wkdfo6/ohfQyPQUbzB+lLnwJuEqW3IVTeoBiuxGRxn1
	bW7J55ns1gjPWG7+Kw+YC0EBa+voKNWlIGls6+3RjXM/tBE2SO9lMl68JJ637m+/lNND2T
	Pi2dveE8PZAPlL95WSdz1DDcsiXJKnaDP3iFObGBOlAeU/OSB2WU2cnZOUAvmg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v4 00/11] drm/bridge: handle refcounting for bridge-only
 callers of drm_of_find_panel_or_bridge()
Date: Mon, 04 May 2026 12:45:03 +0200
Message-Id: <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-0-b578c3daaf10@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAK94+GkC/52Oy4oCMRREf0WynkhebZxZzX+IyE1y1UjbaZLYK
 NL/buIDFDfisqjinDqThNFjIn+TM4k4+ORDV4L6mRC7hW6D1LuSiWBixhRn1MU9NdG70kDbBks
 3mPtDpj102K5CXN1LJRrGjZwjgCOF1kdc++PVtFjecjqYHdpc8XWx9SmHeLpeGXjdPazyY+vAK
 aNgHePW6V/g638TQm59N7VhT6p3EE9kMf+cLApZSca0UsCt0u9k+SVZ1s+N1KZpZhqceyWP43g
 B+66Nn6YBAAA=
X-Change-ID: 20260410-drm-bridge-alloc-getput-panel_or_bridge-42501b38eaad
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, John Stultz <jstultz@google.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_034522_394317_B34C6D15 
X-CRM114-Status: GOOD (  13.23  )
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

This series converts all the bridge-only callers of the deprecated
drm_of_find_panel_or_bridge() API to a new, simpler API that handles bridge
refcounting.

All patches acked/reviewed except patches 3, 4 and 10.

== Series description

 * Patch 1 (new in v2) makes drm_bridge_get/put() ignore ERR_PTR pointers,
   not only NULL pointers
 * Patch 2 introduces of_drm_get_bridge_by_endpoint() as a replacement for
   bridge-only calls to drm_of_find_panel_or_bridge(); the new function
   refcounts the bridge and is simpler
 * The following patches convert all bridge-only users to the new API
 * The last patch forbids new bridge-only calls to
   drm_of_find_panel_or_bridge()

== Grand plan

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
       6. ✔ protect encoder bridge chain with a mutex (v7.2)
       7. ➜ of_drm_find_bridge
          a. ✔ add of_drm_get_bridge() (v7.0),
               convert basic direct users (v7.0-v7.1)
          b. ✔ convert direct of_drm_get_bridge() users, part 2 (v7.0)
          c. ✔ convert direct of_drm_get_bridge() users, part 3 (v7.0)
          d. ✔ convert direct of_drm_get_bridge() users, part 4 (v7.1-v7.2)
          e. ➜ convert bridge-only drm_of_find_panel_or_bridge() users
       8. drm_of_find_panel_or_bridge, *_of_get_bridge
       9. ✔ enforce drm_bridge_add before drm_bridge_attach (v6.19)
    F. ✔ debugfs improvements
       1. ✔ add top-level 'bridges' file (v6.16)
       2. ✔ show refcount and list lingering bridges (v6.19)
 2. … handle gracefully atomic updates during bridge removal
    A. ✔ Add drm_bridge_enter/exit() to protect device resources (v7.0)
    B. … protect private_obj removal from list
    C. ✔ Add drm_bridge_clear_and_put() (v7.1)
 3. … DSI host-device driver interaction
 4. ✔ removing the need for the "always-disconnected" connector
 5. ✔ Migrate i.MX LCDIF driver to bridge-connector (v7.2)
 6. … DRM bridge hotplug
    A. … Bridge hotplug management in the DRM core
       1. ✔ bridge-connector: attach encoder to the connector (v7.2)
    B.   Device tree description

[0] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/#t

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v4:
- Fixed patches 3 and 10
- Minor fixes to patches 1 and 2
- Removed bouncing addresses yongqin.liu@linaro.org and
  xinliang.liu@linaro.org from Cc
- Link to v3: https://patch.msgid.link/20260428-drm-bridge-alloc-getput-panel_or_bridge-v3-0-a537b5567add@bootlin.com

Changes in v3:
- patch 3, 8, 10: fixed ERR_PTR deref in the -ENODEV case, and removed
  Dmitry's R-by from those patches as they are changed
- Added review trailers to the other patches
- Link to v2: https://patch.msgid.link/20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com

Changes in v2:
- Added patch to ignore ERR_PTR values in drm_bridge_get/put()
- Changed API to return the bridge (or a ERR_PTR) in the return value,
  not as a double-pointer output parameter
- Adapted all patches to the new API, dropped Dmitry's review tags as the
  patches are all modified
- Removed bouncing addresses from Cc list
- Link to v1: https://patch.msgid.link/20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com

---
Luca Ceresoli (11):
      drm/bridge: drm_bridge_get/put(): ignore ERR_PTR
      drm/bridge: add of_drm_get_bridge_by_endpoint()
      drm/msm/hdmi: switch to of_drm_get_bridge_by_endpoint()
      drm/hisilicon/kirin: switch to of_drm_get_bridge_by_endpoint()
      drm/bridge: chrontel-ch7033: switch to of_drm_get_bridge_by_endpoint()
      drm/bridge: lontium-lt9611uxc: switch to of_drm_get_bridge_by_endpoint()
      drm/bridge: lt9611: switch to of_drm_get_bridge_by_endpoint()
      drm/bridge: adv7511: switch to of_drm_get_bridge_by_endpoint()
      drm/bridge: lt8713sx: switch to of_drm_get_bridge_by_endpoint()
      drm: zynqmp_dp: switch to of_drm_get_bridge_by_endpoint()
      drm: of: forbid bridge-only calls to drm_of_find_panel_or_bridge()

 drivers/gpu/drm/bridge/adv7511/adv7511.h     |  1 -
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 15 +++++----
 drivers/gpu/drm/bridge/chrontel-ch7033.c     | 28 ++++++++--------
 drivers/gpu/drm/bridge/lontium-lt8713sx.c    | 10 +++---
 drivers/gpu/drm/bridge/lontium-lt9611.c      |  9 +++--
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c   |  9 +++--
 drivers/gpu/drm/drm_bridge.c                 | 49 +++++++++++++++++++++++++---
 drivers/gpu/drm/drm_of.c                     | 26 +++++++--------
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c |  9 +++--
 drivers/gpu/drm/msm/hdmi/hdmi.c              | 14 ++++++--
 drivers/gpu/drm/xlnx/zynqmp_dp.c             | 19 ++++++-----
 include/drm/drm_bridge.h                     |  7 ++++
 12 files changed, 128 insertions(+), 68 deletions(-)
---
base-commit: 5919a056c7426ba74d0199252c7304566dadf161
change-id: 20260410-drm-bridge-alloc-getput-panel_or_bridge-42501b38eaad

Best regards,
--  
Luca Ceresoli <luca.ceresoli@bootlin.com>


