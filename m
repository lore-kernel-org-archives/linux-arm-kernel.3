Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E0AC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 12:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XTtisOZj15DJMVUjD07/vhUfYquCg3uqvHY5rJSjg5w=; b=m7V5HdZb4mKpI8s7mzGondBjqX
	eEME4FGolvwDVytrMFwmfgDvR3rg7MTjRL9yT/wEaenx6l/01ORJdPdIjO10T/M9nXkFVV7Xj2H+s
	EuucStSBCOzOcOgYLxsY5+P0XwQlTFmPoKp8mNw6Kf5Cst6gwFfT3stfIzYSjijRbUDbeB6ag22l1
	WVimRzEx8AI/Lcu6q90meMqlL0clQf3w0ZkIl5kaCvdka/JfGrj4tuI/FqteNyLDBQ6w9QHQUVeWe
	Jfe9bdBumfsw3jlIZ2TCm/VNBBAb39uKhb6v7a+ZvSf7impV3+x44hQUhhwN98er6kkKRYdPnlxFi
	u9sof3eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Nzk-0000000C8xV-3CsC;
	Tue, 01 Sep 2026 12:53:44 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Nzg-0000000C8x3-31zR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 12:53:43 +0000
X-UUID: 20ea352ca60411f19a56ed5b684f684d-20260901
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:e9e9f435-0a87-416b-a713-5c522781e1ad,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:25c1092264eb615d526a984f18807bf6,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:-3,IP:n
	il,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LE
	S:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 20ea352ca60411f19a56ed5b684f684d-20260901
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1294518346; Tue, 01 Sep 2026 20:53:28 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Michal Simek <michal.simek@amd.com>
Cc: Kees Cook <kees@kernel.org>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>,
	Mike Turquette <mturquette@linaro.org>,
	Soren Brinkmann <soren.brinkmann@xilinx.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	gonglinkai@kylinos.cn
Subject: [PATCH] clk: zynq: return -ETIMEDOUT if the PLL never locks
Date: Tue,  1 Sep 2026 20:53:23 +0800
Message-Id: <20260901125323.1556551-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_055342_321377_168BA334 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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

zynq_pll_enable() waits for lock under a spinlock with no
timeout. Poll with a 1ms bound and return the error.

Fixes: 3682af46d55f ("clk: zynq: Factor out PLL driver")
Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
---
 drivers/clk/zynq/pll.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/zynq/pll.c b/drivers/clk/zynq/pll.c
index 44c609378364..96cf45088ba0 100644
--- a/drivers/clk/zynq/pll.c
+++ b/drivers/clk/zynq/pll.c
@@ -10,6 +10,7 @@
 #include <linux/clk-provider.h>
 #include <linux/slab.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 
 /**
  * struct zynq_pll - pll clock
@@ -119,6 +120,7 @@ static int zynq_pll_enable(struct clk_hw *hw)
 	unsigned long flags = 0;
 	u32 reg;
 	struct zynq_pll *clk = to_zynq_pll(hw);
+	int ret;
 
 	if (zynq_pll_is_enabled(hw))
 		return 0;
@@ -131,12 +133,12 @@ static int zynq_pll_enable(struct clk_hw *hw)
 	reg = readl(clk->pll_ctrl);
 	reg &= ~(PLLCTRL_RESET_MASK | PLLCTRL_PWRDWN_MASK);
 	writel(reg, clk->pll_ctrl);
-	while (!(readl(clk->pll_status) & (1 << clk->lockbit)))
-		;
+	ret = readl_poll_timeout_atomic(clk->pll_status, reg,
+					reg & (1 << clk->lockbit), 10, 1000);
 
 	spin_unlock_irqrestore(clk->lock, flags);
 
-	return 0;
+	return ret;
 }
 
 /**
-- 
2.25.1


