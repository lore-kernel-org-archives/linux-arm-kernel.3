Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCAFC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 08:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zSFiZoXB7evDhJTJ4Tj9NRhBZRRAuSIX6mKJO1fArmg=; b=u589SzHFZCRBVEMSASNkoIqYaA
	TL+w+M+5y5lKEapmpLgsRNl9P+b9SVT9dG0dJwfImcI9LOLy+CYMrJU9zkiIlkK643bFdK4Aq12M3
	FIn38T8BpwuiRVHBDgOMA6k2xzUz3wmjL63wIdcI39vTh1UCncnjkNM2FBOuGjr/ynTPxCQ/IRLul
	6wNdgDO0tYRatG2cUfI4xWmLRqZC5oGcwVFn3cIycnoZgWRbdLhRk4xNBzdrym+XtQNastFqz6X96
	XffAIC1pe5DNBflG2jvl75HnYk6xHZhkYbuid+xw7MqfamPCut0f6quvlAtv5Sj1H96aIizgZ0ElJ
	KMwAkUgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rUV-00000008SQv-2dgU;
	Tue, 08 Sep 2026 08:47:43 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rUS-00000008SPc-4AKE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 08:47:42 +0000
X-UUID: ecba3f28ab6111f19a56ed5b684f684d-20260908
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:542d5fc1-76a3-44bb-9f86-371b423f2d75,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:917e14fc1c7697517a827e885cf2169d,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50|99,ED
	M:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ecba3f28ab6111f19a56ed5b684f684d-20260908
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1658788270; Tue, 08 Sep 2026 16:47:29 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: Michal Simek <michal.simek@amd.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Mike Turquette <mturquette@linaro.org>,
	Soren Brinkmann <soren.brinkmann@xilinx.com>,
	Kees Cook <kees@kernel.org>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	gonglinkai@kylinos.cn
Subject: [PATCH v2] clk: zynq: return -ETIMEDOUT if the PLL never locks
Date: Tue,  8 Sep 2026 16:47:27 +0800
Message-Id: <20260908084727.1552042-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260901125323.1556551-1-gonglinkai@kylinos.cn>
References: <20260901125323.1556551-1-gonglinkai@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_014741_353358_99EDDCCD 
X-CRM114-Status: GOOD (  12.44  )
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

zynq_pll_enable() waits for lock under a spinlock with no timeout.
A stuck PLL would wedge the enable path with IRQs off.

Poll with readl_poll_timeout_atomic() and return -ETIMEDOUT on
failure. The 1 ms upper bound is a software limit for a stuck PLL,
not a TRM-derived value; Zynq PLL lock is still expected well
within that window.

Changes in v2:
- Use BIT(clk->lockbit)
- Name the poll delay/timeout constants
- Clarify the 1 ms bound in the commit message

Fixes: 3682af46d55f ("clk: zynq: Factor out PLL driver")
Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
---
 drivers/clk/zynq/pll.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/zynq/pll.c b/drivers/clk/zynq/pll.c
index fe90b50e1545..6a98bc60fb91 100644
--- a/drivers/clk/zynq/pll.c
+++ b/drivers/clk/zynq/pll.c
@@ -9,7 +9,9 @@
 #include <linux/clk/zynq.h>
 #include <linux/clk-provider.h>
 #include <linux/slab.h>
+#include <linux/bits.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 
 /**
  * struct zynq_pll - pll clock
@@ -41,6 +43,10 @@ struct zynq_pll {
 #define PLL_FBDIV_MIN	13
 #define PLL_FBDIV_MAX	66
 
+/* Software bound for a stuck PLL under spinlock; not from the TRM. */
+#define PLL_LOCK_POLL_DELAY_US	10
+#define PLL_LOCK_TIMEOUT_US	1000
+
 /**
  * zynq_pll_determine_rate() - Round a clock frequency
  * @hw:		Handle between common and hardware-specific interfaces
@@ -119,6 +125,7 @@ static int zynq_pll_enable(struct clk_hw *hw)
 	unsigned long flags = 0;
 	u32 reg;
 	struct zynq_pll *clk = to_zynq_pll(hw);
+	int ret;
 
 	if (zynq_pll_is_enabled(hw))
 		return 0;
@@ -131,12 +138,14 @@ static int zynq_pll_enable(struct clk_hw *hw)
 	reg = readl(clk->pll_ctrl);
 	reg &= ~(PLLCTRL_RESET_MASK | PLLCTRL_PWRDWN_MASK);
 	writel(reg, clk->pll_ctrl);
-	while (!(readl(clk->pll_status) & (1 << clk->lockbit)))
-		;
+	ret = readl_poll_timeout_atomic(clk->pll_status, reg,
+					reg & BIT(clk->lockbit),
+					PLL_LOCK_POLL_DELAY_US,
+					PLL_LOCK_TIMEOUT_US);
 
 	spin_unlock_irqrestore(clk->lock, flags);
 
-	return 0;
+	return ret;
 }
 
 /**
-- 
2.25.1

