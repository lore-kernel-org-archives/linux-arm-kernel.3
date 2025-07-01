Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC4EC8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 06:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gk4XQ79DewaGstnIKyslNFe50PMJ/52QJ3GvBWOc/6k=; b=cI3yCP8IMPVsb8lSHKOysbZMNX
	FGZRtK6e225KLj8ePBScVBePSNDCOnWMYoSn5GsV35G2HITPJCzndLZYcuxnWZkmLtKI3f/RMjwg6
	WtiVr46fE50Le7ZJCPBJkqWUDGqrk1lQ3PBoSWubjiBWlQd5Tk6gLn5KeiAPwSWEDNWsDoBFjCfo6
	dcuHJ9f2B7BNObv9SL+jOTTEVsiEFCoKV18iIHjL1GUdUSVWR6c5Z1JPJdffv3yArcbxl1aWiUacG
	BWWuwnR4ZCvT+tomMKlfO0vF9mil78NVq1E7bUtr95X/IE0yHIc2q24DC7CrwaMkLNpyK8XhSWOIS
	xp5Eo6Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUO3-000000048DW-0SNb;
	Tue, 01 Jul 2025 06:22:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWU8y-000000046Kh-1Bc5;
	Tue, 01 Jul 2025 06:07:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DF327A50559;
	Tue,  1 Jul 2025 06:06:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85FDBC4CEEE;
	Tue,  1 Jul 2025 06:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751350018;
	bh=oZcqmmBHgzf7bA0rusgFoUD24PExreWRsI+j45s8cvY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=QgUIu8exZ5q2zYmj1Bu2+77/1WGjQpzHDPZ5IANy4QUALX1p35z3cq/bJWUiYMwPV
	 5awZszFcghn9kNKoZYmTdghdK6AFWyEnc5x9bB9giUR+MwpyPVdZ+zqFW1LaATdWTP
	 6UiELPMCVkaRt1AKpLM9k2ksdt6zAWe4u6IYXJxjLXeQmYTrmWrNSelpA0TKQdoiQx
	 O2f3XHOgPDdscz/Xl5EV/j4n0SUA4OEGDb+hdYBUSed577rLzbSL0JjAJxHHeSMxM8
	 JXa7r96hyae0lz0t7PX+F2hyDQtglkx8jVPJ3BARUgvYKlM/7/R84iqAX4gM2VSqIh
	 NJVaSTJZZqC0w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75091C83038;
	Tue,  1 Jul 2025 06:06:58 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Subject: [PATCH v3 00/11] ARM: Add support for MediaTek MT6572 SoC
Date: Tue, 01 Jul 2025 09:06:54 +0300
Message-Id: <20250701-mt6572-v3-0-8937cfa33f95@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP56Y2gC/02MwQ6DIBAFf8XsuTSwImBP/Y+mB1OWykExYEgb4
 78XTdt4nJc3s0Ci6CnBpVogUvbJh7FAfarg0Xfjk5i3hQE5NlyJlg2zajQyctp0tZWNUAbKeYr
 k/GsP3e6Fe5/mEN97N4tt/SaQ/xJZMM4IrdQGueMSr1MMcxjPA8GWyHjU1F/DojntjETRqtaoo
 7au6wdlvVtY0wAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751350015; l=2387;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=oZcqmmBHgzf7bA0rusgFoUD24PExreWRsI+j45s8cvY=;
 b=2KhKXVehntkb4Wh+h+vs9QAsxwTRPHmCMXW1qrDVrttOmhLUQv4ciyxG1hFdZA/zQMzd8OqAh
 YTAHYVURzLSD7a+Ag2fTJq4Jck+JvIdjNrp0WNDF3MwY1qYz8yz7igK
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_230700_483051_F86D0B7B 
X-CRM114-Status: GOOD (  13.21  )
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



