Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB248F34C53
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 13:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kpXfKOvR3np/sIO/bcw5rLSmNmCzh2OkzuwODBfBSCs=; b=EqPpZI3iscDr1T
	ZcIQKTLPR+UA4lq9vsXAfUHP462+PxrnkkEw7WJ+hTfmBXSYAQk99RElFczQHUAFTCBDW+0+nWzSz
	XTyLjpa1smeuipVXE3HJM9Dj9CKQrSXsAhRVCl3LUJqUnW9fAeEIH0Wqs66rt5t3wPu577CGbv/ha
	dUp7fBru/omRr+zhjaApHjcrDeRd0wnkKfcrl1Gz1ihZ5i384neNPYVMuVtgEr5WPU5Gif5BU7M09
	OZY96LXBEsvfQeZXAzgqP9L73/LYXA3k0dovPGox8bDS80Yx/3npnIvdZ9QS9IeFrJTdOTlN+fRq6
	0s2/fp+iWU9pfbvb6xfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHoX-0000000Fnfy-1sqQ;
	Mon, 13 Apr 2026 13:58:57 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHoT-0000000Fne5-2NdL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 13:58:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A1DC01A31E4;
	Mon, 13 Apr 2026 13:58:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7141C5FFB9;
	Mon, 13 Apr 2026 13:58:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 509781045001B;
	Mon, 13 Apr 2026 15:58:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776088726; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=kpXfKOvR3np/sIO/bcw5rLSmNmCzh2OkzuwODBfBSCs=;
	b=ndG8cFwi4OvHrdGhfS6oTekIINOSMhMMJc0IvQBdV5wcq5mE4cXAwZtuYMFvrjJNXIKJR+
	9Cp118556v0j2R+3UQyGB3Kmief67FHcsCpElkiOH5Dif3KuVLogPhgOowFAffGWNk2I48
	37+HupFaKDXdnAizp9YN4HL8l59UW3FaTiIuY2ZSRQgxPNbmMjq8euFUPxhDMNZ6dK+6CB
	aahmxJO4mYdQcDAKxLI4HDCnz0COlAyeb6yycqed3yEpLweRehEiVPki+7KscV/NpxU5FK
	VlV5J8LMOUbcIaMKUVJ8MWWJw01mhkXKALWJvW4/nH7/w8IAY7CLtxPvwkPwoA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 00/10] drm/bridge: handle refcounting for bridge-only
 callers of drm_of_find_panel_or_bridge()
Date: Mon, 13 Apr 2026 15:58:32 +0200
Message-Id: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIj23GkC/y2NWwrCMBAAr1L220CSVhGvIlLyWOtKTMImFaH07
 o3Vz2FgZoGCTFjg0i3A+KZCKTZQhw7cw8QJBfnGoKU+yUFJ4fklLJNvxoSQnJiw5rmKbCKGMfH
 4l4M+SmX7MxrjodUy450+++l6+3GZ7RNd/eZhXTcyVXZEiwAAAA==
X-Change-ID: 20260410-drm-bridge-alloc-getput-panel_or_bridge-42501b38eaad
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15.1
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_065853_869949_268062C6 
X-CRM114-Status: GOOD (  10.29  )
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

== Series description

 * The first patch introduces of_drm_get_bridge_by_endpoint() as a
   replacement for bridge-only calls to drm_of_find_panel_or_bridge(); the
   new function is simpler and returns a refcounted bridge
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
       6. … protect encoder bridge chain with a mutex
       7. ➜ of_drm_find_bridge
          a. ✔ add of_drm_get_bridge() (v7.0),
               convert basic direct users (v7.0-v7.1)
          b. ✔ convert direct of_drm_get_bridge() users, part 2 (v7.0)
          c. ✔ convert direct of_drm_get_bridge() users, part 3 (v7.0)
          d. ✔… convert direct of_drm_get_bridge() users, part 4
                (some v7.1, some pending)
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
 5. … Migrate i.MX LCDIF driver to bridge-connector
 6.   DRM bridge hotplug
    A.   Bridge hotplug management in the DRM core
    B.   Device tree description

[0] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/#t

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (10):
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
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c |  8 ++---
 drivers/gpu/drm/bridge/chrontel-ch7033.c     | 24 +++++++--------
 drivers/gpu/drm/bridge/lontium-lt8713sx.c    |  7 ++---
 drivers/gpu/drm/bridge/lontium-lt9611.c      |  5 ++-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c   |  5 ++-
 drivers/gpu/drm/drm_bridge.c                 | 46 ++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_of.c                     | 26 ++++++++--------
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c |  4 +--
 drivers/gpu/drm/msm/hdmi/hdmi.c              |  3 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c             | 10 +++---
 include/drm/drm_bridge.h                     |  9 ++++++
 12 files changed, 97 insertions(+), 51 deletions(-)
---
base-commit: f9ef69563cc82e908e1ce84fd135d3290fb65cde
change-id: 20260410-drm-bridge-alloc-getput-panel_or_bridge-42501b38eaad

Best regards,
--  
Luca Ceresoli <luca.ceresoli@bootlin.com>


