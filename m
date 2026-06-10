Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97952CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IQnFaF4NRs1UaZKis68uVWMcUMSsrG8UNXI9EoY6F7c=; b=nrfuh1vPU/4zkttjjSWuvtEMzY
	45AUMJ7KvlgA/Z/lawUo48/C8kC+WnTdJPpz/DIuHpAFr0arMOTTE9c301O8Z3fiu420GwSyBYNGF
	ypJqErXSoJ24T74w1JAkRPRzfRnCYN/0DR7SjFkzmNiRC9Dx8a+C+h7dB43Hf/8EUF1yzNhJ5mQdt
	JcnQSp+YZteyyaFpAS4IjdUTF6E2msnCGbI8G2gfMmUten3Xtf3g2sfBrlotcp16IV0TwNS9UgaQ+
	UBlhCtLy8apzU5rVFfalHHCd3TFsG4VlmOBznTS92kt2k8j1OfjngZkp6CV4rsfx1C7fb41+M5BTM
	e2SSjwHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDzw-000000071Do-0mT8;
	Wed, 10 Jun 2026 08:09:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDzs-000000071Bh-0pxf;
	Wed, 10 Jun 2026 08:09:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=IQnFaF4NRs1UaZKis68uVWMcUMSsrG8UNXI9EoY6F7c=; b=gA9q6M2AZh0226NLPjz4A2/qbh
	WpKhkDo6gwijSQc//O6e+yP3iS+WV0f6b86jTQggpJasTisBq3zk/jcdgHqk6ymzWNVA5NU4cKm+f
	nfF+jxa/kVW2FMbQDruOUtXFzn8LbEaSlIKfvaInwpw32lJ2OzrE1uMAIq63bVXYm8Gyol+LmpYYK
	OmxhXP4RnBJT6Wglo5MdQgSvKGmSmBoz1KZB18Vygps1+up3Ps4UR1DqmWufA9G7t76WCssi4dxf3
	DqWWJsY8qTzosemPdT7WB6c22oCFRAaXzcTNU9N7AiHidHfV5ZBSyQOO1ZR23x4sovAdD/WQafsCp
	CPMViHvg==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wXDzk-00000003b0m-0HkB;
	Wed, 10 Jun 2026 08:09:08 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 65A88PvjC983531, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1781078905; bh=IQnFaF4NRs1UaZKis68uVWMcUMSsrG8UNXI9EoY6F7c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=m+NfrXTxadkmql6sZS3TWLnlF9HZCwHab36SR1jXca9ybUkn5XC9MRmQnWIk8FolU
	 A1FkoMoQ/whXh9W74b8bQUsvnl7M+rgMXJ6YEU6SvmLK5+NFw64HbEAfQbotouNSpa
	 3FmqTpIpO1m7Ey6c/hwMHwfZINalYGkVvJLhTl4WoZoWPOh1Sb05fpIf5/S9o3pd3X
	 +EEVaQOF+kBAlZd7CjSa7y45oZqcEDoPQyOsfRYPAay/hUZTUW5g9bm+T/AuiMrPyU
	 TceEZlNVg2VTd+yHFUqKbsVRUehC7gZe0IwRsta1XDXQG0TDD1zVmwDkLoMUwnhlJl
	 cPNcujvpLSdMA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 65A88PvjC983531
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 10 Jun 2026 16:08:25 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Jun 2026 16:08:25 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS03.realtek.com.tw
 (10.21.1.53) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 10 Jun 2026 16:08:25 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <bmasney@redhat.com>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v8 00/10] clk: realtek: Add RTD1625 clock support
Date: Wed, 10 Jun 2026 16:08:14 +0800
Message-ID: <20260610080824.255063-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_090905_771240_EF9460A7 
X-CRM114-Status: GOOD (  15.99  )
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
Changes in v8:

Patch 3:
- Add depends on RESET_CONTROLLER and select MFD_SYSCON for config
RTK_CLK_COMMON
- Fix error handling for devm_auxiliary_device_create()

Patch 4:
- Reduce the timeout value in regmap_read_poll_timeout_atomic() from 2000ms to
500ms to avoid prolonged busy-waiting and prevent triggering the NMI Watchdog
- Remove 'freq_ready_valid' and add comments to clarify that register offset 0
is never a valid address on Realtek SoCs, meaning it is not configured
- Add the missing spin_unlock_irqrestore() when regmap_read() fails

Patch 6:
- In clk_regmap_mux_get_parent(), return 0xff instead of 0 to properly indicate
an error
- In clk_regmap_mux_set_parent(), cast index to u32 to avoid signed integer
- overflow

Patch 7:
- Fix the mask shift in set_phrt0()
- For better safety and readability, modify pointer comparison for phase_id
- In clk_pll_mmc_recalc_rate(), return 0 instead of an error code upon failure

Patch 8 & 9:
- Remove the trailing NULL element ([RTD1625_XX_CLK_MAX] = NULL) from the
clk_hw_onecell_data arrays
- Add MODULE_DEVICE_TABLE(of, ...) for the tristate config
- Add  '.suppress_bind_attrs = true', to avoid handling pointer problem, cause
clock should not allow to manually disable by users
- Fix a typo

Patch 10:
- Sort device nodes by unit address

v7: https://lore.kernel.org/lkml/20260508111641.3192177-1-eleanor.lin@realtek.com/

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
 drivers/clk/realtek/Kconfig                   |  48 ++
 drivers/clk/realtek/Makefile                  |  13 +
 drivers/clk/realtek/clk-pll-mmc.c             | 459 ++++++++++
 drivers/clk/realtek/clk-pll.c                 | 209 +++++
 drivers/clk/realtek/clk-pll.h                 |  60 ++
 drivers/clk/realtek/clk-regmap-gate.c         |  70 ++
 drivers/clk/realtek/clk-regmap-gate.h         |  65 ++
 drivers/clk/realtek/clk-regmap-mux.c          |  41 +
 drivers/clk/realtek/clk-regmap-mux.h          |  43 +
 drivers/clk/realtek/clk-rtd1625-crt.c         | 792 ++++++++++++++++++
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
 30 files changed, 2985 insertions(+)
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
2.43.0


