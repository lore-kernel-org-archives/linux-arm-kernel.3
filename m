Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432F4C3ABC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 16:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SunV0PKv2egMPXdWAiQfx494OxlmHanLBXhoC0JktRU=; b=vZc99RLz8rVo1WK/dE9Jqhn+7b
	xkUbIJ7KxMmDRBUS7dLZLoFBEVZb7Y73j+eH/tSD1PdRXZxqc8TFl3CHuHoZT51Jn/vtWTn5O+Pbq
	5K1IGciua+12A3+15S4JmMon7s+8RsyZLnEV/LelfAjp7Bc4/YV/wcvTaorUHvBWYFwVzH5S2cjHY
	An7fuS6Ne1CbJNg954pHQllAJWPGwTotmPnUXu4d6Z5q6ty8315GCS6Ai7F3+qlLslTPWB4XvuRzQ
	iiY8dG6A77IM9YGqaSrgtiM+2Mevp7y81+HnKhBcejPYscJkIuWcwgGjYaCYfDt9ZyFr82/mQ5E+D
	VUKrLO1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3tg-00000001Fmi-1Icy;
	Thu, 08 May 2025 16:14:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2tK-000000014gU-2mPN;
	Thu, 08 May 2025 15:10:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=SunV0PKv2egMPXdWAiQfx494OxlmHanLBXhoC0JktRU=; b=juovbd1KG3RStQg14lQxzLsMkw
	snx1k2B10mvpU1IrQ7qA7g386n0h4DAybMDytlCPbD5jSm9mnVhDwNe/T2rvoWJcYc3KljVM3jo2X
	HzF1Zo6sgbTIKoWJca7QR9CsdKz43SCkkijExwZ6/f339zdDOHX4ua/aQGB9E6yc6iiVcsMLBBlME
	Yviie2IW7yHYyC0g0ZHXmv0kHx7N4IeuwrqdbzIUJjwg35ays/PWcF/5gNOr+bdqV9QfoZdqIF5Gy
	7qxpPahCepreOeTgpou4ZXeuGTj69o0t1DLfawfS4dEBi4HnBOSjv0RbHoOSrJmVDdtulNg5kfBjN
	JtlsQOPQ==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uD2tH-0000000G6Ja-2V2n;
	Thu, 08 May 2025 15:10:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=SunV0PKv2egMPXdWAiQfx494OxlmHanLBXhoC0JktRU=; b=1KMq4Bi5bftuc+BGpDNmwHwl3h
	uySIJ4m8TTZaopZp9xGKOVxLkwUPu8qU/VL12xkfuIHVVEq2euuuU6wWNGXR5BlQFTRX//JAZwBGN
	EqQUSzYOnW20daFQsUJ30sm5EwNGoqSmOl4g6w4UvWNe/awT4+s79rBy8PRja1Jv8Gk2nCvG9+RlO
	cDTbMcC9sJcgBHLpsNbAzL9oBSW8v5btAJCpwg1wxWFt2F7hAKb5RNgRmjER01JZPnJFEGbWEadR+
	vYfHq+AYmEr1KwgsDuFAHoD8LSZo8xDW9aYIEIK8NWPoBegxpbkc1wr1D4bIT8p/0qsMsGtiutoB+
	i3WqJrPA==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uD2tD-0005fP-TX; Thu, 08 May 2025 17:10:23 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] Add two board-families from Theobroma-Systems
Date: Thu,  8 May 2025 17:09:49 +0200
Message-ID: <20250508150955.1897702-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_161027_778675_DDDEFE66 
X-CRM114-Status: GOOD (  12.60  )
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

Both the Cobra and PP1516 boards are based around the PX30 SoC and can be
found with a variety of display options.

As new boards should not use the deprecated snps,reset-* properties
in the gmac node, I also added a core mdio-node for the gmac and
converted the Theobroma Ringneck board over.

Testing with the new node both before and after converting Ringneck
showed the board finding its network both when booting locally and
from the tftp/nfs.


Heiko Stuebner (6):
  arm64: dts: rockchip: add basic mdio node to px30
  arm64: dts: rockchip: move reset to dedicated eth-phy node on ringneck
  dt-bindings: arm: rockchip: add PX30-Cobra boards from Theobroma
    Systems
  arm64: dts: rockchip: add px30-cobra base dtsi and board variants
  dt-bindings: arm: rockchip: add PX30-PP1516 boards from Theobroma
    Systems
  arm64: dts: rockchip: add px30-pp1516 base dtsi and board variants

 .../devicetree/bindings/arm/rockchip.yaml     |  18 +
 arch/arm64/boot/dts/rockchip/Makefile         |   6 +
 .../rockchip/px30-cobra-ltk050h3146w-a2.dts   |  39 ++
 .../dts/rockchip/px30-cobra-ltk050h3146w.dts  |  39 ++
 .../dts/rockchip/px30-cobra-ltk050h3148w.dts  |  39 ++
 .../dts/rockchip/px30-cobra-ltk500hd1829.dts  |  58 ++
 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi  | 570 +++++++++++++++++
 .../rockchip/px30-pp1516-ltk050h3146w-a2.dts  |  39 ++
 .../dts/rockchip/px30-pp1516-ltk050h3148w.dts |  39 ++
 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi | 601 ++++++++++++++++++
 .../boot/dts/rockchip/px30-ringneck.dtsi      |  22 +-
 arch/arm64/boot/dts/rockchip/px30.dtsi        |   6 +
 12 files changed, 1473 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3148w.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3146w-a2.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3148w.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi

-- 
2.47.2


