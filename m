Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14223C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 04:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V43htX1dGZaj3LjzLzN85N5YuxGq1AdyxzQaJKqWYic=; b=JtEAzzHqLhG3YBe81z8mUnlhrh
	BcnWQm+5uihlBgLtfgBNvA/nMQcz5GsYoK1Swx4MkCV4kK5hmCWedWfR1/NN7an0fAPZrCFKU9nrY
	9JzPfhHJRGGwn6zNV3KY0MUvugE1T+PSBIgostkgTq4ex1X5pmzOukqTtyIc7eIGmOvb1Lk26XE39
	QglmpRWN81be6Iqu6Hn5GU0FnpQrIvpeRL4ZNYAupg2p6y5p36fwyMc22kUgvQueLH0kzjb9Vrp91
	hnSpzOp9x6vRLvRN6/r0tzTlJJrLCa7F6k/Z+XaW4rlST0LgTazfZe1FU1QNKBp51BueNFYAaTbi+
	YXzm2nSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTvf2-00000004dbM-3u0E;
	Tue, 24 Jun 2025 04:53:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTuTq-00000004YgO-2nsb;
	Tue, 24 Jun 2025 03:37:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=V43htX1dGZaj3LjzLzN85N5YuxGq1AdyxzQaJKqWYic=; b=HuiGXwiiR5pT+KOrUmkVHwVB5L
	cJMm15hR1m2b4o+81SNqdJz2GaekAVJzDt30n3s+9jsFg2e1iDa1jHhhJD2Jw4YFAyi9/jGDkV04F
	nN8fTupuhTIGhcD1EzMfmtT3yahlGoFAwyNgkBXNg1iPclYIIs5HPh5x6i70dzXZPr0ojvDqNj83q
	NFPHdsLuQpiJEfh3Wr2PshFF044xvDDY46Y9q7Zk6xtQUhvJvtTKgKyDoQgzBQ5/XejX3E2cK3cQj
	/+x6bcpXWrM9alxn0ld/60Fsa2lz6RimHa78WUjWW24+hEirjmdL6nX9VO78Pt+5BuS7zcfakLgWZ
	wBhabtuw==;
Received: from layka.disroot.org ([178.21.23.139])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTuTn-00000005NSA-3U4s;
	Tue, 24 Jun 2025 03:37:53 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E821120731;
	Tue, 24 Jun 2025 05:37:48 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2-bGI4FkFAEs; Tue, 24 Jun 2025 05:37:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750736268; bh=cpbZBwjbBZgHkRQ7AWaTRO0fpUi6AJxBeB+TW6Cfd6I=;
	h=From:To:Cc:Subject:Date;
	b=N/VwivIjCw02sOY60jg1xWpaSoEBSwLFCl2Adt/Md73nlOrSXxjEPxuvdNFaX3I7f
	 YWi7W9Pyf+EKdZyldKUGELqQn0Q4Bj/a37syY96jRG73qcMVJRE9vHJS6rITNw7QbL
	 8Dt6F6o8VOX5mMRsjatHNbhT4M3J0P//f4HLLbV3SVkZvvy4A8+0zYhEl0Gm2FheXr
	 PICqeXYzJuQHoqlvLc/NStYkj1EhwZrdsiT1qsgmYPW+QOy+DcE3RTo1EEbgqj9Ayv
	 UaVMozfLmuORpuHKUev6EUb1ylno3ryD9GUxIu/sPsAeD1hi7j9QgPL9wUJxU7mw0J
	 7Q/hgTBb6C8lw==
From: Yao Zi <ziyao@disroot.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Yao Zi <ziyao@disroot.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/6] Support RK3528 variant of Rockchip naneng-combphy
Date: Tue, 24 Jun 2025 03:37:27 +0000
Message-ID: <20250624033733.50197-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_043752_037855_1F722E33 
X-CRM114-Status: UNSURE (   9.61  )
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

Rockchip RK3528 ships a naneng-combphy that operates in either PCIe or
USB 3.0 mode. It has a similar control logic to previous generations of
naneng-combphy but an apparently different register layout.

This series prepares phy-rockchip-naneng-combphy.c for variants with a
different register layout and add RK3528 support.

Testing is done on both Radxa E20C and Radxa Rock 2A with downstream
devicetree changes, both USB 3 and PCIe modes are verified with mainline
driver and achives a reasonable link speed.

This series depends on v2 of patch "arm64: dts: rockchip: convert rk3528
power-domains to dt-binding constants"[1] to build.

[1]: https://lore.kernel.org/all/20250620201715.1572609-1-heiko@sntech.de/

Changed from v3
- Add a dt-binding patch to allow power-domains property when describing
  Rockchip naneng combphys
- devicetree patch
  - Break down long lines
  - Sort properties to keep the style consistent
  - Add power-domains property to the combphy node
- Link to v3: https://lore.kernel.org/linux-rockchip/20250519161612.14261-1-ziyao@disroot.org/
Changed from v2
- phy binding patch
  - Fix format issue
  - drop review tags
- Link to v2: https://lore.kernel.org/all/20250509004121.36058-2-ziyao@disroot.
org/
Changed from v1
- Collect review tags
- Restyle RK3528 register definitions in the combphy driver
- Drop unused include of phy.h in SoC devicetree
- Link to v1: https://lore.kernel.org/all/20250508134332.14668-2-ziyao@disroo
t.org/

Yao Zi (6):
  dt-bindings: soc: rockchip: Add RK3528 pipe-phy GRF syscon
  dt-bindings: phy: rockchip: naneng-combphy: Add power-domains property
  dt-bindings: phy: rockchip: naneng-combphy: Add RK3528 variant
  phy: rockchip: naneng-combphy: Add SoC prefix to register definitions
  phy: rockchip: naneng-combphy: Add RK3528 support
  arm64: dts: rockchip: Add naneng-combphy for RK3528

 .../phy/phy-rockchip-naneng-combphy.yaml      |   8 +-
 .../devicetree/bindings/soc/rockchip/grf.yaml |   1 +
 arch/arm64/boot/dts/rockchip/rk3528.dtsi      |  24 +
 .../rockchip/phy-rockchip-naneng-combphy.c    | 746 +++++++++++-------
 4 files changed, 505 insertions(+), 274 deletions(-)

-- 
2.49.0


