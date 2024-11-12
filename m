Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF63D41D41
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 01:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1V9WH+DyLUcU+r3wjFZYx81aDw/BBbmglNYljS7XZXY=; b=LweXDxRMnufc0+AnmcW5x7Kz7S
	6qp7RGL8Zm1Fu8v7ocNWQ8OsC2rQX0+UGZcdxq1o1vpdM8yWS1XAauB3ljBHQyImzRkxt0g0mEq9e
	0r4biSIRyBndTZ9Tft4nVsY8Ts+oe6bgM1rp9tw0Qsj+xs6/hGuC2nuJanyu6Q4roMTuLIY8/fWtT
	40mtZLdqC42vChtcyGEBrgxlqmFgwPmFx1/hj8MgbEt/b/gOXZtbqgajS2zpAA5rrC8MUDXhKwtTl
	rlzeynPRQT98O2wSxTy+G2rYK9SY9cfUIkySa8HKbiWtlXFZBY5f887BijuLGvDyjTEjmdlYuE6TI
	ggAvQO+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAfsL-00000001tKk-3yWD;
	Tue, 12 Nov 2024 01:39:25 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAfqY-00000001tE7-2HPx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 01:37:36 +0000
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 533D1888BE;
	Tue, 12 Nov 2024 02:37:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1731375450;
	bh=1V9WH+DyLUcU+r3wjFZYx81aDw/BBbmglNYljS7XZXY=;
	h=From:To:Cc:Subject:Date:From;
	b=APeOs4BRK+oTajJ/ndjoXPaCY0LZG5Ser4UuL6BDZlIaFuQpZSabT36qkZuc1+a+/
	 ne03tioLGJJKXWz9tVrj2+HDL5Plp7oDnE0izrIn2MkQjZDAplqiOAasqMWLvQSdZx
	 eK8DNqWz9aspEfBquo+Z5PtbHX02oCfQO3MX5A0XQgKy9UKegkhZzV03OKjnMD9fJ2
	 6hMbwSJMtbrk3fBXtdYKGlDRLHXdHnyRq5A28Wiuf15280kXudeLY6xDCIwp5FqbFt
	 2O7bkEAWTOYC4odUfcUQEvhjcTcWfEIQUltCqhmqpknuVY/Fz1JI/BqGTCFQCsv77a
	 k/EwPbEgXfSPQ==
From: Marek Vasut <marex@denx.de>
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH] clk: imx8mp: Fix clkout1/2 support
Date: Tue, 12 Nov 2024 02:36:54 +0100
Message-ID: <20241112013718.333771-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_173734_944297_8BCDB92D 
X-CRM114-Status: GOOD (  13.62  )
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

The CLKOUTn may be fed from PLL1/2/3, but the PLL1/2/3 has to be enabled
first by setting PLL_CLKE bit 11 in CCM_ANALOG_SYS_PLLn_GEN_CTRL register.
The CCM_ANALOG_SYS_PLLn_GEN_CTRL bit 11 is modeled by plln_out clock. Fix
the clock tree and place the clkout1/2 under plln_sel instead of plain plln
to let the clock subsystem correctly control the bit 11 and enable the PLL
in case the CLKOUTn is supplied by PLL1/2/3.

Fixes: 43896f56b59e ("clk: imx8mp: add clkout1/2 support")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Cc: stable@vger.kernel.org # v5.18+
---
 drivers/clk/imx/clk-imx8mp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index 516dbd170c8a3..fb18f507f1213 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -399,8 +399,9 @@ static const char * const imx8mp_dram_core_sels[] = {"dram_pll_out", "dram_alt_r
 
 static const char * const imx8mp_clkout_sels[] = {"audio_pll1_out", "audio_pll2_out", "video_pll1_out",
 						  "dummy", "dummy", "gpu_pll_out", "vpu_pll_out",
-						  "arm_pll_out", "sys_pll1", "sys_pll2", "sys_pll3",
-						  "dummy", "dummy", "osc_24m", "dummy", "osc_32k"};
+						  "arm_pll_out", "sys_pll1_out", "sys_pll2_out",
+						  "sys_pll3_out", "dummy", "dummy", "osc_24m",
+						  "dummy", "osc_32k"};
 
 static struct clk_hw **hws;
 static struct clk_hw_onecell_data *clk_hw_data;
-- 
2.45.2


