Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD94D35694
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 08:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WbrBlS/6HjRhUU2WUq83PJmOpvE0k3lfR8w6oVL1W6s=; b=upke0nLYgOk79i+UfeWFoqaRqc
	TJlxY9idkCJh4p5pSf2o+fS/y1rJ7FDmUHJGpE1cZcXTl9EuqMcHINlDxFEWgFvuejiZ4TicJhi3h
	EGjdVltUd8uKtzlSf3In3UQw2T90aC0pj0ARYBYJ5Oq7MK00vPBRJf95SO8BZS7n3ZPfQxkl1wFc8
	avHcwDXaV+IsWZgflsFCAYfq+u9dh1vDG6+Zh5LfG/3C/O18xdun6lX8bgnF8P9/J1/72CPNkOQtj
	QaA5iiF56SUwlZukkW4cHNet5nbC4bIc79Ph+Vp+ulAYRNH9edXfVPSdjICo9n2Xc+ynA6tYrNUK9
	mqMDWE+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1FQ-0000000FgoY-2PtJ;
	Wed, 28 Jan 2026 08:50:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1FO-0000000Fgn4-2nq0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 08:49:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A15E060097;
	Wed, 28 Jan 2026 08:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D44FC4CEF1;
	Wed, 28 Jan 2026 08:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769590197;
	bh=IAtIePMXc1hmU13gkaxKX/Izf4Y00HbYO1dEaABAnWI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ULIebGONiZVML58ySSdC0FIGCNabdR3u1YoyPBZxz/wnRBRTi9NSCa0/G4ThZNVAG
	 RRPWRT7jIArtJAU/yhppvhY0TnBWTNqixc7ai6qQaccXGtWF+f0IkBh3Zxxg/sW/YL
	 Eerx3KxsFad8O2x981WiVcbqNEkk/GPR0+rRm+GIvFnBseMSoYKKYkdGIY7DmZFpcY
	 sjGT64Jjn6U/Uxw/9ZFQNeLmw8Cqs4UDBx/qDHURFOsNpbbkkgKrR4T7xWIVTjpWzC
	 dOsMpKvB2r6qDyDrJjZ7Z3ZpbuKWMlNIb0y5yNDfMdqlaK56uz6qmJOeY6IDlVZwbw
	 fwSeFBr2ik3Uw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C008D35694;
	Wed, 28 Jan 2026 08:49:57 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Subject: [PATCH v4 0/4] Support multi-channel IRQs in stmmac platform
 drivers
Date: Wed, 28 Jan 2026 09:49:51 +0100
Message-Id: <20260128-dwmac_multi_irq-v4-0-82fa34fcf2f2@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK/NeWkC/2XN3w6CIBTH8VdxXIeDg6J01Xu05hQh2fJPYGRzv
 nvoamt5+f1t53Nm5JQ1yqFjNCOrvHGm70IkhwjJpuyuCps6NAICKQUicP1sS1m0j9toCmPvWNS
 55iThICVF4WqwSptpE8+X0I1xY29f2wNP1/Vj0WRneYoJZjzlUFZECZ2deufibhpi2bdo1Tx8B
 U4CsRdgFaocBDBSk4zuBfYrsL3AgiBlyjRUKhf8T1iW5Q1olangNAEAAA==
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
 Conor Dooley <conor+dt@kernel.org>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769590195; l=2886;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=IAtIePMXc1hmU13gkaxKX/Izf4Y00HbYO1dEaABAnWI=;
 b=SHOlXnzIZIVdjrIlXnziKXdC27jDr7jo8BXdloQM7k+ZRboMdkalAGJUTS6PJAusVqeu86fTZ
 u5IcrlFevUxBk6eROYlQ0oxQB6zsoBkLnJgrihq9TUA8KVzD1RhIV0A
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
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
Jan Petrous (OSS) (4):
      net: stmmac: platform: read channels irq
      dt-bindings: net: nxp,s32-dwmac: Declare per-queue interrupts
      arm64: dts: s32: set Ethernet channel irqs
      stmmac: s32: enable support for Multi-IRQ mode

 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 44 +++++++++++++++++++---
 arch/arm64/boot/dts/freescale/s32g2.dtsi           | 26 +++++++++++--
 arch/arm64/boot/dts/freescale/s32g3.dtsi           | 26 +++++++++++--
 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c    | 12 +++++-
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 38 ++++++++++++++++++-
 5 files changed, 133 insertions(+), 13 deletions(-)
---
base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
change-id: 20251209-dwmac_multi_irq-9d8f60462cc1

Best regards,
-- 
Jan Petrous (OSS) <jan.petrous@oss.nxp.com>



