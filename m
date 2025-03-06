Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF906C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 22:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ywH7Q8mbcPn4w2SCHmS2eCxM0WaPqI6rsN6MI+52pMk=; b=jL/uHcWrO+bMHPzcjtq3S4bs7d
	sZnAebgtJJDOxURYhRLy80JgRtOPcXD/pggmXQkvzt4jlxI7/mocttOG2RUBI6nx91xuV/LOy+mEX
	falp/P/KqtG4p4nrByMVySbe2jretYt2S2HUQUiubRDnG9VEBdu+nDRnqVgqgTZ4Mo2oAgXp4kAxZ
	cfZOOsPjqX6x8vDiiWLxqqw43QznqBb4q3RgrCtmOQhfm5OR4D1bXBA+LUJjk1mvgPUEPSh6HDrTs
	h13ZYsAbIkdCQYWl9tCW8Ucp4Bc4uVMTOTD4csD+51+uIeAYh8eLwwX1FQvvC1vFyt7OeHWC1CXLs
	bXk09yEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqJVX-0000000CLTf-3M3F;
	Thu, 06 Mar 2025 22:15:59 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqJTu-0000000CL4B-3ok6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 22:14:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1741299255;
 bh=ywH7Q8mbcPn4w2SCHmS2eCxM0WaPqI6rsN6MI+52pMk=;
 b=sk4wCYyxWGIpWrbDnSXjKFrAlRI4pENuYgkz19+1ASEl7rUl2OMMCHQwsf/4RjMZfG1b7Yi/M
 lS0/iGbbJX5d92rFubFepg49ANm8u54ufFehOgy+pEg2Ly9sFtp0qBYrgoZToVeB+6AdomVZvhd
 0keqJyGJQRaGBSHIfe0WzUh0U+T0yzuPBjNQdyaarC2wyT1ElRfpELINgMLQrbOdGwOI7z76RoG
 YOsOaYeqFJOO9ustOeT8UZ5ZxpP0P3rH+fbusOQ/Emany/YokZVNx1BS2K2aPP0uwFjF6ISpo1H
 rD+h2PKZSTedwHbHqR2WtuNdy8ZJGGnTr961lJS7V1mw==
X-Forward-Email-ID: 67ca1e30c1763851c065bfe9
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
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
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	linux-rockchip@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 0/4] rockchip: Enable Ethernet controller on Radxa E20C
Date: Thu,  6 Mar 2025 22:13:53 +0000
Message-ID: <20250306221402.1704196-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_141418_978835_B0D9C85D 
X-CRM114-Status: GOOD (  10.50  )
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
RK3528 and enable the LAN interface on Radxa E20C.

This only add a bare minimum gmac0 node for the 100/10 MAC and skip e.g.
parts to power on and off the integrated PHY in GMAC driver becayse I do
not have any RK3528 device that make use of gmac0.

This series depends on the "net: stmmac: dwmac-rk: Validate rockchip,grf
and php-grf during probe" cleanup series to ensure bsp_priv->grf can be
used. And possible also on the leds+buttons, sdio+sdmmc and sdhci series
for RK3528 for a clean apply.

David Wu (1):
  ethernet: stmmac: dwmac-rk: Add GMAC support for RK3528

Jonas Karlman (3):
  dt-bindings: net: rockchip-dwmac: Add compatible string for RK3528
  arm64: dts: rockchip: Add GMAC nodes for RK3528
  arm64: dts: rockchip: Enable Ethernet controller on Radxa E20C

 .../bindings/net/rockchip-dwmac.yaml          |   4 +-
 .../boot/dts/rockchip/rk3528-radxa-e20c.dts   |  30 ++++
 arch/arm64/boot/dts/rockchip/rk3528.dtsi      |  92 ++++++++++++
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 132 ++++++++++++++++++
 4 files changed, 257 insertions(+), 1 deletion(-)

-- 
2.48.1


