Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74ABC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 03:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EsI+dpw6vMR742jYDR1gddCVyVHs7LTF48bPd8UEx9g=; b=yZ+dHQEO7xSRHTgHU7NTxDbIm5
	9+madM86VV9RkdIiMs1vybZGwb79LvUJuTdYmCQYqio0+hnAVqlf3JYOeoLvGuZ2g4SAA17REr29d
	n4hdJUYQ73155ovoZPCVbuRgopWLbcdhmX10KLv1wwXXB5rPdzUSYxRSyzbpSDgKe66Zed1hGssFq
	eStH8676xiHO4qKX2Ess4fmUGFdUGsmW0d68H/tmjIINa5tRW48DctIxsRQ7NfGuQ8KjUl1LSRjK0
	Qq0ZxPrV4Cyxg97Sjb4HkYfHDdtFFq30/CvJ20Ci3Ey3aDmSJCm1ym7hIZppuG89NgkYHNg7MQpGR
	hlj02TFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wwy-00000002Cco-3SFa;
	Mon, 14 Sep 2026 03:01:44 +0000
Received: from mail-oo2-x0f.google.com ([2607:f8b0:4864:31::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wwt-00000002CYs-2J2L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 03:01:41 +0000
Received: by mail-oo2-x0f.google.com with SMTP id 46e09a7af769-7f4f0d298caso274417a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 20:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354898; x=1789959698; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EsI+dpw6vMR742jYDR1gddCVyVHs7LTF48bPd8UEx9g=;
        b=pj7kdfHXvvm5lZFQYdCWYymqCqjSziQb1xGOlq8PBxdFyWgojJF7x8nU/u6bYBNdB2
         3E6w3i5Eqq9SyNoyQylE0QtCRbHOY6NsTqQaCuhv/agE75zNH0mUCXDEYCROm83mOpbn
         eedTi/gas1MPqa1p9Rh+r90/I+DhgZjzgF5CdM+YlPHYoxeXaSTM0K0ka6ExNXgJ+8S0
         JnHBJpSdJzogdjSNrhaXlQ1yUuZNhhgH0MWJNMjpmqlkGwBz0zE3X7lyHBV/XAcvl6YL
         zoRFxp6w+3CLYge7pZLGVFr+OTws2zRcL8Y1LEhkyEjJ+e8zQuSAHYBoMCk06TpVdHQI
         Sj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354898; x=1789959698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EsI+dpw6vMR742jYDR1gddCVyVHs7LTF48bPd8UEx9g=;
        b=fturU88qvaqFzGSitpqioSPRxf8VmfkSUfZSZ3hghlYs9HRc8lHKLVIg3d5gOfsR2l
         Zy+n0UAAtw+lGRiYwlbVg3Y8hM/yCWw+mpmzywfBVM6EyJv5uD//+lMxzwL1ZWTx7uxw
         UprkVcjBjCrVsWjskrSfNku4hYNFib7+kec+OJpLVGpJ7hzOIxYQcBylqm4nLLH/2ehy
         bqAw3GL2AcnrAzLdSMie8XPmfBI6759TweRxAL5Y6DmhTIzA99o3AuzVH7E9LK7maeke
         2ThPRs0PjgRmK3mx6OoqH7rTlQXLDmzh2fSsBV+rTy3MMZ3juwz6FZ5YdkvTTkHOD1UW
         /+gg==
X-Forwarded-Encrypted: i=1; AKwUvBz/Fap4eOHY8siQg+rKtHxdLZXmc2LBbzmp4VaHYr/ZodtkEprxX2LlTmlkIGfNoEURC/NE+KsLJG4t3T79Ez3F@lists.infradead.org
X-Gm-Message-State: AFuF++lAC9wC0clsPyo+2x5AdRDvO0ZBw7uk1DChXr+ci3XOLuqkUD3v
	LeGOHGQ7bhpdtlTVmrC/gagHE+yxxNaq5fGQcYL8nBFMHDitb1XmLqyK
X-Gm-Gg: AYBFou2f+hzejDEGT+NcFWi4qYA4nNNw/mMiWcWcpR/pV4U3Y4fpgL2GR2bpxSgUrI0
	KYuwypPZ7PJBD/4ftifmVvQ9cOagjzO5lsGgpIJJhlUqcFe0lSMjKKo/6Ib3jMD6HclSCOo02Fn
	1r+d7SMAMInWDI7ihBk67derWsg34XhXV/r93q+iANlEoVMrI3pWTVvXX5+QJgztGtgWQkUcb6O
	2xS3q1y5yxx9sz9W9y/0q6v9mjN5NAY3kZtCksTno1PdM4Cgn1/RM8Y2vMlWFrtnzqhZgwIh1UC
	10YKk+byaPu16GDP2g2A5cEedpgDmRg20z7iqoZ9C1ZvH60BuV0qmVpjE/GxIc+qol4FyBqfQMP
	K0BxlRYIKgHdjUOCtN+NdPVJ5Xdgoe70Y9HOnGZbzdz6WKp7u2vH2fZ6iHOWG2TjY8hcKpakRAQ
	MbPTc/FyLXnQnXp5uoLtEfxW3q0wS7F4pGT7GXV+VOsLiM81H8AXRRkOD70BBN1Hzz1E3XEwzWI
	Pz9PkU4rId1thcMfU8punNI6NHnX1S+Fn9gFnMdePhA1/UghJVCM758x9PqjvZx7kmDZ1z4zNVu
	WJtmw2cTeLyJId1L6S7Qog+D7PrYMqflqO0s/BxcHemzVzQk0DRVUF90Vv0Valx4mahHHdgn34D
	8BURPfJxIp0dZG3n0yyma4bjB9qeCKT0uK0xm/TS2
X-Received: by 2002:a05:6830:81fb:b0:7fb:547f:98bc with SMTP id 46e09a7af769-80897394cd9mr261168a34.5.1789354898430;
        Sun, 13 Sep 2026 20:01:38 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:07 -0600
Subject: [PATCH v5 01/18] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-1-7d711076a6f7@gmail.com>
References: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
In-Reply-To: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_200139_600864_006D02A4 
X-CRM114-Status: GOOD (  22.27  )
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

A timed-out wait can return while the interrupt handler is still using
the previous operation's interrupt status and enable mask. Starting the
next wait calls init_completion() on the same object, which can reset its
waitqueue lock while the old handler calls complete(). The old handler
can also complete the new wait or restore an obsolete interrupt mask.

Initialize the completion once in probe and use reinit_completion() for
each interrupt-driven wait. On timeout, disable and synchronize the IRQ
before masking controller interrupts and acknowledging the waited-for
events. Draining the handler first also prevents a partial-event handler
from rewriting the enable mask after it has been cleared. Flush these
register writes before re-enabling the IRQ line, leaving the controller's
interrupt sources masked.

For successful waits, move complete() after the handler's register updates
so that the next operation cannot race with those updates. Keep polling
unchanged and leave controller and DMA abort handling to the existing
callers.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f41feebe4257..e50cf5b6a730 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -374,6 +374,7 @@ struct sunxi_nfc_caps {
  * @chips: a list containing all the NAND chips attached to this NAND
  *	   controller
  * @complete: a completion object used to wait for NAND controller events
+ * @irq: NAND controller interrupt
  * @dmac: the DMA channel attached to the NAND controller
  * @use_mdma: use an internal MBUS DMA backend
  * @mdma_desc: H6-style MBUS DMA descriptor
@@ -393,6 +394,7 @@ struct sunxi_nfc {
 	unsigned long clk_rate;
 	struct list_head chips;
 	struct completion complete;
+	int irq;
 	struct dma_chan *dmac;
 	bool use_mdma;
 	struct sunxi_nfc_mdma_desc *mdma_desc;
@@ -414,12 +416,13 @@ static irqreturn_t sunxi_nfc_interrupt(int irq, void *dev_id)
 	if (!(ien & st))
 		return IRQ_NONE;
 
-	if ((ien & st) == ien)
-		complete(&nfc->complete);
-
+	/* Finish updating the interrupt state before waking the next operation. */
 	writel(st & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
 	writel(~st & ien & NFC_INT_MASK, nfc->regs + NFC_REG_INT);
 
+	if ((ien & st) == ien)
+		complete(&nfc->complete);
+
 	return IRQ_HANDLED;
 }
 
@@ -435,16 +438,19 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 		timeout_ms = NFC_DEFAULT_TIMEOUT_MS;
 
 	if (!use_polling) {
-		init_completion(&nfc->complete);
+		reinit_completion(&nfc->complete);
 
 		writel(events, nfc->regs + NFC_REG_INT);
 
 		ret = wait_for_completion_timeout(&nfc->complete,
 						msecs_to_jiffies(timeout_ms));
-		if (!ret)
+		if (!ret) {
+			/* Drain the handler before it can restore an old IRQ mask. */
+			disable_irq(nfc->irq);
 			ret = -ETIMEDOUT;
-		else
+		} else {
 			ret = 0;
+		}
 
 		writel(0, nfc->regs + NFC_REG_INT);
 	} else {
@@ -457,6 +463,12 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 
 	writel(events & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
 
+	if (!use_polling && ret) {
+		/* Flush the mask and acknowledgment before re-enabling the IRQ. */
+		readl(nfc->regs + NFC_REG_INT);
+		enable_irq(nfc->irq);
+	}
+
 	if (ret)
 		dev_err(nfc->dev, "wait interrupt timedout\n");
 
@@ -2617,6 +2629,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	nfc->dev = dev;
 	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
+	init_completion(&nfc->complete);
 
 	nfc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &r);
 	if (IS_ERR(nfc->regs))
@@ -2625,6 +2638,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
+	nfc->irq = irq;
 
 	nfc->caps = of_device_get_match_data(dev);
 	if (!nfc->caps)

-- 
2.53.0


