Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56005C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 17:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GAxNxjgm0CsSYddXgjg5vZK8hWsUx73Z6UaGCnw/Rjw=; b=qx7qUJx0xUa6Ke
	aZvrRB3DVDxgbTlx/LIYNOHQ+vrHsYIDhElfBTNnPBtubVESq7mPdoMx2Fuq+8BH9dsku8j/3MgrQ
	jFlBsrWfPDFyhZvx6SdK+47+uCMDPZTdOlPgKaKWUIPnk1fHLDTcM9TRIc5Zw2dhrZO6ZA9PPse+4
	l8yXIZxJOdG7xuLdTlhB65dobYCQyf6UjFw8ADONl621tSCiH4CKU2AjR+ArhUU5jyHaPr6/zyZ8o
	FL5vSpncdPMUx7Vg31SseH5g828yHo2z+h8/d7ctYxFmdfo+asCg4Iur4h2DuSNqoD+YDxAYB5rU8
	vH3GdMNI6sCuyz3AlE+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolnQ-00000005z2z-3Pea;
	Tue, 28 Jul 2026 17:40:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolnN-00000005z0o-3UF6;
	Tue, 28 Jul 2026 17:40:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785260446;
	bh=yOYlvkVc1eBUyxl5pSQRrhXqtYPM9HzCSbokrdQbUlw=;
	h=From:Subject:Date:To:Cc:From;
	b=D/AfTC/0lwe6J5yzNwwAbZwMpgN6l37tfmo+EfAUmKT0M21oDXZ9OLt5800MHHEns
	 06h8fylT2YyxIPBG52OXP1y6mFC49FI5XyU6rHMI05RE/MAJgwjZ99EJahtsk7tU1Z
	 g0T1lWT14IREZLUUDjDA58zx/YBtgHFJ6rLw3+cUGiY8E2I/GjsFydTQ+ZrKnJ3jQ8
	 NyF/o73RF8OE1wVeJJCgGQMFIn0L7E8Qe++4y7pukerKnlqVVM6wkbRtOqyxjROhiA
	 h1OnCoYDxPmb0/8RCuHfJ5JD3OBx6wmFIq12pK7cbldMecNNXkjN5Qbu1eS8rY3/wV
	 a0/vAKGRGgxTQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 580F717E06FF;
	Tue, 28 Jul 2026 19:40:46 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0A366480029; Tue, 28 Jul 2026 19:40:46 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v7 00/18] Synopsys DisplayPort Controller improvements for
 Rockchip platforms
Date: Tue, 28 Jul 2026 19:40:36 +0200
Message-Id: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XOwWrDMAyA4VcpPs/DVmQ77mnvMXZwbWU1tHGwS
 7ZQ8u5zCiNjhIwdfyE+6c4K5UiFHQ93lmmMJaa+hnk6MH92/TvxGGozEKBFA4qXqU9DmQoPHzw
 MPF6HnEa6Un8r3AQHZNvQyRBYFYZMXfx86K9vtc+x3FKeHsdGuUy/Xb3rjpILroRs0UoNYMWLT
 5eLO6Xsnn26ssUeYfXq6r4H1QuGTKdPzhvTbXnN6mkJ+16zeF5L0o0CJdotD1fPwB//YfU60aF
 DCmQkbHnqp4f7nqqeRVQeqDWIcsvT//B09QTKYK2T1iP99uZ5/gKXtQOpWgIAAA==
X-Change-ID: 20260325-synopsys-dw-dp-improvements-7da2e98df1dd
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9807;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=yOYlvkVc1eBUyxl5pSQRrhXqtYPM9HzCSbokrdQbUlw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpo6Z1yJI0vrg/aDtlJn8KCxpSSAAMuvYIJX
 8b105R+FHXj24kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqaOmdAAoJENju1/PI
 O/qasJQP/26m6Kqc55TDEAIUPaNMgaqc8tLCNTxnre04YSTmQE2VSIRZzQEF446+RepFrYHLOyL
 QSgkcZx+mijBSRQer9ZT8VsbcGdbfOfQ7KGQ/8Bl9GEN8NAP9ah2yNiMl5BdDUEeHhPn64NQANW
 nSxctNfwClnHKAqmg0Y2asZ8xxIdMnbxSO97rCy1bQsJ/3WOhB2k3Glxja6sQdkbX66EHIYaPxK
 lLtpbUbeKmfEYahn2S8r5rXv2me7XovYRCOBdJSHlVvUtzJ6zoopidoFMh3t1vneWUzjirTNWTK
 qtzFW121U0QR7PMHcnlK1EYr10KDRnmTdWkgxnClKBWh2FfcnZkW6ow0cfPHX22dck4nmtfPkHG
 hUaRLFDpVZwdtCWcg+FULmwOjQ0OMogN8LEw2CWLeqL+IEae3rYhij2YRJeza841CdMtzymuh+B
 zpe+k3qQAxtxMU170+yEdyUFGuKJXsdq1S2/HOrw+ApMMIn62ZI/4zAhtiUg53iDIAdvIJGwoU+
 bOIpVpcsajaLNJM1RtCH3VQ2rDV07BB3G1VDvg0uTbZ+3uCgmuKFeh1cIzxCyZ0yZYoT3YGyv4M
 rOGmmjG0gL1eP/vClJEfsAWrMXZ9/fqu0a17+R1TFqLHDpF4ZTXybzvyvt5IaZ+HvATVYVmqT49
 q8RbMksVPKqnH8onRXQkuYw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_104050_035634_1C011639 
X-CRM114-Status: GOOD (  30.08  )
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

This patch series updates the Synopsys Designware DisplayPort bridge
together with the only existing user: The Rockchip RK3576/RK3588:

 1. Follow-up bridges (PHY, USB-C connector)
    This is needed to get USB-C DP AltMode working; I've followed
    the Qualcomm driver as reference

 2. Runtime PM
    The initial driver has been upstreamed without RPM; add it to
    avoid wasting power when nothing is plugged

 3. Audio
    The initial driver has been upstreamed without audio support;
    this adds all missing bits for audio with single stream transport

To properly make use of the bridge code the following USBDP PHY series
is also needed:

https://lore.kernel.org/all/20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com/

This series can be applied without the USBDP side. In that case USB-C
support won't work as the mainline USBDP side does not register as a
DRM bridge. As upstream DT binding for USBDP does not yet support
proper ports, no such board should be upstream.

Boards using the DP controller for native DP connectors (or HDMI
bridges), currently directly link to the connector/hdmi bridge. These
are not affected by the USBDP changes and should keep working in any
case. The difference is, that this series the DRM side is aware of the
link. I don't have any of those boards, so this code path is untested.

I added a dedicated bridge callback for out-of-band hotplug events,
which is separate from the hotplug_notify. I have a feeling, that
there might be a better solution, but haven't found it. Please comment.

Changes in v7:
- Link to v6: https://lore.kernel.org/r/20260724-synopsys-dw-dp-improvements-v6-0-041d99a19c4e@collabora.com
- Move drm_bridge_add() to probe and only attach it in the bind
  function, as the object is re-used and not fully cleared by
  drm_bridge_remove (Sashiko)
- Add a new patch resetting the DP AUX sub-controller on message
  timeout to have decent error recovery (Sashiko)
- Fix dp_dp_rockchip_get_vo_grf -> dw_dp_rockchip_get_vo_grf (Sashiko)
- Introduce pm_active in the PM runtime patch, to early exit
  on atomic_disable when atomic_enable failed to get runtime
  PM enabled (Sashiko)
- Introduce drm_bound in the PM runtime patch, which is (un)set
  when the driver is bound to a DRM encoder and used to enable
  IRQ enabling in the runtime PM handlers. This in turn protects
  the system of potential spurious interrupts. (Sashiko)
- In the audio patch, fix support for hotplug with a running
  audio stream. (Sashiko)
- To avoid further blowing up the series, I've decided not to
  act on these "pre-existing" issues reported by Sashiko. I
  think it makes sense to handle them separately:
    * Short HPD and Long HPD events share a single boolean state
      variable, causing critical hot plug events to be lost if
      interrupts arrive in quick succession.
    * DP AUX lifetime complains (registered too early / unregistered
      too late); reported multiple times
    * The driver fails to support DP AUX short reads, incorrectly
      rejecting them with -EBUSY instead of returning the number
      of bytes successfully transferred, which breaks I2C-over-AUX.
- Collected Reviewed-by from Krzysztof Kozlowski on the
  DT binding patch

Changes in v6:
- Link to v5: https://lore.kernel.org/r/20260724-synopsys-dw-dp-improvements-v5-0-9445c2e87441@collabora.com
- Fix overlong commit message in mutex patch
- Update MEDIA_BUS_FMT_FIXED patch, to use input format as output format
  when output format is MEDIA_BUS_FMT_FIXED (Sashiko)
- Drop patch moving dw_dp_bridge_atomic_get_output_bus_fmts (no longer
  needed)
- Reword the comment about platforms other than RK3576 and RK3588
  shouldn't get the VO GRF from the USBDP to make it more obvious
  that no such platform exist at the moment and thus the alternative
  path will not be implemented at this point in time (Sashiko)
- Update the runtime PM code to have much better error handling
  as well as support for platforms not using runtime PM (Sashiko)
- Update the runtime PM code to keep the device suspended when
  probed, but unbound as a nice side effect
- Fix error handling for dw_dp_audio_infoframe_send() in audio
  patch (Sashiko)
- Fix typo in sample width check in audio patch (Sashiko)
- Improve cleanup of SDP in audio patch (Sashiko)

Changes in v5:
- Link to v4: https://lore.kernel.org/r/20260721-synopsys-dw-dp-improvements-v4-0-f0f4a4ede712@collabora.com
- Add new patch to cancel pending HPD work on unbind (Sashiko)
- Add new patch to add missing mutex cleanups on module removal (Sashiko)
- Add new patch moving dw_dp_bridge_atomic_get_output_bus_fmts
- Update MEDIA_BUS_FMT_FIXED patch to avoid fixed RGB888 format
  and instead use whatever works for the negotiated bandwidth (Sashiko)
- Add more error checking for runtime PM patches (Sashiko)
- Ensure runtime PM is held in interrupt handler (Sashiko)
- Fix usbc_mode logic inversion for runtime PM in unbind (Sashiko)
- Move sleep for HPD_HOT_PLUG from hotplug handler to runtime
  resume function; no need to sleep when runtime PM is kept
  active and runtime PM resume is a slow operation anyways. (Sashiko)
- Add new patch to protect sdp_reg_bank from concurrent access (Sashiko)
- Add new patch to use regmap_set_bits in dw_dp_send_sdp()
- Update DT binding patch to be all about the selected solution and
  mention the ABI break
- Clear SDP in the audio patch on unprepare (Sashiko)
- Add a comment, that only 1,2 or 8 channels are supported (Sashiko)
- Error out on unsupported sample_width (Sashiko)
- Fix missing error check for clock enable (Sashiko)

Changes in PATCHv4:
 - Link to v3: https://lore.kernel.org/all/20260612-synopsys-dw-dp-improvements-v3-0-dc61e6352508@collabora.com/
 - Drop "Simplify driver data setting" (effectively reverted later on)
 - Add "Fix incorrect resource lifetimes in bind callback", which
   affects all following patches quite a bit (Sashiko)
 - Update "Add follow-up bridge support" to mention that fatal errors
   are fine (Sashiko)
 - Update "Add out-of-band HPD notify handler" to use
   drm_for_each_bridge_in_chain() instead of
   drm_for_each_bridge_in_chain_scoped() required after rebase to
   latest drm-misc-next
 - Add 100ms sleep in hpd detect functions after runtime resume in the
   "Add Runtime PM support" patch (Andy Yan)
 - Keep runtime PM enabled if DP is used without USB-C to avoid missing
   HPD signals in "Add Runtime PM support" patch (Andy Yan)
 - Update patch description of DT binding patch and drop RFC tag
 - Use pm_runtime_resume_and_get() in the audio startup function, which
   allows easy error handling (Sashiko)
 - Avoid updating audio_interface in the audio prepare function when
   an error related early exit happens (Sashiko)
 - Add error handling for clock prepare calls in audio prepare function
   (Sashiko)

Changes in PATCHv3:
- Link to v2: https://lore.kernel.org/r/20260501-synopsys-dw-dp-improvements-v2-0-d7e7f6bac77f@collabora.com
- Collect Reviewed-by on "Simplify driver data setting" patch (Andy Yan)
- Use of_drm_get_bridge_by_endpoint instead of devm_drm_of_get_bridge (Luca Ceresoli)
- Use FIELD_PREP_WM16 instead of FIELD_PREP_WM16_CONST (Chaoyi Chen)
- Rebase to latest drm-misc-next (Dropped Cristian's patches)

Changes in PATCHv2:
 * Link to v1: https://lore.kernel.org/r/20260326-synopsys-dw-dp-improvements-v1-0-501849162290@collabora.com
 * rebased to latest drm-misc-next
 * prepended the Patches from Cristian's cleanup series, as they also
   needed a rebase and should be merged first
   https://lore.kernel.org/dri-devel/20260327-drm-rk-fixes-v3-0-fd2e6900c08c@collabora.com/
 * fix issue with the audio stream (un)prepare handling in last patch

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Sebastian Reichel (18):
      drm/bridge: synopsys: dw-dp: Fix incorrect resource lifetimes in bind callback
      drm/bridge: synopsys: dw-dp: Cancel pending HPD work on unbind
      drm/bridge: synopsys: dw-dp: Add missing mutex cleanups on module removal
      drm/bridge: synopsys: dw-dp: Add missing reinit_completion
      drm/bridge: synopsys: dw-dp: Reset AUX channel on transfer timeout
      drm/bridge: synopsys: dw-dp: Free output_fmts when none are valid
      drm/bridge: synopsys: dw-dp: Support MEDIA_BUS_FMT_FIXED
      drm/bridge: synopsys: dw-dp: Add follow-up bridge support
      drm/bridge: Add out-of-band HPD notify handler
      drm/bridge: synopsys: dw-dp: Support software triggered OOB HPD
      drm/rockchip: dw_dp: Implement out-of-band HPD handling
      drm/bridge: synopsys: dw-dp: Add Runtime PM support
      drm/rockchip: dw_dp: Add runtime PM support
      drm/bridge: synopsys: dw-dp: Protect sdp_reg_bank from concurrent access
      drm/bridge: synopsys: dw-dp: Use regmap_set_bits in dw_dp_send_sdp
      dt-bindings: display: rockchip: dw-dp: Fix sound DAI cells
      drm/bridge: synopsys: dw-dp: Clear only enabled SDPs on atomic disable
      drm/bridge: synopsys: dw-dp: Add audio support

 .../bindings/display/rockchip/rockchip,dw-dp.yaml  |   9 +-
 drivers/gpu/drm/bridge/synopsys/dw-dp.c            | 684 ++++++++++++++++++---
 drivers/gpu/drm/display/drm_bridge_connector.c     |   6 +
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c          | 219 ++++++-
 include/drm/bridge/dw_dp.h                         |  11 +-
 include/drm/drm_bridge.h                           |  14 +
 6 files changed, 840 insertions(+), 103 deletions(-)
---
base-commit: df0311845915442ab75d03ee89fb443b444c1370
change-id: 20260325-synopsys-dw-dp-improvements-7da2e98df1dd

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>


