Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8E4C7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 09:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=doJflWt2Lss8goKJ0fU1m7J8ZDVREvHk2lUbQH1sbLE=; b=cZceX+9yr6iKKHYWqwiVhLg+CC
	Z9k1LPzAIoQcwqxLelGEqDjb+Wjlgm+Jxcdugdt5ZnO9tzUdFhI9rzoqhXlXVIJT8koJWSMm8Zuow
	qSHIxJ1ZHNOCd0XFhbs/wTsT/9xlUQ54nKFoq1ivI6fh526qMTehoVjdMk+oeywcgyv7hovLE3RwL
	SUNW/kevgx1sgGTSv/wdanr0xuH0gA3/51xH8RCGhG7WyRcQl1HFNyyebiXxNkFEtRZ1te2OT3K20
	MVTVTibYSXNJghbCJgsUG2YIsYVlClbAj9B3O0tfXrXwjJRAlWvg9NkIED/e0jj5QaG6OuEsC+GQx
	OUo70LHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUizC-0000000B9Mm-26yx;
	Thu, 26 Jun 2025 09:33:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUiMo-0000000B39w-44AV;
	Thu, 26 Jun 2025 08:54:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A06175C411A;
	Thu, 26 Jun 2025 08:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0B46C4CEEB;
	Thu, 26 Jun 2025 08:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750928037;
	bh=OwU7D8PADIgeGXWG37O9GOsus96bJ6yiGEjt9OCGGg4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=DKMrfeFUOrzQ+q2EjnOdTN75U7ouLUQ/xGrr0CJQ1ZSQNT/f3MPL+kKaCiJMvSUaZ
	 8VFZvHva0c1Wt48gaqJzxTgM2bccFrcvtdGSIXFBwUrk3P90kqm0GaaF7fWOKcyUP8
	 /2yh0oiAQ+EXezl/oOzS2tydyd+/xn2kwJk1sPM3UUnRmgpIBFpWRjvk9+ctLt241K
	 tLnselK0Og2mQVFgpfAMFLIUwW8zT0MI2QqFcbeXM/0jR7pZkd2f90zzvz4GO4bDXf
	 55o0XKyqY4DSLizwSQK1mVMeaIE8NbrXxQzN9+JVmX4xK7c/GzEQR0PFZATLuT8ptb
	 SX2JZ7sFv5bzw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97CD3C7EE32;
	Thu, 26 Jun 2025 08:53:57 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Subject: [PATCH v2 00/11] ARM: Add support for MediaTek MT6572 SoC
Date: Thu, 26 Jun 2025 11:53:53 +0300
Message-Id: <20250626-mt6572-v2-0-f7f842196986@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKEKXWgC/zXMSw7CIBSF4a00dywGrrzsyH2YDhq5WAaFBhqia
 bp3sdHhf3LybVAoByrQdxtkqqGEFFvgqYPHNMYnseBaA3JUXIsrm1etDDLyxo4XJ5XQFtp5yeT
 D64DuQ+splDXl9+FW8V1/BPI/UQXjjNBJY5F7LvG25LSmeJ4Jhn3fP/dlbN+cAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750928035; l=2226;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=OwU7D8PADIgeGXWG37O9GOsus96bJ6yiGEjt9OCGGg4=;
 b=baIgSdGhRpPQDRrIAAZqPHxm2ghrGJjBIImam6uwo0RV19u1bA8Bu0NK72e5cy9k8IIzWH1kz
 Jy6jsC+ed2PBY0D7f7rUV2LakXFzOBxjLQCNTbuWlHUPAtXa2IdsUgK
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_015359_160338_19496773 
X-CRM114-Status: GOOD (  12.24  )
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
 arch/arm/boot/dts/mediatek/mt6572.dtsi             | 109 +++++++++++++++++++++
 arch/arm/mach-mediatek/Kconfig                     |   4 +
 arch/arm/mach-mediatek/mediatek.c                  |   1 +
 arch/arm/mach-mediatek/platsmp.c                   |   7 ++
 13 files changed, 251 insertions(+)
---
base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
change-id: 20250619-mt6572-ef78a3d45168

Best regards,
-- 
Max Shevchenko <wctrl@proton.me>



