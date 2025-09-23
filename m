Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AC0CAC5B3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 14:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=smp5eJLs7l4goNFLhx84/D2QLB8M9GjD/H6b4yOEgOk=; b=UpsLp0fJskqP5I6Otxs3fbY9+h
	OXdcB44XbsBHE5NQVls/Pr7tJexh9nqlakzIoMuDRvgMsyeK4Aj+QUswBY6mkd23hpgkzpJFlC0sv
	0pbS4I1Q3ncLEgDJT+p6u3bnR5yNXbppmk9ni40D7uMEZVGZFD8kf1nyDjpuqzkQyuS4QMhT8+PBV
	n+xt0oItvWIJWkD7vqQdmsYrVrLzg5aiA8e0b1P9/g64nOEO/eI5TvvhT1RGhk3fvZvOmU9HcaMHw
	6Mzv/19IE5x86V62N148x56MBYFZf0MIbVOPR/DowTuJyIcjNMsgGjP6UoiHOhl3bjk/dlSkkSBPS
	KvR/kDtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v13be-0000000Ddec-3wsA;
	Tue, 23 Sep 2025 14:02:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v13bX-0000000DdaW-1uFr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 14:02:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB35B44D22;
	Tue, 23 Sep 2025 14:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 738F5C116D0;
	Tue, 23 Sep 2025 14:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758636170;
	bh=Bdab41UPVGCNYNXeNsvpKwijaIhSb6VqLy0ymP3WGVo=;
	h=From:To:Cc:Subject:Date:From;
	b=ZSih8M4O23EyUehproFaHkLhOvx3ZozQSLHdN5XkFKixHU7vmzVbtnynwCiTQBZZu
	 Wzdr8L5iUviZG2yqgLdV+qBldayuPioFtn2T4dDGHnjeCnC3HIvyEiLz9B+QxuRuEX
	 hat+0hQYIYzud0uYC6XRE1ML1r2CaES8R6pYT/FrlTWEJcKs46ZsqqZj1MwW0zHkLt
	 5vxvn+rJQsA/LreTtRmGbCRSQ66hRVlmIB1Syju8h1EcIgiIJ7K2x7iK+R7Hqum9B7
	 3P0m3kNwyyNdoIgSzuwFbCcVMPmlO7ZvYB3K35vNMPDtQLESmFPp0ChfSfBP5siJiF
	 u4YzPsfJszNhQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 026905FC52; Tue, 23 Sep 2025 22:02:47 +0800 (CST)
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
Subject: [PATCH net-next v7 0/6] net: stmmac: Add support for Allwinner A523 GMAC200
Date: Tue, 23 Sep 2025 22:02:40 +0800
Message-ID: <20250923140247.2622602-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_070251_536380_E61ADF28 
X-CRM114-Status: GOOD (  18.92  )
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

This is v7 of my Allwinner A523 GMAC200 support series. This is based on
next-20250922.

Changes since v6:
- Collected acks for DT binding patch
- Rebased onto next-20250922

Changes since v5:
- Use plat->phy_interface instead of plat->mac_interface (Russell)
- Link to v5
  https://lore.kernel.org/all/20250911174032.3147192-1-wens@kernel.org/

Changes since v4:
- Moved clock-names list to main schema in DT binding (Rob)
- Dropped 4 patches that are already merged
- Link to v4
  https://lore.kernel.org/all/20250908181059.1785605-1-wens@kernel.org/

Changes since v3:
- driver
  - Fixed printf format specifier warning
- Link to v3
  https://lore.kernel.org/all/20250906041333.642483-1-wens@kernel.org/

Changes since v2:
- DT binding
  - Added "select" to avoid matching against all dwmac entries
- driver
  - Include "ps" unit in "... must be multiple of ..." error message
  - Use FIELD_FIT to check if delay value is in range and FIELD_MAX to get
    the maximum value
  - Reword error message for delay value exceeding maximum
  - Drop MASK_TO_VAL
- Link to v2:
  https://lore.kernel.org/all/20250813145540.2577789-1-wens@kernel.org/

Changes since v1:
- Dropped RFT tag
- Switched to generic (tx|rx)-internal-delay-ps 
- dwmac-sun55i driver bits
  - Changed dev_err() + return to dev_err_probe()
  - Added check of return value from syscon regmap write
  - Changed driver name to match file name
- sram driver bits
  - Fixed check on return value
  - Expanded commit message
- dtsi
  - Fixed typo in tx-queues-config
- cubie a5e
  - Add PHY regulator delay
- Link to v1:
  https://lore.kernel.org/all/20250701165756.258356-1-wens@kernel.org/

This series adds support for the second Ethernet controller found on the
Allwinner A523 SoC family. This controller, dubbed GMAC200, is a DWMAC4
core with an integration layer around it. The integration layer is
similar to older Allwinner generations, but with an extra memory bus
gate and separate power domain.

Patch 1 adds a new compatible string combo to the existing Allwinner
EMAC binding.

Patch 2 adds a new driver for this core and integration combo.

Patch 3 adds a device node and pinmux settings for the GMAC200.

Patches 4, 5, and 6 enable the GMAC200 on three boards. I only tested
the Orangepi 4A and Radxa Cubie A5E.


Please have a look and help test on the Avaota A1. I don't expect
any issues there though, since the PHY is always on, unlike on the
Cubie A5E.

Patches 1 and 2 should go through net-next, and I will take all the
other patches through the sunxi tree. Hopefully we can get this merged
for v6.18.


Thanks
ChenYu

Chen-Yu Tsai (6):
  dt-bindings: net: sun8i-emac: Add A523 GMAC200 compatible
  net: stmmac: Add support for Allwinner A523 GMAC200
  arm64: dts: allwinner: a523: Add GMAC200 ethernet controller
  arm64: dts: allwinner: a527: cubie-a5e: Enable second Ethernet port
  arm64: dts: allwinner: t527: avaota-a1: enable second Ethernet port
  arm64: dts: allwinner: t527: orangepi-4a: Enable Ethernet port

 .../net/allwinner,sun8i-a83t-emac.yaml        |  95 ++++++++++-
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |  55 ++++++
 .../dts/allwinner/sun55i-a527-cubie-a5e.dts   |  28 ++-
 .../dts/allwinner/sun55i-t527-avaota-a1.dts   |  26 ++-
 .../dts/allwinner/sun55i-t527-orangepi-4a.dts |  23 +++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-sun55i.c    | 159 ++++++++++++++++++
 8 files changed, 393 insertions(+), 6 deletions(-)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c

-- 
2.47.3


