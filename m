Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AFFCDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 15:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0W9Qyl7z/DxmgG9ilZmoVL7+3yS7cpmzXXts2attJeM=; b=T37f99uYhmuPL6
	KzYmaAcinlER2feFKayr5mMUKb6UXM6uoi62GZLkIm+WB5L1NCxLZT31ir/QGv+XrxwVSRHC+Lm+R
	baFt7sIH08VILZ78hsi+p2rdrn6ooAndaYiIPzkJyWwqahuIx1SYt/ZFrpb2L5jjI7jrGKj7pD6YU
	/wJs4GIlMajzRafu99+d8kuQRXsgIishvTLYdDA8dvmeWI7YiQTBXKr0ANbDnGp9Dgbxi/DTgJqid
	qY71+H+Zx4ebSJfG2oZ8V8xDxom4JHBkXqBHsJTeWKATHbRDP5U3BOMZa6o6ck8Qur1m/K7nqhjyt
	2iTV2PBODj04nqugn8dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wab9m-00000002dou-1jnr;
	Fri, 19 Jun 2026 15:29:22 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wab9S-00000002dVV-2Y4m;
	Fri, 19 Jun 2026 15:29:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781882937;
	bh=K6MlRTC3UjTkS0pQV3TNvsnWORdeXuLp7M/W5lJi+cg=;
	h=From:Subject:Date:To:Cc:From;
	b=Fh5FA1peb8RUjqstRPhUlLUkh6t6d/b+3b/dnW2kGOYNyAA5q5mLopcwJqvNJsShL
	 p6CufLMR0dFHgg63/Ie9ZMtpnuY8GMKBVYN20A2kzwkXp1gn+nAzYjfPVTlozvywK2
	 tqH0o8Qv5rKbXprKzXNQT35NS3vp47sTSU5Z3XEQ4/8aBPnkVmcrY3z/1+GGBxqHT4
	 y0jIcnjxIQZuc2402Z8rFlC4XkrcZd5lObd6shTpmT3PKdVHchr6G4gnQspqpbVfjJ
	 EuCJcQU7KP5P46suxCB+EVyEeYNa5ub4hTKM3ZbvmtBCnaeqEOdqCcrwcxu0n7LMTj
	 +V0AGGDi2tTNg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D017317E093F;
	Fri, 19 Jun 2026 17:28:57 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 8640E480027; Fri, 19 Jun 2026 17:28:57 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v6 00/23] phy: rockchip: usbdp: Fixes, DP 1-lane support
 and cleanups
Date: Fri, 19 Jun 2026 17:28:51 +0200
Message-Id: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADNgNWoC/4XPwU7EIBCA4VfZcBZThjLAnnwP4wHoYIm1NNRtN
 Ju+u+xeakyrx3+S+SZzZTOVRDM7n66s0JLmlMca+HBioXfjK/HU1WbQADbQSF5yeAt9mvhl9t3
 Ew0BuvExceWW76BUKJ1ldngrF9HmHn19q92n+yOXrfmcRt+m/5CJ4wwU6jBaoExqfQh4G53Nxj
 yG/sxu7wA9KHFNQKY+aAoCKFmmPkhsl/6BkpSSZSMY6Wd/eo9qNasEcUm2ltNYKtaBAAHuU2ig
 UcEipSlEMRjZoDdr4m1rX9Rs/uoZ27AEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6515;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=K6MlRTC3UjTkS0pQV3TNvsnWORdeXuLp7M/W5lJi+cg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo1YDdNuVwmplN4JoQEKsmFAJEyRW9QCXK1X
 8yR8tMoTztRDokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqNWA3AAoJENju1/PI
 O/qayTwP/RA3AdgkdmGmfF6DdMAGkxYD1WLZVdli9wogjxC35Dh5CSZM3br50cNxGrWbRNk8ZUy
 CCySonH/P+59U/ps+FwXCnxjm1gekg3iVTOY1wvLoMPn2GA/l8nROX90GwMesQv71ArdFUneHPt
 1jAfFuYeepntutVcxgcRtgT3KAFvPp0TFeEB40dS+54aPgYL5rZl3/RrbpqJjPgS4FB9UMIylL9
 K4mIFc/YNdgH6bNRU4tPmZnuad6Z7VGby2mt0aWObmaiNeQ9BFd1L5fT3j6XmdHLCbo6apnFVLy
 m2XSwVPo/aBGQj8U14NnUjhp4MTJoTdXTpILHaPbfGxTyo6kwppFY3LeCQ8STJGUlX2BxG1XN6N
 /n7J9+786GiWWx7vMUBbgP90Mc7lDu66oQtrxxkZ+LwFkPGj8bJzMr38HSJ91HtRb5Xz9MBDCmm
 UYck29rAmfIak1qYMkpjfKYhHtSiuMD1kpPomsIwIe7TOLibAZE71jJc8R0fRtb1JWL9qUH/2X5
 SlEeF9pa9fh1UuNG9JW8p1MVLKVVQVdmS9oOstVRdYsWGkkoA7injg2JCfHyxb93q8GUObitfbd
 TDdfoiRx5zY/lmPP2++nDbWeMNxXO4d3IngiBx/K2yuH3nsXUr3oz0yNgOIrCDKSkB0ZT6sR7F9
 UtHgJ/quDvejYRfsosdcjBQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_082902_824776_F1FA83BB 
X-CRM114-Status: GOOD (  25.50  )
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

Sebastian Reichel (20):
      dt-bindings: phy: rockchip-usbdp: add improved ports scheme
      phy: rockchip: usbdp: Update mode_change after error handling
      phy: rockchip: usbdp: Do not lose USB3 PHY status
      phy: rockchip: usbdp: Fix devm_clk_bulk_get_all check
      phy: rockchip: usbdp: Drop seamless DP takeover
      phy: rockchip: usbdp: Limit DP lane count to muxed lanes
      phy: rockchip: usbdp: Keep clocks running on PHY re-init
      phy: rockchip: usbdp: Add missing mode_change update
      phy: rockchip: usbdp: Rename DP lane functions
      phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
      phy: rockchip: usbdp: Cleanup DP lane selection function
      phy: rockchip: usbdp: Register DP aux bridge
      phy: rockchip: usbdp: Drop DP HPD handling
      phy: rockchip: usbdp: Rename mode_change to phy_needs_reinit
      phy: rockchip: usbdp: Re-init the PHY on orientation change
      phy: rockchip: usbdp: Factor out lane_mux_sel setup
      phy: rockchip: usbdp: Use guard functions for mutex
      phy: rockchip: usbdp: Support going from DP-only mode to USB mode
      phy: rockchip: usbdp: Hold mutex in DP PHY configure
      phy: rockchip: usbdp: Add some extra debug messages

William Wu (1):
      phy: rockchip: usbdp: Fix LFPS detect threshold control

Zhang Yubing (1):
      phy: rockchip: usbdp: Support single-lane DP

 .../bindings/phy/phy-rockchip-usbdp.yaml           |  23 ++
 drivers/phy/rockchip/Kconfig                       |   2 +
 drivers/phy/rockchip/phy-rockchip-usbdp.c          | 381 ++++++++++-----------
 3 files changed, 198 insertions(+), 208 deletions(-)
---
base-commit: 08c7183f5b9ffe4408e74fff848a4cc2105361d4
change-id: 20260203-rockchip-usbdp-cleanup-5b59dfb561a3

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


