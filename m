Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA074C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 20:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HXpvuPVqT3NSYIRT/XpZ2ZRtWOA79+OnBYVQ1PWJH2c=; b=ghzmQ3j03elsN5a3QkRTAfeB0y
	e04Pm32KpZBZOdcbuX54OHlcDFrQbhw/ZtaQxG0BTfYMexDtANyBgi7CpeSzLyfnQYIpli2NnjCsm
	MP83/PoiTU3oX3mrUAju3fTci4pD5zZaRZKE0YQjcdwF/SxFs7tSpCDDNLhZcTLgD8g4g6EDD/NXP
	uIw8wmbOUbR0qL639dZjXNaLzfyMNaZs5pc09BsxxCySKflCysNFcsp92WAxcN12KSoKfjQK2T6NR
	9T2W+MJLfJMCOyzH21tqHH1CNsONyRgDx7ckwnEc3gtaV2kZn9cYu83TZhVM0LHz7zjMlSvuIXv+i
	nGmiy7zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woS04-00000003qmY-2HZG;
	Mon, 27 Jul 2026 20:32:36 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woS01-00000003qku-25zL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 20:32:34 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ced3386430so32467045ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 13:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184353; x=1785789153; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HXpvuPVqT3NSYIRT/XpZ2ZRtWOA79+OnBYVQ1PWJH2c=;
        b=UMc9O55PsAKNklUfUAmwRJDB64PICMXL/9W14Ux+64rBloYKLF6gXmEqj0Ww929kIA
         uF9i1FcbyjpJEvN/6v8lmPLgCjOkUILZ88dCTipyYQMnXZ0z7cHHZNy8jnwUvm2E4G9U
         lEiMB5ndBE9zSOLcV+g0lGKew4eaO2P1p2Hi9b0pArOzonPxnlDTTZVD3YFqUZ2n2Ynb
         9JzZu9pFi3xUireRbmI0wug64y+jsiI2IeK+6jMDwwfKwqxDcbV+SX53JBuedunUFJom
         vXj8FFtgyaOZgOqrNF5CkUuloo/SBYp0rBR3VAA7vapkdfMwo99oOh8Ajc0k3F99Fi9m
         7jYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184353; x=1785789153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HXpvuPVqT3NSYIRT/XpZ2ZRtWOA79+OnBYVQ1PWJH2c=;
        b=hLG0ch9KES6KDnrtCvbz5t4pixSGZOnNJDpv4Ej/7kP4MckFv+hcVjBs2PUC5ndKT8
         ZLdqvMHN7ehz83QDqiuVZDJl2V221hQokbeQBr3ifR1nt6Ij4vkobj3XvT+CJZdy4lXy
         wR5By7twm9PPIcjFAsid7M3eqQ6XOWRjNHxNFBk3nSlE2o8fskLy/2ptkYaSsybuitBJ
         5Bjzg9TjUczoJRw7e1iv6fziBFY3eimsVX2NRbrfsJInFGp+MuC0vd+/gYvLlOJWTffk
         3hac92z1OnsObrO34iOmOX/Md99SurrOvB9zyu9sOEHN2BHkVBK9gWQpxtwMlQymza8T
         O/ow==
X-Forwarded-Encrypted: i=1; AHgh+Rp9v5/Fjo/MHSifZsA2zwOJ2Pel9W4Xt7wTt7WgB5TMuVoDBbPbe3CwFgrSUHjWW9wVGEzzmoeiINrIopfVtrEY@lists.infradead.org
X-Gm-Message-State: AOJu0YwTmo30Aaz+/Gpb3MWMPQ2q/z/fLDk9GNjuf1ZhfdgTYRTQwuEU
	7oi8GMaM/h53GWox5JUFTZZlOoafGS5kUneX0gNt0EV/MlwQjRT6XrUw
X-Gm-Gg: AR+sD13Md2lWTob/j2t3EePKcpf+KtwkdqjSCeuJt/8qa0JEKmDdKoqqsz4DYt2fKeZ
	iXRWaISxhpEeuwwz+oGUurIsFYHZ++fAW5d+y7tFxSML5IDEAAefwGlfpFnVAvJ9WKj0Q1qLYlO
	GcV78vDWeZtoPanjVF9HxQxcPWoSurFderjVaGmquqBgkJwmp80+9S1M8iBcNJha6w8nf3j2KAr
	m2r2UZ+E61yISyvb6keh06dIxkvLQpFzrqdXKBiAdqrGWG8ZRefRVOK6mQW/Z5uNQ+iAlsXqQra
	I5snL30KY1KirAkQdvwSWABPFUymbd8Hk0b5fpZZDWyKY6v+e9ZiTUw3oq6E3fsLCa8uh8N7S1X
	e4LSOJ1t8WakJDQXVqBpVYZD3Znl0C3g2MEbvrWHgM+CpLea91kxfsak4ZRHjyYlT0FIua7cABX
	XL/+2m
X-Received: by 2002:a17:902:f787:b0:2ca:2073:3119 with SMTP id d9443c01a7336-2cfde86bc98mr94605435ad.32.1785184352698;
        Mon, 27 Jul 2026 13:32:32 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:32:31 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Abin Joseph <abin.joseph@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 21/64] dmaengine: zynqmp-dma: switch completion tasklet to dma_chan BH
Date: Mon, 27 Jul 2026 13:28:49 -0700
Message-ID: <72f509130ced9fd642dbf3906d253f5addff444d.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_133233_542960_30E63AA1 
X-CRM114-Status: GOOD (  13.71  )
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
 drivers/dma/xilinx/zynqmp_dma.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index f6a812e49ddc..6291126cdc9f 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -207,7 +207,6 @@ struct zynqmp_dma_desc_sw {
  * @dev: The dma device
  * @irq: Channel IRQ
  * @is_dmacoherent: Tells whether dma operations are coherent or not
- * @tasklet: Cleanup work after irq
  * @idle : Channel status;
  * @desc_size: Size of the low level descriptor
  * @err: Channel has errors
@@ -232,7 +231,6 @@ struct zynqmp_dma_chan {
 	struct device *dev;
 	int irq;
 	bool is_dmacoherent;
-	struct tasklet_struct tasklet;
 	bool idle;
 	size_t desc_size;
 	bool err;
@@ -735,7 +733,7 @@ static irqreturn_t zynqmp_dma_irq_handler(int irq, void *data)
 
 	writel(isr, chan->regs + ZYNQMP_DMA_ISR);
 	if (status & ZYNQMP_DMA_INT_DONE) {
-		tasklet_schedule(&chan->tasklet);
+		dma_chan_schedule_bh(&chan->common);
 		ret = IRQ_HANDLED;
 	}
 
@@ -744,7 +742,7 @@ static irqreturn_t zynqmp_dma_irq_handler(int irq, void *data)
 
 	if (status & ZYNQMP_DMA_INT_ERR) {
 		chan->err = true;
-		tasklet_schedule(&chan->tasklet);
+		dma_chan_schedule_bh(&chan->common);
 		dev_err(chan->dev, "Channel %p has errors\n", chan);
 		ret = IRQ_HANDLED;
 	}
@@ -760,11 +758,12 @@ static irqreturn_t zynqmp_dma_irq_handler(int irq, void *data)
 
 /**
  * zynqmp_dma_do_tasklet - Schedule completion tasklet
- * @t: Pointer to the ZynqMP DMA channel structure
+ * @c: Pointer to the ZynqMP DMA channel structure
  */
-static void zynqmp_dma_do_tasklet(struct tasklet_struct *t)
+static void zynqmp_dma_do_tasklet(struct dma_chan *c)
 {
-	struct zynqmp_dma_chan *chan = from_tasklet(chan, t, tasklet);
+	struct zynqmp_dma_chan *chan = container_of(c,
+			struct zynqmp_dma_chan, common);
 	u32 count;
 	unsigned long irqflags;
 
@@ -815,7 +814,7 @@ static void zynqmp_dma_synchronize(struct dma_chan *dchan)
 {
 	struct zynqmp_dma_chan *chan = to_chan(dchan);
 
-	tasklet_kill(&chan->tasklet);
+	dma_chan_kill_bh(&chan->common);
 }
 
 /**
@@ -887,7 +886,7 @@ static void zynqmp_dma_chan_remove(struct zynqmp_dma_chan *chan)
 
 	if (chan->irq)
 		devm_free_irq(chan->zdev->dev, chan->irq, chan);
-	tasklet_kill(&chan->tasklet);
+	dma_chan_kill_bh(&chan->common);
 	list_del(&chan->common.device_node);
 }
 
@@ -937,7 +936,7 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
 
 	chan->is_dmacoherent =  of_property_read_bool(node, "dma-coherent");
 	zdev->chan = chan;
-	tasklet_setup(&chan->tasklet, zynqmp_dma_do_tasklet);
+	dma_chan_init_bh(&chan->common, zynqmp_dma_do_tasklet);
 	spin_lock_init(&chan->lock);
 	INIT_LIST_HEAD(&chan->active_list);
 	INIT_LIST_HEAD(&chan->pending_list);
-- 
2.43.0


