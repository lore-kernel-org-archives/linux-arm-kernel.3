Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB92C5B567
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 18:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1heC4kdbiOKopjs0B6gQi+UwOdRbZzbCNzgmPlgldM=; b=KsNQyjmbAHb8dIX0ltGRfxskP4
	ttlW3vJtPrKzTrzb0i8CfSSoPv0JfiCO3lhtTnx91maTRLu43BquhN9sOVSQuIQHwluJ/5zIISMa0
	3BAaeTKITnN97V8FH5v3EWB48dFJl7c7E2aQHgjLcRYeSc8BEjvH7QTUi0GPOS5It/0lt3ytrj70v
	TYxLMA9FrOMn/jil7GS3o3zx7JSE9e/CMoEZjZmEchFdQI981idM7uOn16ymsAqit1tIT42VvBVRp
	gqWAi6AczhNmg5doZjD3FbKQT2M8OYtkJr7pQPitTR7FwAIvb8T+W/w/IEFPNx/TiIvYsv1N25LQw
	MTgFsoTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUTu-0000000CbaV-3Vqw;
	Mon, 10 Aug 2026 18:12:14 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUTr-0000000CbZG-32xM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 18:12:13 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso1891516a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 11:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385531; x=1786990331; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P1heC4kdbiOKopjs0B6gQi+UwOdRbZzbCNzgmPlgldM=;
        b=MAnRqiqXk/hQMVaCmMQfgpChGklSjnBWjn9Wc0usmH3wJ3jud4ODd0eUaq75zt+h82
         7bgbp/EUe9oefw0fH8wI9D9rU4/uT7rdbO5epej7dSqSxbSiXhX2OHF8vbBxRCLJkgR0
         6MhQd6LgQ0Qo3x8BKVl4/KVuwCUTodR2r3ZcxOQy+xiaV/RhgCfAxxGwcAQokfNNUEBD
         zlQS+bd0c4QFYNIAycBMGWVLppbKsIGTuwT+b6jtDCLL4zkmXFVvrdrpjb8vFscjNrSX
         1ylakwLeiJOj5teQ5mpFgjuKeizZzkPIS8Lg8sDsXT7hwu07O5r7E4pbp6sFppGWr876
         oJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385531; x=1786990331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P1heC4kdbiOKopjs0B6gQi+UwOdRbZzbCNzgmPlgldM=;
        b=lzc+/V3eQ7MrHyKJDMABey3OJTyj85kD1LH4TPmBwPl8h9x7gHS7swsamOve/ki6hf
         MkQSHFrzec20VkUSQOEbor6U5T8VPlYTSlIB256iRXPZUMxVyWzzuIMHBal/iqeHW8ZI
         BZbK8JgpxTYjpGshZTsUktRR9R/m24fYz+GHh6N8gGiXqvos90BCr+Bsuw12H2XQkyc9
         k1HYBJ3YpIPL6UIWX410r+i7HdnbqSB/No62s8E8yVGe8XFtFW6+TJCoxr5Yj+oJDvdq
         Ez4xfgLzwKiXOvQjUFYvk7byZjYUhxPjYBWcixb9uupcNVwxD/1IaEIcT/c/or0JeMgt
         8a6g==
X-Forwarded-Encrypted: i=1; AHgh+RqqKXA3F0RUpapWTpQDQtupR75PY/XrFX0ON+rOnumXwYTZLkrRNHPrytNOervZNJUJ6p4Rn6Jk1G6CfON70oty@lists.infradead.org
X-Gm-Message-State: AOJu0YxWFSCi66nYpfOJjBLK7VnvZHa4lfkexJemvyuyDdFllcQMgu5U
	uesfWe4lSwaTJNYaAv0ryIMnxh6ssvW+0wBI97yrl34u7QGeM+UvcowZ
X-Gm-Gg: AR+sD13nuTGLGs2FJ+yit3JBwC4ZE9z/Bf6AJSYq/XKnNlx+Rc4WS1jNGGRXCu7XG1w
	/7FN3GW300ErwO4ZONtq7AA8n+bh6/EkY+datP9fsZVVjtrChmtSyggKVrbFAapEIsKQ80vyWXe
	ZvR94sdeB2SciWUj/UN/y/EngB480BbkULFtqlu5ZPlckL6/6bkNfyUHvYOHhIpIkAY8fBvtYWW
	9NCj8SLTdu2vfIthrC1OQ1ju7jJvj8dmBNZf2nijaCNYwigP9UAbqP136mVC6HgMucweUFbVmlH
	Tz7AuEKP5Ql3CQiEmf57oUxRFRGHzZ+BYjil/XPnYbUXWE4bBabeH5H0/kChqmunEbYyyCN5k6Q
	ER4Xw7KnkG5AzIAgpgQNRwwKgbVMWFxDZEIO91aPaEwOEx6zK8eqbJgkAu15Ddnhh5Aa2Igorw0
	f2BmYJVBzWmfc5hC6yfh4KTwh1pemxzIQ9r82rhNbJydRgDAx87QVqaTkOBoW6nRU=
X-Received: by 2002:a17:90b:3806:b0:38e:7080:b4c0 with SMTP id 98e67ed59e1d1-3903c5cfbccmr42496378a91.10.1786385531037;
        Mon, 10 Aug 2026 11:12:11 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:12:10 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 13/34] dmaengine: mxs-dma: use dmaengine BH scheduling
Date: Mon, 10 Aug 2026 11:09:14 -0700
Message-ID: <3dec314c8878181bbf9bd8bdf6d222c435643fc0.1786384168.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com> <cover.1786384168.git.allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_111212_507401_E9293E9D 
X-CRM114-Status: GOOD (  15.14  )
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

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/mxs-dma.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
index 7acb3d29dad3..149ac402f7b4 100644
--- a/drivers/dma/mxs-dma.c
+++ b/drivers/dma/mxs-dma.c
@@ -109,7 +109,6 @@ struct mxs_dma_chan {
 	struct mxs_dma_engine		*mxs_dma;
 	struct dma_chan			chan;
 	struct dma_async_tx_descriptor	desc;
-	struct tasklet_struct		tasklet;
 	unsigned int			chan_irq;
 	struct mxs_dma_ccw		*ccw;
 	dma_addr_t			ccw_phys;
@@ -300,9 +299,9 @@ static dma_cookie_t mxs_dma_tx_submit(struct dma_async_tx_descriptor *tx)
 	return dma_cookie_assign(tx);
 }
 
-static void mxs_dma_tasklet(struct tasklet_struct *t)
+static void mxs_dma_tasklet(struct dma_chan *chan)
 {
-	struct mxs_dma_chan *mxs_chan = from_tasklet(mxs_chan, t, tasklet);
+	struct mxs_dma_chan *mxs_chan = to_mxs_dma_chan(chan);
 
 	dmaengine_desc_get_callback_invoke(&mxs_chan->desc, NULL);
 }
@@ -386,8 +385,8 @@ static irqreturn_t mxs_dma_int_handler(int irq, void *dev_id)
 		dma_cookie_complete(&mxs_chan->desc);
 	}
 
-	/* schedule tasklet on this channel */
-	tasklet_schedule(&mxs_chan->tasklet);
+	/* schedule BH on this channel */
+	dmaengine_schedule_bh(&mxs_chan->chan);
 
 	return IRQ_HANDLED;
 }
@@ -781,7 +780,7 @@ static int mxs_dma_probe(struct platform_device *pdev)
 		mxs_chan->chan.device = &mxs_dma->dma_device;
 		dma_cookie_init(&mxs_chan->chan);
 
-		tasklet_setup(&mxs_chan->tasklet, mxs_dma_tasklet);
+		dmaengine_init_bh(&mxs_chan->chan, mxs_dma_tasklet);
 
 
 		/* Add the channel to mxs_chan list */
-- 
2.43.0


