Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954D7CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 04:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cDfkN4RgASnPISjCyv0z3UO7udtv0woiZYBLSoDhUL4=; b=wiYBtRl/IiLH5u/Kzl8vRpQXjG
	8WNaN2cdvpUaSsaiwOiDQmyhRKCBFBe5tHHGLZC9ljgwAv0cPf7GzeiwkqT7TN0hqLt7RRZHRHqNE
	rCmYAtJCwevhWhQJbEQ0PyovFgdGMtLAlqrmO8/pZ6g62AlF39oMbUPryG/iLY6qtdpaeb8O5tjzl
	amhzwa0CoTrDDHdDx7ye11om79Mc6LA0f0vRmS5Hp08i7gE3Y2uiCHlK+sbfnucu0jsFe645pY4tQ
	yrVzfy/6EzPEsuX01aPvZuxd9BX/tmASujaUgJmRPls/s9/pUz9yVZLL5kH2q6m+C4RwiU/LdM9rJ
	yebwXwLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIIBp-00000005VDi-0ZO6;
	Sun, 18 Oct 2026 04:08:05 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIIBl-00000005VCf-3Pi9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 04:08:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=cD
	fkN4RgASnPISjCyv0z3UO7udtv0woiZYBLSoDhUL4=; b=pG0qzv28dfr6ydQjA/
	Mp31Eql3Wr6kzrNffAJVozrufUZzpUio7XXmst4fmt1Zo4lri7eW//9WWaugZOL4
	Jo3+Dx4sDrumvahEhk2vox7bWvWkdzTpCZSlsfiisGM6RXOhS2WWcOC7fMqv60QP
	GXRMhalXe2vTIOsXtXA2p2Jfo=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3n6n9RdRqdUaGAw--.28247S9;
	Sun, 18 Oct 2026 12:07:35 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Linus Walleij <linusw@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Dan Williams <djbw@kernel.org>,
	Srinidh Kasagar <srinidhi.kasagar@stericsson.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 7/7] dmaengine: ste_dma40: synchronize tasklet when releasing a channel
Date: Sun, 18 Oct 2026 12:07:23 +0800
Message-Id: <20261018040724.534641-8-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261018040724.534641-1-yaojiale02@163.com>
References: <20261018040724.534641-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3n6n9RdRqdUaGAw--.28247S9
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFW7WrW5tr4kKFy8tryxXwb_yoWkGFb_Za
	40gr93Xw1DGryDCr1Utr15ArySvay2gFn7Ww4jqFy3XrW3Z3ZxJFWq9rykWr18uFW7CF95
	Z34vgryfC3yxCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRuuWL5UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7whjnWrURgjIHgAA3-
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_210802_297573_17C0B3B9 
X-CRM114-Status: UNSURE (   9.48  )
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

DMA completion handling schedules a per-channel tasklet that processes
completed descriptors and invokes client callbacks. Channel release
terminates and frees the descriptor state without draining a tasklet
that was already queued.

After d40_free_dma() removes the channel from the interrupt lookup
tables, kill the tasklet before returning the channel to the DMAengine
core.

Fixes: 8d318a50b3d7 ("DMAENGINE: Support for ST-Ericssons DMA40 block v3")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/dma/ste_dma40.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 0d9ffa3e2663..647a265590c2 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -2484,6 +2484,8 @@ static void d40_free_chan_resources(struct dma_chan *chan)
 	if (err)
 		chan_err(d40c, "Failed to free channel\n");
 	spin_unlock_irqrestore(&d40c->lock, flags);
+
+	tasklet_kill(&d40c->tasklet);
 }
 
 static struct dma_async_tx_descriptor *d40_prep_memcpy(struct dma_chan *chan,
-- 
2.34.1


