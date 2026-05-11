Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559D9CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 12:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wciHqxID2f9ocInbNjAKsE1H+gqOMdJiwMVWt3Lds9U=; b=wXKujW/Lh+1Cp/gOyBGepJxgNq
	HcapDIrxABqYmpUvsIMjP+WC9XV84JtZ/rrFbLAHah9jN/C9ZiivpwmxLtj16B4Clzx3AYmBwuRyK
	9/xXyQiLbdy1uNgPKDZR76pji5K69Go4ZzXW87ATUo/r1TSxQM78Hzg2Fg4T6daydN61Y5WPwJ/rP
	LD2Z4aKzJNO33dO+jDowjg3cAMPLYymDHn4Gf9czyAra9/8xUp/kNkdZ/x5+L8Vy4yuXJ87LqJBcT
	FSwDdrw1X6CNTPdR0/oX2Y66e7grB/is7NAKWSZThzBdFvbUkg7VCxM2QgS9zJmK+4OOFwB7IWwvJ
	YM/x+cKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQ2u-0000000Db5T-0ohx;
	Mon, 11 May 2026 12:47:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQ2s-0000000Db3V-1F3m;
	Mon, 11 May 2026 12:47:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9194B6001A;
	Mon, 11 May 2026 12:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C5C3C2BCB0;
	Mon, 11 May 2026 12:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778503657;
	bh=d/bn89pQhI2eZfLETFYCMIW9bPsVZbUfOMIG98dS5ow=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Qw9WdMUNgGqK8AfboWuXU5o59I10StRQMnuTXn91d9s0/qNjfQ+4DFK/jW2yEdESZ
	 mu/hCKvve91312R5G6r/315BmFpsD3LuYQ5z8A2MWkOeZm56kzWov2WG2t13TxFYOG
	 VfuzMIG0gi2oMA+Z7uXmSA2GgKrkvK9cMdCO/U8nfwJIbbSmks3DHjwg20bfOvUy5+
	 kGLnoGUUBpfjkkR1kUluMUwTLeZAqxGgk/tyLArUHJ47ImJl8NXoYI9g7WDnsCFzHy
	 6MrK4PU10sIFlmBphz2bCrjl/MmLXhF/nZV6OWNFPaAt8lYlvtouyOa1F0MJDT0JS1
	 E1NW9NTpxEBcw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A8DCD4840;
	Mon, 11 May 2026 12:47:37 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Subject: [PATCH 00/10] Add support for A9 family clock controller
Date: Mon, 11 May 2026 20:47:22 +0800
Message-Id: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANvPAWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0ND3SQT3UTL+OScbF0zczNTo2TDxFRTs1QloPqCotS0zAqwWdGxtbU
 AQ6L9iVsAAAA=
X-Change-ID: 20260511-b4-a9_clk-67652c1ae56e
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778503655; l=3503;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=d/bn89pQhI2eZfLETFYCMIW9bPsVZbUfOMIG98dS5ow=;
 b=LlCL2gW0AbGiMXgURqP5wwCamriSIUD5Er+NKhm9/SMSQrpiAR/13zXTQ2VlPl/eICNq37nPq
 5A9qDf5T7EmBFn5HX3ZqZb76Rgaz5RkDb4nFutBsWItSUe9zONYQfk9
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
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
Reply-To: jian.hu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

There are 4 clock controllers in A9 SoC:
- SCMI clock controller: these clocks are managed by the
  Trusted Firmware-A(TF-A) and handled through SCMI.
- PLL clock controller.
- peripheral clock controller.
- AO clock controller.

There are reserved register regions placed between individual PLLs, so a
separate driver is implemented for each PLL, similar to T7.

Compared to previous SoCs PLLs, the A9 PLL controller introduces 4 new features:
1.PLL l_detect signal supports active-high configuration.
  Previous A7 and T7 l_detect signals are active-low.
2.PLL reset signal supports active-low configuration.
  Previous reset signals are active-high.
3.Support POWER_OF_TWO for the PLL pre-divider N;
  the N pre-divider follows the same calculation rule as OD.
4.The PLL input path includes an inherent divide-by-2 divider.

Implement the first three features in clk-pll.c (verified on A9 and T7),
with no impact to PLL logic on existing SoCs. Add a fixed divide-by-2 to
A9 PLL driver for the fourth feature.
 
A9 PLL is composed as follows:
 
                       PLL
          +---------------------------------+
          |                                 |
          |             +--+                |
   in/2 >>---[ /2^N ]-->|  |      +-----+   |
          |             |  |------| DCO |----->> out
          |  +--------->|  |      +--v--+   |
          |  |          +--+         |      |
          |  |                       |      |
          |  +--[ *(M + (F/Fmax) ]<--+      |
          |                                 |
          +---------------------------------+
 
  out = in / 2  * (m + frac / frac_max) / 2^n

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
Jian Hu (10):
      dt-bindings: clock: Add Amlogic A9 SCMI clock controller
      dt-bindings: clock: Add Amlogic A9 PLL clock controller
      dt-bindings: clock: Add Amlogic A9 peripherals clock controller
      dt-bindings: clock: Add Amlogic A9 AO clock controller
      clk: amlogic: PLL l_detect signal supports active-high configuration
      clk: amlogic: PLL reset signal supports active-low configuration
      clk: amlogic: Support POWER_OF_TWO for PLL pre-divider
      clk: amlogic: Add A9 PLL clock controller driver
      clk: amlogic: Add A9 peripherals clock controller driver
      clk: amlogic: Add A9 AO clock controller driver

 .../bindings/clock/amlogic,a9-aoclkc.yaml          |   76 +
 .../clock/amlogic,a9-peripherals-clkc.yaml         |  150 ++
 .../bindings/clock/amlogic,a9-pll-clkc.yaml        |  110 +
 drivers/clk/meson/Kconfig                          |   28 +
 drivers/clk/meson/Makefile                         |    2 +
 drivers/clk/meson/a9-aoclk.c                       |  494 +++++
 drivers/clk/meson/a9-peripherals.c                 | 2317 ++++++++++++++++++++
 drivers/clk/meson/a9-pll.c                         |  831 +++++++
 drivers/clk/meson/clk-pll.c                        |   79 +-
 drivers/clk/meson/clk-pll.h                        |    6 +
 include/dt-bindings/clock/amlogic,a9-aoclkc.h      |   76 +
 .../clock/amlogic,a9-peripherals-clkc.h            |  352 +++
 include/dt-bindings/clock/amlogic,a9-pll-clkc.h    |   55 +
 include/dt-bindings/clock/amlogic,a9-scmi-clkc.h   |   51 +
 14 files changed, 4609 insertions(+), 18 deletions(-)
---
base-commit: ca89c88bcf69daca829044c638a8163d5ce47af0
change-id: 20260511-b4-a9_clk-67652c1ae56e

Best regards,
-- 
Jian Hu <jian.hu@amlogic.com>



