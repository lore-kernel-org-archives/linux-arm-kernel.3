Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F3ACA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 17:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EL9zRWnYHURCm+KCISV2HbVE+fRRAQvqELI079kIs04=; b=ZCq9E9Zghvfrm5qm7s2jiE0cBf
	GAhe8IvRYUye3BRwop3rU5FJ5J/4cdm39X+1m0tITKDSZVOaqQ0z50GAp4ztm7xrG7s53YhWjmwjH
	0hX4As7RKXcLrH80I8BVWTqrY4spxJgajt1i0w4Ynrzg05APc5nFh+kvjIe6ZABB5zZvjITmk8Dzy
	9BZmKRG52w0SXEDFJWbrTKfK6Pu7WeDvxmJk2iJKhfeBG6LNOLovbNZIULKNwNOmmx0kP3dBm3AcG
	323/OjZJvWohbIgujGIGL0Y9pQgMiOcPzXWTyVPREKncXz6MJX0p+HAKjo3O67rgYVyXMhuDlDU4z
	Zlbc8+vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbck-00000004Bjn-3ksH;
	Tue, 29 Sep 2026 17:28:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbcX-00000004BYX-3Rro;
	Tue, 29 Sep 2026 17:28:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=EL9zRWnYHURCm+KCISV2HbVE+fRRAQvqELI079kIs04=; b=e8MkZolcLd/W2mBRlizKgSQXjI
	Mzn1G4t/lRvBGT9stvVe7SsggN0f+cf2XvBrsK3csw2cNVCVAie54/RFn0voddIKZ5bipEIZQbTfz
	zvGWYM6d6CBHkeNQ58Sj+/IIoPCSbCq06OZ8X79f8EeSM5Ox9ypBDEZrQBaroOp8WtBfEdCcX5hPK
	Q6IT0FpZRWptaPGkeULk1EoRgkQGpZ99pgRxapwbbUEf4Qt7y6E2cWCFXM2Jjo4RE0pB+urh+r9xf
	2f6kUkal3X81txsysoQ3gDfhVMTzZHjp/x76zhLQ+PUYGbE9ZLE5lwdZiZJlUs1C11EfFw0XmnhFP
	U/l0LhCQ==;
Received: from sender5-op-o15.zoho.com ([165.173.182.15])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBbcU-00000002u53-3zmO;
	Tue, 29 Sep 2026 17:28:00 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1790702859; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FNMvOPCIbetENtWDWE2Ptd5fAtMW4110KTzJxryZyoaexGpuKCbmPTgswwUpyLdw8XlV4YgPECDY+DGo/xEDnnlCg5GOXAn6d9aLPJNTzJclHCW22Fyjxp1VNmnLVXDTndpw5vuQmil2igLjkAKfyDTCH4vlN/jkBB8mEzwMjCo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790702859; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=EL9zRWnYHURCm+KCISV2HbVE+fRRAQvqELI079kIs04=; 
	b=Om8dcQkfNWhEyEABHVkjjCnh90R4Pg7hAqsnNR6Dg8KVfaTYB/ZVj+mCyzefTOgMxbWhHcTzJTnlnU14Gany/KalB/DddOPYwhxrOY5dJFvEpDUgIvVVfckkFUDrkEVmJmiwDVPjlU9Rv8rbP59FfxIZyVmBbApu6xdS1IH8f7k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790702859;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=EL9zRWnYHURCm+KCISV2HbVE+fRRAQvqELI079kIs04=;
	b=Ur6WcypgzS9ayabvDIm3XR79LKrM9EDCpMWIY71PQ1Faw3Pja+SvDYzoD0Mx05Gt
	1oUqgNZ75UGLsCzpM0rW1zlcz6e+5q2ANylsCTiWLKr371KTWprhUtKkouLjGdi8eJp
	b27PW84yZYZt612TX2V5HC8tsy3m0hm9oAda4d9U=
Received: by smtp.zohomail.com with SMTPS id 17907028578601008.2757210707019;
	Tue, 29 Sep 2026 10:27:37 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 30 Sep 2026 01:26:12 +0800
Subject: [PATCH v5 5/8] clk: sunxi-ng: a733: Add bus clocks support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-a733-clk-v5-5-11175b41cd2d@pigmoral.tech>
References: <20260930-a733-clk-v5-0-11175b41cd2d@pigmoral.tech>
In-Reply-To: <20260930-a733-clk-v5-0-11175b41cd2d@pigmoral.tech>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 netdev@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, 
 Enzo Adriano <enzo.adriano.code@gmail.com>, 
 Andre Przywara <andre.przywara@arm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6211;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=lkc+TBcZ8rSbjnHuhgK0z3s9+F1IWJmQqs6m8lT/9aA=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLJ2fzm8fc0Gr7pb3RvUlx5U74uaWrXptMp5KZegS8xHu
 Os7z0SFd5SyMIhxMciKKbJw+Yv/s9bh+XZEoPU+zBxWJpAhDFycAjCR7ckM/8PLS379OZHPI/D0
 5YI5F95VTo51ihT4LO92ZpHGmvV5WZyMDGu4Vl3Tnh3efdz3/bTngll+U3NfCdyuaY+fyTwrZ/G
 NnVwA
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_182759_222776_32E60FFE 
X-CRM114-Status: GOOD (  17.58  )
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

Add the essential bus clocks in the Allwinner A733 CCU, including AHB,
APB0, APB1, APB_UART, and MBUS. These buses are necessary for many other
functional modules. Additional clocks such as trace and gic are also
added as they fall within the register address range of the bus clocks,
even though they are not strictly bus clocks.

The MBUS clock is marked as critical to ensure the memory bus remains
operational at all times. And the hardware requires an update bit
(bit 27) to be set so that the configuration takes effect and the
updated parameters can be correctly read back for the MBUS clock.

The GIC clock is also marked as critical. The bootloader may leave the
GIC running on a PLL parent, and disabling that PLL during
clk_disable_unused would hang the interrupt controller and the system.

Tested-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 drivers/clk/sunxi-ng/ccu-sun60i-a733.c | 105 +++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
index 430a535919c6..eda4b347c540 100644
--- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
+++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
@@ -18,6 +18,7 @@
 
 #include "ccu_div.h"
 #include "ccu_gate.h"
+#include "ccu_mp.h"
 #include "ccu_mult.h"
 #include "ccu_nkmp.h"
 #include "ccu_nm.h"
@@ -68,6 +69,16 @@ static const struct clk_hw *pll_ref_hws[] = {
 	&pll_ref_clk.common.hw
 };
 
+/*
+ * There is a non-software-configurable mux selecting between the DCXO and the
+ * PLL_REF in hardware, whose output is fed to the sys-24M clock. Although both
+ * sys-24M and pll-ref are fixed at 24 MHz, define a 1:1 fixed factor clock to
+ * provide logical separation:
+ * - pll-ref is dedicated to feeding other PLLs
+ * - sys-24M serves as reference clock for downstream functional modules
+ */
+static CLK_FIXED_FACTOR_HWS(sys_24M_clk, "sys-24M", pll_ref_hws, 1, 1, 0);
+
 #define SUN60I_A733_PLL_DDR_REG		0x020
 static struct ccu_nkmp pll_ddr_clk = {
 	.enable		= BIT(27),
@@ -414,6 +425,85 @@ static SUNXI_CCU_M_HWS_WITH_GATE(pll_de_3x_clk, "pll-de-3x", pll_de_hws,
 				 SUN60I_A733_PLL_DE_REG,
 				 16, 3, BIT(26), 0);
 
+/**************************************************************************
+ *                           bus clocks                                   *
+ **************************************************************************/
+
+static const struct clk_parent_data ahb_apb_parents[] = {
+	{ .hw = &sys_24M_clk.hw },
+	{ .fw_name = "losc" },
+	{ .fw_name = "iosc" },
+	{ .hw = &pll_periph0_600M_clk.hw },
+};
+
+static SUNXI_CCU_M_DATA_WITH_MUX(ahb_clk, "ahb", ahb_apb_parents, 0x500,
+				 0, 5,		/* M */
+				 24, 2,		/* mux */
+				 0);
+
+static SUNXI_CCU_M_DATA_WITH_MUX(apb0_clk, "apb0", ahb_apb_parents, 0x510,
+				 0, 5,		/* M */
+				 24, 2,		/* mux */
+				 0);
+
+static SUNXI_CCU_M_DATA_WITH_MUX(apb1_clk, "apb1", ahb_apb_parents, 0x518,
+				 0, 5,		/* M */
+				 24, 2,		/* mux */
+				 0);
+
+static const struct clk_parent_data apb_uart_parents[] = {
+	{ .hw = &sys_24M_clk.hw },
+	{ .fw_name = "losc" },
+	{ .fw_name = "iosc" },
+	{ .hw = &pll_periph0_600M_clk.hw },
+	{ .hw = &pll_periph0_480M_clk.common.hw },
+};
+static SUNXI_CCU_M_DATA_WITH_MUX(apb_uart_clk, "apb-uart", apb_uart_parents, 0x538,
+				 0, 5,		/* M */
+				 24, 3,		/* mux */
+				 0);
+
+static const struct clk_parent_data trace_parents[] = {
+	{ .hw = &sys_24M_clk.hw },
+	{ .fw_name = "losc" },
+	{ .fw_name = "iosc" },
+	{ .hw = &pll_periph0_300M_clk.hw },
+	{ .hw = &pll_periph0_400M_clk.hw },
+};
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE(trace_clk, "trace", trace_parents, 0x540,
+				      0, 5,	/* M */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
+
+static const struct clk_parent_data gic_parents[] = {
+	{ .hw = &sys_24M_clk.hw },
+	{ .fw_name = "losc" },
+	{ .hw = &pll_periph0_600M_clk.hw },
+	{ .hw = &pll_periph0_480M_clk.common.hw },
+	{ .hw = &pll_periph0_400M_clk.hw },
+};
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE(gic_clk, "gic", gic_parents, 0x560,
+				      0, 5,	/* M */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      CLK_IS_CRITICAL);
+
+static const struct clk_parent_data mbus_parents[] = {
+	{ .hw = &sys_24M_clk.hw },
+	{ .hw = &pll_periph1_600M_clk.hw },
+	{ .hw = &pll_ddr_clk.common.hw },
+	{ .hw = &pll_periph1_480M_clk.common.hw },
+	{ .hw = &pll_periph1_400M_clk.hw },
+	{ .hw = &pll_npu_clk.common.hw },
+};
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT(mbus_clk, "mbus", mbus_parents, 0x588,
+					   0, 5,	/* M */
+					   24, 3,	/* mux */
+					   BIT(31),	/* gate */
+					   CLK_IS_CRITICAL,
+					   CCU_FEATURE_UPDATE_BIT);
+
 /*
  * Contains all clocks that are controlled by a hardware register. They
  * have a (sunxi) .common member, which needs to be initialised by the common
@@ -448,11 +538,19 @@ static struct ccu_common *sun60i_a733_ccu_clks[] = {
 	&pll_de_clk.common,
 	&pll_de_4x_clk.common,
 	&pll_de_3x_clk.common,
+	&ahb_clk.common,
+	&apb0_clk.common,
+	&apb1_clk.common,
+	&apb_uart_clk.common,
+	&trace_clk.common,
+	&gic_clk.common,
+	&mbus_clk.common,
 };
 
 static struct clk_hw_onecell_data sun60i_a733_hw_clks = {
 	.hws	= {
 		[CLK_PLL_REF]		= &pll_ref_clk.common.hw,
+		[CLK_SYS_24M]		= &sys_24M_clk.hw,
 		[CLK_PLL_DDR]		= &pll_ddr_clk.common.hw,
 		[CLK_PLL_PERIPH0_4X]	= &pll_periph0_4x_clk.common.hw,
 		[CLK_PLL_PERIPH0_2X]	= &pll_periph0_2x_clk.common.hw,
@@ -494,6 +592,13 @@ static struct clk_hw_onecell_data sun60i_a733_hw_clks = {
 		[CLK_PLL_DE]		= &pll_de_clk.common.hw,
 		[CLK_PLL_DE_4X]		= &pll_de_4x_clk.common.hw,
 		[CLK_PLL_DE_3X]		= &pll_de_3x_clk.common.hw,
+		[CLK_AHB]		= &ahb_clk.common.hw,
+		[CLK_APB0]		= &apb0_clk.common.hw,
+		[CLK_APB1]		= &apb1_clk.common.hw,
+		[CLK_APB_UART]		= &apb_uart_clk.common.hw,
+		[CLK_TRACE]		= &trace_clk.common.hw,
+		[CLK_GIC]		= &gic_clk.common.hw,
+		[CLK_MBUS]		= &mbus_clk.common.hw,
 	},
 	.num	= CLK_FANOUT3 + 1,
 };

-- 
2.55.0


