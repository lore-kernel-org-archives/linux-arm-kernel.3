Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C88C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RQgbC+Y7KsyrApCRKC6pTAFJHRiriOh/yznsDejGQYE=; b=nWMDpRGh8c1YCCd9NApoUlcuFC
	WnDkvMjtF4KrAPEKDWVZ2inwA9l9QPSkLB/RklHVel6h7T5RZS+fHgc+4oKg1FYbo5NfvXdmKcMYv
	C8d9165WSykYwjjn96O0kSl0YOzSJ4Xy54R3x/j4OY8lgEL7d/Xbey48IK7vLUaklK4a5aADANCJS
	g0iGT+/ZwbObbuM8VJf36NTnkY78yFZPFVtl11X/P87H/H9JKRMK3svpkoyW2DgsmXPJbi3MDQ8bS
	G38RLYSIoMvH6LrXR0F9zg3M2HIQoCxQh741XS6j3Mg/WezLzia6ixRKu1BrTkG4pYB86UPDAz+KW
	RGV6W+Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7oq-00000009DIv-41Md;
	Tue, 21 Jul 2026 10:35:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7op-00000009DGA-1MMK;
	Tue, 21 Jul 2026 10:35:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BE65760A9B;
	Tue, 21 Jul 2026 10:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 690A1C2BCC7;
	Tue, 21 Jul 2026 10:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784630122;
	bh=uMmNbjfbAoAGlZjecUnHMoJphDiyRpVBDTeQLXwvQ/s=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=rD0jGnwn+8OOG/3wUGuHR13MoYiQKgTaxZy2D48nXZXLPO9k2jAzusKrhiuaVQ2cx
	 UNF3ooo4Oj7+e8sBbMSLRQJslbpOPOnQZDb4U5tO20L7VG/MayzSA5NVZbeSR0fwvd
	 qvkXqZRzVn48joS6ML/rmwlR2oZcjmzuC4MqF8KKBzDTab/XQ7b2bEYOcNg15Q3II1
	 QiTT6RxJQuA73wPgGFCBzh5iEKwyGFlUqncc9bdmU8Hk6P0/7ezFKbsrgviWOana4V
	 woIfsOFmoMERNUgp8bZgoMcedgJ0Kq5Mtvld0jhLkveSOL9dmoa1w1/LAtdN0hGov+
	 iun7MXxAtBlIg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F5BC4452D;
	Tue, 21 Jul 2026 10:35:22 +0000 (UTC)
From: Jason Yang via B4 Relay <devnull+jason98166.gmail.com@kernel.org>
Subject: [PATCH 0/4] phy: rockchip-samsung-dcphy: support the D-PHY
 receiver direction
Date: Tue, 21 Jul 2026 18:35:18 +0800
Message-Id: <20260721-dcphy-rx-v1-v1-0-4fc83c0ccac9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGZLX2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyND3ZTkgoxK3aIK3TJDXcvENFPzNOPUlLQUSyWgjoKi1LTMCrBp0bG
 1tQAQ/WobXQAAAA==
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784630121; l=3271;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=uMmNbjfbAoAGlZjecUnHMoJphDiyRpVBDTeQLXwvQ/s=;
 b=acbHnnO18n8HjxYAtF3k6BQfuQ17jUfRTvv3dVfAK0vIUGSL6af4OmcURZ4D/Cu4ZKceb00mc
 3/H7Qj4QAr/AXUoKmsbISIt8S9s8iVFS5sFB4nq3a+bANHpCjlgyZXD
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-Endpoint-Received: by B4 Relay for jason98166@gmail.com/20260721 with
 auth_id=887
X-Original-From: Jason Yang <jason98166@gmail.com>
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
Reply-To: jason98166@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The Samsung DC-PHY on RK3588 contains both a MIPI transmitter (DSI)
and a MIPI receiver (CSI) with separate register banks and resets.
Mainline currently models only the transmitter. This series adds the
receiver so a CSI camera can use the PHY, including running both
directions concurrently (a DSI panel and a CSI camera on the same PHY
instance).

Design notes, to answer the obvious questions up front:

- Direction as a phy-cell rather than a phy_set_mode() submode:
  The PHY core reference-counts power_on() per struct phy. Bringing TX
  and RX up and down independently requires one struct phy per
  direction; a submode on a single phy cannot express two concurrent
  owners. The extra cell selects which of the two phys a consumer
  gets, following how phy-exynos-mipi-video exposes multiple phys
  from one register block. The existing single-cell binding still
  resolves to the transmitter, ensuring shipped device trees remain
  unaffected.

- BIAS block coordination:
  The BIAS block is part of the PHY's common block and exists once for
  both directions (RK3588 TRM section 22.2), so it must be programmed
  only once. Whichever direction powers on first enables it; the
  first-on/last-off coordination follows phy-exynos-mipi-video.

- RX tuning:
  RX tuning uses fixed RK3588 defaults. Boards that need finer
  receiver tuning should extend phy_configure_opts_mipi_dphy rather
  than add private device-tree properties.

Patch summary:
  patch 1: dt-bindings: optional second #phy-cells cell for direction
  patch 2: prep: symmetric TX power on/off helpers, no functional change
  patch 3: register one struct phy per direction
  patch 4: implement the receiver

Testing:
The series was tested on an IEI WAFER-RK3588 board across the following
configurations:
- Concurrent TX/RX: IMX219 CSI camera capture (640x480, 1640x1232,
  1920x1080, and 3280x2464 in both RAW10 and RAW8) and OV5640 capture
  (1920x1080) through the DC-PHY RX, running concurrently with a MIPI
  DSI panel (ILI9881C, 720x1280) driven through the TX half of the same
  PHY instance.
- Standalone modes: DSI-only and CSI-only configurations.
- Backward compatibility: A shipped single-cell DSI device tree
  resolving unchanged to the transmitter.

HS-video fix that is not part of this submission; however, the receiver
support added here is exercised and verified independently by the
CSI-only capture tests.

Note: The DSI half of the concurrent test required a local dw-mipi-dsi2
---
Jason Yang (4):
      dt-bindings: phy: rockchip,rk3588-mipi-dcphy: support per-direction phys
      phy: rockchip-samsung-dcphy: factor MIPI D-PHY power on/off into helpers
      phy: rockchip-samsung-dcphy: model TX and RX as separate PHYs
      phy: rockchip-samsung-dcphy: add MIPI D-PHY receiver support

 .../bindings/phy/rockchip,rk3588-mipi-dcphy.yaml   |  22 +-
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c  | 456 +++++++++++++++++++--
 .../dt-bindings/phy/phy-rockchip-samsung-dcphy.h   |  13 +
 3 files changed, 442 insertions(+), 49 deletions(-)
---
base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
change-id: 20260721-dcphy-rx-v1-9af57f3edfd9

Best regards,
-- 
Jason Yang <jason98166@gmail.com>



