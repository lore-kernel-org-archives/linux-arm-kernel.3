Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86F5E7491C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 05:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0JA5zElQ0y7tpR6Gdr4GuuKm83vrvl7i/h+Klm6fB+Y=; b=OFKZbeToMy2WR2
	YM5xJXFZDsuPaqWs1/k6FXz2ducEhAwCisk1pe11W9cOEIGkCfP1iZUONrSEOL5nZMkhCvxlTofjW
	5DEtrbme0P0LinCNPDK0Um/jgKLyu92Ps36JJ5BjX9tRsZOUT7vXfXkkpLxUjFR3TjPofjq7+RnDR
	cPtiqpXe3EkexIN4HKhRf/3Vl7pImaq+i8x6ev+oSPCcYrQWQmsRJMWzmom2i/aJ16m1HcT07zdn/
	VXtxLf/cpyqhRljVtBK/ZFc0G2+f3Z4Ms5NsEJKmtHmz9TusioYVFhigQvn2KFPgUU4XUYRkv1Gyf
	wBHxzhuvn4LfPZpRIqLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYHZ5-0000000GReo-2nVQ;
	Wed, 24 Dec 2025 05:37:39 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYHZ2-0000000GRdc-3aC8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 05:37:38 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 24 Dec
 2025 13:37:23 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 24 Dec 2025 13:37:23 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: [PATCH v16 0/3] Add support for AST2700 clk driver
Date: Wed, 24 Dec 2025 13:37:21 +0800
Message-ID: <20251224-upstream_clk-v16-0-8c1318f56c3c@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABF8S2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDM10FJSSM
 xLz0lN1M1OAAkpGBkamhkZGxrqlBcUlRamJufHJOdm6FuZmJpaJiUmGFimJSkAtBUWpaZkVYPO
 iY2trAeMGfoJfAAAA
X-Change-ID: 20251223-upstream_clk-87649aab18da
To: Brian Masney <bmasney@redhat.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>
CC: <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	"Ryan Chen" <ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766554643; l=7782;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=ib/Oy8qRtohZwWwB1efICR1YhSExrYIChzuEkdcOkhU=;
 b=U+3ijaB6+vKzSU+sak5Jk8TKDmKv0XdhEJUuCuuSCo/IefFKiu9h8qSZTyJIuSJZVtqg4WDWZ
 3KkvZe3Q1kxACk6nYXbnCROZkiK6g4Y8O10QltGof/RUJQbLH5OlJdJ
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_213736_904524_3AD4B0D9 
X-CRM114-Status: GOOD (  12.16  )
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

This patch series is add clk driver for AST2700.

AST2700 is the 8th generation of Integrated Remote Management Processor
introduced by ASPEED Technology Inc. Which is Board Management controller
(BMC) SoC family. AST2700 have two SoC connected, one is SoC0, another
is SoC1, it has it's own scu, this driver inlcude SCU0 and SCU1 driver.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
Changes in v16
- clk/aspeed: move existing ASPEED clk drivers to drivers/clk/aspeed subdirectory
- MAINTAINERS: Add ASPEED clock drivers entry
- Link to v15: https://lore.kernel.org/all/20251010072540.666673-1-ryan_chen@aspeedtech.com/

Changes in v15:
- clk-ast2700.c
- remove #include <linux/of_platform.h>.
- use inline 12MHZ, 24MHZ, 25MHZ, 192MHZ define.
- use clk_hw pointers, index member instead of .fw_name and .name members.
- use module_platform_driver().
- Link to v14: https://lore.kernel.org/all/20250917020539.3690324-1-ryan_chen@aspeedtech.com/

Changes in v14:
- patch (3/3) : remove duplcate Signed-off-by.
-Link to v13: https://lore.kernel.org/all/20250912052231.1944937-1-ryan_chen@aspeedtech.com/

Changes in v13:
- clk-ast2700.c
 - remove unnecessary ().
 - refine ast2700_soc1_configure_i3c_clk to be easy readable.
-Link to v12: https://lore.kernel.org/all/20250708052909.4145983-1-ryan_chen@aspeedtech.com/

Changes in v12:
-fix mistakes commit message Acked-by:Krzysztof Kozlowski
<krzysztof.kozloski@linaro.org> to Acked-by: Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org>
-Link to v11: https://lore.kernel.org/all/20250707011826.3719229-1-ryan_chen@aspeedtech.com/

Changes in v11:
-update patch(1/3) commit message subject prefix dt-binding: to dt-bindings:
-Link to v10: https://lore.kernel.org/all/20250611073139.636724-1-ryan_chen@aspeedtech.com/

Changes in v10:
-aspeed,ast2700-scu.h:
-add SOC0_CLK_AHBMUX, SOC0_CLK_MPHYSRC, SOC0_CLK_U2PHY_REFCLKSRC,
 SOC1_CLK_I3C.
-clk-ast2700.c
-add #include <linux/auxiliary_bus.h>
-remove #include <soc/aspeed/reset-aspeed.h>
-use devm_auxiliary_device_create replace aspeed_reset_controller_register
-reset-aspeed.c:
-remove aspeed_reset_unregister_adev, aspeed_reset_adev_release,
 aspeed_reset_controller_register.
-compatible name change reset_aspeed.reset0/1 -> clk_ast2700.reset0/1
-remove reset-aspeed.h
-Link to v9: https://lore.kernel.org/all/20250224095506.2047064-1-ryan_chen@aspeedtech.com/

Changes in v9:
-aspeed,ast2700-scu.h: no change.
add more clear commit description.
-clk-ast2700.c:
add inlcude bitfield.h
remove redundant clk_parent_data soc0_mpll_div8/soc0_ahb/uart13clk/
uart14clk/uart15clk/uart16clk/soc1_ahb/d_clk_sels
-Link to v8: https://lore.kernel.org/all/20250210085004.1898895-1-ryan_chen@aspeedtech.com/

Changes in v8:
-aspeed,ast2700-scu.h: remove no use soc0 clock, add new clock
-clk-ast2700.c: remove include <linux/auxiliary_bus.h>,
include <linux/clk-provider.h>, include <linux/of_address.h>
-clk-ast2700.c: add include <linux/mod_devicetable.h>
-clk-ast2700.c: modify include <soc/aspeed/reset-aspeed.h> order before
dt-bindings
-clk-ast2700.c: modify define to be tabbed out space
-clk-ast2700.c: add union struct for each clk type
        union {
                struct ast2700_clk_fixed_factor_data factor;
                struct ast2700_clk_fixed_rate_data rate;
                struct ast2700_clk_gate_data gate;
                struct ast2700_clk_div_data div;
                struct ast2700_clk_pll_data pll;
                struct ast2700_clk_mux_data mux;
        } data;
-clk-ast2700.c: modify clk_data = device_get_match_data(dev);
-clk-ast2700.c: modify builtin_platform_driver_probe to
arch_initcall(clk_ast2700_init)
-clk-ast2700.c: ast2700_clk_hw_register_hpll explain: scu010[4:2],
scu010[4:2] = 010, hpll force 1.8Ghz
scu010[4:2] = 011, hpll force 1.7Ghz
scu010[4:2] = 110, hpll force 1.2Ghz
scu010[4:2] = 111, hpll force 800Mhz
others depend on hpll parameter register setting.
-Link to v7: https://lore.kernel.org/all/20241028053018.2579200-1-ryan_chen@aspeedtech.com/

Changes in v7:
-reset-aspeed.h: fix declare static inline aspeed_reset_controller_register
if the function is not used.
-Link to v6: https://lore.kernel.org/all/20241023090153.1395220-1-ryan_chen@aspeedtech.com/

Changes in v6:
-patch-2: add reset-aspeed.h
-reset-aspeed: add include cleanup.h for guard()
-reset-aspeed: change ids name clk_aspeed to reset_aspeed
-reset-aspeed: move aspeed_reset_controller_register,
aspeed_reset_adev_release, aspeed_reset_unregister_adev from clk-ast2700.c
-reset-aspeed: drop base check, since it check in clk-ast2700.c
-clk-ast2700: sync each gate name from *clk to *clk-gate name.
-clk-ast2700: add CLK_GATE_ASPEED to diff clk_hw_register_gate and
ast2700_clk_hw_register_gate.
-Link to v5: https://lore.kernel.org/all/20241009060521.2971168-1-ryan_chen@aspeedtech.com/

Changes in v5:
-patch-2 Kconfig: add select AUXILIARY_BUS
-reset-aspeed: #define to_aspeed_reset(p) turn into static inline function.
-reset-aspeed: modify spin_lock_irqsave to guard(spinlock_irqsave)
-reset-aspeed: remove unnecessary parentheses.
-clk-ast2700: use <linux/units.h> and refrain from define clk
-Link to v4: https://lore.kernel.org/all/20240923075012.2264573-1-ryan_chen@aspeedtech.com/

Changes in v4:
-yaml: keep size-cells=<1>.
-merge clk,reset dt binding header with yaml the same patch.
-rename clk,reset dt binding header to aspeed,ast2700-scu.h
-reset-aspeed: update tables tabs sapces to consistent spaces.
-reset-aspeed: remove no use dev_set_drvdata.
-clk-ast2700: modify reset_name to const int scu in struct clk_data.
-clk-ast2700: use scu number in clk_data generate reset_name for reset
 driver register.
-clk-ast2700: fix pll number mix up scu0,scu1.
-clk-ast2700: update dt-binding clock include file.
-Link to v3: https://lore.kernel.org/all/20240916091039.3584505-1-ryan_chen@aspeedtech.com/

Changes in v3:
-yaml: v2 missing send yaml patch, v3 add.
-yaml: drop 64bits address example.
-yaml: add discription about soc0 and soc1
-dt-bindings: remove (), *_NUMS, reserved.
-dt-bindings: remove dulipated define number.
-dt-bindings: merge clk and reset to be one patch.
-reset-aspeed: add auxiliary device for reset driver.
-clk-ast2700: modify reset to be auxiliary add.
-clk-ast2700: modify to be platform driver.
-clk-ast2700: modify each clk to const clk array.
-Link to v2: https://lore.kernel.org/all/20240828062740.1614744-1-ryan_chen@aspeedtech.com/

Changes in v2:
-yaml: drop 64bits address example.
-yaml: add discription about soc0 and soc1
-dt-bindings: remove (), *_NUMS, reserved.
-dt-bindings: remove dulipated define number
-clk-ast2700: drop WARN_ON, weird comment.
-Link to v1: https://lore.kernel.org/all/20240808075937.2756733-1-ryan_chen@aspeedtech.com/

---
Ryan Chen (3):
      clk: aspeed: Move the existing ASPEED clk drivers into aspeed subdirectory.
      MAINTAINERS: Add entry for ASPEED clock drivers.
      clk: aspeed: add AST2700 clock driver

 MAINTAINERS                            |    9 +
 drivers/clk/Kconfig                    |   13 +-
 drivers/clk/Makefile                   |    3 +-
 drivers/clk/aspeed/Kconfig             |   21 +
 drivers/clk/aspeed/Makefile            |    4 +
 drivers/clk/{ => aspeed}/clk-aspeed.c  |    0
 drivers/clk/{ => aspeed}/clk-aspeed.h  |    0
 drivers/clk/{ => aspeed}/clk-ast2600.c |    0
 drivers/clk/aspeed/clk-ast2700.c       | 1055 ++++++++++++++++++++++++++++++++
 9 files changed, 1091 insertions(+), 14 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251223-upstream_clk-87649aab18da

Best regards,
-- 
Ryan Chen <ryan_chen@aspeedtech.com>


