Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A6CC54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 14:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WFfmw9W1CGI7bVBj6Fu7J5hVInrnU5SIjbVdKTqOB6w=; b=sKZv4bOGDeUuj2HcainvK2IW+e
	Sey5OYId6bc1X254qwffFy3c+/rdUzz8Pgy+mltNwg9pBmJu2yDm+bVUodRHUHpJaHlD3RdouzhrY
	oBawjhk7s3TxNqGou1zgV+UQMorl0oPf8bvj2Ejs3HMywipf1GJ00WScpznhQsRyoBz95fnNu0rYw
	P90dTxBTE+Qi5+8oRaiA0FDinmQl+ygPo5TaJBXaumMFqcyCIv5gMVDrZRaRqe8LghBJHzDB5JOe2
	ILVmOS+O9fj3hN2L4pXkxBaZPjaH0Mb7lO+86MqntQAaMidt7wKzQm/i//H/cfoIc6Mx3sZpeobpL
	/fcCTH0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woioA-00000005U2x-3aZ5;
	Tue, 28 Jul 2026 14:29:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woinv-00000005TxK-3Jc3;
	Tue, 28 Jul 2026 14:29:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=WFfmw9W1CGI7bVBj6Fu7J5hVInrnU5SIjbVdKTqOB6w=; b=O9RMCW7pIhVMWIkn1dczYHKWZL
	sGFnuPrDDgTqbpICELfu8JMZvk6miVQi990D32UfH8V6NDPicT8He9baAKZizyPl9JRrUS2y0JZn3
	07SPMctlyQ/+PevRLBWDqv4xbc2Pg2hG9J1lXAwOfiO9eBqo3epRhUVitPhrrNI0OuA8pRFt0uW48
	wKJ+eTVwoKXWnlYB6ITNj09gS+OHBEYcJtDXFholJ410CPljh/q7R4ClJFbqjBpSqCO0qPxipPVC1
	edgPZXcxfh2vL1onnzp2vy6dgFrI69mvbsqedu60dWTQO9F3tU3FZGTftmFsU5rYE4ZDZkQ/vI8YU
	PupadHIQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1woinq-000000051Ag-1JMb;
	Tue, 28 Jul 2026 14:29:10 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66SES6Wd83929826, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1785248886; bh=WFfmw9W1CGI7bVBj6Fu7J5hVInrnU5SIjbVdKTqOB6w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=GqfLU/FrxhvhXa4Fse9+wIlcYYLr9ty+iYnuH6DPjY5z9nqKqPyWVBw/fRKosCBAM
	 BUse9OBC6wQS3T75gyphYgcMiXc8yOEU0IftjerhnNxXBe0mUN+PoVh/pDR1KOisGw
	 MdXp/9z96h5clJCeuehPQjVK/aycPGT45RlO7FrHziulPPMpTGLat4JruE5SDovgfM
	 J6hHQrLYc9AsMW+QVfbhVaeL97uOUYTQcoXUJ9PCM+YZfG7THc/WXwjCkofa5HqvsR
	 OZb+w0iuVWwtM/zD54HXVGBlPNMthVm51+UXm+xqb4UN/fEaCeIM46lu2Fubseo1s4
	 z2HF3l5q+ro4A==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66SES6Wd83929826
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 28 Jul 2026 22:28:06 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 28 Jul 2026 22:28:06 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 28 Jul 2026 22:28:06 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
	<cylee12@realtek.com>, <jyanchou@realtek.com>, <bmasney@redhat.com>
CC: <afaerber@suse.com>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v11 00/11] clk / reset: realtek: Add RTD1625 clock and reset support
Date: Tue, 28 Jul 2026 22:27:55 +0800
Message-ID: <20260728142806.1954638-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_152907_069993_D4CB4EA2 
X-CRM114-Status: GOOD (  14.42  )
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

Hello,

This patch series adds the clock and reset controller support for Realtek's
RTD1625 SoC platform.

Because the reset controllers share the same register space with the
clock controllers on this platform, we utilize the Auxiliary Bus framework
to decouple them. The clock controllers act as the primary devices,
registering the reset controllers as auxiliary devices.

To make it easier for maintainers to review, the series has been organized
by subsystem:

1. Device Tree Bindings:
   - Add bindings for the Realtek RTD1625 Clock & Reset Controllers.

2. Reset Subsystem:
   - Introduce the basic Realtek reset infrastructure.
   - Add the RTD1625-CRT and RTD1625-ISO platform reset drivers.

3. Clock Subsystem Infrastructure:
   - Introduce a common probe, and add support for basic clocks including
     PLLs, gate clocks, mux clocks, and MMC-tuned PLLs.

4. Clock Platform Drivers:
   - Add the clock controller drivers for RTD1625-CRT and RTD1625-ISO.
   - These drivers provide the clock sources and instantiate the
     corresponding auxiliary reset devices.

Best regards,
Yu-Chun Lin
---
Changes in v11:
General Changes:
- Add 'rtk_' prefix into struct names and function names.

Patch 1:
- Add clock ID RTD1625_CRT_PLL_VO (144).

Patch 2:
- Update the commit message and Kconfig description.
- Remove unused header and add the header I use.
- Add Reviewed-by tag from Philipp.

Patch 3:
- Remove unnecessary whitespace.
- Replace dev->parent->of_node with dev->of_node.
- Add Reviewed-by tag from Philipp.

Patch 4:
- Remove extra newline.

Patch 8:
- Remove PLL MMC MAINTAINER entry.

Patch 9:
- Add pll_vo fixed-rate clock (634.5 MHz)

Patch 10:
- Drop the unused two MACRO.

v10: https://lore.kernel.org/lkml/20260713155630.3054636-1-eleanor.lin@realtek.com/
v9: https://lore.kernel.org/lkml/20260624112940.3475605-1-eleanor.lin@realtek.com/
v8: https://lore.kernel.org/lkml/20260610080824.255063-1-eleanor.lin@realtek.com/
v7: https://lore.kernel.org/lkml/20260508111641.3192177-1-eleanor.lin@realtek.com/
v6: https://lore.kernel.org/lkml/20260402073957.2742459-1-eleanor.lin@realtek.com/
v5: https://lore.kernel.org/lkml/20260324025332.3416977-1-eleanor.lin@realtek.com/
v4: https://lore.kernel.org/lkml/20260313081100.596224-1-eleanor.lin@realtek.com/
v3: https://lore.kernel.org/lkml/20260122110857.12995-1-eleanor.lin@realtek.com/
v2: https://lore.kernel.org/lkml/20260113112333.821-1-eleanor.lin@realtek.com/
v1: https://lore.kernel.org/lkml/20251229075313.27254-1-eleanor.lin@realtek.com/

Cheng-Yu Lee (9):
  reset: Add Realtek basic reset support
  reset: realtek: Add RTD1625 reset controller driver
  clk: realtek: Introduce a common probe()
  clk: realtek: Add support for phase locked loops (PLLs)
  clk: realtek: Add support for gate clock
  clk: realtek: Add support for mux clock
  clk: realtek: Add support for MMC-tuned PLL clocks
  clk: realtek: Add RTD1625-CRT clock controller driver
  clk: realtek: Add RTD1625-ISO clock controller driver

Yu-Chun Lin (2):
  dt-bindings: clock: Add Realtek RTD1625 Clock & Reset Controller
  arm64: dts: realtek: Add clock support for RTD1625

 .../bindings/clock/realtek,rtd1625-clk.yaml   |  58 ++
 MAINTAINERS                                   |  12 +
 arch/arm64/boot/dts/realtek/kent.dtsi         |  33 +
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/realtek/Kconfig                   |  48 ++
 drivers/clk/realtek/Makefile                  |  12 +
 drivers/clk/realtek/clk-pll-mmc.c             | 434 ++++++++++
 drivers/clk/realtek/clk-pll.c                 | 217 +++++
 drivers/clk/realtek/clk-pll.h                 |  60 ++
 drivers/clk/realtek/clk-regmap-gate.c         |  70 ++
 drivers/clk/realtek/clk-regmap-gate.h         |  65 ++
 drivers/clk/realtek/clk-regmap-mux.c          |  41 +
 drivers/clk/realtek/clk-regmap-mux.h          |  43 +
 drivers/clk/realtek/clk-rtd1625-crt.c         | 802 ++++++++++++++++++
 drivers/clk/realtek/clk-rtd1625-iso.c         | 145 ++++
 drivers/clk/realtek/clk-rtk-common.c          |  69 ++
 drivers/clk/realtek/clk-rtk-common.h          |  37 +
 drivers/clk/realtek/freq_table.c              |  57 ++
 drivers/clk/realtek/freq_table.h              |  22 +
 drivers/reset/Kconfig                         |   1 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/realtek/Kconfig                 |  19 +
 drivers/reset/realtek/Makefile                |   3 +
 drivers/reset/realtek/reset-rtd1625.c         | 262 ++++++
 drivers/reset/realtek/reset-rtk-common.c      |  73 ++
 drivers/reset/realtek/reset-rtk-common.h      |  29 +
 .../dt-bindings/clock/realtek,rtd1625-clk.h   | 165 ++++
 include/dt-bindings/reset/realtek,rtd1625.h   | 171 ++++
 29 files changed, 2951 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/realtek,rtd1625-clk.yaml
 create mode 100644 drivers/clk/realtek/Kconfig
 create mode 100644 drivers/clk/realtek/Makefile
 create mode 100644 drivers/clk/realtek/clk-pll-mmc.c
 create mode 100644 drivers/clk/realtek/clk-pll.c
 create mode 100644 drivers/clk/realtek/clk-pll.h
 create mode 100644 drivers/clk/realtek/clk-regmap-gate.c
 create mode 100644 drivers/clk/realtek/clk-regmap-gate.h
 create mode 100644 drivers/clk/realtek/clk-regmap-mux.c
 create mode 100644 drivers/clk/realtek/clk-regmap-mux.h
 create mode 100644 drivers/clk/realtek/clk-rtd1625-crt.c
 create mode 100644 drivers/clk/realtek/clk-rtd1625-iso.c
 create mode 100644 drivers/clk/realtek/clk-rtk-common.c
 create mode 100644 drivers/clk/realtek/clk-rtk-common.h
 create mode 100644 drivers/clk/realtek/freq_table.c
 create mode 100644 drivers/clk/realtek/freq_table.h
 create mode 100644 drivers/reset/realtek/Kconfig
 create mode 100644 drivers/reset/realtek/Makefile
 create mode 100644 drivers/reset/realtek/reset-rtd1625.c
 create mode 100644 drivers/reset/realtek/reset-rtk-common.c
 create mode 100644 drivers/reset/realtek/reset-rtk-common.h
 create mode 100644 include/dt-bindings/clock/realtek,rtd1625-clk.h
 create mode 100644 include/dt-bindings/reset/realtek,rtd1625.h

-- 
2.43.0


