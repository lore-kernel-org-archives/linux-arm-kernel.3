Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A366C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 20:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=osg0LXFgWi27SktKXIbKQvK4ZjXILHipq3I0zgDfkYM=; b=y+hJiWmLH7gSHx3MSsq4JHV6lp
	xvmc36aBlEEAoopR4qmi8xs/rtiq1XAcYPGV99lLdYG8x77UY2K6SRdfp84FVUgmjgfrmZv5K/X9g
	zbVdPWouVbruW8ZymIN/EEjTJPnq765Ft271Z1HnquEzS+0HFQ3r971aspA6EnT1Ur9QS21OcHwLN
	1uMP1a6aWtmZ6iZVYtlYx1WHZxUZvfGq7ohqiJoVwV6vtPwL4mSla5GFMeEhcl/AvD48rPk8pw8QF
	XQd0rFwXGgtSRZYLnlDZRiliODZyPZjkgTUeHA6RfDcTIYf3kAKs1w+U322ZxW6/+mt45aFt0MYgY
	kcbtXotw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWhhw-00000006aoK-3bLw;
	Tue, 01 Jul 2025 20:36:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWeJ7-000000068ZO-0Xah
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 16:58:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 48135A53301;
	Tue,  1 Jul 2025 16:58:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4479C4CEF3;
	Tue,  1 Jul 2025 16:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751389087;
	bh=7tKU8mbeBFPiVXyw6Vc2kkpcWX8Ozxa1iNVQlgBGIy4=;
	h=From:To:Cc:Subject:Date:From;
	b=fyzMTYrMKeOY/Rxhzjg2PDRq6aztluP+y0Ql8VFL/+j1tiT0ctqzCRo0kXDDxoQ5K
	 RsbbHb8yL4beSJwz8soyMOOH96pEJS9s0sWMudZfl3R+I8HvW6/szuI9WrjJf4DSyr
	 NdN6umVIGzokkIjlCuSTz69IXSJfWiYYvU+57pTBduYxfHuqcmrNQ3W5mHBjW+M5iN
	 Wj6aKkhl0CZotUj9xKw+dqzaHgkrI2wa4wczL1ThsHjKBkGRBd9moCqLs6Mt+SAfPn
	 0wufODKQphu+2Rox+7jByDp8ObFJrXo22eKAS7W27MFSJw46y2cdp1ousLYcFcMPeP
	 tp/+lVv6+Ko+w==
Received: by wens.tw (Postfix, from userid 1000)
	id A92CF5FDF8; Wed,  2 Jul 2025 00:58:05 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH RFT net-next 0/10] net: stmmac: Add support for Allwinner A523 GMAC200
Date: Wed,  2 Jul 2025 00:57:46 +0800
Message-Id: <20250701165756.258356-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_095809_297134_3ED45FFF 
X-CRM114-Status: GOOD (  18.97  )
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

From: Chen-Yu Tsai <wens@csie.org>

Hi everyone,

This series adds support for the second Ethernet controller found on the
Allwinner A523 SoC family. This controller, dubbed GMAC200, is a DWMAC4
core with an integration layer around it. The integration layer is
similar to older Allwinner generations, but with an extra memory bus
gate and separate power domain.

The series stacks on top of three other series inflight:

  - Orangepi 4A series
    https://lore.kernel.org/all/20250628161608.3072968-1-wens@kernel.org/
  - A523 power controller support series
    https://lore.kernel.org/all/20250627152918.2606728-1-wens@kernel.org/
  - Rename emac0 to gmac0 for A523 series
    https://lore.kernel.org/all/20250628054438.2864220-1-wens@kernel.org/

Patch 1 adds a new compatible string combo to the existing Allwinner
EMAC binding.

Patch 2 adds a new driver for this core and integration combo.

Patch 3 extends the sunxi SRAM driver to allow access to the clock delay
controls for the second Ethernet controller.

Patch 4 registers the special regmap for the clock delay controls as a
syscon. This allows the new network driver to use the syscon interface,
instead of the following dance which the existing dwmac-sun8i driver
does:

    of_parse_phandle();
    of_find_device_by_node();
    dev_get_regmap();

With this change in place we can also drop the above from the
dwmac-sun8i driver.

Patch 5 adds a device node and pinmux settings for the GMAC200.

Patches 6 and 8 add missing Ethernet PHY reset settings for the
already enabled controller.

Patches 7, 9, and 10 enable the GMAC200 on three boards. I only
have the Orangepi 4A, so I am asking for people to help test the
two other boards. The RX/TX clock delay settings were taken from
their respective BSPs, though those numbers don't always work, as
is was the case for the Orangepi 4A.


Please have a look and help test.

Patches 1 and 2 should go through net-next, and I will take all the
other patches through the sunxi tree.


Thanks
ChenYu


Chen-Yu Tsai (10):
  dt-bindings: net: sun8i-emac: Add A523 GMAC200 compatible
  net: stmmac: Add support for Allwinner A523 GMAC200
  soc: sunxi: sram: add entry for a523
  soc: sunxi: sram: register regmap as syscon
  arm64: dts: allwinner: a523: Add GMAC200 ethernet controller
  arm64: dts: allwinner: a527: cubie-a5e: Add ethernet PHY reset setting
  arm64: dts: allwinner: a527: cubie-a5e: Enable second Ethernet port
  arm64: dts: allwinner: t527: avaota-a1: Add ethernet PHY reset setting
  arm64: dts: allwinner: t527: avaota-a1: enable second Ethernet port
  arm64: dts: allwinner: t527: orangepi-4a: Enable Ethernet port

 .../net/allwinner,sun8i-a83t-emac.yaml        |  68 +++++++-
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |  55 ++++++
 .../dts/allwinner/sun55i-a527-cubie-a5e.dts   |  29 +++-
 .../dts/allwinner/sun55i-t527-avaota-a1.dts   |  29 +++-
 .../dts/allwinner/sun55i-t527-orangepi-4a.dts |  23 +++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-sun55i.c    | 161 ++++++++++++++++++
 drivers/soc/sunxi/sunxi_sram.c                |  14 ++
 9 files changed, 386 insertions(+), 6 deletions(-)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c

-- 
2.39.5


