Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42696CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 07:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kZSdqxwXZFanATvPiLhH6l9a+7fShJ8YgGta7Fu8GJY=; b=yqOOAV3ndquFv4
	owLKD7jGA7NAuJv0km8Xo6ofTj/NmGJmBb5InZAVeTi7G2533UGLVQsXr9LxN1DE7lY9HyGx5BQgF
	CNRrWQFgC4wNfCaJPAPHWsP/ka/ayhSHIcBA5+QOuh4HkjwrK0DbPlmhBaLCVYxHMLo1f/5bd/Xtc
	RvS5AddoZa5Qp4vbvbqbqypywzEiplZY5AI8Ejgsgxl5T44RYyofSqczbnBS55WbQnQav9VVXUh24
	2NHX4WVFUqJej3PPUTmhs5UAfcGZZpN1jc8egUD84EAdyVNQ/oCjWtowQS4RCKv9efDGYpuxPFj/k
	scrGp08kypJFdW2p/aIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v77Vg-00000007rCI-0neZ;
	Fri, 10 Oct 2025 07:25:52 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v77Vd-00000007rBP-3ORM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 07:25:51 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 10 Oct
 2025 15:25:40 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 10 Oct 2025 15:25:40 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: ryan_chen <ryan_chen@aspeedtech.com>, Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Joel Stanley <joel@jms.id.au>,
	"Andrew Jeffery" <andrew@codeconstruct.com.au>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Mo Elbadry
	<elbadrym@google.com>, "Rom Lemarchand" <romlem@google.com>, William
 Kennington <wak@google.com>, "Yuxiao Zhang" <yuxiaozhang@google.com>,
	<wthai@nvidia.com>, <leohu@nvidia.com>, <dkodihalli@nvidia.com>,
	<spuranik@nvidia.com>
Subject: [PATCH v15 0/3] Add support for AST2700 clk driver
Date: Fri, 10 Oct 2025 15:25:37 +0800
Message-ID: <20251010072540.666673-1-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_002549_848674_E189ADBF 
X-CRM114-Status: GOOD (  13.24  )
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

v15:
- clk-ast2700.c
 - remove #include <linux/of_platform.h>.
 - use inline 12MHZ, 24MHZ, 25MHZ, 192MHZ define.
 - use clk_hw pointers, index member instead of .fw_name and .name members.
 - use module_platform_driver().

v14:
- patch (3/3) : remove duplcate Signed-off-by.

v13:
- clk-ast2700.c
 - remove unnecessary ().
 - refine ast2700_soc1_configure_i3c_clk to be easy readable.

v12:
-fix mistakes commit message Acked-by:Krzysztof Kozlowski
<krzysztof.kozloski@linaro.org> to Acked-by: Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org>

v11:
-update patch(1/3) commit message subject prefix dt-binding: to dt-bindings:

v10:
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

v9:
-aspeed,ast2700-scu.h: no change.
add more clear commit description.
-clk-ast2700.c:
add inlcude bitfield.h
remove redundant clk_parent_data soc0_mpll_div8/soc0_ahb/uart13clk/
uart14clk/uart15clk/uart16clk/soc1_ahb/d_clk_sels

v8:
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

v7:
-reset-aspeed.h: fix declare static inline aspeed_reset_controller_register
if the function is not used.

v6:
-patch-2: add reset-aspeed.h
-reset-aspeed: add include cleanup.h for guard()
-reset-aspeed: change ids name clk_aspeed to reset_aspeed
-reset-aspeed: move aspeed_reset_controller_register,
aspeed_reset_adev_release, aspeed_reset_unregister_adev from clk-ast2700.c
-reset-aspeed: drop base check, since it check in clk-ast2700.c
-clk-ast2700: sync each gate name from *clk to *clk-gate name.
-clk-ast2700: add CLK_GATE_ASPEED to diff clk_hw_register_gate and
ast2700_clk_hw_register_gate.

v5:
-patch-2 Kconfig: add select AUXILIARY_BUS
-reset-aspeed: #define to_aspeed_reset(p) turn into static inline function.
-reset-aspeed: modify spin_lock_irqsave to guard(spinlock_irqsave)
-reset-aspeed: remove unnecessary parentheses.
-clk-ast2700: use <linux/units.h> and refrain from define clk

v4:
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

v3:
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

v2:
-yaml: drop 64bits address example.
-yaml: add discription about soc0 and soc1
-dt-bindings: remove (), *_NUMS, reserved.
-dt-bindings: remove dulipated define number
-clk-ast2700: drop WARN_ON, weird comment.

Ryan Chen (3):
  dt-bindings: clock: ast2700: modify soc0/1 clock define
  reset: aspeed: register AST2700 reset auxiliary bus device
  clk: aspeed: add AST2700 clock driver

 drivers/clk/Kconfig                           |    8 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-ast2700.c                     | 1055 +++++++++++++++++
 drivers/reset/Kconfig                         |    7 +
 drivers/reset/Makefile                        |    1 +
 drivers/reset/reset-aspeed.c                  |  253 ++++
 .../dt-bindings/clock/aspeed,ast2700-scu.h    |    4 +
 7 files changed, 1329 insertions(+)
 create mode 100644 drivers/clk/clk-ast2700.c
 create mode 100644 drivers/reset/reset-aspeed.c

-- 
2.34.1


