Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6535EC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 20:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvRh7gEOxJwccvH3DNdGEY4DK+vaLBlyojbNRUKtWDs=; b=e1iW8LlL4V+GIXJgqQhhGVw32c
	n6YskPaDu48DqvWADCiKM75X52brTb+73avj3/Tx6nRhHYCdwD1awt3qEM7pBL+oNZcXHtCqE8/Mu
	g2RF33ZDur5AczE0g/iIh568TY1Kh65wnrYzaEut+tDsNxd7nzv9vz4sM8cQ5pKfoOBylMTdRKn8T
	arr1SvD0gPeuRLEhDgUGc8hLvhAaPgOp74rRQzizSd9EpcNjrAb/FpOMW7GRwX9VqXdG5qcvfz1sP
	wNNuWHSyZAK1XK9kY/3OYwN2+L9++ApNMM3AcaD0iFlZxn+t1frUPYMDcc0yffZ035dPXajhqDbV/
	cK105RWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woS7r-00000003rlr-0UMv;
	Mon, 27 Jul 2026 20:40:39 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woS7i-00000003rfO-0jdK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 20:40:32 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-84a2c90e383so262092b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 13:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184829; x=1785789629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lvRh7gEOxJwccvH3DNdGEY4DK+vaLBlyojbNRUKtWDs=;
        b=g7ZLMZCEwXvu7iBBGPGZMVa1uhzfePCUx9XeMPlUBp0gkzfII2+QzZiS6qKyAlKRp5
         cJMYVInUP/gLz7NLuEMaLgQgmCzZk5c8WnmlB/P+AX7sUKjsl9El85cSAhNsraUAvyFJ
         Ab6J0A5G6OOV0x4axLJ5wHWt1ExGghCdrky2aezMVgMu6m1DxEGRfvca48QpyUCrvkrY
         xa4pnp0rITFodv82lBWwJuttz7mPVJnjXvuQp4hPj4GGhycqkVjNaRMgrF/qQC6pazod
         xjHFrr56PruwiXLZ9jN6Q0dt6XZ7j9Mk2zXxg7HyJGqvYAnLDXIyFJxihEtLLTUxThvH
         7+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184829; x=1785789629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lvRh7gEOxJwccvH3DNdGEY4DK+vaLBlyojbNRUKtWDs=;
        b=qOtJyW/tt7MSNoov52+eyXZVZT4Fsu4XQBelLtdCa3YXtgcVdVxACa76gbY7s6qzfm
         FLsx+jQSS2erNejXYlJHy0fHylyAR5kPBH/IeMkxmzZOq0muEqKCAa+i+sk3q0As/48n
         CBevBKVRQBh893owzFCztiT1pTmESFZiUtnGI/8bo307biwDjTIznwN0nM9NvRZJMvPz
         9vpvOK6/S038ROwVYTrC7H8+iyjU6h0cnT7OPTWmVHAS80mJZHMoleAUBzjPr7FIY+gK
         svR8N0PPNa0WnXMs/IS9VtZIyLTa4fvaWBYn7/B1Zg8M6ZTBOTA8FkwDrqXjoolW2T3z
         c4wA==
X-Forwarded-Encrypted: i=1; AHgh+Rq7oLGNr0O+/YqjLBnEYvaOB08WkJLIaEFGiufe7o0A701arN3HRbBO+1181N/FCzD5Nj3mBmBb7PfebREN2rR+@lists.infradead.org
X-Gm-Message-State: AOJu0Yylf4Uc+Pd0bZtKfsqwXX4mSsuCJ949kZlttGNcfvHUfZYEXfd7
	EzIF3Vw5c8wwSjECmiUqOO+B0GVpgV5WehXHTfQIA2OwyCTp1sIZ3QWZ
X-Gm-Gg: AR+sD11WbMYl4pzrQa3Q2x5K3l4bODubvg9ZBEH081YEURC3zTNiXx2fnGp8nwgj6Qc
	vnLGypsjaiSRUjYxXcuIQNsFabC5YSQxXvKd2AaIB/kgGUFllgtZTRudfyyLTaZR6PT+JG3EdB0
	hBwwlnQ8IeS9rDXrCnzUlGAfsIpa6wHHnJZomCU3XInv3QrdC51P9ftD4rL4QSkLjKWFCEblbwc
	upRDikTv/VXBmm+QgFQvImZEg76fpKhW9eUHb7C3JY0xbsXobvveO9ZcebTIQXW+RPceinKPgmn
	CgCda0dLOMlvxkdyTm64zH1exLi8mLE6x6EW2ytLcdtrroM9w4fufcdSbj1HlN4Tn8gxGSIj/lO
	Z9vPHgVVafdiBQxg2dYndEJ8jAiCE7zopaPRCoyOgITcJZNb3IZeXkU/n4gehmxKBQKNsyPG0cJ
	sQPAz3
X-Received: by 2002:a05:6a00:22ca:b0:84a:29af:a0eb with SMTP id d2e1a72fcca58-84e8fc09bafmr184669b3a.9.1785184829248;
        Mon, 27 Jul 2026 13:40:29 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:40:28 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 45/64] dmaengine: mtk-uart-apdma: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:39:07 -0700
Message-ID: <dd94300feb7feaa826b8fb75e1f22c82a6f54bf4.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_134030_627045_4E8DBE25 
X-CRM114-Status: GOOD (  12.04  )
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

Use dma_chan_kill_bh() for virt-dma cleanup.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index c269d84d7bd2..4d89927922f5 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -312,7 +312,7 @@ static void mtk_uart_apdma_free_chan_resources(struct dma_chan *chan)
 
 	free_irq(c->irq, chan);
 
-	tasklet_kill(&c->vc.task);
+	dma_chan_kill_bh(&c->vc.chan);
 
 	vchan_free_chan_resources(&c->vc);
 
@@ -463,7 +463,7 @@ static void mtk_uart_apdma_free(struct mtk_uart_apdmadev *mtkd)
 			struct mtk_chan, vc.chan.device_node);
 
 		list_del(&c->vc.chan.device_node);
-		tasklet_kill(&c->vc.task);
+		dma_chan_kill_bh(&c->vc.chan);
 	}
 }
 
-- 
2.43.0


