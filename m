Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904DBCA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 13:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8u5f6EryvHrQV8p/NFXKekP7sXzZznrHr96xXahoB2c=; b=LFO1CbUOMe6Cxz
	KM1C1ieKAAaQHOfaUJ9Gxpa0bhfPQtOZkvCmF9lbdWuc6/nxDsBMqWmLy5vzxMJcDn73lL/Wtv9OQ
	+lKivwl0NfsWUCIJ5chz5TnCRXS0sZZMyud97LW67xQTamDZQtkRHnmPY+xNbTpou+PtHiVF6Ftyy
	+Q1ZtRuMY7TMh96O4NwCkhUsRtNY0gO261doCo/S3+epV7F1KWM4Rs9UuEk5G0WuZUr+TVJHkHeo8
	XbWy0X9VxBKwH4HarG3EiK+0ERsImQCaLoDVU6FiOvW+PRa++tUY5CfnWanjVUuGgTjKQH30DzpAk
	qWbaakqFEpjwLMMIQBVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utRFY-000000006fY-1FW9;
	Tue, 02 Sep 2025 13:40:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNJA-0000000GN5M-3DI2;
	Tue, 02 Sep 2025 09:28:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756805286;
	bh=kX99daaTmRjZZgK7NDFvXocEUTsxLb0HWG3/u7rNoOQ=;
	h=From:Subject:Date:To:Cc:From;
	b=CHRii3RUTvt67o2uyq3VloVbOygGmlL+ddS1PuriwQWfeAIyTPZlfq3zweQJ2itTL
	 qjNUWhdH3E4FsFVFqfdkCKRr0FfCQmuNe0i6bMBHF1uONrRCMKypfFTMo2LylPtFHp
	 1oh4N7dOdmPtEDmL/HzH/z715AxV2/LiETaHAS2UID8E27Blw9ZctXuU/H4EIHLYMv
	 KwQlHvNPjA657acqbePIapKEo2OmtDv3tM1RLE5mqo5BeWY+1GQkMHv9tuPTIy4hIi
	 fpfb3jye3VcvfHsE+3ot69+5m64gcVv3MESMnVJYeq0zq788GOpmHQLFlbqPfZYsVc
	 XN7+VILWcxaOw==
Received: from localhost (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 3225917E0676;
	Tue,  2 Sep 2025 11:28:06 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 0/2] Introduce BACKGROUND_COLOR DRM CRTC property
Date: Tue, 02 Sep 2025 12:27:55 +0300
Message-Id: <20250902-rk3588-bgcolor-v1-0-fd97df91d89f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJu4tmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCyNL3aJsY1MLC92k9OT8nPwi3WTDRPMky0RTA/OkZCWgpoKi1LTMCrC
 B0bG1tQBLBZTeYAAAAA==
X-Change-ID: 20250829-rk3588-bgcolor-c1a7b9a507bc
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_022809_019769_4C90BA03 
X-CRM114-Status: GOOD (  16.43  )
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

Some display controllers can be hardware-configured to present non-black
colors for pixels which are not covered by any plane (or are exposed
through transparent regions of higher planes).

The first patch of the series introduces the BACKGROUND_COLOR DRM
property that can be attached to a CRTC via a dedicated helper function.
A 64-bit ARGB color value format is also defined and can be manipulated
with the help of a few utility macros.

Note this is a reworked version of the patch [1] submitted (many) years
ago by Matt Roper.  The main changes are:

* Dropped drm_arg() in favor of drm_argb64() to get rid of the bpc
  parameter and the related shifting for more flexibility in operation,
  e.g. when user-space cannot make use of the helper and/or when it
  doesn't now the actual precision supported by the HW.  This also
  simplifies the property verification/validation testing (see below).
  It works by extracting the specified number of least-significant bits
  from each color component.
* Renamed DRM_ARGB_*() to DRM_ARGB64_*_LSB() while providing convenience
  wrappers to extract all 16 bits of a specific color via DRM_ARGB64_*()
* Replaced GENMASK_ULL(63, 0) with U64_MAX when calling
  drm_property_create_range() to create the BACKGROUND_COLOR property
* Moved crtc_state->bgcolor initialization from
  __drm_atomic_helper_crtc_reset() to
  __drm_atomic_helper_crtc_state_reset()
* Replaced '*bgcolor*' occurrences to '*background_color*' for
  consistency with the actual property name in both storage field and
  helper functions names

The second patch adds background color support to the VOP2 display
controller used in the RK3568, RK3576, and RK3588 Rockchip SoC families.

For the moment this has been validated using a modetest wrapper script
[2], which is able to execute several tests - see an example of a
generated report at the end.  Proper support in Weston is currently in
development, and I will provide a reference once it becomes available.

The tests were performed on the Radxa boards listed below.  Please note
that as of next-20250901, there are a few known regressions; for each
case, I mentioned the actual problem and its related fix/workaround
accordingly:

* ROCK 3A (RK3568)
 - issue: broken networking
 - fix: revert commit da114122b831 ("net: ethernet: stmmac: dwmac-rk: Make
   the clk_phy could be used for external phy")

* ROCK 4D (RK3576)
 - issue: random freezes right after booting
 - fix: add regulator_ignore_unused to kernel cmdline

* ROCK 5B (RK3588)
 - issue: broken networking
 - fix: apply patch [3]

[1] https://lore.kernel.org/all/20190930224707.14904-2-matthew.d.roper@intel.com/
[2] https://gitlab.collabora.com/cristicc/linux-next/-/commits/drm-vop2-bgcolor-test
[3] https://lore.kernel.org/all/20250827230943.17829-1-inochiama@gmail.com/

Validation report on ROCK 5B
============================

$ tools/testing/rk-bgcol-test.sh

---------------------------------------------------------------
 Available Rockchip display connectors
---------------------------------------------------------------
id	type	status	crtc_id	plane_id
85	11	2	0	34
88	11	1	83	40

Selected connector: id=88 crtc=83 plane=40

---------------------------------------------------------------
 Check initial state
---------------------------------------------------------------
Read BACKGROUND_COLOR prop (ARGB64): 0xffff000000000000
    Connector: HDMI-A-2
	background color (10bpc): r=0 g=0 b=0

---------------------------------------------------------------
 Set/get DRM property
---------------------------------------------------------------
Changing prop value to: 0xffff00000000ffff
opened device `RockChip Soc DRM` on driver `rockchip` (version 1.0.0 at 0)
Read BACKGROUND_COLOR prop (ARGB64): 0xffff00000000ffff
    Connector: HDMI-A-2
	background color (10bpc): r=0 g=0 b=ffff

---------------------------------------------------------------
 Plane display test 40@83:960x540+480+270
---------------------------------------------------------------

Changing prop value to 0xffffffff00000000
Press ENTER to continue..
opened device `RockChip Soc DRM` on driver `rockchip` (version 1.0.0 at 0)
testing 960x540@XR24 overlay plane 40

Read BACKGROUND_COLOR prop (ARGB64): 0xffffffff00000000
    Connector: HDMI-A-2
	background color (10bpc): r=ffff g=0 b=0

Changing prop value to 0xffff0000ffff0000
Press ENTER to continue..
opened device `RockChip Soc DRM` on driver `rockchip` (version 1.0.0 at 0)
testing 960x540@XR24 overlay plane 40

Read BACKGROUND_COLOR prop (ARGB64): 0xffff0000ffff0000
    Connector: HDMI-A-2
	background color (10bpc): r=0 g=ffff b=0

Changing prop value to 0xffff00000000ffff
Press ENTER to continue..
opened device `RockChip Soc DRM` on driver `rockchip` (version 1.0.0 at 0)
testing 960x540@XR24 overlay plane 40

Read BACKGROUND_COLOR prop (ARGB64): 0xffff00000000ffff
    Connector: HDMI-A-2
	background color (10bpc): r=0 g=0 b=ffff

---------------------------------------------------------------
 Restoring state
---------------------------------------------------------------
Changing prop value to: 0xffff000000000000
opened device `RockChip Soc DRM` on driver `rockchip` (version 1.0.0 at 0)
Read BACKGROUND_COLOR prop (ARGB64): 0xffff000000000000
    Connector: HDMI-A-2
	background color (10bpc): r=0 g=0 b=0

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Cristian Ciocaltea (2):
      drm: Add CRTC background color property
      drm/rockchip: vop2: Support setting custom background color

 drivers/gpu/drm/drm_atomic_state_helper.c    |  1 +
 drivers/gpu/drm/drm_atomic_uapi.c            |  4 +++
 drivers/gpu/drm/drm_blend.c                  | 37 +++++++++++++++++++++++++---
 drivers/gpu/drm/drm_mode_config.c            |  6 +++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 13 +++++++++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  4 +++
 include/drm/drm_blend.h                      |  4 ++-
 include/drm/drm_crtc.h                       | 12 +++++++++
 include/drm/drm_mode_config.h                |  5 ++++
 include/uapi/drm/drm_mode.h                  | 30 ++++++++++++++++++++++
 10 files changed, 110 insertions(+), 6 deletions(-)
---
base-commit: d0630b758e593506126e8eda6c3d56097d1847c5
change-id: 20250829-rk3588-bgcolor-c1a7b9a507bc


