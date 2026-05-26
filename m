Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC9ECD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 16:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uIyvspHblRrdrbJfHD/CPhWE9oReqSGbA+uFa9zkY4c=; b=zZXZHnRcLdBLaO
	LWlGEr/f2iSUtfkYOWtrb6hIsbSD2g46YokyYj2Yso3EgoxjSHYwQ76rviEA4umSgkpZtlHJcxoDT
	x4LpUkfsCh/z2qmFlDjEfV0S8SC1cz341qLt3r3dYmAt8tIP2kMXZK4szIE/7RVRKsE21XfBqMWf0
	+FRqtsDnKZ9lStIBZ4SEd/vsFjczXf6sOo5DJ7Q0Dmz1keh/YbpBWsiPOmybl5dC/FJCk2u6kd5is
	reihv5CV2YU+TjEz5okgmhIb/QRdtgSIait5TAgaGGoBoqIZYfXQz6ek43v//3LS7CJaEWMhtwJY3
	Hol9vcCSzh6B/Y3y7zVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRuvF-00000002Z1y-1wpu;
	Tue, 26 May 2026 16:46:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRuvD-00000002Z1C-07Ig
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 16:46:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4EB3E41850;
	Tue, 26 May 2026 16:46:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803721F000E9;
	Tue, 26 May 2026 16:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779813986;
	bh=uIyvspHblRrdrbJfHD/CPhWE9oReqSGbA+uFa9zkY4c=;
	h=From:Subject:Date:To:Cc;
	b=dm6om/QBISwUQlgnD4LRNgffNUqnA/hxrqGsb8gM0ehHRciELxq9rD/1vhliseCez
	 us4Mb8O/0NV6hoz5ut5vxRUyK+6pamkVskQm6Cpba2orzsp46/6ntpP4KMrXune5Bc
	 +lf5tvBELKqBAtVZq4SbFHomP+bBOjzexY45sChgdco9n9xuc3GJ76QBEZ5OlexmnK
	 mMfjNrqDfVqeZevrcKeq3YpzSC0+J/w8rV0K709P13mMfmyV+lnx8dw1Kn4TjaI1qk
	 M3SwxKN/pb+hs9pxv3dtf9V37y5j8Kt9NaJ99lX5QAuSXg7kPelxKtvuAAo9n/NgHt
	 o+dJKZY1r3oSg==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v6 00/19] drm/atomic: Rework initial state allocation
Date: Tue, 26 May 2026 18:46:12 +0200
Message-Id: <20260526-drm-mode-config-init-v6-0-852346394200@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33OTW6DMBAF4Ksgr+vK4x8wWfUeVRaxPSZWi2ltg
 lJF3L2GLJIK0eWb0ftmbiRjCpjJobqRhFPIYYgl1C8VsedT7JAGVzLhjNdMAKMu9bQfHFI7RB8
 6GmIYKSB4xU0jlWOkVL8S+nBd2ffjPSf8vhR9vA+JOeWF6PswHqrVDNnSiNeRLqcoUxQkWbrnk
 Mch/awfTrCW/39mAlo22Ii2sRrB+rcPTBE/X4fUreLEnxS+p/Ci2Fp4ACGxqe1GEQ9FcrmjiKJ
 oU2vXOsOcNhtFPhQFfEeRRVEtOO+sBePbjaKelXZHUUURWhsmBAcU+o8yz/MvQc/qDQ0CAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5972; i=mripard@kernel.org;
 h=from:subject:message-id; bh=R8cMkBgch6OdecOXXUVZ645zaDP9sOBrv+AVIkkeRDM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmi58LyWb6dmnj4gQTXAZGgCXaXra6s09t5+ZFkoNK0L
 jYvnVPPO6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBE/hkw1pktfeh0R+s76+bb
 Oozd+/UNpm36UCSpdKPEaEO4i5F79PLN1v8NNQOFdNWf77ivseS0O2PDis5jt4123N957/ssPX5
 Zz50Kb1vTUqTsa2c+3v3e411wkbTTPGaRk54e7yY1ugr9C/0AAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_094627_113779_0FF3E6EC 
X-CRM114-Status: GOOD (  19.07  )
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
Changes in v6:
- Reword the docs according to Thomas review
- Link to v5: https://lore.kernel.org/r/20260519-drm-mode-config-init-v5-0-388b03321e38@kernel.org

Changes in v5:
- Address sashiko reviews
- Improve the docs
- Fix drmm_connector_hdmi_init
- Drop drm/tidss: Switch to drm_mode_config_create_initial_state since
  not all possible bridges would have been converted to create_state 
- Link to v4: https://lore.kernel.org/r/20260512-drm-mode-config-init-v4-0-591dfdcc1bf9@kernel.org

Changes in v4:
- Rebased on current drm-misc-next
- Update drm_atomic_state to drm_atomic_commit
- Various doc impromvements
- Don't call drm_crtc_vblank_reset in create_state
- Prevent mem leak if states already have a state when
  drm_mode_config_reset or _create_initial_state are called
- Link to v3: https://lore.kernel.org/r/20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org

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
Maxime Ripard (19):
      drm/atomic: Document atomic commit lifetime
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
      drm/tidss: Convert to atomic_create_state
      drm/bridge_connector: Convert to atomic_create_state

 Documentation/gpu/drm-kms.rst                      |   6 +
 drivers/gpu/drm/display/drm_bridge_connector.c     |  17 +-
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  15 +-
 drivers/gpu/drm/drm_atomic.c                       |  80 +++++++++
 drivers/gpu/drm/drm_atomic_state_helper.c          | 114 ++++++++++---
 drivers/gpu/drm/drm_colorop.c                      |  41 ++++-
 drivers/gpu/drm/drm_connector.c                    |  10 +-
 drivers/gpu/drm/drm_drv.c                          |   4 +-
 drivers/gpu/drm/drm_mode_config.c                  | 189 ++++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_crtc.c          |   2 +-
 drivers/gpu/drm/i915/display/intel_plane.c         |   2 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   2 +-
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |   2 +-
 drivers/gpu/drm/tidss/tidss_crtc.c                 |  17 +-
 drivers/gpu/drm/tidss/tidss_plane.c                |   2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   2 +-
 include/drm/display/drm_hdmi_state_helper.h        |   4 +-
 include/drm/drm_atomic.h                           |   5 +-
 include/drm/drm_atomic_state_helper.h              |  12 +-
 include/drm/drm_colorop.h                          |   2 +
 include/drm/drm_connector.h                        |  16 ++
 include/drm/drm_crtc.h                             |  16 ++
 include/drm/drm_mode_config.h                      |   1 +
 include/drm/drm_plane.h                            |  16 ++
 24 files changed, 509 insertions(+), 68 deletions(-)
---
base-commit: 69c95e4c529297c25503e60acba757fba24fdc95
change-id: 20260310-drm-mode-config-init-1e1f52b745d0

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>


