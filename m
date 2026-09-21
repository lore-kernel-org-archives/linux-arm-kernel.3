Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A9BC982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=39pLtXebRPSRbczpBa8Er2AMlBYTCBf+v07DHDSDng8=; b=hkxHahWx5RikqE
	/ySoCcOx8eQj/a/NDml3+MpNBlbE9RXA+qwqCv+a0SF3sUAS+36KstIuxm+DET6Rc35zGrHx6G21a
	HSmPpGKhtKH82chgCG4V7Uj6SAZDBOLJuX3WczJigL6ISBtuT9zxLKYqtngD17blRw2IFsfPkGASr
	iBL4+1uZZYfN896XiHPcjUM82LAYojigkTl49ybjllcjlRrJ0KLZ76dtlPVwfr9UItljx0IWnHMJG
	/KkARSKCu8o6jyckG28Rgxy31VUkabfvTY3EhT/dFVQrhAsfxVOIUiCK2xnFTukWSi+fhA9IEjEiE
	h+tC1wtetSNBzTDqRM2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gKB-00000002h9B-0cBG;
	Mon, 21 Sep 2026 15:52:59 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gK8-00000002h7w-0LbC;
	Mon, 21 Sep 2026 15:52:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1790005923; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZRWOZzvz91WgMP3SnfdBqSkM6IK1/9624HMfNrN+BnFTPwlAFbH9F67/Lwz+nt8jgUlY0ZLWa3zkxHXLN4XwgZffginTlZSUmU4aKVP5GVA90hcjERlDSMycdBBVdapoB7o5o6YZ3yh2RLPhLIhOmVdTyzwBhQPQZdUiqH2XNUY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790005923; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=39pLtXebRPSRbczpBa8Er2AMlBYTCBf+v07DHDSDng8=; 
	b=D2860g+AWF20Z9rdqR9wkPNFqnNGa7+JwrcjP4e0SkbRir2CrBqkkeFHh3P1nbMAg2/qnBE2IOpKlgFQVYx24ziLXB/JB2xvHdMG8J39QHtbHYZGucpBIZE1rUziwlK0rdfR+6YUeQQa+D2jpPr0zrrT0/YFZxB7R05+J8KSL0g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790005923;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=39pLtXebRPSRbczpBa8Er2AMlBYTCBf+v07DHDSDng8=;
	b=WAU7EFaaYaCOm/hL5kl2xmIrMMj1Qfu5DVhQRkSszdi+Sbauy8wQ8VcN8itpeosI
	VEEhXA0uESlwLz/Mjo21qOoXIOxbyzb6TdzxYpWiSmjpkLKGV9tLeqEQ67O8zLCh3+J
	gu3ypQuqFx8lUwohvI8HkxnV6PMXeqA+WmCInu68=
Received: by smtp.zohomail.com with SMTPS id 179000592012949.15508811916027;
	Mon, 21 Sep 2026 08:52:00 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH RFC 00/25] VRR Target Rate Limiter KMS uAPI and
 Implementation
Date: Mon, 21 Sep 2026 17:51:26 +0200
Message-Id: <20260921-vrr-limiter-uapi-v1-0-2fcd7d011646@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NwQrCMBBEfyXs2cW2gpJeBT+gV+mhTba6Ytu4S
 YpQ+u9GzWmYYebNCp6EyUOtVhBa2PM8JVPuFJh7N90I2SYPVVEdC11qXETwySMHEoydYzRak9W
 HgU62gjRzQgO/f8grNJcztP/Qx/5BJnxhuSb0iukw5G7feUIzj4ldKysjBnb7rNBu2we5XF+Ar
 AAAAA==
X-Change-ID: 20260919-vrr-limiter-uapi-c99ed93fe7d2
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, 
 Leo Li <sunpeng.li@amd.com>, Daniel Stone <daniels@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Helge Deller <deller@gmx.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 Derek Foreman <derek.foreman@collabora.com>, 
 wayland-devel@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_085256_181729_22D4F2F4 
X-CRM114-Status: GOOD (  13.54  )
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

This series defines a proposed new userspace API for specifying frame
rate targets for variable refresh rate (VRR) mechanisms. This includes
specifying both a constrained range in which VRR should operate, as well
as a fixed target, and a new connector property for QMS (Quick Media
Switching).

The reason for wanting such an uAPI is mainly to avoid the imperfection
of the real world. By constraining VRR to a limited range or a fixed
point entirely, we get the benefits of judder-free (or low-latency)
presentation for content within an expected range of frame rates,
without dipping into ones that cause visible brightness flicker. The
addition of QMS furthermore allows the connector to signal an upcoming
rate change ahead of time for media playback scenarios, such that
advanced processing algorithms in e.g. TVs don't have to be disabled to
meet the need to be able to present at full rates with no notice.

Aside from the uAPI, there's the EDID parsing and an implementation for
drivers that use the common HDMI state helpers, with it wired up for
Rockchip (tested and developed on RK3588).

The first ~11 patches implement "game mode" VRR for the HDMI state
helpers, and wire it up for RK3588. For the people who care about the
uAPI, this part may not be super interesting.

The uAPI consists of 4 new CRTC properties for the frame rate
minimum/maximum target, and 1 new connector property for enabling QMS
signalling. The qms_enabled property is present when the connector
supports QMS signalling; Whether or not a *display* supports QMS
signalling is determined by the EDID, and userspace can do the necessary
EDID parsing by itself. (i.e., there is no qms_capable property that
exposes the kernel's own EDID parsing results to userspace.)

For some background on why the uAPI uses numerator/denominator frame
rate pairs as opposed to frame intervals or microhertz, my slides from
Display Next Hackfest 2026 give an explanation:

https://gitlab.freedesktop.org/-/project/2891/uploads/9db8886701e2598271a8c4c6dc4dc2b1/display_next_hackfest_2026.pdf

In short: for QMS, we have a very limited set of frame rate targets that
signalling is supported for. This includes both rates such as 24 Hz, and
24/1.001 Hz. Making userspace give us a frame rate as a rational
expression rather than as the output of some rounding calculations
spares us the pain and suffering of then having to correctly guess which
frame rate was originally meant as a target with a <0.1% accuracy
requirement.

There is also a set of IGT tests for exercising the new uAPI on actual
hardware:

https://gitlab.freedesktop.org/CounterPillow/igt-gpu-tools/-/tree/vrr-limiter

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Derek Foreman (5):
      drm/edid: Add a query for vrr range
      video/hdmi: Add VTEM EMP packing
      drm/bridge: Add VTEM EMP support
      drm/connector: hdmi: Add VTEM EMP generation
      drm/bridge: synopsys: Add VTEM EMP support

Nicolas Frattaroli (20):
      drm: Add VRR state
      drm/atomic-helper: Set mode_changed on vrr_enabled change
      drm/crtc-helper: Add VRR helper functions
      drm/connector: Add drm_display_info_is_vrr_capable
      drm/rockchip: dw_hdmi_qp: Add VRR support
      drm/rockchip: vop2: Enable VRR
      drm/edid: Parse CinemaVRR flag from HDMI SCDS
      drm: Add VRR target frame rate properties
      drm: Implement VRR rate limiting
      drm/edid: Parse QMS flag from HDMI SCDS
      drm/edid: Parse QMS TFR min/max flags from HDMI SCDS
      drm/connector: Add "qms_enabled" drm property
      video/hdmi: Add support for QMS in VTEM EMP packing
      drm/connector: hdmi: Add QMS to VTEM EMP generation
      drm/connector: hdmi: Add QMS state validation and computation
      drm/rockchip: dw_hdmi_qp: Add QMS support
      drm/tests: hdmi: Add "Game Mode" VRR tests
      drm/tests: hdmi: Add Fixed/Constrained rate VRR tests
      drm/tests: hdmi: Add Quick Media Switching tests
      drm/atomic: Disable VRR in helper_set_config

 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |   50 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h       |    1 +
 drivers/gpu/drm/display/drm_bridge_connector.c     |   41 +
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  474 +++++++
 drivers/gpu/drm/drm_atomic.c                       |    2 +
 drivers/gpu/drm/drm_atomic_helper.c                |    9 +
 drivers/gpu/drm/drm_atomic_uapi.c                  |   28 +
 drivers/gpu/drm/drm_connector.c                    |  112 ++
 drivers/gpu/drm/drm_crtc.c                         |    8 +
 drivers/gpu/drm/drm_crtc_helper.c                  |   93 ++
 drivers/gpu/drm/drm_edid.c                         |   38 +
 drivers/gpu/drm/drm_mode_config.c                  |   20 +
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c     |   23 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |   62 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h       |    9 +
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 1383 ++++++++++++++++++++
 drivers/gpu/drm/tests/drm_kunit_edid.h             |  279 ++++
 drivers/video/hdmi.c                               |   99 +-
 include/drm/drm_bridge.h                           |   29 +
 include/drm/drm_connector.h                        |   59 +
 include/drm/drm_crtc.h                             |   18 +
 include/drm/drm_crtc_helper.h                      |    6 +
 include/drm/drm_edid.h                             |    3 +
 include/drm/drm_mode_config.h                      |   45 +
 include/linux/hdmi.h                               |   21 +
 25 files changed, 2898 insertions(+), 14 deletions(-)
---
base-commit: ab82471ddff094939d9981e0647332562c7e1c9b
change-id: 20260919-vrr-limiter-uapi-c99ed93fe7d2

Best regards,
--  
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


