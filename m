Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7DBCA5FD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 07:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g2nQCEM3gDeJGvqRr7JC/m2BFU1UygahQMSW9jrruUQ=; b=vkLGBOiE5ebEn+wArp3g+clW77
	GvePnDW02940+yS1mnoXgsrJkK+Js5694uBrFINNe6OYoqxIwknLKBK1fGCXQ/kAp184KLL4MnykY
	bPLzgP5Afz6RfmtMxtbI4uspPIcqYNvUEX02eRPTB2OCnMFxVUCACVFE0F8wfojn5hUet+HaSOImI
	meqlzKj8YCk5b3uzt8sCKqPZXeGOw4gTU3cd3wL52hzhVDqzcNkcs4cIHSrljgQb1gRxFcyyZCwmP
	cZll9gvSfn4qBFy9pdlyipid9504uWith1IQfgu1Qy2QeNBXkZphWtBoOVTOhoU5FRWP7ka72Gcw3
	cd0wcl3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXwK-0000000AsSW-0eHw;
	Fri, 02 Oct 2026 07:44:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXwH-0000000AsQu-2Bwn;
	Fri, 02 Oct 2026 07:44:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=g2nQCEM3gDeJGvqRr7JC/m2BFU1UygahQMSW9jrruUQ=; b=QqBA9PxjnUF2w+AZm7hj3XqbkY
	v9RF0hgOPDct3q/JKUHxAaxMQ/DbcWuIl/SiRPFxi8n/dBvqRKgpFgyo2c/evLgd3g6uomz20LsaW
	rKBEsvdEYHu3wUrbPa8JKYUdUBfPfha5Xv9yD9ub6cdrw7tb330+6qDtAii0MkZmnsK7q8OnVNGRa
	/wbqiOpwNoyC8XcRGvBBmheEcVjb2+tZWa0ScCit9ZoJKvnbO5eyLXwhoe6AqW+lg18N+dZGtxkvK
	+zIPI2T6M4gJPjRHuxwseqqdQJIOl5MO6HowKaJWhPu115OsezV/Vw6wF21FYKfneqWoXvLA+gjmQ
	W9AtIkZQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCXwC-00000005gko-3J61;
	Fri, 02 Oct 2026 07:44:15 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6927hlqF73646795, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1790927027; bh=g2nQCEM3gDeJGvqRr7JC/m2BFU1UygahQMSW9jrruUQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=jRVYFUK5YnoRmiNDeKklzZ1pdgInsSTd9LlydFTjxUV5OrE/HYOAnw2MLeTp8PncV
	 tFvJt3/CO+lLhssxlnVZWvaL29a1KffXYQVOsG9HkLzynokJeqILy5s5YbVi7wcdya
	 9ejE0ogtij8iq1ZBreAnB75V/B0sCnLu2/+e/+PfxJq73g2YndDyv/5lQUGGt7kJGJ
	 hCxqHMZGe1Smk+/zWye7PrNAttAqySW04bbbLegGNAjNXSBnBqhjNWTzFmZbgg7oR9
	 b2gwpm3FPsNRjZt1D4kjdYBVCC7EvJ67rV0RbX3ntd/QSc1O2G3NKOnf9poR6xB+9c
	 RruxXEJatF9Pg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6927hlqF73646795
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 Oct 2026 15:43:47 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 15:43:46 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 15:43:31 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Fri, 2 Oct 2026 15:43:31 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <jbrunet+clk@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>,
	<bmasney+clk@redhat.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v15 00/11] clk / reset: realtek: Add RTD1625 clock and reset support
Date: Fri, 2 Oct 2026 15:43:20 +0800
Message-ID: <20261002074331.3066919-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_084413_755785_9304E829 
X-CRM114-Status: GOOD (  16.44  )
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
Changes in v15:
Patch 1 :
- Add macros for RTD1625_CRT_PLL_VODMA and RTD1625_CRT_CLK_DDSA_DIV4.

Patch 4:
- Remove reset-related configurations.
- Switch the registration order of clock and reset controllers.

Patch 6:
- Improve commit message and add inline comments for the write-enable
mechanism.
- Add common helpers 'rtk_clk_regmap_gate_enable()' and
'rtk_clk_regmap_gate_disable()'.

Patch 7:
- Simplify 'rtk_clk_regmap_mux_get_parent()' to return the result
directly.

Patch 9 & 10:
- Assign parents to gate clocks.
- Add a read-only hardware PLL 'pll_vodma' and a fixed-factor clock
'clk_ddsa_div4'.

v14: https://lore.kernel.org/lkml/20260901072446.2563145-1-eleanor.lin@realtek.com/
v13: https://lore.kernel.org/lkml/20260812020009.3480538-1-eleanor.lin@realtek.com/
v12: https://lore.kernel.org/lkml/20260804163807.1285869-1-eleanor.lin@realtek.com/
v11: https://lore.kernel.org/lkml/20260728142806.1954638-1-eleanor.lin@realtek.com/
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
  clk: realtek: Introduce common probe()
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
 MAINTAINERS                                   |  10 +
 arch/arm64/boot/dts/realtek/kent.dtsi         |  33 +
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/realtek/Kconfig                   |  45 +
 drivers/clk/realtek/Makefile                  |  12 +
 drivers/clk/realtek/clk-pll-mmc.c             | 430 +++++++++
 drivers/clk/realtek/clk-pll.c                 | 217 +++++
 drivers/clk/realtek/clk-pll.h                 |  60 ++
 drivers/clk/realtek/clk-regmap-gate.c         |  64 ++
 drivers/clk/realtek/clk-regmap-gate.h         |  65 ++
 drivers/clk/realtek/clk-regmap-mux.c          |  38 +
 drivers/clk/realtek/clk-regmap-mux.h          |  43 +
 drivers/clk/realtek/clk-rtd1625-crt.c         | 822 ++++++++++++++++++
 drivers/clk/realtek/clk-rtd1625-iso.c         | 140 +++
 drivers/clk/realtek/clk-rtk-common.c          |  84 ++
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
 .../dt-bindings/clock/realtek,rtd1625-clk.h   | 166 ++++
 include/dt-bindings/reset/realtek,rtd1625.h   | 171 ++++
 29 files changed, 2964 insertions(+)
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


