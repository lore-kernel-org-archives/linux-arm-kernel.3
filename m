Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B0CCD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 16:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bdRAXN8/G6V0TauaOmHAdMQdTVVEDI8R9NdBqnkkqUg=; b=5F8iyf3vkLmop8
	8HE2xsVVgXsWjBdKFtp8OhnKx8XsMrTsT7KUtbQ81f7dC/OlJxAooHtIq6ye6rQov004L4ogf5NJo
	VT/YxdF98WxE1z0IPFZM7k776I+WHsQK9dLyfagYQ0SYm75QgE36CTPFIsVBm6s8fW7j/mrz+af1Z
	Fh+E8hjV+Go+UlPhU/GGjri1927GRCIAdWkbRFdI6Lc8Q8rDY12Yh/pE6ajBdH/snscImvJUC7BXu
	UyyqaGuq+rXQKJF8AxRq8cVN22AgJe5VR2RtVKlIMnMwsm6kHviSXiACn+x6AH+9oECgGoMfyz9l3
	sHkHPEYxlfxE7AIsl4vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4dv-0000000BE8p-0e2a;
	Fri, 12 Jun 2026 16:22:03 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4dp-0000000BE2D-0E7m;
	Fri, 12 Jun 2026 16:21:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781281314;
	bh=52iffomTtbgfewPGC0mdFF4c5lwIhbjhAsA/ZD45zkQ=;
	h=From:Subject:Date:To:Cc:From;
	b=BQ/B/2LQXyAL8XFYOjZ15v3HeeSXyszt5BsnLlhpMQxJwGooiGp/sDwhWDaJh8bgf
	 kPB/1sQyJ/vTXOvz0/HHAQV03dFNg7snKtDIu5QGoGoRuJtlblOyfkq5J46eGUk3A7
	 s+3HXrMSfKlFSSK6WvMT8Hh+senND5QRe9sZgx90Q5ZNTsaftXyZVO0xsK/mf2qN48
	 MoYOwQKymX4tsMB8s1FC64NPZ+dm32Rg/bOots+i23UGIHX4fK01gDM9vUY/RSwjdF
	 4jT8ngKciPBPgUbj+h+5twVNY1r6zDVIEpTi9yMxnRPP8GaX3YwYuE9Wrhco0FDbBa
	 +uI/Pk8mvT6Yw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1EABF17E0B69;
	Fri, 12 Jun 2026 18:21:54 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C465A480027; Fri, 12 Jun 2026 18:21:53 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v5 00/18] phy: rockchip: usbdp: Fixes, DP 1-lane support
 and cleanups
Date: Fri, 12 Jun 2026 18:21:38 +0200
Message-Id: <20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABIyLGoC/4XPSw7CIBCA4asY1mLKUKB15T2MC6CDJdbSgG00p
 ncX3WiMj+U/yXyTuZKE0WMi68WVRJx88qHPIZYLYlvd75H6JjeBAmQBBacx2INt/UDHZJqB2g5
 1Pw5UGFE3zgjJNCd5eYjo/PkBb3e5W59OIV4edyZ2n/4lJ0YLyqSWrgZsmJIbG7pOmxD1yoYju
 bMTvFDsOwWZMlKhBRCulviJ4k+K/6B4pjhWDqta8/z2J6p8UiVUX6kyU0opIRVDiwDv1DzPN1M
 BlRuhAQAA
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
 William Wu <william.wu@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5256;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=52iffomTtbgfewPGC0mdFF4c5lwIhbjhAsA/ZD45zkQ=;
 b=kA0DAAoB2O7X88g7+poByyZiAGosMiCieu6XJA6YP3+q+Dg6HD0p9NGOb2Qu7kEvAXCPnaldr
 okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqLDIgAAoJENju1/PIO/qa2tIP/0si
 eQyNoQfPgRMZR61fCB6fIfH4SUKqPjsE8soGVp3DY6EO4snKO/5n2NWvo1uRz/SRqSo61esBNQ3
 cbuXRyouqAW6wDR9TQvnogFFp1XCuhouBKr9TsDx8AvM3y4E1/o2abO+ws7SRr3VZEkwHrSR2Oc
 kLud54N+cu5QoQEvUlK6VDJgxt4CTN73L+wmLC2XiK/VEiJBHehC9ZXfY4YXAiYyhzYcPSZOxKE
 sJ7lZqwwyU5d6IAamJb3dpV0t2k9z/pzKkFprS7wmg2kRfSXqe1fID7sGAKAnd8pLKStePV3zMG
 SwsubZ4Wu/P5Gqk8cUAzsqm4Wo5sn9//z6ox2q6tdk5xvYqSn9SzStn5fLrczPX32yWq7/DA3xg
 iWxW6a7hBRuwlSqqUiyr37eRihK8a9Pfxucdsu0+yQgabI1W5vfUswZHBgyAj6iY3AxvZJIrM+V
 apOgaJAK4Vazq0cCFQdlgiC0hhxOMSruoRr9uEbgsK1tcIQkr9zSLLlCM6aeMtsZo9N7Y2FBTOp
 poHU+2CqgwZV5VvvBbYf60g5TfohDoQHqpY8WGdTkdTodwMTECdiwxm9ucZVrMQyGS4TC1k844X
 +sRTdPmju0EfPgQ9+Ojb8PmJHErfkP0uF020bsoWLKuU1RteINnDLJb2ZyRcJfVFcpuCsrnmlxn
 4OAtX
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_092157_254661_CD7EAAF3 
X-CRM114-Status: GOOD (  22.05  )
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

Sebastian Reichel (15):
      dt-bindings: phy: rockchip-usbdp: add improved ports scheme
      phy: rockchip: usbdp: Do not lose USB3 PHY status
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
      phy: rockchip: usbdp: Add some extra debug messages

William Wu (1):
      phy: rockchip: usbdp: Fix LFPS detect threshold control

Zhang Yubing (1):
      phy: rockchip: usbdp: Support single-lane DP

 .../bindings/phy/phy-rockchip-usbdp.yaml           |  23 ++
 drivers/phy/rockchip/Kconfig                       |   2 +
 drivers/phy/rockchip/phy-rockchip-usbdp.c          | 357 +++++++++------------
 3 files changed, 181 insertions(+), 201 deletions(-)
---
base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
change-id: 20260203-rockchip-usbdp-cleanup-5b59dfb561a3

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


