Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DE6C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 16:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0ziiz4pCfyN0DdAlyFXIQvbXyuBI37LhL4/YnTHKwj0=; b=nFEMdA/AiBYyWYmbLt221uq9RY
	B5vos71+vaMJGg8jJFGWbo9JgGq6Oc/yuDYgBAIfpFT7QkK3FVHsMLtoReI0/LL5YNBxKJAzU8MNs
	XvnZZZqNV7Gw8s/AX9ThrpOi6GWlPR3su4CyLOZkfB8ftI4sAkEfEjvjlEX7gEqmzTJo/72W3Seim
	cBLmPOKsC+cTDafuy93/IjG+/1A5N7N+a9syxqgQ6rVJXPxwU1Cjr3d3/Mr88ZPOwVloHDLi0zHhK
	XQM18A+cFJFk0I6KGB6DYZTwmBmvioMHbr8OokoSQxligk8zAAwJD8grJ0pkQIm1OW/IJo9jST0rU
	VTzgFEMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXis6-0000000Eu2e-15Dy;
	Fri, 04 Jul 2025 16:02:42 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXijq-0000000Estx-07fj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 15:54:11 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 977091F00060
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Jul 2025 15:53:56 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 67B33ACA65F; Fri,  4 Jul 2025 15:46:56 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 630A6ACA64C;
	Fri,  4 Jul 2025 15:46:33 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v8 0/9] Allwinner A31/A83T MIPI CSI-2 and A31 ISP / Platform Support
Date: Fri,  4 Jul 2025 17:46:17 +0200
Message-ID: <20250704154628.3468793-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_085410_240351_0C431F15 
X-CRM114-Status: GOOD (  16.29  )
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

This series adds platform support for the V3s/V3/S3 MIPI CSI-2 and ISP units
as well the as A83T MIPI CSI-2 unit in the respective device-trees.
Overlays for the BananaPi M3 cameras are also provided as actual users of the
camera pipeline on A83T.

The corresponding drivers and dt bindings were merged a long time ago but this
series was never actually picked up. It seems more than ready to be merged!

Changes since v7:
- Added collected review tags;
- Added interconnect properties to bindings;
- Added compatible for device-tree overlays;
- Moved mclk pin to sensor node in bpi-m3 overlays;
- Removed duplicated assigned-clocks in bpi-m3 overlays.

Changes since v6:
- Rebased on top of the latest media tree, renamed dts to dtso for overlays.

Changes since v5:
- Added BananaPi M3 camera sensor support as device-tree overlays;
- Cleaned-up OV8865 regulator definitions;
- Always declared the internal links between CSI and MIPI CSI-2 on A83T
  in device-tree.

Changes since v4:
- Removed mbus bindings patch: an equivalent change was merged;
- Added collected tags;
- Rebased on latest media tree.

Changes since v3:
- Reordered v3s mbus compatible in binding;
- Added collected tag;
- Removed rejected interconnects fix.

Changes since all-in-one v2:
- Corrected mbus index used for the interconnects;
- Used extended mbus binding and exported the DRAM clock for that;
- Reworked the description of the core openfirmware change to give
  more insight about the situation.

Paul Kocialkowski (9):
  dt-bindings: media: sun6i-a31-csi: Add optional interconnect
    properties
  dt-bindings: media: sun6i-a31-isp: Add optional interconnect
    properties
  clk: sunxi-ng: v3s: Export MBUS and DRAM clocks to the public header
  ARM: dts: sun8i: v3s: Add mbus node to represent the interconnect
  ARM: dts: sun8i: v3s: Add nodes for MIPI CSI-2 support
  ARM: dts: sun8i: v3s: Add support for the ISP
  ARM: dts: sun8i: a83t: Add MIPI CSI-2 controller node
  ARM: dts: sun8i-a83t: Add BananaPi M3 OV5640 camera overlay
  ARM: dts: sun8i-a83t: Add BananaPi M3 OV8865 camera overlay

 .../media/allwinner,sun6i-a31-csi.yaml        |   6 +
 .../media/allwinner,sun6i-a31-isp.yaml        |   6 +
 arch/arm/boot/dts/allwinner/Makefile          |   2 +
 .../sun8i-a83t-bananapi-m3-camera-ov5640.dtso | 117 +++++++++++++++++
 .../sun8i-a83t-bananapi-m3-camera-ov8865.dtso | 103 +++++++++++++++
 arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi   |  43 +++++++
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi    | 121 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.h          |   4 -
 include/dt-bindings/clock/sun8i-v3s-ccu.h     |   4 +-
 9 files changed, 400 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov5640.dtso
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov8865.dtso

-- 
2.49.0


