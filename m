Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA49EC43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 20:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WQGVD/PI4Y9l1aZNm2de37re9uhX294bSo/bUlBAz2U=; b=OJaYOwOTYCfHJi
	k5TPMNO9iAatoM+JQdBQKEqRKoUPdpIEEc4YxrnGD/V2typIQtPzoa+cYSANENy0K6Kom2pNvkbDk
	wJK1EVnEouWfkHdDd7b3TTwHSRaCra9dgQ8oiKEmRkpHDOibDctyg7Szm8ja7kE7qbfHxBZIJFvsS
	VsYPYVfKODYAA954OHu9jlRC7nSuh8vob8iShFeaahTt4mmYpeuc1gwMXJs5erKYNlRPE72lEyOHd
	5eY2T6KpcarnJhcMmtGek5W9RLwD1mE5989jZYCsc1vY+jEcX7vJnUU2dVNAb3xEXRsGvwnNGayRQ
	MNqDxS2g2Kk2JUD+cEjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDaA-0000000Bps9-0u2E;
	Fri, 26 Jun 2026 20:55:26 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDZr-0000000BpZN-2aG0;
	Fri, 26 Jun 2026 20:55:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507302;
	bh=UrLCAhUpEZcIt6PAQMBwOY8rOy1yJLTsWIfJZe/SqbM=;
	h=From:Subject:Date:To:Cc:From;
	b=koCZGsl9UQbL3B+CTkUkQ3dHqdbNtYVUu71FmDQhLY3KjAVAWu2VmLhckpw0PrEuV
	 owoaxuEWJ9GtmgmoZOakfbQ/+ZFIyQHuV+RyGrIBNpXFQK/EOHjb/B7+C2wTGB5ns/
	 WB/6EC/x6BVsXAZ9ccx/Dy1RqkMFSapZv7zqTsq8/CBNFOmis3weIrz6JEHlvmaEga
	 qegaqGb20OnblXBNEy16eWGGT9teKFl5QcZaIKKA168mdCzZiap2uSOXqJrhjn4iEX
	 loNdvNcj23cJGDyhUwRDRSpxcFoWPoz3OF9wCTQB3hlfXZaDEYFgBbMJ5+ya4GaYKG
	 n+KloGFH6ciPg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5D69217E02CB;
	Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0B93C480027; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v8 00/29] phy: rockchip: usbdp: Fixes, DP 1-lane support
 and cleanups
Date: Fri, 26 Jun 2026 22:54:53 +0200
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB7nPmoC/4XPwU6FMBAF0F956doaOqXT1pX/YVy0ZSqNSAn4i
 OaFf7e8DcSALu8kc27ujU00JprY0+XGRprTlHJfgnm4sNC6/o14akpmUAFWUEk+5vAe2jTw6+S
 bgYeOXH8duPLKNtErFE6y8jyMFNPXHX55LblN02cev+89s1iv/5Kz4BUX6DBaoEZofA6565zPo
 3sM+YOt7Aw7SpxTUCiPmgKAihbpiJIbJf+gZKEkmUjGOllmH1H1RtVgTqm6UFprhVpQIIAjSm0
 UCjilVKEoBiMrtAZtPKJwT9lTCteB3ouoai+jPByodxSoU0qvlCEvQ0RVx+Y3tSzLD6XQY1uCA
 gAA
X-Change-ID: 20260203-rockchip-usbdp-cleanup-5b59dfb561a3
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>, William Wu <william.wu@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9525;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=UrLCAhUpEZcIt6PAQMBwOY8rOy1yJLTsWIfJZe/SqbM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yQNOxEHuc4kH/ZjcPhLkyVyBMdwrKAAa
 UBiG0XlIGtHSYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuckAAoJENju1/PI
 O/qa/3MP/2vfmTo6QkLfveA7oBFmf3eey0eOnXTDJxJRMghE2IofhQeizrG9HWBdawrAzIUCY9X
 KQNYpiAMsiDBRArILF/WCIBhEYS0lguBmf2WX4ZkqkmVyYp5agIr4in0Ff4BsxCMfYQCDD7YVwP
 +/YYURaYx2gNJQaQe92l3kjlA0AAAyHbT23l7Canf2K5wza+RvgALPbmPkIdyojqSgIsyebPd1J
 Cw95ApY0Sk1xJdUPm+ewiN98pZKV07xikMuVgRIpP98Ac/IXYYUS9adHqnP8OZoUVtjz7RzmkTO
 05ROCgG1EJx0lKqIBff6UYI4/4QIYNrlLnlgScmdRPfiivkB1RE4qQEw8FnNkr2tguEqLMsM8Me
 LcbGuV3bGCVadHSWJESIdjbNryzj0rIehM16b/JxTUnGSx/C59hdhp4Io/ydSNbMJ1ZQXloO4Ru
 cvWjFVahCM79+KNklZ/QCsvrj0ZRsYQpa7n1tz4KvJz15k9Cv7zK0mwYbwIDe84mASiauhkakXJ
 jNhiX4yAmYYpN5VD2WkGMrnVWTiHMwhp3gWynmt4fFqFxMaSfo8/hAE2wQqeIvPbwpvHkYVkuKX
 KQYJGVv0U82/ygauNNaVr+bxJVhg4mBXCRo+e130kWFZGQI2m1bjmlvhqPyLgEj0STxkVGZS/Qj
 3csKN6UFKC9b9L+tfX+8f/Q==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_135508_277630_3B65A953 
X-CRM114-Status: GOOD (  33.40  )
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

This series overhauls the Rockchip USBDP driver; apart from a
a bunch of cleanups and small improvements the main goal is to
get the driver ready for proper USB-C DP AltMode support. At
the moment it only contains a semi-working state.

Once this series has landed, it unblocks enabling proper USB-C
DP AltMode on the RK3588 and RK3576 platforms incl. runtime PM
for the Synopsys DesignWare DisplayPort controller.

Apart from this series, further changes are required on the
DRM side. There are no compile-time dependencies between the
DRM side and the PHY side, but the PHY side must be applied
to avoid SErrors once runtime PM is added to the DisplayPort
controller driver. Thus it would be really good to land this
series ASAP as it blocks the DRM side.

Apart from that it also fixes a bunch of issues pointed out by
Sashiko (mostly harmless), as well as some real problems. Among
other things it should help drastically with orientation switch
problems and potential SErrors when a USB-C device is hot-plugged.

With this series applied, I did not notice any SErrors. What I do see is
cmn ana lcpll lock timeouts after a few replugs, which are permanent
(i.e. it still happens when re-trying to init the PHY after running into
the timeout). After a reboot the problem is gone. It seems the dynamic
USB3 disabling increased the chance a lot to hit this problem. I think
this is better than the current status where Serrors can appear on hotplug
due to the re-init. Unfortunately LCPLL is more or less undocumented in
the TRM, so it is hard to figure out what is going on exactly.

Changes in v8:
- Link to v7: https://lore.kernel.org/r/20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com
- Move patch "Limit DP lane count to muxed lanes" after single lane
  support, which introduces dp_lanes variable to make sure series
  is bi-sectable (Sashiko)
- Force disable HPD in "Drop seamless DP takeover" patch and update
  patch description to mention potential issues with SErrors for
  bootloaders really keeping the DW-DP on. As mentioned in the new
  commit message this is untested as I'm not aware of such a
  bootloader anyways; this also means we need to keep the HPD GRF
  register defines in the 'Drop DP HPD handling' patch (Sashiko)
- Fix mode logic in "Properly handle TYPEC_STATE_SAFE and
  TYPEC_STATE_USB" patch; I blame the heat (Sashiko)
- Improve "Support going from DP-only mode to USB mode" patch to
  better handle starting in DP only mode; due to TypeC logic
  starting delayed this does not really happen, though (Sashiko)
- Improve "Support going from DP-only mode to USB mode" to avoid
  checking previous state and instead power on USB state based
  on previous requested state to avoid effects from the flip
  callback (Sashiko)
- Update the debug message patch to include some more info
- Ad one more patch, which disables USB3 at startup and drops
  the -EPROBE_DEFER logic

Changes in v7:
- Link to v6: https://lore.kernel.org/r/20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com
- Add new patch handling missing clock-names in DT gracefully (Sashiko)
- Add new patch handling rk_udphy_reset_deassert_all errors in init check (Sashiko)
- Add new patch to handle Properly handle TYPEC_STATE_SAFE and TYPEC_STATE_USB (Sashiko)
- Add new patch to avoid xHCI SErrors

Changes in v6:
- Link to v5: https://lore.kernel.org/r/20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com
- Add explicit <linux/string_choices.h> include in last patch (Sashiko)
- Add new patch moving mode_change update after error handling (Sashiko)
- Add new patch fixing error masking of devm_clk_bulk_get_all() (Sashiko)
- Add new patch dropping seamless DP takeover as it is non-functional and buggy (Sashiko) 
- Add new patch limiting DP lane count to muxed lanes (Sashiko)
- Add error handling in the patch that keeps clocks running on PHY re-init (Sashiko)
- Also look for DP being configured to second lane for the flip config
  in DP single-lane mode, which should at least keep USB working for
  this super unusual config (Sashiko)
- Drop useless ret variable in patch introducing guard() for the mutex
- Add error handling for PHY re-enablement in the patch fixing support for
  DP-only -> USB mode (Sashiko)

Changes in v5:
- Link to v4: https://lore.kernel.org/r/20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com
- Picked up Acked-by from Rob Herring for DT binding
- Fix typos in commit messages/comments
- Add Fixes tag to "Do not looe USB3 PHY status" patch
- Collect Reviewed-by: Neil Armstrong for multiple patches
- Drop now unused code from "Drop DP HPD handling" patch (Sashiko)
- Ignore mux events not involving DP AltMode (Sashiko)
- Add new patch to support going back from DP only mode to USB combo
  mode; technically this is a fix, but DP mode does not yet work
  upstream, so it does not matter (Sashiko)
- Add new patch adding a few debug messages, which are useful
  to investigate potential hotplug issues in the future
- Sashiko comments about the DT binding and property usage
  are wrong as the first port is for the superspeed lanes
  used for DP and USB, while the last port is just about
  DP aux. I ignored them.
- There is a pre-existing bug, that can already be hit with the
  upstream kernel and that the series doesn't fix properly:
  Accessing the USB3 controller registers requires the USB PHY
  running, since it provides a clock. Re-initializing the PHY
  means there is a race-condition - if the system tries to access
  the USB3 controller in parallel to the re-init, the system will
  hang and/or fail with an SError. By keeping the clocks running
  and only asserting the resets this time is minimized by this
  series. A proper fix for this will be looked into independently
  from this series.
- I used v7.1-rc6 as base, but the driver has no changes since
  6.18 even in linux-next and there are no pending patches for
  it on the mailinglist either, so it applies to *any* recent
  kernel branch.

Changes in v4:
- Link to v3: https://lore.kernel.org/r/20260313-rockchip-usbdp-cleanup-v3-0-3e8fe89a35b5@collabora.com
- rebased to v7.1-rc1 (no changes)
- Update DRM bridge registration patch to avoid registration when DP aux
  port is not connected to anything, since this results in errors and some
  boards use USBDP instances for USB3 only.
- Add patch renaming mode_change into phy_needs_reinit
- Add patch to re-init PHY on orientation change
- Add patch to factor out lane_mux_sel setup
- Add patch to handle mutex via guard functions

Changes in v3:
- Link to v2: https://lore.kernel.org/r/20260213-rockchip-usbdp-cleanup-v2-0-b67ec225f96e@collabora.com
- Add patch to register the USBDP PHY as DRM bridge
- Add patch to describe ports in DT binding (used by the DRM bridge)
- Add patch to drop HPD handling from the PHY

Changes in v2:
- Link to v1: https://lore.kernel.org/r/20260203-rockchip-usbdp-cleanup-v1-0-16a6f92ed176@collabora.com
- Added new patches to fix USB3 SError

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Frank Wang (1):
      phy: rockchip: usbdp: Amend SSC modulation deviation

Sebastian Reichel (26):
      dt-bindings: phy: rockchip-usbdp: add improved ports scheme
      phy: rockchip: usbdp: Update mode_change after error handling
      phy: rockchip: usbdp: Do not lose USB3 PHY status
      phy: rockchip: usbdp: Fix devm_clk_bulk_get_all check
      phy: rockchip: usbdp: Handle missing clock-names DT property gracefully
      phy: rockchip: usbdp: Drop seamless DP takeover
      phy: rockchip: usbdp: Handle rk_udphy_reset_deassert_all errors in init check
      phy: rockchip: usbdp: Keep clocks running on PHY re-init
      phy: rockchip: usbdp: Add missing mode_change update
      phy: rockchip: usbdp: Limit DP lane count to muxed lanes
      phy: rockchip: usbdp: Rename DP lane functions
      phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
      phy: rockchip: usbdp: Cleanup DP lane selection function
      phy: rockchip: usbdp: Register DP aux bridge
      phy: rockchip: usbdp: Drop DP HPD handling
      phy: rockchip: usbdp: Rename mode_change to phy_needs_reinit
      phy: rockchip: usbdp: Re-init the PHY on orientation change
      phy: rockchip: usbdp: Factor out lane_mux_sel setup
      phy: rockchip: usbdp: Properly handle TYPEC_STATE_SAFE and TYPEC_STATE_USB
      phy: rockchip: usbdp: Use guard functions for mutex
      phy: rockchip: usbdp: Support going from DP-only mode to USB mode
      phy: rockchip: usbdp: Clear USB status on PHY exit
      phy: rockchip: usbdp: Hold mutex in DP PHY configure
      phy: rockchip: usbdp: Add some extra debug messages
      phy: rockchip: usbdp: Avoid xHCI SErrors
      phy: rockchip: usbdp: Disable USB3 on probe

William Wu (1):
      phy: rockchip: usbdp: Fix LFPS detect threshold control

Zhang Yubing (1):
      phy: rockchip: usbdp: Support single-lane DP

 .../bindings/phy/phy-rockchip-usbdp.yaml           |  23 ++
 drivers/phy/rockchip/Kconfig                       |   2 +
 drivers/phy/rockchip/phy-rockchip-usbdp.c          | 427 ++++++++++-----------
 3 files changed, 231 insertions(+), 221 deletions(-)
---
base-commit: 4edcdefd4083ae04b1a5656f4be6cd83ae919ef4
change-id: 20260203-rockchip-usbdp-cleanup-5b59dfb561a3

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


