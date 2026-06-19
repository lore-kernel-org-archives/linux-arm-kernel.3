Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE71CDB471
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 14:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XDkYpT+SCUd0m5Nj+gLnQpV+dZe6iTEpcMwnamD4vLs=; b=mz2lyWbzGISODd
	Qznb40JYFPs0cBSjhova3y4GOFYFGUlEftYvZV5pJqIBWekx07+I21/hOOj8j53s4xeW8FMudP6DB
	EP1giMAE2T6HU1sb+kVqduIpRA/7PB1vfHSKqiEl9MFKdUtNv99hitC3m0nbadqywUDLADIhm2tIe
	SK6l2EYtmXt1bvNlfh9SqnCM13DnG4U/yhCKCZ+ZtRIk8p0o25rt/4VhSCE9IOG2ZlqdFNx2igome
	BDd8pkBE+8qHDIwW5JtUeTvlE1BbXN1w0bdTiDOcDiots2GsDejR3KRJk/DkmxX+cp3X+CTlo6JzC
	oyXjxemDa9jJhIa/hOWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZu3-00000002XEH-0KB1;
	Fri, 19 Jun 2026 14:09:03 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZty-00000002XBU-1KPO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 14:09:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 06D694E42FC2;
	Fri, 19 Jun 2026 14:08:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C20C9601AD;
	Fri, 19 Jun 2026 14:08:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A8E2106C8254;
	Fri, 19 Jun 2026 16:08:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781878132; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=XDkYpT+SCUd0m5Nj+gLnQpV+dZe6iTEpcMwnamD4vLs=;
	b=dH0ACJymmzk11uAEx0D/J4vHZvgWP2WRKaYt4kTgXxDW2J3XCzlxS87GEGm1sUB0RVH2tG
	d7UUkCyA8yhn0Rf9PkBvbtQcy8/paxGCX2NvAEY/vg2ovUkBmhEKPzHK9awWaFYFMuS9u5
	+7fERE7deqvf++LWoXM5rX6Pw1gCnm2PtMSZgCzd4s5LZRGjnzkyCjCPjdMABUf7xe5FvR
	CoONM4e3FywLalg4CkKyQnTQew9N6yIxOu9KbsYyCGBpRYXMt17LEJ3iIcKemJFv9fzeZt
	2Rw2CsviOe+YdT7MHWmGJAaEmMaBTWaTKQK1hBaw+Tm2XwSXBsiugUbFOwcRVA==
From: Kory Maincent <kory.maincent@bootlin.com>
Subject: [PATCH RFC v2 0/4] Add support for DisplayPort link training
 information report
Date: Fri, 19 Jun 2026 16:08:42 +0200
Message-Id: <20260619-feat_link_cap-v2-0-a3dec4c02ad9@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGpNNWoC/12NwQrCMBBEf6Xs2chmLdF4EgQ/wKuU0qZbXdSmJ
 KUopf9uyNHjzGPeLBA5CEc4FgsEniWKH1KgTQHu0Qx3VtKlDIRkkMionpupfsnwrF0zKkLXtqb
 f6a5ESJsxcC+f7LvB9XKGKpUPiZMP3/wx64yyrkT7p5u1QrVHY/mgrXVMp9b7KeGt82+o1nX9A
 biHlSaxAAAA
X-Change-ID: 20260226-feat_link_cap-20cbb6f31d40
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Daniel Stone <daniels@collabora.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mark Yacoub <markyacoub@google.com>, Sean Paul <seanpaul@google.com>, 
 Manasi Navare <navaremanasi@google.com>, 
 Drew Davenport <ddavenport@google.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.15.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_070858_634219_DA7B7A55 
X-CRM114-Status: GOOD (  16.29  )
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

DisplayPort link training negotiates the physical-layer parameters needed
for a reliable connection: lane count, link rate, and optionally Display
Stream Compression (DSC). Currently, each driver exposes this state in
its own way, often through driver-specific debugfs entries, with no
standard interface for userspace diagnostic and monitoring tools.

This series introduces generic, managed and unmanaged DisplayPort
connector initialization helpers, for exposing DP link capabilities and
state as standard sysfs entries, modeled after the existing HDMI helper
drmm_connector_hdmi_init().

The aim of such development is to guide users to select the most suitable
DisplayPort connector for their needs. For example, if you have a USB-C
hub with lesser capabilities than your computer’s native DisplayPort
connector (such as HBR2 versus HBR3 support), the system could recommend
connecting high-resolution displays directly to the computer’s port
instead of through the hub to ensure optimal performance.

These new drmm_connector_dp_init() and drm_connector_dp_init_with_ddc()
helpers initialize a DP connector and expose link training capabilities
and state to userspace via sysfs attributes under dp_link.

Additional helpers are provided to manage link capabilities and parameters
at runtime.

Two drivers are updated as reference implementations: i915 (direct
connector path) and MediaTek (via the bridge connector framework using a
new DRM_BRIDGE_OP_DP flag).

The changes updating the i915 driver to use DRM managed resources have been
removed due to cleanup path issues. The core problem is that some functions
do not consistently propagate errors through their call paths (whether this
is intentional or not) making it difficult to properly handle cleanup of
DRM objects (planes, encoders, connectors). A potential solution would be
to implement something similar to devres_group for each DRM object type,
but this represents a substantial undertaking that falls outside the scope
of this patch series.

The MST case in i915 driver is not supported yet.

Patch 1: Introduce the core drmm_connector_dp_init() framework
Patch 2: Wire the i915 DP connector to use the new helpers
Patch 3: Introduce DRM_BRIDGE_OP_DP and wire bridge connectors
Patch 4: Wire the MediaTek DP bridge to the new helpers [untested]

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Changes in v2:
- Removed work converting i915 to DRM managed resource
- Remove voltage swing and pre-emphasis properties
- Expose link training state via sysfs dp_link/ group instead of
  connector properties
- Add comprehensive sysfs attributes for both source and sink capabilities
- Add new helpers for managing sink capabilities and for current link
  parameters
- Link to v1: https://lore.kernel.org/r/20260409-feat_link_cap-v1-0-7069e8199ce2@bootlin.com

---
Kory Maincent (4):
      drm: Introduce DisplayPort connector helpers with link training state
      drm/i915/display/dp: Adopt dp_connector helpers to expose link training state
      drm/bridge: Wire drmm_connector_dp_init() via new DRM_BRIDGE_OP_DP flag
      drm/mediatek: Use dp_connector helpers to report link training state

 drivers/gpu/drm/display/drm_bridge_connector.c     |  24 ++++
 drivers/gpu/drm/display/drm_dp_helper.c            | 144 +++++++++++++++++++++
 drivers/gpu/drm/drm_connector.c                    | 122 +++++++++++++++++
 drivers/gpu/drm/drm_sysfs.c                        | 100 ++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c            |  26 +++-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |  17 +++
 drivers/gpu/drm/mediatek/mtk_dp.c                  |  23 ++++
 include/drm/display/drm_dp_helper.h                |   7 +
 include/drm/drm_bridge.h                           |  13 ++
 include/drm/drm_connector.h                        | 105 +++++++++++++++
 10 files changed, 577 insertions(+), 4 deletions(-)
---
base-commit: 4d75f8bd845c10f126e0e66bcdd264e1f9772bde
change-id: 20260226-feat_link_cap-20cbb6f31d40

Best regards,
--  
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


