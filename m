Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47697C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 00:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EPZVT0iLAUIySdD3wN4FpEinf/bsqEsqXSgFqjUbfTg=; b=kCBvXLIoupcHKMnX1c9JbC5knc
	/wDA0bcuXoMienwl0SfTMrAlO7vK6xAFokAOwJu17tz1TLvlRapw3siJxV+HsAt+S+7umCi0t7EzJ
	3HWh3ma4UtduAsZ+KAsvQYJGpViDqO1d+y7/qNli38ifLE/aWbv7HjQYA+/A+BlCNCMRZPqNAVgBI
	vLc0K1At+Wuc6MrJkB4HQKmj6Hu0i2+qnM/WtVyxNO6UI3nO2C7RvIx7es8hoxO4S7boOhPoQE93D
	ta4oyTER/JQQv4s5HEQXMSr0xBFpKuniJfTOYKAPzPgln5x+zdRHtsQtGd5+rK+7ujKV/mSPhHSbK
	pM/WyIfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAcw3-0000000FuMn-0CHJ;
	Sun, 27 Sep 2026 00:40:07 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAcw0-0000000FuL7-38mr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 00:40:05 +0000
Received: from seu.edu.cn (unknown [223.112.146.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4f364003f;
	Sun, 27 Sep 2026 08:39:52 +0800 (GMT+08:00)
From: Slavin Liu <bolin.liu@seu.edu.cn>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bolin.liu@seu.edu.cn
Subject: [PATCH 1/2] dmaengine: sun6i: Fix use-after-free in slave sg LLI error cleanup
Date: Sun, 27 Sep 2026 08:39:50 +0800
Message-Id: <20260927003951.11210-1-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0e04dd51403a1kunm4a399e5a199cc7
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQhpMVk9LGhgeSkkdSB9NQlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVSkpJVUpPTVVKTUlZV1kWGg8SFR0UWUFZT0tIVUpLSU
	hOQ0NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=Brvy0TWMlY4NSwnTMHliFyYzDnDuLaujYzQdtIlfTpcArAwP+aDFVpeDSoLCV8fTtJmFYS5BK0SMFRe/s4EnHabAeRUjiMGATmVZ3JtbkVAFRc/YG45+dVd68Yt3PmyMIs4C5bLBhWpwxam39Xte9r9vAoOUvcGwtKIlCGb3IvQ=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=EPZVT0iLAUIySdD3wN4FpEinf/bsqEsqXSgFqjUbfTg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_174004_954085_D3482E7B 
X-CRM114-Status: UNSURE (   9.16  )
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

sun6i_dma_prep_slave_sg() chains one pool-allocated LLI per
scatterlist entry.  When a later dma_pool_alloc() fails (GFP_NOWAIT,
so it does not wait for reclaim, making failure realistic under memory
pressure), the err_lli_free path walks the chain to free what was
built: the loop body hands the current LLI back to the pool with
dma_pool_free(), and the for-loop increment then reads
v_lli->p_lli_next and v_lli->v_lli_next from the memory that was just
freed and may already have been reallocated.

Cache both next fields of the current LLI before freeing it.

Fixes: 4fbd804e009a ("dmaengine: sun6i: Fix memory leaks")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
---
 drivers/dma/sun6i-dma.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 7704b016aed8..025a43d0298d 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -790,9 +790,14 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
 	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
 
 err_lli_free:
-	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
-	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
+	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;) {
+		dma_addr_t next_p_lli = v_lli->p_lli_next;
+		struct sun6i_dma_lli *next_v_lli = v_lli->v_lli_next;
+
 		dma_pool_free(sdev->pool, v_lli, p_lli);
+		p_lli = next_p_lli;
+		v_lli = next_v_lli;
+	}
 	kfree(txd);
 	return NULL;
 }
-- 
2.34.1


