Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE36C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 20:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0ft1nhloqnztuc290Fs03Kt4IzqAO7BmLTHY5joAAk=; b=ilxZEE84jZb5Ixe346KUh6MhdB
	UsivXX7cjxXFKZecqBjQZhcUwU6cjCuAd5QtM7iHOPQ5LWibUKvU94wNH/p5WlcDmjHcFhWQJarCf
	qP0Inw7c0GGtlxMIwDW3N3VKZX2GwYTR8qgLJ05ep8BiPzY0kAEfa8hifAUlQLfW6BlFcva6Ooxr+
	XPmphj4q9TGuBi9EvnW4a+Nu63cwsR88bhPQJgMIvyPF8MGxS7zGbWsXQa8x5udJqtb+jEkz3OxCt
	/vxr7j9Ur6/SN2CTyPr04pC6258oNL8+1v9AT28ZHnHHzyXpKEo//GJnRWks9ZkZsCOijZTkz0/Qh
	8wCQL09w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRzS-00000003qWo-2f16;
	Mon, 27 Jul 2026 20:31:58 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRzQ-00000003qVP-1Ybs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 20:31:57 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2d004f135b1so12220135ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 13:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184316; x=1785789116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0ft1nhloqnztuc290Fs03Kt4IzqAO7BmLTHY5joAAk=;
        b=TsU0zrlhnFPTfLLLnDEFbjJz4HVofr1pbyG+YmkCyL20IpI3Ak+PzF5X9brC0PqzKA
         /mjM3KKMZqTetvf8mRh9JykszxMCGHkY5+oOVS7lLJM/+XIVQGboBoj2b8PW03kqRBhZ
         1ImwYXapH9IrfSohzSJvN3jBxbi15DVgyGjZT4VDdqQ6SSZ8kNEf2GFkeZ4HZQoeNNOj
         xYCjwUyafbb3MkbLW3QIGfrxQw7C/PxZxeeiSbw8R6rqMqkZzUg9FaMLH97VkeD1Mvsz
         pxH1sQFrZt4haANfhjv4ZG4Nl+soipPrf+M43KJWCqYBlKZuVtCj2J61PYDqWj9vQJO1
         SKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184316; x=1785789116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d0ft1nhloqnztuc290Fs03Kt4IzqAO7BmLTHY5joAAk=;
        b=L15BBz4yDgrnT//PP+kJD3DfJoHZnchQ+rlrASdQhhm8sc9x9Fb/wS7vgdWVufydRG
         07bv/uSR9r9WY/EFMoURCQX8hYzNvCdS6y+0b5j3qptg3XwE0TkZB2xP3kErgzPdYdVI
         +axoNe0/T9dGc7An4SgyIqaDOB7eAgZdoyMvGfupY73ta6Bf3wqnvFd1pbhEY+p9OOm1
         M1nJxBk9V4W2UTMsKeOr/+5uAmBOesJiejrGvf98AnoB/QiMfkgz/dkBS9d9CA6j7PYS
         jq9+ieFc9UlhpVddsnHTgRrRmTBgbZplGlqNsTW173lXBJF7q+SryfgeNcHYa/B0Ola/
         vYrg==
X-Forwarded-Encrypted: i=1; AHgh+Roq3QTGVxPK4BOjfcJWDgUKE1JujHvTVBgTfuSai8BwPAoLhfyAKP63V/JgtX6KDilpI2ICrrdXAtH5DZiuJAoW@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6ryY37kv0IWmMNy29wyoNMXvcfpZd/IvgsbQQuI6uVvKUU8ab
	b7ssV2euGaOT2vFthJ5wzCiHIjokmB6DHk2Om8B77ocIPWAMJioJTVmH
X-Gm-Gg: AR+sD12YEpI2K8gJZmtPuQJUMWYf6mgLpi5wovWAIq3Jq+/s6itg0zfspytRpNI3G3O
	/svl7kei8Bw/N7v21S2nDbj8z/XNX/MvodS5QM9zfbVmzuRAyC8ZfonEiuNn6U2RwW4e0maac+z
	g8gh0guAmSuYlBLNIPe0UsHChCwk1hvjGIdbSSJ/piKBKXu+MU/HkhVEllZ7wqoYoM/em5r+Vl5
	16oI7XO27aKiwUO1jRXFPjD9DDCKRKqiE6dvf61wpAnsUYJ2BAfA3B/ztmTo/Hm3Lw2lA6zC1zu
	erjeaCnTIR1t2AP7jZEprLAdDUrY3zyY7enx+2egUYK/FZACvvXnMkccEJNIFYztIYP/oD/gDsw
	Gl8TX30xCvAed1OVoDvu4I1+DTRRfjcgN/dDfUQxk3w/RvIzv+AvijpInCz8Rs7suIXXVz80RPz
	cx4cVj
X-Received: by 2002:a17:903:1663:b0:2bf:9760:b94d with SMTP id d9443c01a7336-2d00f42d025mr7516855ad.15.1785184315598;
        Mon, 27 Jul 2026 13:31:55 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:31:52 -0700 (PDT)
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
Subject: [PATCH v2 13/64] dmaengine: mxs-dma: use dma_chan BH scheduling
Date: Mon, 27 Jul 2026 13:28:41 -0700
Message-ID: <e0499d943001c6ef2142bfdc910f584dd575e8bc.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_133156_418566_35F0C91C 
X-CRM114-Status: GOOD (  14.97  )
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

Replace the per-channel tasklet with the shared dma_chan BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/mxs-dma.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
index 7acb3d29dad3..8cecc0add82d 100644
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
+	dma_chan_schedule_bh(&mxs_chan->chan);
 
 	return IRQ_HANDLED;
 }
@@ -781,7 +780,7 @@ static int mxs_dma_probe(struct platform_device *pdev)
 		mxs_chan->chan.device = &mxs_dma->dma_device;
 		dma_cookie_init(&mxs_chan->chan);
 
-		tasklet_setup(&mxs_chan->tasklet, mxs_dma_tasklet);
+		dma_chan_init_bh(&mxs_chan->chan, mxs_dma_tasklet);
 
 
 		/* Add the channel to mxs_chan list */
-- 
2.43.0


