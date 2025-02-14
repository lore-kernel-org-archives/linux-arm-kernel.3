Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0659C021A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 13:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DP/KEelrhRW/6hUEyb/hnVo2+YI8YyhwZMh0y1iIMBQ=; b=vyH58FokPe/8qC2gik3g/Fy8Ut
	XPkF+KGaCeVW+9qPP4Hd4a+HQS+D92OlGJMGLoNc8UDHFGWd3lDMhL7e1IjeYA4BXNARU6gyl76lm
	IMpNxbCsS87cpH5H9Rr8yLZhSLb3HVsTF1p+YqUXzrD9F2QTcAoLX7iSIyfgs9WHazelp0yxKKixJ
	IwdJsE9OC10Jvw5i/nGLS4tnPs9vEC5CvEOfPgTvV2q++Yi5HXjArDT/tNRUn0OF6WDF8+qdmJQpa
	sVoJBaaaS0yIFL5eVb0rUYJevUrokkK5LFYvqk3sAtD4x1rdb+NChnLk6VRHtuCXUe3MlnIwzVOSj
	6fVwxeMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tivOh-0000000Evqh-3vSq;
	Fri, 14 Feb 2025 13:06:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tivEv-0000000EtYt-044e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 12:56:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A15D41596;
	Fri, 14 Feb 2025 04:56:36 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 755973F58B;
	Fri, 14 Feb 2025 04:56:14 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/15] clk: sunxi-ng: a523: Add support for bus clocks
Date: Fri, 14 Feb 2025 12:53:50 +0000
Message-ID: <20250214125359.5204-7-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250214125359.5204-1-andre.przywara@arm.com>
References: <20250214125359.5204-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_045617_093515_3BD8263C 
X-CRM114-Status: GOOD (  11.54  )
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

Add the basic bus clocks for the Allwinner A523 and T527 SoCs.
This covers the AHB, APB0 and APB1 clocks. Linux is not supposed to
change those clocks, but they are needed as parents for many other mod
clocks.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 39 ++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
index 8374e841e9d82..59f45e7c0904b 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
@@ -331,6 +331,39 @@ static CLK_FIXED_FACTOR_HW(pll_npu_2x_clk, "pll-npu-2x",
 static CLK_FIXED_FACTOR_HW(pll_npu_1x_clk, "pll-npu-1x",
 			   &pll_npu_4x_clk.common.hw, 4, 1, 0);
 
+
+/**************************************************************************
+ *                           bus clocks                                   *
+ **************************************************************************/
+
+static const struct clk_parent_data ahb_apb0_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .fw_name = "losc" },
+	{ .fw_name = "iosc" },
+	{ .hw = &pll_periph0_600M_clk.hw },
+};
+
+static SUNXI_CCU_M_DATA_WITH_MUX(ahb_clk, "ahb", ahb_apb0_parents, 0x510,
+				 0, 5,		/* M */
+				 24, 2,		/* mux */
+				 0);
+static SUNXI_CCU_M_DATA_WITH_MUX(apb0_clk, "apb0", ahb_apb0_parents, 0x520,
+				 0, 5,		/* M */
+				 24, 2,	/* mux */
+				 0);
+
+static const struct clk_parent_data apb1_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .fw_name = "losc" },
+	{ .fw_name = "iosc" },
+	{ .hw = &pll_periph0_600M_clk.hw },
+	{ .hw = &pll_periph0_480M_clk.common.hw },
+};
+static SUNXI_CCU_M_DATA_WITH_MUX(apb1_clk, "apb1", apb1_parents, 0x524,
+				 0, 5,		/* M */
+				 24, 3,		/* mux */
+				 0);
+
 /*
  * Contains all clocks that are controlled by a hardware register. They
  * have a (sunxi) .common member, which needs to be initialised by the common
@@ -358,6 +391,9 @@ static struct ccu_common *sun55i_a523_ccu_clks[] = {
 	&pll_ve_clk.common,
 	&pll_audio0_4x_clk.common,
 	&pll_npu_4x_clk.common,
+	&ahb_clk.common,
+	&apb0_clk.common,
+	&apb1_clk.common,
 };
 
 static struct clk_hw_onecell_data sun55i_a523_hw_clks = {
@@ -403,6 +439,9 @@ static struct clk_hw_onecell_data sun55i_a523_hw_clks = {
 		[CLK_PLL_NPU_4X]	= &pll_npu_4x_clk.common.hw,
 		[CLK_PLL_NPU_2X]	= &pll_npu_2x_clk.hw,
 		[CLK_PLL_NPU]		= &pll_npu_1x_clk.hw,
+		[CLK_AHB]		= &ahb_clk.common.hw,
+		[CLK_APB0]		= &apb0_clk.common.hw,
+		[CLK_APB1]		= &apb1_clk.common.hw,
 	},
 };
 
-- 
2.46.3


