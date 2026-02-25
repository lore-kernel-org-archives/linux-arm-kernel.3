Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E8B5EFD214
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 09:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WQoowdGejCscq/3zCJH8shVzK1lrq2KEmuug5msiOWA=; b=vmug5vpL5ERdPlAQgDot73HH05
	3T9weeHRKVcmmfKRH+crqpyxsZgXYpTjyIngcSKSmgv6Ngn6+zh40sMMvkXr3KheXpzG8v8QbRfpR
	PnbHruibHvyDO90HkiZnVfpSiB+5GsbO5wspt+5h6XWP2t7Ngcspq+C/f1E9dKgzqugwLdqWJXJQZ
	v35zeM3x/ezRJjIXioxwVnpc+GNDCa2+2Sg9yF5yKr6ek2M2wyDY3+DEnFflh+nXxxRmg+mxypMKe
	VRV0uzhTUlE92fZtMJiNwc3DlHo7AdqxAw4iPMj0UHsDTPZ40jI3c5vk3BL0wk0BA8o+ucnHx0bZD
	kcDuJ4Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvB4k-00000003edh-1J2X;
	Wed, 25 Feb 2026 09:20:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvB4j-00000003ecw-1Tew
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 09:20:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 64BC460053;
	Wed, 25 Feb 2026 09:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06036C116D0;
	Wed, 25 Feb 2026 09:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772011256;
	bh=ygW1JUG+DY0FbEbzpCV2+u07eQRFHOpA1iuyHGm3R9M=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uo0bnKmEASlXPgX0KQ1RVJV7IKTLyWlXtlP4ioQmL8WnJ2KSTfjGvXSWbWsLxhuRn
	 2v+gJWjlPNZ0p+FbkXOCAPBcylmqoO5he/78VvPcN3Pd9urBi6uQbXx4qp6XQJUnOK
	 vPnBx4+JvwvJ/YRMqNZ2EDW57YCzOIVBUPylIEjV2AoSvC121WH6Y+4SNXIhvKM6L/
	 8BE3xOJI7cEbupJEE/vfpCdMHUytC/KTr+36k8b2z3XDuakJPzMHJReb8CBAeBpzMp
	 QzxIyIlE0if9KWXsVbay2n4HxrCbdckgdHoa7KbfzN661oupT0xvvhrVYwYwHBvcBh
	 MCFSHf2B6q1Lg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E521BEFD214;
	Wed, 25 Feb 2026 09:20:55 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Subject: [PATCH v6 0/5] Support multi-channel IRQs in stmmac platform
 drivers
Date: Wed, 25 Feb 2026 10:20:32 +0100
Message-Id: <20260225-dwmac_multi_irq-v6-0-245bf1d7110c@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOC+nmkC/23O207DMAyA4VeZck2mxDks4Yr3QGhK3ZhFou1IR
 hma+u6kE4ih7PK35M++sBJzioU9bi4sxzmVNI017MOG4SGMr5GnvjYDAUaC8Lz/HALuh4+3U9q
 n/M5978gKbQFRsrp1zJHS+So+v9Q+pHKa8tf1wCzX6Y8ldWPNkguurLEQOhE97Z6mUrbj+bjFa
 WCrNsOvYEUlWgFWoXPgQYle7GQrqFtBtYKqAqJRBF103t4R9K3gWkFXwQEFpQkJCFrB/Alw7we
 zCoTW+2AooP4vLMvyDUrAVbu4AQAA
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
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772011254; l=3675;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=ygW1JUG+DY0FbEbzpCV2+u07eQRFHOpA1iuyHGm3R9M=;
 b=qUFzMRPCW3TJ3gdsf3Jwg1QU9LBUBlKR8JU5+IjuC98NEaWcDn3Q4dwUFQG3PfttyM/rfE6t9
 ziYbax/5YNgD+9DMojuTiL67P6We2ZkMDqOOs9pdMTU58l8+j8AitFZ
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
Changes in v6:
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
      dt-bindings: net: nxp,s32-dwmac: Declare per-queue interrupts
      arm64: dts: s32: set Ethernet channel irqs
      stmmac: s32: enable support for Multi-IRQ mode

 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 44 +++++++++++++++++++---
 arch/arm64/boot/dts/freescale/s32g2.dtsi           | 26 +++++++++++--
 arch/arm64/boot/dts/freescale/s32g3.dtsi           | 26 +++++++++++--
 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c    | 36 +++++++++++++++++-
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  3 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 16 ++++----
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 40 +++++++++++++++++++-
 8 files changed, 171 insertions(+), 22 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20251209-dwmac_multi_irq-9d8f60462cc1

Best regards,
-- 
Jan Petrous (OSS) <jan.petrous@oss.nxp.com>



