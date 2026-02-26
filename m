Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97488FC5913
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 09:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JKlxfFL6JYZArU2O3XruigWwwfTr+RIqdsABJgXCv/w=; b=dnw1SooJVfH0mkPjrAUxTs4J5x
	MrC9mR+P6FhdFcgtRAICfyVQN8qfMEWnpLmnr9LCPJ4ueDVsYy0vnbth6lCzINkvRMDrGsNu3Sqvs
	m/5FYes2INdAkPoXCCzCZfqX2abfLA6CfZtgoVqsEhVd/r4V9dr9MtlHaun/Bxg0NpPtbk2thiEvb
	K364nPiLfqB7NBAUgGdaihATA11dqgStZJBkbvtaMVSX4rKn/16fh2pJpV/lATXCG3rvQdpUv6gm5
	fh+LFrYprC2dmW4C7F8Jbem1BrmBpCYHUHO1Pdf1PAjwzdjCHq4u0nOljv1sUN1PwQyyDqkQqYzrs
	CKhswfTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvX8Y-00000005iMx-02t1;
	Thu, 26 Feb 2026 08:54:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvX8R-00000005iKb-39LF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 08:54:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 062C34361F;
	Thu, 26 Feb 2026 08:54:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CAC68C19422;
	Thu, 26 Feb 2026 08:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772096054;
	bh=MGkjI1HZcHX6Aqy2EL90L2nZD2qE3PqctGLEz7PLx6k=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=LpK1DIiGIZTfM7mE9RMqTS9zJ5u5nSyxkbh39xfrEO69DG8zmL7DHBNkpY9slYOHv
	 9csvQqNfnu6X1TAed2+bhAaTtgCb6TJxP2y5mzgJhSF1UDW/ryG9oBoubEeEic+zI7
	 q2ACH6kL+T4o8vWoR6q4T/PvMnJN6XaxUaCZ8Q2kjWKQ4DQ08VHDacURqfuQn596iw
	 Z3Ta5msYD+mU7h4mIvG35QSkbUvj4ewqAmxUB1iqyLtY4OMVElZBsLFydyJeEmIsvL
	 MWV1un/IjHiY8iPIHh6R76J6LwhqzX4k0i95YH68BxQysXrrVT3F2Re2R7faYDj6qP
	 25VwRXFyFBB6g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADEBEFC5913;
	Thu, 26 Feb 2026 08:54:14 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Subject: [PATCH v7 0/5] Support multi-channel IRQs in stmmac platform
 drivers
Date: Thu, 26 Feb 2026 09:54:05 +0100
Message-Id: <20260226-dwmac_multi_irq-v7-0-f8fe3b945bb4@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC0KoGkC/23O207DMAyA4VeZck2mxDk04Yr3QGhK3ZhFou1oR
 hma+u6kE4ii7PK35M++shynFDN73F3ZFOeU0ziUaB52DI9heI08daUZCDAShOfdZx/w0H+8ndM
 hTe/cd46s0BYQJStbpylSutzE55fSx5TP4/R1OzDLdfpjSV1Zs+SCK2sshFZET83TmPN+uJz2O
 PZs1Wb4FawoRC3AKrQOPCjRiUbWgtoKqhZUERCNImij8/aOoLeCqwVdBAcUlCYkIKgF8yfAvR/
 MKhBa74OhgLoW7FYwtWCLANq0JLtGSoH/hWVZvgEzge5R+gEAAA==
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, rmk+kernel@armlinux.org.uk, 
 vladimir.oltean@nxp.com, boon.khai.ng@altera.com, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772096053; l=4026;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=MGkjI1HZcHX6Aqy2EL90L2nZD2qE3PqctGLEz7PLx6k=;
 b=op1+qBlwqIf+sPHSkfy20RksFc+0ZunpL53mVhj/dInyo9aZ9Ijr7cQ7zuzj9ZFg/oShNRwqc
 2fTdJVb+70uAH4y4NZWy4txMz9KpDTT4dhL1aaw1ikeoyM20FFrcSi9
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_005415_837629_FE4B010D 
X-CRM114-Status: GOOD (  13.42  )
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

The stmmac core supports two interrupt modes, controlled by the
flag STMMAC_FLAG_MULTI_MSI_EN:

- When the flag is set, the driver uses multi-channel IRQ mode (Multi-IRQ).
- Otherwise, a single IRQ line is requested (aka MAC-IRQ):

static int stmmac_request_irq(struct net_device *dev)
{
        /* Request the IRQ lines */
        if (priv->plat->flags & STMMAC_FLAG_MULTI_MSI_EN)
                ret = stmmac_request_irq_multi_msi(dev);
        else
                ret = stmmac_request_irq_single(dev);
}

At present, only PCI drivers (Intel and Loongson) make use of the Multi-IRQ
mode. This concept can be extended to DT-based embedded glue drivers
(dwmac-xxx.c).

This series adds support for reading per-channel IRQs from the DT node and
reuses the existing STMMAC_FLAG_MULTI_MSI_EN flag to enable multi-IRQ
operation in platform drivers.

The final decision if Multi-IRQ gets enabled remains on glue driver
to allow implementing any reguirements/limitions the focused platform
needs.

NXP S32G2/S32G3/S32R SoCs integrate the DWMAC IP with multi-channel
interrupt support. The dwmac-s32.c driver change is provided as an example of
enabling multi-IRQ mode for non-PCI drivers.

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
Changes in v7:
- Optimized 2 similar loops on queue rx/tx irq reading
- Swap the yaml and dts patches with hope it fix dt_binding_check failing
- Link to v6: https://lore.kernel.org/r/20260225-dwmac_multi_irq-v6-0-245bf1d7110c@oss.nxp.com

Changes in v6:
- Added 2 mintainers which were not covered by 'b4 prep --auto-to-cc'
  but complained on patchwork check
- Added helper macro for loop over queue-based arrays (inspired by AI
  review)
- Added full validation on all channel IRQs
- Link to v5: https://lore.kernel.org/r/20260223-dwmac_multi_irq-v5-0-8fc699a5fac4@oss.nxp.com

Changes in v5:
- fixed typo in "symetrical"
- cleaned negative return value on platform_get_irq_byname_optional()
  in stmmac_get_platform_resources()
- rebased on v7.0-rc1
- Link to v4: https://lore.kernel.org/r/20260128-dwmac_multi_irq-v4-0-82fa34fcf2f2@oss.nxp.com

Changes in v4:
- Fixed IRQ reading check
- Made cleaner the IRQ validity (to get AI reviewer happy)
- Fixed minItems of interrupts property in yaml
- Link to v3: https://lore.kernel.org/r/20260123-dwmac_multi_irq-v3-0-cc53f2be8961@oss.nxp.com

Changes in v3:
- removed RFC prefix
- rebased on v6.19-rc6
- fixed forgotten extra line setting to Multi-IRQ unconditionally
- fixed yaml
- Link to v2: https://lore.kernel.org/r/20260121-dwmac_multi_irq-v2-0-3b829230d071@oss.nxp.com

Changes in v2:
- Fixed incorrect buffer len for 'rx-queue-%d' property check
- Added backward compatibility to not break old settings
- Fixed DT example in yaml
- Link to v1: https://lore.kernel.org/r/20251214-dwmac_multi_irq-v1-0-36562ab0e9f7@oss.nxp.com

---
Jan Petrous (OSS) (5):
      net: stmmac: Use helper macro for loop over queue-based arrays
      net: stmmac: platform: read channels irq
      arm64: dts: s32: set Ethernet channel irqs
      dt-bindings: net: nxp,s32-dwmac: Declare per-queue interrupts
      stmmac: s32: enable support for Multi-IRQ mode

 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 44 ++++++++++++++++++---
 arch/arm64/boot/dts/freescale/s32g2.dtsi           | 26 ++++++++++--
 arch/arm64/boot/dts/freescale/s32g3.dtsi           | 26 ++++++++++--
 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c    | 36 ++++++++++++++++-
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  3 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 16 ++++----
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 46 +++++++++++++++++++++-
 8 files changed, 177 insertions(+), 22 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20251209-dwmac_multi_irq-9d8f60462cc1

Best regards,
-- 
Jan Petrous (OSS) <jan.petrous@oss.nxp.com>



