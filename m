Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC50CCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 18:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=31DWmOxa9H0YLlyywcL1teAfMHrt/O+vunZx0P07ARE=; b=ND5+Or3LGY+4wO
	Ke+okazjHQjXvhR/j71niH3ShBEgMA+Vtu2N9FlMaCErcPiUl95Lzoo6iAcITO+EkWvpN5qqCN3Mu
	ogEq68KHjZ/FGvKUuILi2+G9twnTpLBuEoawZIg6aEUMO3cE2KiGQuSAz2yh45rH3tu1QdOaJZzCT
	iRe+NOWqZ6m6BXUksX2kSNjtfmB9XepypU8b/YD4PajKdmyuBN65G/D0MwQobHb0IL11JplZHnQQv
	T1mChgF6GW3Lts1mxZZIG3YaeaSNlW6LFW3b/G1aeFaD5LhZZZM9RaC1Hih3cTqjPaOcXNKQpVjjy
	a2EGSr+tYtkL0PxvumMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8NGl-0000000E9P2-0qOL;
	Mon, 13 Oct 2025 18:27:39 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8NGh-0000000E9Mn-3Fta;
	Mon, 13 Oct 2025 18:27:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760380053;
	bh=BIcA4osUmV/1VbMUUXeGDi2zOdw1yTeJ2CK9wzGmF+4=;
	h=From:Subject:Date:To:Cc:From;
	b=cveAs0diTCznavmi+DTpudynnyzFIosDn4AGMJvnJPUPqziS0Uy2rgoK1if1yZekL
	 34HcPgvmF25JDHLM2rLf8msrZyJ5tH9Hl1k/93AnPEKflr/aIkM+6RVQOfW/mzr+cN
	 63OWEQNlInMr0dcpV6yc5/rkMPXrPXSH2Ochb1RZFuVW7uTGqhNdvcuWOsyDZXaXo/
	 Lj1y1WotdICF9Qh9vdnfhyjmfP0vYzOGliZUq4+Gp8tUPWnViOOMuqlaxN5hILMfbI
	 jyRups+UT8H06V54a+wupmKLxHd7dvHRIhCWzV2bEWETXkySlt1Ugz/vdejz7oTQWl
	 BOYyHDU294pkw==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id CBBC317E124A;
	Mon, 13 Oct 2025 20:27:32 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v2 0/2] Introduce BACKGROUND_COLOR DRM CRTC property
Date: Mon, 13 Oct 2025 21:27:17 +0300
Message-Id: <20251013-rk3588-bgcolor-v2-0-25cc3810ba8c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIVE7WgC/13MSw7CIBSF4a00dywGMARw5D5MBzxbYi3mYoimY
 e9inTn8T3K+DUrAFAqchw0w1FRSXnvwwwBuNusUSPK9gVMuqOKa4O0klCJ2cnnJSBwz0mojqLQ
 O+umBIabXDl7H3nMqz4zv3a/su/4oTfk/VRmhJHotfdTMKx0vfV+MzWiOLt9hbK19AL42yM2wA
 AAA
X-Change-ID: 20250829-rk3588-bgcolor-c1a7b9a507bc
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_112735_975097_EF11BC8C 
X-CRM114-Status: GOOD (  16.37  )
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

* Renamed DRM_ARGB_<COMP>() to DRM_ARGB64_GET<C>_BPC() while providing
  convenience wrappers to extract all 16 bits of a specific color via
  DRM_ARGB64_GET<C>()
* Replaced drm_argb() function with DRM_ARGB64_PREP_BPC() macro, to
  improve uAPI consistency and readability; additionally fixed a bug in
  case of using bpc < 16: the unused least-significant bits of a given
  component in the output value would contain the unused
  most-significant bits of the following component in the input value,
  instead of being set to 0
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

Initially this has been validated using a modetest wrapper script [2],
which is able to execute several tests - see an example of a generated
report at the end.

In the meantime, the implementation on Weston side has been finalized,
providing support for the BACKGROUND_COLOR CRTC property to the DRM
backend via the merge request [3].  It relies on the already existing
background-color setting in weston.ini:

  [shell]
  background-color=0xAARRGGBB

All tests were performed on the Radxa boards listed below.  Please note
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
 - fix: apply patch [4]

[1] https://lore.kernel.org/all/20190930224707.14904-2-matthew.d.roper@intel.com/
[2] https://gitlab.collabora.com/cristicc/linux-next/-/commits/drm-vop2-bgcolor-test
[3] https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1845
[4] https://lore.kernel.org/all/20250827230943.17829-1-inochiama@gmail.com/

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
	background color (10bpc): r=0x0 g=0x0 b=0x0

---------------------------------------------------------------
 Set/get DRM property
---------------------------------------------------------------
Changing prop value to: 0xffff00000000ffff
opened device `RockChip Soc DRM` on driver `rockchip` (version 1.0.0 at 0)
Read BACKGROUND_COLOR prop (ARGB64): 0xffff00000000ffff
    Connector: HDMI-A-2
	background color (10bpc): r=0x0 g=0x0 b=0x3ff

---------------------------------------------------------------
 Plane display test 40@83:960x540+480+270
---------------------------------------------------------------

Changing prop value to 0xffffffff00000000
Press ENTER to continue..
opened device `RockChip Soc DRM` on driver `rockchip` (version 1.0.0 at 0)
testing 960x540@XR24 overlay plane 40

Read BACKGROUND_COLOR prop (ARGB64): 0xffffffff00000000
    Connector: HDMI-A-2
	background color (10bpc): r=0x3ff g=0x0 b=0x0

Changing prop value to 0xffff0000ffff0000
Press ENTER to continue..
opened device `RockChip Soc DRM` on driver `rockchip` (version 1.0.0 at 0)
testing 960x540@XR24 overlay plane 40

Read BACKGROUND_COLOR prop (ARGB64): 0xffff0000ffff0000
    Connector: HDMI-A-2
	background color (10bpc): r=0x0 g=0x3ff b=0x0

Changing prop value to 0xffff00000000ffff
Press ENTER to continue..
opened device `RockChip Soc DRM` on driver `rockchip` (version 1.0.0 at 0)
testing 960x540@XR24 overlay plane 40

Read BACKGROUND_COLOR prop (ARGB64): 0xffff00000000ffff
    Connector: HDMI-A-2
	background color (10bpc): r=0x0 g=0x0 b=0x3ff

---------------------------------------------------------------
 Restoring state
---------------------------------------------------------------
Changing prop value to: 0xffff000000000000
opened device `RockChip Soc DRM` on driver `rockchip` (version 1.0.0 at 0)
Read BACKGROUND_COLOR prop (ARGB64): 0xffff000000000000
    Connector: HDMI-A-2
	background color (10bpc): r=0x0 g=0x0 b=0x0

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v2:
- Improved uAPI consistency and readability by introducing
  DRM_ARGB64_PREP*() and DRM_ARGB64_GET*() helper macros
- Updated several code comment sections
- Referenced the counterpart Weston support in the cover letter
- Rebased series onto v6.18-rc1
- Link to v1: https://lore.kernel.org/r/20250902-rk3588-bgcolor-v1-0-fd97df91d89f@collabora.com

---
Cristian Ciocaltea (2):
      drm: Add CRTC background color property
      drm/rockchip: vop2: Support setting custom background color

 drivers/gpu/drm/drm_atomic_state_helper.c    |  1 +
 drivers/gpu/drm/drm_atomic_uapi.c            |  4 +++
 drivers/gpu/drm/drm_blend.c                  | 39 +++++++++++++++++++++++++---
 drivers/gpu/drm/drm_mode_config.c            |  6 +++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 13 +++++++++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  4 +++
 include/drm/drm_blend.h                      |  4 ++-
 include/drm/drm_crtc.h                       | 12 +++++++++
 include/drm/drm_mode_config.h                |  5 ++++
 include/uapi/drm/drm_mode.h                  | 36 +++++++++++++++++++++++++
 10 files changed, 118 insertions(+), 6 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20250829-rk3588-bgcolor-c1a7b9a507bc


