Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6877FCD13CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 11:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZgTYM7TUnJxppVv/poJEWBus2ihz08ACoFaLOlNWMI8=; b=k66CKe9euyUSzG
	EW+iAbZcbQqGKm5mMc3KOr8i7q64Ma90SvPikY6n2VQm4+l5kQKUVi2fISJTOXdMqtAo/7q1miTss
	NiHUk6ETln8GNZpWQxeF8wy7euOb4TEc8DnmkIsTQ3qEoxREJy/sJ2okJUzvE+0Ur7drq2UO3LNSs
	HhPywAhnQbrMfHDDO7OStmhAhTo0fKnbr9Q5kfz6zTwyl0Om57zaN8Du39lxIarpn79kSPGB72HYW
	dOefOn1eZD5/1mvp/Lem5KQ5Z4W7rVzoXqa9F7LT2d5aDh1uYLfXS9QPuJus3cb9zydE2Tk7kPf1m
	Bcs/p89i49hqbyu4N+eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPmq-00000005Gwr-01VD;
	Mon, 10 Nov 2025 11:10:16 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPmj-00000005Gu8-2BMa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 11:10:15 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 10 Nov
 2025 19:09:56 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 10 Nov 2025 19:09:56 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Subject: [PATCH net-next v4 0/4] Add AST2600 RGMII delay into ftgmac100
Date: Mon, 10 Nov 2025 19:09:24 +0800
Message-ID: <20251110-rgmii_delay_2600-v4-0-5cad32c766f7@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOTHEWkC/32Q0WrDMAxFf6X4eQ6y1NjpnvYfowTXURpvbdLZb
 mgo+fcaF7aHjT2Jy+UcId1F5OA5itfNXQSeffTTmMP2ZSPcYMcjS9/lLBCwVkBKhuPZ+7bjk11
 a1ADSAhwAt40zrEXGLoF7fyvKdzFykiPfktjnZvAxTWEpu2YqfdFm72/tTBIko+1R17o3nXmz8
 cLcJXZD5aZzMc74bYFGEWgiUBVR09RKKvlh3efSumG6/gmrH5iUyWOHWKka9Y7M//T6vDPw1zV
 /LD2P3a/rA4EO8HpPAQAA
X-Change-ID: 20251031-rgmii_delay_2600-a00b0248c7e6
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Po-Yu Chuang <ratbert@faraday-tech.com>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <taoren@meta.com>, Jacky Chou
	<jacky_chou@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762772996; l=3865;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=mSZ7gmoan1EeU4GVjsq0MXdF6q2IRPBWHzVnBREFK+s=;
 b=JVJatIp03PtH1be/zgyXFjCLbEZ6UugDbJ2mlEjc9L64B6RVVc4X2jTenUy6r0JzK1NSYWVcJ
 IOdDKo1zV8jDzZ5RwMbbHMmwydpv/KiWg9M0TEjzQ70L0Y1AMMjfoWl
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_031009_715304_CCF6FCD3 
X-CRM114-Status: GOOD (  15.85  )
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
  MAC2/3.
- ARM: dts: aspeed-g6: Add aspeed,rgmii-delay-ps and aspeed,scu
  properties.
- ARM: dts: aspeed-ast2600-evb: Add rx/tx-internal-delay-ps properties and 
  update phy-mode for MACs.
- net: ftgmac100: Add driver support for configuring RGMII delay for AST2600
  MACs via SCU.

This enables precise RGMII timing configuration for AST2600-based platforms,
improving interoperability with various PHYs

To: Andrew Lunn <andrew+netdev@lunn.ch>
To: David S. Miller <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Po-Yu Chuang <ratbert@faraday-tech.com>
To: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-aspeed@lists.ozlabs.org
Cc: taoren@meta.com

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
Changes in v4:
- Remove the compatible "aspeed,ast2600-mac01" and
  "aspeed,ast2600-mac23"
- Add new property to specify the RGMII delay step for each MACs
- Add default value of rx/tx-internal-delay-ps
- For legacy dts, a warning message reminds users to update phy-mode
- If lack rx/tx-internal-delay-ps, driver will use default value to
  configure the RGMII delay
- Link to v3: https://lore.kernel.org/r/20251103-rgmii_delay_2600-v3-0-e2af2656f7d7@aspeedtech.com

Changes in v3:
- Add new item on compatible property for new compatible strings
- Remove the new compatible and scu handle of MAC from aspeed-g6.dtsi
- Add new compatible and scu handle to MAC node in
  aspeed-ast2600-evb.dts
- Change all phy-mode of MACs to "rgmii-id"
- Keep "aspeed,ast2600-mac" compatible in ftgmac100.c and configure the
  rgmii delay with "aspeed,ast2600-mac01" and "aspeed,ast2600-mac23"
- Link to v2: https://lore.kernel.org/r/20250813063301.338851-1-jacky_chou@aspeedtech.com

Changes in v2:
- added new compatible strings for MAC0/1 and MAC2/3
- updated device tree bindings to restrict phy-mode and delay properties
- refactored driver code to handle rgmii delay configuration
- Link to v1: https://lore.kernel.org/r/20250317025922.1526937-1-jacky_chou@aspeedtech.com

---
Jacky Chou (4):
      dt-bindings: net: ftgmac100: Add delay properties for AST2600
      ARM: dts: aspeed-g6: Add scu and rgmii delay value per step for MAC
      ARM: dts: aspeed: ast2600-evb: Configure RGMII delay for MAC
      net: ftgmac100: Add RGMII delay support for AST2600

 .../devicetree/bindings/net/faraday,ftgmac100.yaml |  35 +++++
 arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts    |  20 ++-
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi            |   8 ++
 drivers/net/ethernet/faraday/ftgmac100.c           | 148 +++++++++++++++++++++
 drivers/net/ethernet/faraday/ftgmac100.h           |  20 +++
 5 files changed, 227 insertions(+), 4 deletions(-)
---
base-commit: a0c3aefb08cd81864b17c23c25b388dba90b9dad
change-id: 20251031-rgmii_delay_2600-a00b0248c7e6

Best regards,
-- 
Jacky Chou <jacky_chou@aspeedtech.com>


