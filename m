Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCEBC98328
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 00:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hyzCXCa5mKGjYrQQ4pIYenV4b4psqdzT9oL39eHS+S8=; b=4OtIwaHnSJ2eAoRH+HOj/rK8S+
	kfz24kfSlvCTp7ZZNPgkdkqRgJmYwGaDU6szL2qU/ifH1UUQBqMUX1lp/ntB/Iozxq/4IjpUvcaim
	ZAhBgfGMGXJeevGGyi7PWPT3EsgnTu31QVwOHkziKp6mX7UhRbk02rFx5xgEW0caJfEh1F3w0Bnok
	H4zg+gjtFrRpQ5/zmJtyTU0kzY4l3MAHLlcG2kAhpc8Zx5j+uC+MOkfCl/r10VALmGqGWwDJq3W0t
	/4BN4IVoVePtMiuc4Eh+/OI9BfbJYxWzTebw4KhNpJzREDoI3r7LnhY80u9s9ZLE3sCYaGQbmtmxh
	FRmMPOSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAcw2-0000000FuMj-43UY;
	Sun, 27 Sep 2026 00:40:06 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAcvz-0000000FuL8-2PY1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 00:40:05 +0000
Received: from seu.edu.cn (unknown [223.112.146.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4f3640040;
	Sun, 27 Sep 2026 08:39:53 +0800 (GMT+08:00)
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
Subject: [PATCH 2/2] dmaengine: sun6i: Fix use-after-free in cyclic LLI error cleanup
Date: Sun, 27 Sep 2026 08:39:51 +0800
Message-Id: <20260927003951.11210-2-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260927003951.11210-1-bolin.liu@seu.edu.cn>
References: <20260927003951.11210-1-bolin.liu@seu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0e04dd8fd03a1kunm4a399e5a199ccb
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGBkZVksdQk8ZQkMfQx0eTlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVSkpJVUpPTVVKTUlZV1kWGg8SFR0UWUFZT0tIVUpLSU
	hOQ0NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=Qv8ifEVncZzTPztmWlYQJWRhMdWhrWKsTxnnyfWqrf7IxnVsut/D1vgdJD3prvWSCbAX74CHj0lqZSMWgcgJOzN15vuzXQYjFFAi2FMStlPZsSF0VDYeoE0VmbkLCU7WNjDcBvhQ3o7GK/cBSIJPxdpzYFGfVV9lrDHtLyJeihc=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=hyzCXCa5mKGjYrQQ4pIYenV4b4psqdzT9oL39eHS+S8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_174003_782734_FB4A28AD 
X-CRM114-Status: UNSURE (   8.91  )
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

sun6i_dma_prep_dma_cyclic() allocates one pool-allocated LLI per
period (audio drivers routinely use several periods).  When a later
dma_pool_alloc() fails, the err_lli_free path frees each chained LLI
with dma_pool_free() in the loop body while the for-loop increment
reads v_lli->p_lli_next and v_lli->v_lli_next from the LLI that was
just returned to the pool and may already have been handed out again.

Cache both next fields of the current LLI before freeing it.

Same pattern as fixed in the slave sg path in the previous patch.

Fixes: a90e173f3faf ("dmaengine: sun6i: Add cyclic capability")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
---
 drivers/dma/sun6i-dma.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 025a43d0298d..4d6ee2fbd682 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -876,9 +876,14 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
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


