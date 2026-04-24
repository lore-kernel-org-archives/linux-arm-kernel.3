Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4C1FE51FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 10:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/fNYruoDB147AAukmwkMQ1d+nIjnAgQrq/cxtXAh/Oc=; b=kQ1RJ/7PUXw/zb
	bdfeJUlqFg/XHYlgDlIsE9o2a2seo6ML7FRyUh6p99OofBVmPOAXJiAIKzZ6TwHCHfVsTYWwhnWyr
	zkxlY9o8GbOtwW2xOmIZgiClDFWeRgGD3FUfM4ExCyYNZ+JqQzGSu4v3FF571qYBvOxNI/J1YNu0a
	kbZsSXYdFO+XxyLUNd/DGSqxRp7YVy+LosUZeE2DmoyyppBZojvL/+xb1641XoFtdvEVugFOi6YZE
	ZwWeceJaEy0+ZUMy4KIl+ncdyWy0oZxUZLcs1L/VX4xGwtV2yiLXhHoigg9py4lfHwSYbeLhvpZld
	fQNrqyQwx4d8pn3YMeLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDcl-0000000D0Or-2e9s;
	Fri, 24 Apr 2026 10:19:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDck-0000000D0Ok-2cgz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 10:19:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3AF2A6001A;
	Fri, 24 Apr 2026 10:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65ABAC19425;
	Fri, 24 Apr 2026 10:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777025940;
	bh=skKWtWqkXldvhuwp2U5Xxf4qnnjX9+jASZIFkxD8u5A=;
	h=From:Subject:Date:To:Cc:From;
	b=ktmbp0HMb1o1k4DysM7B9s5h1qZV0xna6q9YwN4vEAztRVoDL6VGwSWQYquevBe+o
	 f99L+5orLNJsTzArL+0Dl6QZ7ITMcrjJcJLM5LXattMJ/+QVWaidln47K6Ee+QvOpu
	 qSgkSZDedqM9+rtQeVKcYw9wXTE7YoisGFZOKhmXICJxBOYAsV0GDURSDBpB9HPoqd
	 DkskDce8a86oOkWdG8LedWKfFafm4LvXU0JK17X6fCIz+pbBkd1G4DHVQhUnpRH+E4
	 1LI3HMVhtqZF2qCgpoVYR0WXR/D+TIRgC/ns/RhuUzsf2o50a+ALXVoQzqd+uxZWgt
	 SPaN7UhOfaQDQ==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 00/20] drm/atomic: Rework initial state allocation
Date: Fri, 24 Apr 2026 12:18:40 +0200
Message-Id: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33OTQ7CIBAF4Ks0rB3DT23VlfcwLlo61IkWFLDRm
 N5dihtd6Io8Ju+bebKAnjCwbfFkHkcK5GwKalEwfWxsj0BdykxyWXElOHR+gMF1CNpZQz2QpQg
 ChVnJti5XHWepevFo6J7Z/eGdPV5vSY/vT9Y2YSaGgeK2yCYFDRbvEeZVwMv0srl7pBCdf+QLR
 5HL/48ZBaQJ1mpT6zUKbXYn9BbPS+f7LI7yQ5G/FJkUXSkjhCqxrvSXMk3TC7IQmFY7AQAA
X-Change-ID: 20260310-drm-mode-config-init-1e1f52b745d0
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Simon Ser <contact@emersion.fr>, Harry Wentland <harry.wentland@amd.com>, 
 Melissa Wen <mwen@igalia.com>, Sebastian Wick <sebastian.wick@redhat.com>, 
 Alex Hung <alex.hung@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Maxime Ripard <mripard@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5145; i=mripard@kernel.org;
 h=from:subject:message-id; bh=skKWtWqkXldvhuwp2U5Xxf4qnnjX9+jASZIFkxD8u5A=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJmvnTu+rKlNXrLrWm7gxtQ3TnEv/tYfzFj67KW2r+62V
 BM2Xs7qjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRPV2MtTI7blaWPP/C94VD
 voAnwOTX7xWy1wOSBH9nrpqkyc3XZXwsZNsmoXdztms1KGV1H7gygbG+pEpn2f9TNlN/nD8zSXf
 1Xy/+6o7n8TqFky5bPek/nWJ8bcfprOrnxx7dual2Wf3rrBNvAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Hi,

This series started from my work on the hardware state readout[1], and
more specifically a discussion with Thomas[2].

This series expands the work that has been merged recently to make
drm_private_obj and drm_private_state allocation a bit more consistent
and ended up creating a new atomic_create_state callback to allocate a
new state with no side effect.

The first patches document the existing behaviour and fix a few
cleanups and typos.

Then, __drm_*_state_reset() helpers are renamed to
__drm_*_state_init() to clarify that they initialize rather than
reset state, and we add the new atomic_create_state callback to
every other DRM object (planes, CRTCs, connectors, colorops).

Next, we leverage those new callbacks to create a new helper,
drm_mode_config_create_initial_state(), to create the initial state
for all the objects of a driver, and update the driver skeleton to
recommend it.

Finally, we convert the tidss driver and the bridge_connector to the
new pattern.

This was tested on a TI SK-AM62, with the tidss driver.

Let me know what you think,
Maxime

1: https://lore.kernel.org/dri-devel/20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org/
2: https://lore.kernel.org/dri-devel/5920ffe5-b6b1-484b-b320-332b9eb9db82@suse.de/

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Changes in v3:
- Reintroduce state documentation that was dropped by accident
- Change name to drm_mode_config_create_initial_state()
- Don't call drm_mode_config_create_initial_state() in drm_dev_register
  anymore
- Drop __drm_atomic_helper_*_create_state
- Improve documentation and commit messages where necessary
- Collected tags
- Link to v2: https://lore.kernel.org/r/20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org

Changes in v2:
- Change the _state_reset function names to _state_init
- Change the colorop too
- Various doc improvements
- Link to v1: https://lore.kernel.org/r/20260310-drm-mode-config-init-v1-0-de7397c8e1cf@kernel.org

---
Maxime Ripard (20):
      drm/atomic: Document atomic state lifetime
      drm/colorop: Fix typos in the doc
      drm/atomic: Drop drm_private_obj.state assignment from create_state
      drm/atomic: Expand atomic_create_state expectations for drm_private_obj
      drm/mode-config: Document drm_private_obj exclusion from drm_mode_config_reset()
      drm/colorop: Rename __drm_colorop_state_reset()
      drm/colorop: Create drm_atomic_helper_colorop_create_state()
      drm/atomic-state-helper: Fix __drm_atomic_helper_plane_reset() doc typo
      drm/atomic-state-helper: Rename __drm_atomic_helper_plane_state_reset()
      drm/plane: Add new atomic_create_state callback
      drm/atomic-state-helper: Rename __drm_atomic_helper_crtc_state_reset()
      drm/crtc: Add new atomic_create_state callback
      drm/atomic-state-helper: Rename __drm_atomic_helper_connector_state_reset()
      drm/hdmi: Rename __drm_atomic_helper_connector_hdmi_reset()
      drm/connector: Add new atomic_create_state callback
      drm/mode-config: Create drm_mode_config_create_initial_state()
      drm/drv: Switch skeleton to drm_mode_config_create_initial_state()
      drm/tidss: Switch to drm_mode_config_create_initial_state()
      drm/tidss: Convert to atomic_create_state
      drm/bridge_connector: Convert to atomic_create_state

 Documentation/gpu/drm-kms.rst                      |   6 +
 drivers/gpu/drm/display/drm_bridge_connector.c     |  17 ++-
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  13 +-
 drivers/gpu/drm/drm_atomic.c                       |  63 +++++++++
 drivers/gpu/drm/drm_atomic_state_helper.c          | 136 +++++++++++++++---
 drivers/gpu/drm/drm_colorop.c                      |  41 ++++--
 drivers/gpu/drm/drm_drv.c                          |   4 +-
 drivers/gpu/drm/drm_mode_config.c                  | 154 ++++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_crtc.c          |   2 +-
 drivers/gpu/drm/i915/display/intel_plane.c         |   2 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   2 +-
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |   2 +-
 drivers/gpu/drm/tidss/tidss_crtc.c                 |  17 +--
 drivers/gpu/drm/tidss/tidss_drv.c                  |   6 +-
 drivers/gpu/drm/tidss/tidss_plane.c                |   2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   2 +-
 include/drm/display/drm_hdmi_state_helper.h        |   4 +-
 include/drm/drm_atomic.h                           |   5 +-
 include/drm/drm_atomic_state_helper.h              |  14 +-
 include/drm/drm_colorop.h                          |   2 +
 include/drm/drm_connector.h                        |  16 +++
 include/drm/drm_crtc.h                             |  16 +++
 include/drm/drm_mode_config.h                      |   1 +
 include/drm/drm_plane.h                            |  16 +++
 24 files changed, 476 insertions(+), 67 deletions(-)
---
base-commit: ea61048876a7137897da26dac49ee234fb38a35a
change-id: 20260310-drm-mode-config-init-1e1f52b745d0

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>


