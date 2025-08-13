Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA787CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 15:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nWQztojHSUKmxOM0A1xBva0HMuzQs6VFCBe2/UxgM9g=; b=tEbDypROhNvneqTnSNUdQ2vvfy
	JdMDyxMtsOgdttYH73o1exMRcMFv024BL0d4R9tNkwnleUxwZB5hwLz6ztiAsC9z/48PXN0ADr6ps
	puAc/5ZX5NLhOe8QYJqekvfF2OP2JJof5+KSjj5QJQd4mGurSGic86C+lqCt/acewHRgUmGgV9thN
	IqLSztt23N6X2zXOUKrpqk8IKvAM8FEXxc34VPvuD3qcXtKw41t3Di/dEUNVlGzgcKBckroMOzkFb
	O9cmx48C5RpH5zLBOh/01pA5JlFLw5OksFn++q+zh/MVNfpaO1ekTO0kqjVC77cbxsIZg/A5TZg6K
	AMFfY+OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDGq-0000000EAGd-2BO8;
	Wed, 13 Aug 2025 15:20:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCtQ-0000000E4qr-0PqD
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 Aug 2025 14:55:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=nWQztojHSUKmxOM0A1xBva0HMuzQs6VFCBe2/UxgM9g=; b=WyudDcWJ/3kbxdDSUVvfyoQkP5
	RF4at6ReVGuSTWLSiEYadbIGwxaZVRT05wLqLIupPvFILEL9Lm/3F4Tk0Bs1wWM1WcwcKY4z+am6y
	27kkD3je+GND4PqFCbLI8B++P70qYdDfPskMq+tiqtuMvFTjTQxRvo3JuAAs7qKH05qiDX8kfP0EF
	hQXNVCeNYF94dkarjIM2pt/K9sYfGzUAx6dp4lKxs+KfAhpGihCMifZly8IFlXaGM1REH1++FHaVA
	OUlhvFZ2xIGkYD0HfpWh6M0DecO/Z9t5UNtTTc2jWfdVtl8pYal3NWl6dvV+AIWVpN31AVv2nLm//
	9P4MgfdA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCtL-0000000G72P-0SiX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 14:55:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 01EE55C6674;
	Wed, 13 Aug 2025 14:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C07AC4CEEB;
	Wed, 13 Aug 2025 14:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755096947;
	bh=hAT2AG68xUXY62jigIBmqfIHprMnHyI6CONCwZEzwKg=;
	h=From:To:Cc:Subject:Date:From;
	b=sWcYaESI32ZDvmKSZZqpBdJXEm1N/4q1jWlZM6Us2DNn650qgvvSek/K+TOCwlGq4
	 1jsRHPADBIAU1V0oQp1N4tDyk9WLRgT1NpNMfu700E95gcDi76yqqhla6w3/HVsaja
	 Tsq+ImgpjUvwXfBllUtZEMvPgY2v8VPAH6U9rZ52yNTeuyV11TlvJ9DqF/riJwj3hf
	 Mlub68yUsknGXQ3Wy7xX83V1YcyLcxVCozM+YuHZ8J9fjoc9gAIo4zSOuFKAoyDcML
	 bMHt3fsp3nuvo15WvOokvVN1j+dYBnQ+KqFjvFn56ibCZJ+LsMrMVp283RE6bT0KjM
	 IUckiLGlLjZHQ==
Received: by wens.tw (Postfix, from userid 1000)
	id E0B705FBFA; Wed, 13 Aug 2025 22:55:44 +0800 (CST)
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
Subject: [PATCH net-next v2 00/10] net: stmmac: Add support for Allwinner A523 GMAC200
Date: Wed, 13 Aug 2025 22:55:30 +0800
Message-Id: <20250813145540.2577789-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_155551_524912_761D2CEA 
X-CRM114-Status: GOOD (  21.54  )
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

This is v2 of my Allwinner A523 GMAC200 support series.

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


Please have a look and help test on the Avaota A1. I don't expect
any issues there though, since the PHY is always on, unlike on the
Cubie A5E.

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

 .../net/allwinner,sun8i-a83t-emac.yaml        |  81 ++++++++-
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |  55 ++++++
 .../dts/allwinner/sun55i-a527-cubie-a5e.dts   |  31 +++-
 .../dts/allwinner/sun55i-t527-avaota-a1.dts   |  29 +++-
 .../dts/allwinner/sun55i-t527-orangepi-4a.dts |  23 +++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-sun55i.c    | 161 ++++++++++++++++++
 drivers/soc/sunxi/sunxi_sram.c                |  14 ++
 9 files changed, 401 insertions(+), 6 deletions(-)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c

-- 
2.39.5


