Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5148CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 01:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2x9WEOIJFbRg/y2qUNfV6KI6gNqhWSixKcXcE6ONTuE=; b=ubwRhHMCwpKVqkksyZkuLg3VgB
	3QOBdBRYy4JvWmj82V8hertr7vMbyDnaIQuOe2OE5Z5avHszr3FXdflDKnObilR0wyTHg65swnpod
	3dlKBxe2CSLI3py03B51T1DzgzvR4ceC5gm4P8Vn2j1NUrWvRKp/Kwzar9b8x3ihsz5hNc7M6mV2H
	h9o8+zlVF+bQPdWQNl8KZjiHWixMRHuJBRIpkjQ9hsIc0c7fItb+a2Eu25hLarMfJTBj5a+jBDcij
	y8uL8YiybfLCZ3oefd8x0DPCJ1qKwKInnKC5CaCJkwgN6sPW1soecQrifHVwP+oQE1AqrYSd4Uo3Y
	4GLn4USw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utcj5-000000038v2-2YDq;
	Wed, 03 Sep 2025 01:55:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utb4F-00000002iue-43xd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 00:09:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 817521764;
	Tue,  2 Sep 2025 17:09:30 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11EA83F63F;
	Tue,  2 Sep 2025 17:09:36 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Mikhail Kalashnikov <iuncuim@gmail.com>
Subject: [PATCH 0/5] arm64: allwinner: a523: Enable CPU clocks
Date: Wed,  3 Sep 2025 01:09:05 +0100
Message-ID: <20250903000910.4860-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_170940_049819_839EA257 
X-CRM114-Status: GOOD (  14.85  )
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

Hi,

this series adds support for the CPU clock controller in the Allwinner
A523/A527/T527 family of SoCs.

In contrast to all earlier Allwinner SoCs, this chip features a separate
CCU for the CPU clocks (one for each of the two clusters) and the DSU
clock.

Patch 1/5 adds the binding document for the new CCU. This builds on top
of Chen-Yu's recent patch for the MCU PRCM, listed as a prerequisite
below.
Patch 2 and 3 add some slight enhancements to the sunxi-ng clock driver
framework, to generalise the update bit and allow clocks with just a
power-of-2 divider.
Patch 4 adds the actual clock driver, and patch 5 makes use of that by
adding the clock description to the SoC .dtsi.

Please have a look and test!

Cheers,
Andre

Andre Przywara (5):
  dt-bindings: clock: sun55i-a523-ccu: Add A523 CPU CCU clock controller
  clk: sunxi-ng: generalise update bit
  clk: sunxi-ng: mp: support clocks with just a shift register
  clk: sunxi-ng: add support for the A523/T527 CPU CCU
  arm64: dts: allwinner: a523: add CPU clocks

 .../clock/allwinner,sun55i-a523-ccu.yaml      |  25 ++
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |  22 ++
 drivers/clk/sunxi-ng/Kconfig                  |   5 +
 drivers/clk/sunxi-ng/Makefile                 |   2 +
 drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.c    | 338 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.h    |  24 ++
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c        |  12 +-
 drivers/clk/sunxi-ng/ccu_common.h             |   5 +-
 drivers/clk/sunxi-ng/ccu_div.c                |   3 +-
 drivers/clk/sunxi-ng/ccu_gate.c               |   6 +-
 drivers/clk/sunxi-ng/ccu_mp.c                 |   6 +-
 drivers/clk/sunxi-ng/ccu_mp.h                 |   8 +-
 drivers/clk/sunxi-ng/ccu_mux.c                |   3 +-
 drivers/clk/sunxi-ng/ccu_nm.c                 |   1 +
 .../dt-bindings/clock/sun55i-a523-cpu-ccu.h   |  13 +
 15 files changed, 450 insertions(+), 23 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.h
 create mode 100644 include/dt-bindings/clock/sun55i-a523-cpu-ccu.h


base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
prerequisite-patch-id: 874f647e4961983cbcfda05d2fd906256b008327
-- 
2.46.3


