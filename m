Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CBDCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 08:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wsbRxHD9xo+7R0EcGZLaztCae868kFf5aK+E5Gk9/qY=; b=rwse71SpakTztWXiwuctNA9ft1
	BxCf9LQGRWwEEn00TjYKabOBUdBqYDAkpvFR4xzJwND72NtzH3Oz0nPAsv32xr0E6yZ67G9yPUEZq
	Zz1MewxBPq8A2UdXvvETsqRQCcLhWC9Jn2KAadPTgac65qqsO4RJ8ryx9quET8BIpL70scah7QFXi
	dVNdLcix8SFAMVY7U1T4csE9kN3wrWik/cncRbrpgRvFjXqFXIX3huSujR1qpoD3pGGmpyyWwYtim
	OBqa9p+j7mn/gn7K3ZG26nkg2DkQqbokS/lI2MG5W0y+hAilYagJCoQ9Ea+53bzi5xJ32YEoqynDG
	PI2XuhZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6t4-0000000D6Wc-1sZ7;
	Wed, 13 Aug 2025 08:31:10 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um52s-0000000Cniu-3qUF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 06:33:12 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 13 Aug
 2025 14:33:01 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 13 Aug 2025 14:33:01 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>
CC: Simon Horman <horms@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Po-Yu
 Chuang <ratbert@faraday-tech.com>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<taoren@meta.com>, <bmc-sw2@aspeedtech.com>
Subject: [net-next v2 0/4] Add AST2600 RGMII delay into ftgmac100
Date: Wed, 13 Aug 2025 14:32:57 +0800
Message-ID: <20250813063301.338851-1-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_233310_964559_B2E0348B 
X-CRM114-Status: GOOD (  12.88  )
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

This patch series adds support for configuring RGMII internal delays for the 
Aspeed AST2600 FTGMAC100 Ethernet MACs. It introduces new compatible strings to 
distinguish between MAC0/1 and MAC2/3, as their delay chains and configuration 
units differ.
The device tree bindings are updated to restrict the allowed phy-mode and delay 
properties for each MAC type. Corresponding changes are made to the device tree 
source files and the FTGMAC100 driver to support the new delay configuration.

Summary of changes:
- dt-bindings: net: ftgmac100: Add conditional schema for AST2600 MAC0/1 and 
  MAC2/3, restrict phy-mode and delay properties, and require SCU phandle.
- ARM: dts: aspeed-g6: Add ethernet aliases, update MAC compatibles, and add 
  SCU phandle for delay configuration.
- ARM: dts: aspeed-ast2600-evb: Add rx/tx-internal-delay-ps properties and 
  update phy-mode for MACs.
- net: ftgmac100: Add driver support for configuring RGMII delay for AST2600 
  MACs via SCU.

This enables precise RGMII timing configuration for AST2600-based platforms, 
improving interoperability with various PHYs.

Jacky Chou (4):
  dt-bindings: net: ftgmac100: Restrict phy-mode and delay properties
    for AST2600
  ARM: dts: aspeed-g6: Add ethernet alise and update MAC compatible
  ARM: dts: aspeed: ast2600evb: Add delay setting for MAC
  net: ftgmac100: Add RGMII delay configuration for AST2600

 .../bindings/net/faraday,ftgmac100.yaml       | 50 ++++++++++-
 .../boot/dts/aspeed/aspeed-ast2600-evb.dts    | 16 +++-
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       | 24 +++++-
 drivers/net/ethernet/faraday/ftgmac100.c      | 86 +++++++++++++++++++
 drivers/net/ethernet/faraday/ftgmac100.h      | 12 +++
 5 files changed, 179 insertions(+), 9 deletions(-)

---
v2:
 - added new compatible strings for MAC0/1 and MAC2/3
 - updated device tree bindings to restrict phy-mode and delay properties
 - refactored driver code to handle rgmii delay configuration
---

-- 
2.43.0


