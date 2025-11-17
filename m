Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B35CEBF92
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 19:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fREpGjj4BJlCO6CnTMTzXHt6Fc6B8v1Yc8bWL/JsKdc=; b=p4gIuDg+U/VXaV
	MQR92dor3OGdKvMsaSZxNw3YsQ5wU3P0u4ZOEq2B0DoPK6OQ7ABuTo8C0tRb7n2T4UrjQcmlfbK2L
	HnQdtt6sA0JMmWsdSpC/+msiZRI74VPFJxC6N4uhfDOEecQdRonaH5tm/VDKWoti2G5L6ykAlf9fy
	KV22lU+M6FfanMugh6zKM9W7UQB8p7jTrSkNNKfSBWxYlZXlfeYr7giuz4qrta9oEvpQ5+X0FWjMn
	HpA5kz6Ig8MupjT3FRGVPrOXZdFmo8O+4yycdN8wT+WfgHQjNIz+7rhACBiLAt73g6q2FuQUbMLQ7
	qnTVWVH90UYO8413p8Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4f6-0000000Gi36-2pmX;
	Mon, 17 Nov 2025 19:13:16 +0000
Received: from sender3-pp-f112.zoho.com ([136.143.184.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4ey-0000000Ghze-49Go;
	Mon, 17 Nov 2025 19:13:10 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763406742; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NCWTdtNC+fisIP93dT1WS7aZCKPch5isOjwAm1kMLYx4OASt3MsYJJDzkvwtV4vzvflS1UiqNH/02h5lqAMYPb/lx4I0Q5wdI/hSvBQL3mhxjBFdQp/SFIhui/cd4MF/mOP1jxTWqTy5Qf/ExmpX/dz2am7/Mz2PIvbRxcVLmiw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763406742; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fREpGjj4BJlCO6CnTMTzXHt6Fc6B8v1Yc8bWL/JsKdc=; 
	b=QEpILz31RCkDOWoad3CTM5dI/yfff0j/51IlCReQI8R6qumGrkn8IQjtv0LNScvppPvMzUBMDXZwQv0wqmUHKvY3aoOrMXzkxZ+1nYFW7SYzymXqYzIvJeOYYynZSi9Ex8ez9Ip7XDL7yY592g2Y4PPk5nX4opprbnJV+2daea0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763406742;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=fREpGjj4BJlCO6CnTMTzXHt6Fc6B8v1Yc8bWL/JsKdc=;
	b=I6ZwQ/aPmG9kNPGaoep3dNYxPg8K1Oc14TM1KkA+xWQahOblNgyU/+F4silCzKjZ
	k/f54GpIoYuBFxGdhQLoPm5FyVqnVxBpgjD1QBvqD/EKWAq2EaFJ1Be3ThOVi3hHcqu
	NXTyG+lDlLz6julVZ6IHx/q8d5jkiyat1FT72NKc=
Received: by mx.zohomail.com with SMTPS id 1763406739664491.33357196874965;
	Mon, 17 Nov 2025 11:12:19 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v4 00/10] Add new general DRM property "color format"
Date: Mon, 17 Nov 2025 20:11:44 +0100
Message-Id: <20251117-color-format-v4-0-0ded72bd1b00@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHBzG2kC/z2OwQqDMBAFf0VybiQxthpP/Y/iIeqmBoxpN1EE8
 d+72NLj8HjD7CwCOoisyXaGsLrowkxQXjLWj2Z+AncDMStEcZWiqHkfpoDcBvQm8VLbgZaukrV
 idHkhWLedukdLbDF4nkYE85cILaVUolI6L7W6ccm9QbfEfJ3McCf7ZLqAJu+D/xkR3gt1pa+Wd
 SYCVXjvUpPNsCV+tklZsfY4Pk6wnlHRAAAA
X-Change-ID: 20251028-color-format-49fd202b7183
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Werner Sembach <wse@tuxedocomputers.com>, 
 Andri Yngvason <andri@yngvason.is>, Marius Vlad <marius.vlad@collabora.com>, 
 Derek Foreman <derek.foreman@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_111309_156143_5F349A26 
X-CRM114-Status: GOOD (  29.36  )
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

Hello,

this is a follow-up to
https://lore.kernel.org/all/20250911130739.4936-1-marius.vlad@collabora.com/
which in of itself is a follow-up to
https://lore.kernel.org/dri-devel/20240115160554.720247-1-andri@yngvason.is/ where
a new DRM connector property has been added allowing users to
force a particular color format.

That in turn was actually also a follow-up from Werner Sembach's posted at
https://lore.kernel.org/dri-devel/20210630151018.330354-1-wse@tuxedocomputers.com/

As the number of cooks have reached critical mass, I'm hoping I'll be
the last person to touch this particular series.

We have an implementation in Weston at
https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1825 that
adds support for this property. This patch series has been tested
against that MR on i915 (HDMI, DP), amdgpu (HDMI, DP) and on rockchip
(HDMI).

You can also manually test this with modetest like so, but beware that
this is a non-atomic invocation, so testing YUV420 like this will result
in weird outcomes if only some of the modes support YUV420:

  $ modetest -s 115:1920x1080-60@NV12 -w 115:'color format':4

where 115 is the connector ID and '4' is the enum value for a particular
color format.

General notes on the approach taken by me: instead of silently switching
to a different format than was explicitly requested, or even worse,
outputting something to the sink the sink doesn't support, bubble up an
error to userspace instead. "color format" is a "I want this" type
property, not a "force this" type property, i.e. the kernel will respect
the limits imposed by the hardware.

I'm not sure if my drm_bridge change actually achieves what I want in a
more complex bridge setup. I'd need to either come up with a virtual
bridge to test these scenarios, or spend some time making a flat flex
cable adapter for the DSI-HDMI bridge board I have here. Before I invest
too much time into either of those, I'd like to get some feedback on
this approach however.

Things I've tested:
- HDMI (YCbCr 4:4:4 + RGB + Auto) on RK3588
- HDMI + DP (YCbCr 4:4:4, YCbCr 4:2:0, RGB, Auto) on Intel N97 (i915)
  DP-MST is untested, but I expect it to work the same.
- HDMI (YCbCr 4:4:4, YCbCr 4:2:2, YCbCr 4:2:0, RGB, Auto) + DP (YCbCr
  4:4:4, RGB, Auto) on an AMD Radeon RX 550 (amdgpu). DP-MST is
  untested.

Changes in v4:
- Rebase onto next-20251117
- Get rid of HDMI_COLORSPACE_AUTO
- Split hdmi_compute_config change into separate patch
- Add missing symbol export for color_format_to_hdmi_colorspace to fix
  builds in certain configurations
- Drop "drm: Pass supported color formats straight onto drm_bridge"
- Make dw-hdmi-qp set the platform data's supported color formats as
  the bridge's supported HDMI color formats
- drm_hdmi_state_helper: pass requested color format to
  hdmi_compute_format_bpc if set.
- drm_bridge: limit the bus formats to those explicitly requested with
  the color format property during the atomic bridge check call,
  specifically in drm_atomic_bridge_chain_select_bus_fmts.
- i915: Remove INTEL_OUTPUT_FORMAT_AUTO, as automatic format selection
  does not need to involve the hardware state
- i915: Deduplicate ntel_output_format_to_drm_color_format code by
  moving it as a static inline __pure function into a shared header
- i915: rework logic in HDMI, DP and DP-MST output config functions to
  remove redundant locals, simplify execution flow, and return an error
  to userspace if an explicit color_format request can't be satisfied.
- i915: assign myself as the author and make the others Co-developers,
  so that they don't get the blame for any of my bugs.
- amdgpu: refactor fill_stream_properties_from_drm_display_mode to
  improve readability and ensure that impossible color format requests
  get bubbled up to userspace as errors
- amdgpu: don't pick YUV444 over RGB.
- amdgpu: assign authorship to myself, with others as Co-developers, as
  logic was modified and the blame should fall on me
- dw_hdmi_qp-rockchip: set the supported color formats platform data
  member
- rockchip: remove drm property registration for rk3066_hdmi and
  inno_hdmi. None of the platforms that use these use vop2 as the
  video output processor.
- Link to v3: https://lore.kernel.org/all/20250911130739.4936-1-marius.vlad@collabora.com/

Changes in v3 by mvlad compared to Andri's v2 series:
- renamed the property to just 'color format'
- the property is added dynamically similar to the Colorspace property
- a key point from previous comments was that drivers should advertise
  the color formats they support and userspace would query EDID and
  perform an intersection from those color formats which users can
  further use. With this patch set each driver that adds this property
  has such list of hard-coded color formats, but fundamentally the idea
  is that driver can query the HW and do that on its own. The
  infrastructure is now in place to allow to do that
- by default the 'AUTO' color format is set. With this patch series that
  has been introduced as a fallback to RGB. Drivers could further
  customize this behavour and could perform additional checks on the sink
  to pick another suitable color format they'd like for AUTO
- drm_bridge bridge code has been improved to allow initialization with
  the same color formats list as the DRM connector property. Similarly, bpc
  pick-up now takes the color format into consideration when deciding
  which bpc to choose from
- The new DRM color format re-uses HDMI_COLORPSACE enum and provides an
  enum translations between the two to avoid touching all other drivers that
  use HDMI_COLORPSACE enum. I believe at this point that this allows the
  least amount of disruption and avoids a massive bike shedding around
  that part
- a rockchip implementation has been by my colleague Derek Foreman
- YUV444 color format has been added in i915
- address comment about "Remove unnecessary SIGNAL_TYPE_HDMI_TYPE_A
  check" where aconnector might be invalid
- Link to v2: https://lore.kernel.org/dri-devel/20240115160554.720247-1-andri@yngvason.is/

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Andri Yngvason (1):
      drm: Add new general DRM property "color format"

Derek Foreman (1):
      drm/rockchip: Implement "color format" DRM property

Marius Vlad (1):
      drm: Add enum conversion from/to HDMI_COLORSPACE to DRM_COLOR_FORMAT

Nicolas Frattaroli (6):
      drm/bridge: Act on the DRM color format property
      drm/bridge: dw-hdmi-qp: Set bridge supported_formats
      drm/rockchip: dw_hdmi_qp: Set supported_formats platdata
      drm/display: hdmi-state-helper: Act on color format DRM property
      drm/i915: Implement the "color format" DRM property
      drm/amdgpu: Implement "color format" DRM property

Werner Sembach (1):
      drm/amd/display: Remove unnecessary SIGNAL_TYPE_HDMI_TYPE_A check

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  93 ++++++++--
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  14 ++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |   5 +
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |   8 +-
 drivers/gpu/drm/drm_atomic_helper.c                |   5 +
 drivers/gpu/drm/drm_atomic_uapi.c                  |   4 +
 drivers/gpu/drm/drm_bridge.c                       |  57 ++++++
 drivers/gpu/drm/drm_connector.c                    | 198 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_connector.c     |  19 ++
 drivers/gpu/drm/i915/display/intel_connector.h     |   2 +
 drivers/gpu/drm/i915/display/intel_display_types.h |  15 ++
 drivers/gpu/drm/i915/display/intel_dp.c            |  42 ++++-
 drivers/gpu/drm/i915/display/intel_dp.h            |   4 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  37 +++-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |  40 ++++-
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c     |  27 +++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |  46 +++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h       |   2 +
 include/drm/drm_connector.h                        |  57 +++++-
 19 files changed, 637 insertions(+), 38 deletions(-)
---
base-commit: d1d18879e01e4c9efcb85a96d188a8e4326136dd
change-id: 20251028-color-format-49fd202b7183

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


