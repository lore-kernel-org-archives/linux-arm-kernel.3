Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6DCC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 20:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sa3tfC8KOPtChDmpcRt2oXEtiFfA9yOH4me4ekfnls4=; b=yFfr9FRw6AATNQuWv/nyvl1uOa
	T4leYtQT1KL9sdFCMP2k+cANqBblOohDpyYOXtUzZTdanGlAK7qS6D+9zDpBCFFqn1m0wY7HgGsun
	1EyUvPZKxNttXt5axiMH8Z7V28L8/XrtsiJ1MnBH1vtP8JdVbion/W8S9C3ojRcYvIp01NdGYQpMc
	oKchd8tmQsu+I0V4Wr4YoP1aNp/pMOkkloo//3fdQdzkMIVnzKxSMRhfkY+8xHaO7gjrJ0cg+aYAP
	PAf4LB0Qv6i5YRaK6Q9Wxn1mbUmtYh73uQgFz4e8Z/hl7pSAGoFH7xkSAhnYBxfYoeIvbYuh/2CPg
	uo8Z53sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRyl-00000003qGP-131X;
	Mon, 27 Jul 2026 20:31:15 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRyd-00000003qEH-3TDn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 20:31:08 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2cca0c5799eso29752835ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 13:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184267; x=1785789067; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sa3tfC8KOPtChDmpcRt2oXEtiFfA9yOH4me4ekfnls4=;
        b=UV1X+rjBS1Rfla7qICfyr+vxgnI/rUf+rd3ZX0VoZsRc0/D/Jxw0iMLez/NRSEYbEy
         /PCOv1e+MI3pmEY9yzL+GL2hT0raG93u8/NW0WmaBPCELzUKfcIBHFLSi0a9xxobcaZx
         vTUQ0kDfcND8i469fjWbG91X5MgrFFoxgalQiD1RcY8H8RMjXD4pEwdRKE9+EU9TF8LS
         glKAfbaOZLkR7be5zG183pg7N4jGvUGtfIXOWjOflQhF/x+/EZxM36JME+QYIq85vjoB
         uysQjobDlHF8vlHMOVS6jS6fnLTZMBLNtSIAzMq1ZVTslWMZBVy/6Em84FkF/i9/NH2R
         vwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184267; x=1785789067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sa3tfC8KOPtChDmpcRt2oXEtiFfA9yOH4me4ekfnls4=;
        b=KEpIqyxYqCzfIWo2S5m4MNzzqPdPEW4JL7gPEdYhVMGZqX6p/9Mz8zcAmddrd+GNTy
         hT7ob/o0kmbouJM+wI0cSr8cJzuLct5MsXrpE85hOV5Z8nrPeRfDV1XF+jbm2hg2MM5+
         YhzkWOYZmG1ldysp3iBt/IttZBd+QI5wS5tDpwDpajzc1haHeyrlE5+z9+9tzq1/36IP
         dlGMIiUBTsDNo/KMFzPjbYjZ7RkU96wleqkPfEphanCDHkk5ir+ePGTSscwiuflEBond
         2wfVo9tFIg+r8DMkKV0jPxU3lZzixb/k2NO8eygCKsoOvE5p3m6Td8pbCbCaSmOzfHf6
         cO/g==
X-Forwarded-Encrypted: i=1; AHgh+RqANUVV4L78g8X70mEowlyfqdXXqDKMYWlu312SVAlVUw+NjRRpqJNouGFFgYMqBQpMXrNvlQpsx4licdGGQ3xt@lists.infradead.org
X-Gm-Message-State: AOJu0YzdowavcvEvwBKmV/AQWdqYcSA4tLpN26ovCHh3wmXzLzFavotw
	KMX0PsDDKUQghGYdk1mWGNu1Mo9mn3Z5fsK3+wCLZjy7Qx+BTvoRGaDq
X-Gm-Gg: AR+sD112IvRjYTUMhf7NdXovgcpcj5aXhRhk0/sZdn3FK4gdtWaTB1BcBU6l41TWWP5
	NR8Ky8y4R1tQ7ARwYvDaOHwt9g4D1ADEy4twxspybWJfUgJEM5jxUdMxMEybnololevqfnc3sQD
	HJ3JIYjhNYr2akjaeqBT3aPOqNNcEzPUh+jJYzP/9eT6M5spWaeXCNLq9LiVxjXba4rhu9wEKHa
	/XI3Fzww59gpVSt8XPDMNuOwOsmZSA6Wr2ginNyluAuRBKETAhUpLzwsPLgx2RRymWke1/8RYs1
	opgp/Ry5hNLHaT0lxLh6El4v50cg3kjoq6uasUTTuD6UksvPLXxwhBdcflFMbCB7Z7kL8fIHzE3
	1LM8o2ENJXKaPMJvOlUzAfpLcsngUjtxTZ/CwY8bgZLWgWJjMguKzvMX/Rzx+gjvwRVg13z/aME
	+W7e0U
X-Received: by 2002:a17:902:e810:b0:2c9:c517:d070 with SMTP id d9443c01a7336-2cfde6880d0mr92860635ad.3.1785184266851;
        Mon, 27 Jul 2026 13:31:06 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:31:06 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 04/64] dmaengine: at_xdmac: move irq bottom half to dma_chan BH
Date: Mon, 27 Jul 2026 13:28:32 -0700
Message-ID: <06f8d1586f29e59ffa367c04b49400a81c0f16cf.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_133107_867534_6454CD90 
X-CRM114-Status: GOOD (  16.26  )
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
 drivers/dma/at_xdmac.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
index 901971e8bae6..aa918043e37e 100644
--- a/drivers/dma/at_xdmac.c
+++ b/drivers/dma/at_xdmac.c
@@ -228,7 +228,6 @@ struct at_xdmac_chan {
 	u32				save_cndc;
 	u32				irq_status;
 	unsigned long			status;
-	struct tasklet_struct		tasklet;
 	struct dma_slave_config		sconfig;
 
 	spinlock_t			lock;
@@ -1759,9 +1758,9 @@ static void at_xdmac_handle_error(struct at_xdmac_chan *atchan)
 	/* Then continue with usual descriptor management */
 }
 
-static void at_xdmac_tasklet(struct tasklet_struct *t)
+static void at_xdmac_tasklet(struct dma_chan *chan)
 {
-	struct at_xdmac_chan	*atchan = from_tasklet(atchan, t, tasklet);
+	struct at_xdmac_chan	*atchan = to_at_xdmac_chan(chan);
 	struct at_xdmac		*atxdmac = to_at_xdmac(atchan->chan.device);
 	struct at_xdmac_desc	*desc;
 	struct dma_async_tx_descriptor *txd;
@@ -1865,7 +1864,7 @@ static irqreturn_t at_xdmac_interrupt(int irq, void *dev_id)
 			if (atchan->irq_status & (AT_XDMAC_CIS_RBEIS | AT_XDMAC_CIS_WBEIS))
 				at_xdmac_write(atxdmac, AT_XDMAC_GD, atchan->mask);
 
-			tasklet_schedule(&atchan->tasklet);
+			dma_chan_schedule_bh(&atchan->chan);
 			ret = IRQ_HANDLED;
 		}
 
@@ -2317,7 +2316,7 @@ static int at_xdmac_probe(struct platform_device *pdev)
 		return PTR_ERR(atxdmac->clk);
 	}
 
-	/* Do not use dev res to prevent races with tasklet */
+	/* Do not use devm resources to prevent races with the BH worker */
 	ret = request_irq(atxdmac->irq, at_xdmac_interrupt, 0, "at_xdmac", atxdmac);
 	if (ret) {
 		dev_err(&pdev->dev, "can't request irq\n");
@@ -2397,7 +2396,7 @@ static int at_xdmac_probe(struct platform_device *pdev)
 		spin_lock_init(&atchan->lock);
 		INIT_LIST_HEAD(&atchan->xfers_list);
 		INIT_LIST_HEAD(&atchan->free_descs_list);
-		tasklet_setup(&atchan->tasklet, at_xdmac_tasklet);
+		dma_chan_init_bh(&atchan->chan, at_xdmac_tasklet);
 
 		/* Clear pending interrupts. */
 		while (at_xdmac_chan_read(atchan, AT_XDMAC_CIS))
@@ -2458,7 +2457,7 @@ static void at_xdmac_remove(struct platform_device *pdev)
 	for (i = 0; i < atxdmac->dma.chancnt; i++) {
 		struct at_xdmac_chan *atchan = &atxdmac->chan[i];
 
-		tasklet_kill(&atchan->tasklet);
+		dma_chan_kill_bh(&atchan->chan);
 		at_xdmac_free_chan_resources(&atchan->chan);
 	}
 }
-- 
2.43.0


