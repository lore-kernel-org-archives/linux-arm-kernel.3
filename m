Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0884ACCA474
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 09:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0LSfLxweWuMF/6IUr9mkHm7rHjtJf4x+BjRMpRNZtuM=; b=kpC/uPmQTeUeWkTTgoEbGydYnF
	4A798mLIqFSpZ9ZkH+pW0pHDMmi6MZPmlNkir8mNovBj+wgykYoi6qW1hPhH6uDXlAG5PfKAIjSEQ
	L/j96cItk7dayaUQvrGNhzwvvQSW28bHJUEq8V2H/vGFdNsf0P4+YL+aBUPO45nQgVF3lZ+Va02pE
	qiwNqRhFwFbrWmgO4Eru5ZIiILyxj9PUUyYhL+Ftm1tsQV/bH+Ppu9gYtwKx435Tv0D7he44M9GCg
	9DwL6w5FpW4pz3e2eEsk2gjITwKFnRsp/GPfg5W3faGuFd3yHlD1XVWGOqSGHHTH6+/kKOexeeVJS
	PYyWXUPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Wnm-00000004qB8-10Fa;
	Tue, 30 Sep 2025 09:37:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Wnd-00000004q1T-2uOp;
	Tue, 30 Sep 2025 09:37:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9BCFF60452;
	Tue, 30 Sep 2025 09:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44A39C4CEF0;
	Tue, 30 Sep 2025 09:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759225051;
	bh=5o+htP+rM/HKQyGn1eH3S7+MzThwQ+uX1Hq8VqONr8g=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=n9xxRbBBX96T9ogcvhLUVw8I8DhLBCLfbpk2dfxWWXyJ/khtsq8oqFcT7gGdJqit/
	 tWd6EgzlvC+0o6Bt7lHLfzDo/6yH7naAjRWQ7xfHiml1BS1hpIL3N9vAdcUGR7SpT3
	 Z0LNwuF6TBLCCfkRPe13i8SnOwGpuzl7LzdYjnvutHXqCzQ7mwHuxzuXC2EYyof6jH
	 edpVAsXoS8kubU08pHR5U9LT4zwEzvQQw1N81UnIzStZ03XlSFJL/og3k0UuUxff7b
	 zF4jiPEE3lZ5q0AOmAQgCMDSl+xXF5V2LJneUtv9+igBFiWrDje3RdijMcN/HiabZW
	 yZbBf/QEdRPfw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FAB2CAC5BC;
	Tue, 30 Sep 2025 09:37:31 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH 00/19] clk: amlogic: Add PLLs and peripheral clocks for A4
 and A5 SoCs
Date: Tue, 30 Sep 2025 17:37:13 +0800
Message-Id: <20250930-a4_a5_add_clock_driver-v1-0-a9acf7951589@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMmk22gC/x3M0QoCIRBA0V9Z5jnBNC37lSXEnKmGYl1GkED89
 6TH83Bvh0rCVOG6dBBqXLlsE8fDAvmVticpxmkw2jgdzEWlU0wuJsSYPyW/Iwo3EmXu5xzQB+e
 thRnvQg/+/sfrbYwfl8Id9GgAAAA=
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759225047; l=4218;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=5o+htP+rM/HKQyGn1eH3S7+MzThwQ+uX1Hq8VqONr8g=;
 b=9UB/pSh4Qx25JQAEirqjDzvZLuzERi70Cm6gW7FIEkZawGXnWeEHArseYuIOn4cVV4sEtZAa/
 JbTQPGuAcNjD5619B0r6CFtJhOhE2icgF32q6i9IBU4mc7tmLmTgXXe
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This patch series includes changes related to the PLL and peripheral
clocks for both the A4 and A5 SoCs.

The patches for A5 were previously submitted up to V3 by Xianwei.
https://lore.kernel.org/all/20250103-a5-clk-v3-0-a207ce83b9e9@amlogic.com/
After friendly coordination, I’ve taken over and continued the
submission as part of this series. The dt-bindings patch retains Rob's
original "Reviewed-by" tag, and I hope this hasn’t caused any
additional confusion.

Both A4 and A5 belong to the Audio series. Judging by their names, one
might assume that A5 is an upgrade to A4, but in fact, A5 was released
a year earlier than A4.

Since there are differences in the PLLs and peripheral clocks between
the A4 and A5 SoCs (especially the PLL), and taking into account factors
such as memory footprint and maintainability, this series does not
attempt to merge the two into a shared driver as was done for
G12A/G12B/SM1.

This patch series includes all related dt-bindings, driver, and dts
changes for the PLLs and peripheral clocks. Following our past convention
for clock-related submissions, the dts changes are placed at the end
and submitted separately. If this ordering makes it harder for
maintainers to review or pick patches, please feel free to point it out.

Co-developed-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
Chuan Liu (19):
      dt-bindings: clock: Add Amlogic A4 SCMI clock controller
      dt-bindings: clock: Add Amlogic A4 PLL clock controller
      dt-bindings: clock: Add Amlogic A4 peripherals clock controller
      clk: amlogic: Optimize PLL enable timing
      clk: amlogic: Correct l_detect bit control
      clk: amlogic: Fix out-of-range PLL frequency setting
      clk: amlogic: Add A4 PLL clock controller driver
      clk: amlogic: Add A4 clock peripherals controller driver
      arm64: dts: amlogic: A4: Add scmi-clk node
      arm64: dts: amlogic: A4: Add PLL controller node
      arm64: dts: amlogic: A4: Add peripherals clock controller node
      dt-bindings: clock: Add Amlogic A5 SCMI clock controller support
      dt-bindings: clock: Add Amlogic A5 PLL clock controller
      dt-bindings: clock: Add Amlogic A5 peripherals clock controller
      clk: amlogic: Add A5 PLL clock controller driver
      clk: amlogic: Add A5 clock peripherals controller driver
      arm64: dts: amlogic: A5: Add scmi-clk node
      arm64: dts: amlogic: A5: Add PLL controller node
      arm64: dts: amlogic: A5: Add peripheral clock controller node

 .../clock/amlogic,a4-peripherals-clkc.yaml         | 122 +++
 .../bindings/clock/amlogic,a4-pll-clkc.yaml        |  61 ++
 .../clock/amlogic,a5-peripherals-clkc.yaml         | 134 ++++
 .../bindings/clock/amlogic,a5-pll-clkc.yaml        |  63 ++
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |  80 ++
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |  87 ++
 drivers/clk/meson/Kconfig                          |  53 ++
 drivers/clk/meson/Makefile                         |   4 +
 drivers/clk/meson/a1-pll.c                         |   1 +
 drivers/clk/meson/a4-peripherals.c                 | 764 ++++++++++++++++++
 drivers/clk/meson/a4-pll.c                         | 242 ++++++
 drivers/clk/meson/a5-peripherals.c                 | 883 +++++++++++++++++++++
 drivers/clk/meson/a5-pll.c                         | 476 +++++++++++
 drivers/clk/meson/clk-pll.c                        |  76 +-
 drivers/clk/meson/clk-pll.h                        |   2 +
 .../clock/amlogic,a4-peripherals-clkc.h            | 129 +++
 include/dt-bindings/clock/amlogic,a4-pll-clkc.h    |  15 +
 include/dt-bindings/clock/amlogic,a4-scmi-clkc.h   |  42 +
 .../clock/amlogic,a5-peripherals-clkc.h            | 132 +++
 include/dt-bindings/clock/amlogic,a5-pll-clkc.h    |  24 +
 include/dt-bindings/clock/amlogic,a5-scmi-clkc.h   |  44 +
 21 files changed, 3406 insertions(+), 28 deletions(-)
---
base-commit: 01f3a6d1d59b8e25a6de243b0d73075cf0415eaf
change-id: 20250928-a4_a5_add_clock_driver-2b7c9d695633

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>



