Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3338DCD98D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 15:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=etc+LNZJc64cwEBsKWAnUSmOoquwxrXu6tqvDlN7jzM=; b=ILiFg1A3N1R5JpJ3Qdd0aMtU3G
	TQA6qeR1PRYX+siIPbrYOdeqx5czlREC8rafxbGMgkI0ZfzXCXbkeNQbfNxQ4fp/ZgRgsAwtMNpyo
	X5mF33CFuFfwZWk1AMg5dYC7/acIOKJsdySg0+5vFe74lX/k7kTdavTi9FvmKzqfN/PrA5MmfTC8g
	ivF5sxxB/xWiEeIPRMANWVCVcjwo2cRtzD4AW1/jon6ZfpS1/ACTiyMAsrShHF7idmBkTJrcPQSOg
	N5mZqwuDLhc15bwHH+3LFludEZil/WjOd3VEaQ6ETlTA09EhkCgSEdFA9sZ1ghH5sbq8M2IusxAhR
	bpqBNNXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYQGN-0000000CNvF-2gRv;
	Sat, 13 Jun 2026 15:27:11 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYQGL-0000000CNus-0I4w
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 15:27:10 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 9A8893700018
	for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 15:27:03 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 0FCC9B45524; Sat, 13 Jun 2026 15:26:58 +0000 (UTC)
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 8DDFAB4551A;
	Sat, 13 Jun 2026 15:26:56 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v10 0/6] Allwinner A31/A83T MIPI CSI-2 and A31 ISP / Platform Support
Date: Sat, 13 Jun 2026 17:26:49 +0200
Message-ID: <20260613152655.212490-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_082709_308824_C53172BB 
X-CRM114-Status: GOOD (  12.77  )
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

The corresponding drivers and dt bindings were merged a long time ago but this
series was never actually picked up. It seems more than ready to be merged!

Changes since v9:
- Split clock definitions export;
- Added dedicated v3s d-phy compatible;
- Added interrupt to v3s d-phy definition;
- Removed a83t board overlays that need more work.

Changes since v8:
- Added collected review tags;
- Added the overlays to be built as full dtbs.
- Removed trailing whitespace.

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

Paul Kocialkowski (6):
  dt-bindings: sun8i-v3s-ccu: Export MBUS and DRAM clocks to the public
    header
  clk: sunxi-ng: v3s: Remove exported clock definitions
  ARM: dts: sun8i: v3s: Add mbus node to represent the interconnect
  dt-bindings: sun6i-a31-mipi-dphy: Add V3s SoC compatible entry
  ARM: dts: sun8i: v3s: Add nodes for MIPI CSI-2 support
  ARM: dts: sun8i: v3s: Add support for the ISP

 .../phy/allwinner,sun6i-a31-mipi-dphy.yaml    |   3 +
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi    | 123 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.h          |   4 -
 include/dt-bindings/clock/sun8i-v3s-ccu.h     |   4 +-
 4 files changed, 128 insertions(+), 6 deletions(-)

-- 
2.54.0


