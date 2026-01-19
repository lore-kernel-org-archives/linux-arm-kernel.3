Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3546BD29C2C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 13:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pDP7dsmJ7ERvTMrFlDtRRpKve4jutlnVW9r0kkMr+Xs=; b=PSTWLy5n54gYvf
	DT5hqlzSY1MxlbcN8zfUWDf9v1YuLJfHAcPZyKsCL8BZhMQEomHKJW76F5Bh5gMPObk7D2x2eyGke
	dpBGPRZzgfkfJJxSH+YcakITSu8V8PWFheIkC1WaGqZ1NeEIBUk7WIaJuEv3ClvFqKCYI/oHjy26h
	Z/F0+YyncVQrj+JBsEg+DLhA1Q6xF2y6bNwOAKf0zbIgEadnK87sJ3eceAiw19kuKgAxnmlIuWN24
	lDoU8F+ZlE2IaMVHLwGy8BhEXyDuamcEESroSrHc9ONF0qkV2vfp7Ywr8f1w5QZkZ+Of6CRba5Fq1
	UDwVMBcvxA0yN9qP6WaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpGj-000000029yD-3oNC;
	Mon, 19 Jan 2026 13:26:09 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpGe-000000029x2-1AlN;
	Mon, 19 Jan 2026 13:26:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768829159;
	bh=sqfQDshehqB1xMQVflYLdFdf0im+HgX16id1D1XuhGA=;
	h=From:Subject:Date:To:Cc:From;
	b=jqV9Qe0BxvrMoVgNxRaEVH+SP6bxkzyDX7XEU7WG+LBEtQhMzm17p89B6t0oOvDHv
	 9HLQMgom53Ao11Uwjn4+TcyEeCJWdjBnmeLTMiR5clxqJsx5PsMDHAbwg6G7JR7FEu
	 CrupbsODbkc3g4qADK7PII3aNL498ji74SGfFrnKfgVBJMwaCp2Au2ItvizHFQmHMI
	 QAVGXe2VO7w8m41hqE9yx5RmAepUIkcPf6rcWQbKK5NkCvwGyc4xHmKnqnEIBsMF2P
	 o81aKui/k+6TcKa5dZnK2XAJAwe0idtIqRXIAlhf5lqigI8VRZx4wHS3orrMvUlEWF
	 ex+aEnWq3g+eA==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B9AC117E0117;
	Mon, 19 Jan 2026 14:25:59 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v3 0/4] Add HDMI 2.0 support to DW HDMI QP TX
Date: Mon, 19 Jan 2026 15:25:56 +0200
Message-Id: <20260119-dw-hdmi-qp-scramb-v3-0-bd8611730fc1@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOQwbmkC/33NTQrCMBCG4auUrB1Jpr+68h7iIpmkNtA2NZGol
 N7dtOBGxOX7wTwzs2C8NYEds5l5E22wbkyR7zJGnRyvBqxOzZBjKZDnoB/Q6cHCbYJAXg4KSCv
 dqLImag8s3U3etPa5medL6s6Gu/Ov7UUU6/pPiwI4NHnVmrrgQlaHE7m+l8p5uSc3sFWM+FEqL
 sRPBZMiTa2QykZjob+VZVneOnAAbfwAAAA=
X-Change-ID: 20251203-dw-hdmi-qp-scramb-cdbd8b57ccf9
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_052604_487723_5C59CF54 
X-CRM114-Status: GOOD (  11.10  )
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

This patch series provides the missing support for high TMDS clock ratio
and scrambling to DW HDMI QP TX library, required for handling HDMI 2.0
display modes on RK3576 & RK3588 SoCs.

In order to allow addressing the SCDC status lost on sink disconnects,
it adds an atomic variant of the drm_bridge_funcs.detect callback and a
new drm_bridge_detect_ctx() helper, which is further used in
drm_bridge_connector to switch to ->detect_ctx hook.

Furthermore, it optimizes HPD event handling in dw_hdmi_qp Rockchip
platform driver to run the detect cycle on the affected connector only.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v3:
- Used drm_bridge_helper_reset_crtc() helper to reset the display
  pipeline and got rid of some boilerplate code (Maxime)
- Rebased onto latest drm-misc-next
- Link to v2: https://lore.kernel.org/r/20260113-dw-hdmi-qp-scramb-v2-0-ae7b2c58d24d@collabora.com

Changes in v2:
- Collected Tested-by tags from Diederik and Maud
- Rebased onto latest drm-misc-next
- Ensured the recently introduced 'no-hpd' support for dealing with
  unconnected/repurposed/broken HPD pin is limited to HDMI 1.4 rates
- Link to v1: https://lore.kernel.org/r/20251203-dw-hdmi-qp-scramb-v1-0-836fe7401a69@collabora.com

---
Cristian Ciocaltea (4):
      drm/bridge: Add ->detect_ctx hook and drm_bridge_detect_ctx()
      drm/bridge-connector: Switch to using ->detect_ctx hook
      drm/bridge: dw-hdmi-qp: Add high TMDS clock ratio and scrambling support
      drm/rockchip: dw_hdmi_qp: Do not send HPD events for all connectors

 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   | 167 ++++++++++++++++++++++---
 drivers/gpu/drm/display/drm_bridge_connector.c |  73 +++++------
 drivers/gpu/drm/drm_bridge.c                   |  58 +++++++++
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c |  44 +++----
 include/drm/drm_bridge.h                       |  30 +++++
 5 files changed, 296 insertions(+), 76 deletions(-)
---
base-commit: 1c21f240fbc1e47b94e68abfa2da2c01ed29a74d
change-id: 20251203-dw-hdmi-qp-scramb-cdbd8b57ccf9


