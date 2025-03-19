Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83BFC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 22:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hs6Pwio3uOKO/Rs8ESj0aY1nLaXKMEYE6oUslcHF8n0=; b=aaHI8XiRZyq/jAPKLXGXtck8Ha
	VnZsMAPYllB/uEShez57t4Dcn5Z6KHFlLjjMefhGta9LVUl2V1yOdpB7WZu5rSluZCL55tBwPs2VL
	i/g2V7Nppl5ESgMZUSAgkVnAypoJ7jyYK/U5yVpKHb5ICSezKxBZR3Fx8UWeW6kiBZtx0PWHZeURb
	eOuGX2xdHHw0t2NqqqkRCcXl6aAsdhi8GohhC6om8pkaAq4X4GDgC9PtzhUE6kNgBy958lE0poSkI
	37F1aLnE2Yg3dqCesyKNFG5AAACEe8Bhvsud0PmmyZeUZ61Pqb7OGGnawY0f6AL9ijr3QcZj1eJxB
	gTie8g8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv2Dr-0000000AKBt-0LDB;
	Wed, 19 Mar 2025 22:49:15 +0000
Received: from smtp.forwardemail.net ([121.127.44.59])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv1DF-0000000ABHo-44Ei
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 21:44:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1742420671;
 bh=hs6Pwio3uOKO/Rs8ESj0aY1nLaXKMEYE6oUslcHF8n0=;
 b=rqnr7qOLj+1YdjBV3BOsk6v82Yzjo4jiZxMVoUuzkP6gYiz2q+p3s2qMc2PwPLhL4PpGuMQjH
 zN9D+mwww408MzeiCv9zQ8DjmUIvJr73BHHq/U0JDAL5gTZrVMEEH07eOfw4DTSi1axUScj9v7L
 EjDtshvR9l6W1GDfU20csGBECdu6L0r5mLHD1dWeOzvC9G9+ZVj6fZao7pmpMe7r1eA/cVFvE9s
 Br1mqOGDyix9sUI0D6DYcYj3t9seUHVe9fU7a+zbi6ujcZZItYnOyQzO1wBhNIN9PqGRwUpYGPX
 ti7RvvCUreXvDk6UmdKwYRP4pEpylFfvc5VRmXsqzqow==
X-Forward-Email-ID: 67db3ab6cf4d592372b993d9
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.59
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Wu <david.wu@rock-chips.com>,
	Yao Zi <ziyao@disroot.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH net-next v3 0/5] net: stmmac: dwmac-rk: Add GMAC support for RK3528
Date: Wed, 19 Mar 2025 21:44:04 +0000
Message-ID: <20250319214415.3086027-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_144434_407586_23EF3F19 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
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

The Rockchip RK3528 has two Ethernet controllers, one 100/10 MAC to be
used with the integrated PHY and a second 1000/100/10 MAC to be used
with an external Ethernet PHY.

This series add initial support for the Ethernet controllers found in
RK3528 and initial support to power up/down the integrated PHY.

Changes in v3:
- Rebase on latest net-next/main
- Collect r-b tag on dt-bindings patch
Link to v2: https://lore.kernel.org/r/20250309232622.1498084-1-jonas@kwiboo.se

Changes in v2:
- Restrict the minItems: 4 change to rockchip,rk3528-gmac
- Add initial support to power up/down the integrated PHY in RK3528
- Split device tree changes into a separate series
Link to v1: https://lore.kernel.org/r/20250306221402.1704196-1-jonas@kwiboo.se

David Wu (1):
  net: stmmac: dwmac-rk: Add GMAC support for RK3528

Jonas Karlman (4):
  dt-bindings: net: rockchip-dwmac: Add compatible string for RK3528
  net: stmmac: dwmac-rk: Move integrated_phy_powerup/down functions
  net: stmmac: dwmac-rk: Add integrated_phy_powerdown operation
  net: stmmac: dwmac-rk: Add initial support for RK3528 integrated PHY

 .../bindings/net/rockchip-dwmac.yaml          |  16 +-
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 277 ++++++++++++++----
 2 files changed, 242 insertions(+), 51 deletions(-)

-- 
2.49.0


