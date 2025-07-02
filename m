Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641A2C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 11:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vo2elsrDTpSiK/2iGn7PhmqsmgRUyPTFM+zCaVSRClM=; b=TReW+BL1+mEXyyzHaGcn4mIyxB
	l7+vronAuzC4sXu2GpUDf3bWhq04hXE/w//ew48AdWid/42ZFKLO1bN31tjDLCTyTOI6DDpyRZmdJ
	PR8NbcCWB/ib/wlqyyxhRv3V5pm4Cl6dqdyz92O0wliimRUBgJWQWG0yVSFuRCjT5wmrSwKDrbYMX
	qbu0xcs8c3Y2gDvQ1PsAkk/Myqbl8LZXnPAe2PGD+QOk3sHGw3fD/A5L/MyUR5i5Sa2kllGSKarzf
	XL0pZWRqmKVdp0ga+YlmtG96JWoTauYyW1DxXqQL+CLpwLOb69Sy9ITNY4aSfiic6hYDqCwBqRkoH
	ge5BNm3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWvn5-000000089nl-17m1;
	Wed, 02 Jul 2025 11:38:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWv3o-000000080Xl-3AEY;
	Wed, 02 Jul 2025 10:51:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0084844C07;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C621BC4CEED;
	Wed,  2 Jul 2025 10:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751453487;
	bh=MV2mMqrsywSQ8XEX8eIYyfXz5q6RId1u/Dc6AHhTFO4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Lwy074kLgKo/DrcGKqhjxzinwCdvqlTScrd4/lL/hkuiuq27kbp3wf7tDVxqS7B+x
	 F+XIwBuG/JNeZh/w3fGbBta11+p1xzPd8G/E6vQd2caDQZFb6H++s+GaR3QTN4Jvfc
	 Cqh+cnB7jKQ4uA7VRNhDQZsI2LGbE3eSue0Tb85QXukmUSAItBP66RNAjwOWHY2f9Z
	 Xc13pOljho4d3qkXGjRQ43gQ4o0uBm9Y0Nc2Z7q81a7mcivZjJ+oHHP4K7AaDN9Qic
	 t60X5d9+Zw+tsT7s2rXmrVbEYVtH9d7DzguErD1Z4QMc3XWOTOeEL6/DwZ0xWOfJ7L
	 5jkoa8zN8r7dA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9256C8303C;
	Wed,  2 Jul 2025 10:51:27 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Subject: [PATCH v4 00/11] ARM: Add support for MediaTek MT6572 SoC
Date: Wed, 02 Jul 2025 13:50:37 +0300
Message-Id: <20250702-mt6572-v4-0-bde75b7ed445@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP0OZWgC/13MTQ6CMBCG4auQrq1pp/+uvIdxQaCVLqCkJY2Gc
 HcLUSQuv8k874ySjd4mdKlmFG32yYehDH6qUNPVw8Ni35aNgIAgkhrcT1IowNYpXbOWCyo1Ks9
 jtM4/t9DtXnbn0xTia+tmul4/CSDfRKaYYAstVxqIIxyuYwxTGM69RWsiw5HJnUFhTjnNgRppt
 Pxn7McUoTtjhWnDVONqxpwRR7YsyxtVyahhCgEAAA==
X-Change-ID: 20250619-mt6572-ef78a3d45168
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Sean Wang <sean.wang@mediatek.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 Max Shevchenko <wctrl@proton.me>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751453439; l=2538;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=MV2mMqrsywSQ8XEX8eIYyfXz5q6RId1u/Dc6AHhTFO4=;
 b=fx0ojaT7IM1H7gtp9SN7htFt8MTf0CWYRzHJOJDypSd22BTlhRLBTF3nK1kDkThQVJtwPe6NQ
 ZpJ1aDGzhChBGaSPTPEeodQlvmGW1xp9P/foi8vLGauPHKdJ3Z6AVpF
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_035128_845475_208F9448 
X-CRM114-Status: GOOD (  13.60  )
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
Reply-To: wctrl@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series of patches adds support for the MT6572 SoC and
the JTY D101 tablet and Lenovo A369i smartphone based on it.

Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
Changes in v4:
- Specify the unit-address for the memory node
- Link to v3: https://lore.kernel.org/r/20250701-mt6572-v3-0-8937cfa33f95@proton.me

Changes in v3:
- Remove the compatible property from the SoC devicetree
- Link to v2: https://lore.kernel.org/r/20250626-mt6572-v2-0-f7f842196986@proton.me

Changes in v2:
- Drop the status property for the board devicetrees
- Add an soc node for the MT6572 and reorder the nodes and properties
- Change the commit title to a more descriptive one
- Change the cover title to the correct one
- Link to v1: https://lore.kernel.org/r/20250620-mt6572-v1-0-e2d47820f042@proton.me

---
Max Shevchenko (11):
      dt-bindings: serial: mediatek,uart: add MT6572
      dt-bindings: interrupt-controller: mediatek,mt6577-sysirq: add MT6572
      dt-bindings: timer: mediatek: add MT6572
      dt-bindings: watchdog: mediatek,mtk-wdt: add MT6572
      dt-bindings: vendor-prefixes: add JTY
      dt-bindings: arm: mediatek: add boards based on the MT6572 SoC
      ARM: mediatek: add board_dt_compat entry for the MT6572 SoC
      ARM: mediatek: add MT6572 smp bring up code
      ARM: dts: mediatek: add basic support for MT6572 SoC
      ARM: dts: mediatek: add basic support for JTY D101 board
      ARM: dts: mediatek: add basic support for Lenovo A369i board

 .../devicetree/bindings/arm/mediatek.yaml          |   5 +
 .../mediatek,mt6577-sysirq.yaml                    |   1 +
 .../devicetree/bindings/serial/mediatek,uart.yaml  |   1 +
 .../devicetree/bindings/timer/mediatek,timer.yaml  |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 .../bindings/watchdog/mediatek,mtk-wdt.yaml        |   1 +
 arch/arm/boot/dts/mediatek/Makefile                |   2 +
 arch/arm/boot/dts/mediatek/mt6572-jty-d101.dts     |  61 ++++++++++++
 arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dts |  56 +++++++++++
 arch/arm/boot/dts/mediatek/mt6572.dtsi             | 108 +++++++++++++++++++++
 arch/arm/mach-mediatek/Kconfig                     |   4 +
 arch/arm/mach-mediatek/mediatek.c                  |   1 +
 arch/arm/mach-mediatek/platsmp.c                   |   7 ++
 13 files changed, 250 insertions(+)
---
base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
change-id: 20250619-mt6572-ef78a3d45168

Best regards,
-- 
Max Shevchenko <wctrl@proton.me>



