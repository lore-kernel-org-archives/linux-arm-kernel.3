Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A462C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 20:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0a8MYcKw5JTNHHIrN3K1TaKhBFHL7HNLhSi2FpFsKc0=; b=cvn82JDVTU2vHuATpLUzZUJh0O
	AtkiruuXpFuDPzSFdqFnFqv6knwunqWGNU31SKB9E2mUKipjTnk7qWC/t4KVlP7dWKXwgimcpNeox
	ZiZxCsGYL2Nb2//VYrNq3ab8UzoftgPb9a48UUTDXpd0laOJY8v/rWCDbCmF/arVIq4otVKdH91Xx
	YtOvCRfhtCwa5OZebHHFAtgG5gfj323yMiZX3xuQ7iEH10Q9fVKzasOGGKdPvLGOw7uTq5QgoZxW/
	zmo+t5LirETmkMLdG4vKO40aE+VhnNAjVS3h75Y9MAKv2Yntecudh658eb6WOA6wuGgWhOWy451Qm
	rt798S3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRz0-00000003qL5-1Vxi;
	Mon, 27 Jul 2026 20:31:30 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRyy-00000003qK9-2DVx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 20:31:29 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2d004f135b1so12216655ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 13:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184288; x=1785789088; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0a8MYcKw5JTNHHIrN3K1TaKhBFHL7HNLhSi2FpFsKc0=;
        b=fC3HRU9HItm6x31rAa5d3g37lJt0/G28OGiyNEqPFN73LcyNZLDyBgb2AcRc/U4o/+
         Q3ILUDZFTseUv6iT2mMZ/XRxTv2FIfPWIpzDaYKU3Z5N/5fef+Ee8hQQLGFrUbs7XW1w
         7KvJ6At6GkwTizTiKoDWGlWpXoiq2MqP90JsD8KTk3JcJtkftRCcxyscopSJzeHg5Z07
         uiz6JRX/oYPtN6rULdeb77y6Q+ocJJh1DVIBFlluyg0zmRtWL62C14SQZeZ+Ali5g94i
         eRNzS6LZNAYECIs8yn2mcPFy7pSjnRdzz8pJCyqZcIM26NGzvhMJpZQuRPvHPMeMj3OZ
         eobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184288; x=1785789088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0a8MYcKw5JTNHHIrN3K1TaKhBFHL7HNLhSi2FpFsKc0=;
        b=aJb3qZ42q6rNCAhcGTGgRk8tAbZZP2GgoUDTIvmgkOf8F5/C3v03hxeZ6jASPMQPO6
         7sY4tHe5i7CHn9O4jdKgL9rqd0egyxtPIruu2L4QnCiYTJ8/grJ5GEWJDYZ7ZicjkRVO
         DZt4tBX7B7amRH+0yshmScPu8S+tXJkRJuZb46AF6npLOCXavIvysdsqkM4EYvCgWvOE
         +OVe39gJUdeOEGdUQ8LldW2i6ral8H6AXeuz/0hC12kHDEyOCusYvSy2mf9ldrdKigmf
         6KE0cVDZvQt046boVk6C9oJtxjF3r3tc54kCEA7XlfBQLueTUvilTyOqsoyCjB0zCE9v
         LRSw==
X-Forwarded-Encrypted: i=1; AHgh+RqV3y1Hty7uWM74f6DquA6cxJ9lB7bcCmi5S9BFl3zmb2/Iv1WiTuxEsFQlXjC3DGL6ixCAy3ZuRaXA49zTH+J+@lists.infradead.org
X-Gm-Message-State: AOJu0YwrsthgCHFktBCJu+oTsOhp8mtHuakep2oe9LAAfgv+X/Uecegf
	zSs8E6LPCED20JNSVXGJB7NXSwK4/P6gusHjMZ4orFDALTJ3r9S/NYYX
X-Gm-Gg: AR+sD12LzPT5dRa3ply/ll79wdLpVKtsOPro8F4dYscsSK0kZfTls337+EzfuwC7U8l
	ry+VRUp+2JvnYvXz18M7b8/QFOKdGXA9mzdGgCFf0eIvWLiU2QmiFlFFPNpGzQ2zW1MIcWfEMxO
	n2cpuvoOyCDasQ7waH4WT7zSnVvKidsLwTjRL7e6aNQuwpjD/uwfLM509GWaBUhm632/4o+p4ka
	aCzub+smg2s4TdaWlgjy5LBIAz97DDrBlUUWSSHKlLejMcLdKwk6ScwoU7bq7rgHqIu7U6obbKu
	4bltKt23hAiHSg6n2tEqvs+pdGy2WopRrl19ofAIuO5DHSJzY1jdG7X1hPbfFII0B6Awj1pOKPz
	QXDzpz47FFfdvIS3TyAhU1ZB/Y49NEeooI6CXwhqSgLNjlaA8X30NzZ5vIB9PN3BYCtZDlJsLxE
	jr/rTZh4jzWHXr2yo=
X-Received: by 2002:a17:902:e843:b0:2cf:dc6f:cc42 with SMTP id d9443c01a7336-2d00f5da251mr7142445ad.46.1785184287499;
        Mon, 27 Jul 2026 13:31:27 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:31:23 -0700 (PDT)
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
Subject: [PATCH v2 08/64] dmaengine: imx-dma: flip per-chan tasklet to dma_chan BH
Date: Mon, 27 Jul 2026 13:28:36 -0700
Message-ID: <fbe4067de02f050d3b2f958b3a04dcef0549b6f6.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_133128_573151_5A661410 
X-CRM114-Status: GOOD (  15.13  )
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
 drivers/dma/imx-dma.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
index 81c6276436f8..3ff0bfbfa5ff 100644
--- a/drivers/dma/imx-dma.c
+++ b/drivers/dma/imx-dma.c
@@ -145,7 +145,6 @@ struct imxdma_channel {
 	struct imxdma_engine		*imxdma;
 	unsigned int			channel;
 
-	struct tasklet_struct		dma_tasklet;
 	struct list_head		ld_free;
 	struct list_head		ld_queue;
 	struct list_head		ld_active;
@@ -344,8 +343,8 @@ static void imxdma_watchdog(struct timer_list *t)
 
 	imx_dmav1_writel(imxdma, 0, DMA_CCR(channel));
 
-	/* Tasklet watchdog error handler */
-	tasklet_schedule(&imxdmac->dma_tasklet);
+	/* BH watchdog error handler */
+	dma_chan_schedule_bh(&imxdmac->chan);
 	dev_dbg(imxdma->dev, "channel %d: watchdog timeout!\n",
 		imxdmac->channel);
 }
@@ -390,8 +389,8 @@ static irqreturn_t imxdma_err_handler(int irq, void *dev_id)
 			imx_dmav1_writel(imxdma, 1 << i, DMA_DBOSR);
 			errcode |= IMX_DMA_ERR_BUFFER;
 		}
-		/* Tasklet error handler */
-		tasklet_schedule(&imxdma->channel[i].dma_tasklet);
+		/* BH error handler */
+		dma_chan_schedule_bh(&imxdma->channel[i].chan);
 
 		dev_warn(imxdma->dev,
 			 "DMA timeout on channel %d -%s%s%s%s\n", i,
@@ -448,8 +447,8 @@ static void dma_irq_handle_channel(struct imxdma_channel *imxdmac)
 			imx_dmav1_writel(imxdma, tmp, DMA_CCR(chno));
 
 			if (imxdma_chan_is_doing_cyclic(imxdmac))
-				/* Tasklet progression */
-				tasklet_schedule(&imxdmac->dma_tasklet);
+				/* BH progression */
+				dma_chan_schedule_bh(&imxdmac->chan);
 
 			return;
 		}
@@ -462,8 +461,8 @@ static void dma_irq_handle_channel(struct imxdma_channel *imxdmac)
 
 out:
 	imx_dmav1_writel(imxdma, 0, DMA_CCR(chno));
-	/* Tasklet irq */
-	tasklet_schedule(&imxdmac->dma_tasklet);
+	/* Schedule the IRQ BH */
+	dma_chan_schedule_bh(&imxdmac->chan);
 }
 
 static irqreturn_t dma_irq_handler(int irq, void *dev_id)
@@ -592,9 +591,10 @@ static int imxdma_xfer_desc(struct imxdma_desc *d)
 	return 0;
 }
 
-static void imxdma_tasklet(struct tasklet_struct *t)
+static void imxdma_tasklet(struct dma_chan *chan)
 {
-	struct imxdma_channel *imxdmac = from_tasklet(imxdmac, t, dma_tasklet);
+	struct imxdma_channel *imxdmac = container_of(chan, struct imxdma_channel,
+						      chan);
 	struct imxdma_engine *imxdma = imxdmac->imxdma;
 	struct imxdma_desc *desc, *next_desc;
 	unsigned long flags;
@@ -1142,7 +1142,7 @@ static int __init imxdma_probe(struct platform_device *pdev)
 		INIT_LIST_HEAD(&imxdmac->ld_free);
 		INIT_LIST_HEAD(&imxdmac->ld_active);
 
-		tasklet_setup(&imxdmac->dma_tasklet, imxdma_tasklet);
+		dma_chan_init_bh(&imxdmac->chan, imxdma_tasklet);
 		imxdmac->chan.device = &imxdma->dma_device;
 		dma_cookie_init(&imxdmac->chan);
 		imxdmac->channel = i;
@@ -1211,7 +1211,7 @@ static void imxdma_free_irq(struct platform_device *pdev, struct imxdma_engine *
 		if (!is_imx1_dma(imxdma))
 			disable_irq(imxdmac->irq);
 
-		tasklet_kill(&imxdmac->dma_tasklet);
+		dma_chan_kill_bh(&imxdmac->chan);
 	}
 }
 
-- 
2.43.0


