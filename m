Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BC2D6E2C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 07:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7sHdMYYwNxM2Ghcj26LFQY+Ijosa4JfFHUyPDqKwVqQ=; b=JaIezFNOv6pouyVF6/SDJA2E13
	L/285qRET+QOzSiHc7lg8sBdYwh6go3Q/tbiS0mS51kyb+CbHYBGP/7ebRS8GJ4Z5YJ6EsW/6cfu3
	jTFd9cJRD6vgSb1rTbedzO+PlzI1wSwoNP92cdysDryq5gF96jewxBzqzsPUN64Z2b3LFwV7tkUCm
	WeJlzxbABao1uPGc2iEX27pR9kfypupjVBLU+rXoBA3H6F2b/fYhpRCW8D+Q6HlVw4E/SBnY2/42D
	Ym4AChX1E3OTsUZAZ0d1XeDxPc8RBAz0Xp24mv3/rqQPAV1/14DISaVrDoRlXiblZnk57RA79Ytyh
	osqHsKNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDek6-0000000EZ94-1V8S;
	Wed, 20 Nov 2024 07:03:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDeiD-0000000EYeE-0AGW;
	Wed, 20 Nov 2024 07:01:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DBBEA5C5A25;
	Wed, 20 Nov 2024 07:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 831A1C4CECD;
	Wed, 20 Nov 2024 07:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732086075;
	bh=oaMqr8221d4dNAMOE6HnSj3j2CboaMXhg2FJ5tzAdbY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=rqlrqZv7uevf56YLjIwAkzK9jGfNiy2qtIbXixOLNUtWd04YGaJ8lWmBbXDGSHb+P
	 yQIh83RU7QhL8pW4ujcTlwctpgVTHofwBFzyYihbiAixj7nHG/vC74F3qlmalEl9qy
	 xjic3xJEqzhiaaDZ06YqPsSbGrGwutunRahjItcxJW/x9j011Gcp0UKJ4mlkfNToFb
	 4H5YqU02Ql8RCb4kdKUWKGOhhhVkV39Z5k4sX8HYjpIo3thhv+HzCt8ac+yZjBmmXr
	 cwypaGaogAVecID6ko9KQIgfIV1MfZEmsJ/YNTopjN3vW5UqAT4QXmS8Xj5jchhwFz
	 ZP+yOdwcneGjg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EDFBD6E2CD;
	Wed, 20 Nov 2024 07:01:15 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/5] Add A5 SoC PLLs and Peripheral clock
Date: Wed, 20 Nov 2024 15:01:12 +0800
Message-Id: <20241120-a5-clk-v2-0-1208621e961d@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADiJPWcC/zXMQQqDMBCF4avIrDsliRFqV71HcRGnow5VU5ISW
 iR3byq4/B+Pb4PIQTjCtdogcJIofi1hThXQ5NaRUR6lwShjVas1ugZpfmLdkG0d9bVlDeX8Cjz
 IZ4fuXelJ4tuH7+4m/V8Pwh5E0qiwYTZkB92rC93cMvtR6Ex+gS7n/AMsf8MongAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chuan Liu <chuan.liu@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732086073; l=2344;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=oaMqr8221d4dNAMOE6HnSj3j2CboaMXhg2FJ5tzAdbY=;
 b=MHBCAgBZtPFPVVjh1j0QLRkcYUREgMvXITQQxxmm3yCDm2XyITssD8oM3P69MCTmYq67mb4qX
 KFFX1xf0fW8DaMTW6YjKZWpEATXe9LL36uO6HvP/XPFtu8lSz0MOW/o
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_230117_172115_08A4F6D1 
X-CRM114-Status: UNSURE (   8.42  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The patchset adds support for the peripheral and PLL clock controller
found on the Amlogic A5 SoC family, such as A113X2.

Some clocks are provided by security zones. These clock accessed
througth SCMI driver in linux, inlcuding OSC, SYS_CLK, AXI_CLK,
CPU_CLK, DSU_CLK, GP1_PLL, FIXED_PLL_DCO, FIXED_PLL, SYS_PLL_DIV16,
ACLKM, CPU_CLK_DIV16, FCLK_50M_PREDIV, FCLK_50M_DIV, FCLK_50M, 
FCLK_DIV2_DIV, FCLK_DIV2, FCLK_DIV2P5_DIV, FCLK_DIV2P5, FCLK_DIV3_DIV,
FCLK_DIV3, FCLK_DIV4_DIV, FCLK_DIV4, FCLK_DIV5_DIV, FCLK_DIV5,
FCLK_DIV7_DIV, FCLK_DIV7, CLKID_SYS_MMC_PCLK, CLKID_SYS_CPU_CTRL,
CLKID_SYS_IRQ_CTRL, CLKID_SYS_GIC, CLKID_SYS_BIG_NIC, CLKID_AXI_SYS_NIC,
and CLKID_AXI_CPU_DMC.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v2:
- Move some sys clock and axi clock from peripheral to scmi impletement.
- Remove  ARM_SCMI_PROTOCOL in Kconfig and correct name A5 but not A4.
- Add two optional clock inputs for the peripheral(ddr pll and clk-measure)
- Make some changes and adjustments according to suggestions.
- Link to v1: https://lore.kernel.org/r/20240914-a5-clk-v1-0-5ee2c4f1b08c@amlogic.com

---
Chuan Liu (5):
      dt-bindings: clock: add Amlogic A5 PLL clock controller
      dt-bindings: clock: add Amlogic A5 SCMI clock controller support
      dt-bindings: clock: add Amlogic A5 peripherals clock controller
      clk: meson: add support for the A5 SoC PLL clock
      clk: meson: add A5 clock peripherals controller driver

 .../clock/amlogic,a5-peripherals-clkc.yaml         |  130 ++
 .../bindings/clock/amlogic,a5-pll-clkc.yaml        |   62 +
 drivers/clk/meson/Kconfig                          |   27 +
 drivers/clk/meson/Makefile                         |    2 +
 drivers/clk/meson/a5-peripherals.c                 | 1387 ++++++++++++++++++++
 drivers/clk/meson/a5-pll.c                         |  543 ++++++++
 drivers/clk/meson/clk-regmap.h                     |   17 +
 .../clock/amlogic,a5-peripherals-clkc.h            |  132 ++
 include/dt-bindings/clock/amlogic,a5-pll-clkc.h    |   24 +
 include/dt-bindings/clock/amlogic,a5-scmi-clkc.h   |   44 +
 10 files changed, 2368 insertions(+)
---
base-commit: 961101258aa2da34b032ea21f32599a895448996
change-id: 20240911-a5-clk-35c49acb34e1

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



