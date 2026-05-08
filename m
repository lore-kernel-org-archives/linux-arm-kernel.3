Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E23FCD37AD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 11:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YbnRwB2CcsgCrELUiDRilOMpVZJDmLp88GIu61sBrVg=; b=CqS/ZjEUt8mQclAJV4isTrg0wY
	RkIz77RSKqDFInMBWBRDgiTc+oVQq11lPKdBao0/3ehRcWfU1pvmpkFK750NIwWgEpwBVFq7REONT
	L7IeCCOQc7Br8Pn52QnBOWQYqrcDtj8V8G3oCnln6bH6pQ7lhPdYJdSOoXLJy1nONNVsFeVi5NWBx
	u9cfbql8hgPZCyaB0NsGkFcjbbzGSDHRiB9KkIynIjt/ZKMcjNEPq34iqP69AvZBSDmY+JfUh8bPZ
	hTkWchaGBPLdf1dnLGvqqOEcOmqFEklcF7EecYXxCD5D7GhpOCccR/By46GwQj+hnadMc0yj2Hp9T
	m78kgwCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJDU-00000006Jq3-23hy;
	Fri, 08 May 2026 11:18:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJDQ-00000006Jlk-2JzE;
	Fri, 08 May 2026 11:17:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=YbnRwB2CcsgCrELUiDRilOMpVZJDmLp88GIu61sBrVg=; b=XOb0fOVRjdhXLUoM9I9P8VqHh+
	Pm7uROGoi6UzVHTTz5SZDln44haC5z1FltLypcxO0UFaH7WrRiQcYfyh3PXIh2QkiMIYr24i6HQNG
	pRIathcyT5UJ2lsx9rOAZUDEytFnL8lsnUlHGUjpaiAQe117D42KToUzJ5qJB3nRw+5bbMi38nVIu
	u2xC4tBvWuVI6jvpGUXMkkaAmB0M8B4N8NG5PO0xG9H2r/t613OS/PLsyRVrCdMvnaKwHb3M/6lho
	vhZuJobEIks0WbV6GYx4wOWHiA+78gF6feyTDC+4DerJ4kjSP2MboTUdqGdg3jaZ8b+CE4dFzyOvc
	ULohZvfw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJDK-000000062XV-0yKC;
	Fri, 08 May 2026 11:17:54 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 648BGgV423763937, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1778239002; bh=YbnRwB2CcsgCrELUiDRilOMpVZJDmLp88GIu61sBrVg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=M/o+JZiN6xVWjQvd/+SGLgoBAEXS9udcBLo5PHr87jTxzpkcbWIvQZuJmvJv6vIba
	 mydpiqwGwelgxoZdAKbNEoKnCSVpwR03EeFPDUbVju+u9hBAcOh3Qy1bjf+ux11ZP8
	 V9vZNgZ2NNmEsajaK4VIL++ThVtvlYqGZnFVES2Yj+2l+S+75MRYIMAPWGkEHZbmKa
	 VaW3ZVFlw5pd62VJmcOgSvTZQQ3be4kuu5hbNBimDwXTJ40+tLs5NvsOUX9VMlga0r
	 qCs4YXeNUfiidBh/JgP8FL+Kv6WtDQWgQLFgPvdyktTXPeWKGEKJbKadTUCHvoGOYE
	 6DkFDH4MQwWiQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.27/5.94) with ESMTPS id 648BGgV423763937
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 May 2026 19:16:42 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 8 May 2026 19:16:42 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 8 May 2026 19:16:42 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 8 May 2026 19:16:41 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <bmasney@redhat.com>
Subject: [PATCH v7 00/10] clk: realtek: Add RTD1625 clock support
Date: Fri, 8 May 2026 19:16:31 +0800
Message-ID: <20260508111641.3192177-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_121751_277205_69C8625C 
X-CRM114-Status: GOOD (  14.21  )
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

This patch series adds clock support for Realtek's RTD1625 platform.
The series includes:
1. Device Tree: Add clock controller nodes.
2. Infrastructure: reset controller, basic clocks, PLLs, gate clocks, mux
clocks, and MMC-tuned PLLs.
3. Platform drivers: two clock controller drivers for RTD1625-CRT and
RTD1625-ISO.

Best regards,
Yu-Chun Lin
---
Changes in v7:

General:
- Update copyright year to include 2026.
- Use EXPORT_SYMBOL_NS_GPL() instead of EXPORT_SYMBOL_GPL().
- Add missing header inclusions to follow the "Include What You Use" principle.
- Sort header inclusions in alphabetical order.
- Sort local variables in reverse Christmas tree order.
- Add const qualifiers where appropriate.
- Fix coding style issues.

Patch 2:
- Move data->rcdev.owner = THIS_MODULE to the caller.
- Make config build-testable with COMPILE_TEST.
- Retrieve regmap via platform data.
- Append the U suffix to constants to prevent integer overflow.

Patch 3:
- Pass regmap as platform data.
- Replace dev_warn() with dev_err_probe() for clock hardware registration
failures.

Patch 4:
- Add a spinlock to synchronize PLL operations (clk_pll_disable,
clk_pll_is_enabled, clk_pll_enable, clk_pll_recalc_rate, clk_pll_set_rate).
- Remove unused macros and move IS_FREQ_TABLE_END to the specific file
where it is used.

Patch 6:
- Remove unused rtk_clk_regmap_mux_ro_ops.

Patch 7:
- Fix incorrect usage of the BIT() macro.
- Return immediately upon encountering the first error instead of accumulating
return values using bitwise OR.

Patch 8 & 9:
- Add locking to synchronize PLL changes.
- Set module owner in the specific driver.

v6: https://lore.kernel.org/lkml/20260402073957.2742459-1-eleanor.lin@realtek.com/

Cheng-Yu Lee (8):
  reset: Add Realtek basic reset support
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
 MAINTAINERS                                   |  20 +
 arch/arm64/boot/dts/realtek/kent.dtsi         |  33 +
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/realtek/Kconfig                   |  46 +
 drivers/clk/realtek/Makefile                  |  13 +
 drivers/clk/realtek/clk-pll-mmc.c             | 453 ++++++++++
 drivers/clk/realtek/clk-pll.c                 | 201 +++++
 drivers/clk/realtek/clk-pll.h                 |  61 ++
 drivers/clk/realtek/clk-regmap-gate.c         |  70 ++
 drivers/clk/realtek/clk-regmap-gate.h         |  65 ++
 drivers/clk/realtek/clk-regmap-mux.c          |  41 +
 drivers/clk/realtek/clk-regmap-mux.h          |  43 +
 drivers/clk/realtek/clk-rtd1625-crt.c         | 791 ++++++++++++++++++
 drivers/clk/realtek/clk-rtd1625-iso.c         | 151 ++++
 drivers/clk/realtek/common.c                  |  66 ++
 drivers/clk/realtek/common.h                  |  37 +
 drivers/clk/realtek/freq_table.c              |  38 +
 drivers/clk/realtek/freq_table.h              |  16 +
 drivers/reset/Kconfig                         |   1 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/realtek/Kconfig                 |  19 +
 drivers/reset/realtek/Makefile                |   3 +
 drivers/reset/realtek/common.c                |  90 ++
 drivers/reset/realtek/common.h                |  29 +
 drivers/reset/realtek/reset-rtd1625-crt.c     | 187 +++++
 drivers/reset/realtek/reset-rtd1625-iso.c     |  99 +++
 .../dt-bindings/clock/realtek,rtd1625-clk.h   | 164 ++++
 include/dt-bindings/reset/realtek,rtd1625.h   | 171 ++++
 30 files changed, 2969 insertions(+)
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
 create mode 100644 drivers/clk/realtek/common.c
 create mode 100644 drivers/clk/realtek/common.h
 create mode 100644 drivers/clk/realtek/freq_table.c
 create mode 100644 drivers/clk/realtek/freq_table.h
 create mode 100644 drivers/reset/realtek/Kconfig
 create mode 100644 drivers/reset/realtek/Makefile
 create mode 100644 drivers/reset/realtek/common.c
 create mode 100644 drivers/reset/realtek/common.h
 create mode 100644 drivers/reset/realtek/reset-rtd1625-crt.c
 create mode 100644 drivers/reset/realtek/reset-rtd1625-iso.c
 create mode 100644 include/dt-bindings/clock/realtek,rtd1625-clk.h
 create mode 100644 include/dt-bindings/reset/realtek,rtd1625.h

-- 
2.34.1


