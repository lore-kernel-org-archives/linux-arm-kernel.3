Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7C3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 08:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49zjnnPxInf4/Lb8wJPC2uCok/znNnOVrhQy99e/PWA=; b=DtXZUqZCH5Z0jJPprtKmBM5GKg
	96lqHG/7lKXMUcu5Fk6WMdWSpaLyRwFhGtc0gddgGvVi22TxXAvQUXI2xV+dgYjlIXh4ndqiTkgpS
	qPNuykOLvVjuvjoWjHK+pPbMxUMKAsvEL9sCYvPL0z9zc6/5mnApha1Q9CO0iQn8LV9htjYZEKZvr
	+NI7TmbZshuFdBqeFo9Wj20atorF/4jWR1UIDv0M4ndce1KSDN3Pcg8ir4GaZqx1PFA3yQr8CxWbe
	uGwgU9Ih8pxIKWgJNkw2bk+7aKKSfCOkJ+dyvA+xM0UVA/povQBvVmYl0G1GHhDP+a0B1w7iBa0Jb
	5limilaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiSp3-00000006MEm-30OX;
	Sat, 11 Jul 2026 08:12:29 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiSoy-00000006MB1-454E;
	Sat, 11 Jul 2026 08:12:28 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1783757534; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NRQXplQxGJRCexRiGskuflstW0LMAIHsQKR72zQ2reOrpuTO3RaC8gu/z7sdf4/5onygzgvw22NM+qFSEuCf7/U0Wxn9bQg9b+e8p5WwlqMcA5ZUCIztYRZkszwlFi9vMecVp1ed1CjA61QZq6xVRrIG8+rGMug81ITkmV1Indk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783757534; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=49zjnnPxInf4/Lb8wJPC2uCok/znNnOVrhQy99e/PWA=; 
	b=dqCFEPXCOpCbbUrtLqsMUwKadblUY1YAdTsZyQR0j6WvmaRP+t9/LmOyEe3ziDgmAlMmOWYiEf0wRSzjaUDntuYCdMPeNQ2IETxx75G4A6yscaRwtIXHvpHlQJHGBWVKnhgZ7tHyr+qEGpybGRH2xJlYiydwK0r85FdIRx+G/JY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783757534;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=49zjnnPxInf4/Lb8wJPC2uCok/znNnOVrhQy99e/PWA=;
	b=mbxRCJ0/czbRVya9urq3ZWJhZoi1lHfsHj5oY8U2JtJiZsDrUfiEnKSNlmG4jfy1
	B5RY8Cwa+opPT9N96zHh6Y6mhAbwqWXRjKQvSmaz3oaGhPyRdNPZmiFlpW/pCbXCBOb
	9mP25XA+4eX7RRsP5pIncC2zVcMk3OEthS/npwmA=
Received: by mx.zohomail.com with SMTPS id 1783757530976962.246295364046;
	Sat, 11 Jul 2026 01:12:10 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Sat, 11 Jul 2026 16:10:31 +0800
Subject: [PATCH v2 5/8] clk: sunxi-ng: a733: Add bus clocks support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-a733-clk-v2-5-974d188cbe0c@pigmoral.tech>
References: <20260711-a733-clk-v2-0-974d188cbe0c@pigmoral.tech>
In-Reply-To: <20260711-a733-clk-v2-0-974d188cbe0c@pigmoral.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
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
 netdev@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783757449; l=5562;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=xDs7aF09JCqJozBlgtbT0W5cDZq0QIw8b2Kh8/rGLqI=;
 b=yxYd36PY5qLgs/Cl7U4Wg0U2a3E3tlSKnXa4NKtxME69UQP7pW4rT3+ZJoltndtsOVp0V0yu9
 8/1aI3pqKtyAnCr33jVo9z4PmbQ1iPtYmVJRtQ9XibTj0DrwVXb12Qy
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_011225_102954_15169197 
X-CRM114-Status: GOOD (  15.18  )
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
functional modules. An additional trace clock is also added as it fall
within the register address range of the bus clocks, even though it is
not strictly bus clocks.

The MBUS clock is marked as critical to ensure the memory bus remains
operational at all times. And the hardware requires an update bit
(bit 27) to be set so that the configuration takes effect and the
updated parameters can be correctly read back for the MBUS clock.

Tested-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 drivers/clk/sunxi-ng/ccu-sun60i-a733.c | 91 ++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
index f80db6ab1a98..c42619afb52e 100644
--- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
+++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
@@ -19,6 +19,7 @@
 #include "ccu_common.h"
 
 #include "ccu_div.h"
+#include "ccu_mp.h"
 #include "ccu_mult.h"
 #include "ccu_nkmp.h"
 #include "ccu_nm.h"
@@ -69,6 +70,16 @@ static const struct clk_hw *pll_ref_hws[] = {
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
@@ -375,6 +386,73 @@ static SUNXI_CCU_M_HWS(pll_de_4x_clk, "pll-de-4x", pll_de_hws,
 static SUNXI_CCU_M_HWS(pll_de_3x_clk, "pll-de-3x", pll_de_hws,
 		       SUN60I_A733_PLL_DE_REG, 16, 3, 0);
 
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
+				 0, 5,		/* M */
+				 24, 3,		/* mux */
+				 BIT(31),	/* gate */
+				 0);
+
+static const struct clk_parent_data mbus_parents[] = {
+	{ .hw = &sys_24M_clk.hw },
+	{ .hw = &pll_periph1_600M_clk.hw },
+	{ .hw = &pll_ddr_clk.common.hw },
+	{ .hw = &pll_periph1_480M_clk.common.hw },
+	{ .hw = &pll_periph1_400M_clk.hw },
+	{ .hw = &pll_npu_clk.common.hw },
+};
+static SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(mbus_clk, "mbus", mbus_parents, 0x588,
+					    0, 5,	/* M */
+					    0, 0,	/* no P */
+					    24, 3,	/* mux */
+					    BIT(31),	/* gate */
+					    CLK_IS_CRITICAL,
+					    CCU_FEATURE_UPDATE_BIT);
+
 /*
  * Contains all clocks that are controlled by a hardware register. They
  * have a (sunxi) .common member, which needs to be initialised by the common
@@ -411,11 +489,18 @@ static struct ccu_common *sun60i_a733_ccu_clks[] = {
 	&pll_de_12x_clk.common,
 	&pll_de_4x_clk.common,
 	&pll_de_3x_clk.common,
+	&ahb_clk.common,
+	&apb0_clk.common,
+	&apb1_clk.common,
+	&apb_uart_clk.common,
+	&trace_clk.common,
+	&mbus_clk.common,
 };
 
 static struct clk_hw_onecell_data sun60i_a733_hw_clks = {
 	.hws	= {
 		[CLK_PLL_REF]		= &pll_ref_clk.common.hw,
+		[CLK_SYS_24M]		= &sys_24M_clk.hw,
 		[CLK_PLL_DDR]		= &pll_ddr_clk.common.hw,
 		[CLK_PLL_PERIPH0_4X]	= &pll_periph0_4x_clk.common.hw,
 		[CLK_PLL_PERIPH0_2X]	= &pll_periph0_2x_clk.common.hw,
@@ -457,6 +542,12 @@ static struct clk_hw_onecell_data sun60i_a733_hw_clks = {
 		[CLK_PLL_DE_12X]	= &pll_de_12x_clk.common.hw,
 		[CLK_PLL_DE_4X]		= &pll_de_4x_clk.common.hw,
 		[CLK_PLL_DE_3X]		= &pll_de_3x_clk.common.hw,
+		[CLK_AHB]		= &ahb_clk.common.hw,
+		[CLK_APB0]		= &apb0_clk.common.hw,
+		[CLK_APB1]		= &apb1_clk.common.hw,
+		[CLK_APB_UART]		= &apb_uart_clk.common.hw,
+		[CLK_TRACE]		= &trace_clk.common.hw,
+		[CLK_MBUS]		= &mbus_clk.common.hw,
 	},
 	.num	= CLK_FANOUT3 + 1,
 };

-- 
2.54.0


