Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F7ED767EA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 17:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=92Sy6UDwL/ps4AVz4KDD4tlQVW8dKGo+enny9ATdi/Y=; b=jv8JHZ9O6oIyBeZjP4UUmNrGQ5
	M3eX40eZiowTxqhZBDtlq573P2fGirNDR7ygefkkdAyQexiepprR7u5q+oCFWribY8kZLuSK4vgmY
	UaLWTafVK3TMgYpMFpbkDa621HQG+3UxkJ5weDLHsj+oJP93jkqlsRqO7f2ZNhQLOfrUqfn1dUePf
	ttYHrlNyNabUyL5nHF0A9s7nMzbQKfU5fG01feJzun9kNw9AIooq+77Yg+9uf26FPBOYaBVQpq8Qw
	QYkWe3Oy8szeqTOacN7VYjr53dGNvPp0ElxlY6y8G7nYRrWYvG0iih0AMHtX7J71bEjD45t1cqQj8
	FkoAr2Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6YYr-00000004Has-3wvM;
	Thu, 31 Oct 2024 17:02:17 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6YX8-00000004HCb-2Sc9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 17:00:31 +0000
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id F077C892B4;
	Thu, 31 Oct 2024 18:00:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730394029;
	bh=92Sy6UDwL/ps4AVz4KDD4tlQVW8dKGo+enny9ATdi/Y=;
	h=From:To:Cc:Subject:Date:From;
	b=rn8W7ok+xoK/3atYWX260xLtWpY/OFjHeu/yW3HPUiFltXynjdWPNf/Rg9h+vsvav
	 xfc2acyIVryKtFo1x5VRFubzNzIyhS5WvDcu39HMjJbHd66Ml0vEZs4aGYB/tknE8P
	 kOrZ/deOA6DZcwNOW/haFyf+0JjGCnvMJdEYvKBUEu1KDl6VLYAQXXp266dweOZlcx
	 1wNbiFp6NP2RJZSfL6pfFcT8SoAEppYFMytU3O1UzZLq1PN4Yv1Dr8wF1Gf4ji9V5C
	 ks3SjAyULhhP++L3DvYeTC60xGfn0T2OLlnBK35kKJdOepu1vTGmkWfQqa+N76JDfq
	 lZdkMjKp8B+sw==
From: Marek Vasut <marex@denx.de>
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Michal Simek <michal.simek@amd.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: zynqmp: Work around broken DT GPU node
Date: Thu, 31 Oct 2024 17:59:33 +0100
Message-ID: <20241031170015.55243-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_100030_794392_7AF7AED6 
X-CRM114-Status: GOOD (  12.93  )
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

The ZynqMP DT GPU node clock description is wrong and does not represent
the hardware correctly, it only describes BUS and PP0 clock, while it is
missing PP1 clock. That means PP1 clock can never be enabled when the GPU
should be used, which leads to expected GPU hang even with simple basic
tests like kmscube.

Since Xilinx does use generated DTs on ZynqMP, the current broken DT
implementation has to be supported. Add a workaround for this breakage
into the clock driver, in case of PP0 enablement attempt, enable PP1
as well and vice versa. This way, the GPU does work and does not hang
because one of its pixel pipeline clock are not enabled.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Michal Simek <michal.simek@amd.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 drivers/clk/zynqmp/clk-gate-zynqmp.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/zynqmp/clk-gate-zynqmp.c b/drivers/clk/zynqmp/clk-gate-zynqmp.c
index b89e557371984..b013aa33e7abb 100644
--- a/drivers/clk/zynqmp/clk-gate-zynqmp.c
+++ b/drivers/clk/zynqmp/clk-gate-zynqmp.c
@@ -7,6 +7,7 @@
  * Gated clock implementation
  */
 
+#include <dt-bindings/clock/xlnx-zynqmp-clk.h>
 #include <linux/clk-provider.h>
 #include <linux/slab.h>
 #include "clk-zynqmp.h"
@@ -38,7 +39,13 @@ static int zynqmp_clk_gate_enable(struct clk_hw *hw)
 	u32 clk_id = gate->clk_id;
 	int ret;
 
-	ret = zynqmp_pm_clock_enable(clk_id);
+	if (clk_id == GPU_PP0_REF || clk_id == GPU_PP1_REF) {
+		ret = zynqmp_pm_clock_enable(GPU_PP0_REF);
+		if (!ret)
+			ret = zynqmp_pm_clock_enable(GPU_PP1_REF);
+	} else {
+		ret = zynqmp_pm_clock_enable(clk_id);
+	}
 
 	if (ret)
 		pr_debug("%s() clock enable failed for %s (id %d), ret = %d\n",
@@ -58,7 +65,13 @@ static void zynqmp_clk_gate_disable(struct clk_hw *hw)
 	u32 clk_id = gate->clk_id;
 	int ret;
 
-	ret = zynqmp_pm_clock_disable(clk_id);
+	if (clk_id == GPU_PP0_REF || clk_id == GPU_PP1_REF) {
+		ret = zynqmp_pm_clock_disable(GPU_PP1_REF);
+		if (!ret)
+			ret = zynqmp_pm_clock_disable(GPU_PP0_REF);
+	} else {
+		ret = zynqmp_pm_clock_disable(clk_id);
+	}
 
 	if (ret)
 		pr_debug("%s() clock disable failed for %s (id %d), ret = %d\n",
-- 
2.45.2


