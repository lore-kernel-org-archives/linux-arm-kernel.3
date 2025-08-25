Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E07CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 09:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+CiOwls730Y5YNa1VbYPxCowqXv0hlXR/6JnptjbABY=; b=JBiavupuVmWIbS
	hue58LwraU/W14UMw93CrERLf9yvPwEgxayuC37I7YXeWn8KZNcx0DccsALo8xBZWLNJfoYPVrvol
	SbGRDIfU6QypQOMepJQBC5rePA0OAqy3MkNH43uDjfaS4TDQ9DPL7FjhnVLwmpvjN9y4aBJXwam9a
	R1bdwcuGhnCV9zPmrqKhC07KBxCrjA/ygacDwhsbBlgNMJUvCeGToKdqs615EAaUPLMC280LHHy8g
	Ioxf+XQh/9d8BWm6wU+yifW5C0GgIYdpXoYUScsWPDuqq2EBxs+mMtfB0VupgYkfdN7ii04wd0b/t
	tarE49GMtTJx3F+n6Iuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqTce-00000007Vzr-1jhd;
	Mon, 25 Aug 2025 09:36:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqT0o-00000007PsW-3JDp;
	Mon, 25 Aug 2025 08:57:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756112228;
	bh=zvLW3wGbwKzkUggXielrONki1B8NjgaxEZomqsZuCj4=;
	h=From:Subject:Date:To:Cc:From;
	b=DQaBwUH7hMiLAHA+D+yHNopUPEEk6DXw9wHz3qC+FRRDXgqPygb14HJt4xDCL+E6L
	 rZ9qlgFduewudbmw+rRqNllYVJI33HtUCQtgbuGzkP8F22mXU66dExiOe9hg9NUbeq
	 0GjF+wMgyCExM8xQ5aRt6yQ3h+G7cQvPtEMEM2dBJvo0e97ijYPLuP9ndVGlcWE/6V
	 atWexI5xZpEZWwjXRHKHQ18lsyWnQllXiV5WiPOeHNdvj9IgdzzMpMIrlG+AQH8KWB
	 dUJDEpU5+DBoIOZPqRnM90K4wAT84erxxDumEeQAIrnGaOqlWidfKpEoLvra+VMIy+
	 6u16A++YFhbvg==
Received: from localhost (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 7A6E817E0478;
	Mon, 25 Aug 2025 10:57:08 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v3 0/6] Add HDMI CEC support to Rockchip RK3588/RK3576 SoCs
Date: Mon, 25 Aug 2025 11:56:40 +0300
Message-Id: <20250825-rk3588-hdmi-cec-v3-0-95324fb22592@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEglrGgC/2XNTQrCMBAF4KuUrI3krzS48h7iIplMbLBtJJGgl
 N7dtCCIXcziPXjfzCRjCpjJqZlJwhJyiFMN8tAQ6M10QxpczUQw0bKOSZrustWa9m4MFBDqGe1
 bIZ1XmtTVI6EPr028XGvuQ37G9N4eFL62X0vtrMIpo8I67VB3jIE7QxwGY2MyR4gjWb0ifgzO9
 oaohq+VsiiVBf5vLMvyAWoGu9z2AAAA
X-Change-ID: 20250703-rk3588-hdmi-cec-cea8f523df48
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Algea Cao <algea.cao@rock-chips.com>, 
 Derek Foreman <derek.foreman@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_015711_023258_AE833CAF 
X-CRM114-Status: GOOD (  13.29  )
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

The first patch in the series implements the CEC capability of the
Synopsys DesignWare HDMI QP TX controller found in RK3588 & RK3576 Socs.
This is based on the downstream code, but rewritten on top of the CEC
helpers added recently to the DRM HDMI connector framework.

The second patch is needed for RK3576 in order to fixup the timer base
setup according to the actual reference clock rate, which differs
slightly from RK3588.

The following three patches setup platform data with the new information
expected by the HDMI QP transmitter library, while improving the error
handling in the probe path.

Please note the CEC helpers were affected by a resource deallocation
issue which could crash the kernel and freeze the system under certain
test conditions.  This has been already fixed in v6.17-rc1 via commit
19920ab98e17 ("drm/display: hdmi-cec-helper: Fix adapter
unregistration").

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v3:
- Fixup PATCH 1 according to the recent upstream commit 02bb63d1a593
  ("drm/bridge: Make dp/hdmi_audio_* callback keep the same paramter
  order with get_modes") which changed the signature of ->hdmi_cec_init()
  callback of struct drm_bridge_funcs; while at it, also update the
  copyright section
- Updated cover letter to indicate that the CEC helpers fix is already
  available since v6.17-rc1
- Rebased series onto next-20250825
- Link to v2: https://lore.kernel.org/r/20250710-rk3588-hdmi-cec-v2-0-f5884be34bc1@collabora.com

Changes in v2:
- Collected R-b tag from Dmitry
- Restructured the generic bridge patches to not depend on the
  platform-specific changes and updated cover letter accordingly (Heiko)
- Replaced the loop searching for "ref" clock with clk_get() (Maxime)
- Added new patch "drm/rockchip: dw_hdmi_qp: Improve error handling with
  dev_err_probe()"
- Link to v1: https://lore.kernel.org/r/20250704-rk3588-hdmi-cec-v1-0-2bd8de8700cd@collabora.com

---
Cristian Ciocaltea (6):
      drm/bridge: dw-hdmi-qp: Add CEC support
      drm/bridge: dw-hdmi-qp: Fixup timer base setup
      drm/rockchip: dw_hdmi_qp: Improve error handling with dev_err_probe()
      drm/rockchip: dw_hdmi_qp: Provide CEC IRQ in dw_hdmi_qp_plat_data
      drm/rockchip: dw_hdmi_qp: Provide ref clock rate in dw_hdmi_qp_plat_data
      arm64: defconfig: Enable DW HDMI QP CEC support

 arch/arm64/configs/defconfig                   |   1 +
 drivers/gpu/drm/bridge/synopsys/Kconfig        |   8 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   | 232 ++++++++++++++++++++++++-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h   |  14 ++
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c |  77 ++++----
 include/drm/bridge/dw_hdmi_qp.h                |   2 +
 6 files changed, 292 insertions(+), 42 deletions(-)
---
base-commit: 6c68f4c0a147c025ae0b25fab688c7c47964a02f
change-id: 20250703-rk3588-hdmi-cec-cea8f523df48


