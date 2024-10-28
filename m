Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2D6D5B146
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 20:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xvscvLyzb9EdVuIQcMqKB56Tw2g/+EK0X5hQGt22WIE=; b=qFWS9o2BR1zYLPKHQlET4Qxoil
	5zUTozxtulnTyX9f+AAQYFaoeq/hfQUHWCCLYR2KCGMFsijGFAYcbjIlWauxot3W/SzrI63B371P7
	4PH2cTmUU4jINYmDz1Rs06Vd66G37C36Ww7xABGpMe9C6CuvgpqP8ekXzI3xbEhQKymNepIWOzWSO
	uG2eaZmLupPIV7TdAGTk2ye59IU8bMhxMCfLQ1W/dbi+IlmChmEd8bmBDmVD6+K7UiqDPb8L9HH0x
	F/IPCP8CHOufwCfIImb7X68ZuD1g99iEpo78ErK3BnL/XODtusCn6wdsv1BkbcOcMP2ngkT7Q+aSU
	T9pjjc8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5WMo-0000000CAM2-0H4G;
	Mon, 28 Oct 2024 20:29:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5WIr-0000000C9Az-0pKl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 20:25:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 71BB25C53FC;
	Mon, 28 Oct 2024 20:24:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1BC50C4CEC3;
	Mon, 28 Oct 2024 20:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730147127;
	bh=x72DIkdJ+dbrYxpjyuwJKT4rc/qdhrX6DFb2ZupNZNE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=qNIwv2SDbfOGNqFCkUg6YA9kJ1Uf+KFC2pnHYP/Ng0EkE27cjvnOZ3QvTm0n4GwqK
	 7R5HheIaMMgtBZ2aM1EDr3BJzeKM1c0hlHW6rI508yp9olZk7RnTfR9ZZq+tVw5E2g
	 ibHhZS99IgJEPk+8DcNNzImIjdEEhZvuzB3Qb4++gk+QohObS/3lbLynLSn5xgh7fk
	 AqAWQuyxightAklii8UBFuICBzExsKsUR6UftD46jX/okzH29jYao+ben6jqjMzYWx
	 40oJmyU2J3Bb/q/V+BrxUEQSYHT3waVyQzAXe4OkXALaWctpKDWcm6Fx9E2wEl1ZnF
	 u7Lbzo6UAXlgg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE26D5B149;
	Mon, 28 Oct 2024 20:25:26 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Subject: [PATCH v4 00/16] Add support for Synopsis DWMAC IP on NXP
 Automotive SoCs S32G2xx/S32G3xx/S32R45
Date: Mon, 28 Oct 2024 21:24:42 +0100
Message-Id: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAArzH2cC/22NOw6DMBAFr4K2jpE/fFPlHhFCttmAC7DlJYgIc
 fc41ClnpDfvAMLokOCeHRBxc+T8kqC4ZWAnvYzI3JAYJJcFb6Vi70BrRD33pKS1/Thry6qmFWj
 q0ghZQVqGiC+3X9Vnl3hytPr4uU429bNXT3Dxv7cpxtnQFKbUVW1axR+eKF/2kFs/Q3ee5xda7
 KhJuAAAAA==
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
 Keyur Chudgar <keyur@os.amperecomputing.com>, 
 Quan Nguyen <quan@os.amperecomputing.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, 
 Jacob Keller <jacob.e.keller@intel.com>, 
 Serge Semin <fancer.lancer@gmail.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Andrei Botila <andrei.botila@nxp.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730147124; l=4214;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=x72DIkdJ+dbrYxpjyuwJKT4rc/qdhrX6DFb2ZupNZNE=;
 b=Wx80umWnOC6Zz+ZI46LBUU0/We5FtPXNXPhHRi/X8BKuo9N+nFU2vdpH9bvZfMhJYs0nyc5Cr
 5chzLuKcAuWDX9ABrIVFroQgc2qeNV8BxBpQSX6NRDsMFkG6d+ue6uj
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_132529_377962_38B6AD15 
X-CRM114-Status: GOOD (  13.72  )
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
Reply-To: jan.petrous@oss.nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The SoC series S32G2xx and S32G3xx feature one DWMAC instance,
the SoC S32R45 has two instances. The devices can use RGMII/RMII/MII
interface over Pinctrl device or the output can be routed
to the embedded SerDes for SGMII connectivity.

The provided stmmac glue code implements only basic functionality,
interface support is restricted to RGMII only. More, including
SGMII/SerDes support will come later.

This patchset adds stmmac glue driver based on downstream NXP git [0].

[0] https://github.com/nxp-auto-linux/linux

v4:
- fixed empty commit messages for rgmi_clock() helper patches
- fixed yaml path in MAINTAINERS
- switched to platform_driver::remove() as suggested Uwe
- yaml: returned back all compatibility sting values
- added better commit description for rgmii_clock() helper
- Link to v3: https://lore.kernel.org/r/20241013-upstream_s32cc_gmac-v3-0-d84b5a67b930@oss.nxp.com

v3:
- switched to b4 WoW to overcome threading issue with b4
- extracted the hunk with the typo fix from v2 patch#1 to separate patch
  as Jacob suggested
- removed dead code for RMII/MII support, which will be added alter
- used new rgmii_clock() helper in other stmmac:dwmac glue drivers
- yaml: compatible strings compressed to simple one "nxp,s32-dwmac",
  removed duplicated required properties, already defined in snps,dwmac,
  fixed example

v2:
- send to wider audience as first version missed many maintainers
- created rgmi_clk() helper as Russell suggested (see patch#4)
- address Andrew's, Russell's, Serge's and Simon's comments

Message-ID: <AM9PR04MB85066576AD6848E2402DA354E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>

Cc: 

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
Jan Petrous (OSS) (16):
      net: driver: stmmac: Fix CSR divider comment
      net: driver: stmmac: Extend CSR calc support
      net: stmmac: Fix clock rate variables size
      net: phy: Add helper for mapping RGMII link speed to clock rate
      net: dwmac-dwc-qos-eth: Use helper rgmii_clock
      net: dwmac-imx: Use helper rgmii_clock
      net: dwmac-intel-plat: Use helper rgmii_clock
      net: dwmac-rk: Use helper rgmii_clock
      net: dwmac-starfive: Use helper rgmii_clock
      net: macb: Use helper rgmii_clock
      net: xgene_enet: Use helper rgmii_clock
      net: dwmac-sti: Use helper rgmii_clock
      dt-bindings: net: Add DT bindings for DWMAC on NXP S32G/R SoCs
      net: stmmac: dwmac-s32: add basic NXP S32G/S32R glue driver
      MAINTAINERS: Add Jan Petrous as the NXP S32G/R DWMAC driver maintainer
      net: stmmac: dwmac-s32: Read PTP clock rate when ready

 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     |  98 +++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml        |   3 +
 MAINTAINERS                                        |   7 +
 drivers/net/ethernet/apm/xgene/xgene_enet_hw.c     |  16 +-
 drivers/net/ethernet/cadence/macb_main.c           |  14 +-
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile       |   1 +
 drivers/net/ethernet/stmicro/stmmac/common.h       |   2 +
 .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    |  11 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c    |  15 +-
 .../net/ethernet/stmicro/stmmac/dwmac-intel-plat.c |  20 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    |   2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c     |  30 +--
 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c    | 239 +++++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/dwmac-starfive.c   |  19 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c    |  18 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |   6 +-
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  |   2 +-
 include/linux/phy.h                                |  23 ++
 include/linux/stmmac.h                             |  10 +-
 21 files changed, 431 insertions(+), 119 deletions(-)
---
base-commit: 2f87d0916ce0d2925cedbc9e8f5d6291ba2ac7b2
change-id: 20240923-upstream_s32cc_gmac-6891eb75b126

Best regards,
-- 
Jan Petrous (OSS) <jan.petrous@oss.nxp.com>



